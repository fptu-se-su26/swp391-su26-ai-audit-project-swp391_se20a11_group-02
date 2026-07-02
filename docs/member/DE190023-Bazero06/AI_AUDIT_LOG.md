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
| Ngày hoàn thành | 12/06/2026 |

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
| Ngày sử dụng | 2026-06-03 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Thiết kế và phát triển tính năng bảng xếp hạng toàn cầu (Global Ranking) trên cả Frontend và Backend |
| Phần việc liên quan | Frontend / Backend / Database |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Viết câu truy vấn JPA phân trang lấy danh sách user sắp xếp theo điểm số tích lũy giảm dần và thiết kế giao diện bảng xếp hạng HTML/React đẹp có hiệu ứng hover.
```

#### 4.2. Kết quả AI gợi ý

```text
- Đề xuất hàm findTopUsers sử dụng Pageable trong Spring Boot Repository.
- Cấu trúc component React GlobalRanking hiển thị danh sách người dùng dưới dạng bảng (table) và Flexbox, kết hợp các hiệu ứng CSS hover mượt mà.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng câu truy vấn JPA phân trang ở phía Backend.
- Sử dụng khung cấu trúc bảng React và CSS styling cơ bản để render danh sách bảng xếp hạng trên UI.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Tinh chỉnh lại CSS để loại bỏ thanh cuộn ngang (horizontal scrollbar) không mong muốn trên các màn hình có độ phân giải nhỏ.
- Điều chỉnh logic hiển thị phân trang: chỉ hiển thị bộ phân trang (pagination control) khi tổng số trang thực tế lớn hơn 1.
- Sửa các lỗi biên dịch liên quan đến TypeScript trên React frontend.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | f3ed11f / cb0cb67 |
| File liên quan | frontend/src/pages/GlobalRanking.tsx, backend/src/main/java/com/swp391/coding_platform/repository/UserRepository.java |
| Screenshot | |
| Kết quả chạy/test | Build Frontend OK, API test OK |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Hiểu rõ cơ chế phân trang và sắp xếp dữ liệu lớn bằng JPA Pageable ở Backend.
- Rút ra bài học về tối ưu hóa giao diện người dùng (UI/UX) đảm bảo responsive tốt trên nhiều thiết bị mà không bị vỡ bố cục.
```

---

### Lần sử dụng AI số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-08 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Dịch trang Apply Instructor sang tiếng Anh và xây dựng logic tự động xóa đơn đăng ký bị từ chối sau 7 ngày |
| Phần việc liên quan | Frontend / Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Hãy viết một Spring Boot Scheduled task để tự động xóa các bản ghi InstructorApplication có trạng thái REJECTED sau 7 ngày kể từ ngày cập nhật.
```

#### 4.2. Kết quả AI gợi ý

```text
- Đề xuất cấu trúc lớp scheduler sử dụng annotation @Scheduled(cron = "0 0 0 * * *") để chạy vào nửa đêm mỗi ngày.
- Viết câu truy vấn JPA deleteByStatusAndUpdatedAtBefore để dọn dẹp các đơn bị từ chối cũ hơn 7 ngày.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng cấu trúc lớp @Component Scheduler và logic định nghĩa thời gian quét định kỳ.
- Sử dụng phương thức xóa tự động trong Repository.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Đồng bộ hóa múi giờ hệ thống (ZoneId) để đảm bảo thời điểm xóa khớp với cơ sở dữ liệu thực tế tại Việt Nam.
- Bổ sung điều kiện kiểm tra nghiêm ngặt trạng thái REJECTED để tránh xóa nhầm các đơn đăng ký đang ở trạng thái PENDING.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 117c4c0 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/scheduler/ApplicationCleanupScheduler.java |
| Screenshot | |
| Kết quả chạy/test | Unit test và scheduler chạy OK |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Học được cách quản lý các tác vụ ngầm định kỳ (Background/Scheduled Tasks) bằng Spring Scheduler.
- Nhận thức được tầm quan trọng của việc dọn dẹp dữ liệu rác định kỳ trong database để duy trì hiệu suất lưu trữ tốt.
```

---

### Lần sử dụng AI số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-09 |
| Công cụ AI |  Antigravity |
| Mục đích sử dụng | Thiết kế màn hình quản lý người dùng dành cho Admin và hộp thoại xác nhận khi khóa tài khoản |
| Phần việc liên quan | Frontend / Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Tạo giao diện quản lý user cho admin có chức năng khóa/mở khóa tài khoản, kèm modal xác nhận đẹp bằng React.
```

#### 4.2. Kết quả AI gợi ý

```text
- React Component AdminManageUser.tsx với cấu trúc bảng hiển thị thông tin user, phân trang, và modal popup xác nhận khóa tài khoản có CSS glassmorphism.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng mã giao diện modal xác nhận (confirmation dialog) và cấu trúc danh sách người dùng cơ bản.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Tách nút thao tác (Action) sang một cột riêng biệt bên phải, chỉ để cột Status hiển thị trạng thái thuần túy để tránh lỗi nhấp chuột nhầm.
- Dịch toàn bộ giao diện quản trị sang tiếng Anh để đảm bảo tính chuyên nghiệp của hệ thống.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | afbb398 / 289b418 |
| File liên quan | frontend/src/pages/admin/ManageUser.tsx |
| Screenshot | |
| Kết quả chạy/test | Giao diện React hiển thị và tương tác OK |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Hiểu được cách quản lý trạng thái modal (open/close state) đồng nhất trong React.
- Rút ra kinh nghiệm về việc bố trí các phần tử tương tác (nút khóa/mở khóa) hợp lý để tối ưu hóa trải nghiệm người dùng cuối.
```

---

### Lần sử dụng AI số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-10 |
| Công cụ AI |  Gemini |
| Mục đích sử dụng | Sửa lỗi kết nối và tích hợp Gemini API để tự động quét từ khóa chuyên ngành trong hồ sơ giảng viên (CV) |
| Phần việc liên quan | Backend / AI Integration |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Lỗi kết nối Gemini API: 404 Not Found from POST https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=... làm sao sửa lỗi này?
```

#### 4.2. Kết quả AI gợi ý

```text
- Chỉ ra lỗi do cấu hình sai URL API endpoint v1beta hoặc sai giá trị API Key trong tệp cấu hình .env. Hướng dẫn sửa lại URL endpoint chính thức của Google AI Studio.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng URL endpoint chính xác và cấu hình biến môi trường an toàn trong .env.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Sau khi bàn bạc và xem xét nghiệp vụ thực tế với nhóm, chúng tôi quyết định loại bỏ hoàn toàn việc duyệt CV tự động bằng AI để chuyển sang mô hình phê duyệt thủ công bởi Admin. Do đó, tôi đã refactor lại mã nguồn, loại bỏ logic quét CV của Gemini để giữ hệ thống hoạt động ổn định, bảo mật và gọn gàng nhất.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | cfb4a859 / 23f92ee |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/GeminiService.java |
| Screenshot | |
| Kết quả chạy/test | Loại bỏ AI duyệt CV thành công, backend chạy bình thường |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Học được cách quản lý và xử lý bảo mật cho các khóa API bên thứ ba.
- Bài học rút ra: Công nghệ AI rất hữu ích nhưng không phải lúc nào cũng phù hợp với quy trình nghiệp vụ cần tính bảo mật và kiểm chứng cao từ con người. Việc quyết định loại bỏ để chuyển sang duyệt thủ công giúp kiểm soát chất lượng đầu vào tốt hơn.
```

---

### Lần sử dụng AI số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-11 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Tự động làm mới quyền hạn (Role) và phiên đăng nhập của người dùng sau khi đăng ký Instructor thành công |
| Phần việc liên quan | Frontend / Security |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Làm sao để sau khi user gửi đơn đăng ký làm Instructor thành công thì quyền hạn trong session tự động cập nhật mà không cần bắt user phải logout rồi login lại?
```

#### 4.2. Kết quả AI gợi ý

```text
- Đề xuất gọi API làm mới token (/api/auth/refresh) ngay lập tức từ frontend sau khi nhận phản hồi đăng ký Instructor thành công. Hàm refresh này sẽ cập nhật lại JWT mới và lưu vào AuthContext/React Context.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng luồng trigger tự động refresh token trong React Context ngay sau khi hoàn tất đăng ký.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Xử lý các lỗi xung đột giao diện của Admin Dashboard khi chuyển quyền hạn tài khoản của người dùng.
- Bổ sung modal trạng thái tùy chỉnh để thông báo rõ ràng cho người dùng về việc quyền hạn của họ đã được cập nhật thành công.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 0ec7f01 / 7406f57 |
| File liên quan | frontend/src/context/AppContext.tsx, frontend/src/pages/BecomeInstructor.tsx |
| Screenshot | |
| Kết quả chạy/test | Role tự động cập nhật sau đăng ký OK, không cần reload |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Hiểu sâu hơn về luồng hoạt động của JWT Token và cơ chế Refresh Token trong hệ thống Spring Boot & React.
- Biết cách quản lý và đồng bộ hóa trạng thái bảo mật của Client-Server mà không làm gián đoạn trải nghiệm của người dùng.
```

---

### Lần sử dụng AI số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-12 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tinh chỉnh màn hình hiển thị tài khoản bị khóa cho user có trạng thái LOCKED, gỡ bỏ form khiếu nại, cấu hình email gmail liên hệ và thiết kế nút Quay lại để đăng xuất. |
| Phần việc liên quan | Frontend / Backend / Security |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
không thông báo ở đây, vẫn cho đăng nhập vào nhưng không cho truy cập chức năng nào hết, hiện ra thông báo tài khoản bạn đã bị lock, liên hệ gmail cho chúng tôi và có 1 nút back ra ngoài
```

