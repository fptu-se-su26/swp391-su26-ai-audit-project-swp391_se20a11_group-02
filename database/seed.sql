-- non-stopcoding seed database script
-- Phục vụ mục đích kiểm thử toàn diện hệ thống (mật khẩu mặc định là '123' cho tất cả tài khoản)

-- 1. Insert Roles (Nếu chưa có)
INSERT INTO public.roles (id, name) VALUES 
(1, 'ADMIN'), 
(2, 'INSTRUCTOR'), 
(3, 'USER')
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Users (Mật khẩu mặc định là '123')
INSERT INTO public.users (id, username, password_hash, displayname, avatarurl, email, created_at, status, score) VALUES
(1, 'admin', '$2a$10$lb2FHmZtTv.m1XvlmSp3..DzsoqS6sJrjcFvqaRBM5O3cXMpQxaAK', 'Super Admin', 'https://ui-avatars.com/api/?name=Admin&background=12284C&color=fff', 'admin@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(2, 'Ngphuong', '$2a$10$lb2FHmZtTv.m1XvlmSp3..DzsoqS6sJrjcFvqaRBM5O3cXMpQxaAK', 'Ngphuong Admin', 'https://ui-avatars.com/api/?name=Ngphuong&background=12284C&color=fff', 'ngphuong@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(3, 'instructor1', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Dr. Jenkins', 'https://ui-avatars.com/api/?name=Jenkins&background=F36F21&color=fff', 'instructor1@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(4, 'instructor2', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Prof. Smith', 'https://ui-avatars.com/api/?name=Smith&background=10B981&color=fff', 'instructor2@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(5, 'student1', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Student One', 'https://ui-avatars.com/api/?name=Student+One&background=10B981&color=fff', 'student1@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 350),
(6, 'student2', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Alice Johnson', 'https://ui-avatars.com/api/?name=Alice+Johnson&background=3b82f6&color=fff', 'student2@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 520),
(7, 'student3', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Bob Miller', 'https://ui-avatars.com/api/?name=Bob+Miller&background=ec4899&color=fff', 'student3@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 280),
(8, 'student4', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Charlie Brown', 'https://ui-avatars.com/api/?name=Charlie&background=f59e0b&color=fff', 'student4@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 100),
(9, 'student5', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Diana Prince', 'https://ui-avatars.com/api/?name=Diana&background=8b5cf6&color=fff', 'student5@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 50),
(10, 'student6', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Evan Wright', 'https://ui-avatars.com/api/?name=Evan&background=ec4899&color=fff', 'student6@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0)
ON CONFLICT (id) DO NOTHING;

-- 3. Link User Roles
INSERT INTO public.user_roles (user_id, role_id) VALUES
(1, 1), -- admin -> ADMIN
(2, 1), -- Ngphuong -> ADMIN
(3, 2), -- instructor1 -> INSTRUCTOR
(4, 2), -- instructor2 -> INSTRUCTOR
(5, 3), -- student1 -> USER
(6, 3), -- student2 -> USER
(7, 3), -- student3 -> USER
(8, 3), -- student4 -> USER
(9, 3), -- student5 -> USER
(10, 3) -- student6 -> USER
ON CONFLICT (user_id, role_id) DO NOTHING;

-- 4. Insert Wallets
INSERT INTO public.wallets (id, user_id, balance, status, updated_at) VALUES
(1, 1, 10000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(2, 2, 10000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(3, 3, 5000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(4, 4, 4500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(5, 5, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(6, 6, 3000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(7, 7, 1200000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(8, 8, 800000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(9, 9, 150000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(10, 10, 0.00, 'ACTIVE', CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 5. Insert Instructors
INSERT INTO public.instructors (id, user_id, full_name, major, bio, created_at, status, hired_by_admin) VALUES
(1, 3, 'Dr. Jenkins', 'Software Engineering', 'PhD in Computer Science with over 15 years of industry experience in enterprise software architecting.', CURRENT_TIMESTAMP, 'ACTIVE', true),
(2, 4, 'Prof. Smith', 'Data Science & Databases', 'Author of multiple research papers in query optimization and machine learning algorithms.', CURRENT_TIMESTAMP, 'ACTIVE', true)
ON CONFLICT (id) DO NOTHING;

-- 6. Insert Categories
INSERT INTO public.categories (id, name, description, created_at, updated_at) VALUES
(1, 'Computer Science', 'Fundamentals of Algorithms, Data Structures and Programming Paradigms.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Web Development', 'Full-stack web technologies including React, Spring Boot, Node.js.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Databases & SQL', 'Relational algebra, SQL programming, performance tuning, and schema design.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 7. Insert Courses
INSERT INTO public.courses (id, instructor_id, title, thumbnail_url, short_description, long_description, what_you_learn, price, type, average_rating, total_reviews, total_enrolled, created_at, updated_at, total_lessons, total_quizzes, total_videos, status) VALUES
(1, 1, 'React Full-Stack Development', 'https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=500&auto=format&fit=crop&q=60', 'Learn full-stack web development with React and Spring Boot.', 'This course guides you step by step through creating a fully functional web app from scratch, handling both frontend UI and backend services.', 'Create single page apps; Deploy backend services; Integrate state management;', 499000.00, 'PRO', 4.8, 2, 150, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 1, 3, 'APPROVED'),
(2, 1, 'Java Algorithms & Data Structures', 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=500&auto=format&fit=crop&q=60', 'Master sorting, searching, trees, and dynamic programming in Java.', 'A comprehensive guide to coding interview preparation, master algorithms, complex data structures, and solve problems like a pro.', 'Understand big-O notation; Implement binary trees; Master recursion;', 599000.00, 'PRO', 5.0, 1, 200, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 1, 3, 'APPROVED'),
(3, 2, 'Database Systems & PostgreSQL', 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d?w=500&auto=format&fit=crop&q=60', 'Master SQL queries, indexes, normalization, and database optimization.', 'Learn PostgreSQL starting from zero up to advanced query tuning, transactions, locks, and system architecture design.', 'Write advanced SQL queries; Design relational schemas; Tune index performance;', 399000.00, 'PRO', 0.0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 0, 1, 'APPROVED')
ON CONFLICT (id) DO NOTHING;

-- 8. Course Category Mapping
INSERT INTO public.course_category_mappings (id, course_id, category_id) VALUES
(1, 1, 2), -- React Course -> Web Development
(2, 2, 1), -- Java Course -> CS
(3, 3, 3)  -- DB Course -> Databases
ON CONFLICT (id) DO NOTHING;

-- 9. Insert Chapters
INSERT INTO public.chapters (id, course_id, title, order_index, created_at, updated_at) VALUES
(1, 1, 'Chapter 1: Getting Started', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Chapter 2: Backend Integration', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 2, 'Chapter 1: Recursion & Sorting', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 2, 'Chapter 2: Tree Structures', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 3, 'Chapter 1: Relational Basics', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 10. Insert Lessons
INSERT INTO public.lessons (id, chapter_id, title, theory_content, video_url, source_code, is_trial, order_index, created_at, updated_at) VALUES
(1, 1, '1.1 Introduction to React', 'React is a library for building composable user interfaces...', 'https://www.w3schools.com/html/mov_bbb.mp4', 'console.log("Hello React");', true, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, '1.2 JSX and Components', 'Components let you split the UI into independent, reusable pieces...', 'https://www.w3schools.com/html/mov_bbb.mp4', 'const App = () => <h1>Hello Component</h1>;', false, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 2, '2.1 Spring REST Integration', 'REST APIs allow frontend client application to communicate with backend...', 'https://www.w3schools.com/html/mov_bbb.mp4', '// Spring controllers code', false, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 3, '1.1 Intro to Recursion', 'Recursion is a method of solving problems where the solution depends on solutions to smaller instances...', 'https://www.w3schools.com/html/mov_bbb.mp4', 'public int factorial(int n) { return n <= 1 ? 1 : n * factorial(n-1); }', true, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 3, '1.2 Quick Sort Algorithm', 'Quick Sort is a divide-and-conquer algorithm that selects a pivot...', 'https://www.w3schools.com/html/mov_bbb.mp4', '// Quick Sort code', false, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 4, '2.1 Binary Tree Traversal', 'Binary trees can be traversed in pre-order, in-order, and post-order...', 'https://www.w3schools.com/html/mov_bbb.mp4', '// Binary Tree Traversal code', false, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 5, '1.1 Normalization Forms', 'Database normalization scales schema design to avoid insertion and deletion anomalies...', 'https://www.w3schools.com/html/mov_bbb.mp4', 'CREATE TABLE customers (id INT PRIMARY KEY, name VARCHAR(255));', true, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 10.1 Quizzes
INSERT INTO public.quizzes (id, lesson_id, title, created_at, updated_at) VALUES
(1, 1, 'React Basics Quiz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 4, 'Recursion Concepts Quiz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 10.2 Quiz Questions
INSERT INTO public.quiz_questions (id, quiz_id, content, order_index, created_at, updated_at) VALUES
(1, 1, 'Which function is used to create a state variable in a functional React component?', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Does React use a Virtual DOM?', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 2, 'What is the base case in a recursive function?', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 10.3 Quiz Options
INSERT INTO public.quiz_options (id, question_id, content, order_index, is_correct, created_at, updated_at) VALUES
(1, 1, 'useState', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'useEffect', 1, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 'useContext', 2, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 2, 'Yes, it does.', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 2, 'No, it modifies the real DOM directly.', 1, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 3, 'The condition under which recursion stops.', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 3, 'The main calculation loop.', 1, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 10.4 Quiz Attempts & Answers
INSERT INTO public.quiz_attempts (id, user_id, quiz_id, total_question, correct_question, score, submitted_at, created_at, updated_at) VALUES
(1, 5, 1, 2, 2, 10.0, CURRENT_TIMESTAMP - INTERVAL '2 hours', CURRENT_TIMESTAMP - INTERVAL '2 hours', CURRENT_TIMESTAMP - INTERVAL '2 hours'),
(2, 6, 1, 2, 1, 5.0, CURRENT_TIMESTAMP - INTERVAL '1 hour', CURRENT_TIMESTAMP - INTERVAL '1 hour', CURRENT_TIMESTAMP - INTERVAL '1 hour')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.quiz_attempt_answers (id, quiz_attempt_id, quiz_question_id, selected_option_id) VALUES
(1, 1, 1, 1),
(2, 1, 2, 4),
(3, 2, 1, 2),
(4, 2, 2, 4)
ON CONFLICT (id) DO NOTHING;

-- 11. Insert Problems (For Online Judge testing)
INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score) VALUES
(1, 'Two Sum', '<p>Given an array of integers <code>nums</code> and an integer <code>target</code>, return indices of the two numbers such that they add up to <code>target</code>.</p>', 'An array of integers and a single target integer.', 'Two indices representing the numbers adding up to the target.', '2 <= nums.length <= 10^4', '[2,7,11,15]\n9', '[0,1]', 'Try using a HashMap for O(N) lookup.', 'PRACTICE', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 12, 10, 100.00),
(2, 'Reverse Linked List', '<p>Given the head of a singly linked list, reverse the list, and return its reversed list.</p>', 'A singly linked list representation.', 'The reversed list representation.', '0 <= List.length <= 5000', '[1,2,3,4,5]', '[5,4,3,2,1]', 'Iterate through the list and change next pointers.', 'PRACTICE', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 8, 6, 100.00),
(3, 'Valid Parentheses', '<p>Given a string s containing just characters, determine if the input string is valid.</p>', 'A string containing parentheses brackets.', 'true if valid, false otherwise.', '1 <= s.length <= 10^4', '()[]{}', 'true', 'Use a Stack data structure.', 'PRACTICE', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 25, 15, 100.00),
(4, 'Contest A: Quick Sort Solver', '<p>Implement Quick Sort algorithm to sort an array of integers.</p>', 'An integer array.', 'The sorted array.', '1 <= N <= 10^5', '[5,2,3,1]', '[1,2,3,5]', 'Choose a good pivot element.', 'CONTEST', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 5, 2, 100.00),
(5, 'Contest B: Tree Diameter', '<p>Find the diameter of a binary tree (longest path between any two nodes).</p>', 'Tree node structure.', 'An integer representing diameter.', '0 <= Nodes <= 10^4', '[1,2,3,4,5]', '3', 'Find max depth of left and right subtrees recursively.', 'CONTEST', 'HARD', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 1, 0, 150.00),
(6, 'Longest Common Subsequence', '<p>Find the length of the longest common subsequence of two strings.</p>', 'Two strings on separate lines.', 'An integer representing LCS length.', '1 <= s1.length, s2.length <= 1000', 'abcde\nace', '3', 'Use dynamic programming, where dp[i][j] represents the LCS length of prefixes.', 'PRACTICE', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 4, 2, 120.00)
ON CONFLICT (id) DO NOTHING;

-- 12. Insert Problem Testcases
INSERT INTO public.problem_testcases (id, problem_id, input_data, expected_output, order_index, token) VALUES
(1, 1, '2 7 11 15\n9', '0 1', 0, 'token-testcase-1'),
(2, 2, '1 2 3 4 5', '5 4 3 2 1', 0, 'token-testcase-2'),
(3, 3, '()[]{}', 'true', 0, 'token-testcase-3'),
(4, 4, '5 2 3 1', '1 2 3 5', 0, 'token-testcase-4'),
(5, 5, '1 2 3 4 5', '3', 0, 'token-testcase-5'),
(6, 6, 'abcde\nace', '3', 0, 'token-testcase-6')
ON CONFLICT (id) DO NOTHING;

-- 12.1 Problem Tags
INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at) VALUES
(1, 'Array', 'array', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'String', 'string', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Linked List', 'linked-list', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 'Stack', 'stack', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 'Sorting', 'sorting', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 'Tree', 'tree', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 'Dynamic Programming', 'dynamic-programming', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tag_mappings (id, problem_id, tag_id) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2),
(4, 3, 4),
(5, 4, 1),
(6, 4, 5),
(7, 5, 6),
(8, 6, 2),
(9, 6, 7)
ON CONFLICT (id) DO NOTHING;

-- 13. Insert Contests (Sử dụng is_cancelled = false thay thế cho cột status đã bị xóa)
INSERT INTO public.contest (id, created_by, title, description, scoring_rule, password_hash, start_time, end_time, durations, is_deleted, status, created_at, updated_at) VALUES
(1, 1, 'Summer Code Clash 2026', 'Welcome to the annual Summer Code Clash! Solve 2 problems A & B under strict ICPC rules to win special awards.', 'ICPC', NULL, CURRENT_TIMESTAMP - INTERVAL '1 hour', CURRENT_TIMESTAMP + INTERVAL '3 hours', 240, false, 'UPCOMING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Beginner Challenge Arena #1', 'Weekly coding contest designed exclusively for beginners. Password required to join. Password is "123".', 'ICPC', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', CURRENT_TIMESTAMP + INTERVAL '1 day', CURRENT_TIMESTAMP + INTERVAL '1 day 4 hours', 240, false, 'UPCOMING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 'Algorithmic Masters Cup', 'The final round of Masters Cup 2026. This contest has ended.', 'IOI', NULL, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '4 days 20 hours', 240, false, 'UPCOMING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 14. Contest Problems Mapping
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(1, 1, 4, 0), -- Contest 1 -> Problem 4 (A)
(2, 1, 5, 1)  -- Contest 1 -> Problem 5 (B)
ON CONFLICT (id) DO NOTHING;

-- 15. Enroll student1 in Course 1 & Course 2
INSERT INTO public.enrollments (id, user_id, course_id, enrolled_at, status) VALUES
(1, 5, 1, CURRENT_TIMESTAMP, 'ACTIVE'),
(2, 5, 2, CURRENT_TIMESTAMP, 'ACTIVE'),
(3, 6, 1, CURRENT_TIMESTAMP, 'ACTIVE')
ON CONFLICT (id) DO NOTHING;

-- 16. Lesson Progress
INSERT INTO public.lesson_progress (id, user_id, lesson_id, course_id, completed_at) VALUES
(1, 5, 1, 1, CURRENT_TIMESTAMP - INTERVAL '1 day'),
(2, 5, 2, 1, CURRENT_TIMESTAMP - INTERVAL '12 hours'),
(3, 6, 1, 1, CURRENT_TIMESTAMP - INTERVAL '2 days')
ON CONFLICT (id) DO NOTHING;

-- 17. Course Reviews
INSERT INTO public.course_reviews (id, course_id, user_id, content, star, created_at, updated_at) VALUES
(1, 1, 5, 'Highly informative! Best full-stack course ever.', 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 6, 'Good structure but some parts are too fast.', 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 2, 5, 'Dr. Jenkins knows algorithms inside out. Highly recommended!', 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 18. Lesson Comments
INSERT INTO public.lesson_comments (id, lesson_id, user_id, content, parent_comment_id, created_at, updated_at) VALUES
(1, 1, 5, 'I am stuck setting up Node.js. Can anyone help?', NULL, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day'),
(2, 1, 3, 'Please ensure your environment variables are configured correctly.', 1, CURRENT_TIMESTAMP - INTERVAL '20 hours', CURRENT_TIMESTAMP - INTERVAL '20 hours')
ON CONFLICT (id) DO NOTHING;

-- 19. Wallet Transactions
INSERT INTO public.wallet_transactions (id, wallet_id, amount, type, status, created_at, order_id, reference_id) VALUES
(1, 5, 5000000.00, 'DEPOSIT', 'SUCCESS', CURRENT_TIMESTAMP - INTERVAL '3 days', NULL, 'TX-DEP-001'),
(2, 5, 499000.00, 'BUY_COURSE', 'SUCCESS', CURRENT_TIMESTAMP - INTERVAL '1 day', NULL, 'TX-BUY-001'),
(3, 3, 349300.00, 'SELL_COURSE', 'SUCCESS', CURRENT_TIMESTAMP - INTERVAL '1 day', NULL, 'TX-SEL-001')
ON CONFLICT (id) DO NOTHING;

-- 20. Problem Submissions (Thêm data để kiểm tra hệ thống OJ)
INSERT INTO public.problem_submissions (id, problem_id, user_id, lesson_id, contest_id, language_id, source_code, execution_time, memory_used, score, submitted_at, verdict, is_plagiarized) VALUES
(1, 1, 5, NULL, NULL, 1, 'class Solution { public int[] twoSum(int[] n, int t) { ... } }', 80, 24000, 100.00, CURRENT_TIMESTAMP - INTERVAL '5 hours', 'ACCEPTED', false),
(2, 1, 6, NULL, NULL, 1, 'class Solution { public int[] twoSum(int[] n, int t) { return null; } }', 40, 22000, 0.00, CURRENT_TIMESTAMP - INTERVAL '4 hours', 'WRONG_ANSWER', false),
(3, 4, 5, NULL, 1, 1, 'public class QuickSort { ... }', 120, 26000, 100.00, CURRENT_TIMESTAMP - INTERVAL '30 minutes', 'ACCEPTED', false),
(4, 5, 5, NULL, 1, 1, 'public class TreeDiameter { ... }', 150, 31000, 0.00, CURRENT_TIMESTAMP - INTERVAL '15 minutes', 'TIME_LIMIT_EXCEEDED', false)
ON CONFLICT (id) DO NOTHING;

-- 20.1 Detailed Submission Runs
INSERT INTO public.problem_submission_details (id, submission_id, testcase_id, token, execution_time, memory_used, verdict, stdout, stderr, compile_output, created_at) VALUES
(1, 1, 1, 'tok-run-1', 80, 24000, 'ACCEPTED', '0 1', NULL, NULL, CURRENT_TIMESTAMP - INTERVAL '5 hours'),
(2, 2, 1, 'tok-run-2', 40, 22000, 'WRONG_ANSWER', 'null', NULL, NULL, CURRENT_TIMESTAMP - INTERVAL '4 hours'),
(3, 3, 4, 'tok-run-3', 120, 26000, 'ACCEPTED', '1 2 3 5', NULL, NULL, CURRENT_TIMESTAMP - INTERVAL '30 minutes'),
(4, 4, 5, 'tok-run-4', 150, 31000, 'TIME_LIMIT_EXCEEDED', NULL, 'Execution timed out', NULL, CURRENT_TIMESTAMP - INTERVAL '15 minutes')
ON CONFLICT (id) DO NOTHING;

-- 21. Sync Sequences
SELECT setval('public.roles_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.roles));
SELECT setval('public.users_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.users));
SELECT setval('public.wallets_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.wallets));
SELECT setval('public.instructors_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.instructors));
SELECT setval('public.categories_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.categories));
SELECT setval('public.courses_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.courses));
SELECT setval('public.chapters_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.chapters));
SELECT setval('public.lessons_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.lessons));
SELECT setval('public.quizzes_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.quizzes));
SELECT setval('public.quiz_questions_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.quiz_questions));
SELECT setval('public.quiz_options_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.quiz_options));
SELECT setval('public.quiz_attempts_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.quiz_attempts));
SELECT setval('public.quiz_attempt_answers_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.quiz_attempt_answers));
SELECT setval('public.problems_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problems));
SELECT setval('public.problem_testcases_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problem_testcases));
SELECT setval('public.problem_tags_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problem_tags));
SELECT setval('public.problem_tag_mappings_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problem_tag_mappings));
SELECT setval('public.contest_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.contest));
SELECT setval('public.contest_problems_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.contest_problems));
SELECT setval('public.enrollments_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.enrollments));
SELECT setval('public.lesson_progress_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.lesson_progress));
SELECT setval('public.course_reviews_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.course_reviews));
SELECT setval('public.lesson_comments_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.lesson_comments));
SELECT setval('public.wallet_transactions_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.wallet_transactions));
SELECT setval('public.problem_submissions_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problem_submissions));
SELECT setval('public.problem_submission_details_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problem_submission_details));
