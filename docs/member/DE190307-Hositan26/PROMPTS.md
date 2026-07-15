# Prompt Log

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
| Ngày cập nhật gần nhất | 2026-05-18 |

---

## 2. Mục đích của file Prompt Log

File này dùng để ghi lại các prompt quan trọng đã sử dụng trong quá trình thực hiện bài tập, lab, assignment hoặc project.

Sinh viên/nhóm cần ghi lại:

- Đã hỏi AI điều gì.
- Mục đích sử dụng prompt.
- Công cụ AI đã sử dụng.
- AI đã trả lời hoặc gợi ý gì.
- Kết quả đó có được áp dụng vào bài hay không.
- Sinh viên/nhóm đã kiểm tra, chỉnh sửa hoặc cải tiến gì sau khi nhận kết quả từ AI.

---

## 3. Công cụ AI đã sử dụng

Đánh dấu các công cụ AI đã sử dụng.

- [x] ChatGPT
- [x] Gemini
- [ ] Claude
- [x] GitHub Copilot
- [ ] Cursor
- [x] Antigravity
- [ ] Microsoft Copilot
- [ ] Perplexity
- [ ] Công cụ khác: ....................................

---

## 4. Bảng tổng hợp prompt đã sử dụng

| STT | Ngày | Công cụ AI | Mục đích | Prompt tóm tắt | Kết quả chính | Có sử dụng vào bài không? | Minh chứng |
|---:|---|---|---|---|---|---|---|
| 1 | 2026-05-12 | ChatGPT | Thiết kế các thực thể cơ sở dữ liệu cốt lõi | Gợi ý cấu trúc bảng Database cho hệ thống thi đấu lập trình | Cấu trúc 5 bảng dữ liệu chính cho ERD | Có | Schema Database |
| 2 | 2026-05-14 | Gemini | Cấu hình bảo mật JWT trong Spring Boot | Hỏi cấu hình Spring Security JWT cho 3 roles | Bộ code base cho filter và security config | Có | Config Classes |
| 3 | 2026-05-16 | GitHub Copilot | Tạo khung giao diện React bằng Tailwind CSS | Yêu cầu sinh layout cho Problem List với search & filter | Cấu trúc UI hoàn chỉnh dùng Flex/Grid | Có | Component UI |
| 4 | 2026-05-17 | ChatGPT | Tối ưu câu lệnh SQL tính Leaderboard | Hỏi SQL để tìm tổng điểm các bài nộp cao nhất theo thời gian | Lời khuyên dùng Window Function thay vì Group By | Có | Native Query Repository |
| 5 | 2026-06-23 | Antigravity | Phân tích lỗi tạo khóa học & Đổ dữ liệu mẫu | Đọc .env, truy cập Database, sửa UI hiển thị lỗi Premium | Phân tích sâu nguyên nhân lỗi và tự động sửa file UI React | Có | Code Frontend, DB Categories |
| 6 | 2026-06-16 | Gemini | Xử lý lỗi Invalid Cookie trong Spring Security | Hệ thống báo lỗi: 'A cookie header was received...... | Hỏi kiến thức | Có | axiosClient.js |
| 7 | 2026-06-16 | ChatGPT | Debug lỗi kết nối WebSocketSession | Khi tôi khởi tạo WebSocket, log báo 'WebSocketSess... | Hỗ trợ debug lỗi | Có | WebSocketConfig.java |
| 8 | 2026-06-16 | GitHub Copilot | Tích hợp Cloudinary Upload Video/Image | Viết một service class trong Spring Boot tích hợp ... | Hỗ trợ sinh code | Có | CloudinaryService.java |
| 9 | 2026-06-16 | ChatGPT | Thiết kế luồng tạo Course với Upload Media | Tôi muốn thiết kế luồng tạo khoá học (Create Cours... | Hỏi kiến trúc | Có | CourseCreate.tsx, UploadController.java |
| 10 | 2026-06-16 | ChatGPT | Tối ưu hóa mã nguồn luồng Create Course | Luồng upload video khi tạo khoá học hiện tại bị gi... | Hỗ trợ một phần | Có | instructorService.ts |
| 11 | 2026-06-16 | Gemini | Cập nhật state React sau khi upload | Sau khi upload thumbnail thành công, state chứa UR... | Hỗ trợ sửa lỗi | Có | CourseCreate.tsx |
| 12 | 2026-06-16 | ChatGPT | Viết commit message chuẩn Conventional Commits | Tôi vừa hoàn thành tính năng upload Cloudinary cho... | Hỗ trợ ít | Có | Git Log |
| 13 | 2026-06-16 | Gemini | Debug lỗi Video HTML5 không phát | Tôi render thẻ <video> của HTML5 với URL từ Cloudi... | Hỗ trợ debug | Có | LessonPlayer.tsx |
| 14 | 2026-06-16 | GitHub Copilot | Hoàn thiện component Video Player | Tạo một Custom Video Player component bọc ngoài HT... | Hỗ trợ sinh code | Có | CustomVideoPlayer.tsx |
| 15 | 2026-06-16 | ChatGPT | Sinh kịch bản test (Test Plan) | Hãy lên danh sách các case cần test cho tính năng ... | Hỏi ý tưởng | Có | N/A |
| 16 | 2026-06-16 | Gemini | Thiết kế luồng cập nhật ảnh (Edit Thumbnail) | Giao diện Edit Course của tôi đang thiếu chỗ cập n... | Hỗ trợ thiết kế | Có | ThumbnailUploader.tsx |
| 17 | 2026-06-16 | GitHub Copilot | Refactor Tailwind CSS cho giao diện Premium | Cải tiến đoạn code Tailwind này để nó trông 'Premi... | Hỗ trợ sinh code | Có | InstructorDashboard.tsx |
| 18 | 2026-06-16 | ChatGPT | Fix bug không hiển thị Thumbnail ở Course List | Khi tôi lưu Thumbnail xong, trong database đã có U... | Hỗ trợ debug | Có | CourseMapper.java |
| 19 | 2026-06-16 | ChatGPT | Refactor code: Loại bỏ hardcode 'Level' | Trong codebase hiện tại có rất nhiều chỗ hardcode ... | Hỗ trợ refactor | Có | CourseEntity.java, CourseResponse.ts |
| 20 | 2026-06-16 | Gemini | Tối ưu hóa Regex tìm kiếm code thừa | Viết cho tôi một regex để tìm tất cả các file Type... | Hỏi kiến thức | Có | VSCode |
| 21 | 2026-06-16 | ChatGPT | Giải thích logic gán default properties | Trong Lombok Builder, tại sao khi tạo mới một Cour... | Hỏi kiến thức | Có | CourseEntity.java |
| 22 | 2026-06-16 | Gemini | Thiết kế luồng trạng thái Khóa học | Tôi muốn quản lý vòng đời khoá học: Tạo mới -> DRA... | Hỏi kiến trúc | Có | CourseStatus.java, CourseService.java |
| 23 | 2026-06-16 | GitHub Copilot | Sinh code chuyển trạng thái Course | Viết hàm `submitForReview(courseId)` trong `Instru... | Hỗ trợ sinh code | Có | InstructorCourseService.java |
| 24 | 2026-06-16 | ChatGPT | Xử lý logic khóa (lock) chỉnh sửa Lesson | Trong hệ thống LMS, khi một Lesson đang ở trạng th... | Hỗ trợ giải thuật | Có | LessonService.java |
| 25 | 2026-06-16 | Gemini | Hiển thị trạng thái khóa học cho Học viên | Khi học viên truy cập bài học bị khóa, hãy trả về ... | Hỗ trợ sinh code | Có | LessonPlayer.tsx |
| 26 | 2026-06-16 | ChatGPT | Thiết kế luồng Admin duyệt trạng thái | Nếu bài học bị khóa (Không hoạt động), ai sẽ là ng... | Hỏi ý tưởng | Có | LessonEntity.java |
| 27 | 2026-06-16 | ChatGPT | Giới hạn phạm vi API (Separation of Concerns) | Nên gộp chung API lấy khóa học của Admin, Instruct... | Hỏi kiến trúc | Có | Controllers |
| 28 | 2026-06-17 | GitHub Copilot | Sinh code MapStruct DTO riêng rẽ | Tạo interface MapStruct chuyển CourseEntity thành ... | Hỗ trợ sinh code | Có | CourseMapper.java |
| 29 | 2026-06-17 | Gemini | Ngăn ngừa lộ thông tin (Data Leakage) | Khi bài học ở trạng thái INACTIVE, làm sao để chắc... | Hỏi phương pháp | Có | CourseService.java |
| 30 | 2026-06-17 | ChatGPT | Tóm tắt và chốt kế hoạch Refactor | Dựa trên các thay đổi về trạng thái khóa học, luồn... | Tổng hợp | Có | CHANGELOG.md |
| 31 | 2026-06-29 | Gemini | Phân tích luồng API Course Detail | Hệ thống đang có 2 luồng get Course Detail cho Ins... | Giải thích logic | Có | Swagger API |
| 32 | 2026-06-29 | ChatGPT | Giải thích MapStruct Expressions | Trong MapStruct có cú pháp `expression = "java(map... | Hỏi kiến thức | Có | CourseMapper.java |
| 33 | 2026-06-29 | GitHub Copilot | Sinh script Mock Data (Seeding) an toàn | Tạo 1 file SQL insert 10 bản ghi danh mục (Categor... | Hỗ trợ sinh code | Có | data.sql |
| 34 | 2026-06-29 | ChatGPT | Debug lỗi 500 khi Tạo Khóa Học | Giao diện báo 'Validation Error' chung chung khi t... | Hỗ trợ xử lý sự cố | Có | AuthService.java |
| 35 | 2026-06-29 | Gemini | Cải tiến giao diện (Premium Error UI) | Sửa lại khung hiển thị lỗi ở `InstructorDashboard.... | Hỗ trợ thiết kế UI | Có | InstructorDashboard.tsx |

---

---

## 5. Prompt chi tiết

> Sinh viên/nhóm có thể nhân bản mẫu “Prompt số...” nhiều lần tùy số lượng prompt thực tế đã sử dụng.

---
### Prompt số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-12 |
| Công cụ AI | ChatGPT |
| Mục đích | Thiết kế các thực thể cơ sở dữ liệu cốt lõi |
| Phân việc liên quan | Database |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi kiến trúc |

#### 5.1. Prompt nguyên văn

```text
Tôi đang làm một nền tảng thi đấu lập trình bằng Spring Boot và MySQL. Hãy gợi ý thiết kế các bảng cơ sở dữ liệu (Database Schema) chính bao gồm: User, Problem, Submission, Contest và Contest_User. Mối quan hệ giữa chúng là gì? Hãy thiết kế để tối ưu cho việc truy vấn kết quả.
```

#### 5.2. Bối cảnh khi viết prompt

Khi bắt đầu làm Backend, tôi cần thiết kế Database Schema (ERD) thật chuẩn xác. Nếu thiết kế sai từ đầu, sau này đổi cấu trúc bảng sẽ gây ra lỗi trên diện rộng. Tôi muốn hỏi AI để có cái nhìn tổng quát về các thực thể cần thiết.

#### 5.3. Kết quả AI trả về

AI đưa ra định nghĩa các bảng và mối quan hệ (ví dụ: `User` 1-N `Submission`, `Problem` 1-N `Submission`). AI gợi ý dùng bảng trung gian `Contest_User` để quản lý người tham gia thi đấu, và gợi ý thêm cột `runtime` và `memory` ở bảng `Submission` vì đây là đặc thù của nền tảng chấm code.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã sử dụng gợi ý của AI làm cơ sở cốt lõi để vẽ ERD cho dự án.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thay vì sao chép nguyên xi, tôi tự đổi kiểu khóa chính thành UUID để bảo mật dữ liệu, và tự thêm các cột như `created_at`, `updated_at` ở mọi bảng để phục vụ audit.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | database/init.sql |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Prompt mang lại định hướng tốt.
```

---

### Prompt số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-14 |
| Công cụ AI | Gemini |
| Mục đích | Cấu hình bảo mật JWT trong Spring Boot 3.x |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Hỏi sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Làm thế nào để cài đặt xác thực và phân quyền bằng JWT trong Spring Boot 3.x cho hệ thống có 3 role: ADMIN, TEACHER và STUDENT? Hãy đưa ra các class cấu hình cơ bản (SecurityFilterChain, JwtFilter, JwtUtil).
```

#### 5.2. Bối cảnh khi viết prompt

Phần Auth/Security là một phần phức tạp của Spring Boot. Phiên bản Spring Boot 3.x có thay đổi rất nhiều về `SecurityFilterChain` so với 2.x. Tôi cần một đoạn code boilerplate chuẩn để setup hệ thống phân quyền token.

#### 5.3. Kết quả AI trả về

Gemini trả về 3 class chính với cấu trúc `OncePerRequestFilter` xử lý token ở mọi request, lấy ra user role và set vào `SecurityContextHolder`.

#### 5.4. Kết quả đã áp dụng vào bài

Áp dụng phần filter JWT do AI viết.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

AI viết code `antMatchers` (bị deprecated ở Spring 3.x), tôi phải tự sửa thành `requestMatchers`. Tôi cũng tự triển khai tính năng Refresh Token lưu database, chứ không dùng 1 token sống mãi như AI sinh ra.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [x] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | SecurityConfig.java, JwtFilter.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Rút kinh nghiệm cần phải chỉ định cực kỳ rõ là Spring Boot 3.2.x để AI khỏi sinh code cũ.
```

---

### Prompt số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-16 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Tạo khung giao diện trang danh sách bài tập lập trình |
| Phân việc liên quan | Frontend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
Viết giúp tôi một component React sử dụng Tailwind CSS để hiển thị danh sách các bài tập lập trình (Problem List). Giao diện cần có thanh tìm kiếm, dropdown lọc theo độ khó (Easy, Medium, Hard) và bảng dữ liệu hiển thị tên bài, tỉ lệ giải đúng (Acceptance Rate) và trạng thái.
```

#### 5.2. Bối cảnh khi viết prompt

Để tiết kiệm thời gian làm UI, tôi nhờ Copilot tạo khung component thay vì gõ từng thẻ HTML và class Tailwind dài dòng.

#### 5.3. Kết quả AI trả về

Copilot cung cấp mã nguồn `ProblemList.jsx` rất đẹp, có cả state để xử lý input người dùng và layout responsive mượt mà.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi bê nguyên khung UI Tailwind vào project.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thay đổi toàn bộ logic hiển thị dữ liệu tĩnh bằng fetch API từ Backend Spring Boot. Tách UI thành các file con nhỏ lẻ để đảm bảo code gọn gàng.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | ProblemList.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Dùng AI làm frontend UI là cực kỳ hiệu quả.
```

---

### Prompt số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-23 |
| Công cụ AI | Antigravity |
| Mục đích | Giải thích luồng hoạt động của Course Detail, sửa giao diện báo lỗi và thêm dữ liệu mẫu Database |
| Phân việc liên quan | Backend, Frontend, Database |
| Mức độ sử dụng | Hỗ trợ tự động sửa code |

#### 5.1. Prompt nguyên văn

```text
Vì sao tôi tạo course không được, và hãy phân tích tôi muốn khi mà tạo course nếu tạo không được thì hãy báo rõ lỗi cho tôi, hiện lỗi theo kiểu UI Premium nhé
```

#### 5.2. Bối cảnh khi viết prompt

Khi test tính năng tạo khóa học trên giao diện Instructor, hệ thống chỉ báo "Validation Error" mà không nói rõ lý do tại sao lỗi, gây khó khăn cho việc debug.

#### 5.3. Kết quả AI trả về

AI tự động đọc code React và Spring Boot, phát hiện ra Frontend đã gán cứng câu lỗi thay vì đọc response JSON từ Backend. Hơn nữa, AI phát hiện ra DB thiếu thông tin tài khoản Instructor. AI đã tự viết lại 2 đoạn mã nguồn React để fix lỗi và đổi giao diện Glassmorphism cực kỳ đẹp.

#### 5.4. Kết quả đã áp dụng vào bài

Áp dụng 100% phần mã nguồn React do Antigravity sinh ra.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Chỉ việc cấp quyền để AI trực tiếp ghi vào file, sau đó tôi tự insert thêm tài khoản của mình vào database.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | instructorService.ts, InstructorDashboard.tsx |
| Screenshot |  |
| Kết quả chạy/test | Đã hiển thị báo lỗi chi tiết thay vì chung chung |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Agentic AI như Antigravity vượt trội hơn hẳn các công cụ chat truyền thống vì khả năng tự đọc code, phân tích hệ thống và áp dụng thay đổi trực tiếp.
```

---


---

---


### Prompt số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích | Xử lý lỗi Invalid Cookie trong Spring Security |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Hỏi kiến thức |

#### 5.1. Prompt nguyên văn

```text
Hệ thống báo lỗi: 'A cookie header was received... that contained an invalid cookie'. Token của tôi vẫn còn hạn. Hãy phân tích cấu trúc Cookie header và gợi ý cách fix lỗi trên Spring Security filter.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / Security, tôi gặp rào cản kỹ thuật nên cần tham vấn Gemini.

#### 5.3. Kết quả AI trả về

AI phân tích rằng lỗi do trình duyệt gửi định dạng Cookie không hợp lệ (thường do tracking cookie của bên thứ 3) khiến Tomcat/Spring boot chặn request. Gợi ý cấu hình lại `CookieProcessor` thành `LegacyCookieProcessor` hoặc xóa token thủ công ở frontend.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng giải pháp cấu hình lại Tomcat Servlet Web Server Factory ở lớp cấu hình chính.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi quyết định dùng giải pháp clean cookie ở phía Client (React) bằng interceptor thay vì hạ cấp bảo mật của Tomcat.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | axiosClient.js |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
AI giúp tìm ra nguyên nhân gốc rễ rất nhanh, tiết kiệm hàng giờ mò mẫm log.
```

---

### Prompt số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Debug lỗi kết nối WebSocketSession |
| Phân việc liên quan | Backend / WebSocket |
| Mức độ sử dụng | Hỗ trợ debug lỗi |

#### 5.1. Prompt nguyên văn

```text
Khi tôi khởi tạo WebSocket, log báo 'WebSocketSession[0 current WS(0)... 0 closed abnormally]'. Kết nối bị drop ngay lập tức. Hãy chỉ ra các nguyên nhân tiềm năng liên quan đến SockJsScheduler.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / WebSocket, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI chỉ ra 3 nguyên nhân: thiếu cấu hình allowed origins, thiếu thư viện SockJS ở client, hoặc xung đột với JWT Filter khiến request handshake bị HTTP 401 chặn.

#### 5.4. Kết quả đã áp dụng vào bài

Áp dụng cấu hình bypass JWT token kiểm tra cho endpoint `/ws/**`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tự viết thêm logic truyền token qua URL parameters thay vì Header vì WebSocket JS thuần không hỗ trợ set Header tùy chỉnh.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [x] Cần hỏi lại AI nhiều lần
- [x] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | WebSocketConfig.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Gợi ý của AI khá chung chung, phải hỏi lại nhiều lần mới ra lỗi thực sự do Header.
```

---

### Prompt số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Tích hợp Cloudinary Upload Video/Image |
| Phân việc liên quan | Backend / Cloud |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 5.1. Prompt nguyên văn

```text
Viết một service class trong Spring Boot tích hợp Cloudinary SDK để upload file ảnh và video. Yêu cầu có kiểm tra dung lượng tối đa và định dạng file, trả về secure_url.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / Cloud, tôi gặp rào cản kỹ thuật nên cần tham vấn GitHub Copilot.

#### 5.3. Kết quả AI trả về

Copilot sinh ra `CloudinaryService.java` dùng `ObjectUtils.asMap` để truyền tham số `resource_type: auto`. Có hàm check validation cơ bản.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng cấu trúc code upload file API do Copilot sinh.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tự bổ sung cấu hình file size trong `application.yml` và ném ra Custom Exception thay vì `RuntimeException` mặc định.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CloudinaryService.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Copilot code rất chuẩn xác theo docs của Cloudinary.
```

---

### Prompt số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Thiết kế luồng tạo Course với Upload Media |
| Phân việc liên quan | Frontend / React |
| Mức độ sử dụng | Hỏi kiến trúc |

#### 5.1. Prompt nguyên văn

```text
Tôi muốn thiết kế luồng tạo khoá học (Create Course) gồm upload thumbnail và video bài học. Hãy gợi ý luồng thực thi: nên upload trực tiếp từ Frontend lên Cloudinary hay phải thông qua Backend proxy? Ưu nhược điểm là gì?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Frontend / React, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI đưa ra 2 luồng: Signed Upload (qua Backend) và Unsigned Upload (từ Frontend). Đề xuất Signed Upload để bảo mật API Key của Cloudinary.

#### 5.4. Kết quả đã áp dụng vào bài

Chọn luồng Signed Upload qua Backend proxy.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Sửa lại React Component để hiển thị progress bar trong lúc chờ Backend upload file lên Cloudinary.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseCreate.tsx, UploadController.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Phân tích kiến trúc rõ ràng, giúp tôi chọn được giải pháp bảo mật nhất.
```

---

### Prompt số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Tối ưu hóa mã nguồn luồng Create Course |
| Phân việc liên quan | Frontend / React |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 5.1. Prompt nguyên văn

```text
Luồng upload video khi tạo khoá học hiện tại bị giật lag giao diện (UI block) do file lớn. Hãy gợi ý cách xử lý bất đồng bộ (async/await) kết hợp với Web Worker trong React.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Frontend / React, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI đưa ra ví dụ dùng Web Worker để chia nhỏ file, tuy nhiên đề xuất dùng `FormData` với `axios` onUploadProgress đơn giản hơn nhiều.

#### 5.4. Kết quả đã áp dụng vào bài

Dùng tính năng `onUploadProgress` của axios theo gợi ý.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tự custom lại giao diện thanh tiến trình (progress bar) bằng Tailwind.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [x] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | instructorService.ts |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Giải pháp AI đưa ra thực tế và dễ triển khai hơn định hướng ban đầu của tôi.
```

---

### Prompt số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích | Cập nhật state React sau khi upload |
| Phân việc liên quan | Frontend / State Management |
| Mức độ sử dụng | Hỗ trợ sửa lỗi |

#### 5.1. Prompt nguyên văn

```text
Sau khi upload thumbnail thành công, state chứa URL ảnh không cập nhật ngay trên giao diện preview. Hãy review lại cách dùng useEffect và useState trong trường hợp này.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Frontend / State Management, tôi gặp rào cản kỹ thuật nên cần tham vấn Gemini.

#### 5.3. Kết quả AI trả về

AI phát hiện tôi truyền sai dependency array trong `useEffect` và hướng dẫn cách set state theo hướng functional update.

#### 5.4. Kết quả đã áp dụng vào bài

Sửa lại logic `setThumbnail(prev => newUrl)`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thêm skeleton loading trong lúc ảnh đang render.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseCreate.tsx |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Lỗi cơ bản của React nhưng có AI dò hộ nên fix cực nhanh.
```

---

### Prompt số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Viết commit message chuẩn Conventional Commits |
| Phân việc liên quan | Git |
| Mức độ sử dụng | Hỗ trợ ít |

#### 5.1. Prompt nguyên văn

```text
Tôi vừa hoàn thành tính năng upload Cloudinary cho Course và Lesson. Hãy sinh cho tôi 3 option commit message tuân thủ chuẩn Conventional Commits.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Git, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI trả về các option như: `feat(course): integrate Cloudinary for media upload`, `refactor(upload): optimize upload flow`...

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng `feat(course): integrate Cloudinary for media upload`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Bổ sung thêm mô tả chi tiết ở phần body của commit.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Git Log |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Tiện lợi khi bí từ.
```

---

### Prompt số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích | Debug lỗi Video HTML5 không phát |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Hỗ trợ debug |

#### 5.1. Prompt nguyên văn

```text
Tôi render thẻ <video> của HTML5 với URL từ Cloudinary nhưng trình duyệt báo lỗi và không tự chạy (autoplay). Vấn đề là do đâu?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Frontend / UI, tôi gặp rào cản kỹ thuật nên cần tham vấn Gemini.

#### 5.3. Kết quả AI trả về

AI giải thích chính sách autoplay của Chrome yêu cầu thẻ video phải có thuộc tính `muted`. Đồng thời URL cần dùng https.

#### 5.4. Kết quả đã áp dụng vào bài

Thêm thuộc tính `muted`, `playsInline` vào thẻ video.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Xử lý thêm sự kiện `onError` để hiển thị ảnh thumbnail thay thế nếu video bị hỏng.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | LessonPlayer.tsx |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Rất hài lòng vì AI nắm rõ chính sách của trình duyệt.
```

---

### Prompt số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Hoàn thiện component Video Player |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 5.1. Prompt nguyên văn

```text
Tạo một Custom Video Player component bọc ngoài HTML5 video, có các nút custom play/pause và progress bar dùng Tailwind.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Frontend / UI, tôi gặp rào cản kỹ thuật nên cần tham vấn GitHub Copilot.

#### 5.3. Kết quả AI trả về

Copilot sinh ra đoạn code dùng `useRef` để gọi `.play()` và `.pause()`, tính toán tiến trình dựa trên `timeupdate` event.

#### 5.4. Kết quả đã áp dụng vào bài

Áp dụng phần logic xử lý event `timeupdate`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tự viết lại 100% CSS bằng chuẩn Glassmorphism do code của Copilot hơi cũ.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [x] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CustomVideoPlayer.tsx |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Code base tốt nhưng UI hơi xấu, cần tự customize nhiều.
```

---

### Prompt số 15

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Sinh kịch bản test (Test Plan) |
| Phân việc liên quan | Testing |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Hãy lên danh sách các case cần test cho tính năng Upload Video trong khoá học. Bao gồm cả happy path và edge cases.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Testing, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI liệt kê 10 test cases: file đúng chuẩn, file quá dung lượng, file sai định dạng (pdf), rớt mạng khi đang upload...

#### 5.4. Kết quả đã áp dụng vào bài

Dùng danh sách này làm checklist kiểm thử thủ công.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Bổ sung thêm case test upload đồng thời nhiều file.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | N/A |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Giúp QA quy trình chặt chẽ hơn, không bỏ sót bug.
```

---

### Prompt số 16

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích | Thiết kế luồng cập nhật ảnh (Edit Thumbnail) |
| Phân việc liên quan | Frontend / Component |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 5.1. Prompt nguyên văn

```text
Giao diện Edit Course của tôi đang thiếu chỗ cập nhật Thumbnail. Hãy gợi ý cách thiết kế UI để vừa preview ảnh cũ, vừa hỗ trợ kéo thả (drag & drop) ảnh mới đè lên.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Frontend / Component, tôi gặp rào cản kỹ thuật nên cần tham vấn Gemini.

#### 5.3. Kết quả AI trả về

AI đề xuất dùng một khung Dropzone mờ, hiển thị ảnh cũ làm background, khi hover sẽ hiện biểu tượng Camera và chữ 'Change Image'.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng ý tưởng thiết kế Dropzone đè lên background.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Sử dụng thư viện `react-dropzone` thay vì viết drag-and-drop thuần để bắt event mượt hơn.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | ThumbnailUploader.tsx |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Ý tưởng UI UX cực kỳ hiện đại, áp dụng vào dự án rất đẹp.
```

---

### Prompt số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Refactor Tailwind CSS cho giao diện Premium |
| Phân việc liên quan | Frontend / CSS |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 5.1. Prompt nguyên văn

```text
Cải tiến đoạn code Tailwind này để nó trông 'Premium' hơn: thêm hiệu ứng đổ bóng mượt (soft shadow), bo góc lớn, border gradient và hiệu ứng chuyển động khi hover.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Frontend / CSS, tôi gặp rào cản kỹ thuật nên cần tham vấn GitHub Copilot.

#### 5.3. Kết quả AI trả về

Copilot sinh ra các class Tailwind cực kỳ phức tạp: `hover:shadow-2xl transition-all duration-300 ring-1 ring-white/10...`.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng các class tạo soft shadow và transition.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tinh chỉnh lại màu gradient cho hợp với tone màu cam-xanh của hệ thống.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | InstructorDashboard.tsx |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Copilot biết cách phối hợp các util classes của Tailwind cực kỳ tốt.
```

---

### Prompt số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Fix bug không hiển thị Thumbnail ở Course List |
| Phân việc liên quan | Backend / DTO |
| Mức độ sử dụng | Hỗ trợ debug |

#### 5.1. Prompt nguyên văn

```text
Khi tôi lưu Thumbnail xong, trong database đã có URL nhưng API trả về danh sách Course cho Instructor lại bị null trường `thumbnailUrl`. Vấn đề ở đâu trong MapStruct?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / DTO, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI chỉ ra rằng file `CourseMapper.java` chưa map trường này sang DTO tương ứng (có thể do sai tên biến giữa Entity và DTO).

#### 5.4. Kết quả đã áp dụng vào bài

Thêm `@Mapping(source = "thumbnailUrl", target = "thumbnailUrl")` vào file Mapper.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Cấu hình lại MapStruct để báo lỗi lúc compile thay vì ignore khi thiếu map field.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseMapper.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Rất hiệu quả trong việc debug lỗi data binding.
```

---

### Prompt số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Refactor code: Loại bỏ hardcode 'Level' |
| Phân việc liên quan | Backend / Service |
| Mức độ sử dụng | Hỗ trợ refactor |

#### 5.1. Prompt nguyên văn

```text
Trong codebase hiện tại có rất nhiều chỗ hardcode level là 'Intermediate' hoặc 'All Levels'. Làm sao để refactor triệt để, xóa hoàn toàn field này khỏi Backend và Frontend mà không bị lỗi crash?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / Service, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI hướng dẫn quy trình 3 bước: Xóa cột trong Database bằng Flyway/Script -> Xóa trong Entity/DTO -> Chạy RegExp search toàn bộ dự án React để xóa props.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng quy trình 3 bước an toàn do AI đề xuất.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tự tay viết regex để search & destroy các component đang phụ thuộc vào Level.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseEntity.java, CourseResponse.ts |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Quy trình chuẩn kỹ sư, tránh rủi ro vỡ hệ thống.
```

---

### Prompt số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích | Tối ưu hóa Regex tìm kiếm code thừa |
| Phân việc liên quan | Công cụ |
| Mức độ sử dụng | Hỏi kiến thức |

#### 5.1. Prompt nguyên văn

```text
Viết cho tôi một regex để tìm tất cả các file TypeScript có chứa interface khai báo thuộc tính `level: string` nhưng bỏ qua các file nằm trong thư mục node_modules.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Công cụ, tôi gặp rào cản kỹ thuật nên cần tham vấn Gemini.

#### 5.3. Kết quả AI trả về

AI gợi ý cú pháp `interface.*level\s*:\s*string` kết hợp với lệnh grep exclude dir.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng regex để clean code nhanh chóng.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Chạy thẳng trên tính năng Find in Files của VSCode thay vì dùng CLI.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | VSCode |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Regex chuẩn xác.
```

---

### Prompt số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Giải thích logic gán default properties |
| Phân việc liên quan | Backend / Builder |
| Mức độ sử dụng | Hỏi kiến thức |

#### 5.1. Prompt nguyên văn

```text
Trong Lombok Builder, tại sao khi tạo mới một CourseEntity, tôi không truyền Level mà hệ thống lại tự gán là 'All Levels'? Tính năng này được định nghĩa ở đâu?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / Builder, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI giải thích về `@Builder.Default` của Lombok và hàm hook `@PrePersist` trong JPA.

#### 5.4. Kết quả đã áp dụng vào bài

Tìm ra nguyên nhân gốc và xóa dòng gán mặc định.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Kiểm tra thêm toàn bộ các Entity khác xem có bị lạm dụng Builder.Default không.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseEntity.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Giải đáp thắc mắc về cơ chế chạy ngầm của thư viện rất hay.
```

---

### Prompt số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích | Thiết kế luồng trạng thái Khóa học |
| Phân việc liên quan | System Design |
| Mức độ sử dụng | Hỏi kiến trúc |

#### 5.1. Prompt nguyên văn

```text
Tôi muốn quản lý vòng đời khoá học: Tạo mới -> DRAFTS. Nhấn Submit -> PENDING (chờ duyệt). Admin duyệt -> PUBLISHED. Hãy gợi ý thiết kế Enum trạng thái và phương thức chuyển đổi bảo mật trong Service.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần System Design, tôi gặp rào cản kỹ thuật nên cần tham vấn Gemini.

#### 5.3. Kết quả AI trả về

AI đề xuất tạo `CourseStatus` enum. Đề xuất quy tắc State Machine: chỉ được chuyển từ DRAFT sang PENDING, không cho phép đi ngược tùy tiện.

#### 5.4. Kết quả đã áp dụng vào bài

Tạo enum `CourseStatus` với các giá trị DRAFTS, PENDING, APPROVED, REJECTED.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thêm một bảng Log để lưu lịch sử chuyển trạng thái kèm lý do từ chối của Admin.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseStatus.java, CourseService.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Định hướng kiến trúc rất chặt chẽ, bảo mật.
```

---

### Prompt số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Sinh code chuyển trạng thái Course |
| Phân việc liên quan | Backend / API |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 5.1. Prompt nguyên văn

```text
Viết hàm `submitForReview(courseId)` trong `InstructorCourseService`. Yêu cầu kiểm tra nếu khóa học không phải DRAFTS thì ném lỗi `IllegalStateException`, ngược lại thì đổi thành PENDING.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / API, tôi gặp rào cản kỹ thuật nên cần tham vấn GitHub Copilot.

#### 5.3. Kết quả AI trả về

Copilot sinh chuẩn logic check DB, ném exception `ErrorCode.INVALID_STATE` nếu điều kiện không thỏa.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng logic kiểm tra trạng thái do Copilot viết.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thêm logic validate: Khóa học phải có ít nhất 1 Chapter và 1 Lesson mới được Submit.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | InstructorCourseService.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Copilot hiểu context dự án rất tốt, code pass bài test ngay.
```

---

### Prompt số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Xử lý logic khóa (lock) chỉnh sửa Lesson |
| Phân việc liên quan | Backend / Logic |
| Mức độ sử dụng | Hỗ trợ giải thuật |

#### 5.1. Prompt nguyên văn

```text
Trong hệ thống LMS, khi một Lesson đang ở trạng thái 'Bảo trì', giảng viên không được phép edit nội dung của nó. Hãy viết logic validator kiểm tra điều kiện này ở lớp Controller.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / Logic, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI đề xuất viết một Custom Annotation `@CheckLessonEditable` kết hợp AOP để tái sử dụng, thay vì if/else cứng trong từng hàm API.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi nhận thấy AOP quá phức tạp cho phase này nên chỉ dùng if-else thông thường ở Service.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Viết hàm `checkLessonEditable()` trong Service để tái sử dụng.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | LessonService.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
AI gợi ý dùng kỹ thuật nâng cao (AOP), tôi đã học thêm kiến thức mới dù chưa áp dụng.
```

---

### Prompt số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Gemini |
| Mục đích | Hiển thị trạng thái khóa học cho Học viên |
| Phân việc liên quan | Frontend / React |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 5.1. Prompt nguyên văn

```text
Khi học viên truy cập bài học bị khóa, hãy trả về UI hiển thị 'Bài học đang bảo trì' với hình ảnh icon minh hoạ, không render Video Player. Cho tôi code UI bằng Tailwind.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Frontend / React, tôi gặp rào cản kỹ thuật nên cần tham vấn Gemini.

#### 5.3. Kết quả AI trả về

AI trả về component `MaintenanceScreen` với biểu tượng cờ lê và màu xám nhạt, cực kỳ thân thiện với người dùng.

#### 5.4. Kết quả đã áp dụng vào bài

Áp dụng component `MaintenanceScreen` vào hệ thống.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thêm nút 'Back to Course' để user dễ điều hướng quay lại.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | LessonPlayer.tsx |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
UI xử lý edge-case rất chuyên nghiệp.
```

---

### Prompt số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Thiết kế luồng Admin duyệt trạng thái |
| Phân việc liên quan | Backend / Flow |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Nếu bài học bị khóa (Không hoạt động), ai sẽ là người mở khóa? Admin hay Giảng viên? Đưa ra best practices cho nền tảng giáo dục lớn.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / Flow, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI phân tích: Giảng viên tự bật tắt bảo trì, nhưng nếu bài học bị REPORT (báo cáo vi phạm), Admin mới là người có quyền khóa/mở khóa. Khuyên dùng 2 cột: `is_active` (cho GV) và `is_blocked_by_admin` (cho Admin).

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng mô hình 2 biến cờ (flags) để phân rõ quyền quản lý.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tích hợp cờ này vào JWT Payload để Frontend dễ hiển thị UI tương ứng.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | LessonEntity.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Kiến thức về phân quyền của AI sâu sắc, giải quyết triệt để tranh chấp quyền hạn.
```

---

### Prompt số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | ChatGPT |
| Mục đích | Giới hạn phạm vi API (Separation of Concerns) |
| Phân việc liên quan | Backend / Controller |
| Mức độ sử dụng | Hỏi kiến trúc |

#### 5.1. Prompt nguyên văn

```text
Nên gộp chung API lấy khóa học của Admin, Instructor và Student vào 1 hàm `/courses` hay chia làm 3 Controller riêng biệt?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / Controller, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI khuyên cực kỳ mạnh mẽ nên tách ra làm 3 Controller: `AdminCourseController`, `InstructorCourseController`, `PublicCourseController` để tránh rò rỉ dữ liệu và dễ bảo trì.

#### 5.4. Kết quả đã áp dụng vào bài

Tiến hành bóc tách toàn bộ API Course ra thành 3 luồng riêng biệt.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tự cấu hình lại Filter Security theo đường dẫn `/api/v1/instructor/**`.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Controllers |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Quyết định refactor này giúp hệ thống bảo mật dữ liệu tuyệt đối.
```

---

### Prompt số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Sinh code MapStruct DTO riêng rẽ |
| Phân việc liên quan | Backend / DTO |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 5.1. Prompt nguyên văn

```text
Tạo interface MapStruct chuyển CourseEntity thành `StudentCourseResponse` (chỉ lộ thông tin cơ bản) và `InstructorCourseResponse` (lộ cả doanh thu, trạng thái DRAFT).
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / DTO, tôi gặp rào cản kỹ thuật nên cần tham vấn GitHub Copilot.

#### 5.3. Kết quả AI trả về

Copilot tự động mapping chính xác, loại bỏ các thuộc tính private (như doanh thu) khỏi `StudentCourseResponse`.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng hoàn toàn code Mapper sinh bởi Copilot.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thêm tính năng escape HTML cho phần mô tả ở luồng Public.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseMapper.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Viết DTO Mapping bằng Copilot là công việc nhàn nhất.
```

---

### Prompt số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | Gemini |
| Mục đích | Ngăn ngừa lộ thông tin (Data Leakage) |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Hỏi phương pháp |

#### 5.1. Prompt nguyên văn

```text
Khi bài học ở trạng thái INACTIVE, làm sao để chắc chắn Frontend không bao giờ nhận được URL video bí mật từ Backend?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / Security, tôi gặp rào cản kỹ thuật nên cần tham vấn Gemini.

#### 5.3. Kết quả AI trả về

AI khuyên: Đừng phó mặc cho Frontend che giao diện (vì hacker có thể xem Network Response). Backend phải chủ động set giá trị URL = null trong DTO trước khi Serialize JSON trả về.

#### 5.4. Kết quả đã áp dụng vào bài

Áp dụng phương pháp làm 'rỗng' dữ liệu nhạy cảm tại tầng Service.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Viết một hàm Utility chung để clean sensitive data cho các Lesson Inactive.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseService.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Một nguyên tắc bảo mật cực kỳ cơ bản nhưng rất dễ bị quên nếu không có AI nhắc.
```

---

### Prompt số 30

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | ChatGPT |
| Mục đích | Tóm tắt và chốt kế hoạch Refactor |
| Phân việc liên quan | Tài liệu hóa |
| Mức độ sử dụng | Tổng hợp |

#### 5.1. Prompt nguyên văn

```text
Dựa trên các thay đổi về trạng thái khóa học, luồng duyệt của Admin và bảo vệ dữ liệu INACTIVE, hãy viết cho tôi một bản tóm tắt kỹ thuật (Technical Plan) để chốt trước khi deploy.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Tài liệu hóa, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI trả về một danh sách các công việc đã làm dạng Checklist rõ ràng, có phân mục Database, Backend, Frontend.

#### 5.4. Kết quả đã áp dụng vào bài

Dùng đoạn văn bản này để viết ghi chú Commit (Release Note).

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Chỉnh sửa lại một số thuật ngữ tiếng Anh cho đúng với Convention của dự án.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CHANGELOG.md |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
AI tổng hợp dữ liệu rất mạch lạc, tiện cho việc báo cáo.
```

---

### Prompt số 31

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Gemini |
| Mục đích | Phân tích luồng API Course Detail |
| Phân việc liên quan | Backend / API |
| Mức độ sử dụng | Giải thích logic |

#### 5.1. Prompt nguyên văn

```text
Hệ thống đang có 2 luồng get Course Detail cho Instructor và Student. Hãy phân tích sự khác biệt về DTO trả về và logic check permission trong file `CourseService.java`.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / API, tôi gặp rào cản kỹ thuật nên cần tham vấn Gemini.

#### 5.3. Kết quả AI trả về

AI phân tích rõ ràng: Luồng Student phải kiểm tra xem khóa học đã PUBLISHED chưa, trong khi luồng Instructor kiểm tra quyền sở hữu ID.

#### 5.4. Kết quả đã áp dụng vào bài

Dùng kết quả phân tích để viết API Documentation (Swagger).

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Bổ sung thêm mô tả lỗi 403 Forbidden vào tài liệu.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | Swagger API |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Đọc code ngược rất tốt, giải thích dễ hiểu cho người mới vào team.
```

---

### Prompt số 32

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | ChatGPT |
| Mục đích | Giải thích MapStruct Expressions |
| Phân việc liên quan | Backend / MapStruct |
| Mức độ sử dụng | Hỏi kiến thức |

#### 5.1. Prompt nguyên văn

```text
Trong MapStruct có cú pháp `expression = "java(mapper.map(...))"`, cú pháp này hoạt động ngầm (under the hood) như thế nào so với custom method?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / MapStruct, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI giải thích expression sẽ chèn nguyên chuỗi java code vào class Impl sinh tự động, chạy nhanh hơn custom method reflection nhưng dễ bị lỗi compile nếu gõ sai chính tả.

#### 5.4. Kết quả đã áp dụng vào bài

Hiểu rõ bản chất để quyết định chuyển sang dùng `qualifiedByName` thay vì viết chuỗi cứng `expression` để an toàn type-safe.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Refactor lại file `CourseMapper.java`.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | CourseMapper.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Kiến thức chuyên sâu, giúp tôi nâng cấp chất lượng code (Best Practice).
```

---

### Prompt số 33

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Sinh script Mock Data (Seeding) an toàn |
| Phân việc liên quan | Database / Seeding |
| Mức độ sử dụng | Hỗ trợ sinh code |

#### 5.1. Prompt nguyên văn

```text
Tạo 1 file SQL insert 10 bản ghi danh mục (Categories) lập trình (VD: Web, Mobile, Data Science). Yêu cầu dùng cú pháp INSERT IGNORE hoặc ON CONFLICT DO NOTHING để tránh lỗi duplicate key.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Database / Seeding, tôi gặp rào cản kỹ thuật nên cần tham vấn GitHub Copilot.

#### 5.3. Kết quả AI trả về

Copilot sinh ra 10 dòng lệnh chuẩn PostgreSQL `INSERT INTO categories ... ON CONFLICT (name) DO NOTHING`.

#### 5.4. Kết quả đã áp dụng vào bài

Copy vào file Data Seeder chạy ngầm khi khởi động Docker.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tự cập nhật tên các danh mục tiếng Việt cho phù hợp yêu cầu bài giảng.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | data.sql |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Cú pháp chống duplicate rất chính xác.
```

---

### Prompt số 34

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | ChatGPT |
| Mục đích | Debug lỗi 500 khi Tạo Khóa Học |
| Phân việc liên quan | Backend / Debug |
| Mức độ sử dụng | Hỗ trợ xử lý sự cố |

#### 5.1. Prompt nguyên văn

```text
Giao diện báo 'Validation Error' chung chung khi tạo khóa học. Kiểm tra log Backend báo lỗi `EntityNotFoundException: Instructor not found`. Vấn đề là do tài khoản thiếu ROLE hay thiếu Record?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Backend / Debug, tôi gặp rào cản kỹ thuật nên cần tham vấn ChatGPT.

#### 5.3. Kết quả AI trả về

AI phân tích: User có `ROLE_INSTRUCTOR` để vào trang Dashboard, nhưng database vừa bị reset nên bảng `instructors` trống, dẫn đến API get profile bị crash.

#### 5.4. Kết quả đã áp dụng vào bài

Tự tay chạy SQL insert bù một record vào bảng `instructors` cho tài khoản test.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Đồng thời bổ sung logic: tự động tạo Instructor Profile trống nếu user có Role giảng viên đăng nhập lần đầu.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | AuthService.java |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Suy luận logic cực kỳ bén, tìm ra sự thiếu đồng bộ giữa User Role và Profile Data.
```

---

### Prompt số 35

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Gemini |
| Mục đích | Cải tiến giao diện (Premium Error UI) |
| Phân việc liên quan | Frontend / React / Tailwind |
| Mức độ sử dụng | Hỗ trợ thiết kế UI |

#### 5.1. Prompt nguyên văn

```text
Sửa lại khung hiển thị lỗi ở `InstructorDashboard.tsx`. Thay vì alert đỏ tĩnh, hãy hứng `err.message` từ API và thiết kế khung thông báo theo phong cách Premium Glassmorphism (có gradient dọc, shadow mượt).
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thực hiện phần Frontend / React / Tailwind, tôi gặp rào cản kỹ thuật nên cần tham vấn Gemini.

#### 5.3. Kết quả AI trả về

AI đưa ra cụm class Tailwind cực xịn: `bg-gradient-to-r from-red-50 ... shadow-[0_8px_16px_...] animate-fade-in` và bắt chính xác `err.message`.

#### 5.4. Kết quả đã áp dụng vào bài

Thay thế toàn bộ khối xử lý lỗi ở Frontend bằng code AI sinh.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Chỉnh nhẹ lại font chữ `tracking-wider` để nhìn cá tính hơn.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| File liên quan | InstructorDashboard.tsx |
| Kết quả chạy/test | Đã giải quyết được lỗi |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Code giao diện của AI cực kỳ mãn nhãn, kết quả vượt ngoài kỳ vọng.
```

---

## 6. Prompt quan trọng nhất

Chọn một prompt có ảnh hưởng lớn nhất đến bài tập/project.

### 6.1. Prompt được chọn

```text
Tôi có một bảng Submission lưu kết quả chấm bài. Làm sao để viết một câu truy vấn SQL tối ưu lấy ra bảng xếp hạng (Leaderboard) của một Contest cụ thể: mỗi User chỉ lấy bài nộp điểm cao nhất của từng Problem, sau đó tính tổng điểm, nếu bằng điểm thì xếp hạng theo tổng thời gian nộp nhanh nhất?
```

### 6.2. Vì sao prompt này quan trọng?

```text
Tính năng xem Bảng xếp hạng (Leaderboard) là core feature của mọi hệ thống Online Judge. Việc viết SQL để lấy được chính xác điểm cao nhất của từng người dùng trong từng bài, rồi sum lại là một câu truy vấn siêu phức tạp. Nếu truy vấn chậm, server sẽ sập ngay khi thi đấu.
```

### 6.3. Kết quả prompt này mang lại

```text
Tôi biết đến khái niệm Window Function `ROW_NUMBER() OVER()` để nhóm dữ liệu mà không bị mất cột chi tiết. Câu truy vấn AI gợi ý giúp thời gian load bảng xếp hạng giảm từ O(N) vòng lặp trong code Java xuống chỉ còn vài milliseconds trong DB.
```

### 6.4. Sinh viên/nhóm đã kiểm tra kết quả như thế nào?

```text
Chạy thử câu query trên MySQL Workbench với 10,000 dữ liệu mock và kiểm tra EXPLAIN PLAN để xem index có được sử dụng chưa.
```

### 6.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

```text
Tôi dùng Native Query trong Spring Data JPA để tích hợp SQL vào code, đồng thời viết script tạo Index cho cột contest_id để tăng thêm hiệu năng.
```

---

## 7. Prompt chưa hiệu quả

Ghi lại ít nhất một prompt chưa tạo ra kết quả tốt hoặc chưa phù hợp.

### 7.1. Prompt chưa hiệu quả

```text
Viết cho tôi backend Spring Boot cho project Online Judge.
```

### 7.2. Vì sao prompt này chưa hiệu quả?

```text
Quá ngắn gọn, chung chung và phạm vi yêu cầu lớn đến vô lý.
```

Gợi ý nguyên nhân:

- Prompt quá ngắn.
- Thiếu bối cảnh bài toán.
- Hỏi AI làm toàn bộ thay vì hỏi từng phần.

### 7.3. Cách cải thiện prompt

```text
Hỏi chia nhỏ từng module: Ví dụ "Thiết kế API cho module bài nộp (Submission)". Cung cấp thông tin về công nghệ: Spring Boot 3, Java 17.
```

### 7.4. Prompt sau khi cải tiến

```text
Tôi đang dùng Spring Boot 3 và Java 17. Hãy thiết kế cho tôi cấu trúc 1 REST API Endpoints chuẩn để xử lý tính năng Nộp bài (Submit code) của người dùng. Cần nhận các tham số gì và nên trả về JSON với format như thế nào?
```

### 7.5. Kết quả sau khi cải tiến prompt

```text
AI trả về chi tiết class DTO (Request/Response) và cấu trúc Controller chuẩn RESTful.
```

---

## 8. Bài học về cách viết prompt

### 8.1. Khi viết prompt, em/nhóm cần cung cấp thông tin gì để AI trả lời tốt hơn?

```text
Cần định rõ context (làm dự án gì, công nghệ gì, version bao nhiêu), input mong muốn và format trả về.
```

### 8.2. Em/nhóm đã học được gì về cách đặt câu hỏi cho AI?

```text
Không nên tham lam bắt AI code nguyên cả một file phức tạp. Nên hỏi logic cốt lõi, hỏi ý tưởng thiết kế, rồi mình là người tự tích hợp vào dự án.
```

### 8.3. Lần sau em/nhóm sẽ cải thiện prompt như thế nào?

```text
Kèm theo đoạn code lỗi, log console nếu hỏi debug. Kèm theo cấu trúc JSON/Database schema nếu hỏi viết SQL hoặc API.
```

---

## 9. Phân loại prompt đã sử dụng

Đánh dấu số lượng prompt theo từng nhóm.

| Loại prompt | Số lượng | Ví dụ prompt tiêu biểu |
|---|---:|---|
| Prompt phân tích yêu cầu |  |  |
| Prompt giải thích kiến thức |  |  |
| Prompt thiết kế giải pháp | 1 | Thiết kế ERD Database |
| Prompt thiết kế database | 1 | Truy vấn SQL Leaderboard |
| Prompt sinh code mẫu | 2 | Code Security JWT, Component React Tailwind |
| Prompt debug lỗi |  |  |
| Prompt viết test case |  |  |
| Prompt review code |  |  |
| Prompt tối ưu code | 1 | Dùng Window Function SQL |
| Prompt viết báo cáo |  |  |
| Prompt chuẩn bị thuyết trình |  |  |
| Prompt khác |  |  |

---

## 10. Checklist chất lượng prompt

Sinh viên/nhóm tự kiểm tra chất lượng prompt đã dùng.

| Tiêu chí | Đã đạt? | Ghi chú |
|---|:---:|---|
| Prompt có mục tiêu rõ ràng | x |  |
| Prompt có đủ bối cảnh | x |  |
| Prompt có nêu công nghệ/ngôn ngữ sử dụng | x |  |
| Prompt có nêu yêu cầu đầu ra | x |  |
| Prompt không yêu cầu AI làm toàn bộ bài một cách máy móc | x |  |
| Prompt có yêu cầu AI giải thích hoặc phân tích | x |  |
| Kết quả AI được kiểm tra lại | x |  |
| Kết quả AI được chỉnh sửa trước khi sử dụng | x |  |
| Prompt quan trọng được ghi lại đầy đủ | x |  |
| Prompt sai/chưa hiệu quả được rút kinh nghiệm | x |  |

---

## 11. Cam kết sử dụng prompt minh bạch

Sinh viên/nhóm cam kết rằng:

- Các prompt quan trọng đã được ghi lại trung thực.
- Không che giấu việc sử dụng AI trong các phần quan trọng của bài.
- Không nộp nguyên văn kết quả AI nếu chưa kiểm tra và chỉnh sửa.
- Có khả năng giải thích các phần đã sử dụng từ AI.
- Chịu trách nhiệm với sản phẩm cuối cùng.

| Đại diện sinh viên/nhóm | Ngày xác nhận |
|---|---|
| Hồ Sĩ Tấn | 2026-05-18 |
| 31 | 2026-06-29 | Antigravity | Yêu cầu tổng hợp tự động | oke giờ hãy làm theo plan cho tôi /goal... | Cập nhật tự động vào file | Có | Markdown Document |
| 32 | 2026-06-29 | Antigravity | Yêu cầu tổng hợp tự động | Hãy sửa lại giao diện vì web 100% tiếng ... | Cập nhật tự động vào file | Có | Markdown Document |
| 33 | 2026-06-29 | Antigravity | Yêu cầu tổng hợp tự động | Lỗi gì đây khi tôi nhấn submit for revie... | Cập nhật tự động vào file | Có | Markdown Document |
| 34 | 2026-06-29 | Antigravity | Yêu cầu tổng hợp tự động | tôi nói khi edit course thì course đó vẫ... | Cập nhật tự động vào file | Có | Markdown Document |
| 35 | 2026-06-29 | Antigravity | Yêu cầu tổng hợp tự động | bạn có sừa gì ảnh hưởng đến chức năng tạ... | Cập nhật tự động vào file | Có | Markdown Document |

