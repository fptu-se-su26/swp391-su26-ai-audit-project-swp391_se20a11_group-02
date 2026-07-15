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
- [x] Microsoft Copilot
- [x] Perplexity
- [ ] Công cụ khác: ....................................

---

## 4. Bảng tổng hợp prompt đã sử dụng

| STT | Ngày | Công cụ AI | Mục đích | Prompt tóm tắt | Kết quả chính | Có sử dụng vào bài không? | Minh chứng |
|---:|---|---|---|---|---|---|---|
| 1 | 2026-05-18 | Claude | Xác định & đếm số lượng Use Case Specification cho Instructor | "Chức năng Instructor... có bao nhiêu use case specification?" | Claude đề xuất danh sách 19 Use Case | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 2 | 2026-05-19 | Claude | Viết đầy đủ 19 Use Case Specification theo template chuẩn | "UC SPECIFICATION TEMPLATE... làm mỗi usecase cho tôi" | Claude xuất 19 Use Case theo template 11 trường | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 3 | 2026-06-03 | Cursor | Xây dựng câu truy vấn phân trang Global Ranking và UI React | "Viết câu truy vấn JPA phân trang lấy danh sách user sắp xếp theo điểm..." | Đề xuất hàm findTopUsers trong JPA và UI component React | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 4 | 2026-06-08 | Cursor | Viết tác vụ Spring Boot Scheduled dọn đơn REJECTED sau 7 ngày | "Hãy viết một Spring Boot Scheduled task để tự động xóa các bản ghi InstructorApplication..." | Cấu hình @Scheduled task tự động xóa sau 7 ngày | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 5 | 2026-06-09 | Antigravity | Tạo UI admin quản lý user và confirm modal khóa tài khoản | "Tạo giao diện quản lý user cho admin có chức năng khóa/mở khóa tài khoản..." | Cấu hình bảng quản lý và modal confirm | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 6 | 2026-06-10 | Gemini | Giải quyết lỗi kết nối API Gemini 404 khi duyệt CV | "Lỗi kết nối Gemini API: 404 Not Found from POST... làm sao sửa lỗi này?" | Hướng dẫn sửa API Key và endpoint v1beta | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 7 | 2026-06-11 | Cursor | Cập nhật quyền hạn (role) và làm mới token của user sau khi đăng ký | "Làm sao để sau khi user gửi đơn đăng ký làm Instructor thành công thì quyền hạn..." | Gợi ý gọi API /api/auth/refresh để cập nhật JWT | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 8 | 2026-06-12 | Antigravity | Tinh chỉnh màn hình khóa tài khoản LOCKED và nút đăng xuất | "không thông báo ở đây, vẫn cho đăng nhập vào..." | Chặn user.status === 'LOCKED' bằng overlay modal, dịch sang tiếng Anh, nút Go Back logout | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 9 | 2026-06-16 | Cursor | Tái cấu trúc API Admin quản lý Instructor để bảo mật | "Hãy refactor code Spring Boot, tách các endpoint liên quan đến admin..." | Tách logic ra controller admin chuyên biệt | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 10 | 2026-06-17 | Gemini | Thiết kế Entity JPA cho kiểm duyệt khóa học (Course Moderation) | "Thiết kế Entity JPA cho bảng course_moderation_report trong Spring Boot..." | Cấu hình thực thể JPA CourseModerationReportEntity | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 11 | 2026-06-18 | Antigravity | Gọi Whisper API dịch giọng nói và thiết lập fallback sang Gemini | "Viết class Java gọi OpenAI Whisper API để nhận diện giọng nói..." | Lớp AiModerationClient hỗ trợ Whisper và Gemini fallback | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 12 | 2026-06-19 | Cursor | Cấu hình ffmpeg-service volume chung trong file docker-compose | "Tôi muốn thêm ffmpeg vào docker-compose để backend Java có thể gọi..." | Cấu hình ffmpeg service và shared volume | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 13 | 2026-06-21 | Cursor | Sửa lỗi Lombok annotation DI ở Contest Ranking và gọi ffmpeg | "Sửa lỗi Lombok không tự động sinh Constructor cho các trường final..." | Khuyên dùng @RequiredArgsConstructor và sửa IDE compile | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 14 | 2026-06-22 | ChatGPT | Viết SQL Seed Data cho 10 khóa học kiểm duyệt thử nghiệm | "Viết câu lệnh SQL chèn 10 khóa học và mỗi khóa học có 5 bài học mẫu..." | Script SQL INSERT chèn dữ liệu mẫu cho khóa học | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 15 | 2026-06-28 | Antigravity | Viết tài liệu đặc tả SRS chi tiết cho phân hệ quản trị (Administrator Module) | "Hãy viết tài liệu đặc tả yêu cầu phần mềm (SRS Document) chi tiết bằng tiếng Anh..." | Bản đặc tả SRS chi tiết dạng markdown bằng tiếng Anh | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 16 | 2026-07-02 | Antigravity | Thiết kế hiển thị lý do khóa/khiếu nại trên Admin Dashboard và chặn token login/refresh ở Backend | "1. Làm thế nào để hiển thị thông tin lý do khóa tài khoản... 2. Viết code Java Spring Boot..." | Code React hiển thị lý do khóa/appeal, logic validateStatus() trong auth service | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 17 | 2026-05-20 | ChatGPT | Thiết kế thực thể JPA InstructorApplication liên kết với users | "Thiết kế thực thể JPA InstructorApplication.java trong Spring Boot..." | Lớp Entity JPA InstructorApplication | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 18 | 2026-05-21 | Cursor | Cấu hình Spring Boot Controller tiếp nhận CV file upload | "Viết API Controller trong Spring Boot tiếp nhận đơn đăng ký Become Instructor..." | API Controller nhận file và JSON data | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 19 | 2026-05-22 | Claude | Tích hợp Axios gọi Cloudinary REST API từ React Client | "Làm thế nào để viết hàm React upload trực tiếp một file PDF..." | Upload CV trực tiếp lên Cloudinary | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 20 | 2026-05-24 | Gemini | Xây dựng giao diện trang ứng tuyển giảng viên (Become Instructor) | "Tạo giao diện BecomeInstructor.tsx trong React sử dụng Tailwind CSS..." | Form ứng tuyển với loading upload bar | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 21 | 2026-05-25 | Cursor | Viết API phê duyệt đơn ứng tuyển Instructor nâng quyền và refresh Token | "Viết phương thức Spring Boot phê duyệt đơn đăng ký giảng viên..." | Phê duyệt đơn ứng tuyển nâng quyền INSTRUCTOR | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 22 | 2026-05-27 | ChatGPT | Sửa lỗi không nhận diện vai trò mới INSTRUCTOR trên frontend | "Sau khi user được duyệt Become Instructor trên admin dashboard..." | API refresh token Claims vai trò mới | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 23 | 2026-05-28 | Gemini | Viết API từ chối đơn ứng tuyển giảng viên yêu cầu nhập lý do | "Viết API từ chối đơn Become Instructor nhận ID của đơn và lý do..." | Từ chối đơn ứng tuyển lưu lý do | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 24 | 2026-05-29 | Cursor | Thiết kế giao diện phê duyệt đơn giảng viên dành cho Admin | "Thiết kế trang Admin quản lý đơn ứng tuyển giảng viên dạng bảng..." | UI Admin Dashboard xem đơn duyệt CV PDF | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 25 | 2026-05-30 | Claude | Thiết kế thực thể JPA UserEntity chứa các trường phục vụ khóa tài khoản | "Bổ sung các trường status (ACTIVE, LOCKED), lockReason..." | Cấu hình UserEntity bổ sung status, lockReason | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 26 | 2026-06-01 | ChatGPT | Viết API Admin khóa tài khoản người dùng và lưu lý do khóa | "Viết API PUT /api/admin/users/{id}/lock nhận tham số lý do khóa..." | API khóa user và chặn admin tự khóa | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 27 | 2026-06-02 | Gemini | Viết API gửi khiếu nại mở khóa dành cho tài khoản bị khóa | "Viết API /api/users/appeal cho phép tài khoản đang bị LOCKED..." | API gửi appeal và cấu hình Security bypass | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 28 | 2026-06-04 | Cursor | Sửa lỗi không hiển thị danh sách người dùng mới sau khi khóa | "Trong React, sau khi tôi gọi API khóa user thành công và đóng modal..." | React State table reload sau khi khóa | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 29 | 2026-06-05 | Antigravity | Chặn truy cập API thông tin cá nhân đối với tài khoản LOCKED | "Hãy viết code Spring Boot chặn các tài khoản có trạng thái LOCKED..." | Validate trạng thái user ném AccountLockedException | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 30 | 2026-06-06 | ChatGPT | Viết câu lệnh JPQL đếm số lượng người dùng bị khóa | "Viết câu truy vấn JPA count số lượng user có trạng thái LOCKED..." | Query method count LOCKED users | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 31 | 2026-06-07 | Claude | Thiết kế React Hook useAuth tự động giải mã JWT và check LOCKED | "Làm sao viết một React hook useAuth để đọc token từ LocalStorage..." | React hook check status và auto logout | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 32 | 2026-06-13 | Gemini | Viết câu truy vấn phân trang lấy danh sách bảng xếp hạng Global Leaderboard | "Viết câu truy vấn Spring Data JPA sử dụng Pageable để lấy danh sách..." | JPQL query lấy top users có JOIN FETCH | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 33 | 2026-06-14 | Cursor | Thiết kế giao diện Global Leaderboard hiển thị huy chương Top 1, 2, 3 | "Tạo trang Global Ranking hiển thị bảng xếp hạng người dùng..." | Bảng xếp hạng Global Leaderboard SVG medals | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 34 | 2026-06-15 | Antigravity | Cấu hình Spring Cache (@Cacheable) cho API Leaderboard tránh quá tải | "Làm sao cấu hình Spring Boot Caching sử dụng Redis Cache để lưu trữ..." | Caching API Leaderboard với Redis | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 35 | 2026-06-20 | ChatGPT | Thiết kế thực thể JPA CourseModerationReport lưu báo cáo duyệt AI | "Thiết kế sơ đồ database JPA Entity cho bảng course_moderation_report..." | Thực thể JPA CourseModerationReport | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 36 | 2026-06-23 | Cursor | Tích hợp thư viện WebClient gọi API OpenAI Whisper để dịch âm thanh | "Viết class Java Spring Boot sử dụng WebClient để gọi API OpenAI..." | Whisper client dịch audio thành text | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 37 | 2026-06-24 | Gemini | Viết class Java trích xuất audio từ video bằng ProcessBuilder gọi ffmpeg | "Làm sao để gọi công cụ ffmpeg cài đặt trên hệ thống từ mã nguồn Java..." | ProcessBuilder gọi ffmpeg trích xuất audio | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 38 | 2026-06-25 | Cursor | Cấu hình ffmpeg-service chia sẻ volume chung trong file docker-compose | "Làm sao cấu hình một volume dùng chung (shared volume) giữa service..." | Docker volume mount dùng chung thư mục tạm | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 39 | 2026-06-26 | Claude | Sửa lỗi đầy ổ đĩa tạm (Disk Leak) do không xóa tệp video sau khi duyệt | "Hệ thống chạy kiểm duyệt video một thời gian thì báo lỗi..." | Xóa file tạm trong block finally và Scheduled clean | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 40 | 2026-06-27 | Antigravity | Viết logic so sánh kiểm duyệt nội dung bài học bằng API Gemini | "Viết phương thức Spring Boot gửi văn bản đã transcription lên Gemini..." | Gemini client với responseSchema JSON | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 41 | 2026-06-28 | ChatGPT | Sửa lỗi tương thích cú pháp compile Java 8 khi build dự án | "Khi compile backend trên Jenkins server sử dụng JDK 8..." | Refactor collections và chỉ định Java 17 compile | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 42 | 2026-06-29 | Gemini | Xây dựng cơ chế tự động chuyển trạng thái khóa học dựa trên báo cáo AI | "Viết logic Service sau khi nhận kết quả kiểm duyệt từ AI..." | Course state transition và email notification | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 43 | 2026-06-29 | Cursor | Sửa lỗi kết nối API Gemini 404 khi duyệt âm thanh bài học | "Gemini API báo lỗi 404 Not Found khi gọi POST url..." | Cập nhật v1beta API endpoint cho Gemini | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 44 | 2026-06-30 | Claude | Thiết kế cơ chế dự phòng (Gemini Audio Fallback) khi ví OpenAI hết số dư | "Nếu API Whisper của OpenAI báo lỗi 400 hoặc 429 do hết số dư..." | Fallback sang Gemini audio transcription | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 45 | 2026-06-30 | Antigravity | Tối ưu hóa WebClient tránh lỗi tràn bộ nhớ (LimitOnMaxInMemorySize) | "Khi tôi gửi file audio lớn (.wav dung lượng ~40MB) qua WebClient..." | Tăng maxInMemorySize cho WebClient Bean | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 46 | 2026-07-01 | ChatGPT | Viết unit tests sử dụng Mockito kiểm thử nghiệp vụ duyệt đơn Become Instructor | "Viết lớp kiểm thử InstructorApplicationServiceTest sử dụng JUnit 5..." | Unit test JUnit5 Mockito cho application service | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 47 | 2026-07-01 | Cursor | Viết truy vấn JPQL tìm kiếm đơn Become Instructor theo trạng thái và ngày | "Viết hàm Spring Data JPA repository tìm kiếm danh sách..." | Query method phân trang với nullable filter | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 48 | 2026-07-02 | Gemini | Viết phương thức bất đồng bộ (@Async) cho tiến trình chạy AI kiểm duyệt | "Làm sao cấu hình Spring Boot để hàm moderation bài học chạy bất đồng bộ..." | Bất đồng bộ hóa với @Async và ThreadPoolTaskExecutor | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 49 | 2026-07-02 | Claude | Viết script nạp dữ liệu mẫu (Seed SQL) cho tài khoản và báo cáo | "Viết script SQL chèn dữ liệu mẫu vào bảng users..." | SQL script nạp database test | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| 50 | 2026-07-02 | Antigravity | Thiết kế giao diện hiển thị danh sách báo cáo kiểm duyệt (AI Reports UI) | "Thiết kế trang Admin xem danh sách báo cáo kiểm duyệt khóa học..." | Admin UI hiển thị báo cáo AI và progress color bar | Có | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |

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
Chức năng dành cho Instructor 
Instructor là đối tác cung cấp nội dung, có quyền khởi tạo khóa học và tổ chức các kỳ thi thuật toán:
• Tài chính & Kinh doanh: Bán khóa học, Rút tiền doanh thu.
• Quản lý khóa học: Quản lý nội dung, Upload video, Tạo quiz, Cập nhật/chỉnh sửa, Ẩn/hiện, Trả lời Q&A, Xem thống kê.
• Quản lý Contest: Tạo Contest mới, Cấu hình, Thêm bài tập, Xem thống kê và kết quả.
• Quản lý bài tập Code: Tạo đề bài, Tạo và quản lý Test Case, Cấu hình tài nguyên.
dựa vào đây có bao nhiêu use case specification?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Nhóm cần xác định số lượng và phân nhóm cụ thể các Use Case cần viết đặc tả (specification) cho vai trò Instructor để chuẩn bị tài liệu SRS và phân chia công việc trong nhóm.
```

#### 5.3. Kết quả AI trả về

```text
Claude gợi ý danh sách gồm 19 Use Case được chia thành 4 nhóm chính: Tài chính & Kinh doanh (2 UC), Quản lý khóa học (7 UC), Quản lý Contest (4 UC), Quản lý bài tập Code (3 UC). Đồng thời cung cấp bối cảnh và ý nghĩa của từng Use Case trong hệ thống.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Nhóm sử dụng danh sách 19 Use Case này làm nền tảng cốt lõi để phân chia công việc viết đặc tả chi tiết và làm cơ sở thiết kế sơ đồ Use Case Diagram cho hệ thống.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Nhóm đã phân tích nghiệp vụ thực tế và quyết định tách UC10 (Tạo Contest) và UC11 (Cấu hình Contest) thành 2 use case riêng biệt (thay vì gộp chung). Đồng thời, nhóm bổ sung thêm UC18 (Upload file Input/Output) tách biệt khỏi UC17 (Tạo Test Case) để tối ưu việc upload test case qua file zip.
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
| Ngày sử dụng | 2026-06-03 |
| Công cụ AI | Cursor |
| Mục đích | Xây dựng câu truy vấn JPA phân trang Global Ranking và UI React |
| Phần việc liên quan | Backend / Frontend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
Viết câu truy vấn JPA phân trang lấy danh sách user sắp xếp theo điểm số tích lũy giảm dần và thiết kế giao diện bảng xếp hạng HTML/React đẹp có hiệu ứng hover.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần xây dựng một trang bảng xếp hạng tổng quan cho toàn bộ học viên trên nền tảng sắp xếp theo điểm số tích lũy, có phân trang để đảm bảo tối ưu tốc độ tải.
```

#### 5.3. Kết quả AI trả về

```text
Đưa ra câu truy vấn JPA Pageable và khung UI component React hoàn chỉnh, hỗ trợ hiệu ứng hover dịu mắt trên các hàng của bảng xếp hạng.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Áp dụng câu truy vấn JPA phân trang ở Backend và khung giao diện hiển thị danh sách người dùng ở Frontend.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Khắc phục thanh cuộn ngang bị thừa trên di động, chỉnh lại chỉ hiện thanh phân trang khi tổng số trang lớn hơn 1 và sửa lỗi TypeScript build.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Prompt tạo ra kết quả chưa phù hợp

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | f3ed11f |
| File liên quan | frontend/src/pages/GlobalRanking.tsx |

