package com.swp391.coding_platform.entity.contest;

import com.swp391.coding_platform.entity.enums.ContestStatus;
import com.swp391.coding_platform.entity.enums.FinalizationStatus;
import com.swp391.coding_platform.entity.enums.ScoringRule;
import com.swp391.coding_platform.entity.user.UserEntity;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.math.BigDecimal;
import java.time.Instant;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "contest", schema = "public")
public class ContestEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "created_by", nullable = false)
    UserEntity createdBy;

    @Column(name = "title", nullable = false, length = 255)
    String title;

    @Column(name = "description", columnDefinition = "TEXT")
    String description;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    @Column(name = "scoring_rule")
    ScoringRule scoringRule = ScoringRule.ICPC;

    @Column(name = "password_hash", length = 255)
    String passwordHash;

    @Column(name = "start_time", nullable = false)
    Instant startTime;

    @Column(name = "end_time", nullable = false)
    Instant endTime;

    @Column(name = "durations", nullable = false)
    Integer durations;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    @Column(name = "status", nullable = false)
    ContestStatus status = ContestStatus.DRAFT;

    @Builder.Default
    @Column(name = "created_at", nullable = false, updatable = false)
    Instant createdAt = Instant.now();

    @Builder.Default
    @Column(name = "updated_at", nullable = false)
    Instant updatedAt = Instant.now();

    @Enumerated(EnumType.STRING)
    @Builder.Default
    @Column(name = "finalization_status", nullable = false)
    FinalizationStatus finalizationStatus = FinalizationStatus.PENDING;

    @Column(name = "finalization_started_at")
    Instant finalizationStartedAt;

    @Column(name = "finalized_at")
    Instant finalizedAt;

    @Column(name = "finalization_error", columnDefinition = "TEXT")
    String finalizationError;

    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "final_scoreboard_snapshot", columnDefinition = "jsonb")
    String finalScoreboardSnapshot;

    @Builder.Default
    @Column(name = "reward_1st", precision = 15, scale = 2)
    BigDecimal reward1st = BigDecimal.ZERO;

    @Builder.Default
    @Column(name = "reward_2nd", precision = 15, scale = 2)
    BigDecimal reward2nd = BigDecimal.ZERO;

    @Builder.Default
    @Column(name = "reward_3rd", precision = 15, scale = 2)
    BigDecimal reward3rd = BigDecimal.ZERO;

    @Column(name = "fts_document", columnDefinition = "tsvector", insertable = false, updatable = false)
    String ftsDocument;

}
