# AI Audit Log

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
| Ngày hoàn thành | 2026-07-09 |

---

## 2. Công cụ AI đã sử dụng

Đánh dấu các công cụ AI đã sử dụng trong quá trình thực hiện bài tập/project.

- [ ] ChatGPT
- [ ] Gemini
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
Hỗ trợ nhóm trong quá trình phát triển các module Problem Management, Instructor Revenue Dashboard và Admin Financial Stats. Sử dụng AI để sinh mã (boilerplate code), tính toán các biểu đồ SVG phức tạp, tối ưu hóa hiệu năng bằng Promise.all và bóc tách monolithic API, và sửa các lỗi về Form Validation và React State.
```

---

## 4. Nhật ký sử dụng AI chi tiết

> Mỗi lần sử dụng AI cho một phần quan trọng của bài tập/project, sinh viên cần ghi lại theo mẫu bên dưới.  
> Sinh viên/nhóm có thể nhân bản mẫu “Lần sử dụng AI” nhiều lần tùy theo số lần sử dụng AI thực tế.

---

### Lần sử dụng AI số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-10 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tạo model và cấu trúc thư mục cho Problem Management |
| Phân việc liên quan | Backend / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang xây dựng phân hệ Quản lý Bài tập (Problem Management) cho một nền tảng thi đấu lập trình (Online Judge). Ở phía backend sử dụng Spring Boot 3 và Hibernate. Hãy giúp tôi thiết kế cấu trúc thư mục chuẩn (Controller, Service, Repository, Entity, DTO) và tạo class Entity `Problem` chứa các trường cơ bản như title, description, timeLimit, memoryLimit, difficulty, và acceptanceRate. Vui lòng sử dụng các annotation của Lombok để tối ưu code.
```

#### 4.2. Kết quả AI gợi ý

```text
Antigravity đã cung cấp cấu trúc package theo mô hình MVC (Controller-Service-Repository) và cung cấp file Java `Problem.java` với đầy đủ các annotation `@Entity`, `@Table`, `@Data`, `@NoArgsConstructor`, `@AllArgsConstructor` của Lombok.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã dùng đoạn mã sinh ra để khởi tạo cấu trúc thư mục cho module Problem và dán trực tiếp entity vào dự án để hibernate tự động generate table.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tự bổ sung thêm các trường liên quan đến Audit (createdBy, updatedBy, createdAt, updatedAt) sử dụng `@EntityListeners(AuditingEntityListener.class)` để theo dõi lịch sử chỉnh sửa bài tập theo chuẩn của hệ thống.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-10 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Viết các service gọi API lấy danh sách bài tập |
| Phân việc liên quan | Backend / API |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Dựa trên Entity Problem đã tạo, hãy viết cho tôi một `ProblemService` và `ProblemController` trong Spring Boot. Tôi cần một API GET `/api/v1/problems` hỗ trợ phân trang (Pagination) sử dụng `Pageable` của Spring Data JPA. Trả về kết quả dưới dạng `Page<ProblemDTO>` để che giấu các thông tin không cần thiết.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đã sinh code cho interface `ProblemRepository` kế thừa `JpaRepository`, class `ProblemService` với hàm `getAllProblems(Pageable pageable)` sử dụng mapper để chuyển từ Entity sang DTO, và REST Controller xử lý HTTP GET mapping.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng toàn bộ logic phân trang `Pageable` và cấu trúc chuyển đổi DTO do AI cung cấp. Logic này hoạt động ngay trong lần chạy đầu tiên.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tích hợp thêm một lớp `ApiResponse<T>` chung của dự án để bọc kết quả trả về, đảm bảo frontend luôn nhận được format `{status, message, data}` đồng nhất.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-11 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế giao diện danh sách bài tập (Problem List UI) |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Ở phía Frontend React (dùng Vite) và Tailwind CSS, hãy thiết kế một component hiển thị danh sách bài tập dưới dạng Table. Bảng này cần có các cột: Status (icon checkmark nếu đã giải), Title, Acceptance Rate, và Difficulty (Easy màu xanh, Medium màu vàng, Hard màu đỏ). Thiết kế mang phong cách hiện đại giống Leetcode, có hover effect ở từng hàng.
```

#### 4.2. Kết quả AI gợi ý

