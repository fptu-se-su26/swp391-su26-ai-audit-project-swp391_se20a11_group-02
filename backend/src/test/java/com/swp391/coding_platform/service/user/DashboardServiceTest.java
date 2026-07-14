package com.swp391.coding_platform.service.user;

import com.swp391.coding_platform.dto.response.DashboardStatsResponse;
import com.swp391.coding_platform.entity.payment.WalletEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.repository.course.EnrollmentRepository;
import com.swp391.coding_platform.repository.course.LessonRepository;
import com.swp391.coding_platform.repository.payment.WalletRepository;
import com.swp391.coding_platform.repository.progress.CompletedLessonCountRepository;
import com.swp391.coding_platform.repository.user.UserDailyActivityRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import com.swp391.coding_platform.mapper.CourseMapper;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.when;
import static org.mockito.Mockito.any;

@ExtendWith(MockitoExtension.class)
class DashboardServiceTest {

    @Mock
    private EnrollmentRepository enrollmentRepository;

    @Mock
    private WalletRepository walletRepository;

    @Mock
    private UserRepository userRepository;

    @Mock
    private CompletedLessonCountRepository completedLessonCountRepository;

    @Mock
    private UserDailyActivityRepository activityRepository;

    @Mock
    private CourseMapper courseMapper;

    @Mock
    private ProblemSubmissionRepository problemSubmissionRepository;

    @Mock
    private LessonRepository lessonRepository;

    @InjectMocks
    private DashboardService dashboardService;

    @Test
    void getDashboardStats_HappyPath() {
        Integer userId = 1;
        when(enrollmentRepository.countByUserId(userId)).thenReturn(5L);
        when(enrollmentRepository.countByUserIdAndStatus(anyInt(), any())).thenReturn(2L);
        when(userRepository.countSolvedPracticeProblemsByUserId(userId)).thenReturn(10L);
        when(userRepository.countTotalPracticeProblems()).thenReturn(50L);
        
        WalletEntity wallet = new WalletEntity();
        wallet.setBalance(new BigDecimal("150.00"));
        when(walletRepository.findByUserId(userId)).thenReturn(Optional.of(wallet));
        
        when(userRepository.getUserRanking(userId)).thenReturn(5);
        when(userRepository.count()).thenReturn(100L);

        DashboardStatsResponse response = dashboardService.getDashboardStats(userId);

        assertNotNull(response);
        assertEquals(5L, response.getEnrolled());
        assertEquals(2L, response.getCompletedCourses());
        assertEquals(10L, response.getSolvedPractice());
        assertEquals(50L, response.getTotalPracticeProblems());
        assertEquals(new BigDecimal("150.00"), response.getCurrentBalance());
        assertEquals(5L, response.getRanking());
        assertEquals(100L, response.getTotalUsers());
    }

    @Test
    void getDashboardStats_ExceptionThrown() {
        Integer userId = 1;
        when(enrollmentRepository.countByUserId(userId)).thenThrow(new RuntimeException("Database error"));

        assertThrows(RuntimeException.class, () -> dashboardService.getDashboardStats(userId));
    }
}
