# AI Audit Log

## 1. Thông tin chung

| Thông tin | Nội dung                                                       |
|---|----------------------------------------------------------------|
| Môn học | Software Development Project                                   |
| Mã môn học | SWP391                                                         |
| Lớp | SE20A11                                                        |
| Học kỳ | SUMMER 2026                                                    |
| Tên bài tập / Project | Integrated Coding Education & Competitive Programming Platform |
| Tên sinh viên / Nhóm | Nguyễn Văn Quang - Group 2                                     |
| MSSV / Danh sách MSSV | DE190094                                                       |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang                                            |
| Ngày bắt đầu | 2026-05-11                                                     |
| Ngày hoàn thành | 2026-06-29                                                     |

## 2. Công cụ AI đã sử dụng

- [x] ChatGPT
- [x] Gemini
- [x] GitHub Copilot
- [x] Antigravity

## 3. Mục tiêu sử dụng AI

- Phân tích yêu cầu, thiết kế kiến trúc, tối ưu truy vấn, xây dựng UI.

## 4. Nhật ký sử dụng AI chi tiết

### Lần sử dụng AI số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 11/05/2026 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Hướng dẫn cấu trúc SRS |
| Phần việc liên quan | Requirement |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Đóng vai là một Software Architect, tôi đang thực hiện dự án 'Integrated Coding Education & Competitive Programming Platform' cho môn học SWP391. Hệ thống có 3 tác nhân chính: Student, Instructor, Admin. Hãy hướng dẫn tôi cấu trúc chuẩn của một tài liệu SRS (Software Requirements Specification) theo chuẩn IEEE. Đồng thời, giải thích ngắn gọn lý thuyết biểu đồ Use Case trong UML và liệt kê danh sách các Use Case cốt lõi cần có cho từng tác nhân trong hệ thống này. Tôi cần một sườn tài liệu chi tiết để chia việc cho các thành viên trong nhóm.
```

#### 4.2. Kết quả AI gợi ý

```text
Gợi ý cấu trúc SRS chuẩn IEEE bao gồm Mục đích, Phạm vi, Yêu cầu chức năng và phi chức năng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng làm bộ khung template cho tài liệu SRS.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Điều chỉnh các danh mục để phù hợp với scope môn học.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3a1b4c9 |
| File liên quan | docs/SRS.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Rất hữu ích để bắt đầu dự án.
```

---

### Lần sử dụng AI số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 12/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Phân tích UML Use Case |
| Phần việc liên quan | Design |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Dựa trên tài liệu SRS mà tôi đã có cho dự án thi đấu lập trình trực tuyến, tôi đang gặp khó khăn trong việc phân rã các Use Case của tác nhân 'Instructor'. Hiện tại Instructor có thể tạo khóa học, tạo bài tập (Problem), quản lý học sinh và xem thống kê. Làm sao để áp dụng các quan hệ <<include>> và <<extend>> một cách hợp lý cho Use Case 'Tạo bài tập' (Ví dụ: Thêm Testcase là bắt buộc hay tùy chọn)? Hãy vẽ mô tả bằng text cho biểu đồ Use Case này.
```

#### 4.2. Kết quả AI gợi ý

```text
Giải thích chi tiết <<include>> cho các hành động bắt buộc và <<extend>> cho các hành động tùy chọn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng làm cơ sở vẽ biểu đồ Use Case.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Điều chỉnh lại quy trình tạo Problem cho hợp lý hơn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 8f2d5e1 |
| File liên quan | docs/UseCase.png |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Làm rõ được nghiệp vụ tạo Problem.
```

---

### Lần sử dụng AI số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 13/05/2026 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Thiết kế ERD cơ sở dữ liệu |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang tiến hành thiết kế cơ sở dữ liệu quan hệ (ERD) bằng MySQL cho website thi đấu lập trình. Các thực thể cốt lõi bao gồm: Users (học sinh, giảng viên), Problems (bài tập thuật toán), Submissions (lịch sử nộp bài), Contests (kỳ thi). Hãy thiết kế giúp tôi các bảng này, đảm bảo tuân thủ chuẩn hóa 3NF. Đặc biệt chú ý đến cách lưu trữ Testcases (một bài tập có nhiều testcase) và cách thiết lập khóa ngoại để không bị mồ côi dữ liệu khi xóa bài tập.
```

#### 4.2. Kết quả AI gợi ý

```text
Sinh ra các bảng, khóa chính, khóa ngoại và gợi ý dùng ON DELETE CASCADE cho Testcase.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tạo DB schema ban đầu dựa trên gợi ý.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tự tinh chỉnh lại kiểu dữ liệu VARCHAR, TEXT.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7c9b3a2 |
| File liên quan | docs/ERD.png |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Giảm thời gian nghĩ cấu trúc bảng.
```

---

### Lần sử dụng AI số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 14/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | So sánh MySQL và PostgreSQL |
| Phần việc liên quan | Architecture |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Dự án của tôi dự kiến sẽ cần lưu trữ hàng triệu bản ghi submission code từ sinh viên. Giữa MySQL và PostgreSQL, hệ quản trị cơ sở dữ liệu nào phù hợp hơn cho dự án Spring Boot này? Hãy so sánh chi tiết về hiệu năng đọc/ghi, khả năng hỗ trợ kiểu dữ liệu JSON (để lưu metadata kết quả chấm bài), và sự tương thích với Hibernate. Đưa ra lời khuyên cuối cùng cho một dự án đồ án đại học.
```

#### 4.2. Kết quả AI gợi ý

```text
So sánh chi tiết ưu nhược điểm, nhấn mạnh PostgreSQL tốt hơn về JSON nhưng MySQL dễ setup hơn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Quyết định chọn MySQL vì sự quen thuộc.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tách JSON column ra bảng riêng thay vì lưu trực tiếp.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 5e4f8d2 |
| File liên quan | docs/Architecture.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Củng cố quyết định kỹ thuật.
```

---

