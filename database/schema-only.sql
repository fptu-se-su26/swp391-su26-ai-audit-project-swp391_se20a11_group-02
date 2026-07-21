--
-- PostgreSQL database dump
--

\restrict PNv8ZgqDfXFs1tsFxL0e4I0mLRsjo3JduRi77XQRRJc5IldHCxLs4BIGs83RZWf

-- Dumped from database version 14.23 (Homebrew)
-- Dumped by pg_dump version 14.23 (Homebrew)

-- Started on 2026-07-21 22:51:37 +07

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
-- TOC entry 2 (class 3079 OID 20881)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 4330 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- TOC entry 1084 (class 1247 OID 60976)
-- Name: contest_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.contest_status AS ENUM (
    'DRAFT',
    'PUBLISHED',
    'DELETED'
);


--
-- TOC entry 1087 (class 1247 OID 60984)
-- Name: conteststatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.conteststatus AS ENUM (
    'DELETED',
    'DRAFT',
    'PUBLISHED'
);


--
-- TOC entry 1090 (class 1247 OID 60992)
-- Name: course_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.course_status AS ENUM (
    'PENDING_AI',
    'PENDING_ADMIN',
    'APPROVED',
    'REJECTED',
    'DRAFTS'
);


--
-- TOC entry 918 (class 1247 OID 20732)
-- Name: enrollment_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enrollment_status AS ENUM (
    'ACTIVE',
    'CANCELLED',
    'COMPLETED'
);


--
-- TOC entry 921 (class 1247 OID 20740)
-- Name: instructor_app_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.instructor_app_status AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED',
    'AI_REJECTED'
);


--
-- TOC entry 924 (class 1247 OID 20750)
-- Name: instructor_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.instructor_status AS ENUM (
    'ACTIVE',
    'SUSPENDED'
);


--
-- TOC entry 927 (class 1247 OID 20756)
-- Name: oj_verdict; Type: TYPE; Schema: public; Owner: -
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


--
-- TOC entry 930 (class 1247 OID 20776)
-- Name: order_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.order_status AS ENUM (
    'PENDING',
    'COMPLETED',
    'FAILED'
);


--
-- TOC entry 1012 (class 1247 OID 82588)
-- Name: orderstatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.orderstatus AS ENUM (
    'COMPLETED',
    'FAILED',
    'PENDING'
);


--
-- TOC entry 933 (class 1247 OID 20784)
-- Name: payment_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.payment_type AS ENUM (
    'DEPOSIT'
);


--
-- TOC entry 1018 (class 1247 OID 82610)
-- Name: paymenttype; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.paymenttype AS ENUM (
    'DEPOSIT'
);


--
-- TOC entry 936 (class 1247 OID 20788)
-- Name: payout_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.payout_status AS ENUM (
    'PENDING',
    'PROCESSING',
    'SUCCESS',
    'FAILED'
);


--
-- TOC entry 1021 (class 1247 OID 82616)
-- Name: payoutstatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.payoutstatus AS ENUM (
    'FAILED',
    'PENDING',
    'PROCESSING',
    'SUCCESS'
);


--
-- TOC entry 939 (class 1247 OID 20798)
-- Name: problem_difficulty; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.problem_difficulty AS ENUM (
    'EASY',
    'MEDIUM',
    'HARD'
);


--
-- TOC entry 942 (class 1247 OID 20806)
-- Name: problem_scope; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.problem_scope AS ENUM (
    'LESSON',
    'CONTEST',
    'SHARED',
    'PRACTICE'
);


--
-- TOC entry 945 (class 1247 OID 20816)
-- Name: progress_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.progress_status AS ENUM (
    'NOT_STARTED',
    'IN_PROGRESS',
    'COMPLETED'
);


--
-- TOC entry 948 (class 1247 OID 20824)
-- Name: quiz_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.quiz_status AS ENUM (
    'IN_PROGRESS',
    'COMPLETED'
);


--
-- TOC entry 951 (class 1247 OID 20830)
-- Name: role_name; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.role_name AS ENUM (
    'USER',
    'INSTRUCTOR',
    'ADMIN'
);


--
-- TOC entry 954 (class 1247 OID 20838)
-- Name: scoring_rule; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.scoring_rule AS ENUM (
    'ICPC',
    'IOI',
    'CUSTOM'
);


--
-- TOC entry 1101 (class 1247 OID 50888)
-- Name: scoringrule; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.scoringrule AS ENUM (
    'CUSTOM',
    'ICPC',
    'IOI'
);


--
-- TOC entry 957 (class 1247 OID 20854)
-- Name: status_active_locked; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.status_active_locked AS ENUM (
    'ACTIVE',
    'LOCKED'
);


--
-- TOC entry 960 (class 1247 OID 20860)
-- Name: status_transaction; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.status_transaction AS ENUM (
    'SUCCESS',
    'FAILED',
    'PENDING',
    'CANCELLED'
);


--
-- TOC entry 1015 (class 1247 OID 82598)
-- Name: statustransaction; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.statustransaction AS ENUM (
    'CANCELLED',
    'FAILED',
    'PENDING',
    'SUCCESS'
);


