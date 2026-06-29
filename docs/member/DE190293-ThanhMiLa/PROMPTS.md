# Prompt Log

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
| Ngày bắt đầu | 2026 - 05 - 11 |
| Ngày cập nhật gần nhất | 2026 - 05 - 18 |

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
- [x] Gemini
- [] Claude
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
| 1 | 2026-05-13 | Gemini | Tìm hiểu cấu trúc và quy trình viết tài liệu đặc tả yêu cầu phần mềm (SRS) | Mô tả về quy trình và các mục lục cần có cho 1 tài liệu SRS đầy đủ | Nắm rõ các chương mục chính và phân chia công việc viết SRS hiệu quả | Có | Tài liệu SRS của nhóm |
| 2 | 2026-05-13 | Gemini | Phân biệt và áp dụng đúng các quan hệ use case (include, extend, generalization) | Giải thích các quan hệ use case và đưa ra ví dụ minh họa cụ thể | Thiết kế chính xác sơ đồ Use Case cho các tính năng hệ thống | Có | Sơ đồ Use Case trong SRS |
| 3 | 2026-05-14 | Gemini | Nghiên cứu giải pháp tối ưu cho hệ thống chấm bài tự động (Online Judge Engine) | Đưa ra các option về xây dựng tính năng chấm bài tự động cho hệ thống lập trình | Quyết định sử dụng Judge0 API vì tính an toàn, bảo mật và tiết kiệm thời gian | Có | Tài liệu kiến trúc hệ thống / Backend service |
| 4 | 2026-05-15 | Gemini | Thiết lập quy trình làm việc nhóm hiệu quả với Git và giải quyết xung đột code | Đưa ra các option về cách sử dụng github làm việc nhóm và các tính năng cơ bản của github | Thống nhất Git Workflow (Git Flow) cho toàn bộ dự án nhóm | Có | Nhánh (branch) và lịch sử commit trên GitHub |
| 5 | 2026-05-16 | Gemini | Tạo giao diện trang danh sách và chi tiết khóa học (Course) | Cung cấp code mẫu React và Tailwind cho trang Course | Tạo thành công UI khóa học học lập trình | Có | Source code Frontend trang Course |
| 6 | 2026-05-16 | Gemini | Xây dựng giao diện Coding Workspace giống LeetCode | Gợi ý layout chia đôi màn hình với đề bài và code editor | Hoàn thiện giao diện nộp bài thi lập trình | Có | Source code giao diện Coding Workspace |
| 7 | 2026-05-17 | Gemini | Thiết kế giao diện danh sách thi đấu (Contest) và Leaderboard | Code mẫu UI cho danh sách cuộc thi và bảng xếp hạng | Xây dựng UI cho tính năng Contest | Có | Source code giao diện Contest |
| 8 | 2026-05-17 | Gemini | Xây dựng UI trang Profile với biểu đồ thống kê tiến độ học tập | Gợi ý dùng Recharts kết hợp Tailwind cho trang Profile | Trang cá nhân đẹp mắt với biểu đồ trực quan | Có | Source code giao diện Profile |
| 9 | 2026-05-18 | Gemini | Tạo hiệu ứng Loading Skeleton và hiển thị testcase màu sắc khi chấm bài | Code mẫu loading skeleton và render list testcase theo status | Trải nghiệm nộp bài mượt mà, phản hồi rõ ràng | Có | UI cải thiện ở phần Submit |
| 10 | 2026-05-19 | Gemini | Tìm hiểu cách tích hợp thanh toán bằng VietQR với payOS | Hướng dẫn cách thức hoạt động và luồng tích hợp cổng thanh toán payOS | Hiểu rõ quy trình tạo link thanh toán, xử lý webhook từ payOS | Có | Tài liệu thiết kế hệ thống thanh toán |
| 11 | 2026-05-20 | Gemini | Hướng dẫn code setup tích hợp payOS | Code mẫu Java Spring Boot và React để tạo link thanh toán payOS | Tạo thành công module thanh toán cơ bản | Có | Source code Backend và Frontend phần Checkout |
| 12 | 2026-05-21 | Gemini | Dùng ngrok để test webhook của payOS ở local | Cách cài đặt và sử dụng ngrok để expose port local cho webhook payOS | Test thành công webhook cập nhật trạng thái đơn hàng khi thanh toán | Có | File cấu hình webhook và log chạy ngrok |
| 13 | 2026-06-28 | Antigravity | Tối ưu hóa danh sách Use Case và phân chia lại các Use Case bị trùng lặp | Đề xuất gộp các Use Case trùng lặp hoặc có quan hệ chặt chẽ và chia thành 4 phân hệ chính | Danh sách 61 Use Case tinh gọn, hợp lý phân bổ trên 4 phân hệ | Có | Mục lục Use Case trong SRS / tài liệu Use Case |
| 14 | 2026-06-28 | Antigravity | Thống kê số lượng màn hình duy nhất từ danh sách đầu vào thô | Viết script Python để lọc trùng, chuẩn hóa tên và đếm số màn hình duy nhất từ danh sách 94 màn hình | Script Python đếm chính xác còn 79 màn hình duy nhất | Có | File script count_screens.py / Danh sách Screen trong SRS |
| 15 | 2026-06-29 | Antigravity | Phân tích mã nguồn backend để trích xuất bảng Business Rules | Phân tích WalletService, ContestRanking, và AI Moderation của Spring Boot để trích xuất Business Rules | Danh sách 55 quy tắc nghiệp vụ phân rã chi tiết | Có | File business_rules.md / Phụ lục SRS |
| 16 | 2026-06-29 | Antigravity | Gộp bảng Business Rules và chuyển ngữ toàn bộ sang tiếng Anh chuyên ngành | Gộp tất cả các bảng Business Rules và dịch sang tiếng Anh sử dụng thuật ngữ chuẩn (Pessimistic Lock, BCrypt...) | Bảng tổng hợp Business Rules tiếng Anh chuyên nghiệp | Có | File business_rules.md |
| 17 | 2026-06-29 | Antigravity | Thiết kế danh mục 100 thông điệp ứng dụng (Application Messages Catalog) bằng tiếng Anh | Thiết kế 100 mã thông điệp (MSG01-MSG100) gồm lỗi, cảnh báo, thông báo thành công cho hệ thống | Catalog 100 thông điệp ứng dụng tiếng Anh đầy đủ | Có | File application_messages.md |
| 18 | 2026-06-29 | Antigravity | Soạn thảo tài liệu Yêu cầu dùng chung (Common Requirements) về API và Datetime | Đặc tả quy chuẩn phân trang API, ISO 8601 UTC Datetime và cấu trúc API Response Envelope | Tài liệu Common Requirements chi tiết cho các lập trình viên | Có | File common_requirements.md |
| 19 | 2026-06-29 | Antigravity | Rà soát và thống kê chi tiết Use Case của Admin không sử dụng từ khóa "Manage" | Phân tích mã nguồn các Admin Controller để trích xuất danh sách Use Case hành động cụ thể | Danh sách Use Case Admin tinh gọn, hành động rõ ràng không chứa từ "Manage" | Có | Tài liệu SRS / Sơ đồ Use Case |
| 20 | 2026-06-29 | Antigravity | Phân rã và thiết lập mối quan hệ UML cho phân hệ chấm bài (Judge0) và thanh toán (PayOS) | Đề xuất phân rã Use Case và xác định quan hệ <<include>>, <<extend>> cho Judge0/PayOS | Sơ đồ Use Case phân hệ thanh toán và chấm bài đúng chuẩn UML | Có | Sơ đồ phân hệ PayOS/Judge0 trong SRS |
| 21 | 2026-06-29 | Antigravity | Thiết lập bảng đặc tả Actor, Use Case chi tiết và 26 thực thể cơ sở dữ liệu cho tài liệu SRS | Soạn thảo 3 bảng Markdown đặc tả Actor, 80+ Use Case và 26 thực thể cơ sở dữ liệu bằng tiếng Anh | Catalog Actor, Use Case và Entity đầy đủ bằng tiếng Anh kỹ thuật | Có | actor_descriptions.md, use_case_descriptions.md, entity_descriptions_v2.md |
| 22 | 2026-06-29 | Antigravity | Tư vấn thiết kế ERD và chuẩn hóa mối quan hệ giữa các thực thể hệ thống | Giải đáp thắc mắc về chuẩn hóa cơ sở dữ liệu 3NF cho nộp bài, testcase và bài học | Sơ đồ ERD chuẩn hóa hoàn chỉnh, loại bỏ quan hệ dư thừa | Có | Sơ đồ ERD / SQL DDL Script |
| 23 | 2026-06-27 | Antigravity | Sửa lỗi không khởi chạy được Backend Spring Boot do thiếu cấu hình Database | Phân tích nguyên nhân lỗi thiếu cấu hình DataSource và hướng dẫn các cách xử lý chi tiết | Giải thích cơ chế tự động cấu hình và cách nạp profile `dev` để chạy ứng dụng | Có | File application-dev.yaml / Log chạy dự án |
| 24 | 2026-06-27 | Antigravity | Cấu hình phím tắt (alias) Zsh trên macOS và tìm hiểu các loại Shell | Hướng dẫn tạo alias trong file ~/.zshrc, chạy lệnh source, và so sánh các shell phổ biến | Thiết lập alias `rundev` chạy nhanh Spring Boot và hiểu rõ về Zsh, Bash, PowerShell | Có | File ~/.zshrc |
| 25 | 2026-06-27 | Antigravity | Loại bỏ log rác (quét danh sách bảng, in mật khẩu DB) và phân tích log SQL Hibernate | Rà soát CodingPlatformApplication.java để xóa code in log bảng và env nhạy cảm, giải thích log DDL Hibernate | Xóa bỏ thành công các log thừa và hiểu rõ bản chất log DDL Hibernate | Có | File CodingPlatformApplication.java |
| 26 | 2026-06-28 | Antigravity | Quét mã nguồn Backend và trích xuất tài liệu đặc tả API cho 13 phân hệ | Phân tích toàn bộ Controller, DTO, Request/Response để tự động tạo tài liệu API chuẩn Markdown | 12 file Markdown đặc tả chi tiết toàn bộ các API của Backend | Có | Các file api_*.md trong artifacts |
| 27 | 2026-06-28 | Antigravity | Viết script Python tổng hợp 12 file tài liệu API thành một file duy nhất | Nối nội dung 12 file .md thành file `api_full_specification.md` và di chuyển vào `backend/docs` | File tổng hợp Master API duy nhất lưu tại backend/docs | Có | File `backend/docs/api_full_specification.md` |
| 28 | 2026-06-28 | Antigravity | Viết Meta-prompt để hướng dẫn AI khác dịch và format tài liệu API ra file Word | Cung cấp prompt hoàn chỉnh có cấu trúc để yêu cầu AI tạo file .docx bằng tiếng Anh với căn lề chuẩn | Đoạn prompt chi tiết giúp tạo file Word tự động | Có | File `api_full_specification.md` |
| 29 | 2026-06-29 | Antigravity | Thiết kế Cấu trúc Database cho Hệ thống Ví điện tử (Wallet) chống lỗi Double-spending | Thiết kế database ví điện tử với ràng buộc chống double-spending và thiết kế bảng transaction history. | AI gợi ý thiết kế bảng `wallets` với khóa ngoại trỏ tới `users` kèm ràng buộc CHECK balance >= 0, và bảng `wallet_transactions` lưu mã tham chiếu duy nhất (transaction_ref) để thực hiện đối soát. | Có |  |
| 30 | 2026-06-29 | Antigravity | Tích hợp thanh toán PayOS và thiết kế cơ chế xử lý Webhook bất đồng bộ có tính bất biến | Thiết kế API Webhook nhận callback từ payOS có cơ chế chống trùng lặp (Idempotency). | AI hướng dẫn tạo endpoint nhận POST webhook, kiểm tra chữ ký PayOS bằng secret key, sau đó sử dụng bảng `processed_webhooks` lưu mã đơn hàng để chặn xử lý trùng lặp. | Có |  |
| 31 | 2026-06-29 | Antigravity | Thiết kế Database Ledger (Sổ cái tài chính) ghi nhận giao dịch nạp/rút/mua khóa học | Thiết kế bảng sổ cái tài chính (Ledger) để ghi nhận chi tiết dòng tiền đi và đến. | AI đề xuất schema bảng `financial_ledger` lưu chuyển dịch tiền tệ dạng Debit/Credit, liên kết chặt chẽ với đơn hàng và tài khoản người dùng. | Có |  |
| 32 | 2026-06-29 | Antigravity | Triển khai cơ chế khóa bi quan (Pessimistic Locking) trong Spring Boot khi cộng/trừ số dư ví | Viết truy vấn khóa bi quan (Pessimistic Write Lock) trên Spring Data JPA cho WalletEntity. | AI gợi ý sử dụng hàm `findById` đi kèm `@Lock(LockModeType.PESSIMISTIC_WRITE)` để khóa dòng dữ liệu trong DB khi đang cập nhật ví. | Có |  |
| 33 | 2026-06-29 | Antigravity | Giải quyết tranh chấp tài nguyên (Race Condition) khi nhiều học viên đăng ký cùng một khóa học giới hạn slot | Giải quyết race condition bằng khóa lạc quan (Optimistic Locking) khi đăng ký slot học. | AI so sánh và khuyên dùng khóa lạc quan bằng `@Version` trong Hibernate vì tỷ lệ tranh chấp thấp hơn giao dịch tài chính, giúp hệ thống không bị nghẽn khóa DB. | Có |  |
| 34 | 2026-06-29 | Antigravity | Xây dựng hàng đợi nộp bài (Submission Queue) bằng RabbitMQ/Kafka để giảm tải cho hệ thống Online Judge | Thiết kế kiến trúc hàng đợi chấm bài bất đồng bộ sử dụng RabbitMQ trong Spring Boot. | AI đề xuất mô hình Producer-Consumer sử dụng RabbitMQ: Nhận bài nộp -> Đẩy vào queue -> Trả về ID lập tức. Service worker lấy bài ra gửi Judge0 chấm bất đồng bộ. | Có |  |
| 35 | 2026-06-29 | Antigravity | Tích hợp Judge0 API để biên dịch và chạy thử code đa ngôn ngữ | Viết tích hợp HTTP Client gọi API Judge0 gửi code chấm và nhận kết quả. | AI viết Service sử dụng `WebClient` để call API của Judge0, thực hiện mã hóa base64 source code và testcases trước khi truyền tải. | Có |  |
| 36 | 2026-06-29 | Antigravity | Ngăn chặn Fork Bomb và các cuộc tấn công tài nguyên hệ thống trong Docker Sandbox của Judge0 | Thiết lập cấu hình bảo mật sandbox trong file docker-compose của Judge0 để chặn fork bomb. | AI hướng dẫn cách cấu hình `pids-limit: 100` để chặn fork bomb, cấu hình `network_mode: none` để chặn code gọi API ngoài, và thiết lập CPU/Memory limits. | Có |  |
| 37 | 2026-06-29 | Antigravity | Thiết kế cơ chế giới hạn thời gian (Time Limit Exceeded) và bộ nhớ (Memory Limit Exceeded) cho code học viên | Thiết lập tham số cpu_time_limit và memory_limit khi call Judge0 API. | AI viết logic lấy thuộc tính `timeLimit` và `memoryLimit` từ đối tượng Problem và gán vào các thuộc tính của Judge0 Request Body. | Có |  |
| 38 | 2026-06-29 | Antigravity | Triển khai WebSocket để đẩy kết quả chấm bài theo thời gian thực (Real-time Verdicts) về React Client | Cấu hình Spring Boot WebSocket và React Client để truyền kết quả chấm bài thời gian thực. | AI cung cấp code cấu hình `@EnableWebSocketMessageBroker` phía Spring Boot và thư viện `@stomp/stompjs` phía React để thiết lập luồng truyền tin. | Có |  |
| 39 | 2026-06-29 | Antigravity | Xây dựng thuật toán tính điểm phạt ICPC (Penalty) cho bảng xếp hạng Contest | Viết logic tính điểm phạt thi đấu ICPC bằng Java dựa trên lịch sử nộp bài. | AI sinh ra thuật toán lọc lịch sử nộp bài của từng user, tìm lượt Accepted đầu tiên cho mỗi problem và cộng dồn điểm phạt theo công thức. | Có |  |
| 40 | 2026-06-29 | Antigravity | Tối ưu hóa truy vấn SQL để tải Leaderboard thời gian thực với hàng chục ngàn người dùng | Viết truy vấn SQL tối ưu sử dụng Window Functions để tính bảng xếp hạng cuộc thi. | AI cung cấp truy vấn sử dụng hàm `DENSE_RANK() OVER (ORDER BY score DESC, daily_streak DESC)` giúp phân hạng cực nhanh ở tầng cơ sở dữ liệu. | Có |  |
| 41 | 2026-06-29 | Antigravity | Triển khai Cache Redis cho thông tin khóa học và danh sách bài tập truy cập nhiều | Cấu hình Spring Cache Redis để lưu cache dữ liệu chi tiết khóa học. | AI viết lớp cấu hình `RedisCacheManager` với các cấu hình TTL và hướng dẫn dùng các annotation `@Cacheable(value = "courses")` và `@CacheEvict`. | Có |  |
| 42 | 2026-06-29 | Antigravity | Thiết kế cơ chế tính chuỗi ngày học liên tục (Daily Streak) hiệu quả | Viết logic cập nhật daily streak và reset streak khi ngắt ngày học. | AI cung cấp hàm xử lý so sánh `activity_date` của bản ghi hoạt động gần nhất với ngày hiện tại (CURRENT_DATE) và ngày hôm trước. | Có |  |
| 43 | 2026-06-29 | Antigravity | Quét đạo văn bài nộp code sử dụng Gemini Embedding API và Cosine Similarity | Thiết kế giải pháp quét đạo văn code bằng cách tạo vector embedding và tính cosine similarity. | AI đề xuất quy trình: Tiền xử lý code (xóa khoảng trắng/comment) -> Gửi đến Gemini Embedding -> So sánh khoảng cách Cosine Similarity, nếu độ tương đồng > 0.90 sẽ đánh dấu đạo văn. | Có |  |
| 44 | 2026-06-29 | Antigravity | Sử dụng Gemini API để tự động chấm điểm và đánh giá code học viên với các tiêu chí Clean Code | Viết prompt tích hợp Gemini API để nhận xét cấu trúc code và chấm điểm tối ưu thuật toán. | AI viết prompt hướng dẫn Gemini đóng vai trò reviewer, chỉ trả về JSON có cấu trúc định sẵn bằng cách thiết lập Response Schema trong API call. | Có |  |
| 45 | 2026-06-29 | Antigravity | AI quét kiểm duyệt nội dung video bài giảng (Video Moderation) để phát hiện vi phạm bản quyền hoặc nội dung không lành mạnh | Tích hợp Gemini Multimodal API để kiểm duyệt nội dung video bài giảng của Instructor. | AI đề xuất trích xuất các khung ảnh (keyframes) và audio track, gửi qua Gemini Multimodal để phân tích nội dung hình ảnh/giọng nói, trả về thẻ phân loại an toàn. | Có |  |
| 46 | 2026-06-29 | Antigravity | AI trích xuất thông tin tự động từ CV (CV Parser) của Giảng viên nộp đơn đăng ký dạy | Viết prompt gọi Gemini API để bóc tách thông tin kinh nghiệm làm việc và kỹ năng từ file PDF CV. | AI hướng dẫn dùng Apache PDFBox để trích xuất text từ file PDF, sau đó gửi đoạn text này cho Gemini API kèm theo schema yêu cầu định dạng JSON. | Có |  |
| 47 | 2026-06-29 | Antigravity | Cơ chế phân quyền nhiều cấp độ (RBAC) sử dụng Spring Security | Cấu hình phân quyền Spring Security dựa trên Role và Authority cho các API. | AI hướng dẫn cấu hình `@EnableMethodSecurity` và nạp danh sách quyền (permissions) của user từ DB vào đối tượng Authentication. | Có |  |
| 48 | 2026-06-29 | Antigravity | Triển khai cơ chế xoay vòng JWT (JWT Rotation) với Refresh Token để bảo mật phiên đăng nhập | Thiết kế luồng cấp lại Access Token qua Refresh Token lưu trong Database. | AI cung cấp cấu trúc thực thể `RefreshToken` và service xử lý cấp mới token, đồng thời giải thích cơ chế Revocation khi phát hiện trùng mã token đã sử dụng. | Có |  |
| 49 | 2026-06-29 | Antigravity | Tích hợp đăng nhập bằng Google OAuth2 bảo mật ở phía Backend | Viết API nhận id_token từ Google OAuth và thực hiện đăng nhập / đăng ký tài khoản tự động. | AI cung cấp code sử dụng thư viện `GoogleIdTokenVerifier` để giải mã, xác thực id_token và nạp thông tin user vào Spring Security context. | Có |  |
| 50 | 2026-06-29 | Antigravity | Cấu hình Spring Security CORS để bảo vệ ứng dụng trước các request trái phép từ domain khác | Cấu hình CorsConfigurationSource trong Spring Security để chỉ cho phép domain React kết nối. | AI cung cấp đoạn cấu hình `CorsConfigurationSource` thiết lập các thuộc tính `AllowedOrigins`, `AllowedMethods` và `AllowedHeaders`. | Có |  |
| 51 | 2026-06-29 | Antigravity | Phòng chống tấn công Cross-Site Scripting (XSS) khi hiển thị mã nguồn của học viên trên giao diện | Cấu hình thư viện DomPurify trên React để làm sạch dữ liệu code HTML trước khi render. | AI viết component React tích hợp thư viện `dompurify` để làm sạch mã HTML bẩn trước khi gọi `dangerouslySetInnerHTML`. | Có |  |
| 52 | 2026-06-29 | Antigravity | Phòng chống tấn công SQL Injection khi tìm kiếm khóa học bằng các từ khóa tự do | Sử dụng JPA Criteria API hoặc Parameterized Query để chặn SQL Injection. | AI giải thích cơ chế của Parameterized Queries và viết mã Spring Data `@Query` sử dụng tham số `:title` an toàn tuyệt đối trước SQL injection. | Có |  |
| 53 | 2026-06-29 | Antigravity | Thiết kế cơ chế giới hạn tần suất request (Rate Limiting) cho các API nhạy cảm | Triển khai Rate Limiting API sử dụng thư viện Bucket4j trong Spring Boot. | AI hướng dẫn tạo một Filter tích hợp thư viện `Bucket4j` để đếm số request theo địa chỉ IP hoặc UserId và trả về HTTP Status 429 Too Many Requests nếu quá hạn. | Có |  |
| 54 | 2026-06-29 | Antigravity | Xây dựng hệ thống Giao dịch Phân tán (Distributed Transactions) bằng Saga Pattern khi thực hiện mua khóa học và ghi nhận doanh thu giảng viên | Thiết kế giải pháp giao dịch phân tán Saga Pattern cho luồng thanh toán mua khóa học. | AI thiết kế luồng Saga sử dụng các event nạp/hủy. Nếu việc ghi danh học viên thất bại, hệ thống sẽ tự động phát đi sự kiện `RollbackWalletEvent` để cộng lại tiền. | Có |  |
| 55 | 2026-06-29 | Antigravity | Cấu hình kết nối cơ sở dữ liệu dự phòng (Read-Write Splitting) với Spring Boot để tối ưu tải DB | Cấu hình định tuyến động kết nối DB (Read-Write Routing) sử dụng AbstractRoutingDataSource. | AI hướng dẫn cách viết class kế thừa `AbstractRoutingDataSource` để tự động chọn Connection Pool tùy thuộc vào trạng thái `readOnly` của transaction context. | Có |  |
| 56 | 2026-06-29 | Antigravity | Tối ưu hóa dung lượng lưu trữ cơ sở dữ liệu bằng cách nén các file mã nguồn bài nộp lớn | Viết helper class Java để nén (GZIP) nội dung source code trước khi lưu vào cơ sở dữ liệu. | AI viết một Utility class sử dụng `GZIPOutputStream` để nén chuỗi thành mảng byte và `GZIPInputStream` để giải nén ngược lại. | Có |  |
| 57 | 2026-06-29 | Antigravity | Thiết kế API xuất file báo cáo doanh thu PDF/Excel sử dụng JasperReports/Apache POI | Viết API xuất dữ liệu báo cáo doanh thu dạng Excel sử dụng Apache POI. | AI cung cấp code sử dụng Apache POI tạo workbook, sheet, cell, định dạng font bold cho tiêu đề và áp dụng công thức SUM của Excel. | Có |  |
| 58 | 2026-06-29 | Antigravity | Cơ chế tự động dọn dẹp các file tạm và CV giảng viên không được duyệt sau 30 ngày | Thiết lập Spring Scheduler (`@Scheduled`) để tự động dọn dẹp hồ sơ tạm quá hạn. | AI cung cấp class định nghĩa `@Scheduled(cron = "0 0 2 * * ?")` chạy lúc 2h sáng hàng ngày để tìm và xóa file qua AWS S3 Client. | Có |  |
| 59 | 2026-06-29 | Antigravity | Triển khai lưu trữ file bài giảng và tài liệu học tập lên AWS S3 sử dụng SDK AWS Java | Viết file service tích hợp upload tài liệu lên AWS S3 sử dụng AWS SDK v2. | AI viết Service sử dụng `S3Client` và `S3Presigner` để tạo link truy cập tạm thời (Pre-signed URL) có hiệu lực trong 60 phút. | Có |  |
| 60 | 2026-06-29 | Antigravity | Hỗ trợ streaming video bài giảng chất lượng cao bằng giao thức HLS và phân giải nhiều định dạng | Tạo cấu trúc workflow ffmpeg để convert video bài giảng MP4 sang định dạng HLS (m3u8). | AI hướng dẫn sử dụng công cụ `ffmpeg` chạy trên background worker để cắt nhỏ video thành các đoạn `.ts` đi kèm file chỉ mục `.m3u8`, cấu hình luồng phát bằng thư viện Video.js ở Frontend. | Có |  |
| 61 | 2026-06-29 | Antigravity | Thiết kế cơ chế theo dõi tiến trình học tập của học viên chi tiết đến từng giây xem video | Thiết kế API cập nhật tiến độ xem video bài học và React hook tracking thời gian xem. | AI đề xuất cơ chế lắng nghe sự kiện `onTimeUpdate` ở React Player và gọi API cập nhật tiến độ sau mỗi 10 giây xem liên tục. | Có |  |
| 62 | 2026-06-29 | Antigravity | Xây dựng hệ thống thảo luận cộng đồng (Discussion Forum) hỗ trợ bình luận phân cấp | Thiết kế bảng Database và viết truy vấn phân cấp (Recursive CTE) cho Nested Comments. | AI gợi ý bảng `comments` tự tham chiếu (`parent_id REFERENCES comments(id)`) và câu lệnh SQL sử dụng `WITH RECURSIVE` để lấy toàn bộ nhánh comment chỉ bằng một câu query. | Có |  |
| 63 | 2026-06-29 | Antigravity | Triển khai cơ chế Markdown Editor với tính năng auto-save và upload ảnh cho giảng viên soạn bài | Viết component React soạn thảo Markdown có chức năng tự động lưu bản nháp và kéo thả tải ảnh. | AI viết component React sử dụng SimpleMDE, viết sự kiện lắng nghe `paste` và `drop` tệp tin để gửi lên S3, sau đó chèn đường dẫn ảnh trực tiếp vào vị trí con trỏ soạn thảo. | Có |  |
| 64 | 2026-06-29 | Antigravity | Tối ưu hóa giao diện React bằng kỹ thuật Lazy Loading và Code Splitting để giảm dung lượng bundle ban đầu | Cấu hình React lazy và Suspense để chia nhỏ file bundle React. | AI hướng dẫn thay thế các import tĩnh bằng import động: `const CodingWorkspace = React.lazy(() => import('./pages/CodingWorkspace'))` và bao bọc Router bằng `<Suspense fallback={<SkeletonLoading />}>`. | Có |  |
| 65 | 2026-06-29 | Antigravity | Triển khai skeleton loading cho trang chi tiết khóa học để tăng trải nghiệm người dùng | Viết component React Skeleton Loading mô phỏng layout trang khóa học trước khi có dữ liệu API. | AI sinh ra component `CourseDetailSkeleton` thiết kế các khối bo tròn giả lập thanh tiêu đề, ảnh thumbnail, danh sách bài học có hiệu ứng nhấp nháy mượt mà. | Có |  |
| 66 | 2026-06-29 | Antigravity | Thiết kế UI tương thích đa thiết bị (Responsive Design) cho IDE Coding Workspace của học viên trên máy tính và iPad | Cấu hình responsive layout bằng CSS Grid và Tailwind cho màn hình code editor. | AI hướng dẫn cách dùng grid layout: `grid grid-cols-1 lg:grid-cols-2` và thiết lập thanh kéo co giãn (resize) kích thước các panel thông qua thư viện split.js. | Có |  |
| 67 | 2026-06-29 | Antigravity | Xây dựng hệ thống thông báo thời gian thực (Push Notifications) về sự kiện thi đấu sử dụng SSE (Server-Sent Events) | Viết API Server-Sent Events (SseEmitter) để đẩy tin nhắn thông báo sự kiện từ backend. | AI hướng dẫn tạo endpoint trả về `SseEmitter`, lưu trữ danh sách emitter trong `ConcurrentHashMap`, và phía Client mở kết nối bằng lớp `EventSource` của trình duyệt. | Có |  |
| 68 | 2026-06-29 | Antigravity | Viết Unit Test cho Service xử lý nạp tiền bằng JUnit 5 và Mockito | Viết Unit Test kiểm thử logic nạp tiền ví điện tử sử dụng Mockito mock. | AI sinh ra lớp unit test sử dụng `@ExtendWith(MockitoExtension.class)` và các cú pháp `when().thenReturn()` để kiểm tra các luồng nghiệp vụ ví. | Có |  |
| 69 | 2026-06-29 | Antigravity | Triển khai Integration Test cho API chấm bài sử dụng Testcontainers với Docker PostgreSQL và Docker Judge0 | Cấu hình Testcontainers chạy database PostgreSQL ảo cho bài kiểm thử tích hợp API. | AI hướng dẫn cách viết lớp test cơ sở kế thừa `PostgreSQLContainer` để khởi tạo database sạch trước khi chạy các câu lệnh REST Assured test API. | Có |  |
| 70 | 2026-06-29 | Antigravity | Viết End-to-End Test cho luồng đăng ký học và thanh toán bằng Cypress | Viết kịch bản kiểm thử End-to-End bằng Cypress cho luồng checkout thanh toán ví. | AI sinh ra kịch bản Cypress sử dụng `cy.visit()`, `cy.get().click()`, và giả lập phản hồi của API thanh toán để kiểm tra hành vi chuyển trang. | Có |  |
| 71 | 2026-06-29 | Antigravity | Cấu hình Dockerize ứng dụng Spring Boot sử dụng Multi-stage build để tối ưu hóa kích thước image | Viết Dockerfile hai giai đoạn (Multi-stage build) để build và đóng gói Spring Boot jar. | AI cung cấp tệp Dockerfile hai tầng, sử dụng cơ chế đệm cache maven để giảm thời gian build và xuất ra image cuối cùng chỉ khoảng 200MB. | Có |  |
| 72 | 2026-06-29 | Antigravity | Thiết lập quy trình CI/CD tự động build, test và deploy lên VPS bằng GitHub Actions | Viết file cấu hình GitHub Actions (`main.yml`) để tự động đóng gói Docker và deploy qua SSH. | AI cung cấp file cấu hình YAML định nghĩa các jobs: build-and-test, build-and-push-docker, và deploy-vps gọi lệnh SSH execute remote command. | Có |  |
| 73 | 2026-06-29 | Antigravity | Cấu hình Prometheus và Grafana để giám sát các chỉ số hiệu năng của Spring Boot | Cấu hình Spring Boot Actuator kết nối với Prometheus để thu thập dữ liệu giám sát hệ thống. | AI hướng dẫn kích hoạt dependency `micrometer-registry-prometheus`, cấu hình file yaml của Spring Boot và thiết lập địa chỉ IP scrape cho máy chủ Prometheus. | Có |  |
| 74 | 2026-06-29 | Antigravity | Thiết lập hệ thống tập trung Log (Centralized Logging) bằng ELK Stack hoặc Grafana Loki | Cấu hình xuất log định dạng JSON từ Logback lên Grafana Loki. | AI cung cấp file `logback-spring.xml` cấu hình Loki appender để tự động chuyển phát log qua HTTP API về Loki server. | Có |  |
| 75 | 2026-06-29 | Antigravity | Khắc phục lỗi Memory Leak trong ứng dụng Java do rò rỉ ThreadLocal trong Spring Security context | Phân tích nguyên nhân rò rỉ bộ nhớ của ThreadLocal và cách dọn dẹp biến SecurityContextHolder. | AI giải thích: Tomcat tái sử dụng thread trong pool. Nếu một biến ThreadLocal không được gọi `.remove()` sau khi kết thúc request, dữ liệu sẽ ở lại trong memory mãi mãi, gây rò rỉ. AI cung cấp filter dọn dẹp. | Có |  |
| 76 | 2026-06-29 | Antigravity | Khắc phục lỗi Connection Pool Exhaustion khi lượng truy cập tăng đột biến bằng cách tinh chỉnh HikariCP | Cấu hình tối ưu hóa các tham số HikariCP trong application.properties để tránh cạn kiệt connection. | AI đề xuất thiết lập kích thước pool phù hợp (ví dụ max 20-50 tùy theo số lõi CPU của DB), và bật cấu hình phát hiện rò rỉ: `leak-detection-threshold: 2000`. | Có |  |
| 77 | 2026-06-29 | Antigravity | Thiết lập cấu hình HTTPS bảo mật bằng SSL/TLS qua Let's Encrypt trên Reverse Proxy Nginx | Viết file cấu hình Nginx reverse proxy và trỏ SSL certbot cho dự án. | AI viết file cấu hình Nginx, cấu hình chuyển hướng HTTP -> HTTPS và thiết lập đường dẫn đến các chứng chỉ SSL được sinh ra từ certbot. | Có |  |
| 78 | 2026-06-29 | Antigravity | Thực hiện Audit log lịch sử thao tác của các Admin trên hệ thống | Thiết lập Spring AOP để ghi nhật ký hoạt động (Audit Trail) của Admin vào cơ sở dữ liệu. | AI hướng dẫn định nghĩa Annotation `@AdminAuditLog` và Aspect sử dụng `@Around` để ghi lại lịch sử thao tác của Admin và lưu vào bảng `admin_audit_logs`. | Có |  |
| 79 | 2026-06-29 | Antigravity | Thiết kế Hệ thống Gợi ý Khóa học (Recommendation System) dựa trên lịch sử giải bài của Học viên | Thiết kế thuật toán gợi ý khóa học dựa trên mức độ giải bài tập thuật toán. | AI gợi ý truy vấn SQL kết hợp đếm thẻ phân loại (tags) của các bài nộp lỗi (WA/TLE) của user để nối với khóa học có cùng tag phân loại. | Có |  |
| 80 | 2026-06-29 | Antigravity | Tích hợp tính năng lập trình trực tiếp (Interactive Coding Playground) trong phụ đề video | Thiết kế UI đồng bộ video player với Monaco Editor để làm playground học lập trình. | AI đề xuất định dạng tệp WebVTT chứa mã nguồn mẫu ở các mốc thời gian và viết React hook đồng bộ state `currentTime` của player để hiển thị editor tương ứng. | Có |  |
| 81 | 2026-06-29 | Antigravity | Tạo chứng chỉ khóa học dạng PDF tự động có mã QR xác minh mã hóa | Viết helper sinh file PDF chứng chỉ khóa học có mã QR xác thực cryptographically. | AI hướng dẫn sử dụng OpenPDF kết hợp thư viện ZXing để tạo mã QR chứa URL mã hóa, vẽ đè lên phông nền phôi chứng chỉ. | Có |  |
| 82 | 2026-06-29 | Antigravity | Nhập hàng loạt sinh viên vào lớp học (Bulk Import) từ file Excel/CSV | Viết API đọc file Excel/CSV sinh viên nạp vào danh sách database lớp học. | AI viết Service đọc MultipartFile Excel, lặp qua các dòng, kiểm tra định dạng email và gom các lỗi dòng ghi vào danh sách phản hồi. | Có |  |
| 83 | 2026-06-29 | Antigravity | Thiết kế luật mở khóa bài học theo điều kiện tiên quyết (Prerequisite Rules) | Thiết kế logic chặn truy cập bài học nếu học viên chưa hoàn thành bài học trước đó. | AI viết một HandlerInterceptor kiểm tra sự tồn tại của bản ghi học tập tương ứng trong database, trả về lỗi HTTP 403 nếu bài học trước chưa hoàn thành. | Có |  |
| 84 | 2026-06-29 | Antigravity | Thiết kế Hệ thống Huy hiệu Thành tích (Badges & Achievement Engine) tự động | Thiết kế database và logic trao huy hiệu thành tích tự động cho học viên. | AI gợi ý thiết kế bảng `badges` và `user_badges`, sử dụng cơ chế lắng nghe sự kiện (`@EventListener`) sau khi chấm bài thành công để đánh giá điều kiện trao huy hiệu. | Có |  |
| 85 | 2026-06-29 | Antigravity | Thiết kế Cửa hàng đổi quà (Virtual Item Store) tích hợp đổi điểm thưởng | Thiết kế database và API giao dịch mua vật phẩm ảo bằng điểm thưởng (Points). | AI đề xuất các bảng `store_items`, `points_logs` và `item_redemptions`, đi kèm dịch vụ trừ điểm ví điểm thưởng an toàn. | Có |  |
| 86 | 2026-06-29 | Antigravity | Triển khai Notification Toast thời gian thực cho hoạt động nhóm học tập | Viết hook React kết nối SSE để hiện thông báo Toast nổi lên góc màn hình. | AI viết React hook lắng nghe EventSource, khởi tạo toast thông báo động của thư viện react-toastify đi kèm hàm onClick chuyển trang qua React Router. | Có |  |
| 87 | 2026-06-29 | Antigravity | Xây dựng lịch trình tự động đẩy bài tập hàng ngày (Daily Challenge Scheduler) | Thiết lập Spring Scheduler để tự động chọn bài tập ngẫu nhiên làm thử thách ngày. | AI viết phương thức scheduler lấy ngẫu nhiên 1 Problem từ DB dựa trên thuật ngữ SQL ORDER BY RANDOM() và lưu vào bảng thử thách ngày. | Có |  |
| 88 | 2026-06-29 | Antigravity | Thiết kế Bộ máy duyệt chính sách Hoàn tiền (Refund Policy Engine) | Thiết kế database và logic phê duyệt yêu cầu hoàn tiền tự động dựa trên điều kiện tiến độ học tập. | AI viết hàm kiểm tra ngày mua khóa học và gọi dịch vụ progress tracking để so sánh tiến trình xem video, nếu đạt chuẩn sẽ hoàn tiền ví điện tử. | Có |  |
| 89 | 2026-06-29 | Antigravity | Hỗ trợ Đa tiền tệ (Multi-currency) và tỷ giá cập nhật tự động | Thiết kế bảng Database lưu tỷ giá ngoại tệ và viết API chuyển đổi tiền tệ động. | AI đề xuất thiết kế bảng `exchange_rates` và viết scheduler gọi API OpenExchangeRates để cập nhật tỷ giá hàng ngày. | Có |  |
| 90 | 2026-06-29 | Antigravity | Tự động phân bổ doanh thu (Revenue Split) cho các khóa học đồng giảng dạy | Viết logic tính toán và phân phối doanh thu khóa học cho nhiều Instructor cùng giảng dạy. | AI cung cấp thuật toán bóc tách hóa đơn, tính toán phần trăm hoa hồng nền tảng và nạp ví cho các giảng viên theo đúng tỷ lệ phần chia. | Có |  |
| 91 | 2026-06-29 | Antigravity | Xây dựng cơ chế đăng ký và tự động gia hạn thành viên Premium (Subscriptions model) | Thiết kế database và scheduler tự động gia hạn gói hội viên Premium. | AI gợi ý thiết kế bảng `user_subscriptions` và class cron job chạy lúc 1h sáng để quét và tự động chuyển đổi trạng thái `active = false` của các gói hết hạn. | Có |  |
| 92 | 2026-06-29 | Antigravity | Thiết lập tác vụ tự động sao lưu Cơ sở dữ liệu (Automated DB Backup) lên AWS S3 | Viết script bash tự động dump database PostgreSQL và upload lên AWS S3. | AI sinh ra một đoạn script shell bash sử dụng lệnh `pg_dump`, nén bằng tar.gz và gọi lệnh `aws s3 cp` để đồng bộ lên bucket đám mây. | Có |  |
| 93 | 2026-06-29 | Antigravity | Cấu hình tắt ứng dụng an toàn (Graceful Shutdown) cho Spring Boot backend để tránh rớt request đang xử lý | Cấu hình server.shutdown=graceful trong Spring Boot và giải thích cơ chế xử lý request. | AI hướng dẫn thêm cấu hình `server.shutdown: graceful` và `spring.lifecycle.timeout-per-shutdown-phase: 30s` vào file `application.yaml` để chờ tối đa 30 giây cho các request cũ xử lý xong. | Có |  |
| 94 | 2026-06-29 | Antigravity | Thiết lập cấu hình Auto-scaling cho Kubernetes Deployment dựa trên chỉ số CPU/Memory | Viết file cấu hình HorizontalPodAutoscaler (HPA) cho dịch vụ Spring Boot. | AI cung cấp file cấu hình HPA YAML chỉ định mục tiêu Deployment và các metrics CPU/Memory tương ứng. | Có |  |
| 95 | 2026-06-29 | Antigravity | Thiết lập giải pháp Sao lưu dự phòng và Phục hồi sau thảm họa (Disaster Recovery) | Thiết kế kế hoạch sao lưu phục hồi cơ sở dữ liệu đa vùng (Cross-region replication). | AI thiết kế mô hình Primary-Standby kết hợp công cụ pgPool để tự động phát hiện node chính chết và kích hoạt node phụ lên làm Master (Failover). | Có |  |
| 96 | 2026-06-29 | Antigravity | Triển khai cơ chế Bật/Tắt tính năng động (Feature Flags / Feature Toggles) | Thiết kế database và service bật/tắt tính năng động không cần deploy lại code. | AI thiết kế bảng `feature_flags` và viết service kiểm tra trạng thái flag theo UserId kết hợp Redis để truy vấn nhanh. | Có |  |
| 97 | 2026-06-29 | Antigravity | Tự động hóa kiểm tra lỗi bảo mật thư viện (OWASP Dependency Check) | Cấu hình plugin OWASP dependency-check-maven để tự động rà soát lỗ hổng thư viện lúc build. | AI hướng dẫn thêm plugin `dependency-check-maven` vào file `pom.xml` của dự án và cấu hình thuộc tính `failBuildOnCVSS`. | Có |  |
| 98 | 2026-06-29 | Antigravity | Thiết kế Hệ thống Quét và Phân loại Tag tự động cho Bài tập Lập trình bằng AI | Viết prompt gọi Gemini để phân loại độ khó và tự động gắn thẻ tags cho bài tập lập trình. | AI viết prompt hướng dẫn Gemini đọc cấu trúc đề bài để phân loại thẻ học tập và độ khó thuật toán chính xác dựa trên độ phức tạp O(N). | Có |  |
| 99 | 2026-06-29 | Antigravity | Triển khai cơ chế nén ảnh tự động trước khi lưu trữ để tối ưu hóa băng thông tải trang | Viết hàm Java sử dụng TwelveMonkeys/ImageIO để resize và nén ảnh đại diện. | AI viết một Image Utility sử dụng `BufferedImage` để chuyển đổi định dạng PNG/JPG sang WebP có độ nén cao mà không vỡ hình. | Có |  |
| 100 | 2026-06-29 | Antigravity | Thiết kế Hệ thống Cảnh báo Lỗi Hệ thống chủ động (Proactive Error Alerting) | Thiết lập hệ thống gửi cảnh báo lỗi exception qua Discord Webhook. | AI hướng dẫn viết `@RestControllerAdvice` kết hợp thư viện RestTemplate để gửi POST request chứa payload embed Message đến Discord Webhook channel. | Có |  |
---

