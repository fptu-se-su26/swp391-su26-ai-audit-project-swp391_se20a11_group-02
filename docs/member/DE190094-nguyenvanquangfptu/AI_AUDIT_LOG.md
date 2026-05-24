# AI Audit Log

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
| Ngày hoàn thành | 2026-05-24                                                     |

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

Ví dụ:

- Phân tích yêu cầu bài toán
- Gợi ý ý tưởng giải pháp
- Thiết kế database
- Thiết kế giao diện
- Viết code mẫu
- Debug lỗi
- Tối ưu code
- Viết test case
- Kiểm tra bảo mật
- Viết báo cáo
- Chuẩn bị slide thuyết trình
- Tìm hiểu công nghệ mới

### Mô tả mục tiêu sử dụng AI
- Phân tích yêu cầu và hỗ trợ lập tài liệu kỹ thuật hệ thống (Software Requirements Specification - SRS).
- Tìm hiểu lý thuyết UML để chuẩn hóa sơ đồ Use Case cho các tác nhân (Actor) trong hệ thống.
- Nghiên cứu kiến trúc và lựa chọn giải pháp Grader Engine (Judge0 API) để chấm code tự động, đảm bảo an toàn và bảo mật (sandboxing).
- Thiết lập quy trình quản lý mã nguồn (Git Flow) cho nhóm 5 thành viên trên GitHub nhằm tối ưu hóa làm việc nhóm và giảm thiểu merge conflict.
- Tối ưu bảo mật bằng cách thiết lập Rate Limiting (giới hạn tần suất gửi yêu cầu) cho API nộp bài để ngăn chặn spam/DoS.
- Debug và khắc phục lỗi liên quan đến JPA Hibernate (như LazyInitializationException) trong quá trình phát triển database.
- Viết các test case tự động (Unit Test) sử dụng JUnit 5 và Mockito để đảm bảo chất lượng code và tính tin cậy của các dịch vụ cốt lõi.

## 4. Nhật ký sử dụng AI chi tiết

> Mỗi lần sử dụng AI cho một phần quan trọng của bài tập/project, sinh viên cần ghi lại theo mẫu bên dưới.  
> Sinh viên/nhóm có thể nhân bản mẫu “Lần sử dụng AI” nhiều lần tùy theo số lần sử dụng AI thực tế.

---

### Lần sử dụng AI số 1

