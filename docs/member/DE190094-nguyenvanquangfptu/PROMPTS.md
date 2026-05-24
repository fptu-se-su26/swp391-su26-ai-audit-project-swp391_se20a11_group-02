# Prompt Log

## 1. Thông tin chung
| Thông tin | Nội dung                                                       |
|---|----------------------------------------------------------------|
| Môn học | 	Software Development Project                                  |
| Mã môn học | SWP391                                                         |
| Lớp | SE20A11                                                        |
| Học kỳ | SUMMER 2026                                                    |
| Tên bài tập / Project | Integrated Coding Education & Competitive Programming Platform |
| Tên sinh viên / Nhóm | Nguyễn Văn Quang - Group 2                                     |
| MSSV / Danh sách MSSV | DE190094                                                       |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang                                            |
| Ngày bắt đầu | 2026-05-11                                                     |
| Ngày hoàn thành | 2026-05-22                                                     |
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
- [ ] Antigravity
- [ ] Microsoft Copilot
- [ ] Perplexity
- [ ] Công cụ khác: ....................................

---

## 4. Bảng tổng hợp prompt đã sử dụng

| STT | Ngày | Công cụ AI | Mục đích | Prompt tóm tắt | Kết quả chính | Có sử dụng vào bài không? | Minh chứng |
|---:|---|---|---|---|---|---|---|
| 1 | 18/05/2026 | Gemini | Phân tích yêu cầu | Hướng dẫn cấu trúc SRS và gợi ý Use Case cho nền tảng thi đấu lập trình | Dàn ý SRS chuẩn, liệt kê Use Case cho 3 Actor | Có | Cấu trúc tài liệu SRS |
| 2 | 20/05/2026 | ChatGPT, Gemini | Thiết kế kiến trúc | Thiết kế kiến trúc hệ thống xử lý 1000 lượt nộp bài cùng lúc với Judge0 | Mô hình Async với Message Queue và Worker | Có | System_Architecture_Diagram.png |
| 3 | 22/05/2026 | Gemini, Copilot | Sinh code mẫu | Viết hàm Regex validate tên file upload (.java, .cpp, .c, .py) | Chuỗi Regex và hàm Java `isValidFileName()` | Có | File cấu hình DTO Validation |
| 4 | 21/05/2026 | ChatGPT | Sửa lỗi / Debug | Khắc phục LazyInitializationException trong Hibernate JPA khi truy vấn Contest | Sử dụng LEFT JOIN FETCH trong JPQL Repository | Có | Tệp ContestRepository.java |
| 5 | 21/05/2026 | ChatGPT, Gemini | Tối ưu / Bảo mật | Cấu hình giới hạn Rate Limiting (5 requests/phút) bằng Bucket4j và Redis | RateLimitInterceptor lấy User ID từ JWT Token | Có | Tệp RateLimitInterceptor.java |
| 6 | 22/05/2026 | ChatGPT, Copilot | Sinh code mẫu / Test | Viết JUnit 5 + Mockito test cho SubmissionService đẩy bài vào Redis queue | Bộ mã nguồn Unit Test và cách mock ListOperations | Có | Tệp SubmissionServiceTest.java |
| 7 |  |  |  |  |  | Có / Không |  |
| 8 |  |  |  |  |  | Có / Không |  |
| 9 |  |  |  |  |  | Có / Không |  |
| 10 |  |  |  |  |  | Có / Không |  |

---
## 5. Prompt chi tiết

### Prompt số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 18/05/2026 |
| Công cụ AI | Gemini |
| Mục đích | Lập dàn ý tài liệu và định hình các chức năng hệ thống |
| Phần việc liên quan | Requirement / Design |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Tôi đang làm dự án Integrated Coding Education & Competitive Programming Platform. Hãy hướng dẫn tôi cấu trúc chuẩn của một tài liệu SRS. Đồng thời, giải thích lý thuyết UML và gợi ý các Use Case chính cho nền tảng này.
```

#### 5.2. Bối cảnh khi viết prompt

Mô tả ngắn gọn vì sao sinh viên/nhóm cần dùng prompt này.

```text
Bắt đầu giai đoạn làm tài liệu cho dự án SWP391. Nhóm cần một khung tài liệu chuẩn và muốn rà soát lại các chức năng cốt lõi xem có bỏ sót Use Case nào quan trọng đối với các tác nhân (Student, Instructor, Admin) hay không.
```

#### 5.3. Kết quả AI trả về

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
AI cung cấp dàn ý chi tiết cho tài liệu SRS (Mục đích, Phạm vi, Functional/Non-functional Requirements). Phân tích lý thuyết UML diagram và liệt kê các Use Case cơ bản cho 3 tác nhân chính: Student, Instructor, Admin.
```

