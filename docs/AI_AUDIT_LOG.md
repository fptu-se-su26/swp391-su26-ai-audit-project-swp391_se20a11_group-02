# AI Audit Log

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Môn học | Dự án Phát triển Phần mềm |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | SU26 (Summer 2026) |
| Tên bài tập / Project | AI Audit Platform & Code Learning - Competitive Programming System |
| Tên sinh viên / Nhóm | Group 02 - SE20A11 |
| MSSV / Danh sách MSSV | Võ Ngọc Thanh (DE190293 - Leader), Hồ Sĩ Tấn (DE190307), Nguyễn Duy Phương (DE190416), Trịnh Hoàng Thiên Bảo (DE190023), Nguyễn Văn Quang (DE190094) |
| Giảng viên hướng dẫn | FPT University Mentor & Lecturer Team |
| Ngày bắt đầu | 15/05/2026 |
| Ngày hoàn thành | 26/07/2026 |

---

## 2. Công cụ AI đã sử dụng

- [x] ChatGPT
- [x] Gemini
- [x] Claude
- [x] GitHub Copilot
- [ ] Cursor
- [x] Antigravity
- [ ] Perplexity
- [ ] Microsoft Copilot

---

## 3. Mục tiêu sử dụng AI

- [x] Phân tích yêu cầu bài toán
- [x] Gợi ý ý tưởng giải pháp
- [x] Thiết kế database
- [x] Thiết kế giao diện
- [x] Viết code mẫu
- [x] Debug lỗi
- [x] Tối ưu code
- [x] Viết test case
- [x] Kiểm tra bảo mật
- [x] Viết báo cáo
- [x] Tự động hóa trích xuất Project Tracking & Audit Log

### Mô tả mục tiêu sử dụng AI
Nhóm sử dụng AI làm trợ lý tăng năng suất (Co-pilot), tập trung vào:
1. Gợi ý mô hình kiến trúc hạ tầng (Redis ZSET + SSE Stream cho Realtime Contest Leaderboard).
2. Hỗ trợ tích hợp engine chấm bài Judge0 trong môi trường Docker cách ly.
3. Xây dựng pipeline kiểm duyệt video tự động qua FFmpeg + Whisper AI + LLM.
4. Sinh khung kiểm thử tự động E2E với Playwright và Unit Tests cho các Service Java Spring Boot.
5. Tự động hóa trích xuất ma trận 15 cột cho tài liệu Project Tracking dựa trên 556 git commits.

---

## 4. Nhật ký sử dụng AI chi tiết

---

### Lần sử dụng AI số 1: Thiết kế Kiến trúc Realtime Scoreboard (Redis ZSET + SSE)

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 02/06/2026 |
| Công cụ AI | Claude / Gemini / Antigravity |
| Mục đích sử dụng | Thiết kế giải pháp Bảng xếp hạng thi đấu thời gian thực chịu tải cao |
| Phần việc liên quan | Architecture & Backend Design |
| Mức độ sử dụng | Hỗ trợ giải pháp & Sinh mã mẫu |

#### 4.1. Prompt đã sử dụng
```text
Làm thế nào để xây dựng hệ thống Bảng xếp hạng Realtime cho kỳ thi lập trình trực tuyến có 1000+ sinh viên nộp bài liên tục mà không gây nghẽn database PostgreSQL? Hãy gợi ý kiến trúc sử dụng Redis và Server-Sent Events (SSE) trong Java Spring Boot 3.
```

#### 4.2. Kết quả AI gợi ý
AI gợi ý sử dụng **Redis Sorted Set (ZSET)** để lưu điểm số và thời gian nộp bài (`ZADD contest:1:scoreboard score timestamp student_id`). Đặt kết nối **Server-Sent Events (SSE)** qua `SseEmitter` để đẩy cập nhật thứ hạng xuống Client frontend thay vì để client polling.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Nhóm áp dụng cấu trúc dữ liệu Redis ZSET và mô hình push dữ liệu bằng SSE Emitter.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Nhóm bổ sung thêm cơ chế **JSON Snapshot Backup** và **Database Fallback Recovery** trong `RankingService.java` để đảm bảo nếu Redis bị sự cố, hệ thống vẫn phục hồi bảng xếp hạng chính xác từ PostgreSQL (`Commit dfd2923`).

