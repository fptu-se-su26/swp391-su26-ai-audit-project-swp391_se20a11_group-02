package com.swp391.coding_platform.repository.contest;

import com.swp391.coding_platform.entity.contest.ContestProblemEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContestProblemRepository extends JpaRepository<ContestProblemEntity, Integer> {
    boolean existsByContestIdAndProblemId(Integer contestId, Integer problemId);
}
