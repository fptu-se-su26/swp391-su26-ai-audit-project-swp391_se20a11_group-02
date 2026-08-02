package com.swp391.coding_platform.repository.problem;

import com.swp391.coding_platform.entity.problem.ProblemTagMappingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProblemTagMappingRepository extends JpaRepository<ProblemTagMappingEntity, Integer> {
    List<ProblemTagMappingEntity> findByProblemId(Integer problemId);
    List<ProblemTagMappingEntity> findByProblemIdIn(List<Integer> problemIds);

    @Modifying
    @Query("DELETE FROM ProblemTagMappingEntity m WHERE m.problem.id = :problemId")
    void deleteByProblemId(@Param("problemId") Integer problemId);
}
