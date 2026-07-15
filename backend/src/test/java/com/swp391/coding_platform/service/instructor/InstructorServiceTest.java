package com.swp391.coding_platform.service.instructor;

import com.swp391.coding_platform.dto.response.AdminInstructorResponse;
import com.swp391.coding_platform.dto.response.InstructorRevenueSummary;
import com.swp391.coding_platform.entity.instructor.InstructorEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.course.EnrollmentRepository;
import com.swp391.coding_platform.repository.instructor.InstructorRepository;
import com.swp391.coding_platform.repository.payment.OrderItemRepository;
import com.swp391.coding_platform.repository.payment.PayoutRequestRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class InstructorServiceTest {

    @Mock
    private InstructorRepository instructorRepository;

    @Mock
    private CourseRepository courseRepository;

    @Mock
    private OrderItemRepository orderItemRepository;

    @Mock
    private EnrollmentRepository enrollmentRepository;

    @Mock
    private PayoutRequestRepository payoutRequestRepository;

    @InjectMocks
    private InstructorService instructorService;

    @Test
    void getRevenueSummary_ShouldReturnSummary() {
        Integer userId = 1;
        InstructorEntity instructor = new InstructorEntity();
        instructor.setId(1);
        instructor.setStatus(com.swp391.coding_platform.entity.enums.InstructorStatus.ACTIVE);

        when(instructorRepository.findByUserId(userId)).thenReturn(Optional.of(instructor));
        when(orderItemRepository.findCompletedItemsByInstructorId(1)).thenReturn(Collections.emptyList());

        InstructorRevenueSummary summary = instructorService.getRevenueSummary(userId, "all", null, null);

        assertNotNull(summary);
        assertEquals(BigDecimal.ZERO, summary.getTotalGrossRevenue());
    }

    @Test
    void getRevenueSummary_InstructorSuspended_ShouldThrowException() {
        Integer userId = 1;
        InstructorEntity instructor = new InstructorEntity();
        instructor.setId(1);
        instructor.setStatus(com.swp391.coding_platform.entity.enums.InstructorStatus.SUSPENDED);

        when(instructorRepository.findByUserId(userId)).thenReturn(Optional.of(instructor));

        AppException ex = assertThrows(AppException.class, () -> {
            instructorService.getRevenueSummary(userId, "all", null, null);
        });
        assertEquals(ErrorCode.ACCESS_DENIED, ex.getErrorCode());
    }

    @Test
    void getRevenueSummary_InstructorNotFound_ShouldThrowException() {
        Integer userId = 999;
        when(instructorRepository.findByUserId(userId)).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> {
            instructorService.getRevenueSummary(userId, "all", null, null);
        });
        assertEquals(ErrorCode.RESOURCE_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void getAllInstructorsForAdmin_ShouldReturnList() {
        InstructorEntity inst = new InstructorEntity();
        inst.setId(1);
        UserEntity user = new UserEntity();
        user.setId(10);
        inst.setUser(user);
        inst.setStatus(com.swp391.coding_platform.entity.enums.InstructorStatus.ACTIVE);

        when(instructorRepository.findAll()).thenReturn(List.of(inst));
        when(courseRepository.findByInstructorId(1)).thenReturn(Collections.emptyList());

        List<AdminInstructorResponse> responses = instructorService.getAllInstructorsForAdmin();

        assertEquals(1, responses.size());
        assertEquals(10, responses.get(0).getUserId());
    }

    @Test
    void updateInstructorStatus_ShouldUpdateAndReturn() {
        Integer instId = 1;
        InstructorEntity inst = new InstructorEntity();
        inst.setId(instId);
        inst.setStatus(com.swp391.coding_platform.entity.enums.InstructorStatus.ACTIVE);

        when(instructorRepository.findById(instId)).thenReturn(Optional.of(inst));
        when(instructorRepository.save(any(InstructorEntity.class))).thenReturn(inst);
        when(courseRepository.findByInstructorId(instId)).thenReturn(Collections.emptyList());

        AdminInstructorResponse response = instructorService.updateInstructorStatus(instId, "SUSPENDED");

        assertEquals("SUSPENDED", response.getStatus());
        verify(instructorRepository).save(inst);
    }

    @Test
    void updateInstructorStatus_InstructorNotFound_ShouldThrowException() {
        Integer instId = 999;
        when(instructorRepository.findById(instId)).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> {
            instructorService.updateInstructorStatus(instId, "SUSPENDED");
        });
        assertEquals(ErrorCode.RESOURCE_NOT_FOUND, ex.getErrorCode());
    }
}
