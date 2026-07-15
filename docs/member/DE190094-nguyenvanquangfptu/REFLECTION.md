# AI Learning Reflection

## 1. Thông tin chung

| Thông tin | Nội dung |
|---|---|
| Môn học | Software Development Project |
| Mã môn học | SWP391 |
| Lớp | SE20A11 |
| Học kỳ | SUMMER 2026 |
| Tên bài tập / Project | Integrated Coding Education & Competitive Programming Platform |
| Tên sinh viên / Nhóm | Nguyễn Văn Quang (DE190094) - Nhóm 2 |
| MSSV / Danh sách MSSV | DE190094 |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang |
| Ngày hoàn thành reflection | 09/07/2026 |

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
Trong suốt quá trình triển khai dự án, tôi đảm nhiệm các module quan trọng về Quản lý bài tập (Problem), Dashboard Thống kê của Giảng viên (Instructor Revenue) và Quản trị viên (Admin Financial Stats). Tôi đã sử dụng AI (Antigravity) làm trợ thủ đắc lực trong việc tư vấn các chỉ số (metrics) thống kê, tính toán thuật toán biểu đồ SVG, viết code boilerplate cho Testcase Builder và tối ưu hóa truy vấn bằng cách tách nhỏ API nguyên khối (monolithic) và dùng Promise.all để gọi song song. Nhờ AI, hiệu suất làm việc tăng cao, tuy nhiên mọi quyết định kiến trúc và sửa các bug phức tạp về validation đều do tôi tự rà soát.
```

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
- [ ] Công cụ khác: ....................................

### Công cụ được sử dụng nhiều nhất

```text
Antigravity
```

### Lý do sử dụng công cụ đó

```text
Antigravity tích hợp trực tiếp vào môi trường lập trình, có thể đọc và phân tích git history/log rất nhanh. Công cụ giúp tôi tái cấu trúc (refactor) các components lớn và bóc tách monolithic API một cách mượt mà mà không làm hỏng logic cũ.
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
AI đã hỗ trợ tôi thiết kế mô hình cơ sở dữ liệu Problem Versioning. Gợi ý bộ chỉ số (Gross/Net revenue, Payout history, Registration trend). Viết logic tính toán tọa độ điểm (points) cho SVG Line Chart ở phần Instructor Revenue. Đồng thời tư vấn tối ưu hiệu năng (perf) thông qua việc phân rã endpoint tài chính lớn thành các API con và thực thi đồng thời.
```

---

## 6. AI có giúp em/nhóm học tốt hơn không?

### 6.1. Những điểm AI giúp em/nhóm học tốt hơn

```text
1. Kỹ năng tối ưu hóa API: Hiểu sâu hơn về nguyên tắc thiết kế RESTful, tại sao không nên trả về 1 cục JSON quá to. Biết cách áp dụng `Promise.all` trong JavaScript để fetch dữ liệu độc lập.
2. Đồ họa Web: Nhờ AI giải thích, tôi đã hiểu cách tọa độ SVG (paths, points) hoạt động để tự vẽ biểu đồ động mà không cần phụ thuộc thư viện nặng như Chart.js.
```

### 6.2. Những điểm AI chưa giúp tốt hoặc gây khó khăn

```text
1. Lỗi ngữ cảnh khi update State React: Khi thêm testcase, AI sinh code update form làm vô tình kích hoạt việc đổi Problem Scope sang Public. Mất khá nhiều thời gian debug side-effects này.
2. AI đôi khi bỏ qua validate nghiêm ngặt, dẫn đến bug người dùng nộp form thiếu Testcase Limits mà hệ thống vẫn nhận.
```

### 6.3. Em/nhóm có bị phụ thuộc vào AI không?

- [ ] Không phụ thuộc
- [x] Phụ thuộc ít
- [ ] Phụ thuộc trung bình
- [ ] Phụ thuộc nhiều

Giải thích:

```text
Tôi chỉ dùng AI để giải bài toán cụ thể về thuật toán (tính SVG) hoặc sinh code boilerplate. Việc tìm ra và fix các bug hệ thống nghiêm trọng (như lỗi tự đổi scope) hay cấu trúc lại Dashboard là do tư duy lập trình cá nhân.
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

