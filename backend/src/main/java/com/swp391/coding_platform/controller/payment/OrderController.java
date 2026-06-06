package com.swp391.coding_platform.controller.payment;


import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.request.OrderCheckoutRequest;
import com.swp391.coding_platform.dto.response.OrderCheckoutResponse;
import com.swp391.coding_platform.service.payment.OrderService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.time.Instant;

@Slf4j
@RestController
@RequestMapping("/orders")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class OrderController {

    OrderService orderService;

    @PostMapping("/checkout")
    public ResponseEntity<ApiResponse<OrderCheckoutResponse>> checkout(
            @AuthenticationPrincipal Jwt jwt,
            @Valid @RequestBody OrderCheckoutRequest request) {

        Integer userId = null;
        if (jwt != null) {
            Number userIdNum = jwt.getClaim("userId");
            if (userIdNum != null) {
                userId = userIdNum.intValue();
            }
        }
        log.info("User {} is checking out courses: {}", userId, request.getCourseIds());
        
        OrderCheckoutResponse response = orderService.createCheckout(userId, request);

        return ResponseEntity.ok(ApiResponse.<OrderCheckoutResponse>builder()
                .status(200)
                .code(1000)
                .message("Order checkout completed successfully")
                .result(response)
                .timestamp(Instant.now().toString())
                .build());
    }
}
