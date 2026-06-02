-- Migration Script: Add total_lessons, total_quizzes, and total_videos columns to courses table
ALTER TABLE public.courses 
    ADD COLUMN total_lessons integer DEFAULT 0 NOT NULL,
    ADD COLUMN total_quizzes integer DEFAULT 0 NOT NULL,
    ADD COLUMN total_videos integer DEFAULT 0 NOT NULL;
