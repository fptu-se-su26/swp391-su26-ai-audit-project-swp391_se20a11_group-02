-- 1. Insert multiple test users if not exists
INSERT INTO public.users (id, username, password_hash, displayname, avatarurl, email, status, score)
VALUES 
(999, 'contest_creator', '$2a$10$v06j/2WcZz4o9yZf7k6Bve1UqKx51B0t3Nlq/zRj1dNu6.eJd3.9C', 'Contest Creator', null, 'creator@nonstopcoding.com', 'ACTIVE'::public.status_active_locked, 0.0),
(1000, 'contest_participant_1', '$2a$10$v06j/2WcZz4o9yZf7k6Bve1UqKx51B0t3Nlq/zRj1dNu6.eJd3.9C', 'Thanh MiLa', 'https://ui-avatars.com/api/?name=Thanh+Mila&background=F36F21&color=fff', 'thanh.mila@nonstopcoding.com', 'ACTIVE'::public.status_active_locked, 1850.0),
(1001, 'contest_participant_2', '$2a$10$v06j/2WcZz4o9yZf7k6Bve1UqKx51B0t3Nlq/zRj1dNu6.eJd3.9C', 'John Doe', null, 'john.doe@nonstopcoding.com', 'ACTIVE'::public.status_active_locked, 1200.0),
(1002, 'contest_participant_3', '$2a$10$v06j/2WcZz4o9yZf7k6Bve1UqKx51B0t3Nlq/zRj1dNu6.eJd3.9C', 'Alice Smith', null, 'alice.smith@nonstopcoding.com', 'ACTIVE'::public.status_active_locked, 950.0),
(1003, 'contest_participant_4', '$2a$10$v06j/2WcZz4o9yZf7k6Bve1UqKx51B0t3Nlq/zRj1dNu6.eJd3.9C', 'Bob Johnson', null, 'bob.johnson@nonstopcoding.com', 'ACTIVE'::public.status_active_locked, 1500.0)
ON CONFLICT (id) DO NOTHING;

-- 1b. Insert instructor for contest_creator if not exists (required by public.problems foreign key constraint)
INSERT INTO public.instructors (id, user_id, full_name, major, bio, created_at, status)
VALUES (999, 999, 'Contest Creator', 'Computer Science', 'System generated seeder instructor account for contest creator.', CURRENT_TIMESTAMP, 'ACTIVE')
ON CONFLICT (id) DO NOTHING;

-- 2. Insert fake problems of scope CONTEST to link with contests
INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score)
VALUES
(990, 'Two Sum in Contest', 'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.', 'Array of integers nums and integer target.', 'Indices of the two numbers.', '2 <= nums.length <= 10^4', '[2,7,11,15]\n9', '[0,1]', 'Use a hash map.', 'CONTEST'::public.problem_scope, 'EASY'::public.problem_difficulty, true, 999, 10, 1000, 64000, true, 4, 3, 100.00),
(991, 'Contest Palindrome Number', 'Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.', 'An integer x.', 'True or False.', '-2^31 <= x <= 2^31 - 1', '121', 'true', 'Reverse the integer.', 'CONTEST'::public.problem_scope, 'EASY'::public.problem_difficulty, true, 999, 5, 1000, 64000, true, 2, 1, 100.00),
(992, 'Contest Longest Common Prefix', 'Write a function to find the longest common prefix string amongst an array of strings.', 'Array of strings.', 'Longest common prefix.', '0 <= strs.length <= 200', '["flower","flow","flight"]', '"fl"', 'Compare characters vertically.', 'CONTEST'::public.problem_scope, 'EASY'::public.problem_difficulty, true, 999, 8, 1000, 64000, true, 0, 0, 100.00),
(993, 'Contest Valid Parentheses', 'Given a string s containing just the characters brackets, determine if the input string is valid.', 'A string s containing brackets.', 'True or False.', '1 <= s.length <= 10^4', '"()[]{}"', 'true', 'Use a stack.', 'CONTEST'::public.problem_scope, 'MEDIUM'::public.problem_difficulty, true, 999, 12, 1000, 64000, true, 0, 0, 100.00),
(994, 'Contest Merge Two Sorted Lists', 'Merge two sorted linked lists and return it as a sorted list.', 'Two sorted linked lists.', 'Merged sorted linked list.', 'Number of nodes in both lists is in range [0, 50].', '[1,2,4]\n[1,3,4]', '[1,1,2,3,4,4]', 'Use recursion or iteration.', 'CONTEST'::public.problem_scope, 'MEDIUM'::public.problem_difficulty, true, 999, 6, 1000, 64000, true, 0, 0, 100.00)
ON CONFLICT (id) DO NOTHING;

