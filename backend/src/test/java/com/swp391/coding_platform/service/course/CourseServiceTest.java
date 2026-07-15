package com.swp391.coding_platform.service.course;

import com.swp391.coding_platform.dto.request.CourseReviewRequest;
import com.swp391.coding_platform.dto.request.CourseSearchRequest;
import com.swp391.coding_platform.dto.response.CourseDetailResponse;
import com.swp391.coding_platform.dto.response.CourseListItemResponse;
import com.swp391.coding_platform.dto.response.CurriculumChapterResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.entity.course.ChapterEntity;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.course.LessonEntity;
import com.swp391.coding_platform.entity.course.EnrollmentEntity;
import com.swp391.coding_platform.entity.enums.CourseStatus;
import com.swp391.coding_platform.entity.enums.EnrollmentStatus;
import com.swp391.coding_platform.entity.instructor.InstructorEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.mapper.CourseMapper;
import com.swp391.coding_platform.repository.course.ChapterRepository;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.course.CourseReviewRepository;
import com.swp391.coding_platform.repository.course.LessonRepository;
import com.swp391.coding_platform.repository.course.EnrollmentRepository;
import com.swp391.coding_platform.repository.progress.CompletedLessonCountRepository;
import com.swp391.coding_platform.repository.progress.LessonProgressRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class CourseServiceTest {

    @Mock
    private CourseRepository courseRepository;
    @Mock
    private CourseMapper courseMapper;
    @Mock
    private CompletedLessonCountRepository completedLessonCountRepository;
    @Mock
    private EnrollmentRepository enrollmentRepository;
    @Mock
    private ChapterRepository chapterRepository;
    @Mock
    private UserRepository userRepository;
    @Mock
    private CourseReviewRepository courseReviewRepository;
    @Mock
    private LessonRepository lessonRepository;
    @Mock
    private LessonProgressRepository lessonProgressRepository;

    @InjectMocks
    private CourseService courseService;

    @Test
    void getCourseList_ShouldReturnPageResponse() {
        CourseEntity course = new CourseEntity();
        course.setId(1L);
        course.setStatus(CourseStatus.APPROVED);

        Page<CourseEntity> page = new PageImpl<>(List.of(course));
        when(courseRepository.findAll(any(Specification.class), any(Pageable.class))).thenReturn(page);

        CourseListItemResponse itemRes = new CourseListItemResponse();
        itemRes.setId(1L);
        when(courseMapper.toCourseListItemResponse(course)).thenReturn(itemRes);
        
        when(enrollmentRepository.findEnrolledCourseIdsByUserIdAndCourseIds(eq(1), anyList(), anyList()))
                .thenReturn(Collections.emptySet());

        PageResponse<CourseListItemResponse> result = courseService.getCourseList(1L, new CourseSearchRequest(), Pageable.unpaged());

        assertNotNull(result);
        assertEquals(1, result.getContent().size());
        assertEquals(1L, result.getContent().get(0).getId());
    }

    @Test
    void getCourseDetail_CourseNotFound_ShouldThrowException() {
        when(courseRepository.findById(1L)).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> courseService.getCourseDetail(1L, 1L));
        assertEquals(ErrorCode.COURSE_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void getCourseDetail_CourseNotApprovedAndNotOwnerOrAdmin_ShouldThrowException() {
        UserEntity user = UserEntity.builder().id(99).username("another").build();
        InstructorEntity instructor = InstructorEntity.builder().user(user).build();

        CourseEntity course = CourseEntity.builder()
                .id(1L)
                .status(CourseStatus.DRAFTS)
                .instructor(instructor)
                .build();

        when(courseRepository.findById(1L)).thenReturn(Optional.of(course));

        AppException ex = assertThrows(AppException.class, () -> courseService.getCourseDetail(1L, 1L));
        assertEquals(ErrorCode.COURSE_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void getCourseCurriculum_CourseNotFound_ShouldThrowException() {
        when(courseRepository.findById(1L)).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> courseService.getCourseCurriculum(1L, 1L));
        assertEquals(ErrorCode.COURSE_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void getCourseCurriculum_CourseNotApproved_ShouldThrowException() {
        UserEntity user = UserEntity.builder().id(99).username("another").build();
        InstructorEntity instructor = InstructorEntity.builder().user(user).build();

        CourseEntity course = CourseEntity.builder()
                .id(1L)
                .status(CourseStatus.DRAFTS)
                .instructor(instructor)
                .build();

        when(courseRepository.findById(1L)).thenReturn(Optional.of(course));

        AppException ex = assertThrows(AppException.class, () -> courseService.getCourseCurriculum(1L, 1L));
        assertEquals(ErrorCode.COURSE_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void upsertCourseReview_NotEnrolled_ThrowsException() {
        // Mock enrollment checks as false
        when(enrollmentRepository.existsByUserIdAndCourseIdAndStatusIn(anyLong(), anyLong(), anyList()))
                .thenReturn(false);

        CourseReviewRequest request = new CourseReviewRequest(5, "Nice");

        AppException ex = assertThrows(AppException.class, () -> courseService.upsertCourseReview(1L, 1L, request));
        assertEquals(ErrorCode.NOT_ENROLLED, ex.getErrorCode());
    }

    @Test
    void upsertCourseReview_CourseNotFound_ThrowsException() {
        when(enrollmentRepository.existsByUserIdAndCourseIdAndStatusIn(anyLong(), anyLong(), anyList()))
                .thenReturn(true);
        when(courseRepository.findById(1L)).thenReturn(Optional.empty());

        CourseReviewRequest request = new CourseReviewRequest(5, "Nice");

        AppException ex = assertThrows(AppException.class, () -> courseService.upsertCourseReview(1L, 1L, request));
        assertEquals(ErrorCode.COURSE_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void upsertCourseReview_UserNotFound_ThrowsException() {
        CourseEntity course = CourseEntity.builder().id(1L).build();

        when(enrollmentRepository.existsByUserIdAndCourseIdAndStatusIn(anyLong(), anyLong(), anyList()))
                .thenReturn(true);
        when(courseRepository.findById(1L)).thenReturn(Optional.of(course));
        when(userRepository.findById(1)).thenReturn(Optional.empty());

        CourseReviewRequest request = new CourseReviewRequest(5, "Nice");

        AppException ex = assertThrows(AppException.class, () -> courseService.upsertCourseReview(1L, 1L, request));
        assertEquals(ErrorCode.USER_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void completeLesson_CourseNotFound_ThrowsException() {
        when(courseRepository.findById(1L)).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> courseService.completeLesson(1L, 1L, 10));
        assertEquals(ErrorCode.COURSE_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void completeLesson_LessonNotFound_ThrowsException() {
        CourseEntity course = CourseEntity.builder().id(1L).build();
        when(courseRepository.findById(1L)).thenReturn(Optional.of(course));
        when(lessonRepository.findById(10)).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> courseService.completeLesson(1L, 1L, 10));
        assertEquals(ErrorCode.LESSON_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void completeLesson_LessonMismatch_ThrowsException() {
        CourseEntity course = CourseEntity.builder().id(1L).build();
        CourseEntity otherCourse = CourseEntity.builder().id(2L).build();
        ChapterEntity chapter = ChapterEntity.builder().course(otherCourse).build();
        LessonEntity lesson = LessonEntity.builder().id(10).chapter(chapter).build();

        when(courseRepository.findById(1L)).thenReturn(Optional.of(course));
        when(lessonRepository.findById(10)).thenReturn(Optional.of(lesson));

        AppException ex = assertThrows(AppException.class, () -> courseService.completeLesson(1L, 1L, 10));
        assertEquals(ErrorCode.INVALID_REQUEST, ex.getErrorCode());
    }

    @Test
    void completeLesson_NotEnrolled_ThrowsException() {
        CourseEntity course = CourseEntity.builder().id(1L).build();
        ChapterEntity chapter = ChapterEntity.builder().course(course).build();
        LessonEntity lesson = LessonEntity.builder().id(10).chapter(chapter).build();

        when(courseRepository.findById(1L)).thenReturn(Optional.of(course));
        when(lessonRepository.findById(10)).thenReturn(Optional.of(lesson));
        when(enrollmentRepository.findEnrollmentWithLock(1, 1L)).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> courseService.completeLesson(1L, 1L, 10));
        assertEquals(ErrorCode.NOT_ENROLLED, ex.getErrorCode());
    }
}
