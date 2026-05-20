# Prompt Log

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Môn học | Software Development Project |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | Summer 2026 |
| Tên bài tập / Project | Integrated Coding Education & Competitive Programming Platform |
| Tên sinh viên / Nhóm | Trịnh Hoàng Thiên Bảo - Group 2 |
| MSSV / Danh sách MSSV | DE190023 |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang |
| Ngày bắt đầu | 18/05/2026 |
| Ngày cập nhật gần nhất | 20/05/2026 |

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
- [x] Claude
- [x] GitHub Copilot
- [x] Cursor
- [x] Antigravity
- [ ] Microsoft Copilot
- [ ] Perplexity
- [ ] Công cụ khác: ....................................

---

## 4. Bảng tổng hợp prompt đã sử dụng

| STT | Ngày | Công cụ AI | Mục đích | Prompt tóm tắt | Kết quả chính | Có sử dụng vào bài không? | Minh chứng |
|---:|---|---|---|---|---|---|---|
| 1 | 2026-05-18 | Claude | Xác định & đếm số lượng Use Case Specification cho Instructor | "Chức năng Instructor... có bao nhiêu use case specification?" | Claude đề xuất danh sách 19 Use Case | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 2 | 2026-05-19 | Claude | Viết đầy đủ 19 Use Case Specification theo template chuẩn | "UC SPECIFICATION TEMPLATE... làm mỗi usecase cho tôi" | Claude xuất 19 Use Case theo template 11 trường | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 3 |  |  |  |  |  | Có / Không |  |
| 4 |  |  |  |  |  | Có / Không |  |
| 5 |  |  |  |  |  | Có / Không |  |
| 6 |  |  |  |  |  | Có / Không |  |
| 7 |  |  |  |  |  | Có / Không |  |
| 8 |  |  |  |  |  | Có / Không |  |
| 9 |  |  |  |  |  | Có / Không |  |
| 10 |  |  |  |  |  | Có / Không |  |

---

## 5. Prompt chi tiết

> Sinh viên/nhóm có thể nhân bản mẫu “Prompt số...” nhiều lần tùy số lượng prompt thực tế đã sử dụng.

---

### Prompt số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-18 |
| Công cụ AI | Claude |
| Mục đích | Xác định và đếm số lượng Use Case Specification cho chức năng Instructor |
| Phần việc liên quan | Requirement / Design |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi review |

#### 5.1. Prompt nguyên văn

```text
Chức năng dành cho Instructor (Giảng viên)
Instructor là đối tác cung cấp nội dung, có quyền khởi tạo khóa học và tổ chức các kỳ thi thuật toán:
• Tài chính & Kinh doanh: Bán khóa học, Rút tiền doanh thu.
• Quản lý khóa học: Quản lý nội dung, Upload video, Tạo quiz, Cập nhật/chỉnh sửa, Ẩn/hiện, Trả lời Q&A, Xem thống kê.
• Quản lý Contest: Tạo Contest mới, Cấu hình, Thêm bài tập, Xem thống kê và kết quả.
• Quản lý bài tập Code: Tạo đề bài, Tạo và quản lý Test Case, Cấu hình tài nguyên.
dựa vào đây có bao nhiêu use case specification?
```

#### 5.2. Bối cảnh khi viết prompt

Mô tả ngắn gọn vì sao sinh viên/nhóm cần dùng prompt này.

```text
Nhóm cần xác định số lượng và phân nhóm cụ thể các Use Case cần viết đặc tả (specification) cho vai trò Instructor để chuẩn bị tài liệu SRS và phân chia công việc trong nhóm.
```

#### 5.3. Kết quả AI trả về

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Claude gợi ý danh sách gồm 19 Use Case được chia thành 4 nhóm chính: Tài chính & Kinh doanh (2 UC), Quản lý khóa học (7 UC), Quản lý Contest (4 UC), Quản lý bài tập Code (3 UC). Đồng thời cung cấp bối cảnh và ý nghĩa của từng Use Case trong hệ thống.
```

#### 5.4. Kết quả đã áp dụng vào bài

Mô tả phần nào từ kết quả AI đã được sử dụng vào bài tập/project.

```text
Nhóm sử dụng danh sách 19 Use Case này làm nền tảng cốt lõi để phân chia công việc viết đặc tả chi tiết và làm cơ sở thiết kế sơ đồ Use Case Diagram cho hệ thống.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với kết quả AI trả về.

```text
Nhóm đã phân tích nghiệp vụ thực tế và quyết định tách UC10 (Tạo Contest) và UC11 (Cấu hình Contest) thành 2 use case riêng biệt (thay vì gộp chung). Đồng thời, nhóm bổ sung thêm UC18 (Upload file Input/Output) tách biệt khỏi UC17 (Tạo Test Case) để tối ưu việc upload test case qua file zip.
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
| File liên quan | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Prompt đã cung cấp đủ thông tin nghiệp vụ và bối cảnh các chức năng của hệ thống để AI có thể phân tích chính xác.
```

---

