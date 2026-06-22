package com.swp391.coding_platform.service.moderation;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.moderation.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import java.io.File;
import java.util.Collections;
import java.util.List;

@Service
@Slf4j
public class AiModerationClient {

    private final WebClient aiWebClient;
    private final ObjectMapper objectMapper;

    public AiModerationClient(
            @org.springframework.beans.factory.annotation.Qualifier("aiWebClient") WebClient aiWebClient,
            ObjectMapper objectMapper
    ) {
        this.aiWebClient = aiWebClient;
        this.objectMapper = objectMapper;
    }

    @Value("${ai.gemini-api-key:}")
    private String geminiApiKey;

    @Value("${ai.gemini-model:gemini-2.5-flash}")
    private String geminiModel;

    @Value("${ai.openai-api-key:}")
    private String openAiApiKey;

    // 1. Chuyển đổi giọng nói thành văn bản (Sử dụng OpenAI Whisper API - dự phòng tự động sang Gemini)
    public String transcribeAudio(File audioFile) {
        if (openAiApiKey != null && !openAiApiKey.trim().isEmpty() && !openAiApiKey.contains("Fi29AEA6WUr9B")) {
            try {
                log.info("Bắt đầu gửi audio Whisper transcription cho file: {}", audioFile.getName());
                
                org.springframework.util.MultiValueMap<String, Object> body = new org.springframework.util.LinkedMultiValueMap<>();
                body.add("file", new org.springframework.core.io.FileSystemResource(audioFile));
                body.add("model", "whisper-1");
                body.add("language", "vi");

                String jsonResponse = WebClient.create("https://api.openai.com")
                        .post()
                        .uri("/v1/audio/transcriptions")
                        .header("Authorization", "Bearer " + openAiApiKey.trim())
                        .contentType(org.springframework.http.MediaType.MULTIPART_FORM_DATA)
                        .bodyValue(body)
                        .retrieve()
                        .bodyToMono(String.class)
                        .block();

                if (jsonResponse != null) {
                    java.util.Map<String, Object> map = objectMapper.readValue(jsonResponse, java.util.Map.class);
                    if (map.containsKey("text")) {
                        String transcript = (String) map.get("text");
                        log.info("Dịch thành công âm thanh bằng Whisper. Số ký tự: {}", transcript.length());
                        return transcript;
                    }
                }
            } catch (Throwable t) {
                log.warn("Gọi OpenAI Whisper thất bại (có thể hết hạn mức/0$): {}. Tự động chuyển hướng sang dịch miễn phí bằng Gemini...", t.getMessage());
            }
        } else {
            log.info("Whisper API chưa được cấu hình hoặc key chưa nạp tiền. Tự động chuyển hướng dịch bằng Gemini...");
        }

        return transcribeAudioWithGemini(audioFile);
    }