| Nội dung | Thông tin                                                                                              |
|---|--------------------------------------------------------------------------------------------------------|
| Ngày sử dụng | 18/05/2026                                                                                             |
| Công cụ AI | Gemini                                                                                                 |
| Mục đích sử dụng | Hiểu rõ cấu trúc tài liệu SRS và quy chuẩn vẽ Use Case                                                                                                    |
| Phần việc liên quan | Requirement / Design |
| Mức độ sử dụng | Hỗ trợ ý tưởng / Hỗ trợ một phần                                |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang làm dự án Integrated Coding Education & Competitive Programming Platform. Hãy hướng dẫn tôi cấu trúc chuẩn của một tài liệu SRS. Đồng thời, giải thích lý thuyết UML và gợi ý các Use Case chính cho nền tảng này.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
AI cung cấp dàn ý chi tiết cho tài liệu SRS (Mục đích, Phạm vi, Functional/Non-functional Requirements). Phân tích lý thuyết UML diagram và liệt kê các Use Case cơ bản cho 3 tác nhân chính: Student, Instructor, Admin.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Sử dụng dàn ý SRS làm bộ khung (template) cho tài liệu của nhóm. Tham khảo danh sách các Use Case để tránh bỏ sót các tính năng cốt lõi.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Nhóm dựa vào đề xuất của AI, sau đó tự định nghĩa lại luồng flow dựa trên kiến thức thực tế và các wed có sẵn để phù hợp với yêu cầu của môn học. 
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Viết tại đây...
```

---

### Lần sử dụng AI số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 20/05/2026 |
| Công cụ AI | ChatGPT / Gemini  |
| Mục đích sử dụng | Nghiên cứu kiến trúc tích hợp hệ thống chấm code tự động (Grader Engine) |
| Phần việc liên quan | Architecture / Backend |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang xây dựng một nền tảng thi đấu lập trình bằng Java Spring Boot. Tôi muốn dùng Judge0 API để chấm code tự động. Hãy thiết kế cho tôi một kiến trúc hệ thống để xử lý tình huống có 1000 sinh viên cùng nộp bài một lúc mà server không bị sập.
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích rủi ro quá tải (bottleneck) nếu gọi API đồng bộ. Gợi ý sử dụng kiến trúc Bất đồng bộ (Asynchronous) kết hợp Message Queue (như RabbitMQ hoặc Redis Pub/Sub). Flow: Web Server nhận source code -> Lưu vào Database trạng thái "Pending" -> Đẩy message vào Queue -> Các Worker Server lấy message từ Queue, gửi sang Judge0 -> Nhận kết quả từ Judge0 -> Cập nhật trạng thái "Accepted/Wrong Answer" vào Database.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Nhóm sử dụng toàn bộ mô hình kiến trúc Message Queue + Worker. Các khái niệm trạng thái bài nộp (Pending, Judging, Accepted, WA, TLE) cũng được lấy từ gợi ý của AI để thiết kế bảng Submission trong Database.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thay vì dùng Kafka hay RabbitMQ do việc cấu hình server quá phức tạp đối với quy mô đồ án môn học, nhóm quyết định tối ưu bằng cách chỉ dùng tính năng Queue đơn giản của Redis (BullMQ / Redis Queue) để tiết kiệm tài nguyên.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | docs/System_Architecture_Diagram.png |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Hiểu được sức mạnh của kiến trúc xử lý bất đồng bộ (Async Processing). AI giúp nhóm giải quyết được bài toán hóc búa nhất của dự án mà không cần phải đi thử sai quá nhiều lần.
```

---

### Lần sử dụng AI số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 22/05/2026|
| Công cụ AI |  Gemini  / GitHub Copilot  |
| Mục đích sử dụng | Thiết lập quy trình quản lý mã nguồn (Git Flow) và hỗ trợ sinh code regex |
| Phần việc liên quan | Backend / Management |
| Mức độ sử dụng | Hỗ trợ một phần  |

#### 4.1. Prompt đã sử dụng

```text
Viết một hàm Regex trong Java để validate input đầu vào là tên file source code. Yêu cầu: Không chứa ký tự đặc biệt, độ dài từ 1-50, đuôi file bắt buộc là .java, .cpp, .c, hoặc .py.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp chuỗi Regex: ^[a-zA-Z0-9_-]{1,50}\.(java|cpp|c|py)$ kèm theo hàm isValidFileName() viết bằng Java sử dụng class Pattern và Matcher.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng biểu thức Regex và cấu trúc hàm cơ bản AI cung cấp để nhúng vào Validation Layer (DTO) của Spring Boot.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Bổ sung thêm logic kiểm tra dung lượng file (không quá 1MB) và chống tải lên các file mã độc giả mạo đuôi file, kết hợp sử dụng Apache Tika để đọc MIME type thực sự của file thay vì chỉ tin vào đuôi file do AI gợi ý.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI viết Regex và các hàm tiện ích (Utils) cực kỳ nhanh và chính xác, giúp tiết kiệm thời gian. Tuy nhiên, AI thường bỏ qua các góc độ bảo mật nâng cao (như lỗ hổng upload file), đòi hỏi lập trình viên phải có kiến thức nền để vá lỗi.
```

---

### Lần sử dụng AI số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 21/05/2026 |
| Công cụ AI | ChatGPT |
| Mục đích sử dụng | Giải quyết lỗi (Debug) JPA `LazyInitializationException` khi truy vấn dữ liệu quan hệ Lazy-loaded |
| Phần việc liên quan | Backend / Database |
| Mức độ sử dụng | Hỗ trợ ý tưởng / Giải quyết lỗi |

