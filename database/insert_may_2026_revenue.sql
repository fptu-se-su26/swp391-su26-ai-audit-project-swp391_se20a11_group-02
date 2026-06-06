-- ==========================================
-- SCRIPT: insert_may_2026_revenue.sql
-- PURPOSE: Insert test revenue data for May 2026
-- CONSTRAINTS: user_id = 2, courses 1-10, auto-increment IDs
-- ==========================================

BEGIN;

-- Order 1: Course ID 1 (Price: 299,000 VND) on 2026-05-05
WITH new_order AS (
    INSERT INTO public.orders (user_id, total_amount, status, created_at, updated_at)
    VALUES (2, 299000.00, 'COMPLETED', '2026-05-05 10:00:00+00', '2026-05-05 10:00:00+00')
    RETURNING id
),
new_order_item AS (
    INSERT INTO public.order_items (order_id, course_id, price)
    SELECT id, 1, 299000.00 FROM new_order
    RETURNING order_id
)
INSERT INTO public.wallet_transactions (wallet_id, amount, type, status, created_at, order_id)
SELECT 
    (SELECT id FROM public.wallets WHERE user_id = 2), 
    299000.00, 
    'BUY_COURSE', 
    'SUCCESS', 
    '2026-05-05 10:00:00+00', 
    id
FROM new_order;

INSERT INTO public.enrollments (user_id, course_id, enrolled_at, status)
VALUES (2, 1, '2026-05-05 10:00:00+00', 'ACTIVE');


-- Order 2: Course ID 3 (Price: 499,000 VND) on 2026-05-12
WITH new_order AS (
    INSERT INTO public.orders (user_id, total_amount, status, created_at, updated_at)
    VALUES (2, 499000.00, 'COMPLETED', '2026-05-12 14:30:00+00', '2026-05-12 14:30:00+00')
    RETURNING id
),
new_order_item AS (
    INSERT INTO public.order_items (order_id, course_id, price)
    SELECT id, 3, 499000.00 FROM new_order
    RETURNING order_id
)
INSERT INTO public.wallet_transactions (wallet_id, amount, type, status, created_at, order_id)
SELECT 
    (SELECT id FROM public.wallets WHERE user_id = 2), 
    499000.00, 
    'BUY_COURSE', 
    'SUCCESS', 
    '2026-05-12 14:30:00+00', 
    id
FROM new_order;

INSERT INTO public.enrollments (user_id, course_id, enrolled_at, status)
VALUES (2, 3, '2026-05-12 14:30:00+00', 'ACTIVE');


-- Order 3: Course ID 5 (Price: 999,000 VND) on 2026-05-19
WITH new_order AS (
    INSERT INTO public.orders (user_id, total_amount, status, created_at, updated_at)
    VALUES (2, 999000.00, 'COMPLETED', '2026-05-19 09:15:00+00', '2026-05-19 09:15:00+00')
    RETURNING id
),
new_order_item AS (
    INSERT INTO public.order_items (order_id, course_id, price)
    SELECT id, 5, 999000.00 FROM new_order
    RETURNING order_id
)
INSERT INTO public.wallet_transactions (wallet_id, amount, type, status, created_at, order_id)
SELECT 
    (SELECT id FROM public.wallets WHERE user_id = 2), 
    999000.00, 
    'BUY_COURSE', 
    'SUCCESS', 
    '2026-05-19 09:15:00+00', 
    id
FROM new_order;

INSERT INTO public.enrollments (user_id, course_id, enrolled_at, status)
VALUES (2, 5, '2026-05-19 09:15:00+00', 'ACTIVE');


-- Order 4: Course ID 7 (Price: 1,199,000 VND) on 2026-05-24
WITH new_order AS (
    INSERT INTO public.orders (user_id, total_amount, status, created_at, updated_at)
    VALUES (2, 1199000.00, 'COMPLETED', '2026-05-24 16:45:00+00', '2026-05-24 16:45:00+00')
    RETURNING id
),
new_order_item AS (
    INSERT INTO public.order_items (order_id, course_id, price)
    SELECT id, 7, 1199000.00 FROM new_order
    RETURNING order_id
)
INSERT INTO public.wallet_transactions (wallet_id, amount, type, status, created_at, order_id)
SELECT 
    (SELECT id FROM public.wallets WHERE user_id = 2), 
    1199000.00, 
    'BUY_COURSE', 
    'SUCCESS', 
    '2026-05-24 16:45:00+00', 
    id
FROM new_order;

INSERT INTO public.enrollments (user_id, course_id, enrolled_at, status)
VALUES (2, 7, '2026-05-24 16:45:00+00', 'ACTIVE');


-- Order 5: Course ID 10 (Price: 1,399,000 VND) on 2026-05-29
WITH new_order AS (
    INSERT INTO public.orders (user_id, total_amount, status, created_at, updated_at)
    VALUES (2, 1399000.00, 'COMPLETED', '2026-05-29 11:20:00+00', '2026-05-29 11:20:00+00')
    RETURNING id
),
new_order_item AS (
    INSERT INTO public.order_items (order_id, course_id, price)
    SELECT id, 10, 1399000.00 FROM new_order
    RETURNING order_id
)
INSERT INTO public.wallet_transactions (wallet_id, amount, type, status, created_at, order_id)
SELECT 
    (SELECT id FROM public.wallets WHERE user_id = 2), 
    1399000.00, 
    'BUY_COURSE', 
    'SUCCESS', 
    '2026-05-29 11:20:00+00', 
    id
FROM new_order;

INSERT INTO public.enrollments (user_id, course_id, enrolled_at, status)
VALUES (2, 10, '2026-05-29 11:20:00+00', 'ACTIVE');


-- Update total_enrolled counters in courses table
UPDATE public.courses SET total_enrolled = (SELECT COUNT(*) FROM public.enrollments WHERE course_id = 1) WHERE id = 1;
UPDATE public.courses SET total_enrolled = (SELECT COUNT(*) FROM public.enrollments WHERE course_id = 3) WHERE id = 3;
UPDATE public.courses SET total_enrolled = (SELECT COUNT(*) FROM public.enrollments WHERE course_id = 5) WHERE id = 5;
UPDATE public.courses SET total_enrolled = (SELECT COUNT(*) FROM public.enrollments WHERE course_id = 7) WHERE id = 7;
UPDATE public.courses SET total_enrolled = (SELECT COUNT(*) FROM public.enrollments WHERE course_id = 10) WHERE id = 10;

COMMIT;