#### 5.8. Ghi chú thêm

```text
Prompt đã mô tả rõ yêu cầu cả backend và frontend giúp AI đưa ra bộ code tích hợp nhanh.
```

---

### Prompt số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-08 |
| Công cụ AI | Cursor |
| Mục đích | Xây dựng Scheduled Task tự động dọn dẹp đơn đăng ký bị từ chối |
| Phần việc liên quan | Backend / Database |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
Hãy viết một Spring Boot Scheduled task để tự động xóa các bản ghi InstructorApplication có trạng thái REJECTED sau 7 ngày kể từ ngày cập nhật.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Nhóm muốn giải phóng bộ nhớ database khỏi các đơn đăng ký giảng viên đã bị từ chối và để lâu ngày mà không có thay đổi gì thêm.
```

#### 5.3. Kết quả AI trả về

```text
Mẫu code Spring Boot Scheduled chạy nửa đêm hàng ngày, gọi truy vấn deleteByStatusAndUpdatedAtBefore.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Áp dụng trực tiếp class định giờ tự động dọn dẹp và logic xóa dữ liệu ở Repository.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Đồng bộ hóa múi giờ hệ thống và bảo đảm câu lệnh delete chỉ nhắm tới trạng thái REJECTED.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 117c4c0 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/scheduler/ApplicationCleanupScheduler.java |

#### 5.8. Ghi chú thêm

```text
Scheduled task là chức năng chạy nền chuẩn nên AI đưa ra gợi ý rất nhanh và chính xác.
```

---

### Prompt số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-09 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế giao diện admin quản lý user và confirm modal khi khóa tài khoản |
| Phần việc liên quan | Frontend / Security |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
Tạo giao diện quản lý user cho admin có chức năng khóa/mở khóa tài khoản, kèm modal xác nhận đẹp bằng React.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần xây dựng giao diện quản trị cho admin để vô hiệu hóa/kích hoạt lại các tài khoản vi phạm chính sách kèm theo cửa sổ pop-up xác nhận thao tác để tránh nhấn nhầm.
```

#### 5.3. Kết quả AI trả về

```text
React component với thiết kế bảng danh sách người dùng, cột trạng thái và modal popup confirm sử dụng backdrop CSS glassmorphism.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Sử dụng cấu trúc thiết kế hộp thoại xác nhận và bảng hiển thị thông tin ở Frontend.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Chuyển cột nút bấm tác vụ (Lock/Unlock) ra một khu vực riêng biệt phía cuối bảng, ẩn nút trên cột trạng thái và dịch sang tiếng Anh.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | afbb398 / 289b418 |
| File liên quan | frontend/src/pages/admin/ManageUser.tsx |

#### 5.8. Ghi chú thêm

```text
Hộp thoại kính mờ (glassmorphism) do AI thiết kế trông rất premium và hiện đại.
```

---

### Prompt số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-10 |
| Công cụ AI | Gemini |
| Mục đích | Sửa lỗi 404 khi kết nối Gemini API để duyệt CV tự động |
| Phần việc liên quan | Backend / AI Integration |
| Mức độ sử dụng | Hỏi sửa lỗi |

#### 5.1. Prompt nguyên văn

```text
Lỗi kết nối Gemini API: 404 Not Found from POST https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=... làm sao sửa lỗi này?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Hệ thống tự động duyệt CV bằng Gemini gặp lỗi 404 khi gửi yêu cầu chấm điểm đến API Google AI Studio.
```

#### 5.3. Kết quả AI trả về

