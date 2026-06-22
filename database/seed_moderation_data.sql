-- Seed data for Course Moderation testing
-- Chạy script này để thêm dữ liệu mẫu kiểm thử kiểm duyệt khóa học và xem trước chương trình học trong Admin

-- 1. Thêm khóa học đang chờ duyệt (PENDING)
INSERT INTO public.courses (
    id, instructor_id, title, thumbnail_url, 
    short_description, long_description, what_you_learn, 
    price, type, average_rating, total_reviews, total_enrolled, 
    created_at, updated_at, total_lessons, total_quizzes, total_videos, status
) VALUES (
    4, 1, 'Lập trình Python và Trí tuệ Nhân tạo', 
    'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=500&auto=format&fit=crop&q=60', 
    'Khóa học Python căn bản kết hợp với các khái niệm AI và Học máy thực tế.', 
    'Khóa học này sẽ hướng dẫn bạn từ cách cài đặt Python, cú pháp cơ bản cho đến việc xây dựng mạng nơ-ron nhân tạo đơn giản bằng TensorFlow và Keras. Bạn sẽ được thực hành qua các bài tập lập trình sandbox trực quan.', 
    'Lập trình Python thành thạo; Hiểu nguyên lý mạng nơ-ron; Huấn luyện mô hình hồi quy và phân loại;', 
    899000.00, 'PRO', 0.0, 0, 0, 
    CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 1, 2, 'PENDING'
) ON CONFLICT (id) DO NOTHING;

