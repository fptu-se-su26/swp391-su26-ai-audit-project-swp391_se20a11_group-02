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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.time.Instant;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/instructor")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class InstructorCourseController {

    InstructorCourseService instructorCourseService;

    @GetMapping("/courses")
    @PreAuthorize("hasAuthority('ROLE_INSTRUCTOR')")
    public ResponseEntity<ApiResponse<List<InstructorCourseResponse>>> getCourses(@AuthenticationPrincipal Jwt jwt) {
        Integer userId = extractUserId(jwt);
        if (userId == null) return ResponseEntity.status(401).build();

        List<InstructorCourseResponse> result = instructorCourseService.getCourses(userId);

        return ResponseEntity.ok(ApiResponse.<List<InstructorCourseResponse>>builder()
                .status(200)
                .code(1000)
                .message("Fetched instructor courses successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    /**
     * Instructor nộp lại khóa học bị REJECTED để AI kiểm duyệt lại.
     * POST /instructor/courses/{courseId}/submit
     */
    @PostMapping("/courses/{courseId}/submit")
    @PreAuthorize("hasAuthority('ROLE_INSTRUCTOR')")
    public ResponseEntity<ApiResponse<Map<String, Object>>> submitCourseForReview(
            @PathVariable Long courseId,
            @AuthenticationPrincipal Jwt jwt) {

        Integer userId = extractUserId(jwt);
        if (userId == null) return ResponseEntity.status(401).build();

        instructorCourseService.submitCourseForReview(userId, courseId);

        return ResponseEntity.ok(ApiResponse.<Map<String, Object>>builder()
                .status(200)
                .code(1000)
                .message("Đã nộp khóa học để AI kiểm duyệt thành công!")
                .result(Map.of("courseId", courseId, "status", "PENDING"))
                .timestamp(Instant.now().toString())
                .build());
    }

    private Integer extractUserId(Jwt jwt) {
        if (jwt == null) return null;
        Number idClaim = jwt.getClaim("userId");
        return idClaim != null ? idClaim.intValue() : null;
    }
}
