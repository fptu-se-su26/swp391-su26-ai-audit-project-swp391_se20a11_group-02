# AI Audit Log

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Môn học | Software Development Project |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | SU26 |
| Tên bài tập / Project |Integrated Coding Education & Competitive Programming Platform|
| Tên sinh viên / Nhóm | Trịnh Hoàng Thiên Bảo |
| MSSV / Danh sách MSSV | DE190023 |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang |
| Ngày bắt đầu | 18/05/2026 |
| Ngày hoàn thành |  |

---

## 2. Công cụ AI đã sử dụng

Đánh dấu các công cụ AI đã sử dụng trong quá trình thực hiện bài tập/project.

- [x] ChatGPT
- [x] Gemini
- [x] Claude
- [x] GitHub Copilot
- [x] Cursor
- [x] Antigravity
- [] Perplexity
- [] Microsoft Copilot
- [] Công cụ khác: ....................................

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
- Hỗ trợ lên ý tưởng giải pháp cho các chức năng phức tạp.
- Tham khảo các best practice về kiến trúc hệ thống (ví dụ: cách thiết kế Repository, Dependency Injection trong Spring Boot).
- Gợi ý cấu trúc code mẫu, hướng dẫn sử dụng các thư viện/framework mới.
- Hỗ trợ viết các script xử lý logic, định dạng (format) lại code chuẩn xác.
## 4. Nhật ký sử dụng AI chi tiết

> Mỗi lần sử dụng AI cho một phần quan trọng của bài tập/project, sinh viên cần ghi lại theo mẫu bên dưới.  
> Sinh viên/nhóm có thể nhân bản mẫu “Lần sử dụng AI” nhiều lần tùy theo số lần sử dụng AI thực tế.

---

### Lần sử dụng AI số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-18 |
| Công cụ AI |  Claude |
| Mục đích sử dụng | Xác định và đếm số lượng Use Case Specification cho chức năng Instructor |
| Phần việc liên quan | Phân việc liên quan	Use Case Analysis / System Design |
| Mức độ sử dụng | Phân việc liên quan	Use Case Analysis / System Design |

#### 4.1. Prompt đã sử dụng

Chức năng dành cho Instructor (Giảng viên)
Instructor là đối tác cung cấp nội dung, có quyền khởi tạo khóa học và tổ chức các kỳ thi thuật toán:
• Tài chính & Kinh doanh: Bán khóa học, Rút tiền doanh thu.
• Quản lý khóa học: Quản lý nội dung, Upload video, Tạo quiz, Cập nhật/chỉnh sửa, Ẩn/hiện,
  Trả lời Q&A, Xem thống kê.
• Quản lý Contest: Tạo Contest mới, Cấu hình, Thêm bài tập, Xem thống kê và kết quả.
• Quản lý bài tập Code: Tạo đề bài, Tạo và quản lý Test Case, Cấu hình tài nguyên.
dựa vào đây có bao nhiêu use case specification?"


#### 4.2. Kết quả AI gợi ý
Chức năng dành cho Instructor (Giảng viên)
Instructor là đối tác cung cấp nội dung, có quyền khởi tạo khóa học và tổ chức các kỳ thi thuật toán:
• Tài chính & Kinh doanh: Bán khóa học, Rút tiền doanh thu.
• Quản lý khóa học: Quản lý nội dung, Upload video, Tạo quiz, Cập nhật/chỉnh sửa, Ẩn/hiện,
  Trả lời Q&A, Xem thống kê.
• Quản lý Contest: Tạo Contest mới, Cấu hình, Thêm bài tập, Xem thống kê và kết quả.
• Quản lý bài tập Code: Tạo đề bài, Tạo và quản lý Test Case, Cấu hình tài nguyên.
dựa vào đây có bao nhiêu use case specification?"


#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

Chúng tôi đã sử dụng kết quả phân tích của Claude làm cơ sở để xác định chính xác danh sách
19 Use Case cần đặc tả. Cách phân nhóm 4 nhóm chức năng (Tài chính, Khóa học, Contest,
Bài tập Code) được giữ nguyên vì phản ánh đúng kiến trúc module của hệ thống.
Sơ đồ use case trực quan do AI sinh ra cũng được dùng để tham khảo khi vẽ Use Case Diagram.


