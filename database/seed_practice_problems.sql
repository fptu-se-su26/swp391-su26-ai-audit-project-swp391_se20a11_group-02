DO $$
DECLARE
    p_id INT;
    tag1_id INT;
    tag2_id INT;
    tag3_id INT;
    i INT;
    j INT;
    teacher_id INT;
BEGIN
    -- Get an instructor ID to associate with the problems
    SELECT id INTO teacher_id FROM public.instructors LIMIT 1;
    
    -- If no instructor is found, you might want to use a default or fallback value
    -- We assume teacher_id 1 is safe based on typical seed data, but dynamically fetching is safer.
    IF teacher_id IS NULL THEN
        teacher_id := 1; 
    END IF;

    -- Insert tags if not exists, and get their IDs. 
    SELECT id INTO tag1_id FROM public.problem_tags WHERE slug = 'practice-array';
    IF tag1_id IS NULL THEN
        INSERT INTO public.problem_tags (name, slug) VALUES ('Practice Array', 'practice-array') RETURNING id INTO tag1_id;
    END IF;

    SELECT id INTO tag2_id FROM public.problem_tags WHERE slug = 'practice-math';
    IF tag2_id IS NULL THEN
        INSERT INTO public.problem_tags (name, slug) VALUES ('Practice Math', 'practice-math') RETURNING id INTO tag2_id;
    END IF;

    SELECT id INTO tag3_id FROM public.problem_tags WHERE slug = 'practice-string';
    IF tag3_id IS NULL THEN
        INSERT INTO public.problem_tags (name, slug) VALUES ('Practice String', 'practice-string') RETURNING id INTO tag3_id;
    END IF;

    -- Loop to insert 10 problems
    FOR i IN 1..10 LOOP
        INSERT INTO public.problems (
            title, description, input_description, output_description,
            constraints, example_input, example_output, hint,
            problem_scope, difficulty, is_active, created_by_teacher_id,
            total_testcase, time_limit_ms, memory_limit_kb, is_public, score
        ) VALUES (
            'Auto Practice Problem ' || i,
            '<p>This is an auto-generated practice problem ' || i || '. Solve it optimally to improve your algorithmic skills.</p>',
            '<p>First line contains an integer N.</p>',
            '<p>Output the computed result.</p>',
            '<p>1 <= N <= 10^5</p>',
            '5\n1 2 3 4 5',
            '15',
            '<p>Try to use O(N) time complexity.</p>',
            'PRACTICE', 'EASY', true, teacher_id,
            10, 2000, 128000, true, 100.00
        ) RETURNING id INTO p_id;

        -- Map tags to the problem
        IF i % 3 = 0 THEN
            INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (p_id, tag1_id);
        ELSIF i % 3 = 1 THEN
            INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (p_id, tag2_id);
        ELSE
            INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (p_id, tag3_id);
            INSERT INTO public.problem_tag_mappings (problem_id, tag_id) VALUES (p_id, tag1_id);
        END IF;

        -- Insert 10 testcases for this problem
        FOR j IN 1..10 LOOP
            INSERT INTO public.problem_testcases (
                problem_id, input_data, expected_output, order_index
            ) VALUES (
                p_id,
                'Input for testcase ' || j || ' (Problem ' || i || ')',
                'Expected output for testcase ' || j || ' (Problem ' || i || ')',
                j
            );
        END LOOP;
    END LOOP;
END $$;
