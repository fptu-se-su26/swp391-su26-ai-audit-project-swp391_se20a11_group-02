package com.swp391.coding_platform.service.problem;

import com.swp391.coding_platform.dto.response.ProblemListItemResponse;
import com.swp391.coding_platform.entity.enums.OjVerdict;
import com.swp391.coding_platform.entity.enums.ProblemScope;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionEntity;
import com.swp391.coding_platform.entity.problem.ProblemTagMappingEntity;
import com.swp391.coding_platform.repository.problem.ProblemRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import com.swp391.coding_platform.repository.problem.ProblemTagMappingRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProblemService {

    ProblemRepository problemRepository;
    ProblemTagMappingRepository problemTagMappingRepository;
    ProblemSubmissionRepository problemSubmissionRepository;

    public List<ProblemListItemResponse> getProblems(Long userId) {
        List<ProblemEntity> problems = problemRepository.findByProblemScopeInAndIsActiveTrue(
                List.of(ProblemScope.PRACTICE, ProblemScope.SHARED)
        );

        if (problems.isEmpty()) {
            return Collections.emptyList();
        }

        List<Integer> problemIds = problems.stream().map(ProblemEntity::getId).toList();

        // Load mappings to avoid N+1
        List<ProblemTagMappingEntity> mappings = problemTagMappingRepository.findByProblemIdIn(problemIds);
        Map<Integer, List<String>> tagsByProblemId = mappings.stream()
                .collect(Collectors.groupingBy(
                        m -> m.getProblem().getId(),
                        Collectors.mapping(m -> m.getTag().getName(), Collectors.toList())
                ));

        // Load submissions if user is logged in
        Map<Integer, List<ProblemSubmissionEntity>> submissionsByProblemId = new HashMap<>();
        if (userId != null) {
            List<ProblemSubmissionEntity> userSubmissions = problemSubmissionRepository.findByUserIdAndProblemIdIn(
                    userId.intValue(), problemIds
            );
            submissionsByProblemId = userSubmissions.stream()
                    .collect(Collectors.groupingBy(s -> s.getProblem().getId()));
        }

        final Map<Integer, List<ProblemSubmissionEntity>> finalSubmissions = submissionsByProblemId;

        return problems.stream().map(problem -> {
            List<String> tags = tagsByProblemId.getOrDefault(problem.getId(), Collections.emptyList());

            String acceptance = "0.0%";
            if (problem.getTotalSubmission() != null && problem.getTotalSubmission() > 0) {
                double rate = (problem.getTotalAccepted() * 100.0) / problem.getTotalSubmission();
                acceptance = String.format(Locale.US, "%.1f%%", rate);
            }

            String status = "unsolved";
            List<ProblemSubmissionEntity> subs = finalSubmissions.getOrDefault(problem.getId(), Collections.emptyList());
            if (!subs.isEmpty()) {
                boolean solved = subs.stream().anyMatch(s -> s.getVerdict() == OjVerdict.ACCEPTED);
                status = solved ? "solved" : "attempted";
            }

            String difficultyStr = "Medium";
            if (problem.getDifficulty() != null) {
                String name = problem.getDifficulty().name();
                difficultyStr = name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
            }

            return ProblemListItemResponse.builder()
                    .id(problem.getId())
                    .title(problem.getTitle())
                    .difficulty(difficultyStr)
                    .tags(tags)
                    .score(problem.getScore() != null ? problem.getScore().intValue() : 0)
                    .acceptance(acceptance)
                    .totalSolved(problem.getTotalAccepted() != null ? problem.getTotalAccepted() : 0)
                    .status(status)
                    .build();
        }).toList();
    }
}
