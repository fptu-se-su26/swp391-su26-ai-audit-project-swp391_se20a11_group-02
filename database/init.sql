--
-- PostgreSQL database dump
--

\restrict xlDJh4Y6uqybzBLM2A4BbZry9fywDNSMTJHUMoHeVmweZo604DNOMo2iTHNAKzO

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-06-05 15:13:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5767 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 995 (class 1247 OID 18624)
-- Name: contest_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.contest_status AS ENUM (
    'UPCOMING',
    'RUNNING',
    'ENDED',
    'CANCELLED'
);


ALTER TYPE public.contest_status OWNER TO postgres;

--
-- TOC entry 1133 (class 1247 OID 20294)
-- Name: conteststatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.conteststatus AS ENUM (
    'CANCELLED',
    'ENDED',
    'RUNNING',
    'UPCOMING'
);


ALTER TYPE public.conteststatus OWNER TO postgres;

--
-- TOC entry 971 (class 1247 OID 18548)
-- Name: course_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.course_status AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED'
);


ALTER TYPE public.course_status OWNER TO postgres;

--
-- TOC entry 974 (class 1247 OID 18556)
-- Name: enrollment_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enrollment_status AS ENUM (
    'ACTIVE',
    'CANCELLED',
    'COMPLETED'
);


ALTER TYPE public.enrollment_status OWNER TO postgres;

--
-- TOC entry 950 (class 1247 OID 18486)
-- Name: instructor_app_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.instructor_app_status AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED'
);


ALTER TYPE public.instructor_app_status OWNER TO postgres;

--
-- TOC entry 953 (class 1247 OID 18494)
-- Name: instructor_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.instructor_status AS ENUM (
    'ACTIVE',
    'SUSPENDED'
);


ALTER TYPE public.instructor_status OWNER TO postgres;

--
-- TOC entry 989 (class 1247 OID 18596)
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
-- TOC entry 968 (class 1247 OID 18540)
-- Name: order_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_status AS ENUM (
    'PENDING',
    'COMPLETED',
    'FAILED'
);


ALTER TYPE public.order_status OWNER TO postgres;

--
-- TOC entry 965 (class 1247 OID 18534)
-- Name: payment_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_type AS ENUM (
    'DEPOSIT',
    'WITHDRAW'
);


ALTER TYPE public.payment_type OWNER TO postgres;

--
-- TOC entry 959 (class 1247 OID 18516)
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
-- TOC entry 986 (class 1247 OID 18588)
-- Name: problem_difficulty; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.problem_difficulty AS ENUM (
    'EASY',
    'MEDIUM',
    'HARD'
);


ALTER TYPE public.problem_difficulty OWNER TO postgres;

--
-- TOC entry 983 (class 1247 OID 18578)
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
-- TOC entry 977 (class 1247 OID 18564)
-- Name: progress_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.progress_status AS ENUM (
    'NOT_STARTED',
    'IN_PROGRESS',
    'COMPLETED'
);


ALTER TYPE public.progress_status OWNER TO postgres;

--
-- TOC entry 980 (class 1247 OID 18572)
-- Name: quiz_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.quiz_status AS ENUM (
    'IN_PROGRESS',
    'COMPLETED'
);


ALTER TYPE public.quiz_status OWNER TO postgres;

--
-- TOC entry 947 (class 1247 OID 18478)
-- Name: role_name; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.role_name AS ENUM (
    'USER',
    'INSTRUCTOR',
    'ADMIN'
);


ALTER TYPE public.role_name OWNER TO postgres;

--
-- TOC entry 992 (class 1247 OID 18616)
-- Name: scoring_rule; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.scoring_rule AS ENUM (
    'ICPC',
    'IOI',
    'CUSTOM'
);


ALTER TYPE public.scoring_rule OWNER TO postgres;

--
-- TOC entry 1130 (class 1247 OID 20285)
-- Name: scoringrule; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.scoringrule AS ENUM (
    'CUSTOM',
    'ICPC',
    'IOI'
);


ALTER TYPE public.scoringrule OWNER TO postgres;

--
-- TOC entry 944 (class 1247 OID 18473)
-- Name: status_active_locked; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_active_locked AS ENUM (
    'ACTIVE',
    'LOCKED'
);


ALTER TYPE public.status_active_locked OWNER TO postgres;

--
-- TOC entry 962 (class 1247 OID 18526)
-- Name: status_transaction; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_transaction AS ENUM (
    'SUCCESS',
    'FAILED',
    'PENDING'
);


ALTER TYPE public.status_transaction OWNER TO postgres;

--
-- TOC entry 956 (class 1247 OID 18500)
-- Name: transaction_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.transaction_type AS ENUM (
    'DEPOSIT',
    'WITHDRAW',
    'BUY_COURSE',
    'SELL_COURSE',
    'REFUND',
    'AWARD',
    'PLATFORM_FEE'
);


ALTER TYPE public.transaction_type OWNER TO postgres;

--
-- TOC entry 311 (class 1255 OID 19602)
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
-- TOC entry 246 (class 1259 OID 18833)
-- Name: cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_items (
    id integer NOT NULL,
    cart_id integer NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    added_at timestamp(6) without time zone
);


ALTER TABLE public.cart_items OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 18832)
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_items_id_seq OWNER TO postgres;

--
-- TOC entry 5768 (class 0 OID 0)
-- Dependencies: 245
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- TOC entry 244 (class 1259 OID 18820)
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 18819)
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO postgres;

--
-- TOC entry 5769 (class 0 OID 0)
-- Dependencies: 243
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- TOC entry 250 (class 1259 OID 18876)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 18875)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 5770 (class 0 OID 0)
-- Dependencies: 249
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 258 (class 1259 OID 18931)
-- Name: chapters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chapters (
    id integer NOT NULL,
    course_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    order_index integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.chapters OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 18930)
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chapters_id_seq OWNER TO postgres;

--
-- TOC entry 5771 (class 0 OID 0)
-- Dependencies: 257
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;


--
-- TOC entry 300 (class 1259 OID 19658)
-- Name: completed_lessons_count; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.completed_lessons_count (
    id bigint NOT NULL,
    completed_lessons_count integer NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    course_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.completed_lessons_count OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 19657)
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
-- TOC entry 292 (class 1259 OID 19195)
-- Name: contest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest (
    id integer NOT NULL,
    created_by integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    scoring_rule character varying(255) DEFAULT 'ICPC'::public.scoring_rule,
    password_hash character varying(255),
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    durations integer NOT NULL,
    status character varying(255) DEFAULT 'UPCOMING'::public.contest_status,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    fts_document tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((public.f_unaccent((title)::text) || ' '::text) || public.f_unaccent(COALESCE(description, ''::text))))) STORED
);


ALTER TABLE public.contest OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 19194)
-- Name: contest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contest_id_seq OWNER TO postgres;

--
-- TOC entry 5772 (class 0 OID 0)
-- Dependencies: 291
-- Name: contest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contest_id_seq OWNED BY public.contest.id;


--
-- TOC entry 294 (class 1259 OID 19214)
-- Name: contest_participants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest_participants (
    id integer NOT NULL,
    contest_id integer NOT NULL,
    user_id integer NOT NULL,
    joined_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contest_participants OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 19213)
-- Name: contest_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contest_participants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contest_participants_id_seq OWNER TO postgres;

--
-- TOC entry 5773 (class 0 OID 0)
-- Dependencies: 293
-- Name: contest_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contest_participants_id_seq OWNED BY public.contest_participants.id;


