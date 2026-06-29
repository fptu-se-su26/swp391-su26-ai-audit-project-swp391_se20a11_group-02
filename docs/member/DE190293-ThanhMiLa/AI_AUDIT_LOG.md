# AI Audit Log

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
| Ngày bắt đầu | 2026-05-11 |
| Ngày hoàn thành | 2026-05-18 |

---

## 2. Công cụ AI đã sử dụng

Đánh dấu các công cụ AI đã sử dụng trong quá trình thực hiện bài tập/project.

- [ ] ChatGPT
- [x] Gemini
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
Hỗ trợ nhóm trong quá trình lập tài liệu kỹ thuật dự án (SRS), tìm hiểu lý thuyết UML để vẽ sơ đồ Use Case chính xác. Nghiên cứu và lựa chọn giải pháp kiến trúc Grader Engine (Judge0 API) để đảm bảo an toàn bảo mật hệ thống. Hướng dẫn nhóm thiết lập quy trình làm việc nhóm hiệu quả qua Git và GitHub để giảm thiểu conflict và tối ưu hóa việc quản lý source code.
```

---

## 4. Nhật ký sử dụng AI chi tiết

> Mỗi lần sử dụng AI cho một phần quan trọng của bài tập/project, sinh viên cần ghi lại theo mẫu bên dưới.  
> Sinh viên/nhóm có thể nhân bản mẫu “Lần sử dụng AI” nhiều lần tùy theo số lần sử dụng AI thực tế.

---

### Lần sử dụng AI số 1

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-13 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Tìm hiểu cấu trúc và quy trình viết tài liệu đặc tả yêu cầu phần mềm (SRS) theo chuẩn IEEE 830 |
| Phân việc liên quan | Requirement |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang thực hiện dự án môn học SWP391 để xây dựng một hệ thống "Integrated Coding Education & Competitive Programming Platform" (Nền tảng học lập trình và thi đấu trực tuyến tích hợp). Hãy hướng dẫn tôi quy trình viết một tài liệu đặc tả yêu cầu phần mềm (SRS) đầy đủ và chuyên nghiệp theo chuẩn IEEE 830. Hãy liệt kê các mục lục chính cần có và các lưu ý đặc biệt cho dự án này.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Gemini đã cung cấp một cấu trúc chi tiết dựa trên chuẩn IEEE 830, bao gồm:
1. Introduction: Purpose, scope, references.
2. Overall Description: Product perspective, user classes, operating environment, constraints.
3. System Features: Quản lý người dùng, Quản lý bài tập (Problem), Hệ thống chấm bài (Grader Engine), Lớp học trực tuyến (Courses/Lessons), Thi đấu (Contest), Bảng xếp hạng (Leaderboard).
4. External Interface Requirements: User interfaces, software interfaces (Judge0 API, Database), communications interfaces.
5. Other Non-functional Requirements: Security, Performance, Reliability.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Chúng tôi đã áp dụng trực tiếp cấu trúc mục lục này để xây dựng khung tài liệu SRS cho nhóm. Phần phân tích giao diện ngoài (External Interface Requirements) đã giúp nhóm định hình việc tách biệt Frontend (React) và Backend (Spring Boot).
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Tôi đã điều chỉnh các phần mục lục để phù hợp với phạm vi thực tế của môn học SWP391. Cụ thể, lược bỏ các ràng buộc phần cứng quá phức tạp, tập trung chi tiết vào mô tả luồng hoạt động của "Grader Engine" và phân tích rõ các User Story chính của Student, Teacher và Admin.
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

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Hiểu rõ cấu trúc tài liệu phần mềm chuẩn giúp tôi và nhóm bắt đầu dự án một cách khoa học, chuyên nghiệp, tránh mơ hồ khi triển khai.
```

---

### Lần sử dụng AI số 2

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-13 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Phân biệt và áp dụng đúng các quan hệ use case (include, extend, generalization) để thiết kế sơ đồ |
| Phân việc liên quan | Design |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Hãy giải thích chi tiết sự khác nhau giữa các mối quan hệ "include", "extend" và "generalization" trong biểu đồ Use Case của UML. Đồng thời cho ví dụ cụ thể, trực quan liên quan đến các chức năng của một hệ thống Online Judge/Coding Platform (ví dụ: đăng nhập, nộp bài, xem lịch sử nộp bài, đăng ký contest).
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini đã đưa ra sự phân biệt rõ ràng kèm ví dụ trực quan trong hệ thống Online Judge:
- Include (Bao gồm - bắt buộc): Use Case A muốn chạy thì bắt buộc phải chạy Use Case B (ví dụ: Submit Code cần Include Login).
- Extend (Mở rộng - tùy chọn): Use Case B mở rộng cho Use Case A dưới điều kiện nhất định (ví dụ: View Problem Detail có thể Extend View Code Hint).
- Generalization (Kế thừa): Mối quan hệ cha-con (ví dụ: Login via Google kế thừa từ Login).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã áp dụng các nguyên tắc này để vẽ sơ đồ Use Case tổng quát cho hệ thống Coding Platform của nhóm, giúp sơ đồ trở nên mạch lạc và đúng chuẩn UML.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Dựa trên lý thuyết đã hiểu rõ từ AI, tôi tự tay thiết kế và vẽ sơ đồ Use Case bằng công cụ Draw.io, đồng thời cấu trúc lại các Use Case theo nghiệp vụ thực tế của nhóm (tích hợp thêm bài học nhỏ - Lessons thay vì chỉ có thi đấu lập trình).
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
Sự phân biệt rõ ràng từ AI giúp nhóm tránh được lỗi logic khi thiết kế UML, đảm bảo tài liệu SRS đạt yêu cầu thẩm định.
```

---

### Lần sử dụng AI số 3

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-14 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Nghiên cứu giải pháp tự động chấm code (Online Judge Engine) an toàn và tối ưu cho dự án |
| Phân việc liên quan | Design / Backend |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang xây dựng một dự án thi lập trình trực tuyến (Online Judge) bằng Spring Boot và React. Hãy gợi ý cho tôi các giải pháp xây dựng tính năng tự động biên dịch và chấm bài (grader engine) bảo mật và tối ưu nhất cho đồ án sinh viên. Đánh giá ưu nhược điểm của việc tự dựng sandbox (bằng Docker/Jail) so với việc tích hợp các API có sẵn của bên thứ ba (như Judge0 API).
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini đã cung cấp một bản so sánh chi tiết:
1. Tự xây dựng Grader Engine với Docker: Ưu điểm là tự chủ hoàn toàn, không giới hạn lượt chấm; nhược điểm là cực kỳ phức tạp và nguy cơ bảo mật cao.
2. Tích hợp Judge0 API: Ưu điểm là an toàn vì code chạy trên sandbox cô lập của Judge0, hỗ trợ nhiều ngôn ngữ; nhược điểm là phụ thuộc bên thứ ba.
Khuyên nên bắt đầu bằng cách tích hợp Judge0 API để đảm bảo an toàn tuyệt đối và tiết kiệm thời gian.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Nhóm đã thống nhất lựa chọn giải pháp Tích hợp Judge0 API cho hệ thống để giải quyết triệt để bài toán bảo mật và đi đúng hướng kiến trúc.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Nhóm đã tự phát triển thêm một Module trung gian ở Backend (Spring Boot) làm Queue Manager để quản lý các lượt submit, tránh quá tải request và thực hiện cơ chế pooling/webhook để cập nhật kết quả thời gian thực qua WebSocket.
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
Việc chọn đúng giải pháp kiến trúc an toàn ngay từ đầu giúp dự án tránh được rủi ro bảo mật nghiêm trọng và tiết kiệm tối đa thời gian code.
```

---

### Lần sử dụng AI số 4

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-15 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Thiết lập quy trình làm việc nhóm hiệu quả với Git và giải quyết xung đột code |
| Phân việc liên quan | Other |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Chúng tôi là một nhóm gồm 5 sinh viên đang thực hiện dự án SWP391. Hãy hướng dẫn chúng tôi cách sử dụng GitHub để làm việc nhóm hiệu quả, các tính năng cơ bản cần dùng (commit, push, pull, branch, merge, pull request) và đề xuất một luồng làm việc với nhánh (Git Workflow/Git Flow) phù hợp nhất để tránh xung đột code (conflict).
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini đã đề xuất mô hình Git Flow rút gọn tối ưu cho đồ án sinh viên:
1. Nhánh main: Chỉ chứa mã nguồn ổn định, đã kiểm thử kỹ càng. Không code trực tiếp trên đây.
2. Nhánh dev: Nhánh tích hợp chính của nhóm.
3. Nhánh tính năng cá nhân (feature/task-name): Mỗi thành viên tự phát triển trên nhánh riêng từ dev.
4. Quy trình Merge: Tạo Pull Request (PR) từ nhánh cá nhân vào dev, mời thành viên khác review trước khi merge.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Nhóm đã triển khai mô hình Git Flow này cho repository chung. Mọi thành viên đều phát triển trên nhánh riêng và tạo Pull Request trước khi tích hợp vào nhánh dev.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã chủ động thiết lập thêm bộ quy tắc đặt tên commit (Commit Message Convention) theo chuẩn Conventional Commits và cấu hình file .gitignore chuẩn cho Spring Boot và React để giữ repository sạch sẽ.
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
Quy trình làm việc nhóm rõ ràng giúp các thành viên cộng tác mượt mà, giảm thiểu tối đa conflict và dễ dàng theo dõi lịch sử code.
```

---

### Lần sử dụng AI số 5

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-16 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Tạo giao diện trang danh sách khóa học (Course List) và chi tiết khóa học (Course Detail) với React và Tailwind CSS |
| Phân việc liên quan | Frontend / UI Design |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang xây dựng Frontend cho nền tảng học lập trình trực tuyến bằng React và Tailwind CSS. Hãy viết code cho một trang danh sách khóa học (Course List) có chứa các card hiển thị thông tin khóa học (tên, hình ảnh, mô tả ngắn, số lượng học viên). Sau đó, viết code cho một trang chi tiết khóa học (Course Detail) hiển thị lộ trình học tập, danh sách các bài học (lessons) và có nút "Bắt đầu học" nổi bật. Hãy thiết kế giao diện theo phong cách hiện đại, sử dụng shadow và border-radius phù hợp.
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini cung cấp 2 component React hoàn chỉnh:
- CourseList: Sử dụng CSS Grid tạo layout dạng thẻ (cards) responsive. Card có hiệu ứng hover mượt mà.
- CourseDetail: Có Hero section tổng quan, danh sách bài học dạng Accordion, Sidebar chứa thông tin giảng viên và nút đăng ký.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã sử dụng các cấu trúc HTML/Tailwind CSS này để làm bộ khung giao diện cho trang Course. Layout hiển thị rất tốt trên cả màn hình desktop và mobile.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã kết nối component với Redux Store và API Backend để lấy danh sách khóa học thật từ DB, thay vì dùng dữ liệu tĩnh, đồng thời tinh chỉnh màu sắc theo nhận diện thương hiệu nhóm.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | `CourseList.jsx`, `CourseDetail.jsx` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Việc dùng AI sinh sẵn layout Tailwind giúp tiết kiệm đáng kể thời gian viết CSS, đặc biệt là responsive trên các thiết bị.
```

---

### Lần sử dụng AI số 6

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-16 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Xây dựng giao diện Coding Workspace giống LeetCode |
| Phân việc liên quan | Frontend / UI Design |
| Mức độ sử dụng | Hỗ trợ ý tưởng / Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Hãy thiết kế giúp tôi giao diện một không gian làm việc (Coding Workspace) cho trang nộp bài tập lập trình bằng React và Tailwind CSS. Giao diện này cần giống với LeetCode: màn hình chia làm 2 phần chính (trái và phải). Bên trái hiển thị Đề bài, ví dụ (input/output) và các gợi ý. Bên phải chia làm 2 phần trên dưới: phần trên là Code Editor (chọn ngôn ngữ, vùng soạn thảo), phần dưới là Terminal/Console để hiển thị kết quả chạy testcase. Hãy hướng dẫn cách dùng thư viện "react-split" hoặc tương tự để người dùng có thể kéo thả thay đổi kích thước các vùng.
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini hướng dẫn dùng thư viện `allotment` để chia và kéo thả cửa sổ. Đề xuất dùng `@monaco-editor/react` cho trình code editor để có highlight syntax xịn như VSCode, đồng thời gợi ý cấu trúc layout 3 phần rõ ràng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã cài đặt thư viện `allotment` và `@monaco-editor/react` để dựng layout, tính năng kéo thả thanh phân chia màn hình hoạt động trơn tru đúng theo gợi ý.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cấu hình lại Monaco Editor để tự động theo theme hệ thống (Light/Dark mode) và gắn state code editor vào logic nộp bài Judge0 API ở backend.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | `CodingWorkspace.jsx` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Tích hợp Monaco Editor nâng cao trải nghiệm nộp bài lên mức chuyên nghiệp, ngang ngửa các nền tảng e-learning lớn.
```

---

### Lần sử dụng AI số 7

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-17 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Thiết kế giao diện danh sách thi đấu (Contest) và Leaderboard |
| Phân việc liên quan | Frontend / UI Design |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Viết code cho giao diện trang Danh sách cuộc thi (Contests) và Bảng xếp hạng (Leaderboard) bằng React và Tailwind CSS. Trang Contests cần có các tab: "Sắp diễn ra", "Đang diễn ra", và "Đã kết thúc", mỗi cuộc thi hiển thị dưới dạng card có đếm ngược thời gian (countdown timer). Bảng xếp hạng Leaderboard cần hiển thị dạng bảng (table) gồm Hạng, Tên User, Điểm số, Thời gian giải, hiển thị top 3 có icon huy chương (Vàng, Bạc, Đồng).
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp giao diện tab cho Contest và layout table đẹp mắt cho Leaderboard, làm nổi bật top 3 người đứng đầu với màu sắc riêng và icon huy chương. Gợi ý sử dụng `setInterval` để đếm ngược.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng gần như toàn bộ thiết kế giao diện UI cho cả Contest và Leaderboard vì nó trực quan và phân tách thông tin rất tốt.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Logic đếm ngược do AI viết bị lỗi gây giật lag do re-render. Tôi đã tự viết lại custom hook `useCountdown` và tách component đếm ngược để tối ưu hiệu năng React.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | `ContestList.jsx`, `Leaderboard.jsx` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Khi sử dụng code mẫu từ AI liên quan đến hook hay effect trong React, cần đặc biệt lưu ý kiểm tra các vấn đề về performance và re-render.
```

---

### Lần sử dụng AI số 8

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-17 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Xây dựng UI trang Profile với biểu đồ thống kê tiến độ học tập |
| Phân việc liên quan | Frontend / UI Design |
| Mức độ sử dụng | Hỗ trợ ý tưởng / Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Tôi muốn thiết kế một trang Profile cá nhân cho người dùng trên hệ thống thi lập trình. Hãy gợi ý cách bố trí giao diện và viết code React + Tailwind. Phần bên trái hiển thị avatar, thông tin cá nhân và huy hiệu đạt được. Phần bên phải hiển thị thống kê học tập, bao gồm số lượng bài tập đã giải (Easy, Medium, Hard) hiển thị dưới dạng biểu đồ tròn (Pie Chart) hoặc thanh tiến độ (Progress bar). Hãy gợi ý thư viện vẽ biểu đồ phù hợp và dễ dùng với React.
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini gợi ý dùng thư viện `Recharts` hoặc `Chart.js`, đồng thời đưa ra layout chia 2 cột: Cột trái hiện profile card (avatar, info, badge), cột phải hiện thống kê giải bài tập với các thanh progress đa màu sắc và biểu đồ tròn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Cấu trúc grid chia cột và bố cục chung của trang Profile được sử dụng để hiển thị hồ sơ cá nhân.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thay vì dùng biểu đồ tròn bằng Recharts theo mẫu AI, tôi tự xây dựng Circular Progress Bar bằng SVG và CSS để có giao diện giống LeetCode hơn mà không cần cài thêm thư viện.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | `UserProfile.jsx` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
AI cung cấp ý tưởng rất phong phú, nhưng việc chọn lọc và điều chỉnh (VD: bỏ bớt thư viện bên ngoài) để phù hợp nhất với dự án là trách nhiệm của sinh viên.
```

---

### Lần sử dụng AI số 9

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-18 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Tạo hiệu ứng Loading Skeleton và hiển thị testcase màu sắc khi chấm bài |
| Phân việc liên quan | Frontend / UI/UX |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Khi người dùng bấm "Submit Code" sẽ mất khoảng 2-3 giây để server chấm bài. Trong lúc chờ, tôi muốn hiển thị hiệu ứng Loading Skeleton bằng Tailwind CSS thay cho icon loading xoay xoay truyền thống. Sau khi có kết quả trả về, hãy viết code render danh sách các testcase thành một list. Nếu testcase Pass thì chữ màu xanh lá và icon check, nếu Wrong Answer thì màu đỏ và icon X, nếu Time Limit Exceeded thì màu vàng. Dữ liệu mảng testcase có dạng: [{ id: 1, status: "AC" }, { id: 2, status: "WA" }, { id: 3, status: "TLE" }].
```

#### 4.2. Kết quả AI gợi ý

