package com.swp391.coding_platform.service.user;

import com.swp391.coding_platform.dto.response.DashboardStatsResponse;
import com.swp391.coding_platform.entity.enums.EnrollmentStatus;
import com.swp391.coding_platform.entity.payment.WalletEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.course.EnrollmentRepository;
import com.swp391.coding_platform.repository.payment.WalletRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

@Service
@RequiredArgsConstructor
@Slf4j
public class DashboardService {

    private final EnrollmentRepository enrollmentRepository;
    private final WalletRepository walletRepository;
    private final UserRepository userRepository;

    public DashboardStatsResponse getDashboardStats(Long userId) {

        // 1. Enrolled query
        CompletableFuture<Long> enrolledFuture = CompletableFuture.supplyAsync(() -> 
            enrollmentRepository.countByUserId(userId)
        );

        // 2. Completed Courses query
        CompletableFuture<Long> completedCoursesFuture = CompletableFuture.supplyAsync(() -> 
            enrollmentRepository.countByUserIdAndStatus(userId, EnrollmentStatus.COMPLETED)
        );

        // 3. Solved Practice query
        CompletableFuture<Long> solvedPracticeFuture = CompletableFuture.supplyAsync(() -> {
            Long count = userRepository.countSolvedPracticeProblemsByUserId(userId);
            return count != null ? count : 0L;
        });

        // 4. Total Practice query
        CompletableFuture<Long> totalPracticeFuture = CompletableFuture.supplyAsync(() -> {
            Long count = userRepository.countTotalPracticeProblems();
            return count != null ? count : 0L;
        });

        // 5. Balance query
        CompletableFuture<BigDecimal> balanceFuture = CompletableFuture.supplyAsync(() -> 
            walletRepository.findByUserId(userId)
                .map(WalletEntity::getBalance)
                .orElse(BigDecimal.ZERO)
        );

        // 6. Ranking query
        CompletableFuture<Long> rankingFuture = CompletableFuture.supplyAsync(() -> {
            Long rank = userRepository.getUserRanking(userId);
            return rank != null ? rank : 0L;
        });

        // 7. Total Users query
        CompletableFuture<Long> totalUsersFuture = CompletableFuture.supplyAsync(() -> {
            Long count = userRepository.count();
            return count != null ? count : 0L;
        });

        try {
            // Wait for all concurrent DB queries to finish
            CompletableFuture.allOf(
                enrolledFuture, completedCoursesFuture, solvedPracticeFuture, totalPracticeFuture, 
                balanceFuture, rankingFuture, totalUsersFuture
            ).join();

            // Build the response
            return DashboardStatsResponse.builder()
                    .enrolled(enrolledFuture.get())
                    .completedCourses(completedCoursesFuture.get())
                    .solvedPractice(solvedPracticeFuture.get())
                    .totalPracticeProblems(totalPracticeFuture.get())
                    .currentBalance(balanceFuture.get())
                    .ranking(rankingFuture.get())
                    .totalUsers(totalUsersFuture.get())
                    .build();

        } catch (InterruptedException | ExecutionException e) {
            log.error("Error occurred while fetching dashboard stats for user: {}", userId, e);
            throw new AppException(ErrorCode.DASHBOARD_STATS_FETCH_FAILED);
        }
    }
}
