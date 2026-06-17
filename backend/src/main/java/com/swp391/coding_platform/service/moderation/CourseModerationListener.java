package com.swp391.coding_platform.service.moderation;

import com.swp391.coding_platform.configuration.ModerationQueueConfig;
import com.swp391.coding_platform.dto.moderation.ModerationResult;
import com.swp391.coding_platform.entity.course.*;
import com.swp391.coding_platform.entity.enums.CourseStatus;
import com.swp391.coding_platform.repository.course.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class CourseModerationListener {

    private final CourseRepository courseRepository;
    private final ChapterRepository chapterRepository;
    private final CourseModerationReportRepository reportRepository;
    
    private final CourseContentExtractorService contentExtractor;
    private final AudioProcessingService audioService;
    private final AiModerationClient aiClient;
    private final CourseDuplicateDetectorService duplicateDetector;

    @RabbitListener(queues = ModerationQueueConfig.MODERATION_QUEUE)
    @Transactional
    public void processCourseModeration(Long courseId) {
        log.info("Bắt đầu xử lý tin nhắn RabbitMQ kiểm duyệt cho khóa học ID: {}", courseId);

        CourseEntity course = courseRepository.findById(courseId).orElse(null);
        if (course == null) {
            log.error("Không tìm thấy khóa học với ID: {}. Bỏ qua tin nhắn.", courseId);
            return;
        }

        // Tạo sẵn thực thể Report lưu vết
        CourseModerationReportEntity report = reportRepository.findByCourseId(courseId)
                .orElse(CourseModerationReportEntity.builder().courseId(courseId).build());

        try {
            // Bước 1: Trích xuất metadata học thuật và Quiz
            String metadata = contentExtractor.extractMetadata(course);
            String quizText = contentExtractor.extractQuizContent(courseId);
            StringBuilder docTextCollector = new StringBuilder();
            StringBuilder transcriptCollector = new StringBuilder();

            // KIỂM TRA ĐẠO VĂN / TRÙNG LẶP SỬ DỤNG EMBEDDINGS
            CourseDuplicateDetectorService.DuplicationCheckResult dupResult = duplicateDetector.checkDuplication(courseId, metadata);
            if (dupResult.isDuplicate()) {
                log.warn("Phát hiện đạo văn/trùng lặp khóa học ID: {} với khóa học ID: {}", courseId, dupResult.getMatchedCourseId());
                course.setStatus(CourseStatus.PENDING);
                courseRepository.save(course);

                report.setQualityScore(0.00);
                report.setRiskScore(1.00); // Vi phạm bản quyền/trùng lặp
                report.setConfidenceScore(dupResult.getSimilarityScore());
                report.setNeedsAdminReview(true);
                report.setFlaggedCategories(List.of("DUPLICATE_COURSE_DETECTED"));
                report.setReasons(String.format("Tự động phát hiện trùng lặp/đạo văn với khóa học ID: %d (Độ tương đồng %.2f%%).", 
                        dupResult.getMatchedCourseId(), dupResult.getSimilarityScore() * 100));
                reportRepository.save(report);
                return;
            }

            // Bước 2: Duyệt qua các bài giảng để tách tài liệu lý thuyết và audio video
            List<ChapterEntity> chapters = chapterRepository.findByCourseIdOrderByOrderIndexAsc(courseId);
            for (ChapterEntity chapter : chapters) {
                if (chapter.getLessons() == null) continue;
                for (LessonEntity lesson : chapter.getLessons()) {
                    // Trích xuất lý thuyết dạng text
                    if (lesson.getTheoryContent() != null && !lesson.getTheoryContent().trim().isEmpty()) {
                        docTextCollector.append("Lesson ").append(lesson.getTitle())
                                       .append(" Theory:\n").append(lesson.getTheoryContent()).append("\n\n");
                    }

                    // Tách âm thanh & Dịch video (Whisper) nếu bài học có Video Url
                    if (lesson.getVideoUrl() != null && lesson.getVideoUrl().startsWith("http")) {
                        String tempAudioPath = System.getProperty("java.io.tmpdir") + File.separator + 
                                               "course_" + courseId + "_lesson_" + lesson.getId() + ".mp3";
                        File audioFile = null;
                        try {
                            // Chạy FFmpeg tách âm thanh
                            audioFile = audioService.extractAudioFromVideo(lesson.getVideoUrl(), tempAudioPath);
                            
                            // Gọi Whisper dịch
                            String lessonTranscript = aiClient.transcribeAudio(audioFile);
                            transcriptCollector.append("Lesson ").append(lesson.getTitle()).append(" Video Transcript:\n")
                                               .append(lessonTranscript).append("\n\n");
                        } catch (Exception videoEx) {
                            log.error("Gặp lỗi khi dịch âm thanh bài học: {}", lesson.getTitle(), videoEx);
                            report.setErrorLog((report.getErrorLog() != null ? report.getErrorLog() + "\n" : "") + 
                                               "Lỗi video bài " + lesson.getTitle() + ": " + videoEx.getMessage());
                        } finally {
                            // Dọn dẹp tệp âm thanh tạm ở local
                            if (audioFile != null && audioFile.exists()) {
                                Files.deleteIfExists(Paths.get(audioFile.getAbsolutePath()));
                            }
                        }
                    }
                }
            }

            // Bước 3: Gửi toàn bộ nội dung tổng hợp lên Gemini API để thẩm định và cho điểm số
            ModerationResult aiResult = aiClient.evaluateContent(
                metadata, 
                docTextCollector.toString(), 
                quizText, 
                transcriptCollector.toString()
            );

            // Bước 4: Áp dụng Ma Trận Luật Duyệt (Decision Matrix)
            CourseStatus finalStatus = CourseStatus.PENDING;
            boolean needsAdminReview = true;

            // Luật 1: Rủi ro thấp (< 0.15) + Chất lượng tốt (>= 0.75) + Độ tự tin cao (>= 0.80) -> Auto APPROVED
            if (aiResult.getRiskScore() < 0.15 && aiResult.getQualityScore() >= 0.75 && aiResult.getConfidenceScore() >= 0.80) {
                finalStatus = CourseStatus.APPROVED;
                needsAdminReview = false;
            }
            // Luật 2: Rủi ro quá cao (>= 0.60) + Độ tự tin AI cao (>= 0.80) -> Auto REJECTED
            else if (aiResult.getRiskScore() >= 0.60 && aiResult.getConfidenceScore() >= 0.80) {
                finalStatus = CourseStatus.REJECTED;
                needsAdminReview = false;
            }
            // Mọi trường hợp còn lại: Chờ Admin thẩm định
            else {
                finalStatus = CourseStatus.PENDING;
                needsAdminReview = true;
            }

            // Cập nhật trạng thái thực tế của khóa học
            course.setStatus(finalStatus);
            courseRepository.save(course);

            // Cập nhật thực thể báo cáo kiểm duyệt
            report.setQualityScore(aiResult.getQualityScore());
            report.setRiskScore(aiResult.getRiskScore());
            report.setConfidenceScore(aiResult.getConfidenceScore());
            report.setNeedsAdminReview(needsAdminReview);
            report.setFlaggedCategories(aiResult.getFlaggedCategories() != null ? aiResult.getFlaggedCategories() : new ArrayList<>());
            report.setReasons(aiResult.getReasons());
            reportRepository.save(report);

            // Tự động lưu vector embedding để đối chiếu trùng lặp cho các khóa học nộp sau
            duplicateDetector.saveCourseEmbedding(courseId, metadata);

            log.info("Hoàn thành kiểm duyệt AI khóa học ID: {}. Trạng thái cập nhật: {}, Cờ duyệt admin: {}", 
                     courseId, finalStatus, needsAdminReview);

        } catch (Exception e) {
            log.error("Lỗi nghiêm trọng khi chạy Moderation Pipeline cho khóa học ID: {}", courseId, e);
            
            // Thiết lập chế độ Fail-Safe: Chuyển sang chờ duyệt thủ công và ghi nhận lỗi
            course.setStatus(CourseStatus.PENDING);
            courseRepository.save(course);

            report.setQualityScore(0.50);
            report.setRiskScore(0.50);
            report.setConfidenceScore(0.00);
            report.setNeedsAdminReview(true);
            report.setReasons("Hệ thống kiểm duyệt gặp lỗi bất ngờ: " + e.getMessage());
            report.setErrorLog((report.getErrorLog() != null ? report.getErrorLog() + "\n" : "") + e.getMessage());
            reportRepository.save(report);
        }
    }
}
