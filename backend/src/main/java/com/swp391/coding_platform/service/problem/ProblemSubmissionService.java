package com.swp391.coding_platform.service.problem;

import com.swp391.coding_platform.dto.request.SubmitRequest;
import com.swp391.coding_platform.dto.response.ProblemSubmissionResponse;
import com.swp391.coding_platform.dto.response.SubmitResponse;
import com.swp391.coding_platform.entity.enums.OjVerdict;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionDetailEntity;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionEntity;
import com.swp391.coding_platform.entity.problem.ProblemTestcaseEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.problem.ProblemRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionDetailRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import com.swp391.coding_platform.repository.problem.ProblemTestcaseRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProblemSubmissionService {

    ProblemRepository problemRepository;
    UserRepository userRepository;
    ProblemSubmissionRepository problemSubmissionRepository;
    ProblemTestcaseRepository problemTestcaseRepository;
    ProblemSubmissionDetailRepository problemSubmissionDetailRepository;

//    @Transactional
//    public SubmitResponse submitProblem(Integer id, Long userId, SubmitRequest request) {
//        if (userId == null) {
//            throw new AppException(ErrorCode.UNAUTHENTICATED);
//        }
//
//        ProblemEntity problem = problemRepository.findById(id)
//                .orElseThrow(() -> new AppException(ErrorCode.OJ_PROBLEM_NOT_FOUND));
//
//        UserEntity user = userRepository.findById(userId.intValue())
//                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));
//
//        List<ProblemTestcaseEntity> testcases = problemTestcaseRepository.findByProblemIdOrderByOrderIndexAsc(id);
//
//        int languageId = 1; // Default to Java
//        String lang = request.getLanguage() != null ? request.getLanguage().toLowerCase() : "";
//        if (lang.contains("python")) {
//            languageId = 2;
//        } else if (lang.contains("c++") || lang.contains("cpp")) {
//            languageId = 3;
//        } else if (lang.contains("javascript") || lang.contains("js")) {
//            languageId = 4;
//        }
//
//        double executionTime = 1.0 + Math.random() * 5.0; // 1-6 ms
//        int memoryUsed = 40000 + (int) (Math.random() * 5000); // 40-45 MB
//
//        ProblemSubmissionEntity submission = ProblemSubmissionEntity.builder()
//                .problem(problem)
//                .user(user)
//                .languageId(languageId)
//                .sourceCode(request.getSourceCode())
//                .executionTime(executionTime)
//                .memoryUsed(memoryUsed)
//                .score(problem.getScore())
//                .submittedAt(Instant.now())
//                .verdict(OjVerdict.ACCEPTED)
//                .isPlagiarized(false)
//                .build();
//
//        problemSubmissionRepository.save(submission);
//
//        for (ProblemTestcaseEntity tc : testcases) {
//            ProblemSubmissionDetailEntity detail = ProblemSubmissionDetailEntity.builder()
//                    .submission(submission)
//                    .testcase(tc)
//                    .token(tc.getToken())
//                    .executionTime(executionTime / (testcases.isEmpty() ? 1 : testcases.size()))
//                    .memoryUsed(memoryUsed)
//                    .verdict(OjVerdict.ACCEPTED)
//                    .stdout("Testcase Output: SUCCESS")
//                    .stderr("")
//                    .compileOutput("Compilation successful")
//                    .createdAt(Instant.now())
//                    .build();
//
//            problemSubmissionDetailRepository.save(detail);
//        }
//
//        problem.setTotalSubmission(problem.getTotalSubmission() != null ? problem.getTotalSubmission() + 1 : 1);
//        problem.setTotalAccepted(problem.getTotalAccepted() != null ? problem.getTotalAccepted() + 1 : 1);
//        problemRepository.save(problem);
//
//        int totalCount = testcases.isEmpty() ? 1 : testcases.size();
//
//        return SubmitResponse.builder()
//                .verdict(OjVerdict.ACCEPTED.name())
//                .runtime(executionTime)
//                .memory(memoryUsed)
//                .passedTestcases(totalCount)
//                .totalTestcases(totalCount)
//                .build();
//    }

    public List<ProblemSubmissionResponse> getSubmissions(Integer problemId, Long userId) {
        if (userId == null) {
            return Collections.emptyList();
        }

        List<ProblemSubmissionEntity> subs = problemSubmissionRepository.findByUserIdAndProblemId(userId.intValue(), problemId);
        if (subs.isEmpty()) {
            return Collections.emptyList();
        }

        List<ProblemSubmissionEntity> sortedSubs = new ArrayList<>(subs);
        sortedSubs.sort((a, b) -> b.getSubmittedAt().compareTo(a.getSubmittedAt()));

        DateTimeFormatter formatter = DateTimeFormatter
                .ofPattern("yyyy-MM-dd HH:mm:ss")
                .withZone(java.time.ZoneId.systemDefault());

        List<ProblemSubmissionResponse> submissionResponses = new ArrayList<>();

        for (ProblemSubmissionEntity s : sortedSubs) {
            String subStatus = s.getVerdict() == OjVerdict.ACCEPTED ? "Accepted" : s.getVerdict().name().replace("_", " ");
            subStatus = Arrays.stream(subStatus.split(" "))
                    .map(word -> word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase())
                    .collect(Collectors.joining(" "));

            String langStr = "Java";
            if (s.getLanguageId() == 2) langStr = "Python 3";
            else if (s.getLanguageId() == 3) langStr = "C++";
            else if (s.getLanguageId() == 4) langStr = "JavaScript";

            String runtimeStr = s.getExecutionTime() != null ? String.format(Locale.US, "%.1f ms", s.getExecutionTime()) : "N/A";
            String memoryStr = s.getMemoryUsed() != null ? String.format(Locale.US, "%.1f MB", s.getMemoryUsed() / 1024.0) : "N/A";
            String timeStr = formatter.format(s.getSubmittedAt());
            String statusClass = s.getVerdict() == OjVerdict.ACCEPTED ? "text-brand-green" : "text-red-600";

            submissionResponses.add(ProblemSubmissionResponse.builder()
                    .status(subStatus)
                    .lang(langStr)
                    .runtime(runtimeStr)
                    .memory(memoryStr)
                    .time(timeStr)
                    .statusClass(statusClass)
                    .build());
        }

        return submissionResponses;
    }
}