#### 5.4. Kết quả đã áp dụng vào bài

Mô tả phần nào từ kết quả AI đã được sử dụng vào bài tập/project.

```text
Sử dụng dàn ý SRS của AI làm bộ khung (template) cho tài liệu của nhóm. Tham khảo danh sách các Use Case để tránh bỏ sót tính năng.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với kết quả AI trả về.

```text
Nhóm không dùng nguyên văn, mà tự định nghĩa lại luồng flow dựa trên kiến thức thực tế và tham khảo các website thi đấu lập trình có sẵn để phù hợp hơn với scope môn học.
```

#### 5.6. Đánh giá chất lượng prompt

Đánh dấu các nhận xét phù hợp.

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [x] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | docs/SRS_Document_v1.0 |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Prompt đã tạo ra một khung sườn tài liệu vững chắc, giúp định hướng công việc cho cả nhóm ở giai đoạn đầu dự án.
```

---

### Prompt số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 20/05/2026 |
| Công cụ AI | ChatGPT / Gemini |
| Mục đích | Thiết kế kiến trúc Grader Engine chịu tải bất đồng bộ |
| Phần việc liên quan | Architecture / Backend |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi giải thích / Hỏi thiết kế giải pháp |

#### 5.1. Prompt nguyên văn

```text
Tôi đang xây dựng một nền tảng thi đấu lập trình bằng Java Spring Boot. Tôi muốn dùng Judge0 API để chấm code tự động. Hãy thiết kế cho tôi một kiến trúc hệ thống để xử lý tình huống có 1000 sinh viên cùng nộp bài một lúc mà server không bị sập.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Trong các kỳ thi lập trình lớn, số lượng request nộp bài chấm code có thể tăng đột biến. Việc gọi đồng bộ trực tiếp Grader API (Judge0) sẽ làm nghẽn luồng xử lý và sập Web Server. Nhóm cần một thiết kế kiến trúc có khả năng chịu tải tốt.
```

#### 5.3. Kết quả AI trả về

```text
AI phân tích rủi ro quá tải (bottleneck) nếu gọi API đồng bộ. Gợi ý sử dụng kiến trúc Bất đồng bộ (Asynchronous) kết hợp Message Queue (như RabbitMQ hoặc Redis Pub/Sub). Flow đề xuất: Web Server nhận source code -> Lưu vào Database với trạng thái "Pending" -> Đẩy message vào Queue -> Các Worker Server lấy message từ Queue, gửi sang Judge0 -> Nhận kết quả từ Judge0 -> Cập nhật trạng thái "Accepted/Wrong Answer" vào Database.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Nhóm sử dụng toàn bộ mô hình kiến trúc Message Queue + Worker. Các khái niệm trạng thái bài nộp (Pending, Judging, Accepted, WA, TLE) cũng được lấy từ gợi ý của AI để thiết kế bảng Submission trong cơ sở dữ liệu.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Vì RabbitMQ/Kafka quá phức tạp đối với quy mô đồ án môn học, nhóm đã giản lược thiết kế bằng cách sử dụng BullMQ / Redis Queue. Đây là giải pháp tối ưu hơn về mặt tài nguyên và thời gian phát triển nhưng vẫn đảm bảo tính bất đồng bộ.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [x] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | docs/System_Architecture_Diagram.png |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Đây là prompt quan trọng nhất giải quyết bài toán cốt lõi và khó nhất về mặt kiến trúc hệ thống của dự án.
```

---