#### 4.1. Prompt đã sử dụng

```text
Tôi gặp lỗi "org.hibernate.LazyInitializationException: could not initialize proxy - no Session" trong Spring Boot khi gọi method getContestDetails() để lấy thông tin Contest kèm theo danh sách Problems. Quan hệ giữa Contest và Problem là @OneToMany(fetch = FetchType.LAZY). Làm sao để sửa lỗi này mà không cần đổi fetch type thành EAGER?
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích nguyên nhân là do Session của Hibernate đã bị đóng sau khi kết thúc Transaction, dẫn đến việc không thể tải chậm (Lazy Loading) các Problems ở tầng Web/Controller. AI đề xuất 3 giải pháp:
1. Thêm annotation @Transactional tại Service/Controller để duy trì Session (không khuyến khích nếu kéo dài sang Controller).
2. Sử dụng truy vấn JPQL với "JOIN FETCH" (LEFT JOIN FETCH) trong Repository để tải trước các thực thể liên quan trong một câu truy vấn duy nhất.
3. Sử dụng EntityGraph của JPA.
AI khuyến nghị phương án 2 (JOIN FETCH) vì tối ưu nhất về hiệu năng và tránh được lỗi N+1 SELECT.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Nhóm sử dụng giải pháp JPQL JOIN FETCH do AI đề xuất và áp dụng vào ContestRepository để viết hàm truy vấn tùy chỉnh.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Nhóm chủ động viết thêm câu lệnh JPQL cụ thể để lấy đúng các trường cần thiết, tránh fetch thừa các trường dung lượng lớn khác không sử dụng trong DTO.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/example/repository/ContestRepository.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Lỗi LazyInitializationException rất phổ biến trong JPA Hibernate. AI đã giúp giải thích rõ bản chất cơ chế Session của Hibernate, từ đó nhóm có giải pháp giải quyết triệt để thay vì sửa bừa bằng cách đổi fetch type sang EAGER gây chậm hệ thống.
```

---

### Lần sử dụng AI số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 21/05/2026 |
| Công cụ AI | ChatGPT / Gemini |
| Mục đích sử dụng | Tối ưu bảo mật bằng cách thiết lập Rate Limiting bảo vệ API nộp bài |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Hỗ trợ ý tưởng / Hỏi thiết kế giải pháp |

#### 4.1. Prompt đã sử dụng

```text
Tôi muốn giới hạn tần suất gửi request (Rate Limiting) lên API nộp bài /api/submissions trong Java Spring Boot. Mỗi User chỉ được nộp tối đa 5 lần trong vòng 1 phút. Hãy gợi ý cho tôi giải pháp sử dụng Redis hoặc thư viện Bucket4j.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất sử dụng thuật toán Token Bucket thông qua thư viện Bucket4j kết hợp với Redis (Spring Cache) để lưu trữ trạng thái bucket phân tán. AI cung cấp code mẫu cấu hình Bucket4j và một Filter/Interceptor để lấy IP của client làm key giới hạn tần suất.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng cấu hình thư viện Bucket4j và cấu trúc class Interceptor (`RateLimitInterceptor`) do AI cung cấp để tích hợp vào WebMvcConfigurer của Spring Boot.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
AI ban đầu gợi ý chặn theo Client IP thô. Nhóm nhận thấy IP dễ bị thay đổi bằng VPN hoặc trùng nhau trong mạng LAN trường học, nên nhóm đã cải tiến bằng cách lấy trực tiếp User ID được giải mã từ JWT Token trong SecurityContext để làm Key định danh duy nhất cho mỗi bucket.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/main/java/com/example/config/RateLimitInterceptor.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Thiết lập Rate Limiting là một bước quan trọng để hệ thống không bị sập bởi các cuộc tấn công DDoS hay spam nộp bài từ một người dùng. AI tư vấn thuật toán Token Bucket rất trực quan, giúp nhóm áp dụng nhanh chóng.
```