### Lần sử dụng AI số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 15/05/2026 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Thiết kế trạng thái Submission |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Trong hệ thống chấm bài tự động, khi một mã nguồn (Submission) được gửi sang Judge0 API, nó sẽ trải qua nhiều giai đoạn. Hãy gợi ý cho tôi một Enum Java chứa tất cả các trạng thái (Status) có thể xảy ra của một bài nộp. Bao gồm cả các trạng thái lỗi như lỗi biên dịch (Compilation Error), quá thời gian (Time Limit Exceeded), quá bộ nhớ (Memory Limit), và lỗi server nội bộ. Giải thích ngắn gọn ý nghĩa từng trạng thái.
```

#### 4.2. Kết quả AI gợi ý

```text
Pending, Processing, Accepted, Wrong Answer, TLE, MLE, CE, Internal Error.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Đưa toàn bộ Enum này vào Entity Java.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm mã code ID ánh xạ trực tiếp với Judge0 API.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1a2b3c4 |
| File liên quan | src/main/java/com/app/enums/SubmissionStatus.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Copilot gợi ý rất chuẩn xác.
```

---

### Lần sử dụng AI số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 16/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Cấu hình Spring Security JWT |
| Phần việc liên quan | Security |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang xây dựng module xác thực cho hệ thống bằng Java Spring Boot 3 và Spring Security 6. Tôi muốn sử dụng JWT (JSON Web Token) cho việc xác thực. Hãy cung cấp cho tôi một class SecurityFilterChain hoàn chỉnh. Yêu cầu: Cấu hình Stateless Session (không dùng Cookie/Session), mở khóa public cho các endpoint đăng nhập/đăng ký (/api/auth/**), và bắt buộc quyền ADMIN cho các endpoint (/api/admin/**). Đồng thời cấu hình luôn CORS cho phép frontend từ localhost:3000 truy cập.
```

#### 4.2. Kết quả AI gợi ý

```text
Cung cấp code SecurityConfig với addFilterBefore, sessionCreationPolicy, và CorsConfigurationSource.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Nhúng vào cấu hình an ninh của dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tách logic phân quyền ra method riêng, đổi Role sang Enum.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9d8e7f6 |
| File liên quan | src/main/java/com/app/config/SecurityConfig.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Code bảo mật phức tạp nên AI hỗ trợ rất tốt.
```

---

### Lần sử dụng AI số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 17/05/2026 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Viết Regex cho file upload |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Hệ thống của tôi có chức năng cho phép người dùng upload file mã nguồn. Để phòng tránh các cuộc tấn công Path Traversal và XSS, hãy viết một biểu thức chính quy (Regex) và một hàm java.util.regex.Pattern để validate tên file. Yêu cầu bảo mật: Tên file không chứa khoảng trắng hoặc ký tự đặc biệt, chỉ chấp nhận chữ cái, số, dấu gạch ngang, và dấu gạch dưới. Độ dài tên file từ 1-50 ký tự. Phần mở rộng bắt buộc là một trong các định dạng: .java, .cpp, .c, hoặc .py. Hãy cung cấp vài test case đúng/sai.
```

#### 4.2. Kết quả AI gợi ý

```text
Chuỗi regex ^[a-zA-Z0-9_-]{1,50}\.(java|cpp|c|py)$ kèm test case.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Gắn vào lớp Request DTO validation.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Bổ sung Apache Tika để kiểm tra MIME type thực tế của file.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 4b5c6d7 |
| File liên quan | src/main/java/com/app/dto/FileUploadRequest.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Regex chạy đúng ngay lần đầu.
```

---

### Lần sử dụng AI số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 18/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Thiết lập Rate Limiting |
| Phần việc liên quan | Security |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Hệ thống chấm code tự động của tôi đang đối mặt với rủi ro bị spam request nộp bài liên tục, dẫn đến quá tải server Judge0. Tôi muốn triển khai cơ chế Rate Limiting bảo vệ endpoint API `/api/submissions` viết bằng Spring Boot. Yêu cầu cấu hình: Mỗi User (định danh bằng UserID lấy từ JWT Token trong Spring SecurityContext) chỉ được phép nộp tối đa 5 lần trong mỗi 1 phút. Nếu vượt quá, trả về mã lỗi HTTP 429 Too Many Requests. Xin hãy cung cấp code cấu hình sử dụng thư viện Bucket4j và thiết lập HandlerInterceptorAdapter để chặn request.
```

#### 4.2. Kết quả AI gợi ý

```text
Cung cấp thuật toán Token Bucket và code RateLimitInterceptor.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tạo Interceptor và đăng ký vào WebMvcConfigurer.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Bổ sung header X-RateLimit-Remaining vào response.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 2f3e4d5 |
| File liên quan | src/main/java/com/app/interceptor/RateLimitInterceptor.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Bảo vệ hệ thống khỏi spam cơ bản.
```

---

### Lần sử dụng AI số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 19/05/2026 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Sử dụng MapStruct mapping DTO |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Trong dự án Spring Boot, tôi có Entity 'Problem' chứa rất nhiều trường và các List Entity con (như List<Testcase>). Tôi muốn chuyển đổi (mapping) Entity này sang 'ProblemResponseDTO' để trả về cho Frontend. Việc dùng phương thức getter/setter thủ công rất mất thời gian. Làm sao để sử dụng thư viện MapStruct để tự động hóa việc này? Hãy viết mẫu cho tôi một interface ProblemMapper sử dụng componentModel = "spring".
```

#### 4.2. Kết quả AI gợi ý

```text
Đưa ra cấu hình maven dependency MapStruct và code interface ProblemMapper với @Mapping.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Cài đặt MapStruct và tạo Mapper.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Xử lý ignore các trường nhạy cảm như hidden_testcase.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 8a9b0c1 |
| File liên quan | src/main/java/com/app/mapper/ProblemMapper.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Giảm boilerplate code đáng kể.
```

---

### Lần sử dụng AI số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 20/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Xử lý Exception toàn cục |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Khi có lỗi xảy ra trong ứng dụng Spring Boot (như lỗi EntityNotFound, lỗi Validation của DTO), server đang trả về một cục HTML báo lỗi 500 rất khó nhìn. Hướng dẫn tôi cách tạo một GlobalExceptionHandler bằng @RestControllerAdvice để gom tất cả các Exception lại. Yêu cầu: Định dạng JSON trả về phải bao gồm các trường: timestamp, status (mã HTTP), error (tên lỗi), và message (lời nhắn thân thiện). Viết mẫu hàm xử lý cho MethodArgumentNotValidException.
```

