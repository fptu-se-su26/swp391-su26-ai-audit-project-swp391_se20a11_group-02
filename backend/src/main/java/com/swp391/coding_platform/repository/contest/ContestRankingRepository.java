package com.swp391.coding_platform.repository.contest;

import com.swp391.coding_platform.entity.contest.ContestRankingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ContestRankingRepository extends JpaRepository<ContestRankingEntity, Integer> {

    @Query("SELECT r FROM ContestRankingEntity r WHERE r.contest.id = :contestId AND r.user.id = :userId")
    Optional<ContestRankingEntity> findByContestIdAndUserId(
            @Param("contestId") Integer contestId,
            @Param("userId") Integer userId);
}
