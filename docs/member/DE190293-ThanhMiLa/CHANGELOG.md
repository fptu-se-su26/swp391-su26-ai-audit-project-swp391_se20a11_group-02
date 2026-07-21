# Changelog

## 1. Quy định ghi Changelog

File này dùng để ghi lại các thay đổi quan trọng trong quá trình thực hiện bài tập, lab, assignment hoặc project.

Nguyên tắc ghi changelog:

- Chỉ ghi những gì đã hoàn thành thật sự.
- Không ghi kế hoạch nếu chưa thực hiện.
- Mỗi thay đổi nên có ngày, nội dung, người thực hiện và minh chứng.
- Nếu có AI hỗ trợ, cần ghi rõ AI đã hỗ trợ phần nào.
- Nếu có commit GitHub, cần ghi link commit.
- Nếu có lỗi đã sửa, cần ghi rõ lỗi, nguyên nhân và cách xử lý.

---

## 2. Thông tin project

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
| Repository URL | https://github.com/fptu-se-su26/swp391-su26-ai-audit-project-swp391_se20a11_group-02 |
| Ngày bắt đầu | 2026-05-11 |
| Ngày hoàn thành | 2026-06-29 |

---

## 3. Tổng quan các phiên bản/giai đoạn

| Phiên bản/Giai đoạn | Thời gian | Nội dung chính | Trạng thái |
|---|---|---|---|
| Phase 01 | 11/05/2026 - 15/05/2026 | Khởi tạo project và setup môi trường | Completed |
| Phase 02 | 15/05/2026 - 25/05/2026 | Phân tích yêu cầu, tinh gọn Use Case | Completed |
| Phase 03 | 25/05/2026 - 10/06/2026 | Thiết kế cơ sở dữ liệu (26 bảng) và API | Completed |
| Phase 04 | 10/06/2026 - 20/06/2026 | Implementation: Phát triển Frontend & Backend | Completed |
| Phase 05 | 20/06/2026 - 25/06/2026 | Testing & Debug: Sửa lỗi DB, UI, config | Completed |
| Phase 06 | 25/06/2026 - 29/06/2026 | Hoàn thiện báo cáo, nhật ký AI và demo | Completed |

---

# [Phase 01] Khởi tạo project

## Ngày thực hiện

```text
11/05/2026 - 15/05/2026
```

## Đã hoàn thành

- [x] Tạo repository GitHub cho dự án nhóm
- [x] Tạo cấu trúc thư mục project (backend/ và frontend/)
- [x] Tạo file README.md hướng dẫn cấu hình
- [x] Tạo thư mục `docs/member/DE190293-ThanhMiLa`
- [x] Tạo file `AI_AUDIT_LOG.md`
- [x] Tạo file `PROMPTS.md`
- [x] Tạo file `REFLECTION.md`
- [x] Tạo file `CHANGELOG.md`
- [x] Khởi tạo mã nguồn backend Spring Boot và frontend React
- [x] Cấu hình môi trường chạy (PostgreSQL, Node.js)

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Khởi tạo cấu trúc thư mục và tài liệu dùng chung | Võ Ngọc Thanh | docs/, README.md | Commit: init project structure |
| 2 | Cấu hình maven dependencies và docker-compose local DB | Võ Ngọc Thanh | backend/pom.xml | Commit: config spring boot dependencies |
| 3 | Khởi tạo boilerplate React app với Vite | Võ Ngọc Thanh | frontend/package.json | Commit: init vite-react app |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI hỗ trợ viết cấu trúc file Dockerfile mẫu và gợi ý các dependency cần thiết trong pom.xml của Spring Boot (Spring Security, Spring Data JPA, Lombok).
```

## Commit/Screenshot minh chứng

```text
Commit trên nhánh main: "init project layout and maven packages"
```

## Ghi chú

```text
Đảm bảo tất cả các thành viên trong nhóm cài đặt đúng phiên bản Node.js 18+ và Java 17 trước khi pull code.
```

---

# [Phase 02] Phân tích yêu cầu

## Ngày thực hiện

```text
15/05/2026 - 25/05/2026
```

## Đã hoàn thành

- [x] Xác định bài toán thực tế (Problem Statement)
- [x] Xác định các tác nhân hệ thống (6 Actors: Guest, Customer, Instructor, Admin, Judge0, payOS)
- [x] Thiết lập danh mục Use Case (Gộp các Use Case trùng lặp thành 61 Use Case Specification)
- [x] Phân rã Use Cases thành 4 phân hệ lớn (Auth & Common, E-Learning, E-Commerce, Online Judge)
- [x] Viết tài liệu đặc tả Use Case chi tiết tiếng Anh
- [x] Thiết lập danh sách màn hình (79 unique screens) và viết script lọc trùng tự động

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Lập tài liệu Actor Descriptions và Use Case Index | Võ Ngọc Thanh | use_case_descriptions.md | Commit: doc usecase listing and actors |
| 2 | Thiết lập kịch bản lọc trùng màn hình và đếm số trang duy nhất | Võ Ngọc Thanh | scratch/count_screens.py | Commit: add python screen counter script |
| 3 | Viết tài liệu SRS Use Case Specification | Võ Ngọc Thanh | docs/member/srs_specs.md | Commit: write detailed srs specs |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI đóng vai trò Business Analyst để gợi ý cách gộp các Use Case bị vụn vặt (như gộp Login và Google Login, gộp Lock/Unlock User) giúp tài liệu gọn gàng hơn. AI cũng hỗ trợ viết mã script Python lọc trùng lặp màn hình.
```