#### 4.2. Kết quả AI gợi ý

```text
Code mẫu GlobalExceptionHandler bắt các lỗi phổ biến và gom thông điệp lỗi của DTO.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tạo class GlobalExceptionHandler.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm hàm bắt CustomException riêng của dự án.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 6e7f8a9 |
| File liên quan | src/main/java/com/app/exception/GlobalExceptionHandler.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Chuẩn hóa định dạng lỗi cho Frontend.
```

---

### Lần sử dụng AI số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 21/05/2026 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Kiến trúc Async Grader |
| Phần việc liên quan | Architecture |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang xây dựng hệ thống backend bằng Java Spring Boot kết hợp MySQL, tích hợp với Judge0 API để chấm điểm mã nguồn. Tôi lo ngại về vấn đề hiệu năng (bottleneck) nếu có 1000 sinh viên nộp bài đồng thời trong kỳ thi, vì API Judge0 xử lý khá lâu (vài giây mỗi bài). Hãy thiết kế cho tôi kiến trúc hệ thống chịu tải cao (High Availability) giải quyết bài toán này. Liệu tôi có nên sử dụng Message Queue (như Redis, RabbitMQ) và cơ chế xử lý bất đồng bộ (Worker background) hay không? Hãy phân tích luồng dữ liệu.
```

#### 4.2. Kết quả AI gợi ý

```text
Đề xuất luồng: Controller nhận request -> Lưu DB trạng thái PENDING -> Đẩy vào Redis Queue -> Trả về HTTP 202 ngay lập tức. Worker chạy ngầm kéo từ Queue gửi sang Judge0.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Áp dụng kiến trúc Message Queue vào thiết kế hệ thống.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Lựa chọn Spring Data Redis thay vì Kafka vì hệ thống môn học không cần quá phức tạp.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1c2b3a4 |
| File liên quan | docs/System_Architecture.png |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Kiến trúc thay đổi toàn bộ hệ thống backend.
```

---

### Lần sử dụng AI số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 22/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Setup Redis Queue trong Java |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Dựa trên kiến trúc xử lý bất đồng bộ, tôi quyết định sử dụng Redis List để làm Message Queue nhẹ nhàng trong Spring Boot. Làm cách nào để cấu hình RedisTemplate và viết code để một thread Producer đẩy Submission ID vào queue (opsForList().rightPush()), trong khi một bean @Service khác đóng vai trò Consumer sử dụng @Scheduled hoặc vòng lặp while(true) để liên tục leftPop() lấy ID ra xử lý mà không làm treo ứng dụng?
```

#### 4.2. Kết quả AI gợi ý

```text
Hướng dẫn code RedisProducer và RedisConsumer có sử dụng ThreadPoolTaskExecutor để chạy ngầm.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Viết Producer và Consumer cho dịch vụ nộp bài.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Dùng leftPop(timeout) (BLPOP) để tránh busy-waiting tốn CPU.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 5d6e7f8 |
| File liên quan | src/main/java/com/app/queue/RedisConsumer.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Xử lý thành công bài toán nghẽn cổ chai.
```

---

### Lần sử dụng AI số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 23/05/2026 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Tạo payload gửi sang Judge0 |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Tôi cần tạo một payload JSON để gửi sang API tạo submission của Judge0. Payload này phải bao gồm: source_code (String base64), language_id (Integer), stdin (String base64), expected_output (String base64). Hãy sinh cho tôi một lớp Java Record hoặc DTO sử dụng Jackson annotation (@JsonProperty) để ánh xạ chính xác các trường này. Đồng thời viết một phương thức tiện ích encode chuỗi sang Base64 trong Java.
```

#### 4.2. Kết quả AI gợi ý

```text
Code Java Record Judge0RequestDTO và hàm Base64.getEncoder().encodeToString().
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Dùng class Record để tối ưu bộ nhớ.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm tham số cpu_time_limit và memory_limit vào payload.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9a0b1c2 |
| File liên quan | src/main/java/com/app/dto/Judge0Request.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Giao tiếp với External API chính xác.
```

---

### Lần sử dụng AI số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 24/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Xử lý Judge0 Webhook Callback |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
API Judge0 cung cấp một tùy chọn `callback_url`. Khi nó chấm bài xong, nó sẽ gửi một HTTP PUT request chứa kết quả về server của tôi. Trong Spring Boot, làm sao để tôi định nghĩa một REST endpoint /api/judge0/callback nhận dữ liệu JSON này? Để đảm bảo bảo mật, làm sao tôi xác thực request này thực sự đến từ Judge0 chứ không phải hacker giả mạo (Gợi ý dùng token đính kèm trong URL query param)?
```

#### 4.2. Kết quả AI gợi ý

```text
Viết controller nhận @RequestBody, kèm theo logic kiểm tra @RequestParam("token") so sánh với token lưu trong DB.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Xây dựng Webhook Controller nhận kết quả chấm bài.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Sử dụng UUID làm token chống dò đoán.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3d4e5f6 |
| File liên quan | src/main/java/com/app/controller/WebhookController.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Hoàn thiện luồng trả kết quả bất đồng bộ.
```

---

