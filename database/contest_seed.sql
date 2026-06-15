-- Nonstop Coding - Contest Module Seed Script (20 Diverse Contests)
-- Phục vụ mục đích kiểm thử tính năng Contest và bảng xếp hạng ICPC/IOI
-- Mật khẩu của tất cả tài khoản mặc định là '123' (mã hóa BCrypt)

-- 1. Thêm Roles (nếu chưa có)
INSERT INTO public.roles (id, name) VALUES 
(1, 'ADMIN'), 
(2, 'INSTRUCTOR'), 
(3, 'USER')
ON CONFLICT (id) DO NOTHING;

-- 2. Thêm các tài khoản Users kiểm thử (Mật khẩu: '123', riêng admin/Ngphuong là 'admin')
INSERT INTO public.users (id, username, password_hash, displayname, avatarurl, email, created_at, status, score) VALUES
(1, 'admin', '$2a$10$lb2FHmZtTv.m1XvlmSp3..DzsoqS6sJrjcFvqaRBM5O3cXMpQxaAK', 'Super Admin', 'https://ui-avatars.com/api/?name=Admin&background=12284C&color=fff', 'admin@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(2, 'Ngphuong', '$2a$10$lb2FHmZtTv.m1XvlmSp3..DzsoqS6sJrjcFvqaRBM5O3cXMpQxaAK', 'Ngphuong Admin', 'https://ui-avatars.com/api/?name=Ngphuong&background=12284C&color=fff', 'ngphuong@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(3, 'instructor1', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Dr. Jenkins', 'https://ui-avatars.com/api/?name=Jenkins&background=F36F21&color=fff', 'instructor1@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(4, 'instructor2', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Prof. Smith', 'https://ui-avatars.com/api/?name=Smith&background=10B981&color=fff', 'instructor2@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(5, 'student1', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Student One', 'https://ui-avatars.com/api/?name=Student+One&background=10B981&color=fff', 'student1@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 150),
(6, 'student2', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Alice Johnson', 'https://ui-avatars.com/api/?name=Alice&background=3b82f6&color=fff', 'student2@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 450),
(7, 'student3', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Bob Miller', 'https://ui-avatars.com/api/?name=Bob&background=10b981&color=fff', 'student3@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 320),
(8, 'student4', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Charlie Brown', 'https://ui-avatars.com/api/?name=Charlie&background=f59e0b&color=fff', 'student4@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 200),
(9, 'student5', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Diana Prince', 'https://ui-avatars.com/api/?name=Diana&background=8b5cf6&color=fff', 'student5@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 100),
(10, 'student6', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Evan Wright', 'https://ui-avatars.com/api/?name=Evan&background=ec4899&color=fff', 'student6@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 100),
(11, 'student7', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Frank Castle', 'https://ui-avatars.com/api/?name=Frank&background=06b6d4&color=fff', 'student7@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(12, 'student8', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Grace Hopper', 'https://ui-avatars.com/api/?name=Grace&background=f43f5e&color=fff', 'student8@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 75),
(13, 'student9', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Heisenberg', 'https://ui-avatars.com/api/?name=Walter&background=14b8a6&color=fff', 'student9@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 90),
(14, 'student10', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Iris West', 'https://ui-avatars.com/api/?name=Iris&background=a855f7&color=fff', 'student10@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 120),
(15, 'student11', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', 'Jack Ryan', 'https://ui-avatars.com/api/?name=Jack&background=6366f1&color=fff', 'student11@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 10)
ON CONFLICT (id) DO NOTHING;

-- 3. Phân quyền User Roles
INSERT INTO public.user_roles (user_id, role_id) VALUES
(1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3), (7, 3), (8, 3), (9, 3), (10, 3), (11, 3), (12, 3), (13, 3), (14, 3), (15, 3)
ON CONFLICT (user_id, role_id) DO NOTHING;

-- 4. Thêm Ví (Wallets)
INSERT INTO public.wallets (id, user_id, balance, status, updated_at) VALUES
(1, 1, 10000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(2, 2, 10000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(3, 3, 5000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(4, 4, 5000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(5, 5, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(6, 6, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(7, 7, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(8, 8, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(9, 9, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(10, 10, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(11, 11, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(12, 12, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(13, 13, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(14, 14, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(15, 15, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 5. Thêm các bài toán thuật toán phục vụ Contest (ID 201 - 212 để tránh trùng lặp với seed.sql)
INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score) VALUES
(201, 'Quick Sort Solver', '<p>Hãy cài đặt thuật toán Quick Sort để sắp xếp một mảng số nguyên theo thứ tự tăng dần.</p>', 'Dòng đầu chứa N là số lượng phần tử. Dòng thứ hai chứa N số nguyên cách nhau bởi khoảng trắng.', 'Một dòng duy nhất chứa N số nguyên đã được sắp xếp tăng dần.', '1 <= N <= 10^5', '5\n5 2 3 1 4', '1 2 3 4 5', 'Chọn pivot tối ưu (ví dụ: phần tử ở giữa hoặc ngẫu nhiên) để tránh trường hợp xấu nhất O(N^2).', 'CONTEST', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 45, 20, 100.00),
(202, 'Tree Diameter', '<p>Cho một cây nhị phân, hãy tính đường kính của cây đó. Đường kính của cây nhị phân là độ dài của con đường dài nhất giữa hai nút bất kỳ trong cây.</p>', 'Định dạng cây nhị phân dưới dạng mảng biểu diễn level-order.', 'Một số nguyên duy nhất biểu thị đường kính cây.', 'Số lượng nút trong cây nằm trong khoảng [0, 10^4].', '[1,2,3,4,5]', '3', 'Đường đi dài nhất đi qua một nút là tổng chiều cao của cây con bên trái và cây con bên phải.', 'CONTEST', 'HARD', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 30, 8, 150.00),
(203, 'Valid Parentheses Contest', '<p>Cho một chuỗi s chỉ chứa các ký tự ngoặc đơn. Hãy kiểm tra xem chuỗi đầu vào có hợp lệ hay không.</p>', 'Một chuỗi ký tự s chứa các dấu ngoặc.', 'Trả về true nếu chuỗi hợp lệ, ngược lại trả về false.', '1 <= s.length <= 10^4', '()[]{}', 'true', 'Sử dụng cấu trúc dữ liệu Stack để đẩy các ngoặc mở vào.', 'CONTEST', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 80, 50, 100.00),
(204, 'Two Sum Contest', '<p>Cho một mảng số nguyên nums và một số nguyên target, hãy trả về chỉ số của hai số sao cho tổng của chúng bằng target.</p>', 'Dòng đầu chứa mảng số nguyên nums. Dòng hai chứa số target.', 'Hai chỉ số cách nhau bởi khoảng trắng.', '2 <= nums.length <= 10^4', '2 7 11 15\n9', '0 1', 'Bạn có thể sử dụng bảng băm (HashMap) để giảm độ phức tạp thời gian xuống O(N).', 'CONTEST', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 120, 95, 100.00),
(205, 'Reverse Linked List Contest', '<p>Đảo ngược một danh sách liên kết đơn và trả về danh sách đã đảo ngược.</p>', 'Các giá trị của danh sách liên kết đơn.', 'Danh sách liên kết đã đảo ngược.', 'Số lượng nút nằm trong khoảng [0, 5000].', '1 2 3 4 5', '5 4 3 2 1', 'Sử dụng 3 con trỏ: prev, curr, và next để thay đổi liên kết.', 'CONTEST', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 60, 42, 100.00),
(206, 'Binary Search', '<p>Tìm vị trí của phần tử target trong mảng đã được sắp xếp.</p>', 'Dòng đầu chứa N và target. Dòng hai chứa N số nguyên đã sắp xếp.', 'Index của target hoặc -1 nếu không tìm thấy.', '1 <= N <= 10^5', '5 9\n2 5 7 9 12', '3', 'Chia đôi mảng tìm kiếm và so sánh phần tử ở giữa.', 'CONTEST', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 15, 10, 80.00),
(207, 'Longest Common Subsequence Contest', '<p>Tìm độ dài của chuỗi con chung dài nhất của 2 chuỗi s1 và s2.</p>', 'Hai dòng, mỗi dòng chứa một chuỗi.', 'Độ dài của LCS.', '1 <= s1.len, s2.len <= 1000', 'abcde\nace', '3', 'Sử dụng quy hoạch động với mảng dp hai chiều.', 'CONTEST', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 20, 12, 120.00),
(208, 'Knapsack 0-1', '<p>Chọn các vật phẩm có trọng lượng w và giá trị v để bỏ vào balo dung tích W sao cho tổng giá trị lớn nhất.</p>', 'Dòng đầu chứa N và W. Các dòng sau chứa w và v của từng vật phẩm.', 'Tổng giá trị lớn nhất đạt được.', '1 <= N <= 100, 1 <= W <= 1000', '3 4\n1 15\n2 10\n3 9', '25', 'dp[i][j] là giá trị lớn nhất sử dụng i vật phẩm đầu tiên với dung tích j.', 'CONTEST', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 12, 6, 120.00),
(209, 'Dijkstra Shortest Path', '<p>Tìm khoảng cách ngắn nhất từ đỉnh nguồn 0 đến tất cả các đỉnh khác trong đồ thị trọng số dương.</p>', 'N và M. M dòng tiếp theo chứa u, v, w biểu diễn cạnh nối u-v trọng số w.', 'Mảng khoảng cách ngắn nhất.', 'N <= 1000, M <= 5000', '3 3\n0 1 1\n1 2 2\n0 2 4', '0 1 3', 'Sử dụng hàng đợi ưu tiên (PriorityQueue) để lấy đỉnh có khoảng cách ngắn nhất hiện tại.', 'CONTEST', 'HARD', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 8, 3, 150.00),
(210, 'Merge Intervals', '<p>Hợp nhất tất cả các khoảng thời gian bị chồng chéo nhau.</p>', 'Dòng đầu là N. N dòng tiếp theo chứa start và end.', 'Các khoảng sau khi hợp nhất.', '1 <= N <= 1000', '4\n1 3\n2 6\n8 10\n15 18', '[1,6], [8,10], [15,18]', 'Sắp xếp các khoảng theo start trước khi duyệt và hợp nhất.', 'CONTEST', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 18, 11, 100.00),
(211, 'Fibonacci Solver Contest', '<p>Tính số Fibonacci thứ N với N lớn (chia lấy dư cho 10^9+7).</p>', 'Một số nguyên N.', 'Số Fibonacci thứ N % (10^9+7).', '0 <= N <= 10^9', '10', '55', 'Sử dụng nhân ma trận để giải quyết trong độ phức tạp O(log N).', 'CONTEST', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 25, 14, 100.00),
(212, 'Detect Cycle in Graph', '<p>Kiểm tra xem đồ thị có hướng được cho có chứa chu trình hay không.</p>', 'N và M. M dòng chứa u-v biểu diễn cạnh có hướng.', '1 nếu có chu trình, 0 nếu không.', 'N <= 1000', '3 3\n0 1\n1 2\n2 0', '1', 'Sử dụng DFS kết hợp mảng đánh dấu trạng thái các nút đang duyệt (Recursion Stack).', 'CONTEST', 'HARD', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 10, 4, 150.00)
ON CONFLICT (id) DO NOTHING;

-- 6. Thêm Testcases tương ứng (ID 201 - 212)
INSERT INTO public.problem_testcases (id, problem_id, input_data, expected_output, order_index, token) VALUES
(201, 201, '5\n5 2 3 1 4', '1 2 3 4 5', 0, 'tok-pt-201'),
(202, 202, '[1,2,3,4,5]', '3', 0, 'tok-pt-202'),
(203, 203, '()[]{}', 'true', 0, 'tok-pt-203'),
(204, 204, '2 7 11 15\n9', '0 1', 0, 'tok-pt-204'),
(205, 205, '1 2 3 4 5', '5 4 3 2 1', 0, 'tok-pt-205'),
(206, 206, '5 9\n2 5 7 9 12', '3', 0, 'tok-pt-206'),
(207, 207, 'abcde\nace', '3', 0, 'tok-pt-207'),
(208, 208, '3 4\n1 15\n2 10\n3 9', '25', 0, 'tok-pt-208'),
(209, 209, '3 3\n0 1 1\n1 2 2\n0 2 4', '0 1 3', 0, 'tok-pt-209'),
(210, 210, '4\n1 3\n2 6\n8 10\n15 18', '[1,6], [8,10], [15,18]', 0, 'tok-pt-210'),
(211, 211, '10', '55', 0, 'tok-pt-211'),
(212, 212, '3 3\n0 1\n1 2\n2 0', '1', 0, 'tok-pt-212')
ON CONFLICT (id) DO NOTHING;

-- 7. Thêm 20 Cuộc thi (Contests) (ID 201 - 220, sử dụng is_cancelled thay thế cho status)

-- == NHÓM 1: 5 CONTESTS ĐANG DIỄN RA (ONGOING) ==
-- 201: Summer Code Clash 2026 (Public, ICPC)
-- 202: Beginner Challenge Arena #2 (Private, ICPC, password: 123)
-- 203: Daily Sprint #101 (Public, IOI)
-- 204: Weekly Match #5 (Public, ICPC)
-- 205: Pro-Coder Tournament (Private, IOI, password: 123)
INSERT INTO public.contest (id, created_by, title, description, scoring_rule, password_hash, start_time, end_time, durations, is_cancelled, created_at, updated_at) VALUES
(201, 1, 'Summer Code Clash 2026', 'Welcome to Summer Code Clash! Solve 5 problems under strict ICPC rules.', 'ICPC', NULL, CURRENT_TIMESTAMP - INTERVAL '1 hour', CURRENT_TIMESTAMP + INTERVAL '3 hours', 240, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(202, 1, 'Beginner Challenge Arena #2', 'Weekly coding contest designed exclusively for beginners. Password is "123".', 'ICPC', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', CURRENT_TIMESTAMP - INTERVAL '30 minutes', CURRENT_TIMESTAMP + INTERVAL '2 hours 30 minutes', 180, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(203, 1, 'Daily Sprint #101', 'Quick daily algorithm challenge. 3 problems under IOI format.', 'IOI', NULL, CURRENT_TIMESTAMP - INTERVAL '15 minutes', CURRENT_TIMESTAMP + INTERVAL '45 minutes', 60, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(204, 1, 'Weekly Match #5', 'Weekly computational algorithms contest. Standard ICPC scoring.', 'ICPC', NULL, CURRENT_TIMESTAMP - INTERVAL '2 hours', CURRENT_TIMESTAMP + INTERVAL '2 hours', 240, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(205, 1, 'Pro-Coder Tournament', 'An exclusive invitational tournament for high-rated programmers. Password is "123".', 'IOI', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', CURRENT_TIMESTAMP - INTERVAL '1 hour', CURRENT_TIMESTAMP + INTERVAL '5 hours', 360, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- == NHÓM 2: 5 CONTESTS SẮP DIỄN RA (UPCOMING) ==
-- 206: CodeForces Div.3 Training (Public, ICPC)
-- 207: FPT Software Cup (Private, ICPC, password: 123)
-- 208: Mini Hackathon #1 (Public, IOI)
-- 209: Algorithms Bootcamp Final (Private, IOI, password: 123)
-- 210: Logic Arena #4 (Public, ICPC)
INSERT INTO public.contest (id, created_by, title, description, scoring_rule, password_hash, start_time, end_time, durations, is_cancelled, created_at, updated_at) VALUES
(206, 1, 'CodeForces Div.3 Training', 'Practice contest modeled after Codeforces Div 3 rounds. Open to everyone.', 'ICPC', NULL, CURRENT_TIMESTAMP + INTERVAL '1 day', CURRENT_TIMESTAMP + INTERVAL '1 day 2 hours', 120, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(207, 1, 'FPT Software Cup', 'Annual coding contest organized by FPT Software. Restricted access. Password is "123".', 'ICPC', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', CURRENT_TIMESTAMP + INTERVAL '2 days', CURRENT_TIMESTAMP + INTERVAL '2 days 4 hours', 240, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(208, 1, 'Mini Hackathon #1', '8-hour intensive algorithmic coding hackathon. Solve dynamically to gain points.', 'IOI', NULL, CURRENT_TIMESTAMP + INTERVAL '3 days', CURRENT_TIMESTAMP + INTERVAL '3 days 8 hours', 480, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(209, 1, 'Algorithms Bootcamp Final', 'The final exam for the Algorithms Bootcamp participants. Password is "123".', 'IOI', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', CURRENT_TIMESTAMP + INTERVAL '5 days', CURRENT_TIMESTAMP + INTERVAL '5 days 3 hours', 180, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(210, 1, 'Logic Arena #4', 'Test your pure logic and code optimization skills in this short match.', 'ICPC', NULL, CURRENT_TIMESTAMP + INTERVAL '12 hours', CURRENT_TIMESTAMP + INTERVAL '14 hours', 120, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- == NHÓM 3: 5 CONTESTS ĐÃ KẾT THÚC (ENDED) ==
-- 211: Algorithmic Masters Cup 2025 (Public, IOI)
-- 212: New Year Code Battle (Private, ICPC, password: 123)
-- 213: CS101 Midterm Lab (Public, ICPC)
-- 214: Dynamic Programming Marathon (Public, IOI)
-- 215: Speed Coding Challenge (Private, ICPC, password: 123)
INSERT INTO public.contest (id, created_by, title, description, scoring_rule, password_hash, start_time, end_time, durations, is_cancelled, created_at, updated_at) VALUES
(211, 1, 'Algorithmic Masters Cup 2025', 'The grand final event of 2025. Solve challenging problems under IOI format.', 'IOI', NULL, CURRENT_TIMESTAMP - INTERVAL '10 days', CURRENT_TIMESTAMP - INTERVAL '9 days 20 hours', 240, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(212, 1, 'New Year Code Battle', 'Special New Year programming fight. Password was "123".', 'ICPC', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '4 days 21 hours', 180, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(213, 1, 'CS101 Midterm Lab', 'Practical coding midterm exam for Computer Science students.', 'ICPC', NULL, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '1 day 22 hours', 120, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(214, 1, 'Dynamic Programming Marathon', '24-hour marathon focusing purely on complex dynamic programming state logic.', 'IOI', NULL, CURRENT_TIMESTAMP - INTERVAL '8 days', CURRENT_TIMESTAMP - INTERVAL '7 days', 1440, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(215, 1, 'Speed Coding Challenge', '60-minute fast paced challenge. Fast finger wins! Password was "123".', 'ICPC', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '23 hours', 60, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- == NHÓM 4: 5 CONTESTS ĐÃ HỦY (CANCELLED) ==
-- 216: Cancelled Spring Sprint (Public, ICPC, ended but cancelled)
-- 217: Cancelled Data Structure Duel (Private, ICPC, ongoing but cancelled, password: 123)
-- 218: Cancelled AI Coding Challenge (Public, IOI, upcoming but cancelled)
-- 219: Cancelled Intermediate Cup (Public, ICPC, upcoming but cancelled)
-- 220: Cancelled Rookie Clash (Private, IOI, ended but cancelled, password: 123)
INSERT INTO public.contest (id, created_by, title, description, scoring_rule, password_hash, start_time, end_time, durations, is_cancelled, created_at, updated_at) VALUES
(216, 1, 'Cancelled Spring Sprint', 'This contest was cancelled due to system maintenance schedules.', 'ICPC', NULL, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '20 hours', 240, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(217, 1, 'Cancelled Data Structure Duel', 'Cancelled due to database infrastructure migration. Password is "123".', 'ICPC', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', CURRENT_TIMESTAMP - INTERVAL '5 hours', CURRENT_TIMESTAMP - INTERVAL '1 hour', 240, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(218, 1, 'Cancelled AI Coding Challenge', 'Cancelled contest due to AI API credentials update.', 'IOI', NULL, CURRENT_TIMESTAMP + INTERVAL '1 day', CURRENT_TIMESTAMP + INTERVAL '1 day 3 hours', 180, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(219, 1, 'Cancelled Intermediate Cup', 'Intermediate cup postponed indefinitely.', 'ICPC', NULL, CURRENT_TIMESTAMP + INTERVAL '2 days', CURRENT_TIMESTAMP + INTERVAL '2 days 4 hours', 240, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(220, 1, 'Cancelled Rookie Clash', 'Rookie clash cancelled due to lack of participants. Password was "123".', 'IOI', '$2a$10$SIHukD9M.hlpQVWC/TrVkeKOaYYzwUW0L0QtLXp1571wbN2I/TfXK', CURRENT_TIMESTAMP - INTERVAL '10 days', CURRENT_TIMESTAMP - INTERVAL '9 days 22 hours', 120, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 8. Ánh xạ Bài tập vào Cuộc thi (Contest Problems)
-- Contest 201 (Ongoing, ICPC): Problems 201, 202, 203, 204, 205
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(101, 201, 201, 0), -- A
(102, 201, 202, 1), -- B
(103, 201, 203, 2), -- C
(104, 201, 204, 3), -- D
(105, 201, 205, 4)  -- E
ON CONFLICT (id) DO NOTHING;

-- Contest 202 (Ongoing, ICPC): Problems 201, 203, 206
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(106, 202, 201, 0),
(107, 202, 203, 1),
(108, 202, 206, 2)
ON CONFLICT (id) DO NOTHING;

-- Contest 203 (Ongoing, IOI): Problems 204, 205, 211
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(109, 203, 204, 0),
(110, 203, 205, 1),
(111, 203, 211, 2)
ON CONFLICT (id) DO NOTHING;

-- Contest 204 (Ongoing, ICPC): Problems 207, 210
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(112, 204, 207, 0),
(113, 204, 210, 1)
ON CONFLICT (id) DO NOTHING;

-- Contest 205 (Ongoing, IOI): Problems 208, 209, 212
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(114, 205, 208, 0),
(115, 205, 209, 1),
(116, 205, 212, 2)
ON CONFLICT (id) DO NOTHING;

-- Contest 206 (Upcoming, ICPC): Problems 201, 202, 206, 211
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(117, 206, 201, 0),
(118, 206, 202, 1),
(119, 206, 206, 2),
(120, 206, 211, 3)
ON CONFLICT (id) DO NOTHING;

-- Contest 207 (Upcoming, ICPC): Problems 203, 204, 207
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(121, 207, 203, 0),
(122, 207, 204, 1),
(123, 207, 207, 2)
ON CONFLICT (id) DO NOTHING;

-- Contest 211 (Ended, IOI): Problems 201, 202, 203
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(124, 211, 201, 0),
(125, 211, 202, 1),
(126, 211, 203, 2)
ON CONFLICT (id) DO NOTHING;

-- Contest 212 (Ended, ICPC): Problems 204, 205, 206
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(127, 212, 204, 0),
(128, 212, 205, 1),
(129, 212, 206, 2)
ON CONFLICT (id) DO NOTHING;

-- Contest 216 (Cancelled): Problems 201, 204
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(130, 216, 201, 0),
(131, 216, 204, 1)
ON CONFLICT (id) DO NOTHING;


-- 9. Đăng ký tham gia Cuộc thi (Contest Participants)
-- Đăng ký các thành viên vào cuộc thi Summer Code Clash (Contest 201)
INSERT INTO public.contest_participants (id, contest_id, user_id, joined_at) VALUES
(101, 201, 5, CURRENT_TIMESTAMP - INTERVAL '50 minutes'),
(102, 201, 6, CURRENT_TIMESTAMP - INTERVAL '48 minutes'),
(103, 201, 7, CURRENT_TIMESTAMP - INTERVAL '47 minutes'),
(104, 201, 8, CURRENT_TIMESTAMP - INTERVAL '45 minutes'),
(105, 201, 9, CURRENT_TIMESTAMP - INTERVAL '42 minutes'),
(106, 201, 10, CURRENT_TIMESTAMP - INTERVAL '40 minutes'),
(107, 201, 11, CURRENT_TIMESTAMP - INTERVAL '35 minutes'),
(108, 201, 12, CURRENT_TIMESTAMP - INTERVAL '30 minutes'),
(109, 201, 13, CURRENT_TIMESTAMP - INTERVAL '25 minutes')
ON CONFLICT (id) DO NOTHING;

-- Đăng ký các thành viên vào Contest 202 (Ongoing, Private)
INSERT INTO public.contest_participants (id, contest_id, user_id, joined_at) VALUES
(110, 202, 5, CURRENT_TIMESTAMP - INTERVAL '20 minutes'),
(111, 202, 6, CURRENT_TIMESTAMP - INTERVAL '18 minutes'),
(112, 202, 7, CURRENT_TIMESTAMP - INTERVAL '15 minutes'),
(113, 202, 8, CURRENT_TIMESTAMP - INTERVAL '12 minutes')
ON CONFLICT (id) DO NOTHING;

-- Đăng ký các thành viên vào Contest 211 (Ended, IOI)
INSERT INTO public.contest_participants (id, contest_id, user_id, joined_at) VALUES
(114, 211, 5, CURRENT_TIMESTAMP - INTERVAL '10 days'),
(115, 211, 6, CURRENT_TIMESTAMP - INTERVAL '10 days'),
(116, 211, 7, CURRENT_TIMESTAMP - INTERVAL '10 days'),
(117, 211, 8, CURRENT_TIMESTAMP - INTERVAL '10 days')
ON CONFLICT (id) DO NOTHING;

-- Đăng ký các thành viên vào Contest 212 (Ended, ICPC)
INSERT INTO public.contest_participants (id, contest_id, user_id, joined_at) VALUES
(118, 212, 5, CURRENT_TIMESTAMP - INTERVAL '5 days'),
(119, 212, 6, CURRENT_TIMESTAMP - INTERVAL '5 days'),
(120, 212, 7, CURRENT_TIMESTAMP - INTERVAL '5 days')
ON CONFLICT (id) DO NOTHING;


-- 10. Tạo các lượt nộp bài giả lập (Contest Problem Attempts)
-- Giúp hiển thị chi tiết tiến trình nộp bài trên bảng xếp hạng của từng thí sinh

-- Contest 201 (Ongoing, ICPC)
INSERT INTO public.contest_problem_attempts (id, contest_id, user_id, problem_id, is_solved, solved_at_seconds, failed_attempts_count, created_at, updated_at) VALUES
-- student1 (user_id: 5): Giải được 201, 202, 203, 204. Sai 1 lần 205.
(101, 201, 5, 201, true, 900, 1, CURRENT_TIMESTAMP - INTERVAL '35 minutes', CURRENT_TIMESTAMP - INTERVAL '35 minutes'),
(102, 201, 5, 202, true, 2700, 0, CURRENT_TIMESTAMP - INTERVAL '25 minutes', CURRENT_TIMESTAMP - INTERVAL '25 minutes'),
(103, 201, 5, 203, true, 4200, 2, CURRENT_TIMESTAMP - INTERVAL '15 minutes', CURRENT_TIMESTAMP - INTERVAL '15 minutes'),
(104, 201, 5, 204, true, 6900, 0, CURRENT_TIMESTAMP - INTERVAL '5 minutes', CURRENT_TIMESTAMP - INTERVAL '5 minutes'),
(105, 201, 5, 205, false, NULL, 1, CURRENT_TIMESTAMP - INTERVAL '2 minutes', CURRENT_TIMESTAMP - INTERVAL '2 minutes'),

-- student2 (user_id: 6): Giải được 201, 202, 203. Sai 2 lần 204.
(106, 201, 6, 201, true, 600, 0, CURRENT_TIMESTAMP - INTERVAL '40 minutes', CURRENT_TIMESTAMP - INTERVAL '40 minutes'),
(107, 201, 6, 202, true, 1900, 1, CURRENT_TIMESTAMP - INTERVAL '30 minutes', CURRENT_TIMESTAMP - INTERVAL '30 minutes'),
(108, 201, 6, 203, true, 3900, 0, CURRENT_TIMESTAMP - INTERVAL '12 minutes', CURRENT_TIMESTAMP - INTERVAL '12 minutes'),
(109, 201, 6, 204, false, NULL, 2, CURRENT_TIMESTAMP - INTERVAL '10 minutes', CURRENT_TIMESTAMP - INTERVAL '10 minutes'),

-- student3 (user_id: 7): Giải được 201, 202.
(110, 201, 7, 201, true, 1500, 2, CURRENT_TIMESTAMP - INTERVAL '32 minutes', CURRENT_TIMESTAMP - INTERVAL '32 minutes'),
(111, 201, 7, 202, true, 3700, 1, CURRENT_TIMESTAMP - INTERVAL '10 minutes', CURRENT_TIMESTAMP - INTERVAL '10 minutes'),

-- student4 (user_id: 8): Giải được 201. Sai 3 lần 202.
(112, 201, 8, 201, true, 2700, 0, CURRENT_TIMESTAMP - INTERVAL '20 minutes', CURRENT_TIMESTAMP - INTERVAL '20 minutes'),
(113, 201, 8, 202, false, NULL, 3, CURRENT_TIMESTAMP - INTERVAL '10 minutes', CURRENT_TIMESTAMP - INTERVAL '10 minutes'),

-- student5 (user_id: 9): Giải được 201.
(114, 201, 9, 201, true, 3000, 1, CURRENT_TIMESTAMP - INTERVAL '18 minutes', CURRENT_TIMESTAMP - INTERVAL '18 minutes'),

-- student6 (user_id: 10): Chưa giải được bài nào, nộp sai 2 lần 201.
(115, 201, 10, 201, false, NULL, 2, CURRENT_TIMESTAMP - INTERVAL '22 minutes', CURRENT_TIMESTAMP - INTERVAL '22 minutes')
ON CONFLICT (id) DO NOTHING;

-- Contest 212 (Ended, ICPC)
INSERT INTO public.contest_problem_attempts (id, contest_id, user_id, problem_id, is_solved, solved_at_seconds, failed_attempts_count, created_at, updated_at) VALUES
-- student1 (user_id: 5): Giải sạch cả 3 bài
(116, 212, 5, 204, true, 1200, 0, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days'),
(117, 212, 5, 205, true, 3400, 1, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days'),
(118, 212, 5, 206, true, 7200, 2, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days'),

-- student2 (user_id: 6): Giải được 2 bài
(119, 212, 6, 204, true, 900, 0, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days'),
(120, 212, 6, 205, true, 4800, 0, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days'),

-- student3 (user_id: 7): Giải được 1 bài
(121, 212, 7, 204, true, 1500, 1, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days')
ON CONFLICT (id) DO NOTHING;


-- 11. Bảng xếp hạng Cuộc thi (Contest Rankings)
-- Tính toán trước điểm số xếp hạng theo đúng luật thi đấu

-- Contest 201 (Ongoing, ICPC)
-- student1 (user_id 5): 4 bài. Penalty = (15+20) + (45+0) + (70+40) + (115+0) = 35 + 45 + 110 + 115 = 305 phút
-- student2 (user_id 6): 3 bài. Penalty = (10+0) + (31+20) + (65+0) = 126 phút
-- student3 (user_id 7): 2 bài. Penalty = (25+40) + (61+20) = 146 phút
-- student4 (user_id 8): 1 bài. Penalty = 45 phút
-- student5 (user_id 9): 1 bài. Penalty = 50 + 20 = 70 phút
-- student6 (user_id 10): 0 bài. Penalty = 0
INSERT INTO public.contest_rankings (id, contest_id, user_id, problems_solved, total_penalty, updated_at) VALUES
(101, 201, 5, 4, 305, CURRENT_TIMESTAMP),
(102, 201, 6, 3, 126, CURRENT_TIMESTAMP),
(103, 201, 7, 2, 146, CURRENT_TIMESTAMP),
(104, 201, 8, 1, 45, CURRENT_TIMESTAMP),
(105, 201, 9, 1, 70, CURRENT_TIMESTAMP),
(106, 201, 10, 0, 0, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- Contest 212 (Ended, ICPC)
-- student1: 3 bài. Penalty = (20) + (56+20) + (120+40) = 256 phút
-- student2: 2 bài. Penalty = (15) + (80) = 95 phút
-- student3: 1 bài. Penalty = 25 + 20 = 45 phút
INSERT INTO public.contest_rankings (id, contest_id, user_id, problems_solved, total_penalty, updated_at) VALUES
(107, 212, 5, 3, 256, CURRENT_TIMESTAMP),
(108, 212, 6, 2, 95, CURRENT_TIMESTAMP),
(109, 212, 7, 1, 45, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;


-- 12. Thêm các dòng lịch sử nộp bài (Problem Submissions)
-- Đảm bảo tab "Submissions" của cuộc thi có dữ liệu thực tế cho admin và thí sinh theo dõi

-- Contest 201 (Summer Code Clash 2026) Submissions
INSERT INTO public.problem_submissions (id, problem_id, user_id, lesson_id, contest_id, language_id, source_code, execution_time, memory_used, score, submitted_at, verdict, is_plagiarized) VALUES
-- student1 (user_id: 5)
(101, 201, 5, NULL, 201, 1, 'class QuickSort { ... WA ... }', 120, 26000, 0.00, CURRENT_TIMESTAMP - INTERVAL '35 minutes', 'WRONG_ANSWER', false),
(102, 201, 5, NULL, 201, 1, 'class QuickSort { ... AC ... }', 90, 25000, 100.00, CURRENT_TIMESTAMP - INTERVAL '30 minutes', 'ACCEPTED', false),
(103, 202, 5, NULL, 201, 1, 'class TreeDiameter { ... AC ... }', 140, 31000, 150.00, CURRENT_TIMESTAMP - INTERVAL '25 minutes', 'ACCEPTED', false),
(104, 203, 5, NULL, 201, 1, 'class ValidParentheses { ... WA ... }', 60, 21000, 0.00, CURRENT_TIMESTAMP - INTERVAL '22 minutes', 'WRONG_ANSWER', false),
(105, 203, 5, NULL, 201, 1, 'class ValidParentheses { ... RTE ... }', 40, 20000, 0.00, CURRENT_TIMESTAMP - INTERVAL '20 minutes', 'RUNTIME_ERROR', false),
(106, 203, 5, NULL, 201, 1, 'class ValidParentheses { ... AC ... }', 80, 22000, 100.00, CURRENT_TIMESTAMP - INTERVAL '15 minutes', 'ACCEPTED', false),
(107, 204, 5, NULL, 201, 1, 'class TwoSum { ... AC ... }', 80, 23000, 100.00, CURRENT_TIMESTAMP - INTERVAL '5 minutes', 'ACCEPTED', false),
(108, 205, 5, NULL, 201, 1, 'class RevList { ... WA ... }', 90, 24000, 0.00, CURRENT_TIMESTAMP - INTERVAL '2 minutes', 'WRONG_ANSWER', false),

-- student2 (user_id: 6)
(109, 201, 6, NULL, 201, 1, 'class QuickSort { ... AC ... }', 95, 25500, 100.00, CURRENT_TIMESTAMP - INTERVAL '40 minutes', 'ACCEPTED', false),
(110, 202, 6, NULL, 201, 1, 'class TreeDiameter { ... WA ... }', 180, 32000, 0.00, CURRENT_TIMESTAMP - INTERVAL '35 minutes', 'WRONG_ANSWER', false),
(111, 202, 6, NULL, 201, 1, 'class TreeDiameter { ... AC ... }', 130, 30500, 150.00, CURRENT_TIMESTAMP - INTERVAL '30 minutes', 'ACCEPTED', false),
(112, 203, 6, NULL, 201, 1, 'class ValidParentheses { ... AC ... }', 70, 21500, 100.00, CURRENT_TIMESTAMP - INTERVAL '12 minutes', 'ACCEPTED', false),
(113, 204, 6, NULL, 201, 1, 'class TwoSum { ... TLE ... }', 2000, 128000, 0.00, CURRENT_TIMESTAMP - INTERVAL '10 minutes', 'TIME_LIMIT_EXCEEDED', false),
(114, 204, 6, NULL, 201, 1, 'class TwoSum { ... WA ... }', 90, 23000, 0.00, CURRENT_TIMESTAMP - INTERVAL '8 minutes', 'WRONG_ANSWER', false),

-- student3 (user_id: 7)
(115, 201, 7, NULL, 201, 1, 'class QuickSort { ... WA ... }', 110, 26000, 0.00, CURRENT_TIMESTAMP - INTERVAL '38 minutes', 'WRONG_ANSWER', false),
(116, 201, 7, NULL, 201, 1, 'class QuickSort { ... WA ... }', 105, 25800, 0.00, CURRENT_TIMESTAMP - INTERVAL '35 minutes', 'WRONG_ANSWER', false),
(117, 201, 7, NULL, 201, 1, 'class QuickSort { ... AC ... }', 85, 24800, 100.00, CURRENT_TIMESTAMP - INTERVAL '32 minutes', 'ACCEPTED', false),
(118, 202, 7, NULL, 201, 1, 'class Tree { ... WA ... }', 190, 31800, 0.00, CURRENT_TIMESTAMP - INTERVAL '20 minutes', 'WRONG_ANSWER', false),
(119, 202, 7, NULL, 201, 1, 'class Tree { ... AC ... }', 145, 30900, 150.00, CURRENT_TIMESTAMP - INTERVAL '10 minutes', 'ACCEPTED', false),

-- student4 (user_id: 8)
(120, 201, 8, NULL, 201, 1, 'class QS { ... AC ... }', 90, 24500, 100.00, CURRENT_TIMESTAMP - INTERVAL '20 minutes', 'ACCEPTED', false),
(121, 202, 8, NULL, 201, 1, 'class TD { ... TLE ... }', 2000, 128000, 0.00, CURRENT_TIMESTAMP - INTERVAL '15 minutes', 'TIME_LIMIT_EXCEEDED', false),
(122, 202, 8, NULL, 201, 1, 'class TD { ... WA ... }', 150, 31000, 0.00, CURRENT_TIMESTAMP - INTERVAL '12 minutes', 'WRONG_ANSWER', false),
(123, 202, 8, NULL, 201, 1, 'class TD { ... MLE ... }', 120, 130000, 0.00, CURRENT_TIMESTAMP - INTERVAL '10 minutes', 'MEMORY_LIMIT_EXCEEDED', false),

-- student5 (user_id: 9)
(124, 201, 9, NULL, 201, 1, 'class Solver { ... WA ... }', 100, 25000, 0.00, CURRENT_TIMESTAMP - INTERVAL '22 minutes', 'WRONG_ANSWER', false),
(125, 201, 9, NULL, 201, 1, 'class Solver { ... AC ... }', 92, 24800, 100.00, CURRENT_TIMESTAMP - INTERVAL '18 minutes', 'ACCEPTED', false),

-- student6 (user_id: 10)
(126, 201, 10, NULL, 201, 1, 'class Solution { ... WA ... }', 105, 25200, 0.00, CURRENT_TIMESTAMP - INTERVAL '25 minutes', 'WRONG_ANSWER', false),
(127, 201, 10, NULL, 201, 1, 'class Solution { ... RTE ... }', 0, 0, 0.00, CURRENT_TIMESTAMP - INTERVAL '22 minutes', 'RUNTIME_ERROR', false)
ON CONFLICT (id) DO NOTHING;


-- 12.1 Chi tiết chạy thử của từng TestCase (Problem Submission Details)
INSERT INTO public.problem_submission_details (id, submission_id, testcase_id, token, execution_time, memory_used, verdict, stdout, stderr, compile_output, created_at) VALUES
(101, 101, 201, 'tok-run-101', 120, 26000, 'WRONG_ANSWER', '5 2 3 1 4', NULL, NULL, CURRENT_TIMESTAMP - INTERVAL '35 minutes'),
(102, 102, 201, 'tok-run-102', 90, 25000, 'ACCEPTED', '1 2 3 4 5', NULL, NULL, CURRENT_TIMESTAMP - INTERVAL '30 minutes'),
(103, 103, 202, 'tok-run-103', 140, 31000, 'ACCEPTED', '3', NULL, NULL, CURRENT_TIMESTAMP - INTERVAL '25 minutes'),
(104, 104, 203, 'tok-run-104', 60, 21000, 'WRONG_ANSWER', 'false', NULL, NULL, CURRENT_TIMESTAMP - INTERVAL '22 minutes'),
(105, 105, 203, 'tok-run-105', 40, 20000, 'RUNTIME_ERROR', NULL, 'StackOverflowException', NULL, CURRENT_TIMESTAMP - INTERVAL '20 minutes'),
(106, 106, 203, 'tok-run-106', 80, 22000, 'ACCEPTED', 'true', NULL, NULL, CURRENT_TIMESTAMP - INTERVAL '15 minutes'),
(107, 107, 204, 'tok-run-107', 80, 23000, 'ACCEPTED', '0 1', NULL, NULL, CURRENT_TIMESTAMP - INTERVAL '5 minutes'),
(108, 108, 205, 'tok-run-108', 90, 24000, 'WRONG_ANSWER', '1 2 3 4 5', NULL, NULL, CURRENT_TIMESTAMP - INTERVAL '2 minutes')
ON CONFLICT (id) DO NOTHING;


-- 13. Đồng bộ hóa lại các Sequence tự tăng
SELECT setval('public.roles_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.roles));
SELECT setval('public.users_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.users));
SELECT setval('public.wallets_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.wallets));
SELECT setval('public.problems_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problems));
SELECT setval('public.problem_testcases_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problem_testcases));
SELECT setval('public.contest_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.contest));
SELECT setval('public.contest_problems_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.contest_problems));
SELECT setval('public.contest_participants_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.contest_participants));
SELECT setval('public.contest_problem_attempts_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.contest_problem_attempts));
SELECT setval('public.contest_rankings_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.contest_rankings));
SELECT setval('public.problem_submissions_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problem_submissions));
SELECT setval('public.problem_submission_details_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problem_submission_details));