--
-- TOC entry 298 (class 1259 OID 19243)
-- Name: contest_problem_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest_problem_attempts (
    id integer NOT NULL,
    contest_id integer NOT NULL,
    user_id integer NOT NULL,
    problem_id integer NOT NULL,
    is_solved boolean DEFAULT false NOT NULL,
    solved_at_seconds integer,
    failed_attempts_count integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT contest_problem_attempts_failed_attempts_count_check CHECK ((failed_attempts_count >= 0)),
    CONSTRAINT contest_problem_attempts_solved_at_seconds_check CHECK ((solved_at_seconds >= 0))
);


ALTER TABLE public.contest_problem_attempts OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 19242)
-- Name: contest_problem_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contest_problem_attempts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contest_problem_attempts_id_seq OWNER TO postgres;

--
-- TOC entry 5774 (class 0 OID 0)
-- Dependencies: 297
-- Name: contest_problem_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contest_problem_attempts_id_seq OWNED BY public.contest_problem_attempts.id;


--
-- TOC entry 284 (class 1259 OID 19137)
-- Name: contest_problems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest_problems (
    id integer NOT NULL,
    contest_id integer NOT NULL,
    problem_id integer NOT NULL,
    order_index integer NOT NULL
);


ALTER TABLE public.contest_problems OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 19136)
-- Name: contest_problems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contest_problems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contest_problems_id_seq OWNER TO postgres;

--
-- TOC entry 5775 (class 0 OID 0)
-- Dependencies: 283
-- Name: contest_problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contest_problems_id_seq OWNED BY public.contest_problems.id;


--
-- TOC entry 296 (class 1259 OID 19225)
-- Name: contest_rankings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest_rankings (
    id integer NOT NULL,
    contest_id integer NOT NULL,
    user_id integer NOT NULL,
    problems_solved integer DEFAULT 0 NOT NULL,
    total_penalty integer DEFAULT 0 NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT contest_rankings_problems_solved_check CHECK ((problems_solved >= 0)),
    CONSTRAINT contest_rankings_total_penalty_check CHECK ((total_penalty >= 0))
);


ALTER TABLE public.contest_rankings OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 19224)
-- Name: contest_rankings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contest_rankings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contest_rankings_id_seq OWNER TO postgres;

--
-- TOC entry 5776 (class 0 OID 0)
-- Dependencies: 295
-- Name: contest_rankings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contest_rankings_id_seq OWNED BY public.contest_rankings.id;


--
-- TOC entry 252 (class 1259 OID 18891)
-- Name: course_category_mappings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_category_mappings (
    id integer NOT NULL,
    course_id bigint NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.course_category_mappings OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 18890)
-- Name: course_category_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_category_mappings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_category_mappings_id_seq OWNER TO postgres;

--
-- TOC entry 5777 (class 0 OID 0)
-- Dependencies: 251
-- Name: course_category_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_category_mappings_id_seq OWNED BY public.course_category_mappings.id;


--
-- TOC entry 254 (class 1259 OID 18901)
-- Name: course_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_reviews (
    id integer NOT NULL,
    course_id bigint NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    star integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.course_reviews OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 18900)
-- Name: course_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_reviews_id_seq OWNER TO postgres;

--
-- TOC entry 5778 (class 0 OID 0)
-- Dependencies: 253
-- Name: course_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_reviews_id_seq OWNED BY public.course_reviews.id;


--
-- TOC entry 248 (class 1259 OID 18844)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    instructor_id integer NOT NULL,
    title character varying(255) NOT NULL,
    thumbnail_url character varying(255) NOT NULL,
    short_description character varying(255) NOT NULL,
    long_description text NOT NULL,
    what_you_learn text,
    course_highlight text,
    technology_tool character varying(255),
    prerequisites text,
    target_audience text,
    completion_benefits text,
    status character varying(255) DEFAULT 'PENDING'::public.course_status,
    price numeric(15,2) DEFAULT 0 NOT NULL,
    type character varying(50) NOT NULL,
    average_rating double precision DEFAULT 0 NOT NULL,
    total_reviews integer DEFAULT 0 NOT NULL,
    total_enrolled integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    fts_document tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((public.f_unaccent((title)::text) || ' '::text) || public.f_unaccent((short_description)::text)))) STORED,
    total_lessons integer NOT NULL,
    total_quizzes integer NOT NULL,
    total_videos integer NOT NULL,
    CONSTRAINT courses_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 18843)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO postgres;

--
-- TOC entry 5779 (class 0 OID 0)
-- Dependencies: 247
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- TOC entry 256 (class 1259 OID 18917)
-- Name: enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    course_id bigint NOT NULL,
    enrolled_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'ACTIVE'::public.enrollment_status
);


ALTER TABLE public.enrollments OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 18916)
-- Name: enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enrollments_id_seq OWNER TO postgres;

--
-- TOC entry 5780 (class 0 OID 0)
-- Dependencies: 255
-- Name: enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollments_id_seq OWNED BY public.enrollments.id;


--
-- TOC entry 228 (class 1259 OID 18686)
-- Name: instructor_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_applications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    cv_url character varying(255) NOT NULL,
    introduction text NOT NULL,
    status public.instructor_app_status DEFAULT 'PENDING'::public.instructor_app_status,
    admin_note text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.instructor_applications OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18685)
-- Name: instructor_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructor_applications_id_seq OWNER TO postgres;

--
-- TOC entry 5781 (class 0 OID 0)
-- Dependencies: 227
-- Name: instructor_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_applications_id_seq OWNED BY public.instructor_applications.id;


--
-- TOC entry 230 (class 1259 OID 18702)
-- Name: instructors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructors (
    id integer NOT NULL,
    user_id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    major character varying(255) NOT NULL,
    bio text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'ACTIVE'::public.instructor_status,
    hired_by_admin boolean DEFAULT false
);


ALTER TABLE public.instructors OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18701)
-- Name: instructors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructors_id_seq OWNER TO postgres;

--
-- TOC entry 5782 (class 0 OID 0)
-- Dependencies: 229
-- Name: instructors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructors_id_seq OWNED BY public.instructors.id;


--
-- TOC entry 226 (class 1259 OID 18673)
-- Name: invalidated_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invalidated_tokens (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    expiry_time timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.invalidated_tokens OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18672)
-- Name: invalidated_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invalidated_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invalidated_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 5783 (class 0 OID 0)
-- Dependencies: 225
-- Name: invalidated_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invalidated_tokens_id_seq OWNED BY public.invalidated_tokens.id;


--
-- TOC entry 262 (class 1259 OID 18963)
-- Name: lesson_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_comments (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    parent_comment_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.lesson_comments OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 18962)
-- Name: lesson_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_comments_id_seq OWNER TO postgres;

--
-- TOC entry 5784 (class 0 OID 0)
-- Dependencies: 261
-- Name: lesson_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_comments_id_seq OWNED BY public.lesson_comments.id;


--
-- TOC entry 282 (class 1259 OID 19125)
-- Name: lesson_problems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_problems (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    problem_id integer NOT NULL,
    order_index integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.lesson_problems OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 19124)
-- Name: lesson_problems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_problems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_problems_id_seq OWNER TO postgres;

--
-- TOC entry 5785 (class 0 OID 0)
-- Dependencies: 281
-- Name: lesson_problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_problems_id_seq OWNED BY public.lesson_problems.id;


--
-- TOC entry 264 (class 1259 OID 18978)
-- Name: lesson_progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_progress (
    id integer NOT NULL,
    user_id integer NOT NULL,
    lesson_id integer NOT NULL,
    course_id bigint NOT NULL,
    completed_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.lesson_progress OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 18977)
-- Name: lesson_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_progress_id_seq OWNER TO postgres;

