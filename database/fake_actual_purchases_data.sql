-- 1. Insert 10 New Courses under instructor 2 (Văn Quang Nguyễn)
INSERT INTO public.courses (
    id, instructor_id, title, thumbnail_url, short_description, long_description,
    what_you_learn, course_highlight, technology_tool, prerequisites, target_audience,
    completion_benefits, status, price, type, average_rating, total_reviews, total_enrolled,
    total_lessons, total_quizzes, total_videos
) VALUES
(110, 2, 'Next.js 15 App Router & Server Actions', 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97', 'Master Next.js 15, Server Components, and Server Actions.', 'Learn to build server-side rendered, highly interactive web applications using Next.js 15 and React 19.', 'Build real-world apps, master SSR & SSG, secure your endpoints, deploy to Vercel.', 'Full-stack Next.js, Server Actions, middleware, optimization.', 'Next.js, React, Tailwind, TypeScript', 'Basic React knowledge', 'Frontend & Fullstack developers', 'Certificate of Completion', 'APPROVED', 799000.00, 'FRONTEND', 4.9, 8, 0, 2, 0, 2),
(111, 2, 'Docker & Kubernetes for DevOps Engineers', 'https://images.unsplash.com/photo-1607799279861-4dd421887fb3', 'Deploy and orchestrate containerized apps at scale.', 'Deep dive into containerization, networking, persistent storage, and cluster orchestration using Kubernetes.', 'Manage Docker containers, deploy Kubernetes pods, configure ingress, build CI/CD.', 'Production deployment pipelines, multi-container orchestration.', 'Docker, Kubernetes, AWS, GitLab', 'Linux command line basics', 'System Administrators, DevOps Engineers', 'Infrastructure automation skills', 'APPROVED', 899000.00, 'DEVOPS', 4.8, 6, 0, 2, 0, 2),
(112, 2, 'Building Microservices with Go & gRPC', 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4', 'Build highly concurrent, low-latency distributed networks.', 'Learn to structure and connect microservices utilizing Protocol Buffers and gRPC over Go.', 'Write microservices in Go, define protobuf contracts, implement gRPC clients.', 'Concurrent service design, high performance RPC networking.', 'Go, gRPC, Protocol Buffers, RabbitMQ', 'Basic Go knowledge', 'Backend Developers', 'High-performance backend architect expertise', 'APPROVED', 999000.00, 'BACKEND', 4.9, 12, 0, 2, 0, 2),
(113, 2, 'Advanced SQL & Database Performance Tuning', 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d', 'Optimize query performance and tune indexes.', 'Master indexing strategies, execution plans, query optimization, and connection pooling in PostgreSQL.', 'Write complex SQL, debug slow queries, configure index indexes, pool connections.', 'Deep database internal mechanics, tuning techniques.', 'PostgreSQL, PgAdmin, DBeaver', 'Basic SQL queries', 'Database Administrators, Backend Developers', 'SQL optimization mastery', 'APPROVED', 499000.00, 'DATABASE', 4.7, 4, 0, 2, 0, 2),
(114, 2, 'Competitive Programming Masterclass in C++', 'https://images.unsplash.com/photo-1504639725590-34d0984388bd', 'Solve complex algorithmic problems efficiently.', 'Master C++ STL, advanced data structures, math concepts, and dynamic programming for competitive coding.', 'Optimize runtime, use advanced STL containers, solve DP, manipulate bits.', 'Contest-level problem solving, optimizations.', 'C++, STL, GCC', 'C++ syntax basics', 'Computer Science Students, Job Applicants', 'Algorithm contest preparation', 'APPROVED', 699000.00, 'ALGORITHMS', 4.9, 10, 0, 2, 0, 2),
(115, 2, 'Python for Data Science & Machine Learning', 'https://images.unsplash.com/photo-1527474305487-b87b222841cc', 'Analyze data and train predictive AI models.', 'Master Pandas, NumPy, Scikit-Learn, and train linear/logistic regression, decision trees, and neural nets.', 'Analyze datasets, train ML models, plot visualizations, clean data.', 'Hands-on ML pipelines, data analytics.', 'Python, Pandas, Scikit-Learn, Jupyter', 'Basic Python knowledge', 'Aspiring Data Scientists', 'Data Analyst portfolio', 'APPROVED', 1199000.00, 'DATA_SCIENCE', 4.8, 14, 0, 2, 0, 2),
(116, 2, 'Clean Code & Design Patterns in Java', 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b', 'Write maintainable, object-oriented software.', 'Learn SOLID principles, refactoring patterns, and creational, structural, and behavioral design patterns in Java.', 'Apply SOLID, refactor legacy code, use factory/singleton/observer patterns.', 'OOP architectural patterns, clean code principles.', 'Java, JUnit, Maven', 'Java OOP knowledge', 'Software Engineers', 'Architecture engineering skills', 'APPROVED', 599000.00, 'SOFTWARE_ENGINEERING', 4.7, 5, 0, 2, 0, 2),
(117, 2, 'Frontend Performance Optimization', 'https://images.unsplash.com/photo-1547082299-de196ea013d6', 'Build high-performance web pages with 100 lighthouse scores.', 'Learn code splitting, image optimization, lazy loading, bundler configuration, and Core Web Vitals profiling.', 'Optimize images, split bundles, audit sites, profile rendering.', 'Browser rendering pipeline optimizations.', 'JavaScript, Webpack, Vite, Chrome DevTools', 'Basic HTML/CSS/JS', 'Frontend Developers', 'High performance rendering expertise', 'APPROVED', 399000.00, 'FRONTEND', 4.8, 3, 0, 2, 0, 2),
(118, 2, 'Building Scalable APIs with NestJS', 'https://images.unsplash.com/photo-1518770660439-4636190af475', 'Create enterprise NodeJS applications with TypeScript.', 'Master decorators, dependency injection, modules, authentication, and testing in the NestJS framework.', 'Build robust APIs, use dependency injection, secure endpoints, write unit tests.', 'TypeScript server-side development, modular architecture.', 'NestJS, TypeScript, PostgreSQL', 'NodeJS/Express basics', 'Backend Developers', 'Enterprise NodeJS expertise', 'APPROVED', 649000.00, 'BACKEND', 4.9, 7, 0, 2, 0, 2),
(119, 2, 'Introduction to Smart Contracts & Web3', 'https://images.unsplash.com/photo-1621761191319-c6fb62004040', 'Write Solidity smart contracts and deploy Web3 dApps.', 'Learn Ethereum virtual machine, Solidity syntax, smart contract security, and ERC20 tokens.', 'Write Solidity contracts, deploy on testnets, connect Metamask, issue tokens.', 'Decentralized application engineering.', 'Solidity, Hardhat, Ethers.js', 'JavaScript basics', 'Blockchain Developers', 'Blockchain engineer expertise', 'APPROVED', 1299000.00, 'BLOCKCHAIN', 4.6, 2, 0, 2, 0, 2)
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Chapters for New Courses (210-219)
INSERT INTO public.chapters (id, course_id, title, order_index) VALUES
(210, 110, 'Introduction to Next.js 15', 1),
(211, 111, 'Docker Containerization Fundamentals', 1),
(212, 112, 'Go Concurrency & Protocol Buffers', 1),
(213, 113, 'Deep Dive into Query Execution Plans', 1),
(214, 114, 'C++ STL Performance Boosters', 1),
(215, 115, 'Tabular Analysis with Pandas & NumPy', 1),
(216, 116, 'Applying SOLID Principles', 1),
(217, 117, 'Core Web Vitals Metrics & Audits', 1),
(218, 118, 'Modular Structure & DI in NestJS', 1),
(219, 119, 'Solidity Syntax & Deployment', 1)
ON CONFLICT (id) DO NOTHING;

-- 3. Insert Lessons (310-329)
INSERT INTO public.lessons (id, chapter_id, title, theory_content, video_url, source_code, is_trial, order_index) VALUES
(310, 210, 'React Server Components vs Client Components', 'RSC render on server to reduce client bundle size.', null, null, true, 1),
(311, 210, 'Setting up Server Actions', 'Define functions with "use server" to execute database writes.', null, null, false, 2),
(312, 211, 'Writing your first Dockerfile', 'Learn docker directives like FROM, RUN, EXPOSE.', null, null, true, 1),
(313, 211, 'Configuring docker-compose.yml', 'Define networks, volumes, and multiple backend-db services.', null, null, false, 2),
(314, 212, 'Defining Protocol Buffers contracts', 'Use syntax = "proto3" to specify messages and services.', null, null, true, 1),
(315, 212, 'Creating a gRPC Server in Go', 'Implement generated interface and listen on TCP.', null, null, false, 2),
(316, 213, 'Reading EXPLAIN ANALYZE output', 'Analyze index scans vs sequential scans.', null, null, true, 1),
(317, 213, 'Creating Partial and Composite Indexes', 'Speed up filters with targeted DB indexing.', null, null, false, 2),
(318, 214, 'Custom Comparators in std::sort', 'Pass lambda or struct comparators to sort complex objects.', null, null, true, 1),
(319, 214, 'Fast I/O configurations in C++', 'Use ios_base::sync_with_stdio(false) to optimize std::cin.', null, null, false, 2),
(320, 215, 'Pandas DataFrames Manipulation', 'Select, filter, and group data using pandas methods.', null, null, true, 1),
(321, 215, 'Broadcasting operations in NumPy', 'Perform element-wise matrix math efficiently.', null, null, false, 2),
(322, 216, 'Single Responsibility Principle in action', 'Separate database queries from presentation templates.', null, null, true, 1),
(323, 216, 'Factory Pattern vs Builder Pattern', 'Decouple object instantiation using structural factories.', null, null, false, 2),
(324, 217, 'Measuring Largest Contentful Paint', 'Find elements delaying browser rendering.', null, null, true, 1),
(325, 217, 'Code Splitting with React.lazy', 'Load route bundles on demand to reduce script parsing time.', null, null, false, 2),
(326, 218, 'Creating custom NestJS Decorators', 'Create parameter decorators to parse request cookies.', null, null, true, 1),
(327, 218, 'Mocking services in controller tests', 'Use overrideProvider to provide test mocks.', null, null, false, 2),
(328, 219, 'Introduction to Solidity variables', 'Understand state variables, local variables, and view modifier.', null, null, true, 1),
(329, 219, 'Writing ERC20 token contracts', 'Inherit OpenZeppelin standards to deploy secure token contracts.', null, null, false, 2)
ON CONFLICT (id) DO NOTHING;

-- 4. Insert 10 New Customer Accounts (1020-1029)
INSERT INTO public.users (id, username, password_hash, displayname, email, score, status, created_at) VALUES
(1020, 'customer_1', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Nguyễn Hải Đăng', 'customer1@gmail.com', 50, 'ACTIVE', '2025-06-05 10:00:00+00'),
(1021, 'customer_2', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Trần Quốc Anh', 'customer2@gmail.com', 120, 'ACTIVE', '2025-07-05 10:00:00+00'),
(1022, 'customer_3', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Phạm Thu Thảo', 'customer3@gmail.com', 80, 'ACTIVE', '2025-08-05 10:00:00+00'),
(1023, 'customer_4', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Lê Minh Hoàng', 'customer4@gmail.com', 190, 'ACTIVE', '2025-09-05 10:00:00+00'),
(1024, 'customer_5', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Hoàng Anh Thư', 'customer5@gmail.com', 30, 'ACTIVE', '2025-10-05 10:00:00+00'),
(1025, 'customer_6', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Đặng Gia Huy', 'customer6@gmail.com', 140, 'ACTIVE', '2025-11-05 10:00:00+00'),
(1026, 'customer_7', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Ngô Khánh Vy', 'customer7@gmail.com', 250, 'ACTIVE', '2025-12-05 10:00:00+00'),
(1027, 'customer_8', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Vũ Hải Nam', 'customer8@gmail.com', 70, 'ACTIVE', '2026-01-05 10:00:00+00'),
(1028, 'customer_9', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Lâm Bích Thuỷ', 'customer9@gmail.com', 110, 'ACTIVE', '2026-02-05 10:00:00+00'),
(1029, 'customer_10', '$2a$10$7R9g.K2Xg8e67R.P.pP59.hZpM1e6Rz4.B7K7r.3Qe7Rz4.B7K7r.', 'Đỗ Hữu Phước', 'customer10@gmail.com', 160, 'ACTIVE', '2026-03-05 10:00:00+00')
ON CONFLICT (id) DO NOTHING;

-- Map roles to USER role (role_id 2)
INSERT INTO public.user_roles (user_id, role_id) VALUES
(1020, 2), (1021, 2), (1022, 2), (1023, 2), (1024, 2),
(1025, 2), (1026, 2), (1027, 2), (1028, 2), (1029, 2)
ON CONFLICT DO NOTHING;

-- Create wallets for the 10 customers
INSERT INTO public.wallets (user_id, balance, status) VALUES
(1020, 0.00, 'ACTIVE'),
(1021, 0.00, 'ACTIVE'),
(1022, 0.00, 'ACTIVE'),
(1023, 0.00, 'ACTIVE'),
(1024, 0.00, 'ACTIVE'),
(1025, 0.00, 'ACTIVE'),
(1026, 0.00, 'ACTIVE'),
(1027, 0.00, 'ACTIVE'),
(1028, 0.00, 'ACTIVE'),
(1029, 0.00, 'ACTIVE')
ON CONFLICT (user_id) DO NOTHING;

-- 5. Insert Orders (representing purchases of new courses 110-119 spread across past 12 months)
INSERT INTO public.orders (id, user_id, total_amount, status, created_at, updated_at) VALUES
(6001, 1020, 799000.00, 'COMPLETED', '2025-06-20 14:00:00+00', '2025-06-20 14:00:00+00'),
(6002, 1020, 899000.00, 'COMPLETED', '2025-06-25 15:30:00+00', '2025-06-25 15:30:00+00'),
(6003, 1021, 999000.00, 'COMPLETED', '2025-07-15 09:10:00+00', '2025-07-15 09:10:00+00'),
(6004, 1021, 499000.00, 'COMPLETED', '2025-07-22 10:15:00+00', '2025-07-22 10:15:00+00'),
(6005, 1022, 699000.00, 'COMPLETED', '2025-08-10 11:20:00+00', '2025-08-10 11:20:00+00'),
(6006, 1023, 1199000.00, 'COMPLETED', '2025-09-08 15:10:00+00', '2025-09-08 15:10:00+00'),
(6007, 1023, 599000.00, 'COMPLETED', '2025-09-12 16:20:00+00', '2025-09-12 16:20:00+00'),
(6008, 1023, 399000.00, 'COMPLETED', '2025-09-18 10:30:00+00', '2025-09-18 10:30:00+00'),
(6009, 1024, 649000.00, 'COMPLETED', '2025-10-05 14:40:00+00', '2025-10-05 14:40:00+00'),
(6010, 1024, 1299000.00, 'COMPLETED', '2025-10-15 11:10:00+00', '2025-10-15 11:10:00+00'),
(6011, 1025, 799000.00, 'COMPLETED', '2025-11-02 09:20:00+00', '2025-11-02 09:20:00+00'),
(6012, 1025, 999000.00, 'COMPLETED', '2025-11-12 10:50:00+00', '2025-11-12 10:50:00+00'),
(6013, 1026, 699000.00, 'COMPLETED', '2025-12-05 16:15:00+00', '2025-12-05 16:15:00+00'),
(6014, 1026, 1199000.00, 'COMPLETED', '2025-12-18 15:00:00+00', '2025-12-18 15:00:00+00'),
(6015, 1026, 899000.00, 'COMPLETED', '2025-12-25 10:00:00+00', '2025-12-25 10:00:00+00'),
(6016, 1027, 599000.00, 'COMPLETED', '2026-01-12 11:25:00+00', '2026-01-12 11:25:00+00'),
(6017, 1027, 649000.00, 'COMPLETED', '2026-01-20 14:15:00+00', '2026-01-20 14:15:00+00'),
(6018, 1028, 399000.00, 'COMPLETED', '2026-02-15 16:30:00+00', '2026-02-15 16:30:00+00'),
(6019, 1028, 1299000.00, 'COMPLETED', '2026-02-22 09:12:00+00', '2026-02-22 09:12:00+00'),
(6020, 1029, 799000.00, 'COMPLETED', '2026-03-08 10:45:00+00', '2026-03-08 10:45:00+00'),
(6021, 1029, 499000.00, 'COMPLETED', '2026-03-18 14:35:00+00', '2026-03-18 14:35:00+00'),
(6022, 1020, 999000.00, 'COMPLETED', '2026-04-10 11:55:00+00', '2026-04-10 11:55:00+00'),
(6023, 1021, 699000.00, 'COMPLETED', '2026-04-18 16:10:00+00', '2026-04-18 16:10:00+00'),
(6024, 1021, 599000.00, 'COMPLETED', '2026-04-25 15:00:00+00', '2026-04-25 15:00:00+00'),
(6025, 1022, 1199000.00, 'COMPLETED', '2026-05-02 09:20:00+00', '2026-05-02 09:20:00+00'),
(6026, 1023, 799000.00, 'COMPLETED', '2026-05-10 10:40:00+00', '2026-05-10 10:40:00+00'),
(6027, 1024, 899000.00, 'COMPLETED', '2026-05-15 14:12:00+00', '2026-05-15 14:12:00+00'),
(6028, 1025, 499000.00, 'COMPLETED', '2026-05-18 11:35:00+00', '2026-05-18 11:35:00+00'),
(6029, 1026, 399000.00, 'COMPLETED', '2026-05-20 16:45:00+00', '2026-05-20 16:45:00+00'),
(6030, 1027, 1299000.00, 'COMPLETED', '2026-05-22 09:10:00+00', '2026-05-22 09:10:00+00'),
(6031, 1028, 649000.00, 'COMPLETED', '2026-05-25 14:22:00+00', '2026-05-25 14:22:00+00'),
(6032, 1029, 699000.00, 'COMPLETED', '2026-05-28 11:50:00+00', '2026-05-28 11:50:00+00')
ON CONFLICT (id) DO NOTHING;

-- 6. Insert Order Items
INSERT INTO public.order_items (id, order_id, course_id, price) VALUES
(6001, 6001, 110, 799000.00),
(6002, 6002, 111, 899000.00),
(6003, 6003, 112, 999000.00),
(6004, 6004, 113, 499000.00),
(6005, 6005, 114, 699000.00),
(6006, 6006, 115, 1199000.00),
(6007, 6007, 116, 599000.00),
(6008, 6008, 117, 399000.00),
(6009, 6009, 118, 649000.00),
(6010, 6010, 119, 1299000.00),
(6011, 6011, 110, 799000.00),
(6012, 6012, 112, 999000.00),
(6013, 6013, 114, 699000.00),
(6014, 6014, 115, 1199000.00),
(6015, 6015, 111, 899000.00),
(6016, 6016, 116, 599000.00),
(6017, 6017, 118, 649000.00),
(6018, 6018, 117, 399000.00),
(6019, 6019, 119, 1299000.00),
(6020, 6020, 110, 799000.00),
(6021, 6021, 113, 499000.00),
(6022, 6022, 112, 999000.00),
(6023, 6023, 114, 699000.00),
(6024, 6024, 116, 599000.00),
(6025, 6025, 115, 1199000.00),
(6026, 6026, 110, 799000.00),
(6027, 6027, 111, 899000.00),
(6028, 6028, 113, 499000.00),
(6029, 6029, 117, 399000.00),
(6030, 6030, 119, 1299000.00),
(6031, 6031, 118, 649000.00),
(6032, 6032, 114, 699000.00)
ON CONFLICT (id) DO NOTHING;

-- 7. Insert Enrollments
INSERT INTO public.enrollments (id, user_id, course_id, enrolled_at, status) VALUES
(6001, 1020, 110, '2025-06-20 14:00:00+00', 'ACTIVE'),
(6002, 1020, 111, '2025-06-25 15:30:00+00', 'ACTIVE'),
(6003, 1021, 112, '2025-07-15 09:10:00+00', 'ACTIVE'),
(6004, 1021, 113, '2025-07-22 10:15:00+00', 'ACTIVE'),
(6005, 1022, 114, '2025-08-10 11:20:00+00', 'ACTIVE'),
(6006, 1023, 115, '2025-09-08 15:10:00+00', 'ACTIVE'),
(6007, 1023, 116, '2025-09-12 16:20:00+00', 'ACTIVE'),
(6008, 1023, 117, '2025-09-18 10:30:00+00', 'ACTIVE'),
(6009, 1024, 118, '2025-10-05 14:40:00+00', 'ACTIVE'),
(6010, 1024, 119, '2025-10-15 11:10:00+00', 'ACTIVE'),
(6011, 1025, 110, '2025-11-02 09:20:00+00', 'ACTIVE'),
(6012, 1025, 112, '2025-11-12 10:50:00+00', 'ACTIVE'),
(6013, 1026, 114, '2025-12-05 16:15:00+00', 'ACTIVE'),
(6014, 1026, 115, '2025-12-18 15:00:00+00', 'ACTIVE'),
(6015, 1026, 111, '2025-12-25 10:00:00+00', 'ACTIVE'),
(6016, 1027, 116, '2026-01-12 11:25:00+00', 'ACTIVE'),
(6017, 1027, 118, '2026-01-20 14:15:00+00', 'ACTIVE'),
(6018, 1028, 117, '2026-02-15 16:30:00+00', 'ACTIVE'),
(6019, 1028, 119, '2026-02-22 09:12:00+00', 'ACTIVE'),
(6020, 1029, 110, '2026-03-08 10:45:00+00', 'ACTIVE'),
(6021, 1029, 113, '2026-03-18 14:35:00+00', 'ACTIVE'),
(6022, 1020, 112, '2026-04-10 11:55:00+00', 'ACTIVE'),
(6023, 1021, 114, '2026-04-18 16:10:00+00', 'ACTIVE'),
(6024, 1021, 116, '2026-04-25 15:00:00+00', 'ACTIVE'),
(6025, 1022, 115, '2026-05-02 09:20:00+00', 'ACTIVE'),
(6026, 1023, 110, '2026-05-10 10:40:00+00', 'ACTIVE'),
(6027, 1024, 111, '2026-05-15 14:12:00+00', 'ACTIVE'),
(6028, 1025, 113, '2026-05-18 11:35:00+00', 'ACTIVE'),
(6029, 1026, 117, '2026-05-20 16:45:00+00', 'ACTIVE'),
(6030, 1027, 119, '2026-05-22 09:10:00+00', 'ACTIVE'),
(6031, 1028, 118, '2026-05-25 14:22:00+00', 'ACTIVE'),
(6032, 1029, 114, '2026-05-28 11:50:00+00', 'ACTIVE')
ON CONFLICT (id) DO NOTHING;

-- 8. Insert Wallet Transactions
INSERT INTO public.wallet_transactions (id, wallet_id, amount, type, status, created_at, order_id) VALUES
(6001, (SELECT id FROM public.wallets WHERE user_id = 1020), 799000.00, 'BUY_COURSE', 'SUCCESS', '2025-06-20 14:00:00+00', 6001),
(6002, (SELECT id FROM public.wallets WHERE user_id = 1020), 899000.00, 'BUY_COURSE', 'SUCCESS', '2025-06-25 15:30:00+00', 6002),
(6003, (SELECT id FROM public.wallets WHERE user_id = 1021), 999000.00, 'BUY_COURSE', 'SUCCESS', '2025-07-15 09:10:00+00', 6003),
(6004, (SELECT id FROM public.wallets WHERE user_id = 1021), 499000.00, 'BUY_COURSE', 'SUCCESS', '2025-07-22 10:15:00+00', 6004),
(6005, (SELECT id FROM public.wallets WHERE user_id = 1022), 699000.00, 'BUY_COURSE', 'SUCCESS', '2025-08-10 11:20:00+00', 6005),
(6006, (SELECT id FROM public.wallets WHERE user_id = 1023), 1199000.00, 'BUY_COURSE', 'SUCCESS', '2025-09-08 15:10:00+00', 6006),
(6007, (SELECT id FROM public.wallets WHERE user_id = 1023), 599000.00, 'BUY_COURSE', 'SUCCESS', '2025-09-12 16:20:00+00', 6007),
(6008, (SELECT id FROM public.wallets WHERE user_id = 1023), 399000.00, 'BUY_COURSE', 'SUCCESS', '2025-09-18 10:30:00+00', 6008),
(6009, (SELECT id FROM public.wallets WHERE user_id = 1024), 649000.00, 'BUY_COURSE', 'SUCCESS', '2025-10-05 14:40:00+00', 6009),
(6010, (SELECT id FROM public.wallets WHERE user_id = 1024), 1299000.00, 'BUY_COURSE', 'SUCCESS', '2025-10-15 11:10:00+00', 6010),
(6011, (SELECT id FROM public.wallets WHERE user_id = 1025), 799000.00, 'BUY_COURSE', 'SUCCESS', '2025-11-02 09:20:00+00', 6011),
(6012, (SELECT id FROM public.wallets WHERE user_id = 1025), 999000.00, 'BUY_COURSE', 'SUCCESS', '2025-11-12 10:50:00+00', 6012),
(6013, (SELECT id FROM public.wallets WHERE user_id = 1026), 699000.00, 'BUY_COURSE', 'SUCCESS', '2025-12-05 16:15:00+00', 6013),
(6014, (SELECT id FROM public.wallets WHERE user_id = 1026), 1199000.00, 'BUY_COURSE', 'SUCCESS', '2025-12-18 15:00:00+00', 6014),
(6015, (SELECT id FROM public.wallets WHERE user_id = 1026), 899000.00, 'BUY_COURSE', 'SUCCESS', '2025-12-25 10:00:00+00', 6015),
(6016, (SELECT id FROM public.wallets WHERE user_id = 1027), 599000.00, 'BUY_COURSE', 'SUCCESS', '2026-01-12 11:25:00+00', 6016),
(6017, (SELECT id FROM public.wallets WHERE user_id = 1027), 649000.00, 'BUY_COURSE', 'SUCCESS', '2026-01-20 14:15:00+00', 6017),
(6018, (SELECT id FROM public.wallets WHERE user_id = 1028), 399000.00, 'BUY_COURSE', 'SUCCESS', '2026-02-15 16:30:00+00', 6018),
(6019, (SELECT id FROM public.wallets WHERE user_id = 1028), 1299000.00, 'BUY_COURSE', 'SUCCESS', '2026-02-22 09:12:00+00', 6019),
(6020, (SELECT id FROM public.wallets WHERE user_id = 1029), 799000.00, 'BUY_COURSE', 'SUCCESS', '2026-03-08 10:45:00+00', 6020),
(6021, (SELECT id FROM public.wallets WHERE user_id = 1029), 499000.00, 'BUY_COURSE', 'SUCCESS', '2026-03-18 14:35:00+00', 6021),
(6022, (SELECT id FROM public.wallets WHERE user_id = 1020), 999000.00, 'BUY_COURSE', 'SUCCESS', '2026-04-10 11:55:00+00', 6022),
(6023, (SELECT id FROM public.wallets WHERE user_id = 1021), 699000.00, 'BUY_COURSE', 'SUCCESS', '2026-04-18 16:10:00+00', 6023),
(6024, (SELECT id FROM public.wallets WHERE user_id = 1021), 599000.00, 'BUY_COURSE', 'SUCCESS', '2026-04-25 15:00:00+00', 6024),
(6025, (SELECT id FROM public.wallets WHERE user_id = 1022), 1199000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-02 09:20:00+00', 6025),
(6026, (SELECT id FROM public.wallets WHERE user_id = 1023), 799000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-10 10:40:00+00', 6026),
(6027, (SELECT id FROM public.wallets WHERE user_id = 1024), 899000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-15 14:12:00+00', 6027),
(6028, (SELECT id FROM public.wallets WHERE user_id = 1025), 499000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-18 11:35:00+00', 6028),
(6029, (SELECT id FROM public.wallets WHERE user_id = 1026), 399000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-20 16:45:00+00', 6029),
(6030, (SELECT id FROM public.wallets WHERE user_id = 1027), 1299000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-22 09:10:00+00', 6030),
(6031, (SELECT id FROM public.wallets WHERE user_id = 1028), 649000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-25 14:22:00+00', 6031),
(6032, (SELECT id FROM public.wallets WHERE user_id = 1029), 699000.00, 'BUY_COURSE', 'SUCCESS', '2026-05-28 11:50:00+00', 6032)
ON CONFLICT (id) DO NOTHING;

-- 9. Update total_enrolled counter in courses table
UPDATE public.courses
SET total_enrolled = (SELECT COUNT(*) FROM public.enrollments WHERE course_id = courses.id)
WHERE id BETWEEN 110 AND 119;

-- 10. Insert Lesson Progress
INSERT INTO public.lesson_progress (user_id, lesson_id, course_id, completed_at) VALUES
(1020, 310, 110, '2025-06-21 10:00:00+00'),
(1020, 311, 110, '2025-06-22 11:00:00+00'),
(1020, 312, 111, '2025-06-28 15:00:00+00'),
(1021, 314, 112, '2025-07-17 10:00:00+00'),
(1021, 315, 112, '2025-07-19 14:00:00+00'),
(1021, 316, 113, '2025-07-25 11:00:00+00'),
(1022, 318, 114, '2025-08-15 09:00:00+00'),
(1023, 320, 115, '2025-09-09 16:00:00+00'),
(1023, 321, 115, '2025-09-10 10:00:00+00'),
(1023, 322, 116, '2025-09-14 11:00:00+00'),
(1024, 326, 118, '2025-10-07 10:00:00+00'),
(1024, 327, 118, '2025-10-09 11:00:00+00'),
(1024, 328, 119, '2025-10-18 15:00:00+00'),
(1025, 310, 110, '2025-11-05 10:00:00+00'),
(1025, 314, 112, '2025-11-15 11:00:00+00'),
(1026, 318, 114, '2025-12-08 10:00:00+00'),
(1026, 319, 114, '2025-12-10 11:00:00+00'),
(1026, 320, 115, '2025-12-20 15:00:00+00'),
(1027, 322, 116, '2026-01-15 10:00:00+00'),
(1027, 323, 116, '2026-01-18 11:00:00+00'),
(1027, 326, 118, '2026-01-25 15:00:00+00'),
(1028, 324, 117, '2026-02-18 10:00:00+00'),
(1028, 325, 117, '2026-02-20 11:00:00+00'),
(1029, 316, 113, '2026-03-20 10:00:00+00'),
(1029, 317, 113, '2026-03-22 11:00:00+00'),
(1020, 314, 112, '2026-04-12 10:00:00+00'),
(1021, 322, 116, '2026-04-28 11:00:00+00'),
(1022, 320, 115, '2026-05-05 10:00:00+00'),
(1023, 310, 110, '2026-05-12 11:00:00+00'),
(1023, 311, 110, '2026-05-14 15:00:00+00'),
(1024, 312, 111, '2026-05-18 10:00:00+00'),
(1024, 313, 111, '2026-05-20 11:00:00+00'),
(1025, 316, 113, '2026-05-21 10:00:00+00'),
(1026, 324, 117, '2026-05-22 11:00:00+00'),
(1027, 328, 119, '2026-05-25 10:00:00+00'),
(1027, 329, 119, '2026-05-26 11:00:00+00'),
(1029, 318, 114, '2026-05-29 10:00:00+00')
ON CONFLICT DO NOTHING;

-- 11. Insert Completed Lessons Count
INSERT INTO public.completed_lessons_count (completed_lessons_count, updated_at, course_id, user_id) VALUES
(2, '2025-06-22 11:00:00+00', 110, 1020),
(1, '2025-06-28 15:00:00+00', 111, 1020),
(2, '2025-07-19 14:00:00+00', 112, 1021),
(1, '2025-07-25 11:00:00+00', 113, 1021),
(1, '2025-08-15 09:00:00+00', 114, 1022),
(2, '2025-09-10 10:00:00+00', 115, 1023),
(1, '2025-09-14 11:00:00+00', 116, 1023),
(0, '2025-09-18 10:30:00+00', 117, 1023),
(2, '2025-10-09 11:00:00+00', 118, 1024),
(1, '2025-10-18 15:00:00+00', 119, 1024),
(1, '2025-11-05 10:00:00+00', 110, 1025),
(1, '2025-11-15 11:00:00+00', 112, 1025),
(2, '2025-12-10 11:00:00+00', 114, 1026),
(1, '2025-12-20 15:00:00+00', 115, 1026),
(0, '2025-12-25 10:00:00+00', 111, 1026),
(2, '2026-01-18 11:00:00+00', 116, 1027),
(1, '2026-01-25 15:00:00+00', 118, 1027),
(2, '2026-02-20 11:00:00+00', 117, 1028),
(0, '2026-02-22 09:12:00+00', 119, 1028),
(0, '2026-03-08 10:45:00+00', 110, 1029),
(2, '2026-03-22 11:00:00+00', 113, 1029),
(1, '2026-04-12 10:00:00+00', 112, 1020),
(0, '2026-04-18 16:10:00+00', 114, 1021),
(1, '2026-04-28 11:00:00+00', 116, 1021),
(1, '2026-05-05 10:00:00+00', 115, 1022),
(2, '2026-05-14 15:00:00+00', 110, 1023),
(2, '2026-05-20 11:00:00+00', 111, 1024),
(1, '2026-05-21 10:00:00+00', 113, 1025),
(1, '2026-05-22 11:00:00+00', 117, 1026),
(2, '2026-05-26 11:00:00+00', 119, 1027),
(0, '2026-05-25 14:22:00+00', 118, 1028),
(1, '2026-05-29 10:00:00+00', 114, 1029)
ON CONFLICT (user_id, course_id) DO UPDATE 
SET completed_lessons_count = EXCLUDED.completed_lessons_count, updated_at = EXCLUDED.updated_at;

-- 12. Synchronize Sequences
SELECT setval('public.users_id_seq', COALESCE((SELECT MAX(id) FROM public.users), 1));
SELECT setval('public.orders_id_seq', COALESCE((SELECT MAX(id) FROM public.orders), 1));
SELECT setval('public.order_items_id_seq', COALESCE((SELECT MAX(id) FROM public.order_items), 1));
SELECT setval('public.enrollments_id_seq', COALESCE((SELECT MAX(id) FROM public.enrollments), 1));
SELECT setval('public.wallet_transactions_id_seq', COALESCE((SELECT MAX(id) FROM public.wallet_transactions), 1));
SELECT setval('public.lesson_progress_id_seq', COALESCE((SELECT MAX(id) FROM public.lesson_progress), 1));