```text
AI sử dụng class animate-pulse tạo loading skeleton mượt mà. Đưa ra hàm render testcase list dùng Tailwind text color dựa trên status code (AC, WA, TLE).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Bộ màu sắc chuẩn cho testcase (xanh cho Pass, đỏ cho Fail, vàng cho Time Limit) và cấu trúc HTML Loading Skeleton được tích hợp nguyên bản vào phần Console.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tự thêm animation slide-in để từng testcase xuất hiện theo trình tự, tạo hiệu ứng thị giác như hệ thống đang chấm từng testcase một, làm tăng sự hồi hộp.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | `SubmissionResult.jsx` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Đầu tư vào Micro-interactions (như skeleton loading, màu sắc feedback) từ AI giúp nền tảng thân thiện và mang lại trải nghiệm chuyên nghiệp.
```

---

### Lần sử dụng AI số 10

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-19 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Tìm hiểu cách tích hợp thanh toán bằng VietQR với payOS |
| Phân việc liên quan | Backend / Payment |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Tôi đang xây dựng một dự án hệ thống giáo dục có tính năng thanh toán khóa học. Tôi muốn tích hợp cổng thanh toán VietQR qua payOS. Hãy giải thích cho tôi luồng hoạt động (workflow) cơ bản của việc tích hợp này, từ lúc user bấm mua hàng trên Frontend (React) đến lúc Backend (Spring Boot) xử lý và nhận được thông báo thanh toán thành công (webhook).
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini giải thích luồng tích hợp rất rõ ràng gồm 4 bước chính: Client gọi API tạo đơn hàng -> Server gọi payOS tạo link thanh toán -> Client chuyển hướng sang payOS checkout -> payOS gọi webhook về Server cập nhật trạng thái khi thanh toán thành công.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã hiểu cách thiết kế API, viết logic tạo đơn hàng ở Backend và xử lý điều hướng trang ở Frontend theo đúng luồng hoạt động AI cung cấp.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã vẽ lại luồng này thành một Sơ đồ tuần tự (Sequence Diagram) để bổ sung vào tài liệu phân tích thiết kế hệ thống, giúp các thành viên nhóm dễ nắm bắt quy trình.
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
Hiểu rõ workflow trước khi code giúp quá trình xây dựng tính năng thanh toán ít xảy ra lỗi logic và triển khai nhanh hơn.
```

---

### Lần sử dụng AI số 11

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-20 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Hướng dẫn code setup tích hợp payOS bằng Spring Boot và React |
| Phân việc liên quan | Backend / Frontend / Payment |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Dựa vào luồng tích hợp payOS ở trên, hãy hướng dẫn tôi cách code setup chi tiết. Ở Backend dùng Java Spring Boot, hãy chỉ tôi cách dùng thư viện payos-java để tạo ra một Payment Link. Ở Frontend dùng React, hãy viết đoạn code gọi API tạo đơn hàng và chuyển hướng người dùng sang trang thanh toán của payOS. Hãy đưa ra ví dụ cụ thể nhé.
```

#### 4.2. Kết quả AI gợi ý

```text
Gemini hướng dẫn thêm thư viện payos-java, tạo PayOSConfig, và viết PaymentController ở Backend để gọi hàm createPaymentLink(). Ở Frontend, AI viết hàm handleCheckout dùng fetch gọi API và redirect bằng window.location.href.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã copy cấu trúc khởi tạo config và endpoint tạo payment link vào project. Gắn sự kiện vào nút "Thanh toán" ở Frontend để gọi API thành công.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Thay vì để lộ API key trong code như ví dụ, tôi đã đưa cấu hình apiKey, clientId vào application.properties để bảo mật, đồng thời code thêm logic lưu đơn hàng trạng thái PENDING trước khi gọi payOS.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | `PaymentController.java` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Có code mẫu từ AI giúp việc cài đặt thư viện bên thứ ba trở nên đơn giản và nhanh gọn hơn rất nhiều so với tự mò tài liệu.
```

---

### Lần sử dụng AI số 12

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-05-21 |
| Công cụ AI | Gemini |
| Mục đích sử dụng | Dùng ngrok để test webhook của payOS ở local lúc đang xây dựng |
| Phân việc liên quan | Backend / Testing |
| Mức độ sử dụng | Hướng dẫn công cụ |

#### 4.1. Prompt đã sử dụng

```text
Tôi đã code xong API nhận Webhook từ payOS trên Spring Boot ở localhost:8080. Nhưng server của payOS không thể gửi webhook đến địa chỉ localhost của tôi được. Nghe nói có thể dùng ngrok để giải quyết vấn đề này trong lúc đang dev. Hãy hướng dẫn tôi cách cài đặt ngrok, expose port 8080 và cách cấu hình url đó lên trang quản trị của payOS để test thử giao dịch thành công.
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn chi tiết cách tải ngrok, xác thực token, chạy lệnh ngrok http 8080 để lấy public URL, và cách thiết lập URL này trong trang quản trị payOS để nhận webhook.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi làm theo các bước, tạo URL public với ngrok và cấu hình lên payOS, test thành công việc nhận webhook khi thanh toán.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tìm hiểu và tự code thêm phần verify webhook signature (xác thực chữ ký HMAC) từ phía payOS để đảm bảo an toàn cho endpoint nhận webhook của hệ thống.
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
ngrok là công cụ tuyệt vời và AI đã giúp tôi tiếp cận nó rất nhanh chóng mà không cần tốn nhiều công sức tra cứu.
```

---

### Lần sử dụng AI số 13

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tối ưu hóa danh sách Use Case và phân chia lại các Use Case bị trùng lặp của hệ thống |
| Phân việc liên quan | Requirement |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Bạn là một chuyên gia phân tích nghiệp vụ phần mềm (Business Analyst). Tôi đang xây dựng đặc tả yêu cầu (SRS) cho hệ thống "Integrated Coding Education & Competitive Programming Platform". Hãy rà soát danh sách các chức năng hiện tại và đề xuất gộp các Use Case trùng lặp hoặc có quan hệ chặt chẽ với nhau (ví dụ: gộp Đăng nhập thường và Google OAuth; gộp Khóa và Mở khóa tài khoản; gộp các chức năng CRUD bài học). Hãy chia chúng thành 4 phân hệ chính (Authentication & Common, E-Learning, E-Commerce, Online Judge) sao cho số lượng Use Case tinh gọn, hợp lý nhưng vẫn giữ được độ phủ nghiệp vụ đầy đủ.
```

#### 4.2. Kết quả AI gợi ý

```text
Antigravity đã đề xuất một danh sách tinh gọn gồm 61 Use Case (gốc là hơn 80 chức năng), phân chia rõ ràng thành 4 phân hệ lớn: 
- Phân hệ 1 (Xác thực & Dùng chung): 9 Use Case (Gộp Login/Google Login, Lock/Unlock Users).
- Phân hệ 2 (E-Learning & Quản lý khóa học): 15 Use Case (Gộp Tạo/Sửa/Xóa khóa học, Soạn bài giảng/Tải tài liệu/Tải video).
- Phân hệ 3 (Thương mại điện tử & Tài chính): 15 Use Case (Gộp yêu cầu tạo link, thanh toán và hủy nạp tiền payOS).
- Phân hệ 4 (Trình chấm code & Thi đấu): 22 Use Case (Gộp xem chi tiết đề bài, xem kết quả testcase, gộp luồng biên dịch/chạy/sandbox của Judge0).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã áp dụng toàn bộ cấu trúc gộp Use Case này để xây dựng danh sách Use Case Specification chính thức cho tài liệu SRS của nhóm.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã rà soát lại và điều chỉnh tên tiếng Anh của các Use Case cho chuẩn hóa (ví dụ đổi "Do Quiz" thành "Practice Quiz", "Deposit Credits" thành "Deposit Credits via payOS"), đồng thời phân bổ lại một số Use Case giữa phân hệ E-Commerce và E-Learning để phản ánh đúng luồng dữ liệu của dự án.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | Mục lục Use Case trong SRS |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Việc gộp các Use Case trùng lặp giúp tài liệu SRS trở nên tinh gọn, tránh bị loãng và giúp đội ngũ phát triển dễ hình dung luồng xử lý tổng thể của từng chức năng.
```

---

### Lần sử dụng AI số 14

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Viết script Python phân tích và thống kê số lượng màn hình duy nhất từ danh sách đầu vào thô |
| Phân việc liên quan | Requirement / Testing |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Hãy viết một script bằng Python để đọc danh sách 94 màn hình của một ứng dụng web (chứa cả các đường dẫn trùng lặp, các màn hình con, và các trạng thái chuyển trang). Script cần thực hiện chuẩn hóa tên màn hình, loại bỏ các mục trùng lặp và thống kê chính xác số lượng màn hình duy nhất (unique screens). Đầu ra yêu cầu hiển thị số lượng và danh sách màn hình đã làm sạch.
```

#### 4.2. Kết quả AI gợi ý

```text
Antigravity đã tạo ra một script Python sử dụng cấu trúc Set và các hàm xử lý chuỗi (regex, strip) để chuẩn hóa tên màn hình và tự động loại bỏ các phần tử trùng lặp, đếm chính xác còn 79 màn hình duy nhất.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã lưu và chạy script Python này tại scratch/count_screens.py để có số liệu chính xác báo cáo cho nhóm và giáo viên.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tinh chỉnh thêm logic trong file script để phân loại các màn hình theo từng Subsystem (Xác thực, Học tập, Tài chính, Trình chấm) giúp báo cáo trực quan hơn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | scratch/count_screens.py |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Sử dụng script tự động hóa giúp đếm và lọc trùng nhanh chóng, tránh sai sót thủ công khi danh sách lên tới hàng trăm phần tử.
```

---

### Lần sử dụng AI số 15

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phân tích mã nguồn Spring Boot của dự án để trích xuất danh sách các Business Rules (Quy tắc nghiệp vụ) |
| Phân việc liên quan | Design / Backend |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Bạn là một Kiến trúc sư Phần mềm (Software Architect). Tôi muốn bạn phân tích toàn bộ mã nguồn Backend Spring Boot của dự án, đặc biệt là các phần xử lý thanh toán ví điện tử (WalletService.java), công thức tính điểm phạt thi đấu ICPC (ContestRankingService.java), cơ chế AI kiểm duyệt video và CV (Gemini Embedding). Hãy trích xuất và lập bảng danh sách các Business Rules (Quy tắc nghiệp vụ) thực tế đi kèm mã ID chuẩn xác (BR-COM, BR-EDU, BR-ECO, BR-OJ).
```

#### 4.2. Kết quả AI gợi ý

```text
AI đã gợi ý danh sách ban đầu gồm 24 quy tắc nghiệp vụ bao gồm: mã hóa BCrypt mật khẩu, logic đếm ngược contest, công thức tính điểm phạt ICPC (+20 phút cho mỗi lượt nộp sai trước AC, bỏ qua compilation error), AI quét đạo văn qua Gemini Embedding với độ tương đồng > 90%, và cơ chế khóa bi quan ví điện tử (pessimistic lock) chống race condition.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã áp dụng các quy tắc này làm nền tảng nghiệp vụ cốt lõi để đưa vào tài liệu đặc tả hệ thống.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã yêu cầu AI phân tích sâu thêm và mở rộng bảng quy tắc nghiệp vụ lên 55 quy tắc chi tiết (granular), bổ sung các nghiệp vụ như: quy tắc tính streak điểm danh hàng ngày, luật chia doanh thu 70/30, phí cổng thanh toán 2%, và quy tắc giới hạn hiển thị testcase lỗi để bảo mật đề bài.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | business_rules.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Hiểu rõ quy tắc nghiệp vụ giúp việc viết các Use Case sau này trở nên vô cùng chính xác, không bị mâu thuẫn logic với code.
```

---

### Lần sử dụng AI số 16

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Gộp bảng Business Rules và chuyển ngữ toàn bộ sang tiếng Anh chuyên ngành |
| Phân việc liên quan | Requirement |
| Mức độ sử dụng | Sinh văn bản mẫu |

#### 4.1. Prompt đã sử dụng

```text
Hãy tối ưu hóa tài liệu Business Rules của tôi bằng cách gộp tất cả các bảng phân hệ thành một bảng tổng hợp duy nhất. Đồng thời, hãy dịch toàn bộ nội dung sang tiếng Anh chuyên ngành phần mềm (formal technical English), sử dụng các thuật ngữ kỹ thuật chính xác như "Pessimistic Locking", "BCrypt Hashing", "Cosine Similarity", "ICPC Penalty Formula".
```

#### 4.2. Kết quả AI gợi ý

```text
Antigravity đã cung cấp một bảng tổng hợp Business Rules hoàn chỉnh bằng tiếng Anh chuyên nghiệp, sử dụng các cấu trúc câu chuẩn và các ký hiệu toán học LaTeX rõ ràng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã sử dụng trực tiếp bảng dịch tiếng Anh này để làm phụ lục Business Rules cho tài liệu SRS tiếng Anh của dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Các công thức toán học dạng khối LaTeX ($$) hiển thị rất xấu trên bảng Markdown. Tôi đã tự tinh chỉnh các công thức toán học về dạng văn bản inline đơn giản và trực quan hơn (ví dụ: Penalty = (Elapsed time to AC) + (Incorrect attempts * 20)).
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | business_rules.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Chuyển đổi ngôn ngữ tài liệu sang tiếng Anh giúp tăng tính chuyên nghiệp của sản phẩm phần mềm theo đúng định hướng đồ án.
```

---

### Lần sử dụng AI số 17

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế danh mục 100 thông điệp ứng dụng (Application Messages Catalog) bằng tiếng Anh |
| Phân việc liên quan | Requirement / UI Design |
| Mức độ sử dụng | Sinh văn bản mẫu |

#### 4.1. Prompt đã sử dụng

```text
Dựa trên bản mẫu danh mục thông điệp (Message Code, Message Type, Context Content, Display Message) mà tôi cung cấp từ một dự án khác, hãy phân tích hệ thống Coding & E-Learning của tôi và xây dựng một danh sách đầy đủ gồm 100 thông điệp thông báo, cảnh báo lỗi và toast alerts bằng tiếng Anh. Đảm bảo phản ánh đúng các lỗi nghiệp vụ của Judge0 (verdicts AC, WA, TLE, MLE, CE) và lỗi thanh toán payOS.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đã sinh ra một danh sách đầy đủ gồm 100 thông điệp ứng dụng từ MSG01 tới MSG100, phân loại rõ các loại thông báo (In red under text, In line, Toast message) tương ứng với từng tình huống cụ thể trong game/học tập/thi đấu.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tải tệp tin và đưa bảng danh sách thông điệp này vào mục Application Messages List trong phụ lục tài liệu SRS của nhóm.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã điều chỉnh một số Display Message để câu từ tự nhiên và ngắn gọn hơn, đồng thời đảm bảo các mã lỗi khớp chính xác với mã ErrorCode được định nghĩa trong mã nguồn Java Spring Boot của dự án.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | application_messages.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Sở hữu một catalog thông điệp tập trung giúp việc chuẩn hóa giao diện (UI) và thiết kế hệ thống đa ngôn ngữ trở nên dễ dàng.
```

---

### Lần sử dụng AI số 18

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Soạn thảo tài liệu Yêu cầu dùng chung (Common Requirements) quy định về phân trang, định dạng ngày giờ và phản hồi API |
| Phân việc liên quan | Requirement |
| Mức độ sử dụng | Sinh văn bản mẫu |

#### 4.1. Prompt đã sử dụng

```text
Hãy soạn thảo tài liệu Common Requirements đặc tả các quy chuẩn kỹ thuật dùng chung cho toàn bộ dự án. Tài liệu cần làm rõ: (1) Chuẩn phân trang API GET (mapping Spring Boot Pageable), (2) Định dạng hiển thị và lưu trữ ngày giờ ISO 8601 UTC, (3) Cấu trúc gói tin phản hồi thành công và lỗi (Global Success/Error Envelope), (4) Quy tắc sắp xếp và tìm kiếm dữ liệu.
```

#### 4.2. Kết quả AI gợi ý

```text
Antigravity đã cung cấp một tài liệu Common Requirements đầy đủ bằng tiếng Anh, đặc tả chi tiết cấu trúc JSON của API phân trang (content, page, size, totalElements, totalPages), định dạng ngày giờ ISO 8601 UTC (YYYY-MM-DDThh:mm:ss.sssZ), và cấu trúc phong bì phản hồi chuẩn (Success/Error JSON envelopes).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tài liệu này được lưu trực tiếp vào common_requirements.md để làm tài liệu thiết kế hệ thống và bàn giao cho các lập trình viên Frontend phát triển tích hợp.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tinh chỉnh lại trường `page` trong phản hồi API phân trang từ 0-indexed thành 1-indexed ở tầng hiển thị của Frontend để người dùng cuối không bị bối rối khi xem trang số 1.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | common_requirements.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Các tài liệu quy chuẩn kỹ thuật dùng chung giúp giảm thiểu tối đa thời gian thảo luận thiết kế giữa các bộ phận Frontend và Backend.
```

---

### Lần sử dụng AI số 19

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Rà soát và thống kê chi tiết Use Case của Admin không sử dụng từ khóa "Manage" |
| Phân việc liên quan | Requirement / Design |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Bạn là một Chuyên viên Phân tích Nghiệp vụ Phần mềm (Business Analyst). Hãy phân tích toàn bộ mã nguồn Backend Spring Boot thuộc các lớp Admin Controller (AdminUserController, AdminInstructorController, AdminCourseController, AdminContestController, AdminProblemController, AdminFinancialController, AdminDashboardController) của dự án. Hãy đề xuất danh sách các Use Case chi tiết tương ứng với các Controller này. Ràng buộc: Tuyệt đối không sử dụng từ khóa "Manage" (Quản lý) trong tên Use Case do quy định khắt khe của hội đồng chấm thi đồ án; thay vào đó, hãy dùng các động từ hành động cụ thể (như Browse, Lock/Unlock, Approve/Reject, Create, Update, Delete, Audit). Định dạng đầu ra: Danh sách phân loại theo nhóm nghiệp vụ kèm mô tả chi tiết tiếng Việt và tiếng Anh.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
AI gợi ý danh sách gồm 21 Use Case chi tiết không dùng từ "Manage", chia thành các nhóm:
1. User Administration: Browse Platform Users, Lock/Unlock User Account.
2. Instructor Administration: Browse Instructor Applications, Approve/Reject Instructor Application, Suspend Instructor Account.
3. Course Approval: Browse Submitted Courses, Approve/Reject Course Publication.
4. Contest Administration: Browse Contests, Create/Edit/Delete/Publish Contest, Add/Remove Problem to/from Contest.
5. Problem & Testcase Administration: Browse Practice Problems, Create/Edit/Delete Practice Problem, Set Up Problem Testcases, Publish Practice Problem.
6. Financial Reports: View Platform Overview Dashboard, View Monthly Financial Records, Audit Deposit Transactions, View Financial Audit Details.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Nhóm đã sử dụng bộ tên Use Case và mô tả này để đưa vào danh sách đặc tả chức năng hệ thống trong tài liệu SRS, thay thế hoàn toàn các Use Case chung chung dạng "Manage" trước đây.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Tôi đã chủ động gộp một số Use Case có tính chất đảo ngược trên giao diện (như Lock và Unlock User, Approve và Reject Application) thành các Use Case gộp như "Lock/Unlock User Account" và "Approve/Reject Instructor Application" để sơ đồ Use Case không bị quá nhiều vòng tròn gây rối mắt, đồng thời bổ sung các ghi chú kỹ thuật tương ứng với controller.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | Mục lục Use Case trong SRS |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Việc tránh sử dụng từ "Manage" giúp mô tả hệ thống rõ ràng hơn rất nhiều, làm nổi bật được các chức năng CRUD và nghiệp vụ thực tế mà hệ thống hỗ trợ.
```