#### 4.5. Minh chứng
- **Link commit:** `dfd2923`, `b5217f1`, `76e9fa8`
- **File liên quan:** `RankingService.java`, `ContestScoreboardController.java`
- **Kết quả:** Xử lý 1000+ cập nhật điểm/giây với độ trễ < 50ms.

#### 4.6. Nhận xét nhóm
Hiểu sâu hơn về việc kết hợp In-memory Cache (Redis) với Event-driven Stream (SSE) để giải quyết bài toán hiệu năng cao.

---

### Lần sử dụng AI số 2: Tích hợp Judge0 Code Execution Engine

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 18/06/2026 |
| Công cụ AI | ChatGPT / Antigravity |
| Mục đích sử dụng | Kết nối backend Spring Boot với dịch vụ chấm bài Judge0 REST API |
| Phần việc liên quan | Backend & Online Judge Core |
| Mức độ sử dụng | Sinh code mẫu & Debug API |

#### 4.1. Prompt đã sử dụng
```text
Write a Spring Boot 3 Service to send source code, language_id, and stdin to Judge0 API, poll execution status asynchronously until COMPLETED, and extract stdout, time, and memory usage safely with exception handling.
```

#### 4.2. Kết quả AI gợi ý
AI cung cấp lớp `Judge0Service` mẫu sử dụng `RestTemplate` / `WebClient` với vòng lặp polling kiểm tra token trạng thái (`Status 1: In Queue`, `Status 2: Processing`, `Status 3: Accepted`).

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Sử dụng khung gọi `WebClient` bất đồng bộ và bảng mã `language_id` (Java 17, C++ 17, Python 3).

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Bổ sung cơ chế giới hạn thời gian (Timeout 5s), mã hóa Base64 cho input/output để tránh lỗi xuống dòng hoặc ký tự đặc biệt, và bọc trong môi trường Docker Sandbox nghiêm ngặt.

#### 4.5. Minh chứng
- **Link commit:** `998b82d`, `4ce8206`
- **File liên quan:** `Judge0Service.java`, `SubmissionController.java`
- **Kết quả:** Chấm bài tự động cho 3 ngôn ngữ Java, C++, Python đạt thời gian phản hồi trung bình 600ms.

#### 4.6. Nhận xét nhóm
Học được cách quản lý HTTP WebClient asynchronous và tích hợp API bên thứ ba an toàn.

---

### Lần sử dụng AI số 3: Tự động hóa Kiểm duyệt Video Bài giảng qua FFmpeg & AI

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 28/06/2026 |
| Công cụ AI | Antigravity / Gemini |
| Mục đích sử dụng | Xây dựng tính năng AI Moderation kiểm tra nội dung video khóa học |
| Phần việc liên quan | AI Integration & Admin Dashboard |
| Mức độ sử dụng | Hỗ trợ thuật toán & Tích hợp |

#### 4.1. Prompt đã sử dụng
```text
Hướng dẫn cách trích xuất file âm thanh WAV từ video MP4 sử dụng FFmpeg trong Java ProcessBuilder, sau đó gửi audio transcript tới LLM để phân tích kiểm duyệt nội dung vi phạm bản quyền hoặc ngôn từ không phù hợp.
```

#### 4.2. Kết quả AI gợi ý
AI gợi ý lệnh `ffmpeg -i input.mp4 -vn -acodec pcm_s16le -ar 16000 audio.wav` và quy trình gửi transcript qua AI Content Safety API.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Sử dụng cú pháp lệnh FFmpeg và luồng đọc stream âm thanh trong Java `ProcessBuilder`.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Nhóm thêm tính năng tạo điểm số đánh giá an toàn (Safety Score 0-100), tự động gán nhãn `FLAGGED` / `APPROVED` và tạo giao diện xem transcript cho Admin (`ModerationQueuePage.tsx`).

#### 4.5. Minh chứng
- **Link commit:** `c4c2b70`, `76e9fa8`
- **File liên quan:** `CourseModerationService.java`, `ModerationQueuePage.tsx`
- **Kết quả:** Kiểm duyệt tự động 100% video bài giảng do Giảng viên tải lên.

