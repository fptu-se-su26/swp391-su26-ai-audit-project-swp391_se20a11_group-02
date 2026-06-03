package com.swp391.coding_platform.config;

import com.swp391.coding_platform.entity.enums.ProblemDifficulty;
import com.swp391.coding_platform.entity.enums.ProblemScope;
import com.swp391.coding_platform.entity.instructor.InstructorEntity;
import com.swp391.coding_platform.entity.problem.*;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.repository.problem.*;
import com.swp391.coding_platform.repository.user.UserRepository;
import com.swp391.coding_platform.repository.instructor.InstructorRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.*;

@Slf4j
@Component
@RequiredArgsConstructor
public class ProblemDataSeeder implements CommandLineRunner {

    private final ProblemRepository problemRepository;
    private final ProblemTagRepository problemTagRepository;
    private final ProblemTagMappingRepository problemTagMappingRepository;
    private final ProblemTestcaseRepository problemTestcaseRepository;
    private final UserRepository userRepository;
    private final InstructorRepository instructorRepository;

    @Override
    public void run(String... args) throws Exception {
        if (problemRepository.count() > 0) {
            log.info("Database already contains problems. Skipping seeder.");
            return;
        }

        log.info("Database is empty of problems. Starting seeder...");

        // 1. Get or create user
        UserEntity user = userRepository.findAll().stream().findFirst().orElseGet(() -> {
            UserEntity newUser = UserEntity.builder()
                    .username("admin_teacher")
                    .passwordHash("$2a$12$e8yQOplZ.pL7c3b/n7U..OshcM6yL3/2w0l/Jb7vGv1Yc7809W9Oq") // bcrypt for 123456
                    .displayname("System Teacher")
                    .email("teacher@nonstopcoding.com")
                    .createdAt(Instant.now())
                    .build();
            return userRepository.save(newUser);
        });

        // 2. Get or create instructor
        InstructorEntity instructor = instructorRepository.findAll().stream().findFirst().orElseGet(() -> {
            InstructorEntity newInstructor = InstructorEntity.builder()
                    .user(user)
                    .fullName("System Teacher")
                    .major("Computer Science")
                    .bio("System generated seeder instructor account.")
                    .createdAt(Instant.now())
                    .build();
            return instructorRepository.save(newInstructor);
        });

        // 3. Create Tags
        ProblemTagEntity arrayTag = getOrCreateTag("Array", "array");
        ProblemTagEntity stringTag = getOrCreateTag("String", "string");
        ProblemTagEntity hashTag = getOrCreateTag("Hash Table", "hash-table");
        ProblemTagEntity mathTag = getOrCreateTag("Math", "math");
        ProblemTagEntity twoPointersTag = getOrCreateTag("Two Pointers", "two-pointers");

        // 4. Create Problems
        // Problem 1: Two Sum
        ProblemEntity twoSum = ProblemEntity.builder()
                .title("Two Sum")
                .description("<p>Given an array of integers <code>nums</code> and an integer <code>target</code>, return indices of the two numbers such that they add up to <code>target</code>.</p><p>You may assume that each input would have <b>exactly one solution</b>, and you may not use the same element twice.</p><p>You can return the answer in any order.</p>")
                .inputDescription("<p>An array of integers <code>nums</code> and an integer <code>target</code>.</p>")
                .outputDescription("<p>Indices of the two numbers that sum to <code>target</code>.</p>")
                .constraints("<p><code>2 <= nums.length <= 10<sup>4</sup></code></p><p><code>-10<sup>9</sup> <= nums[i] <= 10<sup>9</sup></code></p><p><code>-10<sup>9</sup> <= target <= 10<sup>9</sup></code></p><p>Only one valid answer exists.</p>")
                .exampleInput("nums = [2,7,11,15], target = 9")
                .exampleOutput("[0,1]")
                .hint("<p>A really brute force way would be to search for all possible pairs of numbers but that would be slow. Can you think of something faster using a Hash Map?</p>")
                .problemScope(ProblemScope.PRACTICE)
                .difficulty(ProblemDifficulty.EASY)
                .isActive(true)
                .isPublic(true)
                .createdByTeacher(instructor)
                .totalTestcase(3)
                .timeLimitMs(2000)
                .memoryLimitKb(128000)
                .score(new BigDecimal("100.00"))
                .createdAt(Instant.now())
                .updatedAt(Instant.now())
                .build();
        twoSum = problemRepository.save(twoSum);

        createTestcase(twoSum, "2 7 11 15\n9", "0 1", 1);
        createTestcase(twoSum, "3 2 4\n6", "1 2", 2);
        createTestcase(twoSum, "3 3\n6", "0 1", 3);

        createTagMapping(twoSum, arrayTag);
        createTagMapping(twoSum, hashTag);

        // Problem 2: Add Two Numbers
        ProblemEntity addTwoNumbers = ProblemEntity.builder()
                .title("Add Two Numbers")
                .description("<p>You are given two <b>non-empty</b> linked lists representing two non-negative integers. The digits are stored in <b>reverse order</b>, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.</p><p>You may assume the two numbers do not contain any leading zero, except the number 0 itself.</p>")
                .inputDescription("<p>Two linked lists <code>l1</code> and <code>l2</code>.</p>")
                .outputDescription("<p>The sum represented as a linked list.</p>")
                .constraints("<p>The number of nodes in each linked list is in the range <code>[1, 100]</code>.</p><p><code>0 <= Node.val <= 9</code></p>")
                .exampleInput("l1 = [2,4,3], l2 = [5,6,4]")
                .exampleOutput("[7,0,8]")
                .hint("<p>Simulate the addition node by node, keeping track of the carry-over value.</p>")
                .problemScope(ProblemScope.PRACTICE)
                .difficulty(ProblemDifficulty.MEDIUM)
                .isActive(true)
                .isPublic(true)
                .createdByTeacher(instructor)
                .totalTestcase(1)
                .timeLimitMs(2000)
                .memoryLimitKb(128000)
                .score(new BigDecimal("100.00"))
                .createdAt(Instant.now())
                .updatedAt(Instant.now())
                .build();
        addTwoNumbers = problemRepository.save(addTwoNumbers);

        createTestcase(addTwoNumbers, "2 4 3\n5 6 4", "7 0 8", 1);

        createTagMapping(addTwoNumbers, mathTag);

        // Problem 3: Longest Substring Without Repeating Characters
        ProblemEntity longestSubstring = ProblemEntity.builder()
                .title("Longest Substring Without Repeating Characters")
                .description("<p>Given a string <code>s</code>, find the length of the <b>longest substring</b> without repeating characters.</p>")
                .inputDescription("<p>A string <code>s</code>.</p>")
                .outputDescription("<p>The length of the longest substring.</p>")
                .constraints("<p><code>0 <= s.length <= 5 * 10<sup>4</sup></code></p><p><code>s</code> consists of English letters, digits, symbols and spaces.</p>")
                .exampleInput("s = \"abcabcbb\"")
                .exampleOutput("3")
                .hint("<p>Use a sliding window approach with two pointers to keep track of the current substring.</p>")
                .problemScope(ProblemScope.PRACTICE)
                .difficulty(ProblemDifficulty.MEDIUM)
                .isActive(true)
                .isPublic(true)
                .createdByTeacher(instructor)
                .totalTestcase(2)
                .timeLimitMs(2000)
                .memoryLimitKb(128000)
                .score(new BigDecimal("100.00"))
                .createdAt(Instant.now())
                .updatedAt(Instant.now())
                .build();
        longestSubstring = problemRepository.save(longestSubstring);

        createTestcase(longestSubstring, "abcabcbb", "3", 1);
        createTestcase(longestSubstring, "bbbbb", "1", 2);

        createTagMapping(longestSubstring, stringTag);
        createTagMapping(longestSubstring, hashTag);
        createTagMapping(longestSubstring, twoPointersTag);

        // 5. Generate 50 additional problems programmatically
        String[] tagNames = {"Array", "String", "Hash Table", "Math", "Two Pointers", "Dynamic Programming", "Greedy", "Tree", "Graph", "Sorting", "Binary Search", "Stack", "Queue"};
        String[] slugs = {"array", "string", "hash-table", "math", "two-pointers", "dynamic-programming", "greedy", "tree", "graph", "sorting", "binary-search", "stack", "queue"};
        String[] topicChallenges = {
                "Minimum Subarray Sum", "Reverse Substring", "Anagram Pairs", 
                "Factorial Prime Factorization", "Target Sum Triplet", "Optimal Knapsack Selection", 
                "Min Operations Greedy Path", "Binary Tree Path Max", "Shortest Route Cost", 
                "Merge Sorting Arrays", "Range Binary Search", "Valid Parentheses Nesting", 
                "Sliding Window Queue"
        };

        Map<String, ProblemTagEntity> tagMap = new HashMap<>();
        tagMap.put("Array", arrayTag);
        tagMap.put("String", stringTag);
        tagMap.put("Hash Table", hashTag);
        tagMap.put("Math", mathTag);
        tagMap.put("Two Pointers", twoPointersTag);
        
        for (int j = 5; j < tagNames.length; j++) {
            tagMap.put(tagNames[j], getOrCreateTag(tagNames[j], slugs[j]));
        }

        for (int k = 4; k <= 53; k++) {
            ProblemDifficulty difficulty;
            if (k % 3 == 0) {
                difficulty = ProblemDifficulty.EASY;
            } else if (k % 3 == 1) {
                difficulty = ProblemDifficulty.MEDIUM;
            } else {
                difficulty = ProblemDifficulty.HARD;
            }

            int tagIndex = k % tagNames.length;
            String tagName = tagNames[tagIndex];
            ProblemTagEntity tag = tagMap.get(tagName);

            String title = topicChallenges[tagIndex] + " " + (k / 10 + 1);
            String description = "<p>Solve the classic programming challenge related to <b>" + tagName + "</b>.</p>"
                    + "<p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p>"
                    + "<p>Write an efficient algorithm to achieve this.</p>";

            ProblemEntity extraProblem = ProblemEntity.builder()
                    .title(title)
                    .description(description)
                    .inputDescription("<p>Standard input representation of " + tagName + ".</p>")
                    .outputDescription("<p>Optimal result according to the problem statement.</p>")
                    .constraints("<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>")
                    .exampleInput("Input data example " + k)
                    .exampleOutput("Output result example " + k)
                    .hint("<p>Think about using " + tagName + " concepts to optimize your solution.</p>")
                    .problemScope(ProblemScope.PRACTICE)
                    .difficulty(difficulty)
                    .isActive(true)
                    .isPublic(true)
                    .createdByTeacher(instructor)
                    .totalTestcase(2)
                    .timeLimitMs(2000)
                    .memoryLimitKb(128000)
                    .score(new BigDecimal("100.00"))
                    .createdAt(Instant.now())
                    .updatedAt(Instant.now())
                    .build();

            extraProblem = problemRepository.save(extraProblem);

            createTestcase(extraProblem, "Test input 1 for problem " + k, "Expected output 1 for problem " + k, 1);
            createTestcase(extraProblem, "Test input 2 for problem " + k, "Expected output 2 for problem " + k, 2);

            createTagMapping(extraProblem, tag);
        }

        log.info("Problems and testcases successfully seeded!");
    }

    private ProblemTagEntity getOrCreateTag(String name, String slug) {
        return problemTagRepository.findAll().stream()
                .filter(t -> t.getName().equalsIgnoreCase(name))
                .findFirst()
                .orElseGet(() -> problemTagRepository.save(
                        ProblemTagEntity.builder()
                                .name(name)
                                .slug(slug)
                                .createdAt(Instant.now())
                                .updatedAt(Instant.now())
                                .build()
                ));
    }

    private void createTestcase(ProblemEntity problem, String input, String output, int order) {
        problemTestcaseRepository.save(
                ProblemTestcaseEntity.builder()
                        .problem(problem)
                        .inputData(input)
                        .expectedOutput(output)
                        .orderIndex(order)
                        .token(UUID.randomUUID().toString())
                        .build()
        );
    }

    private void createTagMapping(ProblemEntity problem, ProblemTagEntity tag) {
        problemTagMappingRepository.save(
                ProblemTagMappingEntity.builder()
                        .problem(problem)
                        .tag(tag)
                        .build()
        );
    }
}