#### 4.2. Kết quả AI gợi ý

```text
- Thiết kế màn hình full-screen overlay modal đẹp mắt kiểm tra trạng thái user.status === 'LOCKED' ở file Layout.tsx để chặn toàn bộ tương tác của user.
- Tích hợp email liên hệ nonstopcoding.support@gmail.com trên giao diện.
- Bổ sung logic lưu trữ các trường status, lockReason, lockAppeal vào session ở hàm refreshAuth (AppContext.tsx) tránh lỗi mất trạng thái khi tải lại trang (reload).
- Thêm nút "Go Back" kích hoạt hàm handleLogout để xóa session và chuyển hướng user về trang chủ.
- Hỗ trợ dịch toàn bộ giao diện màn hình khóa từ tiếng Việt sang tiếng Anh (Account Locked, Lock Reason, Support Gmail, Go Back).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng giao diện full-screen overlay modal ở Layout.tsx.
- Sử dụng cấu trúc lưu trữ và đồng bộ hóa thông tin user trong AppContext.tsx khi refresh token.
- Sử dụng bản dịch tiếng Anh cho giao diện.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Tự động kiểm tra và restart server backend để nạp code mới, đảm bảo API login/refresh và introspect hoạt động ổn định và không chặn JWT filter đối với tài khoản LOCKED.
- Đảm bảo tài khoản admin hoạt động bình thường mà không bị chuyển hướng hay hiển thị màn hình khóa.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee / 259058b |
| File liên quan | frontend/src/components/Layout.tsx, frontend/src/context/AppContext.tsx |
| Screenshot | docs/member/DE190023-Bazero06/screenshots/account_locked.png |
| Kết quả chạy/test | TypeScript compilation OK, Maven clean test OK |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Hiểu rõ cách xử lý bảo mật chung cho ứng dụng ở tầng Layout (Layout.tsx), giúp gom luồng chặn tài khoản bị khóa vào một nơi gọn gàng và hiệu quả.
- Nắm vững cách thức hoạt động của cơ chế lưu thông tin session ở Client và Server thông qua các request refresh token trong Spring Boot và React.
```

---

### Lần sử dụng AI số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Tái cấu trúc (Refactor) các API quản lý giảng viên của admin tách khỏi các controller chung để nâng cao tính bảo mật |
| Phần việc liên quan | Backend / Clean Code |
| Mức độ sử dụng | Hỗ trợ ít |

#### 4.1. Prompt đã sử dụng

```text
Hãy refactor code Spring Boot, tách các endpoint liên quan đến admin quản lý danh sách instructor từ InstructorController sang AdminDashboardController hoặc một controller admin riêng để dễ quản lý và phân quyền bảo mật.
```

#### 4.2. Kết quả AI gợi ý

```text
- Gợi ý di chuyển các phương thức GET/PUT liên quan đến xét duyệt instructor sang một class chuyên biệt AdminInstructorController.
- Thiết lập đường dẫn phân quyền class-level @RequestMapping("/api/admin/instructors").
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng cách thiết lập class-level định tuyến API và phân quyền của Admin.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Thực hiện điều chỉnh thủ công các import, xử lý lỗi biên dịch do thay đổi lớp đích và đảm bảo file cấu hình WebSecurityConfig của Spring Security cho phép phân quyền chuẩn xác theo định tuyến mới.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9d3c7d2 / 6933ac0 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/controller/admin/AdminDashboardController.java |
| Screenshot | |
| Kết quả chạy/test | Biên dịch Spring Boot OK, kiểm tra phân quyền API chính xác |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Nắm vững nguyên tắc Clean Code và Single Responsibility Principle (SRP) trong thiết kế Controller.
- Hiểu rõ cách tổ chức phân quyền API bảo mật theo vai trò người dùng hệ thống.
```

---

### Lần sử dụng AI số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI |  Gemini |
| Mục đích sử dụng | Thiết kế thực thể (JPA Entity) cho tính năng kiểm duyệt nội dung khóa học tự động (Course Moderation) |
| Phần việc liên quan | Backend / Database Design |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Thiết kế Entity JPA cho bảng course_moderation_report trong Spring Boot để lưu trữ kết quả kiểm duyệt AI cho khóa học gồm: khóa ngoại tới Course, trạng thái (APPROVED/REJECTED), lý do chi tiết, điểm đánh giá độc hại, và thời gian kiểm duyệt.
```

#### 4.2. Kết quả AI gợi ý

```text
- Mã lớp CourseModerationReportEntity với các annotation JPA đầy đủ như @Entity, @Table, các khóa ngoại ManyToOne và cấu trúc trường dữ liệu.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng mã thực thể JPA mẫu để ánh xạ cơ sở dữ liệu.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Giải quyết lỗi xung đột Bean WebClient sau khi tích hợp API AI.
- Sửa lỗi biên dịch Lombok liên quan đến OrderService và tinh chỉnh ánh xạ JPA Enum cho an toàn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1cb43ad |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/entity/course/CourseModerationReportEntity.java |
| Screenshot | |
| Kết quả chạy/test | Hibernate khởi tạo bảng thành công, không gặp lỗi DI |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Nắm vững cách thiết lập quan hệ bảng cơ sở dữ liệu bằng JPA/Hibernate.
- Rút ra bài học về xử lý xung đột cấu hình DI (Dependency Injection) trong Spring Framework khi có nhiều WebClient Bean.
```

---

### Lần sử dụng AI số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-18 |
| Công cụ AI |  Antigravity |
| Mục đích sử dụng | Tích hợp API OpenAI Whisper để nhận diện giọng nói trong video bài học và thiết lập cơ chế dự phòng (fallback) sang API Gemini khi OpenAI hết số dư |
| Phần việc liên quan | Backend / AI Integration |
| Mức độ sử dụng | AI sinh chính |

#### 4.1. Prompt đã sử dụng

```text
Viết class Java gọi OpenAI Whisper API để nhận diện giọng nói từ file âm thanh (.mp3) và tích hợp thêm phương thức dự phòng gọi sang Gemini API nếu OpenAI ném ra lỗi hoặc hết tiền (402/429).
```

#### 4.2. Kết quả AI gợi ý

```text
- Mã class AiModerationClient gọi OpenAI Whisper API thông qua Spring WebClient.
- Khối lệnh try-catch bắt lỗi HttpStatusException và tự động chuyển đổi sang gọi API Gemini 2.5 Flash để dịch và nhận diện âm thanh đầu vào.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng cấu trúc code gọi API OpenAI Whisper và logic chuyển đổi dự phòng (fallback logic) khi gặp sự cố.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Nâng cấp mô hình AI trong code lên gemini-2.5-flash.
- Điều chỉnh mã nguồn cho tương thích hoàn toàn với Java 8 để đáp ứng yêu cầu môi trường chạy production của dự án nhóm.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 79aaf56 / 54f0d8a / 9b46509 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/AiModerationClient.java |
| Screenshot | |
| Kết quả chạy/test | Test kiểm duyệt âm thanh chạy thực tế OK, cơ chế fallback hoạt động tốt |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Học được cách thiết kế hệ thống chịu lỗi (Fault-tolerant design) khi giao tiếp với các API bên ngoài.
- Hiểu rõ phương pháp xử lý file đa phương tiện (MultipartFile) và chuyển đổi định dạng dữ liệu cho API AI.
```

---

### Lần sử dụng AI số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-19 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Cấu hình dịch vụ ffmpeg-service trong Docker để trích xuất âm thanh từ video khóa học |
| Phần việc liên quan | DevOps / Docker Configuration |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Tôi muốn thêm ffmpeg vào docker-compose để backend Java có thể gọi trích xuất âm thanh từ video. Nên cấu hình dịch vụ docker-compose như thế nào để tối ưu và chia sẻ volume lưu trữ file tạm?
```

#### 4.2. Kết quả AI gợi ý

```text
- Đề xuất thêm một service ffmpeg-service sử dụng image ffmpeg trong docker-compose.yml.
- Cấu hình vùng lưu trữ chung (shared volume) để Java container lưu video tạm thời và ffmpeg container có thể đọc rồi xuất file âm thanh sang đó.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng cấu hình dịch vụ ffmpeg và cơ chế shared volume trong file docker-compose.yml.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Điều chỉnh lại đường dẫn tuyệt đối của thư mục tạm để phù hợp với hệ thống Windows đang phát triển thực tế, tránh các lỗi quyền ghi file (Permission denied) giữa các container.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | d5b9ed98 (trong lịch sử chat 19/06) |
| File liên quan | docker-compose.yml |
| Screenshot | |
| Kết quả chạy/test | Docker containers up thành công, trích xuất âm thanh qua volume chung OK |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Hiểu sâu sắc cách cấu hình và tương tác giữa các service Docker thông qua shared volume.
- Rút ra bài học về phân quyền tệp tin trong môi trường Linux Container chạy trên nền tảng Windows.
```

