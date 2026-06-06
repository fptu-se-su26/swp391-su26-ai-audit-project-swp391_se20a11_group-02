package com.swp391.coding_platform.controller.instructor;

import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.InstructorCourseResponse;
import com.swp391.coding_platform.dto.response.InstructorRevenueResponse;
import com.swp391.coding_platform.service.instructor.InstructorService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.List;

@RestController
@RequestMapping("/instructor")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class InstructorController {

    InstructorService instructorService;

    @GetMapping("/courses")
    @PreAuthorize("hasAuthority('ROLE_INSTRUCTOR')")
    public ResponseEntity<ApiResponse<List<InstructorCourseResponse>>> getCourses(@AuthenticationPrincipal Jwt jwt) {
        Integer userId = null;
        if (jwt != null) {
            Number idClaim = jwt.getClaim("userId");
            if (idClaim != null) {
                userId = idClaim.intValue();
            }
        }

        if (userId == null) {
            return ResponseEntity.status(401).build();
        }

        List<InstructorCourseResponse> result = instructorService.getCourses(userId);

        return ResponseEntity.ok(ApiResponse.<List<InstructorCourseResponse>>builder()
                .status(200)
                .code(1000)
                .message("Fetched instructor courses successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/revenue")
    @PreAuthorize("hasAuthority('ROLE_INSTRUCTOR')")
    public ResponseEntity<ApiResponse<InstructorRevenueResponse>> getRevenueData(
            @AuthenticationPrincipal Jwt jwt,
            @org.springframework.web.bind.annotation.RequestParam(value = "filter", defaultValue = "this-month") String filter,
            @org.springframework.web.bind.annotation.RequestParam(value = "startDate", required = false) String startDate,
            @org.springframework.web.bind.annotation.RequestParam(value = "endDate", required = false) String endDate,
            @org.springframework.web.bind.annotation.RequestParam(value = "trendTimeframe", defaultValue = "12m") String trendTimeframe) {
        Integer userId = null;
        if (jwt != null) {
            Number idClaim = jwt.getClaim("userId");
            if (idClaim != null) {
                userId = idClaim.intValue();
            }
        }

        if (userId == null) {
            return ResponseEntity.status(401).build();
        }

        InstructorRevenueResponse result = instructorService.getRevenueData(userId, filter, startDate, endDate, trendTimeframe);

        return ResponseEntity.ok(ApiResponse.<InstructorRevenueResponse>builder()
                .status(200)
                .code(1000)
                .message("Fetched instructor revenue data successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }
}
