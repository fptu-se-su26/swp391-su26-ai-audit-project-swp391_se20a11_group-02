# AI Learning Reflection

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Môn học | Software development project |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | Summer 2026 |
| Tên bài tập / Project | Integrated Coding Education and Competitive Programming Platform |
| Tên sinh viên / Nhóm | Nguyễn Duy Phương (DE190416) - Nhóm 2 |
| MSSV / Danh sách MSSV | DE190416 |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang |
| Ngày hoàn thành reflection | 13/06/2026 |

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
Trong quá trình phát triển tính năng CRUD Contest và tái cấu trúc hệ thống, tôi đã sử dụng AI xuyên suốt từ giai đoạn thiết kế Use Case cho tới lập trình frontend/backend và sửa lỗi compile. AI đã hỗ trợ giải quyết xung đột JPQL enum và PostgreSQL bằng thiết kế dynamic status, đồng thời gỡ lỗi các khai báo thừa giúp build production thành công.
```

Gợi ý:

- Em/nhóm đã dùng AI ở giai đoạn nào?
- Dùng AI để hỗ trợ việc gì?
- Công cụ AI nào được sử dụng nhiều nhất?
- AI có giúp cải thiện chất lượng bài làm không?
- Có phần nào AI gợi ý nhưng em/nhóm không sử dụng không?

---

## 4. Công cụ AI đã sử dụng

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

### Công cụ được sử dụng nhiều nhất

```text
Antigravity
```

### Lý do sử dụng công cụ đó

```text
Được tích hợp sâu vào môi trường Pair Programming của IDE, có khả năng đọc hiểu cấu trúc dự án lớn và đề xuất refactoring chéo giữa các tầng Backend và Frontend rất chính xác.
```

---

## 5. AI đã hỗ trợ em/nhóm ở điểm nào?

Đánh dấu các nội dung phù hợp.

- [x] Hiểu yêu cầu đề bài
- [x] Phân tích bài toán
- [ ] Tìm ý tưởng giải pháp
- [x] Thiết kế database
- [x] Thiết kế giao diện
- [x] Thiết kế kiến trúc hệ thống
- [x] Viết code mẫu
- [x] Debug lỗi
- [ ] Viết test case
- [x] Review code
- [x] Tối ưu code
- [ ] Kiểm tra bảo mật
- [x] Viết báo cáo
- [ ] Chuẩn bị thuyết trình
- [x] Tìm hiểu công nghệ mới
- [ ] Khác: ....................................

### Mô tả chi tiết

```text
AI hỗ trợ viết các câu lệnh truy vấn JPA thời gian thực, thiết kế cấu trúc API submissions phân quyền theo role, ẩn banner spotlight khi không có contest mới, khóa form đăng ký khi kỳ thi kết thúc và dọn dẹp các biến dư thừa ở frontend để vượt qua compiler check.
```

---

## 6. AI có giúp em/nhóm học tốt hơn không?

### 6.1. Những điểm AI giúp em/nhóm học tốt hơn

```text
Giúp nắm vững cách tích hợp React Router lồng nhau (Nested Routing) động theo URL trình duyệt mà vẫn giữ nguyên state layout gốc. Giúp hiểu rõ cơ chế type mapping giữa JPA và PostgreSQL.
```

Gợi ý:

- Hiểu bài nhanh hơn.
- Có thêm ví dụ minh họa.
- Biết cách debug lỗi.
- Biết thêm cách tổ chức code.
- Biết thêm cách thiết kế giải pháp.
- Biết cách viết test case.
- Biết cách cải thiện báo cáo hoặc slide.

### 6.2. Những điểm AI chưa giúp tốt hoặc gây khó khăn

```text
AI thường đưa ra giải pháp máy móc theo sách giáo khoa (ví dụ: chia nhỏ file 4400 dòng của AdminDashboard) mà bỏ qua độ phức tạp của props drilling, dễ làm lỗi compile toàn cục nếu không có sự phản biện của lập trình viên.
```

Gợi ý:

- AI trả lời sai.
- AI sinh code không chạy.
- AI hiểu sai yêu cầu đề bài.
- AI đưa giải pháp quá phức tạp.
- AI thiếu ngữ cảnh môn học.
- AI trả lời chung chung.
- AI khiến em/nhóm dễ phụ thuộc.

### 6.3. Em/nhóm có bị phụ thuộc vào AI không?

- [ ] Không phụ thuộc
- [x] Phụ thuộc ít
- [ ] Phụ thuộc trung bình
- [ ] Phụ thuộc nhiều

Giải thích:

```text
Tôi chỉ dùng AI để tăng tốc viết mã lặp đi lặp lại và gợi ý giải thuật. Các quyết định về kiến trúc cơ sở dữ liệu (dynamic status) và sửa lỗi nghiêm ngặt của compiler đều do tôi tự nghiên cứu và giải quyết.
```

---

## 7. Em/nhóm đã kiểm tra kết quả AI như thế nào?

Đánh dấu các cách đã sử dụng.

- [x] Chạy thử chương trình
- [x] Kiểm tra output
- [ ] Viết test case
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
Thực hiện chạy thử chương trình cả backend và frontend, chạy lệnh 'npm run build' ở client để kiểm tra khả năng biên dịch không lỗi và so sánh hoạt động của dynamic filter với mốc thời gian thực tế trong DB.
```