### Prompt số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 22/05/2026 |
| Công cụ AI | Gemini / GitHub Copilot |
| Mục đích | Viết biểu thức chính quy (Regex) để kiểm tra tính hợp lệ của file code nộp lên |
| Phần việc liên quan | Coding |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
Viết một hàm Regex trong Java để validate input đầu vào là tên file source code. Yêu cầu: Không chứa ký tự đặc biệt, độ dài từ 1-50, đuôi file bắt buộc là .java, .cpp, .c, hoặc .py.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Để ngăn chặn lỗi hoặc các cuộc tấn công hệ thống (như Path Traversal hoặc tải file độc hại), hệ thống cần lọc và validate tên file source code do người dùng upload ngay tại Validation Layer trước khi đưa vào thư mục xử lý.
```

#### 5.3. Kết quả AI trả về

```text
AI cung cấp chuỗi Regex: ^[a-zA-Z0-9_-]{1,50}\.(java|cpp|c|py)$ kèm theo mã nguồn hàm isValidFileName() viết bằng Java sử dụng class Pattern và Matcher.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Sử dụng biểu thức Regex và cấu trúc hàm cơ bản AI cung cấp để nhúng vào Validation Layer (DTO) của Spring Boot.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Nhóm bổ sung thêm logic kiểm tra dung lượng file (không quá 1MB) và chống tải lên các file mã độc giả mạo đuôi file, kết hợp sử dụng Apache Tika để kiểm tra MIME type thực tế của file thay vì chỉ kiểm tra tên đuôi file như gợi ý cơ bản của AI.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [x] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/example/dto/SubmissionDTO.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
AI giải quyết rất tốt các tác vụ sinh code logic cô đọng như regex, giúp tiết kiệm nhiều thời gian kiểm tra.
```

---

### Prompt số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 21/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích | Khắc phục LazyInitializationException trong Hibernate JPA khi truy vấn Contest |
| Phần việc liên quan | Backend / Database |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Tôi gặp lỗi "org.hibernate.LazyInitializationException: could not initialize proxy - no Session" trong Spring Boot khi gọi method getContestDetails() để lấy thông tin Contest kèm theo danh sách Problems. Quan hệ giữa Contest và Problem là @OneToMany(fetch = FetchType.LAZY). Làm sao để sửa lỗi này mà không cần đổi fetch type thành EAGER?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Trong Spring Boot, khi truy vấn thông tin chi tiết của Contest để hiển thị kèm danh sách các Problem, do cấu hình FetchType.LAZY nên khi Session của Hibernate đã đóng sau tầng Service, việc gọi c.getProblems() ở Controller sẽ ném ra lỗi LazyInitializationException. Nhóm cần một giải pháp xử lý triệt để, hiệu quả về mặt hiệu năng mà không lạm dụng EAGER fetch.
```

#### 5.3. Kết quả AI trả về

```text
AI giải thích tường tận vòng đời của Hibernate Session và Transaction. AI gợi ý sử dụng kỹ thuật JOIN FETCH trong câu truy vấn JPQL/HQL (ví dụ: SELECT c FROM Contest c LEFT JOIN FETCH c.problems WHERE c.id = :id) để tải trước (Eagerly fetch) các thực thể có quan hệ Lazy trong một câu truy vấn duy nhất.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Nhóm sử dụng JPQL với JOIN FETCH trong ContestRepository để viết hàm getContestWithProblems() và giải quyết triệt để lỗi LazyInitializationException.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Chủ động thiết kế JPQL để chỉ lấy các thuộc tính cần thiết, kết hợp mapping trực tiếp sang DTO thông qua constructor expression trong JPQL nhằm tối ưu lượng RAM tiêu thụ và băng thông DB.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [x] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/example/repository/ContestRepository.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Giúp nhóm nắm chắc kiến thức nâng cao về tối ưu hóa truy vấn JPA Hibernate, tránh được lỗi N+1 SELECT rất phổ biến.
```

---

### Prompt số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 21/05/2026 |
| Công cụ AI | ChatGPT / Gemini |
| Mục đích | Thiết lập giới hạn tần suất request (Rate Limiting) cho API nộp bài |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi giải thích / Hỏi thiết kế giải pháp |

#### 5.1. Prompt nguyên văn

```text
Tôi muốn giới hạn tần suất gửi request (Rate Limiting) lên API nộp bài /api/submissions trong Java Spring Boot. Mỗi User chỉ được nộp tối đa 5 lần trong vòng 1 phút. Hãy gợi ý cho tôi giải pháp sử dụng Redis hoặc thư viện Bucket4j.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Vì tài nguyên của server Grader (Judge0) là hữu hạn và chi phí chấm bài lớn, nếu người dùng sử dụng tool spam nộp bài liên tục sẽ dẫn đến nghẽn queue và treo server. Nhóm cần thiết lập một lớp bảo vệ Rate Limiting ngay tại cổng API để chặn các hành vi phá hoại/spam.
```