```text
Antigravity đã viết một component React sử dụng thẻ `<table>` với class Tailwind như `w-full text-left border-collapse`. Cung cấp hàm helper `getDifficultyColor()` để render thẻ tag màu sắc linh hoạt dựa vào độ khó.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã dùng cấu trúc bảng và các class Tailwind CSS (hiệu ứng hover: `hover:bg-gray-100 dark:hover:bg-gray-800`) cho màn hình Problem List.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thay vì dùng dữ liệu tĩnh do AI sinh ra, tôi đã kết nối component này với Redux Toolkit Query để tự động fetch danh sách bài tập thực tế từ backend.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-11 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thêm chức năng lọc và phân trang bài tập |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Tiếp tục với bảng danh sách bài tập, tôi muốn thêm một bộ lọc (Filter) theo Difficulty (Dropdown chọn All, Easy, Medium, Hard) và một thanh tìm kiếm theo tên bài tập. Ngoài ra, hãy viết logic xử lý chuyển trang (Pagination) ở dưới cùng của bảng. Tôi nên quản lý state của filters và page như thế nào trong React để khi URL thay đổi (có query param) thì dữ liệu tự update?
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý sử dụng custom hook `useSearchParams` từ `react-router-dom` để lưu trạng thái page và filter trực tiếp trên URL. AI cung cấp component Pagination với các nút Prev, Next và số trang.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Áp dụng nguyên lý đồng bộ state vào URL params, giúp tính năng lọc và phân trang hoạt động ổn định và hỗ trợ user copy link chia sẻ.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tự xây dựng lại giao diện của các component Dropdown và Pagination bằng Headless UI để thân thiện với accessibility và khớp với theme chung của ứng dụng.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(problem): integrate database-driven problem API and dynamic UI` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-11 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xử lý state khi chuyển trang Problem List |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Khi người dùng đang ở trang 3 của danh sách bài tập, sau đó họ gõ tìm kiếm một từ khóa vào thanh search, danh sách trả về ít hơn và không đủ 3 trang, dẫn đến bảng bị trống. Nguyên nhân của lỗi này là gì và làm sao để khắc phục triệt để bằng React Hooks?
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích rằng khi thay đổi điều kiện filter/search, số lượng tổng (total pages) sẽ thay đổi. Nếu vẫn giữ nguyên `page=3` thì sẽ bị out of bound. Cách xử lý là cần dùng `useEffect` hoặc event handler của thanh search để tự động reset `page` về 1 mỗi khi từ khóa tìm kiếm hoặc filter thay đổi.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng lời giải thích của AI để hiểu rõ lifecycle của state khi fetch dữ liệu phụ thuộc lẫn nhau.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi viết một hàm `handleSearchChange(keyword)` để cập nhật cả URL query param `search` và đồng thời đè `page=1` vào một lần `setSearchParams` duy nhất để tránh re-render nhiều lần.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(problem): complete problem feature implementation` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-12 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Hiển thị chi tiết nội dung Problem (Markdown) |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Đề bài tập của tôi được lưu dưới dạng chuỗi Markdown trong database. Khi lấy về Frontend, tôi muốn hiển thị nó thành HTML định dạng đẹp (có in đậm, danh sách, khối code, công thức toán học). Hãy gợi ý thư viện React nào phù hợp nhất để render Markdown an toàn, tránh lỗi XSS và có thể highlight syntax cho các khối code.
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý sử dụng thư viện `react-markdown` kết hợp với plugin `remark-gfm` (cho table, strikethrough) và `rehype-raw` (cho HTML nhúng). Để highlight code, AI đề xuất dùng `react-syntax-highlighter` bọc bên trong custom component cho thẻ `<code>` của react-markdown.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi cài đặt các thư viện AI gợi ý và sử dụng đúng cấu trúc custom render component cho thẻ `code` để có syntax highlighting giống hệt phong cách Github.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tự bọc thẻ render Markdown này vào trong một component `DomPurify` để tăng cường thêm một lớp bảo vệ XSS chặn các script độc hại nhúng ngầm.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(problem): complete problem feature implementation` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-13 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tạo layout Editor cho giao diện làm bài |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Hãy viết cho tôi bộ khung UI React cho giao diện làm bài (Coding Workspace). Tôi cần màn hình chia làm 2 phần dọc (Split View). Nửa bên trái là component hiển thị đề bài, nửa bên phải chia làm hai phần trên dưới: phía trên là Trình soạn thảo (Code Editor), phía dưới là Terminal để chạy testcase. Tôi nên dùng thư viện nào để có thanh kéo thả chia màn hình?
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý dùng thư viện `allotment` hoặc `react-split-pane` để tạo split view kéo thả được. AI cung cấp code mẫu cấu trúc Flexbox và CSS Grid để dàn trang sao cho editor luôn chiếm phần lớn màn hình và terminal ở dưới có thể thu gọn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi sử dụng `allotment` để dựng layout kéo thả vì nó hoạt động rất mượt và hỗ trợ tốt trên React 18.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi gắn thêm thư viện `@monaco-editor/react` vào phần code editor thay cho textarea tĩnh, cấu hình lại các hotkey (Ctrl+S, Ctrl+Enter) để tiện dụng cho người dùng thi đấu lập trình.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(problem): complete problem feature implementation` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-13 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Gắn kết giao diện Problem với API Nộp bài |
| Phân việc liên quan | Frontend / API |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Khi người dùng click nút 'Submit Code', tôi cần lấy giá trị hiện tại của Monaco Editor, kết hợp với problemId và languageId để gửi POST request đến backend. Tuy nhiên, thời gian chấm bài có thể mất từ 3-5 giây. Làm sao để quản lý trạng thái loading ở nút submit và ngăn người dùng spam click trong lúc chờ đợi?
```

#### 4.2. Kết quả AI gợi ý

