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
@RequiredArgsConstructor
@Slf4j
public class AiModerationClient {

    private final WebClient aiWebClient;
    private final ObjectMapper objectMapper;

    @Value("${ai.gemini-api-key:}")
    private String geminiApiKey;

    // 1. Chuyển đổi giọng nói thành văn bản (Sử dụng OpenAI Whisper API - dự phòng)
    public String transcribeAudio(File audioFile) {
        try {
            log.info("Bắt đầu gửi audio Whisper transcription cho file: {}", audioFile.getName());
            // Gọi Gemini để mô tả nội dung audio thông qua file path (fallback khi không có Whisper key)
            // Khi có OpenAI API key, tích hợp trực tiếp ở đây.
            // Hiện tại trả về signal rõ ràng để AI biết bài học có video nhưng chưa được transcribe.
            log.warn("Whisper API chưa được cấu hình - bỏ qua transcript video cho file: {}", audioFile.getName());
            return "[VIDEO_PRESENT_BUT_TRANSCRIPT_UNAVAILABLE]";
        } catch (Throwable t) {
            return fallbackWhisper(audioFile, t);
        }
    }

    // 2. Phân tích nội dung khóa học bằng Google Gemini API (Đầu ra JSON)
    public ModerationResult evaluateContent(String metadataText, String docsText, String quizText, String videoTranscripts) {
        try {
            log.info("Gửi nội dung khóa học lên Google Gemini API để kiểm duyệt...");
            
            if (geminiApiKey == null || geminiApiKey.trim().isEmpty()) {
                throw new IllegalStateException("GEMINI_API_KEY chưa được khai báo trong cấu hình hệ thống.");
            }

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

            // Gọi API Gemini 1.5 Pro để phân tích logic sâu sắc
            String uri = String.format("/v1beta/models/gemini-1.5-pro:generateContent?key=%s", geminiApiKey);
            
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