```text
Chỉ ra URL endpoint v1beta bị sai hoặc mô hình gemini-1.5-flash cấu hình chưa chính xác. Khuyên chỉnh lại URL API Endpoint chuẩn và kiểm tra API Key.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Đã áp dụng URL API chính xác vào tệp cấu hình của hệ thống.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Dù đã kết nối thành công, chúng tôi nhận thấy việc duyệt CV tự động bằng AI dễ xảy ra sai sót và không đảm bảo chất lượng giảng viên. Nhóm quyết định loại bỏ toàn bộ tính năng duyệt CV bằng AI, loại bỏ file GeminiService.java để admin tự xem và duyệt thủ công.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [ ] Prompt còn thiếu thông tin
- [x] Prompt tạo ra kết quả tốt
- [ ] Kết quả AI có lỗi hoặc chưa chính xác

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | cfb4a859 / 23f92ee |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/GeminiService.java |

#### 5.8. Ghi chú thêm

```text
Nhóm học được cách giải quyết lỗi kết nối mạng API và tư duy độc lập khi quyết định thiết kế nghiệp vụ phù hợp.
```

---

### Prompt số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-11 |
| Công cụ AI | Cursor |
| Mục đích | Cập nhật quyền hạn (role) và làm mới token sau khi đăng ký giảng viên thành công |
| Phần việc liên quan | Frontend / Security |
| Mức độ sử dụng | Hỏi giải pháp |

#### 5.1. Prompt nguyên văn

```text
Làm sao để sau khi user gửi đơn đăng ký làm Instructor thành công thì quyền hạn trong session tự động cập nhật mà không cần bắt user phải logout rồi login lại?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Người dùng sau khi gửi đơn thành công và được cập nhật quyền hạn vẫn giữ Token cũ dẫn đến việc họ không truy cập được chức năng Instructor ngay, gây bất tiện.
```

#### 5.3. Kết quả AI trả về

```text
Gợi ý cơ chế gọi Endpoint làm mới phiên đăng nhập (/api/auth/refresh) ngay tại Frontend để lấy JWT mới có chứa Role mới cập nhật.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Áp dụng luồng tự động gọi hàm refreshAuth ở frontend ngay khi đăng ký hoàn tất.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Sửa các lỗi crash của Admin Dashboard do Role thay đổi đột ngột và thiết lập Custom status confirmation modal đẹp mắt.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 0ec7f01 / 7406f57 |
| File liên quan | frontend/src/context/AppContext.tsx |

#### 5.8. Ghi chú thêm

```text
Giải pháp gọi refresh token tại frontend hoạt động cực kỳ mượt mà và nâng cao trải nghiệm người dùng.
```

---

### Prompt số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-12 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế màn hình khóa và chặn truy cập chức năng cho tài khoản bị LOCKED |
| Phần việc liên quan | Coding / Testing |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
không thông báo ở đây, vẫn cho đăng nhập vào nhưng không cho truy cập chức năng nào hết, hiện ra thông báo tài khoản bạn đã bị lock, liên hệ gmail cho chúng tôi và có 1 nút back ra ngoài
```

#### 5.2. Bối cảnh khi viết prompt

```text
Tài khoản người dùng bị khóa khi đăng nhập vẫn cần truy cập được thông tin cơ bản để khiếu nại nhưng không được sử dụng bất kỳ chức năng nào khác. Cần có một giao diện che phủ hoàn toàn để thông báo khóa và hướng dẫn liên hệ gmail, cùng với nút quay lại để đăng xuất.
```

#### 5.3. Kết quả AI trả về

```text
Đề xuất code thay đổi trong Layout.tsx để kiểm tra user.status === 'LOCKED' và hiển thị màn hình modal che phủ toàn bộ trang web. Đồng thời điều chỉnh AppContext.tsx để duy trì trạng thái khi người dùng tải lại trang web và cung cấp nút Go Back thực hiện logout.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Áp dụng trực tiếp thiết kế giao diện modal Locked Account tiếng Anh sang trọng, đồng thời sử dụng cấu trúc đồng bộ dữ liệu người dùng trong AppContext.tsx khi token refresh được kích hoạt.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Bổ sung việc khởi động lại ứng dụng backend để đảm bảo JWT filter cho phép giải mã token của tài khoản bị khóa nhằm lấy thông tin profile hiển thị lên màn hình modal.
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
| Link commit | 3fef6ee / 259058b |
| File liên quan | frontend/src/components/Layout.tsx, frontend/src/context/AppContext.tsx |
| Screenshot | docs/member/DE190023-Bazero06/screenshots/account_locked.png |
| Kết quả chạy/test | TypeScript compiles OK, Maven tests OK |
| Link tài liệu/báo cáo | docs/member/DE190023-Bazero06/AI_AUDIT_LOG.md |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Prompt đã phản ánh đúng nghiệp vụ cần phát triển, giúp AI định hướng chính xác giải pháp ở cả Client và Server.
```

---

### Prompt số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Cursor |
| Mục đích | Tái cấu trúc API Admin quản lý Instructor để bảo mật |
| Phần việc liên quan | Backend / Clean Code |
| Mức độ sử dụng | Hỏi ý kiến tối ưu |

#### 5.1. Prompt nguyên văn

```text
Hãy refactor code Spring Boot, tách các endpoint liên quan đến admin quản lý danh sách instructor từ InstructorController sang AdminDashboardController hoặc một controller admin riêng để dễ quản lý và phân quyền bảo mật.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Nhận thấy controller quản lý Instructor ban đầu đang để chung các endpoint duyệt đơn của Admin và endpoint đăng ký khóa học, cần tách ra để phân cấp bảo mật tốt hơn.
```

#### 5.3. Kết quả AI trả về

```text
Cấu trúc Controller mới AdminInstructorController định nghĩa đầy đủ các API duyệt, chặn, mở khóa giảng viên với tiền tố định tuyến /api/admin/instructors.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Dùng cấu trúc tách lớp endpoint và cách thiết lập định tuyến phân quyền admin.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Tự điều chỉnh import, giải quyết các lỗi biên dịch và cập nhật phân quyền Spring Security ở tầng WebSecurityConfig tương ứng.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9d3c7d2 / 6933ac0 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/controller/admin/AdminDashboardController.java |

#### 5.8. Ghi chú thêm

```text
Tách endpoint giúp thiết lập bảo mật Spring Security Role-based Access Control đơn giản và an toàn hơn nhiều.
```

---

### Prompt số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | Gemini |
| Mục đích | Thiết kế Entity JPA lưu kết quả kiểm duyệt khóa học tự động |
| Phần việc liên quan | Backend / Database Design |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
Thiết kế Entity JPA cho bảng course_moderation_report trong Spring Boot để lưu trữ kết quả kiểm duyệt AI cho khóa học gồm: khóa ngoại tới Course, trạng thái (APPROVED/REJECTED), lý do chi tiết, điểm đánh giá độc hại, và thời gian kiểm duyệt.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần một bảng lưu trữ kết quả phân tích video và nội dung văn bản của khóa học do AI chấm điểm để lưu vết và báo cáo cho admin kiểm tra chéo.
```

#### 5.3. Kết quả AI trả về

```text
Code lớp JPA Entity CourseModerationReportEntity với các annotation cần thiết (@Entity, @Table, @ManyToOne, @JoinColumn).
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Sử dụng lớp Entity làm khung sườn để khởi tạo bảng trong cơ sở dữ liệu.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Cấu hình lại Enum ánh xạ cơ sở dữ liệu sang dạng String, sửa lỗi biên dịch Lombok DI xung quanh OrderService và WebClient.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1cb43ad |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/entity/course/CourseModerationReportEntity.java |

#### 5.8. Ghi chú thêm

```text
AI thiết kế đúng các chuẩn mapping JPA giúp Hibernate tự động sinh bảng SQL chuẩn xác.
```

---

### Prompt số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-18 |
| Công cụ AI | Antigravity |
| Mục đích | Gọi Whisper API dịch giọng nói và thiết lập fallback sang Gemini |
| Phần việc liên quan | Backend / AI Integration |
| Mức độ sử dụng | Hỏi giải pháp & sinh code |

#### 5.1. Prompt nguyên văn

```text
Viết class Java gọi OpenAI Whisper API để nhận diện giọng nói từ file âm thanh (.mp3) và tích hợp thêm phương thức dự phòng gọi sang Gemini API nếu OpenAI ném ra lỗi hoặc hết tiền (402/429).
```

#### 5.2. Bối cảnh khi viết prompt

```text
Hệ thống sử dụng Whisper API của OpenAI để nhận diện giọng nói trong video bài giảng, nhưng tài khoản OpenAI có thể hết tiền. Cần giải pháp dự phòng dùng API của Gemini miễn phí.
```

#### 5.3. Kết quả AI trả về

```text
Mã nguồn class AiModerationClient sử dụng Spring WebClient để POST file âm thanh tới Whisper, đồng thời bắt các lỗi HTTP Error 402/429 để tự động chuyển tiếp dữ liệu âm thanh tới Gemini 2.5 Flash.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Áp dụng cấu trúc dịch vụ gọi API và thuật toán bắt lỗi chuyển hướng dự phòng (fallback pattern).
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Nâng cấp mô hình Gemini sang phiên bản gemini-2.5-flash chính thức và chỉnh sửa cú pháp tương thích với môi trường biên dịch Java 8 của hệ thống.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 79aaf56 / 54f0d8a / 9b46509 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/AiModerationClient.java |

#### 5.8. Ghi chú thêm

```text
Thuật toán dự phòng (fallback) giúp hệ thống kiểm duyệt hoạt động ổn định 24/7 bất kể số dư API OpenAI.
```

---

### Prompt số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-19 |
| Công cụ AI | Cursor |
| Mục đích | Cấu hình ffmpeg-service và shared volume trong Docker |
| Phần việc liên quan | DevOps / Docker |
| Mức độ sử dụng | Hỏi cấu hình |

#### 5.1. Prompt nguyên văn

```text
Tôi muốn thêm ffmpeg vào docker-compose để backend Java có thể gọi trích xuất âm thanh từ video. Nên cấu hình dịch vụ docker-compose như thế nào để tối ưu và chia sẻ volume lưu trữ file tạm?
```

#### 5.2. Bối cảnh khi viết prompt

```text
Để OpenAI Whisper/Gemini có thể phân tích giọng nói của bài học, backend Java cần gọi ffmpeg trích xuất âm thanh (.mp3) từ video (.mp4) tải lên. Cần chạy ffmpeg trong Docker độc lập.
```

#### 5.3. Kết quả AI trả về

```text
Gợi ý thiết lập service ffmpeg-service sử dụng image jrottenberg/ffmpeg và cấu hình shared volume tạm thời /tmp/media giữa Java container và ffmpeg.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Sử dụng cấu hình container ffmpeg và khai báo shared volume trong docker-compose.yml.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Sửa đổi đường dẫn thư mục tạm tuyệt đối để tương thích tốt với môi trường Docker Desktop trên Windows của máy phát triển thực tế.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | d5b9ed98 (trong lịch sử chat 19/06) |
| File liên quan | docker-compose.yml |

#### 5.8. Ghi chú thêm

```text
Cơ chế shared volume của Docker giúp tiết kiệm thời gian truyền nhận file giữa hai service.
```

---