---

### Lần sử dụng AI số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 22/05/2026 |
| Công cụ AI | ChatGPT / GitHub Copilot |
| Mục đích sử dụng | Viết Unit Test bằng JUnit 5 và Mockito cho nghiệp vụ chấm bài |
| Phần việc liên quan | Testing / Quality Assurance |
| Mức độ sử dụng | Hỗ trợ sinh code / Viết test case |

#### 4.1. Prompt đã sử dụng

```text
Viết unit test sử dụng JUnit 5 và Mockito cho method submitCode(SubmissionRequest request) của class SubmissionServiceImpl trong Spring Boot. Method này sẽ lưu submission vào DB với trạng thái PENDING, sau đó đẩy message vào Redis queue. Cần mock các dependency: SubmissionRepository và RedisTemplate.
```

#### 4.2. Kết quả AI gợi ý

```text
AI sinh ra toàn bộ code class Test sử dụng các annotation Mockito như `@ExtendWith`, `@Mock`, `@InjectMocks`. AI mock các lệnh gọi DB và gửi Redis, tuy nhiên chỉ mock sơ sài `redisTemplate.opsForList()`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Nhóm sử dụng cấu trúc tổ chức lớp kiểm thử, các test case chính (test trường hợp thành công nộp bài, test trường hợp thiếu thông tin nộp bài).
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Code AI sinh bị lỗi compile và NullPointerException do AI mock sai cấu trúc Fluent API của RedisTemplate. Nhóm đã tự sửa lại bằng cách mock lớp `ListOperations` một cách tường minh và cấu hình `when(redisTemplate.opsForList()).thenReturn(listOperationsMock)`. Đồng thời, nhóm bổ sung kiểm thử cho các exception tùy chỉnh (Custom Exceptions) mà AI chưa viết hết.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | src/test/java/com/example/service/SubmissionServiceTest.java |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI là trợ thủ đắc lực trong việc sinh code kiểm thử nhàm chán (boilerplate unit test code). Tuy nhiên, với các thư viện phức tạp có thiết kế fluent api (như RedisTemplate), AI thường xuyên sinh sai code hoặc mock thiếu, đòi hỏi lập trình viên phải debug cẩn thận.
```

---

## 5. Bảng tổng hợp mức độ sử dụng AI

Đánh dấu mức độ AI hỗ trợ ở từng hạng mục.

| Hạng mục | Không dùng AI | AI hỗ trợ ít | AI hỗ trợ nhiều | AI sinh chính | Ghi chú |
|---|:---:|:---:|:---:|:---:|---|
| Phân tích yêu cầu |  |  |x|  | Lấy dàn ý và phân rã chức năng |
| Viết user story/use case |  |x|  |  | Dùng AI để soát lại logic |
| Thiết kế database |  |x|  |  | Hỏi AI về chuẩn hóa DB (Normalization) |
| Thiết kế kiến trúc hệ thống |  |  |x|  | Kiến trúc Grader Engine + Queue |
| Thiết kế giao diện |  |x|  |  | Đề xuất Figma và UI |
| Code frontend |  |  |x|  | Dùng Copilot gợi ý cú pháp HTML/CSS |
| Code backend |  |x|  |  | Sinh các hàm utils, regex, query mẫu |
| Debug lỗi |  |  |x|  | Giải quyết LazyInitializationException |
| Viết test case |  |  |x|  | Sinh boilerplate cho JUnit 5 + Mockito |
| Kiểm thử sản phẩm |  |x|  |  | Gợi ý các biên kiểm thử tải, test case lỗi |
| Tối ưu code |  |  |x|  | Cấu hình thuật toán Token Bucket giới hạn request |
| Viết báo cáo |  |x|  |  | Tham khảo cấu trúc và văn phong kỹ thuật |
| Làm slide thuyết trình |  |x|  |  | Lập dàn ý phân chia slide báo cáo |

