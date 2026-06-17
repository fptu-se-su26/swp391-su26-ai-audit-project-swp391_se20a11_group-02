package com.swp391.coding_platform.controller.contest;

import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.ContestScoreboardResponse;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.service.contest.ContestRankingService;
import com.swp391.coding_platform.service.contest.SseScoreboardManager;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import java.time.Instant;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/contests/{contestId}/scoreboard")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ScoreboardStreamController {

    ContestRankingService contestRankingService;
    SseScoreboardManager sseScoreboardManager;
    ContestRepository contestRepository;

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ApiResponse<ContestScoreboardResponse>> getScoreboard(
            @PathVariable Integer contestId,
            @RequestParam(value = "live", defaultValue = "false") boolean isLive,
            JwtAuthenticationToken token) {

        boolean isAdmin = token.getAuthorities().stream()
                .anyMatch(a -> "ROLE_ADMIN".equals(a.getAuthority()) || "ADMIN".equals(a.getAuthority()));

        if (!isAdmin) {
            Integer userId = Integer.parseInt(token.getToken().getClaim("userId").toString());
            boolean isRegistered = contestRepository.isUserRegistered(contestId, userId);
            if (!isRegistered) {
                throw new AppException(ErrorCode.CONTEST_NOT_JOINED);
            }
        }

        boolean requestedLive = isLive && isAdmin;

        ContestScoreboardResponse scoreboard = contestRankingService.getScoreboard(contestId, requestedLive);

        return ResponseEntity.ok(ApiResponse.<ContestScoreboardResponse>builder()
                .status(200)
                .code(1000)
                .message("Get contest scoreboard successfully")
                .result(scoreboard)
                .timestamp(Instant.now().toString())
                .build());
    }

    @GetMapping(value = "/stream", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public SseEmitter getScoreboardStream(
            @PathVariable Integer contestId,
            JwtAuthenticationToken token) {

        boolean isAdmin = token.getAuthorities().stream()
                .anyMatch(a -> "ROLE_ADMIN".equals(a.getAuthority()) || "ADMIN".equals(a.getAuthority()));

        if (!isAdmin) {
            Integer userId = Integer.parseInt(token.getToken().getClaim("userId").toString());
            boolean isRegistered = contestRepository.isUserRegistered(contestId, userId);
            if (!isRegistered) {
                throw new AppException(ErrorCode.CONTEST_NOT_JOINED);
            }
        }

        log.info("Client subscribed to SSE scoreboard stream for contest: {}", contestId);
        return sseScoreboardManager.createConnection(contestId);
    }
}
