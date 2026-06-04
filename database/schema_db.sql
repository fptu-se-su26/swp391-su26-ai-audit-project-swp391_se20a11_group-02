--
-- PostgreSQL database dump
--



-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-06-03 03:48:24

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

-- Database creation is handled by Docker (POSTGRES_DB environment variable)

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA IF NOT EXISTS public;

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5727 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 991 (class 1247 OID 18624)
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
-- TOC entry 967 (class 1247 OID 18548)
-- Name: course_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.course_status AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED'
    );


ALTER TYPE public.course_status OWNER TO postgres;

--
-- TOC entry 970 (class 1247 OID 18556)
-- Name: enrollment_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enrollment_status AS ENUM (
    'ACTIVE',
    'CANCELLED',
    'COMPLETED'
    );


ALTER TYPE public.enrollment_status OWNER TO postgres;

--
-- TOC entry 946 (class 1247 OID 18486)
-- Name: instructor_app_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.instructor_app_status AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED'
    );


ALTER TYPE public.instructor_app_status OWNER TO postgres;

--
-- TOC entry 949 (class 1247 OID 18494)
-- Name: instructor_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.instructor_status AS ENUM (
    'ACTIVE',
    'SUSPENDED'
    );


ALTER TYPE public.instructor_status OWNER TO postgres;

--
-- TOC entry 985 (class 1247 OID 18596)
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
-- TOC entry 964 (class 1247 OID 18540)
-- Name: order_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_status AS ENUM (
    'PENDING',
    'COMPLETED',
    'FAILED'
    );


ALTER TYPE public.order_status OWNER TO postgres;

--
-- TOC entry 961 (class 1247 OID 18534)
-- Name: payment_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_type AS ENUM (
    'DEPOSIT',
    'WITHDRAW'
    );


ALTER TYPE public.payment_type OWNER TO postgres;

--
-- TOC entry 955 (class 1247 OID 18516)
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
-- TOC entry 982 (class 1247 OID 18588)
-- Name: problem_difficulty; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.problem_difficulty AS ENUM (
    'EASY',
    'MEDIUM',
    'HARD'
    );


ALTER TYPE public.problem_difficulty OWNER TO postgres;

--
-- TOC entry 979 (class 1247 OID 18578)
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
-- TOC entry 973 (class 1247 OID 18564)
-- Name: progress_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.progress_status AS ENUM (
    'NOT_STARTED',
    'IN_PROGRESS',
    'COMPLETED'
    );


ALTER TYPE public.progress_status OWNER TO postgres;

--
-- TOC entry 976 (class 1247 OID 18572)
-- Name: quiz_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.quiz_status AS ENUM (
    'IN_PROGRESS',
    'COMPLETED'
    );


ALTER TYPE public.quiz_status OWNER TO postgres;

--
-- TOC entry 943 (class 1247 OID 18478)
-- Name: role_name; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.role_name AS ENUM (
    'USER',
    'INSTRUCTOR',
    'ADMIN'
    );


ALTER TYPE public.role_name OWNER TO postgres;

--
-- TOC entry 988 (class 1247 OID 18616)
-- Name: scoring_rule; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.scoring_rule AS ENUM (
    'ICPC',
    'IOI',
    'CUSTOM'
    );


ALTER TYPE public.scoring_rule OWNER TO postgres;

--
-- TOC entry 940 (class 1247 OID 18473)
-- Name: status_active_locked; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_active_locked AS ENUM (
    'ACTIVE',
    'LOCKED'
    );


ALTER TYPE public.status_active_locked OWNER TO postgres;

--
-- TOC entry 958 (class 1247 OID 18526)
-- Name: status_transaction; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_transaction AS ENUM (
    'SUCCESS',
    'FAILED',
    'PENDING'
    );


ALTER TYPE public.status_transaction OWNER TO postgres;

