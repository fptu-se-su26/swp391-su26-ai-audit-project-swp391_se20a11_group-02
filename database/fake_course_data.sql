-- 1. Insert Categories
INSERT INTO public.categories (id, name, description) VALUES
(1, 'Web Development', 'Courses related to web application development (Frontend and Backend)'),
(2, 'Computer Science', 'Foundational computer science topics like algorithms, data structures, and databases'),
(3, 'Programming Languages', 'Introduction and advanced courses on popular programming languages')
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Courses
INSERT INTO public.courses (
    id, instructor_id, title, thumbnail_url, short_description, long_description,
    what_you_learn, course_highlight, technology_tool, prerequisites, target_audience,
    completion_benefits, status, price, type, average_rating, total_reviews, total_enrolled,
    total_lessons, total_quizzes, total_videos
) VALUES
(101, 999, 'Java Web Development with Spring Boot', 'https://images.unsplash.com/photo-1555066931-4365d14bab8c', 'Master Spring Boot and build robust web applications.', 'This course takes you from scratch to building enterprise applications with Spring Boot, JPA/Hibernate, Spring Security, and PostgreSQL.', 'Build REST APIs, manage databases with JPA, implement JWT authentication, and deploy applications.', 'Comprehensive coverage of Spring Core, Spring Boot, Spring Security, JPA, and Websockets.', 'Java, Spring Boot, PostgreSQL, Maven', 'Basic Java knowledge', 'Java developers wanting to learn Spring Boot', 'Certificate of Completion, Job Referral Opportunities', 'APPROVED', 199.99, 'WEB_DEVELOPMENT', 4.8, 12, 120, 10, 2, 8),
(102, 999, 'React & TypeScript - The Complete Guide', 'https://images.unsplash.com/photo-1633356122544-f134324a6cee', 'Learn React 19 and TypeScript from beginner to advanced.', 'Dive deep into React with hooks, routing, state management, and modern Tailwind CSS.', 'State management, custom hooks, React Router, Tailwind CSS styling, TypeScript integration.', 'Modern React 19 features, hands-on projects, full Tailwind CSS design system integration.', 'React, TypeScript, Vite, Tailwind CSS', 'Basic JavaScript and HTML/CSS knowledge', 'Frontend developers looking to learn React and TypeScript', 'Build high-performance web applications, styling expertise', 'APPROVED', 149.99, 'FRONTEND', 4.7, 8, 85, 8, 1, 6)
ON CONFLICT (id) DO NOTHING;

-- 3. Insert Chapters
INSERT INTO public.chapters (id, course_id, title, order_index) VALUES
(201, 101, 'Introduction to Spring Boot', 1),
(202, 101, 'Data Access with JPA & Hibernate', 2),
(203, 102, 'React Fundamentals', 1),
(204, 102, 'State Management and Hooks', 2)
ON CONFLICT (id) DO NOTHING;

-- 4. Insert Lessons
INSERT INTO public.lessons (id, chapter_id, title, theory_content, video_url, source_code, is_trial, order_index) VALUES
(301, 201, 'What is Spring Boot?', 'Spring Boot makes it easy to create stand-alone, production-grade Spring-based Applications.', 'https://www.youtube.com/watch?v=srx254u2cO0', 'System.out.println("Hello Spring Boot");', true, 1),
(302, 201, 'Creating your first Spring Boot App', 'Learn how to use Spring Initializr to bootstrap a new Spring Boot project.', 'https://www.youtube.com/watch?v=srx254u2cO0', null, false, 2),
(303, 202, 'Configuring DataSource', 'Set up connection strings, usernames, and passwords for PostgreSQL in application.properties.', null, null, false, 1),
(304, 203, 'Introduction to JSX', 'JSX is a syntax extension to JavaScript that describes what the UI should look like.', 'https://www.youtube.com/watch?v=srx254u2cO0', 'const element = <h1>Hello, world!</h1>;', true, 1),
(305, 204, 'Understanding useState', 'useState is a React Hook that lets you add a state variable to your component.', null, 'const [state, setState] = useState(initialState);', false, 1)
ON CONFLICT (id) DO NOTHING;

-- 5. Insert Course Category Mappings
INSERT INTO public.course_category_mappings (id, course_id, category_id) VALUES
(1, 101, 1),
(2, 101, 3),
(3, 102, 1),
(4, 102, 3)
ON CONFLICT (id) DO NOTHING;

-- 6. Synchronize Sequences
SELECT setval('public.categories_id_seq', COALESCE((SELECT MAX(id) FROM public.categories), 1));
SELECT setval('public.chapters_id_seq', COALESCE((SELECT MAX(id) FROM public.chapters), 1));
SELECT setval('public.lessons_id_seq', COALESCE((SELECT MAX(id) FROM public.lessons), 1));
SELECT setval('public.courses_id_seq', COALESCE((SELECT MAX(id) FROM public.courses), 1));
SELECT setval('public.course_category_mappings_id_seq', COALESCE((SELECT MAX(id) FROM public.course_category_mappings), 1));
