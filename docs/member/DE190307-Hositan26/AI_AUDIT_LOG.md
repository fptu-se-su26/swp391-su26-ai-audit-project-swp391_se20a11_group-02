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
| File liên quan | database/schema-only.sql |
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
| Công cụ AI | Gemini |
| Mục đích sử dụng | Xử lý lỗi Invalid Cookie trong Spring Security |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Hỏi kiến thức |

#### 4.1. Prompt đã sử dụng

```text
Hệ thống báo lỗi: 'A cookie header was received... that contained an invalid cookie'. Token của tôi vẫn còn hạn. Hãy phân tích cấu trúc Cookie header và gợi ý cách fix lỗi trên Spring Security filter.
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích rằng lỗi do trình duyệt gửi định dạng Cookie không hợp lệ (thường do tracking cookie của bên thứ 3) khiến Tomcat/Spring boot chặn request. Gợi ý cấu hình lại `CookieProcessor` thành `LegacyCookieProcessor` hoặc xóa token thủ công ở frontend.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng giải pháp cấu hình lại Tomcat Servlet Web Server Factory ở lớp cấu hình chính.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi quyết định dùng giải pháp clean cookie ở phía Client (React) bằng interceptor thay vì hạ cấp bảo mật của Tomcat.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | axiosClient.js |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI giúp tìm ra nguyên nhân gốc rễ rất nhanh, tiết kiệm hàng giờ mò mẫm log.
```

---

### Lần sử dụng AI số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Debug lỗi kết nối WebSocketSession |
| Phân việc liên quan | Backend / WebSocket |
| Mức độ sử dụng | Hỗ trợ debug lỗi |

#### 4.1. Prompt đã sử dụng

```text
Khi tôi khởi tạo WebSocket, log báo 'WebSocketSession[0 current WS(0)... 0 closed abnormally]'. Kết nối bị drop ngay lập tức. Hãy chỉ ra các nguyên nhân tiềm năng liên quan đến SockJsScheduler.
```

#### 4.2. Kết quả AI gợi ý

