package com.swp391.coding_platform.dto.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;
import lombok.experimental.FieldDefaults;

import jakarta.validation.constraints.PositiveOrZero;
import java.math.BigDecimal;
import java.time.Instant;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AdminContestRequest {

    @NotBlank(message = "Title cannot be blank")
    @Size(max = 255, message = "Title must be less than 255 characters")
    String title;

    String description;

    @NotBlank(message = "Scoring rule cannot be blank")
    String scoringRule; // ICPC, IOI, CUSTOM

    String password; // Plain password, will be encrypted to passwordHash

    @NotNull(message = "Start time cannot be null")
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    Instant startTime;

    @NotNull(message = "End time cannot be null")
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    Instant endTime;

    @PositiveOrZero(message = "Reward for 1st place must be positive or zero")
    @Digits(integer = 13, fraction = 2, message = "Reward for 1st place exceeds maximum limit")
    BigDecimal reward1st;

    @PositiveOrZero(message = "Reward for 2nd place must be positive or zero")
    @Digits(integer = 13, fraction = 2, message = "Reward for 2nd place exceeds maximum limit")
    BigDecimal reward2nd;

    @PositiveOrZero(message = "Reward for 3rd place must be positive or zero")
    @Digits(integer = 13, fraction = 2, message = "Reward for 3rd place exceeds maximum limit")
    BigDecimal reward3rd;
}