--
-- TOC entry 5786 (class 0 OID 0)
-- Dependencies: 263
-- Name: lesson_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_progress_id_seq OWNED BY public.lesson_progress.id;


--
-- TOC entry 260 (class 1259 OID 18945)
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    id integer NOT NULL,
    chapter_id integer NOT NULL,
    title character varying(255) NOT NULL,
    theory_content text,
    video_url character varying(255),
    source_code text,
    is_trial boolean DEFAULT false NOT NULL,
    order_index integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 18944)
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lessons_id_seq OWNER TO postgres;

--
-- TOC entry 5787 (class 0 OID 0)
-- Dependencies: 259
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- TOC entry 242 (class 1259 OID 18808)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    course_id integer NOT NULL,
    price numeric(15,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 18807)
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO postgres;

--
-- TOC entry 5788 (class 0 OID 0)
-- Dependencies: 241
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- TOC entry 240 (class 1259 OID 18794)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    total_amount numeric(15,2) DEFAULT 0 NOT NULL,
    status public.order_status DEFAULT 'PENDING'::public.order_status,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18793)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 5789 (class 0 OID 0)
-- Dependencies: 239
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 238 (class 1259 OID 18776)
-- Name: payment_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_transactions (
    id integer NOT NULL,
    wallet_id integer NOT NULL,
    amount numeric(15,2) NOT NULL,
    type public.payment_type NOT NULL,
    transaction_code character varying(255) NOT NULL,
    status public.status_transaction DEFAULT 'PENDING'::public.status_transaction,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT payment_transactions_amount_check CHECK ((amount >= (0)::numeric))
);


ALTER TABLE public.payment_transactions OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18775)
-- Name: payment_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_transactions_id_seq OWNER TO postgres;

--
-- TOC entry 5790 (class 0 OID 0)
-- Dependencies: 237
-- Name: payment_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_transactions_id_seq OWNED BY public.payment_transactions.id;


--
-- TOC entry 236 (class 1259 OID 18752)
-- Name: payout_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payout_requests (
    id integer NOT NULL,
    wallet_id integer NOT NULL,
    payout_period character varying(50) NOT NULL,
    amount numeric(15,2) NOT NULL,
    bank_name character varying(255) NOT NULL,
    bank_account_number character varying(255) NOT NULL,
    bank_account_name character varying(255) NOT NULL,
    status public.payout_status DEFAULT 'PENDING'::public.payout_status,
    transaction_reference character varying(255),
    admin_note text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT payout_requests_amount_check CHECK ((amount > (0)::numeric))
);


ALTER TABLE public.payout_requests OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18751)
-- Name: payout_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payout_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payout_requests_id_seq OWNER TO postgres;

--
-- TOC entry 5791 (class 0 OID 0)
-- Dependencies: 235
-- Name: payout_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payout_requests_id_seq OWNED BY public.payout_requests.id;


--
-- TOC entry 306 (class 1259 OID 19853)
-- Name: problem_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_comments (
    id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    parent_id integer,
    problem_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.problem_comments OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 19852)
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
-- TOC entry 288 (class 1259 OID 19165)
-- Name: problem_submission_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_submission_details (
    id integer NOT NULL,
    submission_id integer NOT NULL,
    testcase_id integer NOT NULL,
    token character varying(255),
    execution_time integer,
    memory_used integer,
    verdict character varying(255) DEFAULT 'PENDING'::public.oj_verdict,
    stdout text,
    stderr text,
    compile_output text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.problem_submission_details OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 19164)
-- Name: problem_submission_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.problem_submission_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.problem_submission_details_id_seq OWNER TO postgres;

--
-- TOC entry 5792 (class 0 OID 0)
-- Dependencies: 287
-- Name: problem_submission_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.problem_submission_details_id_seq OWNED BY public.problem_submission_details.id;


--
-- TOC entry 286 (class 1259 OID 19148)
-- Name: problem_submissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_submissions (
    id integer NOT NULL,
    problem_id integer NOT NULL,
    user_id integer NOT NULL,
    lesson_id integer,
    contest_id integer,
    language_id integer NOT NULL,
    source_code text NOT NULL,
    execution_time integer,
    memory_used integer,
    score numeric(10,2),
    submitted_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    verdict character varying(255) DEFAULT 'PENDING'::public.oj_verdict,
    is_plagiarized boolean DEFAULT false
);


ALTER TABLE public.problem_submissions OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 19147)
-- Name: problem_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.problem_submissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.problem_submissions_id_seq OWNER TO postgres;

--
-- TOC entry 5793 (class 0 OID 0)
-- Dependencies: 285
-- Name: problem_submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.problem_submissions_id_seq OWNED BY public.problem_submissions.id;


--
-- TOC entry 280 (class 1259 OID 19112)
-- Name: problem_tag_mappings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_tag_mappings (
    id integer NOT NULL,
    problem_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.problem_tag_mappings OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 19111)
-- Name: problem_tag_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.problem_tag_mappings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.problem_tag_mappings_id_seq OWNER TO postgres;

--
-- TOC entry 5794 (class 0 OID 0)
-- Dependencies: 279
-- Name: problem_tag_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.problem_tag_mappings_id_seq OWNED BY public.problem_tag_mappings.id;


--
-- TOC entry 278 (class 1259 OID 19094)
-- Name: problem_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_tags (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(120) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT problem_tags_name_check CHECK ((TRIM(BOTH FROM name) <> ''::text)),
    CONSTRAINT problem_tags_slug_check CHECK ((TRIM(BOTH FROM slug) <> ''::text))
);


ALTER TABLE public.problem_tags OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 19093)
-- Name: problem_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.problem_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.problem_tags_id_seq OWNER TO postgres;

--
-- TOC entry 5795 (class 0 OID 0)
-- Dependencies: 277
-- Name: problem_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.problem_tags_id_seq OWNED BY public.problem_tags.id;


--
-- TOC entry 290 (class 1259 OID 19179)
-- Name: problem_testcases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_testcases (
    id integer NOT NULL,
    problem_id integer NOT NULL,
    input_data text NOT NULL,
    expected_output text NOT NULL,
    order_index integer NOT NULL,
    token character varying(255)
);


ALTER TABLE public.problem_testcases OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 19178)
-- Name: problem_testcases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.problem_testcases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.problem_testcases_id_seq OWNER TO postgres;

--
-- TOC entry 5796 (class 0 OID 0)
-- Dependencies: 289
-- Name: problem_testcases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.problem_testcases_id_seq OWNED BY public.problem_testcases.id;


--
-- TOC entry 276 (class 1259 OID 19063)
-- Name: problems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problems (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    input_description text,
    output_description text,
    constraints text,
    example_input text,
    example_output text,
    hint text,
    problem_scope character varying(255) NOT NULL,
    difficulty character varying(255) DEFAULT 'MEDIUM'::public.problem_difficulty,
    is_active boolean DEFAULT true NOT NULL,
    created_by integer CONSTRAINT problems_created_by_teacher_id_not_null NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    total_testcase integer DEFAULT 0 NOT NULL,
    time_limit_ms integer DEFAULT 2000 NOT NULL,
    memory_limit_kb integer DEFAULT 128000 NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    total_submission integer DEFAULT 0,
    total_accepted integer DEFAULT 0,
    score numeric(10,2) DEFAULT 100.00 NOT NULL,
    solutions text,
    fts_document tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, public.f_unaccent((title)::text))) STORED
);


ALTER TABLE public.problems OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 19062)
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.problems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.problems_id_seq OWNER TO postgres;

--
-- TOC entry 5797 (class 0 OID 0)
-- Dependencies: 275
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.problems_id_seq OWNED BY public.problems.id;


