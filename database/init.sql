--
-- PostgreSQL database dump
--

\restrict 5PvQq0hncBdf0RcP5BHrZecVHdPgLGNczoBtTLU8nTdUbgj6JG1ed4UXbhEIRik

-- Dumped from database version 14.23 (Homebrew)
-- Dumped by pg_dump version 14.23 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: contest_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.contest_status AS ENUM (
    'DRAFT',
    'PUBLISHED',
    'DELETED'
);


ALTER TYPE public.contest_status OWNER TO postgres;

--
-- Name: conteststatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.conteststatus AS ENUM (
    'DELETED',
    'DRAFT',
    'PUBLISHED'
);


ALTER TYPE public.conteststatus OWNER TO postgres;

--
-- Name: course_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.course_status AS ENUM (
    'PENDING_AI',
    'PENDING_ADMIN',
    'APPROVED',
    'REJECTED',
    'DRAFTS'
);


ALTER TYPE public.course_status OWNER TO postgres;

--
-- Name: enrollment_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enrollment_status AS ENUM (
    'ACTIVE',
    'CANCELLED',
    'COMPLETED'
);


ALTER TYPE public.enrollment_status OWNER TO postgres;

--
-- Name: instructor_app_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.instructor_app_status AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED',
    'AI_REJECTED'
);


ALTER TYPE public.instructor_app_status OWNER TO postgres;

--
-- Name: instructor_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.instructor_status AS ENUM (
    'ACTIVE',
    'SUSPENDED'
);


ALTER TYPE public.instructor_status OWNER TO postgres;

--
-- Name: oj_verdict; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.oj_verdict AS ENUM (
    'PENDING',
    'PROCESSING',
    'ACCEPTED',
    'WRONG_ANSWER',
    'TIME_LIMIT_EXCEEDED',
    'COMPILATION_ERROR',
    'RUNTIME_ERROR',
    'MEMORY_LIMIT_EXCEEDED',
    'INTERNAL_ERROR'
);


ALTER TYPE public.oj_verdict OWNER TO postgres;

--
-- Name: order_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_status AS ENUM (
    'PENDING',
    'COMPLETED',
    'FAILED'
);


ALTER TYPE public.order_status OWNER TO postgres;

--
-- Name: orderstatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.orderstatus AS ENUM (
    'COMPLETED',
    'FAILED',
    'PENDING'
);


ALTER TYPE public.orderstatus OWNER TO postgres;

--
-- Name: payment_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_type AS ENUM (
    'DEPOSIT'
);


ALTER TYPE public.payment_type OWNER TO postgres;

--
-- Name: paymenttype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.paymenttype AS ENUM (
    'DEPOSIT'
);


ALTER TYPE public.paymenttype OWNER TO postgres;

--
-- Name: payout_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payout_status AS ENUM (
    'PENDING',
    'PROCESSING',
    'SUCCESS',
    'FAILED'
);


ALTER TYPE public.payout_status OWNER TO postgres;

--
-- Name: payoutstatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payoutstatus AS ENUM (
    'FAILED',
    'PENDING',
    'PROCESSING',
    'SUCCESS'
);


ALTER TYPE public.payoutstatus OWNER TO postgres;

--
-- Name: problem_difficulty; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.problem_difficulty AS ENUM (
    'EASY',
    'MEDIUM',
    'HARD'
);


ALTER TYPE public.problem_difficulty OWNER TO postgres;

--
-- Name: problem_scope; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.problem_scope AS ENUM (
    'LESSON',
    'CONTEST',
    'SHARED',
    'PRACTICE'
);


ALTER TYPE public.problem_scope OWNER TO postgres;

--
-- Name: progress_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.progress_status AS ENUM (
    'NOT_STARTED',
    'IN_PROGRESS',
    'COMPLETED'
);


ALTER TYPE public.progress_status OWNER TO postgres;

--
-- Name: quiz_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.quiz_status AS ENUM (
    'IN_PROGRESS',
    'COMPLETED'
);


ALTER TYPE public.quiz_status OWNER TO postgres;

--
-- Name: role_name; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.role_name AS ENUM (
    'USER',
    'INSTRUCTOR',
    'ADMIN'
);


ALTER TYPE public.role_name OWNER TO postgres;

--
-- Name: scoring_rule; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.scoring_rule AS ENUM (
    'ICPC',
    'IOI',
    'CUSTOM'
);


ALTER TYPE public.scoring_rule OWNER TO postgres;

--
-- Name: scoringrule; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.scoringrule AS ENUM (
    'CUSTOM',
    'ICPC',
    'IOI'
);


ALTER TYPE public.scoringrule OWNER TO postgres;

--
-- Name: status_active_locked; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_active_locked AS ENUM (
    'ACTIVE',
    'LOCKED'
);


ALTER TYPE public.status_active_locked OWNER TO postgres;

--
-- Name: status_transaction; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_transaction AS ENUM (
    'SUCCESS',
    'FAILED',
    'PENDING',
    'CANCELLED'
);


ALTER TYPE public.status_transaction OWNER TO postgres;

--
-- Name: statustransaction; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.statustransaction AS ENUM (
    'CANCELLED',
    'FAILED',
    'PENDING',
    'SUCCESS'
);


ALTER TYPE public.statustransaction OWNER TO postgres;

--
-- Name: transaction_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.transaction_type AS ENUM (
    'DEPOSIT',
    'BUY_COURSE',
    'SELL_COURSE',
    'REFUND',
    'AWARD',
    'PLATFORM_FEE'
);


ALTER TYPE public.transaction_type OWNER TO postgres;

--
-- Name: transactiontype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.transactiontype AS ENUM (
    'AWARD',
    'BUY_COURSE',
    'DEPOSIT',
    'PLATFORM_FEE',
    'REFUND',
    'SELL_COURSE'
);


ALTER TYPE public.transactiontype OWNER TO postgres;

--
-- Name: CAST (public.orderstatus AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.orderstatus AS character varying) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (public.paymenttype AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.paymenttype AS character varying) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (public.payoutstatus AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.payoutstatus AS character varying) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (public.scoringrule AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.scoringrule AS character varying) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (public.statustransaction AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.statustransaction AS character varying) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (public.transactiontype AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.transactiontype AS character varying) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (character varying AS public.orderstatus); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.orderstatus) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (character varying AS public.paymenttype); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.paymenttype) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (character varying AS public.payoutstatus); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.payoutstatus) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (character varying AS public.scoringrule); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.scoringrule) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (character varying AS public.statustransaction); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.statustransaction) WITH INOUT AS IMPLICIT;


--
-- Name: CAST (character varying AS public.transactiontype); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.transactiontype) WITH INOUT AS IMPLICIT;


--
-- Name: f_unaccent(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.f_unaccent(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT unaccent('unaccent', $1);
$_$;


ALTER FUNCTION public.f_unaccent(text) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_items (
    cart_id integer NOT NULL,
    id integer NOT NULL,
    added_at timestamp(6) without time zone,
    course_id bigint NOT NULL
);


ALTER TABLE public.cart_items OWNER TO postgres;

--
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cart_items ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.carts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    description text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: chapters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chapters (
    id integer NOT NULL,
    order_index integer NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.chapters OWNER TO postgres;

--
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.chapters ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: completed_lessons_count; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.completed_lessons_count (
    completed_lessons_count integer NOT NULL,
    user_id integer NOT NULL,
    course_id bigint NOT NULL,
    id bigint NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.completed_lessons_count OWNER TO postgres;

--
-- Name: completed_lessons_count_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.completed_lessons_count ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.completed_lessons_count_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest (
    created_by integer NOT NULL,
    durations integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    end_time timestamp(6) with time zone NOT NULL,
    start_time timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    description text,
    fts_document tsvector,
    password_hash character varying(255),
    scoring_rule character varying(255),
    status character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    CONSTRAINT contest_scoring_rule_check CHECK (((scoring_rule)::text = ANY ((ARRAY['ICPC'::character varying, 'IOI'::character varying, 'CUSTOM'::character varying])::text[]))),
    CONSTRAINT contest_status_check CHECK (((status)::text = ANY ((ARRAY['DRAFT'::character varying, 'PUBLISHED'::character varying, 'DELETED'::character varying])::text[])))
);


ALTER TABLE public.contest OWNER TO postgres;

--
-- Name: contest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contest ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.contest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contest_participants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest_participants (
    contest_id integer NOT NULL,
    id integer NOT NULL,
    user_id integer NOT NULL,
    joined_at timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.contest_participants OWNER TO postgres;

--
-- Name: contest_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contest_participants ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.contest_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contest_problem_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest_problem_attempts (
    contest_id integer NOT NULL,
    failed_attempts_count integer NOT NULL,
    id integer NOT NULL,
    is_solved boolean NOT NULL,
    problem_id integer NOT NULL,
    solved_at_seconds integer,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.contest_problem_attempts OWNER TO postgres;

--
-- Name: contest_problem_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contest_problem_attempts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.contest_problem_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contest_problems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest_problems (
    contest_id integer NOT NULL,
    id integer NOT NULL,
    order_index integer NOT NULL,
    problem_id integer NOT NULL,
    problem_version_id integer NOT NULL
);


ALTER TABLE public.contest_problems OWNER TO postgres;

--
-- Name: contest_problems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contest_problems ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.contest_problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contest_rankings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest_rankings (
    contest_id integer NOT NULL,
    id integer NOT NULL,
    problems_solved integer NOT NULL,
    total_penalty integer NOT NULL,
    user_id integer NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.contest_rankings OWNER TO postgres;

--
-- Name: contest_rankings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contest_rankings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.contest_rankings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: course_category_mappings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_category_mappings (
    category_id integer NOT NULL,
    course_id bigint NOT NULL
);


ALTER TABLE public.course_category_mappings OWNER TO postgres;

--
-- Name: course_moderation_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_moderation_reports (
    course_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    id bigint NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    error_log text,
    status character varying(255),
    report_json jsonb
);


ALTER TABLE public.course_moderation_reports OWNER TO postgres;

--
-- Name: course_moderation_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.course_moderation_reports ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.course_moderation_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: course_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_reviews (
    id integer NOT NULL,
    star integer NOT NULL,
    user_id integer NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    content text NOT NULL
);


ALTER TABLE public.course_reviews OWNER TO postgres;

--
-- Name: course_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.course_reviews ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.course_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    average_rating double precision NOT NULL,
    instructor_id integer NOT NULL,
    price numeric(15,2) NOT NULL,
    total_enrolled integer NOT NULL,
    total_lessons integer NOT NULL,
    total_quizzes integer NOT NULL,
    total_reviews integer NOT NULL,
    total_videos integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    id bigint NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    type character varying(50) NOT NULL,
    completion_benefits text,
    course_highlight text,
    long_description text NOT NULL,
    prerequisites text,
    short_description character varying(255) NOT NULL,
    status character varying(255),
    target_audience text,
    technology_tool character varying(255),
    thumbnail_url character varying(255),
    title character varying(255) NOT NULL,
    what_you_learn text,
    CONSTRAINT courses_status_check CHECK (((status)::text = ANY ((ARRAY['PENDING_AI'::character varying, 'PENDING_ADMIN'::character varying, 'APPROVED'::character varying, 'REJECTED'::character varying, 'DRAFTS'::character varying])::text[])))
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.courses ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    course_id bigint NOT NULL,
    enrolled_at timestamp(6) with time zone NOT NULL,
    status character varying(255) NOT NULL,
    CONSTRAINT enrollments_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'CANCELLED'::character varying, 'COMPLETED'::character varying])::text[])))
);


ALTER TABLE public.enrollments OWNER TO postgres;

--
-- Name: enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.enrollments ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.enrollments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: instructor_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_applications (
    ai_experience_years double precision,
    ai_score integer,
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    admin_note text,
    ai_recommendation character varying(255),
    ai_specialization character varying(255),
    ai_strengths text,
    ai_summary text,
    ai_technologies text,
    ai_weaknesses text,
    cv_url character varying(255) NOT NULL,
    introduction text NOT NULL,
    status character varying(255),
    CONSTRAINT instructor_applications_status_check CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'APPROVED'::character varying, 'REJECTED'::character varying, 'AI_REJECTED'::character varying])::text[])))
);


ALTER TABLE public.instructor_applications OWNER TO postgres;

--
-- Name: instructor_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instructor_applications ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.instructor_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: instructors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructors (
    hired_by_admin boolean,
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    bio text,
    full_name character varying(255) NOT NULL,
    major character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    CONSTRAINT instructors_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'SUSPENDED'::character varying])::text[])))
);


ALTER TABLE public.instructors OWNER TO postgres;

--
-- Name: instructors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instructors ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.instructors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: invalidated_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invalidated_tokens (
    id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    expiry_time timestamp(6) with time zone NOT NULL,
    token character varying(255) NOT NULL
);


ALTER TABLE public.invalidated_tokens OWNER TO postgres;

--
-- Name: invalidated_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.invalidated_tokens ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.invalidated_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lesson_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_comments (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    parent_comment_id integer,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.lesson_comments OWNER TO postgres;

--
-- Name: lesson_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.lesson_comments ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lesson_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lesson_problems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_problems (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    order_index integer NOT NULL,
    problem_id integer NOT NULL,
    problem_version_id integer NOT NULL
);


ALTER TABLE public.lesson_problems OWNER TO postgres;

--
-- Name: lesson_problems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.lesson_problems ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lesson_problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lesson_progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_progress (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    user_id integer NOT NULL,
    completed_at timestamp(6) with time zone,
    course_id bigint NOT NULL
);


ALTER TABLE public.lesson_progress OWNER TO postgres;

--
-- Name: lesson_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.lesson_progress ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lesson_progress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    chapter_id integer NOT NULL,
    id integer NOT NULL,
    is_trial boolean NOT NULL,
    order_index integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    status character varying(255),
    text_audio text,
    theory_content text,
    title character varying(255) NOT NULL,
    video_url character varying(255),
    CONSTRAINT lessons_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'INACTIVE'::character varying, 'PENDING_UPDATE'::character varying])::text[])))
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.lessons ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    price numeric(15,2) NOT NULL,
    course_id bigint NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_items ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    total_amount numeric(15,2) NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    status public.orderstatus
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: payment_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_transactions (
    amount numeric(15,2) NOT NULL,
    id integer NOT NULL,
    wallet_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    transaction_code character varying(255) NOT NULL,
    status public.statustransaction,
    type public.paymenttype NOT NULL
);


ALTER TABLE public.payment_transactions OWNER TO postgres;

--
-- Name: payment_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payment_transactions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.payment_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: payout_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payout_requests (
    amount numeric(15,2) NOT NULL,
    id integer NOT NULL,
    wallet_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    payout_period character varying(50) NOT NULL,
    admin_note text,
    bank_account_name character varying(255) NOT NULL,
    bank_account_number character varying(255) NOT NULL,
    bank_name character varying(255) NOT NULL,
    transaction_reference character varying(255),
    status public.payoutstatus
);


ALTER TABLE public.payout_requests OWNER TO postgres;

--
-- Name: payout_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payout_requests ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.payout_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: problem_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_comments (
    id integer NOT NULL,
    parent_id integer,
    problem_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.problem_comments OWNER TO postgres;

--
-- Name: problem_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_comments ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.problem_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: problem_submission_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_submission_details (
    execution_time integer,
    id integer NOT NULL,
    memory_used integer,
    submission_id integer NOT NULL,
    testcase_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    compile_output text,
    stderr text,
    stdout text,
    token character varying(255),
    verdict character varying(255),
    CONSTRAINT problem_submission_details_verdict_check CHECK (((verdict)::text = ANY ((ARRAY['PENDING'::character varying, 'PROCESSING'::character varying, 'ACCEPTED'::character varying, 'WRONG_ANSWER'::character varying, 'TIME_LIMIT_EXCEEDED'::character varying, 'COMPILATION_ERROR'::character varying, 'RUNTIME_ERROR'::character varying, 'MEMORY_LIMIT_EXCEEDED'::character varying, 'INTERNAL_ERROR'::character varying])::text[])))
);


ALTER TABLE public.problem_submission_details OWNER TO postgres;

--
-- Name: problem_submission_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_submission_details ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.problem_submission_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: problem_submissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_submissions (
    contest_id integer,
    execution_time integer,
    id integer NOT NULL,
    is_plagiarized boolean,
    language_id integer NOT NULL,
    lesson_id integer,
    memory_used integer,
    problem_id integer NOT NULL,
    problem_version_id integer NOT NULL,
    score numeric(10,2),
    user_id integer NOT NULL,
    submitted_at timestamp(6) with time zone NOT NULL,
    source_code text NOT NULL,
    verdict character varying(255),
    CONSTRAINT problem_submissions_verdict_check CHECK (((verdict)::text = ANY ((ARRAY['PENDING'::character varying, 'PROCESSING'::character varying, 'ACCEPTED'::character varying, 'WRONG_ANSWER'::character varying, 'TIME_LIMIT_EXCEEDED'::character varying, 'COMPILATION_ERROR'::character varying, 'RUNTIME_ERROR'::character varying, 'MEMORY_LIMIT_EXCEEDED'::character varying, 'INTERNAL_ERROR'::character varying])::text[])))
);


ALTER TABLE public.problem_submissions OWNER TO postgres;

--
-- Name: problem_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_submissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.problem_submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: problem_tag_mappings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_tag_mappings (
    id integer NOT NULL,
    problem_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.problem_tag_mappings OWNER TO postgres;

--
-- Name: problem_tag_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_tag_mappings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.problem_tag_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: problem_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_tags (
    id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(120) NOT NULL
);


ALTER TABLE public.problem_tags OWNER TO postgres;

--
-- Name: problem_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_tags ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.problem_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: problem_testcases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_testcases (
    id integer NOT NULL,
    order_index integer NOT NULL,
    problem_version_id integer NOT NULL,
    expected_output text NOT NULL,
    input_data text NOT NULL,
    token character varying(255)
);


ALTER TABLE public.problem_testcases OWNER TO postgres;

--
-- Name: problem_testcases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_testcases ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.problem_testcases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: problem_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_versions (
    id integer NOT NULL,
    is_active boolean NOT NULL,
    is_public boolean NOT NULL,
    memory_limit_kb integer NOT NULL,
    problem_id integer NOT NULL,
    time_limit_ms integer NOT NULL,
    version_number integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    constraints text,
    description text NOT NULL,
    difficulty character varying(255),
    example_input text,
    example_output text,
    hint text,
    input_description text,
    output_description text,
    problem_scope character varying(255) NOT NULL,
    solutions text,
    starter_templates text,
    title character varying(255) NOT NULL,
    CONSTRAINT problem_versions_difficulty_check CHECK (((difficulty)::text = ANY ((ARRAY['EASY'::character varying, 'MEDIUM'::character varying, 'HARD'::character varying])::text[]))),
    CONSTRAINT problem_versions_problem_scope_check CHECK (((problem_scope)::text = ANY ((ARRAY['LESSON'::character varying, 'CONTEST'::character varying, 'PRACTICE'::character varying])::text[])))
);


ALTER TABLE public.problem_versions OWNER TO postgres;

--
-- Name: problem_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_versions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.problem_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: problem_visualizer_cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_visualizer_cache (
    prompt_version integer,
    generated_at timestamp(6) with time zone,
    detected_algorithm text,
    html_content text,
    id character varying(36) NOT NULL,
    problem_id character varying(255) NOT NULL,
    time_complexity text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.problem_visualizer_cache OWNER TO postgres;

--
-- Name: problems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problems (
    created_by integer NOT NULL,
    id integer NOT NULL,
    is_active boolean NOT NULL,
    is_public boolean NOT NULL,
    score numeric(10,2) NOT NULL,
    total_accepted integer,
    total_submission integer,
    total_testcase integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    problem_scope character varying(255),
    CONSTRAINT problems_problem_scope_check CHECK (((problem_scope)::text = ANY ((ARRAY['LESSON'::character varying, 'CONTEST'::character varying, 'PRACTICE'::character varying])::text[])))
);


ALTER TABLE public.problems OWNER TO postgres;

--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.problems ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: quiz_attempt_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_attempt_answers (
    id integer NOT NULL,
    quiz_attempt_id integer NOT NULL,
    quiz_question_id integer NOT NULL,
    selected_option_id integer
);


ALTER TABLE public.quiz_attempt_answers OWNER TO postgres;

--
-- Name: quiz_attempt_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.quiz_attempt_answers ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.quiz_attempt_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: quiz_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_attempts (
    correct_question integer NOT NULL,
    id integer NOT NULL,
    quiz_id integer NOT NULL,
    score double precision NOT NULL,
    total_question integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    submitted_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.quiz_attempts OWNER TO postgres;

--
-- Name: quiz_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.quiz_attempts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.quiz_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: quiz_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_options (
    id integer NOT NULL,
    is_correct boolean NOT NULL,
    order_index integer NOT NULL,
    question_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.quiz_options OWNER TO postgres;

--
-- Name: quiz_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.quiz_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.quiz_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: quiz_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_questions (
    id integer NOT NULL,
    order_index integer NOT NULL,
    quiz_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.quiz_questions OWNER TO postgres;

--
-- Name: quiz_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.quiz_questions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.quiz_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizzes (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.quizzes OWNER TO postgres;

--
-- Name: quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.quizzes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.quizzes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT roles_name_check CHECK (((name)::text = ANY ((ARRAY['USER'::character varying, 'INSTRUCTOR'::character varying, 'ADMIN'::character varying])::text[])))
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_daily_activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_daily_activities (
    activity_date date NOT NULL,
    id integer NOT NULL,
    streak integer DEFAULT 1 NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.user_daily_activities OWNER TO postgres;

--
-- Name: user_daily_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_daily_activities ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_daily_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_oauth_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_oauth_accounts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    provider character varying(50) NOT NULL,
    provider_user_id character varying(255) NOT NULL
);


ALTER TABLE public.user_oauth_accounts OWNER TO postgres;

--
-- Name: user_oauth_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_oauth_accounts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_oauth_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    role_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    lock_appeal character varying(1000),
    avatarurl character varying(255),
    displayname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    lock_reason character varying(255),
    password_hash character varying(255),
    status character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    CONSTRAINT users_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'LOCKED'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: wallet_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_transactions (
    amount numeric(15,2) NOT NULL,
    id integer NOT NULL,
    order_id integer,
    wallet_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    reference_id character varying(255),
    status public.statustransaction,
    type public.transactiontype NOT NULL
);


ALTER TABLE public.wallet_transactions OWNER TO postgres;

--
-- Name: wallet_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.wallet_transactions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.wallet_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallets (
    balance numeric(15,2) NOT NULL,
    id integer NOT NULL,
    user_id integer NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    status character varying(255) NOT NULL,
    CONSTRAINT wallets_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'LOCKED'::character varying])::text[])))
);


ALTER TABLE public.wallets OWNER TO postgres;

--
-- Name: wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.wallets ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart_items VALUES (1, 7, NULL, 2);


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carts VALUES (1, 2, NULL, NULL);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories VALUES (1, '2026-07-21 02:34:08.561798+07', '2026-07-21 02:34:08.561798+07', 'Description', 'Algorithms');
INSERT INTO public.categories VALUES (2, '2026-07-21 02:34:08.562303+07', '2026-07-21 02:34:08.562303+07', 'Description', 'Web Development');


--
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.chapters VALUES (1, 1, 1, '2026-07-21 02:34:08.563756+07', '2026-07-21 02:34:08.563756+07', 'Chapter 1');
INSERT INTO public.chapters VALUES (2, 2, 1, '2026-07-21 02:34:08.565452+07', '2026-07-21 02:34:08.565452+07', 'Chapter 2');
INSERT INTO public.chapters VALUES (3, 3, 1, '2026-07-21 02:34:08.566246+07', '2026-07-21 02:34:08.566246+07', 'Chapter 3');
INSERT INTO public.chapters VALUES (4, 1, 2, '2026-07-21 02:34:08.567365+07', '2026-07-21 02:34:08.567365+07', 'Chapter 1');
INSERT INTO public.chapters VALUES (5, 2, 2, '2026-07-21 02:34:08.567954+07', '2026-07-21 02:34:08.567954+07', 'Chapter 2');
INSERT INTO public.chapters VALUES (6, 3, 2, '2026-07-21 02:34:08.568625+07', '2026-07-21 02:34:08.568625+07', 'Chapter 3');
INSERT INTO public.chapters VALUES (7, 1, 3, '2026-07-21 02:34:08.569753+07', '2026-07-21 02:34:08.569753+07', 'Chapter 1');
INSERT INTO public.chapters VALUES (8, 2, 3, '2026-07-21 02:34:08.570449+07', '2026-07-21 02:34:08.570449+07', 'Chapter 2');
INSERT INTO public.chapters VALUES (9, 3, 3, '2026-07-21 02:34:08.571292+07', '2026-07-21 02:34:08.571292+07', 'Chapter 3');
INSERT INTO public.chapters VALUES (10, 1, 4, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Analysis of Algorithms');
INSERT INTO public.chapters VALUES (11, 2, 4, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Recursion & Backtracking');
INSERT INTO public.chapters VALUES (12, 3, 4, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Divide and Conquer');
INSERT INTO public.chapters VALUES (13, 4, 4, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Greedy Algorithms');
INSERT INTO public.chapters VALUES (14, 5, 4, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Dynamic Programming Basics');
INSERT INTO public.chapters VALUES (15, 1, 5, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Linear Data Structures');
INSERT INTO public.chapters VALUES (16, 2, 5, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Stacks & Queues');
INSERT INTO public.chapters VALUES (17, 3, 5, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Trees & Binary Trees');
INSERT INTO public.chapters VALUES (18, 4, 5, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Heaps & Priority Queues');
INSERT INTO public.chapters VALUES (19, 5, 5, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Hashing and Hash Tables');
INSERT INTO public.chapters VALUES (20, 1, 6, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'JS Core Concepts');
INSERT INTO public.chapters VALUES (21, 2, 6, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Working with Arrays & Objects');
INSERT INTO public.chapters VALUES (22, 3, 6, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Asynchronous JavaScript');
INSERT INTO public.chapters VALUES (23, 4, 6, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'DOM Manipulation');
INSERT INTO public.chapters VALUES (24, 5, 6, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Modern JS Features (ES6+)');
INSERT INTO public.chapters VALUES (25, 1, 7, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'React Intro & JSX');
INSERT INTO public.chapters VALUES (26, 2, 7, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Props & State');
INSERT INTO public.chapters VALUES (27, 3, 7, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Component Lifecycle & Hooks');
INSERT INTO public.chapters VALUES (28, 4, 7, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Handling Lists & Forms');
INSERT INTO public.chapters VALUES (29, 5, 7, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'React Architecture');
INSERT INTO public.chapters VALUES (30, 1, 8, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Node.js Basics');
INSERT INTO public.chapters VALUES (31, 2, 8, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Express.js Fundamentals');
INSERT INTO public.chapters VALUES (32, 3, 8, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'RESTful API Design');
INSERT INTO public.chapters VALUES (33, 4, 8, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Database Integration');
INSERT INTO public.chapters VALUES (34, 5, 8, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Authentication & Security');
INSERT INTO public.chapters VALUES (35, 1, 9, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Self-Balancing Trees');
INSERT INTO public.chapters VALUES (36, 2, 9, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Advanced Heaps');
INSERT INTO public.chapters VALUES (37, 3, 9, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Disjoint Set (Union-Find)');
INSERT INTO public.chapters VALUES (38, 4, 9, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Segment Trees');
INSERT INTO public.chapters VALUES (39, 5, 9, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'String Matching Algorithms');
INSERT INTO public.chapters VALUES (40, 1, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Graph Representation');
INSERT INTO public.chapters VALUES (41, 2, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Graph Traversals');
INSERT INTO public.chapters VALUES (42, 3, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Shortest Paths');
INSERT INTO public.chapters VALUES (43, 4, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Minimum Spanning Trees');
INSERT INTO public.chapters VALUES (44, 5, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Advanced Graph Concepts');
INSERT INTO public.chapters VALUES (45, 1, 11, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Project Architecture');
INSERT INTO public.chapters VALUES (46, 2, 11, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Product Catalog Backend');
INSERT INTO public.chapters VALUES (47, 3, 11, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Shopping Cart & Checkout');
INSERT INTO public.chapters VALUES (48, 4, 11, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Frontend Development');
INSERT INTO public.chapters VALUES (49, 5, 11, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Deployment & CI/CD');
INSERT INTO public.chapters VALUES (50, 1, 12, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Relational DB Design');
INSERT INTO public.chapters VALUES (51, 2, 12, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'SQL Fundamentals');
INSERT INTO public.chapters VALUES (52, 3, 12, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Advanced Queries');
INSERT INTO public.chapters VALUES (53, 4, 12, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Indexing & Query Optimization');
INSERT INTO public.chapters VALUES (54, 5, 12, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Transactions & Concurrency');
INSERT INTO public.chapters VALUES (55, 1, 13, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Scalability Concepts');
INSERT INTO public.chapters VALUES (56, 2, 13, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Caching Strategies');
INSERT INTO public.chapters VALUES (57, 3, 13, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Message Queues & Event-Driven');
INSERT INTO public.chapters VALUES (58, 4, 13, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'Distributed Databases');
INSERT INTO public.chapters VALUES (59, 5, 13, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'System Design Case Studies');


--
-- Data for Name: completed_lessons_count; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: contest; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contest VALUES (1, 10800, 1, '2026-07-21 02:34:08.575587+07', '2026-07-21 04:34:08.575587+07', '2026-07-21 01:34:08.575587+07', '2026-07-21 02:34:08.575587+07', 'SWP391 Contest', NULL, NULL, 'ICPC', 'PUBLISHED', 'SWP391 Grand Coding Contest');


--
-- Data for Name: contest_participants; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contest_participants VALUES (1, 1, 3, '2026-07-21 02:41:57.890178+07');
INSERT INTO public.contest_participants VALUES (1, 2, 2, '2026-07-21 03:11:57.291908+07');


--
-- Data for Name: contest_problem_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: contest_problems; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contest_problems VALUES (1, 1, 5, 8, 6);
INSERT INTO public.contest_problems VALUES (1, 2, 6, 9, 7);
INSERT INTO public.contest_problems VALUES (1, 3, 7, 10, 8);
INSERT INTO public.contest_problems VALUES (1, 4, 8, 11, 9);
INSERT INTO public.contest_problems VALUES (1, 5, 9, 12, 10);


--
-- Data for Name: contest_rankings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: course_category_mappings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.course_category_mappings VALUES (1, 1);
INSERT INTO public.course_category_mappings VALUES (2, 2);
INSERT INTO public.course_category_mappings VALUES (1, 3);
INSERT INTO public.course_category_mappings VALUES (1, 4);
INSERT INTO public.course_category_mappings VALUES (1, 5);
INSERT INTO public.course_category_mappings VALUES (2, 6);
INSERT INTO public.course_category_mappings VALUES (2, 7);
INSERT INTO public.course_category_mappings VALUES (2, 8);
INSERT INTO public.course_category_mappings VALUES (1, 9);
INSERT INTO public.course_category_mappings VALUES (1, 10);
INSERT INTO public.course_category_mappings VALUES (2, 11);
INSERT INTO public.course_category_mappings VALUES (2, 12);
INSERT INTO public.course_category_mappings VALUES (2, 13);


--
-- Data for Name: course_moderation_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: course_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.courses VALUES (4.5, 1, 0.00, 0, 6, 0, 0, 0, '2026-07-21 02:34:08.562437+07', 1, '2026-07-21 02:34:08.562437+07', 'FREE', 'Benefits', 'Highlight', 'Mastering Data Structures & Algorithms is designed to help you ace your coding interviews and write efficient code.', 'Prereqs', 'Learn Big O, arrays, trees, and dynamic programming.', 'APPROVED', 'Audience', 'Tools', 'http://example.com/thumb.jpg', 'Mastering Data Structures & Algorithms', 'Learn');
INSERT INTO public.courses VALUES (4.5, 1, 199000.00, 0, 6, 0, 0, 0, '2026-07-21 02:34:08.566897+07', 2, '2026-07-21 02:34:08.566897+07', 'PAID', 'Benefits', 'Highlight', 'This comprehensive course takes you from absolute beginner to professional full stack web developer.', 'Prereqs', 'Build responsive websites with React, Node.js, Express, and PostgreSQL.', 'APPROVED', 'Audience', 'Tools', 'http://example.com/thumb.jpg', 'Full Stack Web Development with React & Node.js', 'Learn');
INSERT INTO public.courses VALUES (4.5, 1, 499000.00, 0, 6, 0, 0, 0, '2026-07-21 02:34:08.569233+07', 3, '2026-07-21 02:34:08.569233+07', 'PAID', 'Benefits', 'Highlight', 'Master machine learning with hands-on projects in Python.', 'Prereqs', 'Learn machine learning models and deep learning frameworks.', 'APPROVED', 'Audience', 'Tools', 'http://example.com/thumb.jpg', 'Advanced Machine Learning with Python', 'Learn');
INSERT INTO public.courses VALUES (0, 1, 0.00, 0, 15, 0, 0, 0, '2026-07-21 22:58:57.301564+07', 4, '2026-07-21 22:58:57.301564+07', 'FREE', 'Course completion certificate and ready-to-use algorithmic skills', 'Real-world problem solving
Interactive coding exercises
Comprehensive step-by-step guides', 'This course provides a comprehensive introduction to modern algorithm design and analysis. You will learn to evaluate the complexity of algorithms using Big O notation, understand recursion, backtracking, and fundamental sorting and searching techniques.', 'Basic programming knowledge in any language', 'Master the fundamental concepts of algorithms including Big O notation, sorting, searching, and recursion.', 'APPROVED', 'Computer Science students and aspiring developers', 'Python / Java', NULL, 'Introduction to Algorithms', 'Analyze time and space complexity
Understand recursion and divide-and-conquer
Implement greedy algorithms and basic dynamic programming');
INSERT INTO public.courses VALUES (0, 2, 299000.00, 0, 15, 0, 0, 0, '2026-07-21 22:58:57.301564+07', 5, '2026-07-21 22:58:57.301564+07', 'PAID', 'Solid foundation in data structures required for major tech companies', 'Visual animations of structures
Practical mock interview questions
Lifetime access to course codebase', 'Learn how to store, organize, and manage data efficiently. This course covers linear data structures, tree-based models, binary trees, heaps, and hashing techniques with practical implementation details.', 'Introduction to Algorithms or similar programming basics', 'Understand foundational data structures: arrays, linked lists, stacks, queues, trees, and hash tables.', 'APPROVED', 'Software developers preparing for technical interviews', 'C++ / Java', NULL, 'Data Structures Fundamentals', 'Implement linked lists, stacks, and queues
Manipulate binary search trees and heaps
Resolve hash table collisions');
INSERT INTO public.courses VALUES (0, 1, 0.00, 0, 15, 0, 0, 0, '2026-07-21 22:58:57.301564+07', 6, '2026-07-21 22:58:57.301564+07', 'FREE', 'Build interactive websites and start learning frontend frameworks', 'Build 5 real-world mini-projects
Debug browser code like a pro
Interactive code playgrounds', 'JavaScript is the core language of the modern web. Learn variables, functions, asynchronous programming, DOM manipulation, and modular code structures step by step.', 'None! Beginner friendly.', 'Master modern JavaScript (ES6+) from basic syntax to advanced concepts like closures, event loop, and promises.', 'APPROVED', 'Beginners wanting to learn web development', 'JavaScript / HTML5', NULL, 'Modern JavaScript: Zero to Hero', 'Write modern ES6+ JavaScript code
Understand promises, async/await, and fetch API
Manipulate the DOM dynamically');
INSERT INTO public.courses VALUES (0, 2, 199000.00, 0, 15, 0, 0, 0, '2026-07-21 22:58:57.301564+07', 7, '2026-07-21 22:58:57.301564+07', 'PAID', 'Build reactive user interfaces and single page applications', 'Single Page App projects
Learn from industry expert guides
Modern React Hooks focus', 'Build fast, responsive web applications using React. Master components, useState, useEffect, context API, custom hooks, and navigation routing.', 'Strong JavaScript fundamentals (ES6+)', 'Learn React.js from components and props to hooks, routing, and global state management.', 'APPROVED', 'Developers looking to learn modern frontend web development', 'React.js', NULL, 'React Framework Essentials', 'Create reusable UI components
Manage application states efficiently
Perform side effects and data fetching');
INSERT INTO public.courses VALUES (0, 1, 499000.00, 0, 15, 0, 0, 0, '2026-07-21 22:58:57.301564+07', 8, '2026-07-21 22:58:57.301564+07', 'PAID', 'Build production-ready secure API servers', 'End-to-end backend project
Security best-practice templates
Database migrations step-by-step', 'Learn backend engineering using Node.js and Express. Connect to databases, write robust routing and middlewares, secure routes with JWTs, and deploy to production.', 'JavaScript syntax and basic server concepts', 'Build scalable RESTful APIs using Node.js, Express, databases, and JWT security.', 'APPROVED', 'Frontend developers transitioning to Full-Stack', 'Node.js / Express', NULL, 'Node.js & Express Backend Development', 'Build secure, scalable RESTful APIs
Connect to relational database systems
Implement user authentication with JWT');
INSERT INTO public.courses VALUES (0, 2, 399000.00, 0, 15, 0, 0, 0, '2026-07-21 22:58:57.301564+07', 9, '2026-07-21 22:58:57.301564+07', 'PAID', 'Develop optimal solutions for highly complex systems', 'Visualizing complex tree structures
Competitive programming problem sets
Advanced indexing architectures', 'Take your data structure knowledge to the next level. Master advanced search trees, prefix trees, disjoint set unions, range query segment trees, and string matching algorithms.', 'Data Structures Fundamentals', 'Dive deep into advanced data structures like AVL Trees, tries, union-find, and segment trees.', 'APPROVED', 'Experienced developers and competitive programmers', 'Java / Python', NULL, 'Advanced Data Structures', 'Implement AVL and Trie structures
Solve network connectivity using Union-Find
Query ranges in logarithmic time');
INSERT INTO public.courses VALUES (0, 1, 0.00, 0, 15, 0, 0, 0, '2026-07-21 22:58:57.301564+07', 10, '2026-07-21 22:58:57.301564+07', 'FREE', 'Build and optimize network routing and mapping services', 'Visualizing graph traversals
Real world network routing examples
Clean, generic implementations', 'Explore the power of graph modeling. Learn representation matrices, traversal methods, shortest path calculations (Dijkstra, Bellman-Ford, Floyd-Warshall), and structural analysis.', 'Basic stack/queue data structures knowledge', 'Master graph representation, search (BFS/DFS), shortest paths, MSTs, and topological sort.', 'APPROVED', 'Students and engineers building network models', 'Python', NULL, 'Graph Algorithms Masterclass', 'Traverse graphs using BFS and DFS
Calculate single source and all pairs shortest paths
Implement topological sort and cycle detection');
INSERT INTO public.courses VALUES (0, 2, 599000.00, 0, 15, 0, 0, 0, '2026-07-21 22:58:57.301564+07', 11, '2026-07-21 22:58:57.301564+07', 'PAID', 'Add a major production-grade project to your software portfolio', 'Industry standard code repository
Realistic payment gateway integration
Production deployment walkthrough', 'Integrate your skills to build a complete full-stack web application. Handle system architectures, database designs, product catalogs, cart management, checkout processes, and deployments.', 'React and Node.js backend courses', 'Build a production-ready e-commerce platform using React, Node.js, Express, databases, and Docker.', 'APPROVED', 'Intermediate developers wanting full-stack project experience', 'React / Node / Docker', NULL, 'Full-Stack Project: E-Commerce App', 'Connect frontend and backend smoothly
Manage complex application states
Dockerize and deploy full-stack apps');
INSERT INTO public.courses VALUES (0, 1, 299000.00, 0, 15, 0, 0, 0, '2026-07-21 22:58:57.301564+07', 12, '2026-07-21 22:58:57.301564+07', 'PAID', 'Write fast, optimized database schemas and queries', 'Hands-on query execution labs
Real production system examples
Database tuning guidelines', 'Learn database engineering thoroughly. Design optimal schemas, normalize data tables, write advanced SQL (joins, aggregations, CTEs, window functions), index columns, and optimize queries.', 'Basic computer literacy', 'Master relational database design, normalization, complex joins, indices, and transactions.', 'APPROVED', 'Software engineers and system architects', 'PostgreSQL / SQL', NULL, 'Database Design and SQL Masterclass', 'Normalize tables to 3NF
Write advanced SQL queries and window functions
Optimize slow queries using explain analyze');
INSERT INTO public.courses VALUES (0, 2, 0.00, 0, 15, 0, 0, 0, '2026-07-21 22:58:57.301564+07', 13, '2026-07-21 22:58:57.301564+07', 'FREE', 'Confidently design systems for large scale operations', 'System design interview tips
Architecture templates for popular apps
Expert design reviews', 'Design architectures capable of handling millions of requests. Understand caching, scaling models, publish-subscribe queues, sharding databases, and study real-world case studies.', 'Backend development basics', 'Learn system design fundamentals: scalability, caching, load balancing, message queues, and distributed databases.', 'APPROVED', 'Software developers preparing for senior roles', 'Architectural Design', NULL, 'Introduction to System Design', 'Design scalable, high-throughput systems
Configure cache layers and message queues
Architect distributed sharded databases');


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: instructor_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instructor_applications VALUES (NULL, NULL, 1, 2, '2026-07-21 03:09:08.767439+07', '2026-07-21 03:09:08.767441+07', 'Auto-approved upon self-registration.', NULL, 'Full Stack Developer', NULL, NULL, NULL, NULL, 'self_registered', 'Hello! I am a senior software developer with 10 years of industry experience. I love teaching web technologies like React, Node.js and Java Spring Boot.', 'APPROVED');


--
-- Data for Name: instructors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instructors VALUES (true, 1, 3, '2026-07-21 02:34:08.514276+07', 'Senior instructor.', 'Instructor One', 'Software Engineering', 'ACTIVE');
INSERT INTO public.instructors VALUES (false, 2, 2, '2026-07-21 03:09:08.757806+07', 'Hello! I am a senior software developer with 10 years of industry experience. I love teaching web technologies like React, Node.js and Java Spring Boot.', 'Instructor User One', 'Full Stack Developer', 'ACTIVE');


--
-- Data for Name: invalidated_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.invalidated_tokens VALUES (1, '2026-07-21 02:27:09.86044+07', '2026-07-21 02:30:53+07', '95819fb1-4cc3-4b07-9526-2dbdfb8328c3');
INSERT INTO public.invalidated_tokens VALUES (2, '2026-07-21 02:27:09.862436+07', '2026-07-28 01:30:53+07', '4323ccef-f194-42ff-9f74-3ca9de78d15f');
INSERT INTO public.invalidated_tokens VALUES (3, '2026-07-21 02:40:19.677845+07', '2026-07-21 03:27:16+07', 'e6c10171-4268-486f-a7a6-9a403689f8e3');
INSERT INTO public.invalidated_tokens VALUES (4, '2026-07-21 02:40:19.680155+07', '2026-07-28 02:27:16+07', '10deb7db-4cd8-4313-abf2-b631a793a7d1');
INSERT INTO public.invalidated_tokens VALUES (5, '2026-07-21 03:09:08.790092+07', '2026-07-28 03:08:58+07', '357e3000-0f34-40d0-989e-239a7d5402a0');
INSERT INTO public.invalidated_tokens VALUES (6, '2026-07-21 03:11:02.342282+07', '2026-07-21 04:10:56+07', '34140a20-7c85-4d66-a419-6e20a3c4a76b');
INSERT INTO public.invalidated_tokens VALUES (7, '2026-07-21 03:11:02.356114+07', '2026-07-28 03:10:56+07', '3e6bf5dc-7e6f-4190-83d9-820dc2b623dd');
INSERT INTO public.invalidated_tokens VALUES (8, '2026-07-21 03:13:19.201119+07', '2026-07-21 04:13:13+07', 'ff9c1e3c-5c2a-4b94-9ee1-cbce558f7699');
INSERT INTO public.invalidated_tokens VALUES (9, '2026-07-21 03:13:19.20379+07', '2026-07-28 03:13:13+07', '02299a43-7960-4953-91b0-358c54face0f');
INSERT INTO public.invalidated_tokens VALUES (10, '2026-07-21 03:14:37.307762+07', '2026-07-21 03:41:05+07', '2d2860ad-9ef3-4ff2-8535-a949c8535000');
INSERT INTO public.invalidated_tokens VALUES (11, '2026-07-21 03:14:37.308962+07', '2026-07-28 02:41:05+07', '1def7896-1c9c-4ffa-b595-8f415f55efd8');
INSERT INTO public.invalidated_tokens VALUES (12, '2026-07-21 03:16:29.347037+07', '2026-07-21 04:16:23+07', 'a8c83f36-7996-4ee0-a130-a4c6d25a7e79');
INSERT INTO public.invalidated_tokens VALUES (13, '2026-07-21 03:16:29.348383+07', '2026-07-28 03:16:23+07', '41d1a4cc-35eb-40ea-815f-5ac45bc994c5');
INSERT INTO public.invalidated_tokens VALUES (14, '2026-07-21 03:25:43.072848+07', '2026-07-21 04:14:42+07', '291f7188-316a-4762-9f27-10583d9c6f5e');
INSERT INTO public.invalidated_tokens VALUES (15, '2026-07-21 03:25:43.087417+07', '2026-07-28 03:14:42+07', '9a49c8d1-6c77-4dfd-8a35-d7e509431b9d');
INSERT INTO public.invalidated_tokens VALUES (16, '2026-07-21 07:29:48.29621+07', '2026-07-22 07:29:42+07', 'e3159c06-88a6-4bdf-b8f7-e885e22e109e');
INSERT INTO public.invalidated_tokens VALUES (17, '2026-07-21 07:29:48.299951+07', '2026-07-28 07:29:42+07', 'cd3c5320-cd8f-4983-939b-aaeea7696e48');
INSERT INTO public.invalidated_tokens VALUES (18, '2026-07-21 07:31:30.779682+07', '2026-07-22 03:25:54+07', '6f3505a3-bfaf-4eea-9cf1-2114c7494d93');
INSERT INTO public.invalidated_tokens VALUES (19, '2026-07-21 07:31:30.794627+07', '2026-07-28 03:25:54+07', 'd7a50738-6a09-40eb-8b77-eec1eba944bb');
INSERT INTO public.invalidated_tokens VALUES (20, '2026-07-21 21:53:25.038313+07', '2026-07-22 07:31:37+07', 'ac809107-f7eb-4764-be92-1a2acb2491c4');
INSERT INTO public.invalidated_tokens VALUES (21, '2026-07-21 21:53:25.054055+07', '2026-07-28 07:31:37+07', 'bdc5dce8-3d50-48e0-90ed-743c58dc03a0');
INSERT INTO public.invalidated_tokens VALUES (22, '2026-07-21 22:07:10.038595+07', '2026-07-22 22:07:06+07', '5fde51e2-a5a7-49d6-8487-200551bf06b1');
INSERT INTO public.invalidated_tokens VALUES (23, '2026-07-21 22:07:10.040754+07', '2026-07-28 22:07:06+07', 'ae18618e-6d98-4846-8d67-7f164b3ac827');
INSERT INTO public.invalidated_tokens VALUES (24, '2026-07-21 22:14:24.66315+07', '2026-07-22 22:10:24+07', 'ceb4b2df-3e1b-4b1d-80a8-0f92771118b5');
INSERT INTO public.invalidated_tokens VALUES (25, '2026-07-21 22:14:24.67166+07', '2026-07-28 22:10:24+07', '3a736bd3-e13b-478b-8e4e-d99a513bed88');
INSERT INTO public.invalidated_tokens VALUES (26, '2026-07-21 23:37:58.376189+07', '2026-07-22 22:14:40+07', 'd53f3057-2789-4f6a-b8aa-461039838b14');
INSERT INTO public.invalidated_tokens VALUES (27, '2026-07-21 23:37:58.3886+07', '2026-07-28 22:14:40+07', 'cb45dc2b-62a5-40fb-9743-dad0cd838de1');


--
-- Data for Name: lesson_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: lesson_problems; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lesson_problems VALUES (1, 1, 1, 3, 1);
INSERT INTO public.lesson_problems VALUES (2, 1, 1, 4, 2);
INSERT INTO public.lesson_problems VALUES (3, 1, 1, 5, 3);
INSERT INTO public.lesson_problems VALUES (4, 1, 1, 6, 4);
INSERT INTO public.lesson_problems VALUES (5, 1, 1, 7, 5);


--
-- Data for Name: lesson_progress; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lessons VALUES (1, 1, true, 1, '2026-07-21 02:34:08.564218+07', '2026-07-21 02:34:08.564218+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 1', 'http://video.com');
INSERT INTO public.lessons VALUES (1, 2, false, 2, '2026-07-21 02:34:08.565117+07', '2026-07-21 02:34:08.565117+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 2', 'http://video.com');
INSERT INTO public.lessons VALUES (2, 3, false, 1, '2026-07-21 02:34:08.565748+07', '2026-07-21 02:34:08.565748+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 1', 'http://video.com');
INSERT INTO public.lessons VALUES (2, 4, false, 2, '2026-07-21 02:34:08.56602+07', '2026-07-21 02:34:08.56602+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 2', 'http://video.com');
INSERT INTO public.lessons VALUES (3, 5, false, 1, '2026-07-21 02:34:08.566449+07', '2026-07-21 02:34:08.566449+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 1', 'http://video.com');
INSERT INTO public.lessons VALUES (3, 6, false, 2, '2026-07-21 02:34:08.566656+07', '2026-07-21 02:34:08.566656+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 2', 'http://video.com');
INSERT INTO public.lessons VALUES (4, 7, true, 1, '2026-07-21 02:34:08.567563+07', '2026-07-21 02:34:08.567563+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 1', 'http://video.com');
INSERT INTO public.lessons VALUES (4, 8, false, 2, '2026-07-21 02:34:08.56778+07', '2026-07-21 02:34:08.56778+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 2', 'http://video.com');
INSERT INTO public.lessons VALUES (5, 9, false, 1, '2026-07-21 02:34:08.568179+07', '2026-07-21 02:34:08.568179+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 1', 'http://video.com');
INSERT INTO public.lessons VALUES (5, 10, false, 2, '2026-07-21 02:34:08.56841+07', '2026-07-21 02:34:08.56841+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 2', 'http://video.com');
INSERT INTO public.lessons VALUES (6, 11, false, 1, '2026-07-21 02:34:08.568836+07', '2026-07-21 02:34:08.568836+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 1', 'http://video.com');
INSERT INTO public.lessons VALUES (6, 12, false, 2, '2026-07-21 02:34:08.56903+07', '2026-07-21 02:34:08.56903+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 2', 'http://video.com');
INSERT INTO public.lessons VALUES (7, 13, true, 1, '2026-07-21 02:34:08.570027+07', '2026-07-21 02:34:08.570027+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 1', 'http://video.com');
INSERT INTO public.lessons VALUES (7, 14, false, 2, '2026-07-21 02:34:08.570248+07', '2026-07-21 02:34:08.570248+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 2', 'http://video.com');
INSERT INTO public.lessons VALUES (8, 15, false, 1, '2026-07-21 02:34:08.570913+07', '2026-07-21 02:34:08.570913+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 1', 'http://video.com');
INSERT INTO public.lessons VALUES (8, 16, false, 2, '2026-07-21 02:34:08.571101+07', '2026-07-21 02:34:08.571101+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 2', 'http://video.com');
INSERT INTO public.lessons VALUES (9, 17, false, 1, '2026-07-21 02:34:08.571461+07', '2026-07-21 02:34:08.571461+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 1', 'http://video.com');
INSERT INTO public.lessons VALUES (9, 18, false, 2, '2026-07-21 02:34:08.571685+07', '2026-07-21 02:34:08.571685+07', 'ACTIVE', 'Audio', 'Theory', 'Lesson 2', 'http://video.com');
INSERT INTO public.lessons VALUES (10, 19, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn how to measure execution time as input size grows.', 'Time Complexity & Big O Notation', NULL);
INSERT INTO public.lessons VALUES (10, 20, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand memory consumption and how to minimize it.', 'Space Complexity & Auxiliary Space', NULL);
INSERT INTO public.lessons VALUES (10, 21, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Master upper bounds, lower bounds, and tight bounds.', 'Asymptotic Analysis', NULL);
INSERT INTO public.lessons VALUES (11, 22, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn the core concept of functions calling themselves.', 'Understanding Recursion', NULL);
INSERT INTO public.lessons VALUES (11, 23, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Visualize recursion execution using memory stacks.', 'Call Stack and Recursion Trees', NULL);
INSERT INTO public.lessons VALUES (11, 24, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand state-space search and constraint satisfaction.', 'Introduction to Backtracking', NULL);
INSERT INTO public.lessons VALUES (12, 25, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn the three steps: Divide, Conquer, and Combine.', 'Concept of Divide & Conquer', NULL);
INSERT INTO public.lessons VALUES (12, 26, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement stable sort using divide and conquer.', 'Merge Sort Algorithm', NULL);
INSERT INTO public.lessons VALUES (12, 27, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand pivot selection and partition methods.', 'Quick Sort Algorithm', NULL);
INSERT INTO public.lessons VALUES (13, 28, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Making locally optimal choices to find a global optimum.', 'Greedy Choice Property', NULL);
INSERT INTO public.lessons VALUES (13, 29, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Solve resource allocation using item values and weights.', 'Fractional Knapsack', NULL);
INSERT INTO public.lessons VALUES (13, 30, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn lossless data compression algorithms.', 'Huffman Coding', NULL);
INSERT INTO public.lessons VALUES (14, 31, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Speed up recursive algorithms by caching results.', 'Overlapping Subproblems & Memoization', NULL);
INSERT INTO public.lessons VALUES (14, 32, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Build bottom-up DP tables to solve complex problems.', 'Optimal Substructure & Tabulation', NULL);
INSERT INTO public.lessons VALUES (14, 33, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Compare recursive, memoized, and tabulated Fibonacci solutions.', 'Classic DP: Fibonacci Numbers', NULL);
INSERT INTO public.lessons VALUES (15, 34, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn how dynamic arrays resize behind the scenes.', 'Static Arrays & Dynamic Arrays', NULL);
INSERT INTO public.lessons VALUES (15, 35, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement nodes, pointers, insertions, and deletions.', 'Singly Linked Lists', NULL);
INSERT INTO public.lessons VALUES (15, 36, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand bidirectional traversal and node insertion.', 'Doubly Linked Lists', NULL);
INSERT INTO public.lessons VALUES (16, 37, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand LIFO (Last In First Out) principle and parentheses matching.', 'Stack Implementation and Applications', NULL);
INSERT INTO public.lessons VALUES (16, 38, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand FIFO (First In First Out) and buffer queues.', 'Queue Implementation and Applications', NULL);
INSERT INTO public.lessons VALUES (16, 39, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement double-ended queues and ring buffers.', 'Deque and Circular Queue', NULL);
INSERT INTO public.lessons VALUES (17, 40, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand height, nodes, leaves, and full/complete trees.', 'Binary Tree Properties', NULL);
INSERT INTO public.lessons VALUES (17, 41, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Search, insert, and delete keys in logarithmic time.', 'Binary Search Tree (BST) Operations', NULL);
INSERT INTO public.lessons VALUES (17, 42, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn depth-first and breadth-first search traversals.', 'Tree Traversals: Inorder, Preorder, Postorder', NULL);
INSERT INTO public.lessons VALUES (18, 43, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand min-heaps, max-heaps, and structural properties.', 'Binary Heap Properties', NULL);
INSERT INTO public.lessons VALUES (18, 44, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Maintain heap order in logarithmic time.', 'Heapify, Insertion, and Deletion', NULL);
INSERT INTO public.lessons VALUES (18, 45, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Sort arrays and schedule tasks using heaps.', 'Heap Sort & Priority Queue Applications', NULL);
INSERT INTO public.lessons VALUES (19, 46, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Design reliable hash functions to map keys.', 'Hash Functions and Collision Resolution', NULL);
INSERT INTO public.lessons VALUES (19, 47, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand separate chaining, linear probing, and double hashing.', 'Chaining vs Open Addressing', NULL);
INSERT INTO public.lessons VALUES (19, 48, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Build a fully-functional HashMap from scratch.', 'HashMap Implementations', NULL);
INSERT INTO public.lessons VALUES (20, 49, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn var, let, const, block scope, and primitive types.', 'Variables, Scope, and Data Types', NULL);
INSERT INTO public.lessons VALUES (20, 50, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement conditional statements and complex loops.', 'Control Flow and Logical Operators', NULL);
INSERT INTO public.lessons VALUES (20, 51, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand declarations, expressions, arrow functions, and default parameters.', 'Functions and Arrow Functions', NULL);
INSERT INTO public.lessons VALUES (21, 52, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Perform functional programming operations on arrays.', 'Array Methods: Map, Filter, Reduce', NULL);
INSERT INTO public.lessons VALUES (21, 53, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn object syntax, methods, and scope of this keyword.', 'Object Literals, Methods, and `this`', NULL);
INSERT INTO public.lessons VALUES (21, 54, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Unpack values easily from arrays and objects.', 'Destructuring and Spread Operator', NULL);
INSERT INTO public.lessons VALUES (22, 55, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand how JavaScript executes non-blocking code.', 'Callbacks and Event Loop', NULL);
INSERT INTO public.lessons VALUES (22, 56, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Handle asynchronous operations using promise structures.', 'Promises and Chaining', NULL);
INSERT INTO public.lessons VALUES (22, 57, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Write synchronous-looking asynchronous code with try/catch.', 'Async/Await & Error Handling', NULL);
INSERT INTO public.lessons VALUES (23, 58, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Query the DOM and update text content, styles, and classes.', 'Selecting and Modifying Elements', NULL);
INSERT INTO public.lessons VALUES (23, 59, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Handle clicks, inputs, and bubbling/capturing phases.', 'Event Listeners and Event Propagation', NULL);
INSERT INTO public.lessons VALUES (23, 60, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Dynamically add elements to customize user interfaces.', 'Creating & Appending DOM Nodes', NULL);
INSERT INTO public.lessons VALUES (24, 61, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement object-oriented programming in modern JavaScript.', 'Classes and Inheritance', NULL);
INSERT INTO public.lessons VALUES (24, 62, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Organize files using ES modules for cleaner codebases.', 'Modules: Import and Export', NULL);
INSERT INTO public.lessons VALUES (24, 63, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand memory heaps, call stacks, and hoisting.', 'JS Engines and Execution Contexts', NULL);
INSERT INTO public.lessons VALUES (25, 64, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn how React updates the UI efficiently with a virtual tree.', 'Virtual DOM & React Setup', NULL);
INSERT INTO public.lessons VALUES (25, 65, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Combine HTML structure with JavaScript expressions.', 'Writing JSX Syntax', NULL);
INSERT INTO public.lessons VALUES (25, 66, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand functional components and render flows.', 'Rendering Elements and Components', NULL);
INSERT INTO public.lessons VALUES (26, 67, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Pass read-only data between parent and child components.', 'Component Props & Reusability', NULL);
INSERT INTO public.lessons VALUES (26, 68, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Store and modify interactive UI states locally.', 'Component State with `useState`', NULL);
INSERT INTO public.lessons VALUES (26, 69, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Share states between sibling components through parent callbacks.', 'Lifting State Up', NULL);
INSERT INTO public.lessons VALUES (27, 70, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn what side effects are and why they are isolated.', 'Introduction to Side Effects', NULL);
INSERT INTO public.lessons VALUES (27, 71, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Run code on mount, update, or unmount states.', 'Effect Hook: `useEffect`', NULL);
INSERT INTO public.lessons VALUES (27, 72, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Extract component logic into reusable custom hook functions.', 'Custom Hooks Development', NULL);
INSERT INTO public.lessons VALUES (28, 73, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Efficiently render lists using key attributes.', 'Keys and List Rendering', NULL);
INSERT INTO public.lessons VALUES (28, 74, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Manage form inputs via React state or direct references.', 'Controlled vs Uncontrolled Inputs', NULL);
INSERT INTO public.lessons VALUES (28, 75, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Submit inputs safely with inline validations.', 'Form Submission & Validation', NULL);
INSERT INTO public.lessons VALUES (29, 76, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Avoid prop drilling by sharing states globally.', 'Context API for Global State', NULL);
INSERT INTO public.lessons VALUES (29, 77, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement client-side navigation routing.', 'React Router Basics', NULL);
INSERT INTO public.lessons VALUES (29, 78, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Use memo, useMemo, and useCallback to reduce rerenders.', 'Optimizing React Performance', NULL);
INSERT INTO public.lessons VALUES (30, 79, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn about single-threaded, non-blocking execution.', 'Node.js Runtime & V8 Engine', NULL);
INSERT INTO public.lessons VALUES (30, 80, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Read and write local files asynchronously.', 'File System Module (fs)', NULL);
INSERT INTO public.lessons VALUES (30, 81, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Process large files efficiently using stream chunks.', 'Event Emitters and Streams', NULL);
INSERT INTO public.lessons VALUES (31, 82, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Set up ports, endpoints, and listen to requests.', 'Creating an Express Server', NULL);
INSERT INTO public.lessons VALUES (31, 83, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand params, query variables, and request headers.', 'Routing & Request/Response Objects', NULL);
INSERT INTO public.lessons VALUES (31, 84, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Intercept requests for logging, parsing, and authorization.', 'Express Middleware Explained', NULL);
INSERT INTO public.lessons VALUES (32, 85, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Use GET, POST, PUT, DELETE, and correct HTTP status codes.', 'HTTP Methods and Status Codes', NULL);
INSERT INTO public.lessons VALUES (32, 86, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Verify input data using validation schemas.', 'Request Validation & Body Parsing', NULL);
INSERT INTO public.lessons VALUES (32, 87, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Build a standard product catalog management API.', 'CRUD Operations in Express', NULL);
INSERT INTO public.lessons VALUES (33, 88, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Configure pool clients and handle async queries.', 'Connecting to SQL Database', NULL);
INSERT INTO public.lessons VALUES (33, 89, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Map database rows to JavaScript objects using ORMs.', 'Using ORMs (Sequelize/Prisma)', NULL);
INSERT INTO public.lessons VALUES (33, 90, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Manage database schemas version control.', 'Migration and Seeding Data', NULL);
INSERT INTO public.lessons VALUES (34, 91, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Secure passwords using hashing and salt algorithms.', 'Password Hashing with bcrypt', NULL);
INSERT INTO public.lessons VALUES (34, 92, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Sign and verify JSON Web Tokens for authentication.', 'JWT Authentication Flow', NULL);
INSERT INTO public.lessons VALUES (34, 93, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Protect endpoints from common web vulnerabilities.', 'CORS and Helmet Middleware', NULL);
INSERT INTO public.lessons VALUES (35, 94, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Maintain tree height balance using left and right rotations.', 'AVL Tree Rotations', NULL);
INSERT INTO public.lessons VALUES (35, 95, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand node coloring rules and insert balances.', 'Red-Black Tree Properties', NULL);
INSERT INTO public.lessons VALUES (35, 96, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn the primary indexing structures used in DB engines.', 'B-Trees & B+ Trees in Databases', NULL);
INSERT INTO public.lessons VALUES (36, 97, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand amortized constant time operations.', 'Fibonacci Heap Structure', NULL);
INSERT INTO public.lessons VALUES (36, 98, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement mergeable priority queues.', 'Binomial Heap Operations', NULL);
INSERT INTO public.lessons VALUES (36, 99, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Store and search strings efficiently for autocomplete.', 'Trie (Prefix Tree) Implementation', NULL);
INSERT INTO public.lessons VALUES (37, 100, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Optimize set partition operations to near-constant time.', 'Union by Rank & Path Compression', NULL);
INSERT INTO public.lessons VALUES (37, 101, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Find undirected graph cycles using disjoint sets.', 'Detecting Cycles in Graphs', NULL);
INSERT INTO public.lessons VALUES (37, 102, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Build minimal spanning trees using union-find operations.', 'Kruskal''s MST Algorithm', NULL);
INSERT INTO public.lessons VALUES (38, 103, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Query intervals and segment sums in logarithmic time.', 'Range Query Problems', NULL);
INSERT INTO public.lessons VALUES (38, 104, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Perform range updates efficiently without rebuilding.', 'Point Updates & Lazy Propagation', NULL);
INSERT INTO public.lessons VALUES (38, 105, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement space-efficient range prefix sum queries.', 'Binary Indexed Trees (Fenwick Trees)', NULL);
INSERT INTO public.lessons VALUES (39, 106, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Search substrings using standard nested comparisons.', 'Naive String Matching', NULL);
INSERT INTO public.lessons VALUES (39, 107, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Search substrings linearly using prefix tables.', 'KMP (Knuth-Morris-Pratt) Algorithm', NULL);
INSERT INTO public.lessons VALUES (39, 108, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Search patterns using rolling hash codes.', 'Rabin-Karp Rolling Hash', NULL);
INSERT INTO public.lessons VALUES (40, 109, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Compare space and time trade-offs for representations.', 'Adjacency Matrix vs Adjacency List', NULL);
INSERT INTO public.lessons VALUES (40, 110, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Model unidirectional and bidirectional connections.', 'Directed vs Undirected Graphs', NULL);
INSERT INTO public.lessons VALUES (40, 111, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Add cost parameters to graph edges.', 'Weighted Graph Representation', NULL);
INSERT INTO public.lessons VALUES (41, 112, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Find shortest paths in unweighted graphs level by level.', 'Breadth-First Search (BFS)', NULL);
INSERT INTO public.lessons VALUES (41, 113, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Traverse graphs recursively using backtracks.', 'Depth-First Search (DFS)', NULL);
INSERT INTO public.lessons VALUES (41, 114, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Identify isolated subgraphs within network nodes.', 'Applications: Connected Components', NULL);
INSERT INTO public.lessons VALUES (42, 115, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Find paths in positive weighted graphs using min-heaps.', 'Dijkstra''s Single Source Shortest Path', NULL);
INSERT INTO public.lessons VALUES (42, 116, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Detect negative cycles and find shortest paths.', 'Bellman-Ford Algorithm', NULL);
INSERT INTO public.lessons VALUES (42, 117, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Solve dynamic programming shortest paths between all nodes.', 'Floyd-Warshall All-Pairs Shortest Path', NULL);
INSERT INTO public.lessons VALUES (43, 118, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Grow spanning trees using node cuts and priority queues.', 'Prim''s MST Algorithm', NULL);
INSERT INTO public.lessons VALUES (43, 119, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Build spanning trees by sorting edges and avoiding cycles.', 'Kruskal''s MST Algorithm', NULL);
INSERT INTO public.lessons VALUES (43, 120, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Optimize cable network installations and pipelines.', 'MST Applications', NULL);
INSERT INTO public.lessons VALUES (44, 121, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Order dependencies linearly for build scripts.', 'Topological Sorting', NULL);
INSERT INTO public.lessons VALUES (44, 122, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement topological sort using in-degree queues.', 'Kahn''s Algorithm', NULL);
INSERT INTO public.lessons VALUES (44, 123, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Find critical bridge connections in network graphs.', 'Bridges & Articulation Points', NULL);
INSERT INTO public.lessons VALUES (45, 124, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Diagram components, database caches, and API clients.', 'System Architecture Design', NULL);
INSERT INTO public.lessons VALUES (45, 125, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Organize project codebases using workspaces.', 'Monorepo vs Polyrepo Setup', NULL);
INSERT INTO public.lessons VALUES (45, 126, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Write dockerfiles and docker-compose configs.', 'Dockerizing Development Environments', NULL);
INSERT INTO public.lessons VALUES (46, 127, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Design relational tables with indices.', 'Database Schema for Products & Categories', NULL);
INSERT INTO public.lessons VALUES (46, 128, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement full-text search and faceted filters.', 'Product Search & Filter APIs', NULL);
INSERT INTO public.lessons VALUES (46, 129, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Optimize queries for millions of catalog items.', 'Pagination & Performance Tuning', NULL);
INSERT INTO public.lessons VALUES (47, 130, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Manage cart items in databases or session caches.', 'Cart Management APIs', NULL);
INSERT INTO public.lessons VALUES (47, 131, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Process orders and interface with payment APIs.', 'Ordering & Payment Integration', NULL);
INSERT INTO public.lessons VALUES (47, 132, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Verify payment statuses asynchronously using webhooks.', 'Webhook Handling', NULL);
INSERT INTO public.lessons VALUES (48, 133, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Handle cart checkout steps with global reducers.', 'State Management for Checkout', NULL);
INSERT INTO public.lessons VALUES (48, 134, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Style clean, responsive headers, sidebars, and checkouts.', 'TailwindCSS Styling & Layout', NULL);
INSERT INTO public.lessons VALUES (48, 135, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Display product cards dynamically across devices.', 'Responsive Product Grids', NULL);
INSERT INTO public.lessons VALUES (49, 136, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Write workflows to run backend and frontend tests.', 'GitHub Actions for Automated Tests', NULL);
INSERT INTO public.lessons VALUES (49, 137, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Configure cloud hosts, env variables, and scaling rules.', 'Deploying Backend to Cloud', NULL);
INSERT INTO public.lessons VALUES (49, 138, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Serve React assets with global low latency.', 'CDN Setup for Static Frontend', NULL);
INSERT INTO public.lessons VALUES (50, 139, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Model entities, attributes, and relationships.', 'Entity-Relationship Diagrams (ERD)', NULL);
INSERT INTO public.lessons VALUES (50, 140, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Reduce redundant data using normalization steps.', 'Normalization: 1NF, 2NF, 3NF', NULL);
INSERT INTO public.lessons VALUES (50, 141, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Implement cascading updates and deletes.', 'Foreign Keys & Referential Integrity', NULL);
INSERT INTO public.lessons VALUES (51, 142, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Filter rows and columns using WHERE, LIKE, and NULL operators.', 'SELECT Statement & Filters', NULL);
INSERT INTO public.lessons VALUES (51, 143, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Summarize groups of rows using sum, average, and counts.', 'Aggregations & GROUP BY', NULL);
INSERT INTO public.lessons VALUES (51, 144, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Query data from multiple tables simultaneously.', 'Joins: INNER, LEFT, RIGHT, FULL', NULL);
INSERT INTO public.lessons VALUES (52, 145, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Write readable query steps using CTE expressions.', 'Subqueries & Common Table Expressions', NULL);
INSERT INTO public.lessons VALUES (52, 146, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Analyze segments of rows without grouping them.', 'Window Functions: ROW_NUMBER, RANK', NULL);
INSERT INTO public.lessons VALUES (52, 147, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Query document stores inside relational postgres tables.', 'JSON Queries in Postgres', NULL);
INSERT INTO public.lessons VALUES (53, 148, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand how database indices accelerate lookups.', 'B-Tree Indices vs Hash Indices', NULL);
INSERT INTO public.lessons VALUES (53, 149, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Interpret query plans to locate performance bottlenecks.', 'EXPLAIN & ANALYZE', NULL);
INSERT INTO public.lessons VALUES (53, 150, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Split massive tables into manageable chunks.', 'Database Partitioning Basics', NULL);
INSERT INTO public.lessons VALUES (54, 151, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Learn Atomicity, Consistency, Isolation, and Durability.', 'ACID Properties', NULL);
INSERT INTO public.lessons VALUES (54, 152, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand dirty reads, non-repeatable reads, and phantoms.', 'Transaction Isolation Levels', NULL);
INSERT INTO public.lessons VALUES (54, 153, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Solve resource contentions in concurrent environments.', 'Row Locking and Deadlocks', NULL);
INSERT INTO public.lessons VALUES (55, 154, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Compare adding resources to single nodes vs clustering nodes.', 'Vertical vs Horizontal Scaling', NULL);
INSERT INTO public.lessons VALUES (55, 155, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Distribute requests to multiple backend instances.', 'Load Balancers (Nginx/HAProxy)', NULL);
INSERT INTO public.lessons VALUES (55, 156, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Compare monolithic codebases with independent service clusters.', 'Monolith vs Microservices', NULL);
INSERT INTO public.lessons VALUES (56, 157, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Reduce query latency using caching methods.', 'Caching Benefits and Policies', NULL);
INSERT INTO public.lessons VALUES (56, 158, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Store key-value pairs in memory caches.', 'Redis & Memcached Usage', NULL);
INSERT INTO public.lessons VALUES (56, 159, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand Least Recently Used eviction algorithms.', 'Cache Eviction: LRU/LFU', NULL);
INSERT INTO public.lessons VALUES (57, 160, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand asynchronous task queues and buffers.', 'Introduction to Message Brokers', NULL);
INSERT INTO public.lessons VALUES (57, 161, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Compare message queues with event logs.', 'RabbitMQ vs Apache Kafka', NULL);
INSERT INTO public.lessons VALUES (57, 162, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Publish events to multiple subscribing clients.', 'Publish/Subscribe Pattern', NULL);
INSERT INTO public.lessons VALUES (58, 163, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Understand Consistency, Availability, and Partition Tolerance.', 'CAP Theorem', NULL);
INSERT INTO public.lessons VALUES (58, 164, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Replicate data to read nodes for higher reliability.', 'Database Replication: Master-Slave', NULL);
INSERT INTO public.lessons VALUES (58, 165, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Partition tables horizontally based on hash keys.', 'Database Sharding & Consistent Hashing', NULL);
INSERT INTO public.lessons VALUES (59, 166, false, 1, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Design TinyURL endpoints and database mappings.', 'Designing a URL Shortener', NULL);
INSERT INTO public.lessons VALUES (59, 167, false, 2, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Protect API endpoints using token bucket algorithms.', 'Designing a Rate Limiter', NULL);
INSERT INTO public.lessons VALUES (59, 168, false, 3, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'ACTIVE', NULL, 'Architect chat connections using WebSockets.', 'Designing a Real-time Chat App', NULL);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: payment_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: payout_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: problem_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: problem_submission_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.problem_submission_details VALUES (NULL, 8724, NULL, 874, 10, '2026-07-21 06:56:31.34722+07', NULL, NULL, NULL, '27e6c8d0-a28c-4b7f-b2b4-023b742b9010', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8733, NULL, 875, 9, '2026-07-21 06:56:31.517682+07', NULL, NULL, NULL, 'ae4f040f-8201-4ffb-8cb9-befe3ef12ed5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8734, NULL, 875, 10, '2026-07-21 06:56:31.517682+07', NULL, NULL, NULL, '0ef82ab5-d94c-4b77-bd68-ca0d093638b9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8742, NULL, 876, 8, '2026-07-21 06:56:31.537352+07', NULL, NULL, NULL, '35a06c9b-ae9c-4e4a-8491-d0f045774495', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8743, NULL, 876, 9, '2026-07-21 06:56:31.537353+07', NULL, NULL, NULL, '948c639a-621b-4e36-97c5-a96536207945', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8744, NULL, 876, 10, '2026-07-21 06:56:31.537353+07', NULL, NULL, NULL, '6d24ff79-938c-4fe8-905c-91148ffed947', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8752, NULL, 877, 8, '2026-07-21 06:56:31.577826+07', NULL, NULL, NULL, '011b1c16-378e-405b-b588-eca8ed3f6a75', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8753, NULL, 877, 9, '2026-07-21 06:56:31.577826+07', NULL, NULL, NULL, '7de6117b-30f7-4c91-afc9-6ce46894c83e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8754, NULL, 877, 10, '2026-07-21 06:56:31.577826+07', NULL, NULL, NULL, 'e8c0e89f-84de-4eda-a55c-a5569dbd4551', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8769, NULL, 878, 8, '2026-07-21 06:56:31.605392+07', NULL, NULL, NULL, 'c6896df8-161d-4d3f-b916-0a1fb6aa3a2f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8770, NULL, 879, 8, '2026-07-21 06:56:31.605568+07', NULL, NULL, NULL, 'e01667d8-3a2a-4fce-b75e-7966fecc0933', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8771, NULL, 878, 9, '2026-07-21 06:56:31.605392+07', NULL, NULL, NULL, '7a13ed35-a6a8-4748-8442-021c5d80604c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8772, NULL, 879, 9, '2026-07-21 06:56:31.605568+07', NULL, NULL, NULL, '481363c3-cfa8-4a46-857e-328784c8ed8b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8773, NULL, 878, 10, '2026-07-21 06:56:31.605392+07', NULL, NULL, NULL, '26de89a6-4208-41c4-beb7-a2a8dda1a599', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8774, NULL, 879, 10, '2026-07-21 06:56:31.605568+07', NULL, NULL, NULL, '67b56beb-66d2-465c-a405-812565bae600', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8781, NULL, 880, 7, '2026-07-21 06:56:31.667009+07', NULL, NULL, NULL, '7ad61cee-3d3e-48ac-9a80-12ecf655e443', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8782, NULL, 880, 8, '2026-07-21 06:56:31.667009+07', NULL, NULL, NULL, '8c239da2-0784-4714-b831-d220b56214f3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8783, NULL, 880, 9, '2026-07-21 06:56:31.667009+07', NULL, NULL, NULL, 'e22c5b78-b400-4686-a432-ddc193e750f1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8784, NULL, 880, 10, '2026-07-21 06:56:31.667009+07', NULL, NULL, NULL, '721dc623-3e2f-4e2b-93bc-cb2ed2e04812', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (7, 8717, 14156, 874, 3, '2026-07-21 06:56:31.347217+07', NULL, NULL, '0 1
', '40c0cc14-da0a-43ac-9d72-d6ab48f22822', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 9535, NULL, 956, 1, '2026-07-21 06:56:36.424053+07', NULL, NULL, NULL, '3e05d069-66bd-4d7c-9e1a-e9e7cea2ad34', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (5, 8776, 1620, 880, 2, '2026-07-21 06:56:31.667008+07', NULL, NULL, '1 2
', 'a83c0240-dd81-40d5-954e-b3c9ff944918', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8758, 2176, 879, 2, '2026-07-21 06:56:31.605567+07', NULL, NULL, '1 2
', 'd03672ca-1f0b-48d6-8f8c-372e53a9cd4e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8785, 3684, 881, 1, '2026-07-21 06:56:31.698205+07', NULL, NULL, '0 1
', '01aa631a-49f8-4597-8a50-5a80800580da', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8715, 1664, 874, 1, '2026-07-21 06:56:31.347216+07', NULL, NULL, '0 1
', '5af315b7-04f8-4b64-9da1-ee63b4b171e5', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8736, 2216, 876, 2, '2026-07-21 06:56:31.537352+07', NULL, NULL, '1 2
', 'e5bf298e-bc9b-4c24-af57-01c644ce7d92', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8757, 888, 878, 2, '2026-07-21 06:56:31.605391+07', NULL, NULL, '1 2
', 'c2b35c11-f60f-44bd-9e83-333b26890409', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8716, 1084, 874, 2, '2026-07-21 06:56:31.347217+07', NULL, NULL, '1 2
', '7f750a22-1edb-460d-b2a1-aaba3cb57b9c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8735, 1980, 876, 1, '2026-07-21 06:56:31.537351+07', NULL, NULL, '0 1
', 'caeb9424-ec0a-47d7-a5eb-3979131feeaa', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8775, 924, 880, 1, '2026-07-21 06:56:31.667005+07', NULL, NULL, '0 1
', '5eba1efe-3de7-4bec-b0a0-21921b7d113e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8725, 1320, 875, 1, '2026-07-21 06:56:31.51768+07', NULL, NULL, '0 1
', '9ce635ef-057f-414a-9936-7f99e550f858', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8727, 1144, 875, 3, '2026-07-21 06:56:31.517681+07', NULL, NULL, '0 1
', '81c31050-324b-490f-9fc4-d43eb54acae1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8746, 1092, 877, 2, '2026-07-21 06:56:31.577826+07', NULL, NULL, '1 2
', 'cab18d37-a8ce-4763-9cb0-d8e5b93c87c0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8718, 924, 874, 4, '2026-07-21 06:56:31.347218+07', NULL, NULL, '1 2
', '42f95ced-b947-4224-b074-df66eacb6dd9', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8762, 940, 879, 4, '2026-07-21 06:56:31.605568+07', NULL, NULL, '1 2
', '29ed5482-17f4-4690-959a-090230405de9', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8759, 940, 878, 3, '2026-07-21 06:56:31.605392+07', NULL, NULL, '0 1
', 'ff87e3b9-b89b-4b2b-8359-f4284cac09c1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8728, 1088, 875, 4, '2026-07-21 06:56:31.517681+07', NULL, NULL, '1 2
', '1039e955-6b4d-43e0-87fd-34789e852d3b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8747, 1100, 877, 3, '2026-07-21 06:56:31.577826+07', NULL, NULL, '0 1
', 'ff0d4e98-b944-404f-bbf9-0aafed0cb1c4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8787, 1164, 881, 3, '2026-07-21 06:56:31.698206+07', NULL, NULL, '0 1
', '81565b5f-3a15-4064-9686-08582bf35199', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8737, 1144, 876, 3, '2026-07-21 06:56:31.537352+07', NULL, NULL, '0 1
', '660d77d0-85ed-41ef-ba8a-0cb8b01da465', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8777, 1176, 880, 3, '2026-07-21 06:56:31.667008+07', NULL, NULL, '0 1
', '34aa858c-5bc7-43be-8b1a-a777f0304659', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8729, 1064, 875, 5, '2026-07-21 06:56:31.517681+07', NULL, NULL, '1 2
', 'f35f817e-d248-47cf-bfa7-14cb01817e30', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8719, 1048, 874, 5, '2026-07-21 06:56:31.347218+07', NULL, NULL, '1 2
', '7bfdd25e-7cc0-41fe-96f0-4227981023d0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 8788, 1092, 881, 4, '2026-07-21 06:56:31.698206+07', NULL, NULL, '1 2
', '4848085f-3852-43bf-a8f7-589f7f6e9a30', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8764, 1036, 879, 5, '2026-07-21 06:56:31.605568+07', NULL, NULL, '1 2
', 'be3cf45f-439f-4fd6-9c7b-3856d83710e2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8738, 1072, 876, 4, '2026-07-21 06:56:31.537352+07', NULL, NULL, '1 2
', '60c06147-7a81-430e-a843-9f39c4d00fee', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8761, 1064, 878, 4, '2026-07-21 06:56:31.605392+07', NULL, NULL, '1 2
', '6a3ead05-3d8d-4555-8f3c-a626bf13749f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8720, 1072, 874, 6, '2026-07-21 06:56:31.347218+07', NULL, NULL, '1 2
', '15f8e1f9-bd3f-45e8-98ad-9ac3d85babf2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8749, 908, 877, 5, '2026-07-21 06:56:31.577826+07', NULL, NULL, '1 2
', '0ca61784-625e-4bd1-a1f1-93b6ba07dd66', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8739, 1132, 876, 5, '2026-07-21 06:56:31.537352+07', NULL, NULL, '1 2
', '545d3b2b-0da7-4392-b480-fbaa6e978659', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8778, 1136, 880, 4, '2026-07-21 06:56:31.667008+07', NULL, NULL, '1 2
', '4d3fbe34-4687-4ac4-ada4-4bd15ac5e5a4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8789, 1064, 881, 5, '2026-07-21 06:56:31.698206+07', NULL, NULL, '1 2
', '5136031b-6863-4be6-9df3-6a23fd2414bf', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8721, 908, 874, 7, '2026-07-21 06:56:31.347218+07', NULL, NULL, '3 4
', '322ee02c-ea29-436a-85c6-afa8a7fcb959', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8763, 1072, 878, 5, '2026-07-21 06:56:31.605392+07', NULL, NULL, '1 2
', '96d3a019-b534-459d-9219-1dcef6696bbf', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 8779, 872, 880, 5, '2026-07-21 06:56:31.667008+07', NULL, NULL, '1 2
', 'd27a2044-de13-4d76-b625-1685ece45538', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8740, 1088, 876, 6, '2026-07-21 06:56:31.537352+07', NULL, NULL, '1 2
', 'dbfc7f69-da37-426e-891a-4ae9c0608510', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8731, 1068, 875, 7, '2026-07-21 06:56:31.517681+07', NULL, NULL, '3 4
', 'a13a1942-8188-4eaf-9613-788bfff1cf69', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8765, 904, 878, 6, '2026-07-21 06:56:31.605392+07', NULL, NULL, '1 2
', '0626b46b-3eaf-4f34-83ba-84e0f06c9d28', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8766, 1084, 879, 6, '2026-07-21 06:56:31.605568+07', NULL, NULL, '1 2
', '8453073d-937b-49bb-8d90-51de855f3a19', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8722, 1152, 874, 8, '2026-07-21 06:56:31.347218+07', NULL, NULL, '2 4
', '99a519e1-7b42-465c-b011-a24a1cb919f3', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8780, 1072, 880, 6, '2026-07-21 06:56:31.667009+07', NULL, NULL, '1 2
', '08dd8786-9954-4ed4-907b-fd39e88308ad', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8768, 1168, 879, 7, '2026-07-21 06:56:31.605568+07', NULL, NULL, '3 4
', '210ca4f8-644c-4559-9434-baaa9ab7a8f4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8741, 1104, 876, 7, '2026-07-21 06:56:31.537352+07', NULL, NULL, '3 4
', 'b3578e28-d724-47b6-bd2c-0753d49b08e4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8732, 1168, 875, 8, '2026-07-21 06:56:31.517681+07', NULL, NULL, '2 4
', 'aedb25ae-e397-4d04-a63e-6e0528a3a10f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8723, 1024, 874, 9, '2026-07-21 06:56:31.347218+07', NULL, NULL, '0 3
', '75ed2dfe-6d82-4b09-adae-ec9a83ce689a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 8791, NULL, 881, 7, '2026-07-21 06:56:31.698206+07', NULL, NULL, NULL, '1ae9e1ee-1331-4c20-b9b8-7753e68df117', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8792, NULL, 881, 8, '2026-07-21 06:56:31.698206+07', NULL, NULL, NULL, 'a838ecb8-8945-4465-a53b-7a0e88f1610e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8793, NULL, 881, 9, '2026-07-21 06:56:31.698206+07', NULL, NULL, NULL, '2c82a618-c6f0-4a0e-973d-d2ccbb2b8e99', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8794, NULL, 881, 10, '2026-07-21 06:56:31.698206+07', NULL, NULL, NULL, '7148bb4a-cc47-4051-991a-860b45e205d0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8801, NULL, 882, 7, '2026-07-21 06:56:31.762634+07', NULL, NULL, NULL, 'fb6b9c8e-2914-4f96-809d-abe05e764e6d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8802, NULL, 882, 8, '2026-07-21 06:56:31.762634+07', NULL, NULL, NULL, 'df6763bc-3544-457d-aebe-23fea7c1c287', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8803, NULL, 882, 9, '2026-07-21 06:56:31.762634+07', NULL, NULL, NULL, 'b4895f20-d068-4cc5-820d-0209acc11b97', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8804, NULL, 882, 10, '2026-07-21 06:56:31.762634+07', NULL, NULL, NULL, '5b541f40-f770-483d-ae63-50eb3823de01', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8827, NULL, 886, 6, '2026-07-21 06:56:31.864909+07', NULL, NULL, NULL, 'bb10f221-f4b6-4b81-85eb-455058edaa45', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8829, NULL, 883, 7, '2026-07-21 06:56:31.864563+07', NULL, NULL, NULL, 'f02d5fd0-5b42-427d-903b-495743122353', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8831, NULL, 886, 7, '2026-07-21 06:56:31.864909+07', NULL, NULL, NULL, 'b9b9b671-3950-461f-ac58-aa417779e41b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8833, NULL, 883, 8, '2026-07-21 06:56:31.864563+07', NULL, NULL, NULL, '3f928e35-6a9d-415d-b7d7-4e5dfc91cd22', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8834, NULL, 885, 8, '2026-07-21 06:56:31.8647+07', NULL, NULL, NULL, 'd1b6b8cd-8c53-4762-852d-23c94796bc21', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8835, NULL, 884, 8, '2026-07-21 06:56:31.865282+07', NULL, NULL, NULL, '31584c12-5039-4cbe-be26-d3a6efbceaea', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8836, NULL, 886, 8, '2026-07-21 06:56:31.864909+07', NULL, NULL, NULL, '755eb9c6-f52a-40f4-9f10-048ee21d4e40', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8838, NULL, 883, 9, '2026-07-21 06:56:31.864563+07', NULL, NULL, NULL, 'd28d736e-a296-4b1f-9fd0-650f6a6708bc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8839, NULL, 884, 9, '2026-07-21 06:56:31.865282+07', NULL, NULL, NULL, '28543d85-a61f-491e-962e-6987e7df1e8a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8840, NULL, 885, 9, '2026-07-21 06:56:31.8647+07', NULL, NULL, NULL, '398ccb69-02c2-4969-a6ca-ec2f7bcf3e02', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8841, NULL, 886, 9, '2026-07-21 06:56:31.864909+07', NULL, NULL, NULL, 'dd27778a-cd60-4642-9f27-2ce20e78c469', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8843, NULL, 884, 10, '2026-07-21 06:56:31.865282+07', NULL, NULL, NULL, '2e08ea55-1232-4a6e-b769-b733f4dd4e5d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8844, NULL, 883, 10, '2026-07-21 06:56:31.864563+07', NULL, NULL, NULL, '3694147a-9682-4e54-97b5-e5202763bdbd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8845, NULL, 885, 10, '2026-07-21 06:56:31.8647+07', NULL, NULL, NULL, '24dcad10-4912-480c-99e1-d6a9f17a74e8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8847, NULL, 886, 10, '2026-07-21 06:56:31.864909+07', NULL, NULL, NULL, '999a99e5-3a11-4293-96e0-17091e5a79be', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8850, NULL, 887, 6, '2026-07-21 06:56:31.875587+07', NULL, NULL, NULL, '4dd797f3-d255-4bf1-9d2c-d08f130a19de', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8851, NULL, 887, 7, '2026-07-21 06:56:31.875587+07', NULL, NULL, NULL, 'f88fc3f1-6c89-4d21-8bb6-aee7ab628c3c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8852, NULL, 887, 8, '2026-07-21 06:56:31.875588+07', NULL, NULL, NULL, 'c2ca5332-9e40-42fa-b3de-fd408b3ff8c1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8853, NULL, 887, 9, '2026-07-21 06:56:31.875588+07', NULL, NULL, NULL, '6e5ef9d0-80ca-4254-b542-b9a5e3ed30d7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8854, NULL, 887, 10, '2026-07-21 06:56:31.875588+07', NULL, NULL, NULL, '632dfe08-baac-47a8-9ef8-01a85b71f162', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8859, NULL, 888, 5, '2026-07-21 06:56:31.972624+07', NULL, NULL, NULL, 'f6c013cb-3e2e-47a9-aaa4-df3dc2321bed', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8860, NULL, 888, 6, '2026-07-21 06:56:31.972624+07', NULL, NULL, NULL, 'eee9b732-1008-48f8-8fb2-05038597075f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8861, NULL, 888, 7, '2026-07-21 06:56:31.972624+07', NULL, NULL, NULL, 'bab4c178-1fcf-49c7-b711-feddbea0363a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8862, NULL, 888, 8, '2026-07-21 06:56:31.972625+07', NULL, NULL, NULL, 'b26e5d1d-aa2f-4320-a34e-e1bf8659701e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8863, NULL, 888, 9, '2026-07-21 06:56:31.972625+07', NULL, NULL, NULL, '4a0fa22c-8273-4855-8bca-cd07ece0a356', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8864, NULL, 888, 10, '2026-07-21 06:56:31.972625+07', NULL, NULL, NULL, '9ae795e4-a894-4298-9426-f2dcb9632323', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (6, 8837, 2560, 887, 1, '2026-07-21 06:56:31.875586+07', NULL, NULL, '0 1
', '4c410e3b-b17b-477e-8273-cedf0029fc84', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8809, 4856, 883, 2, '2026-07-21 06:56:31.864562+07', NULL, NULL, '1 2
', 'b6406300-c3f2-4caa-ad75-9a92285ce853', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8806, 2920, 885, 1, '2026-07-21 06:56:31.864699+07', NULL, NULL, '0 1
', '98eae942-b66d-4fb1-a09a-df01fb60d95d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8805, 4332, 883, 1, '2026-07-21 06:56:31.864562+07', NULL, NULL, '0 1
', 'd9c2caff-51eb-4660-9807-b1f3506cdcf2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8808, 1088, 884, 1, '2026-07-21 06:56:31.865281+07', NULL, NULL, '0 1
', '81d03341-e144-456d-a75b-022f749515c2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8842, 1084, 887, 2, '2026-07-21 06:56:31.875587+07', NULL, NULL, '1 2
', '6cd8da6a-f75e-4605-82d1-34576c4f0fc9', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8810, 1084, 885, 2, '2026-07-21 06:56:31.864699+07', NULL, NULL, '1 2
', '488744e3-d811-4259-930d-20fba0737354', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8811, 1100, 886, 2, '2026-07-21 06:56:31.864908+07', NULL, NULL, '1 2
', '63758e49-ef7d-4ffc-94b9-4d9990b791d9', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8814, 936, 885, 3, '2026-07-21 06:56:31.864699+07', NULL, NULL, '0 1
', 'ca6e3ed8-ea8e-4bf8-8e6e-d550e076ba20', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8813, 924, 883, 3, '2026-07-21 06:56:31.864562+07', NULL, NULL, '0 1
', '974a3581-8254-4462-8b3a-3901814983f4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8821, 1060, 884, 4, '2026-07-21 06:56:31.865282+07', NULL, NULL, '1 2
', '19599607-6785-49df-8e32-dd26090d3566', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8816, 1084, 884, 3, '2026-07-21 06:56:31.865282+07', NULL, NULL, '0 1
', '22a7998b-6213-4160-9983-d23f3ad234a1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8796, 1084, 882, 2, '2026-07-21 06:56:31.762633+07', NULL, NULL, '1 2
', '5aaf7c5f-48d2-428b-867f-562914d37497', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8818, 908, 885, 4, '2026-07-21 06:56:31.864699+07', NULL, NULL, '1 2
', '000ea02a-69fd-4427-95c2-a8172632f47c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8846, 932, 887, 3, '2026-07-21 06:56:31.875587+07', NULL, NULL, '0 1
', '36c0b68d-a2a4-4737-afe3-61517fece8d7', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8817, 924, 883, 4, '2026-07-21 06:56:31.864563+07', NULL, NULL, '1 2
', '4f2d7b58-ea89-4c32-ae40-8b6456f15f6b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8822, 1080, 885, 5, '2026-07-21 06:56:31.8647+07', NULL, NULL, '1 2
', '598b236a-296d-428f-9474-495ba39362ca', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8815, 1140, 886, 3, '2026-07-21 06:56:31.864909+07', NULL, NULL, '0 1
', 'be8881a8-befb-4894-96d3-2cdcab17e699', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8798, 920, 882, 4, '2026-07-21 06:56:31.762634+07', NULL, NULL, '1 2
', '48d5e260-e89e-43f5-84e3-7e04c20a2919', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8855, 1064, 888, 1, '2026-07-21 06:56:31.972623+07', NULL, NULL, '0 1
', 'cb9f6a61-93c9-4112-b323-bf22e327fb41', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8824, 1064, 884, 5, '2026-07-21 06:56:31.865282+07', NULL, NULL, '1 2
', 'd40151ff-2511-4e35-9c01-5f9bab3613c5', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8848, 1072, 887, 4, '2026-07-21 06:56:31.875587+07', NULL, NULL, '1 2
', 'b1a9d9a3-1226-4751-bda5-08f470a8f54d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8828, 1020, 884, 6, '2026-07-21 06:56:31.865282+07', NULL, NULL, '1 2
', '1c1aa4dc-4c17-4440-ac5c-474d97ac23e3', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8826, 912, 885, 6, '2026-07-21 06:56:31.8647+07', NULL, NULL, '1 2
', '0b3f6ab5-75d1-47d6-bb0f-37bd487f52f5', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8823, 1136, 886, 5, '2026-07-21 06:56:31.864909+07', NULL, NULL, '1 2
', '5873a670-75d6-4c31-b62b-43de6df2dbf0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8820, 1140, 883, 5, '2026-07-21 06:56:31.864563+07', NULL, NULL, '1 2
', 'd2893775-7af4-4434-92f6-4f6d73e795a0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8799, 1136, 882, 5, '2026-07-21 06:56:31.762634+07', NULL, NULL, '1 2
', '8e88e930-a7f5-4f97-815d-fd7c945687be', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8790, 1148, 881, 6, '2026-07-21 06:56:31.698206+07', NULL, NULL, '1 2
', '053f9110-2087-43d8-bf51-73ba932ec490', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8857, 1136, 888, 3, '2026-07-21 06:56:31.972624+07', NULL, NULL, '0 1
', '4ff04a8a-1e5b-4bff-8be7-d29c757199ce', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8849, 1072, 887, 5, '2026-07-21 06:56:31.875587+07', NULL, NULL, '1 2
', '5732ea5a-c8ed-40f4-aa9a-8e0ba478d24c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8832, 1040, 884, 7, '2026-07-21 06:56:31.865282+07', NULL, NULL, '3 4
', '02b9315b-a6bf-4476-9b17-89a893dc6680', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 8830, 1036, 885, 7, '2026-07-21 06:56:31.8647+07', NULL, NULL, '3 4
', '02f6c9ff-b9c1-4a1b-a9cd-00a03b93a9ef', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8800, 1088, 882, 6, '2026-07-21 06:56:31.762634+07', NULL, NULL, '1 2
', 'd1d299d6-7362-4136-9d96-da793071dfde', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8858, 1068, 888, 4, '2026-07-21 06:56:31.972624+07', NULL, NULL, '1 2
', '2a8a54c2-9acf-42f0-9bb3-1f55caab2be7', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 8870, NULL, 889, 6, '2026-07-21 06:56:32.005495+07', NULL, NULL, NULL, '1a813f7b-0e86-4521-88b1-2d14bcc46221', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8871, NULL, 889, 7, '2026-07-21 06:56:32.005495+07', NULL, NULL, NULL, '5de9498d-51d5-4939-8c4c-debc2f0e02e3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8872, NULL, 889, 8, '2026-07-21 06:56:32.005496+07', NULL, NULL, NULL, '3700a5b1-beda-48e4-9760-be1e53b438e6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8873, NULL, 889, 9, '2026-07-21 06:56:32.005496+07', NULL, NULL, NULL, 'e5d8fdaf-e36e-40c6-9926-3c00a0e7b53c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8874, NULL, 889, 10, '2026-07-21 06:56:32.005496+07', NULL, NULL, NULL, '77fd26c0-fc7e-4a29-bd46-96dbddac8826', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8878, NULL, 890, 4, '2026-07-21 06:56:32.22094+07', NULL, NULL, NULL, 'f7d73d05-f019-4959-a62b-c048e4303da1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8879, NULL, 890, 5, '2026-07-21 06:56:32.22094+07', NULL, NULL, NULL, '534d490e-f629-4f4b-9b22-4db45eb978b6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8880, NULL, 890, 6, '2026-07-21 06:56:32.22094+07', NULL, NULL, NULL, '2c7c11fc-9226-497f-8f13-2fbadcae4d12', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8881, NULL, 890, 7, '2026-07-21 06:56:32.220941+07', NULL, NULL, NULL, '67b0f429-bb9b-47c6-a547-3ed82454f695', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8882, NULL, 890, 8, '2026-07-21 06:56:32.220941+07', NULL, NULL, NULL, 'ad440a6d-ec69-4402-a61e-f63a13584c19', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8883, NULL, 890, 9, '2026-07-21 06:56:32.220941+07', NULL, NULL, NULL, 'ffc2584e-2024-4674-91fc-eeca7e54646f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8884, NULL, 890, 10, '2026-07-21 06:56:32.220941+07', NULL, NULL, NULL, '6868d1fa-61c2-41a7-9123-c761f4194efb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8887, NULL, 891, 3, '2026-07-21 06:56:32.230039+07', NULL, NULL, NULL, 'cced6719-183b-4bc4-8f10-d219c2882b2c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8888, NULL, 891, 4, '2026-07-21 06:56:32.23004+07', NULL, NULL, NULL, '76a31b1a-04f2-4889-abfc-845234c19e9f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8889, NULL, 891, 5, '2026-07-21 06:56:32.23004+07', NULL, NULL, NULL, 'cfd47fe0-e24d-41d7-9266-542d273ff165', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8890, NULL, 891, 6, '2026-07-21 06:56:32.23004+07', NULL, NULL, NULL, '3cfa4e4f-f415-4715-9d86-b94cbdd2bb8c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8891, NULL, 891, 7, '2026-07-21 06:56:32.23004+07', NULL, NULL, NULL, '401162c7-89e0-4a83-9d43-d71feb99a979', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8892, NULL, 891, 8, '2026-07-21 06:56:32.23004+07', NULL, NULL, NULL, '491919b4-14dc-4eeb-a887-ba15ee2e1191', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8893, NULL, 891, 9, '2026-07-21 06:56:32.23004+07', NULL, NULL, NULL, '72c94e8e-fd51-4c92-9d96-c8551835d213', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8895, NULL, 891, 10, '2026-07-21 06:56:32.23004+07', NULL, NULL, NULL, 'dda35f78-d2ea-4bd9-8754-1f36e15717e7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8897, NULL, 892, 3, '2026-07-21 06:56:32.239041+07', NULL, NULL, NULL, '07c2444b-700f-4779-9386-e32ddc993585', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8898, NULL, 892, 4, '2026-07-21 06:56:32.239041+07', NULL, NULL, NULL, 'c32301f6-5224-4675-b5ec-48985ef94731', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8899, NULL, 892, 5, '2026-07-21 06:56:32.239041+07', NULL, NULL, NULL, '8865257c-52ed-4dbd-95a1-465d06d8cbf1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8900, NULL, 892, 6, '2026-07-21 06:56:32.239041+07', NULL, NULL, NULL, '2e8d061b-9685-4e76-a40d-03702a99113e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8901, NULL, 892, 7, '2026-07-21 06:56:32.239042+07', NULL, NULL, NULL, 'ac995539-cee8-4c6f-8dee-e35ff0081da1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8902, NULL, 892, 8, '2026-07-21 06:56:32.239042+07', NULL, NULL, NULL, 'a433c644-8eac-4543-9d09-dda1ceffa151', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8903, NULL, 892, 9, '2026-07-21 06:56:32.239042+07', NULL, NULL, NULL, '9c83ca5a-5d77-4c17-8e5a-d3a3ca6f0e3e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8904, NULL, 892, 10, '2026-07-21 06:56:32.239043+07', NULL, NULL, NULL, '3f8f248b-7836-4484-b0dc-30c54612ce33', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8909, NULL, 893, 3, '2026-07-21 06:56:32.273732+07', NULL, NULL, NULL, 'd67655c9-52d1-409b-b713-304365793d11', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8911, NULL, 893, 4, '2026-07-21 06:56:32.273732+07', NULL, NULL, NULL, '2cfd6ce5-c271-4d1c-84dc-c39611bea57a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8912, NULL, 894, 4, '2026-07-21 06:56:32.273884+07', NULL, NULL, NULL, 'f6c5c231-40bb-4c0b-b93e-7f0537f64cce', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8913, NULL, 893, 5, '2026-07-21 06:56:32.273732+07', NULL, NULL, NULL, '6b13b307-0c26-4f66-8d1e-da3caad92adc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8914, NULL, 894, 5, '2026-07-21 06:56:32.273884+07', NULL, NULL, NULL, '4e685390-1907-4421-a487-b1f2e2287903', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8915, NULL, 893, 6, '2026-07-21 06:56:32.273732+07', NULL, NULL, NULL, '3885f222-afdb-4931-a388-8a4d1576ac59', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8916, NULL, 894, 6, '2026-07-21 06:56:32.273884+07', NULL, NULL, NULL, '58df6833-eec3-444f-958c-fe2aa24eb731', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8917, NULL, 893, 7, '2026-07-21 06:56:32.273732+07', NULL, NULL, NULL, 'c67f00c8-d748-41e6-9037-2f4259223067', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8918, NULL, 894, 7, '2026-07-21 06:56:32.273884+07', NULL, NULL, NULL, '43d63e64-faf6-4382-a007-dde1fea1a025', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8919, NULL, 893, 8, '2026-07-21 06:56:32.273732+07', NULL, NULL, NULL, 'ea71e670-1fa7-4b04-bfae-ab8892ab17f8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8920, NULL, 894, 8, '2026-07-21 06:56:32.273884+07', NULL, NULL, NULL, 'd314b4b4-2f03-4309-9a1a-38e60279673b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8921, NULL, 893, 9, '2026-07-21 06:56:32.273732+07', NULL, NULL, NULL, 'e2d4aeaa-8241-481c-8445-c00196e8b5e8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8922, NULL, 894, 9, '2026-07-21 06:56:32.273884+07', NULL, NULL, NULL, 'bf29b25b-8647-4b43-b41f-91d2f1c514c7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8923, NULL, 893, 10, '2026-07-21 06:56:32.273732+07', NULL, NULL, NULL, 'b01e2d21-87cd-44fa-b413-aac0428135b5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8924, NULL, 894, 10, '2026-07-21 06:56:32.273884+07', NULL, NULL, NULL, '09e2bea4-e694-49cb-be92-9ca3d6044920', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8929, NULL, 895, 2, '2026-07-21 06:56:32.387934+07', NULL, NULL, NULL, '8698e88d-9b87-4447-8a7b-2eba0434d9a1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8930, NULL, 896, 3, '2026-07-21 06:56:32.388347+07', NULL, NULL, NULL, '6142c1b7-d6bd-4d7c-b915-b66e5c60d33c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8931, NULL, 895, 3, '2026-07-21 06:56:32.387935+07', NULL, NULL, NULL, 'ed3b2bb7-e022-44f4-a2a9-5d9cc1ed3be1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8932, NULL, 896, 4, '2026-07-21 06:56:32.388347+07', NULL, NULL, NULL, '86caccef-ad56-4f44-ba50-d5521c9abecc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8933, NULL, 897, 2, '2026-07-21 06:56:32.389467+07', NULL, NULL, NULL, 'c1c4d4a5-b915-45d3-a367-740be9195945', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8934, NULL, 895, 4, '2026-07-21 06:56:32.387935+07', NULL, NULL, NULL, 'ec451659-b54f-4136-9c45-f195f4735617', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8935, NULL, 896, 5, '2026-07-21 06:56:32.388347+07', NULL, NULL, NULL, '64ef12d8-68be-4d3b-88cb-4621807dc3ab', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8936, NULL, 897, 3, '2026-07-21 06:56:32.389467+07', NULL, NULL, NULL, 'a82363c7-c83f-4a31-8b70-8115beca3aec', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8937, NULL, 895, 5, '2026-07-21 06:56:32.387935+07', NULL, NULL, NULL, '752ffea1-e4d5-433a-8d7b-cc53efbeb9ab', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8938, NULL, 897, 4, '2026-07-21 06:56:32.389467+07', NULL, NULL, NULL, 'cc6e8106-695d-4593-b6c3-d280bfcf284a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8939, NULL, 896, 6, '2026-07-21 06:56:32.388347+07', NULL, NULL, NULL, '7ef97fd8-a45d-4c06-98b9-6c1c9500ce19', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (6, 8866, 1368, 889, 2, '2026-07-21 06:56:32.005495+07', NULL, NULL, '1 2
', 'ecd15295-3757-4a5c-8cd9-b552fbe1376a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8867, 1080, 889, 3, '2026-07-21 06:56:32.005495+07', NULL, NULL, '0 1
', '1c1b81fc-bdd4-4457-81d0-043bb3499a09', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8905, 1076, 894, 1, '2026-07-21 06:56:32.273883+07', NULL, NULL, '0 1
', '77b00200-4427-4dc8-a1d2-1f5245bf83fd', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8894, 1132, 892, 1, '2026-07-21 06:56:32.239039+07', NULL, NULL, '0 1
', '6ea3453c-565d-454e-9338-4a3bba8d50f8', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8875, 1076, 890, 1, '2026-07-21 06:56:32.220939+07', NULL, NULL, '0 1
', 'f36e4072-47da-47af-b5ae-b33db8ba439d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8868, 1088, 889, 4, '2026-07-21 06:56:32.005495+07', NULL, NULL, '1 2
', '5f378050-5e58-4a80-8fcc-e2c6b60e0aa1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8926, 1068, 896, 1, '2026-07-21 06:56:32.388346+07', NULL, NULL, '0 1
', 'c8d24074-ebc8-408a-9d06-c5bbc098da0a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8876, 952, 890, 2, '2026-07-21 06:56:32.22094+07', NULL, NULL, '1 2
', '0f9de1ca-1e7a-447a-8da7-1fb165fb5736', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8907, 1080, 893, 2, '2026-07-21 06:56:32.273731+07', NULL, NULL, '1 2
', 'ddf4b477-d6af-489a-9225-8d445480b76f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8896, 1068, 892, 2, '2026-07-21 06:56:32.239041+07', NULL, NULL, '1 2
', '1cfb4dc8-a9df-4cb1-af70-61dc43cd3ba3', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8910, 1136, 894, 3, '2026-07-21 06:56:32.273883+07', NULL, NULL, '0 1
', '6baa101e-1301-4c2c-a5ee-1cd180305705', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8885, 1052, 891, 1, '2026-07-21 06:56:32.230038+07', NULL, NULL, '0 1
', 'cade8b15-e669-4fd7-b904-d0a2d0830f87', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8927, 1076, 896, 2, '2026-07-21 06:56:32.388347+07', NULL, NULL, '1 2
', '30193910-b959-4790-82ca-83b60fb10512', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 8877, 1076, 890, 3, '2026-07-21 06:56:32.22094+07', NULL, NULL, '0 1
', 'a701e70a-6439-457c-9903-e18bf344a098', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8869, 1068, 889, 5, '2026-07-21 06:56:32.005495+07', NULL, NULL, '1 2
', 'cd35daa6-a6d7-4a43-82cf-748f79dbd308', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8886, 1064, 891, 2, '2026-07-21 06:56:32.230039+07', NULL, NULL, '1 2
', 'd9b0f1c1-f4f7-4ce6-836e-384373c4d84c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 8940, NULL, 895, 6, '2026-07-21 06:56:32.387935+07', NULL, NULL, NULL, '2bc1ae41-10f3-4ae6-96a4-7fe250bd06a0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8944, NULL, 895, 7, '2026-07-21 06:56:32.387935+07', NULL, NULL, NULL, 'e5eed6aa-4755-4061-83ce-87ac1d897e43', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8946, NULL, 895, 8, '2026-07-21 06:56:32.387935+07', NULL, NULL, NULL, '1430162e-7438-4fb7-8092-98afca8c9658', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8948, NULL, 895, 9, '2026-07-21 06:56:32.387935+07', NULL, NULL, NULL, '52a992d6-9d9d-4d9c-82ea-2fad016ff66c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8951, NULL, 895, 10, '2026-07-21 06:56:32.387935+07', NULL, NULL, NULL, 'f4bc11be-ad2e-47b6-82a9-5543ad024e9b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9185, NULL, 921, 1, '2026-07-21 06:56:34.388188+07', NULL, NULL, NULL, '25609f01-8c62-4c03-b761-67dd5b759ddd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9186, NULL, 921, 2, '2026-07-21 06:56:34.38819+07', NULL, NULL, NULL, '5244ea38-91b6-4787-9c51-6ee3a8ab079b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9187, NULL, 921, 3, '2026-07-21 06:56:34.38819+07', NULL, NULL, NULL, '76eb0d08-c6b5-4e93-8bc5-8d2877b0b014', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9188, NULL, 921, 4, '2026-07-21 06:56:34.38819+07', NULL, NULL, NULL, '5782e895-a228-482f-944c-f860c8dadadc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9189, NULL, 921, 5, '2026-07-21 06:56:34.38819+07', NULL, NULL, NULL, '62de150a-19b9-4e60-ae78-a2238fbb7551', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9190, NULL, 921, 6, '2026-07-21 06:56:34.38819+07', NULL, NULL, NULL, '32e9be85-e3d0-4d78-aa5a-52d5501e2296', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9191, NULL, 921, 7, '2026-07-21 06:56:34.388191+07', NULL, NULL, NULL, '254f7da4-6367-4092-b796-10df0168cbe0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9192, NULL, 921, 8, '2026-07-21 06:56:34.388191+07', NULL, NULL, NULL, 'e75eb1b4-d6fe-4d2b-9c78-029bc48eb8c3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9193, NULL, 921, 9, '2026-07-21 06:56:34.388191+07', NULL, NULL, NULL, 'a6bd4a84-ebbd-487c-9d8d-b19a93d6abca', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9194, NULL, 921, 10, '2026-07-21 06:56:34.388191+07', NULL, NULL, NULL, 'ad4af2f3-45d8-4f83-bbb3-85a18ba52869', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9415, NULL, 944, 1, '2026-07-21 06:56:35.844736+07', NULL, NULL, NULL, 'df3a12be-f694-4fab-913c-21d331f0cb08', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9416, NULL, 944, 2, '2026-07-21 06:56:35.844741+07', NULL, NULL, NULL, '58be476f-df01-45c8-9d1c-0141902235af', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9417, NULL, 944, 3, '2026-07-21 06:56:35.844741+07', NULL, NULL, NULL, '1b38a14c-cf1e-4009-850b-baa33e03c0b5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9418, NULL, 944, 4, '2026-07-21 06:56:35.844741+07', NULL, NULL, NULL, '3f210ff4-6393-449d-9929-847eb7386909', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9419, NULL, 944, 5, '2026-07-21 06:56:35.844741+07', NULL, NULL, NULL, 'a9aa1234-6e67-41e0-a843-4bbd9b346d07', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9420, NULL, 944, 6, '2026-07-21 06:56:35.844742+07', NULL, NULL, NULL, '437931ef-74d7-4df1-8c96-4f761539a7aa', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9421, NULL, 944, 7, '2026-07-21 06:56:35.844742+07', NULL, NULL, NULL, 'e25c6647-4c4f-430e-af61-7a444329c841', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9422, NULL, 944, 8, '2026-07-21 06:56:35.844742+07', NULL, NULL, NULL, 'd6e3d70d-60cd-4bb2-82bc-734be5b287e9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9423, NULL, 944, 9, '2026-07-21 06:56:35.844742+07', NULL, NULL, NULL, 'f2a61339-c3c1-4e42-8475-79c75810bdfa', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9424, NULL, 944, 10, '2026-07-21 06:56:35.844742+07', NULL, NULL, NULL, '3f59a7c5-c509-4e9e-8aec-2024b86ce791', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8941, NULL, 897, 5, '2026-07-21 06:56:32.389467+07', NULL, NULL, NULL, '395de61a-41f0-46db-a680-c34684286b98', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8943, NULL, 897, 6, '2026-07-21 06:56:32.389468+07', NULL, NULL, NULL, 'b414ceb4-7ee3-4f4c-bbf5-2a510e29932e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8947, NULL, 897, 7, '2026-07-21 06:56:32.389468+07', NULL, NULL, NULL, 'cf891a0d-e9fd-4c7e-b719-3e7347258c96', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8950, NULL, 897, 8, '2026-07-21 06:56:32.389468+07', NULL, NULL, NULL, 'ced561de-533e-4178-9fa7-0a76aa24afeb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8953, NULL, 897, 9, '2026-07-21 06:56:32.389468+07', NULL, NULL, NULL, 'f5709a7f-bc45-43d0-bbf4-cb321d206e5d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8954, NULL, 897, 10, '2026-07-21 06:56:32.389468+07', NULL, NULL, NULL, 'c10ec73c-1062-4c56-9b6e-8feda4a986e0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9139, NULL, 917, 1, '2026-07-21 06:56:33.981557+07', NULL, NULL, NULL, 'aa143b8c-cbdb-4c10-9f5e-a3ae26c5cd42', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9141, NULL, 917, 2, '2026-07-21 06:56:33.981557+07', NULL, NULL, NULL, '45160e34-d87f-4a5e-be2c-548acc9268e6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9144, NULL, 917, 3, '2026-07-21 06:56:33.981557+07', NULL, NULL, NULL, 'baccf86a-6edb-48bf-96fc-626bcfd73c03', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9146, NULL, 917, 4, '2026-07-21 06:56:33.981558+07', NULL, NULL, NULL, '006beffb-b71e-4377-b911-6c4a7bb6b1b5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9148, NULL, 917, 5, '2026-07-21 06:56:33.981558+07', NULL, NULL, NULL, '29b4298b-4c91-4efd-bd40-f976dc963e25', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9150, NULL, 917, 6, '2026-07-21 06:56:33.981558+07', NULL, NULL, NULL, '984364b9-d5b8-43e0-807c-8037b04c13aa', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9151, NULL, 917, 7, '2026-07-21 06:56:33.981558+07', NULL, NULL, NULL, 'd16a7ac7-8b9b-41ff-a16d-1db0c5d6e5de', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9152, NULL, 917, 8, '2026-07-21 06:56:33.981558+07', NULL, NULL, NULL, '13910aaf-67b5-4392-9934-996ae29eb163', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9153, NULL, 917, 9, '2026-07-21 06:56:33.981559+07', NULL, NULL, NULL, '1df4a94d-d16d-43c1-a600-24423070ab1f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9154, NULL, 917, 10, '2026-07-21 06:56:33.981559+07', NULL, NULL, NULL, '04e4d19a-9372-4883-89aa-d36ca24dccfb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9395, NULL, 943, 1, '2026-07-21 06:56:35.530877+07', NULL, NULL, NULL, '306417ca-6540-4c46-abe8-63326dc18a2e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9397, NULL, 943, 2, '2026-07-21 06:56:35.530878+07', NULL, NULL, NULL, 'c5fb3c08-3f49-4031-b8bd-b398e8aa3846', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9399, NULL, 943, 3, '2026-07-21 06:56:35.530878+07', NULL, NULL, NULL, 'b16df4e7-4b82-4543-beae-d1fa0738e3ea', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9401, NULL, 943, 4, '2026-07-21 06:56:35.530878+07', NULL, NULL, NULL, '35acc8eb-b077-4d1f-bf7f-0ea28ae29220', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9403, NULL, 943, 5, '2026-07-21 06:56:35.530878+07', NULL, NULL, NULL, 'a8fe058b-e164-40a6-95e8-9f399704fc13', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9405, NULL, 943, 6, '2026-07-21 06:56:35.530879+07', NULL, NULL, NULL, 'fa778fe5-0e03-43a9-a92b-49e923b668f3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9407, NULL, 943, 7, '2026-07-21 06:56:35.530879+07', NULL, NULL, NULL, 'abe97c22-b0a7-47ee-bfab-9dbc671eb180', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9409, NULL, 943, 8, '2026-07-21 06:56:35.530879+07', NULL, NULL, NULL, '44ee63f9-06d1-41f9-973c-208242f5c56c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9411, NULL, 943, 9, '2026-07-21 06:56:35.530879+07', NULL, NULL, NULL, '9ba8a745-d122-41ba-a6d6-de108d95c4c5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9413, NULL, 943, 10, '2026-07-21 06:56:35.530879+07', NULL, NULL, NULL, '0cb40439-a1e1-4f68-beda-ff1b50231d22', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8942, NULL, 896, 7, '2026-07-21 06:56:32.388347+07', NULL, NULL, NULL, '1286a2d0-8d5f-4dc5-a53b-c41acdd3b24d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8945, NULL, 896, 8, '2026-07-21 06:56:32.388348+07', NULL, NULL, NULL, '25e16591-28ad-4883-aab8-7be38f44bb3c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8949, NULL, 896, 9, '2026-07-21 06:56:32.388348+07', NULL, NULL, NULL, '1bf62bed-95ba-4cb1-9813-6e6595045caa', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8952, NULL, 896, 10, '2026-07-21 06:56:32.388348+07', NULL, NULL, NULL, 'd7427eae-47e0-4d73-8a2a-7dcdadb9fa1d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8955, NULL, 898, 1, '2026-07-21 06:56:32.788415+07', NULL, NULL, NULL, 'efbd826f-1796-4d0a-9fc7-09f570eec3fb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8956, NULL, 898, 2, '2026-07-21 06:56:32.788419+07', NULL, NULL, NULL, '3bd162e4-9da4-4041-99e9-2ecd2d34d97c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8957, NULL, 898, 3, '2026-07-21 06:56:32.78842+07', NULL, NULL, NULL, '3b09c490-af32-40da-86a3-0e600cc2a7e0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8958, NULL, 898, 4, '2026-07-21 06:56:32.78842+07', NULL, NULL, NULL, '225c07a5-dd07-4094-9f85-7173c57289b7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8959, NULL, 898, 5, '2026-07-21 06:56:32.78842+07', NULL, NULL, NULL, '6db8882d-dc17-4374-bfc8-ff7d5d5a1e50', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8960, NULL, 898, 6, '2026-07-21 06:56:32.78842+07', NULL, NULL, NULL, '0877f0df-2467-4e06-8f73-7e39fb549ab9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8961, NULL, 898, 7, '2026-07-21 06:56:32.788421+07', NULL, NULL, NULL, 'aa9e1607-3d89-42ec-a5d6-c366150917b1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8962, NULL, 898, 8, '2026-07-21 06:56:32.788421+07', NULL, NULL, NULL, 'a8ce1322-68ec-4db3-aedb-d73e3d0aba1b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8963, NULL, 898, 9, '2026-07-21 06:56:32.788421+07', NULL, NULL, NULL, '0fd40b05-64af-461a-92fa-ea9e9535533c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8964, NULL, 898, 10, '2026-07-21 06:56:32.788421+07', NULL, NULL, NULL, '324c3984-38a9-4644-be43-296d91583f12', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9175, NULL, 920, 1, '2026-07-21 06:56:34.257071+07', NULL, NULL, NULL, '58e891d7-3f05-48be-a358-1c6d7d91972f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9176, NULL, 920, 2, '2026-07-21 06:56:34.257072+07', NULL, NULL, NULL, '9245e20a-00d1-4344-b399-826ee26e4e80', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9177, NULL, 920, 3, '2026-07-21 06:56:34.257072+07', NULL, NULL, NULL, '0bd0ece8-b6be-480b-8189-eca9c1b05489', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9178, NULL, 920, 4, '2026-07-21 06:56:34.257072+07', NULL, NULL, NULL, '9e343a77-ccb6-4b0a-a95f-da900cfc2c1f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9179, NULL, 920, 5, '2026-07-21 06:56:34.257072+07', NULL, NULL, NULL, '7eea7814-ea05-4945-a98c-10603303bbda', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9180, NULL, 920, 6, '2026-07-21 06:56:34.257072+07', NULL, NULL, NULL, 'f371febb-416e-4909-9686-22ca6a8f8af5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9181, NULL, 920, 7, '2026-07-21 06:56:34.257073+07', NULL, NULL, NULL, '1efc2b08-a34a-4c79-b551-cee593913088', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9182, NULL, 920, 8, '2026-07-21 06:56:34.257073+07', NULL, NULL, NULL, '54b85002-46c6-4fd0-adfc-3d67a3f04691', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9183, NULL, 920, 9, '2026-07-21 06:56:34.257073+07', NULL, NULL, NULL, 'adc0910d-d4d2-4734-9cc8-573053c8bdc0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9184, NULL, 920, 10, '2026-07-21 06:56:34.257073+07', NULL, NULL, NULL, '50a37f54-18a9-43b9-996d-1c84f0550181', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9215, NULL, 924, 1, '2026-07-21 06:56:34.676291+07', NULL, NULL, NULL, '4b3c9eee-3202-4dd0-a22b-6ad6ece79b36', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9216, NULL, 924, 2, '2026-07-21 06:56:34.676293+07', NULL, NULL, NULL, '4b498e89-dd03-4a50-a423-3ff96e172216', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9217, NULL, 924, 3, '2026-07-21 06:56:34.676293+07', NULL, NULL, NULL, '61990ac3-9252-421d-bdda-ff7a8eeeab59', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9218, NULL, 924, 4, '2026-07-21 06:56:34.676293+07', NULL, NULL, NULL, 'c25db207-78fc-43ac-82f8-f2489b5dd50f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9219, NULL, 924, 5, '2026-07-21 06:56:34.676293+07', NULL, NULL, NULL, '1699802e-3178-4bb7-a206-6a1fa5175f15', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9220, NULL, 924, 6, '2026-07-21 06:56:34.676294+07', NULL, NULL, NULL, 'd0da8851-11af-4eeb-8fe7-c45977f2bb10', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9221, NULL, 924, 7, '2026-07-21 06:56:34.676294+07', NULL, NULL, NULL, '5d993173-14f8-4d2e-9ac3-0be3e47136c5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9222, NULL, 924, 8, '2026-07-21 06:56:34.676294+07', NULL, NULL, NULL, '18fef503-10b4-4760-ac1f-a15a5e91bcde', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9223, NULL, 924, 9, '2026-07-21 06:56:34.676294+07', NULL, NULL, NULL, '3a12e3f1-37f5-416d-92f0-3fa3a34dcd65', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9224, NULL, 924, 10, '2026-07-21 06:56:34.676294+07', NULL, NULL, NULL, '01def6da-5a2b-4ff9-8f93-e02188a9a3a3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9425, NULL, 945, 1, '2026-07-21 06:56:35.861477+07', NULL, NULL, NULL, '799b19d2-2ce2-483a-bd00-846c9c1b3ad8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9426, NULL, 945, 2, '2026-07-21 06:56:35.861478+07', NULL, NULL, NULL, 'd4e57df0-7460-4035-be7d-842e991c78c0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9427, NULL, 945, 3, '2026-07-21 06:56:35.861478+07', NULL, NULL, NULL, '000ab68b-6214-4490-a5bc-75629b0618d8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9428, NULL, 945, 4, '2026-07-21 06:56:35.861478+07', NULL, NULL, NULL, 'a4691563-da44-4926-8b93-9050af55d4d8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9429, NULL, 945, 5, '2026-07-21 06:56:35.861478+07', NULL, NULL, NULL, 'a290ad47-6788-4c91-8012-eab51454547d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9430, NULL, 945, 6, '2026-07-21 06:56:35.861478+07', NULL, NULL, NULL, 'c04a5126-10e6-4783-acaa-89540857f0f8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9431, NULL, 945, 7, '2026-07-21 06:56:35.861478+07', NULL, NULL, NULL, '9667b6ee-0af8-4dc0-bc79-4fcd43c8caee', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9432, NULL, 945, 8, '2026-07-21 06:56:35.861479+07', NULL, NULL, NULL, '0396f7fa-0644-4caa-9111-d1b36cacb7ae', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9433, NULL, 945, 9, '2026-07-21 06:56:35.861479+07', NULL, NULL, NULL, 'f9d817d0-f9eb-4526-9552-0409b9958836', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9434, NULL, 945, 10, '2026-07-21 06:56:35.861479+07', NULL, NULL, NULL, '4bb0bbad-9a6a-4ae5-b2d6-a68b136fe584', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8965, NULL, 899, 1, '2026-07-21 06:56:32.922057+07', NULL, NULL, NULL, 'e34dbbaa-f934-40da-9ff1-212f2aa535ef', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8966, NULL, 899, 2, '2026-07-21 06:56:32.922059+07', NULL, NULL, NULL, '29339b06-f5de-4558-9da3-3d9bdcfe73ba', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8967, NULL, 899, 3, '2026-07-21 06:56:32.92206+07', NULL, NULL, NULL, 'cb60fa54-f1e0-4492-9eaa-a4ac34bfea7a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8968, NULL, 899, 4, '2026-07-21 06:56:32.92206+07', NULL, NULL, NULL, '241701de-195f-4a65-acdf-da4d3ca806b2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8969, NULL, 899, 5, '2026-07-21 06:56:32.92206+07', NULL, NULL, NULL, 'b516f696-06d6-4767-8893-d985c545e622', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8970, NULL, 899, 6, '2026-07-21 06:56:32.92206+07', NULL, NULL, NULL, '4fbe7f7b-72f1-4d24-a346-33c2f227eb66', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8971, NULL, 899, 7, '2026-07-21 06:56:32.92206+07', NULL, NULL, NULL, '70cd8a44-2631-4d9a-ab33-a40263c9b201', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8972, NULL, 899, 8, '2026-07-21 06:56:32.922061+07', NULL, NULL, NULL, 'd558f0a1-543e-401d-a77e-87174ef2685d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8973, NULL, 899, 9, '2026-07-21 06:56:32.922061+07', NULL, NULL, NULL, '286f33d8-e953-4014-96a4-709abbfd3b08', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8974, NULL, 899, 10, '2026-07-21 06:56:32.922061+07', NULL, NULL, NULL, '71845dbf-9f39-42e3-9a46-4853539a0f4e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8975, NULL, 900, 1, '2026-07-21 06:56:32.990291+07', NULL, NULL, NULL, 'a2c50348-cd41-42af-b707-83bf891d4ad3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8976, NULL, 900, 2, '2026-07-21 06:56:32.990293+07', NULL, NULL, NULL, '886e9426-7f25-482a-b246-ac260fd94113', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8977, NULL, 900, 3, '2026-07-21 06:56:32.990293+07', NULL, NULL, NULL, '296ece58-a0ee-4989-b6be-0d8a2da49e16', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8978, NULL, 900, 4, '2026-07-21 06:56:32.990293+07', NULL, NULL, NULL, '9b68e366-e46c-4b06-9bb5-49a1908255f1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8979, NULL, 900, 5, '2026-07-21 06:56:32.990293+07', NULL, NULL, NULL, '91f04da1-fd80-468b-8045-0fedcf0aa85c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8980, NULL, 900, 6, '2026-07-21 06:56:32.990293+07', NULL, NULL, NULL, 'b106844a-5216-472d-aa50-4a49d3481a77', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8981, NULL, 900, 7, '2026-07-21 06:56:32.990293+07', NULL, NULL, NULL, 'fd16ab46-b30c-440d-908e-f7a78fa475a6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8982, NULL, 900, 8, '2026-07-21 06:56:32.990293+07', NULL, NULL, NULL, 'ca2281a5-6459-4ab0-a2b6-24191d28abe1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8983, NULL, 900, 9, '2026-07-21 06:56:32.990293+07', NULL, NULL, NULL, '906d90aa-78b3-417a-9d4f-1336c414e62d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8984, NULL, 900, 10, '2026-07-21 06:56:32.990294+07', NULL, NULL, NULL, '07502008-6d67-4991-8b45-040172715499', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8985, NULL, 901, 1, '2026-07-21 06:56:33.073626+07', NULL, NULL, NULL, '75e97f1b-4754-415c-8c64-28bd8e829d71', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8986, NULL, 901, 2, '2026-07-21 06:56:33.073627+07', NULL, NULL, NULL, 'f654bc24-8d81-4dc7-a902-42ea66de2edf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8987, NULL, 901, 3, '2026-07-21 06:56:33.073628+07', NULL, NULL, NULL, 'd0e9421f-890b-4bb0-8ff2-abceb4aff040', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8988, NULL, 901, 4, '2026-07-21 06:56:33.073628+07', NULL, NULL, NULL, '7da58ea4-c899-4e73-8c38-ba8b97d69ad8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8989, NULL, 901, 5, '2026-07-21 06:56:33.073628+07', NULL, NULL, NULL, 'db2016a6-372b-4439-8a53-0babf08baffc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8990, NULL, 901, 6, '2026-07-21 06:56:33.073628+07', NULL, NULL, NULL, '3aab11cf-5ec0-43a4-b68d-898c3cb0ecf4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8991, NULL, 901, 7, '2026-07-21 06:56:33.073628+07', NULL, NULL, NULL, '4c857e6d-a14a-463b-8f2c-c9161fea5e64', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8992, NULL, 901, 8, '2026-07-21 06:56:33.073628+07', NULL, NULL, NULL, 'c3a767c8-6b1c-427a-afa1-f74c13d1b3e9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8993, NULL, 901, 9, '2026-07-21 06:56:33.073628+07', NULL, NULL, NULL, '5facc8b5-c066-4fe0-b2dc-1242c9d43147', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8994, NULL, 901, 10, '2026-07-21 06:56:33.073628+07', NULL, NULL, NULL, '05edd894-32bb-485e-b9b4-93f4d05aecca', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9205, NULL, 923, 1, '2026-07-21 06:56:34.641313+07', NULL, NULL, NULL, '0be2d0e9-8481-440f-8495-80b0aea53ebe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9206, NULL, 923, 2, '2026-07-21 06:56:34.641314+07', NULL, NULL, NULL, 'f7db50df-ea27-4e92-9ca1-52fb57ae705e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9207, NULL, 923, 3, '2026-07-21 06:56:34.641315+07', NULL, NULL, NULL, '6e646595-7194-4e09-ab42-0abb9a33a3bc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9208, NULL, 923, 4, '2026-07-21 06:56:34.641315+07', NULL, NULL, NULL, '552b5bbc-cb8d-4cbd-83ec-cd2cd0a20cbe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9209, NULL, 923, 5, '2026-07-21 06:56:34.641316+07', NULL, NULL, NULL, 'a3fefc02-1f65-43e2-8d76-1e4bec9ed8de', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9210, NULL, 923, 6, '2026-07-21 06:56:34.641316+07', NULL, NULL, NULL, 'b7f2f915-a8e7-46fd-8051-45a266b728a2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9211, NULL, 923, 7, '2026-07-21 06:56:34.641316+07', NULL, NULL, NULL, '0e9d7ed0-26d8-466e-a149-397076c89397', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9212, NULL, 923, 8, '2026-07-21 06:56:34.641316+07', NULL, NULL, NULL, 'dda1450d-7658-4518-a920-9dfce1c05d4a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9213, NULL, 923, 9, '2026-07-21 06:56:34.641317+07', NULL, NULL, NULL, '86ea4168-af78-4952-9cbe-ad61f9cee21c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9214, NULL, 923, 10, '2026-07-21 06:56:34.641317+07', NULL, NULL, NULL, '021d2d86-af4d-4d12-82b6-3ff8cd0cfc18', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9235, NULL, 926, 1, '2026-07-21 06:56:34.752918+07', NULL, NULL, NULL, 'f3433b4d-ec8f-4e6d-828d-4872bbefb112', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9236, NULL, 926, 2, '2026-07-21 06:56:34.752918+07', NULL, NULL, NULL, '507c6e33-19f6-4dba-823c-d7a43d0373b1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9237, NULL, 926, 3, '2026-07-21 06:56:34.752919+07', NULL, NULL, NULL, '82c10890-4eeb-438a-b4df-f96d853837d2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9238, NULL, 926, 4, '2026-07-21 06:56:34.752919+07', NULL, NULL, NULL, 'e6313ab8-811f-4a0f-80c5-417e320fb1b8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9239, NULL, 926, 5, '2026-07-21 06:56:34.752923+07', NULL, NULL, NULL, 'bef7c190-4b99-4779-bce9-a639b5f79d35', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9240, NULL, 926, 6, '2026-07-21 06:56:34.752923+07', NULL, NULL, NULL, 'dc044ead-81b2-4491-9746-877105db3ffb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9241, NULL, 926, 7, '2026-07-21 06:56:34.752923+07', NULL, NULL, NULL, 'f42a785d-58cd-4959-96bb-6c32a6bce23c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9242, NULL, 926, 8, '2026-07-21 06:56:34.752924+07', NULL, NULL, NULL, '64d3ff48-cd27-496c-be61-4cba028b5622', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9243, NULL, 926, 9, '2026-07-21 06:56:34.752924+07', NULL, NULL, NULL, '36c32bed-cd45-4e6f-84d8-5d3581da07b5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9244, NULL, 926, 10, '2026-07-21 06:56:34.752924+07', NULL, NULL, NULL, '51a578ec-f91f-4e0e-bab7-6b803bc0f01d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9255, NULL, 928, 1, '2026-07-21 06:56:34.764432+07', NULL, NULL, NULL, '2502e6fa-828d-402a-a478-b95b63f20ee1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9256, NULL, 928, 2, '2026-07-21 06:56:34.764433+07', NULL, NULL, NULL, '26ca154f-f505-479d-b2a4-800dc5445df3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9257, NULL, 928, 3, '2026-07-21 06:56:34.764433+07', NULL, NULL, NULL, 'fe90b92f-5a5e-4943-8372-4d11818e2881', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9258, NULL, 928, 4, '2026-07-21 06:56:34.764433+07', NULL, NULL, NULL, '218a7503-6910-40e6-bf39-ff8134fe5327', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9259, NULL, 928, 5, '2026-07-21 06:56:34.764433+07', NULL, NULL, NULL, '1ffeb9fc-4e8c-4eeb-8720-d30e0c45c9bb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9260, NULL, 928, 6, '2026-07-21 06:56:34.764433+07', NULL, NULL, NULL, '8038bb62-45b1-4b3e-818d-7a9893917a6c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9261, NULL, 928, 7, '2026-07-21 06:56:34.764433+07', NULL, NULL, NULL, '5afa1d24-8784-4161-b600-34e4c9ede26c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9262, NULL, 928, 8, '2026-07-21 06:56:34.764433+07', NULL, NULL, NULL, '1f3ec16f-cbbc-4297-a173-74c01b6314b1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9263, NULL, 928, 9, '2026-07-21 06:56:34.764434+07', NULL, NULL, NULL, 'd2453617-43e1-401f-b332-ae958e61a685', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9264, NULL, 928, 10, '2026-07-21 06:56:34.764434+07', NULL, NULL, NULL, '6609ee91-20a1-47fa-bc82-51cc3883dae8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9445, NULL, 947, 1, '2026-07-21 06:56:36.056599+07', NULL, NULL, NULL, '3724ad49-f6ee-451c-a268-29da306270d6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9446, NULL, 947, 2, '2026-07-21 06:56:36.0566+07', NULL, NULL, NULL, '6f0b0374-bfc4-4bd4-8c8a-bd7cdaab2c41', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9447, NULL, 947, 3, '2026-07-21 06:56:36.0566+07', NULL, NULL, NULL, 'd6e0bbbc-6bbd-4c9c-ab40-9044f4645602', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9448, NULL, 947, 4, '2026-07-21 06:56:36.0566+07', NULL, NULL, NULL, '76be3fd3-4756-4004-a34f-424108ac73dc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9449, NULL, 947, 5, '2026-07-21 06:56:36.0566+07', NULL, NULL, NULL, '5d19f317-c524-40fe-b0ee-9366d71b7e6c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9450, NULL, 947, 6, '2026-07-21 06:56:36.0566+07', NULL, NULL, NULL, 'c512ef5f-e1a2-4c08-9b15-cc1839b5cbec', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9451, NULL, 947, 7, '2026-07-21 06:56:36.056601+07', NULL, NULL, NULL, '7f4253e6-f6ca-420f-b3ef-cbe6127b835a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9452, NULL, 947, 8, '2026-07-21 06:56:36.056601+07', NULL, NULL, NULL, '21fe0638-7074-4ca7-a03e-fa12e7472b55', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9453, NULL, 947, 9, '2026-07-21 06:56:36.056601+07', NULL, NULL, NULL, 'cd3d99d4-3d7f-4c76-abe0-dbc9079e1a33', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9454, NULL, 947, 10, '2026-07-21 06:56:36.056601+07', NULL, NULL, NULL, '4a387da3-8512-441d-9451-ff96b4cc2bfc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8995, NULL, 902, 1, '2026-07-21 06:56:33.168875+07', NULL, NULL, NULL, '6d707ad0-e0fd-4be9-8f54-2660d96eebc9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8996, NULL, 902, 2, '2026-07-21 06:56:33.168877+07', NULL, NULL, NULL, 'c2638151-678c-4b72-94b0-c1e165b4558b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8997, NULL, 902, 3, '2026-07-21 06:56:33.168877+07', NULL, NULL, NULL, '91be6368-5b5a-4994-9027-b6423432fb5c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 8998, NULL, 902, 4, '2026-07-21 06:56:33.168877+07', NULL, NULL, NULL, '934b2696-eede-4094-b396-b4df003efc4e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9000, NULL, 902, 5, '2026-07-21 06:56:33.168877+07', NULL, NULL, NULL, 'ee5386b4-78e6-4b50-9d39-7ac1ef13e2c4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9002, NULL, 902, 6, '2026-07-21 06:56:33.168877+07', NULL, NULL, NULL, 'cb9a4b6b-357b-420b-abc8-28129bf36db0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9004, NULL, 902, 7, '2026-07-21 06:56:33.168877+07', NULL, NULL, NULL, 'febbede4-c2f0-4adc-8b46-d5c96652a3f4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9006, NULL, 902, 8, '2026-07-21 06:56:33.168878+07', NULL, NULL, NULL, '42883e76-49de-47da-83cc-3dabf42a668e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9008, NULL, 902, 9, '2026-07-21 06:56:33.168878+07', NULL, NULL, NULL, '5d794cb8-a2fc-48d4-b2f3-c0003d79a374', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9010, NULL, 902, 10, '2026-07-21 06:56:33.168878+07', NULL, NULL, NULL, '51e92615-d89d-4e72-b781-6ca4b5854edc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9225, NULL, 925, 1, '2026-07-21 06:56:34.705026+07', NULL, NULL, NULL, '3bb3fd20-c936-42ff-9abe-682a0629afb9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9226, NULL, 925, 2, '2026-07-21 06:56:34.705028+07', NULL, NULL, NULL, '6909944a-9362-4a59-9970-e82bf232198a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9227, NULL, 925, 3, '2026-07-21 06:56:34.705028+07', NULL, NULL, NULL, '94cd264f-0b31-4f04-8bf9-4abdf6e0b5d0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9228, NULL, 925, 4, '2026-07-21 06:56:34.705029+07', NULL, NULL, NULL, 'f51f48f0-ae0b-490b-b023-f47c97ff9c97', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9229, NULL, 925, 5, '2026-07-21 06:56:34.705029+07', NULL, NULL, NULL, '763f50f1-db4a-44b5-8bcd-5152e9fee621', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9230, NULL, 925, 6, '2026-07-21 06:56:34.70503+07', NULL, NULL, NULL, '85bea979-59ad-487e-988d-99f0f2c71b95', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9231, NULL, 925, 7, '2026-07-21 06:56:34.70503+07', NULL, NULL, NULL, '1adcd240-5f33-456f-a9d2-e13107d7f2ec', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9232, NULL, 925, 8, '2026-07-21 06:56:34.70503+07', NULL, NULL, NULL, '7396e38d-24d6-4f5b-9c47-f40a5653dec0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9233, NULL, 925, 9, '2026-07-21 06:56:34.705031+07', NULL, NULL, NULL, '5df57563-3456-427c-a244-5b859d2c1235', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9234, NULL, 925, 10, '2026-07-21 06:56:34.705031+07', NULL, NULL, NULL, 'cdaff678-4826-4ee4-b7a2-57daf464003e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (7, 8755, 1516, 878, 1, '2026-07-21 06:56:31.605391+07', NULL, NULL, '0 1
', 'da159f7a-b5e0-4132-80ce-0e3da1ca6730', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 8999, NULL, 903, 1, '2026-07-21 06:56:33.17762+07', NULL, NULL, NULL, '36df6936-1ce3-45e3-9ee5-320bbcb78b6b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9001, NULL, 903, 2, '2026-07-21 06:56:33.177621+07', NULL, NULL, NULL, '45da0b63-8d0c-4fa6-b1de-1d0f6b63413b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9003, NULL, 903, 3, '2026-07-21 06:56:33.177621+07', NULL, NULL, NULL, '67eac260-502f-4a82-ab40-da53e6b8f635', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9005, NULL, 903, 4, '2026-07-21 06:56:33.177621+07', NULL, NULL, NULL, '7da887c6-a7a7-4d76-bb6f-862ef4831e37', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9007, NULL, 903, 5, '2026-07-21 06:56:33.177621+07', NULL, NULL, NULL, 'f06f3f74-0ab0-4805-84b4-d0d76e7cd765', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9009, NULL, 903, 6, '2026-07-21 06:56:33.177621+07', NULL, NULL, NULL, 'aafec8f9-92b2-4734-9bc8-78bb20af850a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9011, NULL, 903, 7, '2026-07-21 06:56:33.177621+07', NULL, NULL, NULL, '730ccd33-e0ac-410e-b5a7-de8e55590bd2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9012, NULL, 903, 8, '2026-07-21 06:56:33.177621+07', NULL, NULL, NULL, 'e9f08d82-caf0-4c9a-8ff0-0e14c5dc311d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9013, NULL, 903, 9, '2026-07-21 06:56:33.177621+07', NULL, NULL, NULL, '13870605-272d-4ef2-b0cf-529d1abd1ab4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9014, NULL, 903, 10, '2026-07-21 06:56:33.177622+07', NULL, NULL, NULL, '31c6e39e-2a0c-4b85-83ba-7f63d056263c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9275, NULL, 930, 1, '2026-07-21 06:56:34.822176+07', NULL, NULL, NULL, '249ff99b-9717-4a54-9891-76bc64005a4f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9276, NULL, 930, 2, '2026-07-21 06:56:34.822177+07', NULL, NULL, NULL, '887b6811-469e-42ea-a16c-f3b72c3271e7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9277, NULL, 930, 3, '2026-07-21 06:56:34.822177+07', NULL, NULL, NULL, '3c643c29-a51d-4d44-a0ef-64a537cf5a48', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9278, NULL, 930, 4, '2026-07-21 06:56:34.822177+07', NULL, NULL, NULL, 'b014a74b-4029-4092-8789-0096b529d47a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9279, NULL, 930, 5, '2026-07-21 06:56:34.822177+07', NULL, NULL, NULL, '5b1a057d-ffd1-47ea-b90b-225627f2f944', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9280, NULL, 930, 6, '2026-07-21 06:56:34.822177+07', NULL, NULL, NULL, '9f05de04-fc80-48fd-acf4-e6cb22e89f73', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9281, NULL, 930, 7, '2026-07-21 06:56:34.822177+07', NULL, NULL, NULL, '1a7e7390-fd33-4dea-b080-564490c54416', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9283, NULL, 930, 8, '2026-07-21 06:56:34.822177+07', NULL, NULL, NULL, '76a3d494-e7ef-419e-be54-e85fb78ed2eb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9285, NULL, 930, 9, '2026-07-21 06:56:34.822177+07', NULL, NULL, NULL, 'e6a13cc6-60f8-43c7-9361-6b1bac49178f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9287, NULL, 930, 10, '2026-07-21 06:56:34.822178+07', NULL, NULL, NULL, 'e153fb0c-586d-4990-a004-ad839504afa6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9015, NULL, 904, 1, '2026-07-21 06:56:33.21094+07', NULL, NULL, NULL, '42aad8f1-700c-45e2-9fc5-70f985cae98c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9016, NULL, 904, 2, '2026-07-21 06:56:33.210941+07', NULL, NULL, NULL, '845e3c2f-07b0-45ca-acb7-fa3125cc52a8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9017, NULL, 904, 3, '2026-07-21 06:56:33.210941+07', NULL, NULL, NULL, '5b8154ed-e1e8-4a7c-9a1a-1b716ed0ad74', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9018, NULL, 904, 4, '2026-07-21 06:56:33.210941+07', NULL, NULL, NULL, 'afe4aadf-68c6-47f3-8cac-7aa1d28fc1b1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9019, NULL, 904, 5, '2026-07-21 06:56:33.210942+07', NULL, NULL, NULL, 'd89f5b49-3d8f-432c-8585-069cb608e18f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9020, NULL, 904, 6, '2026-07-21 06:56:33.210942+07', NULL, NULL, NULL, '98e3dba1-5159-411e-8f96-bfda64c6608f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9021, NULL, 904, 7, '2026-07-21 06:56:33.210942+07', NULL, NULL, NULL, '39afc660-fb5a-45f0-8810-47ee472558f3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9022, NULL, 904, 8, '2026-07-21 06:56:33.210942+07', NULL, NULL, NULL, 'd005dd8b-fd00-4a35-996a-3f2ec6e6e39d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9023, NULL, 904, 9, '2026-07-21 06:56:33.210942+07', NULL, NULL, NULL, '7ee77a5f-af83-4beb-be7f-5b4e46dc3130', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9024, NULL, 904, 10, '2026-07-21 06:56:33.210942+07', NULL, NULL, NULL, 'f998eea6-141d-46e2-a3d9-fc1352aa77e4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9025, NULL, 905, 1, '2026-07-21 06:56:33.33273+07', NULL, NULL, NULL, '530281f0-3614-406c-946c-347ecedd3402', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9026, NULL, 905, 2, '2026-07-21 06:56:33.332731+07', NULL, NULL, NULL, '2240954d-cc15-4437-97d9-0d8da8829cc1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9027, NULL, 905, 3, '2026-07-21 06:56:33.332731+07', NULL, NULL, NULL, '38a472a8-b663-4a1e-8f94-d1f91b13b6ad', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9028, NULL, 905, 4, '2026-07-21 06:56:33.332731+07', NULL, NULL, NULL, 'bb63557b-9139-44f4-aa89-acaf951a348a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9029, NULL, 905, 5, '2026-07-21 06:56:33.332731+07', NULL, NULL, NULL, '77470752-31eb-4d94-bc96-a521c849e8f6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9030, NULL, 905, 6, '2026-07-21 06:56:33.332732+07', NULL, NULL, NULL, 'dc69cd39-9867-40f3-a22d-792b94d06941', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9031, NULL, 905, 7, '2026-07-21 06:56:33.332732+07', NULL, NULL, NULL, '64424f27-008d-49be-9799-2768f329621f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9032, NULL, 905, 8, '2026-07-21 06:56:33.332732+07', NULL, NULL, NULL, 'f5675b60-4d87-44ad-b4d3-173fc557294c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9033, NULL, 905, 9, '2026-07-21 06:56:33.332732+07', NULL, NULL, NULL, 'a584c0ea-380c-4be8-8662-a421be053fe7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9034, NULL, 905, 10, '2026-07-21 06:56:33.332732+07', NULL, NULL, NULL, '726a4d91-d207-4422-bf6d-dbba9613ee89', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9195, NULL, 922, 1, '2026-07-21 06:56:34.539705+07', NULL, NULL, NULL, '5e79d3a7-74b5-432d-9629-4c3a0ecdf37a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9196, NULL, 922, 2, '2026-07-21 06:56:34.539705+07', NULL, NULL, NULL, '5f6500cb-f1bb-4128-bf84-034defa75653', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9197, NULL, 922, 3, '2026-07-21 06:56:34.539706+07', NULL, NULL, NULL, '0ed14da1-33ec-4f4a-8ce9-30e04cbbd401', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9198, NULL, 922, 4, '2026-07-21 06:56:34.539706+07', NULL, NULL, NULL, '30bd4c60-7a68-48c9-a7f2-cd3b36ec889c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9199, NULL, 922, 5, '2026-07-21 06:56:34.539706+07', NULL, NULL, NULL, 'c42adb62-4b85-46e7-9a23-0ef16aeeb0ae', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9200, NULL, 922, 6, '2026-07-21 06:56:34.539706+07', NULL, NULL, NULL, 'be85108d-9995-409e-b9b4-e11393e0811c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9201, NULL, 922, 7, '2026-07-21 06:56:34.539706+07', NULL, NULL, NULL, 'e04b78a4-a439-46fa-b7ec-dd1d29084f6d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9202, NULL, 922, 8, '2026-07-21 06:56:34.539706+07', NULL, NULL, NULL, '0233e5ea-b196-49e5-a714-6a60dca1e05a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9203, NULL, 922, 9, '2026-07-21 06:56:34.539706+07', NULL, NULL, NULL, 'e151fc7b-29c1-4a29-bd67-bde63c750a13', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9204, NULL, 922, 10, '2026-07-21 06:56:34.539706+07', NULL, NULL, NULL, 'dfa01140-8b69-4c53-ab23-204f94740b66', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9296, NULL, 934, 1, '2026-07-21 06:56:35.007622+07', NULL, NULL, NULL, '4c1e22f6-6013-48aa-92bc-5aa89f60c685', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9299, NULL, 934, 2, '2026-07-21 06:56:35.007623+07', NULL, NULL, NULL, 'f377af83-a634-4b15-a91a-a62c04fab062', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9302, NULL, 934, 3, '2026-07-21 06:56:35.007623+07', NULL, NULL, NULL, 'b0728327-1cfc-4900-9ec2-ba6181b71b19', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9305, NULL, 934, 4, '2026-07-21 06:56:35.007623+07', NULL, NULL, NULL, 'c2722848-a9e5-4c04-b66e-316a3fb84ecb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9308, NULL, 934, 5, '2026-07-21 06:56:35.007623+07', NULL, NULL, NULL, 'bbe0450f-eec7-43f9-850f-d45af4ab1b5a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9311, NULL, 934, 6, '2026-07-21 06:56:35.007623+07', NULL, NULL, NULL, '9e3ae185-a8c9-462d-89ca-5bd6d4f1a61c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9314, NULL, 934, 7, '2026-07-21 06:56:35.007623+07', NULL, NULL, NULL, '9981a4a3-6a9c-4f02-a86c-f8ca2efb4198', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9317, NULL, 934, 8, '2026-07-21 06:56:35.007624+07', NULL, NULL, NULL, 'daf3430c-6b53-470e-9c7a-f0e03731acab', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9320, NULL, 934, 9, '2026-07-21 06:56:35.007624+07', NULL, NULL, NULL, '62138234-9343-42f8-bf18-915e1a0b52d8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9323, NULL, 934, 10, '2026-07-21 06:56:35.007624+07', NULL, NULL, NULL, 'eb77a0a6-c46d-4f54-a2e2-81c7a701a0b7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9435, NULL, 946, 1, '2026-07-21 06:56:35.946333+07', NULL, NULL, NULL, '806fac02-69f0-48f1-91c4-75ee46155ea2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9436, NULL, 946, 2, '2026-07-21 06:56:35.946334+07', NULL, NULL, NULL, '50870503-8543-47ae-964f-3c45e43ef509', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9437, NULL, 946, 3, '2026-07-21 06:56:35.946335+07', NULL, NULL, NULL, '6bf83670-9b45-4d56-a147-9a3b338a2d7c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9438, NULL, 946, 4, '2026-07-21 06:56:35.946335+07', NULL, NULL, NULL, '1ff3dca4-8d32-423f-b116-d5ec7fd18bb4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9439, NULL, 946, 5, '2026-07-21 06:56:35.946335+07', NULL, NULL, NULL, '47293fb1-1b3b-4540-8365-3e686dfc3cce', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9440, NULL, 946, 6, '2026-07-21 06:56:35.946335+07', NULL, NULL, NULL, '4c121672-312f-4367-a9a4-4b9e0c0d653f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9441, NULL, 946, 7, '2026-07-21 06:56:35.946335+07', NULL, NULL, NULL, '2eb0e3ca-5900-4ee0-b91a-8919827bf843', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9442, NULL, 946, 8, '2026-07-21 06:56:35.946335+07', NULL, NULL, NULL, 'd4348ec8-1325-4464-bb59-efb4b3ed62f8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9443, NULL, 946, 9, '2026-07-21 06:56:35.946335+07', NULL, NULL, NULL, '39ca994f-72f6-42cb-8189-30071ab4c677', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9444, NULL, 946, 10, '2026-07-21 06:56:35.946335+07', NULL, NULL, NULL, 'f6ce2a32-3a85-4cfe-8664-c07ef571677b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9035, NULL, 909, 1, '2026-07-21 06:56:33.437263+07', NULL, NULL, NULL, '6468fcfa-4b7a-4fea-ab2c-d30b13ce75c6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9039, NULL, 909, 2, '2026-07-21 06:56:33.437264+07', NULL, NULL, NULL, '356aadd0-fa8f-4e2f-942f-048d7e286431', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9043, NULL, 909, 3, '2026-07-21 06:56:33.437265+07', NULL, NULL, NULL, '281d585a-6877-45c8-a61f-91f892d6470e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9047, NULL, 909, 4, '2026-07-21 06:56:33.437265+07', NULL, NULL, NULL, 'a775e6aa-98bb-409b-896b-9d73e8d069a2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9051, NULL, 909, 5, '2026-07-21 06:56:33.437265+07', NULL, NULL, NULL, '07621ce9-5064-4463-8c88-9bc00d2fab9f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9055, NULL, 909, 6, '2026-07-21 06:56:33.437265+07', NULL, NULL, NULL, '59a799ba-42a5-4205-9043-f13b1094b83d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9058, NULL, 909, 7, '2026-07-21 06:56:33.437265+07', NULL, NULL, NULL, '8da3dff9-1abb-4783-b393-d7e0efbb08d8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9061, NULL, 909, 8, '2026-07-21 06:56:33.437265+07', NULL, NULL, NULL, 'c303863a-fc77-4cf4-a070-951fcfd72d6e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9065, NULL, 909, 9, '2026-07-21 06:56:33.437265+07', NULL, NULL, NULL, '96ef46fd-0b91-4501-8b1d-def202e75ac5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9069, NULL, 909, 10, '2026-07-21 06:56:33.437265+07', NULL, NULL, NULL, '3855f7b4-6d4c-4b50-85af-6c8fa1a1d4ab', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9245, NULL, 927, 1, '2026-07-21 06:56:34.758219+07', NULL, NULL, NULL, 'a9c0e2f1-9e8a-469f-9a85-1363d9c42ffe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9246, NULL, 927, 2, '2026-07-21 06:56:34.758219+07', NULL, NULL, NULL, '532ed07d-86a8-4bfc-b5d7-f854ed1fad84', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9247, NULL, 927, 3, '2026-07-21 06:56:34.75822+07', NULL, NULL, NULL, '8e0d1288-dc4e-443e-bc20-2d376cc5bb31', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9248, NULL, 927, 4, '2026-07-21 06:56:34.75822+07', NULL, NULL, NULL, '3256b564-2bf7-43e7-9827-d3985b5d1a2e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9249, NULL, 927, 5, '2026-07-21 06:56:34.75822+07', NULL, NULL, NULL, '4f7a5d9e-36ff-48a2-9886-754c7e101ca8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9250, NULL, 927, 6, '2026-07-21 06:56:34.75822+07', NULL, NULL, NULL, 'd69b470d-8ce8-4be7-bc99-123002c00b54', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9251, NULL, 927, 7, '2026-07-21 06:56:34.75822+07', NULL, NULL, NULL, 'ac13244d-1065-4506-b0b8-d0d0d10fa312', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9252, NULL, 927, 8, '2026-07-21 06:56:34.75822+07', NULL, NULL, NULL, 'a5c92747-6677-45bf-8a4f-59b87283e677', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9253, NULL, 927, 9, '2026-07-21 06:56:34.75822+07', NULL, NULL, NULL, 'bf1de109-dffd-43cb-860b-0bf7844e3e44', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9254, NULL, 927, 10, '2026-07-21 06:56:34.75822+07', NULL, NULL, NULL, 'a0c81a39-7660-4474-9ba0-f8ed8ca94f10', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9036, NULL, 906, 1, '2026-07-21 06:56:33.437353+07', NULL, NULL, NULL, 'fec65d56-d630-440b-bb89-6ba3d08abeae', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9041, NULL, 906, 2, '2026-07-21 06:56:33.437353+07', NULL, NULL, NULL, '07988f4d-8303-47ae-9b2e-e986dac45fae', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9045, NULL, 906, 3, '2026-07-21 06:56:33.437353+07', NULL, NULL, NULL, '17ac1855-9e81-4dfc-a028-e4e98a1d7747', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9049, NULL, 906, 4, '2026-07-21 06:56:33.437354+07', NULL, NULL, NULL, 'ca366185-5f07-4658-b2e0-ff341567e6df', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9052, NULL, 906, 5, '2026-07-21 06:56:33.437354+07', NULL, NULL, NULL, '0a0947ef-4451-4bf0-80ac-8fdc43ed7bfe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9056, NULL, 906, 6, '2026-07-21 06:56:33.437354+07', NULL, NULL, NULL, '742d3fe7-a9db-46a8-ae93-8d5d53dd5a81', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9060, NULL, 906, 7, '2026-07-21 06:56:33.437354+07', NULL, NULL, NULL, 'ce32b007-5b0f-498c-a52b-458bdb030e7e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9064, NULL, 906, 8, '2026-07-21 06:56:33.437354+07', NULL, NULL, NULL, 'd49b89a3-f9ff-45e3-b2b7-e2380c8ec948', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9068, NULL, 906, 9, '2026-07-21 06:56:33.437354+07', NULL, NULL, NULL, '2bc4f172-767c-4af7-b4bf-60ef06071878', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9072, NULL, 906, 10, '2026-07-21 06:56:33.437354+07', NULL, NULL, NULL, 'fd241b85-45db-4c1c-ace4-8d4113a0177b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9295, NULL, 932, 1, '2026-07-21 06:56:35.007886+07', NULL, NULL, NULL, '33c6c63b-49dc-48b4-9e2a-eb42bb751671', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9298, NULL, 932, 2, '2026-07-21 06:56:35.007886+07', NULL, NULL, NULL, 'f6591f35-0dd3-4a60-b763-b1efa0ed691c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9301, NULL, 932, 3, '2026-07-21 06:56:35.007886+07', NULL, NULL, NULL, 'f35c9c9e-de9d-42b9-98cd-009724fc17ea', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9304, NULL, 932, 4, '2026-07-21 06:56:35.007886+07', NULL, NULL, NULL, '201d274c-1034-4aca-86c2-42df500818f4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9307, NULL, 932, 5, '2026-07-21 06:56:35.007886+07', NULL, NULL, NULL, '1e88481b-fc56-48a8-9c7e-77f01fe26983', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9310, NULL, 932, 6, '2026-07-21 06:56:35.007887+07', NULL, NULL, NULL, 'a9a7951c-17f5-4428-8a45-f23351ba2f63', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9313, NULL, 932, 7, '2026-07-21 06:56:35.007887+07', NULL, NULL, NULL, '2e6b3c1e-e294-4f84-8378-8dc8cf7aa7c1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9316, NULL, 932, 8, '2026-07-21 06:56:35.007887+07', NULL, NULL, NULL, 'af84139e-9a02-46f9-93d4-6bd78ecf72c6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9319, NULL, 932, 9, '2026-07-21 06:56:35.007887+07', NULL, NULL, NULL, '779d2c48-59e0-4b94-8cdd-151f612310c6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9322, NULL, 932, 10, '2026-07-21 06:56:35.007887+07', NULL, NULL, NULL, '83dd8d3e-0582-4cf5-aea5-e48e5f88ae69', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9037, NULL, 907, 1, '2026-07-21 06:56:33.437571+07', NULL, NULL, NULL, '00406636-4eb9-4f66-a9e6-54b3c3f5328c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9040, NULL, 907, 2, '2026-07-21 06:56:33.437571+07', NULL, NULL, NULL, 'a1bb1d27-e6c2-4b15-a7d5-f526f7967978', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9044, NULL, 907, 3, '2026-07-21 06:56:33.437571+07', NULL, NULL, NULL, 'cfde3360-626c-48e4-971f-2a85eb48c7d2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9048, NULL, 907, 4, '2026-07-21 06:56:33.437572+07', NULL, NULL, NULL, '35723eff-9ddb-4fe3-b46d-3ca7b83b58b8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9053, NULL, 907, 5, '2026-07-21 06:56:33.437572+07', NULL, NULL, NULL, 'b1c31bcc-c721-4938-ba0c-f440d78910c5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9059, NULL, 907, 6, '2026-07-21 06:56:33.437572+07', NULL, NULL, NULL, '4a0f6cd7-6366-48cc-aacd-f4454760a641', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9063, NULL, 907, 7, '2026-07-21 06:56:33.437572+07', NULL, NULL, NULL, 'a6f3fe81-0c62-4739-9a41-8e91fed2eb0b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9067, NULL, 907, 8, '2026-07-21 06:56:33.437572+07', NULL, NULL, NULL, 'd068cfcc-0ab1-412c-bc68-6bdfd8155ac6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9070, NULL, 907, 9, '2026-07-21 06:56:33.437572+07', NULL, NULL, NULL, '94578815-9358-4563-b2ce-4ded184cc9e4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9073, NULL, 907, 10, '2026-07-21 06:56:33.437573+07', NULL, NULL, NULL, '04a79fd7-62bb-4065-91c5-625bee9c88e5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9282, NULL, 931, 1, '2026-07-21 06:56:34.826989+07', NULL, NULL, NULL, 'c0c38dd9-84bd-4ad6-801e-8728599690d2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9284, NULL, 931, 2, '2026-07-21 06:56:34.82699+07', NULL, NULL, NULL, 'dcf6996b-a82e-48ab-ad6c-9fb8f10fdfeb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9286, NULL, 931, 3, '2026-07-21 06:56:34.82699+07', NULL, NULL, NULL, 'd59ee1c3-b8be-4ed8-8054-d3da5497b955', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9288, NULL, 931, 4, '2026-07-21 06:56:34.82699+07', NULL, NULL, NULL, '02d25684-2f46-42aa-86b9-4d719210d7e1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9289, NULL, 931, 5, '2026-07-21 06:56:34.82699+07', NULL, NULL, NULL, 'd366eae8-9e42-4cd9-bb2b-9debc0c19484', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9290, NULL, 931, 6, '2026-07-21 06:56:34.82699+07', NULL, NULL, NULL, '02ead4eb-97ef-454f-a177-b736510c0429', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9291, NULL, 931, 7, '2026-07-21 06:56:34.82699+07', NULL, NULL, NULL, '2f62f368-bdfc-4b20-8c76-b8d91d12fc64', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9292, NULL, 931, 8, '2026-07-21 06:56:34.82699+07', NULL, NULL, NULL, '721e485f-026a-41c4-9620-76cf87c7c437', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9293, NULL, 931, 9, '2026-07-21 06:56:34.82699+07', NULL, NULL, NULL, 'daa4478a-1a45-494b-bdbb-2ec48227ebc7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9294, NULL, 931, 10, '2026-07-21 06:56:34.826991+07', NULL, NULL, NULL, '38fd9755-b297-4a25-b7ea-6610d27b4d5f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9038, NULL, 908, 1, '2026-07-21 06:56:33.437654+07', NULL, NULL, NULL, '860db726-36e7-49c7-b6b9-453007b07526', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9042, NULL, 908, 2, '2026-07-21 06:56:33.437655+07', NULL, NULL, NULL, '3e8ca406-0f75-4c4d-96d9-7a6683200557', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9046, NULL, 908, 3, '2026-07-21 06:56:33.437655+07', NULL, NULL, NULL, 'fc50dcd5-51ab-44ab-85e1-182f22db48d5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9050, NULL, 908, 4, '2026-07-21 06:56:33.437655+07', NULL, NULL, NULL, '4bc00bbd-751a-4343-9452-eb9e62660cf9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9054, NULL, 908, 5, '2026-07-21 06:56:33.437656+07', NULL, NULL, NULL, '5332806b-3a6b-4606-a048-13cad3182d13', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9057, NULL, 908, 6, '2026-07-21 06:56:33.437656+07', NULL, NULL, NULL, '5cef21a8-f334-451c-be62-d36b48659560', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9062, NULL, 908, 7, '2026-07-21 06:56:33.437656+07', NULL, NULL, NULL, '1a816627-8c1d-48a2-9ae0-66e8aea9484f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9066, NULL, 908, 8, '2026-07-21 06:56:33.437656+07', NULL, NULL, NULL, '23144592-4386-4f88-9b40-311e82a62bf3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9071, NULL, 908, 9, '2026-07-21 06:56:33.437656+07', NULL, NULL, NULL, 'dd8cded3-77bc-42b2-bd1b-1f38679667e4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9074, NULL, 908, 10, '2026-07-21 06:56:33.437656+07', NULL, NULL, NULL, '0fcdcad9-6337-47ed-a95f-f0aba7b3f7a5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9325, NULL, 935, 1, '2026-07-21 06:56:35.019691+07', NULL, NULL, NULL, '3f89efdf-c771-408a-ae0e-1255bd5130b7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9326, NULL, 935, 2, '2026-07-21 06:56:35.019692+07', NULL, NULL, NULL, '55aa51fd-597d-4dad-b830-ec3ceb8ca04e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9327, NULL, 935, 3, '2026-07-21 06:56:35.019692+07', NULL, NULL, NULL, '1e2246c6-f733-42c2-a633-7324b8e8288e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9328, NULL, 935, 4, '2026-07-21 06:56:35.019692+07', NULL, NULL, NULL, 'a1638673-7aa2-45b2-83b2-5f45cda84f94', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9329, NULL, 935, 5, '2026-07-21 06:56:35.019692+07', NULL, NULL, NULL, '712680f3-4166-406c-b453-dcfee972bb2b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9330, NULL, 935, 6, '2026-07-21 06:56:35.019692+07', NULL, NULL, NULL, 'a4d7b84a-04d7-4667-9f61-3590da1dcf47', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9331, NULL, 935, 7, '2026-07-21 06:56:35.019692+07', NULL, NULL, NULL, 'd4c7f596-0912-41b4-a6c0-fa155610b02a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9332, NULL, 935, 8, '2026-07-21 06:56:35.019692+07', NULL, NULL, NULL, 'f003799c-87b5-4fee-8549-8bd84b2c0fff', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9333, NULL, 935, 9, '2026-07-21 06:56:35.019692+07', NULL, NULL, NULL, '4cf67f50-2e03-4a0b-90b7-00136b136cb7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9334, NULL, 935, 10, '2026-07-21 06:56:35.019693+07', NULL, NULL, NULL, '3b94fbc4-9752-4ada-8cf5-bbcbf8abc5d1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9075, NULL, 910, 1, '2026-07-21 06:56:33.465759+07', NULL, NULL, NULL, '32050351-1d6e-43e6-933f-430748ac12d3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9076, NULL, 910, 2, '2026-07-21 06:56:33.46576+07', NULL, NULL, NULL, 'ffb4ec96-f4b2-402b-be37-b323d4281a6a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9077, NULL, 910, 3, '2026-07-21 06:56:33.46576+07', NULL, NULL, NULL, 'd53af09a-5203-4db6-a7c5-df3023a6675d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9078, NULL, 910, 4, '2026-07-21 06:56:33.46576+07', NULL, NULL, NULL, 'aecefd3c-5e82-4fe0-b251-a62347700da4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9079, NULL, 910, 5, '2026-07-21 06:56:33.46576+07', NULL, NULL, NULL, '8f5fed64-373c-49d4-b1b9-d3b5dd3d7080', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9080, NULL, 910, 6, '2026-07-21 06:56:33.46576+07', NULL, NULL, NULL, 'b9343720-5f3f-4fa8-9313-d97bcd93b087', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9081, NULL, 910, 7, '2026-07-21 06:56:33.46576+07', NULL, NULL, NULL, 'bbb1ac25-832f-456c-b0b2-d9d85321f728', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9082, NULL, 910, 8, '2026-07-21 06:56:33.46576+07', NULL, NULL, NULL, '1590bcd0-4260-4711-aa76-25788684661e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9083, NULL, 910, 9, '2026-07-21 06:56:33.46576+07', NULL, NULL, NULL, '893e7dce-4caf-41fd-9b6f-466e20d9eb56', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9084, NULL, 910, 10, '2026-07-21 06:56:33.46576+07', NULL, NULL, NULL, '3e2e8c41-5171-4c66-9ee6-ea617d3002f1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9085, NULL, 911, 1, '2026-07-21 06:56:33.570448+07', NULL, NULL, NULL, '76ee733e-c052-4f4e-ad0d-b3834dd72b51', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9086, NULL, 911, 2, '2026-07-21 06:56:33.570449+07', NULL, NULL, NULL, 'd26355b9-70a0-4cc5-907a-d3b5344d34c4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9087, NULL, 911, 3, '2026-07-21 06:56:33.570449+07', NULL, NULL, NULL, 'c78965e8-1a57-4ecc-b880-40281f804122', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9088, NULL, 911, 4, '2026-07-21 06:56:33.570449+07', NULL, NULL, NULL, 'dafb7b6a-bcad-46ba-b9a6-86242b422a14', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9089, NULL, 911, 5, '2026-07-21 06:56:33.570449+07', NULL, NULL, NULL, '50c2736d-0a3a-4054-a98b-7aaef7ec7318', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9090, NULL, 911, 6, '2026-07-21 06:56:33.570449+07', NULL, NULL, NULL, 'ce98407b-e9d1-4fc3-b228-49d13456d39a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9091, NULL, 911, 7, '2026-07-21 06:56:33.570449+07', NULL, NULL, NULL, 'd916c070-bd29-4a55-b1be-cd15c191c0ca', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9092, NULL, 911, 8, '2026-07-21 06:56:33.570449+07', NULL, NULL, NULL, '0e685c0d-1746-46e4-bdb2-dd2fcb8fcf05', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9093, NULL, 911, 9, '2026-07-21 06:56:33.570449+07', NULL, NULL, NULL, '9b2b2ca8-0199-421a-9241-302862a573f4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9094, NULL, 911, 10, '2026-07-21 06:56:33.57045+07', NULL, NULL, NULL, '08dfaa10-0911-4335-bafb-44940078bab9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9095, NULL, 912, 1, '2026-07-21 06:56:33.602564+07', NULL, NULL, NULL, '9dea8481-12c3-458e-9510-16adf27c38b6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9096, NULL, 912, 2, '2026-07-21 06:56:33.602566+07', NULL, NULL, NULL, '75a2a3e2-4afe-4042-9b33-a956da72f0dd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9097, NULL, 912, 3, '2026-07-21 06:56:33.602566+07', NULL, NULL, NULL, 'c060f442-6ea0-49e5-a82c-6ae68a816ee2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9098, NULL, 912, 4, '2026-07-21 06:56:33.602566+07', NULL, NULL, NULL, '93633b4c-60b3-414a-9eb2-57072f75d697', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9099, NULL, 912, 5, '2026-07-21 06:56:33.602566+07', NULL, NULL, NULL, '27a7043c-0888-4307-8ecb-549275871481', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9100, NULL, 912, 6, '2026-07-21 06:56:33.602566+07', NULL, NULL, NULL, '7a317348-1c2e-40a4-a18c-1bbba877c484', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9101, NULL, 912, 7, '2026-07-21 06:56:33.602566+07', NULL, NULL, NULL, 'ae3b28f0-d7e3-4add-886c-fadecc6b6b83', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9102, NULL, 912, 8, '2026-07-21 06:56:33.602566+07', NULL, NULL, NULL, '6c4c1b44-f119-47bb-984b-3c8291d9d37a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9103, NULL, 912, 9, '2026-07-21 06:56:33.602566+07', NULL, NULL, NULL, 'a0b3f130-3667-40da-b03e-7b9076ab581c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9104, NULL, 912, 10, '2026-07-21 06:56:33.602566+07', NULL, NULL, NULL, '49050abe-a9d7-4262-b592-e1234d0504f9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9297, NULL, 933, 1, '2026-07-21 06:56:35.007782+07', NULL, NULL, NULL, 'abdd58e9-a272-4764-8761-f0a7d78f7c90', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9300, NULL, 933, 2, '2026-07-21 06:56:35.007783+07', NULL, NULL, NULL, '3b039bff-60a9-4e12-8235-681d65ebeb81', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9303, NULL, 933, 3, '2026-07-21 06:56:35.007783+07', NULL, NULL, NULL, 'e251fe92-caa9-4ba4-acdc-86e6bfeb8ca6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9306, NULL, 933, 4, '2026-07-21 06:56:35.007783+07', NULL, NULL, NULL, 'ec1f5cdd-755f-49bf-8db8-cafb504fda6e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9309, NULL, 933, 5, '2026-07-21 06:56:35.007783+07', NULL, NULL, NULL, '53c06053-201e-41af-bff9-7a15b8ea4a8d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9312, NULL, 933, 6, '2026-07-21 06:56:35.007783+07', NULL, NULL, NULL, '42668b26-1c9d-4344-a90b-bb9c80820685', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9315, NULL, 933, 7, '2026-07-21 06:56:35.007783+07', NULL, NULL, NULL, '6681e043-2d86-45a3-b0a8-c845d73d590b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9318, NULL, 933, 8, '2026-07-21 06:56:35.007784+07', NULL, NULL, NULL, '8346ad0f-6190-4cc5-b59e-2a134064c99b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9321, NULL, 933, 9, '2026-07-21 06:56:35.007784+07', NULL, NULL, NULL, 'b1c7911b-f019-48b6-90b1-6615440182af', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9324, NULL, 933, 10, '2026-07-21 06:56:35.007784+07', NULL, NULL, NULL, 'ebd9571d-4cf3-480a-baaa-2913d618c5b7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9335, NULL, 936, 1, '2026-07-21 06:56:35.076807+07', NULL, NULL, NULL, '1bb8a0a8-f3a7-4e90-8617-bb5c37732ad3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9336, NULL, 936, 2, '2026-07-21 06:56:35.076808+07', NULL, NULL, NULL, '59474a04-850f-4606-adff-453a2f34cc6c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9337, NULL, 936, 3, '2026-07-21 06:56:35.076808+07', NULL, NULL, NULL, '17af7695-5577-4423-82ef-e7aae08b7e78', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9338, NULL, 936, 4, '2026-07-21 06:56:35.076808+07', NULL, NULL, NULL, '57c3a719-4ceb-4ae6-a01c-788c3c165b8f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9339, NULL, 936, 5, '2026-07-21 06:56:35.076808+07', NULL, NULL, NULL, 'f021a029-e3b4-478c-bd1f-2445e9d64684', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9340, NULL, 936, 6, '2026-07-21 06:56:35.076808+07', NULL, NULL, NULL, 'e904bd2a-429f-4ff5-8e2d-e32e6b8ca30f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9341, NULL, 936, 7, '2026-07-21 06:56:35.076808+07', NULL, NULL, NULL, 'fff613f8-8613-4d3b-b5e4-3c9c70d0d0ca', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9342, NULL, 936, 8, '2026-07-21 06:56:35.076808+07', NULL, NULL, NULL, '3e28ecc8-04b7-4e60-861f-d91d3f0617ea', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9343, NULL, 936, 9, '2026-07-21 06:56:35.076808+07', NULL, NULL, NULL, 'fe292469-1db8-4b99-8ca3-66bbbf5b6d28', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9344, NULL, 936, 10, '2026-07-21 06:56:35.076808+07', NULL, NULL, NULL, 'a8fe0aef-8c00-4726-9004-0cfd361f9f70', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9355, NULL, 938, 1, '2026-07-21 06:56:35.285309+07', NULL, NULL, NULL, '302d5385-d8a8-4e7f-bb6f-d374a62c08d7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9356, NULL, 938, 2, '2026-07-21 06:56:35.28531+07', NULL, NULL, NULL, '04155651-36c1-44e8-94c5-0a84f396a27a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9357, NULL, 938, 3, '2026-07-21 06:56:35.28531+07', NULL, NULL, NULL, 'fa1b7b37-ba79-44ca-be31-273e1bf53f64', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9358, NULL, 938, 4, '2026-07-21 06:56:35.28531+07', NULL, NULL, NULL, '0cf11dc1-511d-4832-b80c-0eb4d06bac78', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9359, NULL, 938, 5, '2026-07-21 06:56:35.28531+07', NULL, NULL, NULL, '67d1b24d-5ed2-4aed-98b3-ebd6f9206f33', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9360, NULL, 938, 6, '2026-07-21 06:56:35.28531+07', NULL, NULL, NULL, 'b5db4677-9f0b-40dc-a68e-c146f4b53e30', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9361, NULL, 938, 7, '2026-07-21 06:56:35.28531+07', NULL, NULL, NULL, 'fbf633ab-25c6-487b-b358-a3bd5ab919d9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9362, NULL, 938, 8, '2026-07-21 06:56:35.28531+07', NULL, NULL, NULL, 'c06aba3f-dd05-4afd-9b9a-008bbf6dc71a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9363, NULL, 938, 9, '2026-07-21 06:56:35.28531+07', NULL, NULL, NULL, 'ac03004e-aab2-42d2-b8bd-388a40646f61', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9364, NULL, 938, 10, '2026-07-21 06:56:35.285311+07', NULL, NULL, NULL, 'c652bfe2-3190-4d8e-82f9-048b30d7edcf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9105, NULL, 913, 1, '2026-07-21 06:56:33.628411+07', NULL, NULL, NULL, '944de923-3f46-43cf-94d3-acdca4dc7d81', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9106, NULL, 913, 2, '2026-07-21 06:56:33.628413+07', NULL, NULL, NULL, '6959b07d-6bd6-4daa-98b3-ed1eb8879f21', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9107, NULL, 913, 3, '2026-07-21 06:56:33.628414+07', NULL, NULL, NULL, '7a05e2af-3a31-43fb-b8c2-5c90d70d9bc3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9108, NULL, 913, 4, '2026-07-21 06:56:33.628414+07', NULL, NULL, NULL, 'e3115fbe-7c19-490f-9b0d-b6c413a188e6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9109, NULL, 913, 5, '2026-07-21 06:56:33.628414+07', NULL, NULL, NULL, 'a73f4f45-0953-470a-af74-25f1b5668c77', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9110, NULL, 913, 6, '2026-07-21 06:56:33.628415+07', NULL, NULL, NULL, 'de0b796a-d2ac-4bf8-8af0-5daf6a51a6f5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9111, NULL, 913, 7, '2026-07-21 06:56:33.628415+07', NULL, NULL, NULL, '776f0de2-fb1f-479e-b7e7-07a2a5dc3d07', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9112, NULL, 913, 8, '2026-07-21 06:56:33.628415+07', NULL, NULL, NULL, '2fcb03db-62c9-4494-b7ef-406d237e4050', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9113, NULL, 913, 9, '2026-07-21 06:56:33.628415+07', NULL, NULL, NULL, '14cf7db8-63ed-4895-a903-e35bc9ae197c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9114, NULL, 913, 10, '2026-07-21 06:56:33.628416+07', NULL, NULL, NULL, '816adb97-95a5-4367-ac33-2ac05093bb53', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9265, NULL, 929, 1, '2026-07-21 06:56:34.773559+07', NULL, NULL, NULL, 'eacf18ef-6381-4935-accb-60147c413fb3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9266, NULL, 929, 2, '2026-07-21 06:56:34.77356+07', NULL, NULL, NULL, '83815bfa-d6d3-4b10-b870-2e6fbdbdfcbe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9267, NULL, 929, 3, '2026-07-21 06:56:34.77356+07', NULL, NULL, NULL, '97d74dd3-ec0d-4d23-8925-e79c89cb4ff9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9268, NULL, 929, 4, '2026-07-21 06:56:34.77356+07', NULL, NULL, NULL, '4debe4b4-355b-4437-892b-dbdfde851af9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9269, NULL, 929, 5, '2026-07-21 06:56:34.77356+07', NULL, NULL, NULL, '9a1465a6-2e26-43c3-9ff4-b70154d4e0d9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9270, NULL, 929, 6, '2026-07-21 06:56:34.773561+07', NULL, NULL, NULL, '79cac526-7362-4a90-8ac6-1cb3ab0a514c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9271, NULL, 929, 7, '2026-07-21 06:56:34.773561+07', NULL, NULL, NULL, 'e40dd026-e066-4362-98c2-f62ce52a8653', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9272, NULL, 929, 8, '2026-07-21 06:56:34.773561+07', NULL, NULL, NULL, '1f926cf2-3497-4316-9b14-579721ac446c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9273, NULL, 929, 9, '2026-07-21 06:56:34.773561+07', NULL, NULL, NULL, '6bba006e-5b44-4c57-af73-8c992d449a03', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9274, NULL, 929, 10, '2026-07-21 06:56:34.773561+07', NULL, NULL, NULL, '2df1d3fb-979d-44c8-8ca6-49847ea2abca', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9115, NULL, 914, 1, '2026-07-21 06:56:33.750826+07', NULL, NULL, NULL, 'c1bb55a6-2081-448a-a9df-0e08264f9abb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9116, NULL, 914, 2, '2026-07-21 06:56:33.750827+07', NULL, NULL, NULL, '4f52e536-64c4-4885-8947-8b2656096870', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9117, NULL, 914, 3, '2026-07-21 06:56:33.750827+07', NULL, NULL, NULL, '4af154de-7ed5-4ce4-b35e-11152db95208', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9118, NULL, 914, 4, '2026-07-21 06:56:33.750827+07', NULL, NULL, NULL, '108a8bdc-f51e-4af9-be13-06e6452c3997', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9119, NULL, 914, 5, '2026-07-21 06:56:33.750827+07', NULL, NULL, NULL, '6db77843-545f-45c1-abbf-e4d81932b1df', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9120, NULL, 914, 6, '2026-07-21 06:56:33.750827+07', NULL, NULL, NULL, 'd27bdaf0-d48f-4450-8ea6-22fa9a2cfeb1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9121, NULL, 914, 7, '2026-07-21 06:56:33.750828+07', NULL, NULL, NULL, 'cc491891-5da8-47f2-8cf7-d1bb86080583', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9122, NULL, 914, 8, '2026-07-21 06:56:33.750828+07', NULL, NULL, NULL, 'a718b0fd-39be-4d0f-a29a-46168a57ce49', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9123, NULL, 914, 9, '2026-07-21 06:56:33.750828+07', NULL, NULL, NULL, 'fcfb9324-6134-4589-ab7f-0c1a3c938ffe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9124, NULL, 914, 10, '2026-07-21 06:56:33.750828+07', NULL, NULL, NULL, '1119a68f-0ad3-476c-8837-1e9e4ac82849', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9345, NULL, 937, 1, '2026-07-21 06:56:35.138093+07', NULL, NULL, NULL, 'e66b02a8-579d-4f78-8b61-89e06134e78c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9346, NULL, 937, 2, '2026-07-21 06:56:35.138094+07', NULL, NULL, NULL, '880e9aec-f886-42cf-8167-dd1e5f3dd74f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9347, NULL, 937, 3, '2026-07-21 06:56:35.138094+07', NULL, NULL, NULL, '42bdc98f-f282-4e54-ae79-2b240e2b785a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9348, NULL, 937, 4, '2026-07-21 06:56:35.138094+07', NULL, NULL, NULL, 'efa4df25-507c-47de-822a-29c0621bf36b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9349, NULL, 937, 5, '2026-07-21 06:56:35.138094+07', NULL, NULL, NULL, 'd08504b1-8db1-405d-a2f2-276bfc419e07', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9350, NULL, 937, 6, '2026-07-21 06:56:35.138094+07', NULL, NULL, NULL, 'e01860a3-ec2e-44d6-8725-a3704beaa7bd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9351, NULL, 937, 7, '2026-07-21 06:56:35.138094+07', NULL, NULL, NULL, '6ed7d2cc-4998-4160-ae04-43b866449a83', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9352, NULL, 937, 8, '2026-07-21 06:56:35.138094+07', NULL, NULL, NULL, '176c71ff-79ed-46f8-be90-21ebb6497b69', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9353, NULL, 937, 9, '2026-07-21 06:56:35.138094+07', NULL, NULL, NULL, 'eb1dc03a-ea72-4824-a265-e693926324a4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9354, NULL, 937, 10, '2026-07-21 06:56:35.138094+07', NULL, NULL, NULL, 'c717eea8-d90f-4947-bf79-5e471233a136', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9125, NULL, 915, 1, '2026-07-21 06:56:33.96353+07', NULL, NULL, NULL, '1a3cc54d-8519-4d94-8a58-fcd615975c5f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9126, NULL, 915, 2, '2026-07-21 06:56:33.963535+07', NULL, NULL, NULL, '699eb60e-116c-47ef-9b58-77b1e41f20f6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9127, NULL, 915, 3, '2026-07-21 06:56:33.963535+07', NULL, NULL, NULL, '5352767f-fc98-413e-b40b-43ba373a1ec5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9128, NULL, 915, 4, '2026-07-21 06:56:33.963535+07', NULL, NULL, NULL, '03edb6ff-db03-477b-9e65-b4468d7a4477', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9129, NULL, 915, 5, '2026-07-21 06:56:33.963535+07', NULL, NULL, NULL, '811afc19-67ee-4cb0-9986-c14a13062d08', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9130, NULL, 915, 6, '2026-07-21 06:56:33.963535+07', NULL, NULL, NULL, '83695c0c-70c3-44ac-af7c-e8e6a9c04ac9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9131, NULL, 915, 7, '2026-07-21 06:56:33.963536+07', NULL, NULL, NULL, 'cf21fb30-f525-4017-a5a6-f2586c705e53', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9132, NULL, 915, 8, '2026-07-21 06:56:33.963536+07', NULL, NULL, NULL, '4c2747de-86d3-4964-a67f-d3562a84a0d6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9133, NULL, 915, 9, '2026-07-21 06:56:33.963536+07', NULL, NULL, NULL, '74851295-a0a8-4f4c-ae1b-b95119d8915f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9134, NULL, 915, 10, '2026-07-21 06:56:33.963536+07', NULL, NULL, NULL, '83586108-6415-4885-9497-15788273ca60', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9365, NULL, 939, 1, '2026-07-21 06:56:35.296125+07', NULL, NULL, NULL, '3bec6e60-5d8a-40fc-bc22-d3868f546c96', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9366, NULL, 939, 2, '2026-07-21 06:56:35.296125+07', NULL, NULL, NULL, '84f8a99e-ad0b-4006-bf36-84e12d13d081', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9367, NULL, 939, 3, '2026-07-21 06:56:35.296125+07', NULL, NULL, NULL, '224a9a54-bcb8-4052-9174-0b6f15dd0f21', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9368, NULL, 939, 4, '2026-07-21 06:56:35.296125+07', NULL, NULL, NULL, 'a08abb41-30bb-44ab-a45d-8e51bab20b7e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9369, NULL, 939, 5, '2026-07-21 06:56:35.296125+07', NULL, NULL, NULL, 'e5948127-9c7c-407c-ba30-f83f983a896c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9370, NULL, 939, 6, '2026-07-21 06:56:35.296126+07', NULL, NULL, NULL, '783550de-f396-4659-bf49-8674d1b3aeed', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9371, NULL, 939, 7, '2026-07-21 06:56:35.296126+07', NULL, NULL, NULL, 'cf6ad0bc-1786-42b8-80ad-9b6129a122d9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9372, NULL, 939, 8, '2026-07-21 06:56:35.296126+07', NULL, NULL, NULL, 'b63339c8-274d-4a5c-925d-ca30674bad64', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9373, NULL, 939, 9, '2026-07-21 06:56:35.296126+07', NULL, NULL, NULL, '7d9dbdf5-ab30-4c32-9d6f-2fcbaee94ddf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9374, NULL, 939, 10, '2026-07-21 06:56:35.296126+07', NULL, NULL, NULL, '6875d8f0-80d6-4ebb-8466-ddd1691b2cc4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9135, NULL, 916, 1, '2026-07-21 06:56:33.977738+07', NULL, NULL, NULL, '6aca718f-7766-40b9-889a-10834871f6fc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9136, NULL, 916, 2, '2026-07-21 06:56:33.977739+07', NULL, NULL, NULL, 'd6802882-4582-4811-987f-17d05b749e49', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9137, NULL, 916, 3, '2026-07-21 06:56:33.97774+07', NULL, NULL, NULL, '5fdb7c3e-0dd6-44e5-acc5-8cd04f3a0e04', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9138, NULL, 916, 4, '2026-07-21 06:56:33.97774+07', NULL, NULL, NULL, 'e5e767dd-d7c1-485c-bcce-65a099546230', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9140, NULL, 916, 5, '2026-07-21 06:56:33.97774+07', NULL, NULL, NULL, 'b07c4a7c-8466-401d-ba0c-b3c65464f5b8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9142, NULL, 916, 6, '2026-07-21 06:56:33.97774+07', NULL, NULL, NULL, '7c2bd939-137d-431b-baf0-38889fc1c779', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9143, NULL, 916, 7, '2026-07-21 06:56:33.97774+07', NULL, NULL, NULL, '35706fe8-0f93-4aea-8dc2-13fa20420608', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9145, NULL, 916, 8, '2026-07-21 06:56:33.97774+07', NULL, NULL, NULL, 'b31b2183-444d-427b-8172-11d608310d5d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9147, NULL, 916, 9, '2026-07-21 06:56:33.97774+07', NULL, NULL, NULL, '59750e80-7faa-4b24-838c-1e933fa61ece', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9149, NULL, 916, 10, '2026-07-21 06:56:33.97774+07', NULL, NULL, NULL, '92fc4825-7565-408c-aa76-50be8baeca66', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9396, NULL, 942, 1, '2026-07-21 06:56:35.531008+07', NULL, NULL, NULL, 'ae2b3230-6063-498b-9b30-ad740fc2416f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9398, NULL, 942, 2, '2026-07-21 06:56:35.531009+07', NULL, NULL, NULL, 'ebb36b65-9476-4e5e-a231-5f6cefc65513', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9400, NULL, 942, 3, '2026-07-21 06:56:35.531009+07', NULL, NULL, NULL, '63b7bd3f-ee74-41b7-810f-51aa8e2614f9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9402, NULL, 942, 4, '2026-07-21 06:56:35.531009+07', NULL, NULL, NULL, '3b803fa9-c456-4c7c-9a49-f7f26ba76656', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9404, NULL, 942, 5, '2026-07-21 06:56:35.531009+07', NULL, NULL, NULL, '01a78b6b-91fd-47b7-9d89-00e3e6da099d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9406, NULL, 942, 6, '2026-07-21 06:56:35.531009+07', NULL, NULL, NULL, 'b547bd60-60c5-47ee-bca2-8c3a0617a7a3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9408, NULL, 942, 7, '2026-07-21 06:56:35.53101+07', NULL, NULL, NULL, 'c63bce1b-87fc-4c2f-8312-81f3b289013d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9410, NULL, 942, 8, '2026-07-21 06:56:35.53101+07', NULL, NULL, NULL, '3fd79623-17c0-4a4d-872f-1bd23f274ef1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9412, NULL, 942, 9, '2026-07-21 06:56:35.53101+07', NULL, NULL, NULL, '3d2af014-b573-4f10-bc27-c8bce343a167', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9414, NULL, 942, 10, '2026-07-21 06:56:35.53101+07', NULL, NULL, NULL, 'ce1ab385-fac0-4010-8455-00f40dfe7227', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9155, NULL, 918, 1, '2026-07-21 06:56:34.024337+07', NULL, NULL, NULL, '28e99001-ada4-4085-bb8b-545902ebce5d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9156, NULL, 918, 2, '2026-07-21 06:56:34.024339+07', NULL, NULL, NULL, 'ac57add0-0105-4f65-a54d-826de7713143', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9157, NULL, 918, 3, '2026-07-21 06:56:34.024339+07', NULL, NULL, NULL, '11fe180a-1906-480f-88c0-7e4aabb7eb23', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9158, NULL, 918, 4, '2026-07-21 06:56:34.024339+07', NULL, NULL, NULL, '0bd9f276-107b-44d5-9fb0-818d022bbe8a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9159, NULL, 918, 5, '2026-07-21 06:56:34.024339+07', NULL, NULL, NULL, 'f51e187c-b3b8-4609-b5c2-ea11e33e053d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9160, NULL, 918, 6, '2026-07-21 06:56:34.024339+07', NULL, NULL, NULL, '25129a6a-273c-4bce-9b48-2117c687e674', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9161, NULL, 918, 7, '2026-07-21 06:56:34.024339+07', NULL, NULL, NULL, 'c5fa109b-82c0-4fa6-8663-1c61115f1979', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9162, NULL, 918, 8, '2026-07-21 06:56:34.02434+07', NULL, NULL, NULL, '1d3355a9-ba23-49a6-9747-f8e69ade7e10', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9163, NULL, 918, 9, '2026-07-21 06:56:34.02434+07', NULL, NULL, NULL, 'abc55ec8-4db0-43cc-9549-39026e0968bc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9164, NULL, 918, 10, '2026-07-21 06:56:34.02434+07', NULL, NULL, NULL, 'df6cae23-9c88-4fb9-979a-8263be04a19e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9375, NULL, 940, 1, '2026-07-21 06:56:35.394911+07', NULL, NULL, NULL, '738fda8a-e57b-4e7d-8870-7b85fdca41b9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9376, NULL, 940, 2, '2026-07-21 06:56:35.394914+07', NULL, NULL, NULL, '967e56f5-fd02-410a-b570-5c6251faf3c7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9377, NULL, 940, 3, '2026-07-21 06:56:35.394914+07', NULL, NULL, NULL, '429f9874-e552-4d25-b421-cb1fa9379182', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9378, NULL, 940, 4, '2026-07-21 06:56:35.394914+07', NULL, NULL, NULL, 'c37a74bc-9cca-41c6-96e0-e081c93a92fd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9379, NULL, 940, 5, '2026-07-21 06:56:35.394914+07', NULL, NULL, NULL, '1a7487c4-4588-4fb4-bf44-9b3266dfd29d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9380, NULL, 940, 6, '2026-07-21 06:56:35.394914+07', NULL, NULL, NULL, '07fc1009-5f21-403f-a313-eb5947ceaf8f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9381, NULL, 940, 7, '2026-07-21 06:56:35.394915+07', NULL, NULL, NULL, '0f824609-8cce-44d8-80f0-d1f6c4176933', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9382, NULL, 940, 8, '2026-07-21 06:56:35.394915+07', NULL, NULL, NULL, 'b3e6e7a8-b6dc-4bea-9c3c-cb5f8dd37774', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9383, NULL, 940, 9, '2026-07-21 06:56:35.394915+07', NULL, NULL, NULL, '46ba17a1-a0cf-44ac-88d4-9d27f3ee2dcb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9384, NULL, 940, 10, '2026-07-21 06:56:35.394915+07', NULL, NULL, NULL, '4313733a-e745-47d7-89bf-787f0ebbfaaf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9165, NULL, 919, 1, '2026-07-21 06:56:34.078886+07', NULL, NULL, NULL, '16ca1027-f3bc-4132-989d-41db438431d1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9166, NULL, 919, 2, '2026-07-21 06:56:34.078887+07', NULL, NULL, NULL, '615fecf9-0a00-4144-98b0-40c6c7e8b6ff', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9167, NULL, 919, 3, '2026-07-21 06:56:34.078887+07', NULL, NULL, NULL, '35485a22-2666-4ed2-8fe5-1c2173e4f956', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9168, NULL, 919, 4, '2026-07-21 06:56:34.078887+07', NULL, NULL, NULL, '708df1bf-5bb9-4aed-9148-fed74cd7da25', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9169, NULL, 919, 5, '2026-07-21 06:56:34.078888+07', NULL, NULL, NULL, '4c0eb608-92b8-4ca4-a4a0-2da799396f85', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9170, NULL, 919, 6, '2026-07-21 06:56:34.078888+07', NULL, NULL, NULL, '2a3556e0-7ef6-4a31-af17-1800f65c768e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9171, NULL, 919, 7, '2026-07-21 06:56:34.078888+07', NULL, NULL, NULL, '69a05e9d-963e-4618-82b5-7c4dd0cda98a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9172, NULL, 919, 8, '2026-07-21 06:56:34.078888+07', NULL, NULL, NULL, 'df954ebe-8d19-45af-b922-2960668cacbe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9173, NULL, 919, 9, '2026-07-21 06:56:34.078888+07', NULL, NULL, NULL, '058c81f8-0239-48a1-8bef-524d726483f2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9174, NULL, 919, 10, '2026-07-21 06:56:34.078888+07', NULL, NULL, NULL, 'efd334ac-5318-4314-94d1-693609ac2162', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9385, NULL, 941, 1, '2026-07-21 06:56:35.401079+07', NULL, NULL, NULL, '541046da-ee86-4ecd-b9c3-ca40cbe32aeb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9386, NULL, 941, 2, '2026-07-21 06:56:35.40108+07', NULL, NULL, NULL, '8cb18243-c53e-4257-83fc-f21e03f2cd9b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9387, NULL, 941, 3, '2026-07-21 06:56:35.40108+07', NULL, NULL, NULL, '9ceb3a46-25eb-438c-bd17-8b22143a16fc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9388, NULL, 941, 4, '2026-07-21 06:56:35.40108+07', NULL, NULL, NULL, '0a410cbf-53ac-419b-b0fc-041829b065c2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9389, NULL, 941, 5, '2026-07-21 06:56:35.401081+07', NULL, NULL, NULL, '1bce27de-abf8-4423-8e8a-405499839c22', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9390, NULL, 941, 6, '2026-07-21 06:56:35.401081+07', NULL, NULL, NULL, 'dbd81ffd-f96c-4fb7-bd8b-e71e539e5fa5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9391, NULL, 941, 7, '2026-07-21 06:56:35.401081+07', NULL, NULL, NULL, 'a4a78108-e90f-419f-aebc-d63bb04affe3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9392, NULL, 941, 8, '2026-07-21 06:56:35.401081+07', NULL, NULL, NULL, '87802a7b-5451-480a-aab1-f062b0b9443a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9393, NULL, 941, 9, '2026-07-21 06:56:35.401081+07', NULL, NULL, NULL, '993511d2-2196-4bc0-801a-04940b3f9632', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9394, NULL, 941, 10, '2026-07-21 06:56:35.401081+07', NULL, NULL, NULL, '9f891e2e-d9e1-4ac4-9e7e-db96569f023e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9455, NULL, 948, 1, '2026-07-21 06:56:36.12897+07', NULL, NULL, NULL, '34de1687-46d6-409c-a816-7b6017cbd4e9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9456, NULL, 948, 2, '2026-07-21 06:56:36.128972+07', NULL, NULL, NULL, 'da680f5d-8494-427b-8dda-f174b30bda13', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9457, NULL, 948, 3, '2026-07-21 06:56:36.128972+07', NULL, NULL, NULL, '4d2cb2d4-cad0-40ed-a6ea-855ca6b53c66', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9458, NULL, 948, 4, '2026-07-21 06:56:36.128972+07', NULL, NULL, NULL, '3f1e7aed-976b-47c3-a013-7a729934c18d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9459, NULL, 948, 5, '2026-07-21 06:56:36.128973+07', NULL, NULL, NULL, '406a1287-0294-49e1-a2be-9614863d490a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9460, NULL, 948, 6, '2026-07-21 06:56:36.128973+07', NULL, NULL, NULL, 'b6c81645-afd2-4b11-995e-ddc1a785912f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9461, NULL, 948, 7, '2026-07-21 06:56:36.128973+07', NULL, NULL, NULL, 'e5aa40c1-e5f8-4335-a4ff-fbaeafb5f250', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9462, NULL, 948, 8, '2026-07-21 06:56:36.128973+07', NULL, NULL, NULL, '2944ed5e-14f3-469d-a3fd-49281f0ac9db', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9463, NULL, 948, 9, '2026-07-21 06:56:36.128973+07', NULL, NULL, NULL, '7a10c890-eafa-4760-9da8-9babb42bbbcf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9464, NULL, 948, 10, '2026-07-21 06:56:36.128974+07', NULL, NULL, NULL, '35bb24a0-7ba5-4e79-bfda-6c8e84afb437', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9465, NULL, 949, 1, '2026-07-21 06:56:36.222988+07', NULL, NULL, NULL, '2a4e8aea-941a-4723-a5ee-bdb4be76b113', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9466, NULL, 949, 2, '2026-07-21 06:56:36.22299+07', NULL, NULL, NULL, '92f76103-820e-4fed-9b09-28b246262c70', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9467, NULL, 949, 3, '2026-07-21 06:56:36.22299+07', NULL, NULL, NULL, '1d2e75d4-cae9-49a0-b67a-2ddf052b7f0e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9468, NULL, 949, 4, '2026-07-21 06:56:36.22299+07', NULL, NULL, NULL, '8c977335-b652-4d76-be42-65e966810a2f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9469, NULL, 949, 5, '2026-07-21 06:56:36.22299+07', NULL, NULL, NULL, '934bc30b-6f1d-4264-9eb5-922b7f593220', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9470, NULL, 949, 6, '2026-07-21 06:56:36.22299+07', NULL, NULL, NULL, '2393bf1b-26d3-4585-a20d-69865957567a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9471, NULL, 949, 7, '2026-07-21 06:56:36.22299+07', NULL, NULL, NULL, 'd221a2c1-d94b-4dd7-8f9a-2e052e25db16', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9472, NULL, 949, 8, '2026-07-21 06:56:36.22299+07', NULL, NULL, NULL, 'a2da826f-8e05-4f9b-b46b-0ffeb7b44fef', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9473, NULL, 949, 9, '2026-07-21 06:56:36.22299+07', NULL, NULL, NULL, '4f2b03b7-b11f-43a9-a3b9-8afa2b7308d3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9474, NULL, 949, 10, '2026-07-21 06:56:36.22299+07', NULL, NULL, NULL, '85051f5b-94b8-4958-9d59-2f55fe2eb8aa', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9475, NULL, 951, 1, '2026-07-21 06:56:36.314013+07', NULL, NULL, NULL, 'e67045dc-468c-41aa-822a-94ba8a70c1b8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9476, NULL, 950, 1, '2026-07-21 06:56:36.313851+07', NULL, NULL, NULL, '2d72040a-3126-4748-8bb2-b9da3b99d93c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9477, NULL, 951, 2, '2026-07-21 06:56:36.314014+07', NULL, NULL, NULL, '3773d52b-8db9-4880-8bb1-3d376a6382fe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9478, NULL, 950, 2, '2026-07-21 06:56:36.313852+07', NULL, NULL, NULL, 'c2dfdda9-2b63-4f22-aab9-0cf650ef622f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9479, NULL, 951, 3, '2026-07-21 06:56:36.314014+07', NULL, NULL, NULL, 'd0fe1faf-1f90-480d-a7d4-2b3710be87f6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9480, NULL, 950, 3, '2026-07-21 06:56:36.313853+07', NULL, NULL, NULL, 'aa5092a0-94e8-4722-8b30-1d9e6122f1a0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9481, NULL, 951, 4, '2026-07-21 06:56:36.314014+07', NULL, NULL, NULL, '81d67425-8a33-434c-9aa4-d46c0d986743', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9482, NULL, 950, 4, '2026-07-21 06:56:36.313853+07', NULL, NULL, NULL, '42e436a7-1375-4be5-b6ad-c1589d33e8c7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9483, NULL, 950, 5, '2026-07-21 06:56:36.313854+07', NULL, NULL, NULL, '51dd419f-7144-4c50-88dd-897bd75746ac', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9484, NULL, 951, 5, '2026-07-21 06:56:36.314014+07', NULL, NULL, NULL, '014fa1b6-0059-4cb5-ad08-ef3b902d33da', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9485, NULL, 951, 6, '2026-07-21 06:56:36.314014+07', NULL, NULL, NULL, 'fe01186b-4050-4fca-af95-422d025aaa5c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9486, NULL, 950, 6, '2026-07-21 06:56:36.313854+07', NULL, NULL, NULL, '607e2129-6b1e-471c-ba74-48d6285c4047', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9487, NULL, 951, 7, '2026-07-21 06:56:36.314014+07', NULL, NULL, NULL, '49a7394f-ed3e-402a-8392-36cb6d1ab5b1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9488, NULL, 950, 7, '2026-07-21 06:56:36.313854+07', NULL, NULL, NULL, 'c8498935-6fbc-412f-aa18-0fbbb6d460b1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9489, NULL, 951, 8, '2026-07-21 06:56:36.314014+07', NULL, NULL, NULL, '2c3db3ad-5000-4143-8344-ec90cf95a366', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9490, NULL, 952, 1, '2026-07-21 06:56:36.323089+07', NULL, NULL, NULL, 'e821e2aa-4f29-4826-aeb1-01aaf7a44b80', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9491, NULL, 953, 1, '2026-07-21 06:56:36.322851+07', NULL, NULL, NULL, '7e397add-6878-43a0-9d5b-29101b01c8ec', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9492, NULL, 950, 8, '2026-07-21 06:56:36.313854+07', NULL, NULL, NULL, '024ccfef-6945-4e6b-ab28-1d27e9e1fc21', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9493, NULL, 951, 9, '2026-07-21 06:56:36.314015+07', NULL, NULL, NULL, 'a81365f5-0b0a-4e04-a279-41365caae755', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9494, NULL, 952, 2, '2026-07-21 06:56:36.32309+07', NULL, NULL, NULL, 'f4d61b55-165c-457e-864c-89a2bfe3c255', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9495, NULL, 953, 2, '2026-07-21 06:56:36.322852+07', NULL, NULL, NULL, '1d9ca8cc-eae2-4608-837c-df76b72bf1ba', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9496, NULL, 950, 9, '2026-07-21 06:56:36.313854+07', NULL, NULL, NULL, 'a1e232cf-f1ef-4918-acbb-53f806ed33c8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9497, NULL, 951, 10, '2026-07-21 06:56:36.314015+07', NULL, NULL, NULL, '19c61aaa-412d-48a5-ac1e-8083f3fedf90', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9498, NULL, 952, 3, '2026-07-21 06:56:36.32309+07', NULL, NULL, NULL, '9a436d31-7811-4ab5-97ae-4ec3e75cd23b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9499, NULL, 953, 3, '2026-07-21 06:56:36.322852+07', NULL, NULL, NULL, '4bf8ce54-f909-4352-92f3-733b252e7c36', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9500, NULL, 950, 10, '2026-07-21 06:56:36.313854+07', NULL, NULL, NULL, 'ce4d9194-1491-4dae-b7aa-7c5499e8dba5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9501, NULL, 952, 4, '2026-07-21 06:56:36.32309+07', NULL, NULL, NULL, 'fa9e5ba3-8870-48af-9d7c-89206e0cdd9b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9502, NULL, 953, 4, '2026-07-21 06:56:36.322852+07', NULL, NULL, NULL, '2f695f54-f774-4600-87e9-2fb1f35c4742', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9503, NULL, 952, 5, '2026-07-21 06:56:36.323091+07', NULL, NULL, NULL, '61286caa-b68b-4e55-ad45-458b8158f071', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9504, NULL, 953, 5, '2026-07-21 06:56:36.322852+07', NULL, NULL, NULL, 'e2369590-333d-4e53-b6bc-a138b4d9de90', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9505, NULL, 952, 6, '2026-07-21 06:56:36.323091+07', NULL, NULL, NULL, '84609ff3-6413-43af-b301-1df645874515', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9506, NULL, 953, 6, '2026-07-21 06:56:36.322853+07', NULL, NULL, NULL, '910d855b-cd5b-41f6-a60b-75ec9ab78714', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9507, NULL, 952, 7, '2026-07-21 06:56:36.323091+07', NULL, NULL, NULL, '95245227-c5ac-456c-bf89-4607a232a0c0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9508, NULL, 953, 7, '2026-07-21 06:56:36.322853+07', NULL, NULL, NULL, '41005c6a-0635-422c-9162-c4cc8fdfdb0c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9509, NULL, 952, 8, '2026-07-21 06:56:36.323091+07', NULL, NULL, NULL, 'a973c90e-95fd-4a1b-8ed9-286e54a31ef9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9510, NULL, 953, 8, '2026-07-21 06:56:36.322853+07', NULL, NULL, NULL, '99aea840-f24b-427b-b0f9-66ee8ca6d813', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9512, NULL, 953, 9, '2026-07-21 06:56:36.322853+07', NULL, NULL, NULL, '2de6b518-d939-4072-8701-eba8d0345cde', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9514, NULL, 953, 10, '2026-07-21 06:56:36.322853+07', NULL, NULL, NULL, 'f57bce79-d036-4ed3-89fe-19172ac799e5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9511, NULL, 952, 9, '2026-07-21 06:56:36.323091+07', NULL, NULL, NULL, '6f7a28a1-8da3-4e19-aad8-38f0cddf00be', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9513, NULL, 952, 10, '2026-07-21 06:56:36.323092+07', NULL, NULL, NULL, '3ebbbb1a-7497-4062-8462-593ffb3ed40b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9515, NULL, 954, 1, '2026-07-21 06:56:36.38239+07', NULL, NULL, NULL, '7b5cefc7-c1cb-4884-91f6-37d8d0baf998', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9516, NULL, 954, 2, '2026-07-21 06:56:36.382391+07', NULL, NULL, NULL, '93cc5f41-2c04-4e14-90b7-f726a9043d8d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9517, NULL, 954, 3, '2026-07-21 06:56:36.382391+07', NULL, NULL, NULL, '63150177-bb07-4d81-abb3-9dffa61bfef8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9518, NULL, 954, 4, '2026-07-21 06:56:36.382391+07', NULL, NULL, NULL, '76f574b5-d76a-4d1a-b31b-8e51574810f9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9519, NULL, 954, 5, '2026-07-21 06:56:36.382391+07', NULL, NULL, NULL, '23171719-4942-4a4c-8886-d5291a4f7ad3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9520, NULL, 954, 6, '2026-07-21 06:56:36.382391+07', NULL, NULL, NULL, '334d1032-d8c0-49cd-a7c4-6e25da156b2e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9521, NULL, 954, 7, '2026-07-21 06:56:36.382391+07', NULL, NULL, NULL, 'ac4940c4-1063-4b2b-875d-aeb3d12f271f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9522, NULL, 954, 8, '2026-07-21 06:56:36.382392+07', NULL, NULL, NULL, '958b901e-ab66-4d4a-8674-c4299b971dbf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9523, NULL, 954, 9, '2026-07-21 06:56:36.382392+07', NULL, NULL, NULL, 'fb509a42-4250-4330-87fd-d34f1c964e49', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9524, NULL, 954, 10, '2026-07-21 06:56:36.382392+07', NULL, NULL, NULL, '36a5c83e-7dbf-4871-9227-445c9a0b3202', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9525, NULL, 955, 1, '2026-07-21 06:56:36.412695+07', NULL, NULL, NULL, 'f124bfdd-0e97-43d1-b66a-af39f765bc06', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9526, NULL, 955, 2, '2026-07-21 06:56:36.412695+07', NULL, NULL, NULL, 'ecd78a80-fe19-4457-bd6d-51777872639c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9527, NULL, 955, 3, '2026-07-21 06:56:36.412696+07', NULL, NULL, NULL, '131f90ef-e930-49cd-b5fb-9195ed8ca0d1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9528, NULL, 955, 4, '2026-07-21 06:56:36.412696+07', NULL, NULL, NULL, 'b37e1c46-b17a-4816-a222-2c1c50e3c96b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9529, NULL, 955, 5, '2026-07-21 06:56:36.412696+07', NULL, NULL, NULL, 'b31cae38-db8b-4c1e-be93-c242bdb56178', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9530, NULL, 955, 6, '2026-07-21 06:56:36.412696+07', NULL, NULL, NULL, '093e1e33-55fe-4432-8a5a-ccd4fdf8bd44', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9531, NULL, 955, 7, '2026-07-21 06:56:36.412696+07', NULL, NULL, NULL, 'a479005e-6b50-4217-8cd6-91a65214d363', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9532, NULL, 955, 8, '2026-07-21 06:56:36.412696+07', NULL, NULL, NULL, '4c522770-b238-43d8-810d-cfe7969d6994', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9533, NULL, 955, 9, '2026-07-21 06:56:36.412696+07', NULL, NULL, NULL, 'e7cd6840-ead5-46e9-a1de-82a9867e462b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9534, NULL, 955, 10, '2026-07-21 06:56:36.412696+07', NULL, NULL, NULL, '28201013-e0a2-47e7-8587-fe94dfdba435', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9536, NULL, 956, 2, '2026-07-21 06:56:36.424054+07', NULL, NULL, NULL, 'b20c2ff3-4baa-4ec1-bb9f-d1e090c33ae5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9537, NULL, 956, 3, '2026-07-21 06:56:36.424054+07', NULL, NULL, NULL, '5b1c25f0-7561-4965-8889-28c14d6483a0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9538, NULL, 956, 4, '2026-07-21 06:56:36.424054+07', NULL, NULL, NULL, 'b929a49d-5ef9-4e9e-9c37-a73de344fdbf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9539, NULL, 956, 5, '2026-07-21 06:56:36.424054+07', NULL, NULL, NULL, '6a5449e2-bca2-44ba-96ef-4f85c57e8173', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9540, NULL, 956, 6, '2026-07-21 06:56:36.424054+07', NULL, NULL, NULL, 'bab0559d-0351-4bda-ada7-10b9f97fec47', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9541, NULL, 956, 7, '2026-07-21 06:56:36.424054+07', NULL, NULL, NULL, '4251f301-b907-40cc-a581-614544e39395', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9542, NULL, 956, 8, '2026-07-21 06:56:36.424054+07', NULL, NULL, NULL, 'f38e429f-04db-4d5c-a5e5-2a6729afe859', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9543, NULL, 956, 9, '2026-07-21 06:56:36.424054+07', NULL, NULL, NULL, 'edc80db5-c20e-479f-b680-dc88cbaa5eff', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9544, NULL, 956, 10, '2026-07-21 06:56:36.424054+07', NULL, NULL, NULL, 'd2efdbbe-6d4f-4f12-948e-c6a40fa6bdbc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9545, NULL, 957, 1, '2026-07-21 06:56:36.46485+07', NULL, NULL, NULL, '372a052e-bcc9-4813-9ce3-94b2302889e2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9546, NULL, 957, 2, '2026-07-21 06:56:36.464851+07', NULL, NULL, NULL, '881eeb10-ed55-4077-9286-5e8e5c6e6534', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9547, NULL, 957, 3, '2026-07-21 06:56:36.464851+07', NULL, NULL, NULL, 'cbf5b108-b544-4821-ae70-d7f1dd5c1f56', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9548, NULL, 957, 4, '2026-07-21 06:56:36.464851+07', NULL, NULL, NULL, '4e978db9-4016-4b0b-80d7-91fd1c79e099', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9549, NULL, 957, 5, '2026-07-21 06:56:36.464851+07', NULL, NULL, NULL, 'dc86f5eb-3d4a-4122-975f-8eb62b63187e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9550, NULL, 957, 6, '2026-07-21 06:56:36.464851+07', NULL, NULL, NULL, '5488a262-154d-43b4-8e2f-fd386c0a1459', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9551, NULL, 957, 7, '2026-07-21 06:56:36.464852+07', NULL, NULL, NULL, 'd6d71ac0-3069-4b7c-953e-6a1ce1c87061', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9552, NULL, 957, 8, '2026-07-21 06:56:36.464852+07', NULL, NULL, NULL, 'f02bef45-6997-41c5-8fe0-3786e68ea295', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9553, NULL, 957, 9, '2026-07-21 06:56:36.464852+07', NULL, NULL, NULL, '3fbdd5ef-7152-4efb-bb9a-bca53f9b6343', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9554, NULL, 957, 10, '2026-07-21 06:56:36.464852+07', NULL, NULL, NULL, '72376def-44f4-4d49-a6bd-dc7e04deb2c1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9555, NULL, 958, 1, '2026-07-21 06:56:36.486775+07', NULL, NULL, NULL, '26a0eea0-4b69-4500-95bb-5c0a029e9623', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9556, NULL, 958, 2, '2026-07-21 06:56:36.486776+07', NULL, NULL, NULL, 'b1f7910f-de4b-424a-963d-956b3dec68cd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9557, NULL, 958, 3, '2026-07-21 06:56:36.486776+07', NULL, NULL, NULL, '2500ef53-f864-4768-afe6-0ae28739aefc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9558, NULL, 958, 4, '2026-07-21 06:56:36.486776+07', NULL, NULL, NULL, '7a279360-67e1-49c9-92af-2f568f7662cd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9559, NULL, 958, 5, '2026-07-21 06:56:36.486776+07', NULL, NULL, NULL, '05782538-4987-4134-95eb-146a73a9e5f8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9560, NULL, 958, 6, '2026-07-21 06:56:36.486776+07', NULL, NULL, NULL, 'c2067852-0a59-4561-b386-10f07ab1f2fd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9561, NULL, 958, 7, '2026-07-21 06:56:36.486777+07', NULL, NULL, NULL, '02bbd63f-bad5-4cc4-9e99-7afb198a09e1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9562, NULL, 958, 8, '2026-07-21 06:56:36.486777+07', NULL, NULL, NULL, '73a61596-9dc3-4944-9ab7-405a2dc66b12', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9563, NULL, 958, 9, '2026-07-21 06:56:36.486777+07', NULL, NULL, NULL, '9afff984-c48f-49e6-b7eb-bfa170ee0fcf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9564, NULL, 958, 10, '2026-07-21 06:56:36.486777+07', NULL, NULL, NULL, 'fbd38eea-1e9f-4de1-aecb-3b04e3c9091f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9565, NULL, 959, 1, '2026-07-21 06:56:36.579212+07', NULL, NULL, NULL, '0c1a928d-aede-4a9d-af6a-2148d55a1ff0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9566, NULL, 959, 2, '2026-07-21 06:56:36.579212+07', NULL, NULL, NULL, 'dcbecef0-b8b2-43d8-af1a-1729485717fc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9567, NULL, 959, 3, '2026-07-21 06:56:36.579212+07', NULL, NULL, NULL, '25eceb18-3694-4b2c-aa84-3894ed39552b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9568, NULL, 959, 4, '2026-07-21 06:56:36.579213+07', NULL, NULL, NULL, 'db83710d-529d-49a8-889c-88609c23d62c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9569, NULL, 959, 5, '2026-07-21 06:56:36.579213+07', NULL, NULL, NULL, '72272aa8-c664-4fb7-bbc7-15ec8e248858', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9570, NULL, 959, 6, '2026-07-21 06:56:36.579213+07', NULL, NULL, NULL, 'c6a040f3-69ad-4e20-9f7b-3a08926158ab', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9571, NULL, 959, 7, '2026-07-21 06:56:36.579213+07', NULL, NULL, NULL, '2e421133-cc3e-44c4-830f-a46e3f638a24', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9572, NULL, 959, 8, '2026-07-21 06:56:36.579213+07', NULL, NULL, NULL, '5aafe409-391f-4b58-9060-55b847cbdd75', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9573, NULL, 959, 9, '2026-07-21 06:56:36.579213+07', NULL, NULL, NULL, 'd517cb57-5cbf-4baf-a931-9d27d6c72a15', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9574, NULL, 959, 10, '2026-07-21 06:56:36.579213+07', NULL, NULL, NULL, 'eb8d9f56-bf90-40e7-80be-183c89ad6e5b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9575, NULL, 960, 1, '2026-07-21 06:56:36.622759+07', NULL, NULL, NULL, 'e6ba2706-e167-4f39-b237-728f0c5b6c44', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9576, NULL, 960, 2, '2026-07-21 06:56:36.62276+07', NULL, NULL, NULL, 'c45d01e9-909b-4152-8f75-124c53c2c086', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9577, NULL, 960, 3, '2026-07-21 06:56:36.62276+07', NULL, NULL, NULL, '24342efb-31bf-4330-95b3-a94fcde6c454', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9578, NULL, 960, 4, '2026-07-21 06:56:36.62276+07', NULL, NULL, NULL, 'cf5c01b8-8344-40f4-8661-293176e87adb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9579, NULL, 960, 5, '2026-07-21 06:56:36.62276+07', NULL, NULL, NULL, 'b6814f7a-d41a-4c78-ad99-a66558b72eb5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9580, NULL, 960, 6, '2026-07-21 06:56:36.62276+07', NULL, NULL, NULL, '8361a5a6-4dc9-4f89-a515-73be27761ae0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9581, NULL, 960, 7, '2026-07-21 06:56:36.622761+07', NULL, NULL, NULL, 'f0608470-e70a-4859-b93e-661e29aa1279', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9582, NULL, 960, 8, '2026-07-21 06:56:36.622761+07', NULL, NULL, NULL, '4cb2de50-b1b0-4d71-baf2-52eb3cbc89fd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9583, NULL, 960, 9, '2026-07-21 06:56:36.622761+07', NULL, NULL, NULL, '6328f047-3ffb-4937-bc1b-614d0584f962', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9584, NULL, 960, 10, '2026-07-21 06:56:36.622761+07', NULL, NULL, NULL, '55c32f4f-0f68-4bf4-917a-58e4f334933e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9585, NULL, 961, 1, '2026-07-21 06:56:36.638151+07', NULL, NULL, NULL, '80c16dfe-51bf-4200-be6a-d221a0d7b928', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9586, NULL, 961, 2, '2026-07-21 06:56:36.638151+07', NULL, NULL, NULL, '6763124f-97e3-4d43-8ac0-fb269451dfbe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9587, NULL, 961, 3, '2026-07-21 06:56:36.638152+07', NULL, NULL, NULL, '20b79c0d-1ea5-4d2d-b787-6e7f5b2ecb1e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9588, NULL, 961, 4, '2026-07-21 06:56:36.638152+07', NULL, NULL, NULL, '883679c2-956b-43cc-bce9-12792c134e14', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9590, NULL, 961, 5, '2026-07-21 06:56:36.638152+07', NULL, NULL, NULL, '50561d99-e446-45be-8a86-c33e1d794f6f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9589, NULL, 962, 1, '2026-07-21 06:56:36.644409+07', NULL, NULL, NULL, '5d5e2e84-c0d5-4b0f-9820-dc67cef260f8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9591, NULL, 961, 6, '2026-07-21 06:56:36.638152+07', NULL, NULL, NULL, 'af491935-5ea0-4833-9b81-648712909a4e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9592, NULL, 962, 2, '2026-07-21 06:56:36.64441+07', NULL, NULL, NULL, '8f2e1bbc-600b-42cb-a043-a88b6f41054a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9593, NULL, 961, 7, '2026-07-21 06:56:36.638152+07', NULL, NULL, NULL, 'da2234a7-5b0a-41fe-852c-eaf2202621df', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9595, NULL, 962, 3, '2026-07-21 06:56:36.64441+07', NULL, NULL, NULL, '55c5210a-45a9-4130-bb59-6b3299946017', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9596, NULL, 961, 8, '2026-07-21 06:56:36.638152+07', NULL, NULL, NULL, '7d55b466-51cd-420f-819e-4d7c6940634e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9597, NULL, 962, 4, '2026-07-21 06:56:36.64441+07', NULL, NULL, NULL, '76dc4219-1d33-4d15-a85b-3c261ee4865b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9598, NULL, 961, 9, '2026-07-21 06:56:36.638152+07', NULL, NULL, NULL, 'a0f6f018-5a64-4a55-ba40-333b5c70a3e0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9600, NULL, 962, 5, '2026-07-21 06:56:36.64441+07', NULL, NULL, NULL, '5c82f771-2d57-4337-ab74-2b4f2fa62be4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9602, NULL, 961, 10, '2026-07-21 06:56:36.638152+07', NULL, NULL, NULL, '16073251-6fbe-4b43-8b17-116fade6633b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9604, NULL, 962, 6, '2026-07-21 06:56:36.64441+07', NULL, NULL, NULL, '666e0319-f818-4c57-ac7b-a22ef7f13bed', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9607, NULL, 962, 7, '2026-07-21 06:56:36.64441+07', NULL, NULL, NULL, '7489e990-dd7f-48c2-bea9-4ad6b5602f9f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9611, NULL, 962, 8, '2026-07-21 06:56:36.644411+07', NULL, NULL, NULL, 'e4de4842-21a6-4921-bba2-4d0253e5aaca', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9613, NULL, 962, 9, '2026-07-21 06:56:36.644411+07', NULL, NULL, NULL, '5a969b03-9be0-4293-a174-271fea3b1262', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9617, NULL, 962, 10, '2026-07-21 06:56:36.644411+07', NULL, NULL, NULL, 'aacae00d-b38e-4c74-8894-89fc42944e87', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9594, NULL, 963, 1, '2026-07-21 06:56:36.646275+07', NULL, NULL, NULL, '01b6d660-7581-4ace-a39d-3048ac44e5d3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9599, NULL, 963, 2, '2026-07-21 06:56:36.646276+07', NULL, NULL, NULL, '0116b308-3d1c-4b93-ad06-a5eb33854c67', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9603, NULL, 963, 3, '2026-07-21 06:56:36.646276+07', NULL, NULL, NULL, '72edd789-098e-43d5-b637-df2bf08d377f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9601, NULL, 964, 1, '2026-07-21 06:56:36.647445+07', NULL, NULL, NULL, '908f08f5-cccf-4aa4-9161-0a4be0a809ec', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9605, NULL, 963, 4, '2026-07-21 06:56:36.646276+07', NULL, NULL, NULL, 'aa053cd9-bac9-44bd-b317-20f79a66199c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9606, NULL, 964, 2, '2026-07-21 06:56:36.647446+07', NULL, NULL, NULL, '535c5f54-b87f-43dd-bc20-aba05f9e73cb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9608, NULL, 963, 5, '2026-07-21 06:56:36.646276+07', NULL, NULL, NULL, '54165d1c-2bf9-40d1-8952-0b5ba8395ffd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9609, NULL, 964, 3, '2026-07-21 06:56:36.647447+07', NULL, NULL, NULL, 'b345f4c7-641f-4234-ba05-9f1bf7dc1ee9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9610, NULL, 963, 6, '2026-07-21 06:56:36.646277+07', NULL, NULL, NULL, '3c8a0bf3-eba3-434e-9776-325f98c1e888', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9612, NULL, 964, 4, '2026-07-21 06:56:36.647447+07', NULL, NULL, NULL, '292d886a-2718-4e2f-82ed-a91025f27067', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9614, NULL, 963, 7, '2026-07-21 06:56:36.646277+07', NULL, NULL, NULL, '5f4d67d7-0a47-45ab-a182-087bb3ca7db1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9615, NULL, 964, 5, '2026-07-21 06:56:36.647447+07', NULL, NULL, NULL, 'e65aa751-863b-4b61-b062-cb2e34177ff6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9616, NULL, 963, 8, '2026-07-21 06:56:36.646277+07', NULL, NULL, NULL, '8d86ddb6-f11e-432b-b3fb-db9e216cd1a6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9618, NULL, 964, 6, '2026-07-21 06:56:36.647447+07', NULL, NULL, NULL, 'fabaf728-7860-4041-8329-8a75e2f7fed3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9619, NULL, 963, 9, '2026-07-21 06:56:36.646277+07', NULL, NULL, NULL, 'f00498a0-db2a-433c-9069-af10cdc988fa', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9620, NULL, 964, 7, '2026-07-21 06:56:36.647447+07', NULL, NULL, NULL, '1c59357c-9614-4078-bd77-e337ffaae218', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9621, NULL, 963, 10, '2026-07-21 06:56:36.646277+07', NULL, NULL, NULL, 'ddd27d0c-2798-4368-8a8b-2aefbad155e3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9622, NULL, 964, 8, '2026-07-21 06:56:36.647447+07', NULL, NULL, NULL, 'b768b80e-164f-4b11-abed-5fbd7a44b937', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9623, NULL, 964, 9, '2026-07-21 06:56:36.647447+07', NULL, NULL, NULL, '6a1989d2-3fe3-42b5-bd75-bacd5f8e69d4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9624, NULL, 964, 10, '2026-07-21 06:56:36.647447+07', NULL, NULL, NULL, 'a0d57bba-3734-4ddd-8dc2-c604d7e9de88', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9625, NULL, 965, 1, '2026-07-21 06:56:36.689897+07', NULL, NULL, NULL, '0f9cb65f-4516-4d86-8604-25204f51eebf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9626, NULL, 965, 2, '2026-07-21 06:56:36.689898+07', NULL, NULL, NULL, '0124fb45-f2ce-43d7-aa00-d143a0288093', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9627, NULL, 965, 3, '2026-07-21 06:56:36.689898+07', NULL, NULL, NULL, '42eabf88-116c-40fb-b8da-06efd62a2979', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9628, NULL, 965, 4, '2026-07-21 06:56:36.689898+07', NULL, NULL, NULL, '4f3ce3d8-514a-44d0-9233-0e06c1398d5a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9629, NULL, 965, 5, '2026-07-21 06:56:36.689898+07', NULL, NULL, NULL, '372bc346-28d2-49bf-90be-8f9f533393b2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9630, NULL, 965, 6, '2026-07-21 06:56:36.689898+07', NULL, NULL, NULL, '23b21517-20f8-4da8-9c04-04006aace254', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9631, NULL, 965, 7, '2026-07-21 06:56:36.689899+07', NULL, NULL, NULL, '16295ef9-2063-400d-8c4f-ab8a06be57b4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9632, NULL, 965, 8, '2026-07-21 06:56:36.689899+07', NULL, NULL, NULL, 'da01e083-be88-4b93-bb43-ec4dd3a08f98', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9633, NULL, 965, 9, '2026-07-21 06:56:36.689899+07', NULL, NULL, NULL, '55a47301-6687-44c9-a5fa-80e93ab3ca03', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9634, NULL, 965, 10, '2026-07-21 06:56:36.689899+07', NULL, NULL, NULL, '8133283b-8d04-4db9-a478-ba6799b922c0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9635, NULL, 966, 1, '2026-07-21 06:56:36.728759+07', NULL, NULL, NULL, '02590627-2df2-45ff-9e1f-dad6b4426d19', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9636, NULL, 966, 2, '2026-07-21 06:56:36.728761+07', NULL, NULL, NULL, '37597145-3266-4638-ac8a-c706e07653fc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9637, NULL, 966, 3, '2026-07-21 06:56:36.728761+07', NULL, NULL, NULL, '9fb4eb82-3544-4ac2-8849-9fc4e9f8fe6c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9638, NULL, 966, 4, '2026-07-21 06:56:36.728762+07', NULL, NULL, NULL, '3c886ec5-a6e2-4ed0-a52e-13a4e4e3174a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9639, NULL, 966, 5, '2026-07-21 06:56:36.728762+07', NULL, NULL, NULL, 'c33a38c2-d3ea-480b-add1-762ee871c042', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9640, NULL, 966, 6, '2026-07-21 06:56:36.728762+07', NULL, NULL, NULL, 'e9bce4fa-0763-46e1-b95b-e718c8273755', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9641, NULL, 966, 7, '2026-07-21 06:56:36.728762+07', NULL, NULL, NULL, '012998df-ec25-4344-8260-98f01593481f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9642, NULL, 966, 8, '2026-07-21 06:56:36.728762+07', NULL, NULL, NULL, 'aa3538af-fc7a-463f-8757-aef63ad322a5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9643, NULL, 966, 9, '2026-07-21 06:56:36.728762+07', NULL, NULL, NULL, '1e6713f5-5309-47ef-a1c1-97fe81fa5bd0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9644, NULL, 966, 10, '2026-07-21 06:56:36.728763+07', NULL, NULL, NULL, '1c83e2bf-5449-42ac-a9bf-f91b98fcddd1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9645, NULL, 967, 1, '2026-07-21 06:56:36.787538+07', NULL, NULL, NULL, 'b4484f1b-7138-40a1-86ba-76ce29c642f0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9646, NULL, 968, 1, '2026-07-21 06:56:36.788093+07', NULL, NULL, NULL, '62604a0a-6a67-40b0-a1b2-cc28e535b97f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9647, NULL, 967, 2, '2026-07-21 06:56:36.787539+07', NULL, NULL, NULL, '3e4b973a-d8ae-4784-b8be-4856821b59e5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9648, NULL, 968, 2, '2026-07-21 06:56:36.788094+07', NULL, NULL, NULL, '5c1d5dde-c14e-4c8f-b605-87e9acf3df4d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9649, NULL, 967, 3, '2026-07-21 06:56:36.787539+07', NULL, NULL, NULL, '472ba328-3bc7-4a7f-ba02-aa72c021e11c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9650, NULL, 968, 3, '2026-07-21 06:56:36.788094+07', NULL, NULL, NULL, '9e191c46-457f-4351-a9ff-89abd3fad437', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9651, NULL, 967, 4, '2026-07-21 06:56:36.787539+07', NULL, NULL, NULL, 'b068da1b-341b-48b7-b0d8-f673e1de9836', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9652, NULL, 968, 4, '2026-07-21 06:56:36.788094+07', NULL, NULL, NULL, 'e3cac717-2498-417b-baba-345be3e4bbea', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9653, NULL, 967, 5, '2026-07-21 06:56:36.787539+07', NULL, NULL, NULL, 'baa8db2a-390f-4db7-a029-ac57e51398dd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9654, NULL, 968, 5, '2026-07-21 06:56:36.788094+07', NULL, NULL, NULL, '88e06975-3845-47be-baa8-d603a3106eeb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9655, NULL, 967, 6, '2026-07-21 06:56:36.78754+07', NULL, NULL, NULL, 'e5806257-62c5-44cd-9776-a373a06dcb90', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9656, NULL, 968, 6, '2026-07-21 06:56:36.788094+07', NULL, NULL, NULL, 'b0e20a60-444a-416f-b864-197d77729c89', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9657, NULL, 967, 7, '2026-07-21 06:56:36.78754+07', NULL, NULL, NULL, '11d35325-189e-4134-9354-d90e261244c8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9658, NULL, 967, 8, '2026-07-21 06:56:36.78754+07', NULL, NULL, NULL, '764cf8a5-beb6-4e9f-87a2-705d0d1d6409', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9659, NULL, 968, 7, '2026-07-21 06:56:36.788094+07', NULL, NULL, NULL, 'cfc05e75-83fb-44df-97ed-c01c277af842', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9660, NULL, 967, 9, '2026-07-21 06:56:36.78754+07', NULL, NULL, NULL, '4b4ef68d-8d71-40c1-b586-2e27fc52bc95', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9661, NULL, 968, 8, '2026-07-21 06:56:36.788094+07', NULL, NULL, NULL, '233bbf26-4c88-447d-88ff-9908e4f2d20e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9662, NULL, 967, 10, '2026-07-21 06:56:36.78754+07', NULL, NULL, NULL, '89c17bf2-ebab-4a85-9692-c0bfbc670c60', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9663, NULL, 968, 9, '2026-07-21 06:56:36.788095+07', NULL, NULL, NULL, '7a98014f-bfaf-41e6-a07a-4487c0bf3323', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9664, NULL, 968, 10, '2026-07-21 06:56:36.788095+07', NULL, NULL, NULL, 'a5984bf0-93fd-4fec-bbe3-a36fcbe327eb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9665, NULL, 969, 1, '2026-07-21 06:56:36.800945+07', NULL, NULL, NULL, '35b2113d-8468-4f1d-b636-ec2a493d8e14', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9666, NULL, 969, 2, '2026-07-21 06:56:36.800946+07', NULL, NULL, NULL, 'e9c15e71-3cfd-4846-9633-a81ecfc98631', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9667, NULL, 969, 3, '2026-07-21 06:56:36.800946+07', NULL, NULL, NULL, 'a4cd5f75-b607-470d-9c3f-9b7424bf6fdc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9668, NULL, 969, 4, '2026-07-21 06:56:36.800946+07', NULL, NULL, NULL, 'c59fc822-a224-45df-b51d-6c76016ccc7f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9669, NULL, 970, 1, '2026-07-21 06:56:36.80232+07', NULL, NULL, NULL, '73e88afe-3f91-4272-b8aa-090d1fab5b6a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9670, NULL, 969, 5, '2026-07-21 06:56:36.800946+07', NULL, NULL, NULL, 'a1cd256e-563c-445d-b91a-af2e33cf8dea', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9671, NULL, 970, 2, '2026-07-21 06:56:36.80232+07', NULL, NULL, NULL, '8e6fe0e4-3744-4cee-a81b-bc9352633d89', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9672, NULL, 969, 6, '2026-07-21 06:56:36.800946+07', NULL, NULL, NULL, '41d9a19b-02d5-4585-82e2-0a5a61492f5a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9673, NULL, 970, 3, '2026-07-21 06:56:36.80232+07', NULL, NULL, NULL, '02531eaa-3b05-4ae6-a77d-e4520a1f19ad', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9674, NULL, 969, 7, '2026-07-21 06:56:36.800946+07', NULL, NULL, NULL, 'dc2205b4-9790-4fbd-85d2-eaa919f4d32f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9675, NULL, 970, 4, '2026-07-21 06:56:36.80232+07', NULL, NULL, NULL, '57d45316-2753-496d-9b92-e979bac40107', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9676, NULL, 969, 8, '2026-07-21 06:56:36.800946+07', NULL, NULL, NULL, 'b989b602-4c84-4138-8551-af49d9597cff', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9677, NULL, 970, 5, '2026-07-21 06:56:36.802321+07', NULL, NULL, NULL, '739f3f16-329f-4785-948d-052fa4ed71c9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9678, NULL, 969, 9, '2026-07-21 06:56:36.800947+07', NULL, NULL, NULL, '62078a90-5324-49c5-bb2f-e092dba42c41', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9679, NULL, 970, 6, '2026-07-21 06:56:36.802321+07', NULL, NULL, NULL, '124dc92a-21fb-4322-b75b-ccb925334ea7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9680, NULL, 969, 10, '2026-07-21 06:56:36.800947+07', NULL, NULL, NULL, '7afebef6-a53d-4a2e-8cbe-9116a878c69d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9681, NULL, 970, 7, '2026-07-21 06:56:36.802321+07', NULL, NULL, NULL, '730fd21b-dce4-43b7-a2a2-9a4eada48d34', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9682, NULL, 970, 8, '2026-07-21 06:56:36.802321+07', NULL, NULL, NULL, '7c5fa3d2-e534-4dad-a204-bb26cec8f0fc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9683, NULL, 970, 9, '2026-07-21 06:56:36.802321+07', NULL, NULL, NULL, 'acaade61-f691-4ce4-9002-032376d22993', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9684, NULL, 970, 10, '2026-07-21 06:56:36.802321+07', NULL, NULL, NULL, 'abdda056-280c-406e-9929-27af0e8d3466', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9685, NULL, 971, 1, '2026-07-21 06:56:36.849481+07', NULL, NULL, NULL, '966c7f5b-3a65-4870-a588-c3d91d000004', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9686, NULL, 971, 2, '2026-07-21 06:56:36.849482+07', NULL, NULL, NULL, '30c4b169-f0be-485e-a827-5ffedb31ca13', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9687, NULL, 971, 3, '2026-07-21 06:56:36.849482+07', NULL, NULL, NULL, '8a94324a-28c2-4d22-acdc-3ff9862b1029', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9688, NULL, 971, 4, '2026-07-21 06:56:36.849482+07', NULL, NULL, NULL, 'b62fbeee-d885-4580-93e0-83b4d927a3a8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9689, NULL, 971, 5, '2026-07-21 06:56:36.849482+07', NULL, NULL, NULL, 'cd2fe1b0-6d04-4bb3-b218-152b7a4154db', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9690, NULL, 971, 6, '2026-07-21 06:56:36.849482+07', NULL, NULL, NULL, '917f1339-0c39-41df-a1b1-0e3533c99747', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9691, NULL, 971, 7, '2026-07-21 06:56:36.849482+07', NULL, NULL, NULL, 'c407bd9d-8be0-4981-a84f-f7b44b147362', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9692, NULL, 971, 8, '2026-07-21 06:56:36.849482+07', NULL, NULL, NULL, 'f7a3e4c0-b5f5-4103-8509-18961d84412f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9693, NULL, 971, 9, '2026-07-21 06:56:36.849483+07', NULL, NULL, NULL, '574824d6-e96a-441b-a26e-3a91f813684c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9694, NULL, 971, 10, '2026-07-21 06:56:36.849483+07', NULL, NULL, NULL, 'f6555935-eee0-454f-89ef-4b073371a142', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9695, NULL, 972, 1, '2026-07-21 06:56:36.8802+07', NULL, NULL, NULL, 'fb9e9196-a00d-48ca-a61c-723086211e3b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9696, NULL, 972, 2, '2026-07-21 06:56:36.880202+07', NULL, NULL, NULL, 'aeb3412e-71e1-48d6-af5e-9f123013b479', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9697, NULL, 972, 3, '2026-07-21 06:56:36.880202+07', NULL, NULL, NULL, '4f07228d-b265-49f2-ba37-fe5316176d07', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9698, NULL, 972, 4, '2026-07-21 06:56:36.880202+07', NULL, NULL, NULL, '3fd37fcf-9111-46ba-ae5f-f8e2e299754c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9699, NULL, 972, 5, '2026-07-21 06:56:36.880202+07', NULL, NULL, NULL, '0f76d4d7-a38f-45b5-b15e-aed78ce6c902', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9700, NULL, 972, 6, '2026-07-21 06:56:36.880202+07', NULL, NULL, NULL, 'f61a9947-4a22-48dd-aa70-bc31edf84ef0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9701, NULL, 972, 7, '2026-07-21 06:56:36.880202+07', NULL, NULL, NULL, 'a23500b7-03ca-4514-981e-37a616bf7bed', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9702, NULL, 972, 8, '2026-07-21 06:56:36.880202+07', NULL, NULL, NULL, '538a74a8-574d-408a-9bce-fee83f410039', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9703, NULL, 972, 9, '2026-07-21 06:56:36.880202+07', NULL, NULL, NULL, 'a4bde86d-141a-497e-ac05-d769c8544945', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9704, NULL, 972, 10, '2026-07-21 06:56:36.880203+07', NULL, NULL, NULL, 'e39b14b0-af2a-49cf-a407-fa04a2651493', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (5, 8807, 1524, 886, 1, '2026-07-21 06:56:31.864908+07', NULL, NULL, '0 1
', 'd765d267-f7ac-4be8-9453-b86797d3fb73', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 9705, NULL, 973, 1, '2026-07-21 06:56:36.903551+07', NULL, NULL, NULL, 'f7c457e5-4326-4611-a140-88ec4f595f54', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9706, NULL, 973, 2, '2026-07-21 06:56:36.903552+07', NULL, NULL, NULL, '047108ab-a209-4fe2-98e4-26ad0f256d97', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9707, NULL, 973, 3, '2026-07-21 06:56:36.903552+07', NULL, NULL, NULL, '3a7f96c7-c4a6-4e57-8de0-313b4a4a0831', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9708, NULL, 973, 4, '2026-07-21 06:56:36.903553+07', NULL, NULL, NULL, '6c47ad68-3158-4f36-9e63-09ee9bc132f2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9709, NULL, 973, 5, '2026-07-21 06:56:36.903553+07', NULL, NULL, NULL, '942c8a9f-06d5-4183-bcce-4e12eec51afc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9710, NULL, 973, 6, '2026-07-21 06:56:36.903553+07', NULL, NULL, NULL, 'f6fa0787-5fee-45d2-a90e-1fad504c8e59', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9711, NULL, 973, 7, '2026-07-21 06:56:36.903553+07', NULL, NULL, NULL, 'fe956d7a-7bff-473c-89df-9e0e694055ec', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9712, NULL, 973, 8, '2026-07-21 06:56:36.903553+07', NULL, NULL, NULL, '2757d699-9a35-404f-b23d-cf1073adeb34', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9713, NULL, 973, 9, '2026-07-21 06:56:36.903553+07', NULL, NULL, NULL, 'a2cc8695-8743-41e2-bf7b-3e7e58ad74e9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9714, NULL, 973, 10, '2026-07-21 06:56:36.903553+07', NULL, NULL, NULL, '06e48409-795b-460b-9f98-6d7cad806ecf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (5, 8726, 1692, 875, 2, '2026-07-21 06:56:31.517681+07', NULL, NULL, '1 2
', '97bdbb6c-8a8d-4c2a-b1d5-e9b8162b6455', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8865, 1224, 889, 1, '2026-07-21 06:56:32.005494+07', NULL, NULL, '0 1
', '9c85fde4-e6e8-4918-a865-4b48f693afe4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 8756, 1008, 879, 1, '2026-07-21 06:56:31.605567+07', NULL, NULL, '0 1
', '059d4507-fc12-454c-b645-2e8c06878076', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8812, 2252, 884, 2, '2026-07-21 06:56:31.865282+07', NULL, NULL, '1 2
', '88a90c90-febd-4775-a6c0-13f7760eb40f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8745, 1932, 877, 1, '2026-07-21 06:56:31.577825+07', NULL, NULL, '0 1
', 'e0e7c51e-af81-40d2-b9c5-889a910416fd', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8795, 1092, 882, 1, '2026-07-21 06:56:31.762633+07', NULL, NULL, '0 1
', '21408901-2286-48a5-9100-231c94f459c9', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8760, 1048, 879, 3, '2026-07-21 06:56:31.605567+07', NULL, NULL, '0 1
', '605deaf1-1a81-4fb5-bf4e-8b5d13b1ae04', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8786, 1160, 881, 2, '2026-07-21 06:56:31.698206+07', NULL, NULL, '1 2
', '22317ef5-30bb-46f0-bcee-47d213b9d398', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8797, 1068, 882, 3, '2026-07-21 06:56:31.762634+07', NULL, NULL, '0 1
', '43f15c85-a7aa-4ce0-bc24-beef8da472cf', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8748, 1064, 877, 4, '2026-07-21 06:56:31.577826+07', NULL, NULL, '1 2
', 'e9bdf489-148a-47dd-9002-243dcf61f76b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8819, 1072, 886, 4, '2026-07-21 06:56:31.864909+07', NULL, NULL, '1 2
', '4ee27b7d-6e95-4b5b-925a-bacc9821e330', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8730, 1032, 875, 6, '2026-07-21 06:56:31.517681+07', NULL, NULL, '1 2
', 'e6d620d7-9fe5-4a2f-ba45-02288f97c960', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8906, 1128, 893, 1, '2026-07-21 06:56:32.27373+07', NULL, NULL, '0 1
', '6a6badde-be3f-4c77-b96d-756eb1e6eda0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 8908, 1072, 894, 2, '2026-07-21 06:56:32.273883+07', NULL, NULL, '1 2
', '21a3222b-ae53-419a-b15c-84d399931853', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8750, 1124, 877, 6, '2026-07-21 06:56:31.577826+07', NULL, NULL, '1 2
', 'd921cccb-33a0-45d1-9e03-64d3f220edd9', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8856, 1068, 888, 2, '2026-07-21 06:56:31.972624+07', NULL, NULL, '1 2
', 'e84f734e-e1eb-4fb7-b102-9f519f2a68fb', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8751, 1068, 877, 7, '2026-07-21 06:56:31.577826+07', NULL, NULL, '3 4
', 'f5f688e3-7c81-4d3c-962b-d1a1ea3aa7b2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8825, 1140, 883, 6, '2026-07-21 06:56:31.864563+07', NULL, NULL, '1 2
', '96c696c8-bd6e-4e75-9a95-b89582b1fe98', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8925, 880, 895, 1, '2026-07-21 06:56:32.387934+07', NULL, NULL, '0 1
', 'd5bf1844-abe7-455d-bd12-e0afeec4f62f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 8767, 908, 878, 7, '2026-07-21 06:56:31.605392+07', NULL, NULL, '3 4
', 'dde52dc6-ca25-47f7-81b8-1cb5847ae3dc', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 8928, 1080, 897, 1, '2026-07-21 06:56:32.389467+07', NULL, NULL, '0 1
', '57aa1df5-f776-4ab1-9dd2-36562436c013', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9717, 5268, 974, 3, '2026-07-21 07:33:57.223652+07', NULL, NULL, '0 1
', 'ce581501-1f7f-49fc-b63a-d627adb1b79b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9718, 6304, 974, 4, '2026-07-21 07:33:57.223653+07', NULL, NULL, '1 2
', '1efff4e3-d682-4313-9958-2160dfdb0c9a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9721, 2296, 974, 7, '2026-07-21 07:33:57.223655+07', NULL, NULL, '3 4
', '57e926b2-ce8f-419d-b557-ec466981e01d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9720, 4184, 974, 6, '2026-07-21 07:33:57.223654+07', NULL, NULL, '1 2
', 'eba6324c-e003-42f0-b45a-948a4b874d47', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9724, 3748, 974, 10, '2026-07-21 07:33:57.223656+07', NULL, NULL, '1 3
', '210fa53a-401c-4bf8-9fa9-8b58d321a38f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9715, 7064, 974, 1, '2026-07-21 07:33:57.223644+07', NULL, NULL, '0 1
', '5d2a02d6-9450-444a-a6e0-fc21d2ecd246', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9723, 2648, 974, 9, '2026-07-21 07:33:57.223656+07', NULL, NULL, '0 3
', '69842074-625b-4082-bac6-8120600b1600', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9719, 5320, 974, 5, '2026-07-21 07:33:57.223654+07', NULL, NULL, '1 2
', '875e4dbf-0c5a-4079-b984-ca8e210ba4a9', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9722, 7324, 974, 8, '2026-07-21 07:33:57.223655+07', NULL, NULL, '2 4
', '564544c1-c1d1-484c-adf6-35a02c12e2d2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9716, 4300, 974, 2, '2026-07-21 07:33:57.223651+07', NULL, NULL, '1 2
', 'e336e285-f999-4599-b408-9353456a981e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9727, 884, 975, 3, '2026-07-21 07:34:25.84375+07', NULL, NULL, '0 1
', 'db75e094-db4c-4438-8ec7-46562226ad50', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9726, 1148, 975, 2, '2026-07-21 07:34:25.843749+07', NULL, NULL, '1 2
', 'c239409d-f4a5-4b3a-b40d-5cbb12f2964f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 9766, NULL, 979, 7, '2026-07-21 07:34:27.401678+07', NULL, NULL, NULL, '6e7d63c2-80c4-45f1-9280-6d14c8a47b09', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9767, NULL, 978, 7, '2026-07-21 07:34:27.401344+07', NULL, NULL, NULL, 'f6829821-6e65-466c-9450-00cca078b569', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9768, NULL, 977, 7, '2026-07-21 07:34:27.40188+07', NULL, NULL, NULL, 'd22417f6-23eb-41e3-be25-cf2b25e99287', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9769, NULL, 976, 8, '2026-07-21 07:34:27.401486+07', NULL, NULL, NULL, '3ab3e3e0-a69f-4d1f-a3c6-a971270248fa', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9770, NULL, 980, 7, '2026-07-21 07:34:27.401343+07', NULL, NULL, NULL, 'd2a69747-7174-4522-8c7f-98545f6b8261', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9771, NULL, 979, 8, '2026-07-21 07:34:27.401679+07', NULL, NULL, NULL, 'a3a85c52-214b-4c98-9c30-ee6a7019ec9d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9772, NULL, 978, 8, '2026-07-21 07:34:27.401346+07', NULL, NULL, NULL, '5a1cc668-37e7-4728-ac3b-329c906eee58', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9773, NULL, 977, 8, '2026-07-21 07:34:27.401881+07', NULL, NULL, NULL, 'aef7a3dd-91aa-4215-90ba-1b35d9c1bed0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9774, NULL, 976, 9, '2026-07-21 07:34:27.401487+07', NULL, NULL, NULL, '44546ad4-e562-43a2-aae4-7ee9bd67b929', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9775, NULL, 980, 8, '2026-07-21 07:34:27.401345+07', NULL, NULL, NULL, '541939bf-6c21-4659-9e04-89db444952c8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9776, NULL, 979, 9, '2026-07-21 07:34:27.40168+07', NULL, NULL, NULL, '99ca9f3e-6844-44cf-8968-9e14efe158d9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9777, NULL, 978, 9, '2026-07-21 07:34:27.401347+07', NULL, NULL, NULL, 'b28b0181-a5ff-4214-9c58-5e8f88ee8d0f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9778, NULL, 977, 9, '2026-07-21 07:34:27.401881+07', NULL, NULL, NULL, 'f39a9cc6-37b1-4ded-919f-42de79d08d47', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9779, NULL, 976, 10, '2026-07-21 07:34:27.401488+07', NULL, NULL, NULL, 'b183a524-4935-4ebb-a202-e608f15d2cfb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9780, NULL, 980, 9, '2026-07-21 07:34:27.401346+07', NULL, NULL, NULL, '7a68f059-9f0f-45a6-875d-6a5f0674ff88', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9781, NULL, 979, 10, '2026-07-21 07:34:27.401681+07', NULL, NULL, NULL, '893e2e8d-affd-476e-a49f-2ba0fe712d05', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9782, NULL, 978, 10, '2026-07-21 07:34:27.401349+07', NULL, NULL, NULL, '611b5122-0ee3-431d-9474-9b7fa0fdafb9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9783, NULL, 977, 10, '2026-07-21 07:34:27.401882+07', NULL, NULL, NULL, '7e1ff5ab-40af-4e9f-a4a4-aa6af7904a64', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9784, NULL, 980, 10, '2026-07-21 07:34:27.401348+07', NULL, NULL, NULL, '26103e65-f7db-426b-974e-30024d42af5a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9789, NULL, 981, 5, '2026-07-21 07:34:27.42135+07', NULL, NULL, NULL, 'ceea44af-1037-4d84-8f02-0966c7ea5e46', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9790, NULL, 981, 6, '2026-07-21 07:34:27.421351+07', NULL, NULL, NULL, 'd4339eb7-5983-47de-ba0a-d7c64af6b783', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9791, NULL, 981, 7, '2026-07-21 07:34:27.421351+07', NULL, NULL, NULL, '350af689-8ad0-4b06-bc3c-2757253f8ee7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9792, NULL, 981, 8, '2026-07-21 07:34:27.421352+07', NULL, NULL, NULL, 'd135a0fa-31dd-4428-b545-f0b04cba1ba4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9793, NULL, 981, 9, '2026-07-21 07:34:27.421353+07', NULL, NULL, NULL, '7784beb0-5515-4955-af13-3e80ed8f0d9d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9794, NULL, 981, 10, '2026-07-21 07:34:27.421353+07', NULL, NULL, NULL, '17390969-6d16-49b5-9bbd-e17bee6797ec', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9801, NULL, 982, 7, '2026-07-21 07:34:27.43346+07', NULL, NULL, NULL, 'b21b90dc-3767-49d2-85f2-7e0c4dddd5fb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9802, NULL, 982, 8, '2026-07-21 07:34:27.433461+07', NULL, NULL, NULL, 'aa7e5e82-1512-4751-8183-44e91abdc575', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9803, NULL, 982, 9, '2026-07-21 07:34:27.433461+07', NULL, NULL, NULL, 'beeb2b6a-2985-40f4-a7fc-e81474112b7f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (7, 9734, 1144, 975, 10, '2026-07-21 07:34:25.843753+07', NULL, NULL, '1 3
', '49995f4e-d93d-442b-a6f4-b00dd8233c59', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9731, 956, 975, 7, '2026-07-21 07:34:25.843751+07', NULL, NULL, '3 4
', 'd63175f2-eedd-472e-864f-beaf7d27681c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9733, 924, 975, 9, '2026-07-21 07:34:25.843752+07', NULL, NULL, '0 3
', 'f1a18a25-789c-4745-9a54-5b9c965073c8', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 9735, 1080, 978, 1, '2026-07-21 07:34:27.401333+07', NULL, NULL, '0 1
', '54da1020-ff09-40a6-8006-2d93af9a6eb1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9730, 1084, 975, 6, '2026-07-21 07:34:25.843751+07', NULL, NULL, '1 2
', '2bbccffa-1db9-4aad-bbc7-4f140a6b30fa', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9736, 1148, 976, 1, '2026-07-21 07:34:27.40148+07', NULL, NULL, '0 1
', 'da359a6a-ec05-472b-aebb-bb3993a72aff', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9795, 1008, 982, 1, '2026-07-21 07:34:27.433454+07', NULL, NULL, '0 1
', 'f77e96bf-d40e-42ba-8d8d-5e3518cfbfe9', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9738, 1084, 977, 1, '2026-07-21 07:34:27.401875+07', NULL, NULL, '0 1
', '661efd11-4819-4bb9-b977-75ec5288d831', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9743, 1064, 977, 2, '2026-07-21 07:34:27.401876+07', NULL, NULL, '1 2
', 'a77283e2-c1af-42ca-a0c4-83dd397e32f7', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9739, 1068, 980, 1, '2026-07-21 07:34:27.40133+07', NULL, NULL, '0 1
', 'b21e0c62-e4a3-436b-bc7b-f3d5d5b9b6d6', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 9742, 1148, 978, 2, '2026-07-21 07:34:27.401336+07', NULL, NULL, '1 2
', '778db6fa-a62d-4188-8856-8217b381046f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9741, 1080, 979, 2, '2026-07-21 07:34:27.401673+07', NULL, NULL, '1 2
', 'bf4fd22f-b16e-4df4-9909-033cd938e807', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9744, 888, 976, 3, '2026-07-21 07:34:27.401483+07', NULL, NULL, '0 1
', 'fc02bced-e391-4dd6-b8d7-0f27db6fa3e2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 9740, 1144, 976, 2, '2026-07-21 07:34:27.401482+07', NULL, NULL, '1 2
', 'dc8731ce-5bfe-431e-80d9-93997e2b2b80', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9785, 1080, 981, 1, '2026-07-21 07:34:27.421346+07', NULL, NULL, '0 1
', 'b8c2531b-b67d-4eb1-b19f-9e67def0aa06', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9749, 1080, 977, 3, '2026-07-21 07:34:27.401877+07', NULL, NULL, '0 1
', '721c177d-ce41-4297-8197-3db98e0c4c81', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9745, 1080, 980, 2, '2026-07-21 07:34:27.401334+07', NULL, NULL, '1 2
', '5c2fccc1-11ae-42c9-a2ca-0bc32e039468', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (12, 9748, 884, 976, 4, '2026-07-21 07:34:27.401484+07', NULL, NULL, '1 2
', '2ea446f3-32a3-4285-a7b1-36b3ca8bd41b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9786, 1152, 981, 2, '2026-07-21 07:34:27.421348+07', NULL, NULL, '1 2
', 'aa76c618-641d-49e6-9e2a-5651275b5f23', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9753, 1024, 977, 4, '2026-07-21 07:34:27.401878+07', NULL, NULL, '1 2
', 'addeaaad-0b13-4a5f-8927-8e6b1a74ec66', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9797, 1036, 982, 3, '2026-07-21 07:34:27.433457+07', NULL, NULL, '0 1
', '07b66009-5899-48e2-a4d2-28310f8149eb', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9754, 1072, 976, 5, '2026-07-21 07:34:27.401484+07', NULL, NULL, '1 2
', 'd62206bd-49e3-4408-97eb-21063d057155', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (12, 9747, 972, 978, 3, '2026-07-21 07:34:27.401337+07', NULL, NULL, '0 1
', 'e7dc4d87-f5b9-4ce3-afa2-c68a784a68c0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9752, 1072, 978, 4, '2026-07-21 07:34:27.401339+07', NULL, NULL, '1 2
', '81adc43d-9528-4794-ac0b-c749902d035a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9787, 1140, 981, 3, '2026-07-21 07:34:27.421349+07', NULL, NULL, '0 1
', '04dea261-ed12-416f-bd73-76034b6bf267', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9750, 904, 980, 3, '2026-07-21 07:34:27.401336+07', NULL, NULL, '0 1
', '89b5e33f-1d3d-408f-98c3-92e9a0560fa1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9758, 1128, 977, 5, '2026-07-21 07:34:27.401879+07', NULL, NULL, '1 2
', '09ddcf34-d874-43da-8439-e9b638cdc080', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9798, 1068, 982, 4, '2026-07-21 07:34:27.433458+07', NULL, NULL, '1 2
', 'eb346358-bf9c-416d-a048-ee05c731aa98', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9757, 1072, 978, 5, '2026-07-21 07:34:27.401341+07', NULL, NULL, '1 2
', 'f47185a4-0eed-40aa-ad7f-950fcd4bd65e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9760, 1140, 980, 5, '2026-07-21 07:34:27.40134+07', NULL, NULL, '1 2
', 'e24fef0d-7adc-4617-97f3-d036e7ab2fd5', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9756, 1080, 979, 5, '2026-07-21 07:34:27.401676+07', NULL, NULL, '1 2
', '729394fb-e73a-4fd2-a78c-a67913808e07', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9764, 1068, 976, 7, '2026-07-21 07:34:27.401485+07', NULL, NULL, '3 4
', '5c56c2a7-dca4-4d1c-899c-0ee39ef9a74c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9799, 1148, 982, 5, '2026-07-21 07:34:27.433459+07', NULL, NULL, '1 2
', 'd87545b4-cc77-4ce2-8915-a780d4f5f92d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9759, 1084, 976, 6, '2026-07-21 07:34:27.401485+07', NULL, NULL, '1 2
', 'c861aebb-9543-4385-a482-e55aead67e88', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9763, 876, 977, 6, '2026-07-21 07:34:27.401879+07', NULL, NULL, '1 2
', '2d048424-657c-4559-8157-c65071386ca5', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9800, 1144, 982, 6, '2026-07-21 07:34:27.433459+07', NULL, NULL, '1 2
', 'f448cfbf-5723-4852-a16b-aeaa22b9bc6d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9762, 916, 978, 6, '2026-07-21 07:34:27.401342+07', NULL, NULL, '1 2
', 'e37e0dd0-f035-48b5-a54a-a48abf1e3582', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9765, 1024, 980, 6, '2026-07-21 07:34:27.401341+07', NULL, NULL, '1 2
', '7c8a8c90-c4f8-4af4-ba12-71394c7f8fc2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9761, 1148, 979, 6, '2026-07-21 07:34:27.401677+07', NULL, NULL, '1 2
', '95bccdcf-dc5e-4153-944b-e24750189824', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 9804, NULL, 982, 10, '2026-07-21 07:34:27.433462+07', NULL, NULL, NULL, 'df8be9a7-e9cb-415b-9a9b-bc55e8e191f4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9813, NULL, 983, 9, '2026-07-21 07:34:27.578106+07', NULL, NULL, NULL, 'af403a62-7943-40c0-966e-8c20040820ed', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9814, NULL, 983, 10, '2026-07-21 07:34:27.578107+07', NULL, NULL, NULL, '5ae25219-02ff-4432-bdbc-b493ab2307d5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9821, NULL, 984, 4, '2026-07-21 07:34:27.921387+07', NULL, NULL, NULL, '22f90ed6-5004-433b-97ac-330eca767fec', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9823, NULL, 984, 5, '2026-07-21 07:34:27.921388+07', NULL, NULL, NULL, 'ceabbb83-e875-4361-8043-7956b243f113', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9824, NULL, 985, 5, '2026-07-21 07:34:27.921861+07', NULL, NULL, NULL, 'b5455856-9f15-4718-bf19-acef38859110', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9826, NULL, 984, 6, '2026-07-21 07:34:27.921389+07', NULL, NULL, NULL, '77525091-bd31-4cd9-a5d5-28eda1e3b995', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9827, NULL, 985, 6, '2026-07-21 07:34:27.921862+07', NULL, NULL, NULL, '244565e0-d671-4a28-9aa9-95decf505973', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9828, NULL, 984, 7, '2026-07-21 07:34:27.921389+07', NULL, NULL, NULL, 'd34f0679-0996-4eb0-86d5-5d5917bc2628', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9830, NULL, 985, 7, '2026-07-21 07:34:27.921864+07', NULL, NULL, NULL, '377eb819-df30-4d6c-a152-c340d31fd380', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9831, NULL, 984, 8, '2026-07-21 07:34:27.92139+07', NULL, NULL, NULL, 'd4eb12cb-1d9d-424f-bef7-4f8e22aa6b41', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9833, NULL, 985, 8, '2026-07-21 07:34:27.921864+07', NULL, NULL, NULL, 'be88b035-ef2a-41ba-bcf0-e27e1c2abbab', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9838, NULL, 986, 5, '2026-07-21 07:34:27.926531+07', NULL, NULL, NULL, '6aebc9bd-b96d-4b85-8857-39eb1d541965', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9840, NULL, 986, 6, '2026-07-21 07:34:27.926532+07', NULL, NULL, NULL, '1601baf5-4017-465c-8f09-b6402b37ebfe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9841, NULL, 986, 7, '2026-07-21 07:34:27.926532+07', NULL, NULL, NULL, '0578d523-1d74-42e8-85ab-cbdc7cf56857', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9848, NULL, 987, 4, '2026-07-21 07:34:27.934972+07', NULL, NULL, NULL, '0c5f214e-affd-4969-aad4-5f140e6d96bf', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9849, NULL, 987, 5, '2026-07-21 07:34:27.934989+07', NULL, NULL, NULL, '3474107a-8aac-4c42-a144-98e933a2b73a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9850, NULL, 987, 6, '2026-07-21 07:34:27.934992+07', NULL, NULL, NULL, '2a52806c-73ff-490b-bbb2-7e6f9399241e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9851, NULL, 987, 7, '2026-07-21 07:34:27.934993+07', NULL, NULL, NULL, 'ae211916-80c3-4730-bbf4-4b5dca95a06e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9859, NULL, 988, 5, '2026-07-21 07:34:27.976523+07', NULL, NULL, NULL, '752bee82-4ed7-41a7-8b78-c5804f2775a7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9860, NULL, 988, 6, '2026-07-21 07:34:27.976524+07', NULL, NULL, NULL, 'ff57e683-725c-4ad7-8a97-1cdc793c6af4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9861, NULL, 988, 7, '2026-07-21 07:34:27.976525+07', NULL, NULL, NULL, '15b32553-9f2f-4f7b-89ab-73e39f558630', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9862, NULL, 988, 8, '2026-07-21 07:34:27.976525+07', NULL, NULL, NULL, '0781e865-ee9a-47f3-9b8d-7b98f00c6abe', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9868, NULL, 989, 4, '2026-07-21 07:34:27.997389+07', NULL, NULL, NULL, '513bf9df-380c-4b3e-ab7a-722a6f14069a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9869, NULL, 989, 5, '2026-07-21 07:34:27.99739+07', NULL, NULL, NULL, '15ff24d9-b2d5-44e6-8ab0-53a42513731e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9870, NULL, 989, 6, '2026-07-21 07:34:27.99739+07', NULL, NULL, NULL, '0ac86b10-3830-4a35-a583-8dbf368595c6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9871, NULL, 989, 7, '2026-07-21 07:34:27.997391+07', NULL, NULL, NULL, 'df530f2d-b446-4548-9b2b-51daa06779bc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (6, 9855, 1140, 988, 1, '2026-07-21 07:34:27.976515+07', NULL, NULL, '0 1
', 'b8ee1226-1808-416d-af96-89af19db5373', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9805, 1140, 983, 1, '2026-07-21 07:34:27.578099+07', NULL, NULL, '0 1
', '904d76b9-477a-41b7-b6ec-85c3aed025b6', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9816, 928, 985, 1, '2026-07-21 07:34:27.921856+07', NULL, NULL, '0 1
', '056ab4cc-183a-46fe-a75e-493915467484', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9856, 932, 988, 2, '2026-07-21 07:34:27.976517+07', NULL, NULL, '1 2
', '27a37095-8d32-4434-9666-4212a3e378b5', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9815, 1076, 984, 1, '2026-07-21 07:34:27.921382+07', NULL, NULL, '0 1
', '4f5620be-b792-47c1-8fd7-489cffaa23ce', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9809, 1100, 983, 5, '2026-07-21 07:34:27.578104+07', NULL, NULL, '1 2
', '223e71ee-69df-4eba-8d10-82a4860f1740', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (9, 9808, 1040, 983, 4, '2026-07-21 07:34:27.578103+07', NULL, NULL, '1 2
', '855e46aa-98a3-4c29-8650-c94e08703216', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 9825, 1152, 986, 1, '2026-07-21 07:34:27.926526+07', NULL, NULL, '0 1
', '4cf64228-edcd-4329-8c35-c878c0d94c4c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9876, 868, 991, 1, '2026-07-21 07:34:28.027275+07', NULL, NULL, '0 1
', '3e95214a-bc70-4ae3-af40-cda58dac6f3e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9875, 1024, 990, 1, '2026-07-21 07:34:28.024969+07', NULL, NULL, '0 1
', '16f1235b-b2da-44e4-9c58-f2bf5c062511', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9865, 1092, 989, 1, '2026-07-21 07:34:27.997386+07', NULL, NULL, '0 1
', '7e9809c8-f8c4-4332-a9a6-8a83e26adb5a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9818, 1148, 985, 2, '2026-07-21 07:34:27.921859+07', NULL, NULL, '1 2
', '01a0a9c6-3a66-4656-bedd-43e2d46225d1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9829, 1140, 986, 2, '2026-07-21 07:34:27.926528+07', NULL, NULL, '1 2
', '41092951-8ef5-4c3f-a2f1-7da558837eed', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9817, 1172, 984, 2, '2026-07-21 07:34:27.921385+07', NULL, NULL, '1 2
', '44293baa-dd91-4ddd-b5c5-1bbf3955303e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9846, 904, 987, 2, '2026-07-21 07:34:27.934971+07', NULL, NULL, '1 2
', 'c5c36dbf-aa64-4fd2-873e-3b1fbac04e39', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9857, 1076, 988, 3, '2026-07-21 07:34:27.976522+07', NULL, NULL, '0 1
', '45495a1b-e2ed-437f-8654-41fb9bd6ff56', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (9, 9866, 1112, 989, 2, '2026-07-21 07:34:27.997388+07', NULL, NULL, '1 2
', 'c5724a31-41ef-458f-97a6-fcd1a2e80fc8', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9847, 1060, 987, 3, '2026-07-21 07:34:27.934972+07', NULL, NULL, '0 1
', 'aca1d3b7-c102-4fc6-b0e1-774248987e21', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9858, 1080, 988, 4, '2026-07-21 07:34:27.976523+07', NULL, NULL, '1 2
', '0ce51513-3036-4c19-8421-185f9b436852', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9832, 916, 986, 3, '2026-07-21 07:34:27.926529+07', NULL, NULL, '0 1
', 'a731adc3-66f9-432d-99d1-9babc6e0c0a2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9877, 936, 990, 2, '2026-07-21 07:34:28.024971+07', NULL, NULL, '1 2
', '0f66f5ea-6303-43d4-b1d2-9f37fb7d6e2f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9811, 912, 983, 7, '2026-07-21 07:34:27.578105+07', NULL, NULL, '3 4
', '57cbd127-710d-4244-89d8-cc8019f20b2a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9820, 1064, 985, 3, '2026-07-21 07:34:27.92186+07', NULL, NULL, '0 1
', '978ef890-d38d-44f9-836a-f169a510c44a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9867, 908, 989, 3, '2026-07-21 07:34:27.997388+07', NULL, NULL, '0 1
', '423470bf-2214-492e-8552-bf979521529f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9835, 1192, 986, 4, '2026-07-21 07:34:27.92653+07', NULL, NULL, '1 2
', '0998a4c4-8b05-448f-b0b8-98c76d4772e1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9822, 956, 985, 4, '2026-07-21 07:34:27.921861+07', NULL, NULL, '1 2
', '56196715-3b5f-4002-ac05-5a0e88a5f607', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9812, 1088, 983, 8, '2026-07-21 07:34:27.578106+07', NULL, NULL, '2 4
', '84e33343-cfbf-4251-8e87-c1db6e007b7d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9872, 884, 989, 8, '2026-07-21 07:34:27.997392+07', NULL, NULL, '2 4
', 'b3ba625f-ea88-4b14-a043-91706da6a65d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (3, 9839, 1220, 985, 10, '2026-07-21 07:34:27.921866+07', NULL, NULL, '1 3
', '825786f6-1231-48ac-a27d-b7ab12a1fdf0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 9842, 1092, 986, 8, '2026-07-21 07:34:27.926545+07', NULL, NULL, '2 4
', '16683c62-0c13-4579-ac05-7fbafe3bd589', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9853, 1060, 987, 9, '2026-07-21 07:34:27.934994+07', NULL, NULL, '0 3
', '7e205c14-d289-4618-aad7-ce473afba449', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9837, 932, 984, 10, '2026-07-21 07:34:27.921392+07', NULL, NULL, '1 3
', 'b6c04cb0-2f66-439c-8fc9-e56094584aa6', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9854, 1048, 987, 10, '2026-07-21 07:34:27.934995+07', NULL, NULL, '1 3
', '487e3755-1131-4087-9203-f4d9a522663f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9845, 1072, 986, 10, '2026-07-21 07:34:27.926548+07', NULL, NULL, '1 3
', '819c854f-f013-41f5-a713-47b2997b4d31', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9863, 1128, 988, 9, '2026-07-21 07:34:27.976526+07', NULL, NULL, '0 3
', 'a5fb3efc-48e7-4271-8d15-95dc63e35c82', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (3, 9843, 1112, 986, 9, '2026-07-21 07:34:27.926547+07', NULL, NULL, '0 3
', '57024112-b092-48fa-9a20-96d40ec10907', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9873, 908, 989, 9, '2026-07-21 07:34:27.997392+07', NULL, NULL, '0 3
', 'dfe1be95-b30c-4c46-b21d-8fd6d410e3cd', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (2, 9834, 1108, 984, 9, '2026-07-21 07:34:27.921392+07', NULL, NULL, '0 3
', '293ee4c1-0167-408c-83ff-e78e31ff56ae', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9874, 912, 989, 10, '2026-07-21 07:34:27.997393+07', NULL, NULL, '1 3
', 'f240ca9a-80ac-4eb4-bd5b-5b0e9f556bfd', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 9879, NULL, 990, 3, '2026-07-21 07:34:28.024972+07', NULL, NULL, NULL, 'dcb64c16-4b90-425e-adb6-75a6df76fff7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9881, NULL, 990, 4, '2026-07-21 07:34:28.024973+07', NULL, NULL, NULL, '92df3f92-317b-41f8-aa72-7e504b83ce90', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9883, NULL, 990, 5, '2026-07-21 07:34:28.024973+07', NULL, NULL, NULL, '84a379f3-bde2-493e-b3bb-6c5b7c0e0dc0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9885, NULL, 990, 6, '2026-07-21 07:34:28.024974+07', NULL, NULL, NULL, '7ea6d735-ff7b-4b38-a876-22d4a12aba54', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (7, 9889, 1068, 990, 8, '2026-07-21 07:34:28.024975+07', NULL, NULL, '2 4
', '01d851d3-5fdd-48c9-8070-fda58eb44fec', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9887, 1064, 990, 7, '2026-07-21 07:34:28.024974+07', NULL, NULL, '3 4
', '183467e8-accf-422a-9ac7-13afbacda3b1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 9891, 908, 990, 9, '2026-07-21 07:34:28.024975+07', NULL, NULL, '0 3
', 'a895a84d-7a92-4826-97d6-51a8939512fa', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9893, 1100, 990, 10, '2026-07-21 07:34:28.024976+07', NULL, NULL, '1 3
', '270d21f8-8dc1-41b8-a7ce-93e0d25c342f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 9882, NULL, 991, 4, '2026-07-21 07:34:28.027279+07', NULL, NULL, NULL, 'e82b99ee-c07d-409e-ba3b-0dab8e2d33d5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9884, NULL, 991, 5, '2026-07-21 07:34:28.027279+07', NULL, NULL, NULL, '08e330cf-eca4-43fb-a9d7-6d31c10ebc78', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9886, NULL, 991, 6, '2026-07-21 07:34:28.02728+07', NULL, NULL, NULL, 'f33c3fda-a5bc-4d30-96a5-eb68958d6ecb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9897, NULL, 992, 3, '2026-07-21 07:34:28.050338+07', NULL, NULL, NULL, 'f649b423-d4fd-4c34-93b2-5f27f8615f4b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9898, NULL, 992, 4, '2026-07-21 07:34:28.050338+07', NULL, NULL, NULL, 'aadc5ded-6292-4017-98b4-d75d9f66d5f0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9899, NULL, 992, 5, '2026-07-21 07:34:28.050339+07', NULL, NULL, NULL, '18cec482-0c5d-47e6-b1e9-1c9a456c2b82', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9901, NULL, 992, 6, '2026-07-21 07:34:28.050339+07', NULL, NULL, NULL, 'b319326c-987e-4f6c-bcf4-225891251be4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9904, NULL, 993, 3, '2026-07-21 07:34:28.054717+07', NULL, NULL, NULL, '3c4648e7-b476-4f6a-a178-d0fa59479345', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9906, NULL, 993, 4, '2026-07-21 07:34:28.054718+07', NULL, NULL, NULL, '72c74c0f-1e92-46d6-8b31-081c96c7a6ea', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9908, NULL, 993, 5, '2026-07-21 07:34:28.054718+07', NULL, NULL, NULL, '6610e021-c6f3-4a3c-8b2b-cfb2d014ed49', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9918, NULL, 994, 4, '2026-07-21 07:34:28.059141+07', NULL, NULL, NULL, '366fd7c1-f2dd-40ff-996a-068c085bbc2c', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9919, NULL, 994, 5, '2026-07-21 07:34:28.059141+07', NULL, NULL, NULL, '56d146aa-2b88-462d-9e99-f04061dc83a9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9920, NULL, 994, 6, '2026-07-21 07:34:28.059142+07', NULL, NULL, NULL, 'cc64447f-d741-47cf-9e11-22ad6e98c678', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (7, 9895, 1044, 992, 1, '2026-07-21 07:34:28.050335+07', NULL, NULL, '0 1
', '0a04aff0-0722-4e46-b923-623f83589e9b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9911, 996, 994, 1, '2026-07-21 07:34:28.059138+07', NULL, NULL, '0 1
', '4fbfa284-14af-4be1-9daf-d223ef3d7789', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9896, 1092, 992, 2, '2026-07-21 07:34:28.050337+07', NULL, NULL, '1 2
', 'a72bd664-cfe8-4447-902f-7068752f9150', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9914, 1060, 994, 2, '2026-07-21 07:34:28.05914+07', NULL, NULL, '1 2
', 'c7912962-de2e-4471-8e41-223193721768', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9900, 1144, 993, 1, '2026-07-21 07:34:28.054715+07', NULL, NULL, '0 1
', '9dc23659-2374-47dc-a24d-a8d71989cd5b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9880, 1076, 991, 3, '2026-07-21 07:34:28.027278+07', NULL, NULL, '0 1
', 'c398f179-081b-4362-8bd4-735c638f9456', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9916, 1076, 994, 3, '2026-07-21 07:34:28.05914+07', NULL, NULL, '0 1
', '72012005-19b2-4a53-a1df-0ac94b382d74', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9902, 916, 993, 2, '2026-07-21 07:34:28.054716+07', NULL, NULL, '1 2
', '6963dd42-4832-4586-8e4a-bf2987371c81', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (3, 9890, 1388, 991, 8, '2026-07-21 07:34:28.027281+07', NULL, NULL, '2 4
', '6c9532d3-1bbd-4042-89ab-cff828302c4d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9912, 1068, 993, 7, '2026-07-21 07:34:28.054719+07', NULL, NULL, '3 4
', '0a8a2b64-e262-4416-b782-957e00ecbb31', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 9888, 1116, 991, 7, '2026-07-21 07:34:28.02728+07', NULL, NULL, '3 4
', 'a07eae17-74e1-4736-9e1f-9d951ede1d41', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 9910, 1108, 993, 6, '2026-07-21 07:34:28.054719+07', NULL, NULL, '1 2
', '4a25ab7a-51de-4f1f-b470-252029e46114', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9905, 1072, 992, 8, '2026-07-21 07:34:28.05034+07', NULL, NULL, '2 4
', '3e2a49de-8971-4c62-ab7f-378add3927b7', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9921, 1112, 994, 7, '2026-07-21 07:34:28.059142+07', NULL, NULL, '3 4
', '9766a18e-4264-437b-b8af-ca4d42124103', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 9903, 1132, 992, 7, '2026-07-21 07:34:28.05034+07', NULL, NULL, '3 4
', 'b3d98d08-a3cf-47a2-bb71-0fe44c26eed5', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9892, 908, 991, 9, '2026-07-21 07:34:28.027281+07', NULL, NULL, '0 3
', '617c45e1-32d2-4bc0-9ae2-b4c2877de792', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (9, 9922, 1072, 994, 8, '2026-07-21 07:34:28.059143+07', NULL, NULL, '2 4
', 'f43d3ff1-3f65-4cd5-a97b-b368f2c06f53', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9913, 1100, 993, 8, '2026-07-21 07:34:28.05472+07', NULL, NULL, '2 4
', '6ecf04b6-9925-4595-8136-61e43372c745', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9909, 1076, 992, 10, '2026-07-21 07:34:28.050341+07', NULL, NULL, '1 3
', '9d9083d5-3981-4fb3-947e-6848a044cc3c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9915, 1100, 993, 9, '2026-07-21 07:34:28.05472+07', NULL, NULL, '0 3
', 'd5b86498-c2e7-4653-95c1-4b985235f38b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9907, 1088, 992, 9, '2026-07-21 07:34:28.050341+07', NULL, NULL, '0 3
', 'da83a790-ba18-467a-9fdf-89b2ec6a1168', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 9917, 1100, 993, 10, '2026-07-21 07:34:28.054721+07', NULL, NULL, '1 3
', '53bac482-2669-48e2-b04c-b58226f1ff47', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 9894, 1100, 991, 10, '2026-07-21 07:34:28.027282+07', NULL, NULL, '1 3
', 'd8402f45-6240-4045-8f30-b46c8036785a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (3, 9924, 1136, 994, 10, '2026-07-21 07:34:28.059144+07', NULL, NULL, '1 3
', 'a1eebcfe-ec84-4df0-8faa-af4d79745e52', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9923, 1068, 994, 9, '2026-07-21 07:34:28.059143+07', NULL, NULL, '0 3
', '841e78cd-2649-484d-972f-8ae81f2f4131', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 9728, 1080, 975, 4, '2026-07-21 07:34:25.84375+07', NULL, NULL, '1 2
', '9fdd02de-3500-48bf-ade1-7d2ca82d5c0e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 9732, 932, 975, 8, '2026-07-21 07:34:25.843752+07', NULL, NULL, '2 4
', 'd4422816-e4ac-48c8-86db-ddc9e9010cd4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9725, 1148, 975, 1, '2026-07-21 07:34:25.843748+07', NULL, NULL, '0 1
', 'd79d4004-cdb9-44e0-81c0-71b0ed20d656', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9806, 920, 983, 2, '2026-07-21 07:34:27.578101+07', NULL, NULL, '1 2
', '78e5c068-847e-47f0-a6ae-04ffbacddd7d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9844, 1092, 987, 1, '2026-07-21 07:34:27.934969+07', NULL, NULL, '0 1
', '916dc6c3-24f4-46c2-8186-43b6ed799443', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9737, 1052, 979, 1, '2026-07-21 07:34:27.401671+07', NULL, NULL, '0 1
', 'db3dd954-d845-4a56-9fd1-2ef0185e8919', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9810, 936, 983, 6, '2026-07-21 07:34:27.578104+07', NULL, NULL, '1 2
', 'e1eb0cdd-62fc-4e96-a787-1c45e9ae9560', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9746, 1020, 979, 3, '2026-07-21 07:34:27.401674+07', NULL, NULL, '0 1
', '544b5dc0-09a7-4a07-90a0-0b6d37a5ea6c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9751, 1028, 979, 4, '2026-07-21 07:34:27.401675+07', NULL, NULL, '1 2
', 'da267b7b-41f5-4fdd-a66e-84e0ac02d305', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9788, 880, 981, 4, '2026-07-21 07:34:27.421349+07', NULL, NULL, '1 2
', '725cc39a-4b17-45c3-adc9-9fa21a25a804', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9807, 1140, 983, 3, '2026-07-21 07:34:27.578102+07', NULL, NULL, '0 1
', 'd7b1264a-a184-4541-9463-04680280da7f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9729, 1152, 975, 5, '2026-07-21 07:34:25.843751+07', NULL, NULL, '1 2
', '8e5ddd53-c7d0-423d-9aaf-f9d9c24a095a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9796, 872, 982, 2, '2026-07-21 07:34:27.433456+07', NULL, NULL, '1 2
', '3837d6c2-99b4-425c-9d64-b83422326324', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 9878, 924, 991, 2, '2026-07-21 07:34:28.027277+07', NULL, NULL, '1 2
', 'c5cf81ae-fefd-430e-bce4-6d2df54e2ec5', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9819, 888, 984, 3, '2026-07-21 07:34:27.921386+07', NULL, NULL, '0 1
', '707a45fd-8187-44c4-a3a8-b8fc53276abc', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9755, 1140, 980, 4, '2026-07-21 07:34:27.401338+07', NULL, NULL, '1 2
', 'f0cb175c-7a93-4c60-9e72-66fb634d604a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9836, 1072, 985, 9, '2026-07-21 07:34:27.921865+07', NULL, NULL, '0 3
', 'c272615e-911c-4dab-ab0b-2c648ec52a7f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (3, 9852, 1196, 987, 8, '2026-07-21 07:34:27.934994+07', NULL, NULL, '2 4
', '35ac2753-a374-4e68-a9f6-dfcab003dc8f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9864, 1104, 988, 10, '2026-07-21 07:34:27.976527+07', NULL, NULL, '1 3
', '858fa755-2584-4a2a-a3bd-a527c9266926', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9932, 1096, 995, 8, '2026-07-21 07:43:28.434566+07', NULL, NULL, '2 4
', 'c5f07daf-1e24-4cbc-ae95-134bd7f3555f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9929, 1096, 995, 5, '2026-07-21 07:43:28.434564+07', NULL, NULL, '1 2
', '2a9913cc-9aee-4251-bdb0-50dbf610e084', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 9933, 1100, 995, 9, '2026-07-21 07:43:28.434566+07', NULL, NULL, '0 3
', 'e497105c-4763-450a-a9ee-06acae214114', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 9926, 1064, 995, 2, '2026-07-21 07:43:28.434562+07', NULL, NULL, '1 2
', 'a6edaa98-8bcb-43ad-b7de-78d38c8631ef', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (9, 9934, 1092, 995, 10, '2026-07-21 07:43:28.434567+07', NULL, NULL, '1 3
', 'ca13b3e0-9c19-431b-8331-1e487bc26128', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9931, 1012, 995, 7, '2026-07-21 07:43:28.434565+07', NULL, NULL, '3 4
', 'd5253b35-3cc0-43d3-91c1-a0317dc015b4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 9930, 1092, 995, 6, '2026-07-21 07:43:28.434565+07', NULL, NULL, '1 2
', 'f36e9722-a6ac-4ad3-ae16-72f128d72582', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9925, 1068, 995, 1, '2026-07-21 07:43:28.434555+07', NULL, NULL, '0 1
', '6dbbe1f3-1a1b-4a8f-9f5c-2ce67ae1a9c1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9927, 1068, 995, 3, '2026-07-21 07:43:28.434563+07', NULL, NULL, '0 1
', '75e8527f-973d-46e3-b399-feacd06fd2fe', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 9928, 1080, 995, 4, '2026-07-21 07:43:28.434564+07', NULL, NULL, '1 2
', 'f19eb2ea-d20d-4c55-a3e6-c6a728c36b72', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 9952, NULL, 997, 7, '2026-07-21 07:58:25.480407+07', NULL, NULL, NULL, 'a4ee5834-9fff-42b7-a415-5b40820e80c1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9953, NULL, 998, 6, '2026-07-21 07:58:25.483893+07', NULL, NULL, NULL, 'a3810963-adc0-42c4-9281-bfd5f91ac26a', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9954, NULL, 996, 7, '2026-07-21 07:58:25.480281+07', NULL, NULL, NULL, '1b320ec9-cc8c-4507-b68d-bb97f15b4397', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9955, NULL, 998, 7, '2026-07-21 07:58:25.483894+07', NULL, NULL, NULL, '9b223892-6d56-44b1-83de-6bf8eca0e507', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9956, NULL, 997, 8, '2026-07-21 07:58:25.480408+07', NULL, NULL, NULL, '22cc644e-32c4-4afd-8631-dfc76bc57699', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9957, NULL, 996, 8, '2026-07-21 07:58:25.480281+07', NULL, NULL, NULL, '8786bbb4-a09b-4e26-91cb-44740a952fd7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9958, NULL, 998, 8, '2026-07-21 07:58:25.483894+07', NULL, NULL, NULL, '3031759b-f0e0-4367-b5c5-12b2f0b7c480', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9959, NULL, 997, 9, '2026-07-21 07:58:25.480408+07', NULL, NULL, NULL, 'ffc517c4-6d3a-4ad5-8c3f-004e7d17c94e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9960, NULL, 998, 9, '2026-07-21 07:58:25.483894+07', NULL, NULL, NULL, '97174943-2fd6-49cd-a6fa-e8710f797352', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9961, NULL, 996, 9, '2026-07-21 07:58:25.480282+07', NULL, NULL, NULL, '09391b41-4549-4001-95f7-ed289a583b6d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9962, NULL, 997, 10, '2026-07-21 07:58:25.480409+07', NULL, NULL, NULL, '3eb73322-89e5-4e8b-bb46-213711ad0762', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9963, NULL, 996, 10, '2026-07-21 07:58:25.480282+07', NULL, NULL, NULL, 'c2ecae39-2f26-4dcc-8611-aca96c301747', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9965, NULL, 998, 10, '2026-07-21 07:58:25.483895+07', NULL, NULL, NULL, '6755d5e4-ec85-44e3-9747-b87ad9eac9a3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (7, 9950, 1080, 996, 6, '2026-07-21 07:58:25.48028+07', NULL, NULL, '1 2
', 'b5e76fb1-e23e-4ece-a1f5-660b6de36c38', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 9975, NULL, 999, 6, '2026-07-21 07:58:25.505577+07', NULL, NULL, NULL, '71709a27-9929-4723-9185-798d005dab4b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (18, 10030, 1740, 1008, 1, '2026-07-21 07:58:25.683525+07', NULL, NULL, '0 1
', '9701621b-db19-44ed-84c9-b7e58baedc92', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9936, 3552, 997, 1, '2026-07-21 07:58:25.480404+07', NULL, NULL, '0 1
', 'd8a9ee59-a434-44af-ae17-8ca06faa921f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (13, 9939, 1644, 998, 1, '2026-07-21 07:58:25.48389+07', NULL, NULL, '0 1
', '3290ad68-2d91-4492-8b30-703bd08099fe', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9935, 1248, 996, 1, '2026-07-21 07:58:25.480267+07', NULL, NULL, '0 1
', 'a4a4993e-299f-432a-a53e-0b38e4a04c28', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9967, 2588, 1000, 1, '2026-07-21 07:58:25.506828+07', NULL, NULL, '0 1
', '980341e0-1c73-4aea-b034-a7e2ea72d55a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 9943, 1076, 998, 2, '2026-07-21 07:58:25.483892+07', NULL, NULL, '1 2
', '674c0d63-6433-4b17-9020-dd58a861ec33', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9964, 1092, 999, 1, '2026-07-21 07:58:25.505573+07', NULL, NULL, '0 1
', 'b9d9e733-f699-4a49-8532-5d064748b134', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (11, 9969, 884, 1000, 2, '2026-07-21 07:58:25.506829+07', NULL, NULL, '1 2
', 'cc8c58e4-7b68-4a09-8214-070e9c9493e4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (12, 10005, 1080, 1003, 1, '2026-07-21 07:58:25.541107+07', NULL, NULL, '0 1
', 'b18283d6-2b67-445c-82de-bb43c85bd4c2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9938, 972, 996, 2, '2026-07-21 07:58:25.480278+07', NULL, NULL, '1 2
', 'e0b3352d-f6b8-4b8d-9400-4de575dac079', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 9966, 1092, 999, 2, '2026-07-21 07:58:25.505575+07', NULL, NULL, '1 2
', '1a2ad630-5107-4b76-909d-e75d00eeac12', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9945, 972, 998, 3, '2026-07-21 07:58:25.483892+07', NULL, NULL, '0 1
', 'b20d1952-5ba4-445c-a4a3-4a1a44d8ffba', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9937, 1148, 997, 2, '2026-07-21 07:58:25.480405+07', NULL, NULL, '1 2
', 'b0cedb19-0231-4fd1-9d38-ddedbc01c7a4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9974, 916, 1001, 1, '2026-07-21 07:58:25.512142+07', NULL, NULL, '0 1
', '9cb3269f-b6e5-4200-bcaf-f2556a7bc02f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9978, 884, 1001, 2, '2026-07-21 07:58:25.512144+07', NULL, NULL, '1 2
', '4fbcad61-83d8-4a68-a0cf-d72fa811f7d4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9971, 1148, 1000, 3, '2026-07-21 07:58:25.50683+07', NULL, NULL, '0 1
', 'ba77de11-83ce-46bc-84cc-2de599928749', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9941, 1036, 996, 3, '2026-07-21 07:58:25.480279+07', NULL, NULL, '0 1
', 'ae2b436c-a341-415b-a1f3-9095482cdf8c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10048, 1024, 1011, 3, '2026-07-21 07:58:25.684272+07', NULL, NULL, '0 1
', '3a93dc7e-8931-4955-8cfe-c5cbd07d590b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9948, 1072, 998, 4, '2026-07-21 07:58:25.483892+07', NULL, NULL, '1 2
', '733457c3-c99d-4811-9750-0c537fddd2e8', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (9, 9973, 880, 1000, 4, '2026-07-21 07:58:25.50683+07', NULL, NULL, '1 2
', '4f32a17b-ef52-415e-b49c-07b3860d9574', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9940, 1032, 997, 3, '2026-07-21 07:58:25.480406+07', NULL, NULL, '0 1
', '2429ef3b-b966-4f57-a5a2-a712608d3114', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9942, 896, 997, 4, '2026-07-21 07:58:25.480406+07', NULL, NULL, '1 2
', '81f9dd06-1a8c-4056-890a-290b3db1ec03', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9944, 1020, 996, 4, '2026-07-21 07:58:25.480279+07', NULL, NULL, '1 2
', '9af15e14-da3c-474a-859b-3d4f0a92131d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 9968, 1088, 999, 3, '2026-07-21 07:58:25.505575+07', NULL, NULL, '0 1
', 'b8b46ba9-96cb-473b-8db0-a079d8faae8d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9970, 1092, 999, 4, '2026-07-21 07:58:25.505576+07', NULL, NULL, '1 2
', '581beeba-abe9-4298-acc4-6314a7f2a15f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 9951, 1072, 998, 5, '2026-07-21 07:58:25.483893+07', NULL, NULL, '1 2
', 'f7c30cc3-80fc-41eb-b420-e049667e05b9', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9976, 884, 1000, 5, '2026-07-21 07:58:25.506831+07', NULL, NULL, '1 2
', 'ca648437-7c44-47a5-ad93-7a7a00b4d017', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9986, 1072, 1001, 5, '2026-07-21 07:58:25.512146+07', NULL, NULL, '1 2
', '23529324-c191-42d5-ac2f-c7d1bb7cc98e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 9946, 1064, 997, 5, '2026-07-21 07:58:25.480407+07', NULL, NULL, '1 2
', '80f4ca23-238c-4789-b15e-3508f923073a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9947, 1040, 996, 5, '2026-07-21 07:58:25.48028+07', NULL, NULL, '1 2
', '3d0efa08-2945-4aed-8b05-af9bca7dda36', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9949, 876, 997, 6, '2026-07-21 07:58:25.480407+07', NULL, NULL, '1 2
', '72e359ff-1e6f-459c-adb1-69cd864edc9f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 9977, NULL, 999, 7, '2026-07-21 07:58:25.505577+07', NULL, NULL, NULL, '08f72e1a-6983-4a0e-83a5-27eacfd0a8ab', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9981, NULL, 999, 8, '2026-07-21 07:58:25.505578+07', NULL, NULL, NULL, '9b2948b6-2df1-4ff6-ad19-f44aeabc5efc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9984, NULL, 999, 9, '2026-07-21 07:58:25.505578+07', NULL, NULL, NULL, 'eddc3817-f6d7-48f1-92d1-cc86a43b6e55', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9987, NULL, 999, 10, '2026-07-21 07:58:25.505578+07', NULL, NULL, NULL, '8c4730d7-dc49-45e3-9837-47f372fde46b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9979, NULL, 1000, 6, '2026-07-21 07:58:25.506831+07', NULL, NULL, NULL, '65db62ce-299e-4e11-875c-48cc0d1e59f8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9982, NULL, 1000, 7, '2026-07-21 07:58:25.506832+07', NULL, NULL, NULL, '4d5b96da-1bea-44a6-8942-f7c0e316cc2b', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9985, NULL, 1000, 8, '2026-07-21 07:58:25.506832+07', NULL, NULL, NULL, 'cc0e8b1b-92c6-4211-b9ea-5b1d8e8e0cb6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9988, NULL, 1000, 9, '2026-07-21 07:58:25.506832+07', NULL, NULL, NULL, '1244cd18-228f-476d-86c3-1aa2107c6fcb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (3, 9989, 1124, 1000, 10, '2026-07-21 07:58:25.506833+07', NULL, NULL, '1 3
', 'd8f62f87-6486-44f5-b411-d4aafd4a0ed8', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (3, 10024, 1224, 1004, 10, '2026-07-21 07:58:25.558705+07', NULL, NULL, '1 3
', 'cd7dbd88-5250-4a35-966d-7b018617232d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 9990, NULL, 1001, 6, '2026-07-21 07:58:25.512147+07', NULL, NULL, NULL, 'fff9ef23-58a7-4e76-8e16-e53bb8edde69', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9991, NULL, 1001, 7, '2026-07-21 07:58:25.512147+07', NULL, NULL, NULL, '54dd226f-9c8b-46fd-8a03-d068c18fcac6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9993, NULL, 1001, 8, '2026-07-21 07:58:25.512147+07', NULL, NULL, NULL, '7c5e86aa-86b7-4b7b-92a5-49f4964338aa', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 9995, NULL, 1001, 9, '2026-07-21 07:58:25.512148+07', NULL, NULL, NULL, 'da99d43e-61c4-4d4b-a58e-acc9524d006d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (4, 9998, 1064, 1001, 10, '2026-07-21 07:58:25.512149+07', NULL, NULL, '1 3
', 'c9c0b31e-410e-4fb1-bf2b-8833977794c4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (3, 10014, 1144, 1003, 10, '2026-07-21 07:58:25.541112+07', NULL, NULL, '1 3
', '450d3bd3-872f-4f3a-aa6b-b60bd763f72a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 10000, NULL, 1002, 6, '2026-07-21 07:58:25.523314+07', NULL, NULL, NULL, 'c418381b-6a86-4867-bd8b-5c6ff6f30cad', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10001, NULL, 1002, 7, '2026-07-21 07:58:25.523314+07', NULL, NULL, NULL, 'ed1ea5e9-00bd-4620-94c7-dab48e2f83f8', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10002, NULL, 1002, 8, '2026-07-21 07:58:25.523315+07', NULL, NULL, NULL, '2345875f-f750-4166-842e-cc3d8c8c61aa', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10003, NULL, 1002, 9, '2026-07-21 07:58:25.523315+07', NULL, NULL, NULL, 'c7a967ce-2603-4df1-a8a3-672ce04c9719', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (3, 10004, 1116, 1002, 10, '2026-07-21 07:58:25.523316+07', NULL, NULL, '1 3
', '0f8955db-0428-4a2e-adc0-fff2be3b453f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 10009, NULL, 1003, 5, '2026-07-21 07:58:25.54111+07', NULL, NULL, NULL, 'fd50eaf7-fea3-4a4d-ab6e-9b3b25ddf1d5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10010, NULL, 1003, 6, '2026-07-21 07:58:25.541111+07', NULL, NULL, NULL, '1dce258b-6300-470e-88ee-b6d1298163a6', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10011, NULL, 1003, 7, '2026-07-21 07:58:25.541111+07', NULL, NULL, NULL, '11d961c7-1fda-4d1d-b951-ef8990904b2e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10012, NULL, 1003, 8, '2026-07-21 07:58:25.541111+07', NULL, NULL, NULL, '13053973-3137-4455-83ec-d035041e032e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10013, NULL, 1003, 9, '2026-07-21 07:58:25.541112+07', NULL, NULL, NULL, '43e240ce-7c73-4eea-ad4c-3258d9f39475', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10021, NULL, 1004, 7, '2026-07-21 07:58:25.558704+07', NULL, NULL, NULL, 'fe12e518-a67f-47f8-9fe8-846999b7eace', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10022, NULL, 1004, 8, '2026-07-21 07:58:25.558704+07', NULL, NULL, NULL, '44d2303f-38a2-48e2-a558-043036490028', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10023, NULL, 1004, 9, '2026-07-21 07:58:25.558705+07', NULL, NULL, NULL, 'ae7caaff-d814-44c4-8a1e-b97e599cd2a7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10055, NULL, 1009, 5, '2026-07-21 07:58:25.683209+07', NULL, NULL, NULL, '3619a28a-0791-4aad-9598-d3e5060d8fb5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10062, NULL, 1010, 6, '2026-07-21 07:58:25.683294+07', NULL, NULL, NULL, '9d32085a-a963-4134-8da4-be0840a4d8b0', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (13, 10032, 12820, 1010, 2, '2026-07-21 07:58:25.683292+07', NULL, NULL, '1 2
', '8962d1de-6df9-47c4-a797-729cf6420493', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10035, 1132, 1007, 2, '2026-07-21 07:58:25.683455+07', NULL, NULL, '1 2
', 'a0c5b958-2b81-432e-a4bf-b9f043e3e076', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (16, 10016, 1872, 1004, 2, '2026-07-21 07:58:25.558702+07', NULL, NULL, '1 2
', 'f3a3171f-fc7a-41ab-b01a-490e343a5fed', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10027, 3084, 1009, 1, '2026-07-21 07:58:25.683207+07', NULL, NULL, '0 1
', '837f2ead-f87f-4f85-a239-f2e8e6dee8b8', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (31, 10043, 1076, 1006, 3, '2026-07-21 07:58:25.682853+07', NULL, NULL, '0 1
', 'c6fafb06-10d3-42a7-ad5d-fd6d4462d258', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (14, 10034, 1576, 1005, 2, '2026-07-21 07:58:25.682715+07', NULL, NULL, '1 2
', 'f61fc315-9563-4176-a9e8-64bf96ed3e14', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10033, 1648, 1011, 1, '2026-07-21 07:58:25.684271+07', NULL, NULL, '0 1
', 'a93e65ea-5281-4020-bcde-8fa3f3f57adf', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 10028, 1700, 1007, 1, '2026-07-21 07:58:25.683454+07', NULL, NULL, '0 1
', 'f44b3b39-2be9-4a9e-9f41-12ce946223c3', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10025, 1768, 1005, 1, '2026-07-21 07:58:25.682714+07', NULL, NULL, '0 1
', '665f688d-153b-48fe-a33e-c9fd19516958', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (11, 10039, 1104, 1011, 2, '2026-07-21 07:58:25.684272+07', NULL, NULL, '1 2
', '45314f07-6a3f-40c3-bc0e-1c7d71aac28b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (13, 10029, 2904, 1006, 1, '2026-07-21 07:58:25.682852+07', NULL, NULL, '0 1
', '0ef6bd96-56b1-4616-908d-62b8da605bc2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (20, 10036, 2592, 1006, 2, '2026-07-21 07:58:25.682853+07', NULL, NULL, '1 2
', '47e74160-2df8-4295-aace-e4e323c5d88a', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (9, 10037, 1088, 1008, 2, '2026-07-21 07:58:25.683527+07', NULL, NULL, '1 2
', '5353aa10-4d79-47df-91e8-f231023102ad', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (17, 10018, 1072, 1004, 4, '2026-07-21 07:58:25.558703+07', NULL, NULL, '1 2
', '8b73f971-43d2-4882-8141-bd6a302ce90e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10031, 1076, 1009, 2, '2026-07-21 07:58:25.683208+07', NULL, NULL, '1 2
', 'c7890f31-79ae-493b-af31-b8fe3e291805', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (11, 10017, 1120, 1004, 3, '2026-07-21 07:58:25.558702+07', NULL, NULL, '0 1
', 'a271aee4-1f5c-4550-b4f3-b5abf0114131', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10050, 1020, 1006, 4, '2026-07-21 07:58:25.682854+07', NULL, NULL, '1 2
', '4dcb6ab4-38c3-4474-8dcf-94527fe6dc82', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9992, 1084, 1002, 1, '2026-07-21 07:58:25.52331+07', NULL, NULL, '0 1
', '12180229-ba86-4b33-97d8-73e219f7b055', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10006, 928, 1003, 2, '2026-07-21 07:58:25.541109+07', NULL, NULL, '1 2
', '4cb86fd8-6af5-4234-b426-38abf6df3d49', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10047, 1160, 1007, 4, '2026-07-21 07:58:25.683456+07', NULL, NULL, '1 2
', 'b050001d-0c6d-4437-9e0a-3d21a0d71207', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10040, 1028, 1010, 3, '2026-07-21 07:58:25.683293+07', NULL, NULL, '0 1
', '3babacf0-65d7-4642-8f65-ab5db39b8881', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10044, 1024, 1005, 3, '2026-07-21 07:58:25.682716+07', NULL, NULL, '0 1
', 'bd7b26da-f4b5-4674-8c6f-22ee48b4672b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (23, 9980, 868, 1001, 3, '2026-07-21 07:58:25.512145+07', NULL, NULL, '0 1
', '251368b1-372f-491b-998a-dcc32d953924', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9994, 988, 1002, 2, '2026-07-21 07:58:25.523312+07', NULL, NULL, '1 2
', '45363be5-65df-4b83-867a-a7c1244774ca', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10042, 1036, 1008, 3, '2026-07-21 07:58:25.683527+07', NULL, NULL, '0 1
', '09ed62f3-54f5-42c0-a921-e149b3a737dc', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10052, 928, 1011, 4, '2026-07-21 07:58:25.684273+07', NULL, NULL, '1 2
', 'dc5af4f4-3598-4f78-98c3-d7259f437d06', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9996, 1064, 1002, 3, '2026-07-21 07:58:25.523313+07', NULL, NULL, '0 1
', 'b00d02fa-528f-46d2-bf30-ea60c8389f96', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10054, 996, 1007, 5, '2026-07-21 07:58:25.683456+07', NULL, NULL, '1 2
', '4883ca0a-e3de-42a1-b726-ff399506e217', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10019, 1076, 1004, 5, '2026-07-21 07:58:25.558703+07', NULL, NULL, '1 2
', '0f45dda1-19ad-4fb8-a191-3cf3b767fea1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9983, 1132, 1001, 4, '2026-07-21 07:58:25.512146+07', NULL, NULL, '1 2
', '4962878e-0ae3-4d7f-9d68-73f3d33f4982', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (12, 10007, 920, 1003, 3, '2026-07-21 07:58:25.54111+07', NULL, NULL, '0 1
', 'a8981b32-2eea-4f9a-85bf-b254dfd11619', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10046, 1032, 1010, 4, '2026-07-21 07:58:25.683293+07', NULL, NULL, '1 2
', 'c2307a82-5656-4ad8-980d-f35516a102a3', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10058, 1064, 1006, 5, '2026-07-21 07:58:25.682854+07', NULL, NULL, '1 2
', 'cd3a74ed-6612-4bee-8b37-65ae744cd5ab', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10051, 1064, 1005, 4, '2026-07-21 07:58:25.682717+07', NULL, NULL, '1 2
', '7b0fb946-e895-4c0f-8a7a-8af3eff26428', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10045, 1064, 1009, 4, '2026-07-21 07:58:25.683209+07', NULL, NULL, '1 2
', 'f0ce6653-f539-4ce6-bcfa-66ba5d296b8c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10059, 1132, 1011, 5, '2026-07-21 07:58:25.684273+07', NULL, NULL, '1 2
', '07eb76fc-823a-4f3a-847a-8ba9ac28dd0e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (14, 10061, 1136, 1007, 6, '2026-07-21 07:58:25.683456+07', NULL, NULL, '1 2
', 'fb6f082e-2e20-4b59-8ab1-d03ef518fd95', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10056, 880, 1005, 5, '2026-07-21 07:58:25.682717+07', NULL, NULL, '1 2
', '71f829ba-1928-4f22-a6b0-acb23fbe4f07', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10020, 948, 1004, 6, '2026-07-21 07:58:25.558704+07', NULL, NULL, '1 2
', 'fa30952b-f8e4-4c5e-a22b-1d4e95dbf780', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10049, 1072, 1008, 4, '2026-07-21 07:58:25.683528+07', NULL, NULL, '1 2
', 'b65fea10-833c-4c9f-8085-1afb25e1d522', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10008, 920, 1003, 4, '2026-07-21 07:58:25.54111+07', NULL, NULL, '1 2
', 'a9d8dba0-8d6c-49d7-b433-41c8331ab16d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10053, 920, 1010, 5, '2026-07-21 07:58:25.683294+07', NULL, NULL, '1 2
', '563b307c-3e49-492b-a1d0-3ad49c761361', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10057, 1020, 1008, 5, '2026-07-21 07:58:25.683528+07', NULL, NULL, '1 2
', '03013442-6156-4f9d-9a49-ebca7f9285b2', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 10095, NULL, 1012, 6, '2026-07-21 07:58:25.687097+07', NULL, NULL, NULL, '1d6313b0-a4cf-4eee-b681-d92cb990b6cb', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10101, NULL, 1012, 7, '2026-07-21 07:58:25.687098+07', NULL, NULL, NULL, 'd827c8e7-88ea-4949-bb4e-330bd6c4373d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10102, NULL, 1012, 8, '2026-07-21 07:58:25.687098+07', NULL, NULL, NULL, '7e96eeb8-526c-4503-8576-dc582ee2874e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (10, 10060, 2108, 1012, 1, '2026-07-21 07:58:25.687094+07', NULL, NULL, '0 1
', 'bfaba632-d4b1-4f0e-9aea-40d049c94c13', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (12, 10070, 1044, 1012, 2, '2026-07-21 07:58:25.687095+07', NULL, NULL, '1 2
', '1f148749-880e-42ed-9f09-cba1db2cdd1c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10074, 940, 1012, 3, '2026-07-21 07:58:25.687096+07', NULL, NULL, '0 1
', '554418ff-fa65-4423-87a7-0a65f6ef41cf', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10078, 1072, 1012, 4, '2026-07-21 07:58:25.687096+07', NULL, NULL, '1 2
', '5f4318cf-f3ea-4a36-9a1b-4ee59d32b3ac', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10088, 1072, 1012, 5, '2026-07-21 07:58:25.687097+07', NULL, NULL, '1 2
', '1dd2af06-58a4-4c10-851e-ebdbff118750', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (14, 10103, 1068, 1012, 9, '2026-07-21 07:58:25.687098+07', NULL, NULL, '0 3
', 'fe3a38df-42ff-468d-9b57-c695bde23a7b', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (22, 10104, 908, 1012, 10, '2026-07-21 07:58:25.687099+07', NULL, NULL, '1 3
', '5cc6f80e-0e68-4699-83e8-e1d180298dc0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 10067, NULL, 1011, 6, '2026-07-21 07:58:25.684273+07', NULL, NULL, NULL, '3bacd275-5b49-484b-b2f0-e601b2880568', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10071, NULL, 1011, 7, '2026-07-21 07:58:25.684274+07', NULL, NULL, NULL, '330a9281-9a43-4fad-a50d-1568ba86eb88', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10064, NULL, 1005, 6, '2026-07-21 07:58:25.682718+07', NULL, NULL, NULL, '736b8245-c880-41cb-bebf-2d2763f3578d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10077, NULL, 1011, 8, '2026-07-21 07:58:25.684274+07', NULL, NULL, NULL, '04db1f47-e357-4ad3-98aa-c0329223a85d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10081, NULL, 1005, 7, '2026-07-21 07:58:25.682718+07', NULL, NULL, NULL, '41e7ddcd-4136-4200-992e-c26e49db17cd', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10083, NULL, 1011, 9, '2026-07-21 07:58:25.684275+07', NULL, NULL, NULL, '3da72cce-7f87-4abb-a334-26c48cede6ff', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10086, NULL, 1005, 8, '2026-07-21 07:58:25.682719+07', NULL, NULL, NULL, 'c126bc86-7a30-4451-95dc-bcfa06706df7', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (20, 10092, 1084, 1005, 9, '2026-07-21 07:58:25.682719+07', NULL, NULL, '0 3
', '2ecade19-b0a6-4cf8-8244-0ef9e09c28eb', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10090, 1080, 1011, 10, '2026-07-21 07:58:25.684275+07', NULL, NULL, '1 3
', '0463cead-5801-4fdb-9b52-eb3fb0593869', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 10098, 1104, 1005, 10, '2026-07-21 07:58:25.68272+07', NULL, NULL, '1 3
', 'f073e0fa-2708-4485-bed0-b5b456f09091', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 10068, NULL, 1007, 7, '2026-07-21 07:58:25.683457+07', NULL, NULL, NULL, '5cd8a24b-fab6-4c0b-99e6-ede796d5a0e3', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10072, NULL, 1007, 8, '2026-07-21 07:58:25.683457+07', NULL, NULL, NULL, 'b639f335-8da8-4ec4-be3d-2e9c46967905', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10065, NULL, 1008, 6, '2026-07-21 07:58:25.683528+07', NULL, NULL, NULL, '8d84a27c-a513-4e00-98bc-393f27b034ad', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10076, NULL, 1007, 9, '2026-07-21 07:58:25.683458+07', NULL, NULL, NULL, '5ffe84e0-9f08-4ac4-9704-4d5e798abe23', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10080, NULL, 1008, 7, '2026-07-21 07:58:25.683529+07', NULL, NULL, NULL, 'fce27cea-6801-48a6-9b26-b7b0f39ddcc5', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10087, NULL, 1008, 8, '2026-07-21 07:58:25.683529+07', NULL, NULL, NULL, '45f66420-ce6c-45b2-9f27-2a6fe52541a9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (9, 10093, 1020, 1008, 9, '2026-07-21 07:58:25.68353+07', NULL, NULL, '0 3
', 'eeb0b0e3-9250-4b96-a845-771cfd2d214d', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (9, 10084, 1064, 1007, 10, '2026-07-21 07:58:25.683458+07', NULL, NULL, '1 3
', '9815b5bf-c364-4661-a94c-d0b78ca68ddf', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (9, 10097, 908, 1008, 10, '2026-07-21 07:58:25.68353+07', NULL, NULL, '1 3
', 'aee00b97-006f-473d-979c-38b9fc5bf1f8', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 10069, NULL, 1010, 7, '2026-07-21 07:58:25.683295+07', NULL, NULL, NULL, '48653d70-0864-4a82-996d-af90701a778e', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10073, NULL, 1010, 8, '2026-07-21 07:58:25.683301+07', NULL, NULL, NULL, 'eec27288-c861-43bf-b1bb-bd4fda2776f4', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10075, NULL, 1010, 9, '2026-07-21 07:58:25.683302+07', NULL, NULL, NULL, 'bdf303e2-ead2-4010-96ed-94f02c600435', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10091, NULL, 1006, 8, '2026-07-21 07:58:25.682855+07', NULL, NULL, NULL, 'a04aa28b-1699-4ea4-bd51-6425e0dc020f', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10096, NULL, 1006, 9, '2026-07-21 07:58:25.682856+07', NULL, NULL, NULL, '6cfb55c0-dec2-4acf-9c6c-995b9538f0cc', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (7, 10015, 2856, 1004, 1, '2026-07-21 07:58:25.5587+07', NULL, NULL, '0 1
', '6dfab760-b1c1-438f-80b1-23ee514b3f29', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10026, 1884, 1010, 1, '2026-07-21 07:58:25.683291+07', NULL, NULL, '0 1
', '2a70dd72-92e2-4017-9a19-b1c217c38bf8', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10041, 1084, 1007, 3, '2026-07-21 07:58:25.683455+07', NULL, NULL, '0 1
', '9311096d-a027-4f9a-b6ea-8cdab61e2996', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 10038, 888, 1009, 3, '2026-07-21 07:58:25.683209+07', NULL, NULL, '0 1
', 'd5c2be3e-91ae-4c98-b225-3c0cc5eeae8c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (9, 10066, 1028, 1006, 6, '2026-07-21 07:58:25.682855+07', NULL, NULL, '1 2
', 'd69050b8-e7eb-449f-810e-2d9f033b0129', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (10, 9997, 916, 1002, 4, '2026-07-21 07:58:25.523313+07', NULL, NULL, '1 2
', '562ef96a-5d38-4181-a994-853086912cf4', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 9999, 1036, 1002, 5, '2026-07-21 07:58:25.523314+07', NULL, NULL, '1 2
', '7e292078-c48e-4b18-a537-ecfd148a0e76', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10082, 1080, 1006, 7, '2026-07-21 07:58:25.682855+07', NULL, NULL, '3 4
', 'a4086e7b-3ea1-4ef5-bfd7-4c5359a90f72', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 9972, 1072, 999, 5, '2026-07-21 07:58:25.505576+07', NULL, NULL, '1 2
', 'e97f79f5-8bc9-4dda-8aa2-78f91754aa1c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (12, 10100, 1064, 1006, 10, '2026-07-21 07:58:25.682856+07', NULL, NULL, '1 3
', 'ff3a0e79-5fc9-4f79-ab8f-32b6bfb9d650', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10085, 1076, 1010, 10, '2026-07-21 07:58:25.683302+07', NULL, NULL, '1 3
', '93ab1054-e441-4d0f-b74e-3beffa49366e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 10114, NULL, 1013, 5, '2026-07-21 07:58:25.72989+07', NULL, NULL, NULL, 'b5b340d5-bd5b-4542-8770-fbacd100cbab', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10116, NULL, 1013, 6, '2026-07-21 07:58:25.72989+07', NULL, NULL, NULL, 'e9295067-cf8f-4ac3-9c6d-4f117bd596d1', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10118, NULL, 1013, 7, '2026-07-21 07:58:25.729891+07', NULL, NULL, NULL, '40ff2ebe-92d5-4601-a25b-2a6b79cde260', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10120, NULL, 1013, 8, '2026-07-21 07:58:25.729891+07', NULL, NULL, NULL, '522e0977-b690-4b2b-9053-8ce04ca260be', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (7, 10106, 3064, 1013, 1, '2026-07-21 07:58:25.729887+07', NULL, NULL, '0 1
', 'f46557c3-b02a-43eb-bf5a-dc23d849c882', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10108, 964, 1013, 2, '2026-07-21 07:58:25.729888+07', NULL, NULL, '1 2
', 'fee6f913-4366-49c3-9f84-5c1f623c7777', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10110, 1076, 1013, 3, '2026-07-21 07:58:25.729889+07', NULL, NULL, '0 1
', '1ab44e8e-b821-48e1-b64e-bcffcaed59ec', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (9, 10112, 1136, 1013, 4, '2026-07-21 07:58:25.729889+07', NULL, NULL, '1 2
', '270bfb29-2e4b-478f-9661-6c930f8b94c8', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10122, 1096, 1013, 9, '2026-07-21 07:58:25.729891+07', NULL, NULL, '0 3
', 'a2dc5853-33bf-4a1f-aa15-8c2e42ae25d3', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 10124, 1096, 1013, 10, '2026-07-21 07:58:25.729892+07', NULL, NULL, '1 3
', 'a8b4b8c5-bc6e-422f-8ff6-e4c1f76052f1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 10113, NULL, 1014, 5, '2026-07-21 07:58:25.729889+07', NULL, NULL, NULL, '57804b4c-0f93-4927-80c0-ffc1c845fe91', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10115, NULL, 1014, 6, '2026-07-21 07:58:25.729889+07', NULL, NULL, NULL, 'f66a7208-effc-466e-a986-99af7318c96d', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10117, NULL, 1014, 7, '2026-07-21 07:58:25.729889+07', NULL, NULL, NULL, 'a4c7ee56-aa27-415a-9ca5-631747f818c9', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (22, 10105, 1084, 1014, 1, '2026-07-21 07:58:25.729886+07', NULL, NULL, '0 1
', 'a4cf7b61-0305-4dda-9173-24aa260dac42', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10107, 1064, 1014, 2, '2026-07-21 07:58:25.729887+07', NULL, NULL, '1 2
', 'ecf2917c-1800-4bf0-8011-258f9d1e165c', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (15, 10109, 1084, 1014, 3, '2026-07-21 07:58:25.729888+07', NULL, NULL, '0 1
', '6f6aae8d-0342-4cb6-9d86-b10d4312a5c0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10111, 1080, 1014, 4, '2026-07-21 07:58:25.729888+07', NULL, NULL, '1 2
', 'c7f28295-321b-43f7-94b2-75abafbf14ee', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 10119, 1100, 1014, 8, '2026-07-21 07:58:25.72989+07', NULL, NULL, '2 4
', '57b3c7bb-85a1-47ef-9206-f52b16eeb345', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10121, 1296, 1014, 9, '2026-07-21 07:58:25.72989+07', NULL, NULL, '0 3
', '899ff21f-725a-4f46-866c-bc5a94e603f9', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 10123, 1100, 1014, 10, '2026-07-21 07:58:25.729891+07', NULL, NULL, '1 3
', 'd99d843c-a5cb-42b8-9388-a3df477d74f7', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 10129, NULL, 1015, 5, '2026-07-21 07:58:25.739087+07', NULL, NULL, NULL, '46600421-71ce-4ae0-b10d-d83316bcad19', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10130, NULL, 1015, 6, '2026-07-21 07:58:25.739087+07', NULL, NULL, NULL, '9bdfb79e-8680-4ada-9187-32054d2d3493', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (7, 10125, 4048, 1015, 1, '2026-07-21 07:58:25.739084+07', NULL, NULL, '0 1
', '878cfbd4-ba9b-4bb4-ad04-e458c80b0f1f', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10126, 1076, 1015, 2, '2026-07-21 07:58:25.739085+07', NULL, NULL, '1 2
', '2a73f2bd-c265-41fe-b3cd-f8d6cdae67b0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (7, 10127, 912, 1015, 3, '2026-07-21 07:58:25.739086+07', NULL, NULL, '0 1
', '23775b4c-bfad-451d-a196-38389bc260ac', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (6, 10128, 1140, 1015, 4, '2026-07-21 07:58:25.739086+07', NULL, NULL, '1 2
', 'e66a67b1-75db-4793-98ce-0dbb8ef4a256', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 10131, 1136, 1015, 7, '2026-07-21 07:58:25.739087+07', NULL, NULL, '3 4
', 'c02d5fff-5ffc-4750-9b74-cbd527c95bfb', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (8, 10132, 880, 1015, 8, '2026-07-21 07:58:25.739088+07', NULL, NULL, '2 4
', 'd1aabc4c-7de1-4d1d-adda-6d98ccc5e9d1', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (5, 10134, 1328, 1015, 10, '2026-07-21 07:58:25.739088+07', NULL, NULL, '1 3
', 'be53ae37-2819-4ee1-8104-bafd2b72396e', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (4, 10133, 1096, 1015, 9, '2026-07-21 07:58:25.739088+07', NULL, NULL, '0 3
', '3a3637fa-61bd-494d-b7bb-cc44b827c4e0', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (NULL, 10063, NULL, 1009, 6, '2026-07-21 07:58:25.68321+07', NULL, NULL, NULL, '29b33931-77a0-45d5-9819-b8c2efcaebb2', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10079, NULL, 1009, 7, '2026-07-21 07:58:25.68321+07', NULL, NULL, NULL, '7ae6ab57-b6f3-4e05-86ac-e586954d1508', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (NULL, 10089, NULL, 1009, 8, '2026-07-21 07:58:25.683211+07', NULL, NULL, NULL, 'a8be285b-9959-43de-98ce-595cdc404b33', 'PENDING');
INSERT INTO public.problem_submission_details VALUES (2, 10094, 1104, 1009, 9, '2026-07-21 07:58:25.683211+07', NULL, NULL, '0 3
', '792f3f99-c3ad-464d-bd3f-ef6e5ae191bb', 'ACCEPTED');
INSERT INTO public.problem_submission_details VALUES (12, 10099, 1168, 1009, 10, '2026-07-21 07:58:25.683211+07', NULL, NULL, '1 3
', '158a8080-a690-496c-be2b-e7cde1a57145', 'ACCEPTED');


--
-- Data for Name: problem_submissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.problem_submissions VALUES (NULL, NULL, 874, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.455625+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 875, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.454683+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 876, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.455336+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 877, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.453739+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 878, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.581629+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 879, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.453759+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 880, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.466326+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 881, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.463735+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 882, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.622156+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 883, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.466326+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 884, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.463914+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 885, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.454154+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 886, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.498307+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 887, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.544412+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 888, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.781699+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 889, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.455746+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 890, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.82795+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 891, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.964094+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 892, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.738782+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 893, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.70618+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 894, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.662112+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 895, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.006135+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 896, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.868247+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 897, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:30.915724+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 898, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.361209+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 924, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.813865+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 899, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.536361+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 900, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.616944+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 901, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.576181+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 923, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.93924+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 926, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.093032+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 928, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.006395+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 947, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:34.653395+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 902, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.883701+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 925, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.191603+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 903, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.711928+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 930, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.191428+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 904, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.88386+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 905, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.534419+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 922, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.223897+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 934, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.347153+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 946, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:34.54965+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 906, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.885008+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 932, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.456019+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 907, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.621322+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 931, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.456147+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 908, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.777478+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 935, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.455924+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 909, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.678131+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 927, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.455977+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 910, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.884013+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 911, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.981328+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 912, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.869333+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 933, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.476677+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 936, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.586499+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 938, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.623581+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 913, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.239221+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 929, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.643612+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 914, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.019536+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 937, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.76367+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 915, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.261332+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 939, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.981711+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 916, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.257024+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 942, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.994439+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 917, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.403191+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 943, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:33.994308+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 918, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.28419+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 940, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:34.039832+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 919, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.284189+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 941, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:34.092551+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 920, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.40302+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 945, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:34.268575+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 921, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.405002+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 944, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:34.408641+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 948, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.096558+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 949, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.140334+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 950, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.444053+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 951, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.064074+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 952, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.189934+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 953, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.232474+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 954, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.336091+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 955, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.290627+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 956, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.364865+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 957, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.488329+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 958, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.401285+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 959, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.653415+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 960, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.592571+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 961, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.62252+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 962, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.780364+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 963, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.550351+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 964, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.823029+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 965, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.693242+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 966, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.738454+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 967, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.983354+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 968, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.895013+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 969, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.887169+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 970, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.022698+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 971, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:31.936631+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 972, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.064781+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 973, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 06:56:32.104124+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 985, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.617433+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, 7, 974, false, 54, NULL, 7324, 3, 1, NULL, 3, '2026-07-21 07:33:56.416845+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    // Parse các số trên dòng đầu tiên thành vector nums
    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    // map lưu giá trị -> chỉ số đã duyệt qua
    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    // Không tìm thấy cặp thỏa mãn
    cout << -1 << " " << -1 << endl;
    return 0;
}', 'ACCEPTED');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 977, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.61265+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 978, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.612134+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 979, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.612269+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 980, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.864518+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 976, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.613306+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 981, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.897024+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 982, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.609967+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 983, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.85871+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 984, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.727124+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 986, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.648446+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 987, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.609514+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 988, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.616874+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 989, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.611753+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 990, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.685409+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 991, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.607435+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 992, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.768954+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 993, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.815951+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 994, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:34:25.614945+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, 10, 975, false, 54, NULL, 1152, 3, 1, NULL, 2, '2026-07-21 07:34:25.606942+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'ACCEPTED');
INSERT INTO public.problem_submissions VALUES (NULL, 10, 995, false, 54, NULL, 1100, 3, 1, NULL, 3, '2026-07-21 07:43:27.341398+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    // Parse các số trên dòng đầu tiên thành vector nums
    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    // map lưu giá trị -> chỉ số đã duyệt qua
    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    // Không tìm thấy cặp thỏa mãn
    cout << -1 << " " << -1 << endl;
    return 0;
}', 'ACCEPTED');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 996, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.6168+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 997, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.753461+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 998, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.616595+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 999, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.616743+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1000, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.616797+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1001, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.794527+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1002, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.874767+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1003, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.61664+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1004, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.616669+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1005, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.689768+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1006, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.616595+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1007, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.616595+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1008, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.617318+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1009, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.837384+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1010, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.689775+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1011, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.618024+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1012, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.618101+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1014, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.917739+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1013, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.715273+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');
INSERT INTO public.problem_submissions VALUES (NULL, NULL, 1015, false, 54, NULL, NULL, 3, 1, NULL, 2, '2026-07-21 07:58:23.616653+07', '#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}', 'PENDING');


--
-- Data for Name: problem_tag_mappings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.problem_tag_mappings VALUES (1, 3, 1);
INSERT INTO public.problem_tag_mappings VALUES (2, 3, 2);
INSERT INTO public.problem_tag_mappings VALUES (3, 4, 3);
INSERT INTO public.problem_tag_mappings VALUES (4, 5, 3);
INSERT INTO public.problem_tag_mappings VALUES (5, 5, 4);
INSERT INTO public.problem_tag_mappings VALUES (6, 6, 4);
INSERT INTO public.problem_tag_mappings VALUES (7, 7, 5);
INSERT INTO public.problem_tag_mappings VALUES (8, 8, 5);
INSERT INTO public.problem_tag_mappings VALUES (9, 8, 1);
INSERT INTO public.problem_tag_mappings VALUES (10, 9, 1);
INSERT INTO public.problem_tag_mappings VALUES (11, 9, 6);
INSERT INTO public.problem_tag_mappings VALUES (12, 9, 7);
INSERT INTO public.problem_tag_mappings VALUES (13, 10, 1);
INSERT INTO public.problem_tag_mappings VALUES (14, 10, 6);
INSERT INTO public.problem_tag_mappings VALUES (15, 11, 8);
INSERT INTO public.problem_tag_mappings VALUES (16, 12, 1);
INSERT INTO public.problem_tag_mappings VALUES (17, 12, 6);
INSERT INTO public.problem_tag_mappings VALUES (18, 1, 1);
INSERT INTO public.problem_tag_mappings VALUES (19, 19, 4);
INSERT INTO public.problem_tag_mappings VALUES (20, 20, 3);
INSERT INTO public.problem_tag_mappings VALUES (21, 21, 4);
INSERT INTO public.problem_tag_mappings VALUES (22, 21, 2);
INSERT INTO public.problem_tag_mappings VALUES (23, 22, 1);
INSERT INTO public.problem_tag_mappings VALUES (24, 23, 1);
INSERT INTO public.problem_tag_mappings VALUES (25, 23, 2);
INSERT INTO public.problem_tag_mappings VALUES (26, 24, 1);
INSERT INTO public.problem_tag_mappings VALUES (27, 24, 7);
INSERT INTO public.problem_tag_mappings VALUES (28, 25, 1);
INSERT INTO public.problem_tag_mappings VALUES (29, 25, 6);
INSERT INTO public.problem_tag_mappings VALUES (30, 26, 1);
INSERT INTO public.problem_tag_mappings VALUES (31, 26, 6);
INSERT INTO public.problem_tag_mappings VALUES (32, 26, 7);
INSERT INTO public.problem_tag_mappings VALUES (33, 27, 3);
INSERT INTO public.problem_tag_mappings VALUES (34, 27, 5);
INSERT INTO public.problem_tag_mappings VALUES (35, 28, 4);
INSERT INTO public.problem_tag_mappings VALUES (36, 29, 4);
INSERT INTO public.problem_tag_mappings VALUES (37, 29, 2);
INSERT INTO public.problem_tag_mappings VALUES (38, 30, 4);
INSERT INTO public.problem_tag_mappings VALUES (39, 30, 2);
INSERT INTO public.problem_tag_mappings VALUES (40, 31, 3);
INSERT INTO public.problem_tag_mappings VALUES (41, 31, 7);
INSERT INTO public.problem_tag_mappings VALUES (42, 32, 3);
INSERT INTO public.problem_tag_mappings VALUES (43, 32, 8);
INSERT INTO public.problem_tag_mappings VALUES (44, 33, 3);
INSERT INTO public.problem_tag_mappings VALUES (45, 34, 4);
INSERT INTO public.problem_tag_mappings VALUES (46, 34, 6);
INSERT INTO public.problem_tag_mappings VALUES (47, 35, 1);
INSERT INTO public.problem_tag_mappings VALUES (48, 35, 2);
INSERT INTO public.problem_tag_mappings VALUES (49, 36, 1);
INSERT INTO public.problem_tag_mappings VALUES (50, 36, 6);
INSERT INTO public.problem_tag_mappings VALUES (51, 36, 7);
INSERT INTO public.problem_tag_mappings VALUES (52, 37, 1);
INSERT INTO public.problem_tag_mappings VALUES (53, 37, 7);
INSERT INTO public.problem_tag_mappings VALUES (54, 38, 4);
INSERT INTO public.problem_tag_mappings VALUES (55, 38, 2);


--
-- Data for Name: problem_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.problem_tags VALUES (1, '2026-07-21 02:34:08.571933+07', '2026-07-21 02:34:08.571933+07', 'Arrays', 'arrays');
INSERT INTO public.problem_tags VALUES (2, '2026-07-21 02:34:08.574323+07', '2026-07-21 02:34:08.574323+07', 'Hash Map', 'hash-map');
INSERT INTO public.problem_tags VALUES (3, '2026-07-21 02:34:08.574523+07', '2026-07-21 02:34:08.574523+07', 'Math', 'math');
INSERT INTO public.problem_tags VALUES (4, '2026-07-21 02:34:08.574782+07', '2026-07-21 02:34:08.574782+07', 'String', 'string');
INSERT INTO public.problem_tags VALUES (5, '2026-07-21 02:34:08.574998+07', '2026-07-21 02:34:08.574998+07', 'Dynamic Programming', 'dynamic-programming');
INSERT INTO public.problem_tags VALUES (6, '2026-07-21 02:34:08.57515+07', '2026-07-21 02:34:08.57515+07', 'Two Pointers', 'two-pointers');
INSERT INTO public.problem_tags VALUES (7, '2026-07-21 02:34:08.575268+07', '2026-07-21 02:34:08.575268+07', 'Sorting', 'sorting');
INSERT INTO public.problem_tags VALUES (8, '2026-07-21 02:34:08.575429+07', '2026-07-21 02:34:08.575429+07', 'Binary Search', 'binary-search');


--
-- Data for Name: problem_testcases; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.problem_testcases VALUES (1, 1, 1, '0 1', '2 7 11 15
9', NULL);
INSERT INTO public.problem_testcases VALUES (2, 2, 1, '1 2', '3 2 4
6', NULL);
INSERT INTO public.problem_testcases VALUES (3, 3, 1, '0 1', '3 3
6', NULL);
INSERT INTO public.problem_testcases VALUES (4, 4, 1, '1 2', '1 5 8 10
13', NULL);
INSERT INTO public.problem_testcases VALUES (5, 5, 1, '1 2', '2 5 5 11
10', NULL);
INSERT INTO public.problem_testcases VALUES (7, 7, 1, '3 4', '1 2 3 4 5
9', NULL);
INSERT INTO public.problem_testcases VALUES (8, 8, 1, '2 4', '-1 -2 -3 -4 -5
-8', NULL);
INSERT INTO public.problem_testcases VALUES (9, 9, 1, '0 3', '0 4 3 0
0', NULL);
INSERT INTO public.problem_testcases VALUES (11, 1, 2, 'true', '121', NULL);
INSERT INTO public.problem_testcases VALUES (12, 2, 2, 'false', '-121', NULL);
INSERT INTO public.problem_testcases VALUES (13, 3, 2, 'false', '10', NULL);
INSERT INTO public.problem_testcases VALUES (14, 4, 2, 'true', '0', NULL);
INSERT INTO public.problem_testcases VALUES (15, 5, 2, 'true', '12321', NULL);
INSERT INTO public.problem_testcases VALUES (16, 6, 2, 'true', '123321', NULL);
INSERT INTO public.problem_testcases VALUES (17, 7, 2, 'false', '12', NULL);
INSERT INTO public.problem_testcases VALUES (18, 8, 2, 'true', '11', NULL);
INSERT INTO public.problem_testcases VALUES (19, 9, 2, 'true', '1', NULL);
INSERT INTO public.problem_testcases VALUES (20, 10, 2, 'false', '100', NULL);
INSERT INTO public.problem_testcases VALUES (21, 1, 3, '3', 'III', NULL);
INSERT INTO public.problem_testcases VALUES (22, 2, 3, '4', 'IV', NULL);
INSERT INTO public.problem_testcases VALUES (23, 3, 3, '9', 'IX', NULL);
INSERT INTO public.problem_testcases VALUES (24, 4, 3, '58', 'LVIII', NULL);
INSERT INTO public.problem_testcases VALUES (25, 5, 3, '1994', 'MCMXCIV', NULL);
INSERT INTO public.problem_testcases VALUES (26, 6, 3, '10', 'X', NULL);
INSERT INTO public.problem_testcases VALUES (27, 7, 3, '40', 'XL', NULL);
INSERT INTO public.problem_testcases VALUES (28, 8, 3, '90', 'XC', NULL);
INSERT INTO public.problem_testcases VALUES (29, 9, 3, '400', 'CD', NULL);
INSERT INTO public.problem_testcases VALUES (30, 10, 3, '900', 'CM', NULL);
INSERT INTO public.problem_testcases VALUES (31, 1, 4, 'true', '()', NULL);
INSERT INTO public.problem_testcases VALUES (32, 2, 4, 'true', '()[]{}', NULL);
INSERT INTO public.problem_testcases VALUES (33, 3, 4, 'false', '(]', NULL);
INSERT INTO public.problem_testcases VALUES (34, 4, 4, 'true', '([])', NULL);
INSERT INTO public.problem_testcases VALUES (35, 5, 4, 'false', '(', NULL);
INSERT INTO public.problem_testcases VALUES (36, 6, 4, 'false', ']', NULL);
INSERT INTO public.problem_testcases VALUES (37, 7, 4, 'true', '({[]})', NULL);
INSERT INTO public.problem_testcases VALUES (38, 8, 4, 'false', '({[})', NULL);
INSERT INTO public.problem_testcases VALUES (39, 9, 4, 'true', '({[]})()', NULL);
INSERT INTO public.problem_testcases VALUES (40, 10, 4, 'true', '{[()]}', NULL);
INSERT INTO public.problem_testcases VALUES (41, 1, 5, '1', '1', NULL);
INSERT INTO public.problem_testcases VALUES (42, 2, 5, '2', '2', NULL);
INSERT INTO public.problem_testcases VALUES (43, 3, 5, '3', '3', NULL);
INSERT INTO public.problem_testcases VALUES (44, 4, 5, '5', '4', NULL);
INSERT INTO public.problem_testcases VALUES (45, 5, 5, '8', '5', NULL);
INSERT INTO public.problem_testcases VALUES (46, 6, 5, '13', '6', NULL);
INSERT INTO public.problem_testcases VALUES (47, 7, 5, '21', '7', NULL);
INSERT INTO public.problem_testcases VALUES (48, 8, 5, '34', '8', NULL);
INSERT INTO public.problem_testcases VALUES (49, 9, 5, '55', '9', NULL);
INSERT INTO public.problem_testcases VALUES (50, 10, 5, '89', '10', NULL);
INSERT INTO public.problem_testcases VALUES (51, 1, 6, '1', '1', NULL);
INSERT INTO public.problem_testcases VALUES (52, 2, 6, '23', '5 4 -1 7 8', NULL);
INSERT INTO public.problem_testcases VALUES (53, 3, 6, '6', '-2 1 -3 4 -1 2 1 -5 4', NULL);
INSERT INTO public.problem_testcases VALUES (54, 4, 6, '-1', '-1', NULL);
INSERT INTO public.problem_testcases VALUES (55, 5, 6, '-1', '-2 -1 -3', NULL);
INSERT INTO public.problem_testcases VALUES (56, 6, 6, '6', '1 2 3', NULL);
INSERT INTO public.problem_testcases VALUES (57, 7, 6, '5', '1 -2 3 -4 5', NULL);
INSERT INTO public.problem_testcases VALUES (58, 8, 6, '3', '-2 3', NULL);
INSERT INTO public.problem_testcases VALUES (59, 9, 6, '3', '3 -2', NULL);
INSERT INTO public.problem_testcases VALUES (60, 10, 6, '0', '0', NULL);
INSERT INTO public.problem_testcases VALUES (61, 1, 7, '1 2 2 3 5 6', '1 2 3
2 5 6', NULL);
INSERT INTO public.problem_testcases VALUES (62, 2, 7, '1', '1
', NULL);
INSERT INTO public.problem_testcases VALUES (63, 3, 7, '2', '
2', NULL);
INSERT INTO public.problem_testcases VALUES (64, 4, 7, '1 2 3 4 5 6', '1 3 5
2 4 6', NULL);
INSERT INTO public.problem_testcases VALUES (65, 5, 7, '1 1 1 1 1 1', '1 1 1
1 1 1', NULL);
INSERT INTO public.problem_testcases VALUES (66, 6, 7, '0 0', '0
0', NULL);
INSERT INTO public.problem_testcases VALUES (67, 7, 7, '-5 -3 -1 2', '-5 -1
-3 2', NULL);
INSERT INTO public.problem_testcases VALUES (68, 8, 7, '5 10 15 20 25', '10 20
5 15 25', NULL);
INSERT INTO public.problem_testcases VALUES (69, 9, 7, '1 2 3 4', '1 2
3 4', NULL);
INSERT INTO public.problem_testcases VALUES (70, 10, 7, '1 2 4 5', '4 5
1 2', NULL);
INSERT INTO public.problem_testcases VALUES (71, 1, 8, 'true', '-1 0 1 2 -1 -4', NULL);
INSERT INTO public.problem_testcases VALUES (72, 2, 8, 'false', '0 1 1', NULL);
INSERT INTO public.problem_testcases VALUES (73, 3, 8, 'true', '0 0 0', NULL);
INSERT INTO public.problem_testcases VALUES (74, 4, 8, 'true', '1 2 -3', NULL);
INSERT INTO public.problem_testcases VALUES (75, 5, 8, 'false', '1 2 3', NULL);
INSERT INTO public.problem_testcases VALUES (76, 6, 8, 'true', '-1 -2 3', NULL);
INSERT INTO public.problem_testcases VALUES (77, 7, 8, 'true', '10 -5 -5', NULL);
INSERT INTO public.problem_testcases VALUES (78, 8, 8, 'false', '10 20 30', NULL);
INSERT INTO public.problem_testcases VALUES (79, 9, 8, 'false', '-10 5 4', NULL);
INSERT INTO public.problem_testcases VALUES (80, 10, 8, 'true', '-10 5 5', NULL);
INSERT INTO public.problem_testcases VALUES (81, 1, 9, '4', '-1 0 3 5 9 12
9', NULL);
INSERT INTO public.problem_testcases VALUES (82, 2, 9, '-1', '-1 0 3 5 9 12
2', NULL);
INSERT INTO public.problem_testcases VALUES (83, 3, 9, '0', '5
5', NULL);
INSERT INTO public.problem_testcases VALUES (84, 4, 9, '-1', '5
2', NULL);
INSERT INTO public.problem_testcases VALUES (85, 5, 9, '0', '1 3 5 7 9
1', NULL);
INSERT INTO public.problem_testcases VALUES (86, 6, 9, '4', '1 3 5 7 9
9', NULL);
INSERT INTO public.problem_testcases VALUES (87, 7, 9, '2', '1 3 5 7 9
5', NULL);
INSERT INTO public.problem_testcases VALUES (88, 8, 9, '3', '1 3 5 7 9
7', NULL);
INSERT INTO public.problem_testcases VALUES (89, 9, 9, '1', '1 3 5 7 9
3', NULL);
INSERT INTO public.problem_testcases VALUES (90, 10, 9, '-1', '1 3 5 7 9
10', NULL);
INSERT INTO public.problem_testcases VALUES (91, 1, 10, '1', '1 1', NULL);
INSERT INTO public.problem_testcases VALUES (92, 2, 10, '49', '1 8 6 2 5 4 8 3 7', NULL);
INSERT INTO public.problem_testcases VALUES (93, 3, 10, '16', '4 3 2 1 4', NULL);
INSERT INTO public.problem_testcases VALUES (94, 4, 10, '2', '1 2 1', NULL);
INSERT INTO public.problem_testcases VALUES (95, 5, 10, '17', '2 3 4 5 18 17 6', NULL);
INSERT INTO public.problem_testcases VALUES (96, 6, 10, '24', '1 3 2 5 25 24 5', NULL);
INSERT INTO public.problem_testcases VALUES (97, 7, 10, '1', '1 2', NULL);
INSERT INTO public.problem_testcases VALUES (98, 8, 10, '45', '3 9 3 4 7 2 12 6', NULL);
INSERT INTO public.problem_testcases VALUES (99, 9, 10, '25', '10 9 8 7 6 5 4 3 2 1', NULL);
INSERT INTO public.problem_testcases VALUES (100, 10, 10, '25', '1 2 3 4 5 6 7 8 9 10', NULL);
INSERT INTO public.problem_testcases VALUES (10, 10, 1, '1 3', '1 3 10 100
103', NULL);
INSERT INTO public.problem_testcases VALUES (6, 6, 1, '1 2', '10 20 30 40
50', NULL);
INSERT INTO public.problem_testcases VALUES (101, 1, 14, '0 1', '2 7 11 15\n9', 'dummy-token-14-1');
INSERT INTO public.problem_testcases VALUES (102, 2, 14, '1 2', '3 2 4\n6', 'dummy-token-14-2');
INSERT INTO public.problem_testcases VALUES (103, 1, 18, 'olleh', 'hello', NULL);
INSERT INTO public.problem_testcases VALUES (104, 2, 18, 'a', 'a', NULL);
INSERT INTO public.problem_testcases VALUES (105, 3, 18, 'dcba', 'abcd', NULL);
INSERT INTO public.problem_testcases VALUES (106, 4, 18, 'racecaR', 'Racecar', NULL);
INSERT INTO public.problem_testcases VALUES (107, 5, 18, '54321', '12345', NULL);
INSERT INTO public.problem_testcases VALUES (108, 6, 18, 'dlrow olleh', 'hello world', NULL);
INSERT INTO public.problem_testcases VALUES (109, 7, 18, 'ytivargitna', 'antigravity', NULL);
INSERT INTO public.problem_testcases VALUES (110, 8, 18, 'A', 'A', NULL);
INSERT INTO public.problem_testcases VALUES (111, 9, 18, 'nohtyp', 'python', NULL);
INSERT INTO public.problem_testcases VALUES (112, 10, 18, 'gnidoc', 'coding', NULL);
INSERT INTO public.problem_testcases VALUES (113, 1, 19, '1', '1', NULL);
INSERT INTO public.problem_testcases VALUES (114, 2, 19, '1 2 Fizz', '3', NULL);
INSERT INTO public.problem_testcases VALUES (115, 3, 19, '1 2 Fizz 4 Buzz', '5', NULL);
INSERT INTO public.problem_testcases VALUES (116, 4, 19, '1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz', '15', NULL);
INSERT INTO public.problem_testcases VALUES (117, 5, 19, '1 2', '2', NULL);
INSERT INTO public.problem_testcases VALUES (118, 6, 19, '1 2 Fizz 4 Buzz Fizz', '6', NULL);
INSERT INTO public.problem_testcases VALUES (119, 7, 19, '1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz', '10', NULL);
INSERT INTO public.problem_testcases VALUES (120, 8, 19, '1 2 Fizz 4', '4', NULL);
INSERT INTO public.problem_testcases VALUES (121, 9, 19, '1 2 Fizz 4 Buzz Fizz 7', '7', NULL);
INSERT INTO public.problem_testcases VALUES (122, 10, 19, '1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz', '12', NULL);
INSERT INTO public.problem_testcases VALUES (123, 1, 20, 'true', 'anagram nagaram', NULL);
INSERT INTO public.problem_testcases VALUES (124, 2, 20, 'false', 'rat car', NULL);
INSERT INTO public.problem_testcases VALUES (125, 3, 20, 'true', 'a a', NULL);
INSERT INTO public.problem_testcases VALUES (126, 4, 20, 'false', 'a b', NULL);
INSERT INTO public.problem_testcases VALUES (127, 5, 20, 'true', 'hello olleh', NULL);
INSERT INTO public.problem_testcases VALUES (128, 6, 20, 'true', 'cat act', NULL);
INSERT INTO public.problem_testcases VALUES (129, 7, 20, 'true', 'listen silent', NULL);
INSERT INTO public.problem_testcases VALUES (130, 8, 20, 'false', 'python py', NULL);
INSERT INTO public.problem_testcases VALUES (131, 9, 20, 'true', 'abc cba', NULL);
INSERT INTO public.problem_testcases VALUES (132, 10, 20, 'false', 'abcd abc', NULL);
INSERT INTO public.problem_testcases VALUES (133, 1, 21, '1', '2 2 1', NULL);
INSERT INTO public.problem_testcases VALUES (134, 2, 21, '4', '4 1 2 1 2', NULL);
INSERT INTO public.problem_testcases VALUES (135, 3, 21, '1', '1', NULL);
INSERT INTO public.problem_testcases VALUES (136, 4, 21, '9', '3 3 5 5 9', NULL);
INSERT INTO public.problem_testcases VALUES (137, 5, 21, '7', '7 8 8', NULL);
INSERT INTO public.problem_testcases VALUES (138, 6, 21, '30', '10 20 10 30 20', NULL);
INSERT INTO public.problem_testcases VALUES (139, 7, 21, '-2', '-1 -1 -2', NULL);
INSERT INTO public.problem_testcases VALUES (140, 8, 21, '2', '5 4 5 4 2', NULL);
INSERT INTO public.problem_testcases VALUES (141, 9, 21, '0', '1 0 1', NULL);
INSERT INTO public.problem_testcases VALUES (142, 10, 21, '6', '9 9 8 8 7 6 7', NULL);
INSERT INTO public.problem_testcases VALUES (143, 1, 22, 'true', '1 2 3 1', NULL);
INSERT INTO public.problem_testcases VALUES (144, 2, 22, 'false', '1 2 3 4', NULL);
INSERT INTO public.problem_testcases VALUES (145, 3, 22, 'true', '1 1 1 3 3 4 3 2 4 2', NULL);
INSERT INTO public.problem_testcases VALUES (146, 4, 22, 'false', '5', NULL);
INSERT INTO public.problem_testcases VALUES (147, 5, 22, 'false', '5 6', NULL);
INSERT INTO public.problem_testcases VALUES (148, 6, 22, 'true', '5 5', NULL);
INSERT INTO public.problem_testcases VALUES (149, 7, 22, 'true', '10 20 30 40 50 10', NULL);
INSERT INTO public.problem_testcases VALUES (150, 8, 22, 'false', '-1 -2 -3 -4', NULL);
INSERT INTO public.problem_testcases VALUES (151, 9, 22, 'true', '0 0', NULL);
INSERT INTO public.problem_testcases VALUES (152, 10, 22, 'false', '1 2 3 4 5 6 7 8 9', NULL);
INSERT INTO public.problem_testcases VALUES (153, 1, 23, '3', '3 2 3', NULL);
INSERT INTO public.problem_testcases VALUES (154, 2, 23, '2', '2 2 1 1 1 2 2', NULL);
INSERT INTO public.problem_testcases VALUES (155, 3, 23, '1', '1', NULL);
INSERT INTO public.problem_testcases VALUES (156, 4, 23, '5', '5 5 5 1 2 5 5', NULL);
INSERT INTO public.problem_testcases VALUES (157, 5, 23, '6', '6 6 6', NULL);
INSERT INTO public.problem_testcases VALUES (158, 6, 23, '1', '1 1 2', NULL);
INSERT INTO public.problem_testcases VALUES (159, 7, 23, '4', '4 4 4 4 1 1 1', NULL);
INSERT INTO public.problem_testcases VALUES (160, 8, 23, '9', '8 8 9 9 9 9 9', NULL);
INSERT INTO public.problem_testcases VALUES (161, 9, 23, '-1', '-1 -1 -1 2 2 -1 -1', NULL);
INSERT INTO public.problem_testcases VALUES (162, 10, 23, '0', '0 0 0 1 0', NULL);
INSERT INTO public.problem_testcases VALUES (163, 1, 24, '1 3 12 0 0', '0 1 0 3 12', NULL);
INSERT INTO public.problem_testcases VALUES (164, 2, 24, '0', '0', NULL);
INSERT INTO public.problem_testcases VALUES (165, 3, 24, '1 2 3', '1 2 3', NULL);
INSERT INTO public.problem_testcases VALUES (166, 4, 24, '1 0 0', '0 0 1', NULL);
INSERT INTO public.problem_testcases VALUES (167, 5, 24, '1 0', '1 0', NULL);
INSERT INTO public.problem_testcases VALUES (168, 6, 24, '1 0', '0 1', NULL);
INSERT INTO public.problem_testcases VALUES (169, 7, 24, '4 5 6 7 0 0', '4 5 0 6 0 7', NULL);
INSERT INTO public.problem_testcases VALUES (170, 8, 24, '0 0 0', '0 0 0', NULL);
INSERT INTO public.problem_testcases VALUES (171, 9, 24, '-1 2 0', '-1 0 2', NULL);
INSERT INTO public.problem_testcases VALUES (172, 10, 24, '1 2 3 0 0', '1 2 0 0 3', NULL);
INSERT INTO public.problem_testcases VALUES (173, 1, 25, '0 1 9 16 100', '-4 -1 0 3 10', NULL);
INSERT INTO public.problem_testcases VALUES (174, 2, 25, '4 9 9 49 121', '-7 -3 2 3 11', NULL);
INSERT INTO public.problem_testcases VALUES (175, 3, 25, '0', '0', NULL);
INSERT INTO public.problem_testcases VALUES (176, 4, 25, '1', '-1', NULL);
INSERT INTO public.problem_testcases VALUES (177, 5, 25, '1 4 9', '1 2 3', NULL);
INSERT INTO public.problem_testcases VALUES (178, 6, 25, '1 4 9', '-3 -2 -1', NULL);
INSERT INTO public.problem_testcases VALUES (179, 7, 25, '0 1 1 4 4 9 9 16 16 25 25', '-5 -4 -3 -2 -1 0 1 2 3 4 5', NULL);
INSERT INTO public.problem_testcases VALUES (180, 8, 25, '0 4 4', '-2 0 2', NULL);
INSERT INTO public.problem_testcases VALUES (181, 9, 25, '100 100', '-10 10', NULL);
INSERT INTO public.problem_testcases VALUES (182, 10, 25, '1 1', '-1 1', NULL);
INSERT INTO public.problem_testcases VALUES (183, 1, 26, '0', '0', NULL);
INSERT INTO public.problem_testcases VALUES (184, 2, 26, '1', '1', NULL);
INSERT INTO public.problem_testcases VALUES (185, 3, 26, '1', '2', NULL);
INSERT INTO public.problem_testcases VALUES (186, 4, 26, '2', '3', NULL);
INSERT INTO public.problem_testcases VALUES (187, 5, 26, '3', '4', NULL);
INSERT INTO public.problem_testcases VALUES (188, 6, 26, '5', '5', NULL);
INSERT INTO public.problem_testcases VALUES (189, 7, 26, '8', '6', NULL);
INSERT INTO public.problem_testcases VALUES (190, 8, 26, '13', '7', NULL);
INSERT INTO public.problem_testcases VALUES (191, 9, 26, '21', '8', NULL);
INSERT INTO public.problem_testcases VALUES (192, 10, 26, '55', '10', NULL);
INSERT INTO public.problem_testcases VALUES (193, 1, 27, '1[.]1[.]1[.]1', '1.1.1.1', NULL);
INSERT INTO public.problem_testcases VALUES (194, 2, 27, '255[.]100[.]50[.]0', '255.100.50.0', NULL);
INSERT INTO public.problem_testcases VALUES (195, 3, 27, '0[.]0[.]0[.]0', '0.0.0.0', NULL);
INSERT INTO public.problem_testcases VALUES (196, 4, 27, '192[.]168[.]1[.]1', '192.168.1.1', NULL);
INSERT INTO public.problem_testcases VALUES (197, 5, 27, '10[.]0[.]0[.]1', '10.0.0.1', NULL);
INSERT INTO public.problem_testcases VALUES (198, 6, 27, '172[.]16[.]254[.]1', '172.16.254.1', NULL);
INSERT INTO public.problem_testcases VALUES (199, 7, 27, '8[.]8[.]8[.]8', '8.8.8.8', NULL);
INSERT INTO public.problem_testcases VALUES (200, 8, 27, '4[.]2[.]2[.]2', '4.2.2.2', NULL);
INSERT INTO public.problem_testcases VALUES (201, 9, 27, '127[.]0[.]0[.]1', '127.0.0.1', NULL);
INSERT INTO public.problem_testcases VALUES (202, 10, 27, '200[.]200[.]200[.]200', '200.200.200.200', NULL);
INSERT INTO public.problem_testcases VALUES (203, 1, 28, 'false', 'a b', NULL);
INSERT INTO public.problem_testcases VALUES (204, 2, 28, 'false', 'aa ab', NULL);
INSERT INTO public.problem_testcases VALUES (205, 3, 28, 'true', 'aa aab', NULL);
INSERT INTO public.problem_testcases VALUES (206, 4, 28, 'true', 'hello helloworld', NULL);
INSERT INTO public.problem_testcases VALUES (207, 5, 28, 'false', 'abc def', NULL);
INSERT INTO public.problem_testcases VALUES (208, 6, 28, 'true', 'a a', NULL);
INSERT INTO public.problem_testcases VALUES (209, 7, 28, 'true', 'fff fff', NULL);
INSERT INTO public.problem_testcases VALUES (210, 8, 28, 'true', 'bg efghib', NULL);
INSERT INTO public.problem_testcases VALUES (211, 9, 28, 'false', 'xyz x', NULL);
INSERT INTO public.problem_testcases VALUES (212, 10, 28, 'false', 'antigravity gravity', NULL);
INSERT INTO public.problem_testcases VALUES (213, 1, 29, '0', 'leetcode', NULL);
INSERT INTO public.problem_testcases VALUES (214, 2, 29, '2', 'loveleetcode', NULL);
INSERT INTO public.problem_testcases VALUES (215, 3, 29, '-1', 'aabb', NULL);
INSERT INTO public.problem_testcases VALUES (216, 4, 29, '0', 'a', NULL);
INSERT INTO public.problem_testcases VALUES (217, 5, 29, '1', 'abac', NULL);
INSERT INTO public.problem_testcases VALUES (218, 6, 29, '-1', 'abcabc', NULL);
INSERT INTO public.problem_testcases VALUES (219, 7, 29, '0', 'xyz', NULL);
INSERT INTO public.problem_testcases VALUES (220, 8, 29, '0', 'antigravity', NULL);
INSERT INTO public.problem_testcases VALUES (221, 9, 29, '2', 'stress', NULL);
INSERT INTO public.problem_testcases VALUES (222, 10, 29, '1', 'success', NULL);
INSERT INTO public.problem_testcases VALUES (223, 1, 30, '2', '3 0 1', NULL);
INSERT INTO public.problem_testcases VALUES (224, 2, 30, '2', '0 1', NULL);
INSERT INTO public.problem_testcases VALUES (225, 3, 30, '8', '9 6 4 2 3 5 7 0 1', NULL);
INSERT INTO public.problem_testcases VALUES (226, 4, 30, '1', '0', NULL);
INSERT INTO public.problem_testcases VALUES (227, 5, 30, '0', '1', NULL);
INSERT INTO public.problem_testcases VALUES (228, 6, 30, '1', '0 2 3', NULL);
INSERT INTO public.problem_testcases VALUES (229, 7, 30, '0', '1 2 3 4', NULL);
INSERT INTO public.problem_testcases VALUES (230, 8, 30, '4', '0 1 2 3 5', NULL);
INSERT INTO public.problem_testcases VALUES (231, 9, 30, '6', '0 1 2 3 4 5 7', NULL);
INSERT INTO public.problem_testcases VALUES (232, 10, 30, '10', '8 6 7 5 3 0 9 1 2 4', NULL);
INSERT INTO public.problem_testcases VALUES (233, 1, 31, 'true', '16', NULL);
INSERT INTO public.problem_testcases VALUES (234, 2, 31, 'false', '14', NULL);
INSERT INTO public.problem_testcases VALUES (235, 3, 31, 'true', '1', NULL);
INSERT INTO public.problem_testcases VALUES (236, 4, 31, 'true', '4', NULL);
INSERT INTO public.problem_testcases VALUES (237, 5, 31, 'true', '9', NULL);
INSERT INTO public.problem_testcases VALUES (238, 6, 31, 'true', '100', NULL);
INSERT INTO public.problem_testcases VALUES (239, 7, 31, 'false', '2', NULL);
INSERT INTO public.problem_testcases VALUES (240, 8, 31, 'false', '3', NULL);
INSERT INTO public.problem_testcases VALUES (241, 9, 31, 'true', '25', NULL);
INSERT INTO public.problem_testcases VALUES (242, 10, 31, 'false', '26', NULL);
INSERT INTO public.problem_testcases VALUES (243, 1, 32, 'true', '27', NULL);
INSERT INTO public.problem_testcases VALUES (244, 2, 32, 'false', '0', NULL);
INSERT INTO public.problem_testcases VALUES (245, 3, 32, 'false', '-1', NULL);
INSERT INTO public.problem_testcases VALUES (246, 4, 32, 'true', '9', NULL);
INSERT INTO public.problem_testcases VALUES (247, 5, 32, 'false', '45', NULL);
INSERT INTO public.problem_testcases VALUES (248, 6, 32, 'true', '1', NULL);
INSERT INTO public.problem_testcases VALUES (249, 7, 32, 'true', '3', NULL);
INSERT INTO public.problem_testcases VALUES (250, 8, 32, 'true', '81', NULL);
INSERT INTO public.problem_testcases VALUES (251, 9, 32, 'true', '243', NULL);
INSERT INTO public.problem_testcases VALUES (252, 10, 32, 'false', '12', NULL);
INSERT INTO public.problem_testcases VALUES (253, 1, 33, 'holle', 'hello', NULL);
INSERT INTO public.problem_testcases VALUES (254, 2, 33, 'leotcede', 'leetcode', NULL);
INSERT INTO public.problem_testcases VALUES (255, 3, 33, 'a', 'a', NULL);
INSERT INTO public.problem_testcases VALUES (256, 4, 33, 'bcd', 'bcd', NULL);
INSERT INTO public.problem_testcases VALUES (257, 5, 33, 'iA', 'Ai', NULL);
INSERT INTO public.problem_testcases VALUES (258, 6, 33, 'intagravyty', 'antigravity', NULL);
INSERT INTO public.problem_testcases VALUES (259, 7, 33, 'UOIEA', 'AEIOU', NULL);
INSERT INTO public.problem_testcases VALUES (260, 8, 33, 'xyz', 'xyz', NULL);
INSERT INTO public.problem_testcases VALUES (261, 9, 33, 'vewols', 'vowels', NULL);
INSERT INTO public.problem_testcases VALUES (262, 10, 33, 'Goeogl', 'Google', NULL);
INSERT INTO public.problem_testcases VALUES (263, 1, 34, '5 6', '4 3 2 7 8 2 3 1', NULL);
INSERT INTO public.problem_testcases VALUES (264, 2, 34, '2', '1 1', NULL);
INSERT INTO public.problem_testcases VALUES (265, 3, 34, '', '1', NULL);
INSERT INTO public.problem_testcases VALUES (266, 4, 34, '1', '2 2', NULL);
INSERT INTO public.problem_testcases VALUES (267, 5, 34, '', '1 2', NULL);
INSERT INTO public.problem_testcases VALUES (268, 6, 34, '1 2', '3 3 3', NULL);
INSERT INTO public.problem_testcases VALUES (269, 7, 34, '3', '1 2 2 4', NULL);
INSERT INTO public.problem_testcases VALUES (270, 8, 34, '3 4', '1 1 2 2', NULL);
INSERT INTO public.problem_testcases VALUES (271, 9, 34, '', '5 4 3 2 1', NULL);
INSERT INTO public.problem_testcases VALUES (272, 10, 34, '2', '1 3 3 4 5', NULL);
INSERT INTO public.problem_testcases VALUES (273, 1, 35, '2 2', '1 2 2 1
2 2', NULL);
INSERT INTO public.problem_testcases VALUES (274, 2, 35, '4 9', '4 9 5
9 4 9 8 4', NULL);
INSERT INTO public.problem_testcases VALUES (275, 3, 35, '1', '1
1', NULL);
INSERT INTO public.problem_testcases VALUES (276, 4, 35, '', '1
2', NULL);
INSERT INTO public.problem_testcases VALUES (277, 5, 35, '', '1 2 3
4 5 6', NULL);
INSERT INTO public.problem_testcases VALUES (278, 6, 35, '1 2', '1 2 2
1 2', NULL);
INSERT INTO public.problem_testcases VALUES (279, 7, 35, '1 2 3', '1 2 3
1 2 3', NULL);
INSERT INTO public.problem_testcases VALUES (280, 8, 35, '5 5', '5 5 5
5 5', NULL);
INSERT INTO public.problem_testcases VALUES (281, 9, 35, '1 2', '1 2
2 1', NULL);
INSERT INTO public.problem_testcases VALUES (282, 10, 35, '2 3 4', '2 3 4
4 3 2', NULL);
INSERT INTO public.problem_testcases VALUES (283, 1, 36, '1', '3 2 1', NULL);
INSERT INTO public.problem_testcases VALUES (284, 2, 36, '2', '1 2', NULL);
INSERT INTO public.problem_testcases VALUES (285, 3, 36, '1', '2 2 3 1', NULL);
INSERT INTO public.problem_testcases VALUES (286, 4, 36, '5', '5', NULL);
INSERT INTO public.problem_testcases VALUES (287, 5, 36, '5', '5 5 5', NULL);
INSERT INTO public.problem_testcases VALUES (288, 6, 36, '20', '10 20 30 40', NULL);
INSERT INTO public.problem_testcases VALUES (289, 7, 36, '-3', '-1 -2 -3', NULL);
INSERT INTO public.problem_testcases VALUES (290, 8, 36, '1', '1 2 2 3', NULL);
INSERT INTO public.problem_testcases VALUES (291, 9, 36, '5', '4 5 5 6 7', NULL);
INSERT INTO public.problem_testcases VALUES (292, 10, 36, '3', '1 2 3 4 5', NULL);
INSERT INTO public.problem_testcases VALUES (293, 1, 37, 'Alaska Dad', 'Hello Alaska Dad Peace', NULL);
INSERT INTO public.problem_testcases VALUES (294, 2, 37, '', 'omk', NULL);
INSERT INTO public.problem_testcases VALUES (295, 3, 37, 'adsdf sfd', 'adsdf sfd', NULL);
INSERT INTO public.problem_testcases VALUES (296, 4, 37, 'qwerty', 'qwerty', NULL);
INSERT INTO public.problem_testcases VALUES (297, 5, 37, 'a b', 'a b c', NULL);
INSERT INTO public.problem_testcases VALUES (298, 6, 37, 'Zxcvbnm', 'Zxcvbnm', NULL);
INSERT INTO public.problem_testcases VALUES (299, 7, 37, '', 'Tree', NULL);
INSERT INTO public.problem_testcases VALUES (300, 8, 37, 'Type Writer', 'Type Writer', NULL);
INSERT INTO public.problem_testcases VALUES (301, 9, 37, 'Dad', 'Dad', NULL);
INSERT INTO public.problem_testcases VALUES (302, 10, 37, '', 'Peace', NULL);


--
-- Data for Name: problem_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.problem_versions VALUES (2, true, true, 64000, 4, 1000, 1, '2026-07-21 02:34:08.581297+07', 'None', 'Given an integer x, return true if x is a palindrome, and false otherwise. Do not use string conversion to solve this optimally.', 'EASY', '121', 'true', 'None', 'An integer x', 'true if x is palindrome, else false', 'LESSON', 'def solve(x):
    if x < 0:
        return False
    temp = x
    rev = 0
    while temp > 0:
        rev = rev * 10 + temp % 10
        temp //= 10
    return rev == x

if __name__ == ''__main__'':
    x = int(input())
    res = solve(x)
    print("true" if res else "false")', '{"python": "def solve(x):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    x = int(input())\n    res = solve(x)\n    print(\"true\" if res else \"false\")"}', 'Palindrome Number');
INSERT INTO public.problem_versions VALUES (3, true, true, 64000, 5, 1000, 1, '2026-07-21 02:34:08.583853+07', 'None', 'Convert a roman numeral string to its corresponding integer representation.', 'EASY', 'LVIII', '58', 'None', 'A string representing a Roman numeral', 'The integer value of the Roman numeral', 'LESSON', 'def solve(s):
    roman = {''I'': 1, ''V'': 5, ''X'': 10, ''L'': 50, ''C'': 100, ''D'': 500, ''M'': 1000}
    ans = 0
    for i in range(len(s)):
        if i < len(s) - 1 and roman[s[i]] < roman[s[i+1]]:
            ans -= roman[s[i]]
        else:
            ans += roman[s[i]]
    return ans

if __name__ == ''__main__'':
    s = input().strip()
    print(solve(s))', '{"python": "def solve(s):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    s = input().strip()\n    print(solve(s))"}', 'Roman to Integer');
INSERT INTO public.problem_versions VALUES (4, true, true, 64000, 6, 1000, 1, '2026-07-21 02:34:08.586726+07', 'None', 'Given a string s containing just the characters ''('', '')'', ''{'', ''}'', ''['' and '']'', determine if the input string is valid.', 'EASY', '()[]{}', 'true', 'None', 'A string containing parentheses characters', 'true if valid, else false', 'LESSON', 'def solve(s):
    stack = []
    mapping = {")": "(", "}": "{", "]": "["}
    for char in s:
        if char in mapping:
            top_element = stack.pop() if stack else ''#''
            if mapping[char] != top_element:
                return False
        else:
            stack.append(char)
    return not stack

if __name__ == ''__main__'':
    s = input().strip()
    print("true" if solve(s) else "false")', '{"python": "def solve(s):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    s = input().strip()\n    print(\"true\" if solve(s) else \"false\")"}', 'Valid Parentheses');
INSERT INTO public.problem_versions VALUES (5, true, true, 64000, 7, 1000, 1, '2026-07-21 02:34:08.588755+07', 'None', 'You are climbing a staircase. It takes n steps to reach the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?', 'EASY', '3', '3', 'None', 'An integer representing the number of stairs', 'Distinct ways to climb to the top', 'LESSON', 'def solve(n):
    if n <= 2: return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b

if __name__ == ''__main__'':
    n = int(input())
    print(solve(n))', '{"python": "def solve(n):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    n = int(input())\n    print(solve(n))"}', 'Climbing Stairs');
INSERT INTO public.problem_versions VALUES (6, true, true, 64000, 8, 1000, 1, '2026-07-21 02:34:08.590876+07', 'None', 'Given an integer array nums, find the subarray with the largest sum, and return its sum.', 'MEDIUM', '-2 1 -3 4 -1 2 1 -5 4', '6', 'None', 'Space-separated integers representing the array', 'The maximum subarray sum', 'CONTEST', 'def solve(nums):
    max_so_far = nums[0]
    curr_max = nums[0]
    for i in range(1, len(nums)):
        curr_max = max(nums[i], curr_max + nums[i])
        max_so_far = max(max_so_far, curr_max)
    return max_so_far

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print(solve(nums))', '{"python": "def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(solve(nums))"}', 'Maximum Subarray');
INSERT INTO public.problem_versions VALUES (7, true, true, 64000, 9, 1000, 1, '2026-07-21 02:34:08.593381+07', 'None', 'Given two sorted integer arrays nums1 and nums2, merge them into a single sorted array.', 'EASY', '1 2 3
2 5 6', '1 2 2 3 5 6', 'None', 'Line 1: space-separated integers for first sorted array
Line 2: space-separated integers for second sorted array', 'The merged sorted array as space-separated integers', 'CONTEST', 'def solve(n1, n2):
    res = sorted(n1 + n2)
    return " ".join(map(str, res))

if __name__ == ''__main__'':
    n1 = list(map(int, input().split()))
    n2 = list(map(int, input().split()))
    print(solve(n1, n2))', '{"python": "def solve(n1, n2):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    n1 = list(map(int, input().split()))\n    n2 = list(map(int, input().split()))\n    print(solve(n1, n2))"}', 'Merge Sorted Array');
INSERT INTO public.problem_versions VALUES (8, true, true, 64000, 10, 1000, 1, '2026-07-21 02:34:08.595521+07', 'None', 'Given an integer array nums, return true if there is a triplet that sums to 0, otherwise return false.', 'MEDIUM', '-1 0 1 2 -1 -4', 'true', 'None', 'Space-separated integers', 'true if a triplet sums to 0, else false', 'CONTEST', 'def solve(nums):
    nums.sort()
    for i in range(len(nums) - 2):
        if i > 0 and nums[i] == nums[i-1]:
            continue
        l, r = i + 1, len(nums) - 1
        while l < r:
            s = nums[i] + nums[l] + nums[r]
            if s == 0:
                return True
            elif s < 0:
                l += 1
            else:
                r -= 1
    return False

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print("true" if solve(nums) else "false")', '{"python": "def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(\"true\" if solve(nums) else \"false\")"}', 'Three Sum');
INSERT INTO public.problem_versions VALUES (9, true, true, 64000, 11, 1000, 1, '2026-07-21 02:34:08.598282+07', 'None', 'Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.', 'EASY', '-1 0 3 5 9 12
9', '4', 'None', 'Line 1: space-separated sorted integers
Line 2: target integer', 'The index of target if found, else -1', 'CONTEST', 'def solve(nums, target):
    l, r = 0, len(nums) - 1
    while l <= r:
        mid = (l + r) // 2
        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            l = mid + 1
        else:
            r = mid - 1
    return -1

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    target = int(input())
    print(solve(nums, target))', '{"python": "def solve(nums, target):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    target = int(input())\n    print(solve(nums, target))"}', 'Binary Search');
INSERT INTO public.problem_versions VALUES (10, true, true, 64000, 12, 1000, 1, '2026-07-21 02:34:08.600552+07', 'None', 'Given n non-negative integers representation of line heights. Find two lines that together with the x-axis form a container, such that the container contains the most water. Return the maximum amount of water a container can store.', 'MEDIUM', '1 8 6 2 5 4 8 3 7', '49', 'None', 'Space-separated integers representing the line heights', 'The maximum amount of water a container can store', 'CONTEST', 'def solve(height):
    l, r = 0, len(height) - 1
    max_w = 0
    while l < r:
        max_w = max(max_w, min(height[l], height[r]) * (r - l))
        if height[l] < height[r]:
            l += 1
        else:
            r -= 1
    return max_w

if __name__ == ''__main__'':
    height = list(map(int, input().split()))
    print(solve(height))', '{"python": "def solve(height):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    height = list(map(int, input().split()))\n    print(solve(height))"}', 'Container With Most Water');
INSERT INTO public.problem_versions VALUES (11, true, false, 64000, 13, 1000, 1, '2026-07-21 02:50:00.691849+07', '2 <= nums.length <= 10^4', 'This is a description written by the Playwright automated E2E test suite.', 'EASY', '[2,7,11,15]
9', '[0,1]', '[]', 'An array of integers nums and an integer target.', 'Indices of the two numbers such that they add up to target.', 'PRACTICE', NULL, '{}', 'Automated Code Problem - 1784576978499');
INSERT INTO public.problem_versions VALUES (1, true, true, 64000, 3, 1000, 1, '2026-07-21 02:34:08.576866+07', 'None', 'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice.', 'EASY', '2 7 11 15
9', '0 1', 'None', 'Line 1: space-separated integers representing nums
Line 2: target integer', 'Two space-separated integers representing the indices', 'PRACTICE', 'def solve(nums, target):
    dct = {}
    for i, num in enumerate(nums):
        if target - num in dct:
            return [dct[target - num], i]
        dct[num] = i
    return []

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    target = int(input())
    res = solve(nums, target)
    print(res[0], res[1])', '{"python": "def solve(nums, target):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    target = int(input())\n    res = solve(nums, target)\n    print(res[0], res[1])"}', 'Two Sum');
INSERT INTO public.problem_versions VALUES (12, true, false, 64000, 14, 1000, 1, '2026-07-21 03:06:24.999266+07', '2 <= nums.length <= 10^4', 'This is a description written by the Playwright automated E2E test suite.', 'EASY', '[2,7,11,15]
9', '[0,1]', '[]', 'An array of integers nums and an integer target.', 'Indices of the two numbers such that they add up to target.', 'PRACTICE', NULL, '{}', 'Automated Code Problem - 1784577962843');
INSERT INTO public.problem_versions VALUES (13, true, false, 64000, 15, 1000, 1, '2026-07-21 03:09:42.619134+07', '2 <= nums.length <= 10^4', 'This is a description written by the Playwright automated E2E test suite.', 'EASY', '[2,7,11,15]
9', '[0,1]', '[]', 'An array of integers nums and an integer target.', 'Indices of the two numbers such that they add up to target.', 'PRACTICE', NULL, '{}', 'Automated Code Problem - 1784578160445');
INSERT INTO public.problem_versions VALUES (14, true, true, 256000, 1, 2000, 1, '2026-07-21 03:12:06.542368+07', '1 <= n <= 1000', 'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.', 'EASY', NULL, NULL, NULL, 'First line contains n. Second line contains n integers.', 'Indices of two numbers.', 'PRACTICE', NULL, NULL, 'Automated Code Problem');
INSERT INTO public.problem_versions VALUES (15, true, false, 64000, 16, 1000, 1, '2026-07-21 03:17:36.436501+07', '2 <= nums.length <= 10^4', 'This is a description written by the Playwright automated E2E test suite.', 'EASY', '[2,7,11,15]
9', '[0,1]', '[]', 'An array of integers nums and an integer target.', 'Indices of the two numbers such that they add up to target.', 'PRACTICE', NULL, '{}', 'Automated Code Problem - 1784578634267');
INSERT INTO public.problem_versions VALUES (16, true, false, 64000, 17, 1000, 1, '2026-07-21 03:21:15.88736+07', '2 <= nums.length <= 10^4', 'This is a description written by the Playwright automated E2E test suite.', 'EASY', '[2,7,11,15]
9', '[0,1]', '[]', 'An array of integers nums and an integer target.', 'Indices of the two numbers such that they add up to target.', 'PRACTICE', NULL, '{}', 'Automated Code Problem - 1784578853686');
INSERT INTO public.problem_versions VALUES (17, true, false, 64000, 18, 1000, 1, '2026-07-21 07:28:45.714241+07', '2 <= nums.length <= 10^4', 'This is a description written by the Playwright automated E2E test suite.', 'EASY', '[2,7,11,15]
9', '[0,1]', '[]', 'An array of integers nums and an integer target.', 'Indices of the two numbers such that they add up to target.', 'PRACTICE', NULL, '{}', 'Automated Code Problem - 1784593703492');
INSERT INTO public.problem_versions VALUES (18, true, true, 128000, 19, 2000, 1, '2026-07-21 22:58:57.301564+07', 'The length of the string is between 1 and 100.', 'Write a function that reverses a string. The input string is given as a single line.', 'EASY', 'hello', 'olleh', NULL, 'A single line containing the string s.', 'Print the reversed string.', 'PRACTICE', 'def solve(s):
    return s[::-1]

if __name__ == ''__main__'':
    import sys
    s = sys.stdin.read().strip()
    print(solve(s))', '{"python":"def solve(s):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    import sys\n    s = sys.stdin.read().strip()\n    print(solve(s))"}', 'Reverse String');
INSERT INTO public.problem_versions VALUES (19, true, true, 128000, 20, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= n <= 100', 'Given an integer n, print string representations of numbers from 1 to n. For multiples of three print ''Fizz'' instead of the number and for the multiples of five print ''Buzz''. For numbers which are multiples of both three and five print ''FizzBuzz''.', 'EASY', '5', '1 2 Fizz 4 Buzz', NULL, 'A single integer n.', 'Print space-separated representations of numbers from 1 to n.', 'PRACTICE', 'def solve(n):
    res = []
    for i in range(1, n + 1):
        if i % 3 == 0 and i % 5 == 0:
            res.append("FizzBuzz")
        elif i % 3 == 0:
            res.append("Fizz")
        elif i % 5 == 0:
            res.append("Buzz")
        else:
            res.append(str(i))
    return " ".join(res)

if __name__ == ''__main__'':
    n = int(input())
    print(solve(n))', '{"python":"def solve(n):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    n = int(input())\n    print(solve(n))"}', 'Fizz Buzz');
INSERT INTO public.problem_versions VALUES (20, true, true, 128000, 21, 2000, 1, '2026-07-21 22:58:57.301564+07', 'The length of strings is between 1 and 100.', 'Given two strings s and t, return true if t is an anagram of s, and false otherwise.', 'EASY', 'anagram nagaram', 'true', NULL, 'A single line containing two space-separated strings s and t.', 'Print true if they are anagrams, otherwise false.', 'PRACTICE', 'def solve(s, t):
    return sorted(s) == sorted(t)

if __name__ == ''__main__'':
    s, t = input().split()
    print("true" if solve(s, t) else "false")', '{"python":"def solve(s, t):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    s, t = input().split()\n    print(\"true\" if solve(s, t) else \"false\")"}', 'Valid Anagram');
INSERT INTO public.problem_versions VALUES (21, true, true, 128000, 22, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= nums.length <= 100.', 'Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.', 'EASY', '2 2 1', '1', NULL, 'A single line of space-separated integers.', 'Print the single integer.', 'PRACTICE', 'def solve(nums):
    res = 0
    for x in nums:
        res ^= x
    return res

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print(solve(nums))', '{"python":"def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(solve(nums))"}', 'Single Number');
INSERT INTO public.problem_versions VALUES (22, true, true, 128000, 23, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= nums.length <= 100.', 'Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.', 'EASY', '1 2 3 1', 'true', NULL, 'A single line of space-separated integers representing the array.', 'Print true if there is a duplicate, otherwise false.', 'PRACTICE', 'def solve(nums):
    return len(nums) != len(set(nums))

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print("true" if solve(nums) else "false")', '{"python":"def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(\"true\" if solve(nums) else \"false\")"}', 'Contains Duplicate');
INSERT INTO public.problem_versions VALUES (23, true, true, 128000, 24, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= nums.length <= 100.', 'Given an array nums of size n, return the majority element. The majority element is the element that appears more than ⌊n / 2⌋ times.', 'EASY', '3 2 3', '3', NULL, 'A single line of space-separated integers.', 'Print the majority element.', 'PRACTICE', 'def solve(nums):
    return sorted(nums)[len(nums)//2]

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print(solve(nums))', '{"python":"def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(solve(nums))"}', 'Majority Element');
INSERT INTO public.problem_versions VALUES (24, true, true, 128000, 25, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= nums.length <= 100.', 'Given an integer array nums, move all 0''s to the end of it while maintaining the relative order of the non-zero elements.', 'EASY', '0 1 0 3 12', '1 3 12 0 0', NULL, 'A single line of space-separated integers.', 'Print the space-separated resulting array.', 'PRACTICE', 'def solve(nums):
    non_zero = [x for x in nums if x != 0]
    zeroes = [0] * (len(nums) - len(non_zero))
    return " ".join(map(str, non_zero + zeroes))

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print(solve(nums))', '{"python":"def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(solve(nums))"}', 'Move Zeroes');
INSERT INTO public.problem_versions VALUES (25, true, true, 128000, 26, 2000, 1, '2026-07-21 22:58:57.301564+07', '-10^4 <= nums[i] <= 10^4', 'Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.', 'EASY', '-4 -1 0 3 10', '0 1 9 16 100', NULL, 'A single line containing space-separated sorted integers.', 'Print the space-separated sorted squares of each number.', 'PRACTICE', 'def solve(nums):
    res = sorted([x * x for x in nums])
    return " ".join(map(str, res))

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print(solve(nums))', '{"python":"def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(solve(nums))"}', 'Squares of a Sorted Array');
INSERT INTO public.problem_versions VALUES (26, true, true, 128000, 27, 2000, 1, '2026-07-21 22:58:57.301564+07', '0 <= n <= 30', 'The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. Given n, calculate F(n).', 'EASY', '2', '1', NULL, 'A single integer n.', 'Print the value of F(n).', 'PRACTICE', 'def solve(n):
    if n == 0: return 0
    a, b = 0, 1
    for _ in range(2, n + 1):
        a, b = b, a + b
    return b

if __name__ == ''__main__'':
    n = int(input())
    print(solve(n))', '{"python":"def solve(n):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    n = int(input())\n    print(solve(n))"}', 'Fibonacci Number');
INSERT INTO public.problem_versions VALUES (27, true, true, 128000, 28, 2000, 1, '2026-07-21 22:58:57.301564+07', 'The IP address is valid.', 'Given a valid (IPv4) IP address, return a defanged version of that IP address. A defanged IP address replaces every period ''.'' with ''[.]''.', 'EASY', '1.1.1.1', '1[.]1[.]1[.]1', NULL, 'A single string representing a valid IPv4 address.', 'Print the defanged IP address.', 'PRACTICE', 'def solve(ip):
    return ip.replace(''.'', ''[.]'')

if __name__ == ''__main__'':
    ip = input().strip()
    print(solve(ip))', '{"python":"def solve(ip):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    ip = input().strip()\n    print(solve(ip))"}', 'Defanging an IP Address');
INSERT INTO public.problem_versions VALUES (28, true, true, 128000, 29, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= ransomNote.length, magazine.length <= 100.', 'Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise. Each letter in magazine can only be used once in ransomNote.', 'EASY', 'a b', 'false', NULL, 'Two space-separated strings ransomNote and magazine.', 'Print true if ransomNote can be constructed from magazine, otherwise false.', 'CONTEST', 'from collections import Counter
def solve(r, m):
    cr = Counter(r)
    cm = Counter(m)
    for k, v in cr.items():
        if cm[k] < v:
            return False
    return True

if __name__ == ''__main__'':
    r, m = input().split()
    print("true" if solve(r, m) else "false")', '{"python":"def solve(r, m):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    r, m = input().split()\n    print(\"true\" if solve(r, m) else \"false\")"}', 'Ransom Note');
INSERT INTO public.problem_versions VALUES (29, true, true, 128000, 30, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= s.length <= 100.', 'Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.', 'EASY', 'leetcode', '0', NULL, 'A single string s.', 'Print the 0-based index of the first non-repeating character, or -1.', 'CONTEST', 'from collections import Counter
def solve(s):
    c = Counter(s)
    for i, char in enumerate(s):
        if c[char] == 1:
            return i
    return -1

if __name__ == ''__main__'':
    s = input().strip()
    print(solve(s))', '{"python":"def solve(s):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    s = input().strip()\n    print(solve(s))"}', 'First Unique Character in a String');
INSERT INTO public.problem_versions VALUES (30, true, true, 128000, 31, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= n <= 100.', 'Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.', 'EASY', '3 0 1', '2', NULL, 'A single line of space-separated integers.', 'Print the missing number.', 'CONTEST', 'def solve(nums):
    n = len(nums)
    expected = n * (n + 1) // 2
    actual = sum(nums)
    return expected - actual

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print(solve(nums))', '{"python":"def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(solve(nums))"}', 'Missing Number');
INSERT INTO public.problem_versions VALUES (31, true, true, 128000, 32, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= num <= 2^31 - 1.', 'Given a positive integer num, return true if num is a perfect square else false. Do not use any built-in library function such as sqrt.', 'EASY', '16', 'true', NULL, 'A single positive integer num.', 'Print true if it is a perfect square, otherwise false.', 'CONTEST', 'def solve(num):
    if num < 0: return False
    r = int(num**0.5)
    return r * r == num

if __name__ == ''__main__'':
    num = int(input())
    print("true" if solve(num) else "false")', '{"python":"def solve(num):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    num = int(input())\n    print(\"true\" if solve(num) else \"false\")"}', 'Valid Perfect Square');
INSERT INTO public.problem_versions VALUES (32, true, true, 128000, 33, 2000, 1, '2026-07-21 22:58:57.301564+07', '-2^31 <= n <= 2^31 - 1.', 'Given an integer n, return true if it is a power of three. Otherwise, return false. An integer n is a power of three if there exists an integer x such that n == 3^x.', 'EASY', '27', 'true', NULL, 'A single integer n.', 'Print true if it is a power of three, otherwise false.', 'CONTEST', 'def solve(n):
    if n <= 0: return False
    while n % 3 == 0:
        n //= 3
    return n == 1

if __name__ == ''__main__'':
    n = int(input())
    print("true" if solve(n) else "false")', '{"python":"def solve(n):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    n = int(input())\n    print(\"true\" if solve(n) else \"false\")"}', 'Power of Three');
INSERT INTO public.problem_versions VALUES (33, true, true, 128000, 34, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= s.length <= 100.', 'Given a string s, reverse only all the vowels in the string and return it. The vowels are ''a'', ''e'', ''i'', ''o'', and ''u'', and they can appear in both lower and upper cases.', 'EASY', 'hello', 'holle', NULL, 'A single string s.', 'Print the modified string.', 'CONTEST', 'def solve(s):
    s = list(s)
    vowels = set("aeiouAEIOU")
    i, j = 0, len(s) - 1
    while i < j:
        if s[i] not in vowels:
            i += 1
        elif s[j] not in vowels:
            j -= 1
        else:
            s[i], s[j] = s[j], s[i]
            i += 1
            j -= 1
    return "".join(s)

if __name__ == ''__main__'':
    s = input().strip()
    print(solve(s))', '{"python":"def solve(s):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    s = input().strip()\n    print(solve(s))"}', 'Reverse Vowels of a String');
INSERT INTO public.problem_versions VALUES (34, true, true, 128000, 35, 2000, 1, '2026-07-21 22:58:57.301564+07', 'n == nums.length, 1 <= n <= 100.', 'Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums. Print them space-separated.', 'EASY', '4 3 2 7 8 2 3 1', '5 6', NULL, 'A single line of space-separated integers.', 'Print space-separated missing integers.', 'CONTEST', 'def solve(nums):
    n = len(nums)
    s = set(nums)
    res = [i for i in range(1, n + 1) if i not in s]
    return " ".join(map(str, res))

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print(solve(nums))', '{"python":"def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(solve(nums))"}', 'Find All Numbers Disappeared in an Array');
INSERT INTO public.problem_versions VALUES (35, true, true, 128000, 36, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= nums1.length, nums2.length <= 100.', 'Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order. The output should be sorted.', 'EASY', '1 2 2 1
2 2', '2 2', NULL, 'Two lines of space-separated integers.', 'Print the space-separated sorted intersection.', 'CONTEST', 'from collections import Counter
def solve(nums1, nums2):
    c1 = Counter(nums1)
    c2 = Counter(nums2)
    res = []
    for k in c1:
        if k in c2:
            res.extend([k] * min(c1[k], c2[k]))
    return " ".join(map(str, sorted(res)))

if __name__ == ''__main__'':
    import sys
    lines = sys.stdin.read().splitlines()
    if len(lines) < 2:
        print("")
    else:
        nums1 = list(map(int, lines[0].split()))
        nums2 = list(map(int, lines[1].split()))
        print(solve(nums1, nums2))', '{"python":"def solve(nums1, nums2):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    import sys\n    lines = sys.stdin.read().splitlines()\n    nums1 = list(map(int, lines[0].split()))\n    nums2 = list(map(int, lines[1].split()))\n    print(solve(nums1, nums2))"}', 'Intersection of Two Arrays II');
INSERT INTO public.problem_versions VALUES (36, true, true, 128000, 37, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= nums.length <= 100.', 'Given an integer array nums, return the third distinct maximum number in this array. If the third maximum does not exist, return the maximum number.', 'EASY', '3 2 1', '1', NULL, 'A single line of space-separated integers.', 'Print the third maximum (or first maximum if it does not exist).', 'CONTEST', 'def solve(nums):
    s = sorted(list(set(nums)))
    if len(s) >= 3:
        return s[-3]
    return s[-1]

if __name__ == ''__main__'':
    nums = list(map(int, input().split()))
    print(solve(nums))', '{"python":"def solve(nums):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    nums = list(map(int, input().split()))\n    print(solve(nums))"}', 'Third Maximum Number');
INSERT INTO public.problem_versions VALUES (37, true, true, 128000, 38, 2000, 1, '2026-07-21 22:58:57.301564+07', '1 <= words.length <= 100.', 'Given an array of strings words, return the words that can be typed using letters of alphabet on only one row of American keyboard. Print them space-separated.', 'EASY', 'Hello Alaska Dad Peace', 'Alaska Dad', NULL, 'A single line of space-separated words.', 'Print space-separated words matching the condition.', 'CONTEST', 'def solve(words):
    r1 = set("qwertyuiop")
    r2 = set("asdfghjkl")
    r3 = set("zxcvbnm")
    res = []
    for w in words:
        lw = set(w.lower())
        if lw.issubset(r1) or lw.issubset(r2) or lw.issubset(r3):
            res.append(w)
    return " ".join(res)

if __name__ == ''__main__'':
    words = input().split()
    print(solve(words))', '{"python":"def solve(words):\n    # Write your code here\n    pass\n\nif __name__ == ''__main__'':\n    words = input().split()\n    print(solve(words))"}', 'Keyboard Row');


--
-- Data for Name: problem_visualizer_cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.problem_visualizer_cache VALUES (9, '2026-07-21 22:16:36.01765+07', 'Palindrome Number', '<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Palindrome Number Visualizer</title>
    <script src=''https://cdn.tailwindcss.com''></script>
    <style>
        /* Custom scrollbar for dark theme */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #1f2937; /* gray-800 */
        }
        ::-webkit-scrollbar-thumb {
            background: #4b5563; /* gray-600 */
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #6b7280; /* gray-500 */
        }
        .digit-box {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px; /* Fixed width for digits */
            height: 50px;
            margin: 2px;
            border-radius: 8px;
            border: 1px solid;
            transition: all 0.4s cubic-bezier(0.4,0,0.2,1);
            font-weight: bold;
            color: #e5e7eb; /* gray-200 */
            background-color: #3b82f6; /* blue-500 */
            border-color: #60a5fa; /* blue-400 */
        }
        .digit-box.highlight {
            background-color: #fbbf24; /* amber-400 */
            border-color: #fcd34d; /* amber-300 */
            box-shadow: 0 0 0 2px rgba(251, 191, 36, 0.5); /* ring-2 ring-amber-400/50 */
        }
        .digit-box.final-success {
            background-color: #10b981; /* emerald-500 */
            border-color: #34d399; /* emerald-400 */
        }
        .digit-box.final-fail {
            background-color: #ef4444; /* red-500 */
            border-color: #f87171; /* red-400 */
        }
        .digit-box.reverted {
            background-color: #a855f7; /* purple-500 */
            border-color: #c084fc; /* purple-400 */
        }
    </style>
</head>
<body class=''h-screen w-screen overflow-hidden flex flex-row bg-gray-950 text-white font-sans''>

    <!-- Left Panel (70% width, Main Visualization) -->
    <div class=''w-[70%] h-full flex flex-col relative''>
        <!-- Top Bar -->
        <div class=''p-4 border-b border-gray-800 flex justify-between items-center bg-gray-900/50''>
            <h2 class=''text-2xl font-bold text-gray-100 flex items-center''>
                🔢 Palindrome Number
            </h2>
            <span id=''step-counter'' class=''bg-blue-900/50 text-blue-300 px-3 py-1 rounded-full text-sm font-mono''>
                Step: 0
            </span>
        </div>

        <!-- Main Canvas -->
        <div id=''canvas'' class=''flex-1 flex items-center justify-center overflow-hidden w-full relative p-4''>
            <div id=''viz-wrapper'' class=''flex flex-col items-center justify-center gap-8'' style=''transform-origin: center center; display: inline-block; transition: transform 0.3s; position: relative;''>
                <div class=''flex flex-col items-center p-4 bg-gray-800/70 backdrop-blur-sm rounded-2xl border border-gray-700/50 shadow-xl''>
                    <div class=''text-lg font-semibold text-gray-300 mb-2''>Original Number:</div>
                    <div id=''original-num-display'' class=''flex text-3xl font-mono''></div>
                </div>

                <div class=''flex flex-col items-center p-4 bg-gray-800/70 backdrop-blur-sm rounded-2xl border border-gray-700/50 shadow-xl''>
                    <div class=''text-lg font-semibold text-gray-300 mb-2''>Current Number (num):</div>
                    <div id=''current-num-display'' class=''flex text-3xl font-mono''></div>
                </div>

                <div class=''flex flex-col items-center p-4 bg-gray-800/70 backdrop-blur-sm rounded-2xl border border-gray-700/50 shadow-xl''>
                    <div class=''text-lg font-semibold text-gray-300 mb-2''>Reverted Number (revertedNum):</div>
                    <div id=''reverted-num-display'' class=''flex text-3xl font-mono''></div>
                </div>
            </div>
        </div>

        <!-- Bottom Bar: Color Legend -->
        <div class=''p-2 border-t border-gray-800 flex gap-4 justify-center text-xs text-gray-400 bg-gray-900/50''>
            <div class=''flex items-center gap-1''>
                <span class=''w-3 h-3 rounded-full bg-blue-500 border border-blue-400''></span> Default
            </div>
            <div class=''flex items-center gap-1''>
                <span class=''w-3 h-3 rounded-full bg-amber-400 border border-amber-300''></span> Current Digit
            </div>
            <div class=''flex items-center gap-1''>
                <span class=''w-3 h-3 rounded-full bg-purple-500 border border-purple-400''></span> Reverted Digit
            </div>
            <div class=''flex items-center gap-1''>
                <span class=''w-3 h-3 rounded-full bg-emerald-500 border border-emerald-400''></span> Palindrome
            </div>
            <div class=''flex items-center gap-1''>
                <span class=''w-3 h-3 rounded-full bg-red-500 border border-red-400''></span> Not Palindrome
            </div>
        </div>
    </div>

    <!-- Right Panel (30% width, Controls & Log) -->
    <div class=''w-[30%] h-full flex flex-col bg-gray-900 border-l border-gray-700''>
        <!-- Top Controls -->
        <div class=''p-4 border-b border-gray-700 flex flex-col gap-3 bg-gray-800/50''>
            <div class=''grid grid-cols-3 gap-2''>
                <button id=''runBtn'' class=''bg-emerald-600 hover:bg-emerald-700 text-white rounded border border-emerald-700 font-bold py-2 shadow-sm transition-transform active:scale-95 text-xs text-center''>
                    ▶ Run
                </button>
                <button id=''stopBtn'' class=''bg-red-600 hover:bg-red-700 text-white rounded border border-red-700 font-bold py-2 shadow-sm transition-transform active:scale-95 text-xs text-center''>
                    ⏹ Stop
                </button>
                <button id=''resetBtn'' class=''bg-gray-600 hover:bg-gray-700 text-white rounded border border-gray-700 font-bold py-2 shadow-sm transition-transform active:scale-95 text-xs text-center''>
                    ↺ Reset
                </button>
            </div>
        </div>

        <!-- Log Panel -->
        <div id=''log'' class=''flex-1 overflow-y-auto p-4 flex flex-col gap-2''>
            <!-- Log entries will be prepended here -->
        </div>
    </div>

    <script>
        const originalNumDisplay = document.getElementById(''original-num-display'');
        const currentNumDisplay = document.getElementById(''current-num-display'');
        const revertedNumDisplay = document.getElementById(''reverted-num-display'');
        const stepCounter = document.getElementById(''step-counter'');
        const log = document.getElementById(''log'');
        const runBtn = document.getElementById(''runBtn'');
        const stopBtn = document.getElementById(''stopBtn'');
        const resetBtn = document.getElementById(''resetBtn'');

        let initialX = 12321; // Sample data
        let x = initialX;
        let revertedNumber = 0;
        let isPaused = false;
        let isRunning = false;
        let stepCount = 0;
        let delay = 1000; // Default delay in ms

        const sleep = (ms) => new Promise(r => setTimeout(r, ms));

        window.addEventListener(''message'', (e) => {
            if (e.data && e.data.type === ''SET_SPEED'') {
                delay = e.data.value;
            }
        });

        function addLog(msg, type = ''info'') {
            const el = document.createElement(''div'');
            el.textContent = msg;
            let baseClass = ''text-sm font-mono p-2 rounded mb-1 shadow-sm'';
            if (type === ''info'') {
                el.className = `${baseClass} text-amber-300 bg-gray-800/80 border-l-2 border-amber-500`;
            } else if (type === ''success'') {
                el.className = `${baseClass} text-emerald-300 bg-gray-800/80 border-l-2 border-emerald-500`;
            } else if (type === ''error'') {
                el.className = `${baseClass} text-red-300 bg-gray-800/80 border-l-2 border-red-500`;
            }
            log.prepend(el);
        }

        function updateStepCounter() {
            stepCounter.textContent = `Step: ${stepCount}`;
        }

        async function waitIfPaused() {
            while (isPaused) {
                await sleep(100);
            }
        }

        function renderNumbers() {
            originalNumDisplay.innerHTML = '''';
            String(initialX).split('''').forEach(digit => {
                const span = document.createElement(''span'');
                span.textContent = digit;
                span.className = ''digit-box'';
                originalNumDisplay.appendChild(span);
            });

            currentNumDisplay.innerHTML = '''';
            if (x === 0 && initialX !== 0) { // Special case for 0 when it''s fully processed
                const span = document.createElement(''span'');
                span.textContent = ''0'';
                span.className = ''digit-box'';
                currentNumDisplay.appendChild(span);
            } else if (x !== 0) {
                String(x).split('''').forEach(digit => {
                    const span = document.createElement(''span'');
                    span.textContent = digit;
                    span.className = ''digit-box'';
                    currentNumDisplay.appendChild(span);
                });
            }


            revertedNumDisplay.innerHTML = '''';
            if (revertedNumber === 0 && x !== initialX) { // Only show 0 if it''s the initial state or if x is not initialX
                const span = document.createElement(''span'');
                span.textContent = ''0'';
                span.className = ''digit-box reverted'';
                revertedNumDisplay.appendChild(span);
            } else if (revertedNumber !== 0) {
                String(revertedNumber).split('''').forEach(digit => {
                    const span = document.createElement(''span'');
                    span.textContent = digit;
                    span.className = ''digit-box reverted'';
                    revertedNumDisplay.appendChild(span);
                });
            }
            autoScale();
        }

        function reset() {
            isPaused = true;
            isRunning = false;
            x = initialX;
            revertedNumber = 0;
            stepCount = 0;
            log.innerHTML = '''';
            renderNumbers();
            updateStepCounter();
            runBtn.disabled = false;
            runBtn.classList.remove(''opacity-50'', ''cursor-not-allowed'');
            addLog(''Algorithm reset. Ready to run.'');
        }

        async function visualizePalindrome() {
            isRunning = true;
            runBtn.disabled = true;
            runBtn.classList.add(''opacity-50'', ''cursor-not-allowed'');

            addLog(`Starting Palindrome Number check for x = ${initialX}`);
            stepCount++; updateStepCounter(); await waitIfPaused(); await sleep(delay);

            // Edge Case 1: Negative numbers
            if (x < 0) {
                addLog(`x (${initialX}) is negative. Negative numbers are not palindromes.`, ''error'');
                originalNumDisplay.querySelectorAll(''.digit-box'').forEach(el => el.classList.add(''final-fail''));
                addLog(`Algorithm complete! ${initialX} is NOT a palindrome.`, ''error'');
                isRunning = false;
                return;
            }
            stepCount++; updateStepCounter(); await waitIfPaused(); await sleep(delay);

            // Edge Case 2: Numbers ending in 0 (except 0 itself)
            if (x % 10 === 0 && x !== 0) {
                addLog(`x (${initialX}) ends in 0 and is not 0 itself. Such numbers cannot be palindromes.`, ''error'');
                originalNumDisplay.querySelectorAll(''.digit-box'').forEach(el => el.classList.add(''final-fail''));
                addLog(`Algorithm complete! ${initialX} is NOT a palindrome.`, ''error'');
                isRunning = false;
                return;
            }
            stepCount++; updateStepCounter(); await waitIfPaused(); await sleep(delay);

            // Main logic: Reverse half of the number
            addLog(`Starting to reverse the second half of the number.`);
            while (x > revertedNumber) {
                await waitIfPaused();

                const currentNumDigits = currentNumDisplay.querySelectorAll(''.digit-box'');
                if (currentNumDigits.length > 0) {
                    currentNumDigits[currentNumDigits.length - 1].classList.add(''highlight'');
                }
                addLog(`Current num: ${x}, Reverted num: ${revertedNumber}. Condition (num > revertedNum) is true.`);
                stepCount++; updateStepCounter(); await sleep(delay);

                const digit = x % 10;
                addLog(`Extracting last digit (${digit}) from num (${x}).`);
                stepCount++; updateStepCounter(); await sleep(delay);

                revertedNumber = revertedNumber * 10 + digit;
                renderNumbers(); // Re-render to show new revertedNumber
                const revertedNumBoxes = revertedNumDisplay.querySelectorAll(''.digit-box'');
                if (revertedNumBoxes.length > 0) {
                    revertedNumBoxes[revertedNumBoxes.length - 1].classList.add(''highlight'');
                }
                addLog(`revertedNumber becomes ${revertedNumber}.`);
                stepCount++; updateStepCounter(); await sleep(delay);

                x = Math.floor(x / 10);
                renderNumbers(); // Re-render to show new x
                addLog(`num becomes ${x}.`);
                stepCount++; updateStepCounter(); await sleep(delay);

                // Remove highlight from previous digit in currentNum and current digit in revertedNum
                currentNumDisplay.querySelectorAll(''.digit-box'').forEach(el => el.classList.remove(''highlight''));
                revertedNumDisplay.querySelectorAll(''.digit-box'').forEach(el => el.classList.remove(''highlight''));
            }

            addLog(`Loop condition (num > revertedNum) is false. num: ${x}, revertedNum: ${revertedNumber}.`);
            stepCount++; updateStepCounter(); await waitIfPaused(); await sleep(delay);

            // Final comparison
            const isPalindrome = x === revertedNumber || x === Math.floor(revertedNumber / 10);

            addLog(`Comparing num (${x}) with revertedNumber (${revertedNumber}) and revertedNumber / 10 (${Math.floor(revertedNumber / 10)}).`);
            stepCount++; updateStepCounter(); await waitIfPaused(); await sleep(delay);

            if (isPalindrome) {
                addLog(`Match found! ${initialX} is a palindrome.`, ''success'');
                originalNumDisplay.querySelectorAll(''.digit-box'').forEach(el => el.classList.add(''final-success''));
            } else {
                addLog(`No match. ${initialX} is NOT a palindrome.`, ''error'');
                originalNumDisplay.querySelectorAll(''.digit-box'').forEach(el => el.classList.add(''final-fail''));
            }
            stepCount++; updateStepCounter(); await waitIfPaused(); await sleep(delay);

            addLog(`Algorithm complete!`, isPalindrome ? ''success'' : ''error'');
            isRunning = false;
            runBtn.disabled = true; // Disable run after completion
            runBtn.classList.add(''opacity-50'', ''cursor-not-allowed'');
        }

        // Event Listeners
        runBtn.addEventListener(''click'', () => {
            if (!isRunning) {
                isPaused = false;
                visualizePalindrome();
            } else {
                isPaused = false;
            }
        });

        stopBtn.addEventListener(''click'', () => {
            isPaused = true;
            addLog(''Algorithm paused.'');
        });

        resetBtn.addEventListener(''click'', reset);

        // Auto-scaling for visualization wrapper
        function autoScale() {
            const container = document.getElementById(''canvas'');
            const wrapper = document.getElementById(''viz-wrapper'');
            if (!container || !wrapper) return;

            // Reset transform to get natural dimensions
            wrapper.style.transform = ''scale(1)'';

            const containerWidth = container.clientWidth - 40; // Subtract padding
            const containerHeight = container.clientHeight - 40; // Subtract padding

            const wrapperWidth = wrapper.scrollWidth;
            const wrapperHeight = wrapper.scrollHeight;

            if (wrapperWidth === 0 || wrapperHeight === 0) return; // Avoid division by zero

            const scaleX = containerWidth / wrapperWidth;
            const scaleY = containerHeight / wrapperHeight;
            const scale = Math.min(1, scaleX, scaleY);

            wrapper.style.transform = ''scale('' + scale + '')'';
        }

        // Initial setup
        reset();
        window.addEventListener(''resize'', autoScale);
        autoScale(); // Initial call
    </script>
</body>
</html>', '78e00596-92c9-40b5-a3ec-2b2f0e84c5ac', '4', 'Time: O(log N) | Space: O(1)', '3');


--
-- Data for Name: problems; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.problems VALUES (1, 8, true, true, 100.00, 0, 0, 10, '2026-07-21 02:34:08.590636+07', '2026-07-21 02:34:08.590636+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 9, true, true, 100.00, 0, 0, 10, '2026-07-21 02:34:08.593221+07', '2026-07-21 02:34:08.593221+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 10, true, true, 100.00, 0, 0, 10, '2026-07-21 02:34:08.595274+07', '2026-07-21 02:34:08.595274+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 11, true, true, 100.00, 0, 0, 10, '2026-07-21 02:34:08.598092+07', '2026-07-21 02:34:08.598092+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 12, true, true, 100.00, 0, 0, 10, '2026-07-21 02:34:08.600332+07', '2026-07-21 02:34:08.600332+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 15, false, false, 100.00, 0, 0, 0, '2026-07-21 03:09:42.619048+07', '2026-07-21 03:09:42.619049+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 18, false, false, 100.00, 0, 0, 0, '2026-07-21 07:28:45.714165+07', '2026-07-21 07:28:45.714166+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 38, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 4, true, true, 100.00, 0, 0, 10, '2026-07-21 02:34:08.581087+07', '2026-07-21 02:34:08.581087+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 5, true, true, 100.00, 0, 0, 10, '2026-07-21 02:34:08.583612+07', '2026-07-21 02:34:08.583612+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 6, true, true, 100.00, 0, 0, 10, '2026-07-21 02:34:08.586506+07', '2026-07-21 02:34:08.586506+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 7, true, true, 100.00, 0, 0, 10, '2026-07-21 02:34:08.58859+07', '2026-07-21 02:34:08.58859+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 14, false, false, 100.00, 0, 0, 0, '2026-07-21 03:06:24.999184+07', '2026-07-21 03:06:24.999185+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 1, true, true, 100.00, 0, 2, 1, '2026-07-21 03:06:15.196736+07', '2026-07-21 03:06:15.196736+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 16, false, false, 100.00, 0, 0, 0, '2026-07-21 03:17:36.43643+07', '2026-07-21 03:17:36.436432+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 17, false, false, 100.00, 0, 0, 0, '2026-07-21 03:21:15.887354+07', '2026-07-21 03:21:15.887354+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 3, true, true, 100.00, 430, 1013, 10, '2026-07-21 02:34:08.57634+07', '2026-07-21 02:34:08.57634+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 19, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 20, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 21, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 22, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 23, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 24, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 25, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 26, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 13, false, false, 100.00, 0, 0, 0, '2026-07-21 02:50:00.691765+07', '2026-07-21 02:50:00.691766+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 27, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 28, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'PRACTICE');
INSERT INTO public.problems VALUES (1, 29, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 30, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 31, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 32, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 33, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 34, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 35, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 36, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'CONTEST');
INSERT INTO public.problems VALUES (1, 37, true, true, 100.00, 0, 0, 10, '2026-07-21 22:58:57.301564+07', '2026-07-21 22:58:57.301564+07', 'CONTEST');


--
-- Data for Name: quiz_attempt_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: quiz_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: quiz_options; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: quiz_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (1, 'ADMIN');
INSERT INTO public.roles VALUES (2, 'USER');
INSERT INTO public.roles VALUES (3, 'INSTRUCTOR');


--
-- Data for Name: user_daily_activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_daily_activities VALUES ('2026-07-21', 2, 1, 3, '2026-07-21 02:27:16.381314+07');
INSERT INTO public.user_daily_activities VALUES ('2026-07-21', 5, 1, 2, '2026-07-21 02:36:01.96913+07');
INSERT INTO public.user_daily_activities VALUES ('2026-07-21', 18, 1, 1, '2026-07-21 02:43:22.334246+07');
INSERT INTO public.user_daily_activities VALUES ('2026-07-21', 20, 1, 104, '2026-07-21 02:54:04.595572+07');
INSERT INTO public.user_daily_activities VALUES ('2026-07-21', 119, 1, 105, '2026-07-21 03:15:15.69116+07');
INSERT INTO public.user_daily_activities VALUES ('2026-07-21', 120, 1, 106, '2026-07-21 03:17:17.377467+07');
INSERT INTO public.user_daily_activities VALUES ('2026-07-21', 177, 1, 107, '2026-07-21 07:34:23.247846+07');
INSERT INTO public.user_daily_activities VALUES ('2026-07-21', 224, 1, 108, '2026-07-21 22:07:06.454989+07');
INSERT INTO public.user_daily_activities VALUES ('2026-07-22', 243, 2, 1, '2026-07-22 00:19:22.050516+07');


--
-- Data for Name: user_oauth_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_oauth_accounts VALUES (1, 3, '2026-07-21 02:27:16.343035+07', 'google', '108546058153295560871');


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_roles VALUES (1, 1);
INSERT INTO public.user_roles VALUES (2, 3);
INSERT INTO public.user_roles VALUES (3, 3);
INSERT INTO public.user_roles VALUES (2, 4);
INSERT INTO public.user_roles VALUES (2, 5);
INSERT INTO public.user_roles VALUES (2, 6);
INSERT INTO public.user_roles VALUES (2, 7);
INSERT INTO public.user_roles VALUES (2, 8);
INSERT INTO public.user_roles VALUES (2, 9);
INSERT INTO public.user_roles VALUES (2, 10);
INSERT INTO public.user_roles VALUES (2, 11);
INSERT INTO public.user_roles VALUES (2, 12);
INSERT INTO public.user_roles VALUES (2, 13);
INSERT INTO public.user_roles VALUES (2, 14);
INSERT INTO public.user_roles VALUES (2, 15);
INSERT INTO public.user_roles VALUES (2, 16);
INSERT INTO public.user_roles VALUES (2, 17);
INSERT INTO public.user_roles VALUES (2, 18);
INSERT INTO public.user_roles VALUES (2, 19);
INSERT INTO public.user_roles VALUES (2, 20);
INSERT INTO public.user_roles VALUES (2, 21);
INSERT INTO public.user_roles VALUES (2, 22);
INSERT INTO public.user_roles VALUES (2, 23);
INSERT INTO public.user_roles VALUES (2, 24);
INSERT INTO public.user_roles VALUES (2, 25);
INSERT INTO public.user_roles VALUES (2, 26);
INSERT INTO public.user_roles VALUES (2, 27);
INSERT INTO public.user_roles VALUES (2, 28);
INSERT INTO public.user_roles VALUES (2, 29);
INSERT INTO public.user_roles VALUES (2, 30);
INSERT INTO public.user_roles VALUES (2, 31);
INSERT INTO public.user_roles VALUES (2, 32);
INSERT INTO public.user_roles VALUES (2, 33);
INSERT INTO public.user_roles VALUES (2, 34);
INSERT INTO public.user_roles VALUES (2, 35);
INSERT INTO public.user_roles VALUES (2, 36);
INSERT INTO public.user_roles VALUES (2, 37);
INSERT INTO public.user_roles VALUES (2, 38);
INSERT INTO public.user_roles VALUES (2, 39);
INSERT INTO public.user_roles VALUES (2, 40);
INSERT INTO public.user_roles VALUES (2, 41);
INSERT INTO public.user_roles VALUES (2, 42);
INSERT INTO public.user_roles VALUES (2, 43);
INSERT INTO public.user_roles VALUES (2, 44);
INSERT INTO public.user_roles VALUES (2, 45);
INSERT INTO public.user_roles VALUES (2, 46);
INSERT INTO public.user_roles VALUES (2, 47);
INSERT INTO public.user_roles VALUES (2, 48);
INSERT INTO public.user_roles VALUES (2, 49);
INSERT INTO public.user_roles VALUES (2, 50);
INSERT INTO public.user_roles VALUES (2, 51);
INSERT INTO public.user_roles VALUES (2, 52);
INSERT INTO public.user_roles VALUES (2, 53);
INSERT INTO public.user_roles VALUES (2, 54);
INSERT INTO public.user_roles VALUES (2, 55);
INSERT INTO public.user_roles VALUES (2, 56);
INSERT INTO public.user_roles VALUES (2, 57);
INSERT INTO public.user_roles VALUES (2, 58);
INSERT INTO public.user_roles VALUES (2, 59);
INSERT INTO public.user_roles VALUES (2, 60);
INSERT INTO public.user_roles VALUES (2, 61);
INSERT INTO public.user_roles VALUES (2, 62);
INSERT INTO public.user_roles VALUES (2, 63);
INSERT INTO public.user_roles VALUES (2, 64);
INSERT INTO public.user_roles VALUES (2, 65);
INSERT INTO public.user_roles VALUES (2, 66);
INSERT INTO public.user_roles VALUES (2, 67);
INSERT INTO public.user_roles VALUES (2, 68);
INSERT INTO public.user_roles VALUES (2, 69);
INSERT INTO public.user_roles VALUES (2, 70);
INSERT INTO public.user_roles VALUES (2, 71);
INSERT INTO public.user_roles VALUES (2, 72);
INSERT INTO public.user_roles VALUES (2, 73);
INSERT INTO public.user_roles VALUES (2, 74);
INSERT INTO public.user_roles VALUES (2, 75);
INSERT INTO public.user_roles VALUES (2, 76);
INSERT INTO public.user_roles VALUES (2, 77);
INSERT INTO public.user_roles VALUES (2, 78);
INSERT INTO public.user_roles VALUES (2, 79);
INSERT INTO public.user_roles VALUES (2, 80);
INSERT INTO public.user_roles VALUES (2, 81);
INSERT INTO public.user_roles VALUES (2, 82);
INSERT INTO public.user_roles VALUES (2, 83);
INSERT INTO public.user_roles VALUES (2, 84);
INSERT INTO public.user_roles VALUES (2, 85);
INSERT INTO public.user_roles VALUES (2, 86);
INSERT INTO public.user_roles VALUES (2, 87);
INSERT INTO public.user_roles VALUES (2, 88);
INSERT INTO public.user_roles VALUES (2, 89);
INSERT INTO public.user_roles VALUES (2, 90);
INSERT INTO public.user_roles VALUES (2, 91);
INSERT INTO public.user_roles VALUES (2, 92);
INSERT INTO public.user_roles VALUES (2, 93);
INSERT INTO public.user_roles VALUES (2, 94);
INSERT INTO public.user_roles VALUES (2, 95);
INSERT INTO public.user_roles VALUES (2, 96);
INSERT INTO public.user_roles VALUES (2, 97);
INSERT INTO public.user_roles VALUES (2, 98);
INSERT INTO public.user_roles VALUES (2, 99);
INSERT INTO public.user_roles VALUES (2, 100);
INSERT INTO public.user_roles VALUES (2, 101);
INSERT INTO public.user_roles VALUES (2, 102);
INSERT INTO public.user_roles VALUES (2, 103);
INSERT INTO public.user_roles VALUES (2, 104);
INSERT INTO public.user_roles VALUES (3, 2);
INSERT INTO public.user_roles VALUES (2, 2);
INSERT INTO public.user_roles VALUES (2, 105);
INSERT INTO public.user_roles VALUES (2, 106);
INSERT INTO public.user_roles VALUES (2, 107);
INSERT INTO public.user_roles VALUES (2, 108);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (3, 0, '2026-07-21 02:27:16.332004+07', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocIMalxoEn3bN40EgGxNLt3BN29uDTVlkqeCFd3UvjGaOp2YZRm3=s96-c', 'Instructor One', 'vntvlogs@gmail.com', NULL, '$2a$10$Cww7qP4u36S1..CFZth/HOXFqjLMZOAuhZmHS9tl5B75pHTSLpPXO', 'ACTIVE', 'instructor1');
INSERT INTO public.users VALUES (41, 0, '2026-07-21 02:34:08.539797+07', NULL, NULL, 'k6 User 38', 'k6_user_38@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_38');
INSERT INTO public.users VALUES (104, 0, '2026-07-21 02:54:04.367417+07', NULL, NULL, 'Fullname 1784577232172', 'user_1784577232172@example.com', NULL, '$2a$10$BnorNdl.vm9m.N/t8HcXnOTFlZbtYnzBNvp14kup1jpt4VcTmMkrC', 'ACTIVE', 'user_1784577232172');
INSERT INTO public.users VALUES (108, 0, '2026-07-21 22:07:06.152618+07', NULL, NULL, 'VNT Monster', 'thanhmila2005@gmail.com', NULL, '$2a$10$JvNaDXRdyH9dD.wEARIUv.XEjbWUSkih21z9Lo7k6HN9.td7aJuI.', 'ACTIVE', 'thanh');
INSERT INTO public.users VALUES (1, 0, '2026-07-21 02:26:05.349377+07', NULL, NULL, 'admin', 'admin@gmail.com', NULL, '$2a$10$GHEopuQMOSWXWdfrvkU3leKr4NAR9kJKZyYyqAoa4lWzBugJKH5Mi', 'ACTIVE', 'admin');
INSERT INTO public.users VALUES (105, 0, '2026-07-21 03:15:15.4273+07', NULL, NULL, 'Fullname 1784578503241', 'user_1784578503241@example.com', NULL, '$2a$10$KufP7YJtg5vEA1DpXrOIVO1yQXlOURoW8wDLlAc7gCUnfzmLhHE1y', 'ACTIVE', 'user_1784578503241');
INSERT INTO public.users VALUES (106, 0, '2026-07-21 03:17:17.16252+07', NULL, NULL, 'Fullname 1784578624951', 'user_1784578624951@example.com', NULL, '$2a$10$rMGNxWOow6x7P9ELN0IAx.lAueAIsAvFmZJYrJDPFOQS/WoXGn3By', 'ACTIVE', 'user_1784578624951');
INSERT INTO public.users VALUES (2, 0, '2026-07-21 02:26:05.457308+07', NULL, NULL, 'User One', 'admin1@gmail.com', NULL, '$2a$10$bdiMFwCMZ0H1ARTVmCK2rOT1aEmxIqkCWXBHj0KHa231TEOY4OtQ.', 'ACTIVE', 'user1');
INSERT INTO public.users VALUES (107, 0, '2026-07-21 07:34:23.02434+07', NULL, NULL, 'Fullname 1784594050816', 'user_1784594050816@example.com', NULL, '$2a$10$7jOmo9anWN5IsueMi4qu2ePNvGykDvS/ZXvKnDix7V3iDK8HgIuh6', 'ACTIVE', 'user_1784594050816');
INSERT INTO public.users VALUES (42, 0, '2026-07-21 02:34:08.540292+07', NULL, NULL, 'k6 User 39', 'k6_user_39@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_39');
INSERT INTO public.users VALUES (4, 0, '2026-07-21 02:34:08.517324+07', NULL, NULL, 'k6 User 1', 'k6_user_1@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_1');
INSERT INTO public.users VALUES (5, 0, '2026-07-21 02:34:08.518462+07', NULL, NULL, 'k6 User 2', 'k6_user_2@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_2');
INSERT INTO public.users VALUES (6, 0, '2026-07-21 02:34:08.519123+07', NULL, NULL, 'k6 User 3', 'k6_user_3@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_3');
INSERT INTO public.users VALUES (7, 0, '2026-07-21 02:34:08.519877+07', NULL, NULL, 'k6 User 4', 'k6_user_4@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_4');
INSERT INTO public.users VALUES (8, 0, '2026-07-21 02:34:08.520609+07', NULL, NULL, 'k6 User 5', 'k6_user_5@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_5');
INSERT INTO public.users VALUES (9, 0, '2026-07-21 02:34:08.521694+07', NULL, NULL, 'k6 User 6', 'k6_user_6@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_6');
INSERT INTO public.users VALUES (10, 0, '2026-07-21 02:34:08.522572+07', NULL, NULL, 'k6 User 7', 'k6_user_7@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_7');
INSERT INTO public.users VALUES (11, 0, '2026-07-21 02:34:08.523136+07', NULL, NULL, 'k6 User 8', 'k6_user_8@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_8');
INSERT INTO public.users VALUES (12, 0, '2026-07-21 02:34:08.52365+07', NULL, NULL, 'k6 User 9', 'k6_user_9@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_9');
INSERT INTO public.users VALUES (13, 0, '2026-07-21 02:34:08.524134+07', NULL, NULL, 'k6 User 10', 'k6_user_10@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_10');
INSERT INTO public.users VALUES (14, 0, '2026-07-21 02:34:08.524743+07', NULL, NULL, 'k6 User 11', 'k6_user_11@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_11');
INSERT INTO public.users VALUES (15, 0, '2026-07-21 02:34:08.52545+07', NULL, NULL, 'k6 User 12', 'k6_user_12@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_12');
INSERT INTO public.users VALUES (16, 0, '2026-07-21 02:34:08.525914+07', NULL, NULL, 'k6 User 13', 'k6_user_13@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_13');
INSERT INTO public.users VALUES (17, 0, '2026-07-21 02:34:08.526381+07', NULL, NULL, 'k6 User 14', 'k6_user_14@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_14');
INSERT INTO public.users VALUES (18, 0, '2026-07-21 02:34:08.526905+07', NULL, NULL, 'k6 User 15', 'k6_user_15@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_15');
INSERT INTO public.users VALUES (19, 0, '2026-07-21 02:34:08.527962+07', NULL, NULL, 'k6 User 16', 'k6_user_16@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_16');
INSERT INTO public.users VALUES (20, 0, '2026-07-21 02:34:08.528659+07', NULL, NULL, 'k6 User 17', 'k6_user_17@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_17');
INSERT INTO public.users VALUES (21, 0, '2026-07-21 02:34:08.529241+07', NULL, NULL, 'k6 User 18', 'k6_user_18@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_18');
INSERT INTO public.users VALUES (22, 0, '2026-07-21 02:34:08.529828+07', NULL, NULL, 'k6 User 19', 'k6_user_19@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_19');
INSERT INTO public.users VALUES (23, 0, '2026-07-21 02:34:08.530233+07', NULL, NULL, 'k6 User 20', 'k6_user_20@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_20');
INSERT INTO public.users VALUES (24, 0, '2026-07-21 02:34:08.530701+07', NULL, NULL, 'k6 User 21', 'k6_user_21@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_21');
INSERT INTO public.users VALUES (25, 0, '2026-07-21 02:34:08.531309+07', NULL, NULL, 'k6 User 22', 'k6_user_22@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_22');
INSERT INTO public.users VALUES (26, 0, '2026-07-21 02:34:08.531887+07', NULL, NULL, 'k6 User 23', 'k6_user_23@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_23');
INSERT INTO public.users VALUES (27, 0, '2026-07-21 02:34:08.532326+07', NULL, NULL, 'k6 User 24', 'k6_user_24@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_24');
INSERT INTO public.users VALUES (28, 0, '2026-07-21 02:34:08.532835+07', NULL, NULL, 'k6 User 25', 'k6_user_25@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_25');
INSERT INTO public.users VALUES (29, 0, '2026-07-21 02:34:08.533285+07', NULL, NULL, 'k6 User 26', 'k6_user_26@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_26');
INSERT INTO public.users VALUES (30, 0, '2026-07-21 02:34:08.533636+07', NULL, NULL, 'k6 User 27', 'k6_user_27@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_27');
INSERT INTO public.users VALUES (31, 0, '2026-07-21 02:34:08.534125+07', NULL, NULL, 'k6 User 28', 'k6_user_28@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_28');
INSERT INTO public.users VALUES (32, 0, '2026-07-21 02:34:08.534509+07', NULL, NULL, 'k6 User 29', 'k6_user_29@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_29');
INSERT INTO public.users VALUES (33, 0, '2026-07-21 02:34:08.534889+07', NULL, NULL, 'k6 User 30', 'k6_user_30@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_30');
INSERT INTO public.users VALUES (34, 0, '2026-07-21 02:34:08.535278+07', NULL, NULL, 'k6 User 31', 'k6_user_31@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_31');
INSERT INTO public.users VALUES (35, 0, '2026-07-21 02:34:08.535649+07', NULL, NULL, 'k6 User 32', 'k6_user_32@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_32');
INSERT INTO public.users VALUES (36, 0, '2026-07-21 02:34:08.536039+07', NULL, NULL, 'k6 User 33', 'k6_user_33@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_33');
INSERT INTO public.users VALUES (37, 0, '2026-07-21 02:34:08.536406+07', NULL, NULL, 'k6 User 34', 'k6_user_34@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_34');
INSERT INTO public.users VALUES (38, 0, '2026-07-21 02:34:08.536863+07', NULL, NULL, 'k6 User 35', 'k6_user_35@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_35');
INSERT INTO public.users VALUES (39, 0, '2026-07-21 02:34:08.53751+07', NULL, NULL, 'k6 User 36', 'k6_user_36@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_36');
INSERT INTO public.users VALUES (40, 0, '2026-07-21 02:34:08.539188+07', NULL, NULL, 'k6 User 37', 'k6_user_37@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_37');
INSERT INTO public.users VALUES (43, 0, '2026-07-21 02:34:08.540826+07', NULL, NULL, 'k6 User 40', 'k6_user_40@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_40');
INSERT INTO public.users VALUES (44, 0, '2026-07-21 02:34:08.541282+07', NULL, NULL, 'k6 User 41', 'k6_user_41@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_41');
INSERT INTO public.users VALUES (45, 0, '2026-07-21 02:34:08.541739+07', NULL, NULL, 'k6 User 42', 'k6_user_42@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_42');
INSERT INTO public.users VALUES (46, 0, '2026-07-21 02:34:08.542154+07', NULL, NULL, 'k6 User 43', 'k6_user_43@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_43');
INSERT INTO public.users VALUES (47, 0, '2026-07-21 02:34:08.542608+07', NULL, NULL, 'k6 User 44', 'k6_user_44@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_44');
INSERT INTO public.users VALUES (48, 0, '2026-07-21 02:34:08.542964+07', NULL, NULL, 'k6 User 45', 'k6_user_45@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_45');
INSERT INTO public.users VALUES (49, 0, '2026-07-21 02:34:08.543872+07', NULL, NULL, 'k6 User 46', 'k6_user_46@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_46');
INSERT INTO public.users VALUES (50, 0, '2026-07-21 02:34:08.54422+07', NULL, NULL, 'k6 User 47', 'k6_user_47@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_47');
INSERT INTO public.users VALUES (51, 0, '2026-07-21 02:34:08.544707+07', NULL, NULL, 'k6 User 48', 'k6_user_48@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_48');
INSERT INTO public.users VALUES (52, 0, '2026-07-21 02:34:08.545159+07', NULL, NULL, 'k6 User 49', 'k6_user_49@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_49');
INSERT INTO public.users VALUES (53, 0, '2026-07-21 02:34:08.545473+07', NULL, NULL, 'k6 User 50', 'k6_user_50@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_50');
INSERT INTO public.users VALUES (54, 0, '2026-07-21 02:34:08.545826+07', NULL, NULL, 'k6 User 51', 'k6_user_51@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_51');
INSERT INTO public.users VALUES (55, 0, '2026-07-21 02:34:08.54622+07', NULL, NULL, 'k6 User 52', 'k6_user_52@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_52');
INSERT INTO public.users VALUES (56, 0, '2026-07-21 02:34:08.546602+07', NULL, NULL, 'k6 User 53', 'k6_user_53@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_53');
INSERT INTO public.users VALUES (57, 0, '2026-07-21 02:34:08.546991+07', NULL, NULL, 'k6 User 54', 'k6_user_54@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_54');
INSERT INTO public.users VALUES (58, 0, '2026-07-21 02:34:08.547605+07', NULL, NULL, 'k6 User 55', 'k6_user_55@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_55');
INSERT INTO public.users VALUES (59, 0, '2026-07-21 02:34:08.547905+07', NULL, NULL, 'k6 User 56', 'k6_user_56@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_56');
INSERT INTO public.users VALUES (60, 0, '2026-07-21 02:34:08.548222+07', NULL, NULL, 'k6 User 57', 'k6_user_57@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_57');
INSERT INTO public.users VALUES (61, 0, '2026-07-21 02:34:08.548538+07', NULL, NULL, 'k6 User 58', 'k6_user_58@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_58');
INSERT INTO public.users VALUES (62, 0, '2026-07-21 02:34:08.54891+07', NULL, NULL, 'k6 User 59', 'k6_user_59@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_59');
INSERT INTO public.users VALUES (63, 0, '2026-07-21 02:34:08.549262+07', NULL, NULL, 'k6 User 60', 'k6_user_60@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_60');
INSERT INTO public.users VALUES (64, 0, '2026-07-21 02:34:08.549643+07', NULL, NULL, 'k6 User 61', 'k6_user_61@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_61');
INSERT INTO public.users VALUES (65, 0, '2026-07-21 02:34:08.549949+07', NULL, NULL, 'k6 User 62', 'k6_user_62@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_62');
INSERT INTO public.users VALUES (66, 0, '2026-07-21 02:34:08.550239+07', NULL, NULL, 'k6 User 63', 'k6_user_63@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_63');
INSERT INTO public.users VALUES (67, 0, '2026-07-21 02:34:08.550499+07', NULL, NULL, 'k6 User 64', 'k6_user_64@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_64');
INSERT INTO public.users VALUES (68, 0, '2026-07-21 02:34:08.5508+07', NULL, NULL, 'k6 User 65', 'k6_user_65@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_65');
INSERT INTO public.users VALUES (69, 0, '2026-07-21 02:34:08.551096+07', NULL, NULL, 'k6 User 66', 'k6_user_66@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_66');
INSERT INTO public.users VALUES (70, 0, '2026-07-21 02:34:08.551417+07', NULL, NULL, 'k6 User 67', 'k6_user_67@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_67');
INSERT INTO public.users VALUES (71, 0, '2026-07-21 02:34:08.551761+07', NULL, NULL, 'k6 User 68', 'k6_user_68@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_68');
INSERT INTO public.users VALUES (72, 0, '2026-07-21 02:34:08.552064+07', NULL, NULL, 'k6 User 69', 'k6_user_69@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_69');
INSERT INTO public.users VALUES (73, 0, '2026-07-21 02:34:08.552343+07', NULL, NULL, 'k6 User 70', 'k6_user_70@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_70');
INSERT INTO public.users VALUES (74, 0, '2026-07-21 02:34:08.552672+07', NULL, NULL, 'k6 User 71', 'k6_user_71@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_71');
INSERT INTO public.users VALUES (75, 0, '2026-07-21 02:34:08.552989+07', NULL, NULL, 'k6 User 72', 'k6_user_72@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_72');
INSERT INTO public.users VALUES (76, 0, '2026-07-21 02:34:08.553289+07', NULL, NULL, 'k6 User 73', 'k6_user_73@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_73');
INSERT INTO public.users VALUES (77, 0, '2026-07-21 02:34:08.553619+07', NULL, NULL, 'k6 User 74', 'k6_user_74@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_74');
INSERT INTO public.users VALUES (78, 0, '2026-07-21 02:34:08.55409+07', NULL, NULL, 'k6 User 75', 'k6_user_75@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_75');
INSERT INTO public.users VALUES (79, 0, '2026-07-21 02:34:08.554397+07', NULL, NULL, 'k6 User 76', 'k6_user_76@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_76');
INSERT INTO public.users VALUES (80, 0, '2026-07-21 02:34:08.554698+07', NULL, NULL, 'k6 User 77', 'k6_user_77@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_77');
INSERT INTO public.users VALUES (81, 0, '2026-07-21 02:34:08.555013+07', NULL, NULL, 'k6 User 78', 'k6_user_78@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_78');
INSERT INTO public.users VALUES (82, 0, '2026-07-21 02:34:08.555266+07', NULL, NULL, 'k6 User 79', 'k6_user_79@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_79');
INSERT INTO public.users VALUES (83, 0, '2026-07-21 02:34:08.555539+07', NULL, NULL, 'k6 User 80', 'k6_user_80@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_80');
INSERT INTO public.users VALUES (84, 0, '2026-07-21 02:34:08.555796+07', NULL, NULL, 'k6 User 81', 'k6_user_81@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_81');
INSERT INTO public.users VALUES (85, 0, '2026-07-21 02:34:08.556058+07', NULL, NULL, 'k6 User 82', 'k6_user_82@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_82');
INSERT INTO public.users VALUES (86, 0, '2026-07-21 02:34:08.556399+07', NULL, NULL, 'k6 User 83', 'k6_user_83@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_83');
INSERT INTO public.users VALUES (87, 0, '2026-07-21 02:34:08.556726+07', NULL, NULL, 'k6 User 84', 'k6_user_84@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_84');
INSERT INTO public.users VALUES (88, 0, '2026-07-21 02:34:08.557044+07', NULL, NULL, 'k6 User 85', 'k6_user_85@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_85');
INSERT INTO public.users VALUES (89, 0, '2026-07-21 02:34:08.557353+07', NULL, NULL, 'k6 User 86', 'k6_user_86@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_86');
INSERT INTO public.users VALUES (90, 0, '2026-07-21 02:34:08.557632+07', NULL, NULL, 'k6 User 87', 'k6_user_87@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_87');
INSERT INTO public.users VALUES (91, 0, '2026-07-21 02:34:08.55793+07', NULL, NULL, 'k6 User 88', 'k6_user_88@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_88');
INSERT INTO public.users VALUES (92, 0, '2026-07-21 02:34:08.558177+07', NULL, NULL, 'k6 User 89', 'k6_user_89@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_89');
INSERT INTO public.users VALUES (93, 0, '2026-07-21 02:34:08.558451+07', NULL, NULL, 'k6 User 90', 'k6_user_90@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_90');
INSERT INTO public.users VALUES (94, 0, '2026-07-21 02:34:08.558705+07', NULL, NULL, 'k6 User 91', 'k6_user_91@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_91');
INSERT INTO public.users VALUES (95, 0, '2026-07-21 02:34:08.558954+07', NULL, NULL, 'k6 User 92', 'k6_user_92@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_92');
INSERT INTO public.users VALUES (96, 0, '2026-07-21 02:34:08.559278+07', NULL, NULL, 'k6 User 93', 'k6_user_93@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_93');
INSERT INTO public.users VALUES (97, 0, '2026-07-21 02:34:08.559727+07', NULL, NULL, 'k6 User 94', 'k6_user_94@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_94');
INSERT INTO public.users VALUES (98, 0, '2026-07-21 02:34:08.560138+07', NULL, NULL, 'k6 User 95', 'k6_user_95@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_95');
INSERT INTO public.users VALUES (99, 0, '2026-07-21 02:34:08.560411+07', NULL, NULL, 'k6 User 96', 'k6_user_96@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_96');
INSERT INTO public.users VALUES (100, 0, '2026-07-21 02:34:08.560654+07', NULL, NULL, 'k6 User 97', 'k6_user_97@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_97');
INSERT INTO public.users VALUES (101, 0, '2026-07-21 02:34:08.560923+07', NULL, NULL, 'k6 User 98', 'k6_user_98@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_98');
INSERT INTO public.users VALUES (102, 0, '2026-07-21 02:34:08.561238+07', NULL, NULL, 'k6 User 99', 'k6_user_99@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_99');
INSERT INTO public.users VALUES (103, 0, '2026-07-21 02:34:08.561488+07', NULL, NULL, 'k6 User 100', 'k6_user_100@example.com', NULL, '$2a$10$erBBTFYX8jJIV1ysJd7XneVRtu1AdlxODeUo.on618.ZB3lNF0UHm', 'ACTIVE', 'k6_user_100');


--
-- Data for Name: wallet_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.wallets VALUES (0.00, 1, 3, '2026-07-21 02:27:16.350015+07', 'ACTIVE');
INSERT INTO public.wallets VALUES (0.00, 2, 104, '2026-07-21 02:54:04.567547+07', 'ACTIVE');
INSERT INTO public.wallets VALUES (0.00, 3, 2, '2026-07-21 03:09:08.760486+07', 'ACTIVE');
INSERT INTO public.wallets VALUES (0.00, 4, 105, '2026-07-21 03:15:15.640595+07', 'ACTIVE');
INSERT INTO public.wallets VALUES (0.00, 5, 106, '2026-07-21 03:17:17.36244+07', 'ACTIVE');
INSERT INTO public.wallets VALUES (0.00, 6, 107, '2026-07-21 07:34:23.226022+07', 'ACTIVE');
INSERT INTO public.wallets VALUES (0.00, 7, 108, '2026-07-21 22:07:06.390862+07', 'ACTIVE');


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 7, true);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chapters_id_seq', 59, true);


--
-- Name: completed_lessons_count_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.completed_lessons_count_id_seq', 1, false);


--
-- Name: contest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contest_id_seq', 1, true);


--
-- Name: contest_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contest_participants_id_seq', 2, true);


--
-- Name: contest_problem_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contest_problem_attempts_id_seq', 1, false);


--
-- Name: contest_problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contest_problems_id_seq', 5, true);


--
-- Name: contest_rankings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contest_rankings_id_seq', 1, false);


--
-- Name: course_moderation_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_moderation_reports_id_seq', 1, false);


--
-- Name: course_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_reviews_id_seq', 1, false);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 13, true);


--
-- Name: enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollments_id_seq', 1, false);


--
-- Name: instructor_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_applications_id_seq', 1, true);


--
-- Name: instructors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructors_id_seq', 2, true);


--
-- Name: invalidated_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invalidated_tokens_id_seq', 27, true);


--
-- Name: lesson_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_comments_id_seq', 1, false);


--
-- Name: lesson_problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_problems_id_seq', 5, true);


--
-- Name: lesson_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_progress_id_seq', 1, false);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lessons_id_seq', 168, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: payment_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_transactions_id_seq', 2, true);


--
-- Name: payout_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payout_requests_id_seq', 1, false);


--
-- Name: problem_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.problem_comments_id_seq', 1, false);


--
-- Name: problem_submission_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.problem_submission_details_id_seq', 10134, true);


--
-- Name: problem_submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.problem_submissions_id_seq', 1015, true);


--
-- Name: problem_tag_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.problem_tag_mappings_id_seq', 55, true);


--
-- Name: problem_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.problem_tags_id_seq', 8, true);


--
-- Name: problem_testcases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.problem_testcases_id_seq', 302, true);


--
-- Name: problem_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.problem_versions_id_seq', 37, true);


--
-- Name: problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.problems_id_seq', 38, true);


--
-- Name: quiz_attempt_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_attempt_answers_id_seq', 1, false);


--
-- Name: quiz_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_attempts_id_seq', 1, false);


--
-- Name: quiz_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_options_id_seq', 1, false);


--
-- Name: quiz_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_questions_id_seq', 1, false);


--
-- Name: quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quizzes_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- Name: user_daily_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_daily_activities_id_seq', 247, true);


--
-- Name: user_oauth_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_oauth_accounts_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 108, true);


--
-- Name: wallet_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_transactions_id_seq', 1, false);


--
-- Name: wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallets_id_seq', 7, true);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: carts carts_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_key UNIQUE (user_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- Name: completed_lessons_count completed_lessons_count_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT completed_lessons_count_pkey PRIMARY KEY (id);


--
-- Name: contest_participants contest_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT contest_participants_pkey PRIMARY KEY (id);


--
-- Name: contest contest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT contest_pkey PRIMARY KEY (id);


--
-- Name: contest_problem_attempts contest_problem_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT contest_problem_attempts_pkey PRIMARY KEY (id);


--
-- Name: contest_problems contest_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT contest_problems_pkey PRIMARY KEY (id);


--
-- Name: contest_rankings contest_rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT contest_rankings_pkey PRIMARY KEY (id);


--
-- Name: course_category_mappings course_category_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT course_category_mappings_pkey PRIMARY KEY (category_id, course_id);


--
-- Name: course_moderation_reports course_moderation_reports_course_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_moderation_reports
    ADD CONSTRAINT course_moderation_reports_course_id_key UNIQUE (course_id);


--
-- Name: course_moderation_reports course_moderation_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_moderation_reports
    ADD CONSTRAINT course_moderation_reports_pkey PRIMARY KEY (id);


--
-- Name: course_reviews course_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT course_reviews_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- Name: instructor_applications instructor_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_applications
    ADD CONSTRAINT instructor_applications_pkey PRIMARY KEY (id);


--
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);


--
-- Name: instructors instructors_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_user_id_key UNIQUE (user_id);


--
-- Name: invalidated_tokens invalidated_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invalidated_tokens
    ADD CONSTRAINT invalidated_tokens_pkey PRIMARY KEY (id);


--
-- Name: lesson_comments lesson_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT lesson_comments_pkey PRIMARY KEY (id);


--
-- Name: lesson_problems lesson_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT lesson_problems_pkey PRIMARY KEY (id);


--
-- Name: lesson_progress lesson_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT lesson_progress_pkey PRIMARY KEY (id);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment_transactions payment_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_pkey PRIMARY KEY (id);


--
-- Name: payment_transactions payment_transactions_transaction_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_transaction_code_key UNIQUE (transaction_code);


--
-- Name: payout_requests payout_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT payout_requests_pkey PRIMARY KEY (id);


--
-- Name: problem_comments problem_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT problem_comments_pkey PRIMARY KEY (id);


--
-- Name: problem_submission_details problem_submission_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT problem_submission_details_pkey PRIMARY KEY (id);


--
-- Name: problem_submissions problem_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT problem_submissions_pkey PRIMARY KEY (id);


--
-- Name: problem_tag_mappings problem_tag_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT problem_tag_mappings_pkey PRIMARY KEY (id);


--
-- Name: problem_tags problem_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_pkey PRIMARY KEY (id);


--
-- Name: problem_testcases problem_testcases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_testcases
    ADD CONSTRAINT problem_testcases_pkey PRIMARY KEY (id);


--
-- Name: problem_versions problem_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_versions
    ADD CONSTRAINT problem_versions_pkey PRIMARY KEY (id);


--
-- Name: problem_visualizer_cache problem_visualizer_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_visualizer_cache
    ADD CONSTRAINT problem_visualizer_cache_pkey PRIMARY KEY (id);


--
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: quiz_attempt_answers quiz_attempt_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT quiz_attempt_answers_pkey PRIMARY KEY (id);


--
-- Name: quiz_attempts quiz_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT quiz_attempts_pkey PRIMARY KEY (id);


--
-- Name: quiz_options quiz_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_options
    ADD CONSTRAINT quiz_options_pkey PRIMARY KEY (id);


--
-- Name: quiz_questions quiz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT quiz_questions_pkey PRIMARY KEY (id);


--
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: user_oauth_accounts ukhvnjys5r8dgs5p107mae6cdip; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT ukhvnjys5r8dgs5p107mae6cdip UNIQUE (provider, provider_user_id);


--
-- Name: user_daily_activities ukqex64xyldm7nghim6s2t54ett; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT ukqex64xyldm7nghim6s2t54ett UNIQUE (user_id, activity_date);


--
-- Name: completed_lessons_count uq_completed_lessons_count_user_course; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT uq_completed_lessons_count_user_course UNIQUE (user_id, course_id);


--
-- Name: user_daily_activities user_daily_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT user_daily_activities_pkey PRIMARY KEY (id);


--
-- Name: user_daily_activities user_daily_activities_user_id_activity_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT user_daily_activities_user_id_activity_date_key UNIQUE (user_id, activity_date);


--
-- Name: user_oauth_accounts user_oauth_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT user_oauth_accounts_pkey PRIMARY KEY (id);


--
-- Name: user_oauth_accounts user_oauth_accounts_provider_provider_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT user_oauth_accounts_provider_provider_user_id_key UNIQUE (provider, provider_user_id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (role_id, user_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: wallet_transactions wallet_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT wallet_transactions_pkey PRIMARY KEY (id);


--
-- Name: wallets wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- Name: wallets wallets_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_user_id_key UNIQUE (user_id);


--
-- Name: courses fk1kswo6qqebbdy2kq0kx6udof7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk1kswo6qqebbdy2kq0kx6udof7 FOREIGN KEY (instructor_id) REFERENCES public.instructors(id);


--
-- Name: problem_comments fk2ejlxsd61ciq2emegbkfli3cw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT fk2ejlxsd61ciq2emegbkfli3cw FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: lesson_progress fk2j9inre1u78br1sca0pcv3i6o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT fk2j9inre1u78br1sca0pcv3i6o FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: contest_problem_attempts fk2qb60o4hxp7rhj12qtrssmxuo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fk2qb60o4hxp7rhj12qtrssmxuo FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- Name: orders fk32ql8ubntj5uh44ph9659tiih; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk32ql8ubntj5uh44ph9659tiih FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: enrollments fk3hjx6rcnbmfw368sxigrpfpx0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk3hjx6rcnbmfw368sxigrpfpx0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: contest_participants fk3l1iketg9qjipqd33tua1ddex; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT fk3l1iketg9qjipqd33tua1ddex FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: contest_rankings fk52e45mk8phc5xoyy81wri2ri; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT fk52e45mk8phc5xoyy81wri2ri FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: quiz_attempt_answers fk54g2hjt484k0nnvfx9kj1j8qe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fk54g2hjt484k0nnvfx9kj1j8qe FOREIGN KEY (selected_option_id) REFERENCES public.quiz_options(id);


--
-- Name: lesson_comments fk58fdhg12mhkyagk550qytlafy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fk58fdhg12mhkyagk550qytlafy FOREIGN KEY (parent_comment_id) REFERENCES public.lesson_comments(id);


--
-- Name: course_reviews fk5rcljcnb4if64q6q8ilwn0w5k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT fk5rcljcnb4if64q6q8ilwn0w5k FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: chapters fk6h1m0nrtdwj37570c0sp2tdcs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT fk6h1m0nrtdwj37570c0sp2tdcs FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: payout_requests fk6qtj6fnswmrrfqla2meq258nq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT fk6qtj6fnswmrrfqla2meq258nq FOREIGN KEY (wallet_id) REFERENCES public.wallets(id);


--
-- Name: course_reviews fk799g8dfcye3g51ru63bfdhyb1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT fk799g8dfcye3g51ru63bfdhyb1 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: problem_submissions fk8ei1ttrildtrn9a4mmrxvi31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk8ei1ttrildtrn9a4mmrxvi31 FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: wallet_transactions fk8seu7b87ifqi09ghhssusmb0x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT fk8seu7b87ifqi09ghhssusmb0x FOREIGN KEY (wallet_id) REFERENCES public.wallets(id);


--
-- Name: problem_submissions fk9dsq5pj8f74cej03s2nwulg10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk9dsq5pj8f74cej03s2nwulg10 FOREIGN KEY (problem_version_id) REFERENCES public.problem_versions(id);


--
-- Name: contest_problems fka45ve6lwr6ti8s35kmekyf6wh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT fka45ve6lwr6ti8s35kmekyf6wh FOREIGN KEY (contest_id) REFERENCES public.contest(id);


--
-- Name: contest fka64beyokxao0s2e3d5so2b1et; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT fka64beyokxao0s2e3d5so2b1et FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: lesson_comments fkae19hwvklqllk5ws9bwtpo0x2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fkae19hwvklqllk5ws9bwtpo0x2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: quiz_questions fkanfmgf6ksbdnv7ojb0pfve54q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT fkanfmgf6ksbdnv7ojb0pfve54q FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id);


--
-- Name: problem_tag_mappings fkb2s5u1fg7ngipjai7g2ehlnxl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT fkb2s5u1fg7ngipjai7g2ehlnxl FOREIGN KEY (tag_id) REFERENCES public.problem_tags(id);


--
-- Name: carts fkb5o626f86h46m4s7ms6ginnop; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fkb5o626f86h46m4s7ms6ginnop FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: course_category_mappings fkbcb54i537ayiuudpghq26akmj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT fkbcb54i537ayiuudpghq26akmj FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: quizzes fkbdv8uggpsin6pnkx0d80ryqey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT fkbdv8uggpsin6pnkx0d80ryqey FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: problem_comments fkbeaj9majn3i0nqrtt7f1975lk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT fkbeaj9majn3i0nqrtt7f1975lk FOREIGN KEY (parent_id) REFERENCES public.problem_comments(id);


--
-- Name: order_items fkbioxgbv59vetrxe0ejfubep1w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fkbioxgbv59vetrxe0ejfubep1w FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: wallets fkc1foyisidw7wqqrkamafuwn4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT fkc1foyisidw7wqqrkamafuwn4e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: lesson_comments fkc294lsbm7r4n3xyg9rgurh07k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fkc294lsbm7r4n3xyg9rgurh07k FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: lesson_problems fkcd6vr86wsa94892cdkicpv28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT fkcd6vr86wsa94892cdkicpv28 FOREIGN KEY (problem_version_id) REFERENCES public.problem_versions(id);


--
-- Name: problem_submission_details fkcjg9vh0i8mcn6r5f8kd2ac300; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT fkcjg9vh0i8mcn6r5f8kd2ac300 FOREIGN KEY (submission_id) REFERENCES public.problem_submissions(id);


--
-- Name: payment_transactions fkd88o3dfuygwharyikml47ebhk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT fkd88o3dfuygwharyikml47ebhk FOREIGN KEY (wallet_id) REFERENCES public.wallets(id);


--
-- Name: instructors fkds2m3jgxj98sd5mr1qw23ecjp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT fkds2m3jgxj98sd5mr1qw23ecjp FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: problem_submissions fkepg6sogg63mouncuwheku7dam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fkepg6sogg63mouncuwheku7dam FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: wallet_transactions fketfi6nehbld4k4ma3oshxpp8j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT fketfi6nehbld4k4ma3oshxpp8j FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: contest_problem_attempts fkfnm97wppjoqpsa7isvtdnd04s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fkfnm97wppjoqpsa7isvtdnd04s FOREIGN KEY (contest_id) REFERENCES public.contest(id);


--
-- Name: problem_tag_mappings fkfpgck5o4f2ys09q6gs3cwwi5x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT fkfpgck5o4f2ys09q6gs3cwwi5x FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- Name: quiz_attempts fkfwipvfipnnwsoacoyv5k7fbxc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT fkfwipvfipnnwsoacoyv5k7fbxc FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id);


--
-- Name: contest_rankings fkg7tnte0bg7u0y97omrr441wht; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT fkg7tnte0bg7u0y97omrr441wht FOREIGN KEY (contest_id) REFERENCES public.contest(id);


--
-- Name: course_category_mappings fkgixmfc87xulrd0eudp8wc5es; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT fkgixmfc87xulrd0eudp8wc5es FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: user_roles fkh8ciramu9cc9q3qcqiv4ue8a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: user_roles fkhfh9dx7w3ubf1co1vdev94g3f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: quiz_options fkhkuvmd7qk1lmtq3hy9htpinkr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_options
    ADD CONSTRAINT fkhkuvmd7qk1lmtq3hy9htpinkr FOREIGN KEY (question_id) REFERENCES public.quiz_questions(id);


--
-- Name: enrollments fkho8mcicp4196ebpltdn9wl6co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fkho8mcicp4196ebpltdn9wl6co FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: lesson_progress fkhxwj6gbacmwi2768sceg602uf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT fkhxwj6gbacmwi2768sceg602uf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: completed_lessons_count fkilxswyivftkeso9mf0d9cta1p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT fkilxswyivftkeso9mf0d9cta1p FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: cart_items fkivp3vwkw2egm5ekoapk31iqs6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fkivp3vwkw2egm5ekoapk31iqs6 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: lesson_problems fkja84kupkp9or1elxh5rsp8b7s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT fkja84kupkp9or1elxh5rsp8b7s FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- Name: user_daily_activities fkjvlds4clccy826bptmn4viqbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT fkjvlds4clccy826bptmn4viqbr FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: problem_submissions fkkciiwnphdpe56b7qwsm50hqrn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fkkciiwnphdpe56b7qwsm50hqrn FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- Name: problem_versions fkkgjnnr6op1hcts5iub5lmt4mp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_versions
    ADD CONSTRAINT fkkgjnnr6op1hcts5iub5lmt4mp FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- Name: quiz_attempt_answers fklhd30qs5tx5e4f01vj8jt1s8t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fklhd30qs5tx5e4f01vj8jt1s8t FOREIGN KEY (quiz_question_id) REFERENCES public.quiz_questions(id);


--
-- Name: user_oauth_accounts fklkuinqstu5ypmj8j0gg6mv575; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT fklkuinqstu5ypmj8j0gg6mv575 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: quiz_attempt_answers fkm8571omdvyu3q35r8ansqqqi2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fkm8571omdvyu3q35r8ansqqqi2 FOREIGN KEY (quiz_attempt_id) REFERENCES public.quiz_attempts(id);


--
-- Name: lessons fkmb78vk1f2oljr16oj1hpo45ma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fkmb78vk1f2oljr16oj1hpo45ma FOREIGN KEY (chapter_id) REFERENCES public.chapters(id);


--
-- Name: contest_problem_attempts fkmiu76scjlo89ojn9c22evwofh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fkmiu76scjlo89ojn9c22evwofh FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: problems fkmnwvifcr9q5s3p7edw0cyctky; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT fkmnwvifcr9q5s3p7edw0cyctky FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: instructor_applications fknt6ss9ppkuhjay2s1t5l9n3ff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_applications
    ADD CONSTRAINT fknt6ss9ppkuhjay2s1t5l9n3ff FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: lesson_problems fkoh3mxr7fwsr0xs35rj55xx1ru; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT fkoh3mxr7fwsr0xs35rj55xx1ru FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- Name: problem_testcases fkp3x2eolxuvcs4lnbit80xn6os; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_testcases
    ADD CONSTRAINT fkp3x2eolxuvcs4lnbit80xn6os FOREIGN KEY (problem_version_id) REFERENCES public.problem_versions(id);


--
-- Name: cart_items fkpcttvuq4mxppo8sxggjtn5i2c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fkpcttvuq4mxppo8sxggjtn5i2c FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: problem_submissions fkq82fa2e333x4v33a2kc3re3j8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fkq82fa2e333x4v33a2kc3re3j8 FOREIGN KEY (contest_id) REFERENCES public.contest(id);


--
-- Name: problem_submission_details fkqjgwh4xufvary1vwaxrn351pv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT fkqjgwh4xufvary1vwaxrn351pv FOREIGN KEY (testcase_id) REFERENCES public.problem_testcases(id);


--
-- Name: contest_problems fkqqps7ixp2sidn9ktk7h34pee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT fkqqps7ixp2sidn9ktk7h34pee FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- Name: problem_comments fkr2qo0k64sn9ovbgr75nw7vi2r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT fkr2qo0k64sn9ovbgr75nw7vi2r FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- Name: contest_problems fks906s1268s388c02b03t6ubej; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT fks906s1268s388c02b03t6ubej FOREIGN KEY (problem_version_id) REFERENCES public.problem_versions(id);


--
-- Name: contest_participants fkscq5updfr2dg1lliqs7jn9b8k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT fkscq5updfr2dg1lliqs7jn9b8k FOREIGN KEY (contest_id) REFERENCES public.contest(id);


--
-- Name: completed_lessons_count fksfu0dm9pu61y2ihppu7bms7su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT fksfu0dm9pu61y2ihppu7bms7su FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: order_items fky4aiomvn1gl62yjreckpt6lv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fky4aiomvn1gl62yjreckpt6lv FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE ALL ON SCHEMA public FROM ngocthanh;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict 5PvQq0hncBdf0RcP5BHrZecVHdPgLGNczoBtTLU8nTdUbgj6JG1ed4UXbhEIRik

