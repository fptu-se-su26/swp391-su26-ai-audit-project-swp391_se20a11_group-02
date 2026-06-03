package com.swp391.coding_platform.service.problem;

import com.swp391.coding_platform.dto.response.ProblemDescriptionResponse;
import com.swp391.coding_platform.entity.enums.OjVerdict;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionEntity;
import com.swp391.coding_platform.entity.problem.ProblemTagMappingEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
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
public class gitProblemDescriptionService {

    ProblemRepository problemRepository;
    ProblemTagMappingRepository problemTagMappingRepository;
    ProblemSubmissionRepository problemSubmissionRepository;

    public ProblemDescriptionResponse getProblemDescription(Integer id, Long userId) {
        ProblemEntity problem = problemRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.OJ_PROBLEM_NOT_FOUND));

        List<ProblemTagMappingEntity> mappings = problemTagMappingRepository.findByProblemId(id);
        List<String> tags = mappings.stream().map(m -> m.getTag().getName()).toList();

        Map<String, String> templates = generateTemplates(problem.getTitle());

        String status = "unsolved";
        if (userId != null) {
            List<ProblemSubmissionEntity> subs = problemSubmissionRepository.findByUserIdAndProblemId(userId.intValue(), id);
            if (!subs.isEmpty()) {
                boolean solved = subs.stream().anyMatch(s -> s.getVerdict() == OjVerdict.ACCEPTED);
                status = solved ? "solved" : "attempted";
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

        return ProblemDescriptionResponse.builder()
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
                .templates(templates)
                .status(status)
                .acceptance(acceptance)
                .totalSolved(totalSolved)
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
}