--
-- TOC entry 274 (class 1259 OID 19053)
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
-- TOC entry 273 (class 1259 OID 19052)
-- Name: quiz_attempt_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_attempt_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_attempt_answers_id_seq OWNER TO postgres;

--
-- TOC entry 5798 (class 0 OID 0)
-- Dependencies: 273
-- Name: quiz_attempt_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_attempt_answers_id_seq OWNED BY public.quiz_attempt_answers.id;


--
-- TOC entry 272 (class 1259 OID 19038)
-- Name: quiz_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_attempts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    quiz_id integer NOT NULL,
    total_question integer NOT NULL,
    correct_question integer NOT NULL,
    score double precision NOT NULL,
    submitted_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.quiz_attempts OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 19037)
-- Name: quiz_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_attempts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_attempts_id_seq OWNER TO postgres;

--
-- TOC entry 5799 (class 0 OID 0)
-- Dependencies: 271
-- Name: quiz_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_attempts_id_seq OWNED BY public.quiz_attempts.id;


--
-- TOC entry 270 (class 1259 OID 19020)
-- Name: quiz_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_options (
    id integer NOT NULL,
    question_id integer NOT NULL,
    content text NOT NULL,
    order_index integer DEFAULT 0 NOT NULL,
    is_correct boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.quiz_options OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 19019)
-- Name: quiz_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_options_id_seq OWNER TO postgres;

--
-- TOC entry 5800 (class 0 OID 0)
-- Dependencies: 269
-- Name: quiz_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_options_id_seq OWNED BY public.quiz_options.id;


--
-- TOC entry 268 (class 1259 OID 19004)
-- Name: quiz_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_questions (
    id integer NOT NULL,
    quiz_id integer NOT NULL,
    content text NOT NULL,
    order_index integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.quiz_questions OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 19003)
-- Name: quiz_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_questions_id_seq OWNER TO postgres;

--
-- TOC entry 5801 (class 0 OID 0)
-- Dependencies: 267
-- Name: quiz_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_questions_id_seq OWNED BY public.quiz_questions.id;


--
-- TOC entry 266 (class 1259 OID 18990)
-- Name: quizzes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizzes (
    id integer NOT NULL,
    lesson_id integer NOT NULL,
    title character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.quizzes OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 18989)
-- Name: quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quizzes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quizzes_id_seq OWNER TO postgres;

--
-- TOC entry 5802 (class 0 OID 0)
-- Dependencies: 265
-- Name: quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quizzes_id_seq OWNED BY public.quizzes.id;


--
-- TOC entry 223 (class 1259 OID 18655)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18654)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5803 (class 0 OID 0)
-- Dependencies: 222
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 304 (class 1259 OID 19827)
-- Name: user_daily_activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_daily_activities (
    id integer NOT NULL,
    user_id integer NOT NULL,
    activity_date date NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    streak integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.user_daily_activities OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 19826)
-- Name: user_daily_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_daily_activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_daily_activities_id_seq OWNER TO postgres;

--
-- TOC entry 5804 (class 0 OID 0)
-- Dependencies: 303
-- Name: user_daily_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_daily_activities_id_seq OWNED BY public.user_daily_activities.id;


--
-- TOC entry 302 (class 1259 OID 19801)
-- Name: user_oauth_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_oauth_accounts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    provider character varying(50) NOT NULL,
    provider_user_id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.user_oauth_accounts OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 19800)
-- Name: user_oauth_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_oauth_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_oauth_accounts_id_seq OWNER TO postgres;

--
-- TOC entry 5805 (class 0 OID 0)
-- Dependencies: 301
-- Name: user_oauth_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_oauth_accounts_id_seq OWNED BY public.user_oauth_accounts.id;


--
-- TOC entry 224 (class 1259 OID 18665)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18634)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password_hash character varying(255),
    displayname character varying(255) NOT NULL,
    avatarurl character varying(255),
    email character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(255) DEFAULT 'ACTIVE'::public.status_active_locked,
    score integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18633)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5806 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 234 (class 1259 OID 18737)
-- Name: wallet_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_transactions (
    id integer NOT NULL,
    wallet_id integer NOT NULL,
    amount numeric(15,2) NOT NULL,
    type public.transaction_type NOT NULL,
    status public.status_transaction DEFAULT 'PENDING'::public.status_transaction,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    order_id integer,
    reference_id character varying(255),
    CONSTRAINT wallet_transactions_amount_check CHECK ((amount >= (0)::numeric))
);


ALTER TABLE public.wallet_transactions OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18736)
-- Name: wallet_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wallet_transactions_id_seq OWNER TO postgres;

--
-- TOC entry 5807 (class 0 OID 0)
-- Dependencies: 233
-- Name: wallet_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_transactions_id_seq OWNED BY public.wallet_transactions.id;


--
-- TOC entry 232 (class 1259 OID 18720)
-- Name: wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallets (
    id integer NOT NULL,
    user_id integer NOT NULL,
    balance numeric(15,2) DEFAULT 0 NOT NULL,
    status character varying(255) DEFAULT 'ACTIVE'::public.status_active_locked,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT wallets_balance_check CHECK ((balance >= (0)::numeric))
);


ALTER TABLE public.wallets OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18719)
-- Name: wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wallets_id_seq OWNER TO postgres;

--
-- TOC entry 5808 (class 0 OID 0)
-- Dependencies: 231
-- Name: wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallets_id_seq OWNED BY public.wallets.id;


--
-- TOC entry 5181 (class 2604 OID 18836)
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- TOC entry 5178 (class 2604 OID 18823)
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- TOC entry 5192 (class 2604 OID 18879)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 5202 (class 2604 OID 18934)
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- TOC entry 5260 (class 2604 OID 19198)
-- Name: contest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest ALTER COLUMN id SET DEFAULT nextval('public.contest_id_seq'::regclass);


--
-- TOC entry 5266 (class 2604 OID 19217)
-- Name: contest_participants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants ALTER COLUMN id SET DEFAULT nextval('public.contest_participants_id_seq'::regclass);


--
-- TOC entry 5272 (class 2604 OID 19246)
-- Name: contest_problem_attempts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts ALTER COLUMN id SET DEFAULT nextval('public.contest_problem_attempts_id_seq'::regclass);


--
-- TOC entry 5251 (class 2604 OID 19140)
-- Name: contest_problems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems ALTER COLUMN id SET DEFAULT nextval('public.contest_problems_id_seq'::regclass);


--
-- TOC entry 5268 (class 2604 OID 19228)
-- Name: contest_rankings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings ALTER COLUMN id SET DEFAULT nextval('public.contest_rankings_id_seq'::regclass);


--
-- TOC entry 5195 (class 2604 OID 18894)
-- Name: course_category_mappings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings ALTER COLUMN id SET DEFAULT nextval('public.course_category_mappings_id_seq'::regclass);


--
-- TOC entry 5196 (class 2604 OID 18904)
-- Name: course_reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews ALTER COLUMN id SET DEFAULT nextval('public.course_reviews_id_seq'::regclass);


--
-- TOC entry 5183 (class 2604 OID 19678)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 5199 (class 2604 OID 18920)
-- Name: enrollments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments ALTER COLUMN id SET DEFAULT nextval('public.enrollments_id_seq'::regclass);


--
-- TOC entry 5149 (class 2604 OID 18689)
-- Name: instructor_applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_applications ALTER COLUMN id SET DEFAULT nextval('public.instructor_applications_id_seq'::regclass);


--
-- TOC entry 5153 (class 2604 OID 18705)
-- Name: instructors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors ALTER COLUMN id SET DEFAULT nextval('public.instructors_id_seq'::regclass);