--
-- TOC entry 963 (class 1247 OID 20868)
-- Name: transaction_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.transaction_type AS ENUM (
    'DEPOSIT',
    'BUY_COURSE',
    'SELL_COURSE',
    'REFUND',
    'AWARD',
    'PLATFORM_FEE'
);


--
-- TOC entry 1024 (class 1247 OID 82628)
-- Name: transactiontype; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.transactiontype AS ENUM (
    'AWARD',
    'BUY_COURSE',
    'DEPOSIT',
    'PLATFORM_FEE',
    'REFUND',
    'SELL_COURSE'
);


--
-- TOC entry 3977 (class 2605 OID 82596)
-- Name: CAST (public.orderstatus AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.orderstatus AS character varying) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3979 (class 2605 OID 82614)
-- Name: CAST (public.paymenttype AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.paymenttype AS character varying) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3980 (class 2605 OID 82626)
-- Name: CAST (public.payoutstatus AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.payoutstatus AS character varying) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3976 (class 2605 OID 50896)
-- Name: CAST (public.scoringrule AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.scoringrule AS character varying) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3978 (class 2605 OID 82608)
-- Name: CAST (public.statustransaction AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.statustransaction AS character varying) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3981 (class 2605 OID 82642)
-- Name: CAST (public.transactiontype AS character varying); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (public.transactiontype AS character varying) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3892 (class 2605 OID 82595)
-- Name: CAST (character varying AS public.orderstatus); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.orderstatus) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3894 (class 2605 OID 82613)
-- Name: CAST (character varying AS public.paymenttype); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.paymenttype) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3895 (class 2605 OID 82625)
-- Name: CAST (character varying AS public.payoutstatus); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.payoutstatus) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3891 (class 2605 OID 50895)
-- Name: CAST (character varying AS public.scoringrule); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.scoringrule) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3893 (class 2605 OID 82607)
-- Name: CAST (character varying AS public.statustransaction); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.statustransaction) WITH INOUT AS IMPLICIT;


--
-- TOC entry 3896 (class 2605 OID 82641)
-- Name: CAST (character varying AS public.transactiontype); Type: CAST; Schema: -; Owner: -
--

CREATE CAST (character varying AS public.transactiontype) WITH INOUT AS IMPLICIT;


--
-- TOC entry 305 (class 1255 OID 20888)
-- Name: f_unaccent(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.f_unaccent(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT unaccent('unaccent', $1);
$_$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 74406)
-- Name: cart_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_items (
    cart_id integer NOT NULL,
    id integer NOT NULL,
    added_at timestamp(6) without time zone,
    course_id bigint NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 74405)
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 213 (class 1259 OID 74412)
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


--
-- TOC entry 212 (class 1259 OID 74411)
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 215 (class 1259 OID 74420)
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    description text,
    name character varying(255) NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 74419)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 217 (class 1259 OID 74428)
-- Name: chapters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chapters (
    id integer NOT NULL,
    order_index integer NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    title character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 74427)
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 219 (class 1259 OID 74434)
-- Name: completed_lessons_count; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.completed_lessons_count (
    completed_lessons_count integer NOT NULL,
    user_id integer NOT NULL,
    course_id bigint NOT NULL,
    id bigint NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 74433)
-- Name: completed_lessons_count_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 221 (class 1259 OID 74442)
-- Name: contest; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 220 (class 1259 OID 74441)
-- Name: contest_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 223 (class 1259 OID 74452)
-- Name: contest_participants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contest_participants (
    contest_id integer NOT NULL,
    id integer NOT NULL,
    user_id integer NOT NULL,
    joined_at timestamp(6) with time zone NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 74451)
-- Name: contest_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 225 (class 1259 OID 74458)
-- Name: contest_problem_attempts; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 224 (class 1259 OID 74457)
-- Name: contest_problem_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 227 (class 1259 OID 74464)
-- Name: contest_problems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contest_problems (
    contest_id integer NOT NULL,
    id integer NOT NULL,
    order_index integer NOT NULL,
    problem_id integer NOT NULL,
    problem_version_id integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 74463)
-- Name: contest_problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 229 (class 1259 OID 74470)
-- Name: contest_rankings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contest_rankings (
    contest_id integer NOT NULL,
    id integer NOT NULL,
    problems_solved integer NOT NULL,
    total_penalty integer NOT NULL,
    user_id integer NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 74469)
-- Name: contest_rankings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 230 (class 1259 OID 74475)
-- Name: course_category_mappings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_category_mappings (
    category_id integer NOT NULL,
    course_id bigint NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 74481)
-- Name: course_moderation_reports; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 231 (class 1259 OID 74480)
-- Name: course_moderation_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 234 (class 1259 OID 74491)
-- Name: course_reviews; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 233 (class 1259 OID 74490)
-- Name: course_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 236 (class 1259 OID 74499)
-- Name: courses; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 235 (class 1259 OID 74498)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 238 (class 1259 OID 74508)
-- Name: enrollments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.enrollments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    course_id bigint NOT NULL,
    enrolled_at timestamp(6) with time zone NOT NULL,
    status character varying(255) NOT NULL,
    CONSTRAINT enrollments_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'CANCELLED'::character varying, 'COMPLETED'::character varying])::text[])))
);


