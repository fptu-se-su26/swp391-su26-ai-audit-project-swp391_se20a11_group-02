package com.swp391.coding_platform.repository.contest;

import com.swp391.coding_platform.entity.contest.ContestEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContestRepository extends JpaRepository<ContestEntity, Integer> {
}