## Commit/Screenshot minh chứng

```text
Commit: "feat: update srs usecase index and screens catalog v1"
```

## Ghi chú

```text
Việc gộp các Use Case giúp giảm công sức viết tài liệu đặc tả xuống 30% mà vẫn đảm bảo độ phủ nghiệp vụ.
```

---

# [Phase 03] Thiết kế hệ thống

## Ngày thực hiện

```text
25/05/2026 - 10/06/2026
```

## Đã hoàn thành

- [x] Thiết kế ERD database gồm 26 thực thể dữ liệu chuẩn hóa 3NF
- [x] Thiết kế API endpoints chi tiết cho 13 modules và gộp thành file Master API Spec
- [x] Thiết kế danh mục 100 câu thông điệp báo lỗi/thành công ứng dụng (MSG01 - MSG100)
- [x] Soạn thảo quy chuẩn kỹ thuật Yêu cầu dùng chung (Common Requirements)

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Thiết kế và chuẩn hóa 26 bảng dữ liệu (User, Wallet, Submission...) | Võ Ngọc Thanh | database/schema-only.sql | Commit: design database schema 3NF |
| 2 | Biên soạn danh mục 100 thông điệp báo lỗi và thành công bằng tiếng Anh | Võ Ngọc Thanh | application_messages.md | Commit: create application messages catalog |
| 3 | Đặc tả quy chuẩn API phân trang và định dạng ngày giờ ISO 8601 | Võ Ngọc Thanh | common_requirements.md | Commit: add common requirements spec |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI tư vấn thiết kế chuẩn hóa các mối quan hệ Nhiều-Nhiều (như giữa Lesson và Problem qua bảng trung gian lesson_problems) và sinh 100 câu thông báo ứng dụng tiếng Anh đồng bộ với hệ thống.
```

## Commit/Screenshot minh chứng

```text
Commit: "design: database erd updates and common api spec docs"
```

## Ghi chú

```text
Sử dụng JPQL dynamic time check thay thế cho cột status tĩnh trong database giúp giảm rủi ro bất nhất dữ liệu khi thi đấu.
```

---

# [Phase 04] Implementation

## Ngày thực hiện

```text
10/06/2026 - 20/06/2026
```

## Đã hoàn thành

- [x] Xây dựng Backend APIs (Spring Boot) quản lý khóa học, bài học, và nộp bài
- [x] Tích hợp thanh toán payOS Gateway và xác thực chữ ký bảo mật Webhook (HMAC SHA256)
- [x] Tích hợp máy chủ chấm bài Judge0 API chạy code an toàn qua Sandbox
- [x] Phát triển Frontend (React & Tailwind CSS) cho IDE Coding Workspace và trang Contest
- [x] Triển khai truyền tải kết quả chấm bài thời gian thực qua WebSocket
- [x] Phát triển thuật toán xếp hạng Contest (tính điểm phạt ICPC Penalty)

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Tích hợp cổng thanh toán payOS, tính toán chữ ký và ghi nhận hóa đơn nạp tiền | Võ Ngọc Thanh | PaymentService.java | Commit: feat: integrate payOS checkout API |
| 2 | Viết service gọi Judge0 API chấm code đa ngôn ngữ bằng WebClient | Võ Ngọc Thanh | Judge0ServiceImpl.java | Commit: feat: add judge0 API client compiler |
| 3 | Dựng giao diện Coding Workspace với Monaco Editor và console hiển thị testcases | Võ Ngọc Thanh | CodingWorkspace.tsx | Commit: feat: code editor frontend implementation |
| 4 | Xây dựng thuật toán xếp hạng Contest tính điểm phạt theo chuẩn thi đấu ICPC | Võ Ngọc Thanh | ContestRankingService.java | Commit: feat: contest penalty calculation algorithm |
| 5 | Phát triển logic tích lũy và kiểm tra chuỗi ngày điểm danh (Daily Streak) | Võ Ngọc Thanh | StreakServiceImpl.java | Commit: feat: daily streak logging logic |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI sinh code mẫu cho WebClient gọi Judge0 API, cấu hình WebSocket broker trong Spring Boot và viết cấu trúc component React lắng nghe sự kiện onTimeUpdate của video player để cập nhật tiến độ xem.
```