--
-- TOC entry 237 (class 1259 OID 74507)
-- Name: enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 240 (class 1259 OID 74515)
-- Name: instructor_applications; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 239 (class 1259 OID 74514)
-- Name: instructor_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 242 (class 1259 OID 74524)
-- Name: instructors; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 241 (class 1259 OID 74523)
-- Name: instructors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 244 (class 1259 OID 74535)
-- Name: invalidated_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invalidated_tokens (
    id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    expiry_time timestamp(6) with time zone NOT NULL,
    token character varying(255) NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 74534)
-- Name: invalidated_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 246 (class 1259 OID 74541)
-- Name: lesson_comments; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 245 (class 1259 OID 74540)
-- Name: lesson_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 248 (class 1259 OID 74549)
-- Name: lesson_problems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lesson_problems (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    order_index integer NOT NULL,
    problem_id integer NOT NULL,
    problem_version_id integer NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 74548)
-- Name: lesson_problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 250 (class 1259 OID 74555)
-- Name: lesson_progress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lesson_progress (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    user_id integer NOT NULL,
    completed_at timestamp(6) with time zone,
    course_id bigint NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 74554)
-- Name: lesson_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 252 (class 1259 OID 74561)
-- Name: lessons; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 251 (class 1259 OID 74560)
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 254 (class 1259 OID 74570)
-- Name: order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    price numeric(15,2) NOT NULL,
    course_id bigint NOT NULL
);


--
-- TOC entry 253 (class 1259 OID 74569)
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 256 (class 1259 OID 74576)
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    total_amount numeric(15,2) NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    status public.orderstatus
);


--
-- TOC entry 255 (class 1259 OID 74575)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 258 (class 1259 OID 74582)
-- Name: payment_transactions; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 257 (class 1259 OID 74581)
-- Name: payment_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 260 (class 1259 OID 74590)
-- Name: payout_requests; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 259 (class 1259 OID 74589)
-- Name: payout_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 262 (class 1259 OID 74598)
-- Name: problem_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.problem_comments (
    id integer NOT NULL,
    parent_id integer,
    problem_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    content text NOT NULL
);


--
-- TOC entry 261 (class 1259 OID 74597)
-- Name: problem_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 264 (class 1259 OID 74606)
-- Name: problem_submission_details; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 263 (class 1259 OID 74605)
-- Name: problem_submission_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 266 (class 1259 OID 74615)
-- Name: problem_submissions; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 265 (class 1259 OID 74614)
-- Name: problem_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 268 (class 1259 OID 74624)
-- Name: problem_tag_mappings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.problem_tag_mappings (
    id integer NOT NULL,
    problem_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- TOC entry 267 (class 1259 OID 74623)
-- Name: problem_tag_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 270 (class 1259 OID 74630)
-- Name: problem_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.problem_tags (
    id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(120) NOT NULL
);


--
-- TOC entry 269 (class 1259 OID 74629)
-- Name: problem_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 272 (class 1259 OID 74636)
-- Name: problem_testcases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.problem_testcases (
    id integer NOT NULL,
    order_index integer NOT NULL,
    problem_version_id integer NOT NULL,
    expected_output text NOT NULL,
    input_data text NOT NULL,
    token character varying(255)
);


--
-- TOC entry 271 (class 1259 OID 74635)
-- Name: problem_testcases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 274 (class 1259 OID 74644)
-- Name: problem_versions; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 273 (class 1259 OID 74643)
-- Name: problem_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 300 (class 1259 OID 74752)
-- Name: problem_visualizer_cache; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 276 (class 1259 OID 74654)
-- Name: problems; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 275 (class 1259 OID 74653)
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 278 (class 1259 OID 74661)
-- Name: quiz_attempt_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quiz_attempt_answers (
    id integer NOT NULL,
    quiz_attempt_id integer NOT NULL,
    quiz_question_id integer NOT NULL,
    selected_option_id integer
);


--
-- TOC entry 277 (class 1259 OID 74660)
-- Name: quiz_attempt_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 280 (class 1259 OID 74667)
-- Name: quiz_attempts; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 279 (class 1259 OID 74666)
-- Name: quiz_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 282 (class 1259 OID 74673)
-- Name: quiz_options; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 281 (class 1259 OID 74672)
-- Name: quiz_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 284 (class 1259 OID 74681)
-- Name: quiz_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quiz_questions (
    id integer NOT NULL,
    order_index integer NOT NULL,
    quiz_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    content text NOT NULL
);


--
-- TOC entry 283 (class 1259 OID 74680)
-- Name: quiz_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 286 (class 1259 OID 74689)
-- Name: quizzes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quizzes (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    title character varying(255) NOT NULL
);


--
-- TOC entry 285 (class 1259 OID 74688)
-- Name: quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 288 (class 1259 OID 74695)
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT roles_name_check CHECK (((name)::text = ANY ((ARRAY['USER'::character varying, 'INSTRUCTOR'::character varying, 'ADMIN'::character varying])::text[])))
);