---

### Lần sử dụng AI số 20

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phân rã và thiết lập mối quan hệ UML cho phân hệ chấm bài (Judge0) và thanh toán (PayOS) |
| Phân việc liên quan | Design / Architecture |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Bạn là một Kiến trúc sư Hệ thống (System Architect). Tôi đang vẽ sơ đồ Use Case phân rã cho hai phân hệ tích hợp bên thứ ba: (1) Chấm bài qua Judge0 API và (2) Nạp tiền qua PayOS Gateway. Hãy đề xuất danh sách Use Case chi tiết cho từng phân hệ, xác định rõ vai trò tương tác của các tác nhân (Customer là tác nhân chính, Judge0/PayOS là tác nhân phụ). Hãy chỉ ra các mối quan hệ "include" và "extend" cụ thể giữa các Use Case này (ví dụ: mối quan hệ giữa tạo link nạp tiền, hủy nạp tiền, xử lý callback, xác thực chữ ký bảo mật, cộng số dư ví).
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
AI đề xuất các Use Case và quan hệ cho hai phân hệ:
1. Phân hệ Judge0: Customer gọi Submit Code to Online Judge (tương tác với Judge0), hệ thống nhận kết quả qua Receive Webhook Verdicts (Judge0 gọi về). Customer có thể Monitor Grading Progress qua WebSocket.
2. Phân hệ PayOS: Customer gọi Request Deposit Link (tương tác với PayOS). Cancel Pending Deposit Request sẽ <<extend>> Request Deposit Link. Khi giao dịch thành công, PayOS gọi Receive Webhook Confirmation, hành động này bắt buộc phải <<include>> Credit Wallet Balance, Verify Payment Signature, Log Transaction và Send Payment Notification.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Nhóm đã áp dụng toàn bộ cấu trúc mối quan hệ này để vẽ sơ đồ Use Case con (sub-diagram) cho phân hệ thanh toán và chấm bài. Việc sử dụng quan hệ <<extend>> cho nút Hủy và <<include>> cho các bước bảo mật/cộng tiền webhook rất hợp lý.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Tôi đã tự thiết kế sơ đồ UML chi tiết bằng Draw.io dựa trên các quan hệ này. Đồng thời bổ sung điều kiện ràng buộc trong SRS: Chỉ thực hiện cộng tiền (Credit Wallet Balance) sau khi Verify Payment Signature thành công để tránh lỗi bảo mật.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | Sơ đồ phân hệ PayOS / Judge0 trong SRS |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Phân tích kỹ lưỡng luồng chạy của webhook và API giúp thiết kế các mối quan hệ UML chính xác, phản ánh đúng kiến trúc hướng sự kiện (event-driven) của code.
```

---

### Lần sử dụng AI số 21

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết lập bảng đặc tả Actor, Use Case chi tiết và 26 thực thể cơ sở dữ liệu cho tài liệu SRS |
| Phân việc liên quan | Requirement / Design |
| Mức độ sử dụng | Sinh văn bản mẫu |

#### 4.1. Prompt đã sử dụng

```text
Bạn là một Technical Writer chuyên nghiệp. Tôi đang viết chương 2 (Actor và Use Case) và chương 3 (Cơ sở dữ liệu) của tài liệu đặc tả yêu cầu phần mềm (SRS). Hãy giúp tôi viết hai bảng biểu chi tiết sau: (1) Bảng đặc tả 6 Actor (Guest, Customer, Instructor, Admin, Judge0, payOS) gồm ID, Actor, Phân loại, Đặc điểm & Quyền hạn; (2) Bảng đặc tả 26 thực thể dữ liệu (bao gồm 22 thực thể cơ bản về học tập/thanh toán cùng 4 thực thể mới: user_daily_activities, contest_rankings, problem_submissions, problem_submission_details) gồm ID, Entity, Description; (3) Bảng đặc tả hơn 80 Use Case của toàn bộ hệ thống gồm ID, Use Case, Actors, Description. Ràng buộc: Nội dung phải ngắn gọn, súc tích, viết bằng tiếng Anh chuyên ngành chuẩn xác.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
AI đã sinh ra 3 bảng dữ liệu lớn bằng Markdown rất chỉn chu:
1. Bảng Actor Descriptions: Đặc tả rõ ràng phân loại (Unauthenticated, Primary, Secondary) và vai trò của từng actor.
2. Bảng Entity Descriptions (V2): Sắp xếp liên tục từ 1 tới 26, đặc tả chi tiết ý nghĩa lưu trữ của từng bảng trong Database.
3. Bảng Use Case Descriptions: Cung cấp đầy đủ thông số cho 80+ use cases của hệ thống phân chia từ UC-AUTH, UC-GST, UC-CUST, UC-INST, UC-ADM, UC-JDG, đến UC-PAY.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Tôi đã lưu các bảng này thành các tệp tin markdown (actor_descriptions.md, use_case_descriptions.md, entity_descriptions_v2.md) và sao chép trực tiếp vào tài liệu SRS của nhóm để hoàn thiện các chương mục phân tích thiết kế.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Tôi đã tinh chỉnh lại thứ tự sắp xếp của bảng thực thể (Entity) để nó đi liền mạch từ phần tài khoản sang phần khóa học, rồi đến phần bài tập và chấm bài, giúp người đọc dễ theo dõi luồng dữ liệu hơn so với bảng thô ban đầu, đồng thời sửa lại một số thuật ngữ tiếng Anh mô tả Use Case cho tự nhiên hơn.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | actor_descriptions.md, use_case_descriptions.md, entity_descriptions_v2.md |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Sở hữu các bảng đặc tả chuẩn chỉnh và được viết bằng tiếng Anh kỹ thuật giúp nâng cao giá trị tài liệu báo cáo của dự án lên rất nhiều.
```

---

### Lần sử dụng AI số 22

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tư vấn thiết kế ERD và chuẩn hóa mối quan hệ giữa các thực thể hệ thống |
| Phân việc liên quan | Design / Database |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Bạn là một Chuyên gia Thiết kế Cơ sở dữ liệu (Database Designer). Tôi đang hoàn thiện sơ đồ ERD cho hệ thống Online Judge. Hãy tư vấn giúp tôi: (1) Nếu tôi đã thêm thực thể problem_submissions và problem_submission_details để lưu lịch sử nộp bài, tôi có nên giữ mối quan hệ Nhiều-Nhiều (N-N) trực tiếp giữa Users và Problems nữa không? (2) Mối quan hệ giữa bộ đề testcase (problem_testcases) và kết quả chạy chi tiết (problem_submission_details) là 1-1 hay 1-N? Tại sao? (3) Mối quan hệ giữa lessons và problems là gì và xử lý thế nào? (4) Có nên thêm bảng user_daily_activities để tính streak không?
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
AI đã giải thích chi tiết các nguyên tắc chuẩn hóa dữ liệu:
1. Phải BỎ quan hệ N-N trực tiếp giữa Users và Problems vì nó đã được thay thế (resolve) thông qua thực thể kết hợp problem_submissions. Giữ cả hai sẽ bị lỗi dư thừa mối quan hệ.
2. Quan hệ giữa problem_testcases và details là 1-N (Một testcase chạy trong nhiều lượt nộp bài của nhiều người dùng khác nhau). Nếu để 1-1 sẽ bị lỗi chỉ cho phép chạy testcase đó một lần duy nhất.
3. Quan hệ giữa lessons và problems là N-N (Một bài học có nhiều bài tập, một bài tập trong ngân hàng đề có thể dùng cho nhiều bài học). Cần giải quyết bằng bảng trung gian lesson_problems chứa trường order_index.
4. Rất nên thêm user_daily_activities để vẽ biểu đồ nhiệt (heatmap) và lưu streak học tập, tạo quan hệ 1-N từ users sang.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Tôi đã áp dụng các chỉ dẫn chuẩn hóa này để sửa đổi sơ đồ ERD của nhóm trong công cụ Draw.io, loại bỏ các đường nối dư thừa và cập nhật chính xác các đầu quan hệ 1-N và N-N.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Tôi tự tay cấu hình lại khóa ngoại (Foreign Keys) và các thuộc tính đi kèm trong SQL Script sinh database, đảm bảo khớp 100% với logic ERD đã được chuẩn hóa theo tư vấn của AI, đồng thời thêm ràng buộc unique (user_id, activity_date) cho bảng hoạt động hàng ngày.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | SQL Schema và sơ đồ ERD của dự án |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Hiểu rõ sự khác biệt giữa sơ đồ thực thể khái niệm (Conceptual ERD) và sơ đồ vật lý (Physical Schema) giúp tôi thiết kế database sạch, tránh được lỗi dư thừa dữ liệu và lỗi bất nhất khi chạy truy vấn.
```

### Lần sử dụng AI số 23

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-27 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Sửa lỗi không khởi chạy được Backend Spring Boot do thiếu cấu hình Database (DataSource) và hướng dẫn kích hoạt Profile phát triển |
| Phân việc liên quan | Backend / Configuration |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Bạn là một chuyên gia Spring Boot. Ứng dụng Backend Java Spring Boot của tôi bị crash khi khởi động với lỗi "Failed to configure a DataSource: 'url' attribute is not specified and no embedded datasource could be configured. Reason: Failed to determine a suitable driver class". Hãy phân tích nguyên nhân cốt lõi gây ra lỗi này và hướng dẫn tôi các phương án khắc phục chi tiết (bao gồm cấu hình database, cách kích hoạt profile phát triển để nạp file cấu hình tương ứng). Hãy trình bày rõ ràng kèm ví dụ minh họa.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Antigravity đã giải thích nguyên nhân là do Spring Boot tự động cấu hình kết nối DB (DataSource Auto-configuration) khi phát hiện dependency trong classpath nhưng không tìm thấy URL, username, password kết nối trong file cấu hình mặc định. AI đề xuất 3 giải pháp: (1) Điền đầy đủ thông tin kết nối DB trong application.properties; (2) Chạy ứng dụng kèm tham số kích hoạt profile chứa cấu hình tương ứng (ví dụ: -Dspring-boot.run.profiles=dev); (3) Loại bỏ DataSourceAutoConfiguration khỏi class chạy chính bằng annotation `@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Hiểu rõ nguyên nhân lỗi do thiếu cấu hình database và biết cách kích hoạt profile phát triển dev để chạy dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Tôi đã lựa chọn cách kích hoạt profile dev của dự án khi khởi chạy bằng cách thêm tham số cấu hình khi chạy lệnh Maven trên terminal.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | application-dev.yaml |
| Screenshot |  |
| Kết quả chạy/test | Backend khởi chạy thành công sau khi load đúng cấu hình dev |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Hiểu rõ cơ chế tự động cấu hình của Spring Boot giúp tôi tự tin xử lý các lỗi tương tự liên quan đến cấu hình tài nguyên hệ thống.
```

---

### Lần sử dụng AI số 24

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-27 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cấu hình phím tắt (alias) Zsh trên macOS và tìm hiểu các loại Shell phổ biến trên Windows/Linux để tối ưu hóa lệnh khởi chạy nhanh Spring Boot |
| Phân việc liên quan | Other |
| Mức độ sử dụng | Hỗ trợ ý tưởng |

#### 4.1. Prompt đã sử dụng

```text
Bạn là một chuyên gia về hệ thống và terminal trên macOS. Tôi có câu lệnh Maven khởi chạy Spring Boot dài: "mvn spring-boot:run -Dspring-boot.run.profiles=dev". Hãy hướng dẫn tôi cách tạo phím tắt (alias) hoặc script chạy nhanh trên Zsh shell để mỗi lần chạy không cần gõ lại. Hướng dẫn chi tiết cách cấu hình vào file ~/.zshrc, cách nạp lại cấu hình bằng source, giải thích cơ chế hoạt động của alias zsh trên môi trường nhiều project khác nhau, và so sánh Zsh shell với các shell mặc định trên Linux và Windows.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Antigravity hướng dẫn cách cấu hình alias trong file ~/.zshrc bằng lệnh `alias rundev="..."`, cách nạp lại bằng `source ~/.zshrc` hoặc `exec zsh`. Giải thích rằng alias là cấu hình toàn cục (global) trên terminal, dùng được ở mọi thư mục nhưng lệnh con chỉ thực thi được nếu thư mục hiện hành chứa đúng file cấu hình (pom.xml). AI cũng so sánh các shell: Linux dùng Bash làm mặc định (có thể chuyển sang Zsh), Windows dùng Command Prompt (CMD) cổ điển hoặc PowerShell hiện đại, kèm theo các công cụ như Git Bash hoặc WSL để giả lập/chạy nhân Linux.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Định nghĩa alias `rundev` trong file cấu hình terminal của cá nhân để chạy nhanh ứng dụng.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Tự mở file ~/.zshrc bằng công cụ nano, thêm alias, lưu file đúng cách (Ctrl+O, Ctrl+X) và chạy lệnh `source ~/.zshrc` trực tiếp tại thư mục dự án backend để nạp cấu hình mới mà không cần khởi động lại Terminal.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | ~/.zshrc |
| Screenshot |  |
| Kết quả chạy/test | Alias `rundev` hoạt động chính xác trong terminal |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Biết cách tối ưu hóa môi trường làm việc cá nhân thông qua cấu hình shell giúp tăng đáng kể năng suất lập trình hàng ngày.
```

---

### Lần sử dụng AI số 25

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-27 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Loại bỏ log rác (quét danh sách bảng, in mật khẩu DB) khi khởi chạy ứng dụng Java Spring Boot và phân tích log SQL của Hibernate |
| Phân việc liên quan | Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Bạn là một lập trình viên Java Spring Boot chuyên nghiệp. Ứng dụng backend của tôi khi khởi động in ra rất nhiều log kiểm tra danh sách bảng cơ sở dữ liệu ("====== TABLES IN DB ======") và log chứa các biến môi trường nhạy cảm như "DB_PASSWORD". Hãy rà soát mã nguồn của class chạy chính CodingPlatformApplication.java, tìm và loại bỏ phần logic `@PostConstruct` in danh sách bảng, cũng như các câu lệnh `System.out.println` in thông tin kết nối DB. Sau đó làm sạch các import không còn sử dụng để đảm bảo mã nguồn gọn gàng, an toàn bảo mật và biên dịch thành công. Đồng thời, hãy giải thích các dòng log tự động tạo bảng/ép kiểu của Hibernate (ví dụ: "Hibernate: create type OrderStatus as enum...") có phải là log dư thừa không và cách tắt chúng nếu cần.
```

#### 4.2. Kết quả AI gợi ý

Tóm tắt nội dung AI đã trả lời hoặc gợi ý.

```text
Antigravity đã chỉ ra đoạn code in log nằm trong class CodingPlatformApplication.java (hàm checkTables và các hàm debug System.out.println trong main). AI đã sinh ra phiên bản code mới đã được dọn sạch các đoạn log này và loại bỏ các import thừa (JdbcTemplate, Autowired, PostConstruct). Đồng thời giải thích rằng các log của Hibernate không phải log rác mà là câu lệnh SQL DDL thực tế được Hibernate thực thi dựa trên cấu hình `spring.jpa.show-sql=true` và `ddl-auto=update` trong application-dev.yaml.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

Mô tả rõ phần nào được sử dụng lại từ gợi ý của AI.