### Mô tả quá trình kiểm chứng

```text
Chạy code trực tiếp trên trình duyệt, mở tab Network trong DevTools để đảm bảo các micro-endpoints load độc lập (waterfall tối ưu hơn). Thử điền form Problem thiếu thông tin để đảm bảo validation (dấu *) hiển thị cảnh báo đúng.
```

### Ví dụ cụ thể về một lần kiểm chứng

| Nội dung | Mô tả |
|---|---|
| AI đã gợi ý gì? | Gọi API thống kê tài chính bằng 1 endpoint khổng lồ (monolithic) chứa tất cả số liệu. |
| Em/nhóm đã kiểm tra bằng cách nào? | Test độ trễ (latency) ở Network tab, trang bị treo 2-3 giây trước khi hiện UI. |
| Kết quả kiểm tra | Cần chỉnh sửa kiến trúc |
| Em/nhóm đã xử lý tiếp như thế nào? | Tự thiết kế lại (refactor), tách ra thành 7 APIs nhỏ (Revenue Summary, Course Breakdown, v.v) và gọi đồng thời. Trang render mượt hơn. |

---

## 8. Ví dụ AI gợi ý sai hoặc chưa phù hợp

| Nội dung | Mô tả |
|---|---|
| AI đã gợi ý gì? | Khi viết logic thêm Testcase, AI cung cấp đoạn code reset object state làm mất đi thuộc tính `isPublic`. |
| Vì sao gợi ý đó sai/chưa phù hợp? | Cập nhật state không bảo toàn dữ liệu cũ, làm thay đổi khả năng hiển thị của Problem một cách ngoài ý muốn (auto-change scope). |
| Em/nhóm phát hiện bằng cách nào? | Lúc test trên UI, thêm testcase xong ra ngoài thấy bài tập Draft tự dưng biến thành Public. |
| Em/nhóm đã sửa như thế nào? | Sử dụng toán tử spread (`...prevState`) cẩn thận hơn để update cục bộ mảng testcases mà không đụng tới `isPublic` / `scope`. |
| Bài học rút ra | Luôn rà soát side-effects (tác dụng phụ) của code do AI sinh ra đối với global/local state trong React. |

---

## 9. Phần đóng góp thật sự của sinh viên/nhóm

Mô tả rõ phần nào là đóng góp chính của sinh viên/nhóm, không phải chỉ copy từ AI.

```text
- Phát hiện và thiết kế giải pháp phân tách API (Decoupled API fetch) thay vì nguyên khối để cải thiện đáng kể UX cho trang Dashboard.
- Tự bổ sung các validation messages cụ thể (chứa dấu * bắt buộc) cho từng field trong Problem Form thay vì báo lỗi chung chung (Generic error).
- Sửa lỗi Acceptance Rate không update sau khi submission được nộp, bằng cách code thêm hàm refetch callback.
```

---

## 10. So sánh trước và sau khi dùng AI

| Nội dung | Trước khi dùng AI | Sau khi dùng AI | Cải thiện đạt được |
|---|---|---|---|
| Hiểu yêu cầu | Không rõ nên đặt các chỉ số nào cho Dashboard doanh thu Giảng viên. | Nhận được gợi ý bộ KPI chuẩn mực ngành EdTech (Gross/Net, Streak, Trend). | UI chuyên nghiệp, mang lại giá trị cao cho User. |
| Code/Implementation | Code logic toán học để vẽ SVG line chart bằng tay rất mất thời gian tính tọa độ. | Có ngay hàm mapping data sang tọa độ (x,y) chuẩn xác. | Rút ngắn 80% thời gian code UI Dashboard. |
| Debug/Testing | Đau đầu khi test rate giới hạn request vì tải nặng. | Áp dụng chia nhỏ API và Promise.all chạy mượt mà. | Performance tăng đáng kể. |
| Báo cáo | Dành nhiều giờ để rà soát Git history để viết changelog/reflection. | AI thu thập log và tự cấu trúc bảng Markdown. | Tiết kiệm thời gian lập tài liệu. |