-- 2. Thêm chương (Chapters) cho khóa học PENDING
INSERT INTO public.chapters (id, course_id, title, order_index, created_at, updated_at) VALUES
(6, 4, 'Chương 1: Giới thiệu Python & Cú pháp cơ bản', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 4, 'Chương 2: Nhập môn Trí tuệ nhân tạo (AI)', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 3. Thêm bài học (Lessons) cho khóa học PENDING
INSERT INTO public.lessons (id, chapter_id, title, theory_content, video_url, source_code, is_trial, order_index, created_at, updated_at) VALUES
(8, 6, '1.1 Cài đặt môi trường & Biến số trong Python', 'Python là một ngôn ngữ lập trình kịch bản mạnh mẽ. Để khai báo biến trong Python, bạn chỉ cần gán giá trị trực tiếp mà không cần chỉ định kiểu dữ liệu. Ví dụ: x = 5.', 'https://www.w3schools.com/html/mov_bbb.mp4', '# Khai báo biến số\nx = 10\ny = "Xin chào AI"\nprint(x)\nprint(y)', true, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(9, 6, '1.2 Cấu trúc điều kiện và Vòng lặp', 'Để rẽ nhánh chương trình, ta dùng cấu trúc if-elif-else. Để lặp lại một khối lệnh, ta dùng vòng lặp for hoặc while.', 'https://www.w3schools.com/html/mov_bbb.mp4', '# Cấu trúc rẽ nhánh\nnumber = 15\nif number % 2 == 0:\n    print("Số chẵn")\nelse:\n    print("Số lẻ")\n\n# Vòng lặp\nfor i in range(5):\n    print("Lặp lần thứ:", i)', false, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10, 7, '2.1 Khái niệm cơ bản về Mạng Nơ-ron (Neural Network)', 'Mạng nơ-ron nhân tạo được truyền cảm hứng từ cấu trúc não bộ sinh học. Chúng gồm các lớp ngõ vào, lớp ẩn và lớp ngõ ra, được liên kết thông qua các trọng số (weights) và hàm kích hoạt (activation function). Hãy làm bài trắc nghiệm bên dưới để kiểm tra kiến thức của bạn.', '', '# Xây dựng mô hình với TensorFlow\nimport tensorflow as tf\nmodel = tf.keras.Sequential([\n    tf.keras.layers.Dense(units=10, activation="relu", input_shape=[1]),\n    tf.keras.layers.Dense(units=1)\n])\nprint("Mô hình AI đã tạo thành công!")', false, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 4. Thêm Trắc nghiệm (Quizzes) cho khóa học PENDING
INSERT INTO public.quizzes (id, lesson_id, title, created_at, updated_at) VALUES
(3, 10, 'Trắc nghiệm Mạng Nơ-ron Nhân tạo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 5. Thêm câu hỏi trắc nghiệm (Quiz Questions)
INSERT INTO public.quiz_questions (id, quiz_id, content, order_index, created_at, updated_at) VALUES
(4, 3, 'Trong mạng nơ-ron, hàm kích hoạt (Activation Function) có vai trò chính là gì?', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 3, 'Hàm kích hoạt nào sau đây thường được sử dụng ở các lớp ẩn (Hidden Layers) để tránh hiện tượng triệt tiêu đạo hàm (Vanishing Gradient)?', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 6. Thêm các tùy chọn trả lời (Quiz Options)
INSERT INTO public.quiz_options (id, question_id, content, order_index, is_correct, created_at, updated_at) VALUES
(8, 4, 'Giúp mạng nơ-ron học các mối quan hệ phi tuyến phức tạp', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(9, 4, 'Tính tổng trọng số của các nút đầu vào', 1, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10, 4, 'Chỉ để trực quan hóa đầu ra của mô hình', 2, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(11, 5, 'ReLU (Rectified Linear Unit)', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(12, 5, 'Sigmoid', 1, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(13, 5, 'Tanh', 2, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 7. Thêm Bài tập Lập trình (Problems) kết nối với bài học
INSERT INTO public.problems (
    id, title, description, input_description, output_description, 
    constraints, example_input, example_output, hint, 
    problem_scope, difficulty, is_active, created_by, 
    created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, 
    total_submission, total_accepted, score
) VALUES (
    7, 'Tìm số lớn nhất trong danh sách Python', 
    '<p>Viết hàm <code>find_max(numbers)</code> để tìm số lớn nhất trong một danh sách các số nguyên cho trước.</p>', 
    'Danh sách chứa các số nguyên, phân cách bởi dấu cách.', 
    'Một số nguyên duy nhất là số lớn nhất.', 
    '1 <= len(numbers) <= 10^5', 
    '5 10 2 100 50', 
    '100', 
    'Bạn có thể dùng hàm max() có sẵn trong Python hoặc duyệt qua danh sách để tìm.', 
    'LESSON', 'EASY', true, 3, 
    CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 
    0, 0, 100.00
) ON CONFLICT (id) DO NOTHING;

-- Thêm test case cho bài tập
INSERT INTO public.problem_testcases (id, problem_id, input_data, expected_output, order_index, token) VALUES
(7, 7, '5 10 2 100 50', '100', 0, 'token-testcase-7')
ON CONFLICT (id) DO NOTHING;

-- Thêm tag cho bài tập
INSERT INTO public.problem_tag_mappings (id, problem_id, tag_id) VALUES
(10, 7, 1) -- Array / List tag
ON CONFLICT (id) DO NOTHING;

-- 8. Tạo mối quan hệ bài học - bài tập lập trình (Lesson Problems)
INSERT INTO public.lesson_problems (id, lesson_id, problem_id, order_index) VALUES
(1, 8, 7, 0) -- Bài học 8 chứa Bài tập 7
ON CONFLICT (id) DO NOTHING;

-- 9. Thêm kết quả kiểm duyệt AI mẫu (Course Moderation Report) cho khóa học PENDING (ID = 4)
INSERT INTO public.course_moderation_reports (
    id, course_id, quality_score, risk_score, confidence_score, 
    needs_admin_review, reasons, error_log, created_at, updated_at
) VALUES (
    1, 4, 0.85, 0.15, 0.95, 
    false, 'Khóa học có chất lượng nội dung tốt, độ chi tiết cao. Các video và lý thuyết đầy đủ. Trắc nghiệm và bài tập lập trình thiết kế khoa học. Không phát hiện nội dung độc hại hay trùng lặp.', 
    NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
) ON CONFLICT (id) DO NOTHING;

-- 10. Tạo vector embedding mẫu (768 chiều giá trị 0.0) cho khóa học PENDING (ID = 4)
INSERT INTO public.course_embeddings (course_id, embedding, created_at)
VALUES (
    4, 
    ('[0.0' || repeat(',0.0', 767) || ']')::vector, 
    CURRENT_TIMESTAMP
) ON CONFLICT (course_id) DO NOTHING;

-- Đồng bộ sequence
SELECT setval('public.courses_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.courses));
SELECT setval('public.chapters_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.chapters));
SELECT setval('public.lessons_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.lessons));
SELECT setval('public.quizzes_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.quizzes));
SELECT setval('public.quiz_questions_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.quiz_questions));
SELECT setval('public.quiz_options_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.quiz_options));
SELECT setval('public.problems_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problems));
SELECT setval('public.problem_testcases_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problem_testcases));
SELECT setval('public.problem_tag_mappings_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.problem_tag_mappings));
SELECT setval('public.lesson_problems_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.lesson_problems));
SELECT setval('public.course_moderation_reports_id_seq', (SELECT COALESCE(MAX(id), 1) FROM public.course_moderation_reports));
