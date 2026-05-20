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
- [ ] Antigravity
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
| File liên quan | database/schema.sql |
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
