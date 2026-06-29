# AI Audit Log

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Môn học | Software Development Project |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | SUMMER 2026 |
| Tên bài tập / Project | Integrated Coding Education & Competitive Programming Platform |
| Tên sinh viên / Nhóm | Hồ Sĩ Tấn - Group 2 |
| MSSV / Danh sách MSSV | DE190307 |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang |
| Ngày bắt đầu | 2026-05-11 |
| Ngày hoàn thành | 2026-05-18 |

---

## 2. Công cụ AI đã sử dụng

Đánh dấu các công cụ AI đã sử dụng trong quá trình thực hiện bài tập/project.

- [x] ChatGPT
- [x] Gemini
- [ ] Claude
- [x] GitHub Copilot
- [ ] Cursor
- [ ] Antigravity
- [ ] Perplexity
- [ ] Microsoft Copilot
- [ ] Công cụ khác: ....................................

---

## 3. Mục tiêu sử dụng AI

Mô tả ngắn gọn sinh viên/nhóm đã sử dụng AI để hỗ trợ những công việc nào.

### Mô tả mục tiêu sử dụng AI

```text
Sử dụng AI để hỗ trợ thiết kế Database Schema (ERD) cho các thực thể cốt lõi, tìm hiểu và tích hợp JWT cho hệ thống xác thực của Spring Security. Ngoài ra, tôi dùng AI để lên khung giao diện React bằng Tailwind CSS và hỗ trợ viết các câu truy vấn SQL phức tạp (Window Functions) để tối ưu bảng xếp hạng (Leaderboard) theo thời gian thực.
```

---

## 4. Nhật ký sử dụng AI chi tiết

> Mỗi lần sử dụng AI cho một phần quan trọng của bài tập/project, sinh viên cần ghi lại theo mẫu bên dưới.  
> Sinh viên/nhóm có thể nhân bản mẫu “Lần sử dụng AI” nhiều lần tùy theo số lần sử dụng AI thực tế.

---

### Lần sử dụng AI số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-12 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Thiết kế các thực thể cơ sở dữ liệu cốt lõi |
| Phân việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang làm một nền tảng thi đấu lập trình bằng Spring Boot và MySQL. Hãy gợi ý thiết kế các bảng cơ sở dữ liệu (Database Schema) chính bao gồm: User, Problem, Submission, Contest và Contest_User. Mối quan hệ giữa chúng là gì? Hãy thiết kế để tối ưu cho việc truy vấn kết quả.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất cấu trúc 5 bảng chính kèm theo các khóa chính (PK) và khóa ngoại (FK). AI gợi ý thêm bảng `Testcase` liên kết 1-N với `Problem` và bảng `Submission` có cột lưu thời gian chạy (runtime) và bộ nhớ (memory).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng cấu trúc cơ bản và các mối quan hệ 1-N (Problem-Testcase, User-Submission) để tạo khung cho ERD.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tự vẽ lại bằng công cụ dbdiagram.io và đổi kiểu dữ liệu ID của bảng User và Submission từ INT tự tăng thành UUID để tránh bị cào dữ liệu (scraping). Thêm các cột audit (created_at, updated_at).
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | database/init.sql |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp tôi định hình nhanh chóng cấu trúc dữ liệu, tránh bỏ sót các bảng liên kết quan trọng như Testcase hay Contest_User.
```

---

### Lần sử dụng AI số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-14 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Cấu hình bảo mật JWT trong Spring Boot 3.x |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Làm thế nào để cài đặt xác thực và phân quyền bằng JWT trong Spring Boot 3.x cho hệ thống có 3 role: ADMIN, TEACHER và STUDENT? Hãy đưa ra các class cấu hình cơ bản (SecurityFilterChain, JwtFilter, JwtUtil).
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini cung cấp mã nguồn cho các lớp `SecurityConfig`, `JwtAuthenticationFilter`, `JwtService`. AI giải thích cách sử dụng `OncePerRequestFilter` để parse token từ Header Authorization.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tái sử dụng class `JwtAuthenticationFilter` và phương thức tạo/validate token bằng thư viện jjwt.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tự cấu hình lại `SecurityFilterChain` vì AI sinh ra code của bản Spring Boot cũ (bị deprecate method antMatchers). Đồng thời, tôi thiết kế thêm cơ chế Refresh Token lưu trữ trong database để nâng cao bảo mật.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | SecurityConfig.java, JwtFilter.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI cung cấp bộ khung security nhanh chóng nhưng vẫn cần có kiến thức nền tảng để cập nhật code theo version Spring Boot mới nhất.
```