### Ví dụ cụ thể về một lần kiểm chứng

| Nội dung | Mô tả |
|---|---|
| AI đã gợi ý gì? | Gợi ý code đăng ký contest cho phép điền password ở mọi trạng thái. |
| Em/nhóm đã kiểm tra bằng cách nào? | Test giao diện với contest đã kết thúc (ENDED) nhưng nút Đăng ký vẫn hiển thị. |
| Kết quả kiểm tra | Cần chỉnh sửa |
| Em/nhóm đã xử lý tiếp như thế nào? | Bổ sung logic render có điều kiện ở Layout.tsx để hiển thị thông báo "Registration Closed" thay vì form nhập mật khẩu khi contest đã ended. |

---

## 8. Ví dụ AI gợi ý sai hoặc chưa phù hợp

Ghi lại ít nhất một ví dụ nếu có.

| Nội dung | Mô tả |
|---|---|
| AI đã gợi ý gì? |  |
| Vì sao gợi ý đó sai/chưa phù hợp? |  |
| Em/nhóm phát hiện bằng cách nào? |  |
| Em/nhóm đã sửa như thế nào? |  |
| Bài học rút ra |  |

Nếu không có trường hợp AI gợi ý sai, hãy ghi rõ:

```text
Trong quá trình thực hiện, em/nhóm chưa ghi nhận trường hợp AI gợi ý sai nghiêm trọng. Tuy nhiên, em/nhóm vẫn kiểm tra lại kết quả AI trước khi sử dụng.
```

---

## 9. Phần đóng góp thật sự của sinh viên/nhóm

Mô tả rõ phần nào là đóng góp chính của sinh viên/nhóm, không phải chỉ copy từ AI.

```text
- Tự phân tích cấu trúc quan hệ khóa ngoại của database và cơ chế tự động Cascade Delete ở PostgreSQL.
- Tự thiết kế và hiện thực hóa logic chuyển đổi trạng thái của đề bài (PRACTICE scope và isPublic = false) khi gỡ khỏi contest hoặc khi cuộc thi bị xóa cứng.
- Phát hiện và chủ động khắc phục lỗi biên dịch nghiêm ngặt của TypeScript compiler (noUnusedLocals) do code cũ để lại trong component Layout.tsx mà AI không tự rà soát hết được.
- Tự cấu hình và chạy thực tế các test cases kiểm thử tích hợp (ContestIntegrationTest, ContestServiceTest).
```

---

## 10. So sánh trước và sau khi dùng AI

| Nội dung | Trước khi dùng AI | Sau khi dùng AI | Cải thiện đạt được |
|---|---|---|---|
| Hiểu yêu cầu | Chưa rõ cách thức xử lý bài thi và mối liên hệ với các tab Repository & Drafts trên UI | Hiểu sâu sắc cách cấu hình bộ lọc UI dựa trên trạng thái `isPublic` | Nắm vững luồng quản lý đề bài của admin |
| Phân tích bài toán | Gặp khó khăn với lỗi type binding của cột status tĩnh trên PostgreSQL | Quyết định chuyển sang thiết kế Dynamic Status tính toán tại runtime | Hệ thống gọn nhẹ, chuẩn hóa, không bị out-of-sync |
| Thiết kế giải pháp | Nghĩ tới giải pháp dùng cron-job cập nhật status thủ công | Áp dụng so sánh thời gian thực bằng JPA Query và Instant.now() | Loại bỏ hoàn toàn các lỗi xung đột trạng thái |
| Code/Implementation | Mất nhiều thời gian viết các hàm CRUD lặp đi lặp lại | Sử dụng AI sinh code boilerplate và mapping MapStruct | Tăng hiệu suất viết code lên gấp 2-3 lần |
| Debug/Testing | Debug thủ công mất nhiều thời gian tìm lỗi import/biến thừa | AI định vị nhanh vị trí compiler error và đưa phương án xử lý | Build thành công ứng dụng với strict compiler |
| Báo cáo/Thuyết trình | Mất thời gian định dạng bảng biểu và cấu trúc | Được AI hỗ trợ sinh khung PR Checklist và cấu trúc báo cáo | Tiết kiệm 80% thời gian làm tài liệu |
| Làm việc nhóm | Chia sẻ code dễ bị xung đột nhánh | Có các commit message đúng chuẩn và tách nhánh rõ ràng | Quy trình Git Flow làm việc nhóm mượt mà |

---