## 5. Prompt chi tiết

> Sinh viên/nhóm có thể nhân bản mẫu “Prompt số...” nhiều lần tùy số lượng prompt thực tế đã sử dụng.

---

### Prompt số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-13 |
| Công cụ AI | Gemini |
| Mục đích | Tìm hiểu cấu trúc và quy trình viết tài liệu đặc tả yêu cầu phần mềm (SRS) theo chuẩn IEEE 830 |
| Phân việc liên quan | Requirement |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Tôi đang thực hiện dự án môn học SWP391 để xây dựng một hệ thống "Integrated Coding Education & Competitive Programming Platform" (Nền tảng học lập trình và thi đấu trực tuyến tích hợp). Hãy hướng dẫn tôi quy trình viết một tài liệu đặc tả yêu cầu phần mềm (SRS) đầy đủ và chuyên nghiệp theo chuẩn IEEE 830. Hãy liệt kê các mục lục chính cần có và các lưu ý đặc biệt cho dự án này.
```

#### 5.2. Bối cảnh khi viết prompt

Khi bắt đầu dự án nhóm, chúng tôi cần thiết lập tài liệu SRS làm cơ sở để phân tích yêu cầu phần mềm và giao tiếp giữa các thành viên. Tuy nhiên, tôi chưa nắm vững cấu trúc tài liệu chuẩn và cách triển khai nội dung đặc thù cho nền tảng thi lập trình (chấm bài, quản lý bài tập).

#### 5.3. Kết quả AI trả về

Gemini đã cung cấp một cấu trúc chi tiết dựa trên chuẩn IEEE 830, bao gồm:
1. **Introduction**: Purpose, document conventions, intended audience, scope, references.
2. **Overall Description**: Product perspective, functions, user classes, operating environment, design/implementation constraints, assumptions.
3. **System Features**: Quản lý người dùng, Quản lý bài tập (Problem), Hệ thống chấm bài (Grader Engine), Lớp học trực tuyến (Courses/Lessons), Thi đấu (Contest), Bảng xếp hạng (Leaderboard).
4. **External Interface Requirements**: User interfaces, hardware interfaces, software interfaces (Judge0 API, Database), communications interfaces.
5. **Other Non-functional Requirements**: Security, Performance, Reliability, Availability.

#### 5.4. Kết quả đã áp dụng vào bài

Chúng tôi đã áp dụng trực tiếp cấu trúc mục lục này để xây dựng khung tài liệu SRS cho nhóm. Phần phân tích giao diện ngoài (External Interface Requirements) đã giúp nhóm định hình việc tách biệt Frontend (React) và Backend (Spring Boot) cùng cơ chế giao tiếp qua REST API.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã điều chỉnh các phần mục lục để phù hợp với phạm vi thực tế của môn học SWP391. Cụ thể, lược bỏ các ràng buộc phần cứng quá phức tạp, tập trung chi tiết vào mô tả luồng hoạt động của "Grader Engine" và phân tích rõ các User Story chính của Student, Teacher và Admin.

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

### Prompt số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-13 |
| Công cụ AI | Gemini |
| Mục đích | Phân biệt và áp dụng đúng các quan hệ use case (include, extend, generalization) để thiết kế sơ đồ |
| Phần việc liên quan | Design |
| Mức độ sử dụng | Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Hãy giải thích chi tiết sự khác nhau giữa các mối quan hệ "include", "extend" và "generalization" trong biểu đồ Use Case của UML. Đồng thời cho ví dụ cụ thể, trực quan liên quan đến các chức năng của một hệ thống Online Judge/Coding Platform (ví dụ: đăng nhập, nộp bài, xem lịch sử nộp bài, đăng ký contest).
```

#### 5.2. Bối cảnh khi viết prompt

Trong quá trình thiết kế sơ đồ Use Case cho tài liệu SRS, tôi gặp khó khăn khi xác định mối quan hệ giữa các Use Case. Có nhiều trường hợp không biết nên sử dụng `<<include>>` hay `<<extend>>`, dẫn đến việc sơ đồ bị sai logic UML.

#### 5.3. Kết quả AI trả về

Gemini đã đưa ra sự phân biệt rõ ràng kèm ví dụ trực quan trong hệ thống Online Judge:
- **Include (Bao gồm - bắt buộc)**: Use Case A muốn chạy thì bắt buộc phải chạy Use Case B.
  *Ví dụ: Use Case "Submit Code" bắt buộc phải `<<include>>` Use Case "Login".*
- **Extend (Mở rộng - không bắt buộc/tùy chọn)**: Use Case B là phần mở rộng, chỉ xảy ra dưới một điều kiện nhất định khi chạy Use Case A.
  *Ví dụ: Use Case "View Problem Detail" có thể `<<extend>>` Use Case "View Code Hint" (nếu học sinh muốn xem gợi ý và chấp nhận trừ điểm).*
- **Generalization (Tổng quát hóa - kế thừa)**: Thể hiện mối quan hệ cha-con.
  *Ví dụ: "Login via Google" và "Login via Account" kế thừa từ Use Case "Login". Hoặc "Teacher" và "Student" kế thừa từ "User".*

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã áp dụng các nguyên tắc này để vẽ sơ đồ Use Case tổng quát cho hệ thống Coding Platform của nhóm. Giúp sơ đồ trở nên mạch lạc, đúng chuẩn UML và dễ hiểu cho cả giáo viên và các thành viên khác khi xem tài liệu.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Dựa trên lý thuyết đã hiểu rõ từ AI, tôi tự tay thiết kế và vẽ sơ đồ Use Case bằng công cụ Draw.io. Tôi không copy nguyên mẫu sơ đồ gợi ý mà tự cấu trúc lại các Use Case theo nghiệp vụ thực tế của nhóm (tích hợp thêm các bài học nhỏ - Lessons thay vì chỉ có thi đấu lập trình).

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

### Prompt số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-14 |
| Công cụ AI | Gemini |
| Mục đích | Nghiên cứu giải pháp tự động chấm code (Online Judge Engine) an toàn và tối ưu cho dự án |
| Phần việc liên quan | Design / Coding |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Tôi đang xây dựng một dự án thi lập trình trực tuyến (Online Judge) bằng Spring Boot và React. Hãy gợi ý cho tôi các giải pháp xây dựng tính năng tự động biên dịch và chấm bài (grader engine) bảo mật và tối ưu nhất cho đồ án sinh viên. Đánh giá ưu nhược điểm của việc tự dựng sandbox (bằng Docker/Jail) so với việc tích hợp các API có sẵn của bên thứ ba (như Judge0 API).
```

#### 5.2. Bối cảnh khi viết prompt

Tính năng cốt lõi của website là cho phép người dùng viết code (Java, C++, Python...) trực tiếp trên web và nhấn Submit để hệ thống biên dịch, chạy thử với Testcase rồi chấm điểm. Việc chạy code người dùng ẩn chứa nguy cơ bảo mật cực lớn (RCE - Remote Code Execution). Do đó, tôi cần tìm kiếm giải pháp tối ưu nhất để triển khai.

#### 5.3. Kết quả AI trả về

Gemini đã cung cấp một bản so sánh chi tiết:
1. **Phương án 1: Tự xây dựng Grader Engine với Docker/Sandbox local**
   * *Ưu điểm*: Tự chủ hoàn toàn công nghệ, không giới hạn lượt chấm, tùy biến sâu testcase.
   * *Nhược điểm*: Độ phức tạp cực kỳ cao, tốn tài nguyên server lớn, nguy cơ bảo mật cao nếu cấu hình Docker không an toàn.
2. **Phương án 2: Sử dụng các dịch vụ Cloud API (Judge0 API)**
   * *Ưu điểm*: Cực kỳ an toàn vì code chạy trên sandbox cô lập của Judge0, hỗ trợ hơn 50 ngôn ngữ lập trình, tài liệu tích hợp rõ ràng, thiết lập nhanh chóng (chỉ mất vài giờ).
   * *Nhược điểm*: Phụ thuộc vào bên thứ ba, có giới hạn số lượt request ở gói miễn phí.

AI khuyên đồ án sinh viên nên bắt đầu bằng cách tích hợp **Judge0 API** để đảm bảo bảo mật tuyệt đối và tập trung thời gian xây dựng nghiệp vụ hệ thống.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi và nhóm đã thống nhất lựa chọn **Phương án 2: Tích hợp Judge0 API** cho hệ thống. Điều này giúp dự án đi đúng hướng, giải quyết triệt để bài toán bảo mật và giúp nhóm tập trung xây dựng các tính năng quan trọng khác.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Mặc dù sử dụng Judge0 API, nhóm đã phát triển thêm một Module trung gian ở Backend (Spring Boot) đóng vai trò làm Queue Manager để quản lý các lượt submit của học viên, tránh quá tải request và thực hiện cơ chế pooling/webhook để cập nhật kết quả thi đấu thời gian thực qua WebSocket.

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

### Prompt số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-15 |
| Công cụ AI | Gemini |
| Mục đích | Thiết lập quy trình làm việc nhóm hiệu quả với Git và giải quyết xung đột code |
| Phần việc liên quan | Other |
| Mức độ sử dụng | Hỏi giải thích / Hỏi ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Chúng tôi là một nhóm gồm 5 sinh viên đang thực hiện dự án SWP391. Hãy hướng dẫn chúng tôi cách sử dụng GitHub để làm việc nhóm hiệu quả, các tính năng cơ bản cần dùng (commit, push, pull, branch, merge, pull request) và đề xuất một luồng làm việc với nhánh (Git Workflow/Git Flow) phù hợp nhất để tránh xung đột code (conflict).
```

#### 5.2. Bối cảnh khi viết prompt

Khi bắt đầu triển khai code những phần đầu tiên, nhóm gặp khó khăn trong việc quản lý mã nguồn chung trên GitHub. Việc code trực tiếp trên một nhánh chính dễ gây ra lỗi đè code lẫn nhau hoặc xảy ra xung đột code (conflict) phức tạp. Vì vậy, tôi cần tìm kiếm giải pháp phân luồng làm việc rõ ràng.

#### 5.3. Kết quả AI trả về

Gemini đã đề xuất mô hình Git Flow rút gọn tối ưu cho đồ án sinh viên:
1. Nhánh `main`: Chỉ chứa mã nguồn ổn định, đã kiểm thử kỹ càng để sẵn sàng bàn giao. Không code trực tiếp trên đây.
2. Nhánh `dev`: Nhánh tích hợp chính của nhóm.
3. Nhánh tính năng cá nhân (`feature/task-name` hoặc `member-name/task-name`): Mỗi thành viên tự tạo nhánh riêng từ `dev` để thực hiện nhiệm vụ của mình.
4. Quy trình Merge: Sau khi hoàn thành tính năng, đẩy code lên GitHub, tạo Pull Request (PR) từ nhánh cá nhân vào nhánh `dev`, mời các thành viên khác review trước khi tiến hành merge.
5. Cung cấp quy trình giải quyết xung đột code khi hai người cùng sửa một file.

#### 5.4. Kết quả đã áp dụng vào bài

Nhóm đã thống nhất và triển khai mô hình Git Flow này cho repository chung của dự án. Mọi thành viên đều tuân thủ việc phát triển tính năng trên nhánh riêng và tạo Pull Request để nhóm trưởng review trước khi tích hợp vào nhánh chính `dev`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Bên cạnh mô hình nhánh do AI gợi ý, tôi đã chủ động thiết lập thêm bộ quy tắc đặt tên commit (Commit Message Convention) theo chuẩn Conventional Commits (ví dụ: `feat: ...`, `fix: ...`, `docs: ...`) và cấu hình file `.gitignore` chuẩn cho các dự án Spring Boot và React để giữ cho repository luôn sạch sẽ.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Quy trình làm việc nhóm rõ ràng giúp các thành viên cộng tác mượt mà, giảm thiểu tối đa conflict và dễ dàng theo dõi lịch sử code.
```

---

### Prompt số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-16 |
| Công cụ AI | Gemini |
| Mục đích | Tạo giao diện trang danh sách khóa học (Course List) và chi tiết khóa học (Course Detail) với React và Tailwind CSS |
| Phân việc liên quan | Frontend / UI Design |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Tôi đang xây dựng Frontend cho nền tảng học lập trình trực tuyến bằng React và Tailwind CSS. Hãy viết code cho một trang danh sách khóa học (Course List) có chứa các card hiển thị thông tin khóa học (tên, hình ảnh, mô tả ngắn, số lượng học viên). Sau đó, viết code cho một trang chi tiết khóa học (Course Detail) hiển thị lộ trình học tập, danh sách các bài học (lessons) và có nút "Bắt đầu học" nổi bật. Hãy thiết kế giao diện theo phong cách hiện đại, sử dụng shadow và border-radius phù hợp.
```

#### 5.2. Bối cảnh khi viết prompt

Khi bắt đầu code phần giao diện Frontend, chúng tôi cần xây dựng trang khóa học thật bắt mắt để thu hút học viên. Việc tự viết CSS từ đầu rất tốn thời gian, nên tôi cần AI tạo ra một bộ khung giao diện chuẩn bằng Tailwind CSS để làm nền tảng phát triển tiếp.

#### 5.3. Kết quả AI trả về

