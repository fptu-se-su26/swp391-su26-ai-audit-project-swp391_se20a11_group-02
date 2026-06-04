package com.swp391.coding_platform.controller.user;

import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.CourseListItemResponse;
import com.swp391.coding_platform.dto.response.DashboardStatsResponse;
import com.swp391.coding_platform.dto.response.UserActivityResponse;
import com.swp391.coding_platform.dto.response.ProblemSubmissionResponse;
import com.swp391.coding_platform.service.user.DashboardService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.time.Instant;
import java.util.List;

@RestController
@RequestMapping("/me")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DashboardController {

    DashboardService dashboardService;

    @GetMapping("/dashboard-stats")
    public ResponseEntity<ApiResponse<DashboardStatsResponse>> getDashboardStats(@AuthenticationPrincipal Jwt jwt) {
        Integer userId = null;
        if(jwt != null){
            Number idClaim = jwt.getClaim("userId");
            if (idClaim != null) userId = idClaim.intValue();
        }

        DashboardStatsResponse result = dashboardService.getDashboardStats(userId);

        return ResponseEntity.ok(ApiResponse.<DashboardStatsResponse>builder()
                .status(200)
                .code(1000)
                .message("Get dashboard stats successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/activities")
    public ResponseEntity<ApiResponse<UserActivityResponse>> getUserActivities(
            @AuthenticationPrincipal Jwt jwt,
            @RequestParam(required = true) Integer year) {

        Integer userId = null;
        if(jwt != null){
            Number idClaim = jwt.getClaim("userId");
            if (idClaim != null) userId = idClaim.intValue();
        }

        UserActivityResponse result = dashboardService.getUserActivitiesByYear(userId, year);

        return ResponseEntity.ok(ApiResponse.<UserActivityResponse>builder()
                .status(200)
                .code(1000)
                .message("Get user activities successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/enrolled-courses")
    public ResponseEntity<ApiResponse<List<CourseListItemResponse>>> getEnrolledCourses(
            @AuthenticationPrincipal Jwt jwt) {

        Integer userId = null;
        if(jwt != null){
            Number idClaim = jwt.getClaim("userId");
            if (idClaim != null) userId = idClaim.intValue();
        }

        List<CourseListItemResponse> result = dashboardService.getEnrolledCourses(userId);

        return ResponseEntity.ok(ApiResponse.<List<CourseListItemResponse>>builder()
                .status(200)
                .code(1000)
                .message("Get enrolled courses successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/done-problems")
    public ResponseEntity<ApiResponse<List<ProblemSubmissionResponse>>> getDoneProblems(
            @AuthenticationPrincipal Jwt jwt) {

        Integer userId = null;
        if(jwt != null){
            Number idClaim = jwt.getClaim("userId");
            if (idClaim != null) userId = idClaim.intValue();
        }

        List<ProblemSubmissionResponse> result = dashboardService.getDoneProblems(userId);

        return ResponseEntity.ok(ApiResponse.<List<ProblemSubmissionResponse>>builder()
                .status(200)
                .code(1000)
                .message("Get done problems successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }
}