### Prompt số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-21 |
| Công cụ AI | Cursor |
| Mục đích | Sửa lỗi Lombok annotation DI ở Contest Ranking và gọi ffmpeg |
| Phần việc liên quan | Backend / Bug Fixing |
| Mức độ sử dụng | Hỏi sửa lỗi |

#### 5.1. Prompt nguyên văn

```text
Sửa lỗi Lombok không tự động sinh Constructor cho các trường final sau khi merge code ở nhánh contest.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Dự án gặp lỗi biên dịch sau khi gộp nhánh, các Dependency Injection không tự động nạp constructor cho Spring Beans do Lombok không hoạt động.
```

#### 5.3. Kết quả AI trả về

```text
Chỉ ra nguyên nhân do thiếu @RequiredArgsConstructor hoặc chưa cấu hình "Enable annotation processing" trong trình biên dịch IDE. Hướng dẫn sửa code và cấu hình.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Bổ sung annotation @RequiredArgsConstructor của Lombok vào ContestRankingRepository và cấu hình IDE.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Tự lập trình lớp AudioProcessingService để gọi thực thi ffmpeg CLI, tối ưu hóa việc giải phóng tệp tạm thời sau khi Whisper phân tích xong để tránh rò rỉ đĩa.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | ab2b129 / ee23b22 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/AudioProcessingService.java |

#### 5.8. Ghi chú thêm

```text
Lombok thỉnh thoảng gặp lỗi biên dịch ngầm nên hướng dẫn sửa IDE của AI là rất hữu dụng.
```

---

### Prompt số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-22 |
| Công cụ AI | ChatGPT |
| Mục đích | Viết câu lệnh SQL chèn dữ liệu mẫu cho khóa học và bài học để kiểm thử AI |
| Phần việc liên quan | Database / Testing |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
Viết câu lệnh SQL chèn 10 khóa học và mỗi khóa học có 5 bài học mẫu với các mô tả chứa cả từ ngữ nhạy cảm và bình thường để test tính năng duyệt khóa học AI.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần bộ dữ liệu mẫu nạp thẳng vào DB để kiểm tra khả năng bắt từ khóa nhạy cảm và trích xuất giọng nói của module AI Moderation.
```

#### 5.3. Kết quả AI trả về

```text
Các câu lệnh INSERT mẫu chèn dữ liệu thô vào các bảng course, chapter và lesson.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Sử dụng các lệnh chèn mẫu làm khung để tạo file SQL dữ liệu thử nghiệm.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Tự soạn nội dung nhạy cảm thực tế và chèn các link video thực tế để kiểm tra quá trình trích xuất âm thanh và kiểm duyệt của AI.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | df7375ba (trong lịch sử chat 22/06) |
| File liên quan | backend/src/main/resources/seed_data.sql |

#### 5.8. Ghi chú thêm

```text
Seed data giúp việc kiểm nghiệm kịch bản lỗi của hệ thống trở nên trực quan và chính xác hơn.
```

---

### Prompt số 15

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích | Viết tài liệu đặc tả SRS chi tiết cho phân hệ quản trị (Administrator Module) |
| Phân việc liên quan | Requirement / Analysis |
| Mức độ sử dụng | Hỏi sinh tài liệu |

#### 5.1. Prompt nguyên văn

```text
Hãy viết tài liệu đặc tả yêu cầu phần mềm (SRS Document) chi tiết bằng tiếng Anh cho module Administrator của hệ thống Integrated Coding Education & Competitive Programming Platform. Tài liệu cần phân chia thành các phần:
- 4.2 Screen Descriptions: Dạng bảng mô tả khoảng 20 màn hình bao gồm Overview Dashboard, Deposit Auditing, Contest Directory, Course Auditing, Financial Stats, User/Instructor Directory,...
- 4.3 Screen Authorization: Ma trận phân quyền truy cập giữa Guest, Student, Instructor và Admin đối với các màn hình này.
- 4.4 Non-Screen Functions: Các chức năng nghiệp vụ xử lý ngầm (ví dụ: Sandboxed Grading Job, ICPC standings calculation, State Transition, AI Content Scanning, Financial Split, Cascade Deletion).
```

#### 5.2. Bối cảnh khi viết prompt

```text
Cần xây dựng tài liệu SRS phân hệ Admin một cách chuyên nghiệp, bao phủ toàn bộ các màn hình và chức năng chạy ngầm phức tạp để bổ sung vào báo cáo dự án nhóm.
```

#### 5.3. Kết quả AI trả về

```text
Bản đặc tả SRS chi tiết dạng markdown bằng tiếng Anh. Chứa 20 mô tả màn hình, bảng phân quyền chi tiết, và 7 luồng xử lý chạy ngầm với triggers rõ ràng.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
Được sử dụng làm file đặc tả docs/admin_srs_sections.md trong tài liệu báo cáo của dự án.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Chỉnh sửa, bổ sung các màn hình con để đồng bộ hoàn toàn với tiến độ code UI Frontend và đổi tên các chức năng Non-screen cho đúng cấu trúc class Java.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | (Tài liệu được thêm trực tiếp) |
| File liên quan | docs/admin_srs_sections.md |

#### 5.8. Ghi chú thêm

```text
AI soạn thảo tài liệu đặc tả kỹ thuật tiếng Anh rất chuẩn và mạch lạc.
```

---

### Prompt số 16

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-02 |
| Công cụ AI | Antigravity |
| Prompt tóm tắt | Thiết kế hiển thị lý do khóa/khiếu nại trên Admin Dashboard và chặn token login/refresh ở Backend |
| Phân việc liên quan | Frontend / Backend / Security |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn

```text
1. Làm thế nào để hiển thị thông tin lý do khóa tài khoản và nội dung khiếu nại (lockAppeal) của User ngay trong tab User Detail ở trang Admin Dashboard? Thiết kế UI gọn gàng, có màu sắc cảnh báo đỏ/indigo nổi bật bằng React.
2. Viết code Java Spring Boot trong AuthenticationService để khi thực hiện login (bằng username/password hoặc Google OAuth) hoặc khi refresh token, hệ thống sẽ tự động gọi phương thức validateStatus() của UserEntity để chặn các tài khoản LOCKED đăng nhập hay refresh phiên.
```

#### 5.2. Bối cảnh khi viết prompt

```text
Nhóm đã có tính năng khóa tài khoản cơ bản ở Front/Back, nhưng Admin chưa xem được lý do khóa hay nội dung khiếu nại của user trực tiếp trên dashboard. Hơn nữa, Backend vẫn cho phép Refresh Token và một số luồng OAuth lấy token cho tài khoản đã bị khóa, cần xử lý chặn triệt để.
```

#### 5.3. Kết quả AI trả về

```text
- Code React component hiển thị phần lý do khóa và nội dung khiếu nại (Appeal) trong khối màu cảnh báo.
- Đoạn mã Java Spring Boot gọi `userEntity.validateStatus()` trong AuthenticationService.java cho các hàm login, oauth, loginWithToken, và refreshToken.
```

#### 5.4. Kết quả đã áp dụng vào bài

```text
- Áp dụng các thay đổi trong AuthenticationService.java để chặn hoàn toàn mọi luồng login/refresh của user LOCKED.
- Áp dụng UI hiển thị lý do khóa/khiếu nại ở User Detail panel trong AdminDashboard.tsx.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

```text
Bổ sung textarea "Reason for locking account" động khi Admin kích hoạt khóa tài khoản trên UI, lưu lý do khóa xuống Database thông qua API và xử lý reset text state khi hủy modal xác nhận.
```

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | (Đang được thực hiện trên branch bugfix/DE190023-manage-user) |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/auth/AuthenticationService.java, frontend/src/pages/AdminDashboard.tsx |

#### 5.8. Ghi chú thêm

```text
Sự phối hợp chặt chẽ giữa logic bảo mật backend và giao diện hiển thị frontend giúp tính năng khóa tài khoản cực kỳ an toàn và chuyên nghiệp.
```

---

### Prompt số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-20 |
| Công cụ AI | ChatGPT |
| Mục đích | Thiết kế thực thể JPA InstructorApplication liên kết với users |
| Phân việc liên quan | Database Design / Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Thiết kế thực thể JPA InstructorApplication.java trong Spring Boot để quản lý đơn ứng tuyển làm giảng viên của User. Entity này cần có quan hệ @ManyToOne với UserEntity, các trường: id (UUID), status (PENDING, APPROVED, REJECTED), cvUrl (String), major (String), reason (String), và các trường timestamps (createdAt, updatedAt).
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần thiết kế bảng lưu trữ hồ sơ nộp đơn ứng tuyển làm giảng viên của người học để admin duyệt.
```

#### 5.3. Kết quả AI trả về
```text
Lớp Java JPA Entity có đầy đủ mapping `@ManyToOne` và `@JoinColumn` kết hợp với Enum trạng thái đơn ứng tuyển.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Được sử dụng làm thực thể chính thức lưu dữ liệu đăng ký giảng viên.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Bổ sung các ràng buộc validation `@Size` và `@NotBlank` của Hibernate Validator trên các trường text đầu vào.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | cfb4a859 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/entity/moderation/InstructorApplication.java |

#### 5.8. Ghi chú thêm
```text
JPA mapping được sinh chuẩn xác, giúp cấu hình khóa ngoại an toàn.
```

---

### Prompt số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-21 |
| Công cụ AI | Cursor |
| Mục đích | Cấu hình Spring Boot Controller tiếp nhận CV file upload |
| Phân việc liên quan | Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết API Controller trong Spring Boot tiếp nhận đơn đăng ký Become Instructor qua POST request, nhận file CV dạng MultipartFile cùng với các thông tin text (major, reason) đóng gói trong DTO.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần viết endpoint tiếp nhận dữ liệu hỗn hợp (gồm file CV PDF và thông tin văn bản) truyền từ client-side.
```

#### 5.3. Kết quả AI trả về
```text
Code Spring controller sử dụng `@RequestPart("file")` và `@RequestPart("data")` để phân tách tệp nhị phân và DTO JSON.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm API Controller chính tiếp nhận đơn Become Instructor.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Thêm bộ lọc kiểm tra đuôi mở rộng của file (.pdf) và giới hạn dung lượng tải lên tối đa 5MB.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 0ec7f01 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/controller/moderation/InstructorApplicationController.java |

#### 5.8. Ghi chú thêm
```text
RequestPart giúp giải quyết vấn đề tải lên hỗn hợp (hybrid multipart) vô cùng tinh gọn trong Spring.
```

---

### Prompt số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-22 |
| Công cụ AI | Claude |
| Mục đích | Tích hợp Axios gọi Cloudinary REST API từ React Client |
| Phân việc liên quan | Frontend |
| Mức độ sử dụng | Hỏi giải pháp |

#### 5.1. Prompt nguyên văn
```text
Làm thế nào để viết hàm React upload trực tiếp một file PDF lên Cloudinary bằng REST API Axios mà không cần qua server backend, sử dụng Unsigned Upload Preset?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Muốn đẩy trực tiếp tệp CV lên Cloudinary từ Client để giảm thiểu gánh nặng tải tệp lên server Spring Boot.
```

#### 5.3. Kết quả AI trả về
```text
Đoạn code Axios gọi POST Form-Data truyền tệp nhị phân và upload_preset lên API của Cloudinary.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Sử dụng làm hàm upload file CV của React client.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Chuyển cloud_name cấu hình Cloudinary vào biến môi trường React `.env`.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 0ec7f01 |
| File liên quan | frontend/src/pages/BecomeInstructor.tsx |

