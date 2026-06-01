package com.swp391.coding_platform.mapper;

import com.swp391.coding_platform.dto.request.RegisterRequest;
import com.swp391.coding_platform.dto.response.AuthenticationResponse;
import com.swp391.coding_platform.dto.response.UserResponse;
import com.swp391.coding_platform.entity.auth.RoleEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.Set;
import java.util.stream.Collectors;

@Mapper(componentModel = "spring")
public interface UserMapper {
    @Mapping(target = "accessToken", ignore = true)
    @Mapping(target = "refreshToken", ignore = true)
    @Mapping(target = "balance", ignore = true)
    AuthenticationResponse toAuthenticationResponse(UserEntity userEntity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "passwordHash", ignore = true)
    @Mapping(target = "status", constant = "ACTIVE")
    @Mapping(target = "createdAt", ignore = true)
    @Mapping(target = "roles", ignore = true)
    @Mapping(target = "wallet", ignore = true)
    UserEntity toUserEntity(RegisterRequest registerRequest);

    UserResponse toUserResponse(UserEntity userEntity);

    default Set<String> map(Set<RoleEntity> roles) {
        if (roles == null) {
            return null;
        }
        return roles.stream()
                .map(role -> role.getName().name())
                .collect(Collectors.toSet());
    }
}
