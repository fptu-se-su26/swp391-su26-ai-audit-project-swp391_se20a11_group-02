# Prompt Log

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Môn học | Software development project |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | Summer 2026 |
| Tên bài tập / Project | Integrated Coding Education and Competitive Programming Platform |
| Tên sinh viên / Nhóm | Nguyễn Duy Phương - Group 2 |
| MSSV / Danh sách MSSV | DE190416 |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang |
| Ngày bắt đầu | 11/05/2026 |
| Ngày cập nhật gần nhất | 09/06/2026 |

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
- [x] Cursor
- [x] Antigravity
- [ ] Microsoft Copilot
- [ ] Perplexity
- [x] Công cụ khác: NotebookLM

---

## 4. Bảng tổng hợp prompt đã sử dụng

| STT | Ngày | Công cụ AI | Mục đích | Prompt tóm tắt | Kết quả chính | Có sử dụng vào bài không? | Minh chứng |
|---:|---|---|---|---|---|---|---|
| 1 | 19/05/2026 | NotebookLM | Tái cấu trúc Use Case phân hệ Admin | Hỏi review use case admin và cách gộp các use case lock/unlock, approve/reject | Đề xuất gộp các Use Case nhỏ vào Use Case tổng để giảm tải Use Case Bloat | Có | Use Case Diagram và Bảng đặc tả SRS |
| 2 | 09/06/2026 | Antigravity | Fix điều hướng và seed DB | Tìm nguyên nhân ẩn nút Admin và tạo dữ liệu test contest | Đưa ra cách fix trong Layout.tsx và sinh file SQL seed dữ liệu mẫu | Có | Commit 6192af56 |
| 3 | 09/06/2026 | Antigravity | Thiết kế Nested Routing | Nhấp vào thanh điều hướng Admin Dashboard chỉ đổi nội dung bên phải mà giữ nguyên layout | Đề xuất giải pháp Hybrid Nested Routes (Dynamic Route lồng vào state) | Có | Commit 6192af56 |
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
| Ngày sử dụng | 19/05/2026 |
| Công cụ AI | NotebookLM |
| Mục đích | Tái cấu trúc Use Case phân hệ Admin |
| Phần việc liên quan | Requirement / Design / Report |
| Mức độ sử dụng | Hỏi review |

#### 5.1. Prompt nguyên văn

```text
xem file admin and judge use case tôi mới gửi xem nội dung có ổn chưa? Những cái trigger ví dụ như "Admin quyết định phê duyệt khóa học sau khi kiểm tra nội dung đạt tiêu chuẩn chất lượng của sàn" có phải đúng chuẩn trigger. 
Bên cạnh đó, những use case manage contest hoặc manage transactional trong main flow như vậy có đúng thực tế chưa?? Và tại sao bên trong alternative flow lại có các use case khác extend / include từ nó vậy?
 - Có nên gộp những use case như Reject Contest, Approve Contest, View Contest Statistics và thành 1 trong manage contest hay không? Nếu có thì đề xuất những cái use case cần tinh gọn.
 - Có nên Gộp lock và unlock user vào 1 use case không và có nên gộp Approve và reject vào 1 hay không?
```

#### 5.2. Bối cảnh khi viết prompt

Mô tả ngắn gọn vì sao sinh viên/nhóm cần dùng prompt này.

```text
Tài liệu Use Case mô tả phân hệ Admin ban đầu bị phình to (25 Use Case) và chứa nhiều lỗi logic cơ bản (viết trigger chứa yếu tố cảm xúc, phân mảnh các hành động Approve/Reject/Lock/Unlock thành các use case độc lập). Sinh viên cần tư vấn của AI để tinh gọn và chuẩn hóa cấu trúc Use Case theo chuẩn UML.
```

#### 5.3. Kết quả AI trả về

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
AI xác nhận trigger viết sai và đưa ra cách sửa thành hành động vật lý (ví dụ: nhấp chuột, gửi yêu cầu). Đồng thời, AI đề xuất gộp triệt để các Use Case nhỏ lẻ vào các Use Case quản lý tổng (Manage Contest, Manage Course, Manage User) để loại bỏ hiện tượng Use Case Bloat.
```

#### 5.4. Kết quả đã áp dụng vào bài

Mô tả phần nào từ kết quả AI đã được sử dụng vào bài tập/project.

```text
Tái thiết kế toàn bộ hệ thống Use Case của Admin, gộp từ 25 Use Case rời rạc thành 7 Use Case cốt lõi trong tài liệu SRS, chuyển các luồng phụ Approve, Reject, Lock, Unlock vào mô tả nghiệp vụ bên trong của các Use Case quản lý tương ứng.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với kết quả AI trả về.