#### 5.8. Ghi chú thêm
```text
Giải pháp upload trực tiếp lên cloud storage rất phù hợp cho ứng dụng web tải cao.
```

---

### Prompt số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-24 |
| Công cụ AI | Gemini |
| Mục đích | Xây dựng giao diện trang ứng tuyển giảng viên (Become Instructor) |
| Phân việc liên quan | Frontend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Tạo giao diện BecomeInstructor.tsx trong React sử dụng Tailwind CSS cho phép học viên điền chuyên môn, lý do ứng tuyển và tải file CV PDF trực quan, có hiển thị thanh tiến trình loading khi đang upload.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Thiết kế trang web đăng ký Become Instructor trực quan giúp người học dễ dàng ứng tuyển.
```

#### 5.3. Kết quả AI trả về
```text
Bản thiết kế form Tailwind CSS bắt mắt có quản lý trạng thái loading và nút gửi đơn ứng tuyển.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm trang Become Instructor chính thức.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Tích hợp nút hủy file đã chọn để người dùng dễ chọn lại tệp CV PDF khác trước khi bấm gửi.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 0ec7f01 |
| File liên quan | frontend/src/pages/BecomeInstructor.tsx |

#### 5.8. Ghi chú thêm
```text
Tailwind CSS giúp xây dựng giao diện form nhập liệu sạch sẽ, chuẩn chỉ.
```

---

### Prompt số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-25 |
| Công cụ AI | Cursor |
| Mục đích | Viết API phê duyệt đơn ứng tuyển Instructor nâng quyền và refresh Token |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết phương thức Spring Boot phê duyệt đơn đăng ký giảng viên: cập nhật trạng thái đơn thành APPROVED, thay đổi role của User liên kết từ STUDENT sang INSTRUCTOR trong một transaction, và ghi nhận logs.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Admin duyệt đơn Become Instructor của học viên, hệ thống tự động đổi quyền cho học viên thành giảng viên.
```

#### 5.3. Kết quả AI trả về
```text
Code logic hàm Service dùng `@Transactional` xử lý cập nhật trạng thái đơn ứng tuyển và chỉnh sửa User role.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm logic nghiệp vụ duyệt đơn giảng viên ở backend.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Tích hợp dịch vụ gửi mail thông báo cho user biết khi đơn ứng tuyển của họ được chấp thuận.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/InstructorApplicationService.java |

#### 5.8. Ghi chú thêm
```text
Transaction giúp đảm bảo vai trò của user luôn đồng bộ với trạng thái đơn ứng tuyển.
```

---

### Prompt số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-27 |
| Công cụ AI | ChatGPT |
| Mục đích | Sửa lỗi không nhận diện vai trò mới INSTRUCTOR trên frontend |
| Phân việc liên quan | Bug Fixing / Security |
| Mức độ sử dụng | Hỏi cách sửa |

#### 5.1. Prompt nguyên văn
```text
Sau khi user được duyệt Become Instructor trên admin dashboard, trên giao diện của user đó vẫn hiển thị menu dành cho học sinh. Chỉ khi họ logout rồi login lại mới hiện các tính năng giảng viên. Làm sao giải quyết triệt để vấn đề này mà không bắt user logout?
```

#### 5.2. Bối cảnh khi viết prompt
```text
claims vai trò trong JWT token cũ của user vẫn là STUDENT, làm client React không nhận biết được vai trò mới INSTRUCTOR ngay lập tức sau khi duyệt đơn.
```

#### 5.3. Kết quả AI trả về
```text
Gợi ý viết API `/refresh-token` trả về token mới chứa các claims cập nhật và gọi API này từ client để nạp lại AuthContext.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Tích hợp API refresh token và tự động gọi từ React client khi nhận phản hồi nâng cấp quyền.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Cập nhật claims trực tiếp trong AuthContext của React để thay đổi giao diện menu tức thì.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9d3c7d2 |
| File liên quan | frontend/src/pages/AdminDashboard.tsx |

#### 5.8. Ghi chú thêm
```text
Làm mới token âm thầm giúp duy trì trải nghiệm người dùng liền mạch.
```

---

### Prompt số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-28 |
| Công cụ AI | Gemini |
| Mục đích | Viết API từ chối đơn ứng tuyển giảng viên yêu cầu nhập lý do |
| Phân việc liên quan | Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết API từ chối đơn Become Instructor nhận ID của đơn và lý do từ chối (rejectReason). Cập nhật trạng thái thành REJECTED và lưu lý do vào thực thể InstructorApplication.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Khi từ chối đơn làm giảng viên, admin bắt buộc phải ghi lý do để phản hồi cụ thể cho học viên.
```

#### 5.3. Kết quả AI trả về
```text
Code hàm service cập nhật thuộc tính `status` và `rejectReason` của bản ghi đơn ứng tuyển.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm logic từ chối đơn Become Instructor của Admin.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Thêm check validate đảm bảo đơn chưa từng được Approve trước đó để ngăn chặn đảo trạng thái đơn tùy tiện.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/InstructorApplicationService.java |

#### 5.8. Ghi chú thêm
```text
Lưu vết lý do từ chối giúp người dùng hiểu rõ thiếu sót của hồ sơ để sửa đổi.
```

---

### Prompt số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-29 |
| Công cụ AI | Cursor |
| Mục đích | Thiết kế giao diện phê duyệt đơn giảng viên dành cho Admin |
| Phân việc liên quan | Frontend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Thiết kế trang Admin quản lý đơn ứng tuyển giảng viên dạng bảng danh sách có hiển thị: Họ tên, email, chuyên ngành, ngày ứng tuyển. Khi bấm vào xem chi tiết sẽ mở Modal hiển thị lý do ứng tuyển và nhúng file CV PDF xem trực tuyến.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Admin cần màn hình hiển thị hồ sơ Become Instructor để duyệt CV nhanh chóng mà không cần tải tệp về máy tính.
```

#### 5.3. Kết quả AI trả về
```text
Component React bảng danh sách và Modal nhúng file PDF trực tuyến sử dụng thẻ iframe HTML.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng cấu trúc UI xem và phê duyệt hồ sơ trong `AdminDashboard.tsx`.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Tích hợp input textarea nhập lý do từ chối trực quan ngay trong modal của admin.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9d3c7d2 |
| File liên quan | frontend/src/pages/AdminDashboard.tsx |

#### 5.8. Ghi chú thêm
```text
Iframe PDF viewer hoạt động cực kỳ mượt mà trên các trình duyệt hiện đại.
```

---

### Prompt số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-30 |
| Công cụ AI | Claude |
| Mục đích | Thiết kế thực thể JPA UserEntity chứa các trường phục vụ khóa tài khoản |
| Phân việc liên quan | Database Design / Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Bổ sung các trường status (ACTIVE, LOCKED), lockReason (String) và lockAppeal (String) vào thực thể UserEntity.java để phục vụ nghiệp vụ khóa tài khoản và khiếu nại của user.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần mở rộng cấu trúc lưu trữ thông tin tài khoản người dùng để quản lý khóa tài khoản vi phạm và tiếp nhận đơn khiếu nại mở khóa.
```

#### 5.3. Kết quả AI trả về
```text
Khai báo thuộc tính mới, getter/setter và cấu hình kiểu cột tương ứng trong JPA Entity.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng nâng cấp lớp thực thể `UserEntity.java` trong database của dự án.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Đặt trạng thái mặc định của user khi khởi tạo là `ACTIVE` để tránh lỗi null status.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | f3ed11f |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/entity/UserEntity.java |

#### 5.8. Ghi chú thêm
```text
Cấu hình thuộc tính trạng thái an toàn là nền tảng quản lý bảo mật người dùng.
```

---

### Prompt số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-01 |
| Công cụ AI | ChatGPT |
| Mục đích | Viết API Admin khóa tài khoản người dùng và lưu lý do khóa |
| Phân việc liên quan | Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết API PUT /api/admin/users/{id}/lock nhận tham số lý do khóa (lockReason). Cập nhật trạng thái user thành LOCKED, lưu lý do khóa vào DB và phản hồi kết quả JSON.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Khi admin phát hiện người dùng vi phạm quy chế học tập, admin có thể khóa tài khoản và lưu lại lý do để giải trình.
```

#### 5.3. Kết quả AI trả về
```text
Đoạn code REST Controller Spring Boot nhận lý do khóa qua JSON request và gọi service cập nhật thực thể.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Tích hợp endpoint khóa tài khoản của admin.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Thêm logic kiểm tra an toàn: Admin không được phép tự khóa tài khoản quản trị của chính mình.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 117c4c0 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/controller/admin/AdminUserController.java |

#### 5.8. Ghi chú thêm
```text
Ràng buộc an toàn ngăn tự khóa tài khoản rất quan trọng để bảo vệ quyền quản trị hệ thống.
```

---

### Prompt số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-02 |
| Công cụ AI | Gemini |
| Mục đích | Viết API gửi khiếu nại mở khóa dành cho tài khoản bị khóa |
| Phân việc liên quan | Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết API /api/users/appeal cho phép tài khoản đang bị LOCKED gửi nội dung khiếu nại (lockAppeal). Cập nhật nội dung này vào thuộc tính lock_appeal của User trong database.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Người học bị khóa tài khoản cần một biểu mẫu gửi giải trình khiếu nại (Appeal Form) lên hệ thống để xin mở khóa.
```

