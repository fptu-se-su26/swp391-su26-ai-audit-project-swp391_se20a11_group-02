# AI Audit Log

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Môn học | Software Development Project |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | SUMMER 2026 |
| Tên bài tập / Project | Integrated Coding Education & Competitive Programming Platform |
| Tên sinh viên / Nhóm | Võ Ngọc Thanh - Group 2 |
| MSSV / Danh sách MSSV | DE190293 |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang |
| Ngày bắt đầu | 2026-05-11 |
| Ngày hoàn thành | 2026-05-18 |

---

## 2. Công cụ AI đã sử dụng

Đánh dấu các công cụ AI đã sử dụng trong quá trình thực hiện bài tập/project.

- [ ] ChatGPT
- [x] Gemini
- [ ] Claude
- [x] GitHub Copilot
- [ ] Cursor
- [x] Antigravity
- [ ] Perplexity
- [ ] Microsoft Copilot
- [ ] Công cụ khác: ....................................

---

## 3. Mục tiêu sử dụng AI

Mô tả ngắn gọn sinh viên/nhóm đã sử dụng AI để hỗ trợ những công việc nào.

### Mô tả mục tiêu sử dụng AI

```text
Hỗ trợ nhóm trong quá trình lập tài liệu kỹ thuật dự án (SRS), tìm hiểu lý thuyết UML để vẽ sơ đồ Use Case chính xác. Nghiên cứu và lựa chọn giải pháp kiến trúc Grader Engine (Judge0 API) để đảm bảo an toàn bảo mật hệ thống. Hướng dẫn nhóm thiết lập quy trình làm việc nhóm hiệu quả qua Git và GitHub để giảm thiểu conflict và tối ưu hóa việc quản lý source code.
```

---

## 4. Nhật ký sử dụng AI chi tiết

> Mỗi lần sử dụng AI cho một phần quan trọng của bài tập/project, sinh viên cần ghi lại theo mẫu bên dưới.  
> Sinh viên/nhóm có thể nhân bản mẫu “Lần sử dụng AI” nhiều lần tùy theo số lần sử dụng AI thực tế.

---

### Lần sử dụng AI số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-13 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Tìm hiểu cấu trúc và quy trình viết tài liệu đặc tả yêu cầu phần mềm (SRS) theo chuẩn IEEE 830 |
| Phân việc liên quan | Requirement |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang thực hiện dự án môn học SWP391 để xây dựng một hệ thống "Integrated Coding Education & Competitive Programming Platform" (Nền tảng học lập trình và thi đấu trực tuyến tích hợp). Hãy hướng dẫn tôi quy trình viết một tài liệu đặc tả yêu cầu phần mềm (SRS) đầy đủ và chuyên nghiệp theo chuẩn IEEE 830. Hãy liệt kê các mục lục chính cần có và các lưu ý đặc biệt cho dự án này.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Gemini đã cung cấp một cấu trúc chi tiết dựa trên chuẩn IEEE 830, bao gồm:
1. Introduction: Purpose, scope, references.
2. Overall Description: Product perspective, user classes, operating environment, constraints.
3. System Features: Quản lý người dùng, Quản lý bài tập (Problem), Hệ thống chấm bài (Grader Engine), Lớp học trực tuyến (Courses/Lessons), Thi đấu (Contest), Bảng xếp hạng (Leaderboard).
4. External Interface Requirements: User interfaces, software interfaces (Judge0 API, Database), communications interfaces.
5. Other Non-functional Requirements: Security, Performance, Reliability.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Chúng tôi đã áp dụng trực tiếp cấu trúc mục lục này để xây dựng khung tài liệu SRS cho nhóm. Phần phân tích giao diện ngoài (External Interface Requirements) đã giúp nhóm định hình việc tách biệt Frontend (React) và Backend (Spring Boot).
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Tôi đã điều chỉnh các phần mục lục để phù hợp với phạm vi thực tế của môn học SWP391. Cụ thể, lược bỏ các ràng buộc phần cứng quá phức tạp, tập trung chi tiết vào mô tả luồng hoạt động của "Grader Engine" và phân tích rõ các User Story chính của Student, Teacher và Admin.
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
Hiểu rõ cấu trúc tài liệu phần mềm chuẩn giúp tôi và nhóm bắt đầu dự án một cách khoa học, chuyên nghiệp, tránh mơ hồ khi triển khai.
```

---

### Lần sử dụng AI số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-13 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Phân biệt và áp dụng đúng các quan hệ use case (include, extend, generalization) để thiết kế sơ đồ |
| Phân việc liên quan | Design |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Hãy giải thích chi tiết sự khác nhau giữa các mối quan hệ "include", "extend" và "generalization" trong biểu đồ Use Case của UML. Đồng thời cho ví dụ cụ thể, trực quan liên quan đến các chức năng của một hệ thống Online Judge/Coding Platform (ví dụ: đăng nhập, nộp bài, xem lịch sử nộp bài, đăng ký contest).
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini đã đưa ra sự phân biệt rõ ràng kèm ví dụ trực quan trong hệ thống Online Judge:
- Include (Bao gồm - bắt buộc): Use Case A muốn chạy thì bắt buộc phải chạy Use Case B (ví dụ: Submit Code cần Include Login).
- Extend (Mở rộng - tùy chọn): Use Case B mở rộng cho Use Case A dưới điều kiện nhất định (ví dụ: View Problem Detail có thể Extend View Code Hint).
- Generalization (Kế thừa): Mối quan hệ cha-con (ví dụ: Login via Google kế thừa từ Login).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã áp dụng các nguyên tắc này để vẽ sơ đồ Use Case tổng quát cho hệ thống Coding Platform của nhóm, giúp sơ đồ trở nên mạch lạc và đúng chuẩn UML.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Dựa trên lý thuyết đã hiểu rõ từ AI, tôi tự tay thiết kế và vẽ sơ đồ Use Case bằng công cụ Draw.io, đồng thời cấu trúc lại các Use Case theo nghiệp vụ thực tế của nhóm (tích hợp thêm bài học nhỏ - Lessons thay vì chỉ có thi đấu lập trình).
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
Sự phân biệt rõ ràng từ AI giúp nhóm tránh được lỗi logic khi thiết kế UML, đảm bảo tài liệu SRS đạt yêu cầu thẩm định.
```

