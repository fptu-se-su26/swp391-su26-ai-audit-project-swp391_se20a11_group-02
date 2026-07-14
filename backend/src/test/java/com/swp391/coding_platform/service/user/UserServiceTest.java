package com.swp391.coding_platform.service.user;

import com.swp391.coding_platform.dto.request.ChangePasswordRequest;
import com.swp391.coding_platform.dto.response.UserResponse;
import com.swp391.coding_platform.entity.enums.UserStatus;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.mapper.UserMapper;
import com.swp391.coding_platform.repository.payment.OrderItemRepository;
import com.swp391.coding_platform.repository.payment.WalletTransactionRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    @Mock
    private UserRepository userRepository;
    @Mock
    private PasswordEncoder passwordEncoder;
    @Mock
    private UserMapper userMapper;
    @Mock
    private WalletTransactionRepository walletTransactionRepository;
    @Mock
    private OrderItemRepository orderItemRepository;

    @InjectMocks
    private UserService userService;

    @Test
    void getMyInfo_Success() {
        UserEntity userEntity = new UserEntity();
        userEntity.setUsername("testuser");

        UserResponse userResponse = new UserResponse();
        userResponse.setDisplayName("testuser");

        when(userRepository.findByUsername("testuser")).thenReturn(Optional.of(userEntity));
        when(userMapper.toUserResponse(userEntity)).thenReturn(userResponse);

        UserResponse response = userService.getMyInfo("testuser");

        assertNotNull(response);
        assertEquals("testuser", response.getDisplayName());
    }

    @Test
    void getMyInfo_UserNotFound_ThrowsAppException() {
        when(userRepository.findByUsername("testuser")).thenReturn(Optional.empty());

        assertThrows(AppException.class, () -> userService.getMyInfo("testuser"));
    }

    @Test
    void changePassword_Success() {
        ChangePasswordRequest request = new ChangePasswordRequest("oldpass", "newpass", "newpass");
        UserEntity userEntity = new UserEntity();
        userEntity.setUsername("testuser");
        userEntity.setPasswordHash("hashed_oldpass");
        userEntity.setStatus(UserStatus.ACTIVE);

        when(userRepository.findByUsername("testuser")).thenReturn(Optional.of(userEntity));
        when(passwordEncoder.matches("oldpass", "hashed_oldpass")).thenReturn(true);
        when(passwordEncoder.matches("newpass", "hashed_oldpass")).thenReturn(false);
        when(passwordEncoder.encode("newpass")).thenReturn("hashed_newpass");

        userService.changePassword("testuser", request);

        verify(userRepository, times(1)).save(userEntity);
        assertEquals("hashed_newpass", userEntity.getPasswordHash());
    }

    @Test
    void changePassword_OldPasswordNotMatch_ThrowsAppException() {
        ChangePasswordRequest request = new ChangePasswordRequest("wrongold", "newpass", "newpass");
        UserEntity userEntity = new UserEntity();
        userEntity.setUsername("testuser");
        userEntity.setPasswordHash("hashed_oldpass");
        userEntity.setStatus(UserStatus.ACTIVE);

        when(userRepository.findByUsername("testuser")).thenReturn(Optional.of(userEntity));
        when(passwordEncoder.matches("wrongold", "hashed_oldpass")).thenReturn(false);

        assertThrows(AppException.class, () -> userService.changePassword("testuser", request));
        verify(userRepository, never()).save(any(UserEntity.class));
    }
}
