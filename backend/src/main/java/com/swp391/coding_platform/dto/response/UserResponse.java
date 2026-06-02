package com.swp391.coding_platform.dto.response;

import com.swp391.coding_platform.entity.enums.UserStatus;
import lombok.*;
import lombok.experimental.FieldDefaults;
import java.time.Instant;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserResponse {
    Integer id;
    String username;
    String displayname;
    String avatarurl;
    String email;
    Instant createdAt;
    UserStatus status;
    Set<String> roles;
}
