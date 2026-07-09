# Prompt Log

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Môn học | Software Development Project |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | SUMMER 2026 |
| Tên bài tập / Project | Integrated Coding Education & Competitive Programming Platform |
| Tên sinh viên / Nhóm | Nguyễn Văn Quang - Group 2 |
| MSSV / Danh sách MSSV | DE190094 |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang |
| Ngày bắt đầu | 2026-05-11 |
| Ngày cập nhật gần nhất | 2026-07-09 |

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

- [ ] ChatGPT
- [ ] Gemini
- [ ] Claude
- [x] GitHub Copilot
- [ ] Cursor
- [x] Antigravity
- [ ] Microsoft Copilot
- [ ] Perplexity
- [ ] Công cụ khác: ....................................

---

## 4. Bảng tổng hợp prompt đã sử dụng

| STT | Ngày | Công cụ AI | Mục đích | Prompt tóm tắt | Kết quả chính | Có sử dụng vào bài không? | Minh chứng |
|---:|---|---|---|---|---|---|---|
| 1 | 2026-06-10 | Antigravity | Tạo model và cấu trúc thư mục cho Problem Management | Tôi đang xây dựng phân hệ Quản lý Bài tập (Problem Management) cho một nền tảng ... | Giải pháp code chi tiết | Có | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| 2 | 2026-06-10 | Antigravity | Viết các service gọi API lấy danh sách bài tập | Dựa trên Entity Problem đã tạo, hãy viết cho tôi một `ProblemService` và `Proble... | Giải pháp code chi tiết | Có | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| 3 | 2026-06-11 | Antigravity | Thiết kế giao diện danh sách bài tập (Problem List UI) | Ở phía Frontend React (dùng Vite) và Tailwind CSS, hãy thiết kế một component hi... | Giải pháp code chi tiết | Có | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| 4 | 2026-06-11 | Antigravity | Thêm chức năng lọc và phân trang bài tập | Tiếp tục với bảng danh sách bài tập, tôi muốn thêm một bộ lọc (Filter) theo Diff... | Giải pháp code chi tiết | Có | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| 5 | 2026-06-11 | Antigravity | Xử lý state khi chuyển trang Problem List | Khi người dùng đang ở trang 3 của danh sách bài tập, sau đó họ gõ tìm kiếm một t... | Giải pháp code chi tiết | Có | Commit: `feat(problem): complete problem feature implementation` |
| 6 | 2026-06-12 | Antigravity | Hiển thị chi tiết nội dung Problem (Markdown) | Đề bài tập của tôi được lưu dưới dạng chuỗi Markdown trong database. Khi lấy về ... | Giải pháp code chi tiết | Có | Commit: `feat(problem): complete problem feature implementation` |
| 7 | 2026-06-13 | Antigravity | Tạo layout Editor cho giao diện làm bài | Hãy viết cho tôi bộ khung UI React cho giao diện làm bài (Coding Workspace). Tôi... | Giải pháp code chi tiết | Có | Commit: `feat(problem): complete problem feature implementation` |
| 8 | 2026-06-13 | Antigravity | Gắn kết giao diện Problem với API Nộp bài | Khi người dùng click nút 'Submit Code', tôi cần lấy giá trị hiện tại của Monaco ... | Giải pháp code chi tiết | Có | Commit: `feat(problem): complete problem feature implementation` |
| 9 | 2026-06-14 | Antigravity | Tạo layout tổng quan (Overview) cho Dashboard giảng viên | Tôi đang làm trang Revenue Dashboard cho vai trò Instructor. Phần đầu trang cần ... | Giải pháp code chi tiết | Có | Commit: `feat: implement instructor revenue management feature` |
| 10 | 2026-06-14 | Antigravity | Tạo các Widget Component tái sử dụng cho Revenue | Trang Dashboard của tôi ngày càng phức tạp và file bị phình to (hơn 500 dòng). H... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| 11 | 2026-06-15 | Antigravity | Thiết kế bảng hiển thị lịch sử doanh thu | Hãy viết cho tôi một bảng (Table) hiển thị Lịch sử giao dịch khóa học (Sales His... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| 12 | 2026-06-15 | Antigravity | Xử lý phân trang cho bảng Sales History | Bảng Lịch sử giao dịch của tôi có tới hàng ngàn record nên tôi phải dùng Server-... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| 13 | 2026-06-15 | Antigravity | Thiết kế modal xem chi tiết thông tin giao dịch | Khi click vào một dòng trong bảng Sales History, tôi muốn hiện lên một Modal/Dia... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-dashboard): upgrade instructor dashboard layout and modals` |
| 14 | 2026-06-15 | Antigravity | Cải thiện tính responsive của các modal | Cái modal hóa đơn bạn vừa thiết kế hiển thị rất đẹp trên Desktop. Tuy nhiên, khi... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-dashboard): upgrade instructor dashboard layout and modals` |
| 15 | 2026-06-15 | Antigravity | Thiết kế UI cho bảng Recent Registrations | Bên cạnh biểu đồ, tôi cần một Widget nhỏ ở Sidebar tên là 'Học viên mới đăng ký'... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| 16 | 2026-06-15 | Antigravity | Tạo UI cho phần theo dõi Payout History | Tôi cần thêm một giao diện lịch sử rút tiền (Payout History) cho Instructor. Hiể... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| 17 | 2026-06-15 | Antigravity | Kết nối API lấy tổng doanh thu (Gross/Net) | API backend trả về số tiền định dạng `Decimal` (ví dụ: `150000.00`). Khi hiển th... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| 18 | 2026-06-15 | Antigravity | Xử lý component Selector chọn Timeframe (7d, 30d, 6m, 12m) | Trong Dashboard, tôi có một component Dropdown để chọn khoảng thời gian phân tíc... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| 19 | 2026-06-16 | Antigravity | Tính toán logic đệm (auto-padding) cho giảng viên mới | Khi một giảng viên mới tạo tài khoản, họ chưa có dữ liệu giao dịch ở các tháng t... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| 20 | 2026-06-16 | Antigravity | Tính toán tạo độ điểm ảnh (mapping points) cho SVG chart | Tôi muốn tự code một biểu đồ đường (Line Chart) đơn giản bằng thẻ `<svg>` trong ... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| 21 | 2026-06-16 | Antigravity | Vẽ biểu đồ Monthly Chart bằng SVG không dùng thư viện ngoài | Tiếp nối tọa độ SVG ở trên, hãy hoàn thiện component RevenueChart. Dùng thẻ `<pa... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| 22 | 2026-06-16 | Antigravity | Xử lý fallback data khi không có doanh thu | Trong biểu đồ SVG, nếu doanh thu cả 7 ngày đều bằng 0, thuật toán chia tọa độ Y ... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| 23 | 2026-06-16 | Antigravity | Hiển thị Course Breakdown (tỉ lệ bán khóa học) | Hãy viết cho tôi giao diện thẻ Thống kê tỷ trọng doanh thu (Course Breakdown). T... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| 24 | 2026-06-16 | Antigravity | Viết hàm vẽ biểu đồ Registration Trend (Line chart) | Viết hàm phụ trợ tính toán biểu đồ lượng đăng ký (Registration Trend). Dữ liệu A... | Giải pháp code chi tiết | Có | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| 25 | 2026-06-17 | Antigravity | Thiết kế giao diện Admin Financial Stats | Tôi đang xây dựng Admin Dashboard tổng quản lý nền tảng. Hãy thiết kế layout bao... | Giải pháp code chi tiết | Có | Commit: `feat(admin): integrate database statistics into admin dashboard` |
| 26 | 2026-06-17 | Antigravity | Lấy số liệu tổng quan hệ thống từ DB | Trong Spring Boot, làm sao để truy vấn nhanh Tổng doanh thu của toàn hệ thống? B... | Giải pháp code chi tiết | Có | Commit: `feat(admin): integrate database statistics into admin dashboard` |
| 27 | 2026-06-17 | Antigravity | Thiết kế bảng hiển thị khóa học bán chạy (Top courses) | Hãy thiết kế cho tôi một bảng xếp hạng (Leaderboard Table) 'Top khóa học mang lạ... | Giải pháp code chi tiết | Có | Commit: `feat(admin): integrate database dynamic queries for financial stats page` |
| 28 | 2026-06-18 | Antigravity | Truy vấn động (Dynamic Query) tính doanh thu Admin | Admin của tôi yêu cầu tính năng lọc theo Ngày bắt đầu và Ngày kết thúc. Bảng `Tr... | Giải pháp code chi tiết | Có | Commit: `feat(admin): integrate database dynamic queries for financial stats page` |
| 29 | 2026-06-18 | Antigravity | Xử lý ngày tháng định dạng cho Admin Dashboard | API Spring Boot trả thời gian `createdAt` dạng chuỗi ISO (vd: `2026-06-15T14:30:... | Giải pháp code chi tiết | Có | Commit: `feat(admin-financial): connect financial statistics dashboard to real database data and optimize query performance` |
| 30 | 2026-06-19 | Antigravity | Hiển thị biểu đồ lợi nhuận Admin | Đối với Admin, tôi cần vẽ một biểu đồ cột (Bar Chart) dạng phân tầng (Stacked). ... | Giải pháp code chi tiết | Có | Commit: `feat(admin-financial): connect financial statistics dashboard to real database data and optimize query performance` |
| 31 | 2026-06-19 | Antigravity | Phát hiện nguyên nhân trang Admin bị chậm | Trang Admin Financial Stats của tôi mất tới 6 giây để load. API `/api/admin/fina... | Giải pháp code chi tiết | Có | Commit: `perf(admin-dashboard): optimize financial stats fetching by splitting APIs and utilizing parallel requests with Promise.all` |
| 32 | 2026-06-20 | Antigravity | Tái cấu trúc API nguyên khối (monolithic) thành Micro-endpoints | Theo phương án tách API bạn gợi ý, hãy phác thảo cấu trúc RESTful API chuẩn cho ... | Giải pháp code chi tiết | Có | Commit: `refactor(admin-finance): split monolithic financial API into micro-endpoints for monthly records and top courses` |
| 33 | 2026-06-20 | Antigravity | Viết Promise.all để fetch API song song | Bây giờ tôi đã có 3 API rời rạc. Phía Frontend React, tôi nên gọi 3 API này bằng... | Giải pháp code chi tiết | Có | Commit: `perf(admin-dashboard): optimize financial stats fetching by splitting APIs and utilizing parallel requests with Promise.all` |
| 34 | 2026-06-20 | Antigravity | Xử lý lỗi (error handling) khi 1 trong các Promise bị fail | Nếu tôi dùng `Promise.all` và API lấy 'Tổng quan' bị lỗi (HTTP 500), nhưng API l... | Giải pháp code chi tiết | Có | Commit: `perf(admin-dashboard): optimize financial stats fetching by splitting APIs and utilizing parallel requests with Promise.all` |
| 35 | 2026-06-21 | Antigravity | Tối ưu hóa các file imports rác ở Dashboard components | Sau khi refactor logic trang Admin, file `AdminDashboard.tsx` của tôi còn sót lạ... | Giải pháp code chi tiết | Có | Commit: `chore(admin-dashboard): update dashboard components` |
| 36 | 2026-06-22 | Antigravity | Xây dựng UI thêm Testcase (Testcase Builder) cho Admin | Admin cần tính năng tạo Testcase cho Bài tập lập trình (Problem). Hãy viết giao ... | Giải pháp code chi tiết | Có | Commit: `feat(admin-problems): implement database integration, testcase builder, and UI polish` |
| 37 | 2026-06-23 | Antigravity | Tích hợp Testcase array vào Form Submit | Khi bấm Lưu Bài Tập, payload gửi đi là một Object chứa thông tin bài (Title, Des... | Giải pháp code chi tiết | Có | Commit: `feat(admin-problems): implement database integration, testcase builder, and UI polish` |
| 38 | 2026-06-23 | Antigravity | Cập nhật Form Validation cho trường tiêu đề và nội dung | Người dùng (Admin) đôi khi lưu Problem mà quên nhập Title hoặc Description. Hãy ... | Giải pháp code chi tiết | Có | Commit: `feat(admin, problem): enhance problem form validation and fix acceptance rate update` |
| 39 | 2026-06-24 | Antigravity | Bắt lỗi validation (thêm dấu sao đỏ) khi thiếu Limits/Constraints | Với các trường bắt buộc (như Title, TimeLimit), tôi muốn tự động hiển thị một dấ... | Giải pháp code chi tiết | Có | Commit: `feat(admin, problem): enhance problem form validation and fix acceptance rate update` |
| 40 | 2026-06-25 | Antigravity | Fix lỗi Acceptance Rate không update sau khi nộp bài | Khi học sinh nộp bài (Submit Code) thành công và được 100 điểm, tỷ lệ giải bài t... | Giải pháp code chi tiết | Có | Commit: `feat(admin, problem): enhance problem form validation and fix acceptance rate update` |
| 41 | 2026-06-25 | Antigravity | Sửa lỗi side-effects làm đổi problem scope thành public | Tôi gặp một lỗi bug rất nghiêm trọng: Khi Admin mở chức năng Cập nhật Bài tập đa... | Giải pháp code chi tiết | Có | Commit: `fix(admin-problem): stop auto-changing problem scope/visibility to public when adding testcases` |
| 42 | 2026-06-25 | Antigravity | Viết chức năng Xóa (Delete) Problem an toàn | Tôi muốn viết chức năng Xóa Bài tập cho Admin. Nhưng bài tập này đã có nhiều học... | Giải pháp code chi tiết | Có | Commit: `Fix delete problem function, resign Admin Problem UI` |
| 43 | 2026-06-25 | Antigravity | Tạo cấu trúc Entities cho Problem Versioning (phiên bản bài tập) | Nếu Admin sửa nội dung hoặc testcase của bài tập trong khi học sinh đang làm dở,... | Giải pháp code chi tiết | Có | Commit: `feat(problem): implement Problem Versioning entities` |
| 44 | 2026-06-25 | Antigravity | Đồng bộ giao diện Instructor FE và Problem UI | Trang Dashboard Instructor và trang Quản trị Bài tập (Problem UI) đang có 2 than... | Giải pháp code chi tiết | Có | Commit: `Update Instructor FE` |

---

## 5. Prompt chi tiết

> Sinh viên/nhóm có thể nhân bản mẫu “Prompt số...” nhiều lần tùy số lượng prompt thực tế đã sử dụng.

---

### Prompt số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-10 |
| Công cụ AI | Antigravity |
| Mục đích | Tạo model và cấu trúc thư mục cho Problem Management |
| Phần việc liên quan | Backend / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Tôi đang xây dựng phân hệ Quản lý Bài tập (Problem Management) cho một nền tảng thi đấu lập trình (Online Judge). Ở phía backend sử dụng Spring Boot 3 và Hibernate. Hãy giúp tôi thiết kế cấu trúc thư mục chuẩn (Controller, Service, Repository, Entity, DTO) và tạo class Entity `Problem` chứa các trường cơ bản như title, description, timeLimit, memoryLimit, difficulty, và acceptanceRate. Vui lòng sử dụng các annotation của Lombok để tối ưu code.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tạo model và cấu trúc thư mục cho Problem Management', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

Antigravity đã cung cấp cấu trúc package theo mô hình MVC (Controller-Service-Repository) và cung cấp file Java `Problem.java` với đầy đủ các annotation `@Entity`, `@Table`, `@Data`, `@NoArgsConstructor`, `@AllArgsConstructor` của Lombok.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã dùng đoạn mã sinh ra để khởi tạo cấu trúc thư mục cho module Problem và dán trực tiếp entity vào dự án để hibernate tự động generate table.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tự bổ sung thêm các trường liên quan đến Audit (createdBy, updatedBy, createdAt, updatedAt) sử dụng `@EntityListeners(AuditingEntityListener.class)` để theo dõi lịch sử chỉnh sửa bài tập theo chuẩn của hệ thống.

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
| Link commit | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-10 |
| Công cụ AI | Antigravity |
| Mục đích | Viết các service gọi API lấy danh sách bài tập |
| Phần việc liên quan | Backend / API |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Dựa trên Entity Problem đã tạo, hãy viết cho tôi một `ProblemService` và `ProblemController` trong Spring Boot. Tôi cần một API GET `/api/v1/problems` hỗ trợ phân trang (Pagination) sử dụng `Pageable` của Spring Data JPA. Trả về kết quả dưới dạng `Page<ProblemDTO>` để che giấu các thông tin không cần thiết.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Viết các service gọi API lấy danh sách bài tập', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI đã sinh code cho interface `ProblemRepository` kế thừa `JpaRepository`, class `ProblemService` với hàm `getAllProblems(Pageable pageable)` sử dụng mapper để chuyển từ Entity sang DTO, và REST Controller xử lý HTTP GET mapping.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng toàn bộ logic phân trang `Pageable` và cấu trúc chuyển đổi DTO do AI cung cấp. Logic này hoạt động ngay trong lần chạy đầu tiên.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tích hợp thêm một lớp `ApiResponse<T>` chung của dự án để bọc kết quả trả về, đảm bảo frontend luôn nhận được format `{status, message, data}` đồng nhất.

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
| Link commit | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-11 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế giao diện danh sách bài tập (Problem List UI) |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Ở phía Frontend React (dùng Vite) và Tailwind CSS, hãy thiết kế một component hiển thị danh sách bài tập dưới dạng Table. Bảng này cần có các cột: Status (icon checkmark nếu đã giải), Title, Acceptance Rate, và Difficulty (Easy màu xanh, Medium màu vàng, Hard màu đỏ). Thiết kế mang phong cách hiện đại giống Leetcode, có hover effect ở từng hàng.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Thiết kế giao diện danh sách bài tập (Problem List UI)', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

Antigravity đã viết một component React sử dụng thẻ `<table>` với class Tailwind như `w-full text-left border-collapse`. Cung cấp hàm helper `getDifficultyColor()` để render thẻ tag màu sắc linh hoạt dựa vào độ khó.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã dùng cấu trúc bảng và các class Tailwind CSS (hiệu ứng hover: `hover:bg-gray-100 dark:hover:bg-gray-800`) cho màn hình Problem List.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thay vì dùng dữ liệu tĩnh do AI sinh ra, tôi đã kết nối component này với Redux Toolkit Query để tự động fetch danh sách bài tập thực tế từ backend.

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
| Link commit | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-11 |
| Công cụ AI | Antigravity |
| Mục đích | Thêm chức năng lọc và phân trang bài tập |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Tiếp tục với bảng danh sách bài tập, tôi muốn thêm một bộ lọc (Filter) theo Difficulty (Dropdown chọn All, Easy, Medium, Hard) và một thanh tìm kiếm theo tên bài tập. Ngoài ra, hãy viết logic xử lý chuyển trang (Pagination) ở dưới cùng của bảng. Tôi nên quản lý state của filters và page như thế nào trong React để khi URL thay đổi (có query param) thì dữ liệu tự update?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Thêm chức năng lọc và phân trang bài tập', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI gợi ý sử dụng custom hook `useSearchParams` từ `react-router-dom` để lưu trạng thái page và filter trực tiếp trên URL. AI cung cấp component Pagination với các nút Prev, Next và số trang.

#### 5.4. Kết quả đã áp dụng vào bài

Áp dụng nguyên lý đồng bộ state vào URL params, giúp tính năng lọc và phân trang hoạt động ổn định và hỗ trợ user copy link chia sẻ.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tự xây dựng lại giao diện của các component Dropdown và Pagination bằng Headless UI để thân thiện với accessibility và khớp với theme chung của ứng dụng.

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
| Link commit | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-11 |
| Công cụ AI | Antigravity |
| Mục đích | Xử lý state khi chuyển trang Problem List |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Khi người dùng đang ở trang 3 của danh sách bài tập, sau đó họ gõ tìm kiếm một từ khóa vào thanh search, danh sách trả về ít hơn và không đủ 3 trang, dẫn đến bảng bị trống. Nguyên nhân của lỗi này là gì và làm sao để khắc phục triệt để bằng React Hooks?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Xử lý state khi chuyển trang Problem List', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI giải thích rằng khi thay đổi điều kiện filter/search, số lượng tổng (total pages) sẽ thay đổi. Nếu vẫn giữ nguyên `page=3` thì sẽ bị out of bound. Cách xử lý là cần dùng `useEffect` hoặc event handler của thanh search để tự động reset `page` về 1 mỗi khi từ khóa tìm kiếm hoặc filter thay đổi.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng lời giải thích của AI để hiểu rõ lifecycle của state khi fetch dữ liệu phụ thuộc lẫn nhau.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi viết một hàm `handleSearchChange(keyword)` để cập nhật cả URL query param `search` và đồng thời đè `page=1` vào một lần `setSearchParams` duy nhất để tránh re-render nhiều lần.

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
| Link commit | Commit: `feat(problem): complete problem feature implementation` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-12 |
| Công cụ AI | Antigravity |
| Mục đích | Hiển thị chi tiết nội dung Problem (Markdown) |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Đề bài tập của tôi được lưu dưới dạng chuỗi Markdown trong database. Khi lấy về Frontend, tôi muốn hiển thị nó thành HTML định dạng đẹp (có in đậm, danh sách, khối code, công thức toán học). Hãy gợi ý thư viện React nào phù hợp nhất để render Markdown an toàn, tránh lỗi XSS và có thể highlight syntax cho các khối code.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Hiển thị chi tiết nội dung Problem (Markdown)', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI gợi ý sử dụng thư viện `react-markdown` kết hợp với plugin `remark-gfm` (cho table, strikethrough) và `rehype-raw` (cho HTML nhúng). Để highlight code, AI đề xuất dùng `react-syntax-highlighter` bọc bên trong custom component cho thẻ `<code>` của react-markdown.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi cài đặt các thư viện AI gợi ý và sử dụng đúng cấu trúc custom render component cho thẻ `code` để có syntax highlighting giống hệt phong cách Github.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tự bọc thẻ render Markdown này vào trong một component `DomPurify` để tăng cường thêm một lớp bảo vệ XSS chặn các script độc hại nhúng ngầm.

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
| Link commit | Commit: `feat(problem): complete problem feature implementation` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-13 |
| Công cụ AI | Antigravity |
| Mục đích | Tạo layout Editor cho giao diện làm bài |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Hãy viết cho tôi bộ khung UI React cho giao diện làm bài (Coding Workspace). Tôi cần màn hình chia làm 2 phần dọc (Split View). Nửa bên trái là component hiển thị đề bài, nửa bên phải chia làm hai phần trên dưới: phía trên là Trình soạn thảo (Code Editor), phía dưới là Terminal để chạy testcase. Tôi nên dùng thư viện nào để có thanh kéo thả chia màn hình?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tạo layout Editor cho giao diện làm bài', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI gợi ý dùng thư viện `allotment` hoặc `react-split-pane` để tạo split view kéo thả được. AI cung cấp code mẫu cấu trúc Flexbox và CSS Grid để dàn trang sao cho editor luôn chiếm phần lớn màn hình và terminal ở dưới có thể thu gọn.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi sử dụng `allotment` để dựng layout kéo thả vì nó hoạt động rất mượt và hỗ trợ tốt trên React 18.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi gắn thêm thư viện `@monaco-editor/react` vào phần code editor thay cho textarea tĩnh, cấu hình lại các hotkey (Ctrl+S, Ctrl+Enter) để tiện dụng cho người dùng thi đấu lập trình.

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
| Link commit | Commit: `feat(problem): complete problem feature implementation` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-13 |
| Công cụ AI | Antigravity |
| Mục đích | Gắn kết giao diện Problem với API Nộp bài |
| Phần việc liên quan | Frontend / API |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Khi người dùng click nút 'Submit Code', tôi cần lấy giá trị hiện tại của Monaco Editor, kết hợp với problemId và languageId để gửi POST request đến backend. Tuy nhiên, thời gian chấm bài có thể mất từ 3-5 giây. Làm sao để quản lý trạng thái loading ở nút submit và ngăn người dùng spam click trong lúc chờ đợi?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Gắn kết giao diện Problem với API Nộp bài', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI khuyên dùng state `isSubmitting` đặt thành true ngay khi click và disabled nút button. AI cũng cung cấp đoạn code gọi fetch API bọc trong khối `try...catch` và đảm bảo đưa `setIsSubmitting(false)` vào khối `finally` để nút luôn được mở lại dù request thành công hay lỗi.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi áp dụng cấu trúc try/catch/finally vào tất cả các lời gọi API tương tác mạnh trong ứng dụng, giúp trạng thái nút bấm trở nên đáng tin cậy.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi thêm vào thư viện `react-toastify` để hiện thông báo (toast) khi quá trình nộp bài bị lỗi do rớt mạng trước khi tới được server.

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
| Link commit | Commit: `feat(problem): complete problem feature implementation` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-14 |
| Công cụ AI | Antigravity |
| Mục đích | Tạo layout tổng quan (Overview) cho Dashboard giảng viên |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Tôi đang làm trang Revenue Dashboard cho vai trò Instructor. Phần đầu trang cần hiển thị 4 thẻ thống kê (Stats Cards): Total Revenue, Sales This Month, Total Enrollments, Active Courses. Hãy dùng Tailwind CSS thiết kế các thẻ này sao cho có icon bên trái, số liệu lớn bên phải, và một dòng chữ nhỏ màu xanh lục/đỏ ở dưới mô tả phần trăm tăng giảm so với tháng trước.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tạo layout tổng quan (Overview) cho Dashboard giảng viên', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

Antigravity cung cấp code React component `StatCard`. Sử dụng CSS Flexbox, màu sắc Tailwind như `text-green-500` cho số dương (tăng trưởng) và icon từ thư viện Lucide React.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng toàn bộ layout HTML/Tailwind của thẻ StatCard để thiết kế cho Dashboard vì nó rất tinh tế và tối giản.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tự đóng gói lại `StatCard` thành một component nhận props động thay vì hardcode, giúp tái sử dụng nó ở cả Admin Dashboard sau này.

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
| Link commit | Commit: `feat: implement instructor revenue management feature` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-14 |
| Công cụ AI | Antigravity |
| Mục đích | Tạo các Widget Component tái sử dụng cho Revenue |
| Phần việc liên quan | Frontend / Architecture |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Trang Dashboard của tôi ngày càng phức tạp và file bị phình to (hơn 500 dòng). Hãy đề xuất một cấu trúc phân tách file Component hợp lý cho một trang Dashboard có chứa Chart, Stats, History Table và Sidebar. Làm sao để truyền dữ liệu hiệu quả giữa chúng mà không bị prop-drilling quá sâu?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tạo các Widget Component tái sử dụng cho Revenue', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI gợi ý tách thành thư mục `components/dashboard/` với các file `OverviewStats.tsx`, `RevenueChart.tsx`, `RecentTransactions.tsx`. Gợi ý dùng Redux Toolkit Query để các component con tự lấy data từ cache chung mà không cần truyền props từ component cha xuống.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã tách trang lớn thành các component Widget nhỏ độc lập theo đúng thư mục AI gợi ý.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tự tạo thêm một Custom Hook `useRevenueData(timeframe)` để tập trung logic tính toán tiền tệ và xử lý loading, sau đó mới cấp data cho các component con render.

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
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế bảng hiển thị lịch sử doanh thu |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Hãy viết cho tôi một bảng (Table) hiển thị Lịch sử giao dịch khóa học (Sales History). Bảng gồm các cột: Transaction ID, Course Name, Buyer, Date, Amount, và Status (Completed/Pending). Sử dụng màu nền sọc (striped) và header cố định (sticky header) bằng Tailwind CSS.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Thiết kế bảng hiển thị lịch sử doanh thu', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI cung cấp thẻ `table` với class `table-auto w-full`. Để làm sticky header, AI dùng class `sticky top-0 bg-white shadow-sm`. Gợi ý component `StatusBadge` để hiển thị màu sắc dựa trên trạng thái.

#### 5.4. Kết quả đã áp dụng vào bài

Cấu trúc bảng Tailwind và class Sticky Header được dùng nguyên vẹn, giải quyết vấn đề cuộn trang mà mất tiêu đề cột.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đổi màu sắc thẻ Badge trạng thái sao cho đồng bộ với Design System của project, và sửa lỗi hiển thị vỡ layout ở thiết bị di động bằng thẻ bọc `overflow-x-auto`.

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
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích | Xử lý phân trang cho bảng Sales History |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Bảng Lịch sử giao dịch của tôi có tới hàng ngàn record nên tôi phải dùng Server-side pagination. Tôi đã lấy được các tham số `totalPages`, `currentPage` từ API backend. Hãy viết cho tôi một component phân trang hiển thị dạng: [1] [2] ... [7] [8] [9] ... [20]. Logic tính toán hiển thị các số này bằng Javascript như thế nào cho tối ưu?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Xử lý phân trang cho bảng Sales History', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI cung cấp một hàm `generatePagination(currentPage, totalPages)` bằng JavaScript. Hàm này tính toán các khoảng cách và dùng ký tự `'...'` để thay thế cho những đoạn số quá dài, giúp giới hạn số lượng nút bấm luôn ở khoảng 5-7 nút.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi sao chép và sử dụng hàm thuật toán phân trang `generatePagination` này. Nó chạy cực kỳ chính xác.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi bọc hàm này vào `useMemo` trong React để tránh việc phải tính toán lại mảng số trang mỗi khi người dùng hover chuột làm re-render component.

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
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế modal xem chi tiết thông tin giao dịch |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Khi click vào một dòng trong bảng Sales History, tôi muốn hiện lên một Modal/Dialog hiển thị chi tiết hóa đơn (Invoice). Hóa đơn cần có logo hệ thống, thông tin người mua, chi tiết số tiền (Gross, Tax, Net earnings). Viết layout này bằng Tailwind CSS sao cho giống một hóa đơn thực tế in ra được.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Thiết kế modal xem chi tiết thông tin giao dịch', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI gợi ý layout dạng thẻ giấy trắng, dùng font chữ monospace cho số tiền, và hiển thị bảng chi tiết có đường kẻ gạch ngang. AI cũng đưa code tạo Modal bọc ngoài có lớp overlay đen mờ (bg-black/50) và nút X để đóng.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng giao diện hóa đơn tĩnh này làm nền tảng cho phần Receipt details của hệ thống.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi thêm tính năng 'In hóa đơn' (Print) sử dụng `window.print()` và viết thêm class CSS print-only để ẩn đi các nút bấm khi người dùng xuất file PDF hóa đơn.

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
| Link commit | Commit: `feat(instructor-dashboard): upgrade instructor dashboard layout and modals` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích | Cải thiện tính responsive của các modal |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Cái modal hóa đơn bạn vừa thiết kế hiển thị rất đẹp trên Desktop. Tuy nhiên, khi mở trên điện thoại (màn hình hẹp), nó bị tràn sang hai bên và không cuộn được. Làm thế nào để điều chỉnh các class Tailwind CSS để modal có thể responsive, chiếm 90% chiều rộng trên mobile và hiển thị thanh cuộn bên trong thay vì cuộn cả trang?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Cải thiện tính responsive của các modal', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI hướng dẫn thay thế `w-[600px]` bằng `w-[90%] max-w-lg`. Để modal có thanh cuộn trong, AI khuyên dùng `max-h-[80vh] overflow-y-auto` cho phần thân (body) của modal, trong khi giữ nguyên Header và Footer.

#### 5.4. Kết quả đã áp dụng vào bài

Thiết lập max-height và thanh cuộn y-axis được tôi áp dụng thành công cho tất cả các modal trong hệ thống.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi bọc thêm một thư viện `FocusTrap` để khi modal mở lên trên mobile, người dùng không thể vô tình tương tác với các phần tử nằm dưới nền.

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
| Link commit | Commit: `feat(instructor-dashboard): upgrade instructor dashboard layout and modals` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 15

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế UI cho bảng Recent Registrations |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Bên cạnh biểu đồ, tôi cần một Widget nhỏ ở Sidebar tên là 'Học viên mới đăng ký' (Recent Registrations). Hiển thị dưới dạng danh sách (list) gồm Avatar người dùng, Tên, Tên khóa học họ vừa mua, và thông báo thời gian tương đối (vd: 2 giờ trước). Giao diện tối giản, phân cách bằng border gạch mờ.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Thiết kế UI cho bảng Recent Registrations', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI cung cấp đoạn code dùng Flexbox (`flex items-center gap-3`) để xếp ảnh đại diện kế bên thông tin văn bản chữ nhỏ. Cung cấp một hàm `timeAgo(date)` viết bằng Javascript thuần để tính thời gian tương đối.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng hàm tính `timeAgo` và UI danh sách dọc của AI.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tích hợp avatar động bằng API của DiceBear nếu người dùng chưa có avatar thật, giúp giao diện trông sinh động và không bị lỗi hình ảnh trống.

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
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 16

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích | Tạo UI cho phần theo dõi Payout History |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Tôi cần thêm một giao diện lịch sử rút tiền (Payout History) cho Instructor. Hiển thị thông tin ngày rút, số tiền rút, ngân hàng thụ hưởng và trạng thái (Processing/Completed/Failed). Thiết kế dưới dạng các timeline card thẳng đứng dọc theo lề trái để dễ nhìn quá trình duyệt tiền.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tạo UI cho phần theo dõi Payout History', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI sinh ra mã React sử dụng Tailwind CSS tạo một đường kẻ dọc (border-l-2) và các khối tròn nhỏ (dots) để biểu diễn giao diện dạng Timeline (Dòng thời gian).

#### 5.4. Kết quả đã áp dụng vào bài

Tôi sử dụng nguyên khối UI Timeline này vì nó trực quan hơn là bảng truyền thống cho luồng tiền.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tinh chỉnh lại logic render màu sắc dot: màu xanh cho Completed, màu cam cho Processing và đỏ cho Failed, gắn liền với icon trạng thái.

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
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích | Kết nối API lấy tổng doanh thu (Gross/Net) |
| Phần việc liên quan | Frontend / API |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
API backend trả về số tiền định dạng `Decimal` (ví dụ: `150000.00`). Khi hiển thị trên UI, tôi muốn format nó thành chuỗi tiền tệ Việt Nam Đồng (VND) là `150,000 ₫`. Hàm Javascript chuẩn nhất để làm việc này mà không bị lỗi trên các trình duyệt cũ là gì?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Kết nối API lấy tổng doanh thu (Gross/Net)', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI khuyên sử dụng hàm dựng sẵn `Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number)`. Đây là API chuẩn của JavaScript, rất tối ưu và hỗ trợ mọi trình duyệt.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã thay thế toàn bộ các đoạn mã regex tự viết lằng nhằng bằng `Intl.NumberFormat` do AI đề xuất.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi viết một helper function `formatCurrency(amount)` bọc hàm của AI để gọi ở mọi nơi, và xử lý thêm trường hợp giá trị `null` hoặc `undefined` thì hiển thị `0 ₫`.

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
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích | Xử lý component Selector chọn Timeframe (7d, 30d, 6m, 12m) |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Trong Dashboard, tôi có một component Dropdown để chọn khoảng thời gian phân tích (Timeframe) gồm: 7 Ngày qua, 30 Ngày qua, 6 Tháng qua, 1 Năm qua. Hãy viết logic xử lý state `selectedTimeframe`. Mỗi khi state này đổi, tôi cần gọi lại API. Truyền tham số gì lên backend cho hợp lý?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Xử lý component Selector chọn Timeframe (7d, 30d, 6m, 12m)', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI gợi ý truyền lên 2 tham số là `startDate` và `endDate` (định dạng ISO 8601). AI cung cấp hàm `getDateRange(timeframe)` dùng đối tượng `Date` của JS để tự động lùi ngày tương ứng (ví dụ lùi 7 ngày) từ ngày hiện tại.

#### 5.4. Kết quả đã áp dụng vào bài

Logic lùi ngày và sinh tham số startDate/endDate của AI đã được tích hợp ngay lập tức.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi fix lỗi múi giờ bằng cách dùng thư viện `date-fns` thay cho `Date` thuần của JS để tính toán chính xác ngày đầu/cuối tháng (startOfMonth/endOfMonth) tránh bị lệch giờ UTC sang VN.

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
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích | Tính toán logic đệm (auto-padding) cho giảng viên mới |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Khi một giảng viên mới tạo tài khoản, họ chưa có dữ liệu giao dịch ở các tháng trước. API backend chỉ trả về mảng có 1 tháng hiện tại. Điều này làm biểu đồ tháng (6 tháng qua) của tôi bị co rúm lại còn 1 điểm. Làm sao để đệm (padding) dữ liệu các tháng rỗng bằng 0 ở Frontend trước khi vẽ biểu đồ?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tính toán logic đệm (auto-padding) cho giảng viên mới', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI khuyên nên tạo một vòng lặp lùi từ tháng hiện tại về quá khứ đủ số lượng tháng theo timeframe. Tìm xem mảng API trả về có dữ liệu tháng đó không, nếu có thì điền giá trị thật, nếu không có thì gán doanh thu = 0.

#### 5.4. Kết quả đã áp dụng vào bài

Ý tưởng đệm tháng rỗng bằng vòng lặp này là cứu tinh, giúp biểu đồ luôn hiển thị đúng trục hoành (X-axis) bất chấp backend trả thiếu ngày/tháng.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi thực hiện logic tự đệm dữ liệu 0 này ở Backend (Spring Boot) thay vì Frontend để mọi client (Web, Mobile app tương lai) đều nhận được dữ liệu chuẩn bị vẽ ngay.

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
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích | Tính toán tạo độ điểm ảnh (mapping points) cho SVG chart |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Tôi muốn tự code một biểu đồ đường (Line Chart) đơn giản bằng thẻ `<svg>` trong React, không cài thư viện ngoài để nhẹ project. Tôi có một mảng 7 phần tử chứa doanh thu 7 ngày qua. Hãy viết thuật toán tính toán tọa độ (x, y) cho thẻ `<polyline>` trong SVG. Chiều cao SVG là 200px, rộng 500px.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tính toán tạo độ điểm ảnh (mapping points) cho SVG chart', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI sinh ra mã Javascript tìm giá trị doanh thu lớn nhất (MAX). Trục Y của từng điểm = `200 - (giá trị / MAX * 200)`. Trục X được chia đều dựa trên chiều rộng 500px chia cho số điểm - 1.

#### 5.4. Kết quả đã áp dụng vào bài

Logic tính tọa độ SVG của AI rất chuẩn xác về mặt toán học. Biểu đồ đường hiện ra hoàn hảo.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi điều chỉnh padding bên trong SVG để đường kẻ không bị đụng sát trần và thêm hiệu ứng stroke-dasharray để vẽ đường cong chuyển động khi component vừa load.

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
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích | Vẽ biểu đồ Monthly Chart bằng SVG không dùng thư viện ngoài |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Tiếp nối tọa độ SVG ở trên, hãy hoàn thiện component RevenueChart. Dùng thẻ `<path>` để vẽ một vùng phủ màu gradient mờ ở dưới đường thẳng (Area Chart effect). Hiển thị các điểm giao cắt là một thẻ `<circle>` nhỏ. Khi hover vào circle đó, hiển thị một Tooltip nhỏ bằng Tailwind báo giá trị.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Vẽ biểu đồ Monthly Chart bằng SVG không dùng thư viện ngoài', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI cung cấp mã SVG cực kỳ phức tạp dùng `<linearGradient>`, thẻ `<path>` có đuôi nối xuống dưới cùng của đồ thị để đổ màu. Các điểm point dùng `<circle>` kết hợp thuộc tính `onMouseEnter/onMouseLeave` để bật tắt state tooltip.

#### 5.4. Kết quả đã áp dụng vào bài

Giao diện biểu đồ SVG tự code vô cùng nhẹ và mượt mà, áp dụng chính xác mã sinh ra từ AI.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi sửa lại vị trí absolute của Tooltip để nó không bị lệch khỏi con chuột, bằng cách lắng nghe sự kiện `onMouseMove` để gán tọa độ x/y động cho thẻ chứa tooltip.

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
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích | Xử lý fallback data khi không có doanh thu |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Trong biểu đồ SVG, nếu doanh thu cả 7 ngày đều bằng 0, thuật toán chia tọa độ Y của AI (chia cho MAX) sẽ bị chia cho 0 (`Infinity`), khiến biểu đồ biến mất hoàn toàn. Làm sao để xử lý lỗi Edge Case này một cách mượt mà?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Xử lý fallback data khi không có doanh thu', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI giải thích lỗi divide-by-zero và khuyên xử lý bằng cách kiểm tra: nếu `MAX === 0`, thì gán `MAX = 1` hoặc thiết lập tọa độ Y của tất cả các điểm luôn nằm ở sát đáy biểu đồ (height = 200).

#### 5.4. Kết quả đã áp dụng vào bài

Áp dụng cách xử lý fallback `MAX = MAX === 0 ? 100 : MAX` để chia tọa độ an toàn.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi thêm vào một thông báo UI thân thiện 'Chưa có dữ liệu giao dịch trong khoảng thời gian này' nằm đè lên biểu đồ tĩnh phẳng lì để người dùng không tưởng ứng dụng bị lỗi.

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
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích | Hiển thị Course Breakdown (tỉ lệ bán khóa học) |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Hãy viết cho tôi giao diện thẻ Thống kê tỷ trọng doanh thu (Course Breakdown). Tôi muốn hiển thị dưới dạng các thanh ngang (Horizontal Bar/Progress Bar) xếp chồng lên nhau cho từng khóa học. Khóa học có doanh thu cao nhất xếp trên cùng. Hiển thị phần trăm và số tiền ở hai đầu thanh progress.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Hiển thị Course Breakdown (tỉ lệ bán khóa học)', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI dùng thẻ `div` với cấu trúc flex-row, bên trong chứa một thanh progress có chiều dài `width` phần trăm động. Sử dụng Tailwind `bg-blue-500` và bo tròn viền.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi dùng component thanh tiến trình này để thống kê tỷ lệ mua của từng khóa học, hiển thị rõ ràng và đẹp mắt.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi viết hàm JS `Array.prototype.sort()` để sắp xếp mảng dữ liệu khóa học giảm dần theo doanh thu trước khi map ra component để đảm bảo đúng yêu cầu 'Khóa học doanh thu cao xếp trên'.

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
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích | Viết hàm vẽ biểu đồ Registration Trend (Line chart) |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Viết hàm phụ trợ tính toán biểu đồ lượng đăng ký (Registration Trend). Dữ liệu API trả về là mảng các ngày và số người đăng ký khóa học: `[{date: '2026-06-01', users: 5}, {date: '2026-06-02', users: 10}]`. Hãy tính tỷ lệ tăng trưởng so với khoảng thời gian trước đó (vd: 7 ngày trước so với 7 ngày trước đó nữa) để hiện ra con số tăng trưởng X%.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Viết hàm vẽ biểu đồ Registration Trend (Line chart)', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI viết hàm xử lý mảng, bóc tách mảng thành 2 nửa (kỳ hiện tại và kỳ trước), tính tổng số users của mỗi nửa và áp dụng công thức `(current - previous) / previous * 100`. AI cũng xử lý cẩn thận lỗi chia cho 0 nếu kỳ trước bằng 0.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng thuật toán tính toán tăng trưởng (%) của AI làm nền tảng cho mọi thẻ StatCard trên Dashboard.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi gộp thuật toán này thành một Utility function trong thư mục `src/utils/math.js` để gọi ở cả biểu đồ doanh thu và biểu đồ đăng ký.

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
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế giao diện Admin Financial Stats |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Tôi đang xây dựng Admin Dashboard tổng quản lý nền tảng. Hãy thiết kế layout bao gồm 1 Header có Breadcrumb, và phần nội dung dưới chia làm một Dashboard lưới (CSS Grid) 3 cột hiển thị các Metric: Tổng hệ thống (Tổng doanh thu toàn site, Tổng chiết khấu Admin thu được, Số lượng giao dịch). Trang trí giao diện trông trang trọng, chuẩn admin panel.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Thiết kế giao diện Admin Financial Stats', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI sinh mã React sử dụng layout `grid-cols-1 md:grid-cols-3 gap-6`. Style các thẻ metric card dùng nền trắng, viền mảnh (border), bóng mờ nhẹ (shadow-sm) cho cảm giác chuyên nghiệp (dashboard-style).

#### 5.4. Kết quả đã áp dụng vào bài

Tôi bê nguyên layout Grid và CSS styling này áp dụng cho phần Admin Financial Stats.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi chủ động điều chỉnh màu sắc sang tone xanh dương thẫm đặc trưng của Admin UI thay vì màu sáng như giao diện học viên.

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
| Link commit | Commit: `feat(admin): integrate database statistics into admin dashboard` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | Antigravity |
| Mục đích | Lấy số liệu tổng quan hệ thống từ DB |
| Phần việc liên quan | Backend / API |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Trong Spring Boot, làm sao để truy vấn nhanh Tổng doanh thu của toàn hệ thống? Bảng `Transactions` của tôi có chứa cột `amount` và `status`. Tôi nên viết một câu lệnh JPQL trong Repository như thế nào để database tự SUM thay vì kéo toàn bộ mảng dữ liệu về Java rồi tính bằng stream()?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Lấy số liệu tổng quan hệ thống từ DB', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI giải thích việc fetch mảng lớn về Java sẽ bị tràn RAM và khuyên dùng SQL/JPQL Aggregate function: `@Query("SELECT SUM(t.amount) FROM Transaction t WHERE t.status = 'COMPLETED'")` trả về kiểu `BigDecimal`.

#### 5.4. Kết quả đã áp dụng vào bài

Hiểu được bản chất tiết kiệm bộ nhớ, tôi lập tức áp dụng truy vấn SUM() cho mọi con số thống kê ở Backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi thêm tham số thời gian `startDate`, `endDate` vào truy vấn JPQL để hệ thống hỗ trợ việc lọc doanh thu theo quý/năm từ màn hình lọc của Admin.

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
| Link commit | Commit: `feat(admin): integrate database statistics into admin dashboard` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế bảng hiển thị khóa học bán chạy (Top courses) |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Hãy thiết kế cho tôi một bảng xếp hạng (Leaderboard Table) 'Top khóa học mang lại doanh thu cao nhất' dành cho Admin. Bảng có các cột: Xếp hạng (1, 2, 3), Tên khóa, Tên Giảng viên, Số lượng bán, Doanh thu. Ba vị trí đầu tiên (Hạng 1-3) hãy đổi màu nền của hàng thành màu vàng/bạc/đồng nhạt để làm nổi bật.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Thiết kế bảng hiển thị khóa học bán chạy (Top courses)', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI viết cấu trúc thẻ `table`. Trong vòng lặp `map()`, AI dùng biểu thức điều kiện kiểm tra index: `index === 0 ? 'bg-yellow-50' : index === 1 ? 'bg-gray-50' : ...` để highlight top 3.

#### 5.4. Kết quả đã áp dụng vào bài

Bảng hiển thị Top Courses hoạt động tốt với giao diện xếp hạng màu sắc bắt mắt.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tích hợp thêm icon vương miện (Lucide React) vào cột Xếp hạng đối với vị trí Top 1 thay vì chỉ dùng màu nền.

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
| Link commit | Commit: `feat(admin): integrate database dynamic queries for financial stats page` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-18 |
| Công cụ AI | Antigravity |
| Mục đích | Truy vấn động (Dynamic Query) tính doanh thu Admin |
| Phần việc liên quan | Backend / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Admin của tôi yêu cầu tính năng lọc theo Ngày bắt đầu và Ngày kết thúc. Bảng `Transaction` có trường `createdAt`. Tuy nhiên, các tham số này có thể null (tức là lọc tất cả mọi thời đại). Trong Spring Data JPA, tôi phải viết câu lệnh query động (Dynamic Query) bỏ qua điều kiện ngày tháng nếu tham số bị null bằng cách nào?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Truy vấn động (Dynamic Query) tính doanh thu Admin', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI hướng dẫn sử dụng JPA Criteria API hoặc viết JPQL với mẹo: `WHERE (:startDate IS NULL OR t.createdAt >= :startDate) AND (:endDate IS NULL OR t.createdAt <= :endDate)`. AI khuyên dùng cách JPQL vì nó ngắn gọn và dễ hiểu hơn.

#### 5.4. Kết quả đã áp dụng vào bài

Áp dụng triệt để câu lệnh JPQL có mẹo `IS NULL` của AI. Xử lý thành công bài toán query động không cần viết Criteria rườm rà.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi chuyển kiểu dữ liệu `startDate` và `endDate` từ `String` sang `LocalDateTime` (bắt đầu ngày và kết thúc ngày) ở Service layer trước khi ném vào Repository để so sánh thời gian chính xác tới từng mili-giây.

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
| Link commit | Commit: `feat(admin): integrate database dynamic queries for financial stats page` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-18 |
| Công cụ AI | Antigravity |
| Mục đích | Xử lý ngày tháng định dạng cho Admin Dashboard |
| Phần việc liên quan | Backend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
API Spring Boot trả thời gian `createdAt` dạng chuỗi ISO (vd: `2026-06-15T14:30:00.000Z`). Ở Frontend React, tôi muốn hiển thị ngày theo format thân thiện của Việt Nam là `14:30 - 15/06/2026`. Hãy hướng dẫn tôi cách convert bằng thư viện `date-fns`.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Xử lý ngày tháng định dạng cho Admin Dashboard', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI chỉ ra cách dùng hàm `format(parseISO(dateString), 'HH:mm - dd/MM/yyyy')` từ thư viện `date-fns` cực kỳ gọn nhẹ.

#### 5.4. Kết quả đã áp dụng vào bài

Logic format ngày tháng này chuẩn xác và không bị lỗi sai múi giờ như hàm Date thuần.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tạo một Utility file `formatDate.js` để wrapper toàn bộ các kiểu hiển thị thời gian trong dự án (Full DateTime, Only Date, Time Ago) nhằm đồng bộ giao diện.

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
| Link commit | Commit: `feat(admin-financial): connect financial statistics dashboard to real database data and optimize query performance` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 30

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-19 |
| Công cụ AI | Antigravity |
| Mục đích | Hiển thị biểu đồ lợi nhuận Admin |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Đối với Admin, tôi cần vẽ một biểu đồ cột (Bar Chart) dạng phân tầng (Stacked). Cột hiển thị theo tháng (T1, T2.. T12). Mỗi cột chia làm 2 phần màu chồng lên nhau: Phần xanh dương là Tiền trả giảng viên (Payouts), Phần xanh lá là Lợi nhuận giữ lại (Platform Profit). Tổng chiều cao cột là Gross Revenue. Hãy viết cấu trúc biểu đồ này bằng SVG tĩnh giúp tôi.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Hiển thị biểu đồ lợi nhuận Admin', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI sinh ra hệ tọa độ cho SVG. Ở phần thân của trục toạ độ, AI dùng vòng lặp để vẽ hai thẻ `<rect>` chồng lên nhau. Thẻ rect thứ nhất vẽ phần Payouts, thẻ thứ hai dịch chuyển (offset y) lên trên để vẽ tiếp phần Lợi nhuận, tạo thành Stacked Bar chart.

#### 5.4. Kết quả đã áp dụng vào bài

Biểu đồ cột xếp chồng bằng SVG sinh ra xuất sắc, logic tính toán height và Y-offset không hề sai lệch.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tối ưu thuộc tính `width` của cột để nó tự động co giãn to nhỏ (responsive) dựa theo chiều rộng màn hình thiết bị, thay vì fix cứng.

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
| Link commit | Commit: `feat(admin-financial): connect financial statistics dashboard to real database data and optimize query performance` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 31

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-19 |
| Công cụ AI | Antigravity |
| Mục đích | Phát hiện nguyên nhân trang Admin bị chậm |
| Phần việc liên quan | Performance |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Trang Admin Financial Stats của tôi mất tới 6 giây để load. API `/api/admin/financial-dashboard` hiện đang truy vấn tổng doanh thu, lợi nhuận, danh sách 100 khóa học top, và mảng doanh thu 12 tháng qua trong cùng một hàm. Làm sao để tối ưu hóa thời gian tải trang theo kiến trúc frontend/backend hiện đại?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Phát hiện nguyên nhân trang Admin bị chậm', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI phân tích rằng API Monolithic gộp quá nhiều logic tính toán nặng vào một endpoint làm nghẽn cổ chai (bottleneck) phía server. AI đề xuất 2 giải pháp: 1. Cache kết quả bằng Redis. 2. Tách nhỏ (Decouple) API thành các Micro-endpoints riêng rẽ (vd: `/summary`, `/top-courses`, `/monthly`) và gọi song song từ Frontend.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã nhận ra sai lầm kiến trúc API nguyên khối của mình và chọn phương án 2 (Tách API) để xử lý triệt để nguyên nhân thay vì chỉ dùng Cache.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Trước khi tách, tôi dùng công cụ đo lường Spring Actuator để log thời gian chạy của từng câu query DB, phát hiện câu query phân tích tháng (Group By Month) chậm nhất.

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
| Link commit | Commit: `perf(admin-dashboard): optimize financial stats fetching by splitting APIs and utilizing parallel requests with Promise.all` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 32

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-20 |
| Công cụ AI | Antigravity |
| Mục đích | Tái cấu trúc API nguyên khối (monolithic) thành Micro-endpoints |
| Phần việc liên quan | Backend / Architecture |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Theo phương án tách API bạn gợi ý, hãy phác thảo cấu trúc RESTful API chuẩn cho tôi trên Spring Boot. Từ 1 API cũ, tôi cần tách thành 3 API. Cần đặt tên đường dẫn (URL Path) và Response DTO như thế nào cho chuẩn REST?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tái cấu trúc API nguyên khối (monolithic) thành Micro-endpoints', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI gợi ý 3 endpoint: `GET /api/v1/admin/finance/summary` (trả về cục stats), `GET /api/v1/admin/finance/monthly-chart` (trả mảng data vẽ biểu đồ), `GET /api/v1/admin/finance/top-courses` (trả mảng danh sách). Cấu trúc DTO riêng biệt cho từng endpoint.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã viết lại toàn bộ cấu trúc API của Controller admin dựa theo thiết kế chuẩn REST do AI gợi ý.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi giữ lại service tính toán cốt lõi nhưng chia nhỏ các Transaction read-only riêng biệt, giúp DB giải phóng lock nhanh hơn.

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
| Link commit | Commit: `refactor(admin-finance): split monolithic financial API into micro-endpoints for monthly records and top courses` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 33

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-20 |
| Công cụ AI | Antigravity |
| Mục đích | Viết Promise.all để fetch API song song |
| Phần việc liên quan | Frontend / Performance |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Bây giờ tôi đã có 3 API rời rạc. Phía Frontend React, tôi nên gọi 3 API này bằng 3 cái `useEffect` khác nhau hay gộp chung lại? Hãy viết cho tôi đoạn code dùng `Promise.all` kết hợp `async/await` để fetch 3 API này cùng một lúc, giảm thời gian load trang.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Viết Promise.all để fetch API song song', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI cung cấp một `useEffect` duy nhất gọi một hàm `fetchDashboardData()`. Hàm này dùng `Promise.all([fetchAPI1, fetchAPI2, fetchAPI3])`. AI giải thích rằng cách này chạy song song, thời gian load chỉ bằng API chạy chậm nhất thay vì tổng 3 API.

#### 5.4. Kết quả đã áp dụng vào bài

Đoạn mã Promise.all của AI giúp tôi giảm thời gian load Dashboard Admin từ 6 giây xuống còn khoảng 1.5 giây.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi lưu kết quả của từng API trả về vào 3 Redux State riêng biệt để component nào cần data nào thì lấy riêng rẽ thay vì gộp chung một state cục bộ.

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
| Link commit | Commit: `perf(admin-dashboard): optimize financial stats fetching by splitting APIs and utilizing parallel requests with Promise.all` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 34

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-20 |
| Công cụ AI | Antigravity |
| Mục đích | Xử lý lỗi (error handling) khi 1 trong các Promise bị fail |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Nếu tôi dùng `Promise.all` và API lấy 'Tổng quan' bị lỗi (HTTP 500), nhưng API lấy 'Biểu đồ' thành công. Theo tôi biết `Promise.all` sẽ fail toàn bộ (reject). Có cách nào cấu trúc code để nếu 1 API chết, trang web vẫn render những phần data gọi thành công, chỉ báo lỗi đúng phần bị hỏng?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Xử lý lỗi (error handling) khi 1 trong các Promise bị fail', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI đề xuất dùng `Promise.allSettled()` thay cho `Promise.all()`. Hàm này sẽ đợi tất cả các Promise chạy xong bất chấp thành công hay thất bại, sau đó duyệt qua mảng kết quả kiểm tra trạng thái (status === 'fulfilled') để lấy data, nếu 'rejected' thì gán null và báo lỗi UI một phần.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi áp dụng thành công kiến thức về `Promise.allSettled` để thiết kế cơ chế 'Phân mảnh lỗi' (Graceful Degradation) trên UI.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi cập nhật UI hiển thị một Skeleton Skeleton báo lỗi cục bộ ở riêng Widget bị crash, các Widget biểu đồ khác vẫn hiển thị bình thường phục vụ Admin.

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
| Link commit | Commit: `perf(admin-dashboard): optimize financial stats fetching by splitting APIs and utilizing parallel requests with Promise.all` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 35

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-21 |
| Công cụ AI | Antigravity |
| Mục đích | Tối ưu hóa các file imports rác ở Dashboard components |
| Phần việc liên quan | Refactor |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Sau khi refactor logic trang Admin, file `AdminDashboard.tsx` của tôi còn sót lại hàng loạt thư viện, components không còn dùng đến. Code IDE bôi vàng rất nhiều warning unused imports. Có cách nào/phím tắt nào trong VSCode hoặc công cụ tự động dọn dẹp các import thừa thãi trong dự án Vite React không?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tối ưu hóa các file imports rác ở Dashboard components', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI hướng dẫn sử dụng tính năng 'Organize Imports' (Shift+Alt+O) của VSCode hoặc cài đặt cấu hình ESLint rule `unused-imports/no-unused-imports` để ép tự động dọn dẹp mỗi khi lưu file (Save).

#### 5.4. Kết quả đã áp dụng vào bài

Thiết lập Eslint rule giúp dự án dọn dẹp được hoàn toàn các import chết, giảm dung lượng build bundle.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tích hợp pre-commit hook (Husky) để tự động chạy lệnh lint dọn rác trước khi commit code lên nhánh main.

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
| Link commit | Commit: `chore(admin-dashboard): update dashboard components` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 36

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-22 |
| Công cụ AI | Antigravity |
| Mục đích | Xây dựng UI thêm Testcase (Testcase Builder) cho Admin |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Admin cần tính năng tạo Testcase cho Bài tập lập trình (Problem). Hãy viết giao diện Form có khả năng thêm động (Dynamic Form). Người dùng có thể nhấn nút 'Thêm Testcase', một khung nhập liệu gồm (Input data dạng textarea, Output data, Nút xóa testcase này, Nút checkbox 'Là testcase ẩn') sẽ xuất hiện. Dùng React Hook Form để quản lý mảng này.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Xây dựng UI thêm Testcase (Testcase Builder) cho Admin', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI cung cấp code sử dụng `useFieldArray` của React Hook Form, tạo một mảng động cho phép `append()`, `remove()` cực kỳ tiện lợi và liên kết trực tiếp vào Form payload chính.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi dùng đoạn mã React Hook Form + useFieldArray này vì nó quá hoàn hảo để xử lý form nhiều lớp mảng lồng nhau.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi viết thêm logic CSS giới hạn chiều cao textarea tự động nở ra (auto-expand) khi Admin paste một đoạn input text quá dài.

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
| Link commit | Commit: `feat(admin-problems): implement database integration, testcase builder, and UI polish` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 37

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-23 |
| Công cụ AI | Antigravity |
| Mục đích | Tích hợp Testcase array vào Form Submit |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Khi bấm Lưu Bài Tập, payload gửi đi là một Object chứa thông tin bài (Title, Desc) và một mảng `testcases: []`. Ở phía Spring Boot backend, tôi phải nhận payload này bằng class DTO và lưu vào Database như thế nào để đảm bảo quan hệ 1-N (One Problem to Many Testcases) lưu thành công cùng lúc trong 1 Transaction?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tích hợp Testcase array vào Form Submit', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI gợi ý tạo `ProblemCreateDTO` chứa danh sách `TestcaseDTO`. Phía Backend Entity `Problem` sử dụng `@OneToMany(cascade = CascadeType.ALL)` và thêm helper method `addTestcase()` để đồng bộ hóa quan hệ 2 chiều trước khi gọi `repository.save()`.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi cài đặt Hibernate mapping và hàm đồng bộ quan hệ theo AI. Dữ liệu Testcase được lưu thành công vào bảng Testcase đồng thời trỏ đúng Problem_ID.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi thêm annotation `@Transactional` vào hàm tạo Problem để nếu lưu Testcase rớt mạng thì việc tạo Problem cũng bị Rollback, đảm bảo tính toàn vẹn dữ liệu.

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
| Link commit | Commit: `feat(admin-problems): implement database integration, testcase builder, and UI polish` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 38

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-23 |
| Công cụ AI | Antigravity |
| Mục đích | Cập nhật Form Validation cho trường tiêu đề và nội dung |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Người dùng (Admin) đôi khi lưu Problem mà quên nhập Title hoặc Description. Hãy viết schema Validation sử dụng thư viện `Zod` (kết hợp với React Hook Form) yêu cầu: Title không được bỏ trống và tối đa 100 ký tự; Description phải chứa ít nhất 50 ký tự; TimeLimit phải là số nằm trong khoảng 0.1s đến 10.0s.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Cập nhật Form Validation cho trường tiêu đề và nội dung', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI sinh mã schema Zod rất chi tiết với đầy đủ các message lỗi tiếng Việt. Cung cấp cả hàm `z.coerce.number()` để tự động ép kiểu chuỗi input sang số cho giới hạn thời gian chạy.

#### 5.4. Kết quả đã áp dụng vào bài

Việc kiểm tra dữ liệu Validation mạnh bằng Zod ngay trên client giúp trải nghiệm mượt mà, không cần chờ lỗi bắn ra từ backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tự customize lại giao diện lỗi (Error Message text) thành màu đỏ và rung nhẹ khi admin bấm submit nhưng điền thiếu dữ liệu.

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
| Link commit | Commit: `feat(admin, problem): enhance problem form validation and fix acceptance rate update` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 39

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-24 |
| Công cụ AI | Antigravity |
| Mục đích | Bắt lỗi validation (thêm dấu sao đỏ) khi thiếu Limits/Constraints |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Với các trường bắt buộc (như Title, TimeLimit), tôi muốn tự động hiển thị một dấu sao đỏ (*) kế bên Label để báo hiệu cho Admin. Viết một component `Label` bọc chung tái sử dụng được, truyền vào tham số boolean `isRequired` thì hiển thị dấu sao.
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Bắt lỗi validation (thêm dấu sao đỏ) khi thiếu Limits/Constraints', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI viết một React functional component nhận props `text` và `isRequired`. Sử dụng Tailwind để nối thêm chuỗi `<span className="text-red-500 ml-1">*</span>` nếu isRequired true.

#### 5.4. Kết quả đã áp dụng vào bài

Sử dụng component Label chung cho mọi form của Admin. Layout rất nhất quán.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi điều chỉnh thuộc tính font-weight (in đậm) cho Label để form trông đứng đắn hơn.

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
| Link commit | Commit: `feat(admin, problem): enhance problem form validation and fix acceptance rate update` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 40

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Antigravity |
| Mục đích | Fix lỗi Acceptance Rate không update sau khi nộp bài |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Khi học sinh nộp bài (Submit Code) thành công và được 100 điểm, tỷ lệ giải bài thành công (Acceptance Rate) ở trang danh sách bài tập lẽ ra phải tăng lên, nhưng nó không đổi. Nguyên nhân có phải do tôi dùng Redux Cache? Làm sao để xóa Cache cho danh sách bài tập sau khi submit bài mới?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Fix lỗi Acceptance Rate không update sau khi nộp bài', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI giải thích rằng RTK Query đang giữ cache dữ liệu cũ. Để fix, tôi cần sử dụng tính năng `Tags` (Cung cấp tag 'Problem' cho list query và Invalidate tag 'Problem' trong mutation SubmitCode).

#### 5.4. Kết quả đã áp dụng vào bài

Bổ sung cơ chế `providesTags` và `invalidatesTags` của Redux theo hướng dẫn AI. Dữ liệu trên UI được cập nhật realtime tức thì.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi cẩn thận chỉ invalidate tag của duy nhất ID bài tập vừa submit thay vì invalidate toàn bộ bảng, để giữ nguyên trải nghiệm nhanh cho các bài tập khác không liên quan.

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
| Link commit | Commit: `feat(admin, problem): enhance problem form validation and fix acceptance rate update` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 41

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Antigravity |
| Mục đích | Sửa lỗi side-effects làm đổi problem scope thành public |
| Phần việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Tôi gặp một lỗi bug rất nghiêm trọng: Khi Admin mở chức năng Cập nhật Bài tập đang bị ẩn (Scope = PRIVATE), và họ chỉ bấm 'Thêm mới một testcase', sau khi lưu, toàn bộ Bài tập đó tự động biến thành công khai (Scope = PUBLIC). Tại sao có lỗi side-effect nhảy trạng thái này trong React Hook Form?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Sửa lỗi side-effects làm đổi problem scope thành public', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI phân tích code và chỉ ra rằng biến mặc định của form defaultValues đang hardcode `scope: 'PUBLIC'`. Khi load trang edit, tôi đã không gán lại giá trị `scope` cũ lấy từ backend vào form, nên khi submit form tự động lấy giá trị mặc định ghi đè.

#### 5.4. Kết quả đã áp dụng vào bài

Cú bắt lỗi chuẩn xác của AI giải thích nguyên lý hoạt động của `reset()` trong React Hook Form. Tôi lập tức hiểu ra vấn đề.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi sửa mã bằng cách đảm bảo gọi hàm `reset(backendData)` bên trong một `useEffect` ngay sau khi tải xong thông tin bài tập hiện tại từ server.

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
| Link commit | Commit: `fix(admin-problem): stop auto-changing problem scope/visibility to public when adding testcases` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 42

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Antigravity |
| Mục đích | Viết chức năng Xóa (Delete) Problem an toàn |
| Phần việc liên quan | Backend / API |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Tôi muốn viết chức năng Xóa Bài tập cho Admin. Nhưng bài tập này đã có nhiều học sinh nộp code (Submissions). Nếu dùng `repository.deleteById()`, SQL sẽ bắn lỗi ràng buộc khóa ngoại (Foreign Key Constraint Violation). Làm sao xóa an toàn hoặc dùng cơ chế Soft Delete trong Spring Boot/JPA?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Viết chức năng Xóa (Delete) Problem an toàn', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI gợi ý 2 cách: Cấu hình Cascade Delete để xóa sạch mọi bài nộp (không khuyến khích), hoặc thực hiện Soft Delete (Xóa mềm) bằng cách thêm cột `isDeleted`, dùng annotation `@SQLDelete` và `@Where` của Hibernate.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi chọn cách Soft Delete do AI sinh ra. Bằng cách thêm annotation `@Where(clause = "is_deleted = false")`, code toàn dự án không phải sửa gì mà bài tập bị xóa sẽ biến mất khỏi UI học sinh một cách thần kỳ.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi bổ sung thêm một Job quét rác dọn dẹp các bài tập đã Soft Delete vĩnh viễn khỏi Database sau 90 ngày (Retention Policy).

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
| Link commit | Commit: `Fix delete problem function, resign Admin Problem UI` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 43

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Antigravity |
| Mục đích | Tạo cấu trúc Entities cho Problem Versioning (phiên bản bài tập) |
| Phần việc liên quan | Backend / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Nếu Admin sửa nội dung hoặc testcase của bài tập trong khi học sinh đang làm dở, hệ thống có thể bị sai điểm số do lệch testcase cũ/mới. Tôi muốn thiết kế tính năng 'Problem Versioning' (Quản lý phiên bản bài tập). Mỗi lần Admin lưu cập nhật, sẽ tạo ra một version mới lưu vào bảng con (Problem_Versions). Các bảng nộp bài của user sẽ liên kết trỏ tới Version cụ thể thay vì Problem gốc. Thiết kế Entity cho việc này như thế nào?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Tạo cấu trúc Entities cho Problem Versioning (phiên bản bài tập)', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI đề xuất tạo bảng trung tâm `Problem` (chỉ lưu metadata cố định), và bảng `ProblemVersion` (chứa content, testcases, version_number). Entity `Submission` sẽ tham chiếu bằng khóa ngoại `problem_version_id`. Tạo quan hệ OneToMany giữa Problem và ProblemVersion.

#### 5.4. Kết quả đã áp dụng vào bài

Mô hình dữ liệu Versioning của AI là giải pháp tuyệt vời nhất giải quyết triệt để sự xung đột đề bài khi đang thi đấu (Contest).

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tự tạo thêm một Trigger Database hoặc code Logic Service để mỗi khi lưu mới Problem, tự động copy thông tin tạo Version 1, và viết logic kiểm tra Version cao nhất làm version mặc định (Current Version).

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
| Link commit | Commit: `feat(problem): implement Problem Versioning entities` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

### Prompt số 44

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Antigravity |
| Mục đích | Đồng bộ giao diện Instructor FE và Problem UI |
| Phần việc liên quan | Frontend / UI |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Trang Dashboard Instructor và trang Quản trị Bài tập (Problem UI) đang có 2 thanh Sidebar (menu bên trái) khác biệt về style (một bên xanh, một bên xám nhạt). Tôi muốn refactor lại để hai giao diện này dùng chung một layout sidebar duy nhất nhằm đồng bộ trải nghiệm. Layout dùng chung (Shared Layout) của React Router DOM (Outlet) cấu trúc như thế nào?
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình xây dựng tính năng 'Đồng bộ giao diện Instructor FE và Problem UI', tôi gặp phải khó khăn về thiết kế cấu trúc tối ưu và xử lý logic luồng nghiệp vụ. Do đó cần AI hỗ trợ một giải pháp chuẩn mực để đảm bảo tính an toàn và khả năng bảo trì của hệ thống.

#### 5.3. Kết quả AI trả về

AI hướng dẫn tạo một file `DashboardLayout.tsx` bọc ngoài chứa Header chung và Sidebar động. Cấu hình file `router.jsx` sử dụng `children` route để mọi trang (Instructor hay Admin Problem) đều render vào `<Outlet />` bên trong Layout chung.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi triển khai thành công Shared Layout, điều này giúp loại bỏ code lặp Sidebar ở hai trang hoàn toàn.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi thiết lập biến prop `menuItems` truyền vào Layout để có thể nạp danh sách menu (icon, text) khác nhau linh hoạt tùy vào người dùng đang ở vai trò Instructor hay Admin.

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
| Link commit | Commit: `Update Instructor FE` |
| File liên quan | (Các module tương ứng với chức năng) |
| Screenshot | (Giao diện Admin/Instructor tương ứng) |
| Kết quả chạy/test | Passed |
| Link tài liệu/báo cáo | N/A |
| Ghi chú khác | N/A |

#### 5.8. Ghi chú thêm

```text
Việc cải tiến từ ý tưởng gốc của AI giúp module đáp ứng sát với business rules thực tế của nền tảng hơn.
```

---

