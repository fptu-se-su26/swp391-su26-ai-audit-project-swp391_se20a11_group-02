package com.swp391.coding_platform.controller.problem;

import com.swp391.coding_platform.dto.request.SubmitRequest;
import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.ProblemDetailResponse;
import com.swp391.coding_platform.dto.response.ProblemListItemResponse;
import com.swp391.coding_platform.dto.response.SubmitResponse;
import com.swp391.coding_platform.service.problem.ProblemService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/problems")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProblemController {

    ProblemService problemService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<ProblemListItemResponse>>> getProblems(
            @AuthenticationPrincipal Jwt jwt) {

        Long userId = null;
        if (jwt != null) {
            userId = jwt.getClaim("userId");
        }

        List<ProblemListItemResponse> result = problemService.getProblems(userId);

        return ResponseEntity.ok(ApiResponse.<List<ProblemListItemResponse>>builder()
                .status(200)
                .code(1000)
                .message("Get problems successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<ProblemDetailResponse>> getProblemDetail(
            @PathVariable Integer id,
            @AuthenticationPrincipal Jwt jwt) {

        Long userId = null;
        if (jwt != null) {
            userId = jwt.getClaim("userId");
        }

        ProblemDetailResponse result = problemService.getProblemDetail(id, userId);

        return ResponseEntity.ok(ApiResponse.<ProblemDetailResponse>builder()
                .status(200)
                .code(1000)
                .message("Get problem detail successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @PostMapping("/{id}/submit")
    public ResponseEntity<ApiResponse<SubmitResponse>> submitProblem(
        @PathVariable Integer id,
        @AuthenticationPrincipal Jwt jwt,
        @Valid @RequestBody SubmitRequest request) {

        Long userId = null;
        if (jwt != null) {
            userId = jwt.getClaim("userId");
        }

        SubmitResponse result = problemService.submitProblem(id, userId, request);

        return ResponseEntity.ok(ApiResponse.<SubmitResponse>builder()
                .status(200)
                .code(1000)
                .message("Submit solution successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }
}
