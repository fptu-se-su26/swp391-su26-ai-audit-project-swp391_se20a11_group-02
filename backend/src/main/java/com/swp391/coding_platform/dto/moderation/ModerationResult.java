package com.swp391.coding_platform.dto.moderation;

import lombok.*;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ModerationResult {
    private Double qualityScore;      // Điểm chất lượng (0.00 -> 1.00)
    private Double riskScore;         // Điểm rủi ro (0.00 -> 1.00)
    private Double confidenceScore;   // Điểm tin cậy (0.00 -> 1.00)
    private List<String> flaggedCategories; // Danh mục vi phạm chính sách
    private String reasons;           // Lý giải chi tiết từ LLM
    private String recommendedAction; // Hành động kiến nghị: APPROVE, REJECT, REVIEW
}
