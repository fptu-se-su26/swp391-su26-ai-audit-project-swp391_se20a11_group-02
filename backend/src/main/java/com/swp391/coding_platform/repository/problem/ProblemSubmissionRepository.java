package com.swp391.coding_platform.repository.problem;

import com.swp391.coding_platform.entity.problem.ProblemSubmissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Repository
public interface ProblemSubmissionRepository extends JpaRepository<ProblemSubmissionEntity, Integer> {
    List<ProblemSubmissionEntity> findByUserIdAndProblemId(Integer userId, Integer problemId);
    List<ProblemSubmissionEntity> findByUserId(Integer userId);
    List<ProblemSubmissionEntity> findByUserIdAndProblemIdIn(Integer userId, List<Integer> problemIds);

    @Query("SELECT p FROM ProblemSubmissionEntity p JOIN FETCH p.problem WHERE p.user.id = :userId ORDER BY p.submittedAt DESC")
    List<ProblemSubmissionEntity> findSubmissionsWithProblemByUserId(@Param("userId") Integer userId);
}