--
-- TOC entry 952 (class 1247 OID 18500)
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
-- TOC entry 307 (class 1255 OID 19602)
-- Name: f_unaccent(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.f_unaccent(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
AS $_$
SELECT public.unaccent('public.unaccent', $1);
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
                                   course_id integer NOT NULL,
                                   created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
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
-- TOC entry 5728 (class 0 OID 0)
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
-- TOC entry 5729 (class 0 OID 0)
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
-- TOC entry 5730 (class 0 OID 0)
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
                                 course_id integer NOT NULL,
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
-- TOC entry 5731 (class 0 OID 0)
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
                                scoring_rule public.scoring_rule DEFAULT 'ICPC'::public.scoring_rule,
                                password_hash character varying(255),
                                start_time timestamp with time zone NOT NULL,
                                end_time timestamp with time zone NOT NULL,
                                durations integer NOT NULL,
                                status public.contest_status DEFAULT 'UPCOMING'::public.contest_status,
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
-- TOC entry 5732 (class 0 OID 0)
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
-- TOC entry 5733 (class 0 OID 0)
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
-- TOC entry 5734 (class 0 OID 0)
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
-- TOC entry 5735 (class 0 OID 0)
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
-- TOC entry 5736 (class 0 OID 0)
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
-- TOC entry 5737 (class 0 OID 0)
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
                                       course_id integer NOT NULL,
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
-- TOC entry 5738 (class 0 OID 0)
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
-- TOC entry 5739 (class 0 OID 0)
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
-- TOC entry 5740 (class 0 OID 0)
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
-- TOC entry 5741 (class 0 OID 0)
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
-- TOC entry 5742 (class 0 OID 0)
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
-- TOC entry 5743 (class 0 OID 0)
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
-- TOC entry 5744 (class 0 OID 0)
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
-- TOC entry 5745 (class 0 OID 0)
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
-- TOC entry 5746 (class 0 OID 0)
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
-- TOC entry 5747 (class 0 OID 0)
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
-- TOC entry 5748 (class 0 OID 0)
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
-- TOC entry 5749 (class 0 OID 0)
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
-- TOC entry 5750 (class 0 OID 0)
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
-- TOC entry 5751 (class 0 OID 0)
-- Dependencies: 235
-- Name: payout_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payout_requests_id_seq OWNED BY public.payout_requests.id;


--
-- TOC entry 288 (class 1259 OID 19165)
-- Name: problem_submission_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_submission_details (
                                                   id integer NOT NULL,
                                                   submission_id integer NOT NULL,
                                                   testcase_id integer NOT NULL,
                                                   token character varying(255),
                                                   execution_time double precision,
                                                   memory_used integer,
                                                   verdict public.oj_verdict DEFAULT 'PENDING'::public.oj_verdict,
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
-- TOC entry 5752 (class 0 OID 0)
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
                                            execution_time double precision,
                                            memory_used integer,
                                            score numeric(10,2),
                                            submitted_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
                                            verdict public.oj_verdict DEFAULT 'PENDING'::public.oj_verdict,
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
-- TOC entry 5753 (class 0 OID 0)
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
-- TOC entry 5754 (class 0 OID 0)
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
-- TOC entry 5755 (class 0 OID 0)
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
-- TOC entry 5756 (class 0 OID 0)
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
                                 problem_scope public.problem_scope NOT NULL,
                                 difficulty public.problem_difficulty DEFAULT 'MEDIUM'::public.problem_difficulty,
                                 is_active boolean DEFAULT true NOT NULL,
                                 created_by integer NOT NULL,
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
-- TOC entry 5757 (class 0 OID 0)
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
-- TOC entry 5758 (class 0 OID 0)
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
-- TOC entry 5759 (class 0 OID 0)
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
-- TOC entry 5760 (class 0 OID 0)
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
-- TOC entry 5761 (class 0 OID 0)
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
-- TOC entry 5762 (class 0 OID 0)
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
-- TOC entry 5763 (class 0 OID 0)
-- Dependencies: 222
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


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
-- TOC entry 5764 (class 0 OID 0)
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

CREATE INDEX idx_users_score_id ON public.users USING btree (score DESC, id ASC);

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
-- TOC entry 5765 (class 0 OID 0)
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
-- TOC entry 5766 (class 0 OID 0)
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
-- TOC entry 5767 (class 0 OID 0)
-- Dependencies: 231
-- Name: wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallets_id_seq OWNED BY public.wallets.id;


--
-- TOC entry 5160 (class 2604 OID 18836)
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- TOC entry 5157 (class 2604 OID 18823)
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- TOC entry 5171 (class 2604 OID 18879)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 5181 (class 2604 OID 18934)
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- TOC entry 5239 (class 2604 OID 19198)
-- Name: contest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest ALTER COLUMN id SET DEFAULT nextval('public.contest_id_seq'::regclass);


--
-- TOC entry 5245 (class 2604 OID 19217)
-- Name: contest_participants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants ALTER COLUMN id SET DEFAULT nextval('public.contest_participants_id_seq'::regclass);


--
-- TOC entry 5251 (class 2604 OID 19246)
-- Name: contest_problem_attempts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts ALTER COLUMN id SET DEFAULT nextval('public.contest_problem_attempts_id_seq'::regclass);


--
-- TOC entry 5230 (class 2604 OID 19140)
-- Name: contest_problems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems ALTER COLUMN id SET DEFAULT nextval('public.contest_problems_id_seq'::regclass);


--
-- TOC entry 5247 (class 2604 OID 19228)
-- Name: contest_rankings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings ALTER COLUMN id SET DEFAULT nextval('public.contest_rankings_id_seq'::regclass);


--
-- TOC entry 5174 (class 2604 OID 18894)
-- Name: course_category_mappings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings ALTER COLUMN id SET DEFAULT nextval('public.course_category_mappings_id_seq'::regclass);


--
-- TOC entry 5175 (class 2604 OID 18904)
-- Name: course_reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews ALTER COLUMN id SET DEFAULT nextval('public.course_reviews_id_seq'::regclass);


--
-- TOC entry 5162 (class 2604 OID 19678)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 5178 (class 2604 OID 18920)
-- Name: enrollments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments ALTER COLUMN id SET DEFAULT nextval('public.enrollments_id_seq'::regclass);


--
-- TOC entry 5128 (class 2604 OID 18689)
-- Name: instructor_applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_applications ALTER COLUMN id SET DEFAULT nextval('public.instructor_applications_id_seq'::regclass);


--
-- TOC entry 5132 (class 2604 OID 18705)
-- Name: instructors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors ALTER COLUMN id SET DEFAULT nextval('public.instructors_id_seq'::regclass);


--
-- TOC entry 5126 (class 2604 OID 18676)
-- Name: invalidated_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invalidated_tokens ALTER COLUMN id SET DEFAULT nextval('public.invalidated_tokens_id_seq'::regclass);


--
-- TOC entry 5190 (class 2604 OID 18966)
-- Name: lesson_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments ALTER COLUMN id SET DEFAULT nextval('public.lesson_comments_id_seq'::regclass);


--
-- TOC entry 5228 (class 2604 OID 19128)
-- Name: lesson_problems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems ALTER COLUMN id SET DEFAULT nextval('public.lesson_problems_id_seq'::regclass);


--
-- TOC entry 5193 (class 2604 OID 18981)
-- Name: lesson_progress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress ALTER COLUMN id SET DEFAULT nextval('public.lesson_progress_id_seq'::regclass);


--
-- TOC entry 5185 (class 2604 OID 18948)
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- TOC entry 5155 (class 2604 OID 18811)
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- TOC entry 5150 (class 2604 OID 18797)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 5147 (class 2604 OID 18779)
-- Name: payment_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions ALTER COLUMN id SET DEFAULT nextval('public.payment_transactions_id_seq'::regclass);


--
-- TOC entry 5143 (class 2604 OID 18755)
-- Name: payout_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests ALTER COLUMN id SET DEFAULT nextval('public.payout_requests_id_seq'::regclass);


--
-- TOC entry 5235 (class 2604 OID 19168)
-- Name: problem_submission_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details ALTER COLUMN id SET DEFAULT nextval('public.problem_submission_details_id_seq'::regclass);


--
-- TOC entry 5231 (class 2604 OID 19151)
-- Name: problem_submissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions ALTER COLUMN id SET DEFAULT nextval('public.problem_submissions_id_seq'::regclass);


--
-- TOC entry 5227 (class 2604 OID 19115)
-- Name: problem_tag_mappings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings ALTER COLUMN id SET DEFAULT nextval('public.problem_tag_mappings_id_seq'::regclass);


--
-- TOC entry 5224 (class 2604 OID 19097)
-- Name: problem_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tags ALTER COLUMN id SET DEFAULT nextval('public.problem_tags_id_seq'::regclass);


--
-- TOC entry 5238 (class 2604 OID 19182)
-- Name: problem_testcases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_testcases ALTER COLUMN id SET DEFAULT nextval('public.problem_testcases_id_seq'::regclass);


--
-- TOC entry 5211 (class 2604 OID 19066)
-- Name: problems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems ALTER COLUMN id SET DEFAULT nextval('public.problems_id_seq'::regclass);


--
-- TOC entry 5210 (class 2604 OID 19056)
-- Name: quiz_attempt_answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers ALTER COLUMN id SET DEFAULT nextval('public.quiz_attempt_answers_id_seq'::regclass);


--
-- TOC entry 5207 (class 2604 OID 19041)
-- Name: quiz_attempts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts ALTER COLUMN id SET DEFAULT nextval('public.quiz_attempts_id_seq'::regclass);


--
-- TOC entry 5202 (class 2604 OID 19023)
-- Name: quiz_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_options ALTER COLUMN id SET DEFAULT nextval('public.quiz_options_id_seq'::regclass);


--
-- TOC entry 5198 (class 2604 OID 19007)
-- Name: quiz_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions ALTER COLUMN id SET DEFAULT nextval('public.quiz_questions_id_seq'::regclass);


--
-- TOC entry 5195 (class 2604 OID 18993)
-- Name: quizzes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes ALTER COLUMN id SET DEFAULT nextval('public.quizzes_id_seq'::regclass);


--
-- TOC entry 5125 (class 2604 OID 18658)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 5256 (class 2604 OID 19804)
-- Name: user_oauth_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts ALTER COLUMN id SET DEFAULT nextval('public.user_oauth_accounts_id_seq'::regclass);


--
-- TOC entry 5122 (class 2604 OID 18637)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5140 (class 2604 OID 18740)
-- Name: wallet_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_transactions ALTER COLUMN id SET DEFAULT nextval('public.wallet_transactions_id_seq'::regclass);


--
-- TOC entry 5136 (class 2604 OID 18723)
-- Name: wallets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets ALTER COLUMN id SET DEFAULT nextval('public.wallets_id_seq'::regclass);


--
-- TOC entry 5323 (class 2606 OID 18842)
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5319 (class 2606 OID 18829)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 5321 (class 2606 OID 18831)
-- Name: carts carts_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_key UNIQUE (user_id);


--
-- TOC entry 5334 (class 2606 OID 18889)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 5336 (class 2606 OID 18887)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 5347 (class 2606 OID 18943)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- TOC entry 5420 (class 2606 OID 19667)
-- Name: completed_lessons_count completed_lessons_count_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT completed_lessons_count_pkey PRIMARY KEY (id);


--
-- TOC entry 5410 (class 2606 OID 19223)
-- Name: contest_participants contest_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT contest_participants_pkey PRIMARY KEY (id);


--
-- TOC entry 5407 (class 2606 OID 19212)
-- Name: contest contest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT contest_pkey PRIMARY KEY (id);


--
-- TOC entry 5416 (class 2606 OID 19262)
-- Name: contest_problem_attempts contest_problem_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT contest_problem_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 5390 (class 2606 OID 19146)
-- Name: contest_problems contest_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT contest_problems_pkey PRIMARY KEY (id);


--
-- TOC entry 5413 (class 2606 OID 19241)
-- Name: contest_rankings contest_rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT contest_rankings_pkey PRIMARY KEY (id);


--
-- TOC entry 5338 (class 2606 OID 18899)
-- Name: course_category_mappings course_category_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT course_category_mappings_pkey PRIMARY KEY (id);


--
-- TOC entry 5340 (class 2606 OID 18915)
-- Name: course_reviews course_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT course_reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 5325 (class 2606 OID 19680)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 5327 (class 2606 OID 18874)
-- Name: courses courses_thumbnail_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_thumbnail_url_key UNIQUE (thumbnail_url);


--
-- TOC entry 5329 (class 2606 OID 18872)
-- Name: courses courses_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_title_key UNIQUE (title);


--
-- TOC entry 5342 (class 2606 OID 18927)
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 5287 (class 2606 OID 18700)
-- Name: instructor_applications instructor_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_applications
    ADD CONSTRAINT instructor_applications_pkey PRIMARY KEY (id);


--
-- TOC entry 5289 (class 2606 OID 18716)
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);


--
-- TOC entry 5291 (class 2606 OID 18718)
-- Name: instructors instructors_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_user_id_key UNIQUE (user_id);


--
-- TOC entry 5282 (class 2606 OID 18682)
-- Name: invalidated_tokens invalidated_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invalidated_tokens
    ADD CONSTRAINT invalidated_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 5284 (class 2606 OID 18684)
-- Name: invalidated_tokens invalidated_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invalidated_tokens
    ADD CONSTRAINT invalidated_tokens_token_key UNIQUE (token);


--
-- TOC entry 5353 (class 2606 OID 18976)
-- Name: lesson_comments lesson_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT lesson_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 5388 (class 2606 OID 19135)
-- Name: lesson_problems lesson_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT lesson_problems_pkey PRIMARY KEY (id);


--
-- TOC entry 5357 (class 2606 OID 18988)
-- Name: lesson_progress lesson_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT lesson_progress_pkey PRIMARY KEY (id);


--
-- TOC entry 5351 (class 2606 OID 18961)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 5317 (class 2606 OID 18818)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5313 (class 2606 OID 18806)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 5308 (class 2606 OID 18790)
-- Name: payment_transactions payment_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 5310 (class 2606 OID 18792)
-- Name: payment_transactions payment_transactions_transaction_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_transaction_code_key UNIQUE (transaction_code);


--
-- TOC entry 5301 (class 2606 OID 18770)
-- Name: payout_requests payout_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT payout_requests_pkey PRIMARY KEY (id);


--
-- TOC entry 5303 (class 2606 OID 18772)
-- Name: payout_requests payout_requests_transaction_reference_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT payout_requests_transaction_reference_key UNIQUE (transaction_reference);


--
-- TOC entry 5400 (class 2606 OID 19177)
-- Name: problem_submission_details problem_submission_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT problem_submission_details_pkey PRIMARY KEY (id);


--
-- TOC entry 5397 (class 2606 OID 19163)
-- Name: problem_submissions problem_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT problem_submissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5384 (class 2606 OID 19120)
-- Name: problem_tag_mappings problem_tag_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT problem_tag_mappings_pkey PRIMARY KEY (id);


--
-- TOC entry 5379 (class 2606 OID 19108)
-- Name: problem_tags problem_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 5381 (class 2606 OID 19110)
-- Name: problem_tags problem_tags_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_slug_key UNIQUE (slug);


--
-- TOC entry 5403 (class 2606 OID 19191)
-- Name: problem_testcases problem_testcases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_testcases
    ADD CONSTRAINT problem_testcases_pkey PRIMARY KEY (id);


--
-- TOC entry 5405 (class 2606 OID 19193)
-- Name: problem_testcases problem_testcases_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_testcases
    ADD CONSTRAINT problem_testcases_token_key UNIQUE (token);


--
-- TOC entry 5377 (class 2606 OID 19092)
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- TOC entry 5373 (class 2606 OID 19061)
-- Name: quiz_attempt_answers quiz_attempt_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT quiz_attempt_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 5371 (class 2606 OID 19051)
-- Name: quiz_attempts quiz_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT quiz_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 5367 (class 2606 OID 19036)
-- Name: quiz_options quiz_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_options
    ADD CONSTRAINT quiz_options_pkey PRIMARY KEY (id);


--
-- TOC entry 5364 (class 2606 OID 19018)
-- Name: quiz_questions quiz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT quiz_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 5359 (class 2606 OID 19002)
-- Name: quizzes quizzes_lesson_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_lesson_id_key UNIQUE (lesson_id);


--
-- TOC entry 5361 (class 2606 OID 19000)
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- TOC entry 5276 (class 2606 OID 19635)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 5278 (class 2606 OID 18662)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 5424 (class 2606 OID 19821)
-- Name: user_oauth_accounts ukhvnjys5r8dgs5p107mae6cdip; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT ukhvnjys5r8dgs5p107mae6cdip UNIQUE (provider, provider_user_id);


--
-- TOC entry 5426 (class 2606 OID 19814)
-- Name: user_oauth_accounts unique_provider_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT unique_provider_user UNIQUE (provider, provider_user_id);


--
-- TOC entry 5422 (class 2606 OID 19788)
-- Name: completed_lessons_count uq_completed_lessons_count_user_course; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT uq_completed_lessons_count_user_course UNIQUE (user_id, course_id);


--
-- TOC entry 5386 (class 2606 OID 19122)
-- Name: problem_tag_mappings uq_problem_tag_mappings; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT uq_problem_tag_mappings UNIQUE (problem_id, tag_id);


--
-- TOC entry 5345 (class 2606 OID 19752)
-- Name: enrollments uq_user_course_enrollment; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT uq_user_course_enrollment UNIQUE (user_id, course_id);


--
-- TOC entry 5305 (class 2606 OID 18774)
-- Name: payout_requests uq_wallet_payout_period; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT uq_wallet_payout_period UNIQUE (wallet_id, payout_period);


--
-- TOC entry 5428 (class 2606 OID 19812)
-- Name: user_oauth_accounts user_oauth_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT user_oauth_accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 5280 (class 2606 OID 18671)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 5270 (class 2606 OID 18653)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 5272 (class 2606 OID 18649)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 5274 (class 2606 OID 18651)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 5299 (class 2606 OID 18750)
-- Name: wallet_transactions wallet_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT wallet_transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 5293 (class 2606 OID 18733)
-- Name: wallets wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- TOC entry 5295 (class 2606 OID 18735)
-- Name: wallets wallets_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_user_id_key UNIQUE (user_id);


--
-- TOC entry 5348 (class 1259 OID 19568)
-- Name: idx_chapters_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chapters_course_id ON public.chapters USING btree (course_id);


--
-- TOC entry 5408 (class 1259 OID 19631)
-- Name: idx_contest_fts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_fts ON public.contest USING gin (fts_document);


--
-- TOC entry 5411 (class 1259 OID 19583)
-- Name: idx_contest_participants_contest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_participants_contest_id ON public.contest_participants USING btree (contest_id);


--
-- TOC entry 5417 (class 1259 OID 19585)
-- Name: idx_contest_problem_attempts_contest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_problem_attempts_contest_id ON public.contest_problem_attempts USING btree (contest_id);


--
-- TOC entry 5418 (class 1259 OID 19586)
-- Name: idx_contest_problem_attempts_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_problem_attempts_user_id ON public.contest_problem_attempts USING btree (user_id);


--
-- TOC entry 5414 (class 1259 OID 19632)
-- Name: idx_contest_rankings_leaderboard; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_rankings_leaderboard ON public.contest_rankings USING btree (contest_id, problems_solved DESC, total_penalty);


--
-- TOC entry 5330 (class 1259 OID 19614)
-- Name: idx_courses_fts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_courses_fts ON public.courses USING gin (fts_document);


--
-- TOC entry 5331 (class 1259 OID 19565)
-- Name: idx_courses_instructor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_courses_instructor_id ON public.courses USING btree (instructor_id);


--
-- TOC entry 5332 (class 1259 OID 19729)
-- Name: idx_courses_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_courses_status ON public.courses USING btree (status);


--
-- TOC entry 5343 (class 1259 OID 19753)
-- Name: idx_enrollments_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_enrollments_course_id ON public.enrollments USING btree (course_id);


--
-- TOC entry 5285 (class 1259 OID 19558)
-- Name: idx_instructor_applications_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_instructor_applications_status ON public.instructor_applications USING btree (status);


--
-- TOC entry 5354 (class 1259 OID 19774)
-- Name: idx_lesson_progress_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lesson_progress_course_id ON public.lesson_progress USING btree (course_id);


--
-- TOC entry 5355 (class 1259 OID 19570)
-- Name: idx_lesson_progress_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lesson_progress_user_id ON public.lesson_progress USING btree (user_id);


--
-- TOC entry 5349 (class 1259 OID 19569)
-- Name: idx_lessons_chapter_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lessons_chapter_id ON public.lessons USING btree (chapter_id);


--
-- TOC entry 5314 (class 1259 OID 19563)
-- Name: idx_order_items_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_course_id ON public.order_items USING btree (course_id);


--
-- TOC entry 5315 (class 1259 OID 19562)
-- Name: idx_order_items_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_order_id ON public.order_items USING btree (order_id);


--
-- TOC entry 5311 (class 1259 OID 19564)
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- TOC entry 5306 (class 1259 OID 19561)
-- Name: idx_payment_transactions_wallet_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payment_transactions_wallet_id ON public.payment_transactions USING btree (wallet_id);


--
-- TOC entry 5398 (class 1259 OID 19582)
-- Name: idx_problem_submission_details_submission_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submission_details_submission_id ON public.problem_submission_details USING btree (submission_id);


--
-- TOC entry 5391 (class 1259 OID 19580)
-- Name: idx_problem_submissions_contest_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submissions_contest_id ON public.problem_submissions USING btree (contest_id);


--
-- TOC entry 5392 (class 1259 OID 19578)
-- Name: idx_problem_submissions_problem_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submissions_problem_id ON public.problem_submissions USING btree (problem_id);


--
-- TOC entry 5393 (class 1259 OID 19633)
-- Name: idx_problem_submissions_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submissions_time ON public.problem_submissions USING brin (submitted_at);


--
-- TOC entry 5394 (class 1259 OID 19579)
-- Name: idx_problem_submissions_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submissions_user_id ON public.problem_submissions USING btree (user_id);


--
-- TOC entry 5395 (class 1259 OID 19581)
-- Name: idx_problem_submissions_verdict; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_submissions_verdict ON public.problem_submissions USING btree (verdict);


--
-- TOC entry 5382 (class 1259 OID 19123)
-- Name: idx_problem_tag_mappings_tag_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_tag_mappings_tag_id ON public.problem_tag_mappings USING btree (tag_id);


--
-- TOC entry 5401 (class 1259 OID 19577)
-- Name: idx_problem_testcases_problem_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_testcases_problem_id ON public.problem_testcases USING btree (problem_id);


--
-- TOC entry 5374 (class 1259 OID 19576)
-- Name: idx_problems_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problems_created_by ON public.problems USING btree (created_by);


--
-- TOC entry 5375 (class 1259 OID 19623)
-- Name: idx_problems_fts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problems_fts ON public.problems USING gin (fts_document);


--
-- TOC entry 5368 (class 1259 OID 19575)
-- Name: idx_quiz_attempts_quiz_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_attempts_quiz_id ON public.quiz_attempts USING btree (quiz_id);


--
-- TOC entry 5369 (class 1259 OID 19574)
-- Name: idx_quiz_attempts_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_attempts_user_id ON public.quiz_attempts USING btree (user_id);


--
-- TOC entry 5365 (class 1259 OID 19573)
-- Name: idx_quiz_options_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_options_question_id ON public.quiz_options USING btree (question_id);


--
-- TOC entry 5362 (class 1259 OID 19572)
-- Name: idx_quiz_questions_quiz_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_questions_quiz_id ON public.quiz_questions USING btree (quiz_id);


--
-- TOC entry 5296 (class 1259 OID 19560)
-- Name: idx_wallet_transactions_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wallet_transactions_order_id ON public.wallet_transactions USING btree (order_id);


--
-- TOC entry 5297 (class 1259 OID 19559)
-- Name: idx_wallet_transactions_wallet_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wallet_transactions_wallet_id ON public.wallet_transactions USING btree (wallet_id);


--
-- TOC entry 5485 (class 2606 OID 19543)
-- Name: contest_problem_attempts fk_attempts_contest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fk_attempts_contest FOREIGN KEY (contest_id) REFERENCES public.contest(id) ON DELETE CASCADE;


--
-- TOC entry 5486 (class 2606 OID 19553)
-- Name: contest_problem_attempts fk_attempts_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fk_attempts_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5487 (class 2606 OID 19548)
-- Name: contest_problem_attempts fk_attempts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problem_attempts
    ADD CONSTRAINT fk_attempts_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5441 (class 2606 OID 19323)
-- Name: cart_items fk_cart_items_carts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_cart_items_carts FOREIGN KEY (cart_id) REFERENCES public.carts(id) ON DELETE CASCADE;


--
-- TOC entry 5442 (class 2606 OID 19687)
-- Name: cart_items fk_cart_items_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_cart_items_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5440 (class 2606 OID 19318)
-- Name: carts fk_carts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_carts_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5444 (class 2606 OID 19343)
-- Name: course_category_mappings fk_cc_mappings_categories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT fk_cc_mappings_categories FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 5445 (class 2606 OID 19712)
-- Name: course_category_mappings fk_cc_mappings_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_category_mappings
    ADD CONSTRAINT fk_cc_mappings_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5450 (class 2606 OID 19702)
-- Name: chapters fk_chapters_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT fk_chapters_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5452 (class 2606 OID 19378)
-- Name: lesson_comments fk_comments_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fk_comments_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE CASCADE;


--
-- TOC entry 5453 (class 2606 OID 19388)
-- Name: lesson_comments fk_comments_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fk_comments_parent FOREIGN KEY (parent_comment_id) REFERENCES public.lesson_comments(id) ON DELETE CASCADE;


--
-- TOC entry 5454 (class 2606 OID 19383)
-- Name: lesson_comments fk_comments_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_comments
    ADD CONSTRAINT fk_comments_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5471 (class 2606 OID 19468)
-- Name: contest_problems fk_contest_problems_contest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT fk_contest_problems_contest FOREIGN KEY (contest_id) REFERENCES public.contest(id) ON DELETE CASCADE;


--
-- TOC entry 5472 (class 2606 OID 19473)
-- Name: contest_problems fk_contest_problems_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_problems
    ADD CONSTRAINT fk_contest_problems_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5480 (class 2606 OID 19518)
-- Name: contest fk_contest_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT fk_contest_users FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5446 (class 2606 OID 19692)
-- Name: course_reviews fk_course_reviews_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT fk_course_reviews_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5447 (class 2606 OID 19353)
-- Name: course_reviews fk_course_reviews_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_reviews
    ADD CONSTRAINT fk_course_reviews_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5443 (class 2606 OID 19333)
-- Name: courses fk_courses_instructors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_instructors FOREIGN KEY (instructor_id) REFERENCES public.instructors(id) ON DELETE CASCADE;


--
-- TOC entry 5448 (class 2606 OID 19755)
-- Name: enrollments fk_enrollments_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_enrollments_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5449 (class 2606 OID 19358)
-- Name: enrollments fk_enrollments_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_enrollments_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5431 (class 2606 OID 19273)
-- Name: instructor_applications fk_instructor_app_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_applications
    ADD CONSTRAINT fk_instructor_app_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5432 (class 2606 OID 19278)
-- Name: instructors fk_instructors_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT fk_instructors_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5469 (class 2606 OID 19458)
-- Name: lesson_problems fk_lesson_problems_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT fk_lesson_problems_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE CASCADE;


--
-- TOC entry 5470 (class 2606 OID 19463)
-- Name: lesson_problems fk_lesson_problems_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_problems
    ADD CONSTRAINT fk_lesson_problems_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5451 (class 2606 OID 19373)
-- Name: lessons fk_lessons_chapters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_lessons_chapters FOREIGN KEY (chapter_id) REFERENCES public.chapters(id) ON DELETE CASCADE;


--
-- TOC entry 5438 (class 2606 OID 19682)
-- Name: order_items fk_order_items_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5439 (class 2606 OID 19308)
-- Name: order_items fk_order_items_orders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_orders FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 5437 (class 2606 OID 19303)
-- Name: orders fk_orders_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5481 (class 2606 OID 19523)
-- Name: contest_participants fk_participants_contest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT fk_participants_contest FOREIGN KEY (contest_id) REFERENCES public.contest(id) ON DELETE CASCADE;


--
-- TOC entry 5482 (class 2606 OID 19528)
-- Name: contest_participants fk_participants_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_participants
    ADD CONSTRAINT fk_participants_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5436 (class 2606 OID 19298)
-- Name: payment_transactions fk_payment_tx_wallets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT fk_payment_tx_wallets FOREIGN KEY (wallet_id) REFERENCES public.wallets(id) ON DELETE CASCADE;


--
-- TOC entry 5435 (class 2606 OID 19293)
-- Name: payout_requests fk_payout_wallets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payout_requests
    ADD CONSTRAINT fk_payout_wallets FOREIGN KEY (wallet_id) REFERENCES public.wallets(id) ON DELETE CASCADE;


--
-- TOC entry 5466 (class 2606 OID 19448)
-- Name: problems fk_problems_instructors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT fk_problems_users FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5455 (class 2606 OID 19776)
-- Name: lesson_progress fk_progress_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT fk_progress_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 5456 (class 2606 OID 19398)
-- Name: lesson_progress fk_progress_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT fk_progress_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE CASCADE;


--
-- TOC entry 5457 (class 2606 OID 19393)
-- Name: lesson_progress fk_progress_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT fk_progress_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5467 (class 2606 OID 19478)
-- Name: problem_tag_mappings fk_pt_mappings_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT fk_pt_mappings_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5468 (class 2606 OID 19483)
-- Name: problem_tag_mappings fk_pt_mappings_tags; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_tag_mappings
    ADD CONSTRAINT fk_pt_mappings_tags FOREIGN KEY (tag_id) REFERENCES public.problem_tags(id) ON DELETE CASCADE;


--
-- TOC entry 5463 (class 2606 OID 19433)
-- Name: quiz_attempt_answers fk_qaa_attempts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fk_qaa_attempts FOREIGN KEY (quiz_attempt_id) REFERENCES public.quiz_attempts(id) ON DELETE CASCADE;


--
-- TOC entry 5464 (class 2606 OID 19443)
-- Name: quiz_attempt_answers fk_qaa_options; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fk_qaa_options FOREIGN KEY (selected_option_id) REFERENCES public.quiz_options(id) ON DELETE SET NULL;


--
-- TOC entry 5465 (class 2606 OID 19438)
-- Name: quiz_attempt_answers fk_qaa_questions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempt_answers
    ADD CONSTRAINT fk_qaa_questions FOREIGN KEY (quiz_question_id) REFERENCES public.quiz_questions(id) ON DELETE CASCADE;


--
-- TOC entry 5461 (class 2606 OID 19428)
-- Name: quiz_attempts fk_quiz_attempts_quizzes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT fk_quiz_attempts_quizzes FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id) ON DELETE CASCADE;


--
-- TOC entry 5462 (class 2606 OID 19423)
-- Name: quiz_attempts fk_quiz_attempts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_attempts
    ADD CONSTRAINT fk_quiz_attempts_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5460 (class 2606 OID 19418)
-- Name: quiz_options fk_quiz_options_questions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_options
    ADD CONSTRAINT fk_quiz_options_questions FOREIGN KEY (question_id) REFERENCES public.quiz_questions(id) ON DELETE CASCADE;


--
-- TOC entry 5459 (class 2606 OID 19413)
-- Name: quiz_questions fk_quiz_questions_quizzes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT fk_quiz_questions_quizzes FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id) ON DELETE CASCADE;


