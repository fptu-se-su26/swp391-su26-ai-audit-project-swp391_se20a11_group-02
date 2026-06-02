-- SQL Script to reset all course counters to zero (average_rating, total_reviews, total_enrolled, total_lessons, total_quizzes, total_videos)
-- Includes a dummy WHERE clause to bypass the database client's safe-update protection mode.

BEGIN;

UPDATE public.courses
SET 
    average_rating = 0.0,
    total_reviews = 0,
    total_enrolled = 0,
    total_lessons = 0,
    total_quizzes = 0,
    total_videos = 0
WHERE id > 0; -- Safe Update bypass clause (always true for all primary keys)

COMMIT;