```text
Áp dụng mã nguồn đã loại bỏ các phương thức in log và import thừa vào class chính của dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

Mô tả sinh viên/nhóm đã thay đổi, kiểm tra, sửa lỗi hoặc cải tiến gì so với gợi ý ban đầu của AI.

```text
Tôi đã tự chạy kiểm tra biên dịch dự án bằng lệnh `mvn clean compile` để đảm bảo hệ thống không bị lỗi sau khi xóa code, đồng thời quyết định giữ cấu hình `show-sql: true` trong môi trường phát triển để phục vụ việc debug truy vấn sau này.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | CodingPlatformApplication.java |
| Screenshot |  |
| Kết quả chạy/test | Log khởi động của dự án sạch sẽ, không còn hiển thị thông tin nhạy cảm và danh sách bảng |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

Sinh viên/nhóm học được gì sau lần sử dụng AI này?

```text
Dọn dẹp log khởi động giúp bảng điều khiển console gọn gàng hơn, đồng thời bảo vệ các thông tin bảo mật quan trọng của hệ thống khỏi bị lộ trong môi trường log công cộng.
```

---

---

### Lần sử dụng AI số 26

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Quét mã nguồn Backend và trích xuất tài liệu đặc tả API (API Specification) cho toàn bộ 13 module hệ thống |
| Phân việc liên quan | Backend / Documentation |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
Bạn là một AI Agent siêu cấp, chuyên gia Phân tích Mã nguồn (Code Analyzer) và Kỹ sư Tài liệu Kỹ thuật (API Technical Writer). Nhiệm vụ của bạn là quét toàn bộ thư mục mã nguồn Backend hiện tại của dự án (kiểm tra các tệp định tuyến Route, Controller, Middleware, DTO, Request/Response Model, Service) nhằm trích xuất và tạo lập một tài liệu đặc tả API chuẩn hóa, chi tiết nhất dưới định dạng Markdown (.md) cho 13 modules. Hãy gom nhóm các API theo từng Module/Luồng nghiệp vụ lớn và áp dụng cấu trúc chuẩn cho TỪNG API.
```

#### 4.2. Kết quả AI gợi ý

```text
Antigravity đã quét toàn bộ Controller của 13 phân hệ (Auth, Users, Categories, Courses, Instructors, Cart, Payment, Problems, Contests, Ranking, Moderation, Admin) và tự động tạo ra 12 file Markdown tương ứng, đặc tả chi tiết method, endpoint, parameters, request body và kịch bản response.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Sử dụng toàn bộ 12 file Markdown này làm tài liệu kỹ thuật chuẩn xác về API để chuẩn bị cho việc thiết kế Postman Collection và test case tự động.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã rà soát lại các endpoints và các status code trả về để đảm bảo tài liệu khớp 100% với luồng nghiệp vụ thực tế đã được code ở Backend.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | Các file api_*.md trong artifacts |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Sử dụng AI Agent để quét mã nguồn và sinh tài liệu API giúp tiết kiệm hàng chục giờ đồng hồ viết tài liệu thủ công và đảm bảo độ chính xác tuyệt đối.
```

---

### Lần sử dụng AI số 27

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Viết script Python tổng hợp 12 file tài liệu API thành một file duy nhất |
| Phân việc liên quan | Documentation |
| Mức độ sử dụng | Hỗ trợ tự động hóa |

#### 4.1. Prompt đã sử dụng

```text
Bạn hãy tổng hợp 13 file .md chứa đặc tả API này vào chung 1 file duy nhất cho tôi. Sau đó, hãy đưa file .md tổng hợp này vào thư mục docs ở trong folder backend.
```

#### 4.2. Kết quả AI gợi ý

```text
Antigravity đã tự viết một đoạn mã Python ngắn chạy trên local để gộp 12 file Markdown lại với nhau một cách an toàn thay vì dùng các lệnh bash dễ sinh lỗi định dạng, sau đó tạo thư mục docs trong backend và copy file `api_full_specification.md` vào đó.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi sử dụng file `api_full_specification.md` đã được gộp lại này như một bộ tài liệu Master API cho toàn bộ Backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Không cần chỉnh sửa gì thêm vì file đã được nối hoàn chỉnh với các dấu phân cách rõ ràng giữa các module.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | `backend/docs/api_full_specification.md` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Cách AI linh hoạt sử dụng Python script để xử lý file thay vì lệnh shell cơ bản cho thấy khả năng tự giải quyết vấn đề (problem-solving) cực kỳ thông minh.
```

---

### Lần sử dụng AI số 28

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-28 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Viết một "Meta-prompt" (Prompt sinh ra prompt) để hướng dẫn AI khác dịch và format tài liệu API ra file Word (.docx) chuyên nghiệp |
| Phân việc liên quan | Documentation |
| Mức độ sử dụng | Hỗ trợ viết Prompt |

#### 4.1. Prompt đã sử dụng

```text
Với file .md mô tả đầy đủ các API đó, hãy viết cho tôi 1 prompt hoàn chỉnh cho AI gen ra file .docxx hoàn chỉnh cho tôi đi, canh lề chuẩn chỉnh, có mục lục, chia ra rõ ràng, và hoàn toàn bằng tiếng anh.
```

#### 4.2. Kết quả AI gợi ý

```text
Antigravity đã soạn ra một Prompt nâng cao, phân chia thành 6 yêu cầu rõ ràng (Context, Document Structure, TOC, Heading Styles, Data Presentation, Execution). Prompt này được thiết kế để copy trực tiếp vào ChatGPT/Claude để tự động tạo file Word `.docx` tiếng Anh.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã copy đoạn Prompt này để sử dụng trên một AI khác có khả năng sinh file Word, giúp tiết kiệm thời gian dịch thuật và căn chỉnh lề (formatting).
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Chỉ cần thay đổi đường dẫn tham chiếu đến file đính kèm trước khi đưa cho công cụ AI khác thực thi.
```

#### 4.5. Minh chứng

| Loại minh chứng | Nội dung |
|---|---|
| Link commit |  |
| File liên quan | `api_full_specification.md` |
| Screenshot |  |
| Kết quả chạy/test |  |
| Link video demo |  |
| Ghi chú khác |  |

#### 4.6. Nhận xét cá nhân/nhóm

```text
Học được kỹ thuật sử dụng "Meta-prompt" - dùng một AI để ra lệnh cho một AI khác thực thi các tác vụ đặc thù (sinh file Word) với độ chi tiết và ràng buộc cao.
```


### Lần sử dụng AI số 29

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế Cấu trúc Database cho Hệ thống Ví điện tử (Wallet) chống lỗi Double-spending |
| Phân việc liên quan | Design / Database |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý thiết kế bảng `wallets` với khóa ngoại trỏ tới `users` kèm ràng buộc CHECK balance >= 0, và bảng `wallet_transactions` lưu mã tham chiếu duy nhất (transaction_ref) để thực hiện đối soát.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã sử dụng cấu trúc bảng này vào file SQL schema chính thức của dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã bổ sung thêm trường `checksum` (mã hóa SHA256 dòng dữ liệu) để phát hiện và ngăn ngừa việc can thiệp sửa đổi số dư ví trực tiếp từ cơ sở dữ liệu.
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
Ràng buộc kiểm tra số dư ví ở tầng database là lá chắn bảo mật cuối cùng cực kỳ quan trọng.
```

---

### Lần sử dụng AI số 30

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tích hợp thanh toán PayOS và thiết kế cơ chế xử lý Webhook bất đồng bộ có tính bất biến |
| Phân việc liên quan | Backend / Integration |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn tạo endpoint nhận POST webhook, kiểm tra chữ ký PayOS bằng secret key, sau đó sử dụng bảng `processed_webhooks` lưu mã đơn hàng để chặn xử lý trùng lặp.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã tích hợp mã kiểm tra chữ ký và cơ chế check trùng đơn hàng vào class PaymentService.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi chuyển logic xử lý cộng tiền ví sang chạy bất đồng bộ bằng cách bắn sự kiện (`ApplicationEventPublisher`) để endpoint phản hồi PayOS lập tức trong dưới 500ms.
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
Xử lý webhook không đồng bộ và kiểm tra chữ ký là quy chuẩn bắt buộc của các cổng thanh toán.
```

---

### Lần sử dụng AI số 31

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế Database Ledger (Sổ cái tài chính) ghi nhận giao dịch nạp/rút/mua khóa học |
| Phân việc liên quan | Design / Database |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất schema bảng `financial_ledger` lưu chuyển dịch tiền tệ dạng Debit/Credit, liên kết chặt chẽ với đơn hàng và tài khoản người dùng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi áp dụng bảng ledger này để thay thế cho cách cộng trừ số dư trực tiếp không có đối soát trước đây.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cấu hình quyền trong DB (GRANT SELECT, INSERT ON financial_ledger) để chặn mọi thao tác UPDATE/DELETE từ tài khoản ứng dụng thông thường.
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
Nguyên tắc bất biến (Immutability) của sổ cái tài chính giúp việc đối soát sau này cực kỳ dễ dàng.
```

---

### Lần sử dụng AI số 32

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai cơ chế khóa bi quan (Pessimistic Locking) trong Spring Boot khi cộng/trừ số dư ví |
| Phân việc liên quan | Backend / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Spring Data JPA Expert.
[CONTEXT] When webhooks write balance updates, multiple requests can arrive simultaneously, causing concurrency issues.
[TASK] Write a JPA repository method using a pessimistic write lock to fetch the user's wallet.
[CONSTRAINTS]
1. Use `@Lock(LockModeType.PESSIMISTIC_WRITE)` annotation.
2. Include a timeout configuration to prevent indefinite database blocking.
[FORMAT OUTPUT] Provide Java Repository interface snippet and service usage.
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý sử dụng hàm `findById` đi kèm `@Lock(LockModeType.PESSIMISTIC_WRITE)` để khóa dòng dữ liệu trong DB khi đang cập nhật ví.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi sử dụng hàm `findWithLockByUserId` trong repository cho luồng mua khóa học.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã bắt thêm ngoại lệ `PessimisticLockingFailureException` để trả về lời nhắn lỗi thân thiện hơn thay vì crash API.
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
Khóa bi quan thích hợp cho các giao dịch liên quan đến tiền tệ nơi tính chính xác cao hơn thông lượng.
```

---

### Lần sử dụng AI số 33

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Giải quyết tranh chấp tài nguyên (Race Condition) khi nhiều học viên đăng ký cùng một khóa học giới hạn slot |
| Phân việc liên quan | Backend |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Concurrency Specialist in Java.
[CONTEXT] Some interactive live workshops have a strict limit of 30 slots. If 100 students click join at the same millisecond, the system must not allow overselling.
[TASK] Propose and implement a concurrency resolution strategy in Spring Boot.
[CONSTRAINTS]
1. Compare Pessimistic vs Optimistic Locking for this use case.
2. Write the entity modification code with versioning if Optimistic locking is preferred.
[FORMAT OUTPUT] Provide detailed code sample and logic explanation.
```

#### 4.2. Kết quả AI gợi ý

```text
AI so sánh và khuyên dùng khóa lạc quan bằng `@Version` trong Hibernate vì tỷ lệ tranh chấp thấp hơn giao dịch tài chính, giúp hệ thống không bị nghẽn khóa DB.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã thêm cột `@Version private Long version` vào class `CourseSlot`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi bổ sung thêm một cơ chế retry tự động tối đa 3 lần ở service nếu xảy ra lỗi `ObjectOptimisticLockingFailureException`.
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
Khóa lạc quan (Optimistic Locking) giúp tăng hiệu năng xử lý song song lên rất nhiều so với khóa bi quan.
```

---

### Lần sử dụng AI số 34

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xây dựng hàng đợi nộp bài (Submission Queue) bằng RabbitMQ/Kafka để giảm tải cho hệ thống Online Judge |
| Phân việc liên quan | Architecture / Backend |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a System Architect.
[CONTEXT] In our coding contest subsystem, hundreds of students submit code at the exact same second. Directly calling Judge0 API synchronously crashes our backend under load.
[TASK] Design an asynchronous code submission queue architecture using RabbitMQ.
[CONSTRAINTS]
1. Explain the workflow from Client submit -> API Gateway -> Queue -> Grader Consumer -> Judge0 -> WebSocket notify.
2. Outline the configuration for queues, exchanges, and routing keys.
[FORMAT OUTPUT] Provide a Markdown architecture workflow and code config class for RabbitMQ.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất mô hình Producer-Consumer sử dụng RabbitMQ: Nhận bài nộp -> Đẩy vào queue -> Trả về ID lập tức. Service worker lấy bài ra gửi Judge0 chấm bất đồng bộ.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã thiết lập RabbitMQ configuration và viết consumer xử lý hàng đợi chấm bài.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi cấu hình thêm Dead Letter Queue (DLQ) để hứng các bài nộp lỗi định dạng hoặc lỗi kết nối mạng giúp hệ thống tự phục hồi.
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
Mô hình hàng đợi (Queue-based) là kiến trúc tối thượng để mở rộng quy mô hệ thống Online Judge.
```

---

### Lần sử dụng AI số 35

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tích hợp Judge0 API để biên dịch và chạy thử code đa ngôn ngữ |
| Phân việc liên quan | Backend / Integration |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI viết Service sử dụng `WebClient` để call API của Judge0, thực hiện mã hóa base64 source code và testcases trước khi truyền tải.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã áp dụng WebClient này để thực hiện việc gửi code chấm thử.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi cấu hình thêm cơ chế Circuit Breaker bằng Resilience4j để tự động ngắt kết nối và báo lỗi hệ thống bận nếu máy chủ Judge0 bị sập.
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
Mã hóa Base64 giúp đảm bảo các ký tự đặc biệt trong code của học viên không làm vỡ định dạng HTTP payload.
```

---

### Lần sử dụng AI số 36

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Ngăn chặn Fork Bomb và các cuộc tấn công tài nguyên hệ thống trong Docker Sandbox của Judge0 |
| Phân việc liên quan | DevOps / Security |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn cách cấu hình `pids-limit: 100` để chặn fork bomb, cấu hình `network_mode: none` để chặn code gọi API ngoài, và thiết lập CPU/Memory limits.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã chỉnh sửa file docker-compose.yml của dịch vụ Judge0 đang chạy trên máy chủ.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tự viết thêm script giám sát tài nguyên (CPU/RAM) của Docker, tự động cảnh báo qua Slack nếu container chấm bài vượt quá ngưỡng an toàn.
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
Sandbox cô lập hoàn toàn tài nguyên là yêu cầu sống còn của các hệ thống lập trình thi đấu.
```

---

### Lần sử dụng AI số 37

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế cơ chế giới hạn thời gian (Time Limit Exceeded) và bộ nhớ (Memory Limit Exceeded) cho code học viên |
| Phân việc liên quan | Backend / Configuration |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI viết logic lấy thuộc tính `timeLimit` và `memoryLimit` từ đối tượng Problem và gán vào các thuộc tính của Judge0 Request Body.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã thêm các tham số này vào phương thức tạo JSON request trong lớp `Judge0Service`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm một hệ số nhân thời gian chạy (ví dụ x2 thời gian chạy) riêng cho ngôn ngữ Java vì JVM khởi động chậm hơn C++.
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
JVM khởi động tốn thời gian hơn C++, cần thiết lập hệ số bù trừ thời gian chạy hợp lý để tránh lỗi oan cho học viên dùng Java.
```

---

### Lần sử dụng AI số 38

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai WebSocket để đẩy kết quả chấm bài theo thời gian thực (Real-time Verdicts) về React Client |
| Phân việc liên quan | Backend / Frontend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Full-Stack WebSocket Expert.
[CONTEXT] When a user submits code, they shouldn't manually refresh the page. We want to show a spinner and update testcase markers in real-time as Judge0 processes them.
[TASK] Write the backend Spring Boot STOMP WebSocket configuration and the frontend React hook connection script.
[CONSTRAINTS]
1. Secure the WebSocket connection with JWT tokens.
2. Publish message to user-specific channel `/user/queue/verdicts`.
[FORMAT OUTPUT] Backend Java config/controller and Frontend JS component snippet.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp code cấu hình `@EnableWebSocketMessageBroker` phía Spring Boot và thư viện `@stomp/stompjs` phía React để thiết lập luồng truyền tin.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã tích hợp WebSocket Broker vào backend và viết hook React kết nối ở frontend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tự sửa lỗi rò rỉ bộ nhớ (memory leaks) bằng cách hủy kết nối (`disconnect()`) WebSocket trong hook React `useEffect` clean-up.
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
Đảm bảo đóng kết nối WebSocket khi component bị hủy để tránh rò rỉ tài nguyên ở cả client và server.
```

---

### Lần sử dụng AI số 39

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xây dựng thuật toán tính điểm phạt ICPC (Penalty) cho bảng xếp hạng Contest |
| Phân việc liên quan | Backend / Algorithms |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI sinh ra thuật toán lọc lịch sử nộp bài của từng user, tìm lượt Accepted đầu tiên cho mỗi problem và cộng dồn điểm phạt theo công thức.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi áp dụng thuật toán này vào class `ContestRankingService`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tối ưu truy vấn cơ sở dữ liệu để kéo toàn bộ submissions của contest về bộ nhớ một lần duy nhất thay vì chạy query trong vòng lặp của từng user.
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
Mọi lượt nộp sai sau khi đã đạt trạng thái ACCEPTED đều không được tính vào điểm phạt.
```

---