Gemini cung cấp 2 component React hoàn chỉnh:
- `CourseList`: Sử dụng CSS Grid (`grid-cols-1 md:grid-cols-3`) để tạo layout dạng thẻ (cards) responsive. Card có hiệu ứng hover (`hover:shadow-lg hover:-translate-y-1`).
- `CourseDetail`: Có phần Hero section hiển thị thông tin tổng quan, bên dưới là danh sách bài học dạng Accordion (có thể mở rộng/thu gọn) và một Sidebar chứa thông tin giảng viên, giá khóa học và nút đăng ký.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã sử dụng các cấu trúc HTML/Tailwind CSS này để làm bộ khung giao diện cho trang Course. Layout hiển thị rất tốt trên cả màn hình desktop và mobile.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thay vì dùng dữ liệu tĩnh do AI sinh ra, tôi đã kết nối các component này với Redux Store và API Backend để fetch danh sách khóa học thật từ cơ sở dữ liệu. Tôi cũng tinh chỉnh lại màu sắc chủ đạo của card cho khớp với bộ nhận diện thương hiệu của dự án.

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
| File liên quan | `CourseList.jsx`, `CourseDetail.jsx` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sử dụng Tailwind thông qua AI rất tiện lợi, tiết kiệm nhiều thời gian CSS thuần.
```

---

### Prompt số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-16 |
| Công cụ AI | Gemini |
| Mục đích | Xây dựng giao diện Coding Workspace giống LeetCode |
| Phần việc liên quan | Frontend / UI Design |
| Mức độ sử dụng | Hỏi ý tưởng / Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Hãy thiết kế giúp tôi giao diện một không gian làm việc (Coding Workspace) cho trang nộp bài tập lập trình bằng React và Tailwind CSS. Giao diện này cần giống với LeetCode: màn hình chia làm 2 phần chính (trái và phải). Bên trái hiển thị Đề bài, ví dụ (input/output) và các gợi ý. Bên phải chia làm 2 phần trên dưới: phần trên là Code Editor (chọn ngôn ngữ, vùng soạn thảo), phần dưới là Terminal/Console để hiển thị kết quả chạy testcase. Hãy hướng dẫn cách dùng thư viện "react-split" hoặc tương tự để người dùng có thể kéo thả thay đổi kích thước các vùng.
```

#### 5.2. Bối cảnh khi viết prompt

Chức năng cốt lõi của website là giải bài tập lập trình. Giao diện cần phải chuyên nghiệp và quen thuộc như các nền tảng nổi tiếng (LeetCode, HackerRank). Việc chia bố cục màn hình và cho phép kéo thả thanh chia đôi (resizer) khá phức tạp nếu tự làm bằng tay.

#### 5.3. Kết quả AI trả về

Gemini đã hướng dẫn cài đặt thư viện `react-split-pane` (hoặc `allotment`) để tạo layout kéo thả.
Đồng thời, AI viết sẵn một component `Workspace.jsx` với cấu trúc:
- Split ngang giữa Đề bài (trái) và Khu vực code (phải).
- Split dọc ở khu vực bên phải giữa Code Editor và Console.
- Gợi ý sử dụng thư viện `@monaco-editor/react` để tích hợp trình soạn thảo code có highlight syntax như VSCode.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã tích hợp thư viện `allotment` (như AI gợi ý vì `react-split-pane` ít được update) và `@monaco-editor/react` vào dự án. Layout chia đôi màn hình hoạt động trơn tru.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cấu hình lại Monaco Editor để tự động chuyển theme sáng/tối tùy theo cài đặt của hệ thống. Đồng thời bổ sung thêm thanh toolbar để chọn ngôn ngữ lập trình (C++, Java, Python) và liên kết state của editor với hệ thống nộp bài (Judge0 API) đã làm ở backend.

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
| File liên quan | `CodingWorkspace.jsx` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sự kết hợp giữa Monaco Editor và layout kéo thả tạo ra trải nghiệm người dùng cực kỳ tốt.
```

---

### Prompt số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-17 |
| Công cụ AI | Gemini |
| Mục đích | Thiết kế giao diện danh sách thi đấu (Contest) và Leaderboard |
| Phần việc liên quan | Frontend / UI Design |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Viết code cho giao diện trang Danh sách cuộc thi (Contests) và Bảng xếp hạng (Leaderboard) bằng React và Tailwind CSS. Trang Contests cần có các tab: "Sắp diễn ra", "Đang diễn ra", và "Đã kết thúc", mỗi cuộc thi hiển thị dưới dạng card có đếm ngược thời gian (countdown timer). Bảng xếp hạng Leaderboard cần hiển thị dạng bảng (table) gồm Hạng, Tên User, Điểm số, Thời gian giải, hiển thị top 3 có icon huy chương (Vàng, Bạc, Đồng).
```

#### 5.2. Bối cảnh khi viết prompt

Tính năng Contest là phần quan trọng giúp hệ thống trở nên hấp dẫn hơn (gamification). Giao diện cần trực quan, đặc biệt là phần đếm ngược thời gian thi đấu và bảng xếp hạng thể hiện được sự cạnh tranh.

#### 5.3. Kết quả AI trả về

- **Contest List**: Sử dụng state để chuyển đổi giữa các tab. Component card được thiết kế sẵn có chứa icon đồng hồ cát. AI gợi ý logic dùng `setInterval` cơ bản để làm đếm ngược.
- **Leaderboard**: AI tạo ra một Table Tailwind đẹp, với hàng đầu tiên (top 1-3) được hightlight màu sắc nổi bật và có thêm emoji huy chương 🥇 🥈 🥉.

#### 5.4. Kết quả đã áp dụng vào bài

Giao diện bảng xếp hạng được sử dụng lại gần như 90% vì nó rất đẹp và rõ ràng. Các tab chuyển trạng thái cuộc thi cũng hoạt động đúng mong muốn.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Logic đếm ngược thời gian của AI bị lỗi re-render liên tục toàn bộ danh sách gây giật lag. Tôi đã tách riêng logic đếm ngược thành một custom hook `useCountdown` và một component con độc lập để tối ưu hóa hiệu năng render của React.

#### 5.6. Đánh giá chất lượng prompt

- [x] Prompt rõ ràng
- [ ] Prompt có đủ bối cảnh
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
| File liên quan | `ContestList.jsx`, `Leaderboard.jsx` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Cần lưu ý vấn đề hiệu năng React (re-render) khi dùng AI sinh code có chứa interval/timeout.
```

---

### Prompt số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-17 |
| Công cụ AI | Gemini |
| Mục đích | Xây dựng UI trang Profile với biểu đồ thống kê tiến độ học tập |
| Phần việc liên quan | Frontend / UI Design |
| Mức độ sử dụng | Hỏi ý tưởng / Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Tôi muốn thiết kế một trang Profile cá nhân cho người dùng trên hệ thống thi lập trình. Hãy gợi ý cách bố trí giao diện và viết code React + Tailwind. Phần bên trái hiển thị avatar, thông tin cá nhân và huy hiệu đạt được. Phần bên phải hiển thị thống kê học tập, bao gồm số lượng bài tập đã giải (Easy, Medium, Hard) hiển thị dưới dạng biểu đồ tròn (Pie Chart) hoặc thanh tiến độ (Progress bar). Hãy gợi ý thư viện vẽ biểu đồ phù hợp và dễ dùng với React.
```

#### 5.2. Bối cảnh khi viết prompt

Để tăng động lực học tập, học viên cần theo dõi được tiến trình của mình. Tôi muốn có một giao diện Profile hiển thị các số liệu thống kê trực quan bằng biểu đồ, thay vì chỉ là các con số khô khan.

#### 5.3. Kết quả AI trả về

Gemini đề xuất sử dụng thư viện `Recharts` hoặc `Chart.js` (react-chartjs-2) vì dễ dùng và tương thích tốt với React.
AI viết một layout:
- Left Sidebar: Flex column chứa Avatar (dạng hình tròn lớn), Name, Email, Rank, và một grid nhỏ chứa các Icon Badge.
- Right Content:
  - Một dãy các Progress Bar (Màu Xanh lá cho Easy, Vàng cho Medium, Đỏ cho Hard).
  - Khung code mẫu dùng `Recharts` để vẽ biểu đồ tròn (PieChart) thể hiện tỷ lệ bài tập theo mức độ khó.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã chọn `Recharts` theo gợi ý của AI vì code ngắn gọn và dễ tùy biến. Bố cục trang Profile được áp dụng hoàn toàn để hiển thị thông tin học viên.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thay vì dùng biểu đồ tròn, tôi nhận thấy dùng Progress bar vòng cung (Circular Progress Bar) giống kiểu của LeetCode sẽ đẹp hơn. Tôi đã sửa lại code của AI bằng cách kết hợp CSS SVG vòng tròn để tự tạo Circular Progress thay vì tải thêm thư viện nặng.

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
| File liên quan | `UserProfile.jsx` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Không phải lúc nào thư viện AI đề xuất cũng là tối ưu, đôi khi tự code css sẽ nhẹ và linh hoạt hơn.
```

---

### Prompt số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-18 |
| Công cụ AI | Gemini |
| Mục đích | Tạo hiệu ứng Loading Skeleton và hiển thị testcase màu sắc khi chấm bài |
| Phần việc liên quan | Frontend / UI/UX |
| Mức độ sử dụng | Sinh code mẫu / Fix bug UI |

#### 5.1. Prompt nguyên văn

```text
Khi người dùng bấm "Submit Code" sẽ mất khoảng 2-3 giây để server chấm bài. Trong lúc chờ, tôi muốn hiển thị hiệu ứng Loading Skeleton bằng Tailwind CSS thay cho icon loading xoay xoay truyền thống. Sau khi có kết quả trả về, hãy viết code render danh sách các testcase thành một list. Nếu testcase Pass thì chữ màu xanh lá và icon check, nếu Wrong Answer thì màu đỏ và icon X, nếu Time Limit Exceeded thì màu vàng. Dữ liệu mảng testcase có dạng: [{ id: 1, status: "AC" }, { id: 2, status: "WA" }, { id: 3, status: "TLE" }].
```

#### 5.2. Bối cảnh khi viết prompt

Trải nghiệm UX ở phần nộp bài rất quan trọng. Màn hình chờ không được để trống hoặc làm người dùng nhàm chán. Hơn nữa, việc hiển thị kết quả từng testcase (passed/failed) cần rất rõ ràng và dùng màu sắc chuẩn xác để học sinh dễ nhận biết lỗi sai.

#### 5.3. Kết quả AI trả về

- **Loading Skeleton**: AI dùng các class `animate-pulse`, `bg-gray-200`, `rounded` của Tailwind để tạo ra những khối chữ nhật mờ nhấp nháy mô phỏng nội dung đang tải.
- **Render List**: AI viết một hàm `getTestcaseStyle(status)` dùng switch-case để trả về cấu hình CSS tương ứng (`text-green-500`, `text-red-500`, `text-yellow-500`) và map mảng dữ liệu ra giao diện.

#### 5.4. Kết quả đã áp dụng vào bài

Giao diện Loading Skeleton làm cho ứng dụng trông "xịn" như các nền tảng web hiện đại. Bảng màu cho testcase chuẩn xác và được tích hợp trực tiếp vào vùng Console của Coding Workspace (từ Prompt 6).

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Để giao diện đẹp hơn nữa, thay vì hiện toàn bộ testcase cùng lúc, tôi đã thêm một chút hiệu ứng animation trượt vào (slide-in) cho từng testcase xuất hiện tuần tự để mô phỏng quá trình đang chấm từng bài một, tạo cảm giác hồi hộp cho người chơi.

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
| File liên quan | `SubmissionResult.jsx` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Các hiệu ứng nhỏ như Skeleton Loading giúp UX tăng lên đáng kể.
```

---

### Prompt số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-19 |
| Công cụ AI | Gemini |
| Mục đích | Tìm hiểu cách tích hợp thanh toán bằng VietQR với payOS |
| Phần việc liên quan | Backend / Payment |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Tôi đang xây dựng một dự án hệ thống giáo dục có tính năng thanh toán khóa học. Tôi muốn tích hợp cổng thanh toán VietQR qua payOS. Hãy giải thích cho tôi luồng hoạt động (workflow) cơ bản của việc tích hợp này, từ lúc user bấm mua hàng trên Frontend (React) đến lúc Backend (Spring Boot) xử lý và nhận được thông báo thanh toán thành công (webhook).
```

#### 5.2. Bối cảnh khi viết prompt

Nhóm muốn thêm tính năng mua khóa học hoặc nâng cấp tài khoản VIP. Việc tích hợp thanh toán ngân hàng truyền thống khá phức tạp, nên nhóm quyết định dùng payOS để hỗ trợ quét mã VietQR cho tiện lợi. Tuy nhiên, tôi chưa hiểu rõ luồng giao tiếp giữa Frontend, Backend và server của payOS diễn ra như thế nào.

#### 5.3. Kết quả AI trả về

Gemini giải thích luồng tích hợp rất rõ ràng gồm 4 bước chính:
1. Client (React) gửi request tạo đơn hàng lên Server (Spring Boot).
2. Server gọi API của payOS để tạo Payment Link, payOS trả về link checkout chứa mã VietQR. Server gửi link này lại cho Client.
3. Client chuyển hướng người dùng sang trang checkout của payOS để quét mã thanh toán.
4. Khi người dùng chuyển khoản thành công, payOS gửi một request (Webhook) về Server của mình để cập nhật trạng thái đơn hàng thành "Đã thanh toán".

#### 5.4. Kết quả đã áp dụng vào bài

Từ luồng hoạt động AI cung cấp, tôi đã hiểu cách thiết kế API, viết logic tạo đơn hàng ở Backend và xử lý điều hướng trang ở Frontend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã vẽ lại luồng này thành một Sequence Diagram để bổ sung vào tài liệu phân tích thiết kế hệ thống, giúp cả nhóm cùng hiểu cách hoạt động của tính năng thanh toán.

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
| File liên quan | Sơ đồ Sequence Diagram |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Việc hiểu rõ workflow trước khi code giúp quá trình code sau đó ít xảy ra lỗi logic hơn.
```

---

### Prompt số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-20 |
| Công cụ AI | Gemini |
| Mục đích | Hướng dẫn code setup tích hợp payOS bằng Spring Boot và React |
| Phần việc liên quan | Backend / Frontend / Payment |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Dựa vào luồng tích hợp payOS ở trên, hãy hướng dẫn tôi cách code setup chi tiết. Ở Backend dùng Java Spring Boot, hãy chỉ tôi cách dùng thư viện payos-java để tạo ra một Payment Link. Ở Frontend dùng React, hãy viết đoạn code gọi API tạo đơn hàng và chuyển hướng người dùng sang trang thanh toán của payOS. Hãy đưa ra ví dụ cụ thể nhé.
```

#### 5.2. Bối cảnh khi viết prompt

Sau khi nắm được luồng lý thuyết, tôi cần bắt tay vào code thực tế. Do là lần đầu tích hợp payOS, tôi muốn có một bộ khung code chuẩn để khởi tạo config (clientId, apiKey, checksumKey) và cách gọi hàm tạo link thanh toán đúng chuẩn thư viện Java của họ.

#### 5.3. Kết quả AI trả về

Gemini cung cấp các đoạn code chi tiết:
- **Backend (Spring Boot):** Hướng dẫn thêm dependency `payos-java` vào pom.xml. Viết class config khởi tạo đối tượng `PayOS`. Viết một Controller có endpoint `/create-payment-link` nhận vào số tiền, mô tả đơn hàng, sau đó gọi `payOS.createPaymentLink()` và trả về url thanh toán.
- **Frontend (React):** Một hàm `handleCheckout` dùng `fetch` gọi lên API Backend, lấy url và dùng `window.location.href = url` để redirect.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã copy cấu trúc config và API endpoint vào project Spring Boot. Ở Frontend, tôi gắn logic vào nút "Thanh toán ngay" ở giỏ hàng. Chạy thử và đã tạo thành công trang thanh toán chứa mã VietQR.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Thay vì lưu các key (apiKey, clientId) thẳng trong file Java như AI ví dụ, tôi đã chuyển hết vào file cấu hình `application.properties` để bảo mật. Ngoài ra, tôi xử lý thêm lưu thông tin đơn hàng trạng thái "PENDING" vào database trước khi gọi payOS.

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
| File liên quan | `PaymentController.java`, `PayOSConfig.java` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Luôn nhớ bảo mật các khóa API, không được commit thẳng lên GitHub.
```

---

### Prompt số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-21 |
| Công cụ AI | Gemini |
| Mục đích | Dùng ngrok để test webhook của payOS ở local lúc đang xây dựng |
| Phần việc liên quan | Backend / Testing |
| Mức độ sử dụng | Hỏi công cụ / Hướng dẫn |

#### 5.1. Prompt nguyên văn

```text
Tôi đã code xong API nhận Webhook từ payOS trên Spring Boot ở localhost:8080. Nhưng server của payOS không thể gửi webhook đến địa chỉ localhost của tôi được. Nghe nói có thể dùng ngrok để giải quyết vấn đề này trong lúc đang dev. Hãy hướng dẫn tôi cách cài đặt ngrok, expose port 8080 và cách cấu hình url đó lên trang quản trị của payOS để test thử giao dịch thành công.
```

#### 5.2. Bối cảnh khi viết prompt

Để biết giao dịch đã thanh toán hay chưa, payOS gửi một request tới URL server của nhóm. Tuy nhiên, server nhóm vẫn đang chạy trên máy cá nhân (localhost) chưa deploy lên mạng, nên payOS không thể ping tới được. Cần một công cụ để public localhost ra internet tạm thời để test webhook.

#### 5.3. Kết quả AI trả về

Gemini hướng dẫn rất chi tiết từng bước:
1. Tải và cài đặt ngrok từ trang chủ.
2. Xác thực tài khoản ngrok bằng lệnh `ngrok config add-authtoken <token>`.
3. Chạy lệnh `ngrok http 8080` để tạo một URL public (vd: `https://abcd.ngrok-free.app`).
4. Copy URL đó thêm hậu tố API webhook (vd: `https://abcd.ngrok-free.app/payos/webhook`) vào mục cài đặt Webhook trên trang quản trị payOS.
5. Khi có giao dịch thanh toán, payOS sẽ gọi đến ngrok, và ngrok sẽ forward về `localhost:8080` trên máy mình.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi làm theo từng bước và đã thành công. Khi tôi quét mã QR thanh toán thử, terminal Spring Boot của tôi hiện ra log báo đã nhận được payload của webhook và cập nhật đơn hàng thành "PAID".

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

AI chỉ hướng dẫn chạy ngrok cơ bản. Tôi đã viết thêm một script nhỏ `.bat` trên máy để chỉ cần click đúp là tự chạy `ngrok http 8080` nhanh chóng cho các lần code sau đỡ phải gõ lại lệnh. Tôi cũng tìm hiểu thêm cách verify webhook signature (mã hóa HMAC) để đảm bảo an toàn cho endpoint webhook.

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
| File liên quan | Log chạy ngrok |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
ngrok là một công cụ cực kỳ tuyệt vời và bắt buộc phải biết khi làm các tính năng liên quan đến Webhook.
```

---

### Prompt số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích | Tối ưu hóa danh sách Use Case và phân chia lại các Use Case bị trùng lặp của hệ thống |
| Phân việc liên quan | Requirement |
| Mức độ sử dụng | Hỏi ý tưởng / Phân tích |

#### 5.1. Prompt nguyên văn

```text
Bạn là một chuyên gia phân tích nghiệp vụ phần mềm (Business Analyst). Tôi đang xây dựng đặc tả yêu cầu (SRS) cho hệ thống "Integrated Coding Education & Competitive Programming Platform". Hãy rà soát danh sách các chức năng hiện tại và đề xuất gộp các Use Case trùng lặp hoặc có quan hệ chặt chẽ với nhau (ví dụ: gộp Đăng nhập thường và Google OAuth; gộp Khóa và Mở khóa tài khoản; gộp các chức năng CRUD bài học). Hãy chia chúng thành 4 phân hệ chính (Authentication & Common, E-Learning, E-Commerce, Online Judge) sao cho số lượng Use Case tinh gọn, hợp lý nhưng vẫn giữ được độ phủ nghiệp vụ đầy đủ.
```

#### 5.2. Bối cảnh khi viết prompt

Khi bắt đầu viết chi tiết các Use Case Specification trong SRS, tôi thấy số lượng chức năng rời rạc quá nhiều (hơn 80 chức năng), gây loãng tài liệu và trùng lặp rất nhiều phần mô tả luồng chính. Tôi cần một phương pháp gộp và tái cấu trúc hệ thống Use Case khoa học hơn.

#### 5.3. Kết quả AI trả về

AI đề xuất cấu trúc gộp vừa phải thành 61 Use Case chi tiết thuộc 4 phân hệ chính. Cách gộp rất hợp lý, ví dụ: gộp quy trình nạp tiền, lấy link nạp tiền, và hủy giao dịch payOS thành 1 Use Case duy nhất `UC-ECO-01_Deposit Credits via payOS` thay vì tách nhỏ làm 3 Use Case.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã áp dụng toàn bộ cấu trúc gộp Use Case này để xây dựng danh sách Use Case Specification chính thức cho tài liệu SRS của nhóm.

#### 5.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

Tôi đã rà soát lại và điều chỉnh tên tiếng Anh của các Use Case cho chuẩn hóa (ví dụ đổi "Do Quiz" thành "Practice Quiz", "Deposit Credits" thành "Deposit Credits via payOS"), đồng thời phân bổ lại một số Use Case giữa phân hệ E-Commerce và E-Learning để phản ánh đúng luồng dữ liệu của dự án.

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
| File liên quan | Mục lục Use Case trong SRS |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Gộp Use Case giúp giảm công sức viết đặc tả trùng lặp, tập trung vào mô tả luồng xử lý sâu hơn.
```

---

### Prompt số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích | Thống kê số lượng màn hình duy nhất từ danh sách đầu vào thô |
| Phân việc liên quan | Requirement / Testing |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Hãy viết một script bằng Python để đọc danh sách 94 màn hình của một ứng dụng web (chứa cả các đường dẫn trùng lặp, các màn hình con, và các trạng thái chuyển trang). Script cần thực hiện chuẩn hóa tên màn hình, loại bỏ các mục trùng lặp và thống kê chính xác số lượng màn hình duy nhất (unique screens). Đầu ra yêu cầu hiển thị số lượng và danh sách màn hình đã làm sạch.
```

#### 5.2. Bối cảnh khi viết prompt

Danh sách màn hình người dùng gửi lên bị trùng lặp và lộn xộn (nhiều trang con lồng nhau hoặc khác param đường dẫn nhưng cùng 1 màn hình). Tôi muốn thống kê chính xác số lượng màn hình duy nhất để lập bảng mô tả màn hình (Screen List) mà không phải đếm thủ công dễ sai sót.

#### 5.3. Kết quả AI trả về

AI cung cấp code script Python sử dụng Set để tự động loại bỏ trùng lặp và in ra kết quả đếm. Kết quả lọc ra còn 79 màn hình duy nhất.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã lưu và chạy script Python này tại scratch/count_screens.py và có số liệu chính xác để báo cáo.

#### 5.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

Tôi đã tinh chỉnh thêm logic trong file script để phân loại các màn hình theo từng Subsystem (Xác thực, Học tập, Tài chính, Trình chấm) giúp báo cáo trực quan hơn.

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
| File liên quan | scratch/count_screens.py |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sử dụng script giúp tiết kiệm thời gian đếm và lập báo cáo rất nhiều.
```

---

### Prompt số 15

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Phân tích mã nguồn backend để trích xuất bảng Business Rules |
| Phân việc liên quan | Design / Backend |
| Mức độ sử dụng | Hỏi ý tưởng / Phân tích |

#### 5.1. Prompt nguyên văn

```text
Bạn là một Kiến trúc sư Phần mềm (Software Architect). Tôi muốn bạn phân tích toàn bộ mã nguồn Backend Spring Boot của dự án, đặc biệt là các phần xử lý thanh toán ví điện tử (WalletService.java), công thức tính điểm phạt thi đấu ICPC (ContestRankingService.java), cơ chế AI kiểm duyệt video và CV (Gemini Embedding). Hãy trích xuất và lập bảng danh sách các Business Rules (Quy tắc nghiệp vụ) thực tế đi kèm mã ID chuẩn xác (BR-COM, BR-EDU, BR-ECO, BR-OJ).
```

#### 5.2. Bối cảnh khi viết prompt

Tôi cần tài liệu hóa các quy tắc nghiệp vụ trong SRS (Phần Business Rules) nhưng không muốn viết các lý thuyết suông. Tôi cần tìm các ràng buộc thực tế trong code hiện tại của dự án để đảm bảo tính đồng bộ giữa thiết kế và code thực tế.

#### 5.3. Kết quả AI trả về

AI gợi ý danh sách ban đầu gồm 24 quy tắc nghiệp vụ: mã hóa mật khẩu, logic điểm phạt ICPC, AI quét đạo văn, và cơ chế Pessimistic Locking của ví.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã sử dụng các quy tắc này làm nền tảng nghiệp vụ cốt lõi để đưa vào tài liệu đặc tả hệ thống.

#### 5.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

Tôi đã yêu cầu AI phân tích sâu thêm và mở rộng bảng quy tắc nghiệp vụ lên 55 quy tắc chi tiết (granular), bổ sung các nghiệp vụ như: quy tắc tính streak điểm danh hàng ngày, luật chia doanh thu 70/30, phí cổng thanh toán 2%, và quy tắc giới hạn hiển thị testcase lỗi để bảo mật đề bài.

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
| File liên quan | business_rules.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Hiểu và nắm chắc Business Rules là điều kiện tiên quyết để code không lỗi logic.
```

---

### Prompt số 16

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Gộp bảng Business Rules và chuyển ngữ toàn bộ sang tiếng Anh chuyên ngành |
| Phân việc liên quan | Requirement |
| Mức độ sử dụng | Sinh văn bản mẫu |

#### 5.1. Prompt nguyên văn

```text
Hãy tối ưu hóa tài liệu Business Rules của tôi bằng cách gộp tất cả các bảng phân hệ thành một bảng tổng hợp duy nhất. Đồng thời, hãy dịch toàn bộ nội dung sang tiếng Anh chuyên ngành phần mềm (formal technical English), sử dụng các thuật ngữ kỹ thuật chính xác như "Pessimistic Locking", "BCrypt Hashing", "Cosine Similarity", "ICPC Penalty Formula".
```

#### 5.2. Bối cảnh khi viết prompt

Tôi cần nộp tài liệu SRS bằng tiếng Anh. Bản Business Rules ban đầu viết bằng tiếng Việt và chia nhỏ thành 4 bảng. Tôi muốn quy chuẩn lại thành một bảng duy nhất và dịch sang tiếng Anh chuyên ngành chuẩn để giáo viên đánh giá.

#### 5.3. Kết quả AI trả về

AI cung cấp bảng dịch tiếng Anh chuẩn, có định dạng LaTeX hiển thị công thức toán học tốt.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã sử dụng trực tiếp bảng dịch tiếng Anh này để làm phụ lục Business Rules cho tài liệu SRS tiếng Anh của dự án.

#### 5.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

Các công thức toán học dạng khối LaTeX ($$) hiển thị rất xấu trên bảng Markdown và làm vỡ layout của bảng. Tôi đã tự tinh chỉnh các công thức toán học về dạng văn bản inline đơn giản và trực quan hơn (ví dụ: Penalty = (Elapsed time to AC) + (Incorrect attempts * 20)).

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
| File liên quan | business_rules.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Chuyển đổi ngôn ngữ tài liệu sang tiếng Anh giúp tăng tính chuyên nghiệp của sản phẩm.
```

---

### Prompt số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế danh mục 100 thông điệp ứng dụng (Application Messages Catalog) bằng tiếng Anh |
| Phân việc liên quan | Requirement / UI Design |
| Mức độ sử dụng | Sinh văn bản mẫu |

#### 5.1. Prompt nguyên văn

```text
Dựa trên bản mẫu danh mục thông điệp (Message Code, Message Type, Context Content, Display Message) mà tôi cung cấp từ một dự án khác, hãy phân tích hệ thống Coding & E-Learning của tôi và xây dựng một danh sách đầy đủ gồm 100 thông điệp thông báo, cảnh báo lỗi và toast alerts bằng tiếng Anh. Đảm bảo phản ánh đúng các lỗi nghiệp vụ của Judge0 (verdicts AC, WA, TLE, MLE, CE) và lỗi thanh toán payOS.
```

#### 5.2. Bối cảnh khi viết prompt

Tôi cần xây dựng một danh sách các câu thông điệp báo lỗi hoặc thông báo thành công cho hệ thống. Danh sách mẫu của tôi từ dự án khác liên quan đến quản lý phòng trọ nên tôi cần AI chuyển đổi nghiệp vụ sang hệ thống Coding Platform.

#### 5.3. Kết quả AI trả về

AI cung cấp một catalog gồm 100 mã lỗi (MSG01-MSG100) bằng tiếng Anh rất phong phú và chính xác, phân loại rõ kiểu hiển thị (Toast, In line, In red under text).

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã lưu tệp này thành application_messages.md và sử dụng để gán trực tiếp vào các Use Case Specification trong tài liệu SRS.

#### 5.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

