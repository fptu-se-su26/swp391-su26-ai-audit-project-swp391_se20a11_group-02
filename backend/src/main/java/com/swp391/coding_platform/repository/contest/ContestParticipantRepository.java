package com.swp391.coding_platform.repository.contest;

import com.swp391.coding_platform.entity.contest.ContestParticipantEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@Repository
public interface ContestParticipantRepository extends JpaRepository<ContestParticipantEntity, Integer> {
    @Query("SELECT COUNT(cp) > 0 FROM ContestParticipantEntity cp " +
           "WHERE cp.user.id = :userId AND cp.contest.id IN " +
           "(SELECT cprob.contest.id FROM ContestProblemEntity cprob WHERE cprob.problem.id = :problemId)")
    boolean isUserParticipantOfProblemContest(@Param("userId") Integer userId, @Param("problemId") Integer problemId);
}