-- 3. Insert fake contests
INSERT INTO public.contest (id, created_by, title, description, scoring_rule, password_hash, start_time, end_time, durations, status)
VALUES 
(1, 999, 'Weekly Algorithm Sprint #45', 'A weekly algorithms sprint covering dynamic programming and greedy algorithms.', 'ICPC'::public.scoring_rule, null, NOW() - INTERVAL '2 days', NOW() + INTERVAL '5 days', 180, 'RUNNING'::public.contest_status),
(2, 999, 'Data Structures Challenge Series', 'Test your knowledge on trees, graphs, and advanced heap implementations.', 'IOI'::public.scoring_rule, null, NOW() - INTERVAL '1 day', NOW() + INTERVAL '3 days', 120, 'RUNNING'::public.contest_status),
(3, 999, 'Code Masters Championship 2026', 'The annual coding championship for professional developers.', 'ICPC'::public.scoring_rule, 'sha256_dummy_hash_for_private', NOW() + INTERVAL '5 days', NOW() + INTERVAL '5 days 3 hours', 180, 'UPCOMING'::public.contest_status),
(4, 999, 'Beginner''s Python Bash', 'An introductory contest designed for beginners starting their journey with Python.', 'CUSTOM'::public.scoring_rule, null, NOW() + INTERVAL '7 days', NOW() + INTERVAL '7 days 2 hours', 120, 'UPCOMING'::public.contest_status),
(5, 999, 'SQL Mastery Arena', 'Showcase your query optimization and database design skills.', 'ICPC'::public.scoring_rule, null, NOW() + INTERVAL '12 days', NOW() + INTERVAL '12 days 2 hours', 120, 'UPCOMING'::public.contest_status),
(6, 999, 'Intro to DP Challenge', 'A beginner-friendly contest focused on Dynamic Programming.', 'ICPC'::public.scoring_rule, null, NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days 3 hours', 180, 'ENDED'::public.contest_status),
(7, 999, 'Advanced Graph Theory Scrimmage', 'Solve tough problems involving network flow, heavy-light decomposition, and graph coloring.', 'IOI'::public.scoring_rule, 'private_pass_hash', NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days 4 hours', 240, 'ENDED'::public.contest_status)
ON CONFLICT (id) DO NOTHING;

-- 4. Insert contest problems mapping
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index)
VALUES
(1, 1, 990, 1),
(2, 1, 991, 2),
(3, 1, 992, 3),
(4, 2, 993, 1),
(5, 2, 994, 2),
(6, 3, 990, 1),
(7, 4, 991, 1),
(8, 4, 992, 2),
(9, 4, 993, 3),
(10, 5, 994, 1),
(11, 6, 990, 1),
(12, 6, 991, 2),
(13, 6, 992, 3),
(14, 6, 993, 4),
(15, 6, 994, 5),
(16, 7, 991, 1),
(17, 7, 994, 2)
ON CONFLICT (id) DO NOTHING;

-- 5. Insert contest participants (competitor registrations)
INSERT INTO public.contest_participants (id, contest_id, user_id, joined_at)
VALUES
(1, 1, 1000, NOW() - INTERVAL '2 hours'),
(2, 1, 1001, NOW() - INTERVAL '1 hour'),
(3, 1, 1002, NOW() - INTERVAL '30 minutes'),
(4, 1, 1003, NOW() - INTERVAL '20 minutes'),
(5, 1, 999, NOW() - INTERVAL '10 minutes'),
(6, 2, 1000, NOW() - INTERVAL '1 hour'),
(7, 2, 1002, NOW() - INTERVAL '40 minutes'),
(8, 3, 1001, NOW() - INTERVAL '15 minutes'),
(9, 4, 1002, NOW() - INTERVAL '5 minutes'),
(10, 5, 1003, NOW() - INTERVAL '2 minutes'),
(11, 6, 1000, NOW() - INTERVAL '16 days'),
(12, 6, 1001, NOW() - INTERVAL '16 days'),
(13, 6, 1003, NOW() - INTERVAL '16 days'),
(14, 6, 999, NOW() - INTERVAL '16 days'),
(15, 7, 999, NOW() - INTERVAL '11 days')
ON CONFLICT (id) DO NOTHING;

-- 6. Insert problem submissions to calculate average accuracy for User '1000' (Thanh Mila)
-- User 1000 has 4 submissions: 3 ACCEPTED, 1 WRONG_ANSWER (Accuracy = 75%)
INSERT INTO public.problem_submissions (id, problem_id, user_id, lesson_id, contest_id, language_id, source_code, execution_time, memory_used, score, submitted_at, verdict, is_plagiarized)
VALUES
(9001, 990, 1000, null, 1, 1, 'public class Solution { }', 0.05, 12000, 100.00, NOW() - INTERVAL '1 hour', 'ACCEPTED'::public.oj_verdict, false),
(9002, 990, 1000, null, 1, 1, 'public class Solution { // rev 2 }', 0.04, 11500, 100.00, NOW() - INTERVAL '50 minutes', 'ACCEPTED'::public.oj_verdict, false),
(9003, 991, 1000, null, 1, 1, 'public class Solution { // bug }', 0.12, 14000, 0.00, NOW() - INTERVAL '40 minutes', 'WRONG_ANSWER'::public.oj_verdict, false),
(9004, 991, 1000, null, 1, 1, 'public class Solution { // fix }', 0.06, 12100, 100.00, NOW() - INTERVAL '30 minutes', 'ACCEPTED'::public.oj_verdict, false)
ON CONFLICT (id) DO NOTHING;

-- 7. Insert contest rankings
INSERT INTO public.contest_rankings (id, contest_id, user_id, problems_solved, total_penalty, updated_at)
VALUES
(1, 1, 1000, 2, 40, NOW() - INTERVAL '30 minutes'),
(2, 1, 1001, 1, 20, NOW() - INTERVAL '20 minutes')
ON CONFLICT (id) DO NOTHING;

-- 8. Insert contest problem attempts
INSERT INTO public.contest_problem_attempts (id, contest_id, user_id, problem_id, is_solved, solved_at_seconds, failed_attempts_count, created_at, updated_at)
VALUES
(1, 1, 1000, 990, true, 600, 0, NOW() - INTERVAL '1 hour', NOW() - INTERVAL '50 minutes'),
(2, 1, 1000, 991, true, 1800, 1, NOW() - INTERVAL '40 minutes', NOW() - INTERVAL '30 minutes')
ON CONFLICT (id) DO NOTHING;

-- Synchronize sequences for autoincrement PK columns
SELECT setval('public.contest_id_seq', COALESCE((SELECT MAX(id) FROM public.contest), 1));
SELECT setval('public.contest_problems_id_seq', COALESCE((SELECT MAX(id) FROM public.contest_problems), 1));
SELECT setval('public.contest_participants_id_seq', COALESCE((SELECT MAX(id) FROM public.contest_participants), 1));
SELECT setval('public.problem_submissions_id_seq', COALESCE((SELECT MAX(id) FROM public.problem_submissions), 1));
SELECT setval('public.contest_rankings_id_seq', COALESCE((SELECT MAX(id) FROM public.contest_rankings), 1));
SELECT setval('public.contest_problem_attempts_id_seq', COALESCE((SELECT MAX(id) FROM public.contest_problem_attempts), 1));
