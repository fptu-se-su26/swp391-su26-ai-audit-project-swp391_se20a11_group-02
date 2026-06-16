# Prompt Log

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Ngày bắt đầu | 2026-05-11 |
| Ngày hoàn thành | 2026-06-14 |

---

## 4. Bảng tổng hợp prompt đã sử dụng

| STT | Ngày | Công cụ AI | Mục đích | Prompt tóm tắt | Kết quả chính | Có sử dụng vào bài không? | Minh chứng |
|---:|---|---|---|---|---|---|---|
| 1 | 11/05/2026 | Gemini | Hướng dẫn cấu trúc SRS | Đóng vai là một Software Architect, tôi ... | Gợi ý cấu trúc SRS chuẩn IEEE bao gồm Mụ... | Có | 3a1b4c9 |
| 2 | 12/05/2026 | ChatGPT | Phân tích UML Use Case | Dựa trên tài liệu SRS mà tôi đã có cho d... | Giải thích chi tiết <<include>> cho các ... | Có | 8f2d5e1 |
| 3 | 13/05/2026 | Gemini | Thiết kế ERD cơ sở dữ liệu | Tôi đang tiến hành thiết kế cơ sở dữ liệ... | Sinh ra các bảng, khóa chính, khóa ngoại... | Có | 7c9b3a2 |
| 4 | 14/05/2026 | ChatGPT | So sánh MySQL và PostgreSQL | Dự án của tôi dự kiến sẽ cần lưu trữ hàn... | So sánh chi tiết ưu nhược điểm, nhấn mạn... | Có | 5e4f8d2 |
| 5 | 15/05/2026 | GitHub Copilot | Thiết kế trạng thái Submission | Trong hệ thống chấm bài tự động, khi một... | Pending, Processing, Accepted, Wrong Ans... | Có | 1a2b3c4 |
| 6 | 16/05/2026 | ChatGPT | Cấu hình Spring Security JWT | Tôi đang xây dựng module xác thực cho hệ... | Cung cấp code SecurityConfig với addFilt... | Có | 9d8e7f6 |
| 7 | 17/05/2026 | Gemini | Viết Regex cho file upload | Hệ thống của tôi có chức năng cho phép n... | Chuỗi regex ^[a-zA-Z0-9_-]{1,50}\.(java|... | Có | 4b5c6d7 |
| 8 | 18/05/2026 | ChatGPT | Thiết lập Rate Limiting | Hệ thống chấm code tự động của tôi đang ... | Cung cấp thuật toán Token Bucket và code... | Có | 2f3e4d5 |
| 9 | 19/05/2026 | GitHub Copilot | Sử dụng MapStruct mapping DTO | Trong dự án Spring Boot, tôi có Entity '... | Đưa ra cấu hình maven dependency MapStru... | Có | 8a9b0c1 |
| 10 | 20/05/2026 | ChatGPT | Xử lý Exception toàn cục | Khi có lỗi xảy ra trong ứng dụng Spring ... | Code mẫu GlobalExceptionHandler bắt các ... | Có | 6e7f8a9 |
| 11 | 21/05/2026 | Gemini | Kiến trúc Async Grader | Tôi đang xây dựng hệ thống backend bằng ... | Đề xuất luồng: Controller nhận request -... | Có | 1c2b3a4 |
| 12 | 22/05/2026 | ChatGPT | Setup Redis Queue trong Java | Dựa trên kiến trúc xử lý bất đồng bộ, tô... | Hướng dẫn code RedisProducer và RedisCon... | Có | 5d6e7f8 |
| 13 | 23/05/2026 | GitHub Copilot | Tạo payload gửi sang Judge0 | Tôi cần tạo một payload JSON để gửi sang... | Code Java Record Judge0RequestDTO và hàm... | Có | 9a0b1c2 |
| 14 | 24/05/2026 | ChatGPT | Xử lý Judge0 Webhook Callback | API Judge0 cung cấp một tùy chọn `callba... | Viết controller nhận @RequestBody, kèm t... | Có | 3d4e5f6 |
| 15 | 25/05/2026 | Gemini | Viết file docker-compose | Để dễ dàng chạy thử ứng dụng ở máy local... | Cung cấp file docker-compose chuẩn kèm t... | Có | 7a8b9c0 |
| 16 | 26/05/2026 | ChatGPT | Sửa lỗi LazyInitializationException | Trong ứng dụng Spring Data JPA, tôi đang... | Giải thích vòng đời Hibernate Session và... | Có | 1f2e3d4 |
| 17 | 27/05/2026 | ChatGPT | Giải quyết N+1 Query | Sau khi xử lý LazyException, tôi bật thu... | Đề xuất sử dụng cấu hình `spring.jpa.pro... | Có | 5c6b7a8 |
| 18 | 28/05/2026 | GitHub Copilot | Setup JUnit 5 | Dự án của tôi yêu cầu phải có Unit Test.... | Khởi tạo class với @InjectMocks, @Mock v... | Có | 9f0e1d2 |
| 19 | 29/05/2026 | Gemini | Mock RedisTemplate với Mockito | Khi tôi chạy Unit Test cho hàm submitCod... | Hướng dẫn tạo mock đối tượng ListOperati... | Có | 3b4c5d6 |
| 20 | 30/05/2026 | ChatGPT | Test Custom Exception | Trong ứng dụng Spring, khi tìm một User ... | Sử dụng `assertThrows(ResourceNotFoundEx... | Có | 7e8f9a0 |
| 21 | 31/05/2026 | Antigravity | Layout Instructor Dashboard | Chuyển sang phần Frontend. Tôi đang cần ... | Cung cấp code JSX tổng thể dùng `flex h-... | Có | 1d2e3f4 |
| 22 | 01/06/2026 | Antigravity | Vẽ biểu đồ SVG | Trên Dashboard, tôi cần hiển thị một biể... | Cung cấp công thức tính Max/Min Y, cách ... | Có | 5a6b7c8 |
| 23 | 02/06/2026 | Gemini | Padding dữ liệu tháng bị thiếu | Một vấn đề xảy ra với biểu đồ: Backend t... | Viết hàm sử dụng đối tượng Date để sinh ... | Có | 9d0e1f2 |
| 24 | 03/06/2026 | ChatGPT | Tạo Date Timeframe Selector | Để tăng tương tác trên Instructor Dashbo... | Gợi ý code React với `const [timeframe, ... | Có | 3c4d5e6 |
| 25 | 04/06/2026 | GitHub Copilot | Responsive Design với Tailwind | Phần thống kê thẻ số lượng (Total Revenu... | Gợi ý sử dụng `grid grid-cols-1 sm:grid-... | Có | 7b8c9d0 |
| 26 | 05/06/2026 | Antigravity | Quản lý state cho Dynamic Form | Tại trang Admin, tôi cần xây dựng màn hì... | Hướng dẫn setup Formik với initialValues... | Có | 1a2b3c4 |
| 27 | 06/06/2026 | ChatGPT | Validation Formik + Yup | Kết hợp với thư viện Formik ở trên, tôi ... | Cung cấp mã `Yup.array().of(Yup.object()... | Có | 5e6f7a8 |
| 28 | 07/06/2026 | Gemini | Query đếm số lượng theo nhóm | Trên màn hình Admin Dashboard, tôi muốn ... | Đề xuất viết hàm JPA Query: `SELECT new ... | Có | 9b0c1d2 |
| 29 | 08/06/2026 | Antigravity | Tối ưu hiệu năng Query Tài chính | Chức năng Admin Financial Statistics tro... | Hướng dẫn viết query SQL SUM có điều kiệ... | Có | 3f4e5d6 |
| 30 | 09/06/2026 | ChatGPT | Sử dụng Spring Cache | Sau khi tối ưu SQL Tài chính, tôi nhận t... | Giải thích cách dùng @EnableCaching ở lớ... | Có | 7a8b9c0 |

---

## 5. Prompt chi tiết

### Prompt số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 11/05/2026 |
| Công cụ AI | Gemini |
| Mục đích | Hướng dẫn cấu trúc SRS |
| Phần việc liên quan | Requirement |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Đóng vai là một Software Architect, tôi đang thực hiện dự án 'Integrated Coding Education & Competitive Programming Platform' cho môn học SWP391. Hệ thống có 3 tác nhân chính: Student, Instructor, Admin. Hãy hướng dẫn tôi cấu trúc chuẩn của một tài liệu SRS (Software Requirements Specification) theo chuẩn IEEE. Đồng thời, giải thích ngắn gọn lý thuyết biểu đồ Use Case trong UML và liệt kê danh sách các Use Case cốt lõi cần có cho từng tác nhân trong hệ thống này. Tôi cần một sườn tài liệu chi tiết để chia việc cho các thành viên trong nhóm.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Requirement. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Gợi ý cấu trúc SRS chuẩn IEEE bao gồm Mục đích, Phạm vi, Yêu cầu chức năng và phi chức năng.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Sử dụng làm bộ khung template cho tài liệu SRS.
```

#### 5.5. Phần chỉnh sửa

```text
Điều chỉnh các danh mục để phù hợp với scope môn học.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3a1b4c9 |
| File liên quan | docs/SRS.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Rất hữu ích để bắt đầu dự án.
```

---

### Prompt số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 12/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Phân tích UML Use Case |
| Phần việc liên quan | Design |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Dựa trên tài liệu SRS mà tôi đã có cho dự án thi đấu lập trình trực tuyến, tôi đang gặp khó khăn trong việc phân rã các Use Case của tác nhân 'Instructor'. Hiện tại Instructor có thể tạo khóa học, tạo bài tập (Problem), quản lý học sinh và xem thống kê. Làm sao để áp dụng các quan hệ <<include>> và <<extend>> một cách hợp lý cho Use Case 'Tạo bài tập' (Ví dụ: Thêm Testcase là bắt buộc hay tùy chọn)? Hãy vẽ mô tả bằng text cho biểu đồ Use Case này.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Design. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Giải thích chi tiết <<include>> cho các hành động bắt buộc và <<extend>> cho các hành động tùy chọn.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Sử dụng làm cơ sở vẽ biểu đồ Use Case.
```

#### 5.5. Phần chỉnh sửa

```text
Điều chỉnh lại quy trình tạo Problem cho hợp lý hơn.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 8f2d5e1 |
| File liên quan | docs/UseCase.png |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Làm rõ được nghiệp vụ tạo Problem.
```

---

### Prompt số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 13/05/2026 |
| Công cụ AI | Gemini |
| Mục đích | Thiết kế ERD cơ sở dữ liệu |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Tôi đang tiến hành thiết kế cơ sở dữ liệu quan hệ (ERD) bằng MySQL cho website thi đấu lập trình. Các thực thể cốt lõi bao gồm: Users (học sinh, giảng viên), Problems (bài tập thuật toán), Submissions (lịch sử nộp bài), Contests (kỳ thi). Hãy thiết kế giúp tôi các bảng này, đảm bảo tuân thủ chuẩn hóa 3NF. Đặc biệt chú ý đến cách lưu trữ Testcases (một bài tập có nhiều testcase) và cách thiết lập khóa ngoại để không bị mồ côi dữ liệu khi xóa bài tập.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Database. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Sinh ra các bảng, khóa chính, khóa ngoại và gợi ý dùng ON DELETE CASCADE cho Testcase.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Tạo DB schema ban đầu dựa trên gợi ý.
```

#### 5.5. Phần chỉnh sửa

```text
Tự tinh chỉnh lại kiểu dữ liệu VARCHAR, TEXT.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7c9b3a2 |
| File liên quan | docs/ERD.png |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Giảm thời gian nghĩ cấu trúc bảng.
```

---

### Prompt số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 14/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | So sánh MySQL và PostgreSQL |
| Phần việc liên quan | Architecture |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Dự án của tôi dự kiến sẽ cần lưu trữ hàng triệu bản ghi submission code từ sinh viên. Giữa MySQL và PostgreSQL, hệ quản trị cơ sở dữ liệu nào phù hợp hơn cho dự án Spring Boot này? Hãy so sánh chi tiết về hiệu năng đọc/ghi, khả năng hỗ trợ kiểu dữ liệu JSON (để lưu metadata kết quả chấm bài), và sự tương thích với Hibernate. Đưa ra lời khuyên cuối cùng cho một dự án đồ án đại học.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Architecture. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
So sánh chi tiết ưu nhược điểm, nhấn mạnh PostgreSQL tốt hơn về JSON nhưng MySQL dễ setup hơn.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Quyết định chọn MySQL vì sự quen thuộc.
```

#### 5.5. Phần chỉnh sửa

```text
Tách JSON column ra bảng riêng thay vì lưu trực tiếp.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 5e4f8d2 |
| File liên quan | docs/Architecture.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Củng cố quyết định kỹ thuật.
```

---

### Prompt số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 15/05/2026 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Thiết kế trạng thái Submission |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Trong hệ thống chấm bài tự động, khi một mã nguồn (Submission) được gửi sang Judge0 API, nó sẽ trải qua nhiều giai đoạn. Hãy gợi ý cho tôi một Enum Java chứa tất cả các trạng thái (Status) có thể xảy ra của một bài nộp. Bao gồm cả các trạng thái lỗi như lỗi biên dịch (Compilation Error), quá thời gian (Time Limit Exceeded), quá bộ nhớ (Memory Limit), và lỗi server nội bộ. Giải thích ngắn gọn ý nghĩa từng trạng thái.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Database. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Pending, Processing, Accepted, Wrong Answer, TLE, MLE, CE, Internal Error.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Đưa toàn bộ Enum này vào Entity Java.
```

#### 5.5. Phần chỉnh sửa

```text
Thêm mã code ID ánh xạ trực tiếp với Judge0 API.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1a2b3c4 |
| File liên quan | src/main/java/com/app/enums/SubmissionStatus.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Copilot gợi ý rất chuẩn xác.
```

---

### Prompt số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 16/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Cấu hình Spring Security JWT |
| Phần việc liên quan | Security |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Tôi đang xây dựng module xác thực cho hệ thống bằng Java Spring Boot 3 và Spring Security 6. Tôi muốn sử dụng JWT (JSON Web Token) cho việc xác thực. Hãy cung cấp cho tôi một class SecurityFilterChain hoàn chỉnh. Yêu cầu: Cấu hình Stateless Session (không dùng Cookie/Session), mở khóa public cho các endpoint đăng nhập/đăng ký (/api/auth/**), và bắt buộc quyền ADMIN cho các endpoint (/api/admin/**). Đồng thời cấu hình luôn CORS cho phép frontend từ localhost:3000 truy cập.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Security. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Cung cấp code SecurityConfig với addFilterBefore, sessionCreationPolicy, và CorsConfigurationSource.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Nhúng vào cấu hình an ninh của dự án.
```

#### 5.5. Phần chỉnh sửa

```text
Tách logic phân quyền ra method riêng, đổi Role sang Enum.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9d8e7f6 |
| File liên quan | src/main/java/com/app/config/SecurityConfig.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Code bảo mật phức tạp nên AI hỗ trợ rất tốt.
```

---

### Prompt số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 17/05/2026 |
| Công cụ AI | Gemini |
| Mục đích | Viết Regex cho file upload |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Hệ thống của tôi có chức năng cho phép người dùng upload file mã nguồn. Để phòng tránh các cuộc tấn công Path Traversal và XSS, hãy viết một biểu thức chính quy (Regex) và một hàm java.util.regex.Pattern để validate tên file. Yêu cầu bảo mật: Tên file không chứa khoảng trắng hoặc ký tự đặc biệt, chỉ chấp nhận chữ cái, số, dấu gạch ngang, và dấu gạch dưới. Độ dài tên file từ 1-50 ký tự. Phần mở rộng bắt buộc là một trong các định dạng: .java, .cpp, .c, hoặc .py. Hãy cung cấp vài test case đúng/sai.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Backend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Chuỗi regex ^[a-zA-Z0-9_-]{1,50}\.(java|cpp|c|py)$ kèm test case.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Gắn vào lớp Request DTO validation.
```

#### 5.5. Phần chỉnh sửa

```text
Bổ sung Apache Tika để kiểm tra MIME type thực tế của file.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 4b5c6d7 |
| File liên quan | src/main/java/com/app/dto/FileUploadRequest.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Regex chạy đúng ngay lần đầu.
```

---

### Prompt số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 18/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Thiết lập Rate Limiting |
| Phần việc liên quan | Security |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Hệ thống chấm code tự động của tôi đang đối mặt với rủi ro bị spam request nộp bài liên tục, dẫn đến quá tải server Judge0. Tôi muốn triển khai cơ chế Rate Limiting bảo vệ endpoint API `/api/submissions` viết bằng Spring Boot. Yêu cầu cấu hình: Mỗi User (định danh bằng UserID lấy từ JWT Token trong Spring SecurityContext) chỉ được phép nộp tối đa 5 lần trong mỗi 1 phút. Nếu vượt quá, trả về mã lỗi HTTP 429 Too Many Requests. Xin hãy cung cấp code cấu hình sử dụng thư viện Bucket4j và thiết lập HandlerInterceptorAdapter để chặn request.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Security. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Cung cấp thuật toán Token Bucket và code RateLimitInterceptor.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Tạo Interceptor và đăng ký vào WebMvcConfigurer.
```

#### 5.5. Phần chỉnh sửa

```text
Bổ sung header X-RateLimit-Remaining vào response.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 2f3e4d5 |
| File liên quan | src/main/java/com/app/interceptor/RateLimitInterceptor.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Bảo vệ hệ thống khỏi spam cơ bản.
```

---

### Prompt số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 19/05/2026 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Sử dụng MapStruct mapping DTO |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Trong dự án Spring Boot, tôi có Entity 'Problem' chứa rất nhiều trường và các List Entity con (như List<Testcase>). Tôi muốn chuyển đổi (mapping) Entity này sang 'ProblemResponseDTO' để trả về cho Frontend. Việc dùng phương thức getter/setter thủ công rất mất thời gian. Làm sao để sử dụng thư viện MapStruct để tự động hóa việc này? Hãy viết mẫu cho tôi một interface ProblemMapper sử dụng componentModel = "spring".
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Backend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Đưa ra cấu hình maven dependency MapStruct và code interface ProblemMapper với @Mapping.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Cài đặt MapStruct và tạo Mapper.
```

#### 5.5. Phần chỉnh sửa

```text
Xử lý ignore các trường nhạy cảm như hidden_testcase.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 8a9b0c1 |
| File liên quan | src/main/java/com/app/mapper/ProblemMapper.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Giảm boilerplate code đáng kể.
```

---

### Prompt số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 20/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Xử lý Exception toàn cục |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Khi có lỗi xảy ra trong ứng dụng Spring Boot (như lỗi EntityNotFound, lỗi Validation của DTO), server đang trả về một cục HTML báo lỗi 500 rất khó nhìn. Hướng dẫn tôi cách tạo một GlobalExceptionHandler bằng @RestControllerAdvice để gom tất cả các Exception lại. Yêu cầu: Định dạng JSON trả về phải bao gồm các trường: timestamp, status (mã HTTP), error (tên lỗi), và message (lời nhắn thân thiện). Viết mẫu hàm xử lý cho MethodArgumentNotValidException.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Backend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Code mẫu GlobalExceptionHandler bắt các lỗi phổ biến và gom thông điệp lỗi của DTO.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Tạo class GlobalExceptionHandler.
```

#### 5.5. Phần chỉnh sửa

```text
Thêm hàm bắt CustomException riêng của dự án.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 6e7f8a9 |
| File liên quan | src/main/java/com/app/exception/GlobalExceptionHandler.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Chuẩn hóa định dạng lỗi cho Frontend.
```

---

### Prompt số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 21/05/2026 |
| Công cụ AI | Gemini |
| Mục đích | Kiến trúc Async Grader |
| Phần việc liên quan | Architecture |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Tôi đang xây dựng hệ thống backend bằng Java Spring Boot kết hợp MySQL, tích hợp với Judge0 API để chấm điểm mã nguồn. Tôi lo ngại về vấn đề hiệu năng (bottleneck) nếu có 1000 sinh viên nộp bài đồng thời trong kỳ thi, vì API Judge0 xử lý khá lâu (vài giây mỗi bài). Hãy thiết kế cho tôi kiến trúc hệ thống chịu tải cao (High Availability) giải quyết bài toán này. Liệu tôi có nên sử dụng Message Queue (như Redis, RabbitMQ) và cơ chế xử lý bất đồng bộ (Worker background) hay không? Hãy phân tích luồng dữ liệu.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Architecture. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Đề xuất luồng: Controller nhận request -> Lưu DB trạng thái PENDING -> Đẩy vào Redis Queue -> Trả về HTTP 202 ngay lập tức. Worker chạy ngầm kéo từ Queue gửi sang Judge0.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Áp dụng kiến trúc Message Queue vào thiết kế hệ thống.
```

#### 5.5. Phần chỉnh sửa

```text
Lựa chọn Spring Data Redis thay vì Kafka vì hệ thống môn học không cần quá phức tạp.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1c2b3a4 |
| File liên quan | docs/System_Architecture.png |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Kiến trúc thay đổi toàn bộ hệ thống backend.
```

---

### Prompt số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 22/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Setup Redis Queue trong Java |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Dựa trên kiến trúc xử lý bất đồng bộ, tôi quyết định sử dụng Redis List để làm Message Queue nhẹ nhàng trong Spring Boot. Làm cách nào để cấu hình RedisTemplate và viết code để một thread Producer đẩy Submission ID vào queue (opsForList().rightPush()), trong khi một bean @Service khác đóng vai trò Consumer sử dụng @Scheduled hoặc vòng lặp while(true) để liên tục leftPop() lấy ID ra xử lý mà không làm treo ứng dụng?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Backend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Hướng dẫn code RedisProducer và RedisConsumer có sử dụng ThreadPoolTaskExecutor để chạy ngầm.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Viết Producer và Consumer cho dịch vụ nộp bài.
```

#### 5.5. Phần chỉnh sửa

```text
Dùng leftPop(timeout) (BLPOP) để tránh busy-waiting tốn CPU.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 5d6e7f8 |
| File liên quan | src/main/java/com/app/queue/RedisConsumer.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Xử lý thành công bài toán nghẽn cổ chai.
```

---

### Prompt số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 23/05/2026 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Tạo payload gửi sang Judge0 |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Tôi cần tạo một payload JSON để gửi sang API tạo submission của Judge0. Payload này phải bao gồm: source_code (String base64), language_id (Integer), stdin (String base64), expected_output (String base64). Hãy sinh cho tôi một lớp Java Record hoặc DTO sử dụng Jackson annotation (@JsonProperty) để ánh xạ chính xác các trường này. Đồng thời viết một phương thức tiện ích encode chuỗi sang Base64 trong Java.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Backend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Code Java Record Judge0RequestDTO và hàm Base64.getEncoder().encodeToString().
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Dùng class Record để tối ưu bộ nhớ.
```

#### 5.5. Phần chỉnh sửa

```text
Thêm tham số cpu_time_limit và memory_limit vào payload.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9a0b1c2 |
| File liên quan | src/main/java/com/app/dto/Judge0Request.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Giao tiếp với External API chính xác.
```

---

### Prompt số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 24/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Xử lý Judge0 Webhook Callback |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
API Judge0 cung cấp một tùy chọn `callback_url`. Khi nó chấm bài xong, nó sẽ gửi một HTTP PUT request chứa kết quả về server của tôi. Trong Spring Boot, làm sao để tôi định nghĩa một REST endpoint /api/judge0/callback nhận dữ liệu JSON này? Để đảm bảo bảo mật, làm sao tôi xác thực request này thực sự đến từ Judge0 chứ không phải hacker giả mạo (Gợi ý dùng token đính kèm trong URL query param)?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Backend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Viết controller nhận @RequestBody, kèm theo logic kiểm tra @RequestParam("token") so sánh với token lưu trong DB.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Xây dựng Webhook Controller nhận kết quả chấm bài.
```

#### 5.5. Phần chỉnh sửa

```text
Sử dụng UUID làm token chống dò đoán.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3d4e5f6 |
| File liên quan | src/main/java/com/app/controller/WebhookController.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Hoàn thiện luồng trả kết quả bất đồng bộ.
```

---

### Prompt số 15

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 25/05/2026 |
| Công cụ AI | Gemini |
| Mục đích | Viết file docker-compose |
| Phần việc liên quan | DevOps |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Để dễ dàng chạy thử ứng dụng ở máy local và triển khai lên server, tôi muốn docker hóa toàn bộ dự án. Hãy viết cho tôi một file `docker-compose.yml` gồm 3 services: 1. `mysql` (sử dụng image mysql:8.0, định nghĩa root password và database name). 2. `redis` (image redis:alpine). 3. `backend` (ứng dụng Spring Boot của tôi, build từ Dockerfile hiện tại, cần chờ mysql và redis khởi động xong trước khi chạy).
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở DevOps. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Cung cấp file docker-compose chuẩn kèm thuộc tính depends_on và healthcheck.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Dùng để deploy hệ thống lên VM server.
```

#### 5.5. Phần chỉnh sửa

```text
Thêm volume mounts để dữ liệu MySQL không mất khi restart.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7a8b9c0 |
| File liên quan | docker-compose.yml |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Triển khai dự án nhanh chóng.
```

---

### Prompt số 16

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 26/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Sửa lỗi LazyInitializationException |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Trong ứng dụng Spring Data JPA, tôi đang gặp lỗi cực kỳ khó chịu: `org.hibernate.LazyInitializationException: could not initialize proxy - no Session`. Lỗi này văng ra ở tầng Controller khi tôi gọi hàm getProblems() từ một thực thể Contest đã được load từ DB ở tầng Service. Quan hệ đang cấu hình là @OneToMany(fetch = FetchType.LAZY). Tôi KHÔNG muốn đổi sang EAGER vì dữ liệu Problem rất lớn. Hãy hướng dẫn tôi cách viết JPQL sử dụng từ khóa JOIN FETCH để khắc phục triệt để lỗi này.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Database. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Giải thích vòng đời Hibernate Session và gợi ý câu query `SELECT c FROM Contest c LEFT JOIN FETCH c.problems WHERE c.id = :id`.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Sửa lại truy vấn repository.
```

#### 5.5. Phần chỉnh sửa

```text
Chỉ JOIN FETCH trên các method cần thiết để tránh phình to dữ liệu.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1f2e3d4 |
| File liên quan | src/main/java/com/app/repository/ContestRepository.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Sửa dứt điểm lỗi hệ thống.
```

---

### Prompt số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 27/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Giải quyết N+1 Query |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Sau khi xử lý LazyException, tôi bật thuộc tính `spring.jpa.show-sql=true` và phát hiện ra lỗi N+1 Query. Khi tôi get danh sách 20 Contest, Hibernate tự động bắn thêm 20 câu lệnh SQL nữa để lấy danh sách Problems của từng Contest. Vấn đề này làm chậm server rất nhiều. Có cách nào trong Spring Data JPA (ví dụ sử dụng @EntityGraph hoặc default_batch_fetch_size) để lấy toàn bộ dữ liệu chỉ bằng 1 hoặc 2 câu lệnh SQL không?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Database. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Đề xuất sử dụng cấu hình `spring.jpa.properties.hibernate.default_batch_fetch_size=100` để fetch gom nhóm (IN clause).
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Sử dụng BatchFetch vì nó dễ cấu hình hơn EntityGraph cho nhiều Collection.
```

#### 5.5. Phần chỉnh sửa

```text
Giảm log rác trên console khi chạy thật.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 5c6b7a8 |
| File liên quan | src/main/resources/application.yml |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Tối ưu hóa hiệu năng rõ rệt.
```

---

### Prompt số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 28/05/2026 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Setup JUnit 5 |
| Phần việc liên quan | Testing |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Dự án của tôi yêu cầu phải có Unit Test. Xin hãy tạo một class test mẫu sử dụng JUnit 5 (@ExtendWith(MockitoExtension.class)) để kiểm thử class SubmissionService. Hãy khởi tạo các Mock object cho SubmissionRepository và RedisTemplate. Đồng thời viết cấu trúc Arrange - Act - Assert cho một test case đơn giản nhất (ví dụ: lấy bài nộp theo ID thành công).
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Testing. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Khởi tạo class với @InjectMocks, @Mock và method test cơ bản dùng Mockito.when().
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Dùng làm khung xương cơ sở để viết các test khác.
```

#### 5.5. Phần chỉnh sửa

```text
Chia các test case thành các inner class @Nested cho gọn gàng.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9f0e1d2 |
| File liên quan | src/test/java/com/app/service/SubmissionServiceTest.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Nắm bắt được cách viết test Spring.
```

---

### Prompt số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 29/05/2026 |
| Công cụ AI | Gemini |
| Mục đích | Mock RedisTemplate với Mockito |
| Phần việc liên quan | Testing |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Khi tôi chạy Unit Test cho hàm submitCode(), tôi gặp lỗi NullPointerException. Nguyên nhân là vì Spring Data Redis sử dụng Fluent API: `redisTemplate.opsForList().rightPush(...)`. Mockito thông thường trả về null cho `opsForList()`, dẫn đến gọi `rightPush` bị lỗi. Làm cách nào để cấu hình Mockito stub đúng cơ chế chain method này trong JUnit 5?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Testing. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Hướng dẫn tạo mock đối tượng ListOperations, sau đó stub: `when(redisTemplate.opsForList()).thenReturn(listOperationsMock)`.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Khắc phục lỗi NullPointer và test luồng xử lý queue thành công.
```

#### 5.5. Phần chỉnh sửa

```text
Sử dụng ArgumentCaptor để verify payload gửi vào redis có đúng nội dung JSON không.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3b4c5d6 |
| File liên quan | src/test/java/com/app/service/SubmissionServiceTest.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Một trick Mockito rất hay.
```

---

### Prompt số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 30/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Test Custom Exception |
| Phần việc liên quan | Testing |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Trong ứng dụng Spring, khi tìm một User không tồn tại, service của tôi sẽ ném ra `ResourceNotFoundException("User not found")`. Làm cách nào để viết Unit Test trong JUnit 5 khẳng định (assert) rằng exception này THỰC SỰ bị ném ra khi gọi phương thức với tham số sai? Và làm sao để verify thông điệp lỗi (message) bên trong exception đó có khớp chữ 'User not found' hay không?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Testing. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Sử dụng `assertThrows(ResourceNotFoundException.class, () -> service.method())` và lưu trữ exception để assert message.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Viết test case validate cho luồng dữ liệu lỗi (Sad path).
```

#### 5.5. Phần chỉnh sửa

```text
Bao phủ 100% các dòng code ném exception.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7e8f9a0 |
| File liên quan | src/test/java/com/app/service/SubmissionServiceTest.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Đảm bảo mã lỗi chuẩn xác cho frontend.
```

---

### Prompt số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 31/05/2026 |
| Công cụ AI | Antigravity |
| Mục đích | Layout Instructor Dashboard |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Chuyển sang phần Frontend. Tôi đang cần code một màn hình 'Instructor Dashboard' bằng React JS kết hợp Tailwind CSS. Hãy gợi ý cho tôi cấu trúc Component (JSX) hoàn chỉnh, bao gồm 1 Sidebar bên trái cố định (chứa menu điều hướng), 1 Header Navbar phía trên, và phần nội dung chính giữa (Main Content) sử dụng CSS Grid. Vui lòng thêm các class Tailwind để có giao diện hiện đại, chế độ sáng/tối (dark mode) và Responsive cho điện thoại.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Frontend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Cung cấp code JSX tổng thể dùng `flex h-screen`, `w-64`, `grid-cols-1 md:grid-cols-3` của Tailwind.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Sử dụng làm layout cha cho toàn bộ trang Admin và Instructor.
```

#### 5.5. Phần chỉnh sửa

```text
Tách riêng Sidebar và Header thành các Component độc lập để tái sử dụng.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1d2e3f4 |
| File liên quan | src/components/layout/DashboardLayout.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Layout khung UI vững chắc, đẹp mắt.
```

---

### Prompt số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 01/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích | Vẽ biểu đồ SVG |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Trên Dashboard, tôi cần hiển thị một biểu đồ đường (Line chart) thể hiện doanh thu theo tháng. Do yêu cầu kỹ thuật, tôi không được phép sử dụng các thư viện như Chart.js hay Recharts mà phải TỰ VẼ bằng thẻ HTML SVG. Hãy hướng dẫn tôi cách tính toán tọa độ (x, y) từ mảng dữ liệu doanh thu, và dùng thẻ `<polyline>` hoặc `<path>` để nối các điểm đó lại thành biểu đồ. Cần có đoạn mã Javascript tính toán điểm Normalize.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Frontend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Cung cấp công thức tính Max/Min Y, cách quy đổi giá trị mảng thành chuỗi tọa độ `x,y x,y` cho polyline.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Tạo component RevenueChart độc lập chuyên xử lý SVG.
```

#### 5.5. Phần chỉnh sửa

```text
Thêm sự kiện hover vào các tọa độ để hiển thị thẻ Tooltip ghi số tiền.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 5a6b7c8 |
| File liên quan | src/components/dashboard/RevenueChart.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Hoàn thành yêu cầu kỹ thuật khó của đồ án.
```

---

### Prompt số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 02/06/2026 |
| Công cụ AI | Gemini |
| Mục đích | Padding dữ liệu tháng bị thiếu |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Một vấn đề xảy ra với biểu đồ: Backend trả dữ liệu doanh thu là một mảng object `{ month: "2026-05", revenue: 500 }`. Tuy nhiên, nếu một tháng nào đó (vd 2026-04) Instructor không có giao dịch, DB sẽ không trả về dữ liệu của tháng đó. Điều này làm trục thời gian (trục hoành) của biểu đồ SVG bị đứt gãy. Hãy viết một hàm Javascript (chạy trên React) nhận vào số tháng (6 hoặc 12). Nó sẽ sinh ra danh sách n tháng gần nhất, sau đó map với dữ liệu API; tháng nào thiếu thì tự động đệm (padding) giá trị `revenue: 0` vào.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Frontend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Viết hàm sử dụng đối tượng Date để sinh mảng YYYY-MM, dùng phương thức find() kết hợp map() để chèn số 0.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Xử lý chuẩn hóa mảng dữ liệu ngay sau khi fetch từ API xong.
```

#### 5.5. Phần chỉnh sửa

```text
Sử dụng thư viện date-fns để tính toán tháng chính xác, tránh lỗi ngày cuối tháng 31/30.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9d0e1f2 |
| File liên quan | src/utils/chartHelpers.js |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Sửa lỗi logic hiển thị rất quan trọng.
```

---

### Prompt số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 03/06/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Tạo Date Timeframe Selector |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Để tăng tương tác trên Instructor Dashboard, tôi muốn thêm một Select Dropdown cho phép người dùng chọn xem dữ liệu tài chính trong khoảng '6 tháng qua', '12 tháng qua' hoặc 'Tất cả'. Làm sao để quản lý React State (useState) cho bộ lọc này? Khi người dùng thay đổi giá trị Dropdown, làm sao để gọi lại API (sử dụng useEffect) để load lại dữ liệu mà không gây ra vòng lặp vô hạn (infinite loop render)?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Frontend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Gợi ý code React với `const [timeframe, setTimeframe] = useState(6)`, đưa `timeframe` vào dependency array của useEffect.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Triển khai dropdown select ở góc phải Dashboard.
```

#### 5.5. Phần chỉnh sửa

```text
Xử lý hiển thị UI loading skeleton trong lúc đợi dữ liệu mới trả về.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3c4d5e6 |
| File liên quan | src/components/dashboard/TimeframeSelector.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Quản lý React Hook đúng chuẩn.
```

---

### Prompt số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 04/06/2026 |
| Công cụ AI | GitHub Copilot |
| Mục đích | Responsive Design với Tailwind |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Phần thống kê thẻ số lượng (Total Revenue, Total Students, Total Courses) đang được dàn trang 3 cột ngang trên màn hình Desktop. Khi tôi xem trên điện thoại di động (Mobile), nó bị tràn nội dung (overflow-x). Dựa vào các class của Tailwind CSS, làm sao để tự động chuyển layout này thành 1 cột dọc trên Mobile, 2 cột trên Tablet, và 3 cột trên Desktop? Hãy đưa ra chuỗi class grid đầy đủ.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Frontend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Gợi ý sử dụng `grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4`.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Áp dụng cho các thẻ KPI trên Dashboard.
```

#### 5.5. Phần chỉnh sửa

```text
Sửa lại padding nhỏ hơn cho thiết bị di động (p-2 thay vì p-4).
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7b8c9d0 |
| File liên quan | src/components/dashboard/StatsCards.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Tailwind CSS làm Responsive cực nhàn.
```

---

### Prompt số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 05/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích | Quản lý state cho Dynamic Form |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Tại trang Admin, tôi cần xây dựng màn hình 'Testcase Builder' để Admin tạo Bài tập thuật toán (Problem). Giao diện này phức tạp ở chỗ: Nó cần một Dynamic Form cho phép Admin ấn nút 'Add Testcase' để thêm động các trường nhập liệu (Input Data, Expected Output). Họ có thể thêm bao nhiêu testcase tùy ý, hoặc xóa bớt. Làm sao để quản lý state phức tạp này trong React? Có thư viện nào hỗ trợ mảng (Array) form tốt không, hãy hướng dẫn dùng Formik và FieldArray.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Frontend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Hướng dẫn setup Formik với initialValues là mảng, sử dụng component `<FieldArray>` để map render ra các ô input kèm nút push/remove.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Thay thế code state thuần túy, tích hợp nguyên bộ Formik vào trang tạo Problem.
```

#### 5.5. Phần chỉnh sửa

```text
Thêm validate chặn người dùng không được vượt quá 50 testcases để tránh spam DB.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1a2b3c4 |
| File liên quan | src/pages/admin/ProblemForm.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Giải pháp tốt nhất cho form động phức tạp.
```

---

### Prompt số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 06/06/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Validation Formik + Yup |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Kết hợp với thư viện Formik ở trên, tôi muốn sử dụng thư viện Yup để validate toàn bộ dữ liệu trước khi bấm Submit tạo Problem. Yêu cầu schema: Tên bài tập không được để trống, điểm số (Score) phải từ 1 đến 100. Đặc biệt, đối với MẢNG các testcases, bắt buộc cả trường input và expected_output của từng testcase đều không được rỗng. Hãy viết đối tượng Yup Schema kiểm tra mảng lồng nhau (nested array) này.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Frontend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Cung cấp mã `Yup.array().of(Yup.object().shape({...}))` xử lý object validation bên trong mảng.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Gắn schema vào thuộc tính validationSchema của Formik.
```

#### 5.5. Phần chỉnh sửa

```text
Tự động trim() chuỗi đầu vào của testcase để tránh ký tự cách thừa dẫn đến lỗi chấm bài.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 5e6f7a8 |
| File liên quan | src/pages/admin/ProblemForm.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Đảm bảo dữ liệu gửi lên DB 100% sạch sẽ.
```

---

### Prompt số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 07/06/2026 |
| Công cụ AI | Gemini |
| Mục đích | Query đếm số lượng theo nhóm |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Trên màn hình Admin Dashboard, tôi muốn hiển thị một biểu đồ tròn thống kê số lượng bài tập (Problems) phân theo độ khó (Easy, Medium, Hard). Mặc dù tôi có thể fetch toàn bộ Problems về máy chủ Java và dùng list.stream() để đếm, nhưng cách đó tốn RAM và chậm. Thay vào đó, hãy viết cho tôi một câu lệnh SQL (hoặc JPQL cho Spring Data JPA) sử dụng mệnh đề GROUP BY để cơ sở dữ liệu đếm sẵn và chỉ trả về một danh sách DTO chứa (Độ khó, Số lượng).
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Database. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Đề xuất viết hàm JPA Query: `SELECT new com.example.dto.DifficultyCountDTO(p.difficulty, COUNT(p)) FROM Problem p GROUP BY p.difficulty`.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Viết Repository Method và định nghĩa lớp Record DTO để hứng kết quả.
```

#### 5.5. Phần chỉnh sửa

```text
Sử dụng hàm COALESCE trong query để nếu nhóm độ khó không có bài nào thì vẫn trả về 0.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9b0c1d2 |
| File liên quan | src/main/java/com/app/repository/ProblemRepository.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Tối ưu hóa tài nguyên server tốt.
```

---

### Prompt số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 08/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích | Tối ưu hiệu năng Query Tài chính |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Chức năng Admin Financial Statistics trong ứng dụng Spring Boot của tôi đang gặp vấn đề hiệu năng nghiêm trọng (Load báo cáo mất hơn 5 giây). Hiện tại tôi đang sử dụng JPA fetch toàn bộ bảng `Payments` (gồm chục nghìn bản ghi) ra Object Java, sau đó dùng Java Stream để filter tháng và cộng tổng doanh thu (Total Revenue). Việc này gây tràn RAM máy chủ và tạo ra N+1 Query. Xin hãy tư vấn cách đẩy phép tính toán tổng (Aggregate functions SUM) xuống trực tiếp Database SQL, và gợi ý tôi đánh Chỉ mục (Index) lên những cột nào để query nhanh hơn.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Database. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Hướng dẫn viết query SQL SUM có điều kiện WHERE tháng/năm, và gợi ý tạo Composite Index trên các cột `(status, created_at)`.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Viết lại logic Service, bỏ Stream API, sử dụng JPQL Aggregate function.
```

#### 5.5. Phần chỉnh sửa

```text
Thực hiện Migration Script đánh Index trực tiếp trên CSDL thật.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3f4e5d6 |
| File liên quan | src/main/java/com/app/service/FinanceService.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Giảm thời gian load API tài chính từ 5s xuống 100ms.
```

---

### Prompt số 30

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 09/06/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Sử dụng Spring Cache |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ |

#### 5.1. Prompt nguyên văn

```text
Sau khi tối ưu SQL Tài chính, tôi nhận thấy dữ liệu doanh thu của các tháng cũ (Ví dụ: báo cáo tháng 1, 2, 3) là dữ liệu 'chết', không bao giờ thay đổi nữa. Tuy nhiên mỗi khi người dùng F5 xem lại, Database vẫn phải chạy lại câu lệnh SUM rất lãng phí. Hướng dẫn tôi cách cấu hình thư viện Caching (@Cacheable) có sẵn trong Spring Boot. Làm sao để lưu kết quả API thống kê tài chính của tháng X vào bộ nhớ RAM (ConcurrentMapCache), và làm sao để khóa (evict) bộ nhớ đệm này nếu cần thiết?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần giải quyết vấn đề ở Backend. Liên quan đến các chức năng phát triển môn SWP391.
```

#### 5.3. Kết quả AI trả về

```text
Giải thích cách dùng @EnableCaching ở lớp Application, và đặt annotation @Cacheable(value="financeReport", key="#month") trên method Service.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Kích hoạt Spring Cache cho các endpoint báo cáo dữ liệu lịch sử.
```

#### 5.5. Phần chỉnh sửa

```text
Cấu hình TTL (Time to Live) cho cache nếu sử dụng nâng cao qua RedisCacheManager.
```

#### 5.6. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7a8b9c0 |
| File liên quan | src/main/java/com/app/service/FinanceService.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 5.7. Ghi chú thêm

```text
Giảm tải hoàn toàn cho Database đối với dữ liệu cũ.
```

---

## 11. Cam kết sử dụng prompt minh bạch

| Nguyễn Văn Quang | 14/06/2026 |