---

### Lần sử dụng AI số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-21 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Tích hợp ffmpeg trích xuất âm thanh ở backend và sửa lỗi Lombok annotation processing gây lỗi DI |
| Phần việc liên quan | Backend / Bug Fixing |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Sửa lỗi Lombok không tự động sinh Constructor cho các trường final sau khi merge code ở nhánh contest.
```

#### 4.2. Kết quả AI gợi ý

```text
- Đề xuất bổ sung @RequiredArgsConstructor của Lombok cho class ContestRankingRepository và kiểm tra tùy chọn bật Annotation Processing trong cấu hình compiler của IDE.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng annotation @RequiredArgsConstructor và cấu hình IDE được gợi ý.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Tự viết mã nguồn Java để gọi tiến trình ffmpeg chạy lệnh CLI trích xuất âm thanh từ tệp video tải lên, đảm bảo xóa tệp tạm thời sau khi xử lý để tránh đầy dung lượng đĩa cứng (disk leak).
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | ab2b129 / ee23b22 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/AudioProcessingService.java |
| Screenshot | |
| Kết quả chạy/test | Clean build Maven thành công, trích xuất âm thanh không còn rò rỉ file |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Học được cách khắc phục các lỗi biên dịch ẩn của Lombok khi kết hợp với Spring Dependency Injection.
- Nâng cao kỹ năng lập trình xử lý file I/O và kiểm soát tiến trình hệ điều hành (ProcessBuilder) trong Java.
```

---

### Lần sử dụng AI số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-22 |
| Công cụ AI |  ChatGPT |
| Mục đích sử dụng | Viết mã script SQL để tạo dữ liệu mẫu (Seed Data) nhằm kiểm thử giới hạn lọc nội dung của AI Moderation |
| Phần việc liên quan | Database / Testing |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng

```text
Viết câu lệnh SQL chèn 10 khóa học và mỗi khóa học có 5 bài học mẫu với các mô tả chứa cả từ ngữ nhạy cảm và bình thường để test tính năng duyệt khóa học AI.
```

#### 4.2. Kết quả AI gợi ý

```text
- Các câu lệnh INSERT chèn dữ liệu mẫu vào các bảng course, chapter, và lesson với dữ liệu thô ngẫu nhiên.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
- Sử dụng các câu lệnh INSERT mẫu vào bảng course và chapter để tạo cấu trúc dữ liệu thử nghiệm.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
- Tự biên soạn lại nội dung bài học bằng tiếng Anh và tiếng Việt thực tế, chứa các từ khóa nhạy cảm cụ thể để đánh giá độ nhạy của bộ lọc nội dung.
- Cấu hình lại liên kết video thực để kiểm nghiệm khả năng trích xuất âm thanh thực của Whisper/Gemini.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | df7375ba (trong lịch sử chat 22/06) |
| File liên quan | backend/src/main/resources/seed_data.sql |
| Screenshot | |
| Kết quả chạy/test | Dữ liệu mẫu nạp thành công vào database, chạy thử AI Moderation OK |
| Link video demo | |
| Ghi chú khác | |

#### 4.6. Nhận xét cá nhân/nhóm

```text
- Nắm rõ cấu trúc dữ liệu khóa học và cách thiết lập dữ liệu mẫu hiệu quả để thử nghiệm hệ thống.
- Học được cách xây dựng các bộ dữ liệu kiểm thử (test suite data) toàn diện phục vụ việc đánh giá hiệu suất và độ nhạy của các tính năng AI.
```

---

### Lần sử dụng AI số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-20 |
| Công cụ AI |  ChatGPT |
| Mục đích sử dụng | Thiết kế thực thể JPA `InstructorApplication` liên kết với bảng users |
| Phần việc liên quan | Database Design / Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Thiết kế thực thể JPA InstructorApplication.java trong Spring Boot để quản lý đơn ứng tuyển làm giảng viên của User. Entity này cần có quan hệ @ManyToOne với UserEntity, các trường: id (UUID), status (PENDING, APPROVED, REJECTED), cvUrl (String), major (String), reason (String), và các trường timestamps (createdAt, updatedAt).
```

#### 4.2. Kết quả AI gợi ý
Lớp Java JPA `InstructorApplication.java` định nghĩa các cột khóa ngoại `@JoinColumn(name = "user_id")` và sử dụng Enum cho trạng thái đơn ứng tuyển.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cấu trúc mapping JPA của thực thể và cách định nghĩa khóa ngoại liên kết với UserEntity.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Thêm annotation validation `@Size` và `@NotBlank` để đảm bảo sinh viên điền đầy đủ lý do ứng tuyển và chuyên ngành, tránh đơn trống.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | cfb4a859 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/entity/moderation/InstructorApplication.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Nắm vững cách thiết lập quan hệ Many-to-One trong Spring Boot JPA để liên kết đơn ứng tuyển với tài khoản người dùng.
```

---

### Lần sử dụng AI số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-21 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Cấu hình Spring Boot Controller tiếp nhận CV file upload của ứng viên |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết API Controller trong Spring Boot tiếp nhận đơn đăng ký Become Instructor qua POST request, nhận file CV dạng MultipartFile cùng với các thông tin text (major, reason) đóng gói trong DTO.
```

#### 4.2. Kết quả AI gợi ý
Đoạn code Controller nhận tham số `@RequestPart("file") MultipartFile` và `@RequestPart("data") InstructorApplicationRequest`.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cơ chế sử dụng `@RequestPart` để tiếp nhận đồng thời cả tệp nhị phân và dữ liệu văn bản JSON.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tự viết thêm logic validate định dạng file tải lên (chỉ cho phép .pdf, dung lượng tối đa 5MB) để bảo mật hệ thống.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 0ec7f01 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/controller/moderation/InstructorApplicationController.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được cách xử lý upload tệp đa phương tiện kết hợp JSON payload trong Spring Web MVC.
```

---

### Lần sử dụng AI số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-22 |
| Công cụ AI |  Claude |
| Mục đích sử dụng | Tích hợp Axios gọi Cloudinary REST API từ React Client để upload file CV trực tiếp |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Làm thế nào để viết hàm React upload trực tiếp một file PDF lên Cloudinary bằng REST API Axios mà không cần qua server backend, sử dụng Unsigned Upload Preset?
```

#### 4.2. Kết quả AI gợi ý
Đoạn code JavaScript gọi endpoint `https://api.cloudinary.com/v1_1/{cloud_name}/image/upload` bằng phương thức POST truyền Form-data chứa file và upload_preset.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cú pháp FormData truyền file sang Cloudinary và cách thiết lập cấu hình request header.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Ẩn thông tin `cloud_name` vào tệp môi trường React `.env` để bảo mật thông tin lưu trữ của dự án.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 0ec7f01 |
| File liên quan | frontend/src/pages/BecomeInstructor.tsx |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Sử dụng phương pháp Unsigned Upload giúp giảm tải băng thông cho server backend khi người dùng tải lên tệp tin lớn.
```

---

### Lần sử dụng AI số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-24 |
| Công cụ AI |  Gemini |
| Mục đích sử dụng | Xây dựng giao diện trang ứng tuyển giảng viên (Become Instructor Form) |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Tạo giao diện BecomeInstructor.tsx trong React sử dụng Tailwind CSS cho phép học viên điền chuyên môn, lý do ứng tuyển và tải file CV PDF trực quan, có hiển thị thanh tiến trình loading khi đang upload.
```

#### 4.2. Kết quả AI gợi ý
Cấu trúc form React sử dụng useState quản lý trạng thái tải lên, các input field phong cách Tailwind CSS bo góc và phần hiển thị thông báo thành công.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cách thiết kế bố cục UI hiện đại và quản lý trạng thái tải tệp kèm thanh loading indicator.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Bổ sung tính năng hiển thị trực quan tên file CV và tùy chọn xóa file để chọn lại trước khi bấm nút gửi chính thức.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 0ec7f01 |
| File liên quan | frontend/src/pages/BecomeInstructor.tsx |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Nắm rõ cách quản lý luồng dữ liệu bất đồng bộ giữa Client - Cloudinary - Backend để tạo trải nghiệm người dùng mượt mà.
```

---

### Lần sử dụng AI số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-25 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Viết API phê duyệt đơn ứng tuyển Instructor nâng quyền và làm mới Token của user |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết phương thức Spring Boot phê duyệt đơn đăng ký giảng viên: cập nhật trạng thái đơn thành APPROVED, thay đổi role của User liên kết từ STUDENT sang INSTRUCTOR trong một transaction, và ghi nhận logs.
```

