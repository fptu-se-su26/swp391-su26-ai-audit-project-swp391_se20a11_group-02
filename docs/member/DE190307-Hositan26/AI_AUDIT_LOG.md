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
| File liên quan | database/schema.sql |
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