--
-- TOC entry 5458 (class 2606 OID 19408)
-- Name: quizzes fk_quizzes_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT fk_quizzes_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE CASCADE;


--
-- TOC entry 5483 (class 2606 OID 19533)
-- Name: contest_rankings fk_rankings_contest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT fk_rankings_contest FOREIGN KEY (contest_id) REFERENCES public.contest(id) ON DELETE CASCADE;


--
-- TOC entry 5484 (class 2606 OID 19538)
-- Name: contest_rankings fk_rankings_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_rankings
    ADD CONSTRAINT fk_rankings_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5477 (class 2606 OID 19508)
-- Name: problem_submission_details fk_sub_details_submissions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT fk_sub_details_submissions FOREIGN KEY (submission_id) REFERENCES public.problem_submissions(id) ON DELETE CASCADE;


--
-- TOC entry 5478 (class 2606 OID 19513)
-- Name: problem_submission_details fk_sub_details_testcases; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submission_details
    ADD CONSTRAINT fk_sub_details_testcases FOREIGN KEY (testcase_id) REFERENCES public.problem_testcases(id) ON DELETE CASCADE;


--
-- TOC entry 5473 (class 2606 OID 19503)
-- Name: problem_submissions fk_submissions_contest; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk_submissions_contest FOREIGN KEY (contest_id) REFERENCES public.contest(id) ON DELETE SET NULL;


--
-- TOC entry 5474 (class 2606 OID 19498)
-- Name: problem_submissions fk_submissions_lessons; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk_submissions_lessons FOREIGN KEY (lesson_id) REFERENCES public.lessons(id) ON DELETE SET NULL;


--
-- TOC entry 5475 (class 2606 OID 19488)
-- Name: problem_submissions fk_submissions_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk_submissions_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5476 (class 2606 OID 19493)
-- Name: problem_submissions fk_submissions_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_submissions
    ADD CONSTRAINT fk_submissions_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5479 (class 2606 OID 19453)