#### 4.2. Kết quả AI gợi ý
Code hàm Service sử dụng `@Transactional` để cập nhật trạng thái `InstructorApplication` và vai trò của thực thể `UserEntity`.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cấu trúc logic cập nhật hai thực thể đồng thời dưới sự bảo trợ của Transaction context.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tích hợp thêm logic tự động gửi mail thông báo chúc mừng ứng viên đã trở thành giảng viên chính thức sau khi phê duyệt thành công.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/InstructorApplicationService.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được cách quản lý tính toàn vẹn dữ liệu (Data Integrity) qua Transaction khi thực hiện chỉnh sửa nhiều bảng đồng thời.
```

---

### Lần sử dụng AI số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-27 |
| Công cụ AI |  ChatGPT |
| Mục đích sử dụng | Sửa lỗi không nhận diện vai trò mới INSTRUCTOR trên frontend sau khi đơn được duyệt |
| Phần việc liên quan | Bug Fixing / Security |
| Mức độ sử dụng | Hỏi cách sửa |

#### 4.1. Prompt đã sử dụng
```text
Sau khi user được duyệt Become Instructor trên admin dashboard, trên giao diện của user đó vẫn hiển thị menu dành cho học sinh. Chỉ khi họ logout rồi login lại mới hiện các tính năng giảng viên. Làm sao giải quyết triệt để vấn đề này mà không bắt user logout?
```

#### 4.2. Kết quả AI gợi ý
AI khuyên viết API refresh token ở backend để frontend gọi cập nhật lại token lưu trong LocalStorage khi phát hiện trạng thái thay đổi hoặc định kỳ kiểm tra.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cơ chế tự động làm mới JWT token (Silent Refresh token) từ client-side để đồng bộ lại claims vai trò mới.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Thiết lập bộ lọc định vị ở Client để phát ra một sự kiện cập nhật ngữ cảnh `AuthContext` ngay khi nhận được payload token mới.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9d3c7d2 |
| File liên quan | frontend/src/pages/AdminDashboard.tsx |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Học được cách quản lý phiên đăng nhập động bằng JWT và refresh token để tối ưu trải nghiệm người dùng thực tế.
```

---

### Lần sử dụng AI số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-28 |
| Công cụ AI |  Gemini |
| Mục đích sử dụng | Viết API từ chối đơn ứng tuyển giảng viên (Reject Application) yêu cầu nhập lý do cụ thể |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết API từ chối đơn Become Instructor nhận ID của đơn và lý do từ chối (rejectReason). Cập nhật trạng thái thành REJECTED và lưu lý do vào thực thể InstructorApplication.
```

#### 4.2. Kết quả AI gợi ý
Phương thức Java cập nhật thực thể và lưu lý do từ chối vào cột tương ứng trong database.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Logic cập nhật trạng thái đơn ứng tuyển.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Thêm kiểm tra tính hợp lệ: nếu đơn đó đã được phê duyệt trước đó thì không được phép chuyển trạng thái ngược thành từ chối để tránh xung đột dữ liệu.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/InstructorApplicationService.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Nắm rõ cách thiết lập các luật chặn chuyển trạng thái (State Machine constraints) để giữ cho dữ liệu hệ thống luôn sạch.
```

---

### Lần sử dụng AI số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-29 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Thiết kế giao diện phê duyệt đơn giảng viên dành cho Admin (Application Review UI) |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Thiết kế trang Admin quản lý đơn ứng tuyển giảng viên dạng bảng danh sách có hiển thị: Họ tên, email, chuyên ngành, ngày ứng tuyển. Khi bấm vào xem chi tiết sẽ mở Modal hiển thị lý do ứng tuyển và nhúng file CV PDF xem trực tuyến.
```

#### 4.2. Kết quả AI gợi ý
Cú pháp React nhúng PDF bằng thẻ `<iframe src={cvUrl} width="100%" height="500px">` và các nút bấm Approve / Reject kích hoạt gọi API.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cách nhúng xem tài liệu PDF và bố cục Modal chi tiết đơn ứng tuyển của admin.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tự viết thêm form nhập lý do từ chối trực tiếp trên Modal khi Admin bấm nút Reject trước khi gửi yêu cầu lên server.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9d3c7d2 |
| File liên quan | frontend/src/pages/AdminDashboard.tsx |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Biết cách tối ưu hóa trải nghiệm thao tác của quản trị viên bằng cách tích hợp chức năng xem file trực tuyến không cần tải về máy.
```

---

### Lần sử dụng AI số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-30 |
| Công cụ AI |  Claude |
| Mục đích sử dụng | Thiết kế thực thể JPA `UserEntity` chứa các trường phục vụ tính năng khóa tài khoản |
| Phần việc liên quan | Database Design / Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Bổ sung các trường status (ACTIVE, LOCKED), lockReason (String) và lockAppeal (String) vào thực thể UserEntity.java để phục vụ nghiệp vụ khóa tài khoản và khiếu nại của user.
```

#### 4.2. Kết quả AI gợi ý
Khai báo thuộc tính mới trong class Java JPA và sử dụng `@Column` để thiết lập cột tương ứng trong database.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cơ sở thiết lập các cột thuộc tính bổ trợ của tài khoản.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Thêm logic khởi tạo giá trị mặc định cho status là `ACTIVE` khi đăng ký tài khoản mới để tránh các lỗi NullPointerException.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | f3ed11f |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/entity/UserEntity.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được phương pháp thiết lập trạng thái vận hành của tài khoản phục vụ công tác quản lý bảo mật.
```

---

### Lần sử dụng AI số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-01 |
| Công cụ AI |  ChatGPT |
| Mục đích sử dụng | Viết API Admin khóa tài khoản người dùng và lưu lý do khóa |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết API PUT /api/admin/users/{id}/lock nhận tham số lý do khóa (lockReason). Cập nhật trạng thái user thành LOCKED, lưu lý do khóa vào DB và phản hồi kết quả JSON.
```

#### 4.2. Kết quả AI gợi ý
Phương thức Spring Boot controller nhận ID đường dẫn và request body chứa lý do khóa, gọi Service cập nhật trạng thái thực thể.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Bố cục xử lý API và logic cập nhật trường thông tin trong database.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Bổ sung chặn không cho phép Admin tự khóa tài khoản của chính mình (chỉ số bảo mật cơ bản).

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 117c4c0 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/controller/admin/AdminUserController.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Học được cách quản lý các trường hợp tự hủy tài khoản quản trị khi lập trình API phân quyền hệ thống.
```

---

### Lần sử dụng AI số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-02 |
| Công cụ AI |  Gemini |
| Mục đích sử dụng | Viết API gửi khiếu nại mở khóa dành cho tài khoản bị khóa (Send Appeal API) |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết API /api/users/appeal cho phép tài khoản đang bị LOCKED gửi nội dung khiếu nại (lockAppeal). Cập nhật nội dung này vào thuộc tính lock_appeal của User trong database.
```

#### 4.2. Kết quả AI gợi ý
Endpoint xử lý yêu cầu khiếu nại của người dùng. Cho phép các user bị khóa truy cập endpoint này để gửi nội dung giải trình.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cấu trúc Controller tiếp nhận khiếu nại.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Cho phép endpoint này được gọi bởi các tài khoản bị khóa bằng cách bỏ chặn phân quyền cụ thể đối với đường dẫn `/api/users/appeal` trong WebSecurityConfig.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | afbb398 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/controller/user/UserAppealController.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được cách cấu hình ngoại lệ (white-list) trong Web Security Filter Chain cho các trường hợp đặc thù của tài khoản bị hạn chế.
```

---

### Lần sử dụng AI số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-04 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Sửa lỗi không hiển thị danh sách người dùng mới sau khi khóa do React state |
| Phần việc liên quan | Bug Fixing / Frontend |
| Mức độ sử dụng | Hỏi sửa lỗi |

#### 4.1. Prompt đã sử dụng
```text
Trong React, sau khi tôi gọi API khóa user thành công và đóng modal, danh sách user ngoài bảng vẫn hiển thị trạng thái cũ (ACTIVE) của người dùng đó. Tôi phải tải lại trang (F5) mới cập nhật đúng. Làm sao để bảng tự động hiển thị trạng thái mới?
```

#### 4.2. Kết quả AI gợi ý
AI khuyên cập nhật lại React State chứa danh sách user bằng cách thay thế user bị khóa bằng đối tượng mới nhận được từ API phản hồi, hoặc gọi lại hàm fetchUsers().

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Giải pháp thay thế phần tử trong mảng dữ liệu React state để render lại UI cục bộ ngay lập tức.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tận dụng cơ chế callback hàm `fetchUsers` để đồng bộ hoàn toàn dữ liệu phân trang từ backend sau khi admin thực hiện bất kỳ thao tác thay đổi nào.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee |
| File liên quan | frontend/src/pages/AdminDashboard.tsx |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Làm chủ được vòng đời render và quản lý state trong React để tạo ra giao diện mượt mà không cần F5.
```

---

### Lần sử dụng AI số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-05 |
| Công cụ AI |  Antigravity |
| Mục đích sử dụng | Chặn truy cập API thông tin cá nhân đối với tài khoản LOCKED |
| Phần việc liên quan | Security / Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Hãy viết code Spring Boot chặn các tài khoản có trạng thái LOCKED truy cập API lấy thông tin profile cá nhân `/api/users/profile`, ném lỗi AccountLockedException.
```

