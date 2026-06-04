package com.swp391.coding_platform.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProblemCommentResponse {
    Integer id;
    String author;
    String avatarInitials;
    String avatarBg;
    String text;
    String time;
    Instant createdAt;
    Integer parentId;
    List<ProblemCommentResponse> replies;
}
