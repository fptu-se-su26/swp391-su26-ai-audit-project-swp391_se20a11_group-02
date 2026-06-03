package com.swp391.coding_platform.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProblemDetailResponse {
    Integer id;
    String title;
    String difficulty;
    String description;
    String inputDescription;
    String outputDescription;
    String constraints;
    String exampleInput;
    String exampleOutput;
    String hint;
    List<String> tags;
    List<TestcaseResponse> testcases;
    Map<String, String> templates;
    String status;
    String acceptance;
    Integer totalSolved;
    List<ProblemSubmissionResponse> submissions;
}