---

## 11. Bài học về môn học

Sau bài tập/project này, em/nhóm học được gì về kiến thức môn học?

```text
- Tầm quan trọng của việc thiết kế kiến trúc API theo hướng Micro-endpoints khi trang có nhiều UI Widgets độc lập.
- Việc đảm bảo Data Integrity bằng Validation kỹ càng cả Frontend và Backend (ở bài toán Testcase).
- Kỹ năng visualize dữ liệu (Data Visualization) từ thô sang biểu đồ đẹp mắt.
```

---

## 12. Bài học về sử dụng AI có trách nhiệm

Sau bài tập/project này, em/nhóm học được gì về việc sử dụng AI một cách minh bạch, có trách nhiệm?

```text
- Minh bạch: Tôi tự tin ghi nhật ký quá trình dùng AI, vì AI chỉ là công cụ giúp tôi chuyển hóa ý tưởng thành hiện thực nhanh hơn chứ không nghĩ thay tôi về mặt kiến trúc.
- Trách nhiệm: Luôn kiểm thử các góc khuất (edge cases) như thiếu input, side-effects của state thay vì tin mù quáng vào code AI.
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
Chỉ có việc tự mình debug và đưa ra quyết định mới giúp lập trình viên lên tay.
```

---

## 14. Kế hoạch cải thiện lần sau

Lần sau em/nhóm sẽ sử dụng AI tốt hơn bằng cách nào?

```text
- Viết prompt đi kèm context cụ thể về dự án hơn thay vì hỏi chung chung, tránh việc AI sinh code không hợp với style hiện tại.
- Phân tích code AI kĩ hơn về hiệu năng (Big O) trước khi copy/paste.
```

---

## 15. Tự đánh giá mức độ hoàn thành

| Tiêu chí | Điểm tự đánh giá 1-5 | Ghi chú |
|---|:---:|---|
| Ghi nhận việc dùng AI trung thực | 5 | Log rõ ràng về việc vẽ SVG, sinh boilerplate API |
| Prompt có mục tiêu rõ ràng | 5 | Hỏi thẳng vào logic nghiệp vụ tài chính, SVG chart |
| Kiểm chứng kết quả AI | 5 | Tự tin đã tối ưu hóa được kiến trúc API do AI viết ban đầu |
| Tự chỉnh sửa/cải tiến | 5 | Bổ sung hàng loạt form validations, fix bug đổi scope |
| Hiểu nội dung đã nộp | 5 | Hoàn toàn hiểu rõ luồng chạy |
| Reflection có chiều sâu | 5 | Đưa ra ví dụ cụ thể giữa API Monolithic vs Micro-endpoints |
| Sử dụng AI có trách nhiệm | 5 | Giữ đúng nguyên tắc kiểm soát code |

---

## 16. Câu hỏi tự vấn cuối bài

### 16.1. Nếu giảng viên hỏi về phần AI đã hỗ trợ, em/nhóm có giải thích lại được không?

```text
Chắc chắn. Tôi nắm rõ logic tính điểm tọa độ đồ thị SVG và vòng lặp `Promise.all` hoạt động như thế nào.
```

### 16.2. Nếu không có AI, em/nhóm có thể tự làm lại phần quan trọng nhất không?

```text
Có. Tôi có thể sử dụng thư viện Chart.js thay vì tự vẽ SVG nếu không có AI hỗ trợ code thuật toán tọa độ.
```

### 16.3. Phần nào trong bài thể hiện rõ nhất năng lực thật sự của em/nhóm?

```text
Việc thiết kế tách nhỏ cấu trúc monolithic API của trang Dashboard sang micro-endpoints gọi song song (perf optimize) và xử lý lỗi Validation nghiêm ngặt cho Problem.
```

### 16.4. Em/nhóm muốn cải thiện kỹ năng nào sau bài này?

```text
Cải thiện tư duy về thiết kế hệ thống phân tán và tối ưu hóa UI/UX rendering trong React (tránh re-render không cần thiết).
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
| Nguyễn Văn Quang | 09/07/2026 |