### Lần sử dụng AI số 40

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tối ưu hóa truy vấn SQL để tải Leaderboard thời gian thực với hàng chục ngàn người dùng |
| Phân việc liên quan | Database / Optimization |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp truy vấn sử dụng hàm `DENSE_RANK() OVER (ORDER BY score DESC, daily_streak DESC)` giúp phân hạng cực nhanh ở tầng cơ sở dữ liệu.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa truy vấn này vào Repository bằng `@Query(nativeQuery = true)`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tạo thêm chỉ mục phức hợp (composite index) trên `users(score, daily_streak)` để tối ưu hóa triệt để tốc độ quét bảng xếp hạng.
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
Window Functions xử lý phân hạng nhanh gấp hàng chục lần so với việc kéo dữ liệu lên Java rồi phân hạng thủ công.
```

---

### Lần sử dụng AI số 41

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai Cache Redis cho thông tin khóa học và danh sách bài tập truy cập nhiều |
| Phân việc liên quan | Backend / Optimization |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Redis Performance Expert.
[CONTEXT] Course details page is visited frequently but modified rarely. Querying PostgreSQL on every view hurts performance.
[TASK] Configure Spring Cache with Redis to cache course detail responses.
[CONSTRAINTS]
1. Set Cache TTL (Time-to-Live) to 2 hours.
2. Evict/invalidate cache automatically whenever an instructor updates the course.
[FORMAT OUTPUT] Configuration class and service annotations `@Cacheable` and `@CacheEvict` example.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết lớp cấu hình `RedisCacheManager` với các cấu hình TTL và hướng dẫn dùng các annotation `@Cacheable(value = "courses")` và `@CacheEvict`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã tích hợp Redis Cache vào các API liên quan đến tìm kiếm và xem chi tiết khóa học.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã xử lý thêm cơ chế chống nghẽn Cache (Cache Stampede) bằng cách khóa đồng bộ luồng nạp dữ liệu từ database khi cache hết hạn.
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
Bắt buộc phải dùng `@CacheEvict` khi cập nhật khóa học để đảm bảo học viên không nhìn thấy thông tin cũ.
```

---

### Lần sử dụng AI số 42

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế cơ chế tính chuỗi ngày học liên tục (Daily Streak) hiệu quả |
| Phân việc liên quan | Backend / Algorithms |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp hàm xử lý so sánh `activity_date` của bản ghi hoạt động gần nhất với ngày hiện tại (CURRENT_DATE) và ngày hôm trước.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa logic này vào `DailyActivityServiceImpl` để chạy mỗi khi học viên nộp bài ACCEPTED.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi cấu hình thêm múi giờ địa phương (Local Timezone) của người dùng thay vì dùng cứng giờ UTC để tránh lệch ngày do chênh lệch múi giờ.
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
Luôn dùng múi giờ của client để tính streak chính xác, nếu không người dùng nộp bài lúc đêm sẽ bị reset streak oan.
```

---

### Lần sử dụng AI số 43

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Quét đạo văn bài nộp code sử dụng Gemini Embedding API và Cosine Similarity |
| Phân việc liên quan | AI / Backend |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất quy trình: Tiền xử lý code (xóa khoảng trắng/comment) -> Gửi đến Gemini Embedding -> So sánh khoảng cách Cosine Similarity, nếu độ tương đồng > 0.90 sẽ đánh dấu đạo văn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi viết module PlagiarismChecker gọi API Gemini để tính toán độ tương đồng mã nguồn.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tối ưu chỉ quét so khớp với các bài nộp cùng một bài tập (problem_id) thay vì so sánh chéo toàn bộ cơ sở dữ liệu để tránh quá tải API.
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
Xóa comments và các token rác trước khi đưa vào mô hình AI sẽ giúp tăng độ chính xác của vector embedding.
```

---

### Lần sử dụng AI số 44

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Sử dụng Gemini API để tự động chấm điểm và đánh giá code học viên với các tiêu chí Clean Code |
| Phân việc liên quan | AI / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as an AI Prompt Engineer.
[CONTEXT] We want to offer automatic code review feedback (e.g., Code Complexity, Naming Conventions, Edge Cases) using Gemini 1.5 Flash.
[TASK] Create a highly structured system prompt for the AI reviewer and write the Java call code.
[CONSTRAINTS]
1. The AI response must be strictly in JSON format.
2. The JSON keys must be `score`, `complexity`, `suggestions` (array), and `refactoredCode`.
[FORMAT OUTPUT] System prompt text and Java JSON parsing logic.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết prompt hướng dẫn Gemini đóng vai trò reviewer, chỉ trả về JSON có cấu trúc định sẵn bằng cách thiết lập Response Schema trong API call.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa code gọi API này vào chức năng Review Code tự động trên nền tảng.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã bổ sung thêm caching cho kết quả review: nếu học viên nộp code giống hệt phiên bản trước, hệ thống sẽ trả về nhận xét cũ thay vì gọi lại AI.
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
Yêu cầu API trả về định dạng JSON giúp ứng dụng backend dễ dàng bóc tách thông tin hiển thị lên giao diện.
```

---

### Lần sử dụng AI số 45

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | AI quét kiểm duyệt nội dung video bài giảng (Video Moderation) để phát hiện vi phạm bản quyền hoặc nội dung không lành mạnh |
| Phân việc liên quan | AI / Backend |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Media Security Architect.
[CONTEXT] Instructors upload MP4 video lessons. We must scan them to ensure they contain educational content and do not include illegal material or unauthorized advertisements.
[TASK] Design a pipeline to perform automated AI video moderation.
[CONSTRAINTS]
1. Send key video frames or the entire short video to Gemini Multimodal API.
2. Detect speech (audio transcription moderation) and visual slide contents.
[FORMAT OUTPUT] Moderation workflow diagram (text) and API integration logic.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất trích xuất các khung ảnh (keyframes) và audio track, gửi qua Gemini Multimodal để phân tích nội dung hình ảnh/giọng nói, trả về thẻ phân loại an toàn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã áp dụng quy trình này để xây dựng module `VideoModerationService`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cải tiến bằng cách chỉ chạy tác vụ này ở background worker sau khi video được tải lên AWS S3 hoàn tất để không chặn luồng giao diện của giảng viên.
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
Kiểm duyệt video là tác vụ nặng, luôn xử lý bất đồng bộ (asynchronous) để tránh nghẽn luồng chính.
```

---

### Lần sử dụng AI số 46

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | AI trích xuất thông tin tự động từ CV (CV Parser) của Giảng viên nộp đơn đăng ký dạy |
| Phân việc liên quan | AI / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as an AI Integration Developer.
[CONTEXT] When a user applies to be an instructor, they upload a PDF CV. We want to extract their key skills, years of experience, and previous workplaces.
[TASK] Write the code to parse PDF text and feed it to Gemini API to get structured JSON resume information.
[CONSTRAINTS]
1. Extract values for `yearsOfExperience`, `skills` (list), `degree`, `hasCodingExperience` (boolean).
2. Ensure strict error handling for corrupted PDF files.
[FORMAT OUTPUT] Java integration method with Apache PDFBox parser.
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn dùng Apache PDFBox để trích xuất text từ file PDF, sau đó gửi đoạn text này cho Gemini API kèm theo schema yêu cầu định dạng JSON.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã tích hợp mã nguồn bóc tách PDF này vào luồng đăng ký Giảng viên.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cấu hình cho AI tự động gắn thẻ điểm đánh giá (CV Score từ 1-100) để Admin có thể sắp xếp và duyệt nhanh theo thứ hạng điểm hồ sơ.
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
Bóc tách PDF thô bằng thư viện cục bộ trước khi gửi text cho LLM giúp tiết kiệm lượng lớn token đầu vào.
```

---

### Lần sử dụng AI số 47

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cơ chế phân quyền nhiều cấp độ (RBAC) sử dụng Spring Security |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Spring Security Architect.
[CONTEXT] We have roles: ADMIN, INSTRUCTOR, CUSTOMER. We need custom permissions (e.g., `write:problem`, `publish:course`).
[TASK] Configure Spring Security to support Role-Based Access Control (RBAC) and Method-Level Security.
[CONSTRAINTS]
1. Use `@PreAuthorize` annotations on Service/Controller methods.
2. Map DB roles/permissions into custom UserDetails GrantedAuthorities.
[FORMAT OUTPUT] SecurityConfig.java configuration class and method annotation examples.
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn cấu hình `@EnableMethodSecurity` và nạp danh sách quyền (permissions) của user từ DB vào đối tượng Authentication.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã triển khai cấu hình bảo mật này cho toàn bộ hệ thống API.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tự tạo thêm một Custom AccessDeniedHandler để trả về mã lỗi JSON chuẩn hóa (`MSG32: Access Denied`) thay vì hiển thị trang lỗi HTML mặc định của Tomcat.
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
Method-level security cung cấp cơ chế bảo vệ phân quyền lớp sâu nhất, tránh được lỗi bỏ sót phân quyền ở API gateway.
```

---

### Lần sử dụng AI số 48

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai cơ chế xoay vòng JWT (JWT Rotation) với Refresh Token để bảo mật phiên đăng nhập |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Security Expert.
[CONTEXT] Standard Access Tokens expire in 15 minutes. We need a Refresh Token mechanism stored in PostgreSQL (with expiration of 7 days) to renew Access Tokens without logging out.
[TASK] Write the Refresh Token entity, request DTO, and validation service code.
[CONSTRAINTS]
1. If a Refresh Token is reuse-detected (stolen), immediately revoke all sessions of the user (Refresh Token Rotation).
2. Store tokens hashed in DB to protect against DB leaks.
[FORMAT OUTPUT] Java entity and Service logic.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp cấu trúc thực thể `RefreshToken` và service xử lý cấp mới token, đồng thời giải thích cơ chế Revocation khi phát hiện trùng mã token đã sử dụng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã viết logic này vào API đăng nhập và làm mới token.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cấu hình cho Refresh Token được lưu trữ trong HttpOnly Cookie để chống lại các cuộc tấn công đánh cắp token qua mã JavaScript độc hại (XSS).
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
Refresh Token đặt trong HttpOnly Cookie là phương thức bảo mật lưu trữ token an toàn nhất cho Single Page Applications.
```

---

### Lần sử dụng AI số 49

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tích hợp đăng nhập bằng Google OAuth2 bảo mật ở phía Backend |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as an OAuth2 Specialist.
[CONTEXT] Frontend React handles Google Client Login and gets an `id_token`. It sends it to Backend API `/api/v1/auth/google`.
[TASK] Write the backend Java Spring Boot controller to verify this token using Google API Client library and authenticate the user.
[CONSTRAINTS]
1. Verify token signature, audience client ID, and expiration.
2. If user doesn't exist, automatically create a new user profile with role CUSTOMER.
[FORMAT OUTPUT] Backend controller and authentication service code.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp code sử dụng thư viện `GoogleIdTokenVerifier` để giải mã, xác thực id_token và nạp thông tin user vào Spring Security context.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã triển khai API này tại class `GoogleAuthService`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tối ưu bằng cách tải ảnh đại diện từ Google của user về để lưu trữ cục bộ hoặc hiển thị trực tiếp trên thanh navbar trang chủ.
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
Xác thực id_token ở phía backend giúp ngăn chặn tuyệt đối việc giả mạo danh tính bằng cách truyền email bừa bãi qua API.
```

---

### Lần sử dụng AI số 50

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cấu hình Spring Security CORS để bảo vệ ứng dụng trước các request trái phép từ domain khác |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp đoạn cấu hình `CorsConfigurationSource` thiết lập các thuộc tính `AllowedOrigins`, `AllowedMethods` và `AllowedHeaders`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đưa cấu hình CORS này vào file cấu hình bảo mật `SecurityFilterChain`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã chuyển các giá trị tên miền (allowed origins) sang đọc từ file `application.yaml` để dễ dàng đổi tên miền khi chạy deploy lên production.
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
Không bao giờ để `AllowedOrigins = "*"` trên môi trường thực tế vì sẽ tạo ra lỗ hổng bảo mật CORS nghiêm trọng.
```

---

### Lần sử dụng AI số 51

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phòng chống tấn công Cross-Site Scripting (XSS) khi hiển thị mã nguồn của học viên trên giao diện |
| Phân việc liên quan | Frontend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Frontend Security Specialist.
[CONTEXT] Users can write and view markdown discussions and submit code. Attackers could insert `<script>alert('hack')</script>` or malicious iframe payloads.
[TASK] Secure the React application from XSS when rendering user-submitted HTML or Markdown.
[CONSTRAINTS]
1. Use DOMPurify to sanitize content.
2. Configure DOMPurify to allow syntax highlighting attributes for code blocks.
[FORMAT OUTPUT] React functional component using DOMPurify and react-markdown.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết component React tích hợp thư viện `dompurify` để làm sạch mã HTML bẩn trước khi gọi `dangerouslySetInnerHTML`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã cài đặt thư viện dompurify và đưa vào render khung chat thảo luận.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cấu hình DOMPurify ở cả phía backend (dùng HtmlSanitizer) để loại bỏ thẻ độc hại ngay khi lưu vào database.
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
Bảo mật XSS cần triển khai ở cả 2 đầu: Backend làm sạch trước khi lưu, Frontend làm sạch trước khi hiển thị.
```

---

### Lần sử dụng AI số 52

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Phòng chống tấn công SQL Injection khi tìm kiếm khóa học bằng các từ khóa tự do |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Hướng dẫn bảo mật |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Database Security Specialist.
[CONTEXT] Instructors search courses. If I concatenate SQL strings like `"SELECT * FROM courses WHERE title LIKE '%" + query + "%'"`, it is vulnerable to SQL injection.
[TASK] Show how to implement safe, parameterized search queries in Spring Boot.
[CONSTRAINTS]
1. Use Spring Data JPA Query methods with named parameters (`:query`).
2. Show CriteriaBuilder implementation for dynamic multi-field search.
[FORMAT OUTPUT] Code samples comparing unsafe query vs safe parameterized query.
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích cơ chế của Parameterized Queries và viết mã Spring Data `@Query` sử dụng tham số `:title` an toàn tuyệt đối trước SQL injection.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã thay thế tất cả các câu truy vấn nối chuỗi thô bằng truy vấn JPQL dùng Named Parameters.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thiết lập thêm thư viện SonarQube để tự động quét mã nguồn định kỳ nhằm cảnh báo sớm các đoạn code nối chuỗi SQL SQLi.
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
Sử dụng Hibernate/JPA hầu như miễn nhiễm với SQL Injection nếu ta tuân thủ quy tắc truyền biến qua parameters.
```

---

### Lần sử dụng AI số 53

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế cơ chế giới hạn tần suất request (Rate Limiting) cho các API nhạy cảm |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as an API Gatekeeper.
[CONTEXT] We need to prevent bots from brute-forcing passwords or DDOSing our code-execution endpoint.
[TASK] Implement API rate limiting using Bucket4j library.
[CONSTRAINTS]
1. Login endpoint limit: 5 requests per minute per IP.
2. Code run endpoint limit: 20 requests per minute per User ID.
[FORMAT OUTPUT] Java Spring Boot Filter or Interceptor implementation.
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn tạo một Filter tích hợp thư viện `Bucket4j` để đếm số request theo địa chỉ IP hoặc UserId và trả về HTTP Status 429 Too Many Requests nếu quá hạn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa RateLimitingFilter vào luồng API Login và Submit Code.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã đổi sang lưu trữ bucket token trong Redis (sử dụng Redis-backed Bucket4j) để hỗ trợ giới hạn truy cập khi scale hệ thống chạy nhiều server node.
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
Rate Limiting theo IP giúp ngăn chặn hiệu quả các cuộc tấn công dò mật khẩu (Brute Force).
```

---

### Lần sử dụng AI số 54

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xây dựng hệ thống Giao dịch Phân tán (Distributed Transactions) bằng Saga Pattern khi thực hiện mua khóa học và ghi nhận doanh thu giảng viên |
| Phân việc liên quan | Architecture |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Microservices Architect.
[CONTEXT] We have decoupled Order service, Wallet service, and Enrollment service. When a user buys a course, we must debit wallet, enroll user, and credit instructor balance. If enrollment fails, wallet debit must rollback.
[TASK] Design a Choreography-based Saga pattern workflow for this transaction.
[CONSTRAINTS]
1. Define successful paths, compensating transactions (rollbacks) for each failure point.
2. Explain message patterns via RabbitMQ.
[FORMAT OUTPUT] Diagram flow description and rollback event structure.
```

#### 4.2. Kết quả AI gợi ý

```text
AI thiết kế luồng Saga sử dụng các event nạp/hủy. Nếu việc ghi danh học viên thất bại, hệ thống sẽ tự động phát đi sự kiện `RollbackWalletEvent` để cộng lại tiền.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi áp dụng thiết kế này để viết module thanh toán và ghi danh bảo đảm an toàn dòng tiền.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã triển khai Outbox Pattern để lưu các event cần bắn vào DB trước khi gửi tới RabbitMQ để tránh việc mất gói tin khi server sập giữa chừng.
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
Giao dịch phân tán luôn đi kèm cơ chế bù trừ giao dịch (Compensating Transactions) để đưa hệ thống về trạng thái nhất quán.
```

---

### Lần sử dụng AI số 55

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cấu hình kết nối cơ sở dữ liệu dự phòng (Read-Write Splitting) với Spring Boot để tối ưu tải DB |
| Phân việc liên quan | Backend / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Spring Database Administrator.
[CONTEXT] 80% of our database operations are reads (browsing courses, loading profiles). We want to route writes (inserting submissions, transactions) to Primary DB, and reads to Replica DB.
[TASK] Configure Spring Boot dynamic routing database datasource.
[CONSTRAINTS]
1. Use `AbstractRoutingDataSource`.
2. Inspect the `@Transactional(readOnly = true)` annotation to decide which database connection to route.
[FORMAT OUTPUT] Java database configuration classes.
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn cách viết class kế thừa `AbstractRoutingDataSource` để tự động chọn Connection Pool tùy thuộc vào trạng thái `readOnly` của transaction context.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa cấu hình định tuyến này vào dự án backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã viết thêm AOP Aspect để tự động kiểm tra sức khỏe của các DB Replica, nếu một Replica chết, hệ thống sẽ tự động chuyển hướng đọc về Primary DB.
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
Rút ngắn thời gian xử lý và tránh quá tải cho Master DB bằng cách tận dụng tối đa Read Replicas.
```