--
-- TOC entry 287 (class 1259 OID 74694)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 290 (class 1259 OID 74702)
-- Name: user_daily_activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_daily_activities (
    activity_date date NOT NULL,
    id integer NOT NULL,
    streak integer DEFAULT 1 NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL
);


--
-- TOC entry 289 (class 1259 OID 74701)
-- Name: user_daily_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 292 (class 1259 OID 74711)
-- Name: user_oauth_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_oauth_accounts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    provider character varying(50) NOT NULL,
    provider_user_id character varying(255) NOT NULL
);


--
-- TOC entry 291 (class 1259 OID 74710)
-- Name: user_oauth_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 293 (class 1259 OID 74718)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_roles (
    role_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 295 (class 1259 OID 74724)
-- Name: users; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 294 (class 1259 OID 74723)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 297 (class 1259 OID 74738)
-- Name: wallet_transactions; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 296 (class 1259 OID 74737)
-- Name: wallet_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 299 (class 1259 OID 74744)
-- Name: wallets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wallets (
    balance numeric(15,2) NOT NULL,
    id integer NOT NULL,
    user_id integer NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    status character varying(255) NOT NULL,
    CONSTRAINT wallets_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'LOCKED'::character varying])::text[])))
);


--
-- TOC entry 298 (class 1259 OID 74743)
-- Name: wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- TOC entry 4000 (class 2606 OID 74410)
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4002 (class 2606 OID 74416)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 4004 (class 2606 OID 74418)
-- Name: carts carts_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_key UNIQUE (user_id);


--
-- TOC entry 4006 (class 2606 OID 74426)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4008 (class 2606 OID 74432)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- TOC entry 4010 (class 2606 OID 74438)
-- Name: completed_lessons_count completed_lessons_count_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT completed_lessons_count_pkey PRIMARY KEY (id);


--
-- TOC entry 4016 (class 2606 OID 74456)
-- Name: contest_participants contest_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT contest_participants_pkey PRIMARY KEY (id);


--
-- TOC entry 4014 (class 2606 OID 74450)
-- Name: contest contest_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT contest_pkey PRIMARY KEY (id);


--
-- TOC entry 4018 (class 2606 OID 74462)
-- Name: contest_problem_attempts contest_problem_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT contest_problem_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 4020 (class 2606 OID 74468)
-- Name: contest_problems contest_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT contest_problems_pkey PRIMARY KEY (id);


--
-- TOC entry 4022 (class 2606 OID 74474)
-- Name: contest_rankings contest_rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT contest_rankings_pkey PRIMARY KEY (id);


--
-- TOC entry 4024 (class 2606 OID 74479)
-- Name: course_category_mappings course_category_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT course_category_mappings_pkey PRIMARY KEY (category_id, course_id);


--
-- TOC entry 4026 (class 2606 OID 74489)
-- Name: course_moderation_reports course_moderation_reports_course_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_moderation_reports
    ADD CONSTRAINT course_moderation_reports_course_id_key UNIQUE (course_id);


--
-- TOC entry 4028 (class 2606 OID 74487)
-- Name: course_moderation_reports course_moderation_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_moderation_reports
    ADD CONSTRAINT course_moderation_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 4030 (class 2606 OID 74497)
-- Name: course_reviews course_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT course_reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 4032 (class 2606 OID 74506)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4034 (class 2606 OID 74513)
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 4036 (class 2606 OID 74522)
-- Name: instructor_applications instructor_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instructor_applications
    ADD CONSTRAINT instructor_applications_pkey PRIMARY KEY (id);


--
-- TOC entry 4038 (class 2606 OID 74531)
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);


--
-- TOC entry 4040 (class 2606 OID 74533)
-- Name: instructors instructors_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_user_id_key UNIQUE (user_id);


--
-- TOC entry 4042 (class 2606 OID 74539)
-- Name: invalidated_tokens invalidated_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invalidated_tokens
    ADD CONSTRAINT invalidated_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4044 (class 2606 OID 74547)
-- Name: lesson_comments lesson_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT lesson_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4046 (class 2606 OID 74553)
-- Name: lesson_problems lesson_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT lesson_problems_pkey PRIMARY KEY (id);


--
-- TOC entry 4048 (class 2606 OID 74559)
-- Name: lesson_progress lesson_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT lesson_progress_pkey PRIMARY KEY (id);


--
-- TOC entry 4050 (class 2606 OID 74568)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 4052 (class 2606 OID 74574)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4054 (class 2606 OID 74580)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4056 (class 2606 OID 74586)
-- Name: payment_transactions payment_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 4058 (class 2606 OID 74588)
-- Name: payment_transactions payment_transactions_transaction_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_transaction_code_key UNIQUE (transaction_code);


