-- Clear existing ranking-related data to avoid duplicate key errors during test runs
DELETE FROM public.problem_submissions;
DELETE FROM public.problems;
DELETE FROM public.instructors;
DELETE FROM public.users;

-- Insert admin user (id 1)
INSERT INTO public.users (id, username, password_hash, displayname, email, avatarurl, status, created_at, score) VALUES
(1, 'admin', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'admin', 'admin@gmail.com', NULL, 'ACTIVE', NOW(), 0.00);

-- Insert sample users (johndoe is user 2)
INSERT INTO public.users (id, username, password_hash, displayname, email, avatarurl, status, created_at, score) VALUES
(2, 'johndoe', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'John Doe', 'johndoe@example.com', 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150', 'ACTIVE', NOW() - INTERVAL '60 days', 1800.00),
(3, 'alicenguyen', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'Alice Nguyen', 'alice@example.com', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150', 'ACTIVE', NOW() - INTERVAL '60 days', 1300.00),
(4, 'bobsmith', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'Bob Smith', 'bob@example.com', 'https://images.unsplash.com/photo-1599566150163-29194dcaad36?w=150', 'ACTIVE', NOW() - INTERVAL '50 days', 1000.00),
(5, 'davidlee', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'David Lee', 'david@example.com', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150', 'ACTIVE', NOW() - INTERVAL '40 days', 700.00),
(6, 'emmawatson', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'Emma Watson', 'emma@example.com', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150', 'ACTIVE', NOW() - INTERVAL '30 days', 500.00),
(7, 'michaelchen', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'Michael Chen', 'michael@example.com', 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150', 'ACTIVE', NOW() - INTERVAL '25 days', 300.00),
(8, 'sarahjohnson', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'Sarah Johnson', 'sarah@example.com', 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150', 'ACTIVE', NOW() - INTERVAL '20 days', 200.00),
(9, 'kevingarcia', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'Kevin Garcia', 'kevin@example.com', 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?w=150', 'ACTIVE', NOW() - INTERVAL '15 days', 0.00),
(10, 'lisakim', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'Lisa Kim', 'lisa@example.com', 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150', 'ACTIVE', NOW() - INTERVAL '10 days', 0.00),
(11, 'tomwilson', '$2a$10$P.4Ww58D.YI35B34mYv/Q.v1aE2Xw8qU2F1/i3yGZ8f6JjJ8b/Ppy', 'Tom Wilson', 'tom@example.com', 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=150', 'ACTIVE', NOW() - INTERVAL '5 days', 0.00);

-- Insert sample instructor (referencing admin user 1)
INSERT INTO public.instructors (id, bio, created_at, full_name, status, user_id, major) VALUES
(1, 'System Administrator', NOW(), 'admin', 'ACTIVE', 1, 'Computer Science');

-- Insert sample problems
INSERT INTO public.problems (id, title, description, problem_scope, difficulty, score, created_by_teacher_id) VALUES
(1, 'Two Sum', 'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.', 'PRACTICE', 'EASY', 100.00, 1),
(2, 'Add Two Numbers', 'You are given two non-empty linked lists representing two non-negative integers.', 'PRACTICE', 'MEDIUM', 200.00, 1),
(3, 'Longest Substring Without Repeating Characters', 'Given a string s, find the length of the longest substring without repeating characters.', 'PRACTICE', 'MEDIUM', 200.00, 1),
(4, 'Median of Two Sorted Arrays', 'Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.', 'PRACTICE', 'HARD', 300.00, 1),
(5, 'Longest Palindromic Substring', 'Given a string s, return the longest palindromic substring in s.', 'PRACTICE', 'MEDIUM', 200.00, 1),
(6, 'Reverse Integer', 'Given a signed 32-bit integer x, return x with its digits reversed.', 'PRACTICE', 'EASY', 100.00, 1),
(7, 'String to Integer (atoi)', 'Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer.', 'PRACTICE', 'MEDIUM', 200.00, 1),
(8, 'Palindrome Number', 'Given an integer x, return true if x is a palindrome, and false otherwise.', 'PRACTICE', 'EASY', 100.00, 1),
(9, 'Container With Most Water', 'You are given an integer array height of length n.', 'PRACTICE', 'MEDIUM', 200.00, 1),
(10, 'Integer to Roman', 'Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.', 'PRACTICE', 'MEDIUM', 200.00, 1);

-- Insert sample submissions to build ranks, streaks, accuracy, and primary languages.
-- Language ID reference: 71 = Python, 63 = JavaScript, 62 = Java, 80 = R, 54 = C++

-- User 2: John Doe (Rank 1 - 1800 pts, 10 solved, 12-day streak, Python)
INSERT INTO public.problem_submissions (id, problem_id, user_id, language_id, source_code, score, submitted_at, verdict) VALUES
(101, 1, 2, 71, 'print(x)', 100.00, NOW() - INTERVAL '11 days', 'ACCEPTED'),
(102, 2, 2, 71, 'print(x)', 200.00, NOW() - INTERVAL '10 days', 'ACCEPTED'),
(103, 3, 2, 71, 'print(x)', 200.00, NOW() - INTERVAL '9 days', 'ACCEPTED'),
(104, 4, 2, 71, 'print(x)', 300.00, NOW() - INTERVAL '8 days', 'ACCEPTED'),
(105, 5, 2, 71, 'print(x)', 200.00, NOW() - INTERVAL '7 days', 'ACCEPTED'),
(106, 6, 2, 71, 'print(x)', 100.00, NOW() - INTERVAL '6 days', 'ACCEPTED'),
(107, 7, 2, 71, 'print(x)', 200.00, NOW() - INTERVAL '5 days', 'ACCEPTED'),
(108, 8, 2, 71, 'print(x)', 100.00, NOW() - INTERVAL '4 days', 'ACCEPTED'),
(109, 9, 2, 71, 'print(x)', 200.00, NOW() - INTERVAL '3 days', 'ACCEPTED'),
(110, 10, 2, 71, 'print(x)', 200.00, NOW() - INTERVAL '2 days', 'ACCEPTED'),
-- Add extra submissions to make the streak go up to today and test wrong answers for accuracy mapping
(111, 1, 2, 71, 'print(x)', 0.00, NOW() - INTERVAL '1 days', 'ACCEPTED'),
(112, 1, 2, 71, 'print(x)', 0.00, NOW(), 'ACCEPTED'),
(113, 1, 2, 71, 'print(x)', 0.00, NOW() - INTERVAL '2 days', 'WRONG_ANSWER'),
(114, 2, 2, 71, 'print(x)', 0.00, NOW() - INTERVAL '5 days', 'WRONG_ANSWER');

-- User 3: Alice Nguyen (Rank 2 - 1300 pts, 8 solved, 5-day streak, JavaScript)
INSERT INTO public.problem_submissions (id, problem_id, user_id, language_id, source_code, score, submitted_at, verdict) VALUES
(201, 1, 3, 63, 'console.log()', 100.00, NOW() - INTERVAL '4 days', 'ACCEPTED'),
(202, 2, 3, 63, 'console.log()', 200.00, NOW() - INTERVAL '3 days', 'ACCEPTED'),
(203, 3, 3, 63, 'console.log()', 200.00, NOW() - INTERVAL '2 days', 'ACCEPTED'),
(204, 5, 3, 63, 'console.log()', 200.00, NOW() - INTERVAL '1 days', 'ACCEPTED'),
(205, 6, 3, 63, 'console.log()', 100.00, NOW(), 'ACCEPTED'),
(206, 7, 3, 63, 'console.log()', 200.00, NOW() - INTERVAL '15 days', 'ACCEPTED'),
(207, 8, 3, 63, 'console.log()', 100.00, NOW() - INTERVAL '16 days', 'ACCEPTED'),
(208, 9, 3, 63, 'console.log()', 200.00, NOW() - INTERVAL '17 days', 'ACCEPTED'),
(209, 1, 3, 63, 'console.log()', 0.00, NOW() - INTERVAL '3 days', 'WRONG_ANSWER');

-- User 4: Bob Smith (Rank 3 - 1000 pts, 6 solved, 3-day streak, Java)
INSERT INTO public.problem_submissions (id, problem_id, user_id, language_id, source_code, score, submitted_at, verdict) VALUES
(301, 1, 4, 62, 'System.out.println()', 100.00, NOW() - INTERVAL '2 days', 'ACCEPTED'),
(302, 2, 4, 62, 'System.out.println()', 200.00, NOW() - INTERVAL '1 days', 'ACCEPTED'),
(303, 3, 4, 62, 'System.out.println()', 200.00, NOW(), 'ACCEPTED'),
(304, 5, 4, 62, 'System.out.println()', 200.00, NOW() - INTERVAL '10 days', 'ACCEPTED'),
(305, 6, 4, 62, 'System.out.println()', 100.00, NOW() - INTERVAL '11 days', 'ACCEPTED'),
(306, 7, 4, 62, 'System.out.println()', 200.00, NOW() - INTERVAL '12 days', 'ACCEPTED'),
(307, 1, 4, 62, 'System.out.println()', 0.00, NOW() - INTERVAL '1 days', 'WRONG_ANSWER'),
(308, 2, 4, 62, 'System.out.println()', 0.00, NOW() - INTERVAL '10 days', 'TIME_LIMIT_EXCEEDED');

-- User 5: David Lee (Rank 4 - 700 pts, 4 solved, Java)
INSERT INTO public.problem_submissions (id, problem_id, user_id, language_id, source_code, score, submitted_at, verdict) VALUES
(401, 1, 5, 62, 'System.out.println()', 100.00, NOW() - INTERVAL '5 days', 'ACCEPTED'),
(402, 2, 5, 62, 'System.out.println()', 200.00, NOW() - INTERVAL '6 days', 'ACCEPTED'),
(403, 3, 5, 62, 'System.out.println()', 200.00, NOW() - INTERVAL '7 days', 'ACCEPTED'),
(404, 5, 5, 62, 'System.out.println()', 200.00, NOW() - INTERVAL '8 days', 'ACCEPTED');

-- User 6: Emma Watson (Rank 5 - 500 pts, 3 solved, Python)
INSERT INTO public.problem_submissions (id, problem_id, user_id, language_id, source_code, score, submitted_at, verdict) VALUES
(501, 1, 6, 71, 'print(x)', 100.00, NOW() - INTERVAL '15 days', 'ACCEPTED'),
(502, 2, 6, 71, 'print(x)', 200.00, NOW() - INTERVAL '16 days', 'ACCEPTED'),
(503, 5, 6, 71, 'print(x)', 200.00, NOW() - INTERVAL '17 days', 'ACCEPTED');

-- User 7: Michael Chen (Rank 6 - 300 pts, 2 solved, C++)
INSERT INTO public.problem_submissions (id, problem_id, user_id, language_id, source_code, score, submitted_at, verdict) VALUES
(601, 1, 7, 54, 'cout', 100.00, NOW() - INTERVAL '20 days', 'ACCEPTED'),
(602, 2, 7, 54, 'cout', 200.00, NOW() - INTERVAL '21 days', 'ACCEPTED');

-- User 8: Sarah Johnson (Rank 7 - 200 pts, 2 solved, JavaScript)
INSERT INTO public.problem_submissions (id, problem_id, user_id, language_id, source_code, score, submitted_at, verdict) VALUES
(701, 1, 8, 63, 'console.log()', 100.00, NOW() - INTERVAL '2 days', 'ACCEPTED'),
(702, 6, 8, 63, 'console.log()', 100.00, NOW() - INTERVAL '3 days', 'ACCEPTED');

-- User 9: Kevin Garcia (Rank 8 - 100 pts, 1 solved, Java)
INSERT INTO public.problem_submissions (id, problem_id, user_id, language_id, source_code, score, submitted_at, verdict) VALUES
(801, 1, 9, 62, 'System.out.println()', 100.00, NOW() - INTERVAL '25 days', 'ACCEPTED');

-- User 10: Lisa Kim (Rank 9 - 100 pts, 1 solved, Python)
INSERT INTO public.problem_submissions (id, problem_id, user_id, language_id, source_code, score, submitted_at, verdict) VALUES
(901, 6, 10, 71, 'print(x)', 100.00, NOW() - INTERVAL '2 days', 'ACCEPTED');

-- User 11: Tom Wilson (Rank 10 - 100 pts, 1 solved, R)
INSERT INTO public.problem_submissions (id, problem_id, user_id, language_id, source_code, score, submitted_at, verdict) VALUES
(1001, 8, 11, 80, 'print()', 100.00, NOW() - INTERVAL '1 days', 'ACCEPTED');

-- Fix sequences to avoid future key constraint collisions when users solve problems
SELECT setval('public.users_id_seq', 20, true);
SELECT setval('public.problems_id_seq', 20, true);
SELECT setval('public.problem_submissions_id_seq', 1500, true);
