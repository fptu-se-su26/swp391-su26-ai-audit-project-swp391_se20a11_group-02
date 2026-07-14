package com.swp391.coding_platform.service.course;

import com.swp391.coding_platform.dto.request.CourseSearchRequest;
import com.swp391.coding_platform.dto.response.CourseDetailResponse;
import com.swp391.coding_platform.dto.response.CourseListItemResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.enums.CourseStatus;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.mapper.CourseMapper;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.course.EnrollmentRepository;
import com.swp391.coding_platform.repository.progress.CompletedLessonCountRepository;
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

        assertThrows(AppException.class, () -> courseService.getCourseDetail(1L, 1L));
    }
}