--
-- TOC entry 4060 (class 2606 OID 74596)
-- Name: payout_requests payout_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT payout_requests_pkey PRIMARY KEY (id);


--
-- TOC entry 4062 (class 2606 OID 74604)
-- Name: problem_comments problem_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT problem_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4064 (class 2606 OID 74613)
-- Name: problem_submission_details problem_submission_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT problem_submission_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4066 (class 2606 OID 74622)
-- Name: problem_submissions problem_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT problem_submissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4068 (class 2606 OID 74628)
-- Name: problem_tag_mappings problem_tag_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT problem_tag_mappings_pkey PRIMARY KEY (id);


--
-- TOC entry 4070 (class 2606 OID 74634)
-- Name: problem_tags problem_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4072 (class 2606 OID 74642)
-- Name: problem_testcases problem_testcases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_testcases
    ADD CONSTRAINT problem_testcases_pkey PRIMARY KEY (id);


--
-- TOC entry 4074 (class 2606 OID 74652)
-- Name: problem_versions problem_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_versions
    ADD CONSTRAINT problem_versions_pkey PRIMARY KEY (id);


--
-- TOC entry 4116 (class 2606 OID 82644)
-- Name: problem_visualizer_cache problem_visualizer_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_visualizer_cache
    ADD CONSTRAINT problem_visualizer_cache_pkey PRIMARY KEY (id);


--
-- TOC entry 4076 (class 2606 OID 74659)
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- TOC entry 4078 (class 2606 OID 74665)
-- Name: quiz_attempt_answers quiz_attempt_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT quiz_attempt_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 4080 (class 2606 OID 74671)
-- Name: quiz_attempts quiz_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT quiz_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 4082 (class 2606 OID 74679)
-- Name: quiz_options quiz_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_options
    ADD CONSTRAINT quiz_options_pkey PRIMARY KEY (id);


--
-- TOC entry 4084 (class 2606 OID 74687)
-- Name: quiz_questions quiz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT quiz_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 4086 (class 2606 OID 74693)
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- TOC entry 4088 (class 2606 OID 74700)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4096 (class 2606 OID 75164)
-- Name: user_oauth_accounts ukhvnjys5r8dgs5p107mae6cdip; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT ukhvnjys5r8dgs5p107mae6cdip UNIQUE (provider, provider_user_id);


--
-- TOC entry 4090 (class 2606 OID 75162)
-- Name: user_daily_activities ukqex64xyldm7nghim6s2t54ett; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT ukqex64xyldm7nghim6s2t54ett UNIQUE (user_id, activity_date);


--
-- TOC entry 4012 (class 2606 OID 74440)
-- Name: completed_lessons_count uq_completed_lessons_count_user_course; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT uq_completed_lessons_count_user_course UNIQUE (user_id, course_id);


--
-- TOC entry 4092 (class 2606 OID 74707)
-- Name: user_daily_activities user_daily_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT user_daily_activities_pkey PRIMARY KEY (id);


--
-- TOC entry 4094 (class 2606 OID 74709)
-- Name: user_daily_activities user_daily_activities_user_id_activity_date_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT user_daily_activities_user_id_activity_date_key UNIQUE (user_id, activity_date);


--
-- TOC entry 4098 (class 2606 OID 74715)
-- Name: user_oauth_accounts user_oauth_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT user_oauth_accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 4100 (class 2606 OID 74717)
-- Name: user_oauth_accounts user_oauth_accounts_provider_provider_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT user_oauth_accounts_provider_provider_user_id_key UNIQUE (provider, provider_user_id);


--
-- TOC entry 4102 (class 2606 OID 74722)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (role_id, user_id);


--
-- TOC entry 4104 (class 2606 OID 74734)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4106 (class 2606 OID 74732)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4108 (class 2606 OID 74736)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4110 (class 2606 OID 74742)
-- Name: wallet_transactions wallet_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT wallet_transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 4112 (class 2606 OID 74749)
-- Name: wallets wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- TOC entry 4114 (class 2606 OID 74751)
-- Name: wallets wallets_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_user_id_key UNIQUE (user_id);


--
-- TOC entry 4138 (class 2606 OID 74864)
-- Name: courses fk1kswo6qqebbdy2kq0kx6udof7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk1kswo6qqebbdy2kq0kx6udof7 FOREIGN KEY (instructor_id) REFERENCES public.instructors(id);


