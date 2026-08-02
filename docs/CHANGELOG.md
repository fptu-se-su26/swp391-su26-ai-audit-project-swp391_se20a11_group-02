# Changelog

## 1. Quy định ghi Changelog

File này dùng để ghi lại các thay đổi quan trọng trong quá trình thực hiện bài tập, lab, assignment hoặc project.

Nguyên tắc ghi changelog:
- Chỉ ghi những gì đã hoàn thành thật sự.
- Không ghi kế hoạch nếu chưa thực hiện.
- Mỗi thay đổi nên có ngày, nội dung, người thực hiện và minh chứng.
- Nếu có AI hỗ trợ, cần ghi rõ AI đã hỗ trợ phần nào.
- Nếu có commit GitHub, cần ghi link commit.
- Nếu có lỗi đã sửa, cần ghi rõ lỗi, nguyên nhân và cách xử lý.

---

## 2. Thông tin project

| Thông tin | Nội dung |
|---|---|
| Môn học | Dự án Phát triển Phần mềm |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | SU26 (Summer 2026) |
| Tên bài tập / Project | AI Audit Platform & Code Learning - Competitive Programming System |
| Tên sinh viên / Nhóm | Group 02 - SE20A11 |
| MSSV / Danh sách MSSV | Võ Ngọc Thanh (DE190293 - Leader), Hồ Sĩ Tấn (DE190307), Nguyễn Duy Phương (DE190416 - Realtime Contest Lead), Trịnh Hoàng Thiên Bảo (DE190023 - AI & Admin Lead), Nguyễn Văn Quang (DE190094 - DB Architecture & Financial Lead) |
| Giảng viên hướng dẫn | FPT University Mentor & Lecturer Team |
| Repository URL | https://github.com/fptu-se-su26/swp391-su26-ai-audit-project-swp391_se20a11_group-02 |
| Ngày bắt đầu | 15/05/2026 |
| Ngày hoàn thành | 26/07/2026 |

---

## 3. Tổng quan các phiên bản/giai đoạn

| Phiên bản/Giai đoạn | Thời gian | Nội dung chính | Trạng thái |
|---|---|---|---|
| Phase 01 | 15/05/2026 - 20/05/2026 | Khởi tạo project, cấu trúc repository, PostgreSQL, Redis | Completed |
| Phase 02 | 21/05/2026 - 30/05/2026 | Phân tích yêu cầu, SRS/SDS matrix, use case specification | Completed |
| Phase 03 | 31/05/2026 - 10/06/2026 | Thiết kế hệ thống, ERD, Security OAuth2 JWT flow, API specs | Completed |
| Phase 04 | 11/06/2026 - 15/07/2026 | Implementation (Backend Java Spring Boot 3, Frontend React Vite, Judge0, FFmpeg, AI) | Completed |
| Phase 05 | 16/07/2026 - 24/07/2026 | Testing & Debug (Playwright E2E Test Suite & Full System Unit Tests) | Completed |
| Phase 06 | 25/07/2026 - 26/07/2026 | Hoàn thiện báo cáo, Project Tracking Matrix 15 cột, AI Audit Log & Demo | Completed |

---

# [Phase 04] Implementation - Chi tiết đóng góp của các thành viên

## 1. Nguyễn Văn Quang (DE190094 - DB Architecture & Financial Lead)
- **PostgreSQL Database Schema & Relational Model (`Iter1`):** Thiết kế schema cơ sở dữ liệu PostgreSQL (`init.sql`), JPA Entity mappings, B-Tree indexes và Isolation level `REPEATABLE_READ`.
- **Instructor Revenue Analytics Dashboard (`Iter2`):** Kết nối dữ liệu doanh thu thực tế từ DB, tính toán Gross/Net revenue, hỗ trợ chọn mốc thời gian 6/12 tháng, căn chỉnh lưới tọa độ SVG chart động (`Commit 6da05b2`, `285bdb8`).
- **Platform Financial Reports & Metrics (`Iter2`):** Báo cáo tài chính toàn hệ thống cho Admin, lịch sử giao dịch và payout logs (`Commit 3b2e60f`, `33f57a6`).
- **Admin System Overview & Database Metrics (`Iter3`):** Dashboard giám sát sức khỏe DB, đếm số học viên, khóa học, và lượt nộp bài (`Commit 6b8b6f0`, `536da33`).
- **Admin Problem Management & Testcase Builder (`Iter3`):** Giao diện Admin quản lý bài tập, tạo bộ testcase Sample & Hidden (`Commit 9c39a98`, `434df81`).
- **Problem Versioning & History Audit Trail (`Iter4`):** Quản lý phiên bản bài tập, diffing JSON lịch sử chỉnh sửa và khôi phục an toàn (`Commit 3c4c480`, `47b31bf`).

## 2. Nguyễn Duy Phương (DE190416 - Realtime Contest Lead)
- **Contest Directory & Spotlight Banner (`Iter2`):** Danh sách kỳ thi, lọc trạng thái, banner spotlight động và khóa đăng ký mật khẩu Argon2id (`Commit 12ad54d`, `0349342`).
- **Contest Arena Problem Workspace (`Iter3`):** Giao diện thi đấu phòng thi đếm ngược thời gian thực, chế độ anti-cheat (`Commit 72086d9`, `e69b5e7`).
- **ICPC Live Scoreboard & Ranking Stream (`Iter3`):** Bảng xếp hạng thời gian thực với Redis ZSET + SSE Stream + JSON Snapshot DB Fallback (`Commit 774ca94`, `dfd2923`).
- **Dynamic Contest Status Engine (`Iter3`):** Đánh giá trạng thái kỳ thi động tại Runtime (`UPCOMING`, `ONGOING`, `ENDED`) (`Commit 2e3576f`, `8924b41`).
- **Admin Contest Management & Soft Delete (`Iter4`):** Admin CRUD kỳ thi, xóa mềm an toàn, chuyển scope bài tập về PRACTICE (`Commit c05c6e5`, `0520a14`).
- **Idempotent Contest Finalization Scheduler (`Iter4`):** Tiến trình ngầm chốt giải đấu tự động và kiểm tra Idempotency giao dịch tiền thưởng (`Commit c270241`, `b5217f1`).

---

# 4. Cam kết cập nhật Changelog

| Đại diện sinh viên/nhóm | Ngày xác nhận |
|---|---|
| **Võ Ngọc Thanh (DE190293 - Team Lead)** | 26/07/2026 |
| **Nguyễn Văn Quang (DE190094 - DB Architecture & Financial Lead)** | 26/07/2026 |
| **Nguyễn Duy Phương (DE190416 - Realtime Contest Lead)** | 26/07/2026 |