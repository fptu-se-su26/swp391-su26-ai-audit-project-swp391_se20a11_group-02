package com.swp391.coding_platform.dto.request;

import lombok.*;
import lombok.experimental.FieldDefaults;
import java.math.BigDecimal;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class InstructorCourseCreateRequest {
    String title;
    String shortDescription;
    String level;
    String topic;
    BigDecimal price;
}
