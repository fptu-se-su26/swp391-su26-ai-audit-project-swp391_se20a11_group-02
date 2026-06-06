-- 1. Ensure INSTRUCTOR role exists
INSERT INTO public.roles (id, name) VALUES (3, 'INSTRUCTOR') ON CONFLICT (id) DO NOTHING;

-- 2. Make user 2 (vanquangqn28_c97dd) an instructor
INSERT INTO public.instructors (id, user_id, full_name, major, bio, status, hired_by_admin)
VALUES (2, 2, 'Văn Quang Nguyễn', 'Software Engineering', 'Senior Full Stack Developer and Instructor', 'ACTIVE', true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.user_roles (user_id, role_id)
VALUES (2, 3)
ON CONFLICT DO NOTHING;

-- 3. Update existing course prices to VND and assign them to instructor 2
UPDATE public.courses SET instructor_id = 2, price = 699000.00 WHERE id = 101;
UPDATE public.courses SET instructor_id = 2, price = 499000.00 WHERE id = 102;

-- 4. Insert Course 103 (Python for Automation) under instructor 2 if not exists
INSERT INTO public.courses (
    id, instructor_id, title, thumbnail_url, short_description, long_description,
    what_you_learn, course_highlight, technology_tool, prerequisites, target_audience,
    completion_benefits, status, price, type, average_rating, total_reviews, total_enrolled,
    total_lessons, total_quizzes, total_videos
) VALUES (
    103, 2, 'Python for Automation', 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5',
    'Write robust scripts to automate tasks and scrape data.', 'Deep dive into automation scripting, web scraping, API client creation, and task schedulers with Python.',
    'Scrape websites, schedule cron jobs, automate Excel/PDFs, create Slack/Discord bots.',
    'Hands-on scripts, scheduling automation, web scraping basics to advanced.',
    'Python, Requests, BeautifulSoup, Selenium, Pandas', 'Basic programming logic',
    'Developers wanting to automate daily tasks', 'Build automation portfolios, script writing expertise',
    'APPROVED', 599000.00, 'BACKEND', 4.9, 5, 42, 3, 1, 2
) ON CONFLICT (id) DO NOTHING;

-- Ensure chapter 205 and lesson 306 exist for Course 103
INSERT INTO public.chapters (id, course_id, title, order_index)
VALUES (205, 103, 'Getting Started with Automation', 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.lessons (id, chapter_id, title, theory_content, video_url, source_code, is_trial, order_index)
VALUES (306, 205, 'Writing your first Automation script', 'Use OS and sys libraries to interact with files.', 'https://www.youtube.com/watch?v=srx254u2cO0', 'import os; print(os.listdir("."))', true, 1)
ON CONFLICT (id) DO NOTHING;

-- 5. Insert 10 Student Users
INSERT INTO public.users (id, username, password_hash, displayname, email, score, status, created_at) VALUES
(1010, 'student_1', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Nguyễn Văn A', 'student1@gmail.com', 100, 'ACTIVE', '2025-06-01 10:00:00+00'),
(1011, 'student_2', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Trần Thị B', 'student2@gmail.com', 200, 'ACTIVE', '2025-07-01 10:00:00+00'),
(1012, 'student_3', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Lê Huy Cường', 'student3@gmail.com', 150, 'ACTIVE', '2025-08-01 10:00:00+00'),
(1013, 'student_4', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Phạm Văn D', 'student4@gmail.com', 50, 'ACTIVE', '2025-09-01 10:00:00+00'),
(1014, 'student_5', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Hoàng Thị E', 'student5@gmail.com', 300, 'ACTIVE', '2025-10-01 10:00:00+00'),
(1015, 'student_6', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Bùi Văn Nam', 'student6@gmail.com', 0, 'ACTIVE', '2025-11-01 10:00:00+00'),
(1016, 'student_7', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Ngô Mỹ Linh', 'student7@gmail.com', 120, 'ACTIVE', '2025-12-01 10:00:00+00'),
(1017, 'student_8', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Vũ Huy Hùng', 'student8@gmail.com', 80, 'ACTIVE', '2026-01-01 10:00:00+00'),
(1018, 'student_9', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Đỗ Minh Tuấn', 'student9@gmail.com', 220, 'ACTIVE', '2026-02-01 10:00:00+00'),
(1019, 'student_10', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Đặng Quốc Bảo', 'student10@gmail.com', 170, 'ACTIVE', '2026-03-01 10:00:00+00')
ON CONFLICT (id) DO NOTHING;

-- Map roles to USER role (role_id 2)
INSERT INTO public.user_roles (user_id, role_id) VALUES
(1010, 2), (1011, 2), (1012, 2), (1013, 2), (1014, 2),
(1015, 2), (1016, 2), (1017, 2), (1018, 2), (1019, 2)
ON CONFLICT DO NOTHING;

-- Create wallets for the 10 students
INSERT INTO public.wallets (user_id, balance, status) VALUES
(1010, 0.00, 'ACTIVE'),
(1011, 0.00, 'ACTIVE'),
(1012, 0.00, 'ACTIVE'),
(1013, 0.00, 'ACTIVE'),
(1014, 0.00, 'ACTIVE'),
(1015, 0.00, 'ACTIVE'),
(1016, 0.00, 'ACTIVE'),
(1017, 0.00, 'ACTIVE'),
(1018, 0.00, 'ACTIVE'),
(1019, 0.00, 'ACTIVE')
ON CONFLICT (user_id) DO NOTHING;

-- 6. Insert Orders (representing purchases of course 101, 102, 103 across the past 12 months)
INSERT INTO public.orders (id, user_id, total_amount, status, created_at, updated_at) VALUES
(5001, 1010, 699000.00, 'COMPLETED', '2025-06-15 14:30:00+00', '2025-06-15 14:30:00+00'),
(5002, 1011, 499000.00, 'COMPLETED', '2025-07-20 10:15:00+00', '2025-07-20 10:15:00+00'),
(5003, 1012, 599000.00, 'COMPLETED', '2025-08-25 08:05:00+00', '2025-08-25 08:05:00+00'),
(5004, 1013, 699000.00, 'COMPLETED', '2025-09-10 19:40:00+00', '2025-09-10 19:40:00+00'),
(5005, 1014, 499000.00, 'COMPLETED', '2025-10-12 11:20:00+00', '2025-10-12 11:20:00+00'),
(5006, 1015, 599000.00, 'COMPLETED', '2025-11-18 15:10:00+00', '2025-11-18 15:10:00+00'),
(5007, 1016, 699000.00, 'COMPLETED', '2025-12-22 09:20:00+00', '2025-12-22 09:20:00+00'),
(5008, 1017, 499000.00, 'COMPLETED', '2026-01-25 16:12:00+00', '2026-01-25 16:12:00+00'),
(5009, 1018, 599000.00, 'COMPLETED', '2026-02-28 10:45:00+00', '2026-02-28 10:45:00+00'),
(5010, 1019, 699000.00, 'COMPLETED', '2026-03-15 17:55:00+00', '2026-03-15 17:55:00+00'),
(5011, 1010, 499000.00, 'COMPLETED', '2026-03-20 11:30:00+00', '2026-03-20 11:30:00+00'),
(5012, 1011, 599000.00, 'COMPLETED', '2026-04-05 14:15:00+00', '2026-04-05 14:15:00+00'),
(5013, 1012, 699000.00, 'COMPLETED', '2026-04-12 09:10:00+00', '2026-04-12 09:10:00+00'),
(5014, 1013, 499000.00, 'COMPLETED', '2026-04-22 16:40:00+00', '2026-04-22 16:40:00+00'),
(5015, 1014, 599000.00, 'COMPLETED', '2026-05-02 13:20:00+00', '2026-05-02 13:20:00+00'),
(5016, 1015, 699000.00, 'COMPLETED', '2026-05-08 15:20:00+00', '2026-05-08 15:20:00+00'),
(5017, 1016, 499000.00, 'COMPLETED', '2026-05-15 09:12:00+00', '2026-05-15 09:12:00+00'),
(5018, 1017, 599000.00, 'COMPLETED', '2026-05-20 16:30:00+00', '2026-05-20 16:30:00+00'),
(5019, 1018, 699000.00, 'COMPLETED', '2026-05-25 10:45:00+00', '2026-05-25 10:45:00+00'),
(5020, 1019, 499000.00, 'COMPLETED', '2026-05-28 11:55:00+00', '2026-05-28 11:55:00+00')
ON CONFLICT (id) DO NOTHING;

-- 7. Insert Order Items
INSERT INTO public.order_items (id, order_id, course_id, price) VALUES
(5001, 5001, 101, 699000.00),
(5002, 5002, 102, 499000.00),
(5003, 5003, 103, 599000.00),
(5004, 5004, 101, 699000.00),
(5005, 5005, 102, 499000.00),
(5006, 5006, 103, 599000.00),
(5007, 5007, 101, 699000.00),
(5008, 5008, 102, 499000.00),
(5009, 5009, 103, 599000.00),
(5010, 5010, 101, 699000.00),
(5011, 5011, 102, 499000.00),
(5012, 5012, 103, 599000.00),
(5013, 5013, 101, 699000.00),
(5014, 5014, 102, 499000.00),
(5015, 5015, 103, 599000.00),
(5016, 5016, 101, 699000.00),
(5017, 5017, 102, 499000.00),
(5018, 5018, 103, 599000.00),
(5019, 5019, 101, 699000.00),
(5020, 5020, 102, 499000.00)
ON CONFLICT (id) DO NOTHING;

-- 8. Insert Enrollments
INSERT INTO public.enrollments (id, user_id, course_id, enrolled_at, status) VALUES
(5001, 1010, 101, '2025-06-15 14:30:00+00', 'ACTIVE'),
(5002, 1011, 102, '2025-07-20 10:15:00+00', 'ACTIVE'),
(5003, 1012, 103, '2025-08-25 08:05:00+00', 'ACTIVE'),
(5004, 1013, 101, '2025-09-10 19:40:00+00', 'ACTIVE'),
(5005, 1014, 102, '2025-10-12 11:20:00+00', 'ACTIVE'),
(5006, 1015, 103, '2025-11-18 15:10:00+00', 'ACTIVE'),
(5007, 1016, 101, '2025-12-22 09:20:00+00', 'ACTIVE'),
(5008, 1017, 102, '2026-01-25 16:12:00+00', 'ACTIVE'),
(5009, 1018, 103, '2026-02-28 10:45:00+00', 'ACTIVE'),
(5010, 1019, 101, '2026-03-15 17:55:00+00', 'ACTIVE'),
(5011, 1010, 102, '2026-03-20 11:30:00+00', 'ACTIVE'),
(5012, 1011, 103, '2026-04-05 14:15:00+00', 'ACTIVE'),
(5013, 1012, 101, '2026-04-12 09:10:00+00', 'ACTIVE'),
(5014, 1013, 102, '2026-04-22 16:40:00+00', 'ACTIVE'),
(5015, 1014, 103, '2026-05-02 13:20:00+00', 'ACTIVE'),
(5016, 1015, 101, '2026-05-08 15:20:00+00', 'ACTIVE'),
(5017, 1016, 102, '2026-05-15 09:12:00+00', 'ACTIVE'),
(5018, 1017, 103, '2026-05-20 16:30:00+00', 'ACTIVE'),
(5019, 1018, 101, '2026-05-25 10:45:00+00', 'ACTIVE'),
(5020, 1019, 102, '2026-05-28 11:55:00+00', 'ACTIVE')
ON CONFLICT (id) DO NOTHING;

-- 9. Insert Wallet Transactions (Buy Course)
INSERT INTO public.wallet_transactions (id, wallet_id, amount, type, status, created_at, order_id) VALUES
(5001, (SELECT id FROM public.wallets WHERE user_id = 1010), 699000.00, 'BUY_COURSE', 'SUCCESS', '2025-06-15 14:30:00+00', 5001),
(5002, (SELECT id FROM public.wallets WHERE user_id = 1011), 499000.00, 'BUY_COURSE', 'SUCCESS', '2025-07-20 10:15:00+00', 5002),
(5003, (SELECT id FROM public.wallets WHERE user_id = 1012), 599000.00, 'BUY_COURSE', 'SUCCESS', '2025-08-25 08:05:00+00', 5003),
(5004, (SELECT id FROM public.wallets WHERE user_id = 1013), 699000.00, 'BUY_COURSE', 'SUCCESS', '2025-09-10 19:40:00+00', 5004),
(5005, (SELECT id FROM public.wallets WHERE user_id = 1014), 499000.00, 'BUY_COURSE', 'SUCCESS', '2025-10-12 11:20:00+00', 5005),
(5006, (SELECT id FROM public.wallets WHERE user_id = 1015), 599000.00, 'BUY_COURSE', 'SUCCESS', '2025-11-18 15:10:00+00', 5006),
(5007, (SELECT id FROM public.wallets WHERE user_id = 1016), 699000.00, 'BUY_COURSE', 'SUCCESS', '2025-12-22 09:20:00+00', 5007),
(5008, (SELECT id FROM public.wallets WHERE user_id = 1017), 499000.00, 'BUY_COURSE', 'SUCCESS', '2026-01-25 16:12:00+00', 5008),
(5009, (SELECT id FROM public.wallets WHERE user_id = 1018), 599000.00, 'BUY_COURSE', 'SUCCESS', '2026-02-28 10:45:00+00', 5009),
(5010, (SELECT id FROM public.wallets WHERE user_id = 1019), 699000.00, 'BUY_COURSE', 'SUCCESS', '2026-03-15 17:55:00+00', 5010),
(5011, (SELECT id FROM public.wallets WHERE user_id = 1010), 499000.00, 'BUY_COURSE', 'SUCCESS', '2026-03-20 11:30:00+00', 5011),
(5012, (SELECT id FROM public.wallets WHERE user_id = 1011), 599000.00, 'BUY_COURSE', 'SUCCESS', '2026-04-05 14:15:00+00', 5012),
(5013, (SELECT id FROM public.wallets WHERE user_id = 1012), 699000.00, 'BUY_COURSE', 'SUCCESS', '2026-04-12 09:10:00+00', 5013),
(5014, (SELECT id FROM public.wallets WHERE user_id = 1013), 499000.00, 'BUY_COURSE', 'SUCCESS', '2026-04-22 16:40:00+00', 5014),
(5015, (SELECT id FROM public.wallets WHERE user_id = 1014), 599000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-02 13:20:00+00', 5015),
(5016, (SELECT id FROM public.wallets WHERE user_id = 1015), 699000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-08 15:20:00+00', 5016),
(5017, (SELECT id FROM public.wallets WHERE user_id = 1016), 499000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-15 09:12:00+00', 5017),
(5018, (SELECT id FROM public.wallets WHERE user_id = 1017), 599000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-20 16:30:00+00', 5018),
(5019, (SELECT id FROM public.wallets WHERE user_id = 1018), 699000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-25 10:45:00+00', 5019),
(5020, (SELECT id FROM public.wallets WHERE user_id = 1019), 499000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-28 11:55:00+00', 5020)
ON CONFLICT (id) DO NOTHING;

-- 10. Update total_enrolled counter in courses table
UPDATE public.courses
SET total_enrolled = (SELECT COUNT(*) FROM public.enrollments WHERE course_id = courses.id)
WHERE id IN (101, 102, 103);

-- 11. Insert Lesson Progress
INSERT INTO public.lesson_progress (user_id, lesson_id, course_id, completed_at) VALUES
(1010, 301, 101, '2025-06-18 10:00:00+00'),
(1010, 302, 101, '2025-06-19 11:00:00+00'),
(1010, 304, 102, '2026-03-25 15:00:00+00'),
(1011, 304, 102, '2025-07-22 10:00:00+00'),
(1011, 305, 102, '2025-07-25 14:00:00+00'),
(1011, 306, 103, '2026-04-10 11:00:00+00'),
(1012, 306, 103, '2025-08-30 09:00:00+00'),
(1012, 301, 101, '2026-04-20 16:00:00+00'),
(1013, 301, 101, '2025-09-12 10:00:00+00'),
(1013, 302, 101, '2025-09-14 11:00:00+00'),
(1013, 303, 101, '2025-09-15 15:00:00+00'),
(1015, 306, 103, '2025-11-20 10:00:00+00'),
(1015, 301, 101, '2026-05-10 11:00:00+00'),
(1015, 302, 101, '2026-05-12 15:00:00+00'),
(1016, 301, 101, '2025-12-25 10:00:00+00'),
(1016, 304, 102, '2026-05-18 11:00:00+00'),
(1017, 304, 102, '2026-01-30 10:00:00+00'),
(1017, 305, 102, '2026-02-02 11:00:00+00'),
(1018, 306, 103, '2026-03-05 10:00:00+00'),
(1018, 301, 101, '2026-05-26 11:00:00+00'),
(1018, 302, 101, '2026-05-27 15:00:00+00'),
(1018, 303, 101, '2026-05-28 16:00:00+00'),
(1019, 304, 102, '2026-05-29 10:00:00+00')
ON CONFLICT DO NOTHING;

-- 12. Insert Completed Lessons Count
INSERT INTO public.completed_lessons_count (completed_lessons_count, updated_at, course_id, user_id) VALUES
(2, '2025-06-19 11:00:00+00', 101, 1010),
(1, '2026-03-25 15:00:00+00', 102, 1010),
(2, '2025-07-25 14:00:00+00', 102, 1011),
(1, '2026-04-10 11:00:00+00', 103, 1011),
(1, '2025-08-30 09:00:00+00', 103, 1012),
(1, '2026-04-20 16:00:00+00', 101, 1012),
(3, '2025-09-15 15:00:00+00', 101, 1013),
(0, '2026-04-22 16:40:00+00', 102, 1013),
(0, '2025-10-12 11:20:00+00', 102, 1014),
(0, '2026-05-02 13:20:00+00', 103, 1014),
(1, '2025-11-20 10:00:00+00', 103, 1015),
(2, '2026-05-12 15:00:00+00', 101, 1015),
(1, '2025-12-25 10:00:00+00', 101, 1016),
(1, '2026-05-18 11:00:00+00', 102, 1016),
(2, '2026-02-02 11:00:00+00', 102, 1017),
(0, '2026-05-20 16:30:00+00', 103, 1017),
(1, '2026-03-05 10:00:00+00', 103, 1018),
(3, '2026-05-28 16:00:00+00', 101, 1018),
(0, '2026-03-15 17:55:00+00', 101, 1019),
(1, '2026-05-29 10:00:00+00', 102, 1019)
ON CONFLICT (user_id, course_id) DO UPDATE 
SET completed_lessons_count = EXCLUDED.completed_lessons_count, updated_at = EXCLUDED.updated_at;

-- 13. Synchronize Sequences
SELECT setval('public.users_id_seq', COALESCE((SELECT MAX(id) FROM public.users), 1));
SELECT setval('public.orders_id_seq', COALESCE((SELECT MAX(id) FROM public.orders), 1));
SELECT setval('public.order_items_id_seq', COALESCE((SELECT MAX(id) FROM public.order_items), 1));
SELECT setval('public.enrollments_id_seq', COALESCE((SELECT MAX(id) FROM public.enrollments), 1));
SELECT setval('public.wallet_transactions_id_seq', COALESCE((SELECT MAX(id) FROM public.wallet_transactions), 1));
SELECT setval('public.lesson_progress_id_seq', COALESCE((SELECT MAX(id) FROM public.lesson_progress), 1));
