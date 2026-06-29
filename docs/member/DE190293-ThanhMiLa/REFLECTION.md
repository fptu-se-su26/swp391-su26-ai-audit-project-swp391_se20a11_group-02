# AI Learning Reflection

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Môn học | Software Development Project |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | SUMMER 2026 |
| Tên bài tập / Project | Integrated Coding Education & Competitive Programming Platform |
| Tên sinh viên / Nhóm | Võ Ngọc Thanh (DE190293) - Nhóm 2 |
| MSSV / Danh sách MSSV | DE190293 |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang |
| Ngày hoàn thành reflection | 29/06/2026 |

---

## 2. Mục đích Reflection

File này dùng để sinh viên/nhóm tự đánh giá quá trình sử dụng AI trong học tập và thực hiện bài tập, lab, assignment hoặc project.

Reflection cần thể hiện:

- AI đã hỗ trợ gì trong quá trình học.
- Sinh viên/nhóm đã kiểm chứng kết quả AI như thế nào.
- Sinh viên/nhóm đã tự chỉnh sửa, cải tiến ra sao.
- Sinh viên/nhóm học được gì về môn học.
- Sinh viên/nhóm học được gì về cách sử dụng AI minh bạch và có trách nhiệm.

---

## 3. Tóm tắt quá trình sử dụng AI

Mô tả ngắn gọn quá trình sử dụng AI trong bài tập/project này.

```text
Trong suốt quá trình triển khai dự án Coding Platform, tôi đã tích cực sử dụng công cụ AI (Antigravity) làm người bạn đồng hành trong các khâu: đặc tả nghiệp vụ SRS (gộp Use Cases tinh gọn, lập danh sách 79 màn hình độc nhất), thiết kế cơ sở dữ liệu (tư vấn ERD, 55 Business Rules, 100 câu thông điệp ứng dụng tiếng Anh), lập trình Spring Boot backend kết nối với PayOS và Judge0 API, và sửa các lỗi compiler/database connection. AI đóng vai trò như một tư vấn viên hỗ trợ tăng tốc viết code boilerplate và cung cấp các giải pháp tối ưu hóa cấu hình.
```

---

## 4. Công cụ AI đã sử dụng

Đánh dấu các công cụ AI đã sử dụng.

- [ ] ChatGPT
- [x] Gemini
- [ ] Claude
- [x] GitHub Copilot
- [ ] Cursor
- [x] Antigravity
- [ ] Microsoft Copilot
- [ ] Perplexity
- [ ] Công cụ khác: ....................................

### Công cụ được sử dụng nhiều nhất

```text
Antigravity
```

### Lý do sử dụng công cụ đó

```text
Được tích hợp sâu vào môi trường phát triển của dự án, hỗ trợ đọc hiểu codebase Java Spring Boot/React hiện tại một cách toàn diện và tự động thực thi các tác vụ sửa đổi tài liệu kỹ thuật nhanh chóng, chính xác.
```

---

## 5. AI đã hỗ trợ em/nhóm ở điểm nào?

Đánh dấu các nội dung phù hợp.

- [x] Hiểu yêu cầu đề bài
- [x] Phân tích bài toán
- [x] Tìm ý tưởng giải pháp
- [x] Thiết kế database
- [x] Thiết kế giao diện
- [x] Thiết kế kiến trúc hệ thống
- [x] Viết code mẫu
- [x] Debug lỗi
- [x] Viết test case
- [x] Review code
- [x] Tối ưu code
- [x] Kiểm tra bảo mật
- [x] Viết báo cáo
- [ ] Chuẩn bị thuyết trình
- [x] Tìm hiểu công nghệ mới
- [ ] Khác: ....................................

### Mô tả chi tiết

```text
AI đã hỗ trợ trích xuất 55 quy tắc nghiệp vụ từ codebase, viết script Python tự động lọc trùng 94 màn hình ban đầu còn 79 unique screens, thiết kế cấu trúc 100 thông điệp báo lỗi (MSG01 - MSG100) bằng tiếng Anh chuẩn xác, đề xuất cấu trúc Common Requirements (phân trang Spring Pageable, ISO ngày giờ, Success/Error JSON envelopes), và sửa lỗi crash khởi động backend do thiếu DataSource bằng cách hướng dẫn nạp profile dev.
```

---

## 6. AI có giúp em/nhóm học tốt hơn không?

### 6.1. Những điểm AI giúp em/nhóm học tốt hơn