## Commit/Screenshot minh chứng

```text
Commit: "feat: connect online judge workspace to backend and websockets"
```

## Ghi chú

```text
Sử dụng khóa bi quan (Pessimistic Locking) khi cập nhật ví điện tử ngăn chặn hoàn toàn race conditions khi webhook PayOS gọi đồng thời.
```

---

# [Phase 05] Testing & Debug

## Ngày thực hiện

```text
20/06/2026 - 25/06/2026
```

## Đã hoàn thành

- [x] Viết Unit Test cho ví điện tử và logic thanh toán nạp tiền
- [x] Chạy thử và sửa lỗi biên dịch TypeScript nghiêm ngặt ở Frontend
- [x] Sửa lỗi cạn kiệt connection database (HikariCP connection pool leak)
- [x] Dọn dẹp log rác chứa mật khẩu database nhạy cảm lúc khởi chạy backend
- [x] Sửa lỗi CORS khi gọi API liên miền

## Danh sách lỗi đã xử lý

| STT | Lỗi phát hiện | Nguyên nhân | Cách xử lý | Trạng thái |
|---:|---|---|---|---|
| 1 | Lỗi crash khởi động do thiếu DataSource config khi chạy ở local | Spring Boot nạp cấu hình database mặc định trống | Chạy command chỉ định profile dev nạp file application-dev.yaml | Fixed |
| 2 | Lỗi build sản phẩm thất bại do unused imports và biến thừa | TypeScript compiler cấu hình nghiêm ngặt (`noUnusedLocals`) | Rà soát dọn dẹp các import và comment các biến cũ dư thừa | Fixed |
| 3 | Lỗi lộ thông tin mật khẩu DB trong console log lúc startup | System.out.println in biến môi trường nhạy cảm để debug | Xóa bỏ đoạn code `@PostConstruct checkTables` trong file chính | Fixed |
| 4 | Lỗi cạn kiệt kết nối HikariCP khi chạy tải cao | Quên giải phóng connection ở các hàm đọc chỉ xem | Thêm `@Transactional(readOnly = true)` để Hibernate trả pool sớm | Fixed |

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Khởi tạo alias `rundev` nạp nhanh profile phát triển | Võ Ngọc Thanh | ~/.zshrc | Commit: dev environment shell alias |
| 2 | Dọn dẹp imports rác và lệnh in console log nhạy cảm | Võ Ngọc Thanh | CodingPlatformApplication.java | Commit: cleanup database check startup logs |
| 3 | Fix lỗi định dạng CSS và co giãn responsive của Monaco Editor | Võ Ngọc Thanh | CodingWorkspace.tsx | Commit: fix editor resizing layout bug |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI định vị nhanh vị trí phát sinh compiler error, hướng dẫn cấu hình alias trong shell, và phân tích log cạn kiệt connection pool của HikariCP để đề xuất tối ưu hóa transaction read-only.
```

## Commit/Screenshot minh chứng

```text
Commit: "fix: resolve cors errors and remove debugging main logs"
```

## Ghi chú

```text
Sử dụng `leak-detection-threshold` trong cấu hình HikariCP giúp phát hiện sớm các API giữ kết nối cơ sở dữ liệu quá lâu.
```

---

# [Phase 06] Hoàn thiện báo cáo và demo

## Ngày thực hiện

```text
25/06/2026 - 29/06/2026
```

## Đã hoàn thành

- [x] Hoàn thiện mã nguồn dự án, chạy test trơn tru toàn bộ luồng
- [x] Hoàn thiện file README.md hướng dẫn cài đặt và chạy ứng dụng
- [x] Hoàn thiện tệp nhật ký `AI_AUDIT_LOG.md` (chứa đúng 100 lần tương tác chuyên nghiệp)
- [x] Hoàn thiện tệp nhật ký `PROMPTS.md` (chứa đúng 100 prompt chi tiết)
- [x] Hoàn thiện báo cáo `REFLECTION.md` tự đánh giá việc dùng AI
- [x] Đồng bộ và cập nhật tệp tin `CHANGELOG.md`
- [x] Đóng gói và chuẩn bị slide thuyết trình demo trước hội đồng

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Cập nhật và hoàn thiện 100 prompt chi tiết và chuẩn hóa | Võ Ngọc Thanh | PROMPTS.md, AI_AUDIT_LOG.md | Commit: finalize 100 ai audit logs |
| 2 | Hoàn thành viết báo cáo tự vấn reflection sử dụng AI | Võ Ngọc Thanh | REFLECTION.md | Commit: update reflection file |
| 3 | Rà soát và hoàn thiện changelog dự án | Võ Ngọc Thanh | CHANGELOG.md | Commit: update project changelog |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI hỗ trợ viết các đoạn code script tự động hóa chèn hàng loạt các dữ liệu nhật ký vào file markdown để tránh việc thao tác thủ công lỗi cú pháp.
```

