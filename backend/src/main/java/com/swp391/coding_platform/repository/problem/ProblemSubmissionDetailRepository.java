package com.swp391.coding_platform.repository.problem;

import com.swp391.coding_platform.entity.problem.ProblemSubmissionDetailEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProblemSubmissionDetailRepository extends JpaRepository<ProblemSubmissionDetailEntity, Integer> {
    List<ProblemSubmissionDetailEntity> findBySubmissionId(Integer submissionId);
}