#### 5.3. Kết quả AI trả về
```text
Endpoint API cho phép user bị LOCKED gửi yêu cầu khiếu nại lên backend.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm API tiếp nhận đơn khiếu nại mở khóa của người dùng.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Cấu hình bỏ chặn phân quyền (White-list path) cho API gửi khiếu nại mở khóa trong cấu hình WebSecurityConfig để các user LOCKED có thể gọi API này.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | afbb398 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/controller/user/UserAppealController.java |

#### 5.8. Ghi chú thêm
```text
Cấu hình bảo mật cần chừa lỗ hổng an toàn cho luồng khiếu nại của user bị khóa.
```

---

### Prompt số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-04 |
| Công cụ AI | Cursor |
| Mục đích | Sửa lỗi không hiển thị danh sách người dùng mới sau khi khóa |
| Phân việc liên quan | Bug Fixing / Frontend |
| Mức độ sử dụng | Hỏi sửa lỗi |

#### 5.1. Prompt nguyên văn
```text
Trong React, sau khi tôi gọi API khóa user thành công và đóng modal, danh sách user ngoài bảng vẫn hiển thị trạng thái cũ (ACTIVE) của người dùng đó. Tôi phải tải lại trang (F5) mới cập nhật đúng. Làm sao để bảng tự động hiển thị trạng thái mới?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Giao diện React Admin không render lại trạng thái mới của user sau khi admin bấm nút khóa tài khoản, làm trải nghiệm admin bị gián đoạn.
```

#### 5.3. Kết quả AI trả về
```text
Hướng dẫn cập nhật React state của danh sách người dùng bằng cách thay thế user bị khóa bằng đối tượng mới nhận được từ API phản hồi, kích hoạt render lại UI.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng thay thế phần tử state cục bộ sau khi đóng modal thành công.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Gọi lại hàm callback `fetchUsers` để đồng bộ hoàn toàn dữ liệu phân trang từ backend sau khi admin thực hiện thao tác.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee |
| File liên quan | frontend/src/pages/AdminDashboard.tsx |

#### 5.8. Ghi chú thêm
```text
Quản lý React State tốt giúp giảm thiểu số lượng truy vấn tải lại trang không cần thiết.
```

---

### Prompt số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-05 |
| Công cụ AI | Antigravity |
| Mục đích | Chặn truy cập API thông tin cá nhân đối với tài khoản LOCKED |
| Phân việc liên quan | Security / Backend |
| Mức độ sử dụng | Hỏi giải pháp |

#### 5.1. Prompt nguyên văn
```text
Hãy viết code Spring Boot chặn các tài khoản có trạng thái LOCKED truy cập API lấy thông tin profile cá nhân `/api/users/profile`, ném lỗi AccountLockedException.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Tài khoản bị khóa phải bị thu hồi ngay lập tức mọi quyền xem thông tin cá nhân và tài khoản để nâng cao bảo mật.
```

#### 5.3. Kết quả AI trả về
```text
Đoạn code trong UserService kiểm tra thuộc tính status của người dùng trước khi trả về dữ liệu profile.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Tích hợp bộ kiểm duyệt trạng thái tài khoản vào logic lấy thông tin người dùng.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Đóng gói logic kiểm tra thành một hàm dùng chung `validateUserStatus(user)` để gọi ở mọi API lấy tài nguyên khác.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | f3ed11f |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/user/UserService.java |

#### 5.8. Ghi chú thêm
```text
Validate trạng thái dùng chung giúp mã nguồn sạch sẽ, tránh lặp code.
```

---

### Prompt số 30

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-06 |
| Công cụ AI | ChatGPT |
| Mục đích | Viết câu lệnh JPQL đếm số lượng người dùng bị khóa |
| Phân việc liên quan | Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết câu truy vấn JPA count số lượng user có trạng thái LOCKED trong database để phục vụ API thống kê của Admin.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần thống kê số lượng tài khoản bị khóa trong tháng để đưa lên màn hình tổng quan của quản trị viên.
```

#### 5.3. Kết quả AI trả về
```text
Phương thức query method `long countByStatus(UserStatus status)` được Spring Data JPA sinh tự động từ interface.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm hàm đếm số lượng người dùng bị khóa của UserRepository.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Mở rộng phương thức để lọc thêm số lượng user bị khóa theo khoảng ngày (Between dates) giúp admin vẽ biểu đồ xu hướng.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 117c4c0 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/repository/UserRepository.java |

#### 5.8. Ghi chú thêm
```text
Cơ chế sinh truy vấn tự động của Spring Data JPA rất tiện lợi và chính xác.
```

---

### Prompt số 31

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-07 |
| Công cụ AI | Claude |
| Mục đích | Thiết kế React Hook useAuth tự động giải mã JWT và check LOCKED |
| Phân việc liên quan | Frontend / Security |
| Mức độ sử dụng | Hỏi giải pháp |

#### 5.1. Prompt nguyên văn
```text
Làm sao viết một React hook useAuth để đọc token từ LocalStorage, giải mã JWT lấy trường status, nếu phát hiện status là LOCKED thì tự động chuyển hướng giao diện người dùng về trang báo khóa?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần một bộ kiểm tra tự động ở giao diện client-side để điều hướng và chặn truy cập ngay khi phát hiện token của user bị khóa.
```

#### 5.3. Kết quả AI trả về
```text
Đoạn mã React hook sử dụng `jwt-decode` để parse JWT payload lấy thông tin trạng thái tài khoản.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm React Hook `useAuth` bảo vệ client-side.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Tự động gọi clear token và xóa session lưu trữ LocalStorage khi tài khoản bị khóa để bảo mật tuyệt đối.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee |
| File liên quan | frontend/src/hooks/useAuth.ts |

#### 5.8. Ghi chú thêm
```text
Giải mã JWT trực tiếp ở client-side giúp phản hồi giao diện cực kỳ nhanh chóng trước các thay đổi phân quyền.
```

---

### Prompt số 32

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-13 |
| Công cụ AI | Gemini |
| Mục đích | Viết câu truy vấn phân trang lấy danh sách bảng xếp hạng Global Leaderboard |
| Phân việc liên quan | Database / Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết câu truy vấn Spring Data JPA sử dụng Pageable để lấy danh sách người dùng sắp xếp theo tổng điểm (totalPoints) giảm dần, bỏ qua các tài khoản Admin và tài khoản bị LOCKED.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Xây dựng API bảng xếp hạng người dùng học tập, loại trừ các tài khoản quản trị và tài khoản vi phạm quy chế đang bị khóa.
```

#### 5.3. Kết quả AI trả về
```text
Truy vấn JPQL `Page<UserEntity> findByRoleNotAndStatusNotOrderByTotalPointsDesc(...)` phân trang dữ liệu xếp hạng.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm API xếp hạng người dùng của hệ thống.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Thay thế bằng truy vấn `@Query` tùy biến sử dụng JOIN FETCH để giải quyết lỗi truy vấn lặp N+1 của Hibernate.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1cb43ad |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/repository/UserRepository.java |

#### 5.8. Ghi chú thêm
```text
Tối ưu hóa JPQL giúp bảng xếp hạng chạy nhanh và tiết kiệm kết nối cơ sở dữ liệu.
```

---

### Prompt số 33

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-14 |
| Công cụ AI | Cursor |
| Mục đích | Thiết kế giao diện Global Leaderboard hiển thị huy chương Top 1, 2, 3 |
| Phân việc liên quan | UI Design / Frontend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Tạo trang Global Ranking hiển thị bảng xếp hạng người dùng trong hệ thống đẹp mắt sử dụng React, Tailwind CSS. Hiển thị thông tin avatar, username, tổng điểm và số bài tập đã giải. Có biểu tượng huy chương màu Vàng, Bạc, Đồng tương ứng cho Top 1, 2, 3.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần giao diện bảng xếp hạng Leaderboard hấp dẫn để thu hút học viên thi đua giải bài.
```

#### 5.3. Kết quả AI trả về
```text
Code React hiển thị bảng dữ liệu đẹp mắt và cách gán icon huy chương động dựa trên số thứ tự dòng.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm giao diện trang Leaderboard của website.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Bổ sung tính năng tìm kiếm tên user cụ thể và thiết kế làm nổi bật dòng thông tin của chính user đang xem.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1cb43ad |
| File liên quan | frontend/src/pages/Leaderboard.tsx |

#### 5.8. Ghi chú thêm
```text
Giao diện Tailwind giúp tối ưu hóa hiển thị bảng xếp hạng trên cả màn hình di động.
```

---

### Prompt số 34

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích | Cấu hình Spring Cache (@Cacheable) cho API Leaderboard tránh quá tải |
| Phân việc liên quan | Infrastructure / Backend |
| Mức độ sử dụng | Hỏi cấu hình |

#### 5.1. Prompt nguyên văn
```text
Làm sao cấu hình Spring Boot Caching sử dụng Redis Cache để lưu trữ kết quả của API lấy danh sách Top 100 Leaderboard trong 10 phút, tránh việc mỗi giây có hàng chục request gọi xuống DB?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Bảng xếp hạng được truy cập liên tục làm database bị chậm. Cần cache lại dữ liệu xếp hạng tạm thời.
```

#### 5.3. Kết quả AI trả về
```text
Cú pháp annotation `@Cacheable` và ví dụ cấu hình TTL cho Redis CacheManager.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Cấu hình cache Redis cho kết quả API Leaderboard.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Tích hợp `@CacheEvict` để xóa cache Leaderboard khi có thí sinh hoàn thành nộp bài được chấm điểm thành công.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1cb43ad |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/user/UserService.java |

#### 5.8. Ghi chú thêm
```text
Caching Redis giúp tăng tốc độ tải trang Global Leaderboard lên gấp 20 lần.
```

---

### Prompt số 35

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-20 |
| Công cụ AI | ChatGPT |
| Mục đích | Thiết kế thực thể JPA CourseModerationReport lưu báo cáo duyệt AI |
| Phân việc liên quan | Database Design / Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Thiết kế sơ đồ database JPA Entity cho bảng course_moderation_report trong Spring Boot: liên kết Many-to-One với Course, chứa các trường status (APPROVED, REJECTED), violationReason, confidenceScore (Double), transcription (Clob), và logs (Clob).
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần xây dựng bảng cơ sở dữ liệu lưu kết quả phân tích kiểm duyệt của AI (transcription, log, điểm tin cậy) đối với bài học của khóa học.
```

#### 5.3. Kết quả AI trả về
```text
Lớp Java JPA Entity có đầy đủ mapping thực thể và annotation `@Lob` cho các trường văn bản lớn.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Sử dụng làm thực thể lưu trữ kết quả kiểm duyệt của AI.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Chuyển đổi kiểu dữ liệu Clob sang `@Column(columnDefinition = "TEXT")` để tương thích mượt mà hơn trên PostgreSQL.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | c896ff8 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/entity/moderation/CourseModerationReport.java |

#### 5.8. Ghi chú thêm
```text
TEXT column definition hoạt động hiệu quả hơn `@Lob` trên Postgres đối với các chuỗi dài.
```

---

### Prompt số 36

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-23 |
| Công cụ AI | Cursor |
| Mục đích | Tích hợp thư viện WebClient gọi API OpenAI Whisper để dịch âm thanh |
| Phân việc liên quan | Backend / AI Integration |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết class Java Spring Boot sử dụng WebClient để gọi API OpenAI Whisper (`https://api.openai.com/v1/audio/transcriptions`) truyền tệp âm thanh dạng MultipartForm data, lấy kết quả văn bản trả về.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Gửi tệp âm thanh trích xuất từ video bài học sang API Whisper của OpenAI để nhận diện giọng nói (Speech-to-Text).
```

#### 5.3. Kết quả AI trả về
```text
Lớp Java tiện ích sử dụng WebClient và MultipartBodyBuilder đóng gói tệp tin nhị phân gửi đi.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm lớp `WhisperClient.java` trong module kiểm duyệt.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Cấu hình nạp API key an toàn từ file môi trường và xử lý bắt ngoại lệ khi API phản hồi mã lỗi 401 hoặc 429.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 79aaf56 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/WhisperClient.java |

