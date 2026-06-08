package com.swp391.coding_platform.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class InstructorApplicationResponse {
    Integer id;
    Integer userId;
    String fullName;
    String email;
    String cvUrl;
    String introduction;
    String status;
    String adminNote;
    Integer aiScore;
    String aiSummary;
    Instant createdAt;
}
