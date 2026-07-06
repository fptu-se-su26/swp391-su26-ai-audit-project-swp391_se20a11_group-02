package com.swp391.coding_platform.service.ai;

import com.swp391.coding_platform.dto.request.ai.AiVisualizerRequest;
import com.swp391.coding_platform.dto.response.ai.AiVisualizerResponse;
import com.swp391.coding_platform.entity.enums.ProblemScope;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.problem.ProblemVisualizerCache;
import com.swp391.coding_platform.exception.ai.AiGenerationException;
import com.swp391.coding_platform.exception.ai.RateLimitExceededException;
import com.swp391.coding_platform.repository.problem.ProblemRepository;
import com.swp391.coding_platform.repository.problem.ProblemVisualizerCacheRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.model.ChatResponse;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDate;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Slf4j
@RequiredArgsConstructor
public class AiVisualizerService {

    private final ChatClient aiVisualizerChatClient;
    private final PromptSanitizerService sanitizerService;
    private final ProblemVisualizerCacheRepository cacheRepository;
    private final ProblemRepository problemRepository;
    
    // In-memory rate limiting: {userId_date -> count}
    private final ConcurrentHashMap<String, AtomicInteger> userRateLimits = new ConcurrentHashMap<>();
    private static final int MAX_REQUESTS_PER_DAY = 5;
    private static final int CURRENT_PROMPT_VERSION = 1;

    // To switch from this manual DB cache to Spring @Cacheable (Redis/Caffeine):
    // 1. Uncomment @Cacheable("ai_visualizer") on a public helper method.
    // 2. Ensure Redis is configured in application.yml.
    // We use manual DB check here to easily manipulate the `fromCache` flag.
    public void validateProblemScope(String problemIdStr) {
        try {
            Integer probId = Integer.parseInt(problemIdStr);
            ProblemEntity problem = problemRepository.findById(probId).orElse(null);
            if (problem != null && problem.getProblemScope() == ProblemScope.CONTEST) {
                throw new AiGenerationException("Tính năng Gia sư AI không được phép sử dụng trong kỳ thi (Contest).");
            }
        } catch (NumberFormatException e) {
            // Ignore if invalid
        }
    }

    public Optional<AiVisualizerResponse> getCachedVisualizer(String problemId, boolean forceRegenerate) {
        if (!forceRegenerate) {
            Optional<ProblemVisualizerCache> cached = cacheRepository.findByProblemIdAndPromptVersion(problemId, CURRENT_PROMPT_VERSION);
            if (cached.isPresent()) {
                log.info("Cache hit for problemId: {}", problemId);
                return Optional.of(buildResponseFromCache(cached.get()));
            }
        }
        return Optional.empty();
    }

    public AiVisualizerResponse generateVisualizer(AiVisualizerRequest request, String userId) {
        String problemId = request.getProblemId();
        
        // 1. Check DB Cache first
        Optional<AiVisualizerResponse> cached = getCachedVisualizer(problemId, request.isForceRegenerate());
        if (cached.isPresent()) {
            return cached.get();
        }

        // 2. Check Rate Limit
        checkRateLimit(userId);

        // 3. Prepare prompt
        String userPrompt = buildUserPrompt(request);

        // 4. Call AI & Parse with Retry
        AiVisualizerResponse response = callAiAndParse(userPrompt);

        // 5. Save to DB Cache
        saveToCache(problemId, response);

        return response;
    }

    private void checkRateLimit(String userId) {
        String key = userId + "_" + LocalDate.now().toString();
        userRateLimits.putIfAbsent(key, new AtomicInteger(0));
        int count = userRateLimits.get(key).incrementAndGet();
        if (count > MAX_REQUESTS_PER_DAY) {
            log.warn("User {} exceeded rate limit", userId);
            throw new RateLimitExceededException("Bạn đã vượt quá số lần tạo mô phỏng trong ngày (" + MAX_REQUESTS_PER_DAY + " lần). Vui lòng thử lại vào ngày mai.");
        }
    }