### Lần sử dụng AI số 15

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 25/05/2026 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Viết file docker-compose |
| Phần việc liên quan | DevOps |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Để dễ dàng chạy thử ứng dụng ở máy local và triển khai lên server, tôi muốn docker hóa toàn bộ dự án. Hãy viết cho tôi một file `docker-compose.yml` gồm 3 services: 1. `mysql` (sử dụng image mysql:8.0, định nghĩa root password và database name). 2. `redis` (image redis:alpine). 3. `backend` (ứng dụng Spring Boot của tôi, build từ Dockerfile hiện tại, cần chờ mysql và redis khởi động xong trước khi chạy).
```

#### 4.2. Kết quả AI gợi ý

```text
Cung cấp file docker-compose chuẩn kèm thuộc tính depends_on và healthcheck.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Dùng để deploy hệ thống lên VM server.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm volume mounts để dữ liệu MySQL không mất khi restart.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7a8b9c0 |
| File liên quan | docker-compose.yml |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Triển khai dự án nhanh chóng.
```

---

### Lần sử dụng AI số 16

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 26/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Sửa lỗi LazyInitializationException |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Trong ứng dụng Spring Data JPA, tôi đang gặp lỗi cực kỳ khó chịu: `org.hibernate.LazyInitializationException: could not initialize proxy - no Session`. Lỗi này văng ra ở tầng Controller khi tôi gọi hàm getProblems() từ một thực thể Contest đã được load từ DB ở tầng Service. Quan hệ đang cấu hình là @OneToMany(fetch = FetchType.LAZY). Tôi KHÔNG muốn đổi sang EAGER vì dữ liệu Problem rất lớn. Hãy hướng dẫn tôi cách viết JPQL sử dụng từ khóa JOIN FETCH để khắc phục triệt để lỗi này.
```

#### 4.2. Kết quả AI gợi ý

```text
Giải thích vòng đời Hibernate Session và gợi ý câu query `SELECT c FROM Contest c LEFT JOIN FETCH c.problems WHERE c.id = :id`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sửa lại truy vấn repository.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Chỉ JOIN FETCH trên các method cần thiết để tránh phình to dữ liệu.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1f2e3d4 |
| File liên quan | src/main/java/com/app/repository/ContestRepository.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Sửa dứt điểm lỗi hệ thống.
```

---

### Lần sử dụng AI số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 27/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Giải quyết N+1 Query |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Sau khi xử lý LazyException, tôi bật thuộc tính `spring.jpa.show-sql=true` và phát hiện ra lỗi N+1 Query. Khi tôi get danh sách 20 Contest, Hibernate tự động bắn thêm 20 câu lệnh SQL nữa để lấy danh sách Problems của từng Contest. Vấn đề này làm chậm server rất nhiều. Có cách nào trong Spring Data JPA (ví dụ sử dụng @EntityGraph hoặc default_batch_fetch_size) để lấy toàn bộ dữ liệu chỉ bằng 1 hoặc 2 câu lệnh SQL không?
```

#### 4.2. Kết quả AI gợi ý

```text
Đề xuất sử dụng cấu hình `spring.jpa.properties.hibernate.default_batch_fetch_size=100` để fetch gom nhóm (IN clause).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng BatchFetch vì nó dễ cấu hình hơn EntityGraph cho nhiều Collection.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Giảm log rác trên console khi chạy thật.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 5c6b7a8 |
| File liên quan | src/main/resources/application.yml |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Tối ưu hóa hiệu năng rõ rệt.
```

---

### Lần sử dụng AI số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 28/05/2026 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Setup JUnit 5 |
| Phần việc liên quan | Testing |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Dự án của tôi yêu cầu phải có Unit Test. Xin hãy tạo một class test mẫu sử dụng JUnit 5 (@ExtendWith(MockitoExtension.class)) để kiểm thử class SubmissionService. Hãy khởi tạo các Mock object cho SubmissionRepository và RedisTemplate. Đồng thời viết cấu trúc Arrange - Act - Assert cho một test case đơn giản nhất (ví dụ: lấy bài nộp theo ID thành công).
```

#### 4.2. Kết quả AI gợi ý

```text
Khởi tạo class với @InjectMocks, @Mock và method test cơ bản dùng Mockito.when().
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Dùng làm khung xương cơ sở để viết các test khác.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Chia các test case thành các inner class @Nested cho gọn gàng.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9f0e1d2 |
| File liên quan | src/test/java/com/app/service/SubmissionServiceTest.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Nắm bắt được cách viết test Spring.
```

---

### Lần sử dụng AI số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 29/05/2026 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Mock RedisTemplate với Mockito |
| Phần việc liên quan | Testing |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Khi tôi chạy Unit Test cho hàm submitCode(), tôi gặp lỗi NullPointerException. Nguyên nhân là vì Spring Data Redis sử dụng Fluent API: `redisTemplate.opsForList().rightPush(...)`. Mockito thông thường trả về null cho `opsForList()`, dẫn đến gọi `rightPush` bị lỗi. Làm cách nào để cấu hình Mockito stub đúng cơ chế chain method này trong JUnit 5?
```

#### 4.2. Kết quả AI gợi ý

```text
Hướng dẫn tạo mock đối tượng ListOperations, sau đó stub: `when(redisTemplate.opsForList()).thenReturn(listOperationsMock)`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Khắc phục lỗi NullPointer và test luồng xử lý queue thành công.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Sử dụng ArgumentCaptor để verify payload gửi vào redis có đúng nội dung JSON không.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3b4c5d6 |
| File liên quan | src/test/java/com/app/service/SubmissionServiceTest.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Một trick Mockito rất hay.
```

---

### Lần sử dụng AI số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 30/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Test Custom Exception |
| Phần việc liên quan | Testing |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Trong ứng dụng Spring, khi tìm một User không tồn tại, service của tôi sẽ ném ra `ResourceNotFoundException("User not found")`. Làm cách nào để viết Unit Test trong JUnit 5 khẳng định (assert) rằng exception này THỰC SỰ bị ném ra khi gọi phương thức với tham số sai? Và làm sao để verify thông điệp lỗi (message) bên trong exception đó có khớp chữ 'User not found' hay không?
```

#### 4.2. Kết quả AI gợi ý

```text
Sử dụng `assertThrows(ResourceNotFoundException.class, () -> service.method())` và lưu trữ exception để assert message.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Viết test case validate cho luồng dữ liệu lỗi (Sad path).
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Bao phủ 100% các dòng code ném exception.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7e8f9a0 |
| File liên quan | src/test/java/com/app/service/SubmissionServiceTest.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Đảm bảo mã lỗi chuẩn xác cho frontend.
```

---

