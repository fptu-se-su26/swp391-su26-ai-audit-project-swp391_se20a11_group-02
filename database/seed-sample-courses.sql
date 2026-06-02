BEGIN;

-- 1. Insert or update categories and capture their auto-incremented IDs
WITH inserted_categories AS (
    INSERT INTO public.categories (name, description) VALUES
    ('Web Development', 'Learn HTML, CSS, JavaScript, React, Spring Boot, and enterprise web architecture.'),
    ('Mobile Development', 'Learn Flutter, React Native, Swift, Kotlin, and cross-platform mobile patterns.'),
    ('Programming Languages', 'Master compiled and interpreted languages including Python, Java, C++, and C#.'),
    ('Database & Cloud', 'Master SQL, PostgreSQL, database modeling, AWS, Docker, and distributed systems.')
    ON CONFLICT (name) DO UPDATE SET 
        description = EXCLUDED.description
    RETURNING id, name
),

-- 2. Insert or update courses and capture their auto-incremented IDs
inserted_courses AS (
    INSERT INTO public.courses (
        instructor_id, title, thumbnail_url, short_description, long_description,
        what_you_learn, course_highlight, technology_tool, prerequisites, target_audience,
        completion_benefits, status, price, type, average_rating, total_reviews, total_enrolled,
        total_lessons, total_quizzes, total_videos
    ) VALUES
    (1, 'Introduction to Java Programming', 'https://example.com/thumbnails/java-basic.png', 
     'Master the fundamentals of Java programming, object-oriented concepts, and core software design.', 
     'This comprehensive course covers Java syntax, object-oriented programming (OOP) principles, inheritance, polymorphism, Java Collection Framework, exception handling, and input/output streams.',
     'Core Java syntax & data types\nObject-Oriented Programming (OOP) principles\nJava Collections & exception handling', '24/7 dedicated mentor support\nHands-on coding exercises with real-world scenarios',
     'JDK 21, IntelliJ IDEA', 'No prior programming experience required', 'Computer Science students, aspiring software engineers',
     'Build a strong foundation in Java and object-oriented software engineering', 'APPROVED'::public.course_status, 199000.00, 'PREMIUM', 4.5, 12, 120, 25, 5, 20),

    (1, 'Building RESTful Web Services with Spring Boot', 'https://example.com/thumbnails/spring-boot.png', 
     'Architect and implement enterprise-grade, high-performance RESTful APIs using Spring Boot and PostgreSQL.', 
     'Learn the core Spring Framework, Dependency Injection (DI), Spring Boot autoconfiguration, data persistence with Spring Data JPA, Spring Security, and JWT-based authentication.',
     'Enterprise REST API design\nSpring Security and OAuth2/JWT\nData persistence with Spring Data JPA', 'Industry-aligned production project\nAdvanced database query optimization techniques',
     'Java 21, Spring Boot 3, PostgreSQL, IntelliJ IDEA', 'Strong understanding of core Java and basic SQL', 'Backend developers looking to master enterprise Java frameworks',
     'Become proficient in developing secure and scalable enterprise backend services', 'APPROVED'::public.course_status, 299000.00, 'PREMIUM', 4.8, 18, 150, 30, 8, 25),

    (1, 'ReactJS Front-End Engineering', 'https://example.com/thumbnails/reactjs.png', 
     'Build scalable and highly responsive user interfaces using React, Hooks, Redux Toolkit, and performance optimization.', 
     'Dive deep into React state management, component lifecycle, Hooks, Context API, Redux Toolkit, and production-grade routing with React Router.',
     'Declarative UI rendering\nGlobal state management with Redux Toolkit\nReact performance profiling and optimization', 'Large-scale real-world project builds\nComprehensive code reviews and best practices',
     'VS Code, NodeJS, React 18', 'Basic knowledge of HTML, CSS, and modern JavaScript (ES6+)', 'Front-end developers aiming to level up to engineering standards',
     'Master the most popular frontend library and build production-grade single-page applications', 'APPROVED'::public.course_status, 249000.00, 'PREMIUM', 4.7, 15, 95, 28, 6, 22),

    (1, 'Data Structures and Algorithms in C++', 'https://example.com/thumbnails/dsa-cpp.png', 
     'Develop rigorous algorithmic thinking by mastering complex data structures and optimization algorithms using C++.', 
     'Explore arrays, linked lists, stacks, queues, trees, graphs, sorting, searching, and advanced dynamic programming strategies in C++.',
     'Complex data structures implementation\nAlgorithm analysis & Big-O complexity\nDynamic programming & recursion', 'Highly visual explanations of complex algorithms\nComprehensive set of practice problems with solutions',
     'C++ Compiler, VS Code', 'Basic understanding of programming logic and loops', 'Students preparing for technical interviews at top-tier tech companies',
     'Develop elite problem-solving capabilities and pass strict coding assessments', 'APPROVED'::public.course_status, 150000.00, 'PREMIUM', 4.6, 25, 210, 40, 15, 35),

    (1, 'Mobile Application Development with Flutter', 'https://example.com/thumbnails/flutter.png', 
     'Build high-performance, cross-platform native mobile applications for iOS and Android using Flutter and Dart.', 
     'Learn Dart, custom widget design, state management (Provider, Bloc), REST API integration, push notifications, and Firebase backend integration.',
     'Flutter widgets & UI design\nState management using Bloc & Provider\nNative feature integration & deployment', 'Cross-platform deployment guidelines\nSource code repository included',
     'Flutter SDK, Android Studio, Xcode', 'Good understanding of OOP principles', 'Developers wanting to build high-performance mobile apps from a single codebase',
     'Develop and publish production-grade mobile applications on App Store and Google Play', 'APPROVED'::public.course_status, 350000.00, 'PREMIUM', 4.4, 8, 80, 35, 10, 30),

    (1, 'Python for Data Science and Machine Learning', 'https://example.com/thumbnails/python-ds.png', 
     'Unlock the power of data by mastering Python, data analysis libraries, and machine learning models from scratch.', 
     'Acquire hands-on expertise in NumPy, Pandas, Matplotlib, Seaborn, Scikit-Learn, and regression/classification model architectures.',
     'Data manipulation & exploratory data analysis (EDA)\nMachine Learning model training & evaluation\nStatistical analysis with Python', 'Real-world datasets for practice\nPractical focus with minimal abstract theory',
     'Anaconda, Jupyter Notebook, Python 3', 'No math or programming prerequisites required', 'Aspiring Data Analysts, Data Scientists, and Machine Learning engineers',
     'Harness data science skills to extract insights and build predictive models', 'APPROVED'::public.course_status, 299000.00, 'PREMIUM', 4.5, 10, 110, 24, 4, 18),

    (1, 'Introduction to Database Systems and SQL', 'https://example.com/thumbnails/sql.png', 
     'Learn the foundational concepts of relational database management systems (RDBMS) and structured query language (SQL).', 
     'Master DDL/DML, multi-table JOINs, aggregations, subqueries, database normalization (1NF, 2NF, 3NF), indexing, and transactional isolation levels.',
     'Complex database query writing\nDatabase schema modeling & normalization\nIndexing and query optimization', 'Interactive learning with practice queries\nInstant query feedback',
     'PostgreSQL, DBeaver', 'No prior computer science experience required', 'Beginners, Business Analysts, Quality Assurance engineers',
     'Write complex SQL queries confidently to manage and analyze data', 'APPROVED'::public.course_status, 0.00, 'FREE', 4.9, 50, 450, 15, 5, 12),

    (1, 'Object-Oriented Programming with C#', 'https://example.com/thumbnails/csharp.png', 
     'Master object-oriented programming (OOP) principles, LINQ, and asynchronous programming in C#.', 
     'Study C# syntax, class design, interfaces, encapsulation, polymorphism, delegates, events, LINQ queries, and asynchronous programming using async/await.',
     'Advanced C# syntax & async patterns\nObject-Oriented design patterns\nLanguage Integrated Query (LINQ)', 'Academically rigorous coursework\nHands-on programming projects',
     '.NET 8 SDK, Visual Studio', 'No prior programming experience required', 'Aspiring game developers (Unity) and enterprise .NET developers',
     'Build a robust foundation to transition into Unity Game development or enterprise .NET backend engineering', 'APPROVED'::public.course_status, 199000.00, 'PREMIUM', 4.6, 9, 75, 22, 6, 16),

    (1, 'Go Web Architecture and Backend Engineering', 'https://example.com/thumbnails/golang.png', 
     'Engineer high-throughput, low-latency web backends and microservices using Go, concurrent patterns, and Gin Gonic framework.', 
     'Master Go concurrency (Goroutines, Channels), clean architecture patterns, Gin framework, connection pooling with GORM, and Redis caching.',
     'Go Concurrency models\nGin Web Framework & routing\nScalable microservices architecture', 'Designing high-concurrency systems\nMemory footprint optimization tips',
     'Go SDK, VS Code', 'Experience with any backend language (NodeJS, Python, Java)', 'Backend developers aiming for top-tier low-latency systems',
     'Build exceptionally fast backend systems capable of handling millions of requests', 'APPROVED'::public.course_status, 399000.00, 'PREMIUM', 4.7, 14, 130, 30, 8, 24),

    (1, 'Foundations of Web Design: HTML5 & CSS3', 'https://example.com/thumbnails/html-css.png', 
     'Learn the core markup and styling technologies of the web to build fully responsive and accessible user interfaces.', 
     'Master HTML5 semantics, CSS3 layouts (Flexbox and Grid), responsive web design, media queries, accessibility standards, and web typography.',
     'Semantic HTML5 structure\nCSS3 layouts using Flexbox and Grid\nResponsive design & media queries', 'Build real-world landing pages from scratch\nFocus on accessibility (WCAG) guidelines',
     'VS Code, Web Browser', 'No prior technical experience required', 'Students, hobbyists, aspiring front-end developers',
     'Hand-craft beautiful, clean, responsive, and mobile-friendly web pages', 'APPROVED'::public.course_status, 0.00, 'FREE', 4.8, 42, 380, 12, 3, 10)
    ON CONFLICT (title) DO UPDATE SET
        instructor_id = EXCLUDED.instructor_id,
        thumbnail_url = EXCLUDED.thumbnail_url,
        short_description = EXCLUDED.short_description,
        long_description = EXCLUDED.long_description,
        what_you_learn = EXCLUDED.what_you_learn,
        course_highlight = EXCLUDED.course_highlight,
        technology_tool = EXCLUDED.technology_tool,
        prerequisites = EXCLUDED.prerequisites,
        target_audience = EXCLUDED.target_audience,
        completion_benefits = EXCLUDED.completion_benefits,
        status = EXCLUDED.status,
        price = EXCLUDED.price,
        type = EXCLUDED.type,
        average_rating = EXCLUDED.average_rating,
        total_reviews = EXCLUDED.total_reviews,
        total_enrolled = EXCLUDED.total_enrolled,
        total_lessons = EXCLUDED.total_lessons,
        total_quizzes = EXCLUDED.total_quizzes,
        total_videos = EXCLUDED.total_videos
    RETURNING id, title
),

