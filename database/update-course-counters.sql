-- SQL Script to update course counters (average_rating, total_reviews, total_enrolled, total_lessons, total_quizzes, total_videos)
-- Using title-matching to ensure correctness regardless of auto-incremented primary key IDs.

BEGIN;

-- 1. Update counters for 'Introduction to Java Programming'
UPDATE public.courses
SET 
    average_rating = 4.5,
    total_reviews = 12,
    total_enrolled = 120,
    total_lessons = 25,
    total_quizzes = 5,
    total_videos = 20
WHERE title = 'Introduction to Java Programming';

-- 2. Update counters for 'Building RESTful Web Services with Spring Boot'
UPDATE public.courses
SET 
    average_rating = 4.8,
    total_reviews = 18,
    total_enrolled = 150,
    total_lessons = 30,
    total_quizzes = 8,
    total_videos = 25
WHERE title = 'Building RESTful Web Services with Spring Boot';

-- 3. Update counters for 'ReactJS Front-End Engineering'
UPDATE public.courses
SET 
    average_rating = 4.7,
    total_reviews = 15,
    total_enrolled = 95,
    total_lessons = 28,
    total_quizzes = 6,
    total_videos = 22
WHERE title = 'ReactJS Front-End Engineering';

-- 4. Update counters for 'Data Structures and Algorithms in C++'
UPDATE public.courses
SET 
    average_rating = 4.6,
    total_reviews = 25,
    total_enrolled = 210,
    total_lessons = 40,
    total_quizzes = 15,
    total_videos = 35
WHERE title = 'Data Structures and Algorithms in C++';

-- 5. Update counters for 'Mobile Application Development with Flutter'
UPDATE public.courses
SET 
    average_rating = 4.4,
    total_reviews = 8,
    total_enrolled = 80,
    total_lessons = 35,
    total_quizzes = 10,
    total_videos = 30
WHERE title = 'Mobile Application Development with Flutter';

-- 6. Update counters for 'Python for Data Science and Machine Learning'
UPDATE public.courses
SET 
    average_rating = 4.5,
    total_reviews = 10,
    total_enrolled = 110,
    total_lessons = 24,
    total_quizzes = 4,
    total_videos = 18
WHERE title = 'Python for Data Science and Machine Learning';

-- 7. Update counters for 'Introduction to Database Systems and SQL'
UPDATE public.courses
SET 
    average_rating = 4.9,
    total_reviews = 50,
    total_enrolled = 450,
    total_lessons = 15,
    total_quizzes = 5,
    total_videos = 12
WHERE title = 'Introduction to Database Systems and SQL';

-- 8. Update counters for 'Object-Oriented Programming with C#'
UPDATE public.courses
SET 
    average_rating = 4.6,
    total_reviews = 9,
    total_enrolled = 75,
    total_lessons = 22,
    total_quizzes = 6,
    total_videos = 16
WHERE title = 'Object-Oriented Programming with C#';

-- 9. Update counters for 'Go Web Architecture and Backend Engineering'
UPDATE public.courses
SET 
    average_rating = 4.7,
    total_reviews = 14,
    total_enrolled = 130,
    total_lessons = 30,
    total_quizzes = 8,
    total_videos = 24
WHERE title = 'Go Web Architecture and Backend Engineering';

-- 10. Update counters for 'Foundations of Web Design: HTML5 & CSS3'
UPDATE public.courses
SET 
    average_rating = 4.8,
    total_reviews = 42,
    total_enrolled = 380,
    total_lessons = 12,
    total_quizzes = 3,
    total_videos = 10
WHERE title = 'Foundations of Web Design: HTML5 & CSS3';

COMMIT;