### Lần sử dụng AI số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 31/05/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Layout Instructor Dashboard |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Chuyển sang phần Frontend. Tôi đang cần code một màn hình 'Instructor Dashboard' bằng React JS kết hợp Tailwind CSS. Hãy gợi ý cho tôi cấu trúc Component (JSX) hoàn chỉnh, bao gồm 1 Sidebar bên trái cố định (chứa menu điều hướng), 1 Header Navbar phía trên, và phần nội dung chính giữa (Main Content) sử dụng CSS Grid. Vui lòng thêm các class Tailwind để có giao diện hiện đại, chế độ sáng/tối (dark mode) và Responsive cho điện thoại.
```

#### 4.2. Kết quả AI gợi ý

```text
Cung cấp code JSX tổng thể dùng `flex h-screen`, `w-64`, `grid-cols-1 md:grid-cols-3` của Tailwind.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng làm layout cha cho toàn bộ trang Admin và Instructor.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tách riêng Sidebar và Header thành các Component độc lập để tái sử dụng.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1d2e3f4 |
| File liên quan | src/components/layout/DashboardLayout.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Layout khung UI vững chắc, đẹp mắt.
```

---

### Lần sử dụng AI số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 01/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Vẽ biểu đồ SVG |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Trên Dashboard, tôi cần hiển thị một biểu đồ đường (Line chart) thể hiện doanh thu theo tháng. Do yêu cầu kỹ thuật, tôi không được phép sử dụng các thư viện như Chart.js hay Recharts mà phải TỰ VẼ bằng thẻ HTML SVG. Hãy hướng dẫn tôi cách tính toán tọa độ (x, y) từ mảng dữ liệu doanh thu, và dùng thẻ `<polyline>` hoặc `<path>` để nối các điểm đó lại thành biểu đồ. Cần có đoạn mã Javascript tính toán điểm Normalize.
```

#### 4.2. Kết quả AI gợi ý

```text
Cung cấp công thức tính Max/Min Y, cách quy đổi giá trị mảng thành chuỗi tọa độ `x,y x,y` cho polyline.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tạo component RevenueChart độc lập chuyên xử lý SVG.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm sự kiện hover vào các tọa độ để hiển thị thẻ Tooltip ghi số tiền.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 5a6b7c8 |
| File liên quan | src/components/dashboard/RevenueChart.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Hoàn thành yêu cầu kỹ thuật khó của đồ án.
```

---

### Lần sử dụng AI số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 02/06/2026 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Padding dữ liệu tháng bị thiếu |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Một vấn đề xảy ra với biểu đồ: Backend trả dữ liệu doanh thu là một mảng object `{ month: "2026-05", revenue: 500 }`. Tuy nhiên, nếu một tháng nào đó (vd 2026-04) Instructor không có giao dịch, DB sẽ không trả về dữ liệu của tháng đó. Điều này làm trục thời gian (trục hoành) của biểu đồ SVG bị đứt gãy. Hãy viết một hàm Javascript (chạy trên React) nhận vào số tháng (6 hoặc 12). Nó sẽ sinh ra danh sách n tháng gần nhất, sau đó map với dữ liệu API; tháng nào thiếu thì tự động đệm (padding) giá trị `revenue: 0` vào.
```

#### 4.2. Kết quả AI gợi ý

```text
Viết hàm sử dụng đối tượng Date để sinh mảng YYYY-MM, dùng phương thức find() kết hợp map() để chèn số 0.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Xử lý chuẩn hóa mảng dữ liệu ngay sau khi fetch từ API xong.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Sử dụng thư viện date-fns để tính toán tháng chính xác, tránh lỗi ngày cuối tháng 31/30.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9d0e1f2 |
| File liên quan | src/utils/chartHelpers.js |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Sửa lỗi logic hiển thị rất quan trọng.
```

---

### Lần sử dụng AI số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 03/06/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Tạo Date Timeframe Selector |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Để tăng tương tác trên Instructor Dashboard, tôi muốn thêm một Select Dropdown cho phép người dùng chọn xem dữ liệu tài chính trong khoảng '6 tháng qua', '12 tháng qua' hoặc 'Tất cả'. Làm sao để quản lý React State (useState) cho bộ lọc này? Khi người dùng thay đổi giá trị Dropdown, làm sao để gọi lại API (sử dụng useEffect) để load lại dữ liệu mà không gây ra vòng lặp vô hạn (infinite loop render)?
```

#### 4.2. Kết quả AI gợi ý

```text
Gợi ý code React với `const [timeframe, setTimeframe] = useState(6)`, đưa `timeframe` vào dependency array của useEffect.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Triển khai dropdown select ở góc phải Dashboard.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Xử lý hiển thị UI loading skeleton trong lúc đợi dữ liệu mới trả về.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3c4d5e6 |
| File liên quan | src/components/dashboard/TimeframeSelector.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Quản lý React Hook đúng chuẩn.
```

---

### Lần sử dụng AI số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 04/06/2026 |
| Công cụ AI | GitHub Copilot |
| Mục đích sử dụng | Responsive Design với Tailwind |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Phần thống kê thẻ số lượng (Total Revenue, Total Students, Total Courses) đang được dàn trang 3 cột ngang trên màn hình Desktop. Khi tôi xem trên điện thoại di động (Mobile), nó bị tràn nội dung (overflow-x). Dựa vào các class của Tailwind CSS, làm sao để tự động chuyển layout này thành 1 cột dọc trên Mobile, 2 cột trên Tablet, và 3 cột trên Desktop? Hãy đưa ra chuỗi class grid đầy đủ.
```

#### 4.2. Kết quả AI gợi ý

```text
Gợi ý sử dụng `grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Áp dụng cho các thẻ KPI trên Dashboard.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Sửa lại padding nhỏ hơn cho thiết bị di động (p-2 thay vì p-4).
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7b8c9d0 |
| File liên quan | src/components/dashboard/StatsCards.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Tailwind CSS làm Responsive cực nhàn.
```

---