```text
AI khuyên dùng state `isSubmitting` đặt thành true ngay khi click và disabled nút button. AI cũng cung cấp đoạn code gọi fetch API bọc trong khối `try...catch` và đảm bảo đưa `setIsSubmitting(false)` vào khối `finally` để nút luôn được mở lại dù request thành công hay lỗi.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi áp dụng cấu trúc try/catch/finally vào tất cả các lời gọi API tương tác mạnh trong ứng dụng, giúp trạng thái nút bấm trở nên đáng tin cậy.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi thêm vào thư viện `react-toastify` để hiện thông báo (toast) khi quá trình nộp bài bị lỗi do rớt mạng trước khi tới được server.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(problem): complete problem feature implementation` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-14 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tạo layout tổng quan (Overview) cho Dashboard giảng viên |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang làm trang Revenue Dashboard cho vai trò Instructor. Phần đầu trang cần hiển thị 4 thẻ thống kê (Stats Cards): Total Revenue, Sales This Month, Total Enrollments, Active Courses. Hãy dùng Tailwind CSS thiết kế các thẻ này sao cho có icon bên trái, số liệu lớn bên phải, và một dòng chữ nhỏ màu xanh lục/đỏ ở dưới mô tả phần trăm tăng giảm so với tháng trước.
```

#### 4.2. Kết quả AI gợi ý

```text
Antigravity cung cấp code React component `StatCard`. Sử dụng CSS Flexbox, màu sắc Tailwind như `text-green-500` cho số dương (tăng trưởng) và icon từ thư viện Lucide React.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng toàn bộ layout HTML/Tailwind của thẻ StatCard để thiết kế cho Dashboard vì nó rất tinh tế và tối giản.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tự đóng gói lại `StatCard` thành một component nhận props động thay vì hardcode, giúp tái sử dụng nó ở cả Admin Dashboard sau này.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat: implement instructor revenue management feature` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-14 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tạo các Widget Component tái sử dụng cho Revenue |
| Phân việc liên quan | Frontend / Architecture |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Trang Dashboard của tôi ngày càng phức tạp và file bị phình to (hơn 500 dòng). Hãy đề xuất một cấu trúc phân tách file Component hợp lý cho một trang Dashboard có chứa Chart, Stats, History Table và Sidebar. Làm sao để truyền dữ liệu hiệu quả giữa chúng mà không bị prop-drilling quá sâu?
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý tách thành thư mục `components/dashboard/` với các file `OverviewStats.tsx`, `RevenueChart.tsx`, `RecentTransactions.tsx`. Gợi ý dùng Redux Toolkit Query để các component con tự lấy data từ cache chung mà không cần truyền props từ component cha xuống.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã tách trang lớn thành các component Widget nhỏ độc lập theo đúng thư mục AI gợi ý.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tự tạo thêm một Custom Hook `useRevenueData(timeframe)` để tập trung logic tính toán tiền tệ và xử lý loading, sau đó mới cấp data cho các component con render.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế bảng hiển thị lịch sử doanh thu |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Hãy viết cho tôi một bảng (Table) hiển thị Lịch sử giao dịch khóa học (Sales History). Bảng gồm các cột: Transaction ID, Course Name, Buyer, Date, Amount, và Status (Completed/Pending). Sử dụng màu nền sọc (striped) và header cố định (sticky header) bằng Tailwind CSS.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp thẻ `table` với class `table-auto w-full`. Để làm sticky header, AI dùng class `sticky top-0 bg-white shadow-sm`. Gợi ý component `StatusBadge` để hiển thị màu sắc dựa trên trạng thái.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Cấu trúc bảng Tailwind và class Sticky Header được dùng nguyên vẹn, giải quyết vấn đề cuộn trang mà mất tiêu đề cột.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đổi màu sắc thẻ Badge trạng thái sao cho đồng bộ với Design System của project, và sửa lỗi hiển thị vỡ layout ở thiết bị di động bằng thẻ bọc `overflow-x-auto`.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xử lý phân trang cho bảng Sales History |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Bảng Lịch sử giao dịch của tôi có tới hàng ngàn record nên tôi phải dùng Server-side pagination. Tôi đã lấy được các tham số `totalPages`, `currentPage` từ API backend. Hãy viết cho tôi một component phân trang hiển thị dạng: [1] [2] ... [7] [8] [9] ... [20]. Logic tính toán hiển thị các số này bằng Javascript như thế nào cho tối ưu?
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp một hàm `generatePagination(currentPage, totalPages)` bằng JavaScript. Hàm này tính toán các khoảng cách và dùng ký tự `'...'` để thay thế cho những đoạn số quá dài, giúp giới hạn số lượng nút bấm luôn ở khoảng 5-7 nút.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi sao chép và sử dụng hàm thuật toán phân trang `generatePagination` này. Nó chạy cực kỳ chính xác.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi bọc hàm này vào `useMemo` trong React để tránh việc phải tính toán lại mảng số trang mỗi khi người dùng hover chuột làm re-render component.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế modal xem chi tiết thông tin giao dịch |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Khi click vào một dòng trong bảng Sales History, tôi muốn hiện lên một Modal/Dialog hiển thị chi tiết hóa đơn (Invoice). Hóa đơn cần có logo hệ thống, thông tin người mua, chi tiết số tiền (Gross, Tax, Net earnings). Viết layout này bằng Tailwind CSS sao cho giống một hóa đơn thực tế in ra được.
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý layout dạng thẻ giấy trắng, dùng font chữ monospace cho số tiền, và hiển thị bảng chi tiết có đường kẻ gạch ngang. AI cũng đưa code tạo Modal bọc ngoài có lớp overlay đen mờ (bg-black/50) và nút X để đóng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng giao diện hóa đơn tĩnh này làm nền tảng cho phần Receipt details của hệ thống.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi thêm tính năng 'In hóa đơn' (Print) sử dụng `window.print()` và viết thêm class CSS print-only để ẩn đi các nút bấm khi người dùng xuất file PDF hóa đơn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-dashboard): upgrade instructor dashboard layout and modals` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cải thiện tính responsive của các modal |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Cái modal hóa đơn bạn vừa thiết kế hiển thị rất đẹp trên Desktop. Tuy nhiên, khi mở trên điện thoại (màn hình hẹp), nó bị tràn sang hai bên và không cuộn được. Làm thế nào để điều chỉnh các class Tailwind CSS để modal có thể responsive, chiếm 90% chiều rộng trên mobile và hiển thị thanh cuộn bên trong thay vì cuộn cả trang?
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn thay thế `w-[600px]` bằng `w-[90%] max-w-lg`. Để modal có thanh cuộn trong, AI khuyên dùng `max-h-[80vh] overflow-y-auto` cho phần thân (body) của modal, trong khi giữ nguyên Header và Footer.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Thiết lập max-height và thanh cuộn y-axis được tôi áp dụng thành công cho tất cả các modal trong hệ thống.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi bọc thêm một thư viện `FocusTrap` để khi modal mở lên trên mobile, người dùng không thể vô tình tương tác với các phần tử nằm dưới nền.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-dashboard): upgrade instructor dashboard layout and modals` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 15

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế UI cho bảng Recent Registrations |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Bên cạnh biểu đồ, tôi cần một Widget nhỏ ở Sidebar tên là 'Học viên mới đăng ký' (Recent Registrations). Hiển thị dưới dạng danh sách (list) gồm Avatar người dùng, Tên, Tên khóa học họ vừa mua, và thông báo thời gian tương đối (vd: 2 giờ trước). Giao diện tối giản, phân cách bằng border gạch mờ.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp đoạn code dùng Flexbox (`flex items-center gap-3`) để xếp ảnh đại diện kế bên thông tin văn bản chữ nhỏ. Cung cấp một hàm `timeAgo(date)` viết bằng Javascript thuần để tính thời gian tương đối.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng hàm tính `timeAgo` và UI danh sách dọc của AI.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tích hợp avatar động bằng API của DiceBear nếu người dùng chưa có avatar thật, giúp giao diện trông sinh động và không bị lỗi hình ảnh trống.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 16

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tạo UI cho phần theo dõi Payout History |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Tôi cần thêm một giao diện lịch sử rút tiền (Payout History) cho Instructor. Hiển thị thông tin ngày rút, số tiền rút, ngân hàng thụ hưởng và trạng thái (Processing/Completed/Failed). Thiết kế dưới dạng các timeline card thẳng đứng dọc theo lề trái để dễ nhìn quá trình duyệt tiền.
```

#### 4.2. Kết quả AI gợi ý

```text
AI sinh ra mã React sử dụng Tailwind CSS tạo một đường kẻ dọc (border-l-2) và các khối tròn nhỏ (dots) để biểu diễn giao diện dạng Timeline (Dòng thời gian).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi sử dụng nguyên khối UI Timeline này vì nó trực quan hơn là bảng truyền thống cho luồng tiền.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tinh chỉnh lại logic render màu sắc dot: màu xanh cho Completed, màu cam cho Processing và đỏ cho Failed, gắn liền với icon trạng thái.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Kết nối API lấy tổng doanh thu (Gross/Net) |
| Phân việc liên quan | Frontend / API |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
API backend trả về số tiền định dạng `Decimal` (ví dụ: `150000.00`). Khi hiển thị trên UI, tôi muốn format nó thành chuỗi tiền tệ Việt Nam Đồng (VND) là `150,000 ₫`. Hàm Javascript chuẩn nhất để làm việc này mà không bị lỗi trên các trình duyệt cũ là gì?
```

#### 4.2. Kết quả AI gợi ý

