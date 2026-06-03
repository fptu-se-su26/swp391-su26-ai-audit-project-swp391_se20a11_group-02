package com.swp391.coding_platform.controller.user;

import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.UserActivityResponse;
import com.swp391.coding_platform.service.user.UserActivityService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.*;
import java.time.Instant;


@RestController
@RequestMapping("/me")
@RequiredArgsConstructor
public class UserActivityController {

    private final UserActivityService userActivityService;

    @GetMapping("/activities")
    public ResponseEntity<ApiResponse<UserActivityResponse>> getUserActivities(
            @AuthenticationPrincipal Jwt jwt,
            @RequestParam(required = true) Integer year) {

        Integer userId = null;
        if(jwt != null){
            Number idClaim = jwt.getClaim("userId");
            if (idClaim != null) userId = idClaim.intValue();
        }

        UserActivityResponse result = userActivityService.getUserActivitiesByYear(userId, year);

        return ResponseEntity.ok(ApiResponse.<UserActivityResponse>builder()
                .status(200)
                .code(1000)
                .message("Get user activities successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }
}