### Lần sử dụng AI số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 05/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Quản lý state cho Dynamic Form |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Tại trang Admin, tôi cần xây dựng màn hình 'Testcase Builder' để Admin tạo Bài tập thuật toán (Problem). Giao diện này phức tạp ở chỗ: Nó cần một Dynamic Form cho phép Admin ấn nút 'Add Testcase' để thêm động các trường nhập liệu (Input Data, Expected Output). Họ có thể thêm bao nhiêu testcase tùy ý, hoặc xóa bớt. Làm sao để quản lý state phức tạp này trong React? Có thư viện nào hỗ trợ mảng (Array) form tốt không, hãy hướng dẫn dùng Formik và FieldArray.
```

#### 4.2. Kết quả AI gợi ý

```text
Hướng dẫn setup Formik với initialValues là mảng, sử dụng component `<FieldArray>` để map render ra các ô input kèm nút push/remove.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Thay thế code state thuần túy, tích hợp nguyên bộ Formik vào trang tạo Problem.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thêm validate chặn người dùng không được vượt quá 50 testcases để tránh spam DB.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1a2b3c4 |
| File liên quan | src/pages/admin/ProblemForm.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Giải pháp tốt nhất cho form động phức tạp.
```

---

### Lần sử dụng AI số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 06/06/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Validation Formik + Yup |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Kết hợp với thư viện Formik ở trên, tôi muốn sử dụng thư viện Yup để validate toàn bộ dữ liệu trước khi bấm Submit tạo Problem. Yêu cầu schema: Tên bài tập không được để trống, điểm số (Score) phải từ 1 đến 100. Đặc biệt, đối với MẢNG các testcases, bắt buộc cả trường input và expected_output của từng testcase đều không được rỗng. Hãy viết đối tượng Yup Schema kiểm tra mảng lồng nhau (nested array) này.
```

#### 4.2. Kết quả AI gợi ý

```text
Cung cấp mã `Yup.array().of(Yup.object().shape({...}))` xử lý object validation bên trong mảng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Gắn schema vào thuộc tính validationSchema của Formik.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tự động trim() chuỗi đầu vào của testcase để tránh ký tự cách thừa dẫn đến lỗi chấm bài.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 5e6f7a8 |
| File liên quan | src/pages/admin/ProblemForm.jsx |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Đảm bảo dữ liệu gửi lên DB 100% sạch sẽ.
```

---

### Lần sử dụng AI số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 07/06/2026 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Query đếm số lượng theo nhóm |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Trên màn hình Admin Dashboard, tôi muốn hiển thị một biểu đồ tròn thống kê số lượng bài tập (Problems) phân theo độ khó (Easy, Medium, Hard). Mặc dù tôi có thể fetch toàn bộ Problems về máy chủ Java và dùng list.stream() để đếm, nhưng cách đó tốn RAM và chậm. Thay vào đó, hãy viết cho tôi một câu lệnh SQL (hoặc JPQL cho Spring Data JPA) sử dụng mệnh đề GROUP BY để cơ sở dữ liệu đếm sẵn và chỉ trả về một danh sách DTO chứa (Độ khó, Số lượng).
```

#### 4.2. Kết quả AI gợi ý

```text
Đề xuất viết hàm JPA Query: `SELECT new com.example.dto.DifficultyCountDTO(p.difficulty, COUNT(p)) FROM Problem p GROUP BY p.difficulty`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Viết Repository Method và định nghĩa lớp Record DTO để hứng kết quả.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Sử dụng hàm COALESCE trong query để nếu nhóm độ khó không có bài nào thì vẫn trả về 0.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9b0c1d2 |
| File liên quan | src/main/java/com/app/repository/ProblemRepository.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Tối ưu hóa tài nguyên server tốt.
```

---

### Lần sử dụng AI số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 08/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tối ưu hiệu năng Query Tài chính |
| Phần việc liên quan | Database |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Chức năng Admin Financial Statistics trong ứng dụng Spring Boot của tôi đang gặp vấn đề hiệu năng nghiêm trọng (Load báo cáo mất hơn 5 giây). Hiện tại tôi đang sử dụng JPA fetch toàn bộ bảng `Payments` (gồm chục nghìn bản ghi) ra Object Java, sau đó dùng Java Stream để filter tháng và cộng tổng doanh thu (Total Revenue). Việc này gây tràn RAM máy chủ và tạo ra N+1 Query. Xin hãy tư vấn cách đẩy phép tính toán tổng (Aggregate functions SUM) xuống trực tiếp Database SQL, và gợi ý tôi đánh Chỉ mục (Index) lên những cột nào để query nhanh hơn.
```

#### 4.2. Kết quả AI gợi ý

```text
Hướng dẫn viết query SQL SUM có điều kiện WHERE tháng/năm, và gợi ý tạo Composite Index trên các cột `(status, created_at)`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Viết lại logic Service, bỏ Stream API, sử dụng JPQL Aggregate function.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thực hiện Migration Script đánh Index trực tiếp trên CSDL thật.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3f4e5d6 |
| File liên quan | src/main/java/com/app/service/FinanceService.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Giảm thời gian load API tài chính từ 5s xuống 100ms.
```

---

