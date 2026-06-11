package com.swp391.coding_platform.controller.instructor;

import com.swp391.coding_platform.dto.request.ApproveApplicationRequest;
import com.swp391.coding_platform.dto.request.InstructorApplyRequest;
import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.InstructorApplicationResponse;
import com.swp391.coding_platform.service.instructor.InstructorApplicationService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.List;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class InstructorApplicationController {

    InstructorApplicationService applicationService;

    @PostMapping("/instructor-applications/apply")
    public ResponseEntity<ApiResponse<InstructorApplicationResponse>> apply(
            @AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody InstructorApplyRequest request) {

        Integer userId = getUserIdFromJwt(jwt);
        if (userId == null) {
            return ResponseEntity.status(401).build();
        }

        InstructorApplicationResponse result = applicationService.apply(userId, request);

        return ResponseEntity.ok(ApiResponse.<InstructorApplicationResponse>builder()
                .status(200)
                .code(1000)
                .message("Registered as instructor successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/instructor-applications/my-status")
    public ResponseEntity<ApiResponse<InstructorApplicationResponse>> getMyApplicationStatus(
            @AuthenticationPrincipal Jwt jwt) {

        Integer userId = getUserIdFromJwt(jwt);
        if (userId == null) {
            return ResponseEntity.status(401).build();
        }

        InstructorApplicationResponse result = applicationService.getMyApplicationStatus(userId);

        return ResponseEntity.ok(ApiResponse.<InstructorApplicationResponse>builder()
                .status(200)
                .code(1000)
                .message("Fetched current application status successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/admin/instructors/applications")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<ApiResponse<List<InstructorApplicationResponse>>> getApplications() {
        List<InstructorApplicationResponse> result = applicationService.getApplications();

        return ResponseEntity.ok(ApiResponse.<List<InstructorApplicationResponse>>builder()
                .status(200)
                .code(1000)
                .message("Fetched all instructor applications successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @PostMapping("/admin/instructors/applications/{id}/approve")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<ApiResponse<InstructorApplicationResponse>> approveApplication(
            @PathVariable("id") Integer id,
            @Valid @RequestBody ApproveApplicationRequest request) {

        InstructorApplicationResponse result = applicationService.approveApplication(id, request);

        return ResponseEntity.ok(ApiResponse.<InstructorApplicationResponse>builder()
                .status(200)
                .code(1000)
                .message("Application has been processed successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }


    private Integer getUserIdFromJwt(Jwt jwt) {
        if (jwt != null) {
            Number idClaim = jwt.getClaim("userId");
            if (idClaim != null) {
                return idClaim.intValue();
            }
        }
        return null;
    }
}