--
-- TOC entry 5147 (class 2604 OID 18676)
-- Name: invalidated_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invalidated_tokens ALTER COLUMN id SET DEFAULT nextval('public.invalidated_tokens_id_seq'::regclass);


--
-- TOC entry 5211 (class 2604 OID 18966)
-- Name: lesson_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments ALTER COLUMN id SET DEFAULT nextval('public.lesson_comments_id_seq'::regclass);


--
-- TOC entry 5249 (class 2604 OID 19128)
-- Name: lesson_problems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems ALTER COLUMN id SET DEFAULT nextval('public.lesson_problems_id_seq'::regclass);


--
-- TOC entry 5214 (class 2604 OID 18981)
-- Name: lesson_progress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress ALTER COLUMN id SET DEFAULT nextval('public.lesson_progress_id_seq'::regclass);


--
-- TOC entry 5206 (class 2604 OID 18948)
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- TOC entry 5176 (class 2604 OID 18811)
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- TOC entry 5171 (class 2604 OID 18797)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 5168 (class 2604 OID 18779)
-- Name: payment_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions ALTER COLUMN id SET DEFAULT nextval('public.payment_transactions_id_seq'::regclass);


--
-- TOC entry 5164 (class 2604 OID 18755)
-- Name: payout_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests ALTER COLUMN id SET DEFAULT nextval('public.payout_requests_id_seq'::regclass);


--
-- TOC entry 5256 (class 2604 OID 19168)
-- Name: problem_submission_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details ALTER COLUMN id SET DEFAULT nextval('public.problem_submission_details_id_seq'::regclass);


--
-- TOC entry 5252 (class 2604 OID 19151)
-- Name: problem_submissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions ALTER COLUMN id SET DEFAULT nextval('public.problem_submissions_id_seq'::regclass);


--
-- TOC entry 5248 (class 2604 OID 19115)
-- Name: problem_tag_mappings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings ALTER COLUMN id SET DEFAULT nextval('public.problem_tag_mappings_id_seq'::regclass);


--
-- TOC entry 5245 (class 2604 OID 19097)
-- Name: problem_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tags ALTER COLUMN id SET DEFAULT nextval('public.problem_tags_id_seq'::regclass);


--
-- TOC entry 5259 (class 2604 OID 19182)
-- Name: problem_testcases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_testcases ALTER COLUMN id SET DEFAULT nextval('public.problem_testcases_id_seq'::regclass);


--
-- TOC entry 5232 (class 2604 OID 19066)
-- Name: problems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems ALTER COLUMN id SET DEFAULT nextval('public.problems_id_seq'::regclass);


--
-- TOC entry 5231 (class 2604 OID 19056)
-- Name: quiz_attempt_answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers ALTER COLUMN id SET DEFAULT nextval('public.quiz_attempt_answers_id_seq'::regclass);


--
-- TOC entry 5228 (class 2604 OID 19041)
-- Name: quiz_attempts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts ALTER COLUMN id SET DEFAULT nextval('public.quiz_attempts_id_seq'::regclass);


--
-- TOC entry 5223 (class 2604 OID 19023)
-- Name: quiz_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_options ALTER COLUMN id SET DEFAULT nextval('public.quiz_options_id_seq'::regclass);


--
-- TOC entry 5219 (class 2604 OID 19007)
-- Name: quiz_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions ALTER COLUMN id SET DEFAULT nextval('public.quiz_questions_id_seq'::regclass);


--
-- TOC entry 5216 (class 2604 OID 18993)
-- Name: quizzes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes ALTER COLUMN id SET DEFAULT nextval('public.quizzes_id_seq'::regclass);


--
-- TOC entry 5146 (class 2604 OID 18658)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 5279 (class 2604 OID 19830)
-- Name: user_daily_activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activities ALTER COLUMN id SET DEFAULT nextval('public.user_daily_activities_id_seq'::regclass);


--
-- TOC entry 5277 (class 2604 OID 19804)
-- Name: user_oauth_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts ALTER COLUMN id SET DEFAULT nextval('public.user_oauth_accounts_id_seq'::regclass);


--
-- TOC entry 5142 (class 2604 OID 18637)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5161 (class 2604 OID 18740)
-- Name: wallet_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_transactions ALTER COLUMN id SET DEFAULT nextval('public.wallet_transactions_id_seq'::regclass);


--
-- TOC entry 5157 (class 2604 OID 18723)
-- Name: wallets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets ALTER COLUMN id SET DEFAULT nextval('public.wallets_id_seq'::regclass);


--
-- TOC entry 5347 (class 2606 OID 18842)
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5343 (class 2606 OID 18829)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 5345 (class 2606 OID 18831)
-- Name: carts carts_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_key UNIQUE (user_id);


--
-- TOC entry 5358 (class 2606 OID 18889)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 5360 (class 2606 OID 18887)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 5371 (class 2606 OID 18943)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- TOC entry 5444 (class 2606 OID 19667)
-- Name: completed_lessons_count completed_lessons_count_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT completed_lessons_count_pkey PRIMARY KEY (id);


--
-- TOC entry 5434 (class 2606 OID 19223)
-- Name: contest_participants contest_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT contest_participants_pkey PRIMARY KEY (id);


--
-- TOC entry 5431 (class 2606 OID 19212)
-- Name: contest contest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT contest_pkey PRIMARY KEY (id);


--
-- TOC entry 5440 (class 2606 OID 19262)
-- Name: contest_problem_attempts contest_problem_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT contest_problem_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 5414 (class 2606 OID 19146)
-- Name: contest_problems contest_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT contest_problems_pkey PRIMARY KEY (id);


--
-- TOC entry 5437 (class 2606 OID 19241)
-- Name: contest_rankings contest_rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT contest_rankings_pkey PRIMARY KEY (id);


--
-- TOC entry 5362 (class 2606 OID 18899)
-- Name: course_category_mappings course_category_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT course_category_mappings_pkey PRIMARY KEY (id);


--
-- TOC entry 5364 (class 2606 OID 18915)
-- Name: course_reviews course_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT course_reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 5349 (class 2606 OID 19680)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 5351 (class 2606 OID 18874)
-- Name: courses courses_thumbnail_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_thumbnail_url_key UNIQUE (thumbnail_url);


--
-- TOC entry 5353 (class 2606 OID 18872)
-- Name: courses courses_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_title_key UNIQUE (title);


--
-- TOC entry 5366 (class 2606 OID 18927)
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 5311 (class 2606 OID 18700)
-- Name: instructor_applications instructor_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_applications
    ADD CONSTRAINT instructor_applications_pkey PRIMARY KEY (id);


--
-- TOC entry 5313 (class 2606 OID 18716)
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);


--
-- TOC entry 5315 (class 2606 OID 18718)
-- Name: instructors instructors_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_user_id_key UNIQUE (user_id);


--
-- TOC entry 5306 (class 2606 OID 18682)
-- Name: invalidated_tokens invalidated_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invalidated_tokens
    ADD CONSTRAINT invalidated_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 5308 (class 2606 OID 18684)
-- Name: invalidated_tokens invalidated_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invalidated_tokens
    ADD CONSTRAINT invalidated_tokens_token_key UNIQUE (token);


--
-- TOC entry 5377 (class 2606 OID 18976)
-- Name: lesson_comments lesson_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT lesson_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 5412 (class 2606 OID 19135)
-- Name: lesson_problems lesson_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT lesson_problems_pkey PRIMARY KEY (id);


