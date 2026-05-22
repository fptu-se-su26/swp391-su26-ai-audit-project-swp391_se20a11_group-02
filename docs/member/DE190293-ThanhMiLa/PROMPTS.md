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