--
-- TOC entry 4159 (class 2606 OID 74969)
-- Name: problem_comments fk2ejlxsd61ciq2emegbkfli3cw; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT fk2ejlxsd61ciq2emegbkfli3cw FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4149 (class 2606 OID 74919)
-- Name: lesson_progress fk2j9inre1u78br1sca0pcv3i6o; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT fk2j9inre1u78br1sca0pcv3i6o FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4127 (class 2606 OID 74809)
-- Name: contest_problem_attempts fk2qb60o4hxp7rhj12qtrssmxuo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fk2qb60o4hxp7rhj12qtrssmxuo FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- TOC entry 4154 (class 2606 OID 74944)
-- Name: orders fk32ql8ubntj5uh44ph9659tiih; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk32ql8ubntj5uh44ph9659tiih FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4140 (class 2606 OID 74874)
-- Name: enrollments fk3hjx6rcnbmfw368sxigrpfpx0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk3hjx6rcnbmfw368sxigrpfpx0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4125 (class 2606 OID 74799)
-- Name: contest_participants fk3l1iketg9qjipqd33tua1ddex; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT fk3l1iketg9qjipqd33tua1ddex FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4133 (class 2606 OID 74839)
-- Name: contest_rankings fk52e45mk8phc5xoyy81wri2ri; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT fk52e45mk8phc5xoyy81wri2ri FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4174 (class 2606 OID 75044)
-- Name: quiz_attempt_answers fk54g2hjt484k0nnvfx9kj1j8qe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fk54g2hjt484k0nnvfx9kj1j8qe FOREIGN KEY (selected_option_id) REFERENCES public.quiz_options(id);


--
-- TOC entry 4144 (class 2606 OID 74894)
-- Name: lesson_comments fk58fdhg12mhkyagk550qytlafy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fk58fdhg12mhkyagk550qytlafy FOREIGN KEY (parent_comment_id) REFERENCES public.lesson_comments(id);


--
-- TOC entry 4137 (class 2606 OID 74859)
-- Name: course_reviews fk5rcljcnb4if64q6q8ilwn0w5k; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT fk5rcljcnb4if64q6q8ilwn0w5k FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4120 (class 2606 OID 74774)
-- Name: chapters fk6h1m0nrtdwj37570c0sp2tdcs; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT fk6h1m0nrtdwj37570c0sp2tdcs FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4156 (class 2606 OID 74954)
-- Name: payout_requests fk6qtj6fnswmrrfqla2meq258nq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT fk6qtj6fnswmrrfqla2meq258nq FOREIGN KEY (wallet_id) REFERENCES public.wallets(id);


--
-- TOC entry 4136 (class 2606 OID 74854)
-- Name: course_reviews fk799g8dfcye3g51ru63bfdhyb1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT fk799g8dfcye3g51ru63bfdhyb1 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4163 (class 2606 OID 74989)
-- Name: problem_submissions fk8ei1ttrildtrn9a4mmrxvi31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk8ei1ttrildtrn9a4mmrxvi31 FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- TOC entry 4184 (class 2606 OID 75094)
-- Name: wallet_transactions fk8seu7b87ifqi09ghhssusmb0x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT fk8seu7b87ifqi09ghhssusmb0x FOREIGN KEY (wallet_id) REFERENCES public.wallets(id);


--
-- TOC entry 4165 (class 2606 OID 74999)
-- Name: problem_submissions fk9dsq5pj8f74cej03s2nwulg10; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk9dsq5pj8f74cej03s2nwulg10 FOREIGN KEY (problem_version_id) REFERENCES public.problem_versions(id);


--
-- TOC entry 4129 (class 2606 OID 74819)
-- Name: contest_problems fka45ve6lwr6ti8s35kmekyf6wh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT fka45ve6lwr6ti8s35kmekyf6wh FOREIGN KEY (contest_id) REFERENCES public.contest(id);


--
-- TOC entry 4123 (class 2606 OID 74789)
-- Name: contest fka64beyokxao0s2e3d5so2b1et; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT fka64beyokxao0s2e3d5so2b1et FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 4145 (class 2606 OID 74899)
-- Name: lesson_comments fkae19hwvklqllk5ws9bwtpo0x2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fkae19hwvklqllk5ws9bwtpo0x2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4177 (class 2606 OID 75059)
-- Name: quiz_questions fkanfmgf6ksbdnv7ojb0pfve54q; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT fkanfmgf6ksbdnv7ojb0pfve54q FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id);


--
-- TOC entry 4168 (class 2606 OID 75014)
-- Name: problem_tag_mappings fkb2s5u1fg7ngipjai7g2ehlnxl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT fkb2s5u1fg7ngipjai7g2ehlnxl FOREIGN KEY (tag_id) REFERENCES public.problem_tags(id);


--
-- TOC entry 4119 (class 2606 OID 74769)
-- Name: carts fkb5o626f86h46m4s7ms6ginnop; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fkb5o626f86h46m4s7ms6ginnop FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4135 (class 2606 OID 74849)
-- Name: course_category_mappings fkbcb54i537ayiuudpghq26akmj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT fkbcb54i537ayiuudpghq26akmj FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4178 (class 2606 OID 75064)
-- Name: quizzes fkbdv8uggpsin6pnkx0d80ryqey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT fkbdv8uggpsin6pnkx0d80ryqey FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- TOC entry 4157 (class 2606 OID 74959)
-- Name: problem_comments fkbeaj9majn3i0nqrtt7f1975lk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT fkbeaj9majn3i0nqrtt7f1975lk FOREIGN KEY (parent_id) REFERENCES public.problem_comments(id);