---

## 6. Các lỗi hoặc hạn chế từ AI

Ghi lại các trường hợp AI trả lời sai, thiếu, chưa phù hợp hoặc sinh code không chạy.

| STT | Lỗi/hạn chế từ AI | Cách phát hiện | Cách xử lý/cải tiến |
|---:|---|---|---|
| 1 | Sinh biểu đồ ERD bị thừa bảng không cần thiết, làm phức tạp DB môn học. | Họp nhóm đối chiếu với số lượng chức năng thực tế. | Loại bỏ các bảng phụ (ví dụ: User_Activity_Log) do không nằm trong Scope chấm điểm. |
| 2 | Gợi ý Rate Limiting dựa trên Client IP thô, dễ bị bypass qua VPN/Proxy hoặc làm ảnh hưởng sinh viên cùng lớp. | Đọc mã nguồn AI sinh và phát hiện việc chặn IP không tối ưu trong môi trường mạng chung. | Đổi sang lấy User ID từ JWT Token đã được Spring Security giải mã trước đó làm Key cho bucket. |
| 3 | Sinh code mock RedisTemplate bị NullPointerException do không mock ListOperations lồng bên trong. | Lỗi crash khi thực thi JUnit Test. | Thực hiện mock đối tượng `ListOperations` độc lập và stub `redisTemplate.opsForList()` trả về instance mock đó. |

---

## 7. Kiểm chứng kết quả AI

Mô tả cách sinh viên/nhóm kiểm tra lại kết quả do AI gợi ý.

Có thể bao gồm:

- Đối chiếu lý thuyết: Mọi đề xuất về Use Case, ERD, Kiến trúc đều được đối chiếu lại với slide bài giảng của môn SWP391 và tham khảo ý kiến của giảng viên hướng dẫn (Mentor) ở các buổi review hàng tuần.
- Chạy thử & Debug: Bất kỳ đoạn code nào copy/tham khảo từ AI (đặc biệt là Copilot) đều được Review chéo (Peer Review) qua Pull Request trên GitHub trước khi Merge.
- Test Cases thực tế: Tự tạo dữ liệu nộp bài (submission) giả định (code đúng, code bị lặp vô hạn, code ăn cắp bộ nhớ) để test độ chịu tải và độ chính xác của logic do AI gợi ý.

### Nội dung kiểm chứng

```text
- Chạy kiểm thử tự động (Unit Test): Toàn bộ các test case cho `SubmissionService` được thực thi và đạt tỷ lệ coverage mong muốn, đảm bảo không bị regression lỗi cũ.
- Kiểm thử bảo mật (Rate Limit): Sử dụng Postman Runner để gửi liên tiếp 10 requests trong vòng 5 giây từ cùng một tài khoản. Kết quả 5 request đầu tiên thành công (HTTP 200), từ request thứ 6 hệ thống trả về HTTP 429 Too Many Requests kèm HTTP Header Retry-After đúng theo cấu hình Bucket4j.
- Kiểm thử Debug JPA: Truy vấn xem log SQL được Hibernate sinh ra để xác nhận chỉ có 1 câu SELECT kèm `LEFT JOIN FETCH` được thực hiện thay vì N+1 SELECT như lúc bị LazyInitializationException.
```

---

## 8. Đóng góp cá nhân hoặc đóng góp nhóm

### 8.1. Đối với bài cá nhân

Mô tả phần sinh viên tự làm, phần AI hỗ trợ và phần đã tự cải tiến.

