-- ============================================================
-- SEED: Sample Instructor Users + Instructor Profiles
-- ============================================================

-- Step 1: Insert sample users (password hash = bcrypt of "password123")
INSERT INTO users (username, password_hash, displayname, email, status, created_at)
VALUES
  ('dr.jenkins',   '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lXWO', 'Dr. Jenkins',   'dr.jenkins@nonstopcoding.edu',   'ACTIVE', NOW()),
  ('alice.miller', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lXWO', 'Alice Miller',  'alice.miller@nonstopcoding.edu', 'ACTIVE', NOW()),
  ('john.doe',     '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lXWO', 'John Doe',      'john.doe@nonstopcoding.edu',    'ACTIVE', NOW()),
  ('sarah.connor', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lXWO', 'Sarah Connor',  'sarah.connor@nonstopcoding.edu','ACTIVE', NOW())
ON CONFLICT (username) DO NOTHING;

-- Step 2: Assign INSTRUCTOR role (role_id=3) to those new users
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, 3 FROM users u
WHERE u.username IN ('dr.jenkins', 'alice.miller', 'john.doe', 'sarah.connor')
ON CONFLICT DO NOTHING;

-- Step 3: Insert Instructor profiles linked to those users
INSERT INTO instructors (user_id, full_name, major, bio, status, hired_by_admin, created_at)
SELECT u.id,
       CASE u.username
         WHEN 'dr.jenkins'   THEN 'Dr. Jenkins'
         WHEN 'alice.miller' THEN 'Alice Miller'
         WHEN 'john.doe'     THEN 'John Doe'
         WHEN 'sarah.connor' THEN 'Sarah Connor'
       END,
       CASE u.username
         WHEN 'dr.jenkins'   THEN 'Full-Stack Web Development'
         WHEN 'alice.miller' THEN 'Java & Algorithms'
         WHEN 'john.doe'     THEN 'Go & Cloud Engineering'
         WHEN 'sarah.connor' THEN 'Data Science & AI'
       END,
       CASE u.username
         WHEN 'dr.jenkins'   THEN 'Senior Full-Stack Engineer with 10+ years of experience in React and Node.js. Former Tech Lead at large tech company.'
         WHEN 'alice.miller' THEN 'Core Java developer specializing in algorithms and competitive programming. Helped 500+ students ace coding interviews.'
         WHEN 'john.doe'     THEN 'Golang microservices architect. Designed distributed systems handling millions of requests per day.'
         WHEN 'sarah.connor' THEN 'ML researcher and data scientist. Published 3 papers on neural network optimization. 8 years in AI field.'
       END,
       'ACTIVE',
       true,
       NOW()
FROM users u
WHERE u.username IN ('dr.jenkins', 'alice.miller', 'john.doe', 'sarah.connor')
ON CONFLICT (user_id) DO NOTHING;

-- Step 4: Verify results
SELECT i.id, i.full_name, i.major, i.status, u.username
FROM instructors i
JOIN users u ON i.user_id = u.id
ORDER BY i.id;