-- Name: problem_testcases fk_testcases_problems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_testcases
    ADD CONSTRAINT fk_testcases_problems FOREIGN KEY (problem_id) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- TOC entry 5490 (class 2606 OID 19815)
-- Name: user_oauth_accounts fk_user_oauth; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_oauth_accounts
    ADD CONSTRAINT fk_user_oauth FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5429 (class 2606 OID 19268)
-- Name: user_roles fk_user_roles_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user_roles_roles FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 5430 (class 2606 OID 19263)
-- Name: user_roles fk_user_roles_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user_roles_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5434 (class 2606 OID 19288)
-- Name: wallet_transactions fk_wallet_tx_wallets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_transactions
    ADD CONSTRAINT fk_wallet_tx_wallets FOREIGN KEY (wallet_id) REFERENCES public.wallets(id) ON DELETE CASCADE;


--
-- TOC entry 5433 (class 2606 OID 19283)
-- Name: wallets fk_wallets_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT fk_wallets_users FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5488 (class 2606 OID 19794)
-- Name: completed_lessons_count fkilxswyivftkeso9mf0d9cta1p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT fkilxswyivftkeso9mf0d9cta1p FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5489 (class 2606 OID 19789)
-- Name: completed_lessons_count fksfu0dm9pu61y2ihppu7bms7su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.completed_lessons_count
    ADD CONSTRAINT fksfu0dm9pu61y2ihppu7bms7su FOREIGN KEY (course_id) REFERENCES public.courses(id);


-- Completed on 2026-06-03 03:48:24

--
-- PostgreSQL database dump complete

--
-- Table structure for table `user_daily_activities`
--
CREATE TABLE public.user_daily_activities (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    activity_date DATE NOT NULL,
    streak INTEGER DEFAULT 1,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT user_daily_activities_unique_user_date UNIQUE (user_id, activity_date)
);

CREATE INDEX idx_user_activities_user_date ON public.user_daily_activities(user_id, activity_date);

--




--
-- Data Seeding by Antigravity AI
--


-- 1. Insert teacher user if not exists
INSERT INTO public.users (id, username, password_hash, displayname, avatarurl, email, created_at, status, score)
VALUES (1, 'admin_teacher', '$2a$12$e8yQOplZ.pL7c3b/n7U..OshcM6yL3/2w0l/Jb7vGv1Yc7809W9Oq', 'System Teacher', NULL, 'teacher@nonstopcoding.com', CURRENT_TIMESTAMP, 'ACTIVE', 0.0)
ON CONFLICT (id) DO NOTHING;


-- 2. Insert instructor if not exists
INSERT INTO public.instructors (id, user_id, full_name, major, bio, created_at, status)
VALUES (1, 1, 'System Teacher', 'Computer Science', 'System generated seeder instructor account.', CURRENT_TIMESTAMP, 'ACTIVE')
ON CONFLICT (id) DO NOTHING;


