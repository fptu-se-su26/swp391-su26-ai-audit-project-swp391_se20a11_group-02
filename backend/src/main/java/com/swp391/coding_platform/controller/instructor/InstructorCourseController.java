package com.swp391.coding_platform.controller.instructor;

import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.InstructorCourseResponse;
import com.swp391.coding_platform.service.instructor.InstructorCourseService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;
import java.time.Instant;
import java.util.List;
import com.swp391.coding_platform.dto.request.InstructorCourseCreateRequest;

@RestController
@RequestMapping("/instructor")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class InstructorCourseController {

    InstructorCourseService instructorCourseService;

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

        List<InstructorCourseResponse> result = instructorCourseService.getCourses(userId);

        return ResponseEntity.ok(ApiResponse.<List<InstructorCourseResponse>>builder()
                .status(200)
                .code(1000)
                .message("Fetched instructor courses successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @PostMapping("/courses")
    @PreAuthorize("hasAuthority('ROLE_INSTRUCTOR')")
    public ResponseEntity<ApiResponse<InstructorCourseResponse>> createCourse(
            @AuthenticationPrincipal Jwt jwt,
            @RequestBody InstructorCourseCreateRequest request) {
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

        InstructorCourseResponse result = instructorCourseService.createCourse(userId, request);

        return ResponseEntity.ok(ApiResponse.<InstructorCourseResponse>builder()
                .status(200)
                .code(1000)
                .message("Course created successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/courses/{id}")
    @PreAuthorize("hasAuthority('ROLE_INSTRUCTOR')")
    public ResponseEntity<ApiResponse<com.swp391.coding_platform.dto.response.InstructorCourseDetailResponse>> getCourseDetail(
            @AuthenticationPrincipal Jwt jwt,
            @org.springframework.web.bind.annotation.PathVariable("id") Long id) {
        
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

        var result = instructorCourseService.getCourseDetail(userId, id);

        return ResponseEntity.ok(ApiResponse.<com.swp391.coding_platform.dto.response.InstructorCourseDetailResponse>builder()
                .status(200)
                .code(1000)
                .message("Fetched instructor course detail successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @org.springframework.web.bind.annotation.PutMapping("/courses/{id}")
    @PreAuthorize("hasAuthority('ROLE_INSTRUCTOR')")
    public ResponseEntity<ApiResponse<InstructorCourseResponse>> updateCourse(
            @AuthenticationPrincipal Jwt jwt,
            @PathVariable("id") Long id,
            @RequestBody com.swp391.coding_platform.dto.request.InstructorCourseUpdateRequest request) {

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

        InstructorCourseResponse result = instructorCourseService.updateCourse(userId, id, request);

        return ResponseEntity.ok(ApiResponse.<InstructorCourseResponse>builder()
                .status(200)
                .code(1000)
                .message("Course updated successfully. Status set to PENDING for admin review.")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }
    @GetMapping("/courses/{id}/statistics")
    @PreAuthorize("hasAuthority('ROLE_INSTRUCTOR')")
    public ResponseEntity<ApiResponse<com.swp391.coding_platform.dto.response.CourseStatisticResponse>> getCourseStatistics(
            @AuthenticationPrincipal Jwt jwt,
            @PathVariable("id") Long id) {

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

        var result = instructorCourseService.getCourseStatistics(userId, id);

        return ResponseEntity.ok(ApiResponse.<com.swp391.coding_platform.dto.response.CourseStatisticResponse>builder()
                .status(200)
                .code(1000)
                .message("Fetched course statistics successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }
}