```text
AI khuyên sử dụng hàm dựng sẵn `Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number)`. Đây là API chuẩn của JavaScript, rất tối ưu và hỗ trợ mọi trình duyệt.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã thay thế toàn bộ các đoạn mã regex tự viết lằng nhằng bằng `Intl.NumberFormat` do AI đề xuất.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi viết một helper function `formatCurrency(amount)` bọc hàm của AI để gọi ở mọi nơi, và xử lý thêm trường hợp giá trị `null` hoặc `undefined` thì hiển thị `0 ₫`.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-15 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xử lý component Selector chọn Timeframe (7d, 30d, 6m, 12m) |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Trong Dashboard, tôi có một component Dropdown để chọn khoảng thời gian phân tích (Timeframe) gồm: 7 Ngày qua, 30 Ngày qua, 6 Tháng qua, 1 Năm qua. Hãy viết logic xử lý state `selectedTimeframe`. Mỗi khi state này đổi, tôi cần gọi lại API. Truyền tham số gì lên backend cho hợp lý?
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý truyền lên 2 tham số là `startDate` và `endDate` (định dạng ISO 8601). AI cung cấp hàm `getDateRange(timeframe)` dùng đối tượng `Date` của JS để tự động lùi ngày tương ứng (ví dụ lùi 7 ngày) từ ngày hiện tại.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Logic lùi ngày và sinh tham số startDate/endDate của AI đã được tích hợp ngay lập tức.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi fix lỗi múi giờ bằng cách dùng thư viện `date-fns` thay cho `Date` thuần của JS để tính toán chính xác ngày đầu/cuối tháng (startOfMonth/endOfMonth) tránh bị lệch giờ UTC sang VN.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tính toán logic đệm (auto-padding) cho giảng viên mới |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Khi một giảng viên mới tạo tài khoản, họ chưa có dữ liệu giao dịch ở các tháng trước. API backend chỉ trả về mảng có 1 tháng hiện tại. Điều này làm biểu đồ tháng (6 tháng qua) của tôi bị co rúm lại còn 1 điểm. Làm sao để đệm (padding) dữ liệu các tháng rỗng bằng 0 ở Frontend trước khi vẽ biểu đồ?
```

#### 4.2. Kết quả AI gợi ý

```text
AI khuyên nên tạo một vòng lặp lùi từ tháng hiện tại về quá khứ đủ số lượng tháng theo timeframe. Tìm xem mảng API trả về có dữ liệu tháng đó không, nếu có thì điền giá trị thật, nếu không có thì gán doanh thu = 0.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Ý tưởng đệm tháng rỗng bằng vòng lặp này là cứu tinh, giúp biểu đồ luôn hiển thị đúng trục hoành (X-axis) bất chấp backend trả thiếu ngày/tháng.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi thực hiện logic tự đệm dữ liệu 0 này ở Backend (Spring Boot) thay vì Frontend để mọi client (Web, Mobile app tương lai) đều nhận được dữ liệu chuẩn bị vẽ ngay.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tính toán tạo độ điểm ảnh (mapping points) cho SVG chart |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Tôi muốn tự code một biểu đồ đường (Line Chart) đơn giản bằng thẻ `<svg>` trong React, không cài thư viện ngoài để nhẹ project. Tôi có một mảng 7 phần tử chứa doanh thu 7 ngày qua. Hãy viết thuật toán tính toán tọa độ (x, y) cho thẻ `<polyline>` trong SVG. Chiều cao SVG là 200px, rộng 500px.
```

#### 4.2. Kết quả AI gợi ý

```text
AI sinh ra mã Javascript tìm giá trị doanh thu lớn nhất (MAX). Trục Y của từng điểm = `200 - (giá trị / MAX * 200)`. Trục X được chia đều dựa trên chiều rộng 500px chia cho số điểm - 1.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Logic tính tọa độ SVG của AI rất chuẩn xác về mặt toán học. Biểu đồ đường hiện ra hoàn hảo.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi điều chỉnh padding bên trong SVG để đường kẻ không bị đụng sát trần và thêm hiệu ứng stroke-dasharray để vẽ đường cong chuyển động khi component vừa load.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Vẽ biểu đồ Monthly Chart bằng SVG không dùng thư viện ngoài |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Tiếp nối tọa độ SVG ở trên, hãy hoàn thiện component RevenueChart. Dùng thẻ `<path>` để vẽ một vùng phủ màu gradient mờ ở dưới đường thẳng (Area Chart effect). Hiển thị các điểm giao cắt là một thẻ `<circle>` nhỏ. Khi hover vào circle đó, hiển thị một Tooltip nhỏ bằng Tailwind báo giá trị.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp mã SVG cực kỳ phức tạp dùng `<linearGradient>`, thẻ `<path>` có đuôi nối xuống dưới cùng của đồ thị để đổ màu. Các điểm point dùng `<circle>` kết hợp thuộc tính `onMouseEnter/onMouseLeave` để bật tắt state tooltip.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Giao diện biểu đồ SVG tự code vô cùng nhẹ và mượt mà, áp dụng chính xác mã sinh ra từ AI.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi sửa lại vị trí absolute của Tooltip để nó không bị lệch khỏi con chuột, bằng cách lắng nghe sự kiện `onMouseMove` để gán tọa độ x/y động cho thẻ chứa tooltip.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xử lý fallback data khi không có doanh thu |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Trong biểu đồ SVG, nếu doanh thu cả 7 ngày đều bằng 0, thuật toán chia tọa độ Y của AI (chia cho MAX) sẽ bị chia cho 0 (`Infinity`), khiến biểu đồ biến mất hoàn toàn. Làm sao để xử lý lỗi Edge Case này một cách mượt mà?
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích lỗi divide-by-zero và khuyên xử lý bằng cách kiểm tra: nếu `MAX === 0`, thì gán `MAX = 1` hoặc thiết lập tọa độ Y của tất cả các điểm luôn nằm ở sát đáy biểu đồ (height = 200).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Áp dụng cách xử lý fallback `MAX = MAX === 0 ? 100 : MAX` để chia tọa độ an toàn.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi thêm vào một thông báo UI thân thiện 'Chưa có dữ liệu giao dịch trong khoảng thời gian này' nằm đè lên biểu đồ tĩnh phẳng lì để người dùng không tưởng ứng dụng bị lỗi.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-dashboard): integrate database revenue analytics and add timeframe selector` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Hiển thị Course Breakdown (tỉ lệ bán khóa học) |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Hãy viết cho tôi giao diện thẻ Thống kê tỷ trọng doanh thu (Course Breakdown). Tôi muốn hiển thị dưới dạng các thanh ngang (Horizontal Bar/Progress Bar) xếp chồng lên nhau cho từng khóa học. Khóa học có doanh thu cao nhất xếp trên cùng. Hiển thị phần trăm và số tiền ở hai đầu thanh progress.
```

#### 4.2. Kết quả AI gợi ý

```text
AI dùng thẻ `div` với cấu trúc flex-row, bên trong chứa một thanh progress có chiều dài `width` phần trăm động. Sử dụng Tailwind `bg-blue-500` và bo tròn viền.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi dùng component thanh tiến trình này để thống kê tỷ lệ mua của từng khóa học, hiển thị rõ ràng và đẹp mắt.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi viết hàm JS `Array.prototype.sort()` để sắp xếp mảng dữ liệu khóa học giảm dần theo doanh thu trước khi map ra component để đảm bảo đúng yêu cầu 'Khóa học doanh thu cao xếp trên'.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-16 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Viết hàm vẽ biểu đồ Registration Trend (Line chart) |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Viết hàm phụ trợ tính toán biểu đồ lượng đăng ký (Registration Trend). Dữ liệu API trả về là mảng các ngày và số người đăng ký khóa học: `[{date: '2026-06-01', users: 5}, {date: '2026-06-02', users: 10}]`. Hãy tính tỷ lệ tăng trưởng so với khoảng thời gian trước đó (vd: 7 ngày trước so với 7 ngày trước đó nữa) để hiện ra con số tăng trưởng X%.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết hàm xử lý mảng, bóc tách mảng thành 2 nửa (kỳ hiện tại và kỳ trước), tính tổng số users của mỗi nửa và áp dụng công thức `(current - previous) / previous * 100`. AI cũng xử lý cẩn thận lỗi chia cho 0 nếu kỳ trước bằng 0.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng thuật toán tính toán tăng trưởng (%) của AI làm nền tảng cho mọi thẻ StatCard trên Dashboard.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi gộp thuật toán này thành một Utility function trong thư mục `src/utils/math.js` để gọi ở cả biểu đồ doanh thu và biểu đồ đăng ký.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(instructor-revenue): implement comprehensive instructor revenue dashboard features` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế giao diện Admin Financial Stats |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang xây dựng Admin Dashboard tổng quản lý nền tảng. Hãy thiết kế layout bao gồm 1 Header có Breadcrumb, và phần nội dung dưới chia làm một Dashboard lưới (CSS Grid) 3 cột hiển thị các Metric: Tổng hệ thống (Tổng doanh thu toàn site, Tổng chiết khấu Admin thu được, Số lượng giao dịch). Trang trí giao diện trông trang trọng, chuẩn admin panel.
```