---

### Lần sử dụng AI số 56

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tối ưu hóa dung lượng lưu trữ cơ sở dữ liệu bằng cách nén các file mã nguồn bài nộp lớn |
| Phân việc liên quan | Backend / Optimization |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Database Optimization Engineer.
[CONTEXT] Storing millions of raw string code submissions (each code file can be 50KB) wastes gigabytes of database disk.
[TASK] Write Java methods to compress source code using GZIP before saving to database, and decompress it upon retrieval.
[CONSTRAINTS]
1. Store compressed code as byte array (`byte[]`) in JPA Entity.
2. Compression must be CPU efficient.
[FORMAT OUTPUT] Java utility helper class and entity annotation example.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết một Utility class sử dụng `GZIPOutputStream` để nén chuỗi thành mảng byte và `GZIPInputStream` để giải nén ngược lại.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa hàm nén này vào Entity `@PrePersist` và `@PostLoad` để tự động nén/giải nén.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm logic giới hạn: chỉ nén những tệp code có kích thước lớn hơn 5KB để tránh lãng phí tài nguyên CPU cho những bài nộp quá ngắn.
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
Nén dữ liệu giúp giảm lưu lượng I/O đĩa cứng cơ sở dữ liệu lên đến 70-80% đối với dữ liệu văn bản.
```

---

### Lần sử dụng AI số 57

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế API xuất file báo cáo doanh thu PDF/Excel sử dụng JasperReports/Apache POI |
| Phân việc liên quan | Backend / Reporting |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Reporting System Engineer.
[CONTEXT] Admin needs to download monthly revenue breakdown spreadsheet.
[TASK] Write a Spring Boot Controller and Service that generates and downloads an Excel file.
[CONSTRAINTS]
1. Use Apache POI library.
2. Design professional table header styling, auto-adjust column width, and write total summation formula at the end.
[FORMAT OUTPUT] Java controller and service methods returning Excel file download.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp code sử dụng Apache POI tạo workbook, sheet, cell, định dạng font bold cho tiêu đề và áp dụng công thức SUM của Excel.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã viết class `ExcelReportExporter` để sinh file excel.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã sửa lỗi rò rỉ bộ nhớ bằng cách đóng workbook trong khối `try-with-resources` và truyền trực tiếp dữ liệu ra OutputStream.
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
Luôn dùng try-with-resources khi xử lý file và stream để đảm bảo giải phóng bộ nhớ RAM kịp thời.
```

---

### Lần sử dụng AI số 58

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cơ chế tự động dọn dẹp các file tạm và CV giảng viên không được duyệt sau 30 ngày |
| Phân việc liên quan | Backend / Maintenance |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp class định nghĩa `@Scheduled(cron = "0 0 2 * * ?")` chạy lúc 2h sáng hàng ngày để tìm và xóa file qua AWS S3 Client.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa Scheduled job này vào class `CleanupTask`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm transaction management và ghi log chi tiết số lượng file đã xóa thành công để phục vụ giám sát vận hành.
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
Chạy các tác vụ dọn dẹp nặng vào khung giờ thấp điểm (như 2 giờ sáng) để không ảnh hưởng đến người dùng đang học.
```

---

### Lần sử dụng AI số 59

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai lưu trữ file bài giảng và tài liệu học tập lên AWS S3 sử dụng SDK AWS Java |
| Phân việc liên quan | Backend / Integration |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI viết Service sử dụng `S3Client` và `S3Presigner` để tạo link truy cập tạm thời (Pre-signed URL) có hiệu lực trong 60 phút.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi áp dụng class này để quản lý toàn bộ tệp tin bài học tải lên.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thay thế cấu hình Credentials cứng (Hardcoded AccessKey/SecretKey) bằng việc đọc thông tin cấu hình qua biến môi trường để tăng tính bảo mật bảo vệ thông tin AWS.
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
Sử dụng Pre-signed URLs giúp bảo vệ các tài liệu trả phí khỏi việc bị chia sẻ liên kết tải trực tiếp ra ngoài.
```

---

### Lần sử dụng AI số 60

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Hỗ trợ streaming video bài giảng chất lượng cao bằng giao thức HLS và phân giải nhiều định dạng |
| Phân việc liên quan | Architecture / Video Processing |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Video Streaming Architect.
[CONTEXT] We want to prevent piracy of course videos. Raw MP4 files can be easily downloaded. We also want smooth playback on slow networks.
[TASK] Design a video processing pipeline to transcode MP4 to HLS (m3u8 index files and .ts segment chunks) at multiple resolutions (480p, 720p, 1080p).
[CONSTRAINTS]
1. Use ffmpeg command tool parameters.
2. Outline how the React frontend client (using hls.js or video.js) plays the video dynamically.
[FORMAT OUTPUT] Transcoding commands and React player configurations.
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn sử dụng công cụ `ffmpeg` chạy trên background worker để cắt nhỏ video thành các đoạn `.ts` đi kèm file chỉ mục `.m3u8`, cấu hình luồng phát bằng thư viện Video.js ở Frontend.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã viết script tự động gọi tiến trình `ffmpeg` trên server chạy ngầm.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã mã hóa (AES-128 encryption) cho các phân đoạn video `.ts` của HLS để tăng tối đa bảo mật chống download lậu video học.
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
HLS streaming kết hợp mã hóa AES-128 là tiêu chuẩn công nghiệp được các nền tảng học trực tuyến lớn tin dùng.
```

---

### Lần sử dụng AI số 61

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế cơ chế theo dõi tiến trình học tập của học viên chi tiết đến từng giây xem video |
| Phân việc liên quan | Backend / Frontend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất cơ chế lắng nghe sự kiện `onTimeUpdate` ở React Player và gọi API cập nhật tiến độ sau mỗi 10 giây xem liên tục.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã viết logic tracking này và lưu thông tin vào thực thể `user_lesson_progress`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm cơ chế chặn gian lận: nếu người dùng gửi request update giây nhảy vọt quá lớn (ví dụ tua nhanh hơn tốc độ bình thường), backend sẽ loại bỏ lượt ping đó.
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
Xác thực logic thời gian tua ở Backend giúp loại bỏ hoàn toàn việc chỉnh sửa API của các lập trình viên frontend tinh quái.
```

---

### Lần sử dụng AI số 62

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xây dựng hệ thống thảo luận cộng đồng (Discussion Forum) hỗ trợ bình luận phân cấp |
| Phân việc liên quan | Design / Database |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Senior Database Developer.
[CONTEXT] Our learning forum allows students to reply to comments. This can form a deeply nested comment tree.
[TASK] Design the `comments` table schema and write a recursive SQL CTE (Common Table Expression) to fetch a comment thread in hierarchical order.
[CONSTRAINTS]
1. Support parent-child hierarchy (`parent_id` foreign key).
2. The query must return comments sorted by depth and creation date.
[FORMAT OUTPUT] SQL schema and PostgreSQL recursive SELECT query.
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý bảng `comments` tự tham chiếu (`parent_id REFERENCES comments(id)`) và câu lệnh SQL sử dụng `WITH RECURSIVE` để lấy toàn bộ nhánh comment chỉ bằng một câu query.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa truy vấn CTE phân cấp này vào lớp truy vấn cơ sở dữ liệu.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã chuyển đổi cấu trúc phẳng (flat array) thu được từ CTE SQL thành cấu trúc cây đối tượng (Nested JSON tree) trước khi gửi về frontend để React dễ render.
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
Sử dụng WITH RECURSIVE ở DB giảm thiểu đáng kể số lượng truy vấn lặp lại so với việc tải và ghép nối các bản ghi comment bằng Java code.
```

---

### Lần sử dụng AI số 63

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai cơ chế Markdown Editor với tính năng auto-save và upload ảnh cho giảng viên soạn bài |
| Phân việc liên quan | Frontend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Senior React Developer.
[CONTEXT] Instructors need to write problem statements and lesson contents. They prefer writing in Markdown.
[TASK] Create a Markdown editor React component with auto-save and image upload support.
[CONSTRAINTS]
1. Use LocalStorage to auto-save drafts every 5 seconds.
2. Support copy-pasting or drag-and-dropping image files, uploading them to S3, and inserting markdown image links `![alt](url)` automatically.
[FORMAT OUTPUT] React code using react-simplemde-editor or similar libraries.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết component React sử dụng SimpleMDE, viết sự kiện lắng nghe `paste` và `drop` tệp tin để gửi lên S3, sau đó chèn đường dẫn ảnh trực tiếp vào vị trí con trỏ soạn thảo.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã tích hợp Markdown Editor này vào màn hình Soạn thảo đề bài (Edit Problem).
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm tính năng tự động dọn dẹp LocalStorage nháp khi giảng viên nhấn Submit thành công để tránh lưu trữ rác cục bộ.
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
Tính năng auto-save nháp là cứu cánh tuyệt vời khi trình duyệt của giảng viên vô tình bị đóng hoặc tải lại trang.
```

---

### Lần sử dụng AI số 64

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tối ưu hóa giao diện React bằng kỹ thuật Lazy Loading và Code Splitting để giảm dung lượng bundle ban đầu |
| Phân việc liên quan | Frontend / Optimization |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a React Performance Expert.
[CONTEXT] Our frontend build file `main.js` exceeds 2MB, slowing down initial page loads.
[TASK] Implement code splitting using React Lazy loading and Router integration.
[CONSTRAINTS]
1. Split main routes (Dashboard, IDE Workspace, Course View, profile).
2. Show a loading skeleton while pages are being lazy-fetched.
[FORMAT OUTPUT] React Router file snippet using React.lazy and Suspense.
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn thay thế các import tĩnh bằng import động: `const CodingWorkspace = React.lazy(() => import('./pages/CodingWorkspace'))` và bao bọc Router bằng `<Suspense fallback={<SkeletonLoading />}>`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã thay đổi cấu trúc định tuyến Router trong file App.js của React.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cấu hình cho webpack tự động pre-fetch các route chính (như xem khóa học) khi người dùng đang ở trang chủ để tối ưu tốc độ chuyển trang mượt mà.
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
Lazy loading giảm thời gian tải trang đầu tiên (Time-to-Interactive) của ứng dụng Single Page Application từ nhiều giây xuống dưới 1 giây.
```

---

### Lần sử dụng AI số 65

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai skeleton loading cho trang chi tiết khóa học để tăng trải nghiệm người dùng |
| Phân việc liên quan | Frontend / UX |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a UI/UX Developer.
[CONTEXT] When course data is fetched from the server, we don't want to show a blank page or a simple spinner. We want a skeleton layout.
[TASK] Create a Tailwind CSS React Skeleton loader for the Course Detail page.
[CONSTRAINTS]
1. Skeleton blocks must match the exact height and width of real content containers.
2. Add a pulsing animation (`animate-pulse`) to make the loader look dynamic.
[FORMAT OUTPUT] JSX component with Tailwind CSS styling.
```

#### 4.2. Kết quả AI gợi ý

```text
AI sinh ra component `CourseDetailSkeleton` thiết kế các khối bo tròn giả lập thanh tiêu đề, ảnh thumbnail, danh sách bài học có hiệu ứng nhấp nháy mượt mà.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã dùng component này làm màn hình chờ trong khi biến `isLoading` là true.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tự điều chỉnh các màu sắc xám của skeleton sao cho hài hòa với màu nền tối (Dark Mode) của hệ thống.
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
Skeleton loader tạo cảm giác ứng dụng chạy nhanh hơn so với biểu tượng vòng quay spinner truyền thống.
```

---

### Lần sử dụng AI số 66

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế UI tương thích đa thiết bị (Responsive Design) cho IDE Coding Workspace của học viên trên máy tính và iPad |
| Phân việc liên quan | Frontend / Layout |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn cách dùng grid layout: `grid grid-cols-1 lg:grid-cols-2` và thiết lập thanh kéo co giãn (resize) kích thước các panel thông qua thư viện split.js.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã chỉnh sửa mã nguồn giao diện Coding Workspace theo phong cách responsive.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã viết thêm listener để tự động giảm kích thước font chữ của editor (Monaco fontSize) khi phát hiện chiều rộng màn hình nhỏ hơn 768px.
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
Responsive IDE tăng tính linh hoạt học tập giúp học viên có thể xem lời giải bài tập ngay trên thiết bị di động.
```

---

### Lần sử dụng AI số 67

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xây dựng hệ thống thông báo thời gian thực (Push Notifications) về sự kiện thi đấu sử dụng SSE (Server-Sent Events) |
| Phân việc liên quan | Backend / Frontend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn tạo endpoint trả về `SseEmitter`, lưu trữ danh sách emitter trong `ConcurrentHashMap`, và phía Client mở kết nối bằng lớp `EventSource` của trình duyệt.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa SSE vào hệ thống để làm chức năng thông báo thông báo khẩn cấp.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã viết thêm cơ chế tự động gửi tin nhắn nhịp tim (heartbeat) định kỳ sau mỗi 30 giây để ngăn các proxy mạng hoặc tường lửa ngắt kết nối.
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
SSE nhẹ hơn WebSocket, cấu hình dễ dàng qua giao thức HTTP thường và có khả năng tự động kết nối lại khi đứt mạng.
```

---

### Lần sử dụng AI số 68

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Viết Unit Test cho Service xử lý nạp tiền bằng JUnit 5 và Mockito |
| Phân việc liên quan | Testing / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI sinh ra lớp unit test sử dụng `@ExtendWith(MockitoExtension.class)` và các cú pháp `when().thenReturn()` để kiểm tra các luồng nghiệp vụ ví.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã lưu file test này vào thư mục `src/test/java` của dự án backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm bộ sinh dữ liệu mẫu ngẫu nhiên (Faker library) để chạy lặp lại test case với nhiều giá trị số dư ví khác nhau.
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
Unit test là bước rà soát mã nguồn đầu tiên giúp phát hiện lỗi lập trình sớm nhất trước khi đóng gói sản phẩm.
```

---

### Lần sử dụng AI số 69

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai Integration Test cho API chấm bài sử dụng Testcontainers với Docker PostgreSQL và Docker Judge0 |
| Phân việc liên quan | Testing / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Testcontainers Specialist.
[CONTEXT] I want to test the full submission pipeline: from REST controller call -> saving to DB -> getting verdict. I need an integration test that spins up real databases.
[TASK] Configure Spring Boot integration tests using Testcontainers library.
[CONSTRAINTS]
1. Spin up a PostgreSQL container dynamically.
2. Spin up a MockServer or real Judge0 container to return code execution results.
[FORMAT OUTPUT] Java integration test configuration class.
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn cách viết lớp test cơ sở kế thừa `PostgreSQLContainer` để khởi tạo database sạch trước khi chạy các câu lệnh REST Assured test API.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa cấu hình Testcontainers này vào bộ mã kiểm thử tích hợp của backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tối ưu hóa thời gian chạy bằng cách chia sẻ chung một instance container cho tất cả các class test thay vì khởi tạo lại container cho mỗi class.
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
Testcontainers giúp đảm bảo kết quả kiểm thử trên máy local giống hệt môi trường chạy thật, loại bỏ lỗi do môi trường.
```

---

### Lần sử dụng AI số 70

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Viết End-to-End Test cho luồng đăng ký học và thanh toán bằng Cypress |
| Phân việc liên quan | Testing / Frontend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a QA Automation Engineer.
[CONTEXT] We need to test the user story: Login -> Browse Course -> Click Enroll -> Confirm payOS checkout redirection.
[TASK] Write a Cypress E2E test file to automate this user flow.
[CONSTRAINTS]
1. Stub the login request using intercept to bypass Google OAuth login screen.
2. Click the enroll button and verify target URL matches PayOS redirect pattern.
[FORMAT OUTPUT] Cypress javascript test file.
```

#### 4.2. Kết quả AI gợi ý

```text
AI sinh ra kịch bản Cypress sử dụng `cy.visit()`, `cy.get().click()`, và giả lập phản hồi của API thanh toán để kiểm tra hành vi chuyển trang.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đưa script này vào thư mục cypress/integration để chạy tự động.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm việc xuất ảnh chụp màn hình (screenshots) tự động nếu có bước kiểm thử nào bị lỗi trong lúc chạy kiểm thử.
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
Kiểm thử End-to-End giúp QA xác minh hoạt động thực tế của ứng dụng dưới góc nhìn của người dùng cuối.
```

---

### Lần sử dụng AI số 71

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cấu hình Dockerize ứng dụng Spring Boot sử dụng Multi-stage build để tối ưu hóa kích thước image |
| Phân việc liên quan | DevOps |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp tệp Dockerfile hai tầng, sử dụng cơ chế đệm cache maven để giảm thời gian build và xuất ra image cuối cùng chỉ khoảng 200MB.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã lưu file này thành `Dockerfile` ở thư mục gốc của backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi bổ sung thêm cấu hình nén các lớp Docker và dọn dẹp các tệp tin log thừa trước khi đóng gói để tối ưu dung lượng tải.
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
Dockerfile multi-stage tách biệt hoàn toàn môi trường build và môi trường chạy giúp loại bỏ các tệp tin rác của Maven khỏi image chạy thật.
```

