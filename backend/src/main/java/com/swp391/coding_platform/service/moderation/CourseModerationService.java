package com.swp391.coding_platform.service.moderation;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.moderation.CourseModerationPayload;
import com.swp391.coding_platform.dto.moderation.ModerationResult;
import com.swp391.coding_platform.entity.course.ChapterEntity;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.course.CourseModerationReportEntity;
import com.swp391.coding_platform.entity.course.LessonEntity;
import com.swp391.coding_platform.entity.enums.CourseStatus;
import com.swp391.coding_platform.entity.enums.LessonStatus;
import com.swp391.coding_platform.repository.course.ChapterRepository;
import com.swp391.coding_platform.repository.course.CourseModerationReportRepository;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.course.LessonRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class CourseModerationService {

    private final CourseRepository courseRepository;
    private final ChapterRepository chapterRepository;
    private final LessonRepository lessonRepository;
    private final CourseModerationReportRepository reportRepository;
    private final VideoTranscriptionService videoTranscriptionService;
    private final AiEvaluationService aiEvaluationService;
    private final ObjectMapper objectMapper;

    @Transactional
    public void processFullCourse(Long courseId) {
        log.info("Bắt đầu duyệt toàn bộ khóa học ID: {}", courseId);
        CourseEntity course = courseRepository.findById(courseId).orElse(null);
        if (course == null) return;

        CourseModerationReportEntity report = reportRepository.findByCourseId(courseId)
                .orElse(CourseModerationReportEntity.builder().courseId(courseId).build());

        try {
            List<ChapterEntity> chapters = chapterRepository.findByCourseIdOrderByOrderIndexAsc(courseId);
            int totalLessons = 0;
            int lessonsWithVideo = 0;
            int lessonsWithQuiz = 0;

            CourseModerationPayload payload = new CourseModerationPayload();
            payload.setCourseTitle(course.getTitle());
            payload.setDescription(course.getLongDescription());
            List<CourseModerationPayload.ChapterPayload> chapterPayloads = new ArrayList<>();
            List<CompletableFuture<Void>> transcriptionFutures = new ArrayList<>();

            for (ChapterEntity chapter : chapters) {
                if (chapter.getLessons() == null || chapter.getLessons().isEmpty()) continue;

                CourseModerationPayload.ChapterPayload chapterPayload = new CourseModerationPayload.ChapterPayload();
                chapterPayload.setChapterTitle(chapter.getTitle());
                List<CourseModerationPayload.LessonPayload> lessonPayloads = new ArrayList<>();

                for (LessonEntity lesson : chapter.getLessons()) {
                    totalLessons++;
                    boolean hasVideo = lesson.getVideoUrl() != null && lesson.getVideoUrl().startsWith("http");
                    boolean hasQuiz = lesson.getQuizzes() != null && !lesson.getQuizzes().isEmpty();
                    
                    if (hasVideo) lessonsWithVideo++;
                    if (hasQuiz) lessonsWithQuiz++;

                    CourseModerationPayload.LessonPayload lessonPayload = new CourseModerationPayload.LessonPayload();
                    lessonPayload.setLessonId(lesson.getId() != null ? lesson.getId().longValue() : null);
                    lessonPayload.setLessonTitle(lesson.getTitle());
                    lessonPayload.setTheoryText(lesson.getTheoryContent());
                    
                    List<CourseModerationPayload.QuizPayload> quizPayloads = new ArrayList<>();
                    if (hasQuiz) {
                        lesson.getQuizzes().forEach(quiz -> {
                            if (quiz.getQuestions() != null) {
                                quiz.getQuestions().forEach(question -> {
                                    CourseModerationPayload.QuizPayload qp = new CourseModerationPayload.QuizPayload();
                                    qp.setTitle(quiz.getTitle());
                                    qp.setQuestion(question.getContent());
                                    List<String> options = new ArrayList<>();
                                    if (question.getOptions() != null) {
                                        question.getOptions().forEach(opt -> options.add(opt.getContent()));
                                    }
                                    qp.setOptions(options);
                                    quizPayloads.add(qp);
                                });
                            }
                        });
                    }
                    lessonPayload.setQuizzes(quizPayloads);

                    // Xử lý đa luồng cho video
                    if (hasVideo) {
                        CompletableFuture<Void> future = videoTranscriptionService.transcribeVideoAsync(courseId, lesson.getId() != null ? lesson.getId().longValue() : null, lesson.getVideoUrl())
                                .thenAccept(transcript -> lessonPayload.setVideoTranscript(transcript));
                        transcriptionFutures.add(future);
                    } else {
                        lessonPayload.setVideoTranscript("");
                    }

                    lessonPayloads.add(lessonPayload);
                }
                chapterPayload.setLessons(lessonPayloads);
                chapterPayloads.add(chapterPayload);
            }
            payload.setChapters(chapterPayloads);

            // 1. Pre-check: Tính toán tỷ lệ 50% video và 50% quiz
            if (totalLessons > 0) {
                double videoRatio = (double) lessonsWithVideo / totalLessons;
                double quizRatio = (double) lessonsWithQuiz / totalLessons;
                List<String> precheckViolations = new ArrayList<>();
                if (videoRatio < 0.5) {
                    precheckViolations.add("Khóa học chỉ có " + String.format("%.0f", videoRatio * 100) + "% video. Không đạt chuẩn tối thiểu 50%.");
                }
                if (quizRatio < 0.5) {
                    precheckViolations.add("Khóa học chỉ có " + String.format("%.0f", quizRatio * 100) + "% quiz. Không đạt chuẩn tối thiểu 50%.");
                }

                if (!precheckViolations.isEmpty()) {
                    rejectCourse(course, report, precheckViolations, Collections.emptyList());
                    return;
                }
            }

            // 2. Chờ tất cả luồng dịch video hoàn thành
            CompletableFuture.allOf(transcriptionFutures.toArray(new CompletableFuture[0])).join();

            // Lấy toàn bộ text audio gom lại lưu vào course.textAudio để kiểm tra
            StringBuilder allTextAudio = new StringBuilder();
            for (CourseModerationPayload.ChapterPayload cp : payload.getChapters()) {
                for (CourseModerationPayload.LessonPayload lp : cp.getLessons()) {
                    if (lp.getVideoTranscript() != null && !lp.getVideoTranscript().isBlank()) {
                        allTextAudio.append("--- Bài học: ").append(lp.getLessonTitle()).append(" ---\n")
                                .append(lp.getVideoTranscript()).append("\n\n");
                    }
                }
            }
            course.setTextAudio(allTextAudio.toString());

            // 3. Gửi payload lên AI
            ModerationResult result = aiEvaluationService.evaluateCourse(payload);

            // 4. Cập nhật kết quả
            if (Boolean.TRUE.equals(result.getIsClean())) {
                course.setStatus(CourseStatus.PENDING_ADMIN); // WAITING_FOR_ADMIN (trong DB map là PENDING_ADMIN)
                report.setStatus("PASSED_AI_WAITING_ADMIN");
            } else {
                course.setStatus(CourseStatus.REJECTED);
                report.setStatus("REJECTED_BY_AI");
            }

            report.setReportJson(objectMapper.writeValueAsString(result));
            courseRepository.save(course);
            reportRepository.save(report);

        } catch (Exception e) {
            log.error("Lỗi Moderation", e);
            rejectCourse(course, report, Collections.singletonList("Hệ thống lỗi: " + e.getMessage()), Collections.emptyList());
        }
    }

    @Transactional
    public void processSingleLessonUpdate(Long lessonId) {
        log.info("Bắt đầu duyệt cập nhật bài học ID: {}", lessonId);
        LessonEntity lesson = lessonRepository.findById(lessonId.intValue()).orElse(null);
        if (lesson == null) return;

        CourseEntity course = lesson.getChapter().getCourse();
        CourseModerationReportEntity report = reportRepository.findByCourseId(course.getId())
                .orElse(CourseModerationReportEntity.builder().courseId(course.getId()).build());

        try {
            CourseModerationPayload.LessonPayload lessonPayload = new CourseModerationPayload.LessonPayload();
            lessonPayload.setLessonId(lesson.getId() != null ? lesson.getId().longValue() : null);
            lessonPayload.setLessonTitle(lesson.getTitle());
            lessonPayload.setTheoryText(lesson.getTheoryContent());

            List<CourseModerationPayload.QuizPayload> quizPayloads = new ArrayList<>();
            if (lesson.getQuizzes() != null && !lesson.getQuizzes().isEmpty()) {
                lesson.getQuizzes().forEach(quiz -> {
                    if (quiz.getQuestions() != null) {
                        quiz.getQuestions().forEach(question -> {
                            CourseModerationPayload.QuizPayload qp = new CourseModerationPayload.QuizPayload();
                            qp.setTitle(quiz.getTitle());
                            qp.setQuestion(question.getContent());
                            List<String> options = new ArrayList<>();
                            if (question.getOptions() != null) {
                                question.getOptions().forEach(opt -> options.add(opt.getContent()));
                            }
                            qp.setOptions(options);
                            quizPayloads.add(qp);
                        });
                    }
                });
            }
            lessonPayload.setQuizzes(quizPayloads);

            if (lesson.getVideoUrl() != null && lesson.getVideoUrl().startsWith("http")) {
                String transcript = videoTranscriptionService.transcribeVideoAsync(course.getId(), lesson.getId() != null ? lesson.getId().longValue() : null, lesson.getVideoUrl()).join();
                lessonPayload.setVideoTranscript(transcript);
            }

            ModerationResult result = aiEvaluationService.evaluateSingleLesson(lessonPayload);

            if (Boolean.TRUE.equals(result.getIsClean())) {
                lesson.setStatus(LessonStatus.ACTIVE);
            } else {
                lesson.setStatus(LessonStatus.INACTIVE); // Ẩn khỏi học viên
            }
            lessonRepository.save(lesson);
            
            // Note: Đối với update single lesson, ta có thể nối thêm lỗi vào report JSON hiện tại nếu muốn,
            // hoặc tạo cơ chế log riêng. Để đơn giản, chỉ cập nhật trạng thái Lesson.

        } catch (Exception e) {
            log.error("Lỗi duyệt bài học lẻ", e);
            lesson.setStatus(LessonStatus.INACTIVE);
            lessonRepository.save(lesson);
        }
    }

    private void rejectCourse(CourseEntity course, CourseModerationReportEntity report, List<String> courseViolations, List<ModerationResult.LessonViolation> lessonViolations) {
        course.setStatus(CourseStatus.REJECTED);
        report.setStatus("REJECTED_PRECHECK");
        ModerationResult result = ModerationResult.builder()
                .isClean(false)
                .courseViolations(courseViolations)
                .lessonViolations(lessonViolations)
                .build();
        try {
            report.setReportJson(objectMapper.writeValueAsString(result));
        } catch (Exception ignored) {}
        courseRepository.save(course);
        reportRepository.save(report);
    }
}
