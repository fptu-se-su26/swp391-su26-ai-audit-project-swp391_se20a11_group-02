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
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.SecureRandom;
import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PasswordResetService {

    UserRepository userRepository;
    PasswordEncoder passwordEncoder;
    EmailService emailService;
    StringRedisTemplate redisTemplate;

    static final String OTP_PREFIX = "OTP_RESET:";
    static final String OTP_COOLDOWN_PREFIX = "OTP_COOLDOWN:";
    static final String OTP_ATTEMPTS_PREFIX = "OTP_ATTEMPTS:";
    static final String RESET_TOKEN_PREFIX = "RESET_TOKEN:";

    static final long OTP_TTL_MINUTES = 5;
    static final long COOLDOWN_TTL_SECONDS = 60;
    static final long RESET_TOKEN_TTL_MINUTES = 5;
    static final int MAX_FAILED_ATTEMPTS = 5;

    SecureRandom secureRandom = new SecureRandom();

    public void sendOtp(ForgotPasswordRequest request) {
        String email = request.getEmail().trim().toLowerCase();

        // 1. Check rate limit cooldown (60 seconds between resends)
        String cooldownKey = OTP_COOLDOWN_PREFIX + email;
        if (Boolean.TRUE.equals(redisTemplate.hasKey(cooldownKey))) {
            throw new AppException(ErrorCode.OTP_LIMIT_EXCEEDED);
        }

        // 2. Check if user exists (Silent pass if not found to prevent Email Enumeration attack)
        Optional<UserEntity> userOptional = userRepository.findByEmail(email);
        if (userOptional.isEmpty()) {
            log.warn("Password reset requested for non-existent email: {}", email);
            // We set cooldown anyway to prevent timing attacks
            redisTemplate.opsForValue().set(cooldownKey, "1", COOLDOWN_TTL_SECONDS, TimeUnit.SECONDS);
            return;
        }

        // 3. Generate 6-digit random OTP
        int otpNumber = secureRandom.nextInt(1_000_000);
        String otpCode = String.format("%06d", otpNumber);

        // 4. Save OTP and metadata to Redis
        String otpKey = OTP_PREFIX + email;
        String attemptsKey = OTP_ATTEMPTS_PREFIX + email;

        redisTemplate.opsForValue().set(otpKey, otpCode, OTP_TTL_MINUTES, TimeUnit.MINUTES);
        redisTemplate.opsForValue().set(cooldownKey, "1", COOLDOWN_TTL_SECONDS, TimeUnit.SECONDS);
        redisTemplate.delete(attemptsKey);

        // 5. Send OTP via email asynchronously
        emailService.sendOtpEmail(email, otpCode);
        log.info("OTP sent to email: {}", email);
    }

    public VerifyOtpResponse verifyOtp(VerifyOtpRequest request) {
        String email = request.getEmail().trim().toLowerCase();
        String otpKey = OTP_PREFIX + email;
        String attemptsKey = OTP_ATTEMPTS_PREFIX + email;

        // 1. Fetch OTP from Redis
        String storedOtp = redisTemplate.opsForValue().get(otpKey);
        if (storedOtp == null) {
            throw new AppException(ErrorCode.OTP_EXPIRED);
        }

        // 2. Check failed attempts count
        String attemptsStr = redisTemplate.opsForValue().get(attemptsKey);
        int attempts = attemptsStr != null ? Integer.parseInt(attemptsStr) : 0;
        if (attempts >= MAX_FAILED_ATTEMPTS) {
            redisTemplate.delete(otpKey);
            redisTemplate.delete(attemptsKey);
            throw new AppException(ErrorCode.TOO_MANY_OTP_ATTEMPTS);
        }

        // 3. Validate OTP
        if (!storedOtp.equals(request.getOtp().trim())) {
            redisTemplate.opsForValue().increment(attemptsKey);
            redisTemplate.expire(attemptsKey, OTP_TTL_MINUTES, TimeUnit.MINUTES);
            throw new AppException(ErrorCode.OTP_INVALID);
        }

        // 4. OTP is valid -> Clean up OTP Redis keys
        redisTemplate.delete(otpKey);
        redisTemplate.delete(attemptsKey);

        // 5. Generate temporary Reset Token for Step 3
        String resetToken = UUID.randomUUID().toString();
        String resetTokenKey = RESET_TOKEN_PREFIX + resetToken;
        redisTemplate.opsForValue().set(resetTokenKey, email, RESET_TOKEN_TTL_MINUTES, TimeUnit.MINUTES);

        return VerifyOtpResponse.builder()
                .resetToken(resetToken)
                .build();
    }

    @Transactional
    public void resetPassword(ResetPasswordRequest request) {
        String resetTokenKey = RESET_TOKEN_PREFIX + request.getResetToken().trim();

        // 1. Validate Reset Token in Redis
        String email = redisTemplate.opsForValue().get(resetTokenKey);
        if (email == null) {
            throw new AppException(ErrorCode.RESET_TOKEN_INVALID);
        }

        // 2. Find User in DB
        UserEntity user = userRepository.findByEmail(email)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));

        // 3. Update Password
        user.setPasswordHash(passwordEncoder.encode(request.getNewPassword()));
        userRepository.save(user);

        // 4. Invalidate Reset Token
        redisTemplate.delete(resetTokenKey);
        log.info("Successfully reset password for user with email: {}", email);
    }
}