---

### Lần sử dụng AI số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-16 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Tạo khung giao diện trang danh sách bài tập lập trình |
| Phân việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Viết giúp tôi một component React sử dụng Tailwind CSS để hiển thị danh sách các bài tập lập trình (Problem List). Giao diện cần có thanh tìm kiếm, dropdown lọc theo độ khó (Easy, Medium, Hard) và bảng dữ liệu hiển thị tên bài, tỉ lệ giải đúng (Acceptance Rate) và trạng thái.
```

#### 4.2. Kết quả AI gợi ý

```text
Copilot sinh ra một file component hoàn chỉnh có đầy đủ state hooks cho tính năng search, filter và layout CSS sử dụng Flexbox/Grid của Tailwind để bố cục bảng rất đẹp mắt.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi sử dụng toàn bộ cấu trúc giao diện HTML và các class Tailwind CSS do AI sinh ra.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tách component lớn thành các file nhỏ (`SearchBar.jsx`, `ProblemTable.jsx`) để dễ quản lý. Xóa dữ liệu mock tĩnh của AI và thay bằng custom hook `useFetchProblems` gọi API từ backend thực tế.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | ProblemList.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI (Copilot) cực kỳ mạnh trong việc tạo template UI với Tailwind, giúp tôi tiết kiệm hàng giờ viết CSS tĩnh.
```

---

### Lần sử dụng AI số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-17 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Tối ưu câu lệnh SQL để xuất bảng xếp hạng (Leaderboard) |
| Phân việc liên quan | Database / Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Tôi có một bảng Submission lưu kết quả chấm bài. Làm sao để viết một câu truy vấn SQL tối ưu lấy ra bảng xếp hạng (Leaderboard) của một Contest cụ thể: mỗi User chỉ lấy bài nộp điểm cao nhất của từng Problem, sau đó tính tổng điểm, nếu bằng điểm thì xếp hạng theo tổng thời gian nộp nhanh nhất?
```

#### 4.2. Kết quả AI gợi ý

```text
ChatGPT đề xuất sử dụng Window Function `ROW_NUMBER() OVER(PARTITION BY user_id, problem_id ORDER BY score DESC, time ASC)` làm truy vấn con (subquery) để lọc bài nộp tốt nhất, sau đó dùng `SUM()` ở truy vấn ngoài cùng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng logic của hàm Window Function vì đây là cách lấy bản ghi tốt nhất hiệu quả hơn nhiều so với dùng `GROUP BY` thông thường.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Do dùng JPA, tôi phải chuyển đổi câu SQL thuần này thành Native Query (`@Query(nativeQuery = true)`) trong Spring Data JPA. Thêm index vào cột `contest_id` và `user_id` để tối ưu performance khi bảng lớn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | SubmissionRepository.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Nhờ AI, tôi biết thêm kỹ thuật Window Function trong SQL, giúp giải quyết bài toán phức tạp một cách tối ưu.
```
---

