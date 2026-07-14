package com.swp391.coding_platform.service.admin;

import com.swp391.coding_platform.dto.response.AdminDashboardStatsResponse;
import com.swp391.coding_platform.entity.enums.UserStatus;
import com.swp391.coding_platform.repository.category.CategoryRepository;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.instructor.InstructorRepository;
import com.swp391.coding_platform.repository.payment.OrderRepository;
import com.swp391.coding_platform.repository.payment.WalletTransactionRepository;
import com.swp391.coding_platform.repository.problem.ProblemRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AdminDashboardServiceTest {

    @Mock
    private UserRepository userRepository;
    @Mock
    private ContestRepository contestRepository;
    @Mock
    private CourseRepository courseRepository;
    @Mock
    private InstructorRepository instructorRepository;
    @Mock
    private ProblemRepository problemRepository;
    @Mock
    private OrderRepository orderRepository;
    @Mock
    private WalletTransactionRepository walletTransactionRepository;
    @Mock
    private CategoryRepository categoryRepository;
    @Mock
    private ProblemSubmissionRepository problemSubmissionRepository;

    @InjectMocks
    private AdminDashboardService adminDashboardService;

    @Test
    void getDashboardStats_Success() {
        when(userRepository.countByStatus(UserStatus.ACTIVE)).thenReturn(100L);
        when(contestRepository.countActiveContests(any())).thenReturn(5L);
        when(courseRepository.count()).thenReturn(50L);
        when(instructorRepository.count()).thenReturn(20L);
        when(problemRepository.count()).thenReturn(200L);
        
        when(orderRepository.findAllByStatus(any())).thenReturn(Collections.emptyList());
        when(userRepository.findAllByCreatedAtAfter(any())).thenReturn(Collections.emptyList());
        when(categoryRepository.findCategoryEnrollmentCounts()).thenReturn(Collections.emptyList());
        when(courseRepository.findTopCoursesDynamic(any())).thenReturn(Collections.emptyList());
        when(courseRepository.findTopInstructors(any())).thenReturn(Collections.emptyList());
        when(problemSubmissionRepository.findTopProblems(any())).thenReturn(Collections.emptyList());

        AdminDashboardStatsResponse response = adminDashboardService.getDashboardStats();

        assertNotNull(response);
        assertEquals(100L, response.getActiveUsers());
        assertEquals(5L, response.getActiveContests());
        assertEquals(50L, response.getTotalCourses());
        assertEquals(20L, response.getTotalInstructors());
        assertEquals(200L, response.getTotalProblems());
        assertEquals(0L, response.getTotalRevenue());
    }
}