#### 5.3. Kết quả AI trả về

```text
AI đề xuất sử dụng thư viện Bucket4j (thuật toán Token Bucket) kết hợp với Redis làm Distributed Cache để lưu bucket cho từng user. AI hướng dẫn viết một `RateLimitInterceptor` hoặc `Filter` để kiểm tra bucket trước khi forward request tới Controller.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Nhóm sử dụng cấu hình Bucket4j và cấu trúc của `RateLimitInterceptor` để tích hợp vào WebMvcConfigurer nhằm tự động chặn request vượt hạn mức và phản hồi HTTP 429 Too Many Requests.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
AI gợi ý dùng IP Client làm Key giới hạn, tuy nhiên IP có thể bị giả mạo hoặc trùng nhau trong mạng LAN. Nhóm cải tiến bằng cách lấy User ID đã được phân tích từ JWT Token (Spring Security Context) để làm Key định danh duy nhất cho bucket của mỗi tài khoản.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [x] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/example/config/RateLimitInterceptor.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Rate Limiting hoạt động hoàn hảo, giúp hệ thống chịu tải tốt trước các kịch bản spam nộp bài giả định.
```

---

### Prompt số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 22/05/2026 |
| Công cụ AI | ChatGPT / GitHub Copilot |
| Mục đích | Viết Unit Test JUnit 5 + Mockito kiểm thử SubmissionService |
| Phần việc liên quan | Testing / Quality Assurance |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
Viết unit test sử dụng JUnit 5 và Mockito cho method submitCode(SubmissionRequest request) của class SubmissionServiceImpl trong Spring Boot. Method này sẽ lưu submission vào DB với trạng thái PENDING, sau đó đẩy message vào Redis queue. Cần mock các dependency: SubmissionRepository và RedisTemplate.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Để đảm bảo chất lượng mã nguồn, tự động phát hiện lỗi khi refactor và đạt chuẩn đầu ra môn học SWP391, nhóm cần phủ Unit Test cho các Service nghiệp vụ quan trọng. Luồng nộp bài và đẩy hàng đợi chứa nhiều dependency bên thứ ba (Redis, DB) nên cần viết Mockito test chuẩn xác.
```

#### 5.3. Kết quả AI trả về

```text
AI sinh lớp test sử dụng JUnit 5, `@ExtendWith(MockitoExtension.class)`. AI cung cấp các test case cho trường hợp nộp bài thành công và thất bại, đồng thời sinh code mock `SubmissionRepository` và `RedisTemplate`.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Nhóm sử dụng toàn bộ cấu trúc tổ chức lớp test, cách thiết lập mock, cách sử dụng các `@Mock` và `@InjectMocks` do AI gợi ý.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Code AI sinh bị lỗi NullPointerException do AI mock sai cơ chế Fluent API của RedisTemplate (`redisTemplate.opsForList()`). Nhóm đã tự sửa lại bằng cách mock riêng lớp `ListOperations` của Spring Data Redis và cấu hình stub `when(redisTemplate.opsForList()).thenReturn(listOperationsMock)`, đồng thời viết thêm các test case phủ các Exception tùy chỉnh.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [x] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [x] Cần tự kiểm tra và chỉnh sửa nhiều
- [x] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/test/java/com/example/service/SubmissionServiceTest.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Mặc dù AI sinh code có lỗi nhỏ về mock Redis, nhưng nó vẫn giúp nhóm tiết kiệm 70% thời gian viết code test nhàm chán bằng cách tạo khung sẵn.
```

---

## 6. Prompt quan trọng nhất

Chọn một prompt có ảnh hưởng lớn nhất đến bài tập/project.

### 6.1. Prompt được chọn

```text
Tôi đang xây dựng một nền tảng thi đấu lập trình bằng Java Spring Boot. Tôi muốn dùng Judge0 API để chấm code tự động. Hãy thiết kế cho tôi một kiến trúc hệ thống để xử lý tình huống có 1000 sinh viên cùng nộp bài một lúc mà server không bị sập.
```

### 6.2. Vì sao prompt này quan trọng?

```text
Vì prompt này giải quyết bài toán kiến trúc hệ thống phức tạp nhất của dự án. Nếu không có thiết kế bất đồng bộ này, server chắc chắn sẽ sập khi số lượng sinh viên nộp bài đồng thời tăng cao. Đây là xương sống chịu tải cho tính năng chấm bài cốt lõi.
```

### 6.3. Kết quả prompt này mang lại

```text
Một bản phác thảo chi tiết về kiến trúc bất đồng bộ sử dụng Message Queue (RabbitMQ/Kafka) và hệ thống Worker để gửi bài sang Judge0 và cập nhật kết quả bất đồng bộ.
```

### 6.4. Sinh viên/nhóm đã kiểm tra kết quả như thế nào?

```text
Kiểm chứng bằng cách đối chiếu với lý thuyết thiết kế hệ thống chịu tải lớn, tham khảo các tài liệu mẫu của các dự án lớn, thảo luận nhóm để rà soát rủi ro mất mát message và xin ý kiến phản hồi trực tiếp từ giảng viên hướng dẫn.
```

### 6.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

```text
Nhóm đã cải tiến bằng cách scale down kiến trúc: chuyển từ RabbitMQ/Kafka (phức tạp, cồng kềnh) sang BullMQ kết hợp Redis để triển khai nhanh gọn, tiết kiệm RAM/CPU trên môi trường server thử nghiệm nhưng vẫn giữ nguyên được bản chất kiến trúc bất đồng bộ.
```

---

## 7. Prompt chưa hiệu quả

Ghi lại ít nhất một prompt chưa tạo ra kết quả tốt hoặc chưa phù hợp.

### 7.1. Prompt chưa hiệu quả

```text
Hãy thiết kế một cơ sở dữ liệu chi tiết cho dự án Integrated Coding Education & Competitive Programming Platform đầy đủ mọi tính năng có thể có.
```

### 7.2. Vì sao prompt này chưa hiệu quả?

```text
Prompt quá chung chung và yêu cầu "đầy đủ mọi tính năng có thể có" không rõ ràng. AI đã sinh ra một cơ sở dữ liệu cực kỳ cồng kềnh với hàng chục bảng không cần thiết (như bảng lưu vết hoạt động người dùng chi tiết, lịch sử thông báo, vết thay đổi cấu hình hệ thống), làm tăng độ phức tạp của DB vượt quá yêu cầu và thời gian thực hiện của môn học.
```

### 7.3. Cách cải thiện prompt

```text
Cung cấp bối cảnh cụ thể của môn học, giới hạn các bảng cốt lõi (User, Problems, Submissions, Contests) và yêu cầu thiết kế tối giản, đạt chuẩn hóa 3NF để loại bỏ các bảng thừa không thuộc phạm vi chấm điểm.
```

### 7.4. Prompt sau khi cải tiến

```text
Thiết kế cơ sở dữ liệu quan hệ (ERD) cho website thi đấu lập trình với các bảng cốt lõi sau: Users, Problems, Submissions, Contests. Yêu cầu tối giản chuẩn hóa 3NF, không bao gồm các tính năng bổ trợ như log hoạt động hay lịch sử thông báo.
```

### 7.5. Kết quả sau khi cải tiến prompt

```text
AI đưa ra mô hình thực thực thể mối quan hệ (ERD) tinh gọn, chính xác, tập trung 100% vào các tính năng cốt lõi cần thiết, giúp nhóm dễ dàng cài đặt và tối ưu hóa câu lệnh truy vấn.
```

---

## 8. Bài học về cách viết prompt

### 8.1. Khi viết prompt, em/nhóm cần cung cấp thông tin gì để AI trả lời tốt hơn?

```text
- Mục tiêu cụ thể cần giải quyết (giới hạn scope).
- Bối cảnh dự án (đồ án môn học SWP391, quy mô vừa/nhỏ).
- Stack công nghệ đang dùng (Java Spring Boot, Redis, MySQL).
- Ràng buộc hoặc biên giới hạn mong muốn (tối giản, dễ bảo trì, an toàn bảo mật).
- Yêu cầu AI giải thích từng bước hoặc phân tích mặt lợi/hại của phương án.
```

### 8.2. Em/nhóm đã học được gì về cách đặt câu hỏi cho AI?

```text
- Tránh đặt câu hỏi quá chung chung hoặc quá rộng.
- Hãy chia nhỏ vấn đề lớn thành các module nhỏ để hỏi dần (ví dụ: chia nhỏ từ thiết kế kiến trúc -> database -> regex validate).
- Cần đặt mình vào vị thế kiểm chứng kết quả của AI chứ không copy mù quáng.
```

### 8.3. Lần sau em/nhóm sẽ cải thiện prompt như thế nào?

```text
Lần sau sẽ chủ động cung cấp trực tiếp các quy chuẩn kỹ thuật của bài học hoặc tài liệu đặc tả ban đầu làm ngữ cảnh (context) cho AI để giảm thiểu tối đa các câu trả lời bị lạc đề hoặc quá phức tạp.
```

---

## 9. Phân loại prompt đã sử dụng

Đánh dấu số lượng prompt theo từng nhóm.

| Loại prompt | Số lượng | Ví dụ prompt tiêu biểu |
|---|...:|---|
| Prompt phân tích yêu cầu | 1 | `Tôi đang làm dự án Integrated Coding Education... Hãy hướng dẫn tôi cấu trúc chuẩn của một tài liệu SRS...` |
| Prompt giải thích kiến thức | 1 | `Tôi đang xây dựng một nền tảng thi đấu lập trình... giải thích lý thuyết UML...` |
| Prompt thiết kế giải pháp | 1 | `Tôi đang xây dựng một nền tảng thi đấu lập trình... Hãy thiết kế cho tôi một kiến trúc hệ thống...` |
| Prompt thiết kế database | 1 | `Hãy thiết kế một cơ sở dữ liệu chi tiết cho dự án...` (Prompt chưa hiệu quả) |
| Prompt sinh code mẫu | 1 | `Viết một hàm Regex trong Java để validate input đầu vào là tên file...` |
| Prompt debug lỗi | 1 | `Tôi gặp lỗi "org.hibernate.LazyInitializationException: could not initialize proxy - no Session"...` |
| Prompt viết test case | 1 | `Viết unit test sử dụng JUnit 5 và Mockito cho method submitCode...` |
| Prompt review code | 0 |  |
| Prompt tối ưu code | 1 | `Tôi muốn giới hạn tần suất gửi request (Rate Limiting) lên API nộp bài...` |
| Prompt viết báo cáo | 0 |  |
| Prompt chuẩn bị thuyết trình | 0 |  |
| Prompt khác | 0 |  |

---

## 10. Checklist chất lượng prompt

Sinh viên/nhóm tự kiểm tra chất lượng prompt đã dùng.

| Tiêu chí | Đã đạt? | Ghi chú |
|---|:---:|---|
| Prompt có mục tiêu rõ ràng | [x] | Các prompt đều nhắm đến các bài toán cụ thể. |
| Prompt có đủ bối cảnh | [x] | Nêu rõ loại dự án, ngôn ngữ lập trình, hệ thống Grader. |
| Prompt có nêu công nghệ/ngôn ngữ sử dụng | [x] | Nêu rõ Java Spring Boot, Judge0. |
| Prompt có nêu yêu cầu đầu ra | [x] | Định dạng regex, cấu trúc SRS, kiến trúc hệ thống. |
| Prompt không yêu cầu AI làm toàn bộ bài một cách máy móc | [x] | Chỉ hỏi tư vấn giải pháp hoặc module nhỏ độc lập. |
| Prompt có yêu cầu AI giải thích hoặc phân tích | [x] | Hỏi giải thích lý thuyết UML và phân tích rủi ro nghẽn. |
| Kết quả AI được kiểm tra lại | [x] | Rà soát chéo qua Pull Request và Slide lý thuyết. |
| Kết quả AI được chỉnh sửa trước khi sử dụng | [x] | Tối giản kiến trúc (chuyển sang BullMQ), vá bảo mật Regex. |
| Prompt quan trọng được ghi lại đầy đủ | [x] | Ghi nhận chi tiết trong Prompt Log này. |
| Prompt sai/chưa hiệu quả được rút kinh nghiệm | [x] | Ghi nhận trường hợp thiết kế DB quá phức tạp. |

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
| Nguyễn Văn Quang | 22/05/2026 |
