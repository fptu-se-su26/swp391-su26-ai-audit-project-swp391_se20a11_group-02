package com.swp391.coding_platform.service.auth;

import com.swp391.coding_platform.dto.request.ForgotPasswordRequest;
import com.swp391.coding_platform.dto.request.ResetPasswordRequest;
import com.swp391.coding_platform.dto.request.VerifyOtpRequest;
import com.swp391.coding_platform.dto.response.VerifyOtpResponse;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.user.UserRepository;
import com.swp391.coding_platform.service.email.EmailService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class PasswordResetServiceTest {

    @Mock
    UserRepository userRepository;

    @Mock
    PasswordEncoder passwordEncoder;

    @Mock
    EmailService emailService;

    @Mock
    StringRedisTemplate redisTemplate;

    @Mock
    ValueOperations<String, String> valueOperations;

    @InjectMocks
    PasswordResetService passwordResetService;

    private UserEntity mockUser;

    @BeforeEach
    void setUp() {
        lenient().when(redisTemplate.opsForValue()).thenReturn(valueOperations);

        mockUser = UserEntity.builder()
                .id(1)
                .email("test@example.com")
                .username("testuser")
                .passwordHash("encoded_old_password")
                .build();
    }

    @Test
    @DisplayName("sendOtp success - should set OTP in Redis and call EmailService")
    void sendOtp_Success() {
        ForgotPasswordRequest request = new ForgotPasswordRequest("test@example.com");
        when(redisTemplate.hasKey(anyString())).thenReturn(false);
        when(userRepository.findByEmail("test@example.com")).thenReturn(Optional.of(mockUser));

        assertDoesNotThrow(() -> passwordResetService.sendOtp(request));

        verify(valueOperations).set(eq("OTP_RESET:test@example.com"), anyString(), eq(5L), eq(TimeUnit.MINUTES));
        verify(emailService).sendOtpEmail(eq("test@example.com"), anyString());
    }

    @Test
    @DisplayName("sendOtp when cooldown active - should throw OTP_LIMIT_EXCEEDED")
    void sendOtp_RateLimitExceeded() {
        ForgotPasswordRequest request = new ForgotPasswordRequest("test@example.com");
        when(redisTemplate.hasKey("OTP_COOLDOWN:test@example.com")).thenReturn(true);

        AppException exception = assertThrows(AppException.class, () -> passwordResetService.sendOtp(request));
        assertEquals(ErrorCode.OTP_LIMIT_EXCEEDED, exception.getErrorCode());
        verify(emailService, never()).sendOtpEmail(anyString(), anyString());
    }

    @Test
    @DisplayName("verifyOtp success - should return Reset Token and cleanup OTP")
    void verifyOtp_Success() {
        VerifyOtpRequest request = new VerifyOtpRequest("test@example.com", "123456");
        when(valueOperations.get("OTP_RESET:test@example.com")).thenReturn("123456");
        when(valueOperations.get("OTP_ATTEMPTS:test@example.com")).thenReturn("0");

        VerifyOtpResponse response = passwordResetService.verifyOtp(request);

        assertNotNull(response);
        assertNotNull(response.getResetToken());
        verify(redisTemplate).delete("OTP_RESET:test@example.com");
        verify(valueOperations).set(startsWith("RESET_TOKEN:"), eq("test@example.com"), eq(5L), eq(TimeUnit.MINUTES));
    }

    @Test
    @DisplayName("verifyOtp with wrong OTP - should increment attempts and throw OTP_INVALID")
    void verifyOtp_InvalidOtp() {
        VerifyOtpRequest request = new VerifyOtpRequest("test@example.com", "999999");
        when(valueOperations.get("OTP_RESET:test@example.com")).thenReturn("123456");
        when(valueOperations.get("OTP_ATTEMPTS:test@example.com")).thenReturn("1");

        AppException exception = assertThrows(AppException.class, () -> passwordResetService.verifyOtp(request));
        assertEquals(ErrorCode.OTP_INVALID, exception.getErrorCode());
        verify(valueOperations).increment("OTP_ATTEMPTS:test@example.com");
    }

    @Test
    @DisplayName("resetPassword success - should encode new password and update user in DB")
    void resetPassword_Success() {
        ResetPasswordRequest request = new ResetPasswordRequest("valid-reset-token", "newSecretPassword123");
        when(valueOperations.get("RESET_TOKEN:valid-reset-token")).thenReturn("test@example.com");
        when(userRepository.findByEmail("test@example.com")).thenReturn(Optional.of(mockUser));
        when(passwordEncoder.encode("newSecretPassword123")).thenReturn("encoded_new_password");

        assertDoesNotThrow(() -> passwordResetService.resetPassword(request));

        verify(passwordEncoder).encode("newSecretPassword123");
        verify(userRepository).save(mockUser);
        verify(redisTemplate).delete("RESET_TOKEN:valid-reset-token");
    }

    @Test
    @DisplayName("resetPassword with invalid reset token - should throw RESET_TOKEN_INVALID")
    void resetPassword_InvalidToken() {
        ResetPasswordRequest request = new ResetPasswordRequest("expired-token", "newSecretPassword123");
        when(valueOperations.get("RESET_TOKEN:expired-token")).thenReturn(null);

        AppException exception = assertThrows(AppException.class, () -> passwordResetService.resetPassword(request));
        assertEquals(ErrorCode.RESET_TOKEN_INVALID, exception.getErrorCode());
        verify(userRepository, never()).save(any());
    }
}