Tôi đã điều chỉnh một số Display Message để câu từ tự nhiên và ngắn gọn hơn, đồng thời đảm bảo các mã lỗi khớp chính xác với mã ErrorCode được định nghĩa trong mã nguồn Java Spring Boot của dự án.

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
| File liên quan | application_messages.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Một catalog thông điệp tập trung giúp nhóm thiết kế UI/UX đồng bộ hơn.
```

---

### Prompt số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Soạn thảo tài liệu Yêu cầu dùng chung (Common Requirements) quy định về phân trang, định dạng ngày giờ và phản hồi API |
| Phân việc liên quan | Requirement |
| Mức độ sử dụng | Sinh văn bản mẫu |

#### 5.1. Prompt nguyên văn

```text
Hãy soạn thảo tài liệu Common Requirements đặc tả các quy chuẩn kỹ thuật dùng chung cho toàn bộ dự án. Tài liệu cần làm rõ: (1) Chuẩn phân trang API GET (mapping Spring Boot Pageable), (2) Định dạng hiển thị và lưu trữ ngày giờ ISO 8601 UTC, (3) Cấu trúc gói tin phản hồi thành công và lỗi (Global Success/Error Envelope), (4) Quy tắc sắp xếp và tìm kiếm dữ liệu.
```

#### 5.2. Bối cảnh khi viết prompt

Tôi cần định nghĩa các quy tắc chung (Common Requirements) cho dự án để cả nhóm tuân theo khi thiết kế và code, đặc biệt là cách phân trang API, cách lưu thời gian UTC và cấu trúc gói tin JSON trả về để Frontend và Backend kết nối đồng bộ.

#### 5.3. Kết quả AI trả về

AI cung cấp tài liệu Common Requirements tiếng Anh chi tiết, định nghĩa chính xác cấu trúc PageResponse của Spring Boot và chuẩn ISO 8601.

#### 5.4. Kết quả đã áp dụng vào bài

Tài liệu được lưu thành common_requirements.md để làm tài liệu thiết kế và bàn giao cho các thành viên trong nhóm phát triển Frontend và Backend.

#### 5.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

Tôi đã tinh chỉnh lại trường `page` trong phản hồi API phân trang từ 0-indexed thành 1-indexed ở tầng hiển thị của Frontend để người dùng cuối không bị bối rối khi xem trang số 1.

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
| File liên quan | common_requirements.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Các quy chuẩn chung giúp việc phát triển phần mềm mượt mà, tránh mâu thuẫn về thiết kế gói tin giữa các thành viên.
```

---

### Prompt số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Rà soát và thống kê chi tiết Use Case của Admin không sử dụng từ khóa "Manage" |
| Phân việc liên quan | Requirement / Design |
| Mức độ sử dụng | Hỏi ý tưởng / Phân tích |

#### 5.1. Prompt nguyên văn

```text
Bạn là một Chuyên viên Phân tích Nghiệp vụ Phần mềm (Business Analyst). Hãy phân tích toàn bộ mã nguồn Backend Spring Boot thuộc các lớp Admin Controller (AdminUserController, AdminInstructorController, AdminCourseController, AdminContestController, AdminProblemController, AdminFinancialController, AdminDashboardController) của dự án. Hãy đề xuất danh sách các Use Case chi tiết tương ứng với các Controller này. Ràng buộc: Tuyệt đối không sử dụng từ khóa "Manage" (Quản lý) trong tên Use Case do quy định khắt khe của hội đồng chấm thi đồ án; thay vào đó, hãy dùng các động từ hành động cụ thể (như Browse, Lock/Unlock, Approve/Reject, Create, Update, Delete, Audit). Định dạng đầu ra: Danh sách phân loại theo nhóm nghiệp vụ kèm mô tả chi tiết tiếng Việt và tiếng Anh.
```

#### 5.2. Bối cảnh khi viết prompt

Tôi cần tài liệu hóa các Use Case cho tài liệu đặc tả hệ thống (SRS). Tuy nhiên, giảng viên phản biện đồ án cực kỳ khắt khe với từ "Manage" (Quản lý) vì cho rằng nó quá chung chung và lười phân rã chức năng. Do đó, tôi cần AI rà soát mã nguồn các Admin Controller thực tế của hệ thống để phân rã chi tiết thành các hành động cụ thể.

#### 5.3. Kết quả AI trả về

Gemini/Antigravity đề xuất danh sách 21 Use Case chi tiết tương ứng với từng Controller, phân nhóm theo 6 khu vực quản trị lớn:
1. User: Browse Platform Users, Lock/Unlock User Account.
2. Instructor: Browse Instructor Applications, Approve/Reject Instructor Application, Suspend Instructor.
3. Course Moderation: Browse Submitted Courses, Approve/Reject Course Publication.
4. Contest: Browse Contests, Create/Edit/Delete/Publish Contest, Add/Remove Problem.
5. Problems: Browse Practice Problems, Create/Edit/Delete Problem, Set Up Problem Testcases.
6. Financial Reports: View Platform Dashboard, View Monthly Financial Records, Audit Deposit Transactions, View Financial Audit Details.

#### 5.4. Kết quả đã áp dụng vào bài

Chúng tôi đã cập nhật lại danh sách Use Case Admin trong báo cáo đồ án của nhóm, chuyển đổi các tên Use Case thô thành dạng cụ thể như `Approve/Reject Course Publication` hoặc `Lock/Unlock User Account`.

#### 5.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

Tôi đã gộp các hành động có tính chất ngược nhau vào một bong bóng để sơ đồ không bị quá dày đặc (như gộp Lock và Unlock thành `Lock/Unlock User Account`), đồng thời viết chi tiết các luồng sự kiện (Basic Flow, Alternative Flow) tương ứng trong SRS.

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
| File liên quan | Tài liệu SRS của nhóm |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Việc thay thế từ "Manage" giúp tài liệu phân tích nghiệp vụ trở nên cực kỳ chuyên nghiệp và thuyết phục.
```

---

### Prompt số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Phân rã và thiết lập mối quan hệ UML cho phân hệ chấm bài (Judge0) và thanh toán (PayOS) |
| Phân việc liên quan | Design / Architecture |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Bạn là một Kiến trúc sư Hệ thống (System Architect). Tôi đang vẽ sơ đồ Use Case phân rã cho hai phân hệ tích hợp bên thứ ba: (1) Chấm bài qua Judge0 API và (2) Nạp tiền qua PayOS Gateway. Hãy đề xuất danh sách Use Case chi tiết cho từng phân hệ, xác định rõ vai trò tương tác của các tác nhân (Customer là tác nhân chính, Judge0/PayOS là tác nhân phụ). Hãy chỉ ra các mối quan hệ "include" và "extend" cụ thể giữa các Use Case này (ví dụ: mối quan hệ giữa tạo link nạp tiền, hủy nạp tiền, xử lý callback, xác thực chữ ký bảo mật, cộng số dư ví).
```

#### 5.2. Bối cảnh khi viết prompt

Tôi cần làm sơ đồ đặc tả phân hệ (sub-system use case diagrams) cho hai chức năng phức tạp là thanh toán và chấm bài. Do có sự tương tác của tác nhân bên thứ ba (PayOS, Judge0) nên cách vẽ các mũi tên `<<include>>` và `<<extend>>` rất dễ bị sai hướng hoặc sai bản chất logic của luồng đi.

#### 5.3. Kết quả AI trả về

AI đưa ra cấu trúc các Use Case con và quan hệ UML rõ ràng:
- Judge0: Customer gọi `Submit Code` -> kết nối tới Judge0. Webhook của Judge0 gọi về `Receive Webhook Verdicts`. Tiến trình chấm bài được đẩy thời gian thực qua WebSocket `Monitor Grading Progress`.
- PayOS: Customer gọi `Request Deposit Link`. Giao dịch có thể hủy qua `Cancel Pending Deposit` (quan hệ <<extend>> trỏ về Request Deposit Link). Khi thanh toán xong, PayOS gọi Webhook `Receive Webhook Confirmation` -> bắt buộc phải thực hiện các sub-behaviors qua quan hệ <<include>>: `Verify Payment Signature`, `Credit Wallet Balance`, `Log Transaction`, `Send Payment Notification`.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã sử dụng các cấu trúc này vẽ sơ đồ Use Case chi tiết cho 2 phân hệ và giải thích luồng hoạt động trong báo cáo đồ án.

#### 5.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

Tôi đã tự thiết kế sơ đồ UML chi tiết bằng Draw.io dựa trên các quan hệ này. Đồng thời bổ sung điều kiện ràng buộc trong SRS: Chỉ thực hiện cộng tiền (`Credit Wallet Balance`) sau khi `Verify Payment Signature` thành công để tránh lỗi bảo mật.

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
| File liên quan | Sơ đồ phân hệ PayOS / Judge0 trong SRS |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Phân tích kỹ lưỡng luồng chạy của webhook và API giúp thiết kế các mối quan hệ UML chính xác, phản ánh đúng kiến trúc hướng sự kiện (event-driven) của code.
```

---

### Prompt số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết lập bảng đặc tả Actor, Use Case chi tiết và 26 thực thể cơ sở dữ liệu cho tài liệu SRS |
| Phân việc liên quan | Requirement / Design |
| Mức độ sử dụng | Sinh văn bản mẫu |

#### 5.1. Prompt nguyên văn

```text
Bạn là một Technical Writer chuyên nghiệp. Tôi đang viết chương 2 (Actor và Use Case) và chương 3 (Cơ sở dữ liệu) của tài liệu đặc tả yêu cầu phần mềm (SRS). Hãy giúp tôi viết hai bảng biểu chi tiết sau: (1) Bảng đặc tả 6 Actor (Guest, Customer, Instructor, Admin, Judge0, payOS) gồm ID, Actor, Phân loại, Đặc điểm & Quyền hạn; (2) Bảng đặc tả 26 thực thể dữ liệu (bao gồm 22 thực thể cơ bản về học tập/thanh toán cùng 4 thực thể mới: user_daily_activities, contest_rankings, problem_submissions, problem_submission_details) gồm ID, Entity, Description; (3) Bảng đặc tả hơn 80 Use Case của toàn bộ hệ thống gồm ID, Use Case, Actors, Description. Ràng buộc: Nội dung phải ngắn gọn, súc tích, viết bằng tiếng Anh chuyên ngành chuẩn xác.
```

#### 5.2. Bối cảnh khi viết prompt

Để tài liệu SRS chuyên nghiệp và đạt chuẩn của trường FPT, mọi định nghĩa về Actor, Use Case và Entity cần phải được làm thành bảng (tabular layout) và viết bằng tiếng Anh kỹ thuật chuyên nghiệp. Việc viết thủ công từng dòng mô tả cho 80 Use Case và 26 thực thể mất rất nhiều thời gian và dễ bị không đồng bộ về văn phong.

#### 5.3. Kết quả AI trả về

AI cung cấp 3 bảng dữ liệu bằng Markdown cực kỳ chi tiết, dùng tiếng Anh chuyên ngành chuẩn xác, phân loại rõ ràng và đính kèm đầy đủ ID định danh cho từng dòng bản ghi.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã lưu và áp dụng toàn bộ 3 bảng này vào tài liệu đặc tả SRS của nhóm, tạo thành các file `actor_descriptions.md`, `use_case_descriptions.md`, và `entity_descriptions_v2.md` trong hệ thống tài liệu dự án.

#### 5.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

Tôi đã tinh chỉnh lại thứ tự sắp xếp của bảng thực thể (Entity) để nó đi liền mạch từ phần tài khoản sang phần khóa học, rồi đến phần bài tập và chấm bài, giúp người đọc dễ theo dõi luồng dữ liệu hơn so với bảng thô ban đầu, đồng thời sửa lại một số thuật ngữ tiếng Anh mô tả Use Case cho tự nhiên hơn.

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
| File liên quan | actor_descriptions.md, use_case_descriptions.md, entity_descriptions_v2.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sở hữu các bảng đặc tả chuẩn chỉnh và được viết bằng tiếng Anh kỹ thuật giúp nâng cao giá trị tài liệu báo cáo của dự án lên rất nhiều.
```

---

### Prompt số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tư vấn thiết kế ERD và chuẩn hóa mối quan hệ giữa các thực thể hệ thống |
| Phân việc liên quan | Design / Database |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 5.1. Prompt nguyên văn

```text
Bạn là một Chuyên gia Thiết kế Cơ sở dữ liệu (Database Designer). Tôi đang hoàn thiện sơ đồ ERD cho hệ thống Online Judge. Hãy tư vấn giúp tôi: (1) Nếu tôi đã thêm thực thể problem_submissions và problem_submission_details để lưu lịch sử nộp bài, tôi có nên giữ mối quan hệ Nhiều-Nhiều (N-N) trực tiếp giữa Users và Problems nữa không? (2) Mối quan hệ giữa bộ đề testcase (problem_testcases) và kết quả chạy chi tiết (problem_submission_details) là 1-1 hay 1-N? Tại sao? (3) Mối quan hệ giữa lessons và problems là gì và xử lý thế nào? (4) Có nên thêm bảng user_daily_activities để tính streak không?
```

#### 5.2. Bối cảnh khi viết prompt

Trong lúc thiết kế ERD, tôi gặp một số mâu thuẫn về tính chuẩn hóa dữ liệu (Normal Forms). Đặc biệt là sự phân vân giữa việc giữ liên kết N-N trực tiếp của bài tập và học viên so với việc tạo bảng trung gian lưu lịch sử nộp bài (submissions), cũng như băn khoăn về chiều của các mối quan hệ 1-N và bảng học tập hàng ngày.

#### 5.3. Kết quả AI trả về

AI đã giải thích chi tiết các nguyên tắc chuẩn hóa dữ liệu:
1. Phải BỎ quan hệ N-N trực tiếp giữa Users và Problems vì nó đã được thay thế (resolve) thông qua thực thể kết hợp problem_submissions. Giữ cả hai sẽ bị lỗi dư thừa mối quan hệ.
2. Quan hệ giữa problem_testcases và details là 1-N (Một testcase chạy trong nhiều lượt nộp bài của nhiều người dùng khác nhau). Nếu để 1-1 sẽ bị lỗi chỉ cho phép chạy testcase đó một lần duy nhất.
3. Quan hệ giữa lessons và problems là N-N (Một bài học có nhiều bài tập, một bài tập trong ngân hàng đề có thể dùng cho nhiều bài học). Cần giải quyết bằng bảng trung gian lesson_problems chứa trường order_index.
4. Rất nên thêm user_daily_activities để vẽ biểu đồ nhiệt (heatmap) và lưu streak học tập, tạo quan hệ 1-N từ users sang.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã loại bỏ đường nối N-N trực tiếp dư thừa và cập nhật chính xác các đầu quan hệ 1-N và N-N của các bảng trên sơ đồ ERD bằng Draw.io.

#### 5.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

Tôi tự tay cấu hình lại khóa ngoại (Foreign Keys) và các thuộc tính đi kèm trong SQL Script sinh database, đảm bảo khớp 100% với logic ERD đã được chuẩn hóa theo tư vấn của AI, đồng thời thêm ràng buộc unique (user_id, activity_date) cho bảng hoạt động hàng ngày.

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
| File liên quan | SQL Schema và sơ đồ ERD của dự án |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Hiểu rõ sự khác biệt giữa sơ đồ thực thể khái niệm (Conceptual ERD) và sơ đồ vật lý (Physical Schema) giúp thiết kế database sạch, tránh được các lỗi truy vấn dữ liệu phức tạp sau này.
```

---

### Prompt số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-27 |
| Công cụ AI | Antigravity |
| Mục đích | Sửa lỗi không khởi chạy được Backend Spring Boot do thiếu cấu hình Database |
| Phần việc liên quan | Backend / Configuration |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Bạn là một chuyên gia Spring Boot. Ứng dụng Backend Java Spring Boot của tôi bị crash khi khởi động với lỗi "Failed to configure a DataSource: 'url' attribute is not specified and no embedded datasource could be configured. Reason: Failed to determine a suitable driver class". Hãy phân tích nguyên nhân cốt lõi gây ra lỗi này và hướng dẫn tôi các phương án khắc phục chi tiết (bao gồm cấu hình database, cách kích hoạt profile phát triển để nạp file cấu hình tương ứng). Hãy trình bày rõ ràng kèm ví dụ minh họa.
```

#### 5.2. Bối cảnh khi viết prompt

Ứng dụng backend của dự án bị crash ngay khi khởi động bằng Maven do lỗi thiếu cấu hình DataSource, khiến việc chạy và test dự án bị gián đoạn. Tôi chưa nắm rõ nguyên nhân vì sao Spring Boot lại yêu cầu cấu hình database và cách chỉ định nạp file cấu hình phát triển `application-dev.yaml`.

#### 5.3. Kết quả AI trả về

Antigravity đã giải thích nguyên nhân là do Spring Boot tự động cấu hình kết nối DB (DataSource Auto-configuration) khi phát hiện dependency trong classpath nhưng không tìm thấy URL, username, password kết nối trong file cấu hình mặc định. AI đề xuất 3 giải pháp:
1. Cấu hình trực tiếp URL/User/Password trong file application.properties.
2. Chạy ứng dụng kèm tham số kích hoạt profile chứa cấu hình tương ứng (ví dụ: `mvn spring-boot:run -Dspring-boot.run.profiles=dev`).
3. Loại bỏ DataSourceAutoConfiguration khỏi class chạy chính bằng annotation `@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})` nếu chưa dùng DB.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã áp dụng cách thức khởi chạy ứng dụng bằng cách chỉ định profile `dev` (`-Dspring-boot.run.profiles=dev`) để nạp file cấu hình database thực tế.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã kiểm tra cấu hình database trong file `application-dev.yaml` xem có trùng khớp với PostgreSQL đang chạy ở máy local hay không trước khi chạy lệnh.

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
| File liên quan | application-dev.yaml |
| Screenshot |  |
| Kết quả chạy/test | Backend khởi chạy thành công sau khi load đúng cấu hình dev |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Cơ chế Auto-configuration của Spring Boot rất thông minh nhưng cũng dễ gây bối rối nếu thiếu tệp cấu hình tương ứng.
```

---

### Prompt số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-27 |
| Công cụ AI | Antigravity |
| Mục đích | Cấu hình phím tắt (alias) Zsh trên macOS và tìm hiểu các loại Shell để tối ưu hóa lệnh khởi chạy nhanh Spring Boot |
| Phân việc liên quan | Other |
| Mức độ sử dụng | Hỏi ý tưởng / Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Bạn là một chuyên gia về hệ thống và terminal trên macOS. Tôi có câu lệnh Maven khởi chạy Spring Boot dài: "mvn spring-boot:run -Dspring-boot.run.profiles=dev". Hãy hướng dẫn tôi cách tạo phím tắt (alias) hoặc script chạy nhanh trên Zsh shell để mỗi lần chạy không cần gõ lại. Hướng dẫn chi tiết cách cấu hình vào file ~/.zshrc, cách nạp lại cấu hình bằng source, giải thích cơ chế hoạt động của alias zsh trên môi trường nhiều project khác nhau, và so sánh Zsh shell với các shell mặc định trên Linux và Windows.
```

#### 5.2. Bối cảnh khi viết prompt

Câu lệnh khởi chạy Spring Boot với profile dev khá dài và tốn công gõ lại mỗi lần khởi động. Tôi muốn tạo một phím tắt toàn cục để làm việc nhanh chóng hơn trên terminal Zsh của macOS.

#### 5.3. Kết quả AI trả về

Antigravity hướng dẫn 4 cách rút gọn:
1. Thêm `alias rundev="mvn spring-boot:run -Dspring-boot.run.profiles=dev"` vào file `~/.zshrc` và nạp lại bằng `source ~/.zshrc`.
2. Dùng file Makefile với target `dev`.
3. Dùng file thực thi `.sh`.
4. Cấu hình trong Run Configuration của IDE.
AI cũng giải thích rằng alias là cấu hình global trên terminal, chạy được mọi nơi nhưng lệnh Maven chỉ chạy được nếu thư mục hiện tại chứa `pom.xml`. Đồng thời so sánh Zsh với Bash (mặc định trên Linux), CMD và PowerShell trên Windows.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã thêm thành công alias `rundev` vào file `~/.zshrc` của máy.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Khi cấu hình xong, tôi bị lỗi `zsh: command not found: rundev` ở tab terminal cũ. Nhờ AI giải thích, tôi đã chạy `source ~/.zshrc` tại tab terminal dự án để nạp cấu hình mới thành công mà không cần khởi động lại máy hay IDE.

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
| File liên quan | ~/.zshrc |
| Screenshot |  |
| Kết quả chạy/test | Phím tắt `rundev` hoạt động ổn định trên terminal |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Tối ưu hóa phím tắt terminal là thói quen tốt giúp lập trình viên thao tác nhanh hơn.
```

---

### Prompt số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-27 |
| Công cụ AI | Antigravity |
| Mục đích | Loại bỏ log rác (quét danh sách bảng, in mật khẩu DB) và phân tích log SQL Hibernate |
| Phân việc liên quan | Backend |
| Mức độ sử dụng | Sinh code mẫu / Hỏi giải thích |

#### 5.1. Prompt nguyên văn

```text
Bạn là một lập trình viên Java Spring Boot chuyên nghiệp. Ứng dụng backend của tôi khi khởi động in ra rất nhiều log kiểm tra danh sách bảng cơ sở dữ liệu ("====== TABLES IN DB ======") và log chứa các biến môi trường nhạy cảm như "DB_PASSWORD". Hãy rà soát mã nguồn của class chạy chính CodingPlatformApplication.java, tìm và loại bỏ phần logic `@PostConstruct` in danh sách bảng, cũng như các câu lệnh `System.out.println` in thông tin kết nối DB. Sau đó làm sạch các import không còn sử dụng để đảm bảo mã nguồn gọn gàng, an toàn bảo mật và biên dịch thành công. Đồng thời, hãy giải thích các dòng log tự động tạo bảng/ép kiểu của Hibernate (ví dụ: "Hibernate: create type OrderStatus as enum...") có phải là log dư thừa không và cách tắt chúng nếu cần.
```

#### 5.2. Bối cảnh khi viết prompt

Ứng dụng in ra rất nhiều log bảng dữ liệu và mật khẩu DB nhạy cảm lúc startup. Tôi cần dọn dẹp các log rác này để console sạch sẽ và đảm bảo bảo mật thông tin. Tôi cũng thắc mắc về các dòng log SQL DDL của Hibernate.

#### 5.3. Kết quả AI trả về

AI đã chỉ ra đoạn code in log nằm trong `CodingPlatformApplication.java` (hàm `@PostConstruct checkTables` và các dòng System.out.println in biến môi trường). AI cung cấp code cập nhật sạch sẽ và giải thích rằng log Hibernate không phải log rác mà là các câu lệnh SQL thực thi để đồng bộ cấu hình JPA entity xuống PostgreSQL do thuộc tính `spring.jpa.show-sql: true` và `ddl-auto: update` đang bật.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã áp dụng code cập nhật của AI vào file `CodingPlatformApplication.java` để xóa bỏ log rác và import thừa.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã chạy biên dịch dự án bằng `mvn clean compile` để xác minh dự án không phát sinh lỗi cú pháp hay thiếu import sau khi xóa code. Tôi cũng quyết định giữ nguyên cấu hình `show-sql: true` trong môi trường phát triển để phục vụ việc debug.

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
| File liên quan | CodingPlatformApplication.java |
| Screenshot |  |
| Kết quả chạy/test | Log startup của backend sạch sẽ và không còn in mật khẩu DB |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Dọn dẹp các log chứa mật khẩu là yêu cầu bảo mật cơ bản trước khi đưa mã nguồn lên Git.
```

---

---

### Prompt số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích | Quét mã nguồn Backend và trích xuất tài liệu đặc tả API (API Specification) cho toàn bộ 13 module hệ thống |
| Phân việc liên quan | Backend / Documentation |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
Bạn là một AI Agent siêu cấp, chuyên gia Phân tích Mã nguồn (Code Analyzer) và Kỹ sư Tài liệu Kỹ thuật (API Technical Writer). Nhiệm vụ của bạn là quét toàn bộ thư mục mã nguồn Backend hiện tại của dự án (kiểm tra các tệp định tuyến Route, Controller, Middleware, DTO, Request/Response Model, Service) nhằm trích xuất và tạo lập một tài liệu đặc tả API chuẩn hóa, chi tiết nhất dưới định dạng Markdown (.md). 
Hãy gom nhóm các API theo từng Module/Luồng nghiệp vụ lớn (ví dụ: Auth, Users, Products, Orders, Submissions...) và áp dụng cấu trúc chuẩn cho TỪNG API được tìm thấy.
```

#### 5.2. Bối cảnh khi viết prompt

Dự án đã phát triển xong một phần lớn API ở Backend, và chúng tôi cần có tài liệu đặc tả (API Specification) để team Frontend tích hợp cũng như để viết Test Cases/Postman Collection. Việc viết tay tài liệu cho hàng chục API rất mất thời gian và dễ sai sót.

#### 5.3. Kết quả AI trả về

Antigravity đã quét toàn bộ mã nguồn của 13 phân hệ và tự động tạo ra 12 file Markdown chứa đặc tả chi tiết về: Method, Endpoint, Authentication, URL Variables, Request Body, và Kịch bản Response (cả JSON response và Status Code tương ứng). 

#### 5.4. Kết quả đã áp dụng vào bài

Chúng tôi sử dụng bộ tài liệu này làm chuẩn tham chiếu gốc (Single source of truth) cho toàn bộ Backend API của nền tảng, đảm bảo đồng bộ hóa thông tin giữa các thành viên.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi rà soát lại các endpoints và thông tin trả về của một số API phức tạp (như Payment và Online Judge) để chắc chắn tài liệu bám sát với luồng logic thực tế xử lý trong Spring Boot.

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
| File liên quan | Các file `api_*.md` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Việc sử dụng Agent tự động đọc codebase mang lại độ chính xác cực cao so với việc copy-paste từng đoạn code cho AI đọc.
```

---

### Prompt số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích | Viết script Python tổng hợp 12 file tài liệu API thành một file duy nhất |
| Phân việc liên quan | Documentation |
| Mức độ sử dụng | Hỗ trợ tự động hóa |

#### 5.1. Prompt nguyên văn

```text
tổng hợp 13 file này vào chung 1 file cho tôi đi.
đưa file .md này vào folder docs ở trong @[backend]
```

#### 5.2. Bối cảnh khi viết prompt

Sau khi AI xuất ra 12 file Markdown rời rạc cho từng module, tôi cần nối chúng lại thành một file tài liệu Master API duy nhất để dễ dàng tham khảo và chia sẻ, đồng thời lưu trữ nó vào trong thư mục `docs` của mã nguồn `backend`.

#### 5.3. Kết quả AI trả về

AI đã viết một script Python ngắn để quét và ghép nối 12 file `.md` thành một file duy nhất `api_full_specification.md` nhằm tránh các lỗi xử lý chuỗi trên bash. Sau đó, AI dùng lệnh để tạo thư mục `docs` trong dự án và di chuyển file tổng hợp vào đúng vị trí theo yêu cầu.

#### 5.4. Kết quả đã áp dụng vào bài

File `api_full_specification.md` được lưu thành công vào `backend/docs` và được sử dụng làm tài liệu tra cứu API toàn diện của hệ thống.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

File đã được gộp với định dạng phân cách rõ ràng, không cần chỉnh sửa gì thêm.

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
| File liên quan | `backend/docs/api_full_specification.md` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sự linh hoạt trong việc tự động viết script phụ trợ (Python) thay vì hard code tay thể hiện tư duy lập trình tối ưu của hệ thống AI.
```

---

### Prompt số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích | Viết Meta-prompt để hướng dẫn AI khác dịch và format tài liệu API ra file Word |
| Phân việc liên quan | Documentation |
| Mức độ sử dụng | Hỗ trợ viết Prompt |

#### 5.1. Prompt nguyên văn

```text
Với file .md mô tả đầy đủ các API đó. Hãy viết cho tôi 1 prompt hoàn chỉnh cho AI gen ra file .docxx hoàn chỉnh cho tôi đi, canh lề chuẩn chỉnh, có mục lục, chia ra rõ ràng, và hoàn toàn bằng tiếng anh.
```

#### 5.2. Bối cảnh khi viết prompt

Để nộp bài tập hoặc chia sẻ với các bên liên quan, tài liệu API cần được trình bày dưới định dạng Word (.docx) chuyên nghiệp, có chuẩn canh lề và chuyển ngữ sang tiếng Anh. Việc này tốn nhiều công sức định dạng lại từ Markdown.

#### 5.3. Kết quả AI trả về

Antigravity đã sinh ra một Prompt cực kỳ chi tiết bao gồm các yêu cầu về: Vai trò, định dạng lề, phông chữ (Arial/Courier New), tự động tạo Table of Contents, quy tắc dịch tiếng Anh chuyên ngành và cấu trúc bảng. Prompt này có thể copy paste sang các AI có hỗ trợ xuất file (ChatGPT, Claude) để chạy.

#### 5.4. Kết quả đã áp dụng vào bài

Đoạn Prompt được sử dụng thành công để yêu cầu AI tạo tự động ra file Word hoàn thiện, tiết kiệm rất nhiều công đoạn canh lề và thiết kế bảng.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi điều chỉnh thêm một chút nội dung Prompt ở phần Header/Footer của file Word để khớp với tên chính thức của nhóm và môn học.

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
| File liên quan | File `.docx` API Specification |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sử dụng AI để tối ưu hóa lệnh cho AI khác (Meta-prompting) là một kỹ năng cực kỳ hữu ích trong việc đảm bảo chất lượng output.
```


