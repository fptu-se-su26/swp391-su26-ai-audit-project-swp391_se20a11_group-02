package com.swp391.coding_platform.repository.contest;

import com.swp391.coding_platform.entity.contest.ContestProblemAttemptEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContestProblemAttemptRepository extends JpaRepository<ContestProblemAttemptEntity, Integer> {

    @Query("SELECT a FROM ContestProblemAttemptEntity a WHERE a.contest.id = :contestId AND a.user.username = :username")
    List<ContestProblemAttemptEntity> findByContestIdAndUsername(@Param("contestId") Integer contestId, @Param("username") String username);
}
