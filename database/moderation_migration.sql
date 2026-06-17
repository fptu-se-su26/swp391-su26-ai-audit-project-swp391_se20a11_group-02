-- SQL Migration: Tạo bảng lưu kết quả kiểm duyệt khóa học của AI
CREATE TABLE IF NOT EXISTS public.course_moderation_reports (
    id SERIAL PRIMARY KEY,
    course_id BIGINT NOT NULL UNIQUE,
    quality_score NUMERIC(3, 2) NOT NULL,
    risk_score NUMERIC(3, 2) NOT NULL,
    confidence_score NUMERIC(3, 2) NOT NULL,
    needs_admin_review BOOLEAN DEFAULT FALSE NOT NULL,
    reasons TEXT NOT NULL,
    error_log TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_moderation_course FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE
);

-- Bảng phụ tự sinh từ JPA ElementCollection để lưu danh sách các category bị gắn cờ vi phạm
CREATE TABLE IF NOT EXISTS public.course_moderation_flagged_categories (
    report_id INTEGER NOT NULL,
    category CHARACTER VARYING(255) NOT NULL,
    CONSTRAINT fk_flagged_categories_report FOREIGN KEY (report_id) REFERENCES public.course_moderation_reports(id) ON DELETE CASCADE
);

-- Kích hoạt extension pgvector
CREATE EXTENSION IF NOT EXISTS vector;

-- Bảng lưu trữ vector embeddings (768 chiều tương thích với Gemini text-embedding-004)
CREATE TABLE IF NOT EXISTS public.course_embeddings (
    course_id BIGINT PRIMARY KEY,
    embedding vector(768) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_embedding_course FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE
);