```text
1. Hiểu sâu sắc về thiết kế API RESTful: Biết cách bao bọc dữ liệu trả về qua một phong bì JSON chuẩn hóa (Success/Error Envelopes) để frontend dễ xử lý.
2. Nắm vững cơ chế bảo mật cổng thanh toán: Biết cách tính toán chữ ký số HMAC SHA256 để kiểm tra tính hợp lệ của Webhook từ payOS.
3. Kỹ năng gỡ lỗi hệ thống tốt hơn: Hiểu rõ cơ chế Auto-configuration của Spring Boot và cách nạp các file properties động.
```

### 6.2. Những điểm AI chưa giúp tốt hoặc gây khó khăn

```text
1. Hiển thị toán học LaTeX trong bảng Markdown: AI thường cố sử dụng ký hiệu khối toán học ($$) làm vỡ layout của bảng Markdown khi hiển thị trên các công cụ đọc thông dụng.
2. Code đôi khi quá rườm rà: AI có xu hướng viết các hàm check rườm rà ở tầng Java thay vì tận dụng tối đa các chỉ mục (indexes) hoặc ràng buộc (constraints) ở tầng Database PostgreSQL.
```

### 6.3. Em/nhóm có bị phụ thuộc vào AI không?

- [ ] Không phụ thuộc
- [x] Phụ thuộc ít
- [ ] Phụ thuộc trung bình
- [ ] Phụ thuộc nhiều

Giải thích:

```text
Tôi chỉ sử dụng AI như một trợ lý viết code mẫu nhanh (boilerplate) và tư vấn thiết kế. Toàn bộ các quyết định kiểm thử, refactor cấu trúc dữ liệu, căn chỉnh hiển thị bảng biểu và triển khai nghiệp vụ cuối cùng đều do tôi tự đưa ra quyết định và chỉnh sửa.
```

---

## 7. Em/nhóm đã kiểm tra kết quả AI như thế nào?

Đánh dấu các cách đã sử dụng.

- [x] Chạy thử chương trình
- [x] Kiểm tra output
- [x] Viết test case
- [x] So sánh với yêu cầu đề bài
- [x] Đối chiếu với tài liệu môn học
- [x] Review code
- [ ] Hỏi lại giảng viên
- [x] Tra cứu tài liệu chính thống
- [x] Thảo luận với thành viên nhóm
- [x] Kiểm tra bằng dữ liệu mẫu
- [x] So sánh trước và sau khi dùng AI
- [ ] Khác: ....................................

### Mô tả quá trình kiểm chứng

```text
Tôi chạy thử ứng dụng backend Spring Boot trên localhost:8080, sử dụng Postman gửi request kiểm tra cấu trúc JSON API phân trang có khớp với Common Requirements không. Tôi cũng chạy script Python lọc trùng màn hình ở local để đối soát số lượng màn hình hiển thị trong báo cáo.
```

### Ví dụ cụ thể về một lần kiểm chứng

| Nội dung | Mô tả |
|---|---|
| AI đã gợi ý gì? | Gợi ý dùng công thức tính điểm ICPC dạng LaTeX khối ($$) trong ô bảng Markdown. |
| Em/nhóm đã kiểm tra bằng cách nào? | Xem hiển thị file trên trình đọc Markdown của VS Code và GitHub thấy bảng bị vỡ layout, chữ bị tràn lề. |
| Kết quả kiểm tra | Cần chỉnh sửa định dạng |
| Em/nhóm đã xử lý tiếp như thế nào? | Tự tay sửa đổi công thức toán học về dạng văn bản inline đơn giản và trực quan hơn (Ví dụ: Score = (Correct Answers / Total Questions) * 100). |

---

## 8. Ví dụ AI gợi ý sai hoặc chưa phù hợp

Ghi lại ít nhất một ví dụ nếu có.

| Nội dung | Mô tả |
|---|---|
| AI đã gợi ý gì? | Gợi ý chạy ngrok public toàn bộ cổng HTTP 8080 mà không bật tính năng xác thực webhook. |
| Vì sao gợi ý đó sai/chưa phù hợp? | Thiếu an toàn bảo mật, kẻ xấu có thể đoán được URL ngrok và spam webhook ảo để tự cộng tiền vào ví. |
| Em/nhóm phát hiện bằng cách nào? | Đọc tài liệu bảo mật webhook của payOS và phân tích rủi ro trong group nhóm. |
| Em/nhóm đã sửa như thế nào? | Tự code thêm logic verify signature sử dụng thuật toán HMAC-SHA-256 đối soát chữ ký nhận được từ header của PayOS. |
| Bài học rút ra | Các giải pháp cấu hình nhanh của AI luôn có lỗ hổng bảo mật, bắt buộc phải rà soát và code các lớp bảo mật bảo vệ API. |

---

## 9. Phần đóng góp thật sự của sinh viên/nhóm