#### 4.2. Kết quả AI gợi ý
Đoạn code trong UserService kiểm tra thuộc tính `user.getStatus() == UserStatus.LOCKED` trước khi trả về dữ liệu profile.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Logic kiểm tra trạng thái hoạt động của user trước khi xuất thông tin.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Đưa phương thức kiểm tra này vào một hàm dùng chung `validateUserStatus(user)` để gọi tái sử dụng ở mọi API nghiệp vụ khác liên quan đến người học.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | f3ed11f |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/user/UserService.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được phương pháp thiết lập bộ kiểm tra trạng thái dùng chung để bảo vệ dữ liệu API an toàn.
```

---

### Lần sử dụng AI số 30

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-06 |
| Công cụ AI |  ChatGPT |
| Mục đích sử dụng | Viết câu lệnh JPQL đếm số lượng người dùng bị khóa (Locked Users Count) |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ ít |

#### 4.1. Prompt đã sử dụng
```text
Viết câu truy vấn JPA count số lượng user có trạng thái LOCKED trong database để phục vụ API thống kê của Admin.
```

#### 4.2. Kết quả AI gợi ý
Phương thức `long countByStatus(UserStatus status)` tự động sinh của Spring Data JPA.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Hàm count tiện lợi của Spring Data JPA repository.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Mở rộng phương thức để lọc thêm số lượng user bị khóa theo khoảng thời gian cụ thể (Between dates) để lập báo cáo tuần/tháng.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 117c4c0 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/repository/UserRepository.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Thấy được sự tối ưu của JPA Query method trong việc sinh truy vấn SQL đếm bản ghi nhanh chóng.
```

---

### Lần sử dụng AI số 31

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-07 |
| Công cụ AI |  Claude |
| Mục đích sử dụng | Thiết kế React Hook `useAuth` tự động giải mã JWT payload kiểm tra LOCKED trạng thái |
| Phần việc liên quan | Frontend / Security |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Làm sao viết một React hook useAuth để đọc token từ LocalStorage, giải mã JWT lấy trường status, nếu phát hiện status là LOCKED thì tự động chuyển hướng giao diện người dùng về trang báo khóa?
```

#### 4.2. Kết quả AI gợi ý
Đoạn code giải mã JWT token ở client-side sử dụng thư viện `jwt-decode` và điều hướng dùng `useNavigate` của React Router.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cơ chế decode claims trực tiếp trên client để theo dõi thuộc tính trạng thái tài khoản.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tích hợp thêm cơ chế tự động dọn dẹp (clear) token hết hạn và token của tài khoản bị khóa ra khỏi bộ nhớ để tăng độ bảo mật phiên làm việc.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 3fef6ee |
| File liên quan | frontend/src/hooks/useAuth.ts |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Học được phương pháp kiểm soát định tuyến phía Client bảo vệ giao diện trước các tài khoản bị thu hồi quyền.
```

---

### Lần sử dụng AI số 32

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-13 |
| Công cụ AI |  Gemini |
| Mục đích sử dụng | Viết câu truy vấn phân trang lấy danh sách bảng xếp hạng Global Leaderboard |
| Phần việc liên quan | Database / Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết câu truy vấn Spring Data JPA sử dụng Pageable để lấy danh sách người dùng sắp xếp theo tổng điểm (totalPoints) giảm dần, bỏ qua các tài khoản Admin và tài khoản bị LOCKED.
```

#### 4.2. Kết quả AI gợi ý
Hàm query JPQL `Page<UserEntity> findByRoleNotAndStatusNotOrderByTotalPointsDesc(...)` trong UserRepository.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cách viết JPQL loại trừ vai trò admin và trạng thái khóa khi xếp hạng.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tự chỉnh sửa câu lệnh truy vấn thành `@Query` tùy biến để giải quyết vấn đề nạp thiếu dữ liệu (N+1 query problem) bằng JOIN FETCH.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1cb43ad |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/repository/UserRepository.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu rõ phương pháp thiết lập câu truy vấn tối ưu hiệu suất nạp dữ liệu lớn cho tính năng cộng đồng Leaderboard.
```

---

### Lần sử dụng AI số 33

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-14 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Thiết kế giao diện Global Leaderboard hiển thị huy chương Top 1, 2, 3 |
| Phần việc liên quan | UI Design / Frontend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Tạo trang Global Ranking hiển thị bảng xếp hạng người dùng trong hệ thống đẹp mắt sử dụng React, Tailwind CSS. Hiển thị thông tin avatar, username, tổng điểm và số bài tập đã giải. Có biểu tượng huy chương màu Vàng, Bạc, Đồng tương ứng cho Top 1, 2, 3.
```

#### 4.2. Kết quả AI gợi ý
Thiết kế bảng CSS Tailwind phối màu hài hòa, các icon huy chương sử dụng SVG tùy biến dựa trên số thứ tự (index) của dòng dữ liệu xếp hạng.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Ý tưởng gán icon huy chương dựa trên chỉ số dòng và CSS màu sắc.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Bổ sung thanh tìm kiếm người dùng cụ thể trên bảng xếp hạng và highlight chính tài khoản của người dùng đang đăng nhập bằng dòng viền sáng xung quanh.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1cb43ad |
| File liên quan | frontend/src/pages/Leaderboard.tsx |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Tạo ra giao diện bảng xếp hạng sinh động góp phần thúc đẩy học viên cạnh tranh lập trình tích cực.
```

---

### Lần sử dụng AI số 34

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI |  Antigravity |
| Mục đích sử dụng | Cấu hình Spring Cache (`@Cacheable`) cho API Leaderboard tránh quá tải DB |
| Phần việc liên quan | Infrastructure / Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Làm sao cấu hình Spring Boot Caching sử dụng Redis Cache để lưu trữ kết quả của API lấy danh sách Top 100 Leaderboard trong 10 phút, tránh việc mỗi giây có hàng chục request gọi xuống DB?
```

#### 4.2. Kết quả AI gợi ý
Cách sử dụng annotation `@Cacheable(value = "leaderboard", key = "#pageable.pageNumber")` và cấu hình TTL cho Redis CacheManager.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cú pháp annotation cấu hình cache Spring Boot.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Bổ sung cơ chế tự động xóa cache (Cache Eviction) thông qua `@CacheEvict` khi một thí sinh được chấm điểm thành công để bảng xếp hạng luôn chính xác.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1cb43ad |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/user/UserService.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Học được giải pháp tối ưu hệ thống tải cao bằng cơ chế Caching dữ liệu động trung gian.
```

---

### Lần sử dụng AI số 35

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-20 |
| Công cụ AI |  ChatGPT |
| Mục đích sử dụng | Thiết kế thực thể JPA `CourseModerationReport` lưu báo cáo duyệt AI |
| Phần việc liên quan | Database Design / Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Thiết kế sơ đồ database JPA Entity cho bảng course_moderation_report trong Spring Boot: liên kết Many-to-One với Course, chứa các trường status (APPROVED, REJECTED), violationReason, confidenceScore (Double), transcription (Clob), và logs (Clob).
```

#### 4.2. Kết quả AI gợi ý
Lớp Java JPA Entity chứa các ánh xạ quan hệ và định nghĩa kiểu dữ liệu lớn `@Lob` cho transcription và logs của báo cáo kiểm duyệt.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cấu trúc khai báo các cột văn bản lớn `@Lob` lưu trữ toàn bộ nội dung chuyển âm giọng nói.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Chuyển đổi kiểu dữ liệu Clob sang `@Column(columnDefinition = "TEXT")` để tương thích hoạt động mượt mà hơn trên cơ sở dữ liệu PostgreSQL.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | c896ff8 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/entity/moderation/CourseModerationReport.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được sự khác biệt trong việc cấu hình kiểu dữ liệu văn bản lớn giữa các hệ quản trị database (H2, MySQL, PostgreSQL).
```

---

### Lần sử dụng AI số 36

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-23 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Tích hợp thư viện WebClient gọi API OpenAI Whisper để dịch âm thanh |
| Phần việc liên quan | Backend / AI Integration |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết class Java Spring Boot sử dụng WebClient để gọi API OpenAI Whisper (`https://api.openai.com/v1/audio/transcriptions`) truyền tệp âm thanh dạng MultipartForm data, lấy kết quả văn bản trả về.
```

#### 4.2. Kết quả AI gợi ý
Đoạn code Java cấu hình WebClient xây dựng BodyInserters truyền MultiValueMap chứa file resource âm thanh và cấu hình Authentication Bearer token.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cấu trúc chuyển đổi tệp cục bộ sang Multipart resource truyền qua WebClient.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tự tùy chỉnh cấu hình biến môi trường nạp OpenAI API key an toàn, xử lý bắt ngoại lệ khi API phản hồi mã lỗi 401 hoặc 429.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 79aaf56 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/WhisperClient.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Nắm vững cú pháp gọi các dịch vụ AI bên ngoài thông qua Client bất đồng bộ trong Spring.
```

---