-- 3. Clear existing mappings for these specific courses before inserting fresh ones to prevent duplicates
deleted_mappings AS (
    DELETE FROM public.course_category_mappings 
    WHERE course_id IN (SELECT id FROM inserted_courses)
)

-- 4. Dynamically insert the many-to-many relationship using the newly generated/updated IDs
INSERT INTO public.course_category_mappings (course_id, category_id)
SELECT c.id, cat.id
FROM inserted_courses c
JOIN inserted_categories cat ON 
    (c.title = 'Introduction to Java Programming' AND cat.name = 'Programming Languages') OR
    (c.title = 'Building RESTful Web Services with Spring Boot' AND cat.name = 'Web Development') OR
    (c.title = 'ReactJS Front-End Engineering' AND cat.name = 'Web Development') OR
    (c.title = 'Data Structures and Algorithms in C++' AND cat.name = 'Programming Languages') OR
    (c.title = 'Mobile Application Development with Flutter' AND cat.name = 'Mobile Development') OR
    (c.title = 'Python for Data Science and Machine Learning' AND cat.name = 'Programming Languages') OR
    (c.title = 'Introduction to Database Systems and SQL' AND cat.name = 'Database & Cloud') OR
    (c.title = 'Object-Oriented Programming with C#' AND cat.name = 'Programming Languages') OR
    (c.title = 'Go Web Architecture and Backend Engineering' AND cat.name = 'Database & Cloud') OR
    (c.title = 'Foundations of Web Design: HTML5 & CSS3' AND cat.name = 'Web Development');

COMMIT;