---

### Lần sử dụng AI số 72

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết lập quy trình CI/CD tự động build, test và deploy lên VPS bằng GitHub Actions |
| Phân việc liên quan | DevOps |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a DevOps Engineer.
[CONTEXT] We host our application on an Ubuntu VPS. We want every commit pushed to branch `main` to trigger automated build, test, Docker image push, and deploy on VPS.
[TASK] Write a GitHub Actions workflow configuration file (`.github/workflows/deploy.yml`).
[CONSTRAINTS]
1. Use secrets for SSH key, Docker Hub username, and password.
2. Pull latest docker image and restart container using docker-compose on VPS.
[FORMAT OUTPUT] Yaml configuration workflow file.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp file cấu hình YAML định nghĩa các jobs: build-and-test, build-and-push-docker, và deploy-vps gọi lệnh SSH execute remote command.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đẩy tệp cấu hình này lên nhánh chính của repo GitHub.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm một bước rollback tự động: nếu quá trình khởi động container mới bị lỗi, hệ thống tự động khởi chạy lại container phiên bản trước đó.
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
CI/CD giúp loại bỏ hoàn toàn các lỗi thủ công khi deploy code lên máy chủ thật.
```

---

### Lần sử dụng AI số 73

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cấu hình Prometheus và Grafana để giám sát các chỉ số hiệu năng của Spring Boot |
| Phân việc liên quan | DevOps |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn kích hoạt dependency `micrometer-registry-prometheus`, cấu hình file yaml của Spring Boot và thiết lập địa chỉ IP scrape cho máy chủ Prometheus.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã bật endpoint Actuator Prometheus ở backend và dựng Docker Grafana để vẽ biểu đồ.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tự import mẫu Dashboard 4701 trên Grafana để có giao diện quản lý tài nguyên JVM cực kỳ trực quan và đẹp mắt.
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
Actuator giúp lập trình viên nhìn rõ các thông số chạy bên trong máy ảo Java JVM thời gian thực.
```

---

### Lần sử dụng AI số 74

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết lập hệ thống tập trung Log (Centralized Logging) bằng ELK Stack hoặc Grafana Loki |
| Phân việc liên quan | DevOps |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Log Architect.
[CONTEXT] Tracking errors across multiple Docker containers via terminal is painful. We need centralized logs.
[TASK] Configure Spring Boot Logback logging to export logs to Grafana Loki.
[CONSTRAINTS]
1. Use Logback XML configuration.
2. Output logs in structured JSON format (timestamp, log level, thread, logger, message, exception).
[FORMAT OUTPUT] `logback-spring.xml` file configuration.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp file `logback-spring.xml` cấu hình Loki appender để tự động chuyển phát log qua HTTP API về Loki server.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa file cấu hình logback vào thư mục tài nguyên của backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm MDC (Mapped Diagnostic Context) để gắn kèm thông tin `userId` và `transactionId` vào từng dòng log giúp lần vết lỗi của từng user cực kỳ nhanh.
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
Log có cấu trúc JSON giúp việc truy vấn, lọc tìm lỗi theo từ khóa trên Grafana Dashboard vô cùng thuận tiện.
```

---

### Lần sử dụng AI số 75

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Khắc phục lỗi Memory Leak trong ứng dụng Java do rò rỉ ThreadLocal trong Spring Security context |
| Phân việc liên quan | Backend / Debug |
| Mức độ sử dụng | Hướng dẫn sửa lỗi |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Java Memory Profiler.
[CONTEXT] The server crashes after running for 3 days due to `OutOfMemoryError: Java heap space`. Profiling shows millions of uncollected ThreadLocal variables.
[TASK] Diagnose how ThreadLocal memory leaks occur in a Spring Boot application running on Tomcat and write cleanup code.
[CONSTRAINTS]
1. Explain relation to Tomcat thread pool recycling.
2. Provide code showing how to clean up custom ThreadLocal variables in a Servlet Filter.
[FORMAT OUTPUT] Technical explanation and Java filter implementation class.
```

#### 4.2. Kết quả AI gợi ý

```text
AI giải thích: Tomcat tái sử dụng thread trong pool. Nếu một biến ThreadLocal không được gọi `.remove()` sau khi kết thúc request, dữ liệu sẽ ở lại trong memory mãi mãi, gây rò rỉ. AI cung cấp filter dọn dẹp.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã viết một `CustomThreadLocalCleanupFilter` để giải phóng tất cả các biến ThreadLocal tự định nghĩa sau mỗi request.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cài đặt thêm lệnh `@Override destroy()` để xóa trắng dữ liệu cấu hình khi filter dừng hoạt động.
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
Luôn bao bọc lệnh giải phóng ThreadLocal trong khối `finally` của filter để đảm bảo được thực thi bất kể request thành công hay lỗi.
```

---

### Lần sử dụng AI số 76

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Khắc phục lỗi Connection Pool Exhaustion khi lượng truy cập tăng đột biến bằng cách tinh chỉnh HikariCP |
| Phân việc liên quan | Backend / Optimization |
| Mức độ sử dụng | Hướng dẫn sửa lỗi |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Database Connection Pool Expert.
[CONTEXT] Under load, our backend throws `SQLTransientConnectionException: Connection is not available, request timed out after 30000ms`.
[TASK] Provide optimal HikariCP configuration values for application.properties and explain how to tune them.
[CONSTRAINTS]
1. Configure `maximum-pool-size`, `minimum-idle`, `idle-timeout`, and `connection-timeout`.
2. Explain connection leak detection.
[FORMAT OUTPUT] Configuration properties and leak detection guide.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất thiết lập kích thước pool phù hợp (ví dụ max 20-50 tùy theo số lõi CPU của DB), và bật cấu hình phát hiện rò rỉ: `leak-detection-threshold: 2000`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa các thông số cấu hình tối ưu này vào file `application.yaml`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã rà soát lại toàn bộ dự án, bổ sung chú thích `@Transactional(readOnly = true)` cho các hàm chỉ đọc để Hibernate đóng kết nối sớm giải phóng tài nguyên.
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
Leak detection giúp hệ thống in cảnh báo log nếu có luồng nào giữ kết nối database quá 2 giây mà không trả lại pool.
```

---

### Lần sử dụng AI số 77

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết lập cấu hình HTTPS bảo mật bằng SSL/TLS qua Let's Encrypt trên Reverse Proxy Nginx |
| Phân việc liên quan | DevOps / Security |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as an Nginx Systems Administrator.
[CONTEXT] We need to secure our API server at domain `api.codelearn.com` using HTTPS. Nginx is in front of the Spring Boot app.
[TASK] Write the Nginx server block configuration file supporting SSL and routing requests to port 8080.
[CONSTRAINTS]
1. Redirect all HTTP requests (port 80) to HTTPS (port 443).
2. Configure modern SSL ciphers recommended by Let's Encrypt Certbot.
[FORMAT OUTPUT] Complete Nginx `default.conf` config snippet.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết file cấu hình Nginx, cấu hình chuyển hướng HTTP -> HTTPS và thiết lập đường dẫn đến các chứng chỉ SSL được sinh ra từ certbot.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã áp dụng cấu hình này vào dịch vụ Nginx trên VPS.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi bật thêm Header bảo mật nâng cao HSTS (HTTP Strict Transport Security) để bắt trình duyệt luôn sử dụng HTTPS cho các truy cập sau.
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
Reverse Proxy bằng Nginx giúp giảm tải việc giải mã SSL cho Spring Boot backend, giúp ứng dụng chạy nhẹ hơn.
```

---

### Lần sử dụng AI số 78

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thực hiện Audit log lịch sử thao tác của các Admin trên hệ thống |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn định nghĩa Annotation `@AdminAuditLog` và Aspect sử dụng `@Around` để ghi lại lịch sử thao tác của Admin và lưu vào bảng `admin_audit_logs`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã tạo Aspect và gán Annotation này lên các phương thức nhạy cảm của Admin Controller.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cấu hình lưu thêm thông tin User-Agent để biết Admin thực hiện thao tác trên hệ điều hành và trình duyệt nào.
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
Aspect-Oriented Programming (AOP) giúp ghi nhật ký sạch sẽ mà không làm rối mã nguồn nghiệp vụ chính.
```

---

### Lần sử dụng AI số 79

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế Hệ thống Gợi ý Khóa học (Recommendation System) dựa trên lịch sử giải bài của Học viên |
| Phân việc liên quan | AI / Database |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Machine Learning Engineer.
[CONTEXT] Our platform has programming problems and video courses. If a student struggles with "Dynamic Programming" problems, we want to recommend dynamic programming video courses.
[TASK] Propose a simple content-based recommendation approach that runs inside PostgreSQL or Spring Boot.
[CONSTRAINTS]
1. Map tags between problems solved with WRONG answer and course categories.
2. Rank recommended courses by matching tag frequency.
[FORMAT OUTPUT] Markdown explanation of the recommendation logic and SQL query.
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý truy vấn SQL kết hợp đếm thẻ phân loại (tags) của các bài nộp lỗi (WA/TLE) của user để nối với khóa học có cùng tag phân loại.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã sử dụng giải thuật SQL này để viết lớp `CourseRecommendationService`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm bộ lọc loại bỏ những khóa học học viên đã mua để tránh gợi ý trùng lặp.
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
Gợi ý dựa trên thẻ phân loại là bước tiếp cận hệ thống đề xuất nhanh và hiệu quả nhất cho cơ sở dữ liệu quan hệ.
```

---

### Lần sử dụng AI số 80

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tích hợp tính năng lập trình trực tiếp (Interactive Coding Playground) trong phụ đề video |
| Phân việc liên quan | Frontend / Interactive |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as an Interactive UX Architect.
[CONTEXT] We want an advanced feature: while watching a video lecture, if the instructor explains a code block, a mini code editor pops up beside the video, allowing students to run that exact code.
[TASK] Design the UI state sync between React Video player and Monaco Editor.
[CONSTRAINTS]
1. Sync based on video track timestamp metadata (WebVTT files).
2. The user's code execution must not stop the video unless they choose to.
[FORMAT OUTPUT] UI workflow diagram and component configuration.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất định dạng tệp WebVTT chứa mã nguồn mẫu ở các mốc thời gian và viết React hook đồng bộ state `currentTime` của player để hiển thị editor tương ứng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã dựng component `InteractiveLecturePlayer` theo thiết kế này.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm nút 'Pause on code popup' cho phép học viên tùy chọn dừng video khi editor hiện ra để kịp gõ code.
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
Đồng bộ timestamp video qua WebVTT giúp tải mã nguồn mẫu nhẹ nhàng và chính xác theo tiến độ bài học.
```

---

### Lần sử dụng AI số 81

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tạo chứng chỉ khóa học dạng PDF tự động có mã QR xác minh mã hóa |
| Phân việc liên quan | Backend / Cryptography |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn sử dụng OpenPDF kết hợp thư viện ZXing để tạo mã QR chứa URL mã hóa, vẽ đè lên phông nền phôi chứng chỉ.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa code này vào lớp `CertificateGenerator` của backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã upload trực tiếp file PDF chứng chỉ lên AWS S3 và lưu link vào cơ sở dữ liệu để phục vụ việc tra cứu lại bất cứ lúc nào.
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
Xác thực mã hóa bằng chữ ký số qua QR code giúp nhà tuyển dụng dễ dàng quét mã đối soát chứng chỉ thật/giả.
```

---

### Lần sử dụng AI số 82

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Nhập hàng loạt sinh viên vào lớp học (Bulk Import) từ file Excel/CSV |
| Phân việc liên quan | Backend / Integration |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as an Integration Developer.
[CONTEXT] Instructors want to import 100+ students into their virtual class section at once by uploading a CSV/Excel file.
[TASK] Create a Spring Boot endpoint that parses uploaded Excel files and inserts student accounts.
[CONSTRAINTS]
1. Use Apache POI or OpenCSV.
2. Validate data fields (email format, blank names) and return a detailed error list for invalid rows without crashing the transaction.
[FORMAT OUTPUT] Spring Boot controller and parser service class.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết Service đọc MultipartFile Excel, lặp qua các dòng, kiểm tra định dạng email và gom các lỗi dòng ghi vào danh sách phản hồi.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã tích hợp API này vào màn hình quản lý học viên lớp học.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã bổ sung việc gửi email thông báo tự động đính kèm mật khẩu khởi tạo cho những học viên mới đăng ký tài khoản lần đầu qua file import.
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
Xử lý import luôn cần cơ chế Transaction: chỉ commit khi toàn bộ dữ liệu đúng, hoặc roll-back kèm báo cáo dòng lỗi cụ thể.
```

---

### Lần sử dụng AI số 83

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế luật mở khóa bài học theo điều kiện tiên quyết (Prerequisite Rules) |
| Phân việc liên quan | Backend / Security |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Course Flow Logic Developer.
[CONTEXT] Lessons in a course are sequential. Lesson N requires Lesson N-1 to be completed, or a prerequisite test to be passed.
[TASK] Write an API middleware filter or Interceptor that guards lesson retrieval based on prerequisite logic.
[CONSTRAINTS]
1. Check user's lesson progress database table.
2. Allow bypass rules for instructors or system admins.
[FORMAT OUTPUT] Java Spring Interceptor implementation.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết một HandlerInterceptor kiểm tra sự tồn tại của bản ghi học tập tương ứng trong database, trả về lỗi HTTP 403 nếu bài học trước chưa hoàn thành.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa Interceptor này vào cấu hình MVC của dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tối ưu hóa bằng cách cache trạng thái tiến trình học tập của user vào Redis để giảm thiểu số lượng truy cập vào database khi học viên click bài liên tục.
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
Xác thực điều kiện tiên quyết ở mức API đảm bảo an toàn hơn việc chỉ ẩn nút bấm ở phía giao diện frontend.
```

---

### Lần sử dụng AI số 84

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế Hệ thống Huy hiệu Thành tích (Badges & Achievement Engine) tự động |
| Phân việc liên quan | Design / Backend |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Gamification Specialist.
[CONTEXT] We want to award digital badges (e.g., 'Python Master', 'Contest Winner') when users achieve milestones.
[TASK] Design the badge database schema and the event listener pattern to award badges.
[CONSTRAINTS]
1. Achievements should be evaluated asynchronously when a submission is marked ACCEPTED.
2. Badges should have unique rules defined in JSON.
[FORMAT OUTPUT] Database DDL schema and Java Spring Event Listener code.
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý thiết kế bảng `badges` và `user_badges`, sử dụng cơ chế lắng nghe sự kiện (`@EventListener`) sau khi chấm bài thành công để đánh giá điều kiện trao huy hiệu.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã áp dụng mô hình này để viết module `AchievementService`.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tích hợp thư viện Firebase Cloud Messaging để tự động đẩy thông báo chúc mừng thời gian thực khi học viên mở khóa được huy hiệu mới.
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
Xử lý kiểm tra huy hiệu bằng cơ chế bất đồng bộ giúp luồng chấm bài chính không bị ảnh hưởng hiệu năng.
```

---

### Lần sử dụng AI số 85

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế Cửa hàng đổi quà (Virtual Item Store) tích hợp đổi điểm thưởng |
| Phân việc liên quan | Design / Database |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as an E-Commerce Database Designer.
[CONTEXT] Users earn points from solving coding tasks. They can redeem points for virtual goods (profile frames, certificate badges) or physical items (stickers, shirts).
[TASK] Design the database schema for the virtual shop catalog, user points log, and redemption orders.
[CONSTRAINTS]
1. Deduct points atomically and check points >= 0.
2. Track order status (PENDING, DELIVERED, CANCELLED).
[FORMAT OUTPUT] SQL schema and redemption transactional service logic in Java.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất các bảng `store_items`, `points_logs` và `item_redemptions`, đi kèm dịch vụ trừ điểm ví điểm thưởng an toàn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã xây dựng database cửa hàng theo đúng thiết kế này.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thêm cơ chế khóa bi quan lên tài khoản điểm thưởng của người dùng để chống race-condition khi nhấn đổi quà liên tiếp nhiều lần.
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
Mọi chuyển dịch điểm thưởng cần ghi nhật ký (Points Log) chi tiết phục vụ đối soát tương tự ví tiền mặt.
```

---

### Lần sử dụng AI số 86

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai Notification Toast thời gian thực cho hoạt động nhóm học tập |
| Phân việc liên quan | Frontend / UX |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Frontend Developer.
[CONTEXT] When a team member publishes a new comment on a shared code problem, we want a small toast message to pop up at the top-right of the interface.
[TASK] Implement a notification hook in React using react-toastify or react-hot-toast connected to our Server-Sent Events notifications channel.
[CONSTRAINTS]
1. Parse incoming notification JSON and display custom message.
2. Clicking the toast should redirect the user to the specific problem thread.
[FORMAT OUTPUT] Complete React component using react-toastify.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết React hook lắng nghe EventSource, khởi tạo toast thông báo động của thư viện react-toastify đi kèm hàm onClick chuyển trang qua React Router.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã cài đặt react-toastify và tích hợp hook này vào layout tổng của app.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã bổ sung bộ lọc bỏ qua thông báo nếu chính người dùng hiện tại là tác giả của bình luận đó để tránh làm phiền.
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
Toast thông báo cần đi kèm âm thanh hoặc hiệu ứng nhẹ để thu hút sự chú ý mà không gây ức chế khi làm bài.
```

---

### Lần sử dụng AI số 87

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xây dựng lịch trình tự động đẩy bài tập hàng ngày (Daily Challenge Scheduler) |
| Phân việc liên quan | Backend / Maintenance |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI viết phương thức scheduler lấy ngẫu nhiên 1 Problem từ DB dựa trên thuật ngữ SQL ORDER BY RANDOM() và lưu vào bảng thử thách ngày.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã triển khai scheduler này vào dự án backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tối ưu bằng cách chỉ chọn các bài tập có độ khó tăng dần hoặc luân phiên (Dễ, Trung bình, Khó) theo các thứ trong tuần thay vì ngẫu nhiên hoàn toàn.
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
Bảng thử thách ngày giúp ghi lại lịch sử các bài đã làm thử thách để tránh bị trùng lặp trong tuần.
```

