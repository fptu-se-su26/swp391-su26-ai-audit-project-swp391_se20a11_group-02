package com.swp391.coding_platform.service.problem;

import com.swp391.coding_platform.dto.request.CreateCommentRequest;
import com.swp391.coding_platform.dto.request.SubmitRequest;
import com.swp391.coding_platform.dto.response.*;
import com.swp391.coding_platform.entity.enums.OjVerdict;
import com.swp391.coding_platform.entity.enums.ProblemScope;
import com.swp391.coding_platform.entity.problem.*;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.problem.*;
import com.swp391.coding_platform.repository.user.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProblemService {

    ProblemRepository problemRepository;
    ProblemTagRepository problemTagRepository;
    ProblemTagMappingRepository problemTagMappingRepository;
    ProblemSubmissionRepository problemSubmissionRepository;
    ProblemTestcaseRepository problemTestcaseRepository;
    ProblemSubmissionDetailRepository problemSubmissionDetailRepository;
    UserRepository userRepository;
    ProblemCommentRepository problemCommentRepository;

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

    public ProblemDetailResponse getProblemDetail(Integer id, Long userId) {
        ProblemEntity problem = problemRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.OJ_PROBLEM_NOT_FOUND));

        List<ProblemTagMappingEntity> mappings = problemTagMappingRepository.findByProblemId(id);
        List<String> tags = mappings.stream().map(m -> m.getTag().getName()).toList();

        List<ProblemTestcaseEntity> testcases = problemTestcaseRepository.findByProblemIdOrderByOrderIndexAsc(id);
        List<TestcaseResponse> testcaseResponses = testcases.stream().map(tc -> TestcaseResponse.builder()
                .id(tc.getId())
                .inputData(tc.getInputData())
                .expectedOutput(tc.getExpectedOutput())
                .build()).toList();

        Map<String, String> templates = generateTemplates(problem.getTitle());

        String status = "unsolved";
        List<ProblemSubmissionResponse> submissionResponses = new ArrayList<>();
        if (userId != null) {
            List<ProblemSubmissionEntity> subs = problemSubmissionRepository.findByUserIdAndProblemId(userId.intValue(), id);
            if (!subs.isEmpty()) {
                boolean solved = subs.stream().anyMatch(s -> s.getVerdict() == OjVerdict.ACCEPTED);
                status = solved ? "solved" : "attempted";

                List<ProblemSubmissionEntity> sortedSubs = new ArrayList<>(subs);
                sortedSubs.sort((a, b) -> b.getSubmittedAt().compareTo(a.getSubmittedAt()));

                java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter
                        .ofPattern("yyyy-MM-dd HH:mm:ss")
                        .withZone(java.time.ZoneId.systemDefault());

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
            }
        }

        String difficultyStr = "Medium";
        if (problem.getDifficulty() != null) {
            String name = problem.getDifficulty().name();
            difficultyStr = name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
        }

        String acceptance = "0.0%";
        if (problem.getTotalSubmission() != null && problem.getTotalSubmission() > 0) {
            double rate = (problem.getTotalAccepted() * 100.0) / problem.getTotalSubmission();
            acceptance = String.format(Locale.US, "%.1f%%", rate);
        }
        Integer totalSolved = problem.getTotalAccepted() != null ? problem.getTotalAccepted() : 0;

        return ProblemDetailResponse.builder()
                .id(problem.getId())
                .title(problem.getTitle())
                .difficulty(difficultyStr)
                .description(problem.getDescription())
                .inputDescription(problem.getInputDescription())
                .outputDescription(problem.getOutputDescription())
                .constraints(problem.getConstraints())
                .exampleInput(problem.getExampleInput())
                .exampleOutput(problem.getExampleOutput())
                .hint(problem.getHint())
                .tags(tags)
                .testcases(testcaseResponses)
                .templates(templates)
                .status(status)
                .acceptance(acceptance)
                .totalSolved(totalSolved)
                .submissions(submissionResponses)
                .build();
    }

    @Transactional
    public SubmitResponse submitProblem(Integer id, Long userId, SubmitRequest request) {
        if (userId == null) {
            throw new AppException(ErrorCode.UNAUTHENTICATED);
        }

        ProblemEntity problem = problemRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.OJ_PROBLEM_NOT_FOUND));

        UserEntity user = userRepository.findById(userId.intValue())
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));

        List<ProblemTestcaseEntity> testcases = problemTestcaseRepository.findByProblemIdOrderByOrderIndexAsc(id);

        // Convert language string to an arbitrary ID
        int languageId = 1; // Default to Java
        String lang = request.getLanguage() != null ? request.getLanguage().toLowerCase() : "";
        if (lang.contains("python")) {
            languageId = 2;
        } else if (lang.contains("c++") || lang.contains("cpp")) {
            languageId = 3;
        } else if (lang.contains("javascript") || lang.contains("js")) {
            languageId = 4;
        }

        // Mock CPU execution time and memory usage
        double executionTime = 1.0 + Math.random() * 5.0; // 1-6 ms
        int memoryUsed = 40000 + (int) (Math.random() * 5000); // 40-45 MB

        // Create submission
        ProblemSubmissionEntity submission = ProblemSubmissionEntity.builder()
                .problem(problem)
                .user(user)
                .languageId(languageId)
                .sourceCode(request.getSourceCode())
                .executionTime(executionTime)
                .memoryUsed(memoryUsed)
                .score(problem.getScore())
                .submittedAt(Instant.now())
                .verdict(OjVerdict.ACCEPTED) // Standard mock verdict
                .isPlagiarized(false)
                .build();

        problemSubmissionRepository.save(submission);

        // Create submission details for each testcase
        for (ProblemTestcaseEntity tc : testcases) {
            ProblemSubmissionDetailEntity detail = ProblemSubmissionDetailEntity.builder()
                    .submission(submission)
                    .testcase(tc)
                    .token(tc.getToken())
                    .executionTime(executionTime / (testcases.isEmpty() ? 1 : testcases.size()))
                    .memoryUsed(memoryUsed)
                    .verdict(OjVerdict.ACCEPTED)
                    .stdout("Testcase Output: SUCCESS")
                    .stderr("")
                    .compileOutput("Compilation successful")
                    .createdAt(Instant.now())
                    .build();

            problemSubmissionDetailRepository.save(detail);
        }

        // Increment stats on problem
        problem.setTotalSubmission(problem.getTotalSubmission() != null ? problem.getTotalSubmission() + 1 : 1);
        problem.setTotalAccepted(problem.getTotalAccepted() != null ? problem.getTotalAccepted() + 1 : 1);
        problemRepository.save(problem);

        int totalCount = testcases.isEmpty() ? 1 : testcases.size();

        return SubmitResponse.builder()
                .verdict(OjVerdict.ACCEPTED.name())
                .runtime(executionTime)
                .memory(memoryUsed)
                .passedTestcases(totalCount)
                .totalTestcases(totalCount)
                .build();
    }

    private Map<String, String> generateTemplates(String title) {
        Map<String, String> templates = new HashMap<>();
        String cleanTitle = title != null ? title.trim().toLowerCase() : "";

        if (cleanTitle.contains("two sum")) {
            templates.put("Java", "class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        // Write your code here\n        return new int[0];\n    }\n}");
            templates.put("Python 3", "class Solution:\n    def twoSum(self, nums: List[int], target: int) -> List[int]:\n        # Write your code here\n        return []");
            templates.put("C++", "class Solution {\npublic:\n    vector<int> twoSum(vector<int>& nums, int target) {\n        // Write your code here\n        return {};\n    }\n};");
            templates.put("JavaScript", "var twoSum = function(nums, target) {\n    // Write your code here\n    return [];\n};");
        } else if (cleanTitle.contains("add two numbers")) {
            templates.put("Java", "class Solution {\n    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {\n        // Write your code here\n        return null;\n    }\n}");
            templates.put("Python 3", "class Solution:\n    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:\n        # Write your code here\n        return None");
            templates.put("C++", "class Solution {\npublic:\n    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {\n        // Write your code here\n        return nullptr;\n    }\n};");
            templates.put("JavaScript", "var addTwoNumbers = function(l1, l2) {\n    // Write your code here\n    return null;\n};");
        } else if (cleanTitle.contains("longest substring")) {
            templates.put("Java", "class Solution {\n    public int lengthOfLongestSubstring(String s) {\n        // Write your code here\n        return 0;\n    }\n}");
            templates.put("Python 3", "class Solution:\n    def lengthOfLongestSubstring(self, s: str) -> int:\n        # Write your code here\n        return 0");
            templates.put("C++", "class Solution {\npublic:\n    int lengthOfLongestSubstring(string s) {\n        // Write your code here\n        return 0;\n    }\n};");
            templates.put("JavaScript", "var lengthOfLongestSubstring = function(s) {\n    // Write your code here\n    return 0;\n};");
        } else {
            templates.put("Java", "class Solution {\n    public void solve() {\n        // Write your code here\n    }\n}");
            templates.put("Python 3", "class Solution:\n    def solve(self):\n        # Write your code here\n        pass");
            templates.put("C++", "class Solution {\npublic:\n    void solve() {\n        // Write your code here\n    }\n};");
            templates.put("JavaScript", "var solve = function() {\n    // Write your code here\n};");
        }
        return templates;
    }

    public List<ProblemCommentResponse> getComments(Integer problemId) {
        List<ProblemCommentEntity> topComments = problemCommentRepository.findByProblemIdAndParentIsNullOrderByCreatedAtDesc(problemId);
        return topComments.stream().map(this::mapCommentToResponse).toList();
    }

    @Transactional
    public ProblemCommentResponse addComment(Integer problemId, Long userId, CreateCommentRequest request) {
        if (userId == null) {
            throw new AppException(ErrorCode.UNAUTHENTICATED);
        }

        ProblemEntity problem = problemRepository.findById(problemId)
                .orElseThrow(() -> new AppException(ErrorCode.OJ_PROBLEM_NOT_FOUND));

        UserEntity user = userRepository.findById(userId.intValue())
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));

        ProblemCommentEntity parent = null;
        if (request.getParentId() != null) {
            parent = problemCommentRepository.findById(request.getParentId())
                    .orElseThrow(() -> new IllegalArgumentException("Parent comment not found"));
        }

        ProblemCommentEntity comment = ProblemCommentEntity.builder()
                .problem(problem)
                .user(user)
                .content(request.getContent())
                .parent(parent)
                .createdAt(Instant.now())
                .build();

        problemCommentRepository.save(comment);

        return mapCommentToResponse(comment);
    }

    private ProblemCommentResponse mapCommentToResponse(ProblemCommentEntity entity) {
        String author = entity.getUser().getDisplayname() != null ? entity.getUser().getDisplayname() : entity.getUser().getUsername();
        
        String initials = "";
        if (author != null && !author.isBlank()) {
            String[] parts = author.trim().split("\\s+");
            if (parts.length >= 2) {
                initials = (parts[0].substring(0, 1) + parts[parts.length - 1].substring(0, 1)).toUpperCase();
            } else if (parts[0].length() >= 2) {
                initials = parts[0].substring(0, 2).toUpperCase();
            } else {
                initials = parts[0].substring(0, 1).toUpperCase();
            }
        } else {
            initials = "ME";
        }

        String[] bgClasses = {"bg-brand-blue", "bg-brand-green", "bg-orange-500", "bg-purple-500", "bg-red-500", "bg-teal-500"};
        int idx = Math.abs(entity.getUser().getId().hashCode()) % bgClasses.length;
        String avatarBg = bgClasses[idx];

        List<ProblemCommentResponse> replies = entity.getReplies() != null ?
                entity.getReplies().stream().map(this::mapCommentToResponse).toList() : Collections.emptyList();

        return ProblemCommentResponse.builder()
                .id(entity.getId())
                .author(author)
                .avatarInitials(initials)
                .avatarBg(avatarBg)
                .text(entity.getContent())
                .time(formatTimeAgo(entity.getCreatedAt()))
                .createdAt(entity.getCreatedAt())
                .parentId(entity.getParent() != null ? entity.getParent().getId() : null)
                .replies(replies)
                .build();
    }

    private String formatTimeAgo(Instant instant) {
        if (instant == null) return "";
        long seconds = java.time.Duration.between(instant, Instant.now()).getSeconds();
        if (seconds < 60) return "Just now";
        long minutes = seconds / 60;
        if (minutes < 60) return minutes + " " + (minutes == 1 ? "minute" : "minutes") + " ago";
        long hours = minutes / 60;
        if (hours < 24) return hours + " " + (hours == 1 ? "hour" : "hours") + " ago";
        long days = hours / 24;
        return days + " " + (days == 1 ? "day" : "days") + " ago";
    }
}