### Prompt số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-19 |
| Công cụ AI | Claude |
| Mục đích | Viết đầy đủ 19 Use Case Specification theo template chuẩn cho chức năng Instructor |
| Phần việc liên quan | Requirement / Design |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
UC SPECIFICATION TEMPLATE
Use Case Name / Use Case ID / Created By / Actor(s) / Preconditions / Post conditions
/ Main Flow (Basic Path) / Alternative Flow A / Alternative Flow B / Exception Flow
/ Business Rules
dựa vào đây làm mỗi usecase cho tôi, bằng tiếng việt nha
```

#### 5.2. Bối cảnh khi viết prompt

```text
Nhóm cần đặc tả chi tiết (Use Case Specification) cho toàn bộ 19 Use Case đã xác định của Instructor theo đúng định dạng mẫu 11 trường thông tin chuẩn để hoàn thiện tài liệu SRS.
```

#### 5.3. Kết quả AI trả về

```text
Claude xuất ra đầy đủ 19 bảng Use Case Specification bằng tiếng Việt theo đúng template được yêu cầu (gồm Main Flow từ 6-7 bước, Alternative Flows, Exception Flows và các Business Rules tương ứng).
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Toàn bộ cấu trúc Main Flow và phân chia mã lỗi Exception, mã hóa Business Rules (BR01, BR02...) của 19 Use Case được áp dụng trực tiếp làm khung sườn cho tài liệu đặc tả của nhóm.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Nhóm đã tinh chỉnh lại tần suất sử dụng (Frequency Of Use) cho sát thực tế, bổ sung thêm các giả định (Assumptions) về cam kết phản hồi Q&A và kiểm chứng Output, thêm cross-reference giữa UC17 và UC18, và đối chiếu các con số giới hạn (Time Limit, Memory Limit) với tài liệu kỹ thuật của hệ thống.
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
| File liên quan | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
AI sinh nội dung rất tốt và có cấu trúc rõ ràng, tuy nhiên các số liệu định lượng (như dung lượng file, time limit, memory limit) cần được người dùng rà soát lại để khớp với thực tế.
```

---

### Prompt số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng |  |
| Công cụ AI | ChatGPT / Gemini / Claude / GitHub Copilot / Cursor / Antigravity / Khác |
| Mục đích |  |
| Phần việc liên quan | Requirement / Design / Database / Coding / Testing / Debug / Report / Presentation / Other |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi giải thích / Hỏi review / Hỏi debug / Hỏi sinh code / Hỏi tối ưu |

#### 5.1. Prompt nguyên văn

```text
Dán nguyên văn prompt đã hỏi AI tại đây.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Viết tại đây...
```

#### 5.3. Kết quả AI trả về

```text
Viết tại đây...
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Viết tại đây...
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Viết tại đây...
```

#### 5.6. Đánh giá chất lượng prompt

- [ ] Prompt rõ ràng
- [ ] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [ ] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp
- [ ] Cần hỏi lại AI nhiều lần
- [ ] Cần tự kiểm tra và chỉnh sửa nhiều
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Viết tại đây...
```

---

## 6. Prompt quan trọng nhất

Chọn một prompt có ảnh hưởng lớn nhất đến bài tập/project.

### 6.1. Prompt được chọn

```text
UC SPECIFICATION TEMPLATE
Use Case Name / Use Case ID / Created By / Actor(s) / Preconditions / Post conditions
/ Main Flow (Basic Path) / Alternative Flow A / Alternative Flow B / Exception Flow
/ Business Rules
dựa vào đây làm mỗi usecase cho tôi, bằng tiếng việt nha
```

### 6.2. Vì sao prompt này quan trọng?

```text
Prompt này giúp tự động hóa và tăng tốc quá trình soạn thảo tài liệu đặc tả chi tiết cho 19 Use Case vốn tốn rất nhiều thời gian và công sức để gõ khung sườn bằng tay, đảm bảo tính nhất quán của cấu trúc tài liệu.
```

### 6.3. Kết quả prompt này mang lại

```text
Tạo ra khung sườn chi tiết và các gợi ý quy trình nghiệp vụ đầy đủ cho 19 Use Case Specification bằng tiếng Việt theo định dạng chuẩn.
```

### 6.4. Sinh viên/nhóm đã kiểm tra kết quả như thế nào?

```text
Nhóm tiến hành đọc duyệt lại toàn bộ các bước trong Main Flow để đảm bảo tính logic, rà soát lại Alternative Flow và Business Rules để kiểm tra tính khả thi kỹ thuật.
```

### 6.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

```text
Chuẩn hóa các con số định lượng cụ thể của hệ thống (dung lượng file upload, Time Limit, Memory Limit), bổ sung thêm các ràng buộc nghiệp vụ (Business Rules) thực tế và chỉnh sửa tần suất sử dụng của các tính năng.
```

---

## 7. Prompt chưa hiệu quả

Ghi lại ít nhất một prompt chưa tạo ra kết quả tốt hoặc chưa phù hợp.

### 7.1. Prompt chưa hiệu quả

```text
Không có prompt nào hoàn toàn chưa hiệu quả. Các prompt đều mang lại kết quả hữu ích làm khung sườn tham khảo tốt sau khi tinh chỉnh bối cảnh.
```