#### 5.8. Ghi chú thêm
```text
WebClient của Spring Framework rất mạnh mẽ khi làm việc với các REST API bên thứ ba.
```

---

### Prompt số 37

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-24 |
| Công cụ AI | Gemini |
| Mục đích | Viết class Java trích xuất audio từ video bằng ProcessBuilder gọi ffmpeg |
| Phân việc liên quan | Backend / Audio Extraction |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Làm sao để gọi công cụ ffmpeg cài đặt trên hệ thống từ mã nguồn Java bằng ProcessBuilder để trích xuất file âm thanh dạng wav (tần số 16kHz, mono) từ một file video mp4 tạm thời?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần trích xuất âm thanh từ video bài học để thu nhỏ dung lượng và đồng bộ hóa tần số 16kHz trước khi gửi sang Whisper.
```

#### 5.3. Kết quả AI trả về
```text
Ví dụ code Java khởi tạo ProcessBuilder chạy lệnh ffmpeg và bắt luồng xử lý hoàn tất tiến trình hệ thống.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng tích hợp trong lớp dịch vụ trích xuất âm thanh AudioExtractorService.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Ghi nhận logs từ luồng error stream của tiến trình ffmpeg để tiện cho việc debug khi video lỗi định dạng.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | ab2b129 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/AudioExtractorService.java |

#### 5.8. Ghi chú thêm
```text
ProcessBuilder là giải pháp gọi tiện ích hệ thống tối ưu nhất từ Java ảo hóa.
```

---

### Prompt số 38

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Cursor |
| Mục đích | Cấu hình ffmpeg-service chia sẻ volume chung trong file docker-compose |
| Phân việc liên quan | DevOps / Infrastructure |
| Mức độ sử dụng | Hỏi cấu hình |

#### 5.1. Prompt nguyên văn
```text
Làm sao cấu hình một volume dùng chung (shared volume) giữa service Spring Boot và service ffmpeg chạy trong file docker-compose.yml để backend Java có thể ghi video tạm lên ổ đĩa và ffmpeg có thể đọc được?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Trong môi trường ảo hóa Docker, Spring Boot backend và ffmpeg-service cần truy cập chung một thư mục ổ đĩa tạm để trao đổi tệp video và âm thanh.
```

#### 5.3. Kết quả AI trả về
```text
Cấu hình volumes trong tệp docker-compose liên kết thư mục tạm của cả hai service.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng cấu hình chia sẻ đĩa tạm trong tệp docker-compose của dự án.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Thiết lập quyền truy cập đọc/ghi an sau, tránh để lộ tệp tin bài học ra ngoài máy host.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | ab2b129 |
| File liên quan | docker-compose.yml |

#### 5.8. Ghi chú thêm
```text
Shared volumes giúp tăng tốc độ xử lý do không cần truyền tệp nhị phân qua mạng HTTP nội bộ.
```

---

### Prompt số 39

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-26 |
| Công cụ AI | Claude |
| Mục đích | Sửa lỗi đầy ổ đĩa tạm (Disk Leak) do không xóa tệp video sau khi duyệt |
| Phân việc liên quan | Bug Fixing / Backend |
| Mức độ sử dụng | Hỏi cách sửa |

#### 5.1. Prompt nguyên văn
```text
Hệ thống chạy kiểm duyệt video một thời gian thì báo lỗi java.io.IOException: No space left on device. Tôi phát hiện thư mục tạm chứa rất nhiều file video .mp4 và file âm thanh .wav không tự động xóa sau khi AI duyệt xong. Làm sao xử lý triệt để?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Dung lượng ổ đĩa tạm của server tăng đột biến gây sập hệ thống do rác file video học tập không được dọn dẹp sau khi kiểm duyệt xong.
```

#### 5.3. Kết quả AI trả về
```text
Gợi ý viết hàm dọn dẹp gọi `Files.deleteIfExists` trong khối lệnh `finally` để đảm bảo file tạm luôn được giải phóng sau xử lý.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Tích hợp xóa tệp tạm trong khối lệnh finally của dịch vụ xử lý âm thanh.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Viết thêm một Scheduled cron job tự động quét dọn thư mục tạm mỗi đêm lúc 2 giờ sáng đề phòng trường hợp lỗi hệ thống đột ngột làm sót file rác.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9b46509 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/AudioExtractorService.java |

#### 5.8. Ghi chú thêm
```text
Dọn dẹp file tạm là quy tắc bắt buộc để duy trì tính sẵn sàng cao của hệ thống.
```

---

### Prompt số 40

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-27 |
| Công cụ AI | Antigravity |
| Mục đích | Viết logic so sánh kiểm duyệt nội dung bài học bằng API Gemini |
| Phân việc liên quan | Backend / AI Integration |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết phương thức Spring Boot gửi văn bản đã transcription lên Gemini API (gemini-2.5-flash) kèm theo system instructions để AI kiểm tra xem nội dung có vi phạm chính sách học thuật (như chứa từ khóa nhạy cảm, quảng cáo cá nhân, mã độc hại). Trả về kết quả JSON chứa trạng thái APPROVED/REJECTED và lý do cụ thể.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần tận dụng trí tuệ nhân tạo để quét văn bản chuyển âm của video bài giảng, tự động nhận diện hành vi vi phạm chính sách môn học.
```

#### 5.3. Kết quả AI trả về
```text
Mẫu code Spring Boot gọi API của Gemini kèm cấu hình `responseSchema` ép định dạng trả về là JSON sạch.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng cấu hình trong class client tương tác với Gemini.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Tự thiết lập bộ quy tắc kiểm duyệt (policy rules) bằng tiếng Việt tối ưu cho môi trường FPT.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | c896ff8 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/GeminiModerationClient.java |

#### 5.8. Ghi chú thêm
```text
Gemini Response Schema giúp tối ưu hóa việc phân tích chuỗi JSON trả về cho backend Spring Boot.
```

---

### Prompt số 41

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | ChatGPT |
| Mục đích | Sửa lỗi tương thích cú pháp compile Java 8 khi build dự án |
| Phân việc liên quan | Bug Fixing / Backend |
| Mức độ sử dụng | Hỏi cách sửa |

#### 5.1. Prompt nguyên văn
```text
Khi compile backend trên Jenkins server sử dụng JDK 8, hệ thống báo lỗi không tìm thấy phương thức List.of() và Map.of() trong class GeminiModerationClient. Làm sao sửa lỗi này để chạy tương thích trên Java 8?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Mã nguồn phát triển cục bộ sử dụng Java 9+ tiện ích khởi tạo list nhưng máy chủ Jenkins của trường/staging chạy Java 8 gây lỗi compile dự án.
```

#### 5.3. Kết quả AI trả về
```text
AI gợi ý thay đổi thành `Arrays.asList()` hoặc khởi tạo map kiểu cũ để hỗ trợ Java 8.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Refactor lại các cấu trúc list/map khởi tạo nhanh trong module kiểm duyệt AI.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Chuyển đổi tệp pom.xml nâng cấp môi trường đích của dự án lên Java 17 để tận dụng tối đa Virtual Threads, giải quyết tận gốc lỗi biên dịch.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9b46509 |
| File liên quan | backend/pom.xml |

#### 5.8. Ghi chú thêm
```text
Nâng cấp môi trường Java đích lên phiên bản mới nhất giúp hệ thống chạy nhanh hơn và code sạch hơn.
```

---

### Prompt số 42

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Gemini |
| Mục đích | Xây dựng cơ chế tự động chuyển trạng thái khóa học dựa trên báo cáo AI |
| Phân việc liên quan | Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết logic Service sau khi nhận kết quả kiểm duyệt từ AI: nếu AI báo REJECTED, tự động cập nhật trạng thái Course thành INACTIVE, lưu báo cáo kiểm duyệt và gửi email cảnh báo cho giảng viên tạo khóa học đó.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Sau khi AI phát hiện vi phạm, hệ thống cần tự động đình bản khóa học và gửi mail cảnh báo giảng viên ngay lập tức.
```

#### 5.3. Kết quả AI trả về
```text
Code xử lý logic cập nhật trạng thái khóa học và phương thức kích hoạt gửi thư cảnh báo.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm logic nghiệp vụ trong `CourseModerationService.java`.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Đính kèm nội dung đoạn transcription bị vi phạm vào nội dung email để giảng viên nắm rõ thông tin phản ánh.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1cb43ad |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/CourseModerationService.java |

#### 5.8. Ghi chú thêm
```text
Tự động hóa chuyển trạng thái giúp giảm gánh nặng kiểm duyệt thủ công cho admin.
```

---

### Prompt số 43

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Cursor |
| Mục đích | Sửa lỗi kết nối API Gemini 404 khi duyệt âm thanh bài học |
| Phân việc liên quan | Bug Fixing / Backend |
| Mức độ sử dụng | Hỏi cách sửa |

#### 5.1. Prompt nguyên văn
```text
Gemini API báo lỗi 404 Not Found khi gọi POST url: https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent mặc dù key hoạt động bình thường. Làm sao sửa lỗi URL?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Lỗi 404 làm tê liệt toàn bộ luồng chấm duyệt bằng Gemini API của ứng dụng.
```

#### 5.3. Kết quả AI trả về
```text
AI giải thích model `gemini-2.5-flash` yêu cầu gọi qua v1beta endpoint mới thay vì v1 cũ.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Cấu hình lại endpoint thành URL chứa `/v1beta/`.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Xây dựng cấu hình URL dự phòng (failover URL) để tự động gọi lại nếu cụm máy chủ vùng bị quá tải.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9b46509 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/GeminiModerationClient.java |

#### 5.8. Ghi chú thêm
```text
Tra cứu kỹ phiên bản mô hình giúp tránh được các lỗi URL không tồn tại của Google.
```

---

### Prompt số 44

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-30 |
| Công cụ AI | Claude |
| Mục đích | Thiết kế cơ chế dự phòng (Gemini Audio Fallback) khi ví OpenAI hết số dư |
| Phân việc liên quan | Backend / AI Integration |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
If OpenAI's Whisper API errors out with 400 or 429 due to insufficient balance, how do I automatically fallback to Gemini API to transcribe the audio file directly?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Tài khoản OpenAI có phí thường xuyên hết hạn mức hoặc số dư, hệ thống cần cơ chế tự động chuyển vùng dịch vụ sang Gemini API miễn phí để tiếp tục dịch âm thanh.
```

#### 5.3. Kết quả AI trả về
```text
Cấu trúc hàm gọi fallback bằng cách catch lỗi của Whisper và gọi Gemini audio upload.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm logic tự động chuyển đổi mô hình (failover) trong `CourseModerationService.java`.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Ghi nhận cảnh báo hết hạn mức (OpenAI balance limit) lên hệ thống quản trị logs để admin nạp tiền kịp thời.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 54f0d8a |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/CourseModerationService.java |