```text
Nguyễn Văn Quang tự thực hiện:
- Thiết kế Database Schema chính và triển khai thực tế trên MySQL.
- Tự viết logic tích hợp Redis Queue (BullMQ) cho hệ thống chấm bài.
- Tự tay cấu hình Interceptor cho Spring Boot Security và tích hợp Bucket4j.
- Viết Unit Tests kiểm thử toàn bộ luồng chấm bài.

AI hỗ trợ:
- Lên ý tưởng kiến trúc bất đồng bộ (Message Queue) ở giai đoạn đầu.
- Gợi ý chuỗi Regex kiểm tra tên file nộp bài.
- Cung cấp khung sườn (boilerplate) cho RateLimitInterceptor và các lớp test Mockito.

Cải tiến của cá nhân:
- Scale down kiến trúc cồng kềnh (Kafka/RabbitMQ) về BullMQ để tối ưu tài nguyên.
- Nâng cấp logic Rate Limiting dựa trên User ID thay vì IP thô.
- Khắc phục các lỗi mock lồng nhau trong JUnit test mà AI không giải quyết được.
```

### 8.2. Đối với bài nhóm

| Thành viên | MSSV | Nhiệm vụ chính | Có sử dụng AI không? | Minh chứng đóng góp |
|---|---|---|---|---|
|  |  |  | Có / Không |  |
|  |  |  | Có / Không |  |
|  |  |  | Có / Không |  |
|  |  |  | Có / Không |  |

---

## 9. Reflection cuối bài

### 9.1. AI đã hỗ trợ em/nhóm ở điểm nào?

AI hoạt động như một "Mentor ảo" túc trực 24/7. Nó đặc biệt xuất sắc trong việc phá vỡ "sự bế tắc" (writer's block) khi bắt đầu dự án bằng cách cung cấp các template, dàn ý, và giải thích các khái niệm kỹ thuật phức tạp (như Message Queue) một cách cực kỳ dễ hiểu. Trong lúc code, AI giúp tăng tốc độ gõ phím và giảm thời gian tìm kiếm lỗi (debug stacktrace) đáng kể.

### 9.2. Phần nào em/nhóm không sử dụng theo gợi ý của AI? Vì sao?

Nhóm tuyệt đối không sử dụng AI để sinh toàn bộ khung chương trình hay kiến trúc Database một cách rập khuôn. Vì các gợi ý của AI thường hướng tới các hệ thống Enterprise quy mô lớn (dùng Microservices, Kafka, v.v.), điều này vượt quá thời lượng và yêu cầu của môn SWP391. Nhóm phải tự cắt gọt (scale down) để vừa vặn với năng lực và điểm số mong muốn.

### 9.3. Em/nhóm đã kiểm tra tính đúng đắn của kết quả AI như thế nào?

Không tin tưởng mù quáng vào code AI sinh ra. Bắt buộc phải hiểu từng dòng code làm gì mới đưa vào hệ thống. Áp dụng kỹ thuật Unit Test và kiểm thử hộp đen (Black-box testing) cho mọi luồng tính năng.
```

### 9.4. Nếu không có AI, phần nào sẽ khó khăn nhất?

Viết tài liệu kỹ thuật chuẩn (SRS) và nghiên cứu phương pháp tích hợp Grader Engine. Nếu tự mò tài liệu Judge0 và hệ thống hàng đợi bằng Google thuần túy, nhóm có thể mất đến vài tuần chỉ để làm quen kiến trúc, dẫn đến trễ tiến độ làm sản phẩm.
```

### 9.5. Sau bài tập/project này, em/nhóm học được gì về môn học?

Hiểu rõ quy trình vòng đời phát triển phần mềm (SDLC), cách vận hành nhóm Agile/Scrum trên GitHub và quan trọng nhất là đưa được một hệ thống phần mềm có kiến trúc tương đối phức tạp vào hoạt động thực tế..
```

### 9.6. Sau bài tập/project này, em/nhóm học được gì về cách sử dụng AI có trách nhiệm?

AI là công cụ khuếch đại năng lực, chứ không phải vật thay thế bộ não con người. Sử dụng AI có trách nhiệm nghĩa là mình phải làm chủ được kết quả nó tạo ra, hiểu rõ điểm mù của nó (đặc biệt là bảo mật), và minh bạch về việc mình đã nhận sự trợ giúp từ đâu.
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
| Nguyễn Văn Quang |24/05/2026|
