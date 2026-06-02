-- Migration Script: Create completed_lessons_count table
CREATE TABLE public.completed_lessons_count (
    id bigserial NOT NULL,
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    completed_lessons_count integer DEFAULT 0 NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT pk_completed_lessons_count PRIMARY KEY (id),
    CONSTRAINT uq_completed_lessons_count_user_course UNIQUE (user_id, course_id),
    CONSTRAINT fk_completed_lessons_count_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE,
    CONSTRAINT fk_completed_lessons_count_course FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE
);

ALTER TABLE public.completed_lessons_count OWNER TO postgres;