Mô tả rõ phần nào là đóng góp chính của sinh viên/nhóm, không phải chỉ copy từ AI.

```text
- Tự tay cấu hình file properties của database PostgreSQL, setup tài khoản và phân quyền kết nối.
- Rà soát mã nguồn Spring Boot của nhóm để tìm ra các hàm in log nhạy cảm (như in DB_PASSWORD và checkTables startup) để loại bỏ hoàn toàn trước khi đẩy code lên GitHub.
- Tự thiết kế và tinh chỉnh danh mục 55 Business Rules sao cho bám sát 100% với logic code Java thực tế (như streak tính toán theo múi giờ local, công thức tính điểm thi đấu và logic ẩn đáp án câu hỏi trắc nghiệm khi chưa nộp bài).
- Viết các test case chạy thử ví điện tử và tích hợp thanh toán.
```

---

## 10. So sánh trước và sau khi dùng AI

| Nội dung | Trước khi dùng AI | Sau khi dùng AI | Cải thiện đạt được |
|---|---|---|---|
| Hiểu yêu cầu | Gặp khó khăn khi phân rã Use Cases do số lượng màn hình thô quá lớn và trùng lặp | Có danh sách 61 Use Cases tinh gọn phân rã rõ ràng và 79 màn hình độc nhất | Tài liệu SRS khoa học, dễ đọc |
| Phân tích bài toán | Chưa hệ thống hóa được các ràng buộc kỹ thuật của ví điện tử, chấm bài và AI kiểm duyệt | Có danh sách 55 Business Rules thực tế làm kim chỉ nam phát triển hệ thống | Logic nghiệp vụ rõ ràng, không mâu thuẫn |
| Thiết kế giải pháp | Thiết kế API rời rạc, mỗi module một chuẩn JSON trả về khác nhau | Thống nhất quy chuẩn API Response Envelope và phân trang Spring Boot | Frontend dễ dàng tích hợp API đồng bộ |
| Code/Implementation | Mất nhiều thời gian viết các lớp DTOs, cấu hình CORS và cấu hình properties | Sử dụng AI sinh code boilerplate nhanh chóng để tập trung code logic cốt lõi | Rút ngắn 50% thời gian code cấu hình |
| Debug/Testing | Mất thời gian mò tìm nguyên nhân crash DataSource lúc khởi động | Định vị được file properties bị load sai profile dev | Tiết kiệm hàng giờ debug môi trường chạy |
| Báo cáo/Thuyết trình | Tốn công soạn các bảng biểu thông điệp ứng dụng và Actor | Nhận được các bảng Markdown được viết bằng tiếng Anh kỹ thuật chuyên nghiệp | Slide và tài liệu SRS chỉn chu |
| Làm việc nhóm | Quy trình tạo nhánh và commit lộn xộn, dễ conflict | Sử dụng alias shell và tuân thủ Git Flow | Code tích hợp trơn tru, lịch sử git sạch |

---

## 11. Bài học về môn học

Sau bài tập/project này, em/nhóm học được gì về kiến thức môn học?

```text
- Nắm vững quy trình thiết kế phần mềm hướng đối tượng, cách lập tài liệu đặc tả SRS chuẩn học thuật của FPT.
- Hiểu rõ cơ chế hoạt động của một hệ thống nộp bài trực tuyến (Online Judge) kết nối API bên thứ ba thông qua HTTP client và WebSocket.
- Biết cách quản lý và thiết lập quy chuẩn an toàn tài chính (nhật ký ví, lock DB) cho ứng dụng thương mại điện tử.
```

---

## 12. Bài học về sử dụng AI có trách nhiệm

Sau bài tập/project này, em/nhóm học được gì về việc sử dụng AI một cách minh bạch, có trách nhiệm?

```text
- Tuyệt đối không giao phó toàn bộ việc viết code cho AI; luôn đóng vai trò là người kiểm tra, phản biện và tối ưu hóa đầu ra của AI.
- Minh bạch hóa việc dùng AI bằng cách ghi nhận nhật ký đầy đủ (100 prompts) và tự chịu trách nhiệm về tính đúng đắn của code nộp.
- Tôn trọng quyền sở hữu trí tuệ, tự tìm hiểu bản chất thuật toán thay vì chỉ sử dụng kết quả sinh tự động để đối phó.
```

---

## 13. Điều em/nhóm sẽ không làm khi sử dụng AI

Đánh dấu các cam kết phù hợp.

- [x] Không dùng AI để làm toàn bộ bài mà không hiểu nội dung.
- [x] Không nộp nguyên văn kết quả AI nếu chưa kiểm tra.
- [x] Không che giấu việc sử dụng AI trong các phần quan trọng.
- [x] Không dùng AI để tạo nội dung sai lệch hoặc gian lận.
- [x] Không dùng AI thay thế hoàn toàn quá trình học.
- [x] Không bỏ qua yêu cầu, rubric hoặc hướng dẫn của giảng viên.