--
-- TOC entry 5381 (class 2606 OID 18988)
-- Name: lesson_progress lesson_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT lesson_progress_pkey PRIMARY KEY (id);


--
-- TOC entry 5375 (class 2606 OID 18961)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 5341 (class 2606 OID 18818)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5337 (class 2606 OID 18806)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 5332 (class 2606 OID 18790)
-- Name: payment_transactions payment_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 5334 (class 2606 OID 18792)
-- Name: payment_transactions payment_transactions_transaction_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_transaction_code_key UNIQUE (transaction_code);


--
-- TOC entry 5325 (class 2606 OID 18770)
-- Name: payout_requests payout_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT payout_requests_pkey PRIMARY KEY (id);


--
-- TOC entry 5327 (class 2606 OID 18772)
-- Name: payout_requests payout_requests_transaction_reference_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT payout_requests_transaction_reference_key UNIQUE (transaction_reference);


--
-- TOC entry 5461 (class 2606 OID 19864)
-- Name: problem_comments problem_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT problem_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 5424 (class 2606 OID 19177)
-- Name: problem_submission_details problem_submission_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT problem_submission_details_pkey PRIMARY KEY (id);


--
-- TOC entry 5421 (class 2606 OID 19163)
-- Name: problem_submissions problem_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT problem_submissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5408 (class 2606 OID 19120)
-- Name: problem_tag_mappings problem_tag_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT problem_tag_mappings_pkey PRIMARY KEY (id);


--
-- TOC entry 5403 (class 2606 OID 19108)
-- Name: problem_tags problem_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 5405 (class 2606 OID 19110)
-- Name: problem_tags problem_tags_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_slug_key UNIQUE (slug);


--
-- TOC entry 5427 (class 2606 OID 19191)
-- Name: problem_testcases problem_testcases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_testcases
    ADD CONSTRAINT problem_testcases_pkey PRIMARY KEY (id);


--
-- TOC entry 5429 (class 2606 OID 19193)
-- Name: problem_testcases problem_testcases_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_testcases
    ADD CONSTRAINT problem_testcases_token_key UNIQUE (token);


--
-- TOC entry 5401 (class 2606 OID 19092)
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- TOC entry 5397 (class 2606 OID 19061)
-- Name: quiz_attempt_answers quiz_attempt_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT quiz_attempt_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 5395 (class 2606 OID 19051)
-- Name: quiz_attempts quiz_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT quiz_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 5391 (class 2606 OID 19036)
-- Name: quiz_options quiz_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_options
    ADD CONSTRAINT quiz_options_pkey PRIMARY KEY (id);


--
-- TOC entry 5388 (class 2606 OID 19018)
-- Name: quiz_questions quiz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT quiz_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 5383 (class 2606 OID 19002)
-- Name: quizzes quizzes_lesson_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_lesson_id_key UNIQUE (lesson_id);


--
-- TOC entry 5385 (class 2606 OID 19000)
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- TOC entry 5300 (class 2606 OID 19635)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 5302 (class 2606 OID 18662)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 5448 (class 2606 OID 19821)
-- Name: user_oauth_accounts ukhvnjys5r8dgs5p107mae6cdip; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT ukhvnjys5r8dgs5p107mae6cdip UNIQUE (provider, provider_user_id);


--
-- TOC entry 5455 (class 2606 OID 19955)
-- Name: user_daily_activities ukqex64xyldm7nghim6s2t54ett; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT ukqex64xyldm7nghim6s2t54ett UNIQUE (user_id, activity_date);


--
-- TOC entry 5450 (class 2606 OID 19814)
-- Name: user_oauth_accounts unique_provider_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT unique_provider_user UNIQUE (provider, provider_user_id);


--
-- TOC entry 5446 (class 2606 OID 19788)
-- Name: completed_lessons_count uq_completed_lessons_count_user_course; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT uq_completed_lessons_count_user_course UNIQUE (user_id, course_id);


--
-- TOC entry 5410 (class 2606 OID 19122)
-- Name: problem_tag_mappings uq_problem_tag_mappings; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT uq_problem_tag_mappings UNIQUE (problem_id, tag_id);


--
-- TOC entry 5369 (class 2606 OID 19752)
-- Name: enrollments uq_user_course_enrollment; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT uq_user_course_enrollment UNIQUE (user_id, course_id);


--
-- TOC entry 5329 (class 2606 OID 18774)
-- Name: payout_requests uq_wallet_payout_period; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT uq_wallet_payout_period UNIQUE (wallet_id, payout_period);


--
-- TOC entry 5457 (class 2606 OID 19836)
-- Name: user_daily_activities user_daily_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT user_daily_activities_pkey PRIMARY KEY (id);


--
-- TOC entry 5459 (class 2606 OID 19838)
-- Name: user_daily_activities user_daily_activities_unique_user_date; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT user_daily_activities_unique_user_date UNIQUE (user_id, activity_date);


--
-- TOC entry 5452 (class 2606 OID 19812)
-- Name: user_oauth_accounts user_oauth_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT user_oauth_accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 5304 (class 2606 OID 18671)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 5294 (class 2606 OID 18653)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 5296 (class 2606 OID 18649)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 5298 (class 2606 OID 18651)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 5323 (class 2606 OID 18750)
-- Name: wallet_transactions wallet_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT wallet_transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 5317 (class 2606 OID 18733)
-- Name: wallets wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- TOC entry 5319 (class 2606 OID 18735)
-- Name: wallets wallets_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_user_id_key UNIQUE (user_id);


--
-- TOC entry 5372 (class 1259 OID 19929)
-- Name: idx_chapters_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chapters_course_id ON public.chapters USING btree (course_id);


--
-- TOC entry 5432 (class 1259 OID 19631)
-- Name: idx_contest_fts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_fts ON public.contest USING gin (fts_document);


--
-- TOC entry 5435 (class 1259 OID 19583)
-- Name: idx_contest_participants_contest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_participants_contest_id ON public.contest_participants USING btree (contest_id);


--
-- TOC entry 5441 (class 1259 OID 19585)
-- Name: idx_contest_problem_attempts_contest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_problem_attempts_contest_id ON public.contest_problem_attempts USING btree (contest_id);


--
-- TOC entry 5442 (class 1259 OID 19586)
-- Name: idx_contest_problem_attempts_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_problem_attempts_user_id ON public.contest_problem_attempts USING btree (user_id);


--
-- TOC entry 5438 (class 1259 OID 19632)
-- Name: idx_contest_rankings_leaderboard; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_rankings_leaderboard ON public.contest_rankings USING btree (contest_id, problems_solved DESC, total_penalty);


--
-- TOC entry 5354 (class 1259 OID 19614)
-- Name: idx_courses_fts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_courses_fts ON public.courses USING gin (fts_document);


--
-- TOC entry 5355 (class 1259 OID 19565)
-- Name: idx_courses_instructor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_courses_instructor_id ON public.courses USING btree (instructor_id);


--
-- TOC entry 5356 (class 1259 OID 19729)
-- Name: idx_courses_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_courses_status ON public.courses USING btree (status);


--
-- TOC entry 5367 (class 1259 OID 19753)
-- Name: idx_enrollments_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_enrollments_course_id ON public.enrollments USING btree (course_id);


--
-- TOC entry 5309 (class 1259 OID 19558)
-- Name: idx_instructor_applications_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_instructor_applications_status ON public.instructor_applications USING btree (status);


--
-- TOC entry 5378 (class 1259 OID 19774)
-- Name: idx_lesson_progress_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lesson_progress_course_id ON public.lesson_progress USING btree (course_id);


--
-- TOC entry 5379 (class 1259 OID 19570)
-- Name: idx_lesson_progress_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lesson_progress_user_id ON public.lesson_progress USING btree (user_id);


