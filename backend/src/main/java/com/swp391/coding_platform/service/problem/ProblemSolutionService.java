package com.swp391.coding_platform.service.problem;

import com.swp391.coding_platform.dto.response.ProblemSolutionResponse;
import com.swp391.coding_platform.entity.enums.OjVerdict;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.problem.ProblemRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProblemSolutionService {

    ProblemRepository problemRepository;
    ProblemSubmissionRepository problemSubmissionRepository;

    public ProblemSolutionResponse getProblemSolution(Integer id, Long userId) {
        if (userId == null) {
            throw new AppException(ErrorCode.UNAUTHENTICATED);
        }

        ProblemEntity problem = problemRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.OJ_PROBLEM_NOT_FOUND));

        // Check if the user has solved this problem
        List<ProblemSubmissionEntity> submissions = problemSubmissionRepository.findByUserIdAndProblemId(userId.intValue(), id);
        boolean solved = submissions.stream().anyMatch(s -> s.getVerdict() == OjVerdict.ACCEPTED);

        if (!solved) {
            throw new AppException(ErrorCode.OJ_SOLUTION_LOCKED);
        }

        String solutionCode = problem.getSolutions();
        if (solutionCode == null || solutionCode.isBlank()) {
            solutionCode = "// An official solution for this problem is not available yet.";
        }

        return ProblemSolutionResponse.builder()
                .problemId(problem.getId())
                .title(problem.getTitle())
                .solutionCode(solutionCode)
                .build();
    }
}