### Giải thích thêm nếu có

```text
Lấy việc nâng cao năng lực tự thân làm gốc rễ; AI chỉ là trợ lý đắc lực hỗ trợ tăng hiệu suất.
```

---

## 14. Kế hoạch cải thiện lần sau

Lần sau em/nhóm sẽ sử dụng AI tốt hơn bằng cách nào?

```text
- Học cách viết các câu prompt nâng cao có cấu trúc rõ ràng (Context, Goal, Constraints, Output format) để nâng cao chất lượng phản hồi của AI.
- Đọc kỹ tài liệu chính thống (official docs) trước khi hỏi AI để dễ dàng phát hiện khi AI đưa ra câu trả lời sai lệch hoặc lỗi thời.
- Ghi nhật ký sử dụng AI song song với quá trình code để tránh việc tổng hợp muộn ở cuối phase.
```

---

## 15. Tự đánh giá mức độ hoàn thành

Sinh viên/nhóm tự đánh giá theo thang 1-5.

| Tiêu chí | Điểm tự đánh giá 1-5 | Ghi chú |
|---|:---:|---|
| Ghi nhận việc dùng AI trung thực | 5 | Đã hoàn thành 100 lần ghi nhật ký chi tiết và minh bạch |
| Prompt có mục tiêu rõ ràng | 5 | Các prompt đều cấu trúc chặt chẽ, đi sâu vào bài toán kỹ thuật |
| Kiểm chứng kết quả AI | 5 | Chạy biên dịch, verify webhook và test API đầy đủ |
| Tự chỉnh sửa/cải tiến | 5 | Sửa công thức bảng biểu, dọn dẹp biến, tăng tính bảo mật webhook |
| Hiểu nội dung đã nộp | 5 | Làm chủ 100% mã nguồn dự án, tự tin giải trình trước giảng viên |
| Reflection có chiều sâu | 5 | Đánh giá khách quan, chi tiết về cả ưu điểm và hạn chế của AI |
| Sử dụng AI có trách nhiệm | 5 | Tuân thủ tuyệt đối các nguyên tắc liêm chính học thuật |

---

## 16. Câu hỏi tự vấn cuối bài

Trả lời ngắn gọn các câu hỏi sau.

### 16.1. Nếu giảng viên hỏi về phần AI đã hỗ trợ, em/nhóm có giải thích lại được không?

```text
Hoàn toàn giải thích và tự tin bảo vệ được. Vì tôi là người trực tiếp kiểm thử, chọn lọc và tích hợp các ý tưởng của AI vào dự án, nắm vững từng dòng code backend/frontend được sinh ra.
```

### 16.2. Nếu không có AI, em/nhóm có thể tự làm lại phần quan trọng nhất không?

```text
Tôi hoàn toàn tự code lại được vì đã hiểu rõ luồng đi của dữ liệu và các thư viện tích hợp. Tuy nhiên, thời gian hoàn thành sẽ lâu hơn do phải tự viết nhiều dòng code boilerplate cấu hình.
```

### 16.3. Phần nào trong bài thể hiện rõ nhất năng lực thật sự của em/nhóm?
```text
Phần hiện thực hóa luồng bảo mật đối soát chữ ký PayOS Webhook sử dụng HMAC-SHA-256 và tối ưu hóa connection pool HikariCP thông qua annotation transactional read-only ở backend Spring Boot.
```

### 16.4. Em/nhóm muốn cải thiện kỹ năng nào sau bài này?

```text
Tôi muốn nâng cao kỹ năng tối ưu hóa truy vấn SQL tải cao, tìm hiểu sâu hơn về kiến trúc Microservices và cải thiện tư duy Prompt Engineering nâng cao.
```

---

## 17. Cam kết Reflection

Em/nhóm cam kết rằng nội dung reflection này phản ánh trung thực quá trình sử dụng AI và quá trình học tập trong bài tập/project.

Sinh viên/nhóm hiểu rằng:

- AI là công cụ hỗ trợ học tập, không thay thế hoàn toàn năng lực cá nhân.
- Mọi kết quả AI gợi ý cần được kiểm tra trước khi sử dụng.
- Sinh viên/nhóm chịu trách nhiệm với sản phẩm cuối cùng.
- Sinh viên/nhóm cần giải thích được các phần đã nộp.

| Đại diện sinh viên/nhóm | Ngày xác nhận |
|---|---|
| Võ Ngọc Thanh | 29/06/2026 |