--
-- TOC entry 5373 (class 1259 OID 19569)
-- Name: idx_lessons_chapter_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lessons_chapter_id ON public.lessons USING btree (chapter_id);


--
-- TOC entry 5338 (class 1259 OID 19563)
-- Name: idx_order_items_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_course_id ON public.order_items USING btree (course_id);


--
-- TOC entry 5339 (class 1259 OID 19562)
-- Name: idx_order_items_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_order_id ON public.order_items USING btree (order_id);


--
-- TOC entry 5335 (class 1259 OID 19564)
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- TOC entry 5330 (class 1259 OID 19561)
-- Name: idx_payment_transactions_wallet_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payment_transactions_wallet_id ON public.payment_transactions USING btree (wallet_id);


--
-- TOC entry 5422 (class 1259 OID 19582)
-- Name: idx_problem_submission_details_submission_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submission_details_submission_id ON public.problem_submission_details USING btree (submission_id);


--
-- TOC entry 5415 (class 1259 OID 19580)
-- Name: idx_problem_submissions_contest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submissions_contest_id ON public.problem_submissions USING btree (contest_id);


--
-- TOC entry 5416 (class 1259 OID 19578)
-- Name: idx_problem_submissions_problem_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submissions_problem_id ON public.problem_submissions USING btree (problem_id);


--
-- TOC entry 5417 (class 1259 OID 19633)
-- Name: idx_problem_submissions_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submissions_time ON public.problem_submissions USING brin (submitted_at);


--
-- TOC entry 5418 (class 1259 OID 19579)
-- Name: idx_problem_submissions_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submissions_user_id ON public.problem_submissions USING btree (user_id);


--
-- TOC entry 5419 (class 1259 OID 19874)
-- Name: idx_problem_submissions_verdict; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submissions_verdict ON public.problem_submissions USING btree (verdict);


--
-- TOC entry 5406 (class 1259 OID 19123)
-- Name: idx_problem_tag_mappings_tag_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_tag_mappings_tag_id ON public.problem_tag_mappings USING btree (tag_id);


--
-- TOC entry 5425 (class 1259 OID 19577)
-- Name: idx_problem_testcases_problem_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_testcases_problem_id ON public.problem_testcases USING btree (problem_id);


--
-- TOC entry 5398 (class 1259 OID 19576)
-- Name: idx_problems_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problems_created_by ON public.problems USING btree (created_by);


--
-- TOC entry 5399 (class 1259 OID 19623)
-- Name: idx_problems_fts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problems_fts ON public.problems USING gin (fts_document);


--
-- TOC entry 5392 (class 1259 OID 19575)
-- Name: idx_quiz_attempts_quiz_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_attempts_quiz_id ON public.quiz_attempts USING btree (quiz_id);


--
-- TOC entry 5393 (class 1259 OID 19574)
-- Name: idx_quiz_attempts_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_attempts_user_id ON public.quiz_attempts USING btree (user_id);


--
-- TOC entry 5389 (class 1259 OID 19573)
-- Name: idx_quiz_options_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_options_question_id ON public.quiz_options USING btree (question_id);


--
-- TOC entry 5386 (class 1259 OID 19572)
-- Name: idx_quiz_questions_quiz_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_questions_quiz_id ON public.quiz_questions USING btree (quiz_id);


--
-- TOC entry 5453 (class 1259 OID 19844)
-- Name: idx_user_activities_user_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_activities_user_date ON public.user_daily_activities USING btree (user_id, activity_date);


--
-- TOC entry 5320 (class 1259 OID 19560)
-- Name: idx_wallet_transactions_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wallet_transactions_order_id ON public.wallet_transactions USING btree (order_id);


--
-- TOC entry 5321 (class 1259 OID 19559)
-- Name: idx_wallet_transactions_wallet_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wallet_transactions_wallet_id ON public.wallet_transactions USING btree (wallet_id);


--
-- TOC entry 5525 (class 2606 OID 19914)
-- Name: problem_comments fk2ejlxsd61ciq2emegbkfli3cw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT fk2ejlxsd61ciq2emegbkfli3cw FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5518 (class 2606 OID 19543)
-- Name: contest_problem_attempts fk_attempts_contest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fk_attempts_contest FOREIGN KEY (contest_id) REFERENCES public.contest(id) ON DELETE CASCADE;


--
-- TOC entry 5519 (class 2606 OID 19553)
-- Name: contest_problem_attempts fk_attempts_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fk_attempts_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5520 (class 2606 OID 19548)
-- Name: contest_problem_attempts fk_attempts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fk_attempts_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5474 (class 2606 OID 19323)
-- Name: cart_items fk_cart_items_carts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_cart_items_carts FOREIGN KEY (cart_id) REFERENCES public.carts(id) ON DELETE CASCADE;


--
-- TOC entry 5475 (class 2606 OID 19920)
-- Name: cart_items fk_cart_items_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_cart_items_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5473 (class 2606 OID 19318)
-- Name: carts fk_carts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_carts_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5477 (class 2606 OID 19343)
-- Name: course_category_mappings fk_cc_mappings_categories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT fk_cc_mappings_categories FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 5478 (class 2606 OID 19712)
-- Name: course_category_mappings fk_cc_mappings_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT fk_cc_mappings_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5483 (class 2606 OID 19931)
-- Name: chapters fk_chapters_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT fk_chapters_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5485 (class 2606 OID 19378)
-- Name: lesson_comments fk_comments_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fk_comments_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE CASCADE;


--
-- TOC entry 5486 (class 2606 OID 19388)
-- Name: lesson_comments fk_comments_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fk_comments_parent FOREIGN KEY (parent_comment_id) REFERENCES public.lesson_comments(id) ON DELETE CASCADE;


--
-- TOC entry 5487 (class 2606 OID 19383)
-- Name: lesson_comments fk_comments_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fk_comments_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5504 (class 2606 OID 19468)
-- Name: contest_problems fk_contest_problems_contest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT fk_contest_problems_contest FOREIGN KEY (contest_id) REFERENCES public.contest(id) ON DELETE CASCADE;


--
-- TOC entry 5505 (class 2606 OID 19473)
-- Name: contest_problems fk_contest_problems_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT fk_contest_problems_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5513 (class 2606 OID 19518)
-- Name: contest fk_contest_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT fk_contest_users FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5479 (class 2606 OID 19942)
-- Name: course_reviews fk_course_reviews_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT fk_course_reviews_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5480 (class 2606 OID 19353)
-- Name: course_reviews fk_course_reviews_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT fk_course_reviews_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5476 (class 2606 OID 19333)
-- Name: courses fk_courses_instructors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_instructors FOREIGN KEY (instructor_id) REFERENCES public.instructors(id) ON DELETE CASCADE;


--
-- TOC entry 5481 (class 2606 OID 19755)
-- Name: enrollments fk_enrollments_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_enrollments_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5482 (class 2606 OID 19358)
-- Name: enrollments fk_enrollments_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_enrollments_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5464 (class 2606 OID 19273)
-- Name: instructor_applications fk_instructor_app_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_applications
    ADD CONSTRAINT fk_instructor_app_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5465 (class 2606 OID 19278)
-- Name: instructors fk_instructors_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT fk_instructors_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5502 (class 2606 OID 19458)
-- Name: lesson_problems fk_lesson_problems_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT fk_lesson_problems_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE CASCADE;


--
-- TOC entry 5503 (class 2606 OID 19463)
-- Name: lesson_problems fk_lesson_problems_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT fk_lesson_problems_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5484 (class 2606 OID 19373)
-- Name: lessons fk_lessons_chapters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_chapters FOREIGN KEY (chapter_id) REFERENCES public.chapters(id) ON DELETE CASCADE;


