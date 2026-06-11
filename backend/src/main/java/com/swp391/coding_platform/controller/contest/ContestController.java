package com.swp391.coding_platform.controller.contest;

import com.swp391.coding_platform.dto.request.ContestSearchRequest;
import com.swp391.coding_platform.dto.request.ContestRegisterRequest;
import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.ContestProblemResponse;
import com.swp391.coding_platform.dto.response.ContestResponse;
import com.swp391.coding_platform.dto.response.ContestUserStatsResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.service.contest.ContestService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.List;

@RestController
@RequestMapping("/contests")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ContestController {

    ContestService contestService;

    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<ContestResponse>>> getContests(
            @AuthenticationPrincipal Jwt jwt,
            @jakarta.validation.Valid ContestSearchRequest request) {

        String username = getUsername(jwt);
        PageResponse<ContestResponse> result = contestService.getContests(request, username);

        return ResponseEntity.ok(ApiResponse.<PageResponse<ContestResponse>>builder()
                .status(200)
                .code(1000)
                .message("Get contests list successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/banner")
    public ResponseEntity<ApiResponse<ContestResponse>> getBannerContest(@AuthenticationPrincipal Jwt jwt) {
        String username = getUsername(jwt);
        ContestResponse result = contestService.getBannerContest(username);

        return ResponseEntity.ok(ApiResponse.<ContestResponse>builder()
                .status(200)
                .code(1000)
                .message("Get banner contest successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/user-stats")
    public ResponseEntity<ApiResponse<ContestUserStatsResponse>> getUserStats(@AuthenticationPrincipal Jwt jwt) {
        String username = getUsername(jwt);
        ContestUserStatsResponse result = contestService.getUserStats(username);

        return ResponseEntity.ok(ApiResponse.<ContestUserStatsResponse>builder()
                .status(200)
                .code(1000)
                .message("Get contest user stats successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping("/{contestId}")
    public ResponseEntity<ApiResponse<ContestResponse>> getContestById(
            @AuthenticationPrincipal Jwt jwt,
            @PathVariable("contestId") Integer contestId) {

        String username = getUsername(jwt);
        ContestResponse result = contestService.getContestById(contestId, username);

        return ResponseEntity.ok(ApiResponse.<ContestResponse>builder()
                .status(200)
                .code(1000)
                .message("Get contest by id successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    @PostMapping("/{contestId}/register")
    public ResponseEntity<ApiResponse<Void>> registerForContest(
            @AuthenticationPrincipal Jwt jwt,
            @PathVariable("contestId") Integer contestId,
            @RequestBody(required = false) ContestRegisterRequest request) {

        String username = getUsername(jwt);

        contestService.registerForContest(contestId, username, request);

        return ResponseEntity.ok(ApiResponse.<Void>builder()
                .status(200)
                .code(1000)
                .message("Registered for contest successfully")
                .build());
    }

    @GetMapping("/{contestId}/problems")
    public ResponseEntity<ApiResponse<List<ContestProblemResponse>>> getContestProblems(
            @AuthenticationPrincipal Jwt jwt,
            @PathVariable("contestId") Integer contestId) {

        String username = getUsername(jwt);
        List<ContestProblemResponse> result = contestService.getContestProblems(contestId, username);

        return ResponseEntity.ok(ApiResponse.<List<ContestProblemResponse>>builder()
                .status(200)
                .code(1000)
                .message("Get contest problems successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

    private String getUsername(Jwt jwt) {
        if (jwt == null) return null;
        if (jwt.hasClaim("preferred_username")) {
            return jwt.getClaimAsString("preferred_username");
        }
        return jwt.getSubject();
    }
}
