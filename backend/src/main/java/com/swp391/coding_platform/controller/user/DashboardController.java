package com.swp391.coding_platform.controller.user;

import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.DashboardStatsResponse;
import com.swp391.coding_platform.service.user.DashboardService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.time.Instant;

@RestController
@RequestMapping("/me")
@RequiredArgsConstructor
public class DashboardController {

    private final DashboardService dashboardService;

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
}