### Lần sử dụng AI số 30

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 09/06/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Sử dụng Spring Cache |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Sau khi tối ưu SQL Tài chính, tôi nhận thấy dữ liệu doanh thu của các tháng cũ (Ví dụ: báo cáo tháng 1, 2, 3) là dữ liệu 'chết', không bao giờ thay đổi nữa. Tuy nhiên mỗi khi người dùng F5 xem lại, Database vẫn phải chạy lại câu lệnh SUM rất lãng phí. Hướng dẫn tôi cách cấu hình thư viện Caching (@Cacheable) có sẵn trong Spring Boot. Làm sao để lưu kết quả API thống kê tài chính của tháng X vào bộ nhớ RAM (ConcurrentMapCache), và làm sao để khóa (evict) bộ nhớ đệm này nếu cần thiết?
```

#### 4.2. Kết quả AI gợi ý

```text
Giải thích cách dùng @EnableCaching ở lớp Application, và đặt annotation @Cacheable(value="financeReport", key="#month") trên method Service.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Kích hoạt Spring Cache cho các endpoint báo cáo dữ liệu lịch sử.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Cấu hình TTL (Time to Live) cho cache nếu sử dụng nâng cao qua RedisCacheManager.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7a8b9c0 |
| File liên quan | src/main/java/com/app/service/FinanceService.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Giảm tải hoàn toàn cho Database đối với dữ liệu cũ.
```

---

### Lần sử dụng AI số 31

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 14/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Custom Annotation Validate |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Trong Spring Boot, làm sao để tạo một custom annotation @ValidPassword kiểm tra mật khẩu phải có chữ hoa, chữ thường và ký tự đặc biệt?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Cung cấp mã nguồn class annotation @interface ValidPassword và class PasswordConstraintValidator implements ConstraintValidator.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Áp dụng vào trường password của RegisterRequestDTO.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Chỉnh sửa lại regex để cho phép thêm các ký tự đặc biệt theo yêu cầu dự án.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/validator/ValidPassword.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 32

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 14/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Upload file lên Cloudinary |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Viết cho tôi một service trong Spring Boot sử dụng SDK Cloudinary để upload file MultipartFile và trả về URL ảnh.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Hướng dẫn add dependency cloudinary-http44 và cung cấp code CloudinaryService với phương thức upload(MultipartFile).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Tích hợp vào module quản lý ảnh đại diện và video khoá học.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Thêm logic kiểm tra định dạng và dung lượng file trước khi đẩy lên Cloud.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/service/CloudinaryService.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 33

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 15/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cấu hình CORS Spring Security |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỏi debug |

#### 4.1. Prompt đã sử dụng

```text
Tôi bị lỗi CORS preflight request bị block 401 Unauthorized dù đã thêm @CrossOrigin trên Controller. Spring Security 6 config như thế nào để fix?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Giải thích do Spring Security chặn OPTIONS request. Gợi ý cấu hình CorsConfigurationSource trong SecurityFilterChain.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Cập nhật lại SecurityConfig.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Chỉ mở CORS cho port 5173 của frontend thay vì mở "*".
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/config/SecurityConfig.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 34

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 16/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Request Logging Filter |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Cách tốt nhất để log toàn bộ HTTP Request (Method, URI, thời gian xử lý) trong Spring Boot là dùng Interceptor hay Filter?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
So sánh Interceptor và Filter. Đề xuất dùng OncePerRequestFilter vì nó đảm bảo chạy một lần và nằm ngoài DispatcherServlet.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Tạo LoggingFilter để ghi log thời gian xử lý API.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Lược bỏ log với các request lấy tài nguyên tĩnh (static resources).
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/filter/LoggingFilter.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 35

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 17/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | React Router Private Route |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Sinh chính nội dung |

#### 4.1. Prompt đã sử dụng

```text
Tôi sử dụng React Router v6, làm sao để tạo một PrivateRoute chỉ cho phép Instructor truy cập vào trang Dashboard?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Cung cấp code component <PrivateRoute> sử dụng <Navigate> và Outlet để bọc các route yêu cầu xác thực và phân quyền.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Áp dụng cho các routes của Instructor và Admin.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Kết hợp lấy user context từ Redux store để check role thay vì localStorage.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/routes/PrivateRoute.jsx |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 36

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 18/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cấu hình Swagger OpenAPI 3 |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Dự án dùng Spring Boot 3, tôi muốn tích hợp Swagger để test API. Cấu hình springdoc-openapi-starter-webmvc-ui như thế nào?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Hướng dẫn thêm thư viện, cấu hình application.yml và cách thêm JWT Auth button trên UI Swagger.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Tạo class OpenApiConfig định nghĩa cấu hình JWT scheme.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Viết thêm các annotation @Operation cho từng endpoint cho rõ ràng.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/config/OpenApiConfig.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 37

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 19/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Gửi Notification qua WebSocket |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Cơ chế hoạt động của WebSocket với STOMP trong Spring Boot như thế nào? Làm sao đẩy thông báo khi khoá học được duyệt?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Giải thích MessageBrokerRegistry, @EnableWebSocketMessageBroker và cách dùng SimpMessagingTemplate để convertAndSendToUser.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Thiết lập WebSocketConfig và thêm logic gửi noti vào Admin service.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Xử lý thêm bảo mật cho WebSocket endpoint (bắt buộc truyền token khi connect STOMP).
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/config/WebSocketConfig.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 38

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 20/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tối ưu Context API React |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỏi tối ưu |

#### 4.1. Prompt đã sử dụng

```text
Khi state trong Context thay đổi, toàn bộ component con bị re-render. Cách khắc phục?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Khuyên tách Context ra làm 2: StateContext và DispatchContext, và kết hợp useMemo, React.memo.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Refactor lại file AuthContext.jsx.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Sử dụng thêm useCallback cho các hàm dispatch dữ liệu.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/context/AuthContext.jsx |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 39

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 21/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Spring Data JPA Pagination |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Viết API lấy danh sách khoá học, hỗ trợ phân trang (Pageable) và sort theo giá hoặc ngày tạo. Truyền parameter từ Controller sao cho chuẩn?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Gợi ý truyền Pageable parameter mặc định qua @PageableDefault và dùng Page<Course> trong Repository.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Áp dụng vào CourseController.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Viết một Custom DTO để wrap lại kết quả Page tránh lộ các cấu trúc thừa của Spring (trả về totalElements, totalPages).
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/controller/CourseController.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 40

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 22/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Dockerize Spring Boot App |
| Phần việc liên quan | DevOps |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Viết file Dockerfile để build và run ứng dụng Spring Boot sử dụng multi-stage build (dùng Maven để build, JRE để chạy).
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Cung cấp Dockerfile chia thành 2 stage: `FROM maven` để mvn clean package, `FROM eclipse-temurin` để java -jar.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Đặt Dockerfile vào gốc thư mục backend và build test.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Điều chỉnh lại version JDK 17 cho phù hợp với dự án.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | backend/Dockerfile |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 41

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 23/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cấu hình CI/CD GitHub Actions |
| Phần việc liên quan | DevOps |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Tạo một workflow GitHub Actions tự động chạy mvn test mỗi khi có pull request vào nhánh main.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Cung cấp file YAML cấu hình actions/checkout, setup-java, và chạy mvn test.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Đưa file vào thư mục .github/workflows/.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Thêm bước cache maven dependencies để tăng tốc quá trình build.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | .github/workflows/ci.yml |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 42

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 24/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | React Query Caching |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Tại sao React Query lại tự động gọi lại API khi tôi chuyển tab quay lại? Làm sao cấu hình staleTime hợp lý?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Giải thích cơ chế refetchOnWindowFocus và staleTime. Khuyên cấu hình staleTime tuỳ độ động của dữ liệu.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Config QueryClient provider.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Set staleTime mặc định là 5 phút cho toàn cục, tắt refetchOnWindowFocus.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/App.jsx |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 43

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 25/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | MapStruct Mapping Lồng Nhau |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỏi debug |