---

### Lần sử dụng AI số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-14 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Nghiên cứu giải pháp tự động chấm code (Online Judge Engine) an toàn và tối ưu cho dự án |
| Phân việc liên quan | Design / Backend |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang xây dựng một dự án thi lập trình trực tuyến (Online Judge) bằng Spring Boot và React. Hãy gợi ý cho tôi các giải pháp xây dựng tính năng tự động biên dịch và chấm bài (grader engine) bảo mật và tối ưu nhất cho đồ án sinh viên. Đánh giá ưu nhược điểm của việc tự dựng sandbox (bằng Docker/Jail) so với việc tích hợp các API có sẵn của bên thứ ba (như Judge0 API).
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini đã cung cấp một bản so sánh chi tiết:
1. Tự xây dựng Grader Engine với Docker: Ưu điểm là tự chủ hoàn toàn, không giới hạn lượt chấm; nhược điểm là cực kỳ phức tạp và nguy cơ bảo mật cao.
2. Tích hợp Judge0 API: Ưu điểm là an toàn vì code chạy trên sandbox cô lập của Judge0, hỗ trợ nhiều ngôn ngữ; nhược điểm là phụ thuộc bên thứ ba.
Khuyên nên bắt đầu bằng cách tích hợp Judge0 API để đảm bảo an toàn tuyệt đối và tiết kiệm thời gian.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Nhóm đã thống nhất lựa chọn giải pháp Tích hợp Judge0 API cho hệ thống để giải quyết triệt để bài toán bảo mật và đi đúng hướng kiến trúc.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Nhóm đã tự phát triển thêm một Module trung gian ở Backend (Spring Boot) làm Queue Manager để quản lý các lượt submit, tránh quá tải request và thực hiện cơ chế pooling/webhook để cập nhật kết quả thời gian thực qua WebSocket.
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
Việc chọn đúng giải pháp kiến trúc an toàn ngay từ đầu giúp dự án tránh được rủi ro bảo mật nghiêm trọng và tiết kiệm tối đa thời gian code.
```

---

### Lần sử dụng AI số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-15 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Thiết lập quy trình làm việc nhóm hiệu quả với Git và giải quyết xung đột code |
| Phân việc liên quan | Other |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Chúng tôi là một nhóm gồm 5 sinh viên đang thực hiện dự án SWP391. Hãy hướng dẫn chúng tôi cách sử dụng GitHub để làm việc nhóm hiệu quả, các tính năng cơ bản cần dùng (commit, push, pull, branch, merge, pull request) và đề xuất một luồng làm việc với nhánh (Git Workflow/Git Flow) phù hợp nhất để tránh xung đột code (conflict).
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini đã đề xuất mô hình Git Flow rút gọn tối ưu cho đồ án sinh viên:
1. Nhánh main: Chỉ chứa mã nguồn ổn định, đã kiểm thử kỹ càng. Không code trực tiếp trên đây.
2. Nhánh dev: Nhánh tích hợp chính của nhóm.
3. Nhánh tính năng cá nhân (feature/task-name): Mỗi thành viên tự phát triển trên nhánh riêng từ dev.
4. Quy trình Merge: Tạo Pull Request (PR) từ nhánh cá nhân vào dev, mời thành viên khác review trước khi merge.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Nhóm đã triển khai mô hình Git Flow này cho repository chung. Mọi thành viên đều phát triển trên nhánh riêng và tạo Pull Request trước khi tích hợp vào nhánh dev.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã chủ động thiết lập thêm bộ quy tắc đặt tên commit (Commit Message Convention) theo chuẩn Conventional Commits và cấu hình file .gitignore chuẩn cho Spring Boot và React để giữ repository sạch sẽ.
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
Quy trình làm việc nhóm rõ ràng giúp các thành viên cộng tác mượt mà, giảm thiểu tối đa conflict và dễ dàng theo dõi lịch sử code.
```


