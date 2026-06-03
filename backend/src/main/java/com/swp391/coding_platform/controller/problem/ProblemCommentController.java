package com.swp391.coding_platform.controller.problem;

import com.swp391.coding_platform.dto.request.CreateCommentRequest;
import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.ProblemCommentResponse;
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
public class ProblemCommentController {

    ProblemService problemService;

    @GetMapping("/{id}/comments")
    public ResponseEntity<ApiResponse<List<ProblemCommentResponse>>> getComments(
            @PathVariable Integer id) {

        List<ProblemCommentResponse> result = problemService.getComments(id);

        return ResponseEntity.ok(ApiResponse.<List<ProblemCommentResponse>>builder()
                .status(200)
                .code(1000)
                .message("Get comments successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @PostMapping("/{id}/comments")
    public ResponseEntity<ApiResponse<ProblemCommentResponse>> addComment(
            @PathVariable Integer id,
            @AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody CreateCommentRequest request) {

        Long userId = null;
        if (jwt != null) {
            userId = jwt.getClaim("userId");
        }

        ProblemCommentResponse result = problemService.addComment(id, userId, request);

        return ResponseEntity.ok(ApiResponse.<ProblemCommentResponse>builder()
                .status(200)
                .code(1000)
                .message("Add comment successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }
}
