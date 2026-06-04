package com.swp391.coding_platform.repository.contest;

import com.swp391.coding_platform.entity.contest.ContestParticipantEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContestParticipantRepository extends JpaRepository<ContestParticipantEntity, Integer> {
}
