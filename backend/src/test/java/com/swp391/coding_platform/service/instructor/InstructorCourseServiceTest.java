package com.swp391.coding_platform.service.instructor;

import com.swp391.coding_platform.dto.request.InstructorCourseCreateRequest;
import com.swp391.coding_platform.dto.response.InstructorCourseDetailResponse;
import com.swp391.coding_platform.dto.response.InstructorCourseResponse;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.enums.CourseStatus;
import com.swp391.coding_platform.entity.instructor.InstructorEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.mapper.CourseMapper;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.instructor.InstructorRepository;
import com.swp391.coding_platform.repository.category.CategoryRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.amqp.rabbit.core.RabbitTemplate;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.Collections;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class InstructorCourseServiceTest {

    @Mock
    private InstructorRepository instructorRepository;

    @Mock
    private CourseRepository courseRepository;

    @Mock
    private CategoryRepository categoryRepository;

    @Mock
    private RabbitTemplate rabbitTemplate;

    @Mock
    private CourseMapper courseMapper;

    @InjectMocks
    private InstructorCourseService instructorCourseService;

    @Test
    void getCourseDetail_ShouldReturnDetail() {
        InstructorEntity instructor = new InstructorEntity();
        instructor.setId(1);
        instructor.setStatus(com.swp391.coding_platform.entity.enums.InstructorStatus.ACTIVE);

        CourseEntity course = new CourseEntity();
        course.setId(10L);

        when(instructorRepository.findByUserId(1)).thenReturn(Optional.of(instructor));
        when(courseRepository.findByIdAndInstructorId(10L, 1)).thenReturn(Optional.of(course));

        InstructorCourseDetailResponse response = new InstructorCourseDetailResponse();
        response.setId(10L);
        when(courseMapper.toInstructorCourseDetailResponse(course)).thenReturn(response);

        InstructorCourseDetailResponse res = instructorCourseService.getCourseDetail(1, 10L);

        assertNotNull(res);
        assertEquals(10L, res.getId());
    }

    @Test
    void createCourse_ShouldSaveAndReturn() {
        InstructorEntity instructor = new InstructorEntity();
        instructor.setId(1);
        instructor.setStatus(com.swp391.coding_platform.entity.enums.InstructorStatus.ACTIVE);

        when(instructorRepository.findByUserId(1)).thenReturn(Optional.of(instructor));
        
        CourseEntity savedCourse = new CourseEntity();
        savedCourse.setId(10L);
        savedCourse.setTitle("New Course");
        savedCourse.setPrice(BigDecimal.ZERO);
        savedCourse.setType("FREE");

        when(courseRepository.save(any())).thenReturn(savedCourse);

        InstructorCourseCreateRequest req = new InstructorCourseCreateRequest();
        req.setTitle("New Course");
        req.setIsFree(true);

        InstructorCourseResponse res = instructorCourseService.createCourse(1, req);

        assertNotNull(res);
        assertEquals("10", res.getId());
        assertEquals("New Course", res.getTitle());
    }

    @Test
    void submitCourseForReview_ShouldUpdateStatusAndSendToRabbit() {
        InstructorEntity instructor = new InstructorEntity();
        instructor.setId(1);
        instructor.setStatus(com.swp391.coding_platform.entity.enums.InstructorStatus.ACTIVE);

        CourseEntity course = new CourseEntity();
        course.setId(10L);
        course.setStatus(CourseStatus.DRAFTS);

        when(instructorRepository.findByUserId(1)).thenReturn(Optional.of(instructor));
        when(courseRepository.findByIdAndInstructorId(10L, 1)).thenReturn(Optional.of(course));

        instructorCourseService.submitCourseForReview(1, 10L);

        assertEquals(CourseStatus.PENDING_AI, course.getStatus());
        verify(courseRepository).save(course);
        verify(rabbitTemplate, atLeastOnce()).convertAndSend(anyString(), anyString(), any(Object.class));
    }
}
