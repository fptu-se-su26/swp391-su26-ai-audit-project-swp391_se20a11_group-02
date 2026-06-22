package com.swp391.coding_platform.entity.course;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import java.time.Instant;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "course_moderation_reports", schema = "public")
public class CourseModerationReportEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(name = "course_id", nullable = false, unique = true)
    Long courseId;

    @Column(name = "quality_score", nullable = false)
    Double qualityScore;

    @Column(name = "risk_score", nullable = false)
    Double riskScore;

    @Column(name = "confidence_score", nullable = false)
    Double confidenceScore;

    @Column(name = "needs_admin_review", nullable = false)
    Boolean needsAdminReview;

    // Sử dụng ElementCollection để lưu danh sách các danh mục vi phạm dạng String trong DB
    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(
        name = "course_moderation_flagged_categories",
        joinColumns = @JoinColumn(name = "report_id")
    )
    @Column(name = "category")
    List<String> flaggedCategories;

    @Column(name = "reasons", nullable = false, columnDefinition = "TEXT")
    String reasons;

    @Column(name = "error_log", columnDefinition = "TEXT")
    String errorLog;

    @Builder.Default
    @Column(name = "created_at", nullable = false, updatable = false)
    Instant createdAt = Instant.now();

    @Builder.Default
    @Column(name = "updated_at", nullable = false)
    Instant updatedAt = Instant.now();

    @PreUpdate
    public void onUpdate() {
        this.updatedAt = Instant.now();
    }
}