---

### Lần sử dụng AI số 88

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế Bộ máy duyệt chính sách Hoàn tiền (Refund Policy Engine) |
| Phân việc liên quan | Design / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Business Rules Engine Developer.
[CONTEXT] Users can request refunds for purchased courses. Policy: Refund allowed only if purchase is within 7 days AND course progress is under 10%.
[TASK] Implement the automatic refund validation service in Spring Boot.
[CONSTRAINTS]
1. Verify payment records, order date, and progress tracking tables.
2. Update wallet balance and revoke course access atomically upon approval.
[FORMAT OUTPUT] Java Service method with transactional logic.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết hàm kiểm tra ngày mua khóa học và gọi dịch vụ progress tracking để so sánh tiến trình xem video, nếu đạt chuẩn sẽ hoàn tiền ví điện tử.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa logic này vào `RefundServiceImpl` của dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cấu hình gửi mail thông báo tự động lý do từ chối (nếu không đạt điều kiện hoàn tiền) để học viên nắm rõ thông tin.
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
Giao dịch hoàn tiền bắt buộc phải chạy trong môi trường `@Transactional` để tránh lỗi hoàn tiền thành công nhưng học viên vẫn giữ quyền truy cập khóa học.
```

---

### Lần sử dụng AI số 89

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Hỗ trợ Đa tiền tệ (Multi-currency) và tỷ giá cập nhật tự động |
| Phân việc liên quan | Design / Database |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Database Architect.
[CONTEXT] The platform supports credit purchases in VND, USD, and EUR. We need to store course prices in a base currency and render convert dynamically based on active rates.
[TASK] Design exchange rates database table and write dynamic price conversion helper.
[CONSTRAINTS]
1. Store currency rates with standard ISO codes (VND, USD, EUR).
2. Schedule rate update daily from a free currency API.
[FORMAT OUTPUT] Database DDL and rate conversion Java class.
```

#### 4.2. Kết quả AI gợi ý

```text
AI đề xuất thiết kế bảng `exchange_rates` và viết scheduler gọi API OpenExchangeRates để cập nhật tỷ giá hàng ngày.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã áp dụng cấu trúc bảng này vào database của dự án.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã thiết lập lưu trữ tỷ giá trong Redis Cache để tránh thực hiện query database trên mỗi lượt render giá tiền khóa học ở client.
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
Sử dụng cache tỷ giá ngoại tệ giúp API tải trang học viên chạy cực kỳ mượt mà.
```

---

### Lần sử dụng AI số 90

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tự động phân bổ doanh thu (Revenue Split) cho các khóa học đồng giảng dạy |
| Phân việc liên quan | Backend / Financial |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Financial Developer.
[CONTEXT] A course can have primary and secondary instructors. When a sale occurs, platform takes 30%. The remaining 70% is split among instructors based on predefined shares (e.g. 60/40).
[TASK] Implement the automatic revenue split logic after checkout completion.
[CONSTRAINTS]
1. Read split ratios from database table `course_instructors`.
2. Credit each instructor's wallet in a single database transaction.
[FORMAT OUTPUT] Java service method for split processing.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp thuật toán bóc tách hóa đơn, tính toán phần trăm hoa hồng nền tảng và nạp ví cho các giảng viên theo đúng tỷ lệ phần chia.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã viết logic này vào API xử lý nạp tiền mua khóa học.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã bổ sung thêm bảng ghi nhật ký chi tiết doanh thu (Platform Revenue Shares Log) để phục vụ báo cáo kế toán cuối tháng.
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
Xử lý số dư ví giảng viên bắt buộc phải sử dụng khóa bi quan (pessimistic lock) dòng ví của họ để bảo đảm độ chính xác tài chính.
```

---

### Lần sử dụng AI số 91

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Xây dựng cơ chế đăng ký và tự động gia hạn thành viên Premium (Subscriptions model) |
| Phân việc liên quan | Design / Backend |
| Mức độ sử dụng | Hỗ trợ thiết kế |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Subscription Billing Engineer.
[CONTEXT] Users can buy Premium membership for 1 month or 1 year to access premium courses and unlimited practice attempts.
[TASK] Design subscription database tables and a Spring Boot daily billing checker.
[CONSTRAINTS]
1. Table to store user subscriptions, start date, end date, active status.
2. A daily cron job must scan for expired subscriptions and flip status to expired, notifying the user.
[FORMAT OUTPUT] DDL SQL statements and Spring Scheduler Java code.
```

#### 4.2. Kết quả AI gợi ý

```text
AI gợi ý thiết kế bảng `user_subscriptions` và class cron job chạy lúc 1h sáng để quét và tự động chuyển đổi trạng thái `active = false` của các gói hết hạn.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã xây dựng mô hình database và scheduler theo đúng gợi ý.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã viết thêm tính năng gửi email nhắc nhở tự động trước 3 ngày trước khi gói thành viên hết hạn gia hạn.
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
Luôn gửi cảnh báo hết hạn sớm để người dùng có thời gian chủ động nạp thêm tiền hoặc hủy dịch vụ.
```

---

### Lần sử dụng AI số 92

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết lập tác vụ tự động sao lưu Cơ sở dữ liệu (Automated DB Backup) lên AWS S3 |
| Phân việc liên quan | DevOps / Maintenance |
| Mức độ sử dụng | Sinh script |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Database Administrator.
[CONTEXT] We need a daily automated backup of our production PostgreSQL database to prevent data loss in case of hardware failure.
[TASK] Write a bash script to perform pg_dump, compress it with gzip, upload to AWS S3, and clean local temp backups.
[CONSTRAINTS]
1. Automate using crontab on Linux VPS.
2. Backups on S3 older than 60 days must be deleted automatically (S3 Lifecycle policies or script check).
[FORMAT OUTPUT] Complete Bash script code.
```

#### 4.2. Kết quả AI gợi ý

```text
AI sinh ra một đoạn script shell bash sử dụng lệnh `pg_dump`, nén bằng tar.gz và gọi lệnh `aws s3 cp` để đồng bộ lên bucket đám mây.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã cài đặt script này vào Cron của hệ thống VPS Ubuntu.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi cấu hình thêm lệnh ping thông báo trạng thái sao lưu thành công (hoặc thất bại) gửi thẳng về kênh chat của nhóm qua Discord Webhook.
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
Giám sát sao lưu tự động là bước bắt buộc để chắc chắn hệ thống backup luôn hoạt động ổn định.
```

---

### Lần sử dụng AI số 93

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Cấu hình tắt ứng dụng an toàn (Graceful Shutdown) cho Spring Boot backend để tránh rớt request đang xử lý |
| Phân việc liên quan | Backend / DevOps |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as an Infrastructure Architect.
[CONTEXT] When we deploy new codes, the CI/CD pipeline restarts the Spring Boot backend. Uncompleted API requests or code running operations are cut off, causing errors for users.
[TASK] Configure Graceful Shutdown in Spring Boot.
[CONSTRAINTS]
1. Set server shutdown mode to graceful.
2. Configure dynamic thread pool execution settings to allow pending task completion.
[FORMAT OUTPUT] Configuration properties and explanation of shutdown sequence.
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn thêm cấu hình `server.shutdown: graceful` và `spring.lifecycle.timeout-per-shutdown-phase: 30s` vào file `application.yaml` để chờ tối đa 30 giây cho các request cũ xử lý xong.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa cấu hình tắt graceful này vào tệp cấu hình chính của backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tinh chỉnh thêm cấu hình kết nối pool cơ sở dữ liệu Hikari để ngắt kết nối an toàn sau khi các transaction đang dở hoàn tất.
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
Graceful shutdown giúp hệ thống đạt độ khả dụng cao (high availability) không gián đoạn dịch vụ lúc bảo trì.
```

---

### Lần sử dụng AI số 94

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết lập cấu hình Auto-scaling cho Kubernetes Deployment dựa trên chỉ số CPU/Memory |
| Phân việc liên quan | DevOps |
| Mức độ sử dụng | Sinh cấu hình |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Kubernetes Engineer.
[CONTEXT] Our Online Judge system experiences huge spikes during contests. We want to deploy on K8s and scale pods dynamically.
[TASK] Write the HorizontalPodAutoscaler (HPA) yaml configuration file.
[CONSTRAINTS]
1. Set minimum replicas: 2, maximum replicas: 10.
2. Trigger scale-up when average CPU utilization exceeds 75% or Memory usage exceeds 80%.
[FORMAT OUTPUT] Complete YAML configuration snippet.
```

#### 4.2. Kết quả AI gợi ý

```text
AI cung cấp file cấu hình HPA YAML chỉ định mục tiêu Deployment và các metrics CPU/Memory tương ứng.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã lưu file này và triển khai lên cụm server Kubernetes chạy thử.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi cấu hình thêm chỉ số custom metric (số lượng connection queue của RabbitMQ) làm điều kiện scale-up để hệ thống giãn nở trước khi CPU kịp đạt ngưỡng nghẽn.
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
Auto-scaling theo kích thước hàng đợi (Queue-based scaling) là giải pháp tối ưu nhất cho các ứng dụng bất đồng bộ.
```

---

### Lần sử dụng AI số 95

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết lập giải pháp Sao lưu dự phòng và Phục hồi sau thảm họa (Disaster Recovery) |
| Phân việc liên quan | Architecture / DevOps |
| Mức độ sử dụng | Hỗ trợ giải pháp |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Disaster Recovery Planner.
[CONTEXT] If our primary server data center catches fire, we must restore service within 4 hours (RTO = 4h) with max data loss of 1 hour (RPO = 1h).
[TASK] Design a disaster recovery replication strategy for database and files.
[CONSTRAINTS]
1. Use PostgreSQL Streaming Replication to a secondary hot-standby node.
2. Replicate AWS S3 bucket contents across regions.
[FORMAT OUTPUT] Detailed architecture description and failover check list.
```

#### 4.2. Kết quả AI gợi ý

```text
AI thiết kế mô hình Primary-Standby kết hợp công cụ pgPool để tự động phát hiện node chính chết và kích hoạt node phụ lên làm Master (Failover).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa mô hình này vào thiết kế hạ tầng dự án để báo cáo trước hội đồng.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã viết script kiểm tra ping tự động (Heartbeat check) từ một máy chủ thứ ba để cảnh báo trạng thái hoạt động của cụm DB.
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
DR plan giúp doanh nghiệp duy trì liên tục hoạt động kinh doanh ngay cả khi toàn bộ trung tâm dữ liệu chính gặp sự cố.
```

---

### Lần sử dụng AI số 96

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai cơ chế Bật/Tắt tính năng động (Feature Flags / Feature Toggles) |
| Phân việc liên quan | Design / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Release Engineer.
[CONTEXT] We want to test the Plagiarism scanning feature only for a few specific users (Beta testing) before launching to everyone, and be able to disable it instantly if it causes bugs.
[TASK] Design a lightweight Feature Flag database table and verification utility service in Spring Boot.
[CONSTRAINTS]
1. Cache active flags in Redis to avoid database queries on every API request.
2. Support flag evaluation by User ID or Role.
[FORMAT OUTPUT] SQL schema and Java FeatureToggleService class.
```

#### 4.2. Kết quả AI gợi ý

```text
AI thiết kế bảng `feature_flags` và viết service kiểm tra trạng thái flag theo UserId kết hợp Redis để truy vấn nhanh.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã áp dụng lớp `FeatureToggleService` để bao bọc các tính năng mới.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi tự viết thêm một trang quản trị Admin UI đơn giản có các nút switch bật/tắt trực quan để thay đổi giá trị flag trong DB nhanh chóng.
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
Feature flags cho phép tách biệt giữa công đoạn Deploy code và công đoạn Release tính năng đến người dùng.
```

---

### Lần sử dụng AI số 97

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Tự động hóa kiểm tra lỗi bảo mật thư viện (OWASP Dependency Check) |
| Phân việc liên quan | DevOps / Security |
| Mức độ sử dụng | Hướng dẫn cấu hình |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a DevSecOps Engineer.
[CONTEXT] Java applications often use libraries with known vulnerabilities (CVEs). We want to scan our `pom.xml` automatically during local Maven builds.
[TASK] Configure the OWASP Dependency-Check plugin in Maven.
[CONSTRAINTS]
1. Set the build to fail if a vulnerability with a CVSS score higher than 7.0 is found.
2. Exclude false positives using a suppression XML file.
[FORMAT OUTPUT] Maven pom.xml plugin configuration block.
```

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn thêm plugin `dependency-check-maven` vào file `pom.xml` của dự án và cấu hình thuộc tính `failBuildOnCVSS`.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã cấu hình plugin này vào file pom.xml gốc của backend.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tích hợp plugin này chạy trực tiếp trong quy trình build tự động của GitHub Actions để chặn các commit có thư viện dính mã độc.
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
Rà soát thư viện thường xuyên là yêu cầu bắt buộc của các dự án phần mềm chuyên nghiệp để phòng chống hack hệ thống.
```

---

### Lần sử dụng AI số 98

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế Hệ thống Quét và Phân loại Tag tự động cho Bài tập Lập trình bằng AI |
| Phân việc liên quan | AI / Backend |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as an AI Curriculum Specialist.
[CONTEXT] When instructors create a coding problem, they might not assign tags properly. We want to auto-categorize it using Gemini.
[TASK] Create a system prompt that takes problem description, sample inputs, and code solutions to generate tags (e.g. Dynamic Programming, Graph) and difficulty rating.
[CONSTRAINTS]
1. Output must be strictly valid JSON schema.
2. Limit difficulty to values: EASY, MEDIUM, HARD.
[FORMAT OUTPUT] System prompt and request handler integration code.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết prompt hướng dẫn Gemini đọc cấu trúc đề bài để phân loại thẻ học tập và độ khó thuật toán chính xác dựa trên độ phức tạp O(N).
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa logic này vào tính năng hỗ trợ soạn đề bài của giảng viên.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tinh chỉnh thêm logic: hiển thị gợi ý tag của AI ra để giảng viên rà soát lại trước khi bấm xác nhận lưu vào DB.
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
Cho phép con người review lại kết quả gợi ý của AI trước khi ghi đè vào DB là phương thức thiết kế AI kết hợp (Human-in-the-loop) tốt nhất.
```

---

### Lần sử dụng AI số 99

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Triển khai cơ chế nén ảnh tự động trước khi lưu trữ để tối ưu hóa băng thông tải trang |
| Phân việc liên quan | Backend / Optimization |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

```text
[ROLE] Act as a Media Optimization Expert.
[CONTEXT] Users upload 5MB PNG files for profiles or course banner cards, slowing down mobile network loading and wasting S3 space.
[TASK] Write Java code to resize uploaded image files to max width 1200px and compress them to WebP format with quality 75%.
[CONSTRAINTS]
1. Preserve original aspect ratio during resizing.
2. Return byte array for direct cloud upload.
[FORMAT OUTPUT] Java helper class using Java ImageIO or specialized library.
```

#### 4.2. Kết quả AI gợi ý

```text
AI viết một Image Utility sử dụng `BufferedImage` để chuyển đổi định dạng PNG/JPG sang WebP có độ nén cao mà không vỡ hình.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã đưa logic nén ảnh này vào lớp xử lý file tải lên.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã cấu hình chạy tác vụ nén ảnh bất đồng bộ ở background thread để người dùng không phải chờ lâu lúc nhấn tải ảnh.
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
Định dạng ảnh WebP nén tốt hơn JPG 30% và PNG 80% mà chất lượng hình ảnh hầu như không thay đổi bằng mắt thường.
```

---

### Lần sử dụng AI số 100

| Nội dung | Thông tin |
|---|---|
| Ngày sử dụng | 2026-06-29 |
| Công cụ AI | Antigravity |
| Mục đích sử dụng | Thiết kế Hệ thống Cảnh báo Lỗi Hệ thống chủ động (Proactive Error Alerting) |
| Phân việc liên quan | DevOps / Reliability |
| Mức độ sử dụng | Sinh code mẫu |

#### 4.1. Prompt đã sử dụng

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

#### 4.2. Kết quả AI gợi ý

```text
AI hướng dẫn viết `@RestControllerAdvice` kết hợp thư viện RestTemplate để gửi POST request chứa payload embed Message đến Discord Webhook channel.
```

#### 4.3. Phần sinh viên/nhóm đã sử dụng từ AI

```text
Tôi đã triển khai hệ thống cảnh báo lỗi này vào mã nguồn backend chính thức.
```

#### 4.4. Phần sinh viên/nhóm tự chỉnh sửa hoặc cải tiến

```text
Tôi đã tích hợp thêm cơ chế lọc bỏ các lỗi người dùng thông thường (như lỗi nhập sai mật khẩu 401, dữ liệu trống 400) để kênh chat Discord không bị trôi tin nhắn.
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
Hệ thống cảnh báo lỗi tự động giúp đội ngũ phát triển phát hiện và vá lỗi trên production trước khi người dùng kịp gửi ticket phàn nàn.
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