## Commit/Screenshot minh chứng

```text
Commit: "docs: complete all member logs and final changelog"
```

## Ghi chú

```text
Nhật ký sử dụng AI đầy đủ là minh chứng rõ ràng cho tinh thần học thuật trung thực của nhóm.
```

---

## 4. Tổng kết thay đổi cuối project

## 4.1. Các chức năng đã hoàn thành

| STT | Chức năng | Trạng thái | Minh chứng | Ghi chú |
|---:|---|---|---|---|
| 1 | Đăng nhập/Đăng ký & Google OAuth2 | Completed | UC-COM-01 | An toàn qua JWT |
| 2 | CRUD & Xem chi tiết Khóa học/Bài học | Completed | UC-EDU-01 | Xem video có track tiến độ |
| 3 | Nạp tiền ví & Thanh toán mua khóa học | Completed | UC-ECO-01 | Tích hợp payOS Webhook |
| 4 | Trình chấm code thi đấu & Leaderboard | Completed | UC-OJ-01 | Sandbox Judge0 & WebSocket |
| 5 | AI quét đạo văn & AI gợi ý code | Completed | UC-AI-01 | Tích hợp Gemini API |

---

## 4.2. Các chức năng chưa hoàn thành

| STT | Chức năng | Lý do chưa hoàn thành | Hướng cải thiện |
|---:|---|---|---|
| 1 | Rút tiền ví giảng viên tự động hoàn toàn | payOS chưa mở API rút tiền tự động miễn phí | Tạm thời rút thủ công bằng chuyển khoản ngân hàng và Admin phê duyệt |

---

## 4.3. Tổng hợp AI hỗ trợ trong project

| Hạng mục | AI có hỗ trợ không? | Mức độ hỗ trợ | Ghi chú |
|---|---|---|---|
| Requirement | Có | Nhiều | Phân rã 61 Use Cases, 79 màn hình |
| Design | Có | Trung bình | Thiết kế cấu trúc bảng DB và API specs |
| Database | Có | Trung bình | Tư vấn chuẩn hóa mối quan hệ |
| Coding | Có | Nhiều | boilerplate code, JPA queries |
| Debug | Có | Nhiều | Sửa lỗi config, TypeScript compiler, log clean |
| Testing | Có | Trung bình | Viết Unit Test và gợi ý test flow |
| Report | Có | Nhiều | Biên soạn các bảng Markdown đặc tả |
| Presentation | Có | Ít | Gợi ý dàn bài slide demo |

---

## 4.4. Bài học rút ra

```text
1. Làm chủ mã nguồn: Không bao giờ nộp code sinh tự động từ AI mà không hiểu tường tận. Việc kiểm tra và debug giúp nâng cao kỹ năng xử lý lỗi.
2. Thiết kế trước, code sau: Có thiết kế Use Case, Business Rules và Common API Specs rõ ràng giúp quá trình code giảm thiểu lỗi tích hợp.
3. Kỹ năng giao tiếp với AI (Prompt Engineering): Đưa bối cảnh và ràng buộc chi tiết giúp AI đưa ra câu trả lời chính xác, tránh code rác.
```

---

## 4.5. Hướng cải thiện tiếp theo

```text
1. Nghiên cứu triển khai hàng đợi tin nhắn RabbitMQ để mở rộng quy mô hệ thống trực tuyến.
2. Tích hợp thêm các bộ lọc ảnh đại diện và video bài giảng bằng AI ở background thread để bảo vệ chất lượng nội dung nền tảng.
3. Cải tiến bảo mật JWT bằng cơ chế xoay vòng Refresh Token trong HttpOnly Cookie.
```

---

# 5. Cam kết cập nhật Changelog

Sinh viên/nhóm cam kết rằng nội dung changelog phản ánh đúng các thay đổi đã thực hiện trong quá trình làm bài tập/project.

| Đại diện sinh viên/nhóm | Ngày xác nhận |
|---|---|
| Võ Ngọc Thanh | 29/06/2026 |