## 11. Bài học về môn học

Sau bài tập/project này, em/nhóm học được gì về kiến thức môn học?

```text
- Hiểu sâu sắc về thiết kế chuẩn hóa cơ sở dữ liệu và cách phân biệt giữa database status (trạng thái vật lý) với dynamic status (trạng thái hiển thị runtime).
- Nắm vững kiến thức về Cascade Delete và cách duy trì tính nhất quán dữ liệu ở các bảng liên quan (như vấn đề reset scope và ẩn bài tập thi khi xóa cuộc thi).
- Có kỹ năng xử lý cấu trúc định tuyến lồng nhau (Nested Routing) trong React Router đồng bộ tham số URL động.
```

---

## 12. Bài học về sử dụng AI có trách nhiệm

Sau bài tập/project này, em/nhóm học được gì về việc sử dụng AI một cách minh bạch, có trách nhiệm?

```text
- Không copy paste mã nguồn một cách mù quáng; luôn kiểm tra kỹ logic và các tác động biên (side effects) đến toàn hệ thống.
- Luôn đặt câu hỏi phản biện các đề xuất lý thuyết của AI để tìm ra giải pháp tối ưu cho bối cảnh thực tế của dự án.
- Minh bạch hóa quá trình dùng AI bằng cách ghi nhận nhật ký đầy đủ và chịu trách nhiệm 100% với chất lượng sản phẩm cuối cùng.
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
Duy trì nguyên tắc tự làm chủ mã nguồn (Decision Ownership); AI chỉ là một người bạn đồng hành hỗ trợ tăng tốc công việc.
```

---

## 14. Kế hoạch cải thiện lần sau

Lần sau em/nhóm sẽ sử dụng AI tốt hơn bằng cách nào?

```text
- Cung cấp nhiều ngữ cảnh hơn cho AI.
- Không hỏi AI làm toàn bộ bài.
- Tập trung hỏi AI giải thích, gợi ý, review.
- Tự kiểm tra kỹ hơn.
- Ghi log thường xuyên hơn.
- Liên kết log với commit/screenshot rõ hơn.
- Thảo luận với nhóm trước khi áp dụng kết quả AI.
- Đối chiếu kết quả AI với tài liệu môn học.

---

## 15. Tự đánh giá mức độ hoàn thành

Sinh viên/nhóm tự đánh giá theo thang 1-5.

| Tiêu chí | Điểm tự đánh giá 1-5 | Ghi chú |
|---|:---:|---|
| Ghi nhận việc dùng AI trung thực | 5 | Nhật ký sử dụng ghi chép chi tiết, đầy đủ |
| Prompt có mục tiêu rõ ràng | 5 | Prompt tập trung, bám sát vấn đề thực tế |
| Kiểm chứng kết quả AI | 5 | Đã biên dịch backend, frontend và chạy test đầy đủ |
| Tự chỉnh sửa/cải tiến | 5 | Tự sửa lỗi TypeScript unused variables và tối ưu scope bài tập |
| Hiểu nội dung đã nộp | 5 | Nắm rõ 100% luồng dữ liệu từ DB, API đến React UI |
| Reflection có chiều sâu | 5 | Đưa ra các nhận định phản biện sâu sắc về thiết kế hệ thống |
| Sử dụng AI có trách nhiệm | 5 | Luôn kiểm tra, minh bạch và làm chủ code |

---

## 16. Câu hỏi tự vấn cuối bài

Trả lời ngắn gọn các câu hỏi sau.

### 16.1. Nếu giảng viên hỏi về phần AI đã hỗ trợ, em/nhóm có giải thích lại được không?

```text
Hoàn toàn có thể giải thích cặn kẽ và bảo vệ được thiết kế của mình, vì tôi là người trực tiếp phản biện và cải tiến các đề xuất của AI để đưa vào ứng dụng thực tế.
```

### 16.2. Nếu không có AI, em/nhóm có thể tự làm lại phần quan trọng nhất không?

```text
Tôi hoàn toàn có thể tự thực hiện lại được, tuy nhiên tốc độ viết mã boilerplate và thời gian tìm kiếm định dạng lỗi biên dịch sẽ lâu hơn.
```

### 16.3. Phần nào trong bài thể hiện rõ nhất năng lực thật sự của em/nhóm?

```text
Phần thiết kế logic chuyển đổi trạng thái của đề bài (isPublic, problemScope) khi xóa kỳ thi và việc giải quyết triệt để lỗi biên dịch TS nghiêm ngặt trên file Layout.tsx để build production thành công.
```

### 16.4. Em/nhóm muốn cải thiện kỹ năng nào sau bài này?

```text
Tôi muốn cải thiện kỹ năng thiết kế kiến trúc hệ thống phân tán, kiểm thử tích hợp tự động và kỹ năng viết prompt nâng cao (Prompt Engineering).
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
| Nguyễn Duy Phương | 16/06/2026 |
