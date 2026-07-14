package com.swp391.coding_platform.service.moderation;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.moderation.CourseModerationPayload;
import com.swp391.coding_platform.dto.moderation.ModerationResult;
import com.swp391.coding_platform.entity.course.ChapterEntity;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.course.CourseModerationReportEntity;
import com.swp391.coding_platform.entity.enums.CourseStatus;
import com.swp391.coding_platform.repository.course.ChapterRepository;
import com.swp391.coding_platform.repository.course.CourseModerationReportRepository;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.course.LessonRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class CourseModerationServiceTest {

    @Mock
    private CourseRepository courseRepository;

    @Mock
    private ChapterRepository chapterRepository;

    @Mock
    private LessonRepository lessonRepository;

    @Mock
    private CourseModerationReportRepository reportRepository;

    @Mock
    private VideoTranscriptionService videoTranscriptionService;

    @Mock
    private AiEvaluationService aiEvaluationService;

    @Mock
    private ObjectMapper objectMapper;

    @InjectMocks
    private CourseModerationService moderationService;

    @Test
    void processFullCourse_CourseNotFound_ShouldDoNothing() {
        when(courseRepository.findById(1L)).thenReturn(Optional.empty());

        moderationService.processFullCourse(1L);

        verify(reportRepository, never()).findByCourseId(any());
    }

    @Test
    void processFullCourse_EmptyChapters_ShouldPassAI() throws Exception {
        CourseEntity course = new CourseEntity();
        course.setId(1L);
        course.setTitle("Title");

        CourseModerationReportEntity report = new CourseModerationReportEntity();

        when(courseRepository.findById(1L)).thenReturn(Optional.of(course));
        when(reportRepository.findByCourseId(1L)).thenReturn(Optional.of(report));
        when(chapterRepository.findByCourseIdOrderByOrderIndexAsc(1L)).thenReturn(Collections.emptyList());

        ModerationResult result = ModerationResult.builder().isClean(true).build();
        when(aiEvaluationService.evaluateCourse(any(CourseModerationPayload.class))).thenReturn(result);
        when(objectMapper.writeValueAsString(any())).thenReturn("{}");

        moderationService.processFullCourse(1L);

        assertEquals(CourseStatus.PENDING_ADMIN, course.getStatus());
        assertEquals("PASSED_AI_WAITING_ADMIN", report.getStatus());
        verify(courseRepository).save(course);
        verify(reportRepository).save(report);
    }
}