    // Dịch âm thanh bằng Gemini 2.5 Flash (Hoàn toàn miễn phí)
    private String transcribeAudioWithGemini(File audioFile) {
        try {
            log.info("Bắt đầu gọi Gemini API (Miễn phí) để dịch âm thanh cho file: {}", audioFile.getName());
            
            byte[] fileContent = java.nio.file.Files.readAllBytes(audioFile.toPath());
            String base64Data = java.util.Base64.getEncoder().encodeToString(fileContent);
            
            // Tạo request body cho Gemini
            GeminiRequest requestBody = GeminiRequest.builder()
                    .contents(Collections.singletonList(
                        GeminiRequest.Content.builder()
                            .role("user")
                            .parts(java.util.Arrays.asList(
                                GeminiRequest.Part.builder()
                                    .inlineData(GeminiRequest.InlineData.builder()
                                            .mimeType("audio/mp3")
                                            .data(base64Data)
                                            .build())
                                    .build(),
                                GeminiRequest.Part.builder()
                                    .text("Bạn là chuyên gia chuyển giọng nói thành văn bản. Hãy dịch toàn bộ nội dung âm thanh này sang văn bản tiếng Việt chính xác. Không giải thích thêm, không thêm thắt bình luận, chỉ trả về nội dung đã nói trong âm thanh.")
                                    .build()
                            ))
                            .build()
                    ))
                    .build();

            if (geminiApiKey == null || geminiApiKey.trim().isEmpty()) {
                throw new IllegalStateException("GEMINI_API_KEY chưa được khai báo trong hệ thống.");
            }

            String trimmedKey = geminiApiKey.trim();
            String uri = String.format("/v1beta/models/%s:generateContent?key=%s", "gemini-2.5-flash", trimmedKey);

            GeminiResponse response = aiWebClient.post()
                    .uri(uri)
                    .bodyValue(requestBody)
                    .retrieve()
                    .bodyToMono(GeminiResponse.class)
                    .block();

            if (response != null && response.getCandidates() != null && !response.getCandidates().isEmpty()) {
                String text = response.getCandidates().get(0).getContent().getParts().get(0).getText();
                if (text != null && !text.trim().isEmpty()) {
                    log.info("Dịch thành công âm thanh bằng Gemini. Số ký tự: {}", text.length());
                    return text;
                }
            }
            throw new RuntimeException("Gemini trả về văn bản rỗng.");
        } catch (Throwable t) {
            log.error("Dịch âm thanh bằng Gemini thất bại: {}", t.getMessage());
            return "[VIDEO_PRESENT_BUT_TRANSCRIPT_UNAVAILABLE]";
        }
    }