### Lần sử dụng AI số 37

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-24 |
| Công cụ AI |  Gemini |
| Mục đích sử dụng | Viết class Java trích xuất audio từ video bài học bằng ProcessBuilder gọi ffmpeg |
| Phần việc liên quan | Backend / Audio Extraction |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Làm sao để gọi công cụ ffmpeg cài đặt trên hệ thống từ mã nguồn Java bằng ProcessBuilder để trích xuất file âm thanh dạng wav (tần số 16kHz, mono) từ một file video mp4 tạm thời?
```

#### 4.2. Kết quả AI gợi ý
Đoạn code Java khởi tạo ProcessBuilder truyền các đối số `ffmpeg -i {input} -ar 16000 -ac 1 -f wav {output}` và quản lý luồng chờ tiến trình hoàn tất.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cấu trúc lệnh gọi ffmpeg trích xuất âm thanh mono tần số 16kHz chuẩn cho Whisper.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Thêm cơ chế log bắt luồng lỗi (error stream) của tiến trình ffmpeg để gỡ lỗi khi tệp video đầu vào bị lỗi giải mã.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | ab2b129 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/AudioExtractorService.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được cách tương tác và gọi các tiến trình tiện ích hệ thống (System utility processes) từ mã Java.
```

---

### Lần sử dụng AI số 38

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Cấu hình ffmpeg-service chia sẻ volume chung trong file docker-compose |
| Phần việc liên quan | DevOps / Infrastructure |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Làm sao cấu hình một volume dùng chung (shared volume) giữa service Spring Boot và service ffmpeg chạy trong file docker-compose.yml để backend Java có thể ghi video tạm lên ổ đĩa và ffmpeg có thể đọc được?
```

#### 4.2. Kết quả AI gợi ý
Cấu hình thuộc tính `volumes` liên kết thư mục tạm `/app/tmp` giữa hai container chạy trong môi trường ảo hóa.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cách thiết lập volume mount trong cấu hình docker-compose.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Giới hạn quyền truy cập thư mục tạm (chỉ đọc/ghi nội bộ) để tránh rò rỉ thông tin khóa học nhạy cảm ra ngoài môi trường máy host.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | ab2b129 |
| File liên quan | docker-compose.yml |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Làm chủ kỹ năng cấu hình chia sẻ tài nguyên đĩa giữa các micro-services chạy bằng Docker.
```

---

### Lần sử dụng AI số 39

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-26 |
| Công cụ AI |  Claude |
| Mục đích sử dụng | Sửa lỗi đầy ổ đĩa tạm (Disk Leak) do không xóa tệp video sau khi chấm điểm |
| Phần việc liên quan | Bug Fixing / Backend |
| Mức độ sử dụng | Hỏi cách sửa |

#### 4.1. Prompt đã sử dụng
```text
Hệ thống chạy kiểm duyệt video một thời gian thì báo lỗi java.io.IOException: No space left on device. Tôi phát hiện thư mục tạm chứa rất nhiều file video .mp4 và file âm thanh .wav không tự động xóa sau khi AI duyệt xong. Làm sao xử lý triệt để?
```

#### 4.2. Kết quả AI gợi ý
AI khuyên sử dụng khối lệnh `finally` hoặc try-with-resources để đảm bảo gọi phương thức `Files.deleteIfExists(path)` dọn dẹp các tệp tạm bất kể tiến trình chạy thành công hay thất bại.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cơ chế xóa tệp chủ động trong khối lệnh finally giải phóng không gian lưu trữ đĩa.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tích hợp thêm một tác vụ Scheduled quét định kỳ (mỗi đêm lúc 2h sáng) để quét và xóa toàn bộ tệp tạm có tuổi đời lớn hơn 1 ngày đề phòng trường hợp ứng dụng bị crash đột ngột làm sót file rác.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 9b46509 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/AudioExtractorService.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Ý thức được tầm quan trọng của việc giải phóng tài nguyên đĩa/bộ nhớ hệ thống khi phát triển các tác vụ xử lý file nặng.
```

---

### Lần sử dụng AI số 40

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-27 |
| Công cụ AI |  Antigravity |
| Mục đích sử dụng | Viết logic so sánh kiểm duyệt nội dung bài học bằng API Gemini |
| Phần việc liên quan | Backend / AI Integration |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết phương thức Spring Boot gửi văn bản đã transcription lên Gemini API (gemini-2.5-flash) kèm theo system instructions để AI kiểm tra xem nội dung có vi phạm chính sách học thuật (như chứa từ khóa nhạy cảm, quảng cáo cá nhân, mã độc hại). Trả về kết quả JSON chứa trạng thái APPROVED/REJECTED và lý do cụ thể.
```

#### 4.2. Kết quả AI gợi ý
Cấu trúc payload gửi lên Gemini REST API, thiết lập trường `responseSchema` để bắt ép Gemini trả về dữ liệu đúng định dạng JSON mong muốn.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cấu hình JSON schema đầu ra cho API Gemini để thuận tiện parse trực tiếp sang lớp Java DTO.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Viết thêm bộ quy tắc tiếng Việt chuẩn cho hệ thống chấm duyệt của FPT để tăng độ chính xác của AI.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | c896ff8 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/moderation/GeminiModerationClient.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Phương pháp định hình response schema giúp loại bỏ hoàn toàn các lỗi sai định dạng chuỗi của AI khi tích hợp dịch vụ.
```

---

### Lần sử dụng AI số 41

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI |  ChatGPT |
```text
Viết câu truy vấn JPA lấy số lượng bài nộp thành công (ACCEPTED) chia cho tổng số lượng bài nộp của một bài tập để cập nhật trường tỷ lệ chấp nhận (acceptanceRate) trong thực thể Problem.
```

#### 4.2. Kết quả AI gợi ý
Truy vấn JPQL sử dụng hàm COUNT và điều kiện phân nhóm hoặc truy vấn lồng.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cơ sở logic đếm bản ghi thành công trên tổng số bản ghi trong bảng submissions.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tối ưu hóa bằng cách cập nhật không đồng bộ (bằng `@Async` event) sau khi bài làm được chấm xong để tránh kéo dài thời gian phản hồi của API chấm bài chính.

#### 4.5. Minh chứng
| Loại minh chứng | Offline |
|---|---|
| Link commit | a1a461a |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/service/contest/ContestSubmissionService.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được sự ảnh hưởng của các tác vụ tính toán dữ liệu lớn tới tốc độ xử lý thời gian thực.
```

---

### Lần sử dụng AI số 42

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI |  Gemini |
| Mục đích sử dụng | Viết Scheduled Job quét tự động chuyển đổi trạng thái cuộc thi (Contest Status Scheduler) |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết một Spring Boot cron task chạy mỗi phút quét qua bảng contests để cập nhật trạng thái: PENDING sang ONGOING nếu giờ hiện tại lớn hơn start_time, và ONGOING sang FINISHED nếu lớn hơn end_time.
```

#### 4.2. Kết quả AI gợi ý
Cấu hình `@Scheduled(cron = "0 * * * * *")` gọi hàm service cập nhật trạng thái cuộc thi bằng một câu truy vấn JPQL hàng loạt.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Định nghĩa cú pháp Cron định kỳ và logic chuyển đổi trạng thái.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Sử dụng câu truy vấn tối ưu dạng Bulk Update để thay đổi trạng thái hàng loạt thay vì lặp qua từng thực thể gây thắt cổ chai hiệu suất database.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | e86b930 |
| File liên quan | backend/src/main/java/com/swp391/coding_platform/scheduler/ContestLifecycleScheduler.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Học được cách tự động hóa kiểm soát trạng thái các thực thể có vòng đời thời gian trong hệ thống.
```

---

### Lần sử dụng AI số 43

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Sửa lỗi lệch múi giờ UTC giữa Server Docker và Postgres gây scheduler chạy sai giờ cuộc thi |
| Phần việc liên quan | Bug Fixing / DevOps |
| Mức độ sử dụng | Hỏi sửa lỗi |

#### 4.1. Prompt đã sử dụng
```text
Múi giờ trong container Docker chạy PostgreSQL bị lệch so với hệ thống Windows host làm các truy vấn trạng thái contest bằng `LocalDateTime.now()` bị chậm 7 tiếng. Cách đồng bộ múi giờ Docker container thế nào?
```

#### 4.2. Kết quả AI gợi ý
Khuyên cấu hình biến môi trường `TZ=Asia/Ho_Chi_Minh` hoặc chia sẻ volume `/etc/timezone` từ máy host vào các service trong docker-compose.yml.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cấu hình thuộc tính biến môi trường `TZ` cho PostgreSQL và Spring Boot service trong tệp docker-compose.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Chuyển đổi các cột lưu trữ ngày tháng sang dạng `Instant` (Timestamp with timezone) để đảm bảo dữ liệu thời gian thống nhất bất kể môi trường triển khai thực tế.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 75603c8 |
| File liên quan | docker-compose.yml |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Nhận thức sâu sắc vấn đề đồng bộ hóa thời gian toàn hệ thống trong kiến trúc ảo hóa container.
```

---

### Lần sử dụng AI số 44

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-30 |
| Công cụ AI |  Claude |
| Mục đích sử dụng | Thiết kế trang Dashboard tổng quan (Admin Overview) hiển thị các chỉ số KPIs chính |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Thiết kế giao diện dashboard dành cho quản trị viên hiển thị 4 thẻ KPI nổi bật: Tổng số học viên, Tổng số doanh thu nạp ví, Số lượng bài nộp chấm code, Số lượng cuộc thi đang chạy. Sử dụng icon đẹp từ Material Symbols.
```

