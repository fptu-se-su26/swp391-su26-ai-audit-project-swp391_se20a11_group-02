package com.swp391.coding_platform.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class InstructorApplyRequest {

    @NotBlank(message = "CV URL cannot be blank")
    String cvUrl;

    @NotBlank(message = "Introduction cannot be blank")
    String introduction;
}