```text
Vẽ lại Use Case Diagram mới trong Enterprise Architect theo sơ đồ tinh gọn, viết lại đặc tả chi tiết cho 7 Use Case cốt lõi này và kiểm tra kỹ lại ranh giới nghiệp vụ của các Actor để tránh bị trùng lặp.
```

#### 5.6. Đánh giá chất lượng prompt

Đánh dấu các nhận xét phù hợp.

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
| Link commit | https://github.com/fptu-se-su26/swp391-su26-ai-audit-project-swp391_se20a11_group-02/tree/docs/DE190416-update-audit-log |
| File liên quan | docs/SRS_Document.pdf (hoặc Use Case Diagram) |
| Screenshot | ![evidence1.png](evidences/img_evidence1.png) |
| Kết quả chạy/test | Đã được phê duyệt trong báo cáo SRS |
| Link tài liệu/báo cáo | |
| Ghi chú khác | |

#### 5.8. Ghi chú thêm

```text
Prompt đã giúp tối ưu hóa đáng kể khối lượng tài liệu và làm sơ đồ biểu diễn Use Case trở nên chuyên nghiệp hơn.
```

---

### Prompt số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 09/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích | Sửa lỗi ẩn điều hướng Admin Panel và sinh SQL seed dữ liệu cho Contest |
| Phần việc liên quan | Coding / Database / Debug |
| Mức độ sử dụng | Hỏi debug / Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
Kiểm tra lại frontend liên quan đến chức năng của contest. Tìm hiểu nguyên nhân khi tôi bấm switch to Student View thì ko có nút Admin Dashboard để trở về giao diện admin. Đọc database của tôi rồi tạo cho tôi file sql để insert fake data vào dự án để test.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Khi một tài khoản có quyền Admin chuyển sang giao diện Student View để kiểm tra góc nhìn học viên, giao diện bị thiếu nút hoặc menu để quay lại giao diện quản lý Admin. Đồng thời, cần bổ sung dữ liệu mẫu Contest vào DB PostgreSQL để kiểm thử API frontend.
```

#### 5.3. Kết quả AI trả về

```text
AI chỉ ra lỗi logic trong Layout.tsx chỉ render nút Admin nếu role === 'instructor', đề xuất sửa thành (role === 'instructor' || role === 'admin') hoặc render riêng nút Admin. AI đồng thời cung cấp tệp contest_seed.sql với các câu lệnh INSERT dữ liệu mẫu cho contest, problems, testcases, attempts.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Áp dụng code sửa đổi của Layout.tsx giúp hiển thị nút "Admin" ở header và lối tắt "Admin Panel" ở menu avatar. Sử dụng contest_seed.sql để seed dữ liệu vào DB.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Bổ sung các lệnh setval trong file SQL để cập nhật PostgreSQL serial sequence của các bảng được seed dữ liệu cứng (ID được chỉ định cụ thể), tránh lỗi duplicate key vi phạm ràng buộc khóa chính khi backend JPA lưu thực thể mới sau này. Sửa đổi ContestController.java ở backend để hỗ trợ tìm kiếm contest.
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
| Link commit | https://github.com/fptu-se-su26/swp391-su26-ai-audit-project-swp391_se20a11_group-02/commit/6192af56fa3ab0fc40dc0533d6012833edd03975 |
| File liên quan | frontend/src/components/Layout.tsx, database/contest_seed.sql |
| Screenshot | |
| Kết quả chạy/test | Nút Admin hiển thị bình thường khi chuyển giao diện, dữ liệu contest được truy vấn thành công. |
| Link tài liệu/báo cáo | |
| Ghi chú khác | |

#### 5.8. Ghi chú thêm

```text
Cần lưu ý các sequence tự tăng của cơ sở dữ liệu khi dùng AI để tạo dữ liệu seed dạng cứng.
```

---

### Prompt số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 09/06/2026 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết lập định tuyến lồng nhau cho Admin Dashboard |
| Phần việc liên quan | Coding / Design |
| Mức độ sử dụng | Hỏi sinh code / Hỏi tối ưu |

#### 5.1. Prompt nguyên văn

```text
Tốt, hãy thực thi theo Cách 2: Sử dụng Nested Routes đi
```

#### 5.2. Bối cảnh khi viết prompt