--
-- TOC entry 4153 (class 2606 OID 74939)
-- Name: order_items fkbioxgbv59vetrxe0ejfubep1w; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fkbioxgbv59vetrxe0ejfubep1w FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4185 (class 2606 OID 75099)
-- Name: wallets fkc1foyisidw7wqqrkamafuwn4e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT fkc1foyisidw7wqqrkamafuwn4e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4143 (class 2606 OID 74889)
-- Name: lesson_comments fkc294lsbm7r4n3xyg9rgurh07k; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fkc294lsbm7r4n3xyg9rgurh07k FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- TOC entry 4148 (class 2606 OID 74914)
-- Name: lesson_problems fkcd6vr86wsa94892cdkicpv28; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT fkcd6vr86wsa94892cdkicpv28 FOREIGN KEY (problem_version_id) REFERENCES public.problem_versions(id);


--
-- TOC entry 4160 (class 2606 OID 74974)
-- Name: problem_submission_details fkcjg9vh0i8mcn6r5f8kd2ac300; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT fkcjg9vh0i8mcn6r5f8kd2ac300 FOREIGN KEY (submission_id) REFERENCES public.problem_submissions(id);


--
-- TOC entry 4155 (class 2606 OID 74949)
-- Name: payment_transactions fkd88o3dfuygwharyikml47ebhk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT fkd88o3dfuygwharyikml47ebhk FOREIGN KEY (wallet_id) REFERENCES public.wallets(id);


--
-- TOC entry 4142 (class 2606 OID 74884)
-- Name: instructors fkds2m3jgxj98sd5mr1qw23ecjp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT fkds2m3jgxj98sd5mr1qw23ecjp FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4166 (class 2606 OID 75004)
-- Name: problem_submissions fkepg6sogg63mouncuwheku7dam; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fkepg6sogg63mouncuwheku7dam FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4183 (class 2606 OID 75089)
-- Name: wallet_transactions fketfi6nehbld4k4ma3oshxpp8j; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT fketfi6nehbld4k4ma3oshxpp8j FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4126 (class 2606 OID 74804)
-- Name: contest_problem_attempts fkfnm97wppjoqpsa7isvtdnd04s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fkfnm97wppjoqpsa7isvtdnd04s FOREIGN KEY (contest_id) REFERENCES public.contest(id);


--
-- TOC entry 4167 (class 2606 OID 75009)
-- Name: problem_tag_mappings fkfpgck5o4f2ys09q6gs3cwwi5x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT fkfpgck5o4f2ys09q6gs3cwwi5x FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- TOC entry 4175 (class 2606 OID 75049)
-- Name: quiz_attempts fkfwipvfipnnwsoacoyv5k7fbxc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT fkfwipvfipnnwsoacoyv5k7fbxc FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id);


--
-- TOC entry 4132 (class 2606 OID 74834)
-- Name: contest_rankings fkg7tnte0bg7u0y97omrr441wht; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT fkg7tnte0bg7u0y97omrr441wht FOREIGN KEY (contest_id) REFERENCES public.contest(id);


--
-- TOC entry 4134 (class 2606 OID 74844)
-- Name: course_category_mappings fkgixmfc87xulrd0eudp8wc5es; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT fkgixmfc87xulrd0eudp8wc5es FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 4181 (class 2606 OID 75079)
-- Name: user_roles fkh8ciramu9cc9q3qcqiv4ue8a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 4182 (class 2606 OID 75084)
-- Name: user_roles fkhfh9dx7w3ubf1co1vdev94g3f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4176 (class 2606 OID 75054)
-- Name: quiz_options fkhkuvmd7qk1lmtq3hy9htpinkr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_options
    ADD CONSTRAINT fkhkuvmd7qk1lmtq3hy9htpinkr FOREIGN KEY (question_id) REFERENCES public.quiz_questions(id);


--
-- TOC entry 4139 (class 2606 OID 74869)
-- Name: enrollments fkho8mcicp4196ebpltdn9wl6co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fkho8mcicp4196ebpltdn9wl6co FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4150 (class 2606 OID 74924)
-- Name: lesson_progress fkhxwj6gbacmwi2768sceg602uf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT fkhxwj6gbacmwi2768sceg602uf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4122 (class 2606 OID 74784)
-- Name: completed_lessons_count fkilxswyivftkeso9mf0d9cta1p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT fkilxswyivftkeso9mf0d9cta1p FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4118 (class 2606 OID 74764)
-- Name: cart_items fkivp3vwkw2egm5ekoapk31iqs6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fkivp3vwkw2egm5ekoapk31iqs6 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4146 (class 2606 OID 74904)
-- Name: lesson_problems fkja84kupkp9or1elxh5rsp8b7s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT fkja84kupkp9or1elxh5rsp8b7s FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);


--
-- TOC entry 4179 (class 2606 OID 75069)
-- Name: user_daily_activities fkjvlds4clccy826bptmn4viqbr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT fkjvlds4clccy826bptmn4viqbr FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4164 (class 2606 OID 74994)
-- Name: problem_submissions fkkciiwnphdpe56b7qwsm50hqrn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fkkciiwnphdpe56b7qwsm50hqrn FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- TOC entry 4170 (class 2606 OID 75024)
-- Name: problem_versions fkkgjnnr6op1hcts5iub5lmt4mp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_versions
    ADD CONSTRAINT fkkgjnnr6op1hcts5iub5lmt4mp FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- TOC entry 4173 (class 2606 OID 75039)