#### 4.2. Kết quả AI gợi ý
Layout Grid 4 cột sử dụng Flexbox căn chỉnh thẻ, style màu sắc và hiệu ứng bo góc hiện đại.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Bố cục thẻ thông số và cách sắp đặt icon tăng trải nghiệm thị giác.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tự lập trình thêm biểu đồ cột phụ (sử dụng Recharts) thể hiện xu hướng tăng trưởng số lượng học viên đăng ký mới qua các tháng.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 6171e47 |
| File liên quan | frontend/src/pages/admin/AdminOverview.tsx |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được cách tổ chức thông tin trực quan giúp nhà quản trị dễ nắm bắt số liệu hoạt động.
```

---

### Lần sử dụng AI số 45

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-30 |
| Công cụ AI |  Antigravity |
| Mục đích sử dụng | Tối ưu hóa hiệu năng tải dữ liệu Admin Dashboard sử dụng Promise.all xử lý bất đồng bộ |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Trang Admin Dashboard ban đầu tải rất chậm do phải gọi tuần tự 4 API thống kê dữ liệu. Làm cách nào để thực hiện các yêu cầu này song song trong React để tối ưu hóa thời gian tải?
```

#### 4.2. Kết quả AI gợi ý
Hướng dẫn bọc các lệnh gọi API Axios trong phương thức `Promise.all([api1(), api2(), api3(), api4()])` nhằm đồng bộ tải song song.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cú pháp giải cấu trúc kết quả từ Promise.all và đặt loading state cho toàn trang.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Thêm cơ chế xử lý lỗi cục bộ: nếu 1 trong 4 API gặp lỗi, hệ thống vẫn hiển thị dữ liệu của 3 API còn lại kèm thông báo lỗi thẻ bị thiếu thay vì bị crash đơ màn hình.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 1deec50 |
| File liên quan | frontend/src/pages/AdminDashboard.tsx |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Học được kỹ năng lập trình xử lý song song các tác vụ I/O để tăng tốc độ phản hồi giao diện.
```

---

### Lần sử dụng AI số 46

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-01 |
| Công cụ AI |  ChatGPT |
| Mục đích sử dụng | Viết unit tests sử dụng Mockito kiểm thử nghiệp vụ ContestService |
| Phần việc liên quan | Testing / Backend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết lớp kiểm thử ContestServiceTest sử dụng JUnit 5 và Mockito để test phương thức registerUserToContest(). Cần mock các hàm của ContestRepository, UserRepository và kiểm tra ngoại lệ ném ra khi cuộc thi đã kết thúc.
```

#### 4.2. Kết quả AI gợi ý
Cấu trúc file test sử dụng annotation `@ExtendWith(MockitoExtension.class)`, `@Mock`, `@InjectMocks` và các câu lệnh assert ném lỗi.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cấu trúc thiết lập mock data ban đầu và các câu kiểm thử kịch bản ngoại lệ.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Viết thêm các kịch bản kiểm thử biên (Edge cases) như đăng ký sát giờ cuộc thi bắt đầu 1 giây để kiểm tra độ tin cậy của thuật toán so sánh thời gian.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 249ee9f |
| File liên quan | backend/src/test/java/com/swp391/coding_platform/service/contest/ContestServiceTest.java |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được tầm quan trọng của Unit Test trong việc duy trì độ ổn định của các hàm logic lõi khi thay đổi nâng cấp mã nguồn.
```

---

### Lần sử dụng AI số 47

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-01 |
| Công cụ AI |  Cursor |
| Mục đích sử dụng | Viết Dockerfile tối ưu kích thước image backend qua cơ chế Multi-stage Build |
| Phần việc liên quan | DevOps / Docker |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết Dockerfile cho dự án Spring Boot sử dụng Maven. Tôi muốn dùng cơ chế multi-stage build để tầng 1 build file JAR bằng maven-openjdk, sau đó tầng 2 chỉ chạy JAR trên image JRE siêu nhỏ.
```

#### 4.2. Kết quả AI gợi ý
Dockerfile mẫu với Stage 1 (`AS build`) chạy mvn clean package và Stage 2 dùng image `eclipse-temurin:17-jre-alpine` để chạy.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Thiết lập multi-stage Dockerfile giúp giảm dung lượng image từ ~800MB xuống dưới ~150MB.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Tự bổ sung cấu hình caching cho thư mục `.m2` của Maven trong Docker để đẩy nhanh tốc độ build ở những lần sau.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | d5b9ed98 (trong lịch sử chat Docker) |
| File liên quan | backend/Dockerfile |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Nắm vững quy trình đóng gói ứng dụng containerized nhẹ và an sau sẵn sàng triển khai cloud.
```

---

### Lần sử dụng AI số 48

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-02 |
| Công cụ AI |  Gemini |
| Mục đích sử dụng | Sửa lỗi cấu hình CORS khi Frontend React upload file CV lên Cloudinary |
| Phần việc liên quan | Bug Fixing / Frontend |
| Mức độ sử dụng | Hỏi sửa lỗi |

#### 4.1. Prompt đã sử dụng
```text
React Frontend gặp lỗi CORS: Access to XMLHttpRequest at 'https://api.cloudinary.com/v1_1/...' from origin 'http://localhost:5173' has been blocked by CORS policy khi upload file CV trực tiếp. Làm thế nào để sửa lỗi này?
```

#### 4.2. Kết quả AI gợi ý
Giải thích Cloudinary API cho phép gọi công khai bằng Client-side upload nhưng cần cấu hình unsigned upload preset trong bảng điều khiển Cloudinary. Hướng dẫn thiết lập preset và dùng đúng API URL.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cơ chế Unsigned Upload của Cloudinary để tránh lộ thông tin Secret Key trên giao diện Frontend React.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Cấu hình backend lưu vết lại URL file trả về sau khi tải lên thành công để gán vào thuộc tính cvUrl của hồ sơ đăng ký giảng viên.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 0ec7f01 |
| File liên quan | frontend/src/pages/BecomeInstructor.tsx |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Biết cách quản lý tải lên các tệp tin đa phương tiện lên hệ thống lưu trữ đám mây an toàn.
```

---

### Lần sử dụng AI số 49

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-02 |
| Công cụ AI |  Claude |
| Mục đích sử dụng | Viết script nạp dữ liệu mẫu (Seed SQL) cho danh mục ngôn ngữ và các cuộc thi lập trình mẫu |
| Phần việc liên quan | Database / Testing |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Viết script SQL chèn dữ liệu mẫu vào bảng programming_languages (C++, Java, Python, C) với các thông số cấu hình thời gian chạy và bộ nhớ mặc định, và chèn 5 cuộc thi lập trình mẫu.
```

#### 4.2. Kết quả AI gợi ý
Cú pháp INSERT SQL chuẩn chèn dữ liệu ngôn ngữ có gán các giới hạn mặc định (ví dụ: Time Limit 2000ms, Memory Limit 256MB).

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Cấu trúc câu lệnh chèn dữ liệu cho danh mục hệ thống.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Cập nhật ngày bắt đầu và kết thúc của các cuộc thi mẫu tự động dựa trên thời gian thực `CURRENT_TIMESTAMP` để đảm bảo khi chạy thử ứng dụng luôn có cuộc thi ở trạng thái PENDING và ONGOING.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 2c267bc |
| File liên quan | backend/src/main/resources/import.sql |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Hiểu được cách thiết lập môi trường dữ liệu ban đầu cho các danh mục cài đặt hệ thống.
```

---

### Lần sử dụng AI số 50

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-07-02 |
| Công cụ AI |  Antigravity |
| Mục đích sử dụng | Thiết kế và tối ưu hóa giao diện responsive cho trang giải quyết bài tập lập trình |
| Phần việc liên quan | UI Design / Frontend |
| Mức độ sử dụng | Hỗ trợ nhiều |

#### 4.1. Prompt đã sử dụng
```text
Làm cách nào thiết kế giao diện chia đôi màn hình (Split Screen) cho trang giải bài tập lập trình: bên trái hiển thị đề bài, bên phải hiển thị Monaco Editor và Console Output. Giao diện cần responsive ẩn sidebar/accordion trên các màn hình máy tính bảng và di động nhỏ để tăng tối đa không gian soạn thảo code.
```

#### 4.2. Kết quả AI gợi ý
Cách sử dụng CSS Flexbox hoặc Grid kết hợp lớp ẩn hiện `@media` (`md:flex-row flex-col`, `hidden md:block`) của Tailwind CSS để thay đổi bố cục cột thành dòng trên màn hình nhỏ.

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI
Bố cục chuyển đổi linh hoạt CSS Tailwind phục vụ responsive cho giao diện code.

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến
Thêm tính năng kéo giãn (Resizable Split Pane) sử dụng chuột ở desktop để người dùng tự do điều chỉnh độ rộng của vùng xem đề bài và vùng viết code theo ý thích.

#### 4.5. Minh chứng
| Loại minh chứng | Nội dung |
|---|---|
| Link commit | 72086d9 |
| File liên quan | frontend/src/pages/ProblemSolve.tsx |

#### 4.6. Nhận xét cá nhân/nhóm
```text
- Rút ra bài học quý giá về cách tối ưu hóa không gian hiển thị cho các ứng dụng có màn hình chuyên sâu, phục vụ tốt trải nghiệm người dùng cuối.
```

---


## 5. Bảng tổng hợp mức độ sử dụng AI

