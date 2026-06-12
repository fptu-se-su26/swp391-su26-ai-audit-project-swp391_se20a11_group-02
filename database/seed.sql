-- non-stopcoding seed database script
-- Phục vụ mục đích kiểm thử tính năng (đăng nhập bằng mật khẩu '123' cho tất cả tài khoản)

-- 1. Insert Roles (Nếu chưa có)
INSERT INTO public.roles (id, name) VALUES 
(1, 'ADMIN'), 
(2, 'INSTRUCTOR'), 
(3, 'USER')
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Users (Mật khẩu mặc định là '123' -> BCrypt hash: $2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze)
INSERT INTO public.users (id, username, password_hash, displayname, avatarurl, email, created_at, status, score) VALUES
(1, 'admin', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Super Admin', 'https://ui-avatars.com/api/?name=Admin&background=12284C&color=fff', 'admin@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(2, 'Ngphuong', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Ngphuong Admin', 'https://ui-avatars.com/api/?name=Ngphuong&background=12284C&color=fff', 'ngphuong@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(3, 'instructor1', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Dr. Jenkins', 'https://ui-avatars.com/api/?name=Jenkins&background=F36F21&color=fff', 'instructor1@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(4, 'student1', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Student One', 'https://ui-avatars.com/api/?name=Student+One&background=10B981&color=fff', 'student1@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 150)
ON CONFLICT (id) DO NOTHING;

-- 3. Link User Roles
INSERT INTO public.user_roles (user_id, role_id) VALUES
(1, 1), -- admin -> ADMIN
(2, 1), -- Ngphuong -> ADMIN
(3, 2), -- instructor1 -> INSTRUCTOR
(4, 3)  -- student1 -> USER
ON CONFLICT (user_id, role_id) DO NOTHING;

-- 4. Insert Wallets (Cực kỳ quan trọng để người dùng thực hiện giao dịch học tập)
INSERT INTO public.wallets (id, user_id, balance, status, updated_at) VALUES
(1, 1, 10000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(2, 2, 10000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(3, 3, 5000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(4, 4, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 5. Insert Instructors
INSERT INTO public.instructors (id, user_id, full_name, major, bio, created_at, status, hired_by_admin) VALUES
(1, 3, 'Dr. Jenkins', 'Software Engineering', 'PhD in Computer Science with over 15 years of industry experience in enterprise software architecting.', CURRENT_TIMESTAMP, 'ACTIVE', true)
ON CONFLICT (id) DO NOTHING;

-- 6. Insert Categories
INSERT INTO public.categories (id, name, description, created_at, updated_at) VALUES
(1, 'Computer Science', 'Fundamentals of Algorithms, Data Structures and Programming Paradigms.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Web Development', 'Full-stack web technologies including React, Spring Boot, Node.js.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 7. Insert Courses
INSERT INTO public.courses (id, instructor_id, title, thumbnail_url, short_description, long_description, what_you_learn, price, type, average_rating, total_reviews, total_enrolled, created_at, updated_at, total_lessons, total_quizzes, total_videos, status) VALUES
(1, 1, 'React Full-Stack Development', 'https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=500&auto=format&fit=crop&q=60', 'Learn full-stack web development with React and Spring Boot.', 'This course guides you step by step through creating a fully functional web app from scratch, handling both frontend UI and backend services.', 'Create single page apps; Deploy backend services; Integrate state management;', 499000.00, 'PRO', 4.8, 12, 150, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 10, 2, 5, 'APPROVED'),
(2, 1, 'Java Algorithms & Data Structures', 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=500&auto=format&fit=crop&q=60', 'Master sorting, searching, trees, and dynamic programming in Java.', 'A comprehensive guide to coding interview preparation, master algorithms, complex data structures, and solve problems like a pro.', 'Understand big-O notation; Implement binary trees; Master recursion;', 599000.00, 'PRO', 4.9, 8, 200, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 8, 1, 4, 'APPROVED')
ON CONFLICT (id) DO NOTHING;

-- 8. Course Category Mapping
INSERT INTO public.course_category_mappings (id, course_id, category_id) VALUES
(1, 1, 2), -- React Course -> Web Development
(2, 2, 1)  -- Java Course -> CS
ON CONFLICT (id) DO NOTHING;

-- 9. Insert Chapters
INSERT INTO public.chapters (id, course_id, title, order_index, created_at, updated_at) VALUES
(1, 1, 'Chapter 1: Getting Started', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Chapter 2: Backend Integration', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 2, 'Chapter 1: Recursion & Sorting', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 10. Insert Lessons
INSERT INTO public.lessons (id, chapter_id, title, theory_content, video_url, source_code, is_trial, order_index, created_at, updated_at) VALUES
(1, 1, '1.1 Introduction to React', 'React is a library for building composable user interfaces...', 'https://www.w3schools.com/html/mov_bbb.mp4', 'console.log("Hello React");', true, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, '1.2 JSX and Components', 'Components let you split the UI into independent, reusable pieces...', 'https://www.w3schools.com/html/mov_bbb.mp4', 'const App = () => <h1>Hello Component</h1>;', false, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 2, '2.1 Spring REST Integration', 'REST APIs allow frontend client application to communicate with backend...', 'https://www.w3schools.com/html/mov_bbb.mp4', '// Spring controllers code', false, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 3, '1.1 Intro to Recursion', 'Recursion is a method of solving problems where the solution depends on solutions to smaller instances...', 'https://www.w3schools.com/html/mov_bbb.mp4', 'public int factorial(int n) { return n <= 1 ? 1 : n * factorial(n-1); }', true, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 11. Insert Problems (For Online Judge testing)
INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score) VALUES
(1, 'Two Sum', '<p>Given an array of integers <code>nums</code> and an integer <code>target</code>, return indices of the two numbers such that they add up to <code>target</code>.</p>', 'An array of integers and a single target integer.', 'Two indices representing the numbers adding up to the target.', '2 <= nums.length <= 10^4', '[2,7,11,15]\n9', '[0,1]', 'Try using a HashMap for O(N) lookup.', 'PRACTICE', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 12, 10, 100.00),
(2, 'Reverse Linked List', '<p>Given the head of a singly linked list, reverse the list, and return its reversed list.</p>', 'A singly linked list representation.', 'The reversed list representation.', '0 <= List.length <= 5000', '[1,2,3,4,5]', '[5,4,3,2,1]', 'Iterate through the list and change next pointers.', 'PRACTICE', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 8, 6, 100.00),
(3, 'Valid Parentheses', '<p>Given a string s containing just characters, determine if the input string is valid.</p>', 'A string containing parentheses brackets.', 'true if valid, false otherwise.', '1 <= s.length <= 10^4', '()[]{}', 'true', 'Use a Stack data structure.', 'PRACTICE', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 25, 15, 100.00),
(4, 'Contest A: Quick Sort Solver', '<p>Implement Quick Sort algorithm to sort an array of integers.</p>', 'An integer array.', 'The sorted array.', '1 <= N <= 10^5', '[5,2,3,1]', '[1,2,3,5]', 'Choose a good pivot element.', 'CONTEST', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 5, 2, 100.00),
(5, 'Contest B: Tree Diameter', '<p>Find the diameter of a binary tree (longest path between any two nodes).</p>', 'Tree node structure.', 'An integer representing diameter.', '0 <= Nodes <= 10^4', '[1,2,3,4,5]', '3', 'Find max depth of left and right subtrees recursively.', 'CONTEST', 'HARD', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 1, 0, 150.00)
ON CONFLICT (id) DO NOTHING;

-- 12. Insert Problem Testcases
INSERT INTO public.problem_testcases (id, problem_id, input_data, expected_output, order_index, token) VALUES
(1, 1, '2 7 11 15\n9', '0 1', 0, 'token-testcase-1'),
(2, 2, '1 2 3 4 5', '5 4 3 2 1', 0, 'token-testcase-2'),
(3, 3, '()[]{}', 'true', 0, 'token-testcase-3'),
(4, 4, '5 2 3 1', '1 2 3 5', 0, 'token-testcase-4'),
(5, 5, '1 2 3 4 5', '3', 0, 'token-testcase-5')
ON CONFLICT (id) DO NOTHING;

-- 13. Insert Contests
INSERT INTO public.contest (id, created_by, title, description, scoring_rule, password_hash, start_time, end_time, durations, status, created_at, updated_at) VALUES
(1, 1, 'Summer Code Clash 2026', 'Welcome to the annual Summer Code Clash! Solve 2 problems A & B under strict ICPC rules to win special awards.', 'ICPC', NULL, CURRENT_TIMESTAMP - INTERVAL '1 hour', CURRENT_TIMESTAMP + INTERVAL '3 hours', 240, 'RUNNING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Beginner Challenge Arena #1', 'Weekly coding contest designed exclusively for beginners. Password required to join. Password is "123".', 'ICPC', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', CURRENT_TIMESTAMP + INTERVAL '1 day', CURRENT_TIMESTAMP + INTERVAL '1 day 4 hours', 240, 'UPCOMING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 'Algorithmic Masters Cup', 'The final round of Masters Cup 2026. This contest has ended.', 'IOI', NULL, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days 4 hours', 240, 'ENDED', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 14. Contest Problems Mapping
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(1, 1, 4, 0), -- Contest 1 -> Problem 4 (A)
(2, 1, 5, 1)  -- Contest 1 -> Problem 5 (B)
ON CONFLICT (id) DO NOTHING;

-- 15. Enroll student1 in Course 1
INSERT INTO public.enrollments (id, user_id, course_id, enrolled_at, status) VALUES
(1, 4, 1, CURRENT_TIMESTAMP, 'ACTIVE')
ON CONFLICT (id) DO NOTHING;
