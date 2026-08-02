package com.swp391.coding_platform.repository.contest;

import com.swp391.coding_platform.entity.contest.ContestWinnerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContestWinnerRepository extends JpaRepository<ContestWinnerEntity, Integer> {
    List<ContestWinnerEntity> findByContestId(Integer contestId);

    List<ContestWinnerEntity> findByUserId(Integer userId);

    boolean existsByContestIdAndUserId(Integer contestId, Integer userId);
}
