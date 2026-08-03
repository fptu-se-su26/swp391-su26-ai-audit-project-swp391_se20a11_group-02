package com.swp391.coding_platform.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;
import java.time.Instant;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ContestResponse {
    Integer id;
    String title;
    String description;
    String scoringRule;
    Instant startTime;
    Instant endTime;
    Integer durations;
    String status; // UPCOMING, ONGOING, ENDED
    String creatorName;
    Boolean isPrivate;
    Integer participantCount;
    Integer problemCount;
    Boolean isUserRegistered;
    java.math.BigDecimal reward1st;
    java.math.BigDecimal reward2nd;
    java.math.BigDecimal reward3rd;
}
