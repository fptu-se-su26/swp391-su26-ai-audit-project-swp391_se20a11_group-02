package com.swp391.coding_platform.repository.problem;

import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.enums.ProblemScope;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;

@Repository
public interface ProblemRepository extends JpaRepository<ProblemEntity, Integer>, JpaSpecificationExecutor<ProblemEntity> {
    List<ProblemEntity> findByProblemScopeInAndIsActiveTrue(Collection<ProblemScope> scopes);
}
