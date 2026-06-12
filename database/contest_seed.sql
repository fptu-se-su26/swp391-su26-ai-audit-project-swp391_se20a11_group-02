-- Nonstop Coding - Contest Module Seed Script
-- Phục vụ mục đích kiểm thử tính năng Contest và bảng xếp hạng ICPC
-- Lưu ý: Mật khẩu của tất cả tài khoản mặc định là '123' (mã hóa BCrypt)

-- 1. Thêm Roles (nếu chưa có)
INSERT INTO public.roles (id, name) VALUES 
(1, 'ADMIN'), 
(2, 'INSTRUCTOR'), 
(3, 'USER')
ON CONFLICT (id) DO NOTHING;

-- 2. Thêm các tài khoản Users kiểm thử (Mật khẩu: '123')
INSERT INTO public.users (id, username, password_hash, displayname, avatarurl, email, created_at, status, score) VALUES
(1, 'admin', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Super Admin', 'https://ui-avatars.com/api/?name=Admin&background=12284C&color=fff', 'admin@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(2, 'Ngphuong', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Ngphuong Admin', 'https://ui-avatars.com/api/?name=Ngphuong&background=12284C&color=fff', 'ngphuong@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(3, 'instructor1', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Dr. Jenkins', 'https://ui-avatars.com/api/?name=Jenkins&background=F36F21&color=fff', 'instructor1@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0),
(4, 'student1', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Student One', 'https://ui-avatars.com/api/?name=Student+One&background=10B981&color=fff', 'student1@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 150),
(5, 'CodeNinja_99', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Ninja Coder', 'https://ui-avatars.com/api/?name=Ninja+Coder&background=3b82f6&color=fff', 'ninja@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 450),
(6, 'AlgorithmAce', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Ace Algo', 'https://ui-avatars.com/api/?name=Ace+Algo&background=10b981&color=fff', 'ace@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 320),
(7, 'ByteMe', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Byte Me', 'https://ui-avatars.com/api/?name=Byte+Me&background=f59e0b&color=fff', 'byteme@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 200),
(8, 'DataStructura', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Data Struct', 'https://ui-avatars.com/api/?name=Data+Struct&background=8b5cf6&color=fff', 'struct@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 100),
(9, 'GraphMaster', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Graph Master', 'https://ui-avatars.com/api/?name=Graph+Master&background=ec4899&color=fff', 'graph@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 100),
(10, 'LogicLord', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', 'Logic Lord', 'https://ui-avatars.com/api/?name=Logic+Lord&background=06b6d4&color=fff', 'logic@gmail.com', CURRENT_TIMESTAMP, 'ACTIVE', 0)
ON CONFLICT (id) DO NOTHING;

-- 3. Phân quyền User Roles
INSERT INTO public.user_roles (user_id, role_id) VALUES
(1, 1), -- admin -> ADMIN
(2, 1), -- Ngphuong -> ADMIN
(3, 2), -- instructor1 -> INSTRUCTOR
(4, 3), -- student1 -> USER
(5, 3), -- CodeNinja_99 -> USER
(6, 3), -- AlgorithmAce -> USER
(7, 3), -- ByteMe -> USER
(8, 3), -- DataStructura -> USER
(9, 3), -- GraphMaster -> USER
(10, 3) -- LogicLord -> USER
ON CONFLICT (user_id, role_id) DO NOTHING;

-- 4. Thêm Ví (Wallets) để thực hiện giao dịch học tập
INSERT INTO public.wallets (id, user_id, balance, status, updated_at) VALUES
(1, 1, 10000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(2, 2, 10000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(3, 3, 5000000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(4, 4, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(5, 5, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(6, 6, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(7, 7, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(8, 8, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(9, 9, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP),
(10, 10, 2500000.00, 'ACTIVE', CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 5. Thêm các bài toán thuật toán phục vụ Contest
INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score) VALUES
(4, 'Quick Sort Solver', '<p>Hãy cài đặt thuật toán Quick Sort để sắp xếp một mảng số nguyên theo thứ tự tăng dần.</p>', 'Dòng đầu chứa N là số lượng phần tử. Dòng thứ hai chứa N số nguyên cách nhau bởi khoảng trắng.', 'Một dòng duy nhất chứa N số nguyên đã được sắp xếp tăng dần.', '1 <= N <= 10^5', '5\n5 2 3 1 4', '1 2 3 4 5', 'Chọn pivot tối ưu (ví dụ: phần tử ở giữa hoặc ngẫu nhiên) để tránh trường hợp xấu nhất O(N^2).', 'CONTEST', 'MEDIUM', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 45, 20, 100.00),
(5, 'Tree Diameter', '<p>Cho một cây nhị phân, hãy tính đường kính của cây đó. Đường kính của cây nhị phân là độ dài của con đường dài nhất giữa hai nút bất kỳ trong cây. Con đường này có thể đi qua gốc hoặc không.</p>', 'Định dạng cây nhị phân dưới dạng mảng biểu diễn level-order.', 'Một số nguyên duy nhất biểu thị đường kính cây.', 'Số lượng nút trong cây nằm trong khoảng [0, 10^4].', '[1,2,3,4,5]', '3', 'Độ dài đường đi dài nhất đi qua một nút là tổng chiều cao của cây con bên trái và cây con bên phải của nút đó.', 'CONTEST', 'HARD', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 30, 8, 150.00),
(6, 'Valid Parentheses', '<p>Cho một chuỗi s chỉ chứa các ký tự ngoặc đơn ''('', '')'', ''{'', ''}'', ''['' và '']''. Hãy kiểm tra xem chuỗi đầu vào có hợp lệ hay không.</p>', 'Một chuỗi ký tự s chứa các dấu ngoặc.', 'Trả về true nếu chuỗi hợp lệ, ngược lại trả về false.', '1 <= s.length <= 10^4', '()[]{}', 'true', 'Sử dụng cấu trúc dữ liệu Stack để đẩy các ngoặc mở vào và khớp với ngoặc đóng tương ứng.', 'CONTEST', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 80, 50, 100.00),
(7, 'Two Sum', '<p>Cho một mảng số nguyên nums và một số nguyên target, hãy trả về chỉ số của hai số sao cho tổng của chúng bằng target.</p>', 'Dòng đầu chứa mảng số nguyên nums cách nhau bởi khoảng trắng. Dòng hai chứa số target.', 'Hai chỉ số cách nhau bởi khoảng trắng.', '2 <= nums.length <= 10^4', '2 7 11 15\n9', '0 1', 'Bạn có thể sử dụng bảng băm (HashMap) để giảm độ phức tạp thời gian xuống O(N).', 'CONTEST', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 120, 95, 100.00),
(8, 'Reverse Linked List', '<p>Đảo ngược một danh sách liên kết đơn và trả về danh sách đã đảo ngược.</p>', 'Các giá trị của danh sách liên kết đơn cách nhau bởi khoảng trắng.', 'Danh sách liên kết đã đảo ngược.', 'Số lượng nút nằm trong khoảng [0, 5000].', '1 2 3 4 5', '5 4 3 2 1', 'Sử dụng 3 con trỏ: prev, curr, và next để thay đổi liên kết của các nút trong một vòng lặp.', 'CONTEST', 'EASY', true, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 60, 42, 100.00)
ON CONFLICT (id) DO NOTHING;

-- 6. Thêm Testcases tương ứng cho Problems
INSERT INTO public.problem_testcases (id, problem_id, input_data, expected_output, order_index, token) VALUES
(6, 4, '5\n5 2 3 1 4', '1 2 3 4 5', 0, 'token-testcase-qsort'),
(7, 5, '[1,2,3,4,5]', '3', 0, 'token-testcase-diameter'),
(8, 6, '()[]{}', 'true', 0, 'token-testcase-parentheses'),
(9, 7, '2 7 11 15\n9', '0 1', 0, 'token-testcase-twosum'),
(10, 8, '1 2 3 4 5', '5 4 3 2 1', 0, 'token-testcase-revlist')
ON CONFLICT (id) DO NOTHING;

-- 7. Thêm Cuộc thi (Contest)
-- Contest 1: Summer Code Clash 2026 (Đang diễn ra)
-- Contest 2: Beginner Challenge Arena #1 (Sắp diễn ra, yêu cầu mật khẩu là '123')
-- Contest 3: Algorithmic Masters Cup (Đã kết thúc)
INSERT INTO public.contest (id, created_by, title, description, scoring_rule, password_hash, start_time, end_time, durations, status, created_at, updated_at) VALUES
(1, 1, 'Summer Code Clash 2026', 'Chào mừng bạn đến với cuộc thi Summer Code Clash 2026! Giải 5 bài toán từ Dễ đến Khó theo luật ICPC của ACM. Phần thưởng trị giá 5.000.000đ đang chờ đón nhà vô địch!', 'ICPC', NULL, CURRENT_TIMESTAMP - INTERVAL '1 hour', CURRENT_TIMESTAMP + INTERVAL '3 hours', 240, 'RUNNING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Beginner Challenge Arena #1', 'Cuộc thi thuật toán dành riêng cho các lập trình viên mới bắt đầu. Yêu cầu nhập mật khẩu bảo vệ để đăng ký tham gia. Mật khẩu là "123".', 'ICPC', '$2a$10$vD0QlyF6.s0wR/1nK0.ZteXgZzM21yT/fPzIqHpe1jX5wO04R2Oze', CURRENT_TIMESTAMP + INTERVAL '1 day', CURRENT_TIMESTAMP + INTERVAL '1 day 4 hours', 240, 'UPCOMING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, 'Algorithmic Masters Cup', 'Trận chung kết tranh cúp vô địch thuật toán Masters Cup năm 2026. Giải đấu đã khép lại thành công tốt đẹp.', 'IOI', NULL, CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days 4 hours', 240, 'ENDED', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 8. Bản đồ các Bài tập trong Cuộc thi (Contest Problems)
-- Ánh xạ các bài toán (4, 5, 6, 7, 8) vào cuộc thi Summer Code Clash (id: 1)
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(1, 1, 4, 0), -- Bài A: Quick Sort Solver
(2, 1, 5, 1), -- Bài B: Tree Diameter
(3, 1, 6, 2), -- Bài C: Valid Parentheses
(4, 1, 7, 3), -- Bài D: Two Sum
(5, 1, 8, 4)  -- Bài E: Reverse Linked List
ON CONFLICT (id) DO NOTHING;

-- Ánh xạ các bài toán tương tự vào cuộc thi Masters Cup (id: 3)
INSERT INTO public.contest_problems (id, contest_id, problem_id, order_index) VALUES
(6, 3, 4, 0),
(7, 3, 5, 1),
(8, 3, 6, 2)
ON CONFLICT (id) DO NOTHING;

-- 9. Đăng ký tham gia Cuộc thi (Contest Participants)
-- Đăng ký các thành viên vào cuộc thi Summer Code Clash 2026 (Contest 1)
INSERT INTO public.contest_participants (id, contest_id, user_id, joined_at) VALUES
(1, 1, 4, CURRENT_TIMESTAMP - INTERVAL '50 minutes'),
(2, 1, 5, CURRENT_TIMESTAMP - INTERVAL '48 minutes'),
(3, 1, 6, CURRENT_TIMESTAMP - INTERVAL '47 minutes'),
(4, 1, 7, CURRENT_TIMESTAMP - INTERVAL '45 minutes'),
(5, 1, 8, CURRENT_TIMESTAMP - INTERVAL '42 minutes'),
(6, 1, 9, CURRENT_TIMESTAMP - INTERVAL '40 minutes'),
(7, 1, 10, CURRENT_TIMESTAMP - INTERVAL '35 minutes')
ON CONFLICT (id) DO NOTHING;

-- 10. Tạo các lượt nộp bài/thử thách giả lập (Contest Problem Attempts)
-- Giúp hiển thị chi tiết tiến trình nộp bài trên giao diện của từng thí sinh
INSERT INTO public.contest_problem_attempts (id, contest_id, user_id, problem_id, is_solved, solved_at_seconds, failed_attempts_count, created_at, updated_at) VALUES
-- CodeNinja_99 (user_id: 5): Giải được A, B, C, D
(1, 1, 5, 4, true, 922, 1, CURRENT_TIMESTAMP - INTERVAL '35 minutes', CURRENT_TIMESTAMP - INTERVAL '35 minutes'), -- Bài A (15m 22s), 1 lần nộp sai
(2, 1, 5, 5, true, 2710, 0, CURRENT_TIMESTAMP - INTERVAL '25 minutes', CURRENT_TIMESTAMP - INTERVAL '25 minutes'), -- Bài B (45m 10s), 0 lần nộp sai
(3, 1, 5, 6, true, 4233, 2, CURRENT_TIMESTAMP - INTERVAL '15 minutes', CURRENT_TIMESTAMP - INTERVAL '15 minutes'), -- Bài C (1h 10m 33s), 2 lần nộp sai
(4, 1, 5, 7, true, 6900, 0, CURRENT_TIMESTAMP - INTERVAL '5 minutes', CURRENT_TIMESTAMP - INTERVAL '5 minutes'), -- Bài D (1h 55m), 0 lần nộp sai

-- AlgorithmAce (user_id: 6): Giải được A, B, C
(5, 1, 6, 4, true, 645, 0, CURRENT_TIMESTAMP - INTERVAL '40 minutes', CURRENT_TIMESTAMP - INTERVAL '40 minutes'), -- Bài A (10m 45s), 0 lần nộp sai
(6, 1, 6, 5, true, 1930, 1, CURRENT_TIMESTAMP - INTERVAL '30 minutes', CURRENT_TIMESTAMP - INTERVAL '30 minutes'), -- Bài B (32m 10s), 1 lần nộp sai
(7, 1, 6, 6, true, 3950, 0, CURRENT_TIMESTAMP - INTERVAL '12 minutes', CURRENT_TIMESTAMP - INTERVAL '12 minutes'), -- Bài C (1h 5m 50s), 0 lần nộp sai

-- ByteMe (user_id: 7): Giải được A, B
(8, 1, 7, 4, true, 1530, 2, CURRENT_TIMESTAMP - INTERVAL '32 minutes', CURRENT_TIMESTAMP - INTERVAL '32 minutes'), -- Bài A (25m 30s), 2 lần nộp sai
(9, 1, 7, 5, true, 3735, 1, CURRENT_TIMESTAMP - INTERVAL '10 minutes', CURRENT_TIMESTAMP - INTERVAL '10 minutes'), -- Bài B (1h 2m 15s), 1 lần nộp sai

-- DataStructura (user_id: 8): Giải được A
(10, 1, 8, 4, true, 2700, 0, CURRENT_TIMESTAMP - INTERVAL '20 minutes', CURRENT_TIMESTAMP - INTERVAL '20 minutes'), -- Bài A (45m), 0 lần nộp sai

-- GraphMaster (user_id: 9): Giải được A
(11, 1, 9, 4, true, 3000, 1, CURRENT_TIMESTAMP - INTERVAL '18 minutes', CURRENT_TIMESTAMP - INTERVAL '18 minutes'), -- Bài A (50m), 1 lần nộp sai

-- LogicLord (user_id: 10): Chưa giải được bài nào, nộp sai bài A
(12, 1, 10, 4, false, NULL, 2, CURRENT_TIMESTAMP - INTERVAL '22 minutes', CURRENT_TIMESTAMP - INTERVAL '22 minutes')
ON CONFLICT (id) DO NOTHING;

-- 11. Bảng xếp hạng Cuộc thi (Contest Rankings)
-- Được tính toán trước dựa trên kết quả nộp bài của thí sinh theo luật ICPC
-- Thí sinh xếp cao hơn nếu giải được nhiều bài hơn, nếu bằng số bài thì so sánh Penalty thấp hơn.
-- Penalty cho mỗi bài giải đúng = thời gian giải đúng (phút) + 20 phút * số lần nộp sai trước đó.
-- CodeNinja_99: 4 bài. Penalty = (15 + 20) + (45 + 0) + (70 + 40) + (115 + 0) = 35 + 45 + 110 + 115 = 305 phút
-- AlgorithmAce: 3 bài. Penalty = (10 + 0) + (32 + 20) + (65 + 0) = 10 + 52 + 65 = 127 phút
-- ByteMe: 2 bài. Penalty = (25 + 40) + (62 + 20) = 65 + 82 = 147 phút
-- DataStructura: 1 bài. Penalty = 45 + 0 = 45 phút
-- GraphMaster: 1 bài. Penalty = 50 + 20 = 70 phút
-- LogicLord: 0 bài. Penalty = 0 phút
INSERT INTO public.contest_rankings (id, contest_id, user_id, problems_solved, total_penalty, updated_at) VALUES
(1, 1, 5, 4, 305, CURRENT_TIMESTAMP),
(2, 1, 6, 3, 127, CURRENT_TIMESTAMP),
(3, 1, 7, 2, 147, CURRENT_TIMESTAMP),
(4, 1, 8, 1, 45, CURRENT_TIMESTAMP),
(5, 1, 9, 1, 70, CURRENT_TIMESTAMP),
(6, 1, 10, 0, 0, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 12. Cập nhật lại giá trị các Sequence để tránh lỗi trùng lặp khi hệ thống tự động sinh ID tiếp theo
SELECT setval('public.roles_id_seq', (SELECT MAX(id) FROM public.roles));
SELECT setval('public.users_id_seq', (SELECT MAX(id) FROM public.users));
SELECT setval('public.wallets_id_seq', (SELECT MAX(id) FROM public.wallets));
SELECT setval('public.problems_id_seq', (SELECT MAX(id) FROM public.problems));
SELECT setval('public.problem_testcases_id_seq', (SELECT MAX(id) FROM public.problem_testcases));
SELECT setval('public.contest_id_seq', (SELECT MAX(id) FROM public.contest));
SELECT setval('public.contest_problems_id_seq', (SELECT MAX(id) FROM public.contest_problems));
SELECT setval('public.contest_participants_id_seq', (SELECT MAX(id) FROM public.contest_participants));
SELECT setval('public.contest_problem_attempts_id_seq', (SELECT MAX(id) FROM public.contest_problem_attempts));
SELECT setval('public.contest_rankings_id_seq', (SELECT MAX(id) FROM public.contest_rankings));