#### 4.2. Kết quả AI gợi ý

```text
AI sinh mã React sử dụng layout `grid-cols-1 md:grid-cols-3 gap-6`. Style các thẻ metric card dùng nền trắng, viền mảnh (border), bóng mờ nhẹ (shadow-sm) cho cảm giác chuyên nghiệp (dashboard-style).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi bê nguyên layout Grid và CSS styling này áp dụng cho phần Admin Financial Stats.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi chủ động điều chỉnh màu sắc sang tone xanh dương thẫm đặc trưng của Admin UI thay vì màu sáng như giao diện học viên.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin): integrate database statistics into admin dashboard` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Lấy số liệu tổng quan hệ thống từ DB |
| Phân việc liên quan | Backend / API |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Trong Spring Boot, làm sao để truy vấn nhanh Tổng doanh thu của toàn hệ thống? Bảng `Transactions` của tôi có chứa cột `amount` và `status`. Tôi nên viết một câu lệnh JPQL trong Repository như thế nào để database tự SUM thay vì kéo toàn bộ mảng dữ liệu về Java rồi tính bằng stream()?
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích việc fetch mảng lớn về Java sẽ bị tràn RAM và khuyên dùng SQL/JPQL Aggregate function: `@Query("SELECT SUM(t.amount) FROM Transaction t WHERE t.status = 'COMPLETED'")` trả về kiểu `BigDecimal`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Hiểu được bản chất tiết kiệm bộ nhớ, tôi lập tức áp dụng truy vấn SUM() cho mọi con số thống kê ở Backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi thêm tham số thời gian `startDate`, `endDate` vào truy vấn JPQL để hệ thống hỗ trợ việc lọc doanh thu theo quý/năm từ màn hình lọc của Admin.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin): integrate database statistics into admin dashboard` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-17 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế bảng hiển thị khóa học bán chạy (Top courses) |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Hãy thiết kế cho tôi một bảng xếp hạng (Leaderboard Table) 'Top khóa học mang lại doanh thu cao nhất' dành cho Admin. Bảng có các cột: Xếp hạng (1, 2, 3), Tên khóa, Tên Giảng viên, Số lượng bán, Doanh thu. Ba vị trí đầu tiên (Hạng 1-3) hãy đổi màu nền của hàng thành màu vàng/bạc/đồng nhạt để làm nổi bật.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết cấu trúc thẻ `table`. Trong vòng lặp `map()`, AI dùng biểu thức điều kiện kiểm tra index: `index === 0 ? 'bg-yellow-50' : index === 1 ? 'bg-gray-50' : ...` để highlight top 3.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Bảng hiển thị Top Courses hoạt động tốt với giao diện xếp hạng màu sắc bắt mắt.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tích hợp thêm icon vương miện (Lucide React) vào cột Xếp hạng đối với vị trí Top 1 thay vì chỉ dùng màu nền.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin): integrate database dynamic queries for financial stats page` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-18 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Truy vấn động (Dynamic Query) tính doanh thu Admin |
| Phân việc liên quan | Backend / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Admin của tôi yêu cầu tính năng lọc theo Ngày bắt đầu và Ngày kết thúc. Bảng `Transaction` có trường `createdAt`. Tuy nhiên, các tham số này có thể null (tức là lọc tất cả mọi thời đại). Trong Spring Data JPA, tôi phải viết câu lệnh query động (Dynamic Query) bỏ qua điều kiện ngày tháng nếu tham số bị null bằng cách nào?
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn sử dụng JPA Criteria API hoặc viết JPQL với mẹo: `WHERE (:startDate IS NULL OR t.createdAt >= :startDate) AND (:endDate IS NULL OR t.createdAt <= :endDate)`. AI khuyên dùng cách JPQL vì nó ngắn gọn và dễ hiểu hơn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Áp dụng triệt để câu lệnh JPQL có mẹo `IS NULL` của AI. Xử lý thành công bài toán query động không cần viết Criteria rườm rà.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi chuyển kiểu dữ liệu `startDate` và `endDate` từ `String` sang `LocalDateTime` (bắt đầu ngày và kết thúc ngày) ở Service layer trước khi ném vào Repository để so sánh thời gian chính xác tới từng mili-giây.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin): integrate database dynamic queries for financial stats page` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-18 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xử lý ngày tháng định dạng cho Admin Dashboard |
| Phân việc liên quan | Backend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
API Spring Boot trả thời gian `createdAt` dạng chuỗi ISO (vd: `2026-06-15T14:30:00.000Z`). Ở Frontend React, tôi muốn hiển thị ngày theo format thân thiện của Việt Nam là `14:30 - 15/06/2026`. Hãy hướng dẫn tôi cách convert bằng thư viện `date-fns`.
```