--
-- TOC entry 5471 (class 2606 OID 19682)
-- Name: order_items fk_order_items_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5472 (class 2606 OID 19308)
-- Name: order_items fk_order_items_orders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_orders FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 5470 (class 2606 OID 19303)
-- Name: orders fk_orders_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5514 (class 2606 OID 19523)
-- Name: contest_participants fk_participants_contest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT fk_participants_contest FOREIGN KEY (contest_id) REFERENCES public.contest(id) ON DELETE CASCADE;


--
-- TOC entry 5515 (class 2606 OID 19528)
-- Name: contest_participants fk_participants_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT fk_participants_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5469 (class 2606 OID 19298)
-- Name: payment_transactions fk_payment_tx_wallets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT fk_payment_tx_wallets FOREIGN KEY (wallet_id) REFERENCES public.wallets(id) ON DELETE CASCADE;


--
-- TOC entry 5468 (class 2606 OID 19293)
-- Name: payout_requests fk_payout_wallets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT fk_payout_wallets FOREIGN KEY (wallet_id) REFERENCES public.wallets(id) ON DELETE CASCADE;


--
-- TOC entry 5499 (class 2606 OID 19956)
-- Name: problems fk_problems_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT fk_problems_users FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5488 (class 2606 OID 19776)
-- Name: lesson_progress fk_progress_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT fk_progress_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5489 (class 2606 OID 19398)
-- Name: lesson_progress fk_progress_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT fk_progress_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE CASCADE;


--
-- TOC entry 5490 (class 2606 OID 19393)
-- Name: lesson_progress fk_progress_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT fk_progress_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5500 (class 2606 OID 19478)
-- Name: problem_tag_mappings fk_pt_mappings_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT fk_pt_mappings_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5501 (class 2606 OID 19483)
-- Name: problem_tag_mappings fk_pt_mappings_tags; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT fk_pt_mappings_tags FOREIGN KEY (tag_id) REFERENCES public.problem_tags(id) ON DELETE CASCADE;


--
-- TOC entry 5496 (class 2606 OID 19433)
-- Name: quiz_attempt_answers fk_qaa_attempts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fk_qaa_attempts FOREIGN KEY (quiz_attempt_id) REFERENCES public.quiz_attempts(id) ON DELETE CASCADE;


--
-- TOC entry 5497 (class 2606 OID 19443)
-- Name: quiz_attempt_answers fk_qaa_options; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fk_qaa_options FOREIGN KEY (selected_option_id) REFERENCES public.quiz_options(id) ON DELETE SET NULL;


--
-- TOC entry 5498 (class 2606 OID 19438)
-- Name: quiz_attempt_answers fk_qaa_questions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fk_qaa_questions FOREIGN KEY (quiz_question_id) REFERENCES public.quiz_questions(id) ON DELETE CASCADE;


--
-- TOC entry 5494 (class 2606 OID 19428)
-- Name: quiz_attempts fk_quiz_attempts_quizzes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT fk_quiz_attempts_quizzes FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id) ON DELETE CASCADE;


--
-- TOC entry 5495 (class 2606 OID 19423)
-- Name: quiz_attempts fk_quiz_attempts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT fk_quiz_attempts_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5493 (class 2606 OID 19418)
-- Name: quiz_options fk_quiz_options_questions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_options
    ADD CONSTRAINT fk_quiz_options_questions FOREIGN KEY (question_id) REFERENCES public.quiz_questions(id) ON DELETE CASCADE;


--
-- TOC entry 5492 (class 2606 OID 19413)
-- Name: quiz_questions fk_quiz_questions_quizzes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT fk_quiz_questions_quizzes FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id) ON DELETE CASCADE;


--
-- TOC entry 5491 (class 2606 OID 19408)
-- Name: quizzes fk_quizzes_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT fk_quizzes_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE CASCADE;


--
-- TOC entry 5516 (class 2606 OID 19533)
-- Name: contest_rankings fk_rankings_contest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT fk_rankings_contest FOREIGN KEY (contest_id) REFERENCES public.contest(id) ON DELETE CASCADE;


--
-- TOC entry 5517 (class 2606 OID 19538)
-- Name: contest_rankings fk_rankings_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT fk_rankings_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5510 (class 2606 OID 19508)
-- Name: problem_submission_details fk_sub_details_submissions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT fk_sub_details_submissions FOREIGN KEY (submission_id) REFERENCES public.problem_submissions(id) ON DELETE CASCADE;


--
-- TOC entry 5511 (class 2606 OID 19513)
-- Name: problem_submission_details fk_sub_details_testcases; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT fk_sub_details_testcases FOREIGN KEY (testcase_id) REFERENCES public.problem_testcases(id) ON DELETE CASCADE;


--
-- TOC entry 5506 (class 2606 OID 19503)
-- Name: problem_submissions fk_submissions_contest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk_submissions_contest FOREIGN KEY (contest_id) REFERENCES public.contest(id) ON DELETE SET NULL;


--
-- TOC entry 5507 (class 2606 OID 19498)
-- Name: problem_submissions fk_submissions_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk_submissions_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE SET NULL;


--
-- TOC entry 5508 (class 2606 OID 19488)
-- Name: problem_submissions fk_submissions_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk_submissions_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5509 (class 2606 OID 19493)
-- Name: problem_submissions fk_submissions_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk_submissions_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5512 (class 2606 OID 19453)
-- Name: problem_testcases fk_testcases_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_testcases
    ADD CONSTRAINT fk_testcases_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5523 (class 2606 OID 19815)
-- Name: user_oauth_accounts fk_user_oauth; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT fk_user_oauth FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5462 (class 2606 OID 19268)
-- Name: user_roles fk_user_roles_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user_roles_roles FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 5463 (class 2606 OID 19263)
-- Name: user_roles fk_user_roles_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user_roles_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5467 (class 2606 OID 19288)
-- Name: wallet_transactions fk_wallet_tx_wallets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT fk_wallet_tx_wallets FOREIGN KEY (wallet_id) REFERENCES public.wallets(id) ON DELETE CASCADE;


--
-- TOC entry 5466 (class 2606 OID 19283)
-- Name: wallets fk_wallets_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT fk_wallets_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5526 (class 2606 OID 19904)
-- Name: problem_comments fkbeaj9majn3i0nqrtt7f1975lk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT fkbeaj9majn3i0nqrtt7f1975lk FOREIGN KEY (parent_id) REFERENCES public.problem_comments(id);


--
-- TOC entry 5521 (class 2606 OID 19794)
-- Name: completed_lessons_count fkilxswyivftkeso9mf0d9cta1p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT fkilxswyivftkeso9mf0d9cta1p FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5527 (class 2606 OID 19909)
-- Name: problem_comments fkr2qo0k64sn9ovbgr75nw7vi2r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_comments
    ADD CONSTRAINT fkr2qo0k64sn9ovbgr75nw7vi2r FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- TOC entry 5522 (class 2606 OID 19789)
-- Name: completed_lessons_count fksfu0dm9pu61y2ihppu7bms7su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT fksfu0dm9pu61y2ihppu7bms7su FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 5524 (class 2606 OID 19839)
-- Name: user_daily_activities user_daily_activities_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_daily_activities
    ADD CONSTRAINT user_daily_activities_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2026-06-05 15:13:39

--
-- PostgreSQL database dump complete
--

\unrestrict xlDJh4Y6uqybzBLM2A4BbZry9fywDNSMTJHUMoHeVmweZo604DNOMo2iTHNAKzO