---

## 5. Bảng tổng hợp mức độ sử dụng AI

Đánh dấu mức độ AI hỗ trợ ở từng hạng mục.

| Hạng mục | Không dùng AI | AI hỗ trợ ít | AI hỗ trợ nhiều | AI sinh chính | Ghi chú |
|---|:---:|:---:|:---:|:---:|---|
| Phân tích yêu cầu |  |  |  |  |  |
| Viết user story/use case |  |  |  |  |  |
| Thiết kế database |  |  |  |  |  |
| Thiết kế kiến trúc hệ thống |  |  |  |  |  |
| Thiết kế giao diện |  |  |  |  |  |
| Code frontend |  |  |  |  |  |
| Code backend |  |  |  |  |  |
| Debug lỗi |  |  |  |  |  |
| Viết test case |  |  |  |  |  |
| Kiểm thử sản phẩm |  |  |  |  |  |
| Tối ưu code |  |  |  |  |  |
| Viết báo cáo |  |  |  |  |  |
| Làm slide thuyết trình |  |  |  |  |  |

---

## 6. Các lỗi hoặc hạn chế từ AI

Ghi lại các trường hợp AI trả lời sai, thiếu, chưa phù hợp hoặc sinh code không chạy.

| STT | Lỗi/hạn chế từ AI | Cách phát hiện | Cách xử lý/cải tiến |
|---:|---|---|---|
| 1 |  |  |  |
| 2 |  |  |  |
| 3 |  |  |  |

---

## 7. Kiểm chứng kết quả AI

Mô tả cách sinh viên/nhóm kiểm tra lại kết quả do AI gợi ý.

Có thể bao gồm:

- Chạy thử chương trình
- Viết test case
- So sánh với yêu cầu đề bài
- Kiểm tra output
- Đối chiếu tài liệu môn học
- Hỏi lại giảng viên
- Review cùng thành viên nhóm
- Kiểm tra lỗi bảo mật
- Kiểm tra bằng dữ liệu mẫu
- So sánh trước và sau khi dùng AI

### Nội dung kiểm chứng

```text
Viết tại đây...
```

---

## 8. Đóng góp cá nhân hoặc đóng góp nhóm

### 8.1. Đối với bài cá nhân

Mô tả phần sinh viên tự làm, phần AI hỗ trợ và phần đã tự cải tiến.

```text
Viết tại đây...
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

```text
Viết tại đây...
```

### 9.2. Phần nào em/nhóm không sử dụng theo gợi ý của AI? Vì sao?

```text
Viết tại đây...
```

### 9.3. Em/nhóm đã kiểm tra tính đúng đắn của kết quả AI như thế nào?

```text
Viết tại đây...
```

### 9.4. Nếu không có AI, phần nào sẽ khó khăn nhất?

```text
Viết tại đây...
```

### 9.5. Sau bài tập/project này, em/nhóm học được gì về môn học?

```text
Viết tại đây...
```

### 9.6. Sau bài tập/project này, em/nhóm học được gì về cách sử dụng AI có trách nhiệm?

```text
Viết tại đây...
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
|  |  |