#### 4.2. Kết quả AI gợi ý

```text
AI chỉ ra cách dùng hàm `format(parseISO(dateString), 'HH:mm - dd/MM/yyyy')` từ thư viện `date-fns` cực kỳ gọn nhẹ.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Logic format ngày tháng này chuẩn xác và không bị lỗi sai múi giờ như hàm Date thuần.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tạo một Utility file `formatDate.js` để wrapper toàn bộ các kiểu hiển thị thời gian trong dự án (Full DateTime, Only Date, Time Ago) nhằm đồng bộ giao diện.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin-financial): connect financial statistics dashboard to real database data and optimize query performance` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 30

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-19 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Hiển thị biểu đồ lợi nhuận Admin |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Đối với Admin, tôi cần vẽ một biểu đồ cột (Bar Chart) dạng phân tầng (Stacked). Cột hiển thị theo tháng (T1, T2.. T12). Mỗi cột chia làm 2 phần màu chồng lên nhau: Phần xanh dương là Tiền trả giảng viên (Payouts), Phần xanh lá là Lợi nhuận giữ lại (Platform Profit). Tổng chiều cao cột là Gross Revenue. Hãy viết cấu trúc biểu đồ này bằng SVG tĩnh giúp tôi.
```

#### 4.2. Kết quả AI gợi ý

```text
AI sinh ra hệ tọa độ cho SVG. Ở phần thân của trục toạ độ, AI dùng vòng lặp để vẽ hai thẻ `<rect>` chồng lên nhau. Thẻ rect thứ nhất vẽ phần Payouts, thẻ thứ hai dịch chuyển (offset y) lên trên để vẽ tiếp phần Lợi nhuận, tạo thành Stacked Bar chart.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Biểu đồ cột xếp chồng bằng SVG sinh ra xuất sắc, logic tính toán height và Y-offset không hề sai lệch.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tối ưu thuộc tính `width` của cột để nó tự động co giãn to nhỏ (responsive) dựa theo chiều rộng màn hình thiết bị, thay vì fix cứng.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin-financial): connect financial statistics dashboard to real database data and optimize query performance` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 31

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-19 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phát hiện nguyên nhân trang Admin bị chậm |
| Phân việc liên quan | Performance |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Trang Admin Financial Stats của tôi mất tới 6 giây để load. API `/api/admin/financial-dashboard` hiện đang truy vấn tổng doanh thu, lợi nhuận, danh sách 100 khóa học top, và mảng doanh thu 12 tháng qua trong cùng một hàm. Làm sao để tối ưu hóa thời gian tải trang theo kiến trúc frontend/backend hiện đại?
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích rằng API Monolithic gộp quá nhiều logic tính toán nặng vào một endpoint làm nghẽn cổ chai (bottleneck) phía server. AI đề xuất 2 giải pháp: 1. Cache kết quả bằng Redis. 2. Tách nhỏ (Decouple) API thành các Micro-endpoints riêng rẽ (vd: `/summary`, `/top-courses`, `/monthly`) và gọi song song từ Frontend.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã nhận ra sai lầm kiến trúc API nguyên khối của mình và chọn phương án 2 (Tách API) để xử lý triệt để nguyên nhân thay vì chỉ dùng Cache.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Trước khi tách, tôi dùng công cụ đo lường Spring Actuator để log thời gian chạy của từng câu query DB, phát hiện câu query phân tích tháng (Group By Month) chậm nhất.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `perf(admin-dashboard): optimize financial stats fetching by splitting APIs and utilizing parallel requests with Promise.all` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 32

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-20 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tái cấu trúc API nguyên khối (monolithic) thành Micro-endpoints |
| Phân việc liên quan | Backend / Architecture |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Theo phương án tách API bạn gợi ý, hãy phác thảo cấu trúc RESTful API chuẩn cho tôi trên Spring Boot. Từ 1 API cũ, tôi cần tách thành 3 API. Cần đặt tên đường dẫn (URL Path) và Response DTO như thế nào cho chuẩn REST?
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý 3 endpoint: `GET /api/v1/admin/finance/summary` (trả về cục stats), `GET /api/v1/admin/finance/monthly-chart` (trả mảng data vẽ biểu đồ), `GET /api/v1/admin/finance/top-courses` (trả mảng danh sách). Cấu trúc DTO riêng biệt cho từng endpoint.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã viết lại toàn bộ cấu trúc API của Controller admin dựa theo thiết kế chuẩn REST do AI gợi ý.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi giữ lại service tính toán cốt lõi nhưng chia nhỏ các Transaction read-only riêng biệt, giúp DB giải phóng lock nhanh hơn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `refactor(admin-finance): split monolithic financial API into micro-endpoints for monthly records and top courses` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 33

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-20 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Viết Promise.all để fetch API song song |
| Phân việc liên quan | Frontend / Performance |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Bây giờ tôi đã có 3 API rời rạc. Phía Frontend React, tôi nên gọi 3 API này bằng 3 cái `useEffect` khác nhau hay gộp chung lại? Hãy viết cho tôi đoạn code dùng `Promise.all` kết hợp `async/await` để fetch 3 API này cùng một lúc, giảm thời gian load trang.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp một `useEffect` duy nhất gọi một hàm `fetchDashboardData()`. Hàm này dùng `Promise.all([fetchAPI1, fetchAPI2, fetchAPI3])`. AI giải thích rằng cách này chạy song song, thời gian load chỉ bằng API chạy chậm nhất thay vì tổng 3 API.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Đoạn mã Promise.all của AI giúp tôi giảm thời gian load Dashboard Admin từ 6 giây xuống còn khoảng 1.5 giây.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi lưu kết quả của từng API trả về vào 3 Redux State riêng biệt để component nào cần data nào thì lấy riêng rẽ thay vì gộp chung một state cục bộ.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `perf(admin-dashboard): optimize financial stats fetching by splitting APIs and utilizing parallel requests with Promise.all` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 34

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-20 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xử lý lỗi (error handling) khi 1 trong các Promise bị fail |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Nếu tôi dùng `Promise.all` và API lấy 'Tổng quan' bị lỗi (HTTP 500), nhưng API lấy 'Biểu đồ' thành công. Theo tôi biết `Promise.all` sẽ fail toàn bộ (reject). Có cách nào cấu trúc code để nếu 1 API chết, trang web vẫn render những phần data gọi thành công, chỉ báo lỗi đúng phần bị hỏng?
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất dùng `Promise.allSettled()` thay cho `Promise.all()`. Hàm này sẽ đợi tất cả các Promise chạy xong bất chấp thành công hay thất bại, sau đó duyệt qua mảng kết quả kiểm tra trạng thái (status === 'fulfilled') để lấy data, nếu 'rejected' thì gán null và báo lỗi UI một phần.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi áp dụng thành công kiến thức về `Promise.allSettled` để thiết kế cơ chế 'Phân mảnh lỗi' (Graceful Degradation) trên UI.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi cập nhật UI hiển thị một Skeleton Skeleton báo lỗi cục bộ ở riêng Widget bị crash, các Widget biểu đồ khác vẫn hiển thị bình thường phục vụ Admin.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `perf(admin-dashboard): optimize financial stats fetching by splitting APIs and utilizing parallel requests with Promise.all` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 35

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-21 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tối ưu hóa các file imports rác ở Dashboard components |
| Phân việc liên quan | Refactor |
| Mức độ sử dụng | Hỏi ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Sau khi refactor logic trang Admin, file `AdminDashboard.tsx` của tôi còn sót lại hàng loạt thư viện, components không còn dùng đến. Code IDE bôi vàng rất nhiều warning unused imports. Có cách nào/phím tắt nào trong VSCode hoặc công cụ tự động dọn dẹp các import thừa thãi trong dự án Vite React không?
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn sử dụng tính năng 'Organize Imports' (Shift+Alt+O) của VSCode hoặc cài đặt cấu hình ESLint rule `unused-imports/no-unused-imports` để ép tự động dọn dẹp mỗi khi lưu file (Save).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Thiết lập Eslint rule giúp dự án dọn dẹp được hoàn toàn các import chết, giảm dung lượng build bundle.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tích hợp pre-commit hook (Husky) để tự động chạy lệnh lint dọn rác trước khi commit code lên nhánh main.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `chore(admin-dashboard): update dashboard components` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 36

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-22 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xây dựng UI thêm Testcase (Testcase Builder) cho Admin |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Admin cần tính năng tạo Testcase cho Bài tập lập trình (Problem). Hãy viết giao diện Form có khả năng thêm động (Dynamic Form). Người dùng có thể nhấn nút 'Thêm Testcase', một khung nhập liệu gồm (Input data dạng textarea, Output data, Nút xóa testcase này, Nút checkbox 'Là testcase ẩn') sẽ xuất hiện. Dùng React Hook Form để quản lý mảng này.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp code sử dụng `useFieldArray` của React Hook Form, tạo một mảng động cho phép `append()`, `remove()` cực kỳ tiện lợi và liên kết trực tiếp vào Form payload chính.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi dùng đoạn mã React Hook Form + useFieldArray này vì nó quá hoàn hảo để xử lý form nhiều lớp mảng lồng nhau.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi viết thêm logic CSS giới hạn chiều cao textarea tự động nở ra (auto-expand) khi Admin paste một đoạn input text quá dài.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin-problems): implement database integration, testcase builder, and UI polish` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 37

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-23 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tích hợp Testcase array vào Form Submit |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Khi bấm Lưu Bài Tập, payload gửi đi là một Object chứa thông tin bài (Title, Desc) và một mảng `testcases: []`. Ở phía Spring Boot backend, tôi phải nhận payload này bằng class DTO và lưu vào Database như thế nào để đảm bảo quan hệ 1-N (One Problem to Many Testcases) lưu thành công cùng lúc trong 1 Transaction?
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý tạo `ProblemCreateDTO` chứa danh sách `TestcaseDTO`. Phía Backend Entity `Problem` sử dụng `@OneToMany(cascade = CascadeType.ALL)` và thêm helper method `addTestcase()` để đồng bộ hóa quan hệ 2 chiều trước khi gọi `repository.save()`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi cài đặt Hibernate mapping và hàm đồng bộ quan hệ theo AI. Dữ liệu Testcase được lưu thành công vào bảng Testcase đồng thời trỏ đúng Problem_ID.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi thêm annotation `@Transactional` vào hàm tạo Problem để nếu lưu Testcase rớt mạng thì việc tạo Problem cũng bị Rollback, đảm bảo tính toàn vẹn dữ liệu.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin-problems): implement database integration, testcase builder, and UI polish` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 38

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-23 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cập nhật Form Validation cho trường tiêu đề và nội dung |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Người dùng (Admin) đôi khi lưu Problem mà quên nhập Title hoặc Description. Hãy viết schema Validation sử dụng thư viện `Zod` (kết hợp với React Hook Form) yêu cầu: Title không được bỏ trống và tối đa 100 ký tự; Description phải chứa ít nhất 50 ký tự; TimeLimit phải là số nằm trong khoảng 0.1s đến 10.0s.
```

