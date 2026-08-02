package com.swp391.coding_platform.controller.auth;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.request.AuthenticationRequest;
import com.swp391.coding_platform.dto.request.ForgotPasswordRequest;
import com.swp391.coding_platform.dto.request.RegisterRequest;
import com.swp391.coding_platform.dto.request.ResetPasswordRequest;
import com.swp391.coding_platform.dto.request.VerifyOtpRequest;
import com.swp391.coding_platform.dto.response.AuthenticationResponse;
import com.swp391.coding_platform.dto.response.VerifyOtpResponse;
import com.swp391.coding_platform.repository.user.UserDailyActivityRepository;
import com.swp391.coding_platform.service.auth.AuthenticationService;
import com.swp391.coding_platform.service.auth.PasswordResetService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(controllers = AuthenticationController.class, properties = {
        "auth.cookie.access-token.name=access_token",
        "auth.cookie.access-token.secure=false",
        "auth.cookie.access-token.max-age=3600",
        "auth.cookie.access-token.http-only=true",
        "auth.cookie.access-token.same-site=Lax",
        "auth.cookie.access-token.path=/",
        "auth.cookie.refresh-token.name=refresh_token",
        "auth.cookie.refresh-token.secure=false",
        "auth.cookie.refresh-token.max-age=86400",
        "auth.cookie.refresh-token.http-only=true",
        "auth.cookie.refresh-token.same-site=Lax",
        "auth.cookie.refresh-token.path=/auth/refresh"
})
@AutoConfigureMockMvc(addFilters = false)
class AuthenticationControllerTest {

    @MockBean
    private JdbcTemplate jdbcTemplate;

    @MockBean
    private UserDailyActivityRepository userDailyActivityRepository;

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private AuthenticationService authenticationService;

    @MockBean
    private PasswordResetService passwordResetService;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    void login_Success() throws Exception {
        AuthenticationRequest request = new AuthenticationRequest("testuser", "password");
        AuthenticationResponse response = new AuthenticationResponse();
        response.setUsername("testuser");
        response.setAccessToken("acc_token");
        response.setRefreshToken("ref_token");

        when(authenticationService.login(any(AuthenticationRequest.class))).thenReturn(response);

        mockMvc.perform(post("/auth/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000))
                .andExpect(jsonPath("$.message").value("Login successfully"))
                .andExpect(jsonPath("$.result.username").value("testuser"));
    }

    @Test
    void register_Success() throws Exception {
        RegisterRequest request = new RegisterRequest("testuser", "password", "password", "testuser", "test@test.com");
        AuthenticationResponse response = new AuthenticationResponse();
        response.setUsername("testuser");
        response.setAccessToken("acc_token");
        response.setRefreshToken("ref_token");

        when(authenticationService.register(any(RegisterRequest.class))).thenReturn(response);

        mockMvc.perform(post("/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000))
                .andExpect(jsonPath("$.message").value("Register account successfully"));
    }

    @Test
    void forgotPassword_Success() throws Exception {
        ForgotPasswordRequest request = new ForgotPasswordRequest("test@test.com");
        doNothing().when(passwordResetService).sendOtp(any());

        mockMvc.perform(post("/auth/forgot-password")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000));
    }

    @Test
    void verifyOtp_Success() throws Exception {
        VerifyOtpRequest request = new VerifyOtpRequest("test@test.com", "123456");
        VerifyOtpResponse response = new VerifyOtpResponse("token-123");
        when(passwordResetService.verifyOtp(any())).thenReturn(response);

        mockMvc.perform(post("/auth/verify-otp")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000))
                .andExpect(jsonPath("$.result.resetToken").value("token-123"));
    }

    @Test
    void resetPassword_Success() throws Exception {
        ResetPasswordRequest request = new ResetPasswordRequest("token-123", "newPassword123");
        doNothing().when(passwordResetService).resetPassword(any());

        mockMvc.perform(post("/auth/reset-password")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000));
    }
}