### Prompt số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế Cấu trúc Database cho Hệ thống Ví điện tử (Wallet) chống lỗi Double-spending |
| Phần việc liên quan | Design / Database |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Database Architect.
[CONTEXT] I am building a Wallet subsystem for my E-Learning platform. Users can deposit credits to purchase courses or compete in paid coding contests.
[TASK] Design the database schema for the wallet and transactions, ensuring data integrity and protection against double-spending attacks.
[CONSTRAINTS] 
1. The balance must never be negative (add check constraints).
2. Every transaction must be logged atomically.
3. Design unique transaction references (idempotent tokens) to prevent duplicate processing.
[FORMAT OUTPUT] Provide the SQL DDL statements for `wallets` and `wallet_transactions` tables with brief design explanations.
```

#### 5.2. Bối cảnh khi viết prompt

Cần thiết kế bảng ví và lịch sử nạp/rút tiền để bảo đảm tính nhất quán dữ liệu, chống lại việc cùng một giao dịch được cộng tiền hai lần.

#### 5.3. Kết quả AI trả về

AI gợi ý thiết kế bảng `wallets` với khóa ngoại trỏ tới `users` kèm ràng buộc CHECK balance >= 0, và bảng `wallet_transactions` lưu mã tham chiếu duy nhất (transaction_ref) để thực hiện đối soát.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã sử dụng cấu trúc bảng này vào file SQL schema chính thức của dự án.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã bổ sung thêm trường `checksum` (mã hóa SHA256 dòng dữ liệu) để phát hiện và ngăn ngừa việc can thiệp sửa đổi số dư ví trực tiếp từ cơ sở dữ liệu.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Ràng buộc kiểm tra số dư ví ở tầng database là lá chắn bảo mật cuối cùng cực kỳ quan trọng.
```

---

### Prompt số 30

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tích hợp thanh toán PayOS và thiết kế cơ chế xử lý Webhook bất đồng bộ có tính bất biến |
| Phần việc liên quan | Backend / Integration |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Senior Spring Boot Developer.
[CONTEXT] I am integrating PayOS gateway for payment deposit. When a payment completes, PayOS sends a webhook callback to my backend.
[TASK] Write the Controller and Service code in Spring Boot to process PayOS webhook callbacks.
[CONSTRAINTS]
1. Must verify the request signature using HMAC SHA256.
2. Must prevent duplicate webhook processing (if PayOS sends the same webhook multiple times).
3. The response to PayOS must be fast; log and handle the credit updating asynchronously.
[FORMAT OUTPUT] Provide a Spring Boot Controller code block.
```

#### 5.2. Bối cảnh khi viết prompt

PayOS gửi webhook thông báo nạp tiền thành công, nhưng có thể bị gửi lặp lại nhiều lần do trễ mạng hoặc lỗi hạ tầng. Cần xử lý tránh ghi nhận cộng tiền nhiều lần.

#### 5.3. Kết quả AI trả về

AI hướng dẫn tạo endpoint nhận POST webhook, kiểm tra chữ ký PayOS bằng secret key, sau đó sử dụng bảng `processed_webhooks` lưu mã đơn hàng để chặn xử lý trùng lặp.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã tích hợp mã kiểm tra chữ ký và cơ chế check trùng đơn hàng vào class PaymentService.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi chuyển logic xử lý cộng tiền ví sang chạy bất đồng bộ bằng cách bắn sự kiện (`ApplicationEventPublisher`) để endpoint phản hồi PayOS lập tức trong dưới 500ms.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Xử lý webhook không đồng bộ và kiểm tra chữ ký là quy chuẩn bắt buộc của các cổng thanh toán.
```

---

### Prompt số 31

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế Database Ledger (Sổ cái tài chính) ghi nhận giao dịch nạp/rút/mua khóa học |
| Phần việc liên quan | Design / Database |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Financial Software Architect.
[CONTEXT] Our system handles deposits, course purchases, and instructor payouts. We need a clear, immutable financial audit trail.
[TASK] Design a double-entry ledger database table schema to record all financial movements.
[CONSTRAINTS]
1. Ledger entries must be append-only (no updates or deletes allowed).
2. Debits and credits must balance out globally.
3. Every entry must track transaction type, amount, source account, and destination account.
[FORMAT OUTPUT] Provide database schema with explanation of accounting logic.
```

#### 5.2. Bối cảnh khi viết prompt

Báo cáo tài chính cho đồ án cần chứng minh được dòng tiền không bị tự sinh ra hay mất đi, đòi hỏi cấu trúc sổ cái kế toán chặt chẽ.

#### 5.3. Kết quả AI trả về

AI đề xuất schema bảng `financial_ledger` lưu chuyển dịch tiền tệ dạng Debit/Credit, liên kết chặt chẽ với đơn hàng và tài khoản người dùng.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi áp dụng bảng ledger này để thay thế cho cách cộng trừ số dư trực tiếp không có đối soát trước đây.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cấu hình quyền trong DB (GRANT SELECT, INSERT ON financial_ledger) để chặn mọi thao tác UPDATE/DELETE từ tài khoản ứng dụng thông thường.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Nguyên tắc bất biến (Immutability) của sổ cái tài chính giúp việc đối soát sau này cực kỳ dễ dàng.
```

---

### Prompt số 32

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai cơ chế khóa bi quan (Pessimistic Locking) trong Spring Boot khi cộng/trừ số dư ví |
| Phần việc liên quan | Backend / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Spring Data JPA Expert.
[CONTEXT] When webhooks write balance updates, multiple requests can arrive simultaneously, causing concurrency issues.
[TASK] Write a JPA repository method using a pessimistic write lock to fetch the user's wallet.
[CONSTRAINTS]
1. Use `@Lock(LockModeType.PESSIMISTIC_WRITE)` annotation.
2. Include a timeout configuration to prevent indefinite database blocking.
[FORMAT OUTPUT] Provide Java Repository interface snippet and service usage.
```

#### 5.2. Bối cảnh khi viết prompt

Đề phòng race condition khi người dùng nhấn thanh toán đồng thời ở hai tab, hệ thống có thể đọc số dư cũ và trừ tiền sai.

#### 5.3. Kết quả AI trả về

AI gợi ý sử dụng hàm `findById` đi kèm `@Lock(LockModeType.PESSIMISTIC_WRITE)` để khóa dòng dữ liệu trong DB khi đang cập nhật ví.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi sử dụng hàm `findWithLockByUserId` trong repository cho luồng mua khóa học.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã bắt thêm ngoại lệ `PessimisticLockingFailureException` để trả về lời nhắn lỗi thân thiện hơn thay vì crash API.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Khóa bi quan thích hợp cho các giao dịch liên quan đến tiền tệ nơi tính chính xác cao hơn thông lượng.
```

---

### Prompt số 33

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Giải quyết tranh chấp tài nguyên (Race Condition) khi nhiều học viên đăng ký cùng một khóa học giới hạn slot |
| Phần việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Concurrency Specialist in Java.
[CONTEXT] Some interactive live workshops have a strict limit of 30 slots. If 100 students click join at the same millisecond, the system must not allow overselling.
[TASK] Propose and implement a concurrency resolution strategy in Spring Boot.
[CONSTRAINTS]
1. Compare Pessimistic vs Optimistic Locking for this use case.
2. Write the entity modification code with versioning if Optimistic locking is preferred.
[FORMAT OUTPUT] Provide detailed code sample and logic explanation.
```

#### 5.2. Bối cảnh khi viết prompt

Tránh việc đăng ký quá số lượng lớp học khi có quá nhiều lượt click đồng thời.

#### 5.3. Kết quả AI trả về

AI so sánh và khuyên dùng khóa lạc quan bằng `@Version` trong Hibernate vì tỷ lệ tranh chấp thấp hơn giao dịch tài chính, giúp hệ thống không bị nghẽn khóa DB.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã thêm cột `@Version private Long version` vào class `CourseSlot`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi bổ sung thêm một cơ chế retry tự động tối đa 3 lần ở service nếu xảy ra lỗi `ObjectOptimisticLockingFailureException`.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Khóa lạc quan (Optimistic Locking) giúp tăng hiệu năng xử lý song song lên rất nhiều so với khóa bi quan.
```

---

### Prompt số 34

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Xây dựng hàng đợi nộp bài (Submission Queue) bằng RabbitMQ/Kafka để giảm tải cho hệ thống Online Judge |
| Phần việc liên quan | Architecture / Backend |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a System Architect.
[CONTEXT] In our coding contest subsystem, hundreds of students submit code at the exact same second. Directly calling Judge0 API synchronously crashes our backend under load.
[TASK] Design an asynchronous code submission queue architecture using RabbitMQ.
[CONSTRAINTS]
1. Explain the workflow from Client submit -> API Gateway -> Queue -> Grader Consumer -> Judge0 -> WebSocket notify.
2. Outline the configuration for queues, exchanges, and routing keys.
[FORMAT OUTPUT] Provide a Markdown architecture workflow and code config class for RabbitMQ.
```

#### 5.2. Bối cảnh khi viết prompt

Giải quyết tình trạng nghẽn cổ chai (bottleneck) khi chấm bài tập lập trình lúc diễn ra các kỳ thi đông người.

#### 5.3. Kết quả AI trả về

AI đề xuất mô hình Producer-Consumer sử dụng RabbitMQ: Nhận bài nộp -> Đẩy vào queue -> Trả về ID lập tức. Service worker lấy bài ra gửi Judge0 chấm bất đồng bộ.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã thiết lập RabbitMQ configuration và viết consumer xử lý hàng đợi chấm bài.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi cấu hình thêm Dead Letter Queue (DLQ) để hứng các bài nộp lỗi định dạng hoặc lỗi kết nối mạng giúp hệ thống tự phục hồi.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Mô hình hàng đợi (Queue-based) là kiến trúc tối thượng để mở rộng quy mô hệ thống Online Judge.
```

---

### Prompt số 35

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tích hợp Judge0 API để biên dịch và chạy thử code đa ngôn ngữ |
| Phần việc liên quan | Backend / Integration |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an Integration Engineer.
[CONTEXT] We need to run code written in Java, Python, C++ via Judge0 API.
[TASK] Write a Spring Boot service implementation class to send code submissions to Judge0.
[CONSTRAINTS]
1. Pass correct language IDs as defined by Judge0.
2. Handle base64 encoding of input/output to avoid format breaking.
3. Handle synchronous or asynchronous execution response of Judge0.
[FORMAT OUTPUT] Provide complete Java code using RestTemplate or WebClient.
```

#### 5.2. Bối cảnh khi viết prompt

Cần kết nối module backend với máy chủ chấm bài Judge0 để đánh giá đúng/sai của mã nguồn học viên.

#### 5.3. Kết quả AI trả về

AI viết Service sử dụng `WebClient` để call API của Judge0, thực hiện mã hóa base64 source code và testcases trước khi truyền tải.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã áp dụng WebClient này để thực hiện việc gửi code chấm thử.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi cấu hình thêm cơ chế Circuit Breaker bằng Resilience4j để tự động ngắt kết nối và báo lỗi hệ thống bận nếu máy chủ Judge0 bị sập.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Mã hóa Base64 giúp đảm bảo các ký tự đặc biệt trong code của học viên không làm vỡ định dạng HTTP payload.
```

---

### Prompt số 36

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Ngăn chặn Fork Bomb và các cuộc tấn công tài nguyên hệ thống trong Docker Sandbox của Judge0 |
| Phần việc liên quan | DevOps / Security |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a DevOps & Security Specialist.
[CONTEXT] I run a self-hosted Judge0 instance in a Docker container. I want to prevent students from writing codes that exploit resources (e.g., executing shell commands, fork bombs).
[TASK] Provide configuration guidelines to harden the Judge0 Docker environment.
[CONSTRAINTS]
1. Set limits for CPU and Memory of containers.
2. Restrict process limits (pids-limit) to block fork bombs.
3. Disable network access for run containers.
[FORMAT OUTPUT] Provide docker-compose configuration snippet and security configurations.
```

#### 5.2. Bối cảnh khi viết prompt

Ngăn chặn học viên tinh nghịch nộp mã độc (ví dụ lệnh xóa thư mục hệ thống, vòng lặp tạo vô số tiến trình) làm treo máy chủ.

#### 5.3. Kết quả AI trả về

AI hướng dẫn cách cấu hình `pids-limit: 100` để chặn fork bomb, cấu hình `network_mode: none` để chặn code gọi API ngoài, và thiết lập CPU/Memory limits.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã chỉnh sửa file docker-compose.yml của dịch vụ Judge0 đang chạy trên máy chủ.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tự viết thêm script giám sát tài nguyên (CPU/RAM) của Docker, tự động cảnh báo qua Slack nếu container chấm bài vượt quá ngưỡng an toàn.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sandbox cô lập hoàn toàn tài nguyên là yêu cầu sống còn của các hệ thống lập trình thi đấu.
```

---

### Prompt số 37

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế cơ chế giới hạn thời gian (Time Limit Exceeded) và bộ nhớ (Memory Limit Exceeded) cho code học viên |
| Phần việc liên quan | Backend / Configuration |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an Online Judge Developer.
[CONTEXT] Different coding problems have different resource limits (e.g., Time Limit: 1.0s, Memory Limit: 256MB).
[TASK] Customize the submission payload sent to Judge0 to enforce these limits dynamically based on the problem's metadata.
[CONSTRAINTS]
1. Read limits from the database entity `Problem`.
2. Convert DB limits to correct Judge0 payload keys (`cpu_time_limit`, `memory_limit`).
3. Handle verdict conversion for TLE and MLE.
[FORMAT OUTPUT] Java class method creating the submission payload.
```

#### 5.2. Bối cảnh khi viết prompt

Đảm bảo mỗi bài tập lập trình có giới hạn chạy riêng biệt để học viên phải tối ưu hóa thuật toán của mình.

#### 5.3. Kết quả AI trả về

AI viết logic lấy thuộc tính `timeLimit` và `memoryLimit` từ đối tượng Problem và gán vào các thuộc tính của Judge0 Request Body.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã thêm các tham số này vào phương thức tạo JSON request trong lớp `Judge0Service`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm một hệ số nhân thời gian chạy (ví dụ x2 thời gian chạy) riêng cho ngôn ngữ Java vì JVM khởi động chậm hơn C++.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
JVM khởi động tốn thời gian hơn C++, cần thiết lập hệ số bù trừ thời gian chạy hợp lý để tránh lỗi oan cho học viên dùng Java.
```

---

### Prompt số 38

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai WebSocket để đẩy kết quả chấm bài theo thời gian thực (Real-time Verdicts) về React Client |
| Phần việc liên quan | Backend / Frontend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Full-Stack WebSocket Expert.
[CONTEXT] When a user submits code, they shouldn't manually refresh the page. We want to show a spinner and update testcase markers in real-time as Judge0 processes them.
[TASK] Write the backend Spring Boot STOMP WebSocket configuration and the frontend React hook connection script.
[CONSTRAINTS]
1. Secure the WebSocket connection with JWT tokens.
2. Publish message to user-specific channel `/user/queue/verdicts`.
[FORMAT OUTPUT] Backend Java config/controller and Frontend JS component snippet.
```

#### 5.2. Bối cảnh khi viết prompt

Tăng trải nghiệm người dùng bằng cách tự động đẩy trạng thái chấm bài về màn hình lập trình mà không bắt tải lại trang.

#### 5.3. Kết quả AI trả về

AI cung cấp code cấu hình `@EnableWebSocketMessageBroker` phía Spring Boot và thư viện `@stomp/stompjs` phía React để thiết lập luồng truyền tin.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã tích hợp WebSocket Broker vào backend và viết hook React kết nối ở frontend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tự sửa lỗi rò rỉ bộ nhớ (memory leaks) bằng cách hủy kết nối (`disconnect()`) WebSocket trong hook React `useEffect` clean-up.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Đảm bảo đóng kết nối WebSocket khi component bị hủy để tránh rò rỉ tài nguyên ở cả client và server.
```

---

### Prompt số 39

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Xây dựng thuật toán tính điểm phạt ICPC (Penalty) cho bảng xếp hạng Contest |
| Phần việc liên quan | Backend / Algorithms |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Competitive Programming Platform Developer.
[CONTEXT] We need to calculate rankings during a coding contest. Tie-breaker is resolved by total penalty minutes.
[TASK] Write a Java method to calculate the total solved problems and total penalty minutes for a participant.
[CONSTRAINTS]
1. Formula: Penalty = (Time elapsed from contest start to AC) + (Incorrect submissions prior to AC * 20 minutes).
2. Submissions after AC do not add penalty.
3. Submissions with Compile Error (CE) do not add penalty.
[FORMAT OUTPUT] Clean Java class with unit test cases.
```

#### 5.2. Bối cảnh khi viết prompt

Thiết lập đúng chuẩn tính điểm của các cuộc thi lập trình quốc tế ICPC để làm cuộc thi công bằng.

#### 5.3. Kết quả AI trả về

AI sinh ra thuật toán lọc lịch sử nộp bài của từng user, tìm lượt Accepted đầu tiên cho mỗi problem và cộng dồn điểm phạt theo công thức.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi áp dụng thuật toán này vào class `ContestRankingService`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tối ưu truy vấn cơ sở dữ liệu để kéo toàn bộ submissions của contest về bộ nhớ một lần duy nhất thay vì chạy query trong vòng lặp của từng user.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Mọi lượt nộp sai sau khi đã đạt trạng thái ACCEPTED đều không được tính vào điểm phạt.
```

---

### Prompt số 40

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tối ưu hóa truy vấn SQL để tải Leaderboard thời gian thực với hàng chục ngàn người dùng |
| Phần việc liên quan | Database / Optimization |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a SQL Optimizer.
[CONTEXT] In our dashboard, we display a leaderboard of all active users ordered by total points and daily streak.
[TASK] Write a high-performance raw SQL query or JPQL query to retrieve the top 100 users, showing their rank.
[CONSTRAINTS]
1. Use SQL window functions like `DENSE_RANK()`.
2. Do not calculate ranking in memory; let the database perform the sorting.
3. Include columns for user details, total points, and streak.
[FORMAT OUTPUT] SQL query with explanatory performance details.
```

#### 5.2. Bối cảnh khi viết prompt

Tránh sập cơ sở dữ liệu khi lượng người dùng lớn đồng thời xem bảng xếp hạng.

#### 5.3. Kết quả AI trả về

AI cung cấp truy vấn sử dụng hàm `DENSE_RANK() OVER (ORDER BY score DESC, daily_streak DESC)` giúp phân hạng cực nhanh ở tầng cơ sở dữ liệu.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa truy vấn này vào Repository bằng `@Query(nativeQuery = true)`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tạo thêm chỉ mục phức hợp (composite index) trên `users(score, daily_streak)` để tối ưu hóa triệt để tốc độ quét bảng xếp hạng.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Window Functions xử lý phân hạng nhanh gấp hàng chục lần so với việc kéo dữ liệu lên Java rồi phân hạng thủ công.
```

---

### Prompt số 41

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai Cache Redis cho thông tin khóa học và danh sách bài tập truy cập nhiều |
| Phần việc liên quan | Backend / Optimization |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Redis Performance Expert.
[CONTEXT] Course details page is visited frequently but modified rarely. Querying PostgreSQL on every view hurts performance.
[TASK] Configure Spring Cache with Redis to cache course detail responses.
[CONSTRAINTS]
1. Set Cache TTL (Time-to-Live) to 2 hours.
2. Evict/invalidate cache automatically whenever an instructor updates the course.
[FORMAT OUTPUT] Configuration class and service annotations `@Cacheable` and `@CacheEvict` example.
```

#### 5.2. Bối cảnh khi viết prompt

Cần giảm tải cho PostgreSQL bằng cách lưu trữ tạm dữ liệu khóa học ít thay đổi vào bộ nhớ đệm RAM (Redis).

#### 5.3. Kết quả AI trả về

AI viết lớp cấu hình `RedisCacheManager` với các cấu hình TTL và hướng dẫn dùng các annotation `@Cacheable(value = "courses")` và `@CacheEvict`.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã tích hợp Redis Cache vào các API liên quan đến tìm kiếm và xem chi tiết khóa học.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã xử lý thêm cơ chế chống nghẽn Cache (Cache Stampede) bằng cách khóa đồng bộ luồng nạp dữ liệu từ database khi cache hết hạn.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Bắt buộc phải dùng `@CacheEvict` khi cập nhật khóa học để đảm bảo học viên không nhìn thấy thông tin cũ.
```

---

### Prompt số 42

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế cơ chế tính chuỗi ngày học liên tục (Daily Streak) hiệu quả |
| Phần việc liên quan | Backend / Algorithms |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Logic Programmer.
[CONTEXT] We reward users who submit code every day. If they skip a day, their streak resets.
[TASK] Write a Spring Boot service logic to update user daily streak when they solve a problem.
[CONSTRAINTS]
1. If user solves a problem today, check if they solved one yesterday. If yes, increment streak.
2. If their last activity was before yesterday, reset streak to 1.
3. If they already solved a problem today, do not increment streak again.
[FORMAT OUTPUT] Java Service method.
```

#### 5.2. Bối cảnh khi viết prompt

Thiết kế cơ chế gamification giúp học viên có động lực nộp bài hàng ngày để tăng streak.

#### 5.3. Kết quả AI trả về

AI cung cấp hàm xử lý so sánh `activity_date` của bản ghi hoạt động gần nhất với ngày hiện tại (CURRENT_DATE) và ngày hôm trước.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa logic này vào `DailyActivityServiceImpl` để chạy mỗi khi học viên nộp bài ACCEPTED.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi cấu hình thêm múi giờ địa phương (Local Timezone) của người dùng thay vì dùng cứng giờ UTC để tránh lệch ngày do chênh lệch múi giờ.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Luôn dùng múi giờ của client để tính streak chính xác, nếu không người dùng nộp bài lúc đêm sẽ bị reset streak oan.
```

---

### Prompt số 43

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Quét đạo văn bài nộp code sử dụng Gemini Embedding API và Cosine Similarity |
| Phần việc liên quan | AI / Backend |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an AI Application Architect.
[CONTEXT] We want to prevent students from copying code from peers. Simply comparing text doesn't work if they rename variables.
[TASK] Design a semantic code plagiarism checker using Gemini Embeddings.
[CONSTRAINTS]
1. Generate embeddings for code files.
2. Store vectors in pgvector.
3. Write SQL/Java query to calculate Cosine Similarity between the new submission and previous correct submissions.
[FORMAT OUTPUT] Architecture design and Python/Java code snippet calling LLM API.
```

#### 5.2. Bối cảnh khi viết prompt

Chống gian lận thi cử thông minh: học viên đổi tên biến hoặc chèn comment thừa vẫn bị phát hiện đạo văn.

#### 5.3. Kết quả AI trả về

AI đề xuất quy trình: Tiền xử lý code (xóa khoảng trắng/comment) -> Gửi đến Gemini Embedding -> So sánh khoảng cách Cosine Similarity, nếu độ tương đồng > 0.90 sẽ đánh dấu đạo văn.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi viết module PlagiarismChecker gọi API Gemini để tính toán độ tương đồng mã nguồn.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tối ưu chỉ quét so khớp với các bài nộp cùng một bài tập (problem_id) thay vì so sánh chéo toàn bộ cơ sở dữ liệu để tránh quá tải API.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Xóa comments và các token rác trước khi đưa vào mô hình AI sẽ giúp tăng độ chính xác của vector embedding.
```

---

### Prompt số 44

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Sử dụng Gemini API để tự động chấm điểm và đánh giá code học viên với các tiêu chí Clean Code |
| Phần việc liên quan | AI / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an AI Prompt Engineer.
[CONTEXT] We want to offer automatic code review feedback (e.g., Code Complexity, Naming Conventions, Edge Cases) using Gemini 1.5 Flash.
[TASK] Create a highly structured system prompt for the AI reviewer and write the Java call code.
[CONSTRAINTS]
1. The AI response must be strictly in JSON format.
2. The JSON keys must be `score`, `complexity`, `suggestions` (array), and `refactoredCode`.
[FORMAT OUTPUT] System prompt text and Java JSON parsing logic.
```

#### 5.2. Bối cảnh khi viết prompt

Hệ thống tự động đưa ra các lời khuyên refactor code, giúp học viên tiến bộ nhanh mà không cần giảng viên ngồi chấm tay.

#### 5.3. Kết quả AI trả về

AI viết prompt hướng dẫn Gemini đóng vai trò reviewer, chỉ trả về JSON có cấu trúc định sẵn bằng cách thiết lập Response Schema trong API call.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa code gọi API này vào chức năng Review Code tự động trên nền tảng.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã bổ sung thêm caching cho kết quả review: nếu học viên nộp code giống hệt phiên bản trước, hệ thống sẽ trả về nhận xét cũ thay vì gọi lại AI.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Yêu cầu API trả về định dạng JSON giúp ứng dụng backend dễ dàng bóc tách thông tin hiển thị lên giao diện.
```

---

### Prompt số 45

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | AI quét kiểm duyệt nội dung video bài giảng (Video Moderation) để phát hiện vi phạm bản quyền hoặc nội dung không lành mạnh |
| Phần việc liên quan | AI / Backend |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Media Security Architect.
[CONTEXT] Instructors upload MP4 video lessons. We must scan them to ensure they contain educational content and do not include illegal material or unauthorized advertisements.
[TASK] Design a pipeline to perform automated AI video moderation.
[CONSTRAINTS]
1. Send key video frames or the entire short video to Gemini Multimodal API.
2. Detect speech (audio transcription moderation) and visual slide contents.
[FORMAT OUTPUT] Moderation workflow diagram (text) and API integration logic.
```

#### 5.2. Bối cảnh khi viết prompt

Tránh rủi ro pháp lý cho nền tảng khi giảng viên tải lên các video chứa quảng cáo cờ bạc hoặc nội dung không phù hợp.

#### 5.3. Kết quả AI trả về

AI đề xuất trích xuất các khung ảnh (keyframes) và audio track, gửi qua Gemini Multimodal để phân tích nội dung hình ảnh/giọng nói, trả về thẻ phân loại an toàn.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã áp dụng quy trình này để xây dựng module `VideoModerationService`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cải tiến bằng cách chỉ chạy tác vụ này ở background worker sau khi video được tải lên AWS S3 hoàn tất để không chặn luồng giao diện của giảng viên.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Kiểm duyệt video là tác vụ nặng, luôn xử lý bất đồng bộ (asynchronous) để tránh nghẽn luồng chính.
```

---

### Prompt số 46

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | AI trích xuất thông tin tự động từ CV (CV Parser) của Giảng viên nộp đơn đăng ký dạy |
| Phần việc liên quan | AI / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an AI Integration Developer.
[CONTEXT] When a user applies to be an instructor, they upload a PDF CV. We want to extract their key skills, years of experience, and previous workplaces.
[TASK] Write the code to parse PDF text and feed it to Gemini API to get structured JSON resume information.
[CONSTRAINTS]
1. Extract values for `yearsOfExperience`, `skills` (list), `degree`, `hasCodingExperience` (boolean).
2. Ensure strict error handling for corrupted PDF files.
[FORMAT OUTPUT] Java integration method with Apache PDFBox parser.
```

#### 5.2. Bối cảnh khi viết prompt

Tự động hóa luồng duyệt hồ sơ giảng viên, giúp Admin lọc nhanh những ứng viên có trình độ lập trình thực tế.

#### 5.3. Kết quả AI trả về

AI hướng dẫn dùng Apache PDFBox để trích xuất text từ file PDF, sau đó gửi đoạn text này cho Gemini API kèm theo schema yêu cầu định dạng JSON.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã tích hợp mã nguồn bóc tách PDF này vào luồng đăng ký Giảng viên.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cấu hình cho AI tự động gắn thẻ điểm đánh giá (CV Score từ 1-100) để Admin có thể sắp xếp và duyệt nhanh theo thứ hạng điểm hồ sơ.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Bóc tách PDF thô bằng thư viện cục bộ trước khi gửi text cho LLM giúp tiết kiệm lượng lớn token đầu vào.
```

---

### Prompt số 47

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Cơ chế phân quyền nhiều cấp độ (RBAC) sử dụng Spring Security |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Spring Security Architect.
[CONTEXT] We have roles: ADMIN, INSTRUCTOR, CUSTOMER. We need custom permissions (e.g., `write:problem`, `publish:course`).
[TASK] Configure Spring Security to support Role-Based Access Control (RBAC) and Method-Level Security.
[CONSTRAINTS]
1. Use `@PreAuthorize` annotations on Service/Controller methods.
2. Map DB roles/permissions into custom UserDetails GrantedAuthorities.
[FORMAT OUTPUT] SecurityConfig.java configuration class and method annotation examples.
```

#### 5.2. Bối cảnh khi viết prompt

Đảm bảo học viên không thể gọi lén API của giảng viên để sửa đề thi, hay giảng viên không thể rút tiền của giảng viên khác.

#### 5.3. Kết quả AI trả về

AI hướng dẫn cấu hình `@EnableMethodSecurity` và nạp danh sách quyền (permissions) của user từ DB vào đối tượng Authentication.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã triển khai cấu hình bảo mật này cho toàn bộ hệ thống API.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tự tạo thêm một Custom AccessDeniedHandler để trả về mã lỗi JSON chuẩn hóa (`MSG32: Access Denied`) thay vì hiển thị trang lỗi HTML mặc định của Tomcat.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Method-level security cung cấp cơ chế bảo vệ phân quyền lớp sâu nhất, tránh được lỗi bỏ sót phân quyền ở API gateway.
```