#### 5.8. Ghi chú thêm
```text
Fallback API giúp ứng dụng hoạt động ổn định 24/7 không bị phụ thuộc một nhà cung cấp duy nhất.
```

---

### Prompt số 45

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-30 |
| Công cụ AI | Antigravity |
| Mục đích | Tối ưu hóa WebClient tránh lỗi tràn bộ nhớ (LimitOnMaxInMemorySize) |
| Phân việc liên quan | Bug Fixing / Backend |
| Mức độ sử dụng | Hỏi giải pháp |

#### 5.1. Prompt nguyên văn
```text
Khi tôi gửi file audio lớn (.wav dung lượng ~40MB) qua WebClient, Spring Boot báo lỗi: org.springframework.core.io.buffer.DataBufferLimitException: Exceeded limit on max bytes to buffer: 262144. Khắc phục lỗi này thế nào?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Lỗi DataBufferLimitException sập API khi học viên tải lên các video bài giảng dung lượng lớn chứa thời lượng học lâu.
```

#### 5.3. Kết quả AI trả về
```text
Cú pháp cấu hình Bean WebClient nâng cao giới hạn `maxInMemorySize` bộ đệm của ExchangeStrategies.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng nâng giới hạn buffer lên 50MB cho client kết nối API ngoài.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Áp dụng giới hạn này độc lập cho các API file lớn để tránh gây tốn tài nguyên RAM hệ thống cho các luồng request REST thông thường.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 79aaf56 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/config/WebClientConfig.java |

#### 5.8. Ghi chú thêm
```text
Cấu hình buffer limit phù hợp giúp Spring Boot WebClient tải file dung lượng cao vô cùng ổn định.
```

---

### Prompt số 46

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-01 |
| Công cụ AI | ChatGPT |
| Mục đích | Viết unit tests sử dụng Mockito kiểm thử nghiệp vụ duyệt đơn Become Instructor |
| Phân việc liên quan | Testing / Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết lớp kiểm thử InstructorApplicationServiceTest sử dụng JUnit 5 và Mockito để test phương thức approveApplication(). Cần mock các hàm của InstructorApplicationRepository, UserRepository và kiểm tra xem vai trò của user có thực sự được đổi thành INSTRUCTOR sau khi duyệt hay không.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần đảm bảo luồng phê duyệt Become Instructor nâng quyền an toàn hoạt động chuẩn xác và không bị lỗi logic sau này khi refactor.
```

#### 5.3. Kết quả AI trả về
```text
Lớp test mẫu sử dụng Mockito mock các repository, thiết lập giả định và assert vai trò INSTRUCTOR.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Tích hợp lớp kiểm thử vào bộ unit tests của backend.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Viết thêm kịch bản ném lỗi không tìm thấy đơn đăng ký trong database để kiểm tra độ tin cậy của mã nguồn.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee |
| File liên quan | backend/src/test/java/com/swp391/coding_platform/service/moderation/InstructorApplicationServiceTest.java |

#### 5.8. Ghi chú thêm
```text
Mockito mock data giúp viết code test logic nghiệp vụ cô lập một cách nhanh gọn.
```

---

### Prompt số 47

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-01 |
| Công cụ AI | Cursor |
| Mục đích | Viết truy vấn JPQL tìm kiếm đơn Become Instructor theo trạng thái và ngày |
| Phân việc liên quan | Database / Backend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Viết hàm Spring Data JPA repository tìm kiếm danh sách InstructorApplication phân trang, lọc theo status (PENDING, APPROVED, REJECTED) và sắp xếp theo ngày nộp đơn giảm dần (mới nhất lên đầu).
```

#### 5.2. Bối cảnh khi viết prompt
```text
Admin cần lọc tìm kiếm đơn ứng tuyển theo trạng thái trên giao diện dashboard.
```

#### 5.3. Kết quả AI trả về
```text
Hàm `findByStatusOrderByCreatedAtDesc` nhận tham số Pageable tự động ánh xạ thành truy vấn.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Sử dụng làm truy vấn lọc đơn ứng tuyển của admin.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Tùy biến câu lệnh JPQL để nếu tham số status truyền vào bị NULL, hệ thống sẽ trả về toàn bộ đơn nộp không phân biệt trạng thái.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/repository/moderation/InstructorApplicationRepository.java |

#### 5.8. Ghi chú thêm
```text
Query method Spring Data JPA giúp lọc dữ liệu phân trang vô cùng nhẹ nhàng.
```

---

### Prompt số 48

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-02 |
| Công cụ AI | Gemini |
| Mục đích | Viết phương thức bất đồng bộ (@Async) cho tiến trình chạy AI kiểm duyệt |
| Phân việc liên quan | Backend |
| Mức độ sử dụng | Hỏi cấu hình |

#### 5.1. Prompt nguyên văn
```text
Làm sao cấu hình Spring Boot để hàm moderation bài học chạy bất đồng bộ bằng annotation @Async, giải phóng kết nối cho giảng viên ngay sau khi họ tải video bài học lên thành công mà không phải chờ AI phân tích (thời gian chạy Whisper & Gemini lâu)?
```

#### 5.2. Bối cảnh khi viết prompt
```text
Tác vụ gọi Whisper và Gemini kiểm duyệt video mất khoảng 10-20 giây. Cần chạy ngầm bất đồng bộ để tránh treo request tải lên bài giảng của giảng viên.
```

#### 5.3. Kết quả AI trả về
```text
Cấu hình `@EnableAsync` và annotation `@Async` trên hàm service xử lý AI.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng chạy bất đồng bộ luồng kiểm duyệt video bài học.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Định nghĩa một custom ThreadPoolTaskExecutor để giới hạn số lượng thread chạy đồng thời tránh gây nghẽn RAM/CPU máy chủ.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | c896ff8 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/config/AsyncConfig.java |

#### 5.8. Ghi chú thêm
```text
Lập trình bất đồng bộ giải phóng tài nguyên mạng client và nâng cao độ phản hồi của giao diện.
```

---

### Prompt số 49

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-02 |
| Công cụ AI | Claude |
| Mục đích | Viết script nạp dữ liệu mẫu (Seed SQL) cho tài khoản và báo cáo |
| Phân việc liên quan | Database / Testing |
| Mức độ sử dụng | Hỏi sinh dữ liệu |

#### 5.1. Prompt nguyên văn
```text
Viết script SQL chèn dữ liệu mẫu vào bảng users (gồm tài khoản học sinh, giảng viên và admin), bảng instructor_applications (các trạng thái đơn ứng tuyển) và bảng course_moderation_reports (các báo cáo kiểm duyệt có chứa transcription mẫu tiếng Việt) để phục vụ test tính năng.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Cần chuẩn bị bộ dữ liệu mẫu ban đầu để chạy thử ứng dụng và kiểm nghiệm tính năng lọc tài khoản khóa, duyệt đơn ứng tuyển, hiển thị bảng xếp hạng.
```

#### 5.3. Kết quả AI trả về
```text
Mẫu mã script INSERT SQL có liên kết khóa ngoại đầy đủ.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm nội dung khởi tạo database trong file `import.sql`.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Mã hóa lại mật khẩu mặc định của các tài khoản mẫu bằng thuật toán BCrypt để có thể đăng nhập thử trực tiếp từ giao diện React.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 7bc07b4 |
| File liên quan | backend/src/main/resources/import.sql |

#### 5.8. Ghi chú thêm
```text
Seed SQL giúp đồng bộ dữ liệu chạy thử nhanh chóng cho tất cả thành viên trong nhóm.
```

---

### Prompt số 50

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-02 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế giao diện hiển thị danh sách báo cáo kiểm duyệt (AI Reports UI) |
| Phân việc liên quan | UI Design / Frontend |
| Mức độ sử dụng | Hỏi sinh code |

#### 5.1. Prompt nguyên văn
```text
Thiết kế trang Admin xem danh sách báo cáo kiểm duyệt khóa học (Moderation Reports) có bộ lọc tìm kiếm tên khóa học, mức độ vi phạm, hiển thị điểm số tin cậy (confidence score) bằng thanh progress bar nhiều màu và nút xem đoạn transcription vi phạm.
```

#### 5.2. Bối cảnh khi viết prompt
```text
Admin cần một trang tổng hợp các kết quả kiểm duyệt khóa học của AI để dễ dàng rà soát khóa học bẩn.
```

#### 5.3. Kết quả AI trả về
```text
Mã nguồn React component bảng báo cáo kiểm duyệt AI, progress bar động Tailwind CSS thay đổi màu dựa trên mức độ vi phạm.
```

#### 5.4. Kết quả đã áp dụng vào bài
```text
Áp dụng làm giao diện trang quản lý báo cáo AI của Admin.
```

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến
```text
Thêm nút xem logs thô gửi từ Gemini để giúp admin có đầy đủ căn cứ khi xử lý tranh chấp từ phía giảng viên.
```

#### 5.6. Đánh giá chất lượng prompt
- [x] Prompt rõ ràng
- [x] Prompt có đủ bối cảnh
- [x] Prompt tạo ra kết quả tốt

#### 5.7. Minh chứng liên quan
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1cb43ad |
| File liên quan | frontend/src/pages/admin/ModerationReports.tsx |

#### 5.8. Ghi chú thêm
```text
Giao diện Tailwind giúp thể hiện các báo cáo kết quả AI phức tạp một cách trực quan, khoa học.
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
Chuẩn hóa các con số định lượng cụ thể của hệ thống (dung lượng file, Time Limit, Memory Limit), bổ sung thêm các ràng buộc nghiệp vụ (Business Rules) thực tế và chỉnh sửa tần suất sử dụng của các tính năng.
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
| Prompt giải thích kiến thức | 1 | "rabbitmq là dùng làm gì vậy, nó hoạt động thế nào?" |
| Prompt thiết kế giải pháp | 3 | "Tôi muốn thêm ffmpeg vào docker-compose để backend Java..." |
| Prompt sinh code mẫu | 7 | "Viết class Java gọi OpenAI Whisper API để nhận diện giọng nói..." |
| Prompt debug lỗi | 1 | "Lỗi kết nối Gemini API: 404 Not Found from POST..." |
| Prompt tối ưu code | 1 | "Hãy refactor code Spring Boot, tách các endpoint..." |
| Prompt viết báo cáo | 2 | "UC SPECIFICATION TEMPLATE... làm mỗi usecase cho tôi" |
| Prompt chuẩn bị thuyết trình | 0 | |
| Prompt khác | 0 | |

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
| Trịnh Hoàng Thiên Bảo | 02/07/2026 |