    // 2. Phân tích nội dung khóa học bằng Google Gemini API (Đầu ra JSON)
    public ModerationResult evaluateContent(String metadataText, String docsText, String quizText, String videoTranscripts) {
        try {
            log.info("Gửi nội dung khóa học lên Google Gemini API để kiểm duyệt...");
            
            if (geminiApiKey == null || geminiApiKey.trim().isEmpty()) {
                throw new IllegalStateException("GEMINI_API_KEY chưa được khai báo trong cấu hình hệ thống.");
            }

            String trimmedKey = geminiApiKey.trim();
            log.info("Gemini API Key loaded: length={}, startsWith={}, endsWith={}", 
                trimmedKey.length(), 
                trimmedKey.substring(0, Math.min(trimmedKey.length(), 10)),
                trimmedKey.substring(Math.max(0, trimmedKey.length() - 5)));

            // Định nghĩa System Prompt và cấu trúc dữ liệu cho Gemini
            String systemPrompt = "Bạn là Chuyên gia Kiểm định Chất lượng Giáo dục. Bạn được giao nhiệm vụ duyệt khóa học.\n" +
                    "Hãy phân tích: Metadata (Tiêu đề, Mô tả), tài liệu đi kèm (Docs), bộ câu hỏi (Quiz), và bản ghi âm video bài giảng (Transcripts).\n" +
                    "Lưu ý: Nếu transcript chứa [VIDEO_PRESENT_BUT_TRANSCRIPT_UNAVAILABLE], hãy đánh giá dựa trên các nội dung khác và đặt confidence thấp hơn.\n" +
                    "Đánh giá và phản hồi kết quả kiểm duyệt dạng JSON khớp chính xác với cấu trúc Java DTO sau:\n" +
                    "{\n" +
                    "  \"qualityScore\": float (0.00 -> 1.00 - Điểm chất lượng sư phạm),\n" +
                    "  \"riskScore\": float (0.00 -> 1.00 - Điểm rủi ro vi phạm chính sách),\n" +
                    "  \"confidenceScore\": float (0.00 -> 1.00 - Điểm tin cậy của AI),\n" +
                    "  \"flaggedCategories\": [\"danh mục vi phạm (violence, adult_content, hate_speech, disintermediation)\"],\n" +
                    "  \"reasons\": \"chuỗi lý do phân tích bằng tiếng Việt\",\n" +
                    "  \"recommendedAction\": \"APPROVE\" hoặc \"REJECT\" hoặc \"REVIEW\"\n" +
                    "}";

            String userContent = String.format(
                "--- METADATA ---\n%s\n\n--- DOCS ---\n%s\n\n--- QUIZ ---\n%s\n\n--- VIDEO TRANSCRIPT ---\n%s",
                metadataText, docsText, quizText, videoTranscripts
            );

            // Tạo request body khớp định dạng REST API của Google Gemini
            GeminiRequest requestBody = GeminiRequest.builder()
                    .contents(Collections.singletonList(
                        GeminiRequest.Content.builder()
                            .role("user")
                            .parts(Collections.singletonList(
                                GeminiRequest.Part.builder()
                                    .text(systemPrompt + "\n\nNội dung cần duyệt:\n" + userContent)
                                    .build()
                            ))
                            .build()
                    ))
                    .generationConfig(GeminiRequest.GenerationConfig.builder()
                            .responseMimeType("application/json") // Bắt buộc Gemini trả về JSON string
                            .build())
                    .build();

            String modelToUse = geminiModel != null ? geminiModel.trim() : "gemini-2.5-flash";
            if (modelToUse.contains("1.5")) {
                log.warn("Cảnh báo: Phát hiện cấu hình mô hình Gemini 1.5 cũ: '{}' (không khả dụng). Tự động fallback về 'gemini-2.5-flash'. Vui lòng kiểm tra lại biến môi trường GEMINI_MODEL của bạn.", modelToUse);
                modelToUse = "gemini-2.5-flash";
            }

            // Gọi API Gemini để phân tích logic sâu sắc
            String uri = String.format("/v1beta/models/%s:generateContent?key=%s", modelToUse, trimmedKey);
            
            GeminiResponse response = aiWebClient.post()
                    .uri(uri)
                    .bodyValue(requestBody)
                    .retrieve()
                    .bodyToMono(GeminiResponse.class)
                    .block();

            if (response != null && response.getCandidates() != null && !response.getCandidates().isEmpty()) {
                String jsonText = response.getCandidates().get(0).getContent().getParts().get(0).getText();
                try {
                    // Parse chuỗi JSON văn bản sang Java DTO Object
                    return objectMapper.readValue(jsonText, ModerationResult.class);
                } catch (Exception e) {
                    log.error("Lỗi khi parse JSON trả về từ Gemini: {}", jsonText, e);
                    throw new RuntimeException("Lỗi định dạng phản hồi JSON của AI: " + e.getMessage());
                }
            }

            throw new RuntimeException("Gemini API trả về kết quả rỗng.");
        } catch (Throwable t) {
            return fallbackGemini(metadataText, docsText, quizText, videoTranscripts, t);
        }
    }

    // Fallback cho Whisper
    public String fallbackWhisper(File audioFile, Throwable t) {
        log.warn("Whisper API gặp sự cố, sử dụng bản dịch mẫu rỗng: {}", t.getMessage());
        return "[KHÔNG THỂ DỊCH ÂM THANH - VUI LÒNG DUYỆT THỦ CÔNG]";
    }

    // Fallback cho Gemini
    public ModerationResult fallbackGemini(String metadataText, String docsText, String quizText, String videoTranscripts, Throwable t) {
        log.error("Gemini API gặp sự cố do lỗi: {}", t.getMessage());
        return ModerationResult.builder()
                .qualityScore(0.50)
                .riskScore(0.50)
                .confidenceScore(0.00) // Tin cậy bằng 0% ép buộc chuyển Admin duyệt
                .flaggedCategories(Collections.singletonList("SYSTEM_ERROR"))
                .reasons("Lỗi kết nối AI Moderation: " + t.getMessage())
                .recommendedAction("REVIEW")
                .build();
    }
}
