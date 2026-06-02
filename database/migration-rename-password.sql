-- Migration Script: Rename column password to password_hash in users table
ALTER TABLE public.users RENAME COLUMN password TO password_hash;