-- 3. Insert problem tags

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (1, 'Array', 'array', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (2, 'String', 'string', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (3, 'Hash Table', 'hash-table', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (4, 'Math', 'math', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (5, 'Two Pointers', 'two-pointers', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (6, 'Dynamic Programming', 'dynamic-programming', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (7, 'Greedy', 'greedy', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (8, 'Tree', 'tree', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (9, 'Graph', 'graph', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (10, 'Sorting', 'sorting', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (11, 'Binary Search', 'binary-search', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (12, 'Stack', 'stack', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problem_tags (id, name, slug, created_at, updated_at)
VALUES (13, 'Queue', 'queue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (id) DO NOTHING;

-- 4. Insert Online Judge Problems

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (1, 'Two Sum', 
        '<p>Given an array of integers <code>nums</code> and an integer <code>target</code>, return indices of the two numbers such that they add up to <code>target</code>.</p><p>You may assume that each input would have <b>exactly one solution</b>, and you may not use the same element twice.</p><p>You can return the answer in any order.</p>',
        '<p>An array of integers <code>nums</code> and an integer <code>target</code>.</p>',
        '<p>Indices of the two numbers that sum to <code>target</code>.</p>',
        '<p><code>2 <= nums.length <= 10<sup>4</sup></code></p><p><code>-10<sup>9</sup> <= nums[i] <= 10<sup>9</sup></code></p><p><code>-10<sup>9</sup> <= target <= 10<sup>9</sup></code></p><p>Only one valid answer exists.</p>',
        'nums = [2,7,11,15], target = 9',
        '[0,1]',
        '<p>A really brute force way would be to search for all possible pairs of numbers but that would be slow. Can you think of something faster using a Hash Map?</p>',
        'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int complement = target - nums[i];
            if (map.containsKey(complement)) {
                return new int[] { map.get(complement), i };
            }
            map.put(nums[i], i);
        }
        return new int[] {};
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (2, 'Add Two Numbers', 
        '<p>You are given two <b>non-empty</b> linked lists representing two non-negative integers. The digits are stored in <b>reverse order</b>, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.</p><p>You may assume the two numbers do not contain any leading zero, except the number 0 itself.</p>',
        '<p>Two linked lists <code>l1</code> and <code>l2</code>.</p>',
        '<p>The sum represented as a linked list.</p>',
        '<p>The number of nodes in each linked list is in the range <code>[1, 100]</code>.</p><p><code>0 <= Node.val <= 9</code></p>',
        'l1 = [2,4,3], l2 = [5,6,4]',
        '[7,0,8]',
        '<p>Simulate the addition node by node, keeping track of the carry-over value.</p>',
        'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode dummyHead = new ListNode(0);
        ListNode curr = dummyHead;
        int carry = 0;
        while (l1 != null || l2 != null || carry != 0) {
            int sum = carry;
            if (l1 != null) {
                sum += l1.val;
                l1 = l1.next;
            }
            if (l2 != null) {
                sum += l2.val;
                l2 = l2.next;
            }
            carry = sum / 10;
            curr.next = new ListNode(sum % 10);
            curr = curr.next;
        }
        return dummyHead.next;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (3, 'Longest Substring Without Repeating Characters', 
        '<p>Given a string <code>s</code>, find the length of the <b>longest substring</b> without repeating characters.</p>',
        '<p>A string <code>s</code>.</p>',
        '<p>The length of the longest substring.</p>',
        '<p><code>0 <= s.length <= 5 * 10<sup>4</sup></code></p><p><code>s</code> consists of English letters, digits, symbols and spaces.</p>',
        's = "abcabcbb"',
        '3',
        '<p>Use a sliding window approach with two pointers to keep track of the current substring.</p>',
        'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int lengthOfLongestSubstring(String s) {
        int n = s.length();
        int ans = 0;
        Map<Character, Integer> map = new HashMap<>();
        for (int j = 0, i = 0; j < n; j++) {
            if (map.containsKey(s.charAt(j))) {
                i = Math.max(map.get(s.charAt(j)), i);
            }
            ans = Math.max(ans, j - i + 1);
            map.put(s.charAt(j), j + 1);
        }
        return ans;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (4, 'Target Sum Triplet 1', '<p>Solve the classic programming challenge related to <b>Two Pointers</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Two Pointers.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 4', 'Output result example 4', '<p>Think about using Two Pointers concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res = new ArrayList<>();
        for (int i = 0; i < nums.length - 2 && nums[i] <= 0; ++i) {
            if (i == 0 || nums[i - 1] != nums[i]) {
                twoSumII(nums, i, res);
            }
        }
        return res;
    }
    private void twoSumII(int[] nums, int i, List<List<Integer>> res) {
        int lo = i + 1, hi = nums.length - 1;
        while (lo < hi) {
            int sum = nums[i] + nums[lo] + nums[hi];
            if (sum < 0) {
                ++lo;
            } else if (sum > 0) {
                --hi;
            } else {
                res.add(Arrays.asList(nums[i], nums[lo++], nums[hi--]));
                while (lo < hi && nums[lo] == nums[lo - 1]) ++lo;
            }
        }
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (5, 'Optimal Knapsack Selection 1', '<p>Solve the classic programming challenge related to <b>Dynamic Programming</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Dynamic Programming.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 5', 'Output result example 5', '<p>Think about using Dynamic Programming concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int knapsack(int[] weights, int[] values, int capacity) {
        int n = weights.length;
        int[][] dp = new int[n + 1][capacity + 1];
        for (int i = 1; i <= n; i++) {
            for (int w = 1; w <= capacity; w++) {
                if (weights[i - 1] <= w) {
                    dp[i][w] = Math.max(values[i - 1] + dp[i - 1][w - weights[i - 1]], dp[i - 1][w]);
                } else {
                    dp[i][w] = dp[i - 1][w];
                }
            }
        }
        return dp[n][capacity];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (6, 'Min Operations Greedy Path 1', '<p>Solve the classic programming challenge related to <b>Greedy</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Greedy.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 6', 'Output result example 6', '<p>Think about using Greedy concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int minOperations(int[] nums) {
        int operations = 0;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] <= nums[i - 1]) {
                int diff = nums[i - 1] - nums[i] + 1;
                nums[i] += diff;
                operations += diff;
            }
        }
        return operations;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (7, 'Binary Tree Path Max 1', '<p>Solve the classic programming challenge related to <b>Tree</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Tree.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 7', 'Output result example 7', '<p>Think about using Tree concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    private int maxSum = Integer.MIN_VALUE;
    public int maxPathSum(TreeNode root) {
        maxGain(root);
        return maxSum;
    }
    private int maxGain(TreeNode node) {
        if (node == null) return 0;
        int leftGain = Math.max(maxGain(node.left), 0);
        int rightGain = Math.max(maxGain(node.right), 0);
        int priceNewpath = node.val + leftGain + rightGain;
        maxSum = Math.max(maxSum, priceNewpath);
        return node.val + Math.max(leftGain, rightGain);
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (8, 'Shortest Route Cost 1', '<p>Solve the classic programming challenge related to <b>Graph</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Graph.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 8', 'Output result example 8', '<p>Think about using Graph concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int shortestPath(int[][] graph, int src, int dest) {
        int n = graph.length;
        int[] dist = new int[n];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[src] = 0;
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> a[1] - b[1]);
        pq.offer(new int[]{src, 0});
        while (!pq.isEmpty()) {
            int[] curr = pq.poll();
            int u = curr[0];
            int d = curr[1];
            if (d > dist[u]) continue;
            for (int v = 0; v < n; v++) {
                if (graph[u][v] != 0 && dist[u] + graph[u][v] < dist[v]) {
                    dist[v] = dist[u] + graph[u][v];
                    pq.offer(new int[]{v, dist[v]});
                }
            }
        }
        return dist[dest] == Integer.MAX_VALUE ? -1 : dist[dest];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (9, 'Merge Sorting Arrays 1', '<p>Solve the classic programming challenge related to <b>Sorting</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Sorting.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 9', 'Output result example 9', '<p>Think about using Sorting concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public void mergeSort(int[] arr, int l, int r) {
        if (l < r) {
            int m = l + (r - l) / 2;
            mergeSort(arr, l, m);
            mergeSort(arr, m + 1, r);
            merge(arr, l, m, r);
        }
    }
    private void merge(int[] arr, int l, int m, int r) {
        int n1 = m - l + 1;
        int n2 = r - m;
        int[] L = new int[n1];
        int[] R = new int[n2];
        System.arraycopy(arr, l, L, 0, n1);
        System.arraycopy(arr, m + 1, R, 0, n2);
        int i = 0, j = 0, k = l;
        while (i < n1 && j < n2) {
            if (L[i] <= R[j]) {
                arr[k++] = L[i++];
            } else {
                arr[k++] = R[j++];
            }
        }
        while (i < n1) arr[k++] = L[i++];
        while (j < n2) arr[k++] = R[j++];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (10, 'Range Binary Search 2', '<p>Solve the classic programming challenge related to <b>Binary Search</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Binary Search.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 10', 'Output result example 10', '<p>Think about using Binary Search concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int[] searchRange(int[] nums, int target) {
        int[] result = new int[]{-1, -1};
        result[0] = findBound(nums, target, true);
        result[1] = findBound(nums, target, false);
        return result;
    }
    private int findBound(int[] nums, int target, boolean isFirst) {
        int l = 0, r = nums.length - 1, ans = -1;
        while (l <= r) {
            int mid = l + (r - l) / 2;
            if (nums[mid] == target) {
                ans = mid;
                if (isFirst) r = mid - 1;
                else l = mid + 1;
            } else if (nums[mid] < target) {
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        return ans;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (11, 'Valid Parentheses Nesting 2', '<p>Solve the classic programming challenge related to <b>Stack</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Stack.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 11', 'Output result example 11', '<p>Think about using Stack concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public boolean isValid(String s) {
        Stack<Character> stack = new Stack<>();
        for (char c : s.toCharArray()) {
            if (c == ''('' || c == ''{'' || c == ''['') {
                stack.push(c);
            } else {
                if (stack.isEmpty()) return false;
                char top = stack.pop();
                if (c == '')'' && top != ''('') return false;
                if (c == ''}'' && top != ''{'') return false;
                if (c == '']'' && top != ''['') return false;
            }
        }
        return stack.isEmpty();
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (12, 'Sliding Window Queue 2', '<p>Solve the classic programming challenge related to <b>Queue</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Queue.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 12', 'Output result example 12', '<p>Think about using Queue concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        if (nums == null || nums.length == 0) return new int[0];
        int n = nums.length;
        int[] r = new int[n - k + 1];
        int ri = 0;
        Deque<Integer> q = new ArrayDeque<>();
        for (int i = 0; i < nums.length; i++) {
            while (!q.isEmpty() && q.peek() < i - k + 1) {
                q.poll();
            }
            while (!q.isEmpty() && nums[q.peekLast()] < nums[i]) {
                q.pollLast();
            }
            q.offer(i);
            if (i >= k - 1) {
                r[ri++] = nums[q.peek()];
            }
        }
        return r;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (13, 'Minimum Subarray Sum 2', '<p>Solve the classic programming challenge related to <b>Array</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Array.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 13', 'Output result example 13', '<p>Think about using Array concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int minSubArrayLen(int target, int[] nums) {
        int n = nums.length;
        int ans = Integer.MAX_VALUE;
        int left = 0, sum = 0;
        for (int i = 0; i < n; i++) {
            sum += nums[i];
            while (sum >= target) {
                ans = Math.min(ans, i + 1 - left);
                sum -= nums[left++];
            }
        }
        return ans == Integer.MAX_VALUE ? 0 : ans;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (14, 'Reverse Substring 2', '<p>Solve the classic programming challenge related to <b>String</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of String.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 14', 'Output result example 14', '<p>Think about using String concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public String reverseParentheses(String s) {
        Stack<StringBuilder> stack = new Stack<>();
        StringBuilder curr = new StringBuilder();
        for (char c : s.toCharArray()) {
            if (c == ''('') {
                stack.push(curr);
                curr = new StringBuilder();
            } else if (c == '')'') {
                curr.reverse();
                curr = stack.pop().append(curr);
            } else {
                curr.append(c);
            }
        }
        return curr.toString();
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (15, 'Anagram Pairs 2', '<p>Solve the classic programming challenge related to <b>Hash Table</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Hash Table.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 15', 'Output result example 15', '<p>Think about using Hash Table concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        if (strs == null || strs.length == 0) return new ArrayList<>();
        Map<String, List<String>> map = new HashMap<>();
        for (String s : strs) {
            char[] ca = s.toCharArray();
            Arrays.sort(ca);
            String key = String.valueOf(ca);
            if (!map.containsKey(key)) map.put(key, new ArrayList<>());
            map.get(key).add(s);
        }
        return new ArrayList<>(map.values());
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (16, 'Factorial Prime Factorization 2', '<p>Solve the classic programming challenge related to <b>Math</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Math.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 16', 'Output result example 16', '<p>Think about using Math concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public Map<Integer, Integer> primeFactors(int n) {
        Map<Integer, Integer> factors = new HashMap<>();
        for (int i = 2; i <= n; i++) {
            int temp = i;
            for (int j = 2; j * j <= temp; j++) {
                while (temp % j == 0) {
                    factors.put(j, factors.getOrDefault(j, 0) + 1);
                    temp /= j;
                }
            }
            if (temp > 1) {
                factors.put(temp, factors.getOrDefault(temp, 0) + 1);
            }
        }
        return factors;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (17, 'Target Sum Triplet 2', '<p>Solve the classic programming challenge related to <b>Two Pointers</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Two Pointers.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 17', 'Output result example 17', '<p>Think about using Two Pointers concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res = new ArrayList<>();
        for (int i = 0; i < nums.length - 2 && nums[i] <= 0; ++i) {
            if (i == 0 || nums[i - 1] != nums[i]) {
                twoSumII(nums, i, res);
            }
        }
        return res;
    }
    private void twoSumII(int[] nums, int i, List<List<Integer>> res) {
        int lo = i + 1, hi = nums.length - 1;
        while (lo < hi) {
            int sum = nums[i] + nums[lo] + nums[hi];
            if (sum < 0) {
                ++lo;
            } else if (sum > 0) {
                --hi;
            } else {
                res.add(Arrays.asList(nums[i], nums[lo++], nums[hi--]));
                while (lo < hi && nums[lo] == nums[lo - 1]) ++lo;
            }
        }
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (18, 'Optimal Knapsack Selection 2', '<p>Solve the classic programming challenge related to <b>Dynamic Programming</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Dynamic Programming.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 18', 'Output result example 18', '<p>Think about using Dynamic Programming concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int knapsack(int[] weights, int[] values, int capacity) {
        int n = weights.length;
        int[][] dp = new int[n + 1][capacity + 1];
        for (int i = 1; i <= n; i++) {
            for (int w = 1; w <= capacity; w++) {
                if (weights[i - 1] <= w) {
                    dp[i][w] = Math.max(values[i - 1] + dp[i - 1][w - weights[i - 1]], dp[i - 1][w]);
                } else {
                    dp[i][w] = dp[i - 1][w];
                }
            }
        }
        return dp[n][capacity];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (19, 'Min Operations Greedy Path 2', '<p>Solve the classic programming challenge related to <b>Greedy</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Greedy.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 19', 'Output result example 19', '<p>Think about using Greedy concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int minOperations(int[] nums) {
        int operations = 0;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] <= nums[i - 1]) {
                int diff = nums[i - 1] - nums[i] + 1;
                nums[i] += diff;
                operations += diff;
            }
        }
        return operations;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (20, 'Binary Tree Path Max 3', '<p>Solve the classic programming challenge related to <b>Tree</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Tree.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 20', 'Output result example 20', '<p>Think about using Tree concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    private int maxSum = Integer.MIN_VALUE;
    public int maxPathSum(TreeNode root) {
        maxGain(root);
        return maxSum;
    }
    private int maxGain(TreeNode node) {
        if (node == null) return 0;
        int leftGain = Math.max(maxGain(node.left), 0);
        int rightGain = Math.max(maxGain(node.right), 0);
        int priceNewpath = node.val + leftGain + rightGain;
        maxSum = Math.max(maxSum, priceNewpath);
        return node.val + Math.max(leftGain, rightGain);
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (21, 'Shortest Route Cost 3', '<p>Solve the classic programming challenge related to <b>Graph</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Graph.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 21', 'Output result example 21', '<p>Think about using Graph concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int shortestPath(int[][] graph, int src, int dest) {
        int n = graph.length;
        int[] dist = new int[n];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[src] = 0;
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> a[1] - b[1]);
        pq.offer(new int[]{src, 0});
        while (!pq.isEmpty()) {
            int[] curr = pq.poll();
            int u = curr[0];
            int d = curr[1];
            if (d > dist[u]) continue;
            for (int v = 0; v < n; v++) {
                if (graph[u][v] != 0 && dist[u] + graph[u][v] < dist[v]) {
                    dist[v] = dist[u] + graph[u][v];
                    pq.offer(new int[]{v, dist[v]});
                }
            }
        }
        return dist[dest] == Integer.MAX_VALUE ? -1 : dist[dest];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (22, 'Merge Sorting Arrays 3', '<p>Solve the classic programming challenge related to <b>Sorting</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Sorting.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 22', 'Output result example 22', '<p>Think about using Sorting concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public void mergeSort(int[] arr, int l, int r) {
        if (l < r) {
            int m = l + (r - l) / 2;
            mergeSort(arr, l, m);
            mergeSort(arr, m + 1, r);
            merge(arr, l, m, r);
        }
    }
    private void merge(int[] arr, int l, int m, int r) {
        int n1 = m - l + 1;
        int n2 = r - m;
        int[] L = new int[n1];
        int[] R = new int[n2];
        System.arraycopy(arr, l, L, 0, n1);
        System.arraycopy(arr, m + 1, R, 0, n2);
        int i = 0, j = 0, k = l;
        while (i < n1 && j < n2) {
            if (L[i] <= R[j]) {
                arr[k++] = L[i++];
            } else {
                arr[k++] = R[j++];
            }
        }
        while (i < n1) arr[k++] = L[i++];
        while (j < n2) arr[k++] = R[j++];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (23, 'Range Binary Search 3', '<p>Solve the classic programming challenge related to <b>Binary Search</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Binary Search.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 23', 'Output result example 23', '<p>Think about using Binary Search concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int[] searchRange(int[] nums, int target) {
        int[] result = new int[]{-1, -1};
        result[0] = findBound(nums, target, true);
        result[1] = findBound(nums, target, false);
        return result;
    }
    private int findBound(int[] nums, int target, boolean isFirst) {
        int l = 0, r = nums.length - 1, ans = -1;
        while (l <= r) {
            int mid = l + (r - l) / 2;
            if (nums[mid] == target) {
                ans = mid;
                if (isFirst) r = mid - 1;
                else l = mid + 1;
            } else if (nums[mid] < target) {
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        return ans;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (24, 'Valid Parentheses Nesting 3', '<p>Solve the classic programming challenge related to <b>Stack</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Stack.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 24', 'Output result example 24', '<p>Think about using Stack concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public boolean isValid(String s) {
        Stack<Character> stack = new Stack<>();
        for (char c : s.toCharArray()) {
            if (c == ''('' || c == ''{'' || c == ''['') {
                stack.push(c);
            } else {
                if (stack.isEmpty()) return false;
                char top = stack.pop();
                if (c == '')'' && top != ''('') return false;
                if (c == ''}'' && top != ''{'') return false;
                if (c == '']'' && top != ''['') return false;
            }
        }
        return stack.isEmpty();
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (25, 'Sliding Window Queue 3', '<p>Solve the classic programming challenge related to <b>Queue</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Queue.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 25', 'Output result example 25', '<p>Think about using Queue concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        if (nums == null || nums.length == 0) return new int[0];
        int n = nums.length;
        int[] r = new int[n - k + 1];
        int ri = 0;
        Deque<Integer> q = new ArrayDeque<>();
        for (int i = 0; i < nums.length; i++) {
            while (!q.isEmpty() && q.peek() < i - k + 1) {
                q.poll();
            }
            while (!q.isEmpty() && nums[q.peekLast()] < nums[i]) {
                q.pollLast();
            }
            q.offer(i);
            if (i >= k - 1) {
                r[ri++] = nums[q.peek()];
            }
        }
        return r;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (26, 'Minimum Subarray Sum 3', '<p>Solve the classic programming challenge related to <b>Array</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Array.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 26', 'Output result example 26', '<p>Think about using Array concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int minSubArrayLen(int target, int[] nums) {
        int n = nums.length;
        int ans = Integer.MAX_VALUE;
        int left = 0, sum = 0;
        for (int i = 0; i < n; i++) {
            sum += nums[i];
            while (sum >= target) {
                ans = Math.min(ans, i + 1 - left);
                sum -= nums[left++];
            }
        }
        return ans == Integer.MAX_VALUE ? 0 : ans;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (27, 'Reverse Substring 3', '<p>Solve the classic programming challenge related to <b>String</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of String.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 27', 'Output result example 27', '<p>Think about using String concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public String reverseParentheses(String s) {
        Stack<StringBuilder> stack = new Stack<>();
        StringBuilder curr = new StringBuilder();
        for (char c : s.toCharArray()) {
            if (c == ''('') {
                stack.push(curr);
                curr = new StringBuilder();
            } else if (c == '')'') {
                curr.reverse();
                curr = stack.pop().append(curr);
            } else {
                curr.append(c);
            }
        }
        return curr.toString();
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (28, 'Anagram Pairs 3', '<p>Solve the classic programming challenge related to <b>Hash Table</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Hash Table.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 28', 'Output result example 28', '<p>Think about using Hash Table concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        if (strs == null || strs.length == 0) return new ArrayList<>();
        Map<String, List<String>> map = new HashMap<>();
        for (String s : strs) {
            char[] ca = s.toCharArray();
            Arrays.sort(ca);
            String key = String.valueOf(ca);
            if (!map.containsKey(key)) map.put(key, new ArrayList<>());
            map.get(key).add(s);
        }
        return new ArrayList<>(map.values());
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (29, 'Factorial Prime Factorization 3', '<p>Solve the classic programming challenge related to <b>Math</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Math.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 29', 'Output result example 29', '<p>Think about using Math concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public Map<Integer, Integer> primeFactors(int n) {
        Map<Integer, Integer> factors = new HashMap<>();
        for (int i = 2; i <= n; i++) {
            int temp = i;
            for (int j = 2; j * j <= temp; j++) {
                while (temp % j == 0) {
                    factors.put(j, factors.getOrDefault(j, 0) + 1);
                    temp /= j;
                }
            }
            if (temp > 1) {
                factors.put(temp, factors.getOrDefault(temp, 0) + 1);
            }
        }
        return factors;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (30, 'Target Sum Triplet 4', '<p>Solve the classic programming challenge related to <b>Two Pointers</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Two Pointers.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 30', 'Output result example 30', '<p>Think about using Two Pointers concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res = new ArrayList<>();
        for (int i = 0; i < nums.length - 2 && nums[i] <= 0; ++i) {
            if (i == 0 || nums[i - 1] != nums[i]) {
                twoSumII(nums, i, res);
            }
        }
        return res;
    }
    private void twoSumII(int[] nums, int i, List<List<Integer>> res) {
        int lo = i + 1, hi = nums.length - 1;
        while (lo < hi) {
            int sum = nums[i] + nums[lo] + nums[hi];
            if (sum < 0) {
                ++lo;
            } else if (sum > 0) {
                --hi;
            } else {
                res.add(Arrays.asList(nums[i], nums[lo++], nums[hi--]));
                while (lo < hi && nums[lo] == nums[lo - 1]) ++lo;
            }
        }
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (31, 'Optimal Knapsack Selection 4', '<p>Solve the classic programming challenge related to <b>Dynamic Programming</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Dynamic Programming.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 31', 'Output result example 31', '<p>Think about using Dynamic Programming concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int knapsack(int[] weights, int[] values, int capacity) {
        int n = weights.length;
        int[][] dp = new int[n + 1][capacity + 1];
        for (int i = 1; i <= n; i++) {
            for (int w = 1; w <= capacity; w++) {
                if (weights[i - 1] <= w) {
                    dp[i][w] = Math.max(values[i - 1] + dp[i - 1][w - weights[i - 1]], dp[i - 1][w]);
                } else {
                    dp[i][w] = dp[i - 1][w];
                }
            }
        }
        return dp[n][capacity];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (32, 'Min Operations Greedy Path 4', '<p>Solve the classic programming challenge related to <b>Greedy</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Greedy.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 32', 'Output result example 32', '<p>Think about using Greedy concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int minOperations(int[] nums) {
        int operations = 0;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] <= nums[i - 1]) {
                int diff = nums[i - 1] - nums[i] + 1;
                nums[i] += diff;
                operations += diff;
            }
        }
        return operations;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (33, 'Binary Tree Path Max 4', '<p>Solve the classic programming challenge related to <b>Tree</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Tree.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 33', 'Output result example 33', '<p>Think about using Tree concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    private int maxSum = Integer.MIN_VALUE;
    public int maxPathSum(TreeNode root) {
        maxGain(root);
        return maxSum;
    }
    private int maxGain(TreeNode node) {
        if (node == null) return 0;
        int leftGain = Math.max(maxGain(node.left), 0);
        int rightGain = Math.max(maxGain(node.right), 0);
        int priceNewpath = node.val + leftGain + rightGain;
        maxSum = Math.max(maxSum, priceNewpath);
        return node.val + Math.max(leftGain, rightGain);
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (34, 'Shortest Route Cost 4', '<p>Solve the classic programming challenge related to <b>Graph</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Graph.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 34', 'Output result example 34', '<p>Think about using Graph concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int shortestPath(int[][] graph, int src, int dest) {
        int n = graph.length;
        int[] dist = new int[n];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[src] = 0;
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> a[1] - b[1]);
        pq.offer(new int[]{src, 0});
        while (!pq.isEmpty()) {
            int[] curr = pq.poll();
            int u = curr[0];
            int d = curr[1];
            if (d > dist[u]) continue;
            for (int v = 0; v < n; v++) {
                if (graph[u][v] != 0 && dist[u] + graph[u][v] < dist[v]) {
                    dist[v] = dist[u] + graph[u][v];
                    pq.offer(new int[]{v, dist[v]});
                }
            }
        }
        return dist[dest] == Integer.MAX_VALUE ? -1 : dist[dest];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (35, 'Merge Sorting Arrays 4', '<p>Solve the classic programming challenge related to <b>Sorting</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Sorting.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 35', 'Output result example 35', '<p>Think about using Sorting concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public void mergeSort(int[] arr, int l, int r) {
        if (l < r) {
            int m = l + (r - l) / 2;
            mergeSort(arr, l, m);
            mergeSort(arr, m + 1, r);
            merge(arr, l, m, r);
        }
    }
    private void merge(int[] arr, int l, int m, int r) {
        int n1 = m - l + 1;
        int n2 = r - m;
        int[] L = new int[n1];
        int[] R = new int[n2];
        System.arraycopy(arr, l, L, 0, n1);
        System.arraycopy(arr, m + 1, R, 0, n2);
        int i = 0, j = 0, k = l;
        while (i < n1 && j < n2) {
            if (L[i] <= R[j]) {
                arr[k++] = L[i++];
            } else {
                arr[k++] = R[j++];
            }
        }
        while (i < n1) arr[k++] = L[i++];
        while (j < n2) arr[k++] = R[j++];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (36, 'Range Binary Search 4', '<p>Solve the classic programming challenge related to <b>Binary Search</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Binary Search.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 36', 'Output result example 36', '<p>Think about using Binary Search concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int[] searchRange(int[] nums, int target) {
        int[] result = new int[]{-1, -1};
        result[0] = findBound(nums, target, true);
        result[1] = findBound(nums, target, false);
        return result;
    }
    private int findBound(int[] nums, int target, boolean isFirst) {
        int l = 0, r = nums.length - 1, ans = -1;
        while (l <= r) {
            int mid = l + (r - l) / 2;
            if (nums[mid] == target) {
                ans = mid;
                if (isFirst) r = mid - 1;
                else l = mid + 1;
            } else if (nums[mid] < target) {
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        return ans;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (37, 'Valid Parentheses Nesting 4', '<p>Solve the classic programming challenge related to <b>Stack</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Stack.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 37', 'Output result example 37', '<p>Think about using Stack concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public boolean isValid(String s) {
        Stack<Character> stack = new Stack<>();
        for (char c : s.toCharArray()) {
            if (c == ''('' || c == ''{'' || c == ''['') {
                stack.push(c);
            } else {
                if (stack.isEmpty()) return false;
                char top = stack.pop();
                if (c == '')'' && top != ''('') return false;
                if (c == ''}'' && top != ''{'') return false;
                if (c == '']'' && top != ''['') return false;
            }
        }
        return stack.isEmpty();
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (38, 'Sliding Window Queue 4', '<p>Solve the classic programming challenge related to <b>Queue</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Queue.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 38', 'Output result example 38', '<p>Think about using Queue concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        if (nums == null || nums.length == 0) return new int[0];
        int n = nums.length;
        int[] r = new int[n - k + 1];
        int ri = 0;
        Deque<Integer> q = new ArrayDeque<>();
        for (int i = 0; i < nums.length; i++) {
            while (!q.isEmpty() && q.peek() < i - k + 1) {
                q.poll();
            }
            while (!q.isEmpty() && nums[q.peekLast()] < nums[i]) {
                q.pollLast();
            }
            q.offer(i);
            if (i >= k - 1) {
                r[ri++] = nums[q.peek()];
            }
        }
        return r;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (39, 'Minimum Subarray Sum 4', '<p>Solve the classic programming challenge related to <b>Array</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Array.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 39', 'Output result example 39', '<p>Think about using Array concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int minSubArrayLen(int target, int[] nums) {
        int n = nums.length;
        int ans = Integer.MAX_VALUE;
        int left = 0, sum = 0;
        for (int i = 0; i < n; i++) {
            sum += nums[i];
            while (sum >= target) {
                ans = Math.min(ans, i + 1 - left);
                sum -= nums[left++];
            }
        }
        return ans == Integer.MAX_VALUE ? 0 : ans;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (40, 'Reverse Substring 5', '<p>Solve the classic programming challenge related to <b>String</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of String.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 40', 'Output result example 40', '<p>Think about using String concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public String reverseParentheses(String s) {
        Stack<StringBuilder> stack = new Stack<>();
        StringBuilder curr = new StringBuilder();
        for (char c : s.toCharArray()) {
            if (c == ''('') {
                stack.push(curr);
                curr = new StringBuilder();
            } else if (c == '')'') {
                curr.reverse();
                curr = stack.pop().append(curr);
            } else {
                curr.append(c);
            }
        }
        return curr.toString();
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (41, 'Anagram Pairs 5', '<p>Solve the classic programming challenge related to <b>Hash Table</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Hash Table.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 41', 'Output result example 41', '<p>Think about using Hash Table concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        if (strs == null || strs.length == 0) return new ArrayList<>();
        Map<String, List<String>> map = new HashMap<>();
        for (String s : strs) {
            char[] ca = s.toCharArray();
            Arrays.sort(ca);
            String key = String.valueOf(ca);
            if (!map.containsKey(key)) map.put(key, new ArrayList<>());
            map.get(key).add(s);
        }
        return new ArrayList<>(map.values());
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (42, 'Factorial Prime Factorization 5', '<p>Solve the classic programming challenge related to <b>Math</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Math.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 42', 'Output result example 42', '<p>Think about using Math concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public Map<Integer, Integer> primeFactors(int n) {
        Map<Integer, Integer> factors = new HashMap<>();
        for (int i = 2; i <= n; i++) {
            int temp = i;
            for (int j = 2; j * j <= temp; j++) {
                while (temp % j == 0) {
                    factors.put(j, factors.getOrDefault(j, 0) + 1);
                    temp /= j;
                }
            }
            if (temp > 1) {
                factors.put(temp, factors.getOrDefault(temp, 0) + 1);
            }
        }
        return factors;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (43, 'Target Sum Triplet 5', '<p>Solve the classic programming challenge related to <b>Two Pointers</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Two Pointers.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 43', 'Output result example 43', '<p>Think about using Two Pointers concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res = new ArrayList<>();
        for (int i = 0; i < nums.length - 2 && nums[i] <= 0; ++i) {
            if (i == 0 || nums[i - 1] != nums[i]) {
                twoSumII(nums, i, res);
            }
        }
        return res;
    }
    private void twoSumII(int[] nums, int i, List<List<Integer>> res) {
        int lo = i + 1, hi = nums.length - 1;
        while (lo < hi) {
            int sum = nums[i] + nums[lo] + nums[hi];
            if (sum < 0) {
                ++lo;
            } else if (sum > 0) {
                --hi;
            } else {
                res.add(Arrays.asList(nums[i], nums[lo++], nums[hi--]));
                while (lo < hi && nums[lo] == nums[lo - 1]) ++lo;
            }
        }
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (44, 'Optimal Knapsack Selection 5', '<p>Solve the classic programming challenge related to <b>Dynamic Programming</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Dynamic Programming.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 44', 'Output result example 44', '<p>Think about using Dynamic Programming concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int knapsack(int[] weights, int[] values, int capacity) {
        int n = weights.length;
        int[][] dp = new int[n + 1][capacity + 1];
        for (int i = 1; i <= n; i++) {
            for (int w = 1; w <= capacity; w++) {
                if (weights[i - 1] <= w) {
                    dp[i][w] = Math.max(values[i - 1] + dp[i - 1][w - weights[i - 1]], dp[i - 1][w]);
                } else {
                    dp[i][w] = dp[i - 1][w];
                }
            }
        }
        return dp[n][capacity];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (45, 'Min Operations Greedy Path 5', '<p>Solve the classic programming challenge related to <b>Greedy</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Greedy.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 45', 'Output result example 45', '<p>Think about using Greedy concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int minOperations(int[] nums) {
        int operations = 0;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] <= nums[i - 1]) {
                int diff = nums[i - 1] - nums[i] + 1;
                nums[i] += diff;
                operations += diff;
            }
        }
        return operations;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (46, 'Binary Tree Path Max 5', '<p>Solve the classic programming challenge related to <b>Tree</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Tree.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 46', 'Output result example 46', '<p>Think about using Tree concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    private int maxSum = Integer.MIN_VALUE;
    public int maxPathSum(TreeNode root) {
        maxGain(root);
        return maxSum;
    }
    private int maxGain(TreeNode node) {
        if (node == null) return 0;
        int leftGain = Math.max(maxGain(node.left), 0);
        int rightGain = Math.max(maxGain(node.right), 0);
        int priceNewpath = node.val + leftGain + rightGain;
        maxSum = Math.max(maxSum, priceNewpath);
        return node.val + Math.max(leftGain, rightGain);
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (47, 'Shortest Route Cost 5', '<p>Solve the classic programming challenge related to <b>Graph</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Graph.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 47', 'Output result example 47', '<p>Think about using Graph concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int shortestPath(int[][] graph, int src, int dest) {
        int n = graph.length;
        int[] dist = new int[n];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[src] = 0;
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> a[1] - b[1]);
        pq.offer(new int[]{src, 0});
        while (!pq.isEmpty()) {
            int[] curr = pq.poll();
            int u = curr[0];
            int d = curr[1];
            if (d > dist[u]) continue;
            for (int v = 0; v < n; v++) {
                if (graph[u][v] != 0 && dist[u] + graph[u][v] < dist[v]) {
                    dist[v] = dist[u] + graph[u][v];
                    pq.offer(new int[]{v, dist[v]});
                }
            }
        }
        return dist[dest] == Integer.MAX_VALUE ? -1 : dist[dest];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (48, 'Merge Sorting Arrays 5', '<p>Solve the classic programming challenge related to <b>Sorting</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Sorting.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 48', 'Output result example 48', '<p>Think about using Sorting concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public void mergeSort(int[] arr, int l, int r) {
        if (l < r) {
            int m = l + (r - l) / 2;
            mergeSort(arr, l, m);
            mergeSort(arr, m + 1, r);
            merge(arr, l, m, r);
        }
    }
    private void merge(int[] arr, int l, int m, int r) {
        int n1 = m - l + 1;
        int n2 = r - m;
        int[] L = new int[n1];
        int[] R = new int[n2];
        System.arraycopy(arr, l, L, 0, n1);
        System.arraycopy(arr, m + 1, R, 0, n2);
        int i = 0, j = 0, k = l;
        while (i < n1 && j < n2) {
            if (L[i] <= R[j]) {
                arr[k++] = L[i++];
            } else {
                arr[k++] = R[j++];
            }
        }
        while (i < n1) arr[k++] = L[i++];
        while (j < n2) arr[k++] = R[j++];
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (49, 'Range Binary Search 5', '<p>Solve the classic programming challenge related to <b>Binary Search</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Binary Search.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 49', 'Output result example 49', '<p>Think about using Binary Search concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int[] searchRange(int[] nums, int target) {
        int[] result = new int[]{-1, -1};
        result[0] = findBound(nums, target, true);
        result[1] = findBound(nums, target, false);
        return result;
    }
    private int findBound(int[] nums, int target, boolean isFirst) {
        int l = 0, r = nums.length - 1, ans = -1;
        while (l <= r) {
            int mid = l + (r - l) / 2;
            if (nums[mid] == target) {
                ans = mid;
                if (isFirst) r = mid - 1;
                else l = mid + 1;
            } else if (nums[mid] < target) {
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        return ans;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (50, 'Valid Parentheses Nesting 6', '<p>Solve the classic programming challenge related to <b>Stack</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Stack.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 50', 'Output result example 50', '<p>Think about using Stack concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public boolean isValid(String s) {
        Stack<Character> stack = new Stack<>();
        for (char c : s.toCharArray()) {
            if (c == ''('' || c == ''{'' || c == ''['') {
                stack.push(c);
            } else {
                if (stack.isEmpty()) return false;
                char top = stack.pop();
                if (c == '')'' && top != ''('') return false;
                if (c == ''}'' && top != ''{'') return false;
                if (c == '']'' && top != ''['') return false;
            }
        }
        return stack.isEmpty();
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (51, 'Sliding Window Queue 6', '<p>Solve the classic programming challenge related to <b>Queue</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Queue.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 51', 'Output result example 51', '<p>Think about using Queue concepts to optimize your solution.</p>', 'PRACTICE', 'EASY', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        if (nums == null || nums.length == 0) return new int[0];
        int n = nums.length;
        int[] r = new int[n - k + 1];
        int ri = 0;
        Deque<Integer> q = new ArrayDeque<>();
        for (int i = 0; i < nums.length; i++) {
            while (!q.isEmpty() && q.peek() < i - k + 1) {
                q.poll();
            }
            while (!q.isEmpty() && nums[q.peekLast()] < nums[i]) {
                q.pollLast();
            }
            q.offer(i);
            if (i >= k - 1) {
                r[ri++] = nums[q.peek()];
            }
        }
        return r;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (52, 'Minimum Subarray Sum 6', '<p>Solve the classic programming challenge related to <b>Array</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of Array.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 52', 'Output result example 52', '<p>Think about using Array concepts to optimize your solution.</p>', 'PRACTICE', 'MEDIUM', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public int minSubArrayLen(int target, int[] nums) {
        int n = nums.length;
        int ans = Integer.MAX_VALUE;
        int left = 0, sum = 0;
        for (int i = 0; i < n; i++) {
            sum += nums[i];
            while (sum >= target) {
                ans = Math.min(ans, i + 1 - left);
                sum -= nums[left++];
            }
        }
        return ans == Integer.MAX_VALUE ? 0 : ans;
    }
}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.problems (id, title, description, input_description, output_description, constraints, example_input, example_output, hint, problem_scope, difficulty, is_active, created_by, created_at, updated_at, total_testcase, time_limit_ms, memory_limit_kb, is_public, total_submission, total_accepted, score, solutions)
VALUES (53, 'Reverse Substring 6', '<p>Solve the classic programming challenge related to <b>String</b>.</p><p>Given a structured input of size <code>N</code>, your goal is to find the optimal result conforming to the constraints.</p><p>Write an efficient algorithm to achieve this.</p>', '<p>Standard input representation of String.</p>', '<p>Optimal result according to the problem statement.</p>', '<p><code>1 <= N <= 10<sup>5</sup></code></p><p>Time limit: 2.0s</p>', 'Input data example 53', 'Output result example 53', '<p>Think about using String concepts to optimize your solution.</p>', 'PRACTICE', 'HARD', true, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2000, 128000, true, 0, 0, 100.00, 'class Solution {
    public String reverseParentheses(String s) {
        Stack<StringBuilder> stack = new Stack<>();
        StringBuilder curr = new StringBuilder();
        for (char c : s.toCharArray()) {
            if (c == ''('') {
                stack.push(curr);
                curr = new StringBuilder();
            } else if (c == '')'') {
                curr.reverse();
                curr = stack.pop().append(curr);
            } else {
                curr.append(c);
            }
        }
        return curr.toString();
    }
}')
ON CONFLICT (id) DO NOTHING;

-- 5. Insert Problem Testcases
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (1, '2 7 11 15\n9', '0 1', 1, '56e55bff-805a-4ef5-b4a9-45cae10f44de');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (1, '3 2 4\n6', '1 2', 2, 'fb747377-c42c-467a-b607-026cf50158d9');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (1, '3 3\n6', '0 1', 3, '1f75a5a6-4ce4-464b-80f0-ea95e4579369');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (2, '2 4 3\n5 6 4', '7 0 8', 1, '6b87abeb-e60a-4882-bec3-c5b4341a0c3d');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (3, 'abcabcbb', '3', 1, '30469450-9517-4df4-bd82-1efbf0ff1d4a');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (3, 'bbbbb', '1', 2, '46e7f890-a8c0-48a6-bf27-f450ff7df463');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (4, 'Test input 1 for problem 4', 'Expected output 1 for problem 4', 1, '00020c22-69d7-4150-bee0-3a97f16d86ce');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (4, 'Test input 2 for problem 4', 'Expected output 2 for problem 4', 2, 'cad6360f-7ed7-4feb-9c50-e3363116079a');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (5, 'Test input 1 for problem 5', 'Expected output 1 for problem 5', 1, '6ed1eaa8-c864-46ec-9969-138a953fa474');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (5, 'Test input 2 for problem 5', 'Expected output 2 for problem 5', 2, '10a82eaf-500b-4bd0-9aa5-8bb0f4d39748');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (6, 'Test input 1 for problem 6', 'Expected output 1 for problem 6', 1, '8ae14525-5589-41af-a4d5-a9d89ef1e622');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (6, 'Test input 2 for problem 6', 'Expected output 2 for problem 6', 2, 'a23aa821-4cfb-4022-97b5-551987149bc0');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (7, 'Test input 1 for problem 7', 'Expected output 1 for problem 7', 1, 'f2df4afe-0780-4ba5-a3ce-7920b20203fc');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (7, 'Test input 2 for problem 7', 'Expected output 2 for problem 7', 2, 'a8158fc4-cc4b-4c4e-8683-506fa2cb30ca');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (8, 'Test input 1 for problem 8', 'Expected output 1 for problem 8', 1, '725de0e0-72ff-4af9-a11f-2232748070cd');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (8, 'Test input 2 for problem 8', 'Expected output 2 for problem 8', 2, '30ff655c-6722-449d-a006-2f179100e534');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (9, 'Test input 1 for problem 9', 'Expected output 1 for problem 9', 1, '86052149-8c9e-4a41-93b4-e2b7a8b89853');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (9, 'Test input 2 for problem 9', 'Expected output 2 for problem 9', 2, '64ce7489-c645-4799-b816-f4532beb485f');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (10, 'Test input 1 for problem 10', 'Expected output 1 for problem 10', 1, 'a142a788-deff-43fb-9226-beab4305f6f3');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (10, 'Test input 2 for problem 10', 'Expected output 2 for problem 10', 2, 'bdc16804-9b3c-416f-833d-2fdf3ec7fb09');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (11, 'Test input 1 for problem 11', 'Expected output 1 for problem 11', 1, '5f6f7a17-2f06-4f71-82c4-626268fdb74b');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (11, 'Test input 2 for problem 11', 'Expected output 2 for problem 11', 2, '67ae1678-aa7a-445e-8202-2c50b4248cfa');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (12, 'Test input 1 for problem 12', 'Expected output 1 for problem 12', 1, '5f2af079-3ed9-44eb-b0f1-be7ad33bb001');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (12, 'Test input 2 for problem 12', 'Expected output 2 for problem 12', 2, '5d0e8906-bb25-4476-853c-3a2e33586954');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (13, 'Test input 1 for problem 13', 'Expected output 1 for problem 13', 1, '6ffdc93e-31d2-406a-8175-b0986a50d4f4');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (13, 'Test input 2 for problem 13', 'Expected output 2 for problem 13', 2, '243edb55-2cb6-49c9-b7af-dae29aafa70d');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (14, 'Test input 1 for problem 14', 'Expected output 1 for problem 14', 1, '2f3a7ca2-c681-494f-90b9-463264eabf4a');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (14, 'Test input 2 for problem 14', 'Expected output 2 for problem 14', 2, '417a8c1a-9976-4cd7-a78e-04555acb2927');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (15, 'Test input 1 for problem 15', 'Expected output 1 for problem 15', 1, '02be235d-0cd4-4e40-a10e-718d7fd3eecc');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (15, 'Test input 2 for problem 15', 'Expected output 2 for problem 15', 2, '418cceac-5c7c-4481-add2-34db497f399e');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (16, 'Test input 1 for problem 16', 'Expected output 1 for problem 16', 1, '79bd00aa-34b1-4f13-8079-7511282b0ab8');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (16, 'Test input 2 for problem 16', 'Expected output 2 for problem 16', 2, '1012fae8-d97a-47b6-b58c-a5b7cd6c2eae');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (17, 'Test input 1 for problem 17', 'Expected output 1 for problem 17', 1, '672d7fe9-2443-4c93-9f61-f9cec91f7ae5');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (17, 'Test input 2 for problem 17', 'Expected output 2 for problem 17', 2, 'a0ad91ff-9a90-463f-91cd-6c1852828d5e');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (18, 'Test input 1 for problem 18', 'Expected output 1 for problem 18', 1, 'eb16329d-9ff3-4bd6-96df-ceb50ba96ba5');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (18, 'Test input 2 for problem 18', 'Expected output 2 for problem 18', 2, 'c44dcf73-3f0f-431d-ae20-a659969b3b84');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (19, 'Test input 1 for problem 19', 'Expected output 1 for problem 19', 1, 'aad44f09-34f1-432d-91d8-445d9e1d06a1');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (19, 'Test input 2 for problem 19', 'Expected output 2 for problem 19', 2, 'd97fe672-836c-4ff3-a959-fbeb9fa0822a');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (20, 'Test input 1 for problem 20', 'Expected output 1 for problem 20', 1, 'c4097c1d-7347-4e6e-b0b6-dec169af1250');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (20, 'Test input 2 for problem 20', 'Expected output 2 for problem 20', 2, '8c719ffb-d090-44ca-bd4a-3957a39d50a6');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (21, 'Test input 1 for problem 21', 'Expected output 1 for problem 21', 1, '8b8c54de-b1f1-4f69-bfe7-33cc3df3ebfe');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (21, 'Test input 2 for problem 21', 'Expected output 2 for problem 21', 2, '2fa85115-8a80-4de0-a834-152081929a63');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (22, 'Test input 1 for problem 22', 'Expected output 1 for problem 22', 1, '1093ef44-8abc-4717-9802-af11482d7748');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (22, 'Test input 2 for problem 22', 'Expected output 2 for problem 22', 2, '11ef6be6-6aad-43ac-b0a4-c27ee63463a7');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (23, 'Test input 1 for problem 23', 'Expected output 1 for problem 23', 1, '018db8d0-f564-4420-a041-08a2a7c7c5d2');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (23, 'Test input 2 for problem 23', 'Expected output 2 for problem 23', 2, '7fde535e-ce90-4865-b5ed-e1f5f93d49c6');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (24, 'Test input 1 for problem 24', 'Expected output 1 for problem 24', 1, '6902f09d-a6d6-4e0c-8c7b-3005e5fe13c8');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (24, 'Test input 2 for problem 24', 'Expected output 2 for problem 24', 2, '872ec995-6456-4fb5-a9a7-7871809693ff');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (25, 'Test input 1 for problem 25', 'Expected output 1 for problem 25', 1, '733d521b-999b-4af9-acdd-f006c4248b2b');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (25, 'Test input 2 for problem 25', 'Expected output 2 for problem 25', 2, '305a747b-e3a3-4898-a92d-7587b1fad86b');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (26, 'Test input 1 for problem 26', 'Expected output 1 for problem 26', 1, '872bece6-d6e3-464c-8960-065a92bb3623');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (26, 'Test input 2 for problem 26', 'Expected output 2 for problem 26', 2, 'f5c4bcf1-821e-4d3b-b765-8edd171ba106');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (27, 'Test input 1 for problem 27', 'Expected output 1 for problem 27', 1, 'eda2bab4-fba5-462e-9c05-dcd3bbc724ee');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (27, 'Test input 2 for problem 27', 'Expected output 2 for problem 27', 2, 'd75cbd69-e4e2-4f93-9767-d0682263aaa0');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (28, 'Test input 1 for problem 28', 'Expected output 1 for problem 28', 1, '161b9079-fffd-44bc-bd45-98bb656e641f');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (28, 'Test input 2 for problem 28', 'Expected output 2 for problem 28', 2, '90d85b99-445a-4b14-a2aa-9ada76a235e4');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (29, 'Test input 1 for problem 29', 'Expected output 1 for problem 29', 1, '0629f2d5-23cf-423c-9572-90ef0451a23c');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (29, 'Test input 2 for problem 29', 'Expected output 2 for problem 29', 2, '19169f2f-e087-4f8e-817a-fe4bba2901a1');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (30, 'Test input 1 for problem 30', 'Expected output 1 for problem 30', 1, '5f33c5c8-fc0d-4443-ab67-ecdc4519edda');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (30, 'Test input 2 for problem 30', 'Expected output 2 for problem 30', 2, 'c60ac60a-698b-4432-b67e-ac04855d3699');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (31, 'Test input 1 for problem 31', 'Expected output 1 for problem 31', 1, 'dc3cc884-94e8-4c20-87a2-647d0b209f85');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (31, 'Test input 2 for problem 31', 'Expected output 2 for problem 31', 2, 'ed398300-0785-4a85-a84c-31b126a14875');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (32, 'Test input 1 for problem 32', 'Expected output 1 for problem 32', 1, 'ef9ca941-1c13-4951-851f-f4279dc1fd12');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (32, 'Test input 2 for problem 32', 'Expected output 2 for problem 32', 2, '92ebbecd-a50a-4b04-9a60-8d4365ac7ce0');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (33, 'Test input 1 for problem 33', 'Expected output 1 for problem 33', 1, '720ab83a-0073-42df-ae47-3c18f12219a9');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (33, 'Test input 2 for problem 33', 'Expected output 2 for problem 33', 2, '7e0dbee3-43f6-49d0-aec2-9f37baa6bc2d');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (34, 'Test input 1 for problem 34', 'Expected output 1 for problem 34', 1, 'b102cb65-b432-47b9-852a-2db481735266');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (34, 'Test input 2 for problem 34', 'Expected output 2 for problem 34', 2, '0a54984b-5c1d-4113-91ab-bdf0344d7bb9');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (35, 'Test input 1 for problem 35', 'Expected output 1 for problem 35', 1, '3a794c4e-4513-4a09-8807-2311ed963685');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (35, 'Test input 2 for problem 35', 'Expected output 2 for problem 35', 2, '7839b8eb-54d5-46b2-b0db-21a9f1a83fb9');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (36, 'Test input 1 for problem 36', 'Expected output 1 for problem 36', 1, '2854eb2a-9317-4c39-be5b-fe60fa7aac1c');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (36, 'Test input 2 for problem 36', 'Expected output 2 for problem 36', 2, 'd0b9cb0a-03df-48db-a7cb-c7b76d4cfdac');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (37, 'Test input 1 for problem 37', 'Expected output 1 for problem 37', 1, '4f869f57-3c3f-4d17-a0ef-ea71dc1c2808');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (37, 'Test input 2 for problem 37', 'Expected output 2 for problem 37', 2, '8562d15f-0631-4d27-adc8-a7d8721349e2');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (38, 'Test input 1 for problem 38', 'Expected output 1 for problem 38', 1, '41ef5b01-0d60-42cb-b814-9b4b19029ec2');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (38, 'Test input 2 for problem 38', 'Expected output 2 for problem 38', 2, '70b582fd-41bf-4eff-bd25-093804b49ff7');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (39, 'Test input 1 for problem 39', 'Expected output 1 for problem 39', 1, '320fb61c-28e6-4644-9220-a94e0f4a879a');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (39, 'Test input 2 for problem 39', 'Expected output 2 for problem 39', 2, '1e413131-48fc-47a6-9078-361d8fa7cda1');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (40, 'Test input 1 for problem 40', 'Expected output 1 for problem 40', 1, '1696d988-4f28-48c0-a678-4ed258b7a39e');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (40, 'Test input 2 for problem 40', 'Expected output 2 for problem 40', 2, 'c35a66c5-a269-4984-b455-7e9ff1507dcc');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (41, 'Test input 1 for problem 41', 'Expected output 1 for problem 41', 1, 'd5a40491-bb38-4a77-8813-d1c60ad25c6a');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (41, 'Test input 2 for problem 41', 'Expected output 2 for problem 41', 2, '22bdfe91-d33c-49b4-bc83-0d5147fdd391');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (42, 'Test input 1 for problem 42', 'Expected output 1 for problem 42', 1, 'cd102ace-2cf6-4a5a-af1e-0e2b8e2bdb44');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (42, 'Test input 2 for problem 42', 'Expected output 2 for problem 42', 2, '949e706c-c396-448f-801a-42d65ace6dad');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (43, 'Test input 1 for problem 43', 'Expected output 1 for problem 43', 1, 'c8bb8d05-cf0f-41d3-96ed-417714b8f7ce');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (43, 'Test input 2 for problem 43', 'Expected output 2 for problem 43', 2, '237f75e6-bb53-47ec-ba4f-c78ed581e364');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (44, 'Test input 1 for problem 44', 'Expected output 1 for problem 44', 1, 'f16b879d-c7de-42a4-954c-f047e647851a');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (44, 'Test input 2 for problem 44', 'Expected output 2 for problem 44', 2, 'e035246e-a887-4d56-a3d8-e8c679ad30f0');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (45, 'Test input 1 for problem 45', 'Expected output 1 for problem 45', 1, '9cfe22a3-d0c1-4e48-8a51-8cb0b46b84c0');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (45, 'Test input 2 for problem 45', 'Expected output 2 for problem 45', 2, 'ea955ecc-aacc-4e65-a655-728f59772949');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (46, 'Test input 1 for problem 46', 'Expected output 1 for problem 46', 1, '5bf0bdf3-7cbc-41c8-a225-f570c034a50d');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (46, 'Test input 2 for problem 46', 'Expected output 2 for problem 46', 2, 'e268c7e9-4a5d-4ecd-a448-d69ae98957f1');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (47, 'Test input 1 for problem 47', 'Expected output 1 for problem 47', 1, '4ab7083e-dea5-4078-b9c0-2df5fb213eaf');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (47, 'Test input 2 for problem 47', 'Expected output 2 for problem 47', 2, 'e5b2caa9-6727-43b0-a145-2013d2f57064');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (48, 'Test input 1 for problem 48', 'Expected output 1 for problem 48', 1, 'cdadf59a-f493-40f9-a7b9-31ff40a0c4af');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (48, 'Test input 2 for problem 48', 'Expected output 2 for problem 48', 2, '5dcc6691-e50f-489d-ad08-82640090cb20');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (49, 'Test input 1 for problem 49', 'Expected output 1 for problem 49', 1, '8d79dcf8-63cc-4f1f-9f76-672652d5ce37');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (49, 'Test input 2 for problem 49', 'Expected output 2 for problem 49', 2, '0344f0c2-d537-4698-8e55-79ee3223a169');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (50, 'Test input 1 for problem 50', 'Expected output 1 for problem 50', 1, '1f9d0da7-c060-4074-8ce3-fc2b39376230');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (50, 'Test input 2 for problem 50', 'Expected output 2 for problem 50', 2, 'ff7d8702-7cab-401d-8e0e-b5d6901fcb01');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (51, 'Test input 1 for problem 51', 'Expected output 1 for problem 51', 1, '9907a9f6-6215-42a1-94e2-edfc8e2dda56');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (51, 'Test input 2 for problem 51', 'Expected output 2 for problem 51', 2, '24e4d6b7-4d09-46e8-9844-b793e272598a');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (52, 'Test input 1 for problem 52', 'Expected output 1 for problem 52', 1, 'c071c063-d22c-43e7-b955-d1af11b02d2b');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (52, 'Test input 2 for problem 52', 'Expected output 2 for problem 52', 2, '49422936-605c-4eb4-bcf2-2aa8293a2741');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (53, 'Test input 1 for problem 53', 'Expected output 1 for problem 53', 1, '14468f64-67fc-4515-a521-1e6249d84b11');
INSERT INTO public.problem_testcases (problem_id, input_data, expected_output, order_index, token) VALUES (53, 'Test input 2 for problem 53', 'Expected output 2 for problem 53', 2, 'c0064521-94f2-4a18-812e-a15ebca975fa');

-- 6. Insert Problem Tag Mappings
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (1, 1);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (1, 3);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (2, 4);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (3, 2);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (3, 3);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (3, 5);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (4, 5);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (5, 6);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (6, 7);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (7, 8);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (8, 9);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (9, 10);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (10, 11);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (11, 12);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (12, 13);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (13, 1);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (14, 2);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (15, 3);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (16, 4);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (17, 5);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (18, 6);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (19, 7);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (20, 8);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (21, 9);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (22, 10);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (23, 11);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (24, 12);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (25, 13);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (26, 1);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (27, 2);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (28, 3);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (29, 4);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (30, 5);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (31, 6);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (32, 7);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (33, 8);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (34, 9);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (35, 10);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (36, 11);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (37, 12);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (38, 13);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (39, 1);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (40, 2);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (41, 3);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (42, 4);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (43, 5);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (44, 6);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (45, 7);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (46, 8);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (47, 9);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (48, 10);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (49, 11);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (50, 12);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (51, 13);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (52, 1);
INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (53, 2);

-- 7. Sync database sequences
SELECT setval('public.users_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.users), 1), false);
SELECT setval('public.instructors_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.instructors), 1), false);
SELECT setval('public.problem_tags_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.problem_tags), 1), false);
SELECT setval('public.problems_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.problems), 1), false);
SELECT setval('public.problem_testcases_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.problem_testcases), 1), false);
SELECT setval('public.problem_tag_mappings_id_seq', COALESCE((SELECT MAX(id)+1 FROM public.problem_tag_mappings), 1), false);
