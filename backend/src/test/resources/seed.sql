INSERT INTO public.roles(id, name) VALUES (1, 'ADMIN') ON CONFLICT DO NOTHING;
INSERT INTO public.roles(id, name) VALUES (2, 'USER') ON CONFLICT DO NOTHING;
INSERT INTO public.roles(id, name) VALUES (3, 'INSTRUCTOR') ON CONFLICT DO NOTHING;

INSERT INTO public.users(id, score, created_at, displayname, email, password_hash, status, username) VALUES(1, 0, NOW(), 'Admin', 'admin@gmail.com', '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'admin') ON CONFLICT DO NOTHING;
INSERT INTO public.user_roles(role_id, user_id) VALUES(1, 1) ON CONFLICT DO NOTHING;

INSERT INTO public.users(id, score, created_at, displayname, email, password_hash, status, username) VALUES(2, 0, NOW(), 'User One', 'user1@example.com', '$2a$10$bdiMFwCMZ0H1ARTVmCK2rOT1aEmxIqkCWXBHj0KHa231TEOY4OtQ.', 'ACTIVE', 'user1') ON CONFLICT DO NOTHING;
INSERT INTO public.user_roles(role_id, user_id) VALUES(2, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.wallets(id, balance, user_id, updated_at, status) VALUES(1, 2000000.00, 2, NOW(), 'ACTIVE') ON CONFLICT DO NOTHING;

INSERT INTO public.users(id, score, created_at, displayname, email, password_hash, status, username) VALUES(3, 0, NOW(), 'Instructor One', 'instructor1@example.com', '$2a$10$Cww7qP4u36S1..CFZth/HOXFqjLMZOAuhZmHS9tl5B75pHTSLpPXO', 'ACTIVE', 'instructor1') ON CONFLICT DO NOTHING;
INSERT INTO public.user_roles(role_id, user_id) VALUES(3, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.instructors(id, hired_by_admin, user_id, created_at, bio, full_name, major, status) VALUES(1, true, 3, NOW(), 'Senior instructor.', 'Instructor One', 'Software Engineering', 'ACTIVE') ON CONFLICT DO NOTHING;

INSERT INTO public.categories(id, created_at, updated_at, description, name) VALUES(1, NOW(), NOW(), 'Description', 'Algorithms') ON CONFLICT DO NOTHING;
INSERT INTO public.categories(id, created_at, updated_at, description, name) VALUES(2, NOW(), NOW(), 'Description', 'Web Development') ON CONFLICT DO NOTHING;

INSERT INTO public.courses(id, average_rating, instructor_id, price, total_enrolled, total_lessons, total_quizzes, total_reviews, total_videos, created_at, updated_at, type, short_description, long_description, status, title, thumbnail_url, course_highlight, technology_tool, target_audience, prerequisites, what_you_learn, completion_benefits) VALUES(1, 4.5, 1, 0.0, 0, 6, 0, 0, 0, NOW(), NOW(), 'FREE', 'Learn Big O, arrays, trees, and dynamic programming.', 'Mastering Data Structures & Algorithms is designed to help you ace your coding interviews and write efficient code.', 'APPROVED', 'Mastering Data Structures & Algorithms', 'http://example.com/thumb.jpg', 'Highlight', 'Tools', 'Audience', 'Prereqs', 'Learn', 'Benefits') ON CONFLICT DO NOTHING;
INSERT INTO public.course_category_mappings(category_id, course_id) VALUES(1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.chapters(id, order_index, course_id, created_at, updated_at, title) VALUES(1, 1, 1, NOW(), NOW(), 'Chapter 1') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(1, 1, true, 1, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 1', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(2, 1, false, 2, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 2', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.chapters(id, order_index, course_id, created_at, updated_at, title) VALUES(2, 2, 1, NOW(), NOW(), 'Chapter 2') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(3, 2, false, 1, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 1', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(4, 2, false, 2, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 2', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.chapters(id, order_index, course_id, created_at, updated_at, title) VALUES(3, 3, 1, NOW(), NOW(), 'Chapter 3') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(5, 3, false, 1, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 1', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(6, 3, false, 2, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 2', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.courses(id, average_rating, instructor_id, price, total_enrolled, total_lessons, total_quizzes, total_reviews, total_videos, created_at, updated_at, type, short_description, long_description, status, title, thumbnail_url, course_highlight, technology_tool, target_audience, prerequisites, what_you_learn, completion_benefits) VALUES(2, 4.5, 1, 199000.0, 0, 6, 0, 0, 0, NOW(), NOW(), 'PAID', 'Build responsive websites with React, Node.js, Express, and PostgreSQL.', 'This comprehensive course takes you from absolute beginner to professional full stack web developer.', 'APPROVED', 'Full Stack Web Development with React & Node.js', 'http://example.com/thumb.jpg', 'Highlight', 'Tools', 'Audience', 'Prereqs', 'Learn', 'Benefits') ON CONFLICT DO NOTHING;
INSERT INTO public.course_category_mappings(category_id, course_id) VALUES(2, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.chapters(id, order_index, course_id, created_at, updated_at, title) VALUES(4, 1, 2, NOW(), NOW(), 'Chapter 1') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(7, 4, true, 1, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 1', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(8, 4, false, 2, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 2', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.chapters(id, order_index, course_id, created_at, updated_at, title) VALUES(5, 2, 2, NOW(), NOW(), 'Chapter 2') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(9, 5, false, 1, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 1', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(10, 5, false, 2, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 2', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.chapters(id, order_index, course_id, created_at, updated_at, title) VALUES(6, 3, 2, NOW(), NOW(), 'Chapter 3') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(11, 6, false, 1, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 1', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;
INSERT INTO public.lessons(id, chapter_id, is_trial, order_index, created_at, updated_at, status, theory_content, title, video_url, text_audio) VALUES(12, 6, false, 2, NOW(), NOW(), 'ACTIVE', 'Theory', 'Lesson 2', 'http://video.com', 'Audio') ON CONFLICT DO NOTHING;

INSERT INTO public.problem_tags(id, created_at, updated_at, name, slug) VALUES(1, NOW(), NOW(), 'Arrays', 'arrays') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tags(id, created_at, updated_at, name, slug) VALUES(2, NOW(), NOW(), 'Hash Map', 'hash-map') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tags(id, created_at, updated_at, name, slug) VALUES(3, NOW(), NOW(), 'Math', 'math') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tags(id, created_at, updated_at, name, slug) VALUES(4, NOW(), NOW(), 'String', 'string') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tags(id, created_at, updated_at, name, slug) VALUES(5, NOW(), NOW(), 'Dynamic Programming', 'dynamic-programming') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tags(id, created_at, updated_at, name, slug) VALUES(6, NOW(), NOW(), 'Two Pointers', 'two-pointers') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tags(id, created_at, updated_at, name, slug) VALUES(7, NOW(), NOW(), 'Sorting', 'sorting') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tags(id, created_at, updated_at, name, slug) VALUES(8, NOW(), NOW(), 'Binary Search', 'binary-search') ON CONFLICT DO NOTHING;

INSERT INTO public.contest(id, created_by, durations, created_at, start_time, end_time, updated_at, description, scoring_rule, status, title) VALUES(1, 1, 10800, NOW(), NOW() - INTERVAL '1 hour', NOW() + INTERVAL '2 hours', NOW(), 'SWP391 Contest', 'ICPC', 'PUBLISHED', 'SWP391 Grand Coding Contest') ON CONFLICT DO NOTHING;

INSERT INTO public.problems(id, created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope) VALUES(3, 1, true, true, 100.00, 0, 0, 10, NOW(), NOW(), 'LESSON') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_versions(id, is_public, is_active, memory_limit_kb, problem_id, time_limit_ms, version_number, created_at, constraints, description, difficulty, example_input, example_output, hint, input_description, output_description, problem_scope, solutions, starter_templates, title) VALUES(1, true, true, 64000, 3, 1000, 1, NOW(), 'None', 'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice.', 'EASY', '2 7 11 15
9', '0 1', 'None', 'Line 1: space-separated integers representing nums
Line 2: target integer', 'Two space-separated integers representing the indices', 'LESSON', 'def solve(nums, target):
    dct = {}
    for i, num in enumerate(nums):
        if target - num in dct:
            return [dct[target - num], i]
        dct[num] = i
    return []

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    target = int(input())
    res = solve(nums, target)
    print(res[0], res[1])', '{"python": "def solve(nums, target):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    target = int(input())\n    res = solve(nums, target)\n    print(res[0], res[1])"}', 'Two Sum') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(3, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(3, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.lesson_problems(lesson_id, order_index, problem_id, problem_version_id) VALUES(1, 1, 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(1, 1, 1, '0 1', '2 7 11 15
9') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(2, 2, 1, '1 2', '3 2 4
6') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(3, 3, 1, '0 1', '3 3
6') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(4, 4, 1, '1 2', '1 5 8 10
13') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(5, 5, 1, '1 2', '2 5 5 11
10') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(6, 6, 1, '0 3', '10 20 30 40
50') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(7, 7, 1, '3 4', '1 2 3 4 5
9') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(8, 8, 1, '2 4', '-1 -2 -3 -4 -5
-8') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(9, 9, 1, '0 3', '0 4 3 0
0') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(10, 10, 1, '2 3', '1 3 10 100
103') ON CONFLICT DO NOTHING;
INSERT INTO public.problems(id, created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope) VALUES(4, 1, true, true, 100.00, 0, 0, 10, NOW(), NOW(), 'LESSON') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_versions(id, is_public, is_active, memory_limit_kb, problem_id, time_limit_ms, version_number, created_at, constraints, description, difficulty, example_input, example_output, hint, input_description, output_description, problem_scope, solutions, starter_templates, title) VALUES(2, true, true, 64000, 4, 1000, 1, NOW(), 'None', 'Given an integer x, return true if x is a palindrome, and false otherwise. Do not use string conversion to solve this optimally.', 'EASY', '121', 'true', 'None', 'An integer x', 'true if x is palindrome, else false', 'LESSON', 'def solve(x):
    if x < 0:
        return False
    temp = x
    rev = 0
    while temp > 0:
        rev = rev * 10 + temp % 10
        temp //= 10
    return rev == x

if __name__ == ''__main__'':
    x = int(input())
    res = solve(x)
    print("true" if res else "false")', '{"python": "def solve(x):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    x = int(input())\n    res = solve(x)\n    print(\"true\" if res else \"false\")"}', 'Palindrome Number') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(4, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.lesson_problems(lesson_id, order_index, problem_id, problem_version_id) VALUES(1, 1, 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(11, 1, 2, 'true', '121') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(12, 2, 2, 'false', '-121') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(13, 3, 2, 'false', '10') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(14, 4, 2, 'true', '0') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(15, 5, 2, 'true', '12321') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(16, 6, 2, 'true', '123321') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(17, 7, 2, 'false', '12') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(18, 8, 2, 'true', '11') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(19, 9, 2, 'true', '1') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(20, 10, 2, 'false', '100') ON CONFLICT DO NOTHING;
INSERT INTO public.problems(id, created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope) VALUES(5, 1, true, true, 100.00, 0, 0, 10, NOW(), NOW(), 'LESSON') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_versions(id, is_public, is_active, memory_limit_kb, problem_id, time_limit_ms, version_number, created_at, constraints, description, difficulty, example_input, example_output, hint, input_description, output_description, problem_scope, solutions, starter_templates, title) VALUES(3, true, true, 64000, 5, 1000, 1, NOW(), 'None', 'Convert a roman numeral string to its corresponding integer representation.', 'EASY', 'LVIII', '58', 'None', 'A string representing a Roman numeral', 'The integer value of the Roman numeral', 'LESSON', 'def solve(s):
    roman = {''I'': 1, ''V'': 5, ''X'': 10, ''L'': 50, ''C'': 100, ''D'': 500, ''M'': 1000}
    ans = 0
    for i in range(len(s)):
        if i < len(s) - 1 and roman[s[i]] < roman[s[i+1]]:
            ans -= roman[s[i]]
        else:
            ans += roman[s[i]]
    return ans

if __name__ == ''__main__'':
    s = input().strip()
    print(solve(s))', '{"python": "def solve(s):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    s = input().strip()\n    print(solve(s))"}', 'Roman to Integer') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(5, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(5, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.lesson_problems(lesson_id, order_index, problem_id, problem_version_id) VALUES(1, 1, 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(21, 1, 3, '3', 'III') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(22, 2, 3, '4', 'IV') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(23, 3, 3, '9', 'IX') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(24, 4, 3, '58', 'LVIII') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(25, 5, 3, '1994', 'MCMXCIV') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(26, 6, 3, '10', 'X') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(27, 7, 3, '40', 'XL') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(28, 8, 3, '90', 'XC') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(29, 9, 3, '400', 'CD') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(30, 10, 3, '900', 'CM') ON CONFLICT DO NOTHING;
INSERT INTO public.problems(id, created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope) VALUES(6, 1, true, true, 100.00, 0, 0, 10, NOW(), NOW(), 'LESSON') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_versions(id, is_public, is_active, memory_limit_kb, problem_id, time_limit_ms, version_number, created_at, constraints, description, difficulty, example_input, example_output, hint, input_description, output_description, problem_scope, solutions, starter_templates, title) VALUES(4, true, true, 64000, 6, 1000, 1, NOW(), 'None', 'Given a string s containing just the characters ''('', '')'', ''{'', ''}'', ''['' and '']'', determine if the input string is valid.', 'EASY', '()[]{}', 'true', 'None', 'A string containing parentheses characters', 'true if valid, else false', 'LESSON', 'def solve(s):
    stack = []
    mapping = {")": "(", "}": "{", "]": "["}
    for char in s:
        if char in mapping:
            top_element = stack.pop() if stack else ''#''
            if mapping[char] != top_element:
                return False
        else:
            stack.append(char)
    return not stack

if __name__ == ''__main__'':
    s = input().strip()
    print("true" if solve(s) else "false")', '{"python": "def solve(s):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    s = input().strip()\n    print(\"true\" if solve(s) else \"false\")"}', 'Valid Parentheses') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(6, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.lesson_problems(lesson_id, order_index, problem_id, problem_version_id) VALUES(1, 1, 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(31, 1, 4, 'true', '()') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(32, 2, 4, 'true', '()[]{}') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(33, 3, 4, 'false', '(]') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(34, 4, 4, 'true', '([])') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(35, 5, 4, 'false', '(') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(36, 6, 4, 'false', ']') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(37, 7, 4, 'true', '({[]})') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(38, 8, 4, 'false', '({[})') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(39, 9, 4, 'true', '({[]})()') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(40, 10, 4, 'true', '{[()]}') ON CONFLICT DO NOTHING;
INSERT INTO public.problems(id, created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope) VALUES(7, 1, true, true, 100.00, 0, 0, 10, NOW(), NOW(), 'LESSON') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_versions(id, is_public, is_active, memory_limit_kb, problem_id, time_limit_ms, version_number, created_at, constraints, description, difficulty, example_input, example_output, hint, input_description, output_description, problem_scope, solutions, starter_templates, title) VALUES(5, true, true, 64000, 7, 1000, 1, NOW(), 'None', 'You are climbing a staircase. It takes n steps to reach the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?', 'EASY', '3', '3', 'None', 'An integer representing the number of stairs', 'Distinct ways to climb to the top', 'LESSON', 'def solve(n):
    if n <= 2: return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b

if __name__ == ''__main__'':
    n = int(input())
    print(solve(n))', '{"python": "def solve(n):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    n = int(input())\n    print(solve(n))"}', 'Climbing Stairs') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(7, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.lesson_problems(lesson_id, order_index, problem_id, problem_version_id) VALUES(1, 1, 7, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(41, 1, 5, '1', '1') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(42, 2, 5, '2', '2') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(43, 3, 5, '3', '3') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(44, 4, 5, '5', '4') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(45, 5, 5, '8', '5') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(46, 6, 5, '13', '6') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(47, 7, 5, '21', '7') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(48, 8, 5, '34', '8') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(49, 9, 5, '55', '9') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(50, 10, 5, '89', '10') ON CONFLICT DO NOTHING;
INSERT INTO public.problems(id, created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope) VALUES(8, 1, true, true, 100.00, 0, 0, 10, NOW(), NOW(), 'CONTEST') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_versions(id, is_public, is_active, memory_limit_kb, problem_id, time_limit_ms, version_number, created_at, constraints, description, difficulty, example_input, example_output, hint, input_description, output_description, problem_scope, solutions, starter_templates, title) VALUES(6, true, true, 64000, 8, 1000, 1, NOW(), 'None', 'Given an integer array nums, find the subarray with the largest sum, and return its sum.', 'MEDIUM', '-2 1 -3 4 -1 2 1 -5 4', '6', 'None', 'Space-separated integers representing the array', 'The maximum subarray sum', 'CONTEST', 'def solve(nums):
    max_so_far = nums[0]
    curr_max = nums[0]
    for i in range(1, len(nums)):
        curr_max = max(nums[i], curr_max + nums[i])
        max_so_far = max(max_so_far, curr_max)
    return max_so_far

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print(solve(nums))', '{"python": "def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(solve(nums))"}', 'Maximum Subarray') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(8, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(8, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.contest_problems(contest_id, order_index, problem_id, problem_version_id) VALUES(1, 5, 8, 6) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(51, 1, 6, '1', '1') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(52, 2, 6, '23', '5 4 -1 7 8') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(53, 3, 6, '6', '-2 1 -3 4 -1 2 1 -5 4') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(54, 4, 6, '-1', '-1') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(55, 5, 6, '-1', '-2 -1 -3') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(56, 6, 6, '6', '1 2 3') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(57, 7, 6, '5', '1 -2 3 -4 5') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(58, 8, 6, '3', '-2 3') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(59, 9, 6, '3', '3 -2') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(60, 10, 6, '0', '0') ON CONFLICT DO NOTHING;
INSERT INTO public.problems(id, created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope) VALUES(9, 1, true, true, 100.00, 0, 0, 10, NOW(), NOW(), 'CONTEST') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_versions(id, is_public, is_active, memory_limit_kb, problem_id, time_limit_ms, version_number, created_at, constraints, description, difficulty, example_input, example_output, hint, input_description, output_description, problem_scope, solutions, starter_templates, title) VALUES(7, true, true, 64000, 9, 1000, 1, NOW(), 'None', 'Given two sorted integer arrays nums1 and nums2, merge them into a single sorted array.', 'EASY', '1 2 3
2 5 6', '1 2 2 3 5 6', 'None', 'Line 1: space-separated integers for first sorted array
Line 2: space-separated integers for second sorted array', 'The merged sorted array as space-separated integers', 'CONTEST', 'def solve(n1, n2):
    res = sorted(n1 + n2)
    return " ".join(map(str, res))

if __name__ == ''__main__'':
    n1 = list(map(int, input().split()))
    n2 = list(map(int, input().split()))
    print(solve(n1, n2))', '{"python": "def solve(n1, n2):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    n1 = list(map(int, input().split()))\n    n2 = list(map(int, input().split()))\n    print(solve(n1, n2))"}', 'Merge Sorted Array') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(9, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(9, 6) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(9, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.contest_problems(contest_id, order_index, problem_id, problem_version_id) VALUES(1, 6, 9, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(61, 1, 7, '1 2 2 3 5 6', '1 2 3
2 5 6') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(62, 2, 7, '1', '1
') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(63, 3, 7, '2', '
2') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(64, 4, 7, '1 2 3 4 5 6', '1 3 5
2 4 6') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(65, 5, 7, '1 1 1 1 1 1', '1 1 1
1 1 1') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(66, 6, 7, '0 0', '0
0') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(67, 7, 7, '-5 -3 -1 2', '-5 -1
-3 2') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(68, 8, 7, '5 10 15 20 25', '10 20
5 15 25') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(69, 9, 7, '1 2 3 4', '1 2
3 4') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(70, 10, 7, '1 2 4 5', '4 5
1 2') ON CONFLICT DO NOTHING;
INSERT INTO public.problems(id, created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope) VALUES(10, 1, true, true, 100.00, 0, 0, 10, NOW(), NOW(), 'CONTEST') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_versions(id, is_public, is_active, memory_limit_kb, problem_id, time_limit_ms, version_number, created_at, constraints, description, difficulty, example_input, example_output, hint, input_description, output_description, problem_scope, solutions, starter_templates, title) VALUES(8, true, true, 64000, 10, 1000, 1, NOW(), 'None', 'Given an integer array nums, return true if there is a triplet that sums to 0, otherwise return false.', 'MEDIUM', '-1 0 1 2 -1 -4', 'true', 'None', 'Space-separated integers', 'true if a triplet sums to 0, else false', 'CONTEST', 'def solve(nums):
    nums.sort()
    for i in range(len(nums) - 2):
        if i > 0 and nums[i] == nums[i-1]:
            continue
        l, r = i + 1, len(nums) - 1
        while l < r:
            s = nums[i] + nums[l] + nums[r]
            if s == 0:
                return True
            elif s < 0:
                l += 1
            else:
                r -= 1
    return False

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print("true" if solve(nums) else "false")', '{"python": "def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(\"true\" if solve(nums) else \"false\")"}', 'Three Sum') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(10, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(10, 6) ON CONFLICT DO NOTHING;
INSERT INTO public.contest_problems(contest_id, order_index, problem_id, problem_version_id) VALUES(1, 7, 10, 8) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(71, 1, 8, 'true', '-1 0 1 2 -1 -4') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(72, 2, 8, 'false', '0 1 1') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(73, 3, 8, 'true', '0 0 0') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(74, 4, 8, 'true', '1 2 -3') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(75, 5, 8, 'false', '1 2 3') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(76, 6, 8, 'true', '-1 -2 3') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(77, 7, 8, 'true', '10 -5 -5') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(78, 8, 8, 'false', '10 20 30') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(79, 9, 8, 'false', '-10 5 4') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(80, 10, 8, 'true', '-10 5 5') ON CONFLICT DO NOTHING;
INSERT INTO public.problems(id, created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope) VALUES(11, 1, true, true, 100.00, 0, 0, 10, NOW(), NOW(), 'CONTEST') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_versions(id, is_public, is_active, memory_limit_kb, problem_id, time_limit_ms, version_number, created_at, constraints, description, difficulty, example_input, example_output, hint, input_description, output_description, problem_scope, solutions, starter_templates, title) VALUES(9, true, true, 64000, 11, 1000, 1, NOW(), 'None', 'Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.', 'EASY', '-1 0 3 5 9 12
9', '4', 'None', 'Line 1: space-separated sorted integers
Line 2: target integer', 'The index of target if found, else -1', 'CONTEST', 'def solve(nums, target):
    l, r = 0, len(nums) - 1
    while l <= r:
        mid = (l + r) // 2
        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            l = mid + 1
        else:
            r = mid - 1
    return -1

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    target = int(input())
    print(solve(nums, target))', '{"python": "def solve(nums, target):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    target = int(input())\n    print(solve(nums, target))"}', 'Binary Search') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(11, 8) ON CONFLICT DO NOTHING;
INSERT INTO public.contest_problems(contest_id, order_index, problem_id, problem_version_id) VALUES(1, 8, 11, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(81, 1, 9, '4', '-1 0 3 5 9 12
9') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(82, 2, 9, '-1', '-1 0 3 5 9 12
2') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(83, 3, 9, '0', '5
5') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(84, 4, 9, '-1', '5
2') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(85, 5, 9, '0', '1 3 5 7 9
1') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(86, 6, 9, '4', '1 3 5 7 9
9') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(87, 7, 9, '2', '1 3 5 7 9
5') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(88, 8, 9, '3', '1 3 5 7 9
7') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(89, 9, 9, '1', '1 3 5 7 9
3') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(90, 10, 9, '-1', '1 3 5 7 9
10') ON CONFLICT DO NOTHING;
INSERT INTO public.problems(id, created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope) VALUES(12, 1, true, true, 100.00, 0, 0, 10, NOW(), NOW(), 'CONTEST') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_versions(id, is_public, is_active, memory_limit_kb, problem_id, time_limit_ms, version_number, created_at, constraints, description, difficulty, example_input, example_output, hint, input_description, output_description, problem_scope, solutions, starter_templates, title) VALUES(10, true, true, 64000, 12, 1000, 1, NOW(), 'None', 'Given n non-negative integers representation of line heights. Find two lines that together with the x-axis form a container, such that the container contains the most water. Return the maximum amount of water a container can store.', 'MEDIUM', '1 8 6 2 5 4 8 3 7', '49', 'None', 'Space-separated integers representing the line heights', 'The maximum amount of water a container can store', 'CONTEST', 'def solve(height):
    l, r = 0, len(height) - 1
    max_w = 0
    while l < r:
        max_w = max(max_w, min(height[l], height[r]) * (r - l))
        if height[l] < height[r]:
            l += 1
        else:
            r -= 1
    return max_w

if __name__ == ''__main__'':
    height = list(map(int, input().split()))
    print(solve(height))', '{"python": "def solve(height):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    height = list(map(int, input().split()))\n    print(solve(height))"}', 'Container With Most Water') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(12, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_tag_mappings(problem_id, tag_id) VALUES(12, 6) ON CONFLICT DO NOTHING;
INSERT INTO public.contest_problems(contest_id, order_index, problem_id, problem_version_id) VALUES(1, 9, 12, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(91, 1, 10, '1', '1 1') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(92, 2, 10, '49', '1 8 6 2 5 4 8 3 7') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(93, 3, 10, '16', '4 3 2 1 4') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(94, 4, 10, '2', '1 2 1') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(95, 5, 10, '17', '2 3 4 5 18 17 6') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(96, 6, 10, '24', '1 3 2 5 25 24 5') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(97, 7, 10, '1', '1 2') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(98, 8, 10, '45', '3 9 3 4 7 2 12 6') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(99, 9, 10, '25', '10 9 8 7 6 5 4 3 2 1') ON CONFLICT DO NOTHING;
INSERT INTO public.problem_testcases(id, order_index, problem_version_id, expected_output, input_data) VALUES(100, 10, 10, '25', '1 2 3 4 5 6 7 8 9 10') ON CONFLICT DO NOTHING;

-- Reset PostgreSQL sequences
SELECT setval('contest_id_seq', COALESCE((SELECT MAX(id) FROM public.contest), 1));
SELECT setval('courses_id_seq', COALESCE((SELECT MAX(id) FROM public.courses), 1));
SELECT setval('chapters_id_seq', COALESCE((SELECT MAX(id) FROM public.chapters), 1));
SELECT setval('lessons_id_seq', COALESCE((SELECT MAX(id) FROM public.lessons), 1));
SELECT setval('problems_id_seq', COALESCE((SELECT MAX(id) FROM public.problems), 1));
SELECT setval('problem_versions_id_seq', COALESCE((SELECT MAX(id) FROM public.problem_versions), 1));
SELECT setval('problem_testcases_id_seq', COALESCE((SELECT MAX(id) FROM public.problem_testcases), 1));
SELECT setval('users_id_seq', COALESCE((SELECT MAX(id) FROM public.users), 1));
SELECT setval('instructors_id_seq', COALESCE((SELECT MAX(id) FROM public.instructors), 1));
SELECT setval('categories_id_seq', COALESCE((SELECT MAX(id) FROM public.categories), 1));
SELECT setval('problem_tags_id_seq', COALESCE((SELECT MAX(id) FROM public.problem_tags), 1));
SELECT setval('wallets_id_seq', COALESCE((SELECT MAX(id) FROM public.wallets), 1));