#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Nhóm đã rà soát lại và quyết định tách UC10 (Tạo Contest) và UC11 (Cấu hình Contest) thành
2 use case riêng biệt thay vì gộp chung như gợi ý ban đầu của AI, vì hai hành động này có
trigger, precondition và flow khác nhau rõ ràng trong thực tế sử dụng.
Ngoài ra, nhóm bổ sung UC18 (Upload file Input/Output) tách riêng khỏi UC17 (Tạo Test Case)
để phản ánh đúng luồng nghiệp vụ khi Instructor cần upload hàng loạt test case qua file ZIP.


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
- Nhóm đã hiểu rõ hơn cách phân tích và phân rã các tính năng lớn thành các Use Case đơn lẻ, có nghiệp vụ rõ ràng để chuẩn bị cho việc thiết kế sơ đồ Use Case Diagram.
- Nhận thức được tầm quan trọng của việc phân chia module hệ thống (Tài chính, Khóa học, Contest, Bài tập Code) giúp cấu trúc hệ thống mạch lạc và dễ phát triển.
- Bài học rút ra: AI rất mạnh trong việc gợi ý nhanh một danh sách tổng quan ban đầu, nhưng không thể thay thế tư duy phản biện của con người. Nhóm cần tự phân tích kỹ lưỡng để tách/gộp các Use Case (như tách UC10 & UC11, hay bổ sung UC18) sao cho phù hợp với luồng nghiệp vụ thực tế của sản phẩm.
```

---

### Lần sử dụng AI số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-19 |
| Công cụ AI | Claude |
| Mục đích sử dụng | Viết đầy đủ 19 Use Case Specification theo template chuẩn cho chức năng Instructor |
| Phần việc liên quan | Viết đầy đủ 19 Use Case Specification theo template chuẩn cho chức năng Instructor |
| Mức độ sử dụng | Tạo nội dung chính |

#### 4.1. Prompt đã sử dụng

"UC SPECIFICATION TEMPLATE
Use Case Name / Use Case ID / Created By / Actor(s) / Preconditions / Post conditions
/ Main Flow (Basic Path) / Alternative Flow A / Alternative Flow B / Exception Flow
/ Business Rules
dựa vào đây làm mỗi usecase cho tôi, bằng tiếng việt nha"

#### 4.2. Kết quả AI gợi ý
Claude xuất ra file Word (.docx) chứa 19 bảng Use Case theo template 11 trường.
Mỗi UC có đầy đủ: tên, ID (UC01–UC19), actor, preconditions, post conditions, main flow
(6–7 bước), alternative flow A/B, exception flow và business rules. Nội dung được viết
bằng tiếng Việt, trình bày dạng bảng 2 cột có màu sắc phân biệt label và value.




#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Toàn bộ nội dung 19 Use Case Specification được sử dụng trực tiếp làm nền tảng của tài
liệu đặc tả. Cụ thể các phần được sử dụng từ AI:

• Cấu trúc Main Flow (các bước đánh số rõ ràng từ 1–7) cho tất cả 19 UC.
• Nội dung Alternative Flow A/B và Exception đã phân loại theo mã lỗi (E1, E2,...).
• Business Rules với mã hóa BR01, BR02,... giúp dễ tra cứu khi review tài liệu.
• Phần Trigger giúp nhóm xác định rõ điểm khởi đầu của từng use case trong flow tổng thể.
• Phân tách Primary Actor / Secondary Actor làm rõ trách nhiệm của từng bên trong hệ thống.


#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Nhóm đã rà soát và điều chỉnh lại nội dung ở một số điểm so với bản AI sinh ra ban đầu:

• Phần Frequency Of Use: AI ban đầu để khá chung chung, nhóm đã chỉnh lại cho sát với
  thực tế vận hành hơn (ví dụ: UC08 Q&A đổi thành 'Hàng ngày, tùy số lượng câu hỏi').
• Phần Assumptions: bổ sung thêm các giả định liên quan đến cam kết của Instructor
  (ví dụ: phản hồi Q&A trong 48 giờ, kiểm chứng Expected Output trước khi upload).
• UC-INS-17 và UC-18: nhóm làm rõ mối liên kết giữa hai use case này bằng cách thêm
  ghi chú cross-reference trong phần Alternative Flow và Other Information.
• Kiểm tra lại toàn bộ Business Rules để đảm bảo tính nhất quán về con số giới hạn
  (Time Limit, Memory Limit, dung lượng file) với tài liệu kỹ thuật hệ thống.


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
- Nắm vững cấu trúc chuẩn của một tài liệu đặc tả Use Case Specification (gồm 11 trường thông tin quan trọng như Main Flow, Alternative Flows, Exception Flows và Business Rules).
- Học được cách quản lý, mã hóa các quy tắc nghiệp vụ (BR) và ngoại lệ (E) để dễ dàng tra cứu, kiểm chứng chéo và triển khai code sau này.
- Bài học rút ra: Các thông tin định lượng (tần suất sử dụng, giới hạn kích thước file, thời gian chạy/bộ nhớ) do AI sinh ra thường chỉ mang tính chất giả định chung chung. Nhóm học được cách chủ động rà soát, đối chiếu kỹ lưỡng giữa tài liệu nghiệp vụ thực tế và tài liệu kỹ thuật để chuẩn hóa lại các con số này, đảm bảo tính khả thi khi phát triển hệ thống.
```

---

### Lần sử dụng AI số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng |  |
| Công cụ AI | ChatGPT / Gemini / Claude / GitHub Copilot / Cursor / Antigravity / Khác |
| Mục đích sử dụng |  |
| Phần việc liên quan | Requirement / Design / Database / Frontend / Backend / Testing / Debug / Report / Presentation / Other |
| Mức độ sử dụng | Hỗ trợ ý tưởng / Hỗ trợ một phần / Hỗ trợ nhiều / Sinh chính nội dung |

#### 4.1. Prompt đã sử dụng

```text
Dán nguyên văn prompt đã hỏi AI tại đây.
```

#### 4.2. Kết quả AI gợi ý

```text
Viết tại đây...
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Viết tại đây...
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Viết tại đây...
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
Viết tại đây...
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