---

### Prompt số 48

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai cơ chế xoay vòng JWT (JWT Rotation) với Refresh Token để bảo mật phiên đăng nhập |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Security Expert.
[CONTEXT] Standard Access Tokens expire in 15 minutes. We need a Refresh Token mechanism stored in PostgreSQL (with expiration of 7 days) to renew Access Tokens without logging out.
[TASK] Write the Refresh Token entity, request DTO, and validation service code.
[CONSTRAINTS]
1. If a Refresh Token is reuse-detected (stolen), immediately revoke all sessions of the user (Refresh Token Rotation).
2. Store tokens hashed in DB to protect against DB leaks.
[FORMAT OUTPUT] Java entity and Service logic.
```

#### 5.2. Bối cảnh khi viết prompt

Giúp người dùng không bị mất phiên làm việc đột ngột khi Access Token hết hạn, đồng thời đảm bảo bảo mật tuyệt đối nếu token bị rò rỉ.

#### 5.3. Kết quả AI trả về

AI cung cấp cấu trúc thực thể `RefreshToken` và service xử lý cấp mới token, đồng thời giải thích cơ chế Revocation khi phát hiện trùng mã token đã sử dụng.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã viết logic này vào API đăng nhập và làm mới token.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cấu hình cho Refresh Token được lưu trữ trong HttpOnly Cookie để chống lại các cuộc tấn công đánh cắp token qua mã JavaScript độc hại (XSS).

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Refresh Token đặt trong HttpOnly Cookie là phương thức bảo mật lưu trữ token an toàn nhất cho Single Page Applications.
```

---

### Prompt số 49

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tích hợp đăng nhập bằng Google OAuth2 bảo mật ở phía Backend |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an OAuth2 Specialist.
[CONTEXT] Frontend React handles Google Client Login and gets an `id_token`. It sends it to Backend API `/api/v1/auth/google`.
[TASK] Write the backend Java Spring Boot controller to verify this token using Google API Client library and authenticate the user.
[CONSTRAINTS]
1. Verify token signature, audience client ID, and expiration.
2. If user doesn't exist, automatically create a new user profile with role CUSTOMER.
[FORMAT OUTPUT] Backend controller and authentication service code.
```

#### 5.2. Bối cảnh khi viết prompt

Đơn giản hóa trải nghiệm đăng nhập của học viên bằng cách cho phép click đăng nhập nhanh qua Google.

#### 5.3. Kết quả AI trả về

AI cung cấp code sử dụng thư viện `GoogleIdTokenVerifier` để giải mã, xác thực id_token và nạp thông tin user vào Spring Security context.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã triển khai API này tại class `GoogleAuthService`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tối ưu bằng cách tải ảnh đại diện từ Google của user về để lưu trữ cục bộ hoặc hiển thị trực tiếp trên thanh navbar trang chủ.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Xác thực id_token ở phía backend giúp ngăn chặn tuyệt đối việc giả mạo danh tính bằng cách truyền email bừa bãi qua API.
```

---

