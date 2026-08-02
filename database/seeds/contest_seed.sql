-- Contest module seed data for local/dev testing.
-- Usage from repository root:
--   docker exec -i nonstopcoding_db psql -U postgres -d NonstopCoding < database/contest_seed.sql
--
-- Test accounts created by this file:
--   seed_admin / password
--   contest_alice / password
--   contest_bob / password
--   contest_charlie / password
--
-- The password hash below is bcrypt for the plain text password: password

BEGIN;

DO $$
DECLARE
    seed_password_hash TEXT := '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy';
    admin_role_id INTEGER;
    user_role_id INTEGER;
    seed_admin_id INTEGER;
    alice_id INTEGER;
    bob_id INTEGER;
    charlie_id INTEGER;
    two_sum_problem_id INTEGER;
    prefix_problem_id INTEGER;
    graph_problem_id INTEGER;
    two_sum_version_id INTEGER;
    prefix_version_id INTEGER;
    graph_version_id INTEGER;
    ongoing_contest_id INTEGER;
    upcoming_contest_id INTEGER;
    ended_contest_id INTEGER;
    draft_contest_id INTEGER;
BEGIN
    SELECT id INTO admin_role_id FROM public.roles WHERE name = 'ADMIN' LIMIT 1;
    IF admin_role_id IS NULL THEN
        INSERT INTO public.roles (name) VALUES ('ADMIN') RETURNING id INTO admin_role_id;
    END IF;

    SELECT id INTO user_role_id FROM public.roles WHERE name = 'USER' LIMIT 1;
    IF user_role_id IS NULL THEN
        INSERT INTO public.roles (name) VALUES ('USER') RETURNING id INTO user_role_id;
    END IF;

    INSERT INTO public.users (username, password_hash, displayname, email, created_at, status, score)
    VALUES ('seed_admin', seed_password_hash, 'Seed Admin', 'seed.admin@example.com', now(), 'ACTIVE', 999)
    ON CONFLICT (username) DO UPDATE SET
        password_hash = EXCLUDED.password_hash,
        displayname = EXCLUDED.displayname,
        status = 'ACTIVE'
    RETURNING id INTO seed_admin_id;

    INSERT INTO public.user_roles (user_id, role_id)
    VALUES (seed_admin_id, admin_role_id)
    ON CONFLICT DO NOTHING;

    INSERT INTO public.users (username, password_hash, displayname, email, created_at, status, score)
    VALUES ('contest_alice', seed_password_hash, 'Contest Alice', 'contest.alice@example.com', now(), 'ACTIVE', 320)
    ON CONFLICT (username) DO UPDATE SET
        password_hash = EXCLUDED.password_hash,
        displayname = EXCLUDED.displayname,
        status = 'ACTIVE',
        score = EXCLUDED.score
    RETURNING id INTO alice_id;

    INSERT INTO public.user_roles (user_id, role_id)
    VALUES (alice_id, user_role_id)
    ON CONFLICT DO NOTHING;

    INSERT INTO public.users (username, password_hash, displayname, email, created_at, status, score)
    VALUES ('contest_bob', seed_password_hash, 'Contest Bob', 'contest.bob@example.com', now(), 'ACTIVE', 210)
    ON CONFLICT (username) DO UPDATE SET
        password_hash = EXCLUDED.password_hash,
        displayname = EXCLUDED.displayname,
        status = 'ACTIVE',
        score = EXCLUDED.score
    RETURNING id INTO bob_id;

    INSERT INTO public.user_roles (user_id, role_id)
    VALUES (bob_id, user_role_id)
    ON CONFLICT DO NOTHING;

    INSERT INTO public.users (username, password_hash, displayname, email, created_at, status, score)
    VALUES ('contest_charlie', seed_password_hash, 'Contest Charlie', 'contest.charlie@example.com', now(), 'ACTIVE', 80)
    ON CONFLICT (username) DO UPDATE SET
        password_hash = EXCLUDED.password_hash,
        displayname = EXCLUDED.displayname,
        status = 'ACTIVE',
        score = EXCLUDED.score
    RETURNING id INTO charlie_id;

    INSERT INTO public.user_roles (user_id, role_id)
    VALUES (charlie_id, user_role_id)
    ON CONFLICT DO NOTHING;

    IF NOT EXISTS (SELECT 1 FROM public.contest WHERE title = 'Seed Ongoing Arena') THEN
        INSERT INTO public.problems (created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope)
        VALUES (seed_admin_id, true, false, 100.00, 2, 3, 2, now(), now(), 'CONTEST')
        RETURNING id INTO two_sum_problem_id;

        INSERT INTO public.problem_versions (problem_id, version_number, title, description, input_description, output_description, constraints, example_input, example_output, problem_scope, difficulty, time_limit_ms, memory_limit_kb, is_public, is_active, solutions, starter_templates, created_at)
        VALUES (
            two_sum_problem_id,
            1,
            'Seed A - Two Sum Warmup',
            'Given n integers and a target value, print YES if any two numbers sum to target. Otherwise print NO.',
            'First line contains n and target. Second line contains n integers.',
            'Print YES or NO.',
            '2 <= n <= 200000',
            E'5 9\n2 7 11 15 1',
            'YES',
            'CONTEST',
            'EASY',
            2000,
            128000,
            false,
            true,
            'Reference solution intentionally omitted in seed data.',
            '{"java":"import java.io.*;\nimport java.util.*;\npublic class Main { public static void main(String[] args) throws Exception { } }"}',
            now()
        ) RETURNING id INTO two_sum_version_id;

        INSERT INTO public.problem_testcases (problem_version_id, input_data, expected_output, order_index, token) VALUES
            (two_sum_version_id, E'5 9\n2 7 11 15 1', 'YES', 0, 'seed-token-two-sum-0'),
            (two_sum_version_id, E'4 100\n1 2 3 4', 'NO', 1, 'seed-token-two-sum-1');

        INSERT INTO public.problems (created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope)
        VALUES (seed_admin_id, true, false, 100.00, 1, 2, 2, now(), now(), 'CONTEST')
        RETURNING id INTO prefix_problem_id;

        INSERT INTO public.problem_versions (problem_id, version_number, title, description, input_description, output_description, constraints, example_input, example_output, problem_scope, difficulty, time_limit_ms, memory_limit_kb, is_public, is_active, solutions, starter_templates, created_at)
        VALUES (
            prefix_problem_id,
            1,
            'Seed B - Prefix Sums',
            'Answer range sum queries on a static array.',
            'First line contains n and q. Second line contains n integers. Next q lines contain l r.',
            'Print each query result on its own line.',
            '1 <= n, q <= 100000',
            E'5 3\n1 2 3 4 5\n1 3\n2 5\n4 4',
            E'6\n14\n4',
            'CONTEST',
            'MEDIUM',
            2000,
            128000,
            false,
            true,
            'Reference solution intentionally omitted in seed data.',
            '{"java":"import java.io.*;\nimport java.util.*;\npublic class Main { public static void main(String[] args) throws Exception { } }"}',
            now()
        ) RETURNING id INTO prefix_version_id;

        INSERT INTO public.problem_testcases (problem_version_id, input_data, expected_output, order_index, token) VALUES
            (prefix_version_id, E'5 3\n1 2 3 4 5\n1 3\n2 5\n4 4', E'6\n14\n4', 0, 'seed-token-prefix-0'),
            (prefix_version_id, E'3 1\n10 20 30\n1 3', '60', 1, 'seed-token-prefix-1');

        INSERT INTO public.problems (created_by, is_active, is_public, score, total_accepted, total_submission, total_testcase, created_at, updated_at, problem_scope)
        VALUES (seed_admin_id, true, false, 100.00, 0, 1, 2, now(), now(), 'CONTEST')
        RETURNING id INTO graph_problem_id;

        INSERT INTO public.problem_versions (problem_id, version_number, title, description, input_description, output_description, constraints, example_input, example_output, problem_scope, difficulty, time_limit_ms, memory_limit_kb, is_public, is_active, solutions, starter_templates, created_at)
        VALUES (
            graph_problem_id,
            1,
            'Seed C - Shortest Path',
            'Find the shortest distance from node 1 to node n in an unweighted graph.',
            'First line contains n and m. Next m lines contain undirected edges u v.',
            'Print the shortest distance, or -1 if unreachable.',
            '1 <= n <= 100000',
            E'4 4\n1 2\n2 3\n3 4\n1 4',
            '1',
            'CONTEST',
            'HARD',
            2000,
            128000,
            false,
            true,
            'Reference solution intentionally omitted in seed data.',
            '{"java":"import java.io.*;\nimport java.util.*;\npublic class Main { public static void main(String[] args) throws Exception { } }"}',
            now()
        ) RETURNING id INTO graph_version_id;

        INSERT INTO public.problem_testcases (problem_version_id, input_data, expected_output, order_index, token) VALUES
            (graph_version_id, E'4 4\n1 2\n2 3\n3 4\n1 4', '1', 0, 'seed-token-graph-0'),
            (graph_version_id, E'4 2\n1 2\n3 4', '-1', 1, 'seed-token-graph-1');

        INSERT INTO public.contest (created_by, durations, created_at, end_time, start_time, updated_at, description, password_hash, scoring_rule, status, title)
        VALUES (seed_admin_id, 240, now(), now() + interval '3 hours', now() - interval '1 hour', now(), 'Ongoing contest for testing registration checks, admin bypass, submissions, and ranking.', null, 'ICPC', 'PUBLISHED', 'Seed Ongoing Arena')
        RETURNING id INTO ongoing_contest_id;

        INSERT INTO public.contest (created_by, durations, created_at, end_time, start_time, updated_at, description, password_hash, scoring_rule, status, title)
        VALUES (seed_admin_id, 180, now(), now() + interval '4 hours', now() + interval '2 hours', now(), 'Upcoming contest for testing locked problem access before start time.', null, 'ICPC', 'PUBLISHED', 'Seed Upcoming Arena')
        RETURNING id INTO upcoming_contest_id;

        INSERT INTO public.contest (created_by, durations, created_at, end_time, start_time, updated_at, description, password_hash, scoring_rule, status, title)
        VALUES (seed_admin_id, 120, now(), now() - interval '6 hours', now() - interval '7 hours', now(), 'Ended contest for testing read-only review and historical submissions.', null, 'ICPC', 'PUBLISHED', 'Seed Ended Arena')
        RETURNING id INTO ended_contest_id;

        INSERT INTO public.contest (created_by, durations, created_at, end_time, start_time, updated_at, description, password_hash, scoring_rule, status, title)
        VALUES (seed_admin_id, 120, now(), now() + interval '6 hours', now() + interval '5 hours', now(), 'Draft contest for admin list and status filter testing.', null, 'ICPC', 'DRAFT', 'Seed Draft Arena')
        RETURNING id INTO draft_contest_id;

        INSERT INTO public.contest_problems (contest_id, problem_id, problem_version_id, order_index) VALUES
            (ongoing_contest_id, two_sum_problem_id, two_sum_version_id, 0),
            (ongoing_contest_id, prefix_problem_id, prefix_version_id, 1),
            (ongoing_contest_id, graph_problem_id, graph_version_id, 2),
            (upcoming_contest_id, two_sum_problem_id, two_sum_version_id, 0),
            (upcoming_contest_id, prefix_problem_id, prefix_version_id, 1),
            (ended_contest_id, two_sum_problem_id, two_sum_version_id, 0),
            (ended_contest_id, graph_problem_id, graph_version_id, 1),
            (draft_contest_id, two_sum_problem_id, two_sum_version_id, 0);

        INSERT INTO public.contest_participants (contest_id, user_id, joined_at) VALUES
            (ongoing_contest_id, alice_id, now()),
            (ongoing_contest_id, bob_id, now()),
            (ended_contest_id, alice_id, now()),
            (ended_contest_id, bob_id, now());

        INSERT INTO public.problem_submissions (contest_id, execution_time, is_plagiarized, language_id, memory_used, problem_id, problem_version_id, score, user_id, submitted_at, source_code, verdict) VALUES
            (ongoing_contest_id, 75, false, 62, 10240, two_sum_problem_id, two_sum_version_id, 100.00, alice_id, now() - interval '35 minutes', 'public class Main { public static void main(String[] args) { System.out.println("YES"); } }', 'ACCEPTED'),
            (ongoing_contest_id, 60, false, 62, 9340, prefix_problem_id, prefix_version_id, 0.00, alice_id, now() - interval '20 minutes', 'public class Main { public static void main(String[] args) { System.out.println("0"); } }', 'WRONG_ANSWER'),
            (ongoing_contest_id, 98, false, 62, 11200, two_sum_problem_id, two_sum_version_id, 100.00, bob_id, now() - interval '12 minutes', 'public class Main { public static void main(String[] args) { System.out.println("YES"); } }', 'ACCEPTED'),
            (ended_contest_id, 70, false, 62, 9000, two_sum_problem_id, two_sum_version_id, 100.00, alice_id, now() - interval '7 hours', 'public class Main { public static void main(String[] args) { System.out.println("YES"); } }', 'ACCEPTED'),
            (ended_contest_id, 2000, false, 62, 128000, graph_problem_id, graph_version_id, 20.00, bob_id, now() - interval '7 hours', 'public class Main { public static void main(String[] args) { while(true){} } }', 'TIME_LIMIT_EXCEEDED');

        INSERT INTO public.contest_rankings (contest_id, user_id, problems_solved, total_penalty, updated_at) VALUES
            (ongoing_contest_id, alice_id, 1, 35, now()),
            (ongoing_contest_id, bob_id, 1, 48, now()),
            (ended_contest_id, alice_id, 1, 25, now()),
            (ended_contest_id, bob_id, 0, 0, now());
    END IF;
END $$;

COMMIT;

SELECT c.id,
       c.title,
       c.status,
       c.start_time,
       c.end_time,
       (SELECT COUNT(*) FROM public.contest_problems cp WHERE cp.contest_id = c.id) AS problems,
       (SELECT COUNT(*) FROM public.contest_participants p WHERE p.contest_id = c.id) AS participants,
       (SELECT COUNT(*) FROM public.problem_submissions s WHERE s.contest_id = c.id) AS submissions
FROM public.contest c
WHERE c.title LIKE 'Seed % Arena'
ORDER BY c.id;