Đánh dấu mức độ AI hỗ trợ ở từng hạng mục.

| Hạng mục | Không dùng AI | AI hỗ trợ ít | AI hỗ trợ nhiều | AI sinh chính | Ghi chú |
|---|:---:|:---:|:---:|:---:|---|
| Phân tích yêu cầu |  |  | [x] |  | Xác định 19 use cases |
| Viết user story/use case |  |  |  | [x] | Soạn đặc tả use case mẫu |
| Thiết kế database |  | [x] |  |  | Thiết kế thực thể JPA |
| Thiết kế kiến trúc hệ thống |  |  | [x] |  | Thiết kế kiến trúc Moderation |
| Thiết kế giao diện |  |  | [x] |  | UI Global Ranking & Modal |
| Code frontend |  |  | [x] |  | Tích hợp UI React |
| Code backend |  |  | [x] |  | Xử lý Spring Boot |
| Debug lỗi |  | [x] |  |  | Sửa lỗi Lombok, API |
| Viết test case | [x] |  |  |  | Nhóm tự viết test |
| Kiểm thử sản phẩm |  | [x] |  |  | Chạy thử với seed data |
| Tối ưu code |  | [x] |  |  | Refactor API và dọn file tạm |
| Viết báo cáo |  |  | [x] |  | Viết Nhật ký và Prompt Log |
| Làm slide thuyết trình | [x] |  |  |  | Tự chuẩn bị |

---

## 6. Các lỗi hoặc hạn chế từ AI

Ghi lại các trường hợp AI trả lời sai, thiếu, chưa phù hợp hoặc sinh code không chạy.

| STT | Lỗi/hạn chế từ AI | Cách phát hiện | Cách xử lý/cải tiến |
|---:|---|---|---|
| 1 | AI gợi ý API Endpoint Gemini cũ dẫn đến lỗi kết nối 404 | Chạy thử ứng dụng backend nhận lỗi 404 Not Found từ Google API | Tra cứu tài liệu Google AI Studio mới và cấu hình lại URL v1beta chính xác |
| 2 | Code trích xuất video tạm của AI không dọn dẹp gây đầy ổ đĩa (Disk Leak) | Kiểm tra tài nguyên hệ thống thấy dung lượng ổ đĩa tạm tăng nhanh | Bổ sung khối lệnh try-with-resources và lệnh xóa file tạm thủ công sau khi xử lý |
| 3 | AI gợi ý các hàm WebClient xung đột với Bean WebClient có sẵn | Backend không khởi động được do trùng tên Bean WebClient | Định nghĩa rõ tên Bean bằng annotation @Qualifier |

---

## 7. Kiểm chứng kết quả AI

Mô tả cách sinh viên/nhóm kiểm tra lại kết quả do AI gợi ý.

Có thể bao gồm:

- Chạy thử chương trình và click kiểm thử giao diện thực tế.
- Viết các test case để chạy thử API kiểm duyệt khóa học.
- Nạp dữ liệu mẫu (Seed Data) có chứa từ khóa nhạy cảm và kiểm tra xem AI có tự động từ chối khóa học đó hay không.
- Kiểm tra dung lượng đĩa tạm và log hệ thống để đảm bảo tiến trình ffmpeg không để lại file rác.
- Đối chiếu các API endpoint mới với cấu hình bảo mật WebSecurityConfig để đảm bảo phân quyền chính xác.

### Nội dung kiểm chứng

```text
Chúng tôi đã nạp các bộ dữ liệu kiểm thử (Seed Data) đa dạng vào DB. Sau đó đăng nhập với quyền giảng viên để đăng tải video chứa cả nội dung sạch và nội dung vi phạm chính sách môn học. Hệ thống đã trích xuất âm thanh thành công qua Docker ffmpeg-service, Whisper nhận diện đúng giọng nói và Gemini tự động phát hiện, từ chối khóa học vi phạm chính xác. Không ghi nhận lỗi rò rỉ dung lượng ổ đĩa hay lỗi xung đột phân quyền API.
```

---

## 8. Đóng góp cá nhân hoặc đóng góp nhóm

### 8.1. Đối với bài cá nhân

Mô tả phần sinh viên tự làm, phần AI hỗ trợ và phần đã tự cải tiến.

```text
- Em (Trịnh Hoàng Thiên Bảo) đã tự thực hiện thiết kế cấu trúc JPA Entity lưu báo cáo kiểm duyệt, lập trình Spring Boot cho các API Moderation, thiết lập Docker Compose cho ffmpeg-service, và xây dựng giao diện React cho phần quản lý người dùng của admin và bảng xếp hạng Global Ranking.
- AI hỗ trợ em trong việc phác thảo nhanh cấu trúc lớp, các câu truy vấn JPA cơ bản và cấu trúc giao diện mẫu.
- Em đã tự tinh chỉnh các lỗi CSS, sửa lỗi dependency injection của Lombok, nâng cấp lên gemini-2.5-flash, và xây dựng cơ chế dọn dẹp file tạm để đảm bảo độ tin cậy của ứng dụng.
```

### 8.2. Đối với bài nhóm

| Thành viên | MSSV | Nhiệm vụ chính | Có sử dụng AI không? | Minh chứng đóng góp |
|---|---|---|---|---|
| Trịnh Hoàng Thiên Bảo | DE190023 | Làm các tính năng về: Quản lý người dùng, Apply Instructor, Bảng xếp hạng toàn cầu, và tính năng Kiểm duyệt khóa học tự động bằng AI (Whisper & Gemini) | Có | commit: f3ed11f, 117c4c0, afbb398, cfb4a859, 0ec7f01, 3fef6ee, 9d3c7d2, 1cb43ad, 79aaf56, ab2b129 |
| Võ Ngọc Thanh | DE190293 | Thiết kế UI khóa học, contest và scoreboard, cấu hình docker | Có | commit: c51c15d, a9d573d, f9c26c7, 27b0ef2, b4df495, f0fe7ae, 7efce0e |
| Nguyễn Văn Quảng | DE190094 | Làm trang tổng quan doanh thu và quản lý bài tập của Admin | Có | commit: 8a070a4, 3874b4e, 4678385 |
| Hồ Sĩ Tân | DE190307 | Thiết kế sơ đồ lớp và đặc tả yêu cầu hệ thống | Có | commit ở docs/member/DE190307-Hositan26 |
| Trần Duy Phương | DE190416 | Làm tính năng lưu trữ kết quả contest và bảng xếp hạng ICPC | Có | commit: a17a478, e69b5e7 |

---

## 9. Reflection cuối bài

### 9.1. AI đã hỗ trợ em/nhóm ở điểm nào?

```text
AI đã hỗ trợ em rất nhiều trong việc phác thảo nhanh cấu trúc các Use Case, viết code khung ở cả Frontend và Backend, gợi ý các giải pháp kỹ thuật phức tạp như tích hợp OpenAI Whisper API và tạo cơ chế dự phòng sang Gemini API, cũng như thiết lập container ffmpeg trong docker-compose.
```

### 9.2. Phần nào em/nhóm không sử dụng theo gợi ý của AI? Vì sao?

```text
Phần tự động duyệt CV bằng AI ở tính năng Apply Instructor. Ban đầu AI gợi ý quét từ khóa và chấm điểm tự động, nhưng sau khi xem xét nghiệp vụ thực tế, em thấy việc duyệt thủ công của Admin sẽ đảm bảo tính chính xác và bảo mật cao hơn, tránh trường hợp CV giả mạo lọt qua bộ lọc tự động.
```

### 9.3. Em/nhóm đã kiểm tra tính đúng đắn của kết quả AI như thế nào?

```text
Kiểm tra bằng cách chạy trực tiếp ứng dụng, debug từng dòng code, viết thêm seed data để kiểm nghiệm các kịch bản kiểm duyệt nội dung thực tế của Whisper và Gemini, đồng thời build và deploy thử bằng Docker để kiểm tra tính tương tác thực tế giữa các service.
```

### 9.4. Nếu không có AI, phần nào sẽ khó khăn nhất?

```text
Phần tích hợp các dịch vụ bên thứ ba như API Whisper/Gemini và xử lý đa phương tiện bằng ffmpeg trong môi trường Docker, do đòi hỏi cấu hình môi trường phức tạp và xử lý luồng tệp tin nhị phân lớn.
```

### 9.5. Sau bài tập/project này, em/nhóm học được gì về môn học?

```text
Hiểu sâu hơn về quy trình phát triển phần mềm thực tế, cách thiết kế hệ thống chịu lỗi và bảo mật tốt, cũng như cách tổ chức mã nguồn rõ ràng, phân rã các tính năng nghiệp vụ thành các micro-service hoặc controller thích hợp.
```

### 9.6. Sau bài tập/project này, em/nhóm học được gì về cách sử dụng AI có trách nhiệm?

```text
AI là công cụ hỗ trợ tuyệt vời để tăng tốc độ làm việc và cung cấp khung giải pháp ban đầu, nhưng lập trình viên luôn phải là người kiểm chứng cuối cùng về mặt logic nghiệp vụ, tối ưu hóa code và đảm bảo tính bảo mật cho hệ thống.
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
| Trịnh Hoàng Thiên Bảo | 02/07/2026 |