    @Retryable(retryFor = {AiGenerationException.class}, maxAttempts = 2, backoff = @Backoff(delay = 2000))
    public AiVisualizerResponse callAiAndParse(String userPrompt) {
        log.info("Calling AI ChatClient to generate visualizer...");
        
        ChatResponse chatResponse = aiVisualizerChatClient.prompt()
                .user(userPrompt)
                .call()
                .chatResponse();
                
        String rawContent = chatResponse.getResult().getOutput().getContent();
        
        return parseAndValidate(rawContent);
    }

    private AiVisualizerResponse parseAndValidate(String rawContent) {
        String algo = extractWithDelimiter(rawContent, "###ALGORITHM_START###", "###ALGORITHM_END###");
        String complexity = extractWithDelimiter(rawContent, "###COMPLEXITY_START###", "###COMPLEXITY_END###");
        String html = extractWithDelimiter(rawContent, "###HTML_START###", "###HTML_END###");

        if (algo.isEmpty() || complexity.isEmpty() || html.isEmpty()) {
            throw new AiGenerationException("AI trả về kết quả thiếu định dạng delimiter.");
        }

        // Validate HTML content
        html = html.trim();
        if (html.startsWith("```html")) {
            html = html.substring(7);
        }
        if (html.endsWith("```")) {
            html = html.substring(0, html.length() - 3);
        }
        html = html.trim();

        if (!html.toLowerCase().startsWith("<!doctype html>")) {
            throw new AiGenerationException("Mã nguồn không bắt đầu bằng DOCTYPE html.");
        }
        if (!html.toLowerCase().contains("</html>") || !html.toLowerCase().contains("<script>")) {
            throw new AiGenerationException("Mã nguồn bị cắt cụt, thiếu </html> hoặc thẻ script.");
        }
        if (html.toLowerCase().contains("<iframe")) {
            throw new AiGenerationException("Mã nguồn chứa iframe độc hại.");
        }

        return AiVisualizerResponse.builder()
                .detectedAlgorithm(algo.trim())
                .timeComplexity(complexity.trim())
                .htmlContent(html)
                .fromCache(false)
                .build();
    }

    private String extractWithDelimiter(String content, String start, String end) {
        Pattern pattern = Pattern.compile(start + "(.*?)" + end, Pattern.DOTALL);
        Matcher matcher = pattern.matcher(content);
        if (matcher.find()) {
            return matcher.group(1);
        }
        return "";
    }

    private String buildUserPrompt(AiVisualizerRequest request) {
        String safeDesc = sanitizerService.sanitizeAndTruncate(request.getDescription());
        return String.format(
            "Tên bài toán: %s\\n" +
            "Mô tả: %s\\n" +
            "Ràng buộc: %s\\n" +
            "Input mẫu: %s\\n" +
            "Output mẫu: %s\\n" +
            "Gợi ý: %s",
            request.getTitle(), safeDesc, request.getConstraints(), 
            request.getExampleInput(), request.getExampleOutput(), 
            request.getHint() != null ? request.getHint() : "Không có"
        );
    }

    private void saveToCache(String problemId, AiVisualizerResponse response) {
        if (problemId == null || problemId.isEmpty()) return;
        ProblemVisualizerCache cacheEntity = ProblemVisualizerCache.builder()
                .problemId(problemId)
                .detectedAlgorithm(response.getDetectedAlgorithm())
                .timeComplexity(response.getTimeComplexity())
                .htmlContent(response.getHtmlContent())
                .generatedAt(Instant.now())
                .promptVersion(CURRENT_PROMPT_VERSION)
                .build();
        cacheRepository.save(cacheEntity);
    }

    private AiVisualizerResponse buildResponseFromCache(ProblemVisualizerCache cache) {
        return AiVisualizerResponse.builder()
                .detectedAlgorithm(cache.getDetectedAlgorithm())
                .timeComplexity(cache.getTimeComplexity())
                .htmlContent(cache.getHtmlContent())
                .fromCache(true)
                .build();
    }
}