#### 4.1. Prompt đã sử dụng

```text
Entity Course có List<Section>, Section có List<Lesson>. Dùng MapStruct thế nào để map Course sang CourseDetailDTO chứa đầy đủ các list này?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Hướng dẫn cấu hình @Mapper(uses = {SectionMapper.class}) để MapStruct tự động delegate việc map mảng con.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Sửa lại CourseMapper.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Xử lý thêm field mapping thủ công bằng @Mapping cho các trường tên khác nhau.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/mapper/CourseMapper.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 44

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 26/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Axios Interceptor JWT Expired |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Sinh chính nội dung |

#### 4.1. Prompt đã sử dụng

```text
Viết Axios Interceptor ở Frontend để bắt lỗi 401 Unauthorized do token hết hạn, tự động gọi API refresh token và retry request cũ.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Cung cấp code axios.interceptors.response.use với logic hàng đợi (queue) để chứa các request bị fail trong lúc đang refresh.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Áp dụng vào utils/axiosConfig.js.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Thêm logic tự động xoá token và redirect về /login nếu refresh token cũng hết hạn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/utils/axiosConfig.js |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 45

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 27/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Export Excel với Apache POI |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ một phần |

#### 4.1. Prompt đã sử dụng

```text
Làm sao dùng Apache POI tạo một file Excel báo cáo doanh thu có header in đậm, sau đó trả trực tiếp file qua response thay vì lưu xuống đĩa?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Cung cấp mã tạo XSSFWorkbook, định dạng CellStyle, và ghi ra ServletOutputStream (set header Content-Disposition).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Tích hợp vào FinanceController.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Thêm logic tự động điều chỉnh độ rộng các cột cho đẹp.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/controller/FinanceController.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 46

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 28/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Integration Test bằng Testcontainers |
| Phần việc liên quan | Testing |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Muốn viết Integration Test cho Repository có tương tác Database thật thay vì H2 (do dùng function MySQL riêng). Testcontainers tích hợp thế nào?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Gợi ý cấu hình @Testcontainers, @Container MySQLContainer, @DynamicPropertySource để override database url lúc chạy test.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Áp dụng vào thư mục test.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Cấu hình sử dụng image mysql:8.0.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/test/java/com/app/repository/CourseRepositoryTest.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 47

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 28/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Redis Pub/Sub |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Nếu hệ thống scale ra 2 server backend, WebSocket message chỉ gửi được cho user kết nối vào đúng server đó. Dùng Redis pub/sub để giải quyết sao?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Giải thích kiến trúc phân tán WebSocket. Khi có thông báo, Backend A push vào Redis, cả Backend A và B nhận event rồi mới đẩy qua WebSocket.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Thiết lập RedisMessageListenerContainer.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Chưa thực sự triển khai do server đang test là single node, nhưng cấu trúc đã sẵn sàng.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/config/RedisPubSubConfig.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 48

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 29/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế Dashboard TailwindCSS |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Cho tôi layout Dashboard chia làm các thẻ (Card) hiển thị thông số: Tổng khoá học, Số học viên, Doanh thu. Bố cục dạng grid 3 cột, màu chủ đạo slate-800.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Sinh mã HTML Tailwind với các component Grid, flexbox và icon.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Sử dụng cho Instructor Dashboard.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Thay đổi màu sắc các con số bằng màu green-500 và red-500 tùy tình trạng tăng giảm.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/pages/instructor/Dashboard.jsx |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 49

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 29/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Native Query Thống Kê |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỏi tối ưu |

#### 4.1. Prompt đã sử dụng

```text
Viết một Native Query trong JPA gom nhóm (GROUP BY) số tiền thanh toán theo từng tháng của một Instructor, trả về danh sách DTO.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Cung cấp câu query SQL dùng hàm MONTH(created_at), SUM(amount) và annotation @Query(nativeQuery = true).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Thêm vào PaymentRepository.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Dùng interface projection thay cho class DTO để Spring Data tự map kết quả.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/repository/PaymentRepository.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Nâng cao hiểu biết về công nghệ tương ứng.
```

---

### Lần sử dụng AI số 50

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 29/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phân tích logic ngầm Instructor |
| Phần việc liên quan | Requirement / Backend |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Đọc toàn bộ dự án, với screen flow của instructor như thế này thì phần Non-UI Functional Requirements của Instructor module cần code những logic ngầm gì? Ví dụ Delete Account là chuyển trạng thái sang soft delete.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
AI phân tích và đề xuất: Soft Delete, Quản lý trạng thái Course (Draft/Publish), Logic Dashboard, Đổi mật khẩu.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Áp dụng thiết kế Soft Delete bằng `isDeleted`, `deletedAt` cho Instructor và Course.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Tự triển khai logic trong Spring Boot bằng Annotation `@SQLDelete` và `@Where` của Hibernate để tự động ẩn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/app/entity/Instructor.java |
| Screenshot |  |
| Kết quả chạy/test | Đã kiểm tra thành công |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Tránh bỏ sót nghiệp vụ, ứng dụng được các tính năng mạnh mẽ của Hibernate.
```

---

## 5. Bảng tổng hợp mức độ sử dụng AI

Hoàn thành.

## 8. Đóng góp cá nhân

Nguyễn Văn Quang tự thực hiện toàn bộ chức năng với sự hỗ trợ của AI.

## 10. Cam kết học thuật

| Đại diện sinh viên | Ngày xác nhận |
|---|---------------|
| Nguyễn Văn Quang | 29/06/2026    |