-- Name: quiz_attempt_answers fklhd30qs5tx5e4f01vj8jt1s8t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fklhd30qs5tx5e4f01vj8jt1s8t FOREIGN KEY (quiz_question_id) REFERENCES public.quiz_questions(id);


--
-- TOC entry 4180 (class 2606 OID 75074)
-- Name: user_oauth_accounts fklkuinqstu5ypmj8j0gg6mv575; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT fklkuinqstu5ypmj8j0gg6mv575 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4172 (class 2606 OID 75034)
-- Name: quiz_attempt_answers fkm8571omdvyu3q35r8ansqqqi2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fkm8571omdvyu3q35r8ansqqqi2 FOREIGN KEY (quiz_attempt_id) REFERENCES public.quiz_attempts(id);


--
-- TOC entry 4151 (class 2606 OID 74929)
-- Name: lessons fkmb78vk1f2oljr16oj1hpo45ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fkmb78vk1f2oljr16oj1hpo45ma FOREIGN KEY (chapter_id) REFERENCES public.chapters(id);


--
-- TOC entry 4128 (class 2606 OID 74814)
-- Name: contest_problem_attempts fkmiu76scjlo89ojn9c22evwofh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fkmiu76scjlo89ojn9c22evwofh FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4171 (class 2606 OID 75029)
-- Name: problems fkmnwvifcr9q5s3p7edw0cyctky; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT fkmnwvifcr9q5s3p7edw0cyctky FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 4141 (class 2606 OID 74879)
-- Name: instructor_applications fknt6ss9ppkuhjay2s1t5l9n3ff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instructor_applications
    ADD CONSTRAINT fknt6ss9ppkuhjay2s1t5l9n3ff FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4147 (class 2606 OID 74909)
-- Name: lesson_problems fkoh3mxr7fwsr0xs35rj55xx1ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT fkoh3mxr7fwsr0xs35rj55xx1ru FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- TOC entry 4169 (class 2606 OID 75019)
-- Name: problem_testcases fkp3x2eolxuvcs4lnbit80xn6os; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_testcases
    ADD CONSTRAINT fkp3x2eolxuvcs4lnbit80xn6os FOREIGN KEY (problem_version_id) REFERENCES public.problem_versions(id);


--
-- TOC entry 4117 (class 2606 OID 74759)
-- Name: cart_items fkpcttvuq4mxppo8sxggjtn5i2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fkpcttvuq4mxppo8sxggjtn5i2c FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- TOC entry 4162 (class 2606 OID 74984)
-- Name: problem_submissions fkq82fa2e333x4v33a2kc3re3j8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fkq82fa2e333x4v33a2kc3re3j8 FOREIGN KEY (contest_id) REFERENCES public.contest(id);


--
-- TOC entry 4161 (class 2606 OID 74979)
-- Name: problem_submission_details fkqjgwh4xufvary1vwaxrn351pv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT fkqjgwh4xufvary1vwaxrn351pv FOREIGN KEY (testcase_id) REFERENCES public.problem_testcases(id);


--
-- TOC entry 4130 (class 2606 OID 74824)
-- Name: contest_problems fkqqps7ixp2sidn9ktk7h34pee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT fkqqps7ixp2sidn9ktk7h34pee FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- TOC entry 4158 (class 2606 OID 74964)
-- Name: problem_comments fkr2qo0k64sn9ovbgr75nw7vi2r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT fkr2qo0k64sn9ovbgr75nw7vi2r FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- TOC entry 4131 (class 2606 OID 74829)
-- Name: contest_problems fks906s1268s388c02b03t6ubej; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT fks906s1268s388c02b03t6ubej FOREIGN KEY (problem_version_id) REFERENCES public.problem_versions(id);


--
-- TOC entry 4124 (class 2606 OID 74794)
-- Name: contest_participants fkscq5updfr2dg1lliqs7jn9b8k; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT fkscq5updfr2dg1lliqs7jn9b8k FOREIGN KEY (contest_id) REFERENCES public.contest(id);


--
-- TOC entry 4121 (class 2606 OID 74779)
-- Name: completed_lessons_count fksfu0dm9pu61y2ihppu7bms7su; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT fksfu0dm9pu61y2ihppu7bms7su FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4152 (class 2606 OID 74934)
-- Name: order_items fky4aiomvn1gl62yjreckpt6lv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fky4aiomvn1gl62yjreckpt6lv FOREIGN KEY (course_id) REFERENCES public.courses(id);


-- Completed on 2026-07-21 22:51:37 +07

--
-- PostgreSQL database dump complete
--

\unrestrict PNv8ZgqDfXFs1tsFxL0e4I0mLRsjo3JduRi77XQRRJc5IldHCxLs4BIGs83RZWf