```text
Sinh viên muốn các tab trong trang AdminDashboard.tsx (contests, users, problems...) hoạt động với URL động (vd: /admin-dashboard/contests) để có thể reload trang (F5) hoặc share link trực tiếp mà không bị reset về trang mặc định. Tuy nhiên, component AdminDashboard rất lớn (>4400 dòng), việc chia nhỏ thành các component file riêng lẻ là quá rủi ro ở giai đoạn này.
```

#### 5.3. Kết quả AI trả về

```text
AI đề xuất phương án Hybrid Nested Routing: cấu hình route con động /admin-dashboard/:tab trong App.tsx, sử dụng hook useParams() để lấy tham số tab từ URL truyền vào activeTab state của AdminDashboard, và sử dụng useNavigate() khi người dùng click vào sidebar để đổi tab thông qua định tuyến thay vì thay đổi state cục bộ.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Áp dụng cấu trúc định tuyến mới vào App.tsx và cập nhật logic xử lý sidebar, chuyển đổi tab trong file AdminDashboard.tsx.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Bổ sung xử lý fallback để nếu URL chứa :tab không hợp lệ thì hệ thống tự động chuyển hướng về tab mặc định. Kiểm thử khả năng ghi nhớ tab khi F5.
```

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
| Link commit | https://github.com/fptu-se-su26/swp391-su26-ai-audit-project-swp391_se20a11_group-02/commit/6192af56fa3ab0fc40dc0533d6012833edd03975 |
| File liên quan | frontend/src/App.tsx, frontend/src/pages/AdminDashboard.tsx |
| Screenshot | |
| Kết quả chạy/test | Đã chuyển tab qua lại mượt mà, URL trình duyệt thay đổi tương ứng và giữ nguyên trạng thái khi tải lại trang. |
| Link tài liệu/báo cáo | |
| Ghi chú khác | |

#### 5.8. Ghi chú thêm

```text
Giải pháp Hybrid đã giải quyết hoàn hảo bài toán định tuyến mà không cần phân tách file lớn nguy hiểm.
```

---

## 6. Prompt quan trọng nhất

Chọn một prompt có ảnh hưởng lớn nhất đến bài tập/project.

### 6.1. Prompt được chọn

```text
Tốt, hãy thực thi theo Cách 2: Sử dụng Nested Routes đi
```

### 6.2. Vì sao prompt này quan trọng?

```text
Vì nó quyết định giải pháp kiến trúc hệ thống định tuyến (Routing) cho Admin Dashboard. Nếu đi sai hướng (như vội vàng chia nhỏ tệp lớn 4400 dòng thành các component file con) có thể phá vỡ state nội bộ phức tạp và gây lỗi compile nghiêm trọng.
```

### 6.3. Kết quả prompt này mang lại

```text
AI đề xuất giải pháp Hybrid thông minh: cấu hình Dynamic Route /admin-dashboard/:tab lồng ghép với state activeTab hiện có, giúp URL trình duyệt tự động thay đổi khi chuyển tab, hỗ trợ reload trang (F5) giữ nguyên tab mà không làm biến đổi cấu trúc tệp code gốc.
```

### 6.4. Sinh viên/nhóm đã kiểm tra kết quả như thế nào?

```text
Tải lại trang (F5) trực tiếp ở các URL tab con (/admin-dashboard/contests, /admin-dashboard/users) để xác minh UI giữ đúng trạng thái, đồng thời click nhanh giữa các tab để đảm bảo không bị loop render.
```

### 6.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

```text
Tự thiết kế thêm phần xử lý fallback tự động chuyển hướng về trang tab mặc định (ví dụ: contests) nếu tham số tab trên URL không hợp lệ hoặc bị nhập sai.
```

---

## 7. Prompt chưa hiệu quả

Ghi lại ít nhất một prompt chưa tạo ra kết quả tốt hoặc chưa phù hợp.

### 7.1. Prompt chưa hiệu quả

```text
(Đề xuất ban đầu của AI về việc tách file: AI tự đề xuất Cách 1: Tách nhỏ AdminDashboard.tsx thành các component riêng biệt cho mỗi tab rồi dùng Nested Router thông thường và cấu hình Outlet)
```

### 7.2. Vì sao prompt này chưa hiệu quả?

```text
Vì AI đưa ra gợi ý thuần lý thuyết thiết kế ("Clean Code") mà không tính đến bối cảnh thực tế rằng file AdminDashboard.tsx đang liên kết chéo rất nhiều state dùng chung phức tạp. Việc tách file ngay lập tức ở giai đoạn này sẽ tạo ra lượng lớn props truyền lồng và gây lỗi biên dịch nghiêm trọng.
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
Cần cung cấp thêm ràng buộc thực tế về file code hiện tại (kích thước lớn, sự phụ thuộc chéo của state) và yêu cầu AI đưa ra phương án thay thế có rủi ro thấp nhất (low-risk alternative).
```