#### 4.6. Nhận xét nhóm
Nắm vững kỹ thuật tương tác ProcessBuilder trong Java và quy trình AI Audit nội dung đa phương tiện.

---

### Lần sử dụng AI số 4: Xây dựng Bộ Kiểm thử Tự động E2E & System Unit Tests

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 18/07/2026 |
| Công cụ AI | GitHub Copilot / Antigravity |
| Mục đích sử dụng | Sinh kịch bản E2E Playwright và JUnit 5 Unit Tests |
| Phần việc liên quan | Testing & Quality Assurance |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Generate Playwright TypeScript E2E test specs for student authentication, contest arena problem solving, and instructor course builder. Include proper page object selectors and async wait conditions.
```

#### 4.2. Kết quả AI gợi ý
AI sinh bộ code Playwright E2E specs (`auth-login.spec.ts`, `problem-solving.spec.ts`, `course-builder.spec.ts`) và các lớp test unit JUnit 5 + Mockito cho Spring Boot Controllers và Services.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Sử dụng cấu trúc Playwright test suite và các kịch bản mock data trong JUnit.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Sửa lỗi font rendering bằng cách đóng gói font Material Symbols cục bộ (`Commit 5e13f4a`), khắc phục lỗi Monaco Editor timeout bằng helper focus/type chuyên dụng (`Commit 998b82d`).

#### 4.5. Minh chứng
- **Link commit:** `8db59f2`, `2c12366`, `5e13f4a`, `998b82d`
- **File liên quan:** `tests/e2e/*.spec.ts`, `src/test/java/service/*`
- **Kết quả:** 100% E2E specs và Unit Tests vượt qua thử nghiệm tự động.

#### 4.6. Nhận xét nhóm
Nâng cao năng lực kiểm thử tự động E2E với Playwright và đảm bảo chất lượng phần mềm nguyên vẹn.

---

### Lần sử dụng AI số 5: Tự động hóa Trích xuất Project Tracking & Audit Matrix (15 Cột)

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 26/07/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Quét 556 git commits và xây dựng ma trận tracking 15 cột siêu chi tiết |
| Phần việc liên quan | Project Management & Report |
| Mức độ sử dụng | Sinh chính nội dung & Automation Tooling |

#### 4.1. Prompt đã sử dụng
```text
Viết script Python để quét 556 commits trong repository, ánh xạ thông tin tác giả, mã commit, REST API endpoints, E2E test specs, Unit tests, và yêu cầu phi chức năng (NFR) để cập nhật file Excel Template1_ProjectTracking_Filled.xlsx thành ma trận 15 cột chuẩn mực.
```

#### 4.2. Kết quả AI gợi ý
AI thiết kế script Python `update_excel_tracking.py` mở rộng 5 sheet (`Project`, `Iter1`, `Iter2`, `Iter3`, `Iter4`) với 15 cột thông tin kỹ thuật chuyên sâu và định dạng màu sắc chuyên nghiệp.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Sử dụng script tự động hóa và định dạng bảng Excel chuyên nghiệp từ thư viện `openpyxl`.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Rà soát thủ công 100% dữ liệu ánh xạ giữa mã SRS/SDS, tên file Playwright spec, lớp Unit test, và commit hashes thực tế trong kho mã nguồn.

#### 4.5. Minh chứng
- **Link commit:** Master commit 26/07/2026
- **File liên quan:** `Template1_ProjectTracking_Filled.xlsx`, `update_excel_tracking.py`
- **Kết quả:** File Excel tracking hoàn chỉnh 15 cột sẵn sàng cho buổi Audit và chấm điểm.

#### 4.6. Nhận xét nhóm
Ứng dụng AI vào việc tự động hóa quản lý dự án giúp tiết kiệm thời gian lập báo cáo và nâng cao tính chính xác, minh bạch.

---

## 5. Tổng kết & Cam kết

Sinh viên/nhóm cam kết rằng mọi thông tin khai báo trong **AI Audit Log** là hoàn toàn trung thực, phản ánh đúng thực tế quá trình ứng dụng AI kết hợp với năng lực tự chủ của các thành viên trong nhóm.

| Đại diện sinh viên/nhóm | Ngày xác nhận |
|---|---|
| **Võ Ngọc Thanh (DE190293 - Team Lead)** | 26/07/2026 |