### 7.2. Vì sao prompt này chưa hiệu quả?

```text
Không áp dụng.
```

Gợi ý nguyên nhân:

- Prompt quá ngắn.
- Thiếu bối cảnh bài toán.
- Không nêu rõ yêu cầu đầu ra.
- Không cung cấp ngôn ngữ lập trình/công nghệ đang dùng.
- Không đưa lỗi cụ thể.
- Không đưa ví dụ input/output.
- Không yêu cầu AI giải thích.
- Hỏi AI làm toàn bộ thay vì hỏi từng phần.

### 7.3. Cách cải thiện prompt

```text
Không áp dụng.
```

### 7.4. Prompt sau khi cải tiến

```text
Không áp dụng.
```

### 7.5. Kết quả sau khi cải tiến prompt

```text
Không áp dụng.
```

---

## 8. Bài học về cách viết prompt

### 8.1. Khi viết prompt, em/nhóm cần cung cấp thông tin gì để AI trả lời tốt hơn?

```text
Cần cung cấp rõ ràng bối cảnh của hệ thống, các vai trò của tác nhân (actors), các quy tắc nghiệp vụ dự kiến, và đặc biệt là một template (khung mẫu) cụ thể để AI xuất ra đúng định dạng mong muốn.
```

Gợi ý:

- Mục tiêu cần đạt.
- Bối cảnh bài toán.
- Công nghệ/ngôn ngữ lập trình đang dùng.
- Input/output mong muốn.
- Ràng buộc của đề bài.
- Lỗi đang gặp.
- Format kết quả mong muốn.
- Yêu cầu AI giải thích từng bước.

### 8.2. Em/nhóm đã học được gì về cách đặt câu hỏi cho AI?

```text
Đặt câu hỏi có cấu trúc, chia nhỏ vấn đề (ví dụ: xác định danh sách Use Case trước, sau đó mới đi vào đặc tả chi tiết từng Use Case) mang lại kết quả chính xác và ít bị lỗi thiếu sót hơn so với việc yêu cầu AI làm toàn bộ cùng một lúc.
```

### 8.3. Lần sau em/nhóm sẽ cải thiện prompt như thế nào?

```text
Sẽ chuẩn bị trước các tài liệu input sạch và có cấu trúc tốt hơn, đồng thời bổ sung thêm các ví dụ minh họa (few-shot prompting) về đầu ra mong muốn để AI sinh nội dung chuẩn xác hơn nữa.
```

---

## 9. Phân loại prompt đã sử dụng

Đánh dấu số lượng prompt theo từng nhóm.

| Loại prompt | Số lượng | Ví dụ prompt tiêu biểu |
|---|---:|---|
| Prompt phân tích yêu cầu | 1 | "dựa vào đây có bao nhiêu use case specification?" |
| Prompt giải thích kiến thức |  |  |
| Prompt thiết kế giải pháp |  |  |
| Prompt thiết kế database |  |  |
| Prompt sinh code mẫu |  |  |
| Prompt debug lỗi |  |  |
| Prompt viết test case |  |  |
| Prompt review code |  |  |
| Prompt tối ưu code |  |  |
| Prompt viết báo cáo | 1 | "UC SPECIFICATION TEMPLATE... làm mỗi usecase cho tôi" |
| Prompt chuẩn bị thuyết trình |  |  |
| Prompt khác |  |  |

---

## 10. Checklist chất lượng prompt

Sinh viên/nhóm tự kiểm tra chất lượng prompt đã dùng.

| Tiêu chí | Đã đạt? | Ghi chú |
|---|:---:|---|
| Prompt có mục tiêu rõ ràng | [x] | Xác định rõ mục tiêu cần AI giải quyết. |
| Prompt có đủ bối cảnh | [x] | Cung cấp thông tin nghiệp vụ/mô tả chức năng. |
| Prompt có nêu công nghệ/ngôn ngữ sử dụng | [x] | Yêu cầu rõ tiếng Việt và cấu trúc template. |
| Prompt có nêu yêu cầu đầu ra | [x] | Định nghĩa cấu trúc template 11 trường. |
| Prompt không yêu cầu AI làm toàn bộ bài một cách máy móc | [x] | AI chỉ làm khung sườn đặc tả, nhóm tự rà soát tinh chỉnh số liệu. |
| Prompt có yêu cầu AI giải thích hoặc phân tích | [x] | AI phân tích số lượng Use Case và phân nhóm. |
| Kết quả AI được kiểm tra lại | [x] | Nhóm đã duyệt lại từng Use Case. |
| Kết quả AI được chỉnh sửa trước khi sử dụng | [x] | Tinh chỉnh số liệu thực tế, bổ sung giả định. |
| Prompt quan trọng được ghi lại đầy đủ | [x] | Được lưu vết trong tài liệu này. |
| Prompt sai/chưa hiệu quả được rút kinh nghiệm | [x] | Được rút kinh nghiệm trong quá trình sử dụng. |

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
| Trịnh Hoàng Thiên Bảo | 20/05/2026 |