#### 4.2. Kết quả AI gợi ý

```text
AI sinh mã schema Zod rất chi tiết với đầy đủ các message lỗi tiếng Việt. Cung cấp cả hàm `z.coerce.number()` để tự động ép kiểu chuỗi input sang số cho giới hạn thời gian chạy.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Việc kiểm tra dữ liệu Validation mạnh bằng Zod ngay trên client giúp trải nghiệm mượt mà, không cần chờ lỗi bắn ra từ backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tự customize lại giao diện lỗi (Error Message text) thành màu đỏ và rung nhẹ khi admin bấm submit nhưng điền thiếu dữ liệu.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin, problem): enhance problem form validation and fix acceptance rate update` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 39

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-24 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Bắt lỗi validation (thêm dấu sao đỏ) khi thiếu Limits/Constraints |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Với các trường bắt buộc (như Title, TimeLimit), tôi muốn tự động hiển thị một dấu sao đỏ (*) kế bên Label để báo hiệu cho Admin. Viết một component `Label` bọc chung tái sử dụng được, truyền vào tham số boolean `isRequired` thì hiển thị dấu sao.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết một React functional component nhận props `text` và `isRequired`. Sử dụng Tailwind để nối thêm chuỗi `<span className="text-red-500 ml-1">*</span>` nếu isRequired true.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng component Label chung cho mọi form của Admin. Layout rất nhất quán.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi điều chỉnh thuộc tính font-weight (in đậm) cho Label để form trông đứng đắn hơn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin, problem): enhance problem form validation and fix acceptance rate update` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 40

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Fix lỗi Acceptance Rate không update sau khi nộp bài |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Khi học sinh nộp bài (Submit Code) thành công và được 100 điểm, tỷ lệ giải bài thành công (Acceptance Rate) ở trang danh sách bài tập lẽ ra phải tăng lên, nhưng nó không đổi. Nguyên nhân có phải do tôi dùng Redux Cache? Làm sao để xóa Cache cho danh sách bài tập sau khi submit bài mới?
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích rằng RTK Query đang giữ cache dữ liệu cũ. Để fix, tôi cần sử dụng tính năng `Tags` (Cung cấp tag 'Problem' cho list query và Invalidate tag 'Problem' trong mutation SubmitCode).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Bổ sung cơ chế `providesTags` và `invalidatesTags` của Redux theo hướng dẫn AI. Dữ liệu trên UI được cập nhật realtime tức thì.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi cẩn thận chỉ invalidate tag của duy nhất ID bài tập vừa submit thay vì invalidate toàn bộ bảng, để giữ nguyên trải nghiệm nhanh cho các bài tập khác không liên quan.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(admin, problem): enhance problem form validation and fix acceptance rate update` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 41

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Sửa lỗi side-effects làm đổi problem scope thành public |
| Phân việc liên quan | Frontend / Logic |
| Mức độ sử dụng | Hỏi giải thích |

