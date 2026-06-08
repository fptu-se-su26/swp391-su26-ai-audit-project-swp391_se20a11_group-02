package com.swp391.coding_platform.service.instructor;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
@FieldDefaults(level = AccessLevel.PRIVATE)
public class GeminiService {

    @Value("${gemini.api-key:}")
    String apiKey;

    final WebClient webClient = WebClient.builder().build();
    final ObjectMapper objectMapper = new ObjectMapper();

    public static class EvaluationResult {
        public int score;
        public String summary;

        public EvaluationResult(int score, String summary) {
            this.score = score;
            this.summary = summary;
        }
    }

    public EvaluationResult evaluateCv(String cvText, String introduction) {
        if (apiKey == null || apiKey.trim().isEmpty()) {
            log.warn("Gemini API Key is not configured. Falling back to rule-based keyword matcher.");
            return evaluateCvFallback(cvText, introduction, "Không có Gemini API Key.");
        }

        try {
            String prompt = "Bạn là một chuyên gia tuyển dụng và kiểm định chất lượng giảng viên lập trình (AI Auditor).\n" +
                    "Hãy đánh giá nội dung CV sau đây để ứng cử làm giảng viên lập trình của hệ thống.\n" +
                    "Hãy đánh giá khách quan dựa trên:\n" +
                    "1. Kiến thức chuyên môn về lập trình (ngôn ngữ Java, Python, C++, React, Web, Database, v.v.).\n" +
                    "2. Kinh nghiệm thực tế hoặc kinh nghiệm giảng dạy/hướng dẫn.\n" +
                    "3. Độ rõ ràng và trình bày của CV.\n\n" +
                    "Trả về một chuỗi JSON hợp lệ chứa chính xác hai trường:\n" +
                    "- \"score\": một số nguyên từ 0 đến 100 thể hiện mức độ phù hợp.\n" +
                    "- \"summary\": bản tóm tắt thế mạnh, điểm yếu của ứng viên và lý do chấm điểm bằng tiếng Việt (tối đa 3 câu).\n\n" +
                    "Nội dung CV cần đánh giá:\n" +
                    cvText + "\n\n" +
                    "Lời giới thiệu của ứng viên:\n" +
                    introduction;

            // Prepare Gemini Request Body
            Map<String, Object> part = new HashMap<>();
            part.put("text", prompt);

            Map<String, Object> content = new HashMap<>();
            content.put("parts", new Object[]{part});

            Map<String, Object> genConfig = new HashMap<>();
            genConfig.put("responseMimeType", "application/json");

            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("contents", new Object[]{content});
            requestBody.put("generationConfig", genConfig);

            String url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" + apiKey;

            String responseStr = webClient.post()
                    .uri(url)
                    .header("Content-Type", "application/json")
                    .bodyValue(requestBody)
                    .retrieve()
                    .bodyToMono(String.class)
                    .block();

            JsonNode root = objectMapper.readTree(responseStr);
            String aiTextJson = root.path("candidates")
                    .path(0)
                    .path("content")
                    .path("parts")
                    .path(0)
                    .path("text")
                    .asText();

            JsonNode aiJson = objectMapper.readTree(aiTextJson.trim());
            int score = aiJson.path("score").asInt(50);
            String summary = aiJson.path("summary").asText("Không có tóm tắt đánh giá từ AI.");

            return new EvaluationResult(score, summary);

        } catch (Exception e) {
            log.error("Error calling Gemini API for CV evaluation: {}", e.getMessage(), e);
            return evaluateCvFallback(cvText, introduction, "Lỗi kết nối Gemini API: " + e.getMessage());
        }
    }

    private EvaluationResult evaluateCvFallback(String cvText, String introduction, String note) {
        String combined = (cvText + " " + introduction).toLowerCase();
        int score = 40; // Base score
        StringBuilder detectedSkills = new StringBuilder();

        // Rule-based keyword matching
        if (combined.contains("java")) { score += 10; detectedSkills.append("Java, "); }
        if (combined.contains("spring") || combined.contains("springboot")) { score += 10; detectedSkills.append("Spring Boot, "); }
        if (combined.contains("react") || combined.contains("nextjs") || combined.contains("next.js")) { score += 10; detectedSkills.append("React/Next.js, "); }
        if (combined.contains("python") || combined.contains("django") || combined.contains("fastapi")) { score += 10; detectedSkills.append("Python, "); }
        if (combined.contains("c++") || combined.contains("cpp")) { score += 10; detectedSkills.append("C++, "); }
        if (combined.contains("database") || combined.contains("sql") || combined.contains("postgres") || combined.contains("mysql")) { score += 5; detectedSkills.append("Database, "); }
        if (combined.contains("docker") || combined.contains("kubernetes") || combined.contains("devops")) { score += 5; detectedSkills.append("DevOps, "); }
        if (combined.contains("teaching") || combined.contains("giảng dạy") || combined.contains("sư phạm") || combined.contains("tutor") || combined.contains("dạy")) { score += 15; detectedSkills.append("Giảng dạy, "); }
        if (combined.contains("senior") || combined.contains("lead") || combined.contains("experienced") || combined.contains("kinh nghiệm")) { score += 10; detectedSkills.append("Kinh nghiệm thực tế, "); }

        if (score > 100) score = 100;

        String skillsStr = detectedSkills.length() > 2 ? detectedSkills.substring(0, detectedSkills.length() - 2) : "Không tìm thấy kỹ năng công nghệ tiêu chuẩn";

        String summary = String.format("Hồ sơ được quét tự động bằng từ khóa chuyên ngành (%s). Phát hiện kỹ năng: %s. Kỹ năng giảng dạy và thâm niên được ưu tiên tính điểm.",
                note, skillsStr);

        return new EvaluationResult(score, summary);
    }
}