### 7.4. Prompt sau khi cải tiến

```text
Ở phần giao diện của admin, nếu muốn tạo giao diện cho phần manage contest mà vẫn giữ cái layout của admindashboard thì sao? Khi mà bấm vào các thanh điều hướng thì cảm giác chỉ đổi nội dung bên phải, nhưng file hiện tại rất lớn, có cách nào làm an toàn mà vẫn thay đổi được URL trình duyệt để lưu tab không?
```

### 7.5. Kết quả sau khi cải tiến prompt

```text
AI đề xuất Cách 2 (giải pháp Hybrid): Giữ nguyên file AdminDashboard và đồng bộ URL dynamic parameter :tab với activeTab state. Cách này hoàn toàn an toàn và đáp ứng được yêu cầu đổi URL khi F5 trang.
```

---

## 8. Bài học về cách viết prompt

### 8.1. Khi viết prompt, em/nhóm cần cung cấp thông tin gì để AI trả lời tốt hơn?

```text
- Mục tiêu cần đạt rõ ràng (ví dụ: đổi tab giữ nguyên layout).
- Ràng buộc và bối cảnh hiện tại (ví dụ: tệp file có kích thước quá lớn, đang dùng PostgreSQL/JPA).
- Các rủi ro muốn tránh (ví dụ: không muốn tách file hoặc reload lại toàn bộ trang web).
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
- Không đặt câu hỏi quá rộng, cần thu hẹp phạm vi.
- Cần cung cấp các rào cản kỹ thuật thực tế để AI không đưa ra các giải pháp lý thuyết suông nhưng kém khả thi.
```

### 8.3. Lần sau em/nhóm sẽ cải thiện prompt như thế nào?

```text
- Sẽ phân tích kỹ cấu trúc file trước khi hỏi AI để cung cấp thông tin về size file và các biến dùng chung.
- Sẽ đính kèm các ràng buộc cơ sở dữ liệu (ví dụ: sequence JPA PostgreSQL) ngay khi yêu cầu tạo dữ liệu seed để tránh lỗi xung đột id.
```

---

## 9. Phân loại prompt đã sử dụng

Đánh dấu số lượng prompt theo từng nhóm.

| Loại prompt | Số lượng | Ví dụ prompt tiêu biểu |
|---|---:|---|
| Prompt phân tích yêu cầu | 1 | xem file admin and judge use case tôi mới gửi xem nội dung có ổn chưa?... |
| Prompt giải thích kiến thức | 0 | |
| Prompt thiết kế giải pháp | 1 | Tốt, hãy thực thi theo Cách 2: Sử dụng Nested Routes đi |
| Prompt thiết kế database | 1 | Đọc database của tôi rồi tạo cho tôi file sql để insert fake data vào dự án để test |
| Prompt sinh code mẫu | 0 | |
| Prompt debug lỗi | 1 | Tìm hiểu nguyên nhân khi tôi bấm switch to Student View thì ko có nút Admin Dashboard... |
| Prompt viết test case | 0 | |
| Prompt review code | 0 | |
| Prompt tối ưu code | 0 | |
| Prompt viết báo cáo | 0 | |
| Prompt chuẩn bị thuyết trình | 0 | |
| Prompt khác | 0 | |

---

## 10. Checklist chất lượng prompt

Sinh viên/nhóm tự kiểm tra chất lượng prompt đã dùng.

| Tiêu chí | Đã đạt? | Ghi chú |
|---|:---:|---|
| Prompt có mục tiêu rõ ràng | [x] | |
| Prompt có đủ bối cảnh | [x] | |
| Prompt có nêu công nghệ/ngôn ngữ sử dụng | [x] | |
| Prompt có nêu yêu cầu đầu ra | [x] | |
| Prompt không yêu cầu AI làm toàn bộ bài một cách máy móc | [x] | |
| Prompt có yêu cầu AI giải thích hoặc phân tích | [x] | |
| Kết quả AI được kiểm tra lại | [x] | |
| Kết quả AI được chỉnh sửa trước khi sử dụng | [x] | |
| Prompt quan trọng được ghi lại đầy đủ | [x] | |
| Prompt sai/chưa hiệu quả được rút kinh nghiệm | [x] | |

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
| Nguyễn Duy Phương | 09/06/2026 |