#### 4.1. Prompt đã sử dụng

```text
Tôi gặp một lỗi bug rất nghiêm trọng: Khi Admin mở chức năng Cập nhật Bài tập đang bị ẩn (Scope = PRIVATE), và họ chỉ bấm 'Thêm mới một testcase', sau khi lưu, toàn bộ Bài tập đó tự động biến thành công khai (Scope = PUBLIC). Tại sao có lỗi side-effect nhảy trạng thái này trong React Hook Form?
```

#### 4.2. Kết quả AI gợi ý

```text
AI phân tích code và chỉ ra rằng biến mặc định của form defaultValues đang hardcode `scope: 'PUBLIC'`. Khi load trang edit, tôi đã không gán lại giá trị `scope` cũ lấy từ backend vào form, nên khi submit form tự động lấy giá trị mặc định ghi đè.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Cú bắt lỗi chuẩn xác của AI giải thích nguyên lý hoạt động của `reset()` trong React Hook Form. Tôi lập tức hiểu ra vấn đề.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi sửa mã bằng cách đảm bảo gọi hàm `reset(backendData)` bên trong một `useEffect` ngay sau khi tải xong thông tin bài tập hiện tại từ server.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `fix(admin-problem): stop auto-changing problem scope/visibility to public when adding testcases` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 42

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Viết chức năng Xóa (Delete) Problem an toàn |
| Phân việc liên quan | Backend / API |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Tôi muốn viết chức năng Xóa Bài tập cho Admin. Nhưng bài tập này đã có nhiều học sinh nộp code (Submissions). Nếu dùng `repository.deleteById()`, SQL sẽ bắn lỗi ràng buộc khóa ngoại (Foreign Key Constraint Violation). Làm sao xóa an toàn hoặc dùng cơ chế Soft Delete trong Spring Boot/JPA?
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý 2 cách: Cấu hình Cascade Delete để xóa sạch mọi bài nộp (không khuyến khích), hoặc thực hiện Soft Delete (Xóa mềm) bằng cách thêm cột `isDeleted`, dùng annotation `@SQLDelete` và `@Where` của Hibernate.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi chọn cách Soft Delete do AI sinh ra. Bằng cách thêm annotation `@Where(clause = "is_deleted = false")`, code toàn dự án không phải sửa gì mà bài tập bị xóa sẽ biến mất khỏi UI học sinh một cách thần kỳ.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi bổ sung thêm một Job quét rác dọn dẹp các bài tập đã Soft Delete vĩnh viễn khỏi Database sau 90 ngày (Retention Policy).
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `Fix delete problem function, resign Admin Problem UI` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 43

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tạo cấu trúc Entities cho Problem Versioning (phiên bản bài tập) |
| Phân việc liên quan | Backend / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Nếu Admin sửa nội dung hoặc testcase của bài tập trong khi học sinh đang làm dở, hệ thống có thể bị sai điểm số do lệch testcase cũ/mới. Tôi muốn thiết kế tính năng 'Problem Versioning' (Quản lý phiên bản bài tập). Mỗi lần Admin lưu cập nhật, sẽ tạo ra một version mới lưu vào bảng con (Problem_Versions). Các bảng nộp bài của user sẽ liên kết trỏ tới Version cụ thể thay vì Problem gốc. Thiết kế Entity cho việc này như thế nào?
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất tạo bảng trung tâm `Problem` (chỉ lưu metadata cố định), và bảng `ProblemVersion` (chứa content, testcases, version_number). Entity `Submission` sẽ tham chiếu bằng khóa ngoại `problem_version_id`. Tạo quan hệ OneToMany giữa Problem và ProblemVersion.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Mô hình dữ liệu Versioning của AI là giải pháp tuyệt vời nhất giải quyết triệt để sự xung đột đề bài khi đang thi đấu (Contest).
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tự tạo thêm một Trigger Database hoặc code Logic Service để mỗi khi lưu mới Problem, tự động copy thông tin tạo Version 1, và viết logic kiểm tra Version cao nhất làm version mặc định (Current Version).
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `feat(problem): implement Problem Versioning entities` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

### Lần sử dụng AI số 44

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-25 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Đồng bộ giao diện Instructor FE và Problem UI |
| Phân việc liên quan | Frontend / UI |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Trang Dashboard Instructor và trang Quản trị Bài tập (Problem UI) đang có 2 thanh Sidebar (menu bên trái) khác biệt về style (một bên xanh, một bên xám nhạt). Tôi muốn refactor lại để hai giao diện này dùng chung một layout sidebar duy nhất nhằm đồng bộ trải nghiệm. Layout dùng chung (Shared Layout) của React Router DOM (Outlet) cấu trúc như thế nào?
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn tạo một file `DashboardLayout.tsx` bọc ngoài chứa Header chung và Sidebar động. Cấu hình file `router.jsx` sử dụng `children` route để mọi trang (Instructor hay Admin Problem) đều render vào `<Outlet />` bên trong Layout chung.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi triển khai thành công Shared Layout, điều này giúp loại bỏ code lặp Sidebar ở hai trang hoàn toàn.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi thiết lập biến prop `menuItems` truyền vào Layout để có thể nạp danh sách menu (icon, text) khác nhau linh hoạt tùy vào người dùng đang ở vai trò Instructor hay Admin.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit | Commit: `Update Instructor FE` |
| File liên quan | Code Logic liên quan đến mô tả |
| Screenshot | Đã test và duyệt tính năng |
| Kết quả chạy/test | Passed |
| Link video demo | N/A |
| Ghi chú khác | N/A |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI xử lý vấn đề về logic thuật toán/UI giúp giảm đáng kể thời gian sửa bug và tăng tính ổn định của tính năng.
```

---