```text
AI chỉ ra 3 nguyên nhân: thiếu cấu hình allowed origins, thiếu thư viện SockJS ở client, hoặc xung đột với JWT Filter khiến request handshake bị HTTP 401 chặn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Áp dụng cấu hình bypass JWT token kiểm tra cho endpoint `/ws/**`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tự viết thêm logic truyền token qua URL parameters thay vì Header vì WebSocket JS thuần không hỗ trợ set Header tùy chỉnh.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | WebSocketConfig.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Gợi ý của AI khá chung chung, phải hỏi lại nhiều lần mới ra lỗi thực sự do Header.
```

---

### Lần sử dụng AI số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Tích hợp Cloudinary Upload Video/Image |
| Phân việc liên quan | Backend / Cloud |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 4.1. Prompt đã sử dụng

```text
Viết một service class trong Spring Boot tích hợp Cloudinary SDK để upload file ảnh và video. Yêu cầu có kiểm tra dung lượng tối đa và định dạng file, trả về secure_url.
```

#### 4.2. Kết quả AI gợi ý

```text
Copilot sinh ra `CloudinaryService.java` dùng `ObjectUtils.asMap` để truyền tham số `resource_type: auto`. Có hàm check validation cơ bản.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng cấu trúc code upload file API do Copilot sinh.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tự bổ sung cấu hình file size trong `application.yml` và ném ra Custom Exception thay vì `RuntimeException` mặc định.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CloudinaryService.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Copilot code rất chuẩn xác theo docs của Cloudinary.
```

---

### Lần sử dụng AI số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Thiết kế luồng tạo Course với Upload Media |
| Phân việc liên quan | Frontend / React |
| Mức độ sử dụng | Hỏi kiến trúc |

#### 4.1. Prompt đã sử dụng

```text
Tôi muốn thiết kế luồng tạo khoá học (Create Course) gồm upload thumbnail và video bài học. Hãy gợi ý luồng thực thi: nên upload trực tiếp từ Frontend lên Cloudinary hay phải thông qua Backend proxy? Ưu nhược điểm là gì?
```

#### 4.2. Kết quả AI gợi ý

```text
AI đưa ra 2 luồng: Signed Upload (qua Backend) và Unsigned Upload (từ Frontend). Đề xuất Signed Upload để bảo mật API Key của Cloudinary.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Chọn luồng Signed Upload qua Backend proxy.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Sửa lại React Component để hiển thị progress bar trong lúc chờ Backend upload file lên Cloudinary.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseCreate.tsx, UploadController.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Phân tích kiến trúc rõ ràng, giúp tôi chọn được giải pháp bảo mật nhất.
```

---

### Lần sử dụng AI số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Tối ưu hóa mã nguồn luồng Create Course |
| Phân việc liên quan | Frontend / React |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Luồng upload video khi tạo khoá học hiện tại bị giật lag giao diện (UI block) do file lớn. Hãy gợi ý cách xử lý bất đồng bộ (async/await) kết hợp với Web Worker trong React.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đưa ra ví dụ dùng Web Worker để chia nhỏ file, tuy nhiên đề xuất dùng `FormData` với `axios` onUploadProgress đơn giản hơn nhiều.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Dùng tính năng `onUploadProgress` của axios theo gợi ý.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tự custom lại giao diện thanh tiến trình (progress bar) bằng Tailwind.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | instructorService.ts |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Giải pháp AI đưa ra thực tế và dễ triển khai hơn định hướng ban đầu của tôi.
```

---

### Lần sử dụng AI số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Cập nhật state React sau khi upload |
| Phân việc liên quan | Frontend / State Management |
| Mức độ sử dụng | Hỗ trợ sửa lỗi |

#### 4.1. Prompt đã sử dụng

```text
Sau khi upload thumbnail thành công, state chứa URL ảnh không cập nhật ngay trên giao diện preview. Hãy review lại cách dùng useEffect và useState trong trường hợp này.
```

#### 4.2. Kết quả AI gợi ý

```text
AI phát hiện tôi truyền sai dependency array trong `useEffect` và hướng dẫn cách set state theo hướng functional update.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sửa lại logic `setThumbnail(prev => newUrl)`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm skeleton loading trong lúc ảnh đang render.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseCreate.tsx |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Lỗi cơ bản của React nhưng có AI dò hộ nên fix cực nhanh.
```

---

### Lần sử dụng AI số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Viết commit message chuẩn Conventional Commits |
| Phân việc liên quan | Git |
| Mức độ sử dụng | Hỗ trợ ít |

#### 4.1. Prompt đã sử dụng

```text
Tôi vừa hoàn thành tính năng upload Cloudinary cho Course và Lesson. Hãy sinh cho tôi 3 option commit message tuân thủ chuẩn Conventional Commits.
```

#### 4.2. Kết quả AI gợi ý

```text
AI trả về các option như: `feat(course): integrate Cloudinary for media upload`, `refactor(upload): optimize upload flow`...
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng `feat(course): integrate Cloudinary for media upload`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Bổ sung thêm mô tả chi tiết ở phần body của commit.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Git Log |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Tiện lợi khi bí từ.
```

---

### Lần sử dụng AI số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Debug lỗi Video HTML5 không phát |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Hỗ trợ debug |

#### 4.1. Prompt đã sử dụng

```text
Tôi render thẻ <video> của HTML5 với URL từ Cloudinary nhưng trình duyệt báo lỗi và không tự chạy (autoplay). Vấn đề là do đâu?
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích chính sách autoplay của Chrome yêu cầu thẻ video phải có thuộc tính `muted`. Đồng thời URL cần dùng https.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Thêm thuộc tính `muted`, `playsInline` vào thẻ video.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Xử lý thêm sự kiện `onError` để hiển thị ảnh thumbnail thay thế nếu video bị hỏng.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | LessonPlayer.tsx |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Rất hài lòng vì AI nắm rõ chính sách của trình duyệt.
```

---

### Lần sử dụng AI số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Hoàn thiện component Video Player |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 4.1. Prompt đã sử dụng

```text
Tạo một Custom Video Player component bọc ngoài HTML5 video, có các nút custom play/pause và progress bar dùng Tailwind.
```

#### 4.2. Kết quả AI gợi ý

```text
Copilot sinh ra đoạn code dùng `useRef` để gọi `.play()` và `.pause()`, tính toán tiến trình dựa trên `timeupdate` event.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Áp dụng phần logic xử lý event `timeupdate`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tự viết lại 100% CSS bằng chuẩn Glassmorphism do code của Copilot hơi cũ.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CustomVideoPlayer.tsx |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Code base tốt nhưng UI hơi xấu, cần tự customize nhiều.
```

---

### Lần sử dụng AI số 15

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Sinh kịch bản test (Test Plan) |
| Phân việc liên quan | Testing |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Hãy lên danh sách các case cần test cho tính năng Upload Video trong khoá học. Bao gồm cả happy path và edge cases.
```

#### 4.2. Kết quả AI gợi ý

```text
AI liệt kê 10 test cases: file đúng chuẩn, file quá dung lượng, file sai định dạng (pdf), rớt mạng khi đang upload...
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Dùng danh sách này làm checklist kiểm thử thủ công.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Bổ sung thêm case test upload đồng thời nhiều file.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | N/A |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Giúp QA quy trình chặt chẽ hơn, không bỏ sót bug.
```

---

### Lần sử dụng AI số 16

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Thiết kế luồng cập nhật ảnh (Edit Thumbnail) |
| Phân việc liên quan | Frontend / Component |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 4.1. Prompt đã sử dụng

```text
Giao diện Edit Course của tôi đang thiếu chỗ cập nhật Thumbnail. Hãy gợi ý cách thiết kế UI để vừa preview ảnh cũ, vừa hỗ trợ kéo thả (drag & drop) ảnh mới đè lên.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất dùng một khung Dropzone mờ, hiển thị ảnh cũ làm background, khi hover sẽ hiện biểu tượng Camera và chữ 'Change Image'.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng ý tưởng thiết kế Dropzone đè lên background.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Sử dụng thư viện `react-dropzone` thay vì viết drag-and-drop thuần để bắt event mượt hơn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | ThumbnailUploader.tsx |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Ý tưởng UI UX cực kỳ hiện đại, áp dụng vào dự án rất đẹp.
```

---

### Lần sử dụng AI số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Refactor Tailwind CSS cho giao diện Premium |
| Phân việc liên quan | Frontend / CSS |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 4.1. Prompt đã sử dụng

```text
Cải tiến đoạn code Tailwind này để nó trông 'Premium' hơn: thêm hiệu ứng đổ bóng mượt (soft shadow), bo góc lớn, border gradient và hiệu ứng chuyển động khi hover.
```

#### 4.2. Kết quả AI gợi ý

```text
Copilot sinh ra các class Tailwind cực kỳ phức tạp: `hover:shadow-2xl transition-all duration-300 ring-1 ring-white/10...`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng các class tạo soft shadow và transition.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tinh chỉnh lại màu gradient cho hợp với tone màu cam-xanh của hệ thống.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | InstructorDashboard.tsx |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Copilot biết cách phối hợp các util classes của Tailwind cực kỳ tốt.
```

---

### Lần sử dụng AI số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Fix bug không hiển thị Thumbnail ở Course List |
| Phân việc liên quan | Backend / DTO |
| Mức độ sử dụng | Hỗ trợ debug |

#### 4.1. Prompt đã sử dụng

```text
Khi tôi lưu Thumbnail xong, trong database đã có URL nhưng API trả về danh sách Course cho Instructor lại bị null trường `thumbnailUrl`. Vấn đề ở đâu trong MapStruct?
```

#### 4.2. Kết quả AI gợi ý

```text
AI chỉ ra rằng file `CourseMapper.java` chưa map trường này sang DTO tương ứng (có thể do sai tên biến giữa Entity và DTO).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Thêm `@Mapping(source = "thumbnailUrl", target = "thumbnailUrl")` vào file Mapper.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Cấu hình lại MapStruct để báo lỗi lúc compile thay vì ignore khi thiếu map field.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseMapper.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Rất hiệu quả trong việc debug lỗi data binding.
```

---

### Lần sử dụng AI số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Refactor code: Loại bỏ hardcode 'Level' |
| Phân việc liên quan | Backend / Service |
| Mức độ sử dụng | Hỗ trợ refactor |

#### 4.1. Prompt đã sử dụng

```text
Trong codebase hiện tại có rất nhiều chỗ hardcode level là 'Intermediate' hoặc 'All Levels'. Làm sao để refactor triệt để, xóa hoàn toàn field này khỏi Backend và Frontend mà không bị lỗi crash?
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn quy trình 3 bước: Xóa cột trong Database bằng Flyway/Script -> Xóa trong Entity/DTO -> Chạy RegExp search toàn bộ dự án React để xóa props.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng quy trình 3 bước an toàn do AI đề xuất.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tự tay viết regex để search & destroy các component đang phụ thuộc vào Level.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseEntity.java, CourseResponse.ts |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Quy trình chuẩn kỹ sư, tránh rủi ro vỡ hệ thống.
```

---

### Lần sử dụng AI số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Tối ưu hóa Regex tìm kiếm code thừa |
| Phân việc liên quan | Công cụ |
| Mức độ sử dụng | Hỏi kiến thức |

#### 4.1. Prompt đã sử dụng

```text
Viết cho tôi một regex để tìm tất cả các file TypeScript có chứa interface khai báo thuộc tính `level: string` nhưng bỏ qua các file nằm trong thư mục node_modules.
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý cú pháp `interface.*level\s*:\s*string` kết hợp với lệnh grep exclude dir.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng regex để clean code nhanh chóng.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Chạy thẳng trên tính năng Find in Files của VSCode thay vì dùng CLI.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | VSCode |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Regex chuẩn xác.
```

---

### Lần sử dụng AI số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Giải thích logic gán default properties |
| Phân việc liên quan | Backend / Builder |
| Mức độ sử dụng | Hỏi kiến thức |

#### 4.1. Prompt đã sử dụng

```text
Trong Lombok Builder, tại sao khi tạo mới một CourseEntity, tôi không truyền Level mà hệ thống lại tự gán là 'All Levels'? Tính năng này được định nghĩa ở đâu?
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích về `@Builder.Default` của Lombok và hàm hook `@PrePersist` trong JPA.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tìm ra nguyên nhân gốc và xóa dòng gán mặc định.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Kiểm tra thêm toàn bộ các Entity khác xem có bị lạm dụng Builder.Default không.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseEntity.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Giải đáp thắc mắc về cơ chế chạy ngầm của thư viện rất hay.
```

---

### Lần sử dụng AI số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Thiết kế luồng trạng thái Khóa học |
| Phân việc liên quan | System Design |
| Mức độ sử dụng | Hỏi kiến trúc |

#### 4.1. Prompt đã sử dụng

```text
Tôi muốn quản lý vòng đời khoá học: Tạo mới -> DRAFTS. Nhấn Submit -> PENDING (chờ duyệt). Admin duyệt -> PUBLISHED. Hãy gợi ý thiết kế Enum trạng thái và phương thức chuyển đổi bảo mật trong Service.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất tạo `CourseStatus` enum. Đề xuất quy tắc State Machine: chỉ được chuyển từ DRAFT sang PENDING, không cho phép đi ngược tùy tiện.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tạo enum `CourseStatus` với các giá trị DRAFTS, PENDING, APPROVED, REJECTED.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm một bảng Log để lưu lịch sử chuyển trạng thái kèm lý do từ chối của Admin.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseStatus.java, CourseService.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Định hướng kiến trúc rất chặt chẽ, bảo mật.
```

---

### Lần sử dụng AI số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Sinh code chuyển trạng thái Course |
| Phân việc liên quan | Backend / API |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 4.1. Prompt đã sử dụng

```text
Viết hàm `submitForReview(courseId)` trong `InstructorCourseService`. Yêu cầu kiểm tra nếu khóa học không phải DRAFTS thì ném lỗi `IllegalStateException`, ngược lại thì đổi thành PENDING.
```

#### 4.2. Kết quả AI gợi ý

```text
Copilot sinh chuẩn logic check DB, ném exception `ErrorCode.INVALID_STATE` nếu điều kiện không thỏa.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng logic kiểm tra trạng thái do Copilot viết.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm logic validate: Khóa học phải có ít nhất 1 Chapter và 1 Lesson mới được Submit.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | InstructorCourseService.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Copilot hiểu context dự án rất tốt, code pass bài test ngay.
```

---

### Lần sử dụng AI số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Xử lý logic khóa (lock) chỉnh sửa Lesson |
| Phân việc liên quan | Backend / Logic |
| Mức độ sử dụng | Hỗ trợ giải thuật |

#### 4.1. Prompt đã sử dụng

```text
Trong hệ thống LMS, khi một Lesson đang ở trạng thái 'Bảo trì', giảng viên không được phép edit nội dung của nó. Hãy viết logic validator kiểm tra điều kiện này ở lớp Controller.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất viết một Custom Annotation `@CheckLessonEditable` kết hợp AOP để tái sử dụng, thay vì if/else cứng trong từng hàm API.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi nhận thấy AOP quá phức tạp cho phase này nên chỉ dùng if-else thông thường ở Service.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Viết hàm `checkLessonEditable()` trong Service để tái sử dụng.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | LessonService.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI gợi ý dùng kỹ thuật nâng cao (AOP), tôi đã học thêm kiến thức mới dù chưa áp dụng.
```

---

### Lần sử dụng AI số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Hiển thị trạng thái khóa học cho Học viên |
| Phân việc liên quan | Frontend / React |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 4.1. Prompt đã sử dụng

```text
Khi học viên truy cập bài học bị khóa, hãy trả về UI hiển thị 'Bài học đang bảo trì' với hình ảnh icon minh hoạ, không render Video Player. Cho tôi code UI bằng Tailwind.
```

#### 4.2. Kết quả AI gợi ý

```text
AI trả về component `MaintenanceScreen` với biểu tượng cờ lê và màu xám nhạt, cực kỳ thân thiện với người dùng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Áp dụng component `MaintenanceScreen` vào hệ thống.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm nút 'Back to Course' để user dễ điều hướng quay lại.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | LessonPlayer.tsx |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
UI xử lý edge-case rất chuyên nghiệp.
```

---

### Lần sử dụng AI số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Thiết kế luồng Admin duyệt trạng thái |
| Phân việc liên quan | Backend / Flow |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Nếu bài học bị khóa (Không hoạt động), ai sẽ là người mở khóa? Admin hay Giảng viên? Đưa ra best practices cho nền tảng giáo dục lớn.
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích: Giảng viên tự bật tắt bảo trì, nhưng nếu bài học bị REPORT (báo cáo vi phạm), Admin mới là người có quyền khóa/mở khóa. Khuyên dùng 2 cột: `is_active` (cho GV) và `is_blocked_by_admin` (cho Admin).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng mô hình 2 biến cờ (flags) để phân rõ quyền quản lý.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tích hợp cờ này vào JWT Payload để Frontend dễ hiển thị UI tương ứng.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | LessonEntity.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Kiến thức về phân quyền của AI sâu sắc, giải quyết triệt để tranh chấp quyền hạn.
```

---

### Lần sử dụng AI số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Giới hạn phạm vi API (Separation of Concerns) |
| Phân việc liên quan | Backend / Controller |
| Mức độ sử dụng | Hỏi kiến trúc |

#### 4.1. Prompt đã sử dụng

```text
Nên gộp chung API lấy khóa học của Admin, Instructor và Student vào 1 hàm `/courses` hay chia làm 3 Controller riêng biệt?
```

#### 4.2. Kết quả AI gợi ý

```text
AI khuyên cực kỳ mạnh mẽ nên tách ra làm 3 Controller: `AdminCourseController`, `InstructorCourseController`, `PublicCourseController` để tránh rò rỉ dữ liệu và dễ bảo trì.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tiến hành bóc tách toàn bộ API Course ra thành 3 luồng riêng biệt.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tự cấu hình lại Filter Security theo đường dẫn `/api/v1/instructor/**`.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Controllers |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Quyết định refactor này giúp hệ thống bảo mật dữ liệu tuyệt đối.
```

---

### Lần sử dụng AI số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Sinh code MapStruct DTO riêng rẽ |
| Phân việc liên quan | Backend / DTO |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 4.1. Prompt đã sử dụng

```text
Tạo interface MapStruct chuyển CourseEntity thành `StudentCourseResponse` (chỉ lộ thông tin cơ bản) và `InstructorCourseResponse` (lộ cả doanh thu, trạng thái DRAFT).
```

#### 4.2. Kết quả AI gợi ý

```text
Copilot tự động mapping chính xác, loại bỏ các thuộc tính private (như doanh thu) khỏi `StudentCourseResponse`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng hoàn toàn code Mapper sinh bởi Copilot.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm tính năng escape HTML cho phần mô tả ở luồng Public.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseMapper.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Viết DTO Mapping bằng Copilot là công việc nhàn nhất.
```

---

### Lần sử dụng AI số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Ngăn ngừa lộ thông tin (Data Leakage) |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Hỏi phương pháp |

#### 4.1. Prompt đã sử dụng

```text
Khi bài học ở trạng thái INACTIVE, làm sao để chắc chắn Frontend không bao giờ nhận được URL video bí mật từ Backend?
```

#### 4.2. Kết quả AI gợi ý

```text
AI khuyên: Đừng phó mặc cho Frontend che giao diện (vì hacker có thể xem Network Response). Backend phải chủ động set giá trị URL = null trong DTO trước khi Serialize JSON trả về.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Áp dụng phương pháp làm 'rỗng' dữ liệu nhạy cảm tại tầng Service.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Viết một hàm Utility chung để clean sensitive data cho các Lesson Inactive.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseService.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Một nguyên tắc bảo mật cực kỳ cơ bản nhưng rất dễ bị quên nếu không có AI nhắc.
```

---

### Lần sử dụng AI số 30

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Tóm tắt và chốt kế hoạch Refactor |
| Phân việc liên quan | Tài liệu hóa |
| Mức độ sử dụng | Tổng hợp |

#### 4.1. Prompt đã sử dụng

```text
Dựa trên các thay đổi về trạng thái khóa học, luồng duyệt của Admin và bảo vệ dữ liệu INACTIVE, hãy viết cho tôi một bản tóm tắt kỹ thuật (Technical Plan) để chốt trước khi deploy.
```

#### 4.2. Kết quả AI gợi ý

```text
AI trả về một danh sách các công việc đã làm dạng Checklist rõ ràng, có phân mục Database, Backend, Frontend.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Dùng đoạn văn bản này để viết ghi chú Commit (Release Note).
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Chỉnh sửa lại một số thuật ngữ tiếng Anh cho đúng với Convention của dự án.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CHANGELOG.md |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI tổng hợp dữ liệu rất mạch lạc, tiện cho việc báo cáo.
```

---

### Lần sử dụng AI số 31

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Phân tích luồng API Course Detail |
| Phân việc liên quan | Backend / API |
| Mức độ sử dụng | Giải thích logic |

#### 4.1. Prompt đã sử dụng

```text
Hệ thống đang có 2 luồng get Course Detail cho Instructor và Student. Hãy phân tích sự khác biệt về DTO trả về và logic check permission trong file `CourseService.java`.
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích rõ ràng: Luồng Student phải kiểm tra xem khóa học đã PUBLISHED chưa, trong khi luồng Instructor kiểm tra quyền sở hữu ID.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Dùng kết quả phân tích để viết API Documentation (Swagger).
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Bổ sung thêm mô tả lỗi 403 Forbidden vào tài liệu.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Swagger API |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Đọc code ngược rất tốt, giải thích dễ hiểu cho người mới vào team.
```

---

### Lần sử dụng AI số 32

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Giải thích MapStruct Expressions |
| Phân việc liên quan | Backend / MapStruct |
| Mức độ sử dụng | Hỏi kiến thức |

#### 4.1. Prompt đã sử dụng

```text
Trong MapStruct có cú pháp `expression = "java(mapper.map(...))"`, cú pháp này hoạt động ngầm (under the hood) như thế nào so với custom method?
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích expression sẽ chèn nguyên chuỗi java code vào class Impl sinh tự động, chạy nhanh hơn custom method reflection nhưng dễ bị lỗi compile nếu gõ sai chính tả.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Hiểu rõ bản chất để quyết định chuyển sang dùng `qualifiedByName` thay vì viết chuỗi cứng `expression` để an toàn type-safe.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Refactor lại file `CourseMapper.java`.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseMapper.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Kiến thức chuyên sâu, giúp tôi nâng cấp chất lượng code (Best Practice).
```

---

### Lần sử dụng AI số 33

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Sinh script Mock Data (Seeding) an toàn |
| Phân việc liên quan | Database / Seeding |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 4.1. Prompt đã sử dụng

```text
Tạo 1 file SQL insert 10 bản ghi danh mục (Categories) lập trình (VD: Web, Mobile, Data Science). Yêu cầu dùng cú pháp INSERT IGNORE hoặc ON CONFLICT DO NOTHING để tránh lỗi duplicate key.
```

#### 4.2. Kết quả AI gợi ý

```text
Copilot sinh ra 10 dòng lệnh chuẩn PostgreSQL `INSERT INTO categories ... ON CONFLICT (name) DO NOTHING`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Copy vào file Data Seeder chạy ngầm khi khởi động Docker.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tự cập nhật tên các danh mục tiếng Việt cho phù hợp yêu cầu bài giảng.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | data.sql |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cú pháp chống duplicate rất chính xác.
```

---

### Lần sử dụng AI số 34

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Debug lỗi 500 khi Tạo Khóa Học |
| Phân việc liên quan | Backend / Debug |
| Mức độ sử dụng | Hỗ trợ xử lý sự cố |

#### 4.1. Prompt đã sử dụng

```text
Giao diện báo 'Validation Error' chung chung khi tạo khóa học. Kiểm tra log Backend báo lỗi `EntityNotFoundException: Instructor not found`. Vấn đề là do tài khoản thiếu ROLE hay thiếu Record?
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích: User có `ROLE_INSTRUCTOR` để vào trang Dashboard, nhưng database vừa bị reset nên bảng `instructors` trống, dẫn đến API get profile bị crash.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tự tay chạy SQL insert bù một record vào bảng `instructors` cho tài khoản test.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Đồng thời bổ sung logic: tự động tạo Instructor Profile trống nếu user có Role giảng viên đăng nhập lần đầu.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | AuthService.java |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Suy luận logic cực kỳ bén, tìm ra sự thiếu đồng bộ giữa User Role và Profile Data.
```

---

### Lần sử dụng AI số 35

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Cải tiến giao diện (Premium Error UI) |
| Phân việc liên quan | Frontend / React / Tailwind |
| Mức độ sử dụng | Hỗ trợ thiết kế UI |

#### 4.1. Prompt đã sử dụng

```text
Sửa lại khung hiển thị lỗi ở `InstructorDashboard.tsx`. Thay vì alert đỏ tĩnh, hãy hứng `err.message` từ API và thiết kế khung thông báo theo phong cách Premium Glassmorphism (có gradient dọc, shadow mượt).
```

#### 4.2. Kết quả AI gợi ý

```text
AI đưa ra cụm class Tailwind cực xịn: `bg-gradient-to-r from-red-50 ... shadow-[0_8px_16px_...] animate-fade-in` và bắt chính xác `err.message`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Thay thế toàn bộ khối xử lý lỗi ở Frontend bằng code AI sinh.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Chỉnh nhẹ lại font chữ `tracking-wider` để nhìn cá tính hơn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | InstructorDashboard.tsx |
| Kết quả chạy/test | Pass |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Code giao diện của AI cực kỳ mãn nhãn, kết quả vượt ngoài kỳ vọng.
```

---

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