### Prompt số 50

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Cấu hình Spring Security CORS để bảo vệ ứng dụng trước các request trái phép từ domain khác |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an Application Security Engineer.
[CONTEXT] Our React frontend runs on port 3000, Spring Boot backend on port 8080.
[TASK] Configure Spring Security CORS filter to allow React client domain to access APIs, exposing correct headers (Authorization).
[CONSTRAINTS]
1. Allow only specific origins (e.g., http://localhost:3000, production domain).
2. Allow methods: GET, POST, PUT, DELETE, OPTIONS.
3. Allow credentials to support cookies.
[FORMAT OUTPUT] Spring Security configuration snippet.
```

#### 5.2. Bối cảnh khi viết prompt

Sửa lỗi trình duyệt chặn request (CORS error) khi frontend gọi API sang backend, đồng thời chặn các domain lạ gọi API phá hoại.

#### 5.3. Kết quả AI trả về

AI cung cấp đoạn cấu hình `CorsConfigurationSource` thiết lập các thuộc tính `AllowedOrigins`, `AllowedMethods` và `AllowedHeaders`.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đưa cấu hình CORS này vào file cấu hình bảo mật `SecurityFilterChain`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã chuyển các giá trị tên miền (allowed origins) sang đọc từ file `application.yaml` để dễ dàng đổi tên miền khi chạy deploy lên production.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Không bao giờ để `AllowedOrigins = "*"` trên môi trường thực tế vì sẽ tạo ra lỗ hổng bảo mật CORS nghiêm trọng.
```

---

### Prompt số 51

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Phòng chống tấn công Cross-Site Scripting (XSS) khi hiển thị mã nguồn của học viên trên giao diện |
| Phần việc liên quan | Frontend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Frontend Security Specialist.
[CONTEXT] Users can write and view markdown discussions and submit code. Attackers could insert `<script>alert('hack')</script>` or malicious iframe payloads.
[TASK] Secure the React application from XSS when rendering user-submitted HTML or Markdown.
[CONSTRAINTS]
1. Use DOMPurify to sanitize content.
2. Configure DOMPurify to allow syntax highlighting attributes for code blocks.
[FORMAT OUTPUT] React functional component using DOMPurify and react-markdown.
```

#### 5.2. Bối cảnh khi viết prompt

Chặn mã nguồn độc hại của học viên thực thi trên trình duyệt của người dùng khác khi họ cùng thảo luận.

#### 5.3. Kết quả AI trả về

AI viết component React tích hợp thư viện `dompurify` để làm sạch mã HTML bẩn trước khi gọi `dangerouslySetInnerHTML`.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã cài đặt thư viện dompurify và đưa vào render khung chat thảo luận.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cấu hình DOMPurify ở cả phía backend (dùng HtmlSanitizer) để loại bỏ thẻ độc hại ngay khi lưu vào database.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Bảo mật XSS cần triển khai ở cả 2 đầu: Backend làm sạch trước khi lưu, Frontend làm sạch trước khi hiển thị.
```

---

### Prompt số 52

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Phòng chống tấn công SQL Injection khi tìm kiếm khóa học bằng các từ khóa tự do |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Hướng dẫn bảo mật |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Database Security Specialist.
[CONTEXT] Instructors search courses. If I concatenate SQL strings like `"SELECT * FROM courses WHERE title LIKE '%" + query + "%'"`, it is vulnerable to SQL injection.
[TASK] Show how to implement safe, parameterized search queries in Spring Boot.
[CONSTRAINTS]
1. Use Spring Data JPA Query methods with named parameters (`:query`).
2. Show CriteriaBuilder implementation for dynamic multi-field search.
[FORMAT OUTPUT] Code samples comparing unsafe query vs safe parameterized query.
```

#### 5.2. Bối cảnh khi viết prompt

Đảm bảo hacker không thể nhập các chuỗi mã SQL (như `' OR '1'='1`) để ăn cắp hoặc xóa dữ liệu của hệ thống.

#### 5.3. Kết quả AI trả về

AI giải thích cơ chế của Parameterized Queries và viết mã Spring Data `@Query` sử dụng tham số `:title` an toàn tuyệt đối trước SQL injection.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã thay thế tất cả các câu truy vấn nối chuỗi thô bằng truy vấn JPQL dùng Named Parameters.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thiết lập thêm thư viện SonarQube để tự động quét mã nguồn định kỳ nhằm cảnh báo sớm các đoạn code nối chuỗi SQL SQLi.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sử dụng Hibernate/JPA hầu như miễn nhiễm với SQL Injection nếu ta tuân thủ quy tắc truyền biến qua parameters.
```

---

### Prompt số 53

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế cơ chế giới hạn tần suất request (Rate Limiting) cho các API nhạy cảm |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an API Gatekeeper.
[CONTEXT] We need to prevent bots from brute-forcing passwords or DDOSing our code-execution endpoint.
[TASK] Implement API rate limiting using Bucket4j library.
[CONSTRAINTS]
1. Login endpoint limit: 5 requests per minute per IP.
2. Code run endpoint limit: 20 requests per minute per User ID.
[FORMAT OUTPUT] Java Spring Boot Filter or Interceptor implementation.
```

#### 5.2. Bối cảnh khi viết prompt

Tránh việc kẻ xấu dùng script tự động spam hàng triệu request lên API chấm bài làm cạn kiệt tài nguyên máy chủ.

#### 5.3. Kết quả AI trả về

AI hướng dẫn tạo một Filter tích hợp thư viện `Bucket4j` để đếm số request theo địa chỉ IP hoặc UserId và trả về HTTP Status 429 Too Many Requests nếu quá hạn.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa RateLimitingFilter vào luồng API Login và Submit Code.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã đổi sang lưu trữ bucket token trong Redis (sử dụng Redis-backed Bucket4j) để hỗ trợ giới hạn truy cập khi scale hệ thống chạy nhiều server node.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Rate Limiting theo IP giúp ngăn chặn hiệu quả các cuộc tấn công dò mật khẩu (Brute Force).
```

---

### Prompt số 54

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Xây dựng hệ thống Giao dịch Phân tán (Distributed Transactions) bằng Saga Pattern khi thực hiện mua khóa học và ghi nhận doanh thu giảng viên |
| Phần việc liên quan | Architecture |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Microservices Architect.
[CONTEXT] We have decoupled Order service, Wallet service, and Enrollment service. When a user buys a course, we must debit wallet, enroll user, and credit instructor balance. If enrollment fails, wallet debit must rollback.
[TASK] Design a Choreography-based Saga pattern workflow for this transaction.
[CONSTRAINTS]
1. Define successful paths, compensating transactions (rollbacks) for each failure point.
2. Explain message patterns via RabbitMQ.
[FORMAT OUTPUT] Diagram flow description and rollback event structure.
```

#### 5.2. Bối cảnh khi viết prompt

Đảm bảo tính nhất quán dữ liệu của 3 dịch vụ: Trừ tiền ví -> Ghi danh học viên -> Cộng tiền giảng viên. Nếu một bước lỗi, tất cả phải hoàn tác.

#### 5.3. Kết quả AI trả về

AI thiết kế luồng Saga sử dụng các event nạp/hủy. Nếu việc ghi danh học viên thất bại, hệ thống sẽ tự động phát đi sự kiện `RollbackWalletEvent` để cộng lại tiền.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi áp dụng thiết kế này để viết module thanh toán và ghi danh bảo đảm an toàn dòng tiền.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã triển khai Outbox Pattern để lưu các event cần bắn vào DB trước khi gửi tới RabbitMQ để tránh việc mất gói tin khi server sập giữa chừng.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Giao dịch phân tán luôn đi kèm cơ chế bù trừ giao dịch (Compensating Transactions) để đưa hệ thống về trạng thái nhất quán.
```

---

### Prompt số 55

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Cấu hình kết nối cơ sở dữ liệu dự phòng (Read-Write Splitting) với Spring Boot để tối ưu tải DB |
| Phần việc liên quan | Backend / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Spring Database Administrator.
[CONTEXT] 80% of our database operations are reads (browsing courses, loading profiles). We want to route writes (inserting submissions, transactions) to Primary DB, and reads to Replica DB.
[TASK] Configure Spring Boot dynamic routing database datasource.
[CONSTRAINTS]
1. Use `AbstractRoutingDataSource`.
2. Inspect the `@Transactional(readOnly = true)` annotation to decide which database connection to route.
[FORMAT OUTPUT] Java database configuration classes.
```

#### 5.2. Bối cảnh khi viết prompt

Tăng cường năng lực chịu tải của cơ sở dữ liệu bằng cách chuyển tất cả các lệnh đọc SELECT sang cụm máy chủ phụ (Replica DB).

#### 5.3. Kết quả AI trả về

AI hướng dẫn cách viết class kế thừa `AbstractRoutingDataSource` để tự động chọn Connection Pool tùy thuộc vào trạng thái `readOnly` của transaction context.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa cấu hình định tuyến này vào dự án backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã viết thêm AOP Aspect để tự động kiểm tra sức khỏe của các DB Replica, nếu một Replica chết, hệ thống sẽ tự động chuyển hướng đọc về Primary DB.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Rút ngắn thời gian xử lý và tránh quá tải cho Master DB bằng cách tận dụng tối đa Read Replicas.
```

---

### Prompt số 56

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tối ưu hóa dung lượng lưu trữ cơ sở dữ liệu bằng cách nén các file mã nguồn bài nộp lớn |
| Phần việc liên quan | Backend / Optimization |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Database Optimization Engineer.
[CONTEXT] Storing millions of raw string code submissions (each code file can be 50KB) wastes gigabytes of database disk.
[TASK] Write Java methods to compress source code using GZIP before saving to database, and decompress it upon retrieval.
[CONSTRAINTS]
1. Store compressed code as byte array (`byte[]`) in JPA Entity.
2. Compression must be CPU efficient.
[FORMAT OUTPUT] Java utility helper class and entity annotation example.
```

#### 5.2. Bối cảnh khi viết prompt

Tiết kiệm không gian đĩa cứng máy chủ khi học viên nộp hàng triệu file code trong các kỳ thi.

#### 5.3. Kết quả AI trả về

AI viết một Utility class sử dụng `GZIPOutputStream` để nén chuỗi thành mảng byte và `GZIPInputStream` để giải nén ngược lại.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa hàm nén này vào Entity `@PrePersist` và `@PostLoad` để tự động nén/giải nén.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm logic giới hạn: chỉ nén những tệp code có kích thước lớn hơn 5KB để tránh lãng phí tài nguyên CPU cho những bài nộp quá ngắn.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Nén dữ liệu giúp giảm lưu lượng I/O đĩa cứng cơ sở dữ liệu lên đến 70-80% đối với dữ liệu văn bản.
```

---

### Prompt số 57

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế API xuất file báo cáo doanh thu PDF/Excel sử dụng JasperReports/Apache POI |
| Phần việc liên quan | Backend / Reporting |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Reporting System Engineer.
[CONTEXT] Admin needs to download monthly revenue breakdown spreadsheet.
[TASK] Write a Spring Boot Controller and Service that generates and downloads an Excel file.
[CONSTRAINTS]
1. Use Apache POI library.
2. Design professional table header styling, auto-adjust column width, and write total summation formula at the end.
[FORMAT OUTPUT] Java controller and service methods returning Excel file download.
```

#### 5.2. Bối cảnh khi viết prompt

Admin cần xuất báo cáo doanh số định kỳ để báo cáo thuế hoặc gửi đối tác.

#### 5.3. Kết quả AI trả về

AI cung cấp code sử dụng Apache POI tạo workbook, sheet, cell, định dạng font bold cho tiêu đề và áp dụng công thức SUM của Excel.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã viết class `ExcelReportExporter` để sinh file excel.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã sửa lỗi rò rỉ bộ nhớ bằng cách đóng workbook trong khối `try-with-resources` và truyền trực tiếp dữ liệu ra OutputStream.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Luôn dùng try-with-resources khi xử lý file và stream để đảm bảo giải phóng bộ nhớ RAM kịp thời.
```

---

### Prompt số 58

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Cơ chế tự động dọn dẹp các file tạm và CV giảng viên không được duyệt sau 30 ngày |
| Phần việc liên quan | Backend / Maintenance |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Backend Cron Developer.
[CONTEXT] We store temporary files, rejected resumes, and old payment request links that take up S3/Local space. We need a daily cleanup task.
[TASK] Create a Spring Boot `@Scheduled` cron job to clean old files.
[CONSTRAINTS]
1. Find database records rejected more than 30 days ago.
2. Call file service to delete their PDF file from disk/S3.
3. Clean the record from database or mark it as deleted.
[FORMAT OUTPUT] Java scheduled service class code.
```

#### 5.2. Bối cảnh khi viết prompt

Đảm bảo ổ đĩa hệ thống không bị đầy theo thời gian bởi các tệp tin rác không dùng đến.

#### 5.3. Kết quả AI trả về

AI cung cấp class định nghĩa `@Scheduled(cron = "0 0 2 * * ?")` chạy lúc 2h sáng hàng ngày để tìm và xóa file qua AWS S3 Client.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa Scheduled job này vào class `CleanupTask`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm transaction management và ghi log chi tiết số lượng file đã xóa thành công để phục vụ giám sát vận hành.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Chạy các tác vụ dọn dẹp nặng vào khung giờ thấp điểm (như 2 giờ sáng) để không ảnh hưởng đến người dùng đang học.
```

---

### Prompt số 59

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai lưu trữ file bài giảng và tài liệu học tập lên AWS S3 sử dụng SDK AWS Java |
| Phần việc liên quan | Backend / Integration |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Cloud Integration Specialist.
[CONTEXT] Instructors upload PDF slides and ZIP problem files. We want to store them in AWS S3 rather than local server directories.
[TASK] Write an AWS S3 File Service class using AWS SDK v2 for Java.
[CONSTRAINTS]
1. Generate unique file keys (UUIDs).
2. Set correct metadata (Content-Type) so files open instead of downloading directly.
3. Provide a method to generate temporary Pre-signed URLs for private file access.
[FORMAT OUTPUT] Complete S3 service Java class.
```

#### 5.2. Bối cảnh khi viết prompt

Lưu trữ tài liệu học tập tập trung trên dịch vụ đám mây giúp scale hệ thống dễ dàng mà không phụ thuộc vào ổ đĩa của server backend.

#### 5.3. Kết quả AI trả về

AI viết Service sử dụng `S3Client` và `S3Presigner` để tạo link truy cập tạm thời (Pre-signed URL) có hiệu lực trong 60 phút.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi áp dụng class này để quản lý toàn bộ tệp tin bài học tải lên.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thay thế cấu hình Credentials cứng (Hardcoded AccessKey/SecretKey) bằng việc đọc thông tin cấu hình qua biến môi trường để tăng tính bảo mật bảo vệ thông tin AWS.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sử dụng Pre-signed URLs giúp bảo vệ các tài liệu trả phí khỏi việc bị chia sẻ liên kết tải trực tiếp ra ngoài.
```

---

### Prompt số 60

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Hỗ trợ streaming video bài giảng chất lượng cao bằng giao thức HLS và phân giải nhiều định dạng |
| Phần việc liên quan | Architecture / Video Processing |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Video Streaming Architect.
[CONTEXT] We want to prevent piracy of course videos. Raw MP4 files can be easily downloaded. We also want smooth playback on slow networks.
[TASK] Design a video processing pipeline to transcode MP4 to HLS (m3u8 index files and .ts segment chunks) at multiple resolutions (480p, 720p, 1080p).
[CONSTRAINTS]
1. Use ffmpeg command tool parameters.
2. Outline how the React frontend client (using hls.js or video.js) plays the video dynamically.
[FORMAT OUTPUT] Transcoding commands and React player configurations.
```

#### 5.2. Bối cảnh khi viết prompt

Chặn download lậu video khóa học và cho phép tự động điều chỉnh độ phân giải video theo tốc độ mạng của người học.

#### 5.3. Kết quả AI trả về

AI hướng dẫn sử dụng công cụ `ffmpeg` chạy trên background worker để cắt nhỏ video thành các đoạn `.ts` đi kèm file chỉ mục `.m3u8`, cấu hình luồng phát bằng thư viện Video.js ở Frontend.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã viết script tự động gọi tiến trình `ffmpeg` trên server chạy ngầm.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã mã hóa (AES-128 encryption) cho các phân đoạn video `.ts` của HLS để tăng tối đa bảo mật chống download lậu video học.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
HLS streaming kết hợp mã hóa AES-128 là tiêu chuẩn công nghiệp được các nền tảng học trực tuyến lớn tin dùng.
```

---

### Prompt số 61

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế cơ chế theo dõi tiến trình học tập của học viên chi tiết đến từng giây xem video |
| Phần việc liên quan | Backend / Frontend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Tracking System Developer.
[CONTEXT] We want to award certificate only when a student watches at least 90% of each course video.
[TASK] Create a progress tracking system that tracks the current timestamp of the video the student is watching.
[CONSTRAINTS]
1. Client React should ping the backend every 10 seconds with the current video second count.
2. Backend updates the `last_watched_second` and updates `is_completed = true` if watched second exceeds 90% of video duration.
3. Optimize backend database write calls to avoid throttling.
[FORMAT OUTPUT] React player event hooks and backend controller logic.
```

#### 5.2. Bối cảnh khi viết prompt

Chặn việc học viên tua nhanh video để lấy chứng nhận hoàn thành khóa học giả.

#### 5.3. Kết quả AI trả về

AI đề xuất cơ chế lắng nghe sự kiện `onTimeUpdate` ở React Player và gọi API cập nhật tiến độ sau mỗi 10 giây xem liên tục.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã viết logic tracking này và lưu thông tin vào thực thể `user_lesson_progress`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm cơ chế chặn gian lận: nếu người dùng gửi request update giây nhảy vọt quá lớn (ví dụ tua nhanh hơn tốc độ bình thường), backend sẽ loại bỏ lượt ping đó.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Xác thực logic thời gian tua ở Backend giúp loại bỏ hoàn toàn việc chỉnh sửa API của các lập trình viên frontend tinh quái.
```

---

### Prompt số 62

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Xây dựng hệ thống thảo luận cộng đồng (Discussion Forum) hỗ trợ bình luận phân cấp |
| Phần việc liên quan | Design / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Senior Database Developer.
[CONTEXT] Our learning forum allows students to reply to comments. This can form a deeply nested comment tree.
[TASK] Design the `comments` table schema and write a recursive SQL CTE (Common Table Expression) to fetch a comment thread in hierarchical order.
[CONSTRAINTS]
1. Support parent-child hierarchy (`parent_id` foreign key).
2. The query must return comments sorted by depth and creation date.
[FORMAT OUTPUT] SQL schema and PostgreSQL recursive SELECT query.
```

#### 5.2. Bối cảnh khi viết prompt

Thiết kế hệ thống hỏi đáp bài tập hỗ trợ trả lời bình luận lồng nhau giống mạng xã hội Reddit.

#### 5.3. Kết quả AI trả về

AI gợi ý bảng `comments` tự tham chiếu (`parent_id REFERENCES comments(id)`) và câu lệnh SQL sử dụng `WITH RECURSIVE` để lấy toàn bộ nhánh comment chỉ bằng một câu query.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa truy vấn CTE phân cấp này vào lớp truy vấn cơ sở dữ liệu.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã chuyển đổi cấu trúc phẳng (flat array) thu được từ CTE SQL thành cấu trúc cây đối tượng (Nested JSON tree) trước khi gửi về frontend để React dễ render.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sử dụng WITH RECURSIVE ở DB giảm thiểu đáng kể số lượng truy vấn lặp lại so với việc tải và ghép nối các bản ghi comment bằng Java code.
```

---

### Prompt số 63

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai cơ chế Markdown Editor với tính năng auto-save và upload ảnh cho giảng viên soạn bài |
| Phần việc liên quan | Frontend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Senior React Developer.
[CONTEXT] Instructors need to write problem statements and lesson contents. They prefer writing in Markdown.
[TASK] Create a Markdown editor React component with auto-save and image upload support.
[CONSTRAINTS]
1. Use LocalStorage to auto-save drafts every 5 seconds.
2. Support copy-pasting or drag-and-dropping image files, uploading them to S3, and inserting markdown image links `![alt](url)` automatically.
[FORMAT OUTPUT] React code using react-simplemde-editor or similar libraries.
```

#### 5.2. Bối cảnh khi viết prompt

Hỗ trợ giảng viên soạn đề bài lập trình chuyên nghiệp (như chèn bảng, code mẫu) mà không lo bị mất bài viết giữa chừng khi mất mạng.

#### 5.3. Kết quả AI trả về

AI viết component React sử dụng SimpleMDE, viết sự kiện lắng nghe `paste` và `drop` tệp tin để gửi lên S3, sau đó chèn đường dẫn ảnh trực tiếp vào vị trí con trỏ soạn thảo.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã tích hợp Markdown Editor này vào màn hình Soạn thảo đề bài (Edit Problem).

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm tính năng tự động dọn dẹp LocalStorage nháp khi giảng viên nhấn Submit thành công để tránh lưu trữ rác cục bộ.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Tính năng auto-save nháp là cứu cánh tuyệt vời khi trình duyệt của giảng viên vô tình bị đóng hoặc tải lại trang.
```

---

### Prompt số 64

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tối ưu hóa giao diện React bằng kỹ thuật Lazy Loading và Code Splitting để giảm dung lượng bundle ban đầu |
| Phần việc liên quan | Frontend / Optimization |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a React Performance Expert.
[CONTEXT] Our frontend build file `main.js` exceeds 2MB, slowing down initial page loads.
[TASK] Implement code splitting using React Lazy loading and Router integration.
[CONSTRAINTS]
1. Split main routes (Dashboard, IDE Workspace, Course View, profile).
2. Show a loading skeleton while pages are being lazy-fetched.
[FORMAT OUTPUT] React Router file snippet using React.lazy and Suspense.
```

#### 5.2. Bối cảnh khi viết prompt

Tăng tốc độ tải trang chủ của ứng dụng khi người dùng truy cập lần đầu.

#### 5.3. Kết quả AI trả về

AI hướng dẫn thay thế các import tĩnh bằng import động: `const CodingWorkspace = React.lazy(() => import('./pages/CodingWorkspace'))` và bao bọc Router bằng `<Suspense fallback={<SkeletonLoading />}>`.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã thay đổi cấu trúc định tuyến Router trong file App.js của React.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cấu hình cho webpack tự động pre-fetch các route chính (như xem khóa học) khi người dùng đang ở trang chủ để tối ưu tốc độ chuyển trang mượt mà.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Lazy loading giảm thời gian tải trang đầu tiên (Time-to-Interactive) của ứng dụng Single Page Application từ nhiều giây xuống dưới 1 giây.
```

---

### Prompt số 65

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai skeleton loading cho trang chi tiết khóa học để tăng trải nghiệm người dùng |
| Phần việc liên quan | Frontend / UX |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a UI/UX Developer.
[CONTEXT] When course data is fetched from the server, we don't want to show a blank page or a simple spinner. We want a skeleton layout.
[TASK] Create a Tailwind CSS React Skeleton loader for the Course Detail page.
[CONSTRAINTS]
1. Skeleton blocks must match the exact height and width of real content containers.
2. Add a pulsing animation (`animate-pulse`) to make the loader look dynamic.
[FORMAT OUTPUT] JSX component with Tailwind CSS styling.
```

#### 5.2. Bối cảnh khi viết prompt

Giảm bớt cảm giác chờ đợi của người dùng khi mạng bị trễ bằng các khối khung mô phỏng trực quan.

#### 5.3. Kết quả AI trả về

AI sinh ra component `CourseDetailSkeleton` thiết kế các khối bo tròn giả lập thanh tiêu đề, ảnh thumbnail, danh sách bài học có hiệu ứng nhấp nháy mượt mà.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã dùng component này làm màn hình chờ trong khi biến `isLoading` là true.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tự điều chỉnh các màu sắc xám của skeleton sao cho hài hòa với màu nền tối (Dark Mode) của hệ thống.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Skeleton loader tạo cảm giác ứng dụng chạy nhanh hơn so với biểu tượng vòng quay spinner truyền thống.
```

---

### Prompt số 66

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế UI tương thích đa thiết bị (Responsive Design) cho IDE Coding Workspace của học viên trên máy tính và iPad |
| Phần việc liên quan | Frontend / Layout |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a CSS Grid Specialist.
[CONTEXT] The Monaco coding editor page needs to show problem description on the left, editor on the right-top, and console output on the right-bottom.
[TASK] Make this layout responsive using Tailwind CSS classes or raw CSS Grid.
[CONSTRAINTS]
1. On large desktops (lg): side-by-side 2-column layout.
2. On tablets (md): stack editor below problem description.
3. Keep editor height fixed and scrollable.
[FORMAT OUTPUT] React JSX template with CSS/Tailwind configuration.
```

#### 5.2. Bối cảnh khi viết prompt

Học viên có thể học lập trình và xem đề bài dễ dàng trên cả màn hình máy tính bàn lớn và màn hình iPad.

#### 5.3. Kết quả AI trả về

AI hướng dẫn cách dùng grid layout: `grid grid-cols-1 lg:grid-cols-2` và thiết lập thanh kéo co giãn (resize) kích thước các panel thông qua thư viện split.js.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã chỉnh sửa mã nguồn giao diện Coding Workspace theo phong cách responsive.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã viết thêm listener để tự động giảm kích thước font chữ của editor (Monaco fontSize) khi phát hiện chiều rộng màn hình nhỏ hơn 768px.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Responsive IDE tăng tính linh hoạt học tập giúp học viên có thể xem lời giải bài tập ngay trên thiết bị di động.
```

---

### Prompt số 67

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Xây dựng hệ thống thông báo thời gian thực (Push Notifications) về sự kiện thi đấu sử dụng SSE (Server-Sent Events) |
| Phần việc liên quan | Backend / Frontend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a real-time web specialist.
[CONTEXT] We want to notify students instantly when a new contest is about to start or when an announcement is published by instructors.
[TASK] Implement a lightweight uni-directional push notification system using Server-Sent Events (SSE) instead of full-duplex WebSockets.
[CONSTRAINTS]
1. Use Spring Boot `SseEmitter` class.
2. Maintain active connections in a thread-safe registry.
3. Automatically clean up dead emitters on timeout/completion.
[FORMAT OUTPUT] Java emitter service and Javascript connection code.
```

#### 5.2. Bối cảnh khi viết prompt

Đẩy tin nhắn nhắc nhở kỳ thi sắp diễn ra đến mọi học viên đang trực tuyến mà không tốn tài nguyên duy trì kết nối như WebSocket.

#### 5.3. Kết quả AI trả về

AI hướng dẫn tạo endpoint trả về `SseEmitter`, lưu trữ danh sách emitter trong `ConcurrentHashMap`, và phía Client mở kết nối bằng lớp `EventSource` của trình duyệt.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa SSE vào hệ thống để làm chức năng thông báo thông báo khẩn cấp.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã viết thêm cơ chế tự động gửi tin nhắn nhịp tim (heartbeat) định kỳ sau mỗi 30 giây để ngăn các proxy mạng hoặc tường lửa ngắt kết nối.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
SSE nhẹ hơn WebSocket, cấu hình dễ dàng qua giao thức HTTP thường và có khả năng tự động kết nối lại khi đứt mạng.
```

---

### Prompt số 68

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Viết Unit Test cho Service xử lý nạp tiền bằng JUnit 5 và Mockito |
| Phần việc liên quan | Testing / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Test Automation Engineer.
[CONTEXT] I want to write unit tests for `WalletServiceImpl.depositCredits(Integer userId, Double amount, String trxRef)`.
[TASK] Write JUnit 5 unit tests with Mockito to cover success and error scenarios.
[CONSTRAINTS]
1. Mock the UserRepository and WalletRepository.
2. Verify that `save()` is called with updated balance on success.
3. Test failure: user not found -> throws ResourceNotFoundException.
[FORMAT OUTPUT] Clean JUnit 5 test class code.
```

#### 5.2. Bối cảnh khi viết prompt

Kiểm thử tự động logic nạp tiền ví, bảo đảm không xảy ra sai sót khi chỉnh sửa code khác trong tương lai.

#### 5.3. Kết quả AI trả về

AI sinh ra lớp unit test sử dụng `@ExtendWith(MockitoExtension.class)` và các cú pháp `when().thenReturn()` để kiểm tra các luồng nghiệp vụ ví.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã lưu file test này vào thư mục `src/test/java` của dự án backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm bộ sinh dữ liệu mẫu ngẫu nhiên (Faker library) để chạy lặp lại test case với nhiều giá trị số dư ví khác nhau.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Unit test là bước rà soát mã nguồn đầu tiên giúp phát hiện lỗi lập trình sớm nhất trước khi đóng gói sản phẩm.
```

---

### Prompt số 69

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai Integration Test cho API chấm bài sử dụng Testcontainers với Docker PostgreSQL và Docker Judge0 |
| Phần việc liên quan | Testing / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Testcontainers Specialist.
[CONTEXT] I want to test the full submission pipeline: from REST controller call -> saving to DB -> getting verdict. I need an integration test that spins up real databases.
[TASK] Configure Spring Boot integration tests using Testcontainers library.
[CONSTRAINTS]
1. Spin up a PostgreSQL container dynamically.
2. Spin up a MockServer or real Judge0 container to return code execution results.
[FORMAT OUTPUT] Java integration test configuration class.
```

#### 5.2. Bối cảnh khi viết prompt

Chạy kiểm thử tích hợp (Integration Test) kiểm tra toàn bộ luồng chấm bài từ API xuống DB thật trong môi trường cô lập sạch.

#### 5.3. Kết quả AI trả về

AI hướng dẫn cách viết lớp test cơ sở kế thừa `PostgreSQLContainer` để khởi tạo database sạch trước khi chạy các câu lệnh REST Assured test API.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa cấu hình Testcontainers này vào bộ mã kiểm thử tích hợp của backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tối ưu hóa thời gian chạy bằng cách chia sẻ chung một instance container cho tất cả các class test thay vì khởi tạo lại container cho mỗi class.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Testcontainers giúp đảm bảo kết quả kiểm thử trên máy local giống hệt môi trường chạy thật, loại bỏ lỗi do môi trường.
```

---

### Prompt số 70

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Viết End-to-End Test cho luồng đăng ký học và thanh toán bằng Cypress |
| Phần việc liên quan | Testing / Frontend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a QA Automation Engineer.
[CONTEXT] We need to test the user story: Login -> Browse Course -> Click Enroll -> Confirm payOS checkout redirection.
[TASK] Write a Cypress E2E test file to automate this user flow.
[CONSTRAINTS]
1. Stub the login request using intercept to bypass Google OAuth login screen.
2. Click the enroll button and verify target URL matches PayOS redirect pattern.
[FORMAT OUTPUT] Cypress javascript test file.
```

#### 5.2. Bối cảnh khi viết prompt

Đảm bảo giao diện người dùng không bị vỡ hoặc chết link khi thanh toán khóa học khi có thay đổi mã nguồn frontend.

#### 5.3. Kết quả AI trả về

AI sinh ra kịch bản Cypress sử dụng `cy.visit()`, `cy.get().click()`, và giả lập phản hồi của API thanh toán để kiểm tra hành vi chuyển trang.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đưa script này vào thư mục cypress/integration để chạy tự động.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm việc xuất ảnh chụp màn hình (screenshots) tự động nếu có bước kiểm thử nào bị lỗi trong lúc chạy kiểm thử.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Kiểm thử End-to-End giúp QA xác minh hoạt động thực tế của ứng dụng dưới góc nhìn của người dùng cuối.
```

---

### Prompt số 71

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Cấu hình Dockerize ứng dụng Spring Boot sử dụng Multi-stage build để tối ưu hóa kích thước image |
| Phần việc liên quan | DevOps |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Docker Expert.
[CONTEXT] I want to containerize my Spring Boot backend. The standard Dockerfile includes the Maven source code, which makes the image file 800MB.
[TASK] Write a multi-stage Dockerfile that builds the JAR file in stage 1, and copy only the JAR to a slim JRE base image in stage 2.
[CONSTRAINTS]
1. Stage 1: Use maven:3.8-openjdk-17.
2. Stage 2: Use openjdk:17-slim.
3. Run container as a non-root user for security.
[FORMAT OUTPUT] Clean Dockerfile with inline explanations.
```

#### 5.2. Bối cảnh khi viết prompt

Đóng gói mã nguồn backend thành container Docker nhẹ, bảo mật và sẵn sàng deploy lên môi trường cloud.

#### 5.3. Kết quả AI trả về

AI cung cấp tệp Dockerfile hai tầng, sử dụng cơ chế đệm cache maven để giảm thời gian build và xuất ra image cuối cùng chỉ khoảng 200MB.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã lưu file này thành `Dockerfile` ở thư mục gốc của backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi bổ sung thêm cấu hình nén các lớp Docker và dọn dẹp các tệp tin log thừa trước khi đóng gói để tối ưu dung lượng tải.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Dockerfile multi-stage tách biệt hoàn toàn môi trường build và môi trường chạy giúp loại bỏ các tệp tin rác của Maven khỏi image chạy thật.
```

---

### Prompt số 72

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết lập quy trình CI/CD tự động build, test và deploy lên VPS bằng GitHub Actions |
| Phần việc liên quan | DevOps |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a DevOps Engineer.
[CONTEXT] We host our application on an Ubuntu VPS. We want every commit pushed to branch `main` to trigger automated build, test, Docker image push, and deploy on VPS.
[TASK] Write a GitHub Actions workflow configuration file (`.github/workflows/deploy.yml`).
[CONSTRAINTS]
1. Use secrets for SSH key, Docker Hub username, and password.
2. Pull latest docker image and restart container using docker-compose on VPS.
[FORMAT OUTPUT] Yaml configuration workflow file.
```

#### 5.2. Bối cảnh khi viết prompt

Tự động hóa hoàn toàn quy trình triển khai phần mềm lên máy chủ VPS mỗi khi có thành viên nhóm cập nhật code mới lên GitHub.

#### 5.3. Kết quả AI trả về

AI cung cấp file cấu hình YAML định nghĩa các jobs: build-and-test, build-and-push-docker, và deploy-vps gọi lệnh SSH execute remote command.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đẩy tệp cấu hình này lên nhánh chính của repo GitHub.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm một bước rollback tự động: nếu quá trình khởi động container mới bị lỗi, hệ thống tự động khởi chạy lại container phiên bản trước đó.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
CI/CD giúp loại bỏ hoàn toàn các lỗi thủ công khi deploy code lên máy chủ thật.
```

---

### Prompt số 73

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Cấu hình Prometheus và Grafana để giám sát các chỉ số hiệu năng của Spring Boot |
| Phần việc liên quan | DevOps |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a System Reliability Engineer.
[CONTEXT] We want to monitor system metrics (active JVM memory, CPU load, active database connection counts, API error rates) in a Grafana dashboard.
[TASK] Configure Spring Boot Actuator and Micrometer Prometheus Registry.
[CONSTRAINTS]
1. Enable endpoints `/actuator/prometheus` in application.yaml.
2. Secure the actuator endpoints using basic auth or whitelist IP.
3. Write a prometheus.yml config scrape configuration.
[FORMAT OUTPUT] Application configuration and Prometheus config file.
```

#### 5.2. Bối cảnh khi viết prompt

Theo dõi trực quan trạng thái sức khỏe của máy chủ, phát hiện sớm các nguy cơ tràn bộ nhớ RAM (OutOfMemory) trước khi máy chủ bị sập.

#### 5.3. Kết quả AI trả về

AI hướng dẫn kích hoạt dependency `micrometer-registry-prometheus`, cấu hình file yaml của Spring Boot và thiết lập địa chỉ IP scrape cho máy chủ Prometheus.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã bật endpoint Actuator Prometheus ở backend và dựng Docker Grafana để vẽ biểu đồ.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tự import mẫu Dashboard 4701 trên Grafana để có giao diện quản lý tài nguyên JVM cực kỳ trực quan và đẹp mắt.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Actuator giúp lập trình viên nhìn rõ các thông số chạy bên trong máy ảo Java JVM thời gian thực.
```

---

### Prompt số 74

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết lập hệ thống tập trung Log (Centralized Logging) bằng ELK Stack hoặc Grafana Loki |
| Phần việc liên quan | DevOps |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Log Architect.
[CONTEXT] Tracking errors across multiple Docker containers via terminal is painful. We need centralized logs.
[TASK] Configure Spring Boot Logback logging to export logs to Grafana Loki.
[CONSTRAINTS]
1. Use Logback XML configuration.
2. Output logs in structured JSON format (timestamp, log level, thread, logger, message, exception).
[FORMAT OUTPUT] `logback-spring.xml` file configuration.
```

#### 5.2. Bối cảnh khi viết prompt

Gom log lỗi của tất cả các container chạy ngầm vào một giao diện tập trung để thuận tiện cho việc tìm kiếm lỗi và debug.

#### 5.3. Kết quả AI trả về

AI cung cấp file `logback-spring.xml` cấu hình Loki appender để tự động chuyển phát log qua HTTP API về Loki server.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa file cấu hình logback vào thư mục tài nguyên của backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm MDC (Mapped Diagnostic Context) để gắn kèm thông tin `userId` và `transactionId` vào từng dòng log giúp lần vết lỗi của từng user cực kỳ nhanh.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Log có cấu trúc JSON giúp việc truy vấn, lọc tìm lỗi theo từ khóa trên Grafana Dashboard vô cùng thuận tiện.
```

---

### Prompt số 75

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Khắc phục lỗi Memory Leak trong ứng dụng Java do rò rỉ ThreadLocal trong Spring Security context |
| Phần việc liên quan | Backend / Debug |
| Mức độ sử dụng | Hướng dẫn sửa lỗi |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Java Memory Profiler.
[CONTEXT] The server crashes after running for 3 days due to `OutOfMemoryError: Java heap space`. Profiling shows millions of uncollected ThreadLocal variables.
[TASK] Diagnose how ThreadLocal memory leaks occur in a Spring Boot application running on Tomcat and write cleanup code.
[CONSTRAINTS]
1. Explain relation to Tomcat thread pool recycling.
2. Provide code showing how to clean up custom ThreadLocal variables in a Servlet Filter.
[FORMAT OUTPUT] Technical explanation and Java filter implementation class.
```

#### 5.2. Bối cảnh khi viết prompt

Sửa lỗi máy chủ backend chạy vài ngày bị tràn RAM do rò rỉ tài nguyên từ luồng xử lý không được dọn dẹp.

#### 5.3. Kết quả AI trả về

AI giải thích: Tomcat tái sử dụng thread trong pool. Nếu một biến ThreadLocal không được gọi `.remove()` sau khi kết thúc request, dữ liệu sẽ ở lại trong memory mãi mãi, gây rò rỉ. AI cung cấp filter dọn dẹp.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã viết một `CustomThreadLocalCleanupFilter` để giải phóng tất cả các biến ThreadLocal tự định nghĩa sau mỗi request.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cài đặt thêm lệnh `@Override destroy()` để xóa trắng dữ liệu cấu hình khi filter dừng hoạt động.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Luôn bao bọc lệnh giải phóng ThreadLocal trong khối `finally` của filter để đảm bảo được thực thi bất kể request thành công hay lỗi.
```

---

### Prompt số 76

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Khắc phục lỗi Connection Pool Exhaustion khi lượng truy cập tăng đột biến bằng cách tinh chỉnh HikariCP |
| Phần việc liên quan | Backend / Optimization |
| Mức độ sử dụng | Hướng dẫn sửa lỗi |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Database Connection Pool Expert.
[CONTEXT] Under load, our backend throws `SQLTransientConnectionException: Connection is not available, request timed out after 30000ms`.
[TASK] Provide optimal HikariCP configuration values for application.properties and explain how to tune them.
[CONSTRAINTS]
1. Configure `maximum-pool-size`, `minimum-idle`, `idle-timeout`, and `connection-timeout`.
2. Explain connection leak detection.
[FORMAT OUTPUT] Configuration properties and leak detection guide.
```

#### 5.2. Bối cảnh khi viết prompt

Giải quyết sự cố nghẽn kết nối database làm chậm hoặc sập các request API từ frontend khi có nhiều người dùng.

#### 5.3. Kết quả AI trả về

AI đề xuất thiết lập kích thước pool phù hợp (ví dụ max 20-50 tùy theo số lõi CPU của DB), và bật cấu hình phát hiện rò rỉ: `leak-detection-threshold: 2000`.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa các thông số cấu hình tối ưu này vào file `application.yaml`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã rà soát lại toàn bộ dự án, bổ sung chú thích `@Transactional(readOnly = true)` cho các hàm chỉ đọc để Hibernate đóng kết nối sớm giải phóng tài nguyên.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Leak detection giúp hệ thống in cảnh báo log nếu có luồng nào giữ kết nối database quá 2 giây mà không trả lại pool.
```

---

### Prompt số 77

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết lập cấu hình HTTPS bảo mật bằng SSL/TLS qua Let's Encrypt trên Reverse Proxy Nginx |
| Phần việc liên quan | DevOps / Security |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an Nginx Systems Administrator.
[CONTEXT] We need to secure our API server at domain `api.codelearn.com` using HTTPS. Nginx is in front of the Spring Boot app.
[TASK] Write the Nginx server block configuration file supporting SSL and routing requests to port 8080.
[CONSTRAINTS]
1. Redirect all HTTP requests (port 80) to HTTPS (port 443).
2. Configure modern SSL ciphers recommended by Let's Encrypt Certbot.
[FORMAT OUTPUT] Complete Nginx `default.conf` config snippet.
```

#### 5.2. Bối cảnh khi viết prompt

Cấu hình HTTPS để mã hóa dữ liệu truyền tải trên mạng đường truyền internet, bảo vệ mật khẩu và thẻ tín dụng của học viên.

#### 5.3. Kết quả AI trả về

AI viết file cấu hình Nginx, cấu hình chuyển hướng HTTP -> HTTPS và thiết lập đường dẫn đến các chứng chỉ SSL được sinh ra từ certbot.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã áp dụng cấu hình này vào dịch vụ Nginx trên VPS.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi bật thêm Header bảo mật nâng cao HSTS (HTTP Strict Transport Security) để bắt trình duyệt luôn sử dụng HTTPS cho các truy cập sau.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Reverse Proxy bằng Nginx giúp giảm tải việc giải mã SSL cho Spring Boot backend, giúp ứng dụng chạy nhẹ hơn.
```

---

### Prompt số 78

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thực hiện Audit log lịch sử thao tác của các Admin trên hệ thống |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Security Audit Engineer.
[CONTEXT] For security compliance, every time an Admin locks a user, changes platform settings, or deletes a problem, we must log who did it, what action was performed, the request IP, and timestamp.
[TASK] Implement an automated Admin Action Audit trail using Spring AOP (Aspect-Oriented Programming).
[CONSTRAINTS]
1. Write a custom annotation `@AdminAuditLog`.
2. Intercept annotated controller methods, capture parameters, authenticated user, and client IP.
3. Save logs to the database asynchronously.
[FORMAT OUTPUT] Java annotation class, Aspect class, and usage example.
```

#### 5.2. Bối cảnh khi viết prompt

Lưu vết hoạt động của quản trị viên để đối chiếu khi có sự cố dữ liệu hoặc tranh chấp tài chính xảy ra.

#### 5.3. Kết quả AI trả về

AI hướng dẫn định nghĩa Annotation `@AdminAuditLog` và Aspect sử dụng `@Around` để ghi lại lịch sử thao tác của Admin và lưu vào bảng `admin_audit_logs`.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã tạo Aspect và gán Annotation này lên các phương thức nhạy cảm của Admin Controller.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cấu hình lưu thêm thông tin User-Agent để biết Admin thực hiện thao tác trên hệ điều hành và trình duyệt nào.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Aspect-Oriented Programming (AOP) giúp ghi nhật ký sạch sẽ mà không làm rối mã nguồn nghiệp vụ chính.
```

---

### Prompt số 79

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế Hệ thống Gợi ý Khóa học (Recommendation System) dựa trên lịch sử giải bài của Học viên |
| Phần việc liên quan | AI / Database |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Machine Learning Engineer.
[CONTEXT] Our platform has programming problems and video courses. If a student struggles with "Dynamic Programming" problems, we want to recommend dynamic programming video courses.
[TASK] Propose a simple content-based recommendation approach that runs inside PostgreSQL or Spring Boot.
[CONSTRAINTS]
1. Map tags between problems solved with WRONG answer and course categories.
2. Rank recommended courses by matching tag frequency.
[FORMAT OUTPUT] Markdown explanation of the recommendation logic and SQL query.
```

#### 5.2. Bối cảnh khi viết prompt

Tăng cường tỷ lệ giữ chân học viên bằng cách chủ động gợi ý các khóa học phù hợp với điểm yếu lập trình của họ.

#### 5.3. Kết quả AI trả về

AI gợi ý truy vấn SQL kết hợp đếm thẻ phân loại (tags) của các bài nộp lỗi (WA/TLE) của user để nối với khóa học có cùng tag phân loại.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã sử dụng giải thuật SQL này để viết lớp `CourseRecommendationService`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm bộ lọc loại bỏ những khóa học học viên đã mua để tránh gợi ý trùng lặp.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Gợi ý dựa trên thẻ phân loại là bước tiếp cận hệ thống đề xuất nhanh và hiệu quả nhất cho cơ sở dữ liệu quan hệ.
```

---

### Prompt số 80

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tích hợp tính năng lập trình trực tiếp (Interactive Coding Playground) trong phụ đề video |
| Phần việc liên quan | Frontend / Interactive |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an Interactive UX Architect.
[CONTEXT] We want an advanced feature: while watching a video lecture, if the instructor explains a code block, a mini code editor pops up beside the video, allowing students to run that exact code.
[TASK] Design the UI state sync between React Video player and Monaco Editor.
[CONSTRAINTS]
1. Sync based on video track timestamp metadata (WebVTT files).
2. The user's code execution must not stop the video unless they choose to.
[FORMAT OUTPUT] UI workflow diagram and component configuration.
```

#### 5.2. Bối cảnh khi viết prompt

Tạo ra một không gian học tập tương tác cao, học viên vừa xem video vừa gõ code chạy thử trực tiếp mà không cần chuyển màn hình.

#### 5.3. Kết quả AI trả về

AI đề xuất định dạng tệp WebVTT chứa mã nguồn mẫu ở các mốc thời gian và viết React hook đồng bộ state `currentTime` của player để hiển thị editor tương ứng.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã dựng component `InteractiveLecturePlayer` theo thiết kế này.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm nút 'Pause on code popup' cho phép học viên tùy chọn dừng video khi editor hiện ra để kịp gõ code.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Đồng bộ timestamp video qua WebVTT giúp tải mã nguồn mẫu nhẹ nhàng và chính xác theo tiến độ bài học.
```

---

### Prompt số 81

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tạo chứng chỉ khóa học dạng PDF tự động có mã QR xác minh mã hóa |
| Phần việc liên quan | Backend / Cryptography |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Security Developer.
[CONTEXT] When a student finishes a course, we generate a PDF certificate. Anyone can fake a PDF, so we need a secure verification QR code printed on it.
[TASK] Write Java code to generate a PDF certificate with a signature hash and a verification QR code.
[CONSTRAINTS]
1. Use iText or OpenPDF library for PDF creation.
2. Generate SHA256 signature of (StudentId + CourseId + SecretKey).
3. Embed a QR code pointing to a verification URL containing this signature.
[FORMAT OUTPUT] Java helper class code.
```

#### 5.2. Bối cảnh khi viết prompt

Bảo vệ giá trị học thuật của chứng chỉ do nền tảng cấp, tránh việc học viên tự chỉnh sửa file PDF giả mạo thông tin.

#### 5.3. Kết quả AI trả về

AI hướng dẫn sử dụng OpenPDF kết hợp thư viện ZXing để tạo mã QR chứa URL mã hóa, vẽ đè lên phông nền phôi chứng chỉ.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa code này vào lớp `CertificateGenerator` của backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã upload trực tiếp file PDF chứng chỉ lên AWS S3 và lưu link vào cơ sở dữ liệu để phục vụ việc tra cứu lại bất cứ lúc nào.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Xác thực mã hóa bằng chữ ký số qua QR code giúp nhà tuyển dụng dễ dàng quét mã đối soát chứng chỉ thật/giả.
```

---

### Prompt số 82

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Nhập hàng loạt sinh viên vào lớp học (Bulk Import) từ file Excel/CSV |
| Phần việc liên quan | Backend / Integration |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an Integration Developer.
[CONTEXT] Instructors want to import 100+ students into their virtual class section at once by uploading a CSV/Excel file.
[TASK] Create a Spring Boot endpoint that parses uploaded Excel files and inserts student accounts.
[CONSTRAINTS]
1. Use Apache POI or OpenCSV.
2. Validate data fields (email format, blank names) and return a detailed error list for invalid rows without crashing the transaction.
[FORMAT OUTPUT] Spring Boot controller and parser service class.
```

#### 5.2. Bối cảnh khi viết prompt

Giảng viên tiết kiệm thời gian thiết lập lớp học, không phải add thủ công từng học viên vào lớp.

#### 5.3. Kết quả AI trả về

AI viết Service đọc MultipartFile Excel, lặp qua các dòng, kiểm tra định dạng email và gom các lỗi dòng ghi vào danh sách phản hồi.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã tích hợp API này vào màn hình quản lý học viên lớp học.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã bổ sung việc gửi email thông báo tự động đính kèm mật khẩu khởi tạo cho những học viên mới đăng ký tài khoản lần đầu qua file import.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Xử lý import luôn cần cơ chế Transaction: chỉ commit khi toàn bộ dữ liệu đúng, hoặc roll-back kèm báo cáo dòng lỗi cụ thể.
```

---

### Prompt số 83

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế luật mở khóa bài học theo điều kiện tiên quyết (Prerequisite Rules) |
| Phần việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Course Flow Logic Developer.
[CONTEXT] Lessons in a course are sequential. Lesson N requires Lesson N-1 to be completed, or a prerequisite test to be passed.
[TASK] Write an API middleware filter or Interceptor that guards lesson retrieval based on prerequisite logic.
[CONSTRAINTS]
1. Check user's lesson progress database table.
2. Allow bypass rules for instructors or system admins.
[FORMAT OUTPUT] Java Spring Interceptor implementation.
```

#### 5.2. Bối cảnh khi viết prompt

Đảm bảo học viên tiếp thu kiến thức theo đúng lộ trình khoa học của khóa học, tránh nhảy cóc bài viết.

#### 5.3. Kết quả AI trả về

AI viết một HandlerInterceptor kiểm tra sự tồn tại của bản ghi học tập tương ứng trong database, trả về lỗi HTTP 403 nếu bài học trước chưa hoàn thành.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa Interceptor này vào cấu hình MVC của dự án.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tối ưu hóa bằng cách cache trạng thái tiến trình học tập của user vào Redis để giảm thiểu số lượng truy cập vào database khi học viên click bài liên tục.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Xác thực điều kiện tiên quyết ở mức API đảm bảo an toàn hơn việc chỉ ẩn nút bấm ở phía giao diện frontend.
```

---

### Prompt số 84

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế Hệ thống Huy hiệu Thành tích (Badges & Achievement Engine) tự động |
| Phần việc liên quan | Design / Backend |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Gamification Specialist.
[CONTEXT] We want to award digital badges (e.g., 'Python Master', 'Contest Winner') when users achieve milestones.
[TASK] Design the badge database schema and the event listener pattern to award badges.
[CONSTRAINTS]
1. Achievements should be evaluated asynchronously when a submission is marked ACCEPTED.
2. Badges should have unique rules defined in JSON.
[FORMAT OUTPUT] Database DDL schema and Java Spring Event Listener code.
```

#### 5.2. Bối cảnh khi viết prompt

Thúc đẩy động lực học tập của người dùng bằng cách tặng các danh hiệu huy hiệu khi họ vượt qua các mốc bài tập.

#### 5.3. Kết quả AI trả về

AI gợi ý thiết kế bảng `badges` và `user_badges`, sử dụng cơ chế lắng nghe sự kiện (`@EventListener`) sau khi chấm bài thành công để đánh giá điều kiện trao huy hiệu.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã áp dụng mô hình này để viết module `AchievementService`.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tích hợp thư viện Firebase Cloud Messaging để tự động đẩy thông báo chúc mừng thời gian thực khi học viên mở khóa được huy hiệu mới.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Xử lý kiểm tra huy hiệu bằng cơ chế bất đồng bộ giúp luồng chấm bài chính không bị ảnh hưởng hiệu năng.
```

---

### Prompt số 85

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế Cửa hàng đổi quà (Virtual Item Store) tích hợp đổi điểm thưởng |
| Phần việc liên quan | Design / Database |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an E-Commerce Database Designer.
[CONTEXT] Users earn points from solving coding tasks. They can redeem points for virtual goods (profile frames, certificate badges) or physical items (stickers, shirts).
[TASK] Design the database schema for the virtual shop catalog, user points log, and redemption orders.
[CONSTRAINTS]
1. Deduct points atomically and check points >= 0.
2. Track order status (PENDING, DELIVERED, CANCELLED).
[FORMAT OUTPUT] SQL schema and redemption transactional service logic in Java.
```

#### 5.2. Bối cảnh khi viết prompt

Tạo hệ sinh thái điểm thưởng hoàn chỉnh cho nền tảng lập trình thi đấu.

#### 5.3. Kết quả AI trả về

AI đề xuất các bảng `store_items`, `points_logs` và `item_redemptions`, đi kèm dịch vụ trừ điểm ví điểm thưởng an toàn.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã xây dựng database cửa hàng theo đúng thiết kế này.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thêm cơ chế khóa bi quan lên tài khoản điểm thưởng của người dùng để chống race-condition khi nhấn đổi quà liên tiếp nhiều lần.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Mọi chuyển dịch điểm thưởng cần ghi nhật ký (Points Log) chi tiết phục vụ đối soát tương tự ví tiền mặt.
```

---

### Prompt số 86

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai Notification Toast thời gian thực cho hoạt động nhóm học tập |
| Phần việc liên quan | Frontend / UX |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Frontend Developer.
[CONTEXT] When a team member publishes a new comment on a shared code problem, we want a small toast message to pop up at the top-right of the interface.
[TASK] Implement a notification hook in React using react-toastify or react-hot-toast connected to our Server-Sent Events notifications channel.
[CONSTRAINTS]
1. Parse incoming notification JSON and display custom message.
2. Clicking the toast should redirect the user to the specific problem thread.
[FORMAT OUTPUT] Complete React component using react-toastify.
```

#### 5.2. Bối cảnh khi viết prompt

Tăng cường kết nối cộng đồng, giúp người dùng nhận được phản hồi thảo luận ngay lập tức khi đang lập trình.

#### 5.3. Kết quả AI trả về

AI viết React hook lắng nghe EventSource, khởi tạo toast thông báo động của thư viện react-toastify đi kèm hàm onClick chuyển trang qua React Router.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã cài đặt react-toastify và tích hợp hook này vào layout tổng của app.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã bổ sung bộ lọc bỏ qua thông báo nếu chính người dùng hiện tại là tác giả của bình luận đó để tránh làm phiền.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Toast thông báo cần đi kèm âm thanh hoặc hiệu ứng nhẹ để thu hút sự chú ý mà không gây ức chế khi làm bài.
```

---

### Prompt số 87

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Xây dựng lịch trình tự động đẩy bài tập hàng ngày (Daily Challenge Scheduler) |
| Phần việc liên quan | Backend / Maintenance |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Scheduler Developer.
[CONTEXT] We need a 'Daily Challenge' system. Every day at 00:00, the system must select a random problem from the database and set it as the daily challenge, sending a notification to all users.
[TASK] Write the Spring Boot task scheduler class to execute this logic.
[CONSTRAINTS]
1. Use `@Scheduled(cron = "0 0 0 * * ?")`.
2. Save the active challenge in a table `daily_challenges`.
3. Notify users via database notification table.
[FORMAT OUTPUT] Java scheduler class.
```

#### 5.2. Bối cảnh khi viết prompt

Tự động hóa việc làm tươi nội dung hàng ngày trên trang chủ của ứng dụng nhằm thu hút học viên truy cập mỗi ngày.

#### 5.3. Kết quả AI trả về

AI viết phương thức scheduler lấy ngẫu nhiên 1 Problem từ DB dựa trên thuật ngữ SQL ORDER BY RANDOM() và lưu vào bảng thử thách ngày.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã triển khai scheduler này vào dự án backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tối ưu bằng cách chỉ chọn các bài tập có độ khó tăng dần hoặc luân phiên (Dễ, Trung bình, Khó) theo các thứ trong tuần thay vì ngẫu nhiên hoàn toàn.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Bảng thử thách ngày giúp ghi lại lịch sử các bài đã làm thử thách để tránh bị trùng lặp trong tuần.
```

---

### Prompt số 88

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế Bộ máy duyệt chính sách Hoàn tiền (Refund Policy Engine) |
| Phần việc liên quan | Design / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Business Rules Engine Developer.
[CONTEXT] Users can request refunds for purchased courses. Policy: Refund allowed only if purchase is within 7 days AND course progress is under 10%.
[TASK] Implement the automatic refund validation service in Spring Boot.
[CONSTRAINTS]
1. Verify payment records, order date, and progress tracking tables.
2. Update wallet balance and revoke course access atomically upon approval.
[FORMAT OUTPUT] Java Service method with transactional logic.
```

#### 5.2. Bối cảnh khi viết prompt

Xử lý chính xác các giao dịch hoàn tiền tự động để bảo vệ quyền lợi học viên nhưng tránh thất thoát tài chính cho giảng viên.

#### 5.3. Kết quả AI trả về

AI viết hàm kiểm tra ngày mua khóa học và gọi dịch vụ progress tracking để so sánh tiến trình xem video, nếu đạt chuẩn sẽ hoàn tiền ví điện tử.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa logic này vào `RefundServiceImpl` của dự án.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cấu hình gửi mail thông báo tự động lý do từ chối (nếu không đạt điều kiện hoàn tiền) để học viên nắm rõ thông tin.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Giao dịch hoàn tiền bắt buộc phải chạy trong môi trường `@Transactional` để tránh lỗi hoàn tiền thành công nhưng học viên vẫn giữ quyền truy cập khóa học.
```

---

### Prompt số 89

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Hỗ trợ Đa tiền tệ (Multi-currency) và tỷ giá cập nhật tự động |
| Phần việc liên quan | Design / Database |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Database Architect.
[CONTEXT] The platform supports credit purchases in VND, USD, and EUR. We need to store course prices in a base currency and render convert dynamically based on active rates.
[TASK] Design exchange rates database table and write dynamic price conversion helper.
[CONSTRAINTS]
1. Store currency rates with standard ISO codes (VND, USD, EUR).
2. Schedule rate update daily from a free currency API.
[FORMAT OUTPUT] Database DDL and rate conversion Java class.
```

#### 5.2. Bối cảnh khi viết prompt

Chuẩn bị cho nền tảng mở rộng ra thị trường quốc tế, hỗ trợ thanh toán đa quốc gia.

#### 5.3. Kết quả AI trả về

AI đề xuất thiết kế bảng `exchange_rates` và viết scheduler gọi API OpenExchangeRates để cập nhật tỷ giá hàng ngày.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã áp dụng cấu trúc bảng này vào database của dự án.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã thiết lập lưu trữ tỷ giá trong Redis Cache để tránh thực hiện query database trên mỗi lượt render giá tiền khóa học ở client.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Sử dụng cache tỷ giá ngoại tệ giúp API tải trang học viên chạy cực kỳ mượt mà.
```

---

### Prompt số 90

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tự động phân bổ doanh thu (Revenue Split) cho các khóa học đồng giảng dạy |
| Phần việc liên quan | Backend / Financial |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Financial Developer.
[CONTEXT] A course can have primary and secondary instructors. When a sale occurs, platform takes 30%. The remaining 70% is split among instructors based on predefined shares (e.g. 60/40).
[TASK] Implement the automatic revenue split logic after checkout completion.
[CONSTRAINTS]
1. Read split ratios from database table `course_instructors`.
2. Credit each instructor's wallet in a single database transaction.
[FORMAT OUTPUT] Java service method for split processing.
```

#### 5.2. Bối cảnh khi viết prompt

Hỗ trợ các giảng viên hợp tác làm chung nội dung, tự động thanh toán minh bạch quyền lợi.

#### 5.3. Kết quả AI trả về

AI cung cấp thuật toán bóc tách hóa đơn, tính toán phần trăm hoa hồng nền tảng và nạp ví cho các giảng viên theo đúng tỷ lệ phần chia.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã viết logic này vào API xử lý nạp tiền mua khóa học.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã bổ sung thêm bảng ghi nhật ký chi tiết doanh thu (Platform Revenue Shares Log) để phục vụ báo cáo kế toán cuối tháng.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Xử lý số dư ví giảng viên bắt buộc phải sử dụng khóa bi quan (pessimistic lock) dòng ví của họ để bảo đảm độ chính xác tài chính.
```

---

### Prompt số 91

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Xây dựng cơ chế đăng ký và tự động gia hạn thành viên Premium (Subscriptions model) |
| Phần việc liên quan | Design / Backend |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Subscription Billing Engineer.
[CONTEXT] Users can buy Premium membership for 1 month or 1 year to access premium courses and unlimited practice attempts.
[TASK] Design subscription database tables and a Spring Boot daily billing checker.
[CONSTRAINTS]
1. Table to store user subscriptions, start date, end date, active status.
2. A daily cron job must scan for expired subscriptions and flip status to expired, notifying the user.
[FORMAT OUTPUT] DDL SQL statements and Spring Scheduler Java code.
```

#### 5.2. Bối cảnh khi viết prompt

Cung cấp mô hình kinh doanh dạng thu phí định kỳ (SaaS Subscriptions) cho nền tảng.

#### 5.3. Kết quả AI trả về

AI gợi ý thiết kế bảng `user_subscriptions` và class cron job chạy lúc 1h sáng để quét và tự động chuyển đổi trạng thái `active = false` của các gói hết hạn.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã xây dựng mô hình database và scheduler theo đúng gợi ý.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã viết thêm tính năng gửi email nhắc nhở tự động trước 3 ngày trước khi gói thành viên hết hạn gia hạn.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Luôn gửi cảnh báo hết hạn sớm để người dùng có thời gian chủ động nạp thêm tiền hoặc hủy dịch vụ.
```

---

### Prompt số 92

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết lập tác vụ tự động sao lưu Cơ sở dữ liệu (Automated DB Backup) lên AWS S3 |
| Phần việc liên quan | DevOps / Maintenance |
| Mức độ sử dụng | Sinh script |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Database Administrator.
[CONTEXT] We need a daily automated backup of our production PostgreSQL database to prevent data loss in case of hardware failure.
[TASK] Write a bash script to perform pg_dump, compress it with gzip, upload to AWS S3, and clean local temp backups.
[CONSTRAINTS]
1. Automate using crontab on Linux VPS.
2. Backups on S3 older than 60 days must be deleted automatically (S3 Lifecycle policies or script check).
[FORMAT OUTPUT] Complete Bash script code.
```

#### 5.2. Bối cảnh khi viết prompt

Phòng chống mất dữ liệu của học viên và giao dịch khi máy chủ bị lỗi phần cứng đột xuất.

#### 5.3. Kết quả AI trả về

AI sinh ra một đoạn script shell bash sử dụng lệnh `pg_dump`, nén bằng tar.gz và gọi lệnh `aws s3 cp` để đồng bộ lên bucket đám mây.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã cài đặt script này vào Cron của hệ thống VPS Ubuntu.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi cấu hình thêm lệnh ping thông báo trạng thái sao lưu thành công (hoặc thất bại) gửi thẳng về kênh chat của nhóm qua Discord Webhook.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Giám sát sao lưu tự động là bước bắt buộc để chắc chắn hệ thống backup luôn hoạt động ổn định.
```

---

### Prompt số 93

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Cấu hình tắt ứng dụng an toàn (Graceful Shutdown) cho Spring Boot backend để tránh rớt request đang xử lý |
| Phần việc liên quan | Backend / DevOps |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an Infrastructure Architect.
[CONTEXT] When we deploy new codes, the CI/CD pipeline restarts the Spring Boot backend. Uncompleted API requests or code running operations are cut off, causing errors for users.
[TASK] Configure Graceful Shutdown in Spring Boot.
[CONSTRAINTS]
1. Set server shutdown mode to graceful.
2. Configure dynamic thread pool execution settings to allow pending task completion.
[FORMAT OUTPUT] Configuration properties and explanation of shutdown sequence.
```

#### 5.2. Bối cảnh khi viết prompt

Đảm bảo quá trình cập nhật mã nguồn (deploy code mới) diễn ra mượt mà, không làm đứt quãng bài thi hoặc giao dịch thanh toán đang dở của học viên.

#### 5.3. Kết quả AI trả về

AI hướng dẫn thêm cấu hình `server.shutdown: graceful` và `spring.lifecycle.timeout-per-shutdown-phase: 30s` vào file `application.yaml` để chờ tối đa 30 giây cho các request cũ xử lý xong.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa cấu hình tắt graceful này vào tệp cấu hình chính của backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tinh chỉnh thêm cấu hình kết nối pool cơ sở dữ liệu Hikari để ngắt kết nối an toàn sau khi các transaction đang dở hoàn tất.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Graceful shutdown giúp hệ thống đạt độ khả dụng cao (high availability) không gián đoạn dịch vụ lúc bảo trì.
```

---

### Prompt số 94

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết lập cấu hình Auto-scaling cho Kubernetes Deployment dựa trên chỉ số CPU/Memory |
| Phần việc liên quan | DevOps |
| Mức độ sử dụng | Sinh cấu hình |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Kubernetes Engineer.
[CONTEXT] Our Online Judge system experiences huge spikes during contests. We want to deploy on K8s and scale pods dynamically.
[TASK] Write the HorizontalPodAutoscaler (HPA) yaml configuration file.
[CONSTRAINTS]
1. Set minimum replicas: 2, maximum replicas: 10.
2. Trigger scale-up when average CPU utilization exceeds 75% or Memory usage exceeds 80%.
[FORMAT OUTPUT] Complete YAML configuration snippet.
```

#### 5.2. Bối cảnh khi viết prompt

Hệ thống tự động gia tăng sức mạnh (phát triển thêm máy chủ) khi cuộc thi diễn ra và tự động thu gọn lại để tiết kiệm chi phí lúc thấp điểm.

#### 5.3. Kết quả AI trả về

AI cung cấp file cấu hình HPA YAML chỉ định mục tiêu Deployment và các metrics CPU/Memory tương ứng.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã lưu file này và triển khai lên cụm server Kubernetes chạy thử.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi cấu hình thêm chỉ số custom metric (số lượng connection queue của RabbitMQ) làm điều kiện scale-up để hệ thống giãn nở trước khi CPU kịp đạt ngưỡng nghẽn.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Auto-scaling theo kích thước hàng đợi (Queue-based scaling) là giải pháp tối ưu nhất cho các ứng dụng bất đồng bộ.
```

---

### Prompt số 95

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết lập giải pháp Sao lưu dự phòng và Phục hồi sau thảm họa (Disaster Recovery) |
| Phần việc liên quan | Architecture / DevOps |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Disaster Recovery Planner.
[CONTEXT] If our primary server data center catches fire, we must restore service within 4 hours (RTO = 4h) with max data loss of 1 hour (RPO = 1h).
[TASK] Design a disaster recovery replication strategy for database and files.
[CONSTRAINTS]
1. Use PostgreSQL Streaming Replication to a secondary hot-standby node.
2. Replicate AWS S3 bucket contents across regions.
[FORMAT OUTPUT] Detailed architecture description and failover check list.
```

#### 5.2. Bối cảnh khi viết prompt

Xây dựng phương án dự phòng chuẩn công nghiệp để bảo đảm an toàn dữ liệu tuyệt đối trước mọi sự cố khách quan.

#### 5.3. Kết quả AI trả về

AI thiết kế mô hình Primary-Standby kết hợp công cụ pgPool để tự động phát hiện node chính chết và kích hoạt node phụ lên làm Master (Failover).

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa mô hình này vào thiết kế hạ tầng dự án để báo cáo trước hội đồng.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã viết script kiểm tra ping tự động (Heartbeat check) từ một máy chủ thứ ba để cảnh báo trạng thái hoạt động của cụm DB.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
DR plan giúp doanh nghiệp duy trì liên tục hoạt động kinh doanh ngay cả khi toàn bộ trung tâm dữ liệu chính gặp sự cố.
```

---

### Prompt số 96

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai cơ chế Bật/Tắt tính năng động (Feature Flags / Feature Toggles) |
| Phần việc liên quan | Design / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Release Engineer.
[CONTEXT] We want to test the Plagiarism scanning feature only for a few specific users (Beta testing) before launching to everyone, and be able to disable it instantly if it causes bugs.
[TASK] Design a lightweight Feature Flag database table and verification utility service in Spring Boot.
[CONSTRAINTS]
1. Cache active flags in Redis to avoid database queries on every API request.
2. Support flag evaluation by User ID or Role.
[FORMAT OUTPUT] SQL schema and Java FeatureToggleService class.
```

#### 5.2. Bối cảnh khi viết prompt

Quản lý việc ra mắt các tính năng mới một cách an toàn, có thể tắt ngay lập tức nếu phát hiện lỗi nghiêm trọng trên production.

#### 5.3. Kết quả AI trả về

AI thiết kế bảng `feature_flags` và viết service kiểm tra trạng thái flag theo UserId kết hợp Redis để truy vấn nhanh.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã áp dụng lớp `FeatureToggleService` để bao bọc các tính năng mới.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi tự viết thêm một trang quản trị Admin UI đơn giản có các nút switch bật/tắt trực quan để thay đổi giá trị flag trong DB nhanh chóng.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Feature flags cho phép tách biệt giữa công đoạn Deploy code và công đoạn Release tính năng đến người dùng.
```

---

### Prompt số 97

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Tự động hóa kiểm tra lỗi bảo mật thư viện (OWASP Dependency Check) |
| Phần việc liên quan | DevOps / Security |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a DevSecOps Engineer.
[CONTEXT] Java applications often use libraries with known vulnerabilities (CVEs). We want to scan our `pom.xml` automatically during local Maven builds.
[TASK] Configure the OWASP Dependency-Check plugin in Maven.
[CONSTRAINTS]
1. Set the build to fail if a vulnerability with a CVSS score higher than 7.0 is found.
2. Exclude false positives using a suppression XML file.
[FORMAT OUTPUT] Maven pom.xml plugin configuration block.
```

#### 5.2. Bối cảnh khi viết prompt

Ngăn chặn sớm các rủi ro bảo mật bắt nguồn từ các thư viện bên thứ ba bị lỗi thời hoặc dính lỗi bảo mật nghiêm trọng.

#### 5.3. Kết quả AI trả về

AI hướng dẫn thêm plugin `dependency-check-maven` vào file `pom.xml` của dự án và cấu hình thuộc tính `failBuildOnCVSS`.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã cấu hình plugin này vào file pom.xml gốc của backend.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tích hợp plugin này chạy trực tiếp trong quy trình build tự động của GitHub Actions để chặn các commit có thư viện dính mã độc.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Rà soát thư viện thường xuyên là yêu cầu bắt buộc của các dự án phần mềm chuyên nghiệp để phòng chống hack hệ thống.
```

---

### Prompt số 98

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế Hệ thống Quét và Phân loại Tag tự động cho Bài tập Lập trình bằng AI |
| Phần việc liên quan | AI / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as an AI Curriculum Specialist.
[CONTEXT] When instructors create a coding problem, they might not assign tags properly. We want to auto-categorize it using Gemini.
[TASK] Create a system prompt that takes problem description, sample inputs, and code solutions to generate tags (e.g. Dynamic Programming, Graph) and difficulty rating.
[CONSTRAINTS]
1. Output must be strictly valid JSON schema.
2. Limit difficulty to values: EASY, MEDIUM, HARD.
[FORMAT OUTPUT] System prompt and request handler integration code.
```

#### 5.2. Bối cảnh khi viết prompt

Đảm bảo tính đồng bộ dữ liệu, giúp phân nhóm bài tập khoa học mà không phụ thuộc vào tính tự giác gắn tag của giảng viên.

#### 5.3. Kết quả AI trả về

AI viết prompt hướng dẫn Gemini đọc cấu trúc đề bài để phân loại thẻ học tập và độ khó thuật toán chính xác dựa trên độ phức tạp O(N).

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa logic này vào tính năng hỗ trợ soạn đề bài của giảng viên.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tinh chỉnh thêm logic: hiển thị gợi ý tag của AI ra để giảng viên rà soát lại trước khi bấm xác nhận lưu vào DB.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Cho phép con người review lại kết quả gợi ý của AI trước khi ghi đè vào DB là phương thức thiết kế AI kết hợp (Human-in-the-loop) tốt nhất.
```

---

### Prompt số 99

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Triển khai cơ chế nén ảnh tự động trước khi lưu trữ để tối ưu hóa băng thông tải trang |
| Phần việc liên quan | Backend / Optimization |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a Media Optimization Expert.
[CONTEXT] Users upload 5MB PNG files for profiles or course banner cards, slowing down mobile network loading and wasting S3 space.
[TASK] Write Java code to resize uploaded image files to max width 1200px and compress them to WebP format with quality 75%.
[CONSTRAINTS]
1. Preserve original aspect ratio during resizing.
2. Return byte array for direct cloud upload.
[FORMAT OUTPUT] Java helper class using Java ImageIO or specialized library.
```

#### 5.2. Bối cảnh khi viết prompt

Tiết kiệm chi phí truyền tải băng thông mạng đám mây và tối ưu tốc độ render ảnh trên thiết bị của học viên.

#### 5.3. Kết quả AI trả về

AI viết một Image Utility sử dụng `BufferedImage` để chuyển đổi định dạng PNG/JPG sang WebP có độ nén cao mà không vỡ hình.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã đưa logic nén ảnh này vào lớp xử lý file tải lên.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã cấu hình chạy tác vụ nén ảnh bất đồng bộ ở background thread để người dùng không phải chờ lâu lúc nhấn tải ảnh.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Định dạng ảnh WebP nén tốt hơn JPG 30% và PNG 80% mà chất lượng hình ảnh hầu như không thay đổi bằng mắt thường.
```

---

### Prompt số 100

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích | Thiết kế Hệ thống Cảnh báo Lỗi Hệ thống chủ động (Proactive Error Alerting) |
| Phần việc liên quan | DevOps / Reliability |
| Mức độ sử dụng | Sinh code mẫu |

#### 5.1. Prompt nguyên văn

```text
[ROLE] Act as a reliability monitoring engineer.
[CONTEXT] We want to know immediately if our payment webhooks fail or if Judge0 API goes down without manually checking log files.
[TASK] Implement an exception logger aspect in Spring Boot that posts error alerts to a Discord Webhook.
[CONSTRAINTS]
1. Intercept class annotations `@RestControllerAdvice` or use AOP on `@ExceptionHandler`.
2. Format message professionally: include stacktrace summary, active profile, endpoint path, and timestamp.
3. Throttle error posts (max 1 message per minute for identical errors) to avoid API spam.
[FORMAT OUTPUT] Java Spring `@Aspect` or global exception handler logging code.
```

#### 5.2. Bối cảnh khi viết prompt

Phát hiện và xử lý lỗi hệ thống ngay khi nó xảy ra, nâng cao uy tín hoạt động của nền tảng.

#### 5.3. Kết quả AI trả về

AI hướng dẫn viết `@RestControllerAdvice` kết hợp thư viện RestTemplate để gửi POST request chứa payload embed Message đến Discord Webhook channel.

#### 5.4. Kết quả đã áp dụng vào bài

Tôi đã triển khai hệ thống cảnh báo lỗi này vào mã nguồn backend chính thức.

#### 5.5. Phần sinh viên/nhóm đã chỉnh sửa hoặc cải tiến

Tôi đã tích hợp thêm cơ chế lọc bỏ các lỗi người dùng thông thường (như lỗi nhập sai mật khẩu 401, dữ liệu trống 400) để kênh chat Discord không bị trôi tin nhắn.

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
| File liên quan |  |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link tài liệu/báo cáo |  |
| Ghi chú khác |  |

#### 5.8. Ghi chú thêm

```text
Hệ thống cảnh báo lỗi tự động giúp đội ngũ phát triển phát hiện và vá lỗi trên production trước khi người dùng kịp gửi ticket phàn nàn.
```

---

## 6. Prompt quan trọng nhất

Chọn một prompt có ảnh hưởng lớn nhất đến bài tập/project.

### 6.1. Prompt được chọn

```text
Tôi đang xây dựng một dự án thi lập trình trực tuyến (Online Judge) bằng Spring Boot và React. Hãy gợi ý cho tôi các giải pháp xây dựng tính năng tự động biên dịch và chấm bài (grader engine) bảo mật và tối ưu nhất cho đồ án sinh viên. Đánh giá ưu nhược điểm của việc tự dựng sandbox (bằng Docker/Jail) so với việc tích hợp các API có sẵn của bên thứ ba (như Judge0 API).
```

### 6.2. Vì sao prompt này quan trọng?

```text
Tính năng tự động chấm code (Grader Engine) là trái tim và linh hồn của một hệ thống Competitive Programming / Online Judge Platform. Đây là một tính năng cực kỳ khó và có rủi ro bảo mật hệ thống nghiêm trọng nhất (Remote Code Execution - người dùng nộp mã độc phá hoại server). Nếu không có quyết định kiến trúc đúng đắn từ prompt này, nhóm có thể đã đi sai hướng khi cố tự build sandbox local bằng Docker (rất phức tạp và dễ bị hack) hoặc tích hợp thư viện không an toàn, dẫn đến việc không thể hoàn thành dự án đúng hạn hoặc tạo ra một sản phẩm không an toàn.
```

### 6.3. Kết quả prompt này mang lại

```text
Prompt này mang lại giải pháp kiến trúc đột phá cho nhóm: thay vì tự phát triển một grader engine từ đầu (mất nhiều tuần và nguy cơ bảo mật cao), nhóm quyết định sử dụng Judge0 API. Giải pháp này giúp hệ thống hỗ trợ biên dịch an toàn hơn 50 ngôn ngữ lập trình trong môi trường sandbox cô lập hoàn toàn. Nhóm tiết kiệm được 60% thời gian phát triển phần cốt lõi để tập trung hoàn thiện giao diện học tập, quản lý bài tập, lớp học trực tuyến và tối ưu trải nghiệm thi đấu.
```

### 6.4. Sinh viên/nhóm đã kiểm tra kết quả như thế nào?

```text
Tôi đã kiểm tra kết quả đề xuất của AI bằng cách:
1. Đọc và đối chiếu tài liệu API chính thức của dịch vụ Judge0 API bản miễn phí để tìm hiểu luồng gửi request và các định dạng JSON payload.
2. Viết các đoạn mã kiểm thử gửi request (chứa mã nguồn C++ và Python) từ Postman và Spring Boot RestTemplate trực tiếp đến máy chủ Judge0 để đánh giá thời gian phản hồi (latency) và tính chính xác của kết quả trả về (Accepted, Wrong Answer, Compile Error).
3. Đánh giá tính bảo mật bằng cách gửi thử các đoạn mã cố tình độc hại (như loop vô hạn, ghi/xóa file hệ thống) lên Judge0 và xác nhận rằng hệ thống sandbox của họ đã block và trả về lỗi TLE (Time Limit Exceeded) hoặc Runtime Error cực kỳ chính xác mà không gây hại đến server chính của chúng tôi.
```

### 6.5. Sinh viên/nhóm đã cải tiến gì từ kết quả AI?

```text
Mặc dù AI gợi ý tích hợp Judge0 API trực tiếp, nhóm đã nhận ra vấn đề nếu chỉ gọi API trực tiếp từ Client hoặc gọi tuần tự từ Backend sẽ dễ dẫn đến nghẽn mạng (bottleneck) hoặc quá hạn mức request. Nhóm đã thực hiện các cải tiến kiến trúc vượt trội:
1. Xây dựng một Message Queue / Submission Queue trung gian ở Backend Spring Boot để quản lý các yêu cầu chấm bài theo hàng đợi, đảm bảo tính ổn định và không làm sập server khi có hàng trăm sinh viên submit bài cùng lúc.
2. Triển khai cơ chế Polling kết hợp gửi kết quả thời gian thực về Client bằng WebSocket thay vì bắt client reload trang để chờ kết quả.
3. Thiết kế bảng `Submission` và `ProblemTestcase` chuẩn hóa trong MySQL để lưu trữ vết lịch sử và hiển thị chi tiết từng testcase chạy đúng/sai cho học viên.
```

---

## 7. Prompt chưa hiệu quả

Ghi lại ít nhất một prompt chưa tạo ra kết quả tốt hoặc chưa phù hợp.

### 7.1. Prompt chưa hiệu quả

```text
Dán prompt chưa hiệu quả tại đây.
```

### 7.2. Vì sao prompt này chưa hiệu quả?

```text
Viết tại đây...
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
Viết tại đây...
```

### 7.4. Prompt sau khi cải tiến

```text
Dán prompt đã được cải tiến tại đây.
```

### 7.5. Kết quả sau khi cải tiến prompt

```text
Viết tại đây...
```

---

## 8. Bài học về cách viết prompt

### 8.1. Khi viết prompt, em/nhóm cần cung cấp thông tin gì để AI trả lời tốt hơn?

```text
Viết tại đây...
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
Viết tại đây...
```

### 8.3. Lần sau em/nhóm sẽ cải thiện prompt như thế nào?

```text
Viết tại đây...
```

---

## 9. Phân loại prompt đã sử dụng

Đánh dấu số lượng prompt theo từng nhóm.

| Loại prompt | Số lượng | Ví dụ prompt tiêu biểu |
|---|---:|---|
| Prompt phân tích yêu cầu |  |  |
| Prompt giải thích kiến thức |  |  |
| Prompt thiết kế giải pháp |  |  |
| Prompt thiết kế database |  |  |
| Prompt sinh code mẫu |  |  |
| Prompt debug lỗi |  |  |
| Prompt viết test case |  |  |
| Prompt review code |  |  |
| Prompt tối ưu code |  |  |
| Prompt viết báo cáo |  |  |
| Prompt chuẩn bị thuyết trình |  |  |
| Prompt khác |  |  |

---

## 10. Checklist chất lượng prompt

Sinh viên/nhóm tự kiểm tra chất lượng prompt đã dùng.

| Tiêu chí | Đã đạt? | Ghi chú |
|---|:---:|---|
| Prompt có mục tiêu rõ ràng |  |  |
| Prompt có đủ bối cảnh |  |  |
| Prompt có nêu công nghệ/ngôn ngữ sử dụng |  |  |
| Prompt có nêu yêu cầu đầu ra |  |  |
| Prompt không yêu cầu AI làm toàn bộ bài một cách máy móc |  |  |
| Prompt có yêu cầu AI giải thích hoặc phân tích |  |  |
| Kết quả AI được kiểm tra lại |  |  |
| Kết quả AI được chỉnh sửa trước khi sử dụng |  |  |
| Prompt quan trọng được ghi lại đầy đủ |  |  |
| Prompt sai/chưa hiệu quả được rút kinh nghiệm |  |  |

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
|  |  |
