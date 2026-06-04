-- SQL Migration Script to rename column and update foreign key reference for problems table

BEGIN;

-- 1. Drop the old foreign key constraint pointing to the instructors table
ALTER TABLE public.problems DROP CONSTRAINT IF EXISTS fk_problems_instructors;

-- 2. Rename the column
ALTER TABLE public.problems RENAME COLUMN created_by_teacher_id TO created_by;

-- 3. Add the new foreign key constraint pointing to the users table
ALTER TABLE public.problems 
    ADD CONSTRAINT fk_problems_users 
    FOREIGN KEY (created_by) 
    REFERENCES public.users(id) 
    ON DELETE CASCADE;

COMMIT;
