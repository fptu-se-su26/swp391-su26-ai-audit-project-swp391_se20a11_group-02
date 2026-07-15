package com.swp391.coding_platform.service.auth;

import com.swp391.coding_platform.dto.request.AuthenticationRequest;
import com.swp391.coding_platform.dto.request.GoogleLoginRequest;
import com.swp391.coding_platform.dto.request.RegisterRequest;
import com.swp391.coding_platform.dto.response.AuthenticationResponse;
import com.swp391.coding_platform.entity.auth.RoleEntity;
import com.swp391.coding_platform.entity.enums.RoleName;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.mapper.UserMapper;
import com.swp391.coding_platform.repository.auth.InvalidatedTokenRepository;
import com.swp391.coding_platform.repository.auth.RoleRepository;
import com.swp391.coding_platform.repository.user.UserOauthAccountRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class AuthenticationServiceTest {

    @Mock
    private UserRepository userRepository;
    @Mock
    private PasswordEncoder passwordEncoder;
    @Mock
    private RoleRepository roleRepository;
    @Mock
    private InvalidatedTokenRepository invalidatedTokenRepository;
    @Mock
    private ApplicationEventPublisher applicationEventPublisher;
    @Mock
    private UserMapper userMapper;
    @Mock
    private UserOauthAccountRepository userOauthAccountRepository;

    @InjectMocks
    private AuthenticationService authenticationService;

    @BeforeEach
    void setUp() {
        ReflectionTestUtils.setField(authenticationService, "SIGNER_KEY", "bXlzdXBlcnNlY3JldGtleXRoYXRpc2xvbmVub3VnaHRvYmVzZWN1cmUxMjM0NTY3ODkw");
        ReflectionTestUtils.setField(authenticationService, "VALID_DURATION", 3600L);
        ReflectionTestUtils.setField(authenticationService, "REFRESHABLE_DURATION", 86400L);
    }

    @Test
    void login_Success() {
        AuthenticationRequest request = new AuthenticationRequest("testuser", "password");
        UserEntity user = new UserEntity();
        user.setId(1);
        user.setUsername("testuser");
        user.setPasswordHash("hashed_password");

        when(userRepository.findByUsernameWithWallet("testuser")).thenReturn(Optional.of(user));
        when(passwordEncoder.matches("password", "hashed_password")).thenReturn(true);
        when(userMapper.toAuthenticationResponse(user)).thenReturn(new AuthenticationResponse());

        AuthenticationResponse response = authenticationService.login(request);

        assertNotNull(response);
        assertNotNull(response.getAccessToken());
        assertNotNull(response.getRefreshToken());
    }

    @Test
    void login_InvalidPassword_ThrowsAppException() {
        AuthenticationRequest request = new AuthenticationRequest("testuser", "wrongpassword");
        UserEntity user = new UserEntity();
        user.setUsername("testuser");
        user.setPasswordHash("hashed_password");

        when(userRepository.findByUsernameWithWallet("testuser")).thenReturn(Optional.of(user));
        when(passwordEncoder.matches("wrongpassword", "hashed_password")).thenReturn(false);

        AppException ex = assertThrows(AppException.class, () -> authenticationService.login(request));
        assertEquals(ErrorCode.INVALID_USERNAME_OR_PASSWORD, ex.getErrorCode());
    }

    @Test
    void login_UsernameNotFound_ThrowsAppException() {
        AuthenticationRequest request = new AuthenticationRequest("notfound", "password");
        when(userRepository.findByUsernameWithWallet("notfound")).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> authenticationService.login(request));
        assertEquals(ErrorCode.INVALID_USERNAME_OR_PASSWORD, ex.getErrorCode());
    }

    @Test
    void register_Success() {
        RegisterRequest request = new RegisterRequest("newuser", "password", "password", "New User", "newuser@test.com");
        UserEntity mappedUser = new UserEntity();
        mappedUser.setUsername("newuser");

        when(userRepository.existsByUsername("newuser")).thenReturn(false);
        when(userRepository.existsByEmail("newuser@test.com")).thenReturn(false);
        when(userMapper.toUserEntity(request)).thenReturn(mappedUser);
        when(passwordEncoder.encode("password")).thenReturn("hashed");
        RoleEntity roleEntity = RoleEntity.builder().name(RoleName.USER).build();
        when(roleRepository.findByName(RoleName.USER)).thenReturn(Optional.of(roleEntity));
        when(userRepository.save(any(UserEntity.class))).thenReturn(mappedUser);

        when(userRepository.findByUsernameWithWallet("newuser")).thenReturn(Optional.of(mappedUser));
        when(passwordEncoder.matches("password", "hashed")).thenReturn(true);
        when(userMapper.toAuthenticationResponse(mappedUser)).thenReturn(new AuthenticationResponse());

        AuthenticationResponse response = authenticationService.register(request);

        assertNotNull(response);
        verify(userRepository, times(1)).save(any(UserEntity.class));
    }

    @Test
    void register_UsernameAlreadyExists_ThrowsAppException() {
        RegisterRequest request = new RegisterRequest("existinguser", "password", "password", "Name", "email@test.com");
        when(userRepository.existsByUsername("existinguser")).thenReturn(true);

        AppException ex = assertThrows(AppException.class, () -> authenticationService.register(request));
        assertEquals(ErrorCode.USERNAME_ALREADY_EXISTS, ex.getErrorCode());
    }

    @Test
    void register_PasswordNotMatch_ThrowsAppException() {
        RegisterRequest request = new RegisterRequest("user", "password", "different", "Name", "email@test.com");
        when(userRepository.existsByUsername("user")).thenReturn(false);

        AppException ex = assertThrows(AppException.class, () -> authenticationService.register(request));
        assertEquals(ErrorCode.PASSWORD_NOT_MATCH, ex.getErrorCode());
    }

    @Test
    void register_EmailAlreadyExists_ThrowsAppException() {
        RegisterRequest request = new RegisterRequest("user", "password", "password", "Name", "existing@test.com");
        when(userRepository.existsByUsername("user")).thenReturn(false);
        when(userRepository.existsByEmail("existing@test.com")).thenReturn(true);

        AppException ex = assertThrows(AppException.class, () -> authenticationService.register(request));
        assertEquals(ErrorCode.EMAIL_ALREADY_EXISTS, ex.getErrorCode());
    }

    @Test
    void googleLogin_InvalidIdToken_ThrowsAppException() {
        GoogleLoginRequest request = new GoogleLoginRequest("invalid_token");
        // Verify token will throw because verifier or NetHttpTransport is mock/not set up or idToken verify returns null.
        // It falls into the try-catch block and throws UNAUTHENTICATED.
        AppException ex = assertThrows(AppException.class, () -> authenticationService.googleLogin(request));
        assertEquals(ErrorCode.UNAUTHENTICATED, ex.getErrorCode());
    }
}