### Lần sử dụng AI số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-23 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Giải thích luồng hoạt động của Course Detail, sửa giao diện báo lỗi và thêm dữ liệu mẫu Database |
| Phân việc liên quan | Backend, Frontend, Database |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
- giải thích cho tôi về chức năng course detail, liên quan đến file nào giải thích file hàm đó ra cho tôi ở backend
- Hãy truy cập vào database của tôi bằng cách hãy đọc @[backend/.env], sau đó hãy thêm dữ liệu vào category sao cho hợp lý cho tôi
- Vì sao tôi tạo course không được, và hãy phân tích tôi muốn khi mà tạo course nếu tạo không được thì hãy báo rõ lỗi cho tôi, hiện lỗi theo kiểu UI Premium nhé
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích chi tiết luồng Backend của `CourseService` (dành cho học viên) và `InstructorCourseService` (dành cho giảng viên). AI tự động đọc cấu hình `.env`, chạy lệnh truy cập PostgreSQL trong Docker và thêm 10 danh mục (categories). AI cũng phân tích nguyên nhân tạo khóa học bị lỗi (do thiếu user trong bảng instructors sau khi reset DB) và đề xuất sửa code Frontend để hiển thị lỗi chi tiết từ Backend bằng UI Premium (Glassmorphism).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Áp dụng cách giải thích API và luồng dữ liệu để làm tài liệu báo cáo. Sử dụng 10 bản ghi Categories mẫu do AI tạo. Đồng ý cho AI sửa trực tiếp mã nguồn Frontend (`instructorService.ts` và `InstructorDashboard.tsx`) để hiển thị lỗi chuẩn xác với giao diện đẹp mắt.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tự chạy thử lại chức năng Create Course sau khi AI cập nhật giao diện hiển thị lỗi để xác nhận nguyên nhân sâu xa (do thiếu dữ liệu Instructor) và tự insert thêm bản ghi instructor cho tài khoản của mình.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | backend/.env, instructorService.ts, InstructorDashboard.tsx |
| Screenshot |  |
| Kết quả chạy/test | Đã hiển thị thông báo lỗi chi tiết với UI Premium màu đỏ Gradient |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Antigravity rất thông minh khi có thể tự đọc file môi trường `.env`, chạy lệnh Docker vào database để insert dữ liệu và chủ động phân tích sửa lỗi ngay trên source code mà không cần tôi copy paste qua lại. Giao diện báo lỗi AI sinh ra cực kỳ hiện đại.
```

---


---

### Lần sử dụng AI số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 6) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
hãy kiểm tra xem khi tôi có thêm cloudinary để chứa ảnh và video, hãy kiểm tra xem chức năng này nếu tôi đẩy video lên thì có thực hiện được chức năng này không
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 7) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Vậy hãy kiểm tra xem chức năng creat course lúc tôi upload ảnh với video lên ở chỗ thumbnail và video của bài học có được không hãy kiểm tra giúp tôi, cả về phần edit nữa nhé, kết quả cho tôi plan chưa sửa code nhé /goal
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 8) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Vậy hãy kiểm tra xem chức năng creat course lúc tôi upload ảnh với video lên ở chỗ thumbnail và video của bài học có được không hãy kiểm tra giúp tôi, cả về phần edit nữa nhé, kết quả cho tôi plan chưa sửa code nhé /goal
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 9) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
vậy còn frontend cập nhật lại gì không
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 10) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
rồi hãy cập nhật vào file plan cho tôi
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 11) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
rồi hãy làm theo cho tôi
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 12) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Continue
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 13) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
tại sao tôi tải video lên rồi nhưng nhấn chạy nó không chạy video
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 14) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
tôi nhấn chạy video nhưng không được
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 15

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 15) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
hãy ghi cho tôi message plan bạn vừa thực hiện để tôi commit chỉ cho thôi nhứ đừng commit thay tôi
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 16

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 16) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
tạo sao trong edit course không có edit cái thumbnail nhỉ hãy bổ sung giúp tôi
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 17) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
UI edit thumbnail xấu quá hãy sửa lại cho tôi lên bản premium
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 18) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
tạo ở trong instructor nó lại không hiện thumbnail ở phần hiển thị course 19.
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 19) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Intermediate hiện trong mục đích là gì nhỉ
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 20) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
có phải chữ đó đang fix cứng ở giao diện phải không
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 21) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Cụ thể, khi Frontend gọi API lấy danh sách khóa học, Backend đang tự động ép cứng giá trị:    .level("Intermediate") cho các khóa học đang lấy ra.  .level("All Levels") cho khóa học vừa mới được tạo. lấy ở đâu vậy chỉ cho tôi cái code lấy .level được không
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 22) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
hãy bỏ cái phần level này cho tôi lẫn frontend và backend
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 23) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Giờ hãy sửa luồng cho ở My Course trong instructor cho tôi: khi tạo khóa học khi nhấn submit course thì nó sẽ hiện qua draft (Tức là course đó đang ở trạng thái draft) và có edit course đó, khi nhấn submit for Review mới hiện trạng thái pending(tức là course đó đang ở trạng thái pending). Tiếp theo là phần edit course , ở trong lesson thêm cho tôi 1 trường đó là status: đó là hoạt động hoặc không hoạt động. khi edit vào lesson nào thì status đó sẽ chuyển sang trạng thái không hoạt động, nhưng course đó vẫn active nhé(Còn edit những phần khác thì course vẫn active), và khi hiện để user học thì nếu lesson đó không ở trạng thái hoạt động thì khi nhấn vào lesson đó sẽ hiện trạng thái đang bảo trì, còn ở lúc edit nếu lesson đó đang ở trạng thái không hoạt động thì thông báo sẽ không được edit phần lesson đó. khi tạo course thì lesson mặc định là hoạt động nhé. Đây là những yêu cầu của tôi bạn hãy đọc phân tích, và cho tôi plan(khoan sửa code đã nhé) /goal
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 24) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Giờ hãy sửa luồng cho ở My Course trong instructor cho tôi: khi tạo khóa học khi nhấn submit course thì nó sẽ hiện qua draft (Tức là course đó đang ở trạng thái draft) và có edit course đó, khi nhấn submit for Review mới hiện trạng thái pending(tức là course đó đang ở trạng thái pending). Tiếp theo là phần edit course , ở trong lesson thêm cho tôi 1 trường đó là status: đó là hoạt động hoặc không hoạt động. khi edit vào lesson nào thì status đó sẽ chuyển sang trạng thái không hoạt động, nhưng course đó vẫn active nhé(Còn edit những phần khác thì course vẫn active), và khi hiện để user học thì nếu lesson đó không ở trạng thái hoạt động thì khi nhấn vào lesson đó sẽ hiện trạng thái đang bảo trì, còn ở lúc edit nếu lesson đó đang ở trạng thái không hoạt động thì thông báo sẽ không được edit phần lesson đó. khi tạo course thì lesson mặc định là hoạt động nhé. Đây là những yêu cầu của tôi bạn hãy đọc phân tích, và cho tôi plan(khoan sửa code đã nhé) /goal
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 25) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Vấn đề là: Nếu cứ edit là nó bị khóa (Không hoạt động), và đã khóa thì không cho edit nữa, vậy làm cách nào để Giảng viên có thể mở khóa (chuyển lại thành Hoạt động) cho bài học đó? Có phải bạn muốn có một nút gạt (Toggle Switch) riêng biệt để Giảng viên tự bật/tắt trạng thái Hoạt động/Bảo trì của bài học không? Hãy phản hồi lại cho mình biết ý định thực sự của bạn ở chi tiết này nhé! Ở vấn đề này "Nếu cứ edit là nó bị khóa (Không hoạt động), và đã khóa thì không cho edit nữa" là đúng ý tôi, vậy làm thế nào để giảng viên có thể mở khóa lesson đó thì đó là phần của admin nó sẽ duyệt lại lesson khóa học đó, khi admin accept thì lesson đó mới hoạt động lại. Bạn đã hiểu ý tôi chưa. cập nhật lại plan cho tôi(chưa sửa code nhé)
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 26) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Không giờ chỉ xử lí phần liên quan đến instructor trước đã, bạn hãy cập nhật lại plan cho tôi
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 27) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
à không hãy sửa lại thêm phía user nữa, hãy update lại plan cho tôi( nhớ thêm enum cho lessonnhes)
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 28) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Kiểm tra status của bài học mà user đang mở. là thực hiện ở backend mới lên frontend nhé chứ không phải đưa hết lên frontend sau đó mới check, hãy cập nhật lại plan cho tôi
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

---

### Lần sử dụng AI số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát triển tính năng và sửa lỗi (Mã yêu cầu 29) |
| Phân việc liên quan | Fullstack |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 4.1. Prompt đã sử dụng

```text
Nếu INACTIVE: Backend chủ động set videoUrl = null, theoryContent = null, exercises = empty trước khi gửi xuống Frontend. Đồng thời trả kèm cờ status="INACTIVE". (Đảm bảo tuyệt đối nội dung không bị rò rỉ qua Network/API). cái này là sao tôi không hiểu vì sao set = null có ảnh hưởng đến database không
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích ngữ cảnh của lỗi hoặc tính năng cần thêm, đưa ra phương án tối ưu và tự động chỉnh sửa các tệp mã nguồn liên quan.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mã nguồn do AI tự động cập nhật vào dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra lại tính năng trên trình duyệt web, đảm bảo không phá vỡ UI/UX hiện tại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Frontend / Backend code |
| Kết quả chạy/test | Tính năng hoạt động ổn định |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp rút ngắn đáng kể thời gian tìm và sửa lỗi.
```

## 5. Bảng tổng hợp mức độ sử dụng AI

| Hạng mục | Không dùng AI | AI hỗ trợ ít | AI hỗ trợ nhiều | AI sinh chính | Ghi chú |
|---|:---:|:---:|:---:|:---:|---|
| Phân tích yêu cầu | x |  |  |  |  |
| Viết user story/use case | x |  |  |  |  |
| Thiết kế database |  |  | x |  |  |
| Thiết kế kiến trúc hệ thống |  | x |  |  |  |
| Thiết kế giao diện |  |  | x |  |  |
| Code frontend |  |  | x |  |  |
| Code backend |  | x |  |  |  |
| Debug lỗi |  | x |  |  |  |
| Viết test case | x |  |  |  |  |
| Kiểm thử sản phẩm | x |  |  |  |  |
| Tối ưu code |  |  | x |  | Dùng SQL tối ưu |
| Viết báo cáo | x |  |  |  |  |
| Làm slide thuyết trình | x |  |  |  |  |

---

## 6. Các lỗi hoặc hạn chế từ AI

| STT | Lỗi/hạn chế từ AI | Cách phát hiện | Cách xử lý/cải tiến |
|---:|---|---|---|
| 1 | Sinh code Spring Security bản cũ | Lỗi biên dịch khi chạy project | Đọc tài liệu Spring Boot 3.x và sửa lại method |
| 2 | Component UI thiếu responsive | Kéo nhỏ trình duyệt để test | Tự bổ sung các class như `md:flex`, `hidden` của Tailwind |
| 3 | Query SQL bị chậm khi không có index | Explain plan trên Database | Thêm Index thủ công cho các bảng |

---

## 7. Kiểm chứng kết quả AI

### Nội dung kiểm chứng

```text
- Với mã nguồn Java/React, tôi luôn chạy thử cục bộ (localhost) và theo dõi log xem có warning/error nào không.
- Giao diện UI được test bằng cách thay đổi kích thước cửa sổ (responsive test).
- Truy vấn SQL được chạy thử với tập dữ liệu mẫu (mock data 10,000 dòng) bằng MySQL Workbench để đo execution time trước khi tích hợp vào Backend.
```

---

## 8. Đóng góp cá nhân hoặc đóng góp nhóm

### 8.1. Đối với bài cá nhân

```text
N/A (Dự án nhóm)
```

### 8.2. Đối với bài nhóm

| Thành viên | MSSV | Nhiệm vụ chính | Có sử dụng AI không? | Minh chứng đóng góp |
|---|---|---|---|---|
| Hồ Sĩ Tấn | DE190307 | Fullstack Developer (Auth, Database, UI Problem) | Có | Lịch sử commit trên GitHub |

---

## 9. Reflection cuối bài

### 9.1. AI đã hỗ trợ em/nhóm ở điểm nào?

```text
AI là một người trợ lý đắc lực giúp tìm kiếm giải pháp nhanh chóng (như Window Function), vượt qua các rào cản kỹ thuật mới (như setup JWT) và tăng tốc độ code boilerplate UI.
```

### 9.2. Phần nào em/nhóm không sử dụng theo gợi ý của AI? Vì sao?

```text
Các cấu trúc thư mục project hoặc business logic đặc thù (luồng chấm điểm) tôi không dùng nguyên mẫu của AI vì AI không hiểu toàn bộ bối cảnh hệ thống đồ án môn học.
```

### 9.3. Em/nhóm đã kiểm tra tính đúng đắn của kết quả AI như thế nào?

```text
Thông qua việc kết hợp debug trong IntelliJ IDEA, chạy script test trên Postman và chạy thử nghiệm thực tế với user là thành viên nhóm.
```

### 9.4. Nếu không có AI, phần nào sẽ khó khăn nhất?

```text
Khó khăn nhất có lẽ là tự viết câu lệnh tính toán Leaderboard và thiết kế giao diện sao cho hiện đại mà tốn ít thời gian CSS.
```

### 9.5. Sau bài tập/project này, em/nhóm học được gì về môn học?

```text
Tôi nắm vững quy trình phát triển từ thiết kế Database, viết API Backend đến kết nối với Frontend React, cũng như tầm quan trọng của việc tối ưu hóa hiệu năng.
```

### 9.6. Sau bài tập/project này, em/nhóm học được gì về cách sử dụng AI có trách nhiệm?

```text
Tôi hiểu rằng AI chỉ để hỗ trợ, lập trình viên vẫn phải là người làm chủ công nghệ, hiểu rõ từng dòng code và không mù quáng sao chép nếu không biết luồng hoạt động.
```

---

## 10. Cam kết học thuật

Sinh viên/nhóm cam kết rằng:

- Nội dung AI hỗ trợ đã được ghi nhận trung thực.
- Không nộp nguyên văn kết quả AI mà không kiểm tra.
- Có khả năng giải thích các phần đã nộp.
- Chịu trách nhiệm về tính đúng đắn của sản phẩm cuối cùng.
- Hiểu rằng việc sử dụng AI không khai báo có thể ảnh hưởng đến kết quả đánh giá.

| Đại diện sinh viên/nhóm | Ngày xác nhận |
|---|---|
| Hồ Sĩ Tấn | 2026-05-18 |
