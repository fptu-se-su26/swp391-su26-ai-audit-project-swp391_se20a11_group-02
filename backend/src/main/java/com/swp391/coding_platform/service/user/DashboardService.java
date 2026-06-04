package com.swp391.coding_platform.service.user;

import com.swp391.coding_platform.dto.response.CourseListItemResponse;
import com.swp391.coding_platform.dto.response.DashboardStatsResponse;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.enums.EnrollmentStatus;
import com.swp391.coding_platform.entity.payment.WalletEntity;
import com.swp391.coding_platform.entity.progress.CompletedLessonsCountEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.mapper.CourseMapper;
import com.swp391.coding_platform.repository.course.EnrollmentRepository;
import com.swp391.coding_platform.repository.payment.WalletRepository;
import com.swp391.coding_platform.repository.progress.CompletedLessonCountRepository;
import com.swp391.coding_platform.repository.user.UserDailyActivityRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import com.swp391.coding_platform.dto.response.UserActivityResponse;
import com.swp391.coding_platform.util.ProgressUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionEntity;
import com.swp391.coding_platform.dto.response.ProblemSubmissionResponse;
import com.swp391.coding_platform.entity.enums.OjVerdict;

import java.time.format.DateTimeFormatter;
import java.time.LocalDate;
import java.util.List;
import java.util.Collections;
import java.util.Arrays;
import java.util.Locale;

import java.math.BigDecimal;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class DashboardService {

    private final EnrollmentRepository enrollmentRepository;
    private final WalletRepository walletRepository;
    private final UserRepository userRepository;
    private final CompletedLessonCountRepository completedLessonCountRepository;
    private final UserDailyActivityRepository activityRepository;
    private final CourseMapper courseMapper;
    private final ProblemSubmissionRepository problemSubmissionRepository;

    public DashboardStatsResponse getDashboardStats(Integer userId) {

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
            Integer rank = userRepository.getUserRanking(userId);
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

    public List<CourseListItemResponse> getEnrolledCourses(Integer userId) {
        // 1. Get active courses
        Set<CourseEntity> activeCourses = enrollmentRepository.findActiveCoursesByUserId(userId.longValue());

        if (activeCourses == null || activeCourses.isEmpty()) {
            return List.of();
        }

        // 2. Extract course IDs to avoid N+1 queries
        Set<Long> courseIds = activeCourses.stream()
                .map(CourseEntity::getId)
                .collect(Collectors.toSet());

        // 3. Query completed lesson counts in one go
        List<CompletedLessonsCountEntity> lessonCounts = completedLessonCountRepository
                .findByUserIdAndCourseIdIn(userId.longValue(), courseIds);

        // 4. Map courseId to completed count for fast lookup
        Map<Long, Integer> completedCountsMap = lessonCounts.stream()
                .collect(Collectors.toMap(
                        c -> c.getCourse().getId(),
                        c -> c.getCompletedLessonsCount() != null ? c.getCompletedLessonsCount() : 0
                ));

        // 5. Map entities to DTOs and calculate progress using the utility class
        return activeCourses.stream().map(course -> {
            int completed = completedCountsMap.getOrDefault(course.getId(), 0);
            int total = course.getTotalLessons() != null ? course.getTotalLessons() : 0;
            int progress = ProgressUtils.calculatePercentage(completed, total);

            CourseListItemResponse response = courseMapper.toCourseListItemResponse(course);
            response.setEnrolled(true);
            response.setProgressPercentage(progress);
            return response;
        }).toList();
    }

    public UserActivityResponse getUserActivitiesByYear(Integer userId, int year) {
        List<LocalDate> activeDates = activityRepository.findActiveDatesByYear(userId, year);
        Integer maxStreak = activityRepository.getMaxStreak(userId);
        Number currentStreakNum = activityRepository.getCurrentValidStreak(userId);
        Integer currentStreak = currentStreakNum != null ? currentStreakNum.intValue() : 0;

        return UserActivityResponse.builder()
                .userId(userId)
                .year(year)
                .maxStreak(maxStreak != null ? maxStreak : 0)
                .currentStreak(currentStreak)
                .activeDates(activeDates)
                .build();
    }

    public List<ProblemSubmissionResponse> getDoneProblems(Integer userId) {
        if (userId == null) {
            return Collections.emptyList();
        }

        List<ProblemSubmissionEntity> subs = problemSubmissionRepository.findSubmissionsWithProblemByUserId(userId);
        
        DateTimeFormatter formatter = DateTimeFormatter
                .ofPattern("yyyy-MM-dd HH:mm:ss")
                .withZone(java.time.ZoneId.systemDefault());

        return subs.stream().map(s -> {
            String subStatus = s.getVerdict() == OjVerdict.ACCEPTED ? "Accepted" : s.getVerdict().name().replace("_", " ");
            subStatus = Arrays.stream(subStatus.split(" "))
                    .map(word -> word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase())
                    .collect(Collectors.joining(" "));

            String langStr = "Java";
            if (s.getLanguageId() != null) {
                if (s.getLanguageId() == 2) langStr = "Python 3";
                else if (s.getLanguageId() == 3) langStr = "C++";
                else if (s.getLanguageId() == 4) langStr = "JavaScript";
            }

            String runtimeStr = s.getExecutionTime() != null ? String.format(Locale.US, "%.1f ms", s.getExecutionTime()) : "N/A";
            String memoryStr = s.getMemoryUsed() != null ? String.format(Locale.US, "%.1f MB", s.getMemoryUsed() / 1024.0) : "N/A";
            String timeStr = formatter.format(s.getSubmittedAt());
            String statusClass = s.getVerdict() == OjVerdict.ACCEPTED ? "text-brand-green" : "text-red-600";

            return ProblemSubmissionResponse.builder()
                    .problemId(s.getProblem() != null ? s.getProblem().getId() : null)
                    .problemTitle(s.getProblem() != null ? s.getProblem().getTitle() : null)
                    .status(subStatus)
                    .lang(langStr)
                    .runtime(runtimeStr)
                    .memory(memoryStr)
                    .time(timeStr)
                    .statusClass(statusClass)
                    .build();
        }).collect(Collectors.toList());
    }
}
