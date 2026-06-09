package com.swp391.coding_platform.service.user;

import com.swp391.coding_platform.dto.request.ChangePasswordRequest;
import com.swp391.coding_platform.dto.response.UserResponse;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.mapper.UserMapper;
import com.swp391.coding_platform.repository.user.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserService {
    UserRepository userRepository;
    PasswordEncoder passwordEncoder;
    UserMapper userMapper;

    @Transactional
    public void changePassword(String username, ChangePasswordRequest changePasswordRequest){
        UserEntity userEntity = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));
        userEntity.validateStatus();

        if(!passwordEncoder.matches(changePasswordRequest.getOldPassword(), userEntity.getPasswordHash())){
            throw new AppException(ErrorCode.OLD_PASSWORD_NOT_MATCH);
        }

        if(!Objects.equals(changePasswordRequest.getNewPassword(), changePasswordRequest.getConfirmNewPassword())){
            throw new AppException(ErrorCode.PASSWORD_NOT_MATCH);
        }

        if (passwordEncoder.matches(changePasswordRequest.getNewPassword(), userEntity.getPasswordHash())) {
            throw new AppException(ErrorCode.NEW_PASSWORD_SAME_AS_OLD_PASSWORD);
        }

        userEntity.setPasswordHash(passwordEncoder.encode(changePasswordRequest.getNewPassword()));
        userRepository.save(userEntity);
    }

    public UserResponse getMyInfo(String username){
        UserEntity userEntity = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));

        return userMapper.toUserResponse(userEntity);
    }
}
