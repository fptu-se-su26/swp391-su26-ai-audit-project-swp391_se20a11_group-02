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
| Tên sinh viên / Nhóm | Nguyễn Văn Quang - Group 2 |
| MSSV / Danh sách MSSV | DE190094 |
| Giảng viên hướng dẫn | Lê Thiện Nhật Quang |
| Repository URL | https://github.com/fptu-se-su26/swp391-su26-ai-audit-project-swp391_se20a11_group-02 |
| Ngày bắt đầu | 2026-05-11 |
| Ngày hoàn thành | 2026-07-09 |

---

## 3. Tổng quan các phiên bản/giai đoạn

| Phiên bản/Giai đoạn | Thời gian | Nội dung chính | Trạng thái |
|---|---|---|---|
| Phase 01 | 11/05/2026 - 15/05/2026 | Khởi tạo project và phân chia công việc | Completed |
| Phase 02 | 15/05/2026 - 25/05/2026 | Phân tích yêu cầu module Problem, Instructor Revenue, Admin Dashboard | Completed |
| Phase 03 | 25/05/2026 - 10/06/2026 | Thiết kế hệ thống (Problem Versioning, API Decoupling) | Completed |
| Phase 04 | 10/06/2026 - 25/06/2026 | Implementation: Phát triển chức năng Problem, Revenue & Admin Stats | Completed |
| Phase 05 | 25/06/2026 - 05/07/2026 | Testing & Debug: Sửa lỗi hiển thị, tối ưu API, fix form validation | Completed |
| Phase 06 | 05/07/2026 - 09/07/2026 | Hoàn thiện báo cáo, nhật ký AI và demo | Completed |

---

# [Phase 01] Khởi tạo project

## Ngày thực hiện

```text
11/05/2026 - 15/05/2026
```

## Đã hoàn thành

- [x] Nhận phân công các module: Problem Management, Instructor Dashboard, Admin Financial Stats.
- [x] Khởi tạo thư mục cá nhân `docs/member/DE190094-nguyenvanquangfptu`.
- [x] Tạo file `AI_AUDIT_LOG.md`, `PROMPTS.md`, `REFLECTION.md`, `CHANGELOG.md`.

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Khởi tạo cấu trúc file nhật ký và changelog | Nguyễn Văn Quang | docs/member/DE190094-nguyenvanquangfptu | Commit log |

## AI có hỗ trợ không?

- [ ] Có
- [x] Không

## Commit/Screenshot minh chứng

```text
Commit: docs: update AI Audit Log
```

## Ghi chú

```text
N/A
```

---

# [Phase 02] Phân tích yêu cầu

## Ngày thực hiện

```text
15/05/2026 - 25/05/2026
```

## Đã hoàn thành

- [x] Phân tích yêu cầu cho module Quản lý bài tập (Problem Management) của Admin.
- [x] Phân tích chỉ số tài chính (Financial Statistics) cho Instructor Dashboard và Admin Dashboard.
- [x] Xác định các biểu đồ cần thiết: Doanh thu theo tháng, Lịch sử bán khóa học, Biểu đồ đăng ký học viên.

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Lập danh sách các chỉ số cần đo lường cho Instructor Revenue | Nguyễn Văn Quang | docs/ |  |
| 2 | Xác định yêu cầu cho Problem Testcase Builder | Nguyễn Văn Quang | docs/ |  |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI tư vấn về các chỉ số (metrics) quan trọng cần có cho một dashboard của giảng viên như: Gross/Net revenue, Registration Trend, Course Breakdown.
```

---

# [Phase 03] Thiết kế hệ thống

## Ngày thực hiện

```text
25/05/2026 - 10/06/2026
```

## Đã hoàn thành

- [x] Thiết kế DB cho Problem Versioning (phiên bản hóa bài tập).
- [x] Thiết kế kiến trúc chia nhỏ API (API Decoupling) cho các bảng thống kê để tải trang nhanh hơn.

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Thiết kế cấu trúc bảng lưu trữ các version của Problem | Nguyễn Văn Quang | ERD | Commit: feat(problem): implement Problem Versioning entities |
| 2 | Thiết kế phân rã (split) monolithic API thành micro-endpoints cho Admin Finance | Nguyễn Văn Quang | API Specs | Commit: refactor(admin-finance): split monolithic financial API... |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI đề xuất phương án "Problem Versioning entities" để lưu lịch sử thay đổi bài tập, và gợi ý việc tách API Monolithic thành nhiều micro-endpoints để sử dụng Promise.all ở Frontend.
```

---

# [Phase 04] Implementation

## Ngày thực hiện

```text
10/06/2026 - 25/06/2026
```

## Đã hoàn thành

- [x] Phát triển Frontend & Backend cho quản lý Problem (Testcase builder, UI form).
- [x] Phát triển toàn diện Instructor Revenue Dashboard (Summary, Sales history, Course Breakdown, Monthly chart).
- [x] Phát triển Admin Financial Dashboard (Dynamic database queries, parallel data fetching).
- [x] Cập nhật giao diện Problem Solve UI.

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Tích hợp DB, xây dựng Testcase Builder và hoàn thiện giao diện Problem | Nguyễn Văn Quang | admin-problems | Commit: feat(admin-problems): implement database integration, testcase builder |
| 2 | Xây dựng Instructor Revenue: Revenue Summary, Sales History, Course Breakdown, Monthly Chart | Nguyễn Văn Quang | instructor-revenue | Commit: feat(instructor-revenue): implement comprehensive instructor revenue dashboard features |
| 3 | Tích hợp biểu đồ SVG tự động tính toán cho Revenue Dashboard | Nguyễn Văn Quang | instructor-dashboard | Commit: feat(instructor-dashboard): integrate database revenue analytics |
| 4 | Phân tách monolithic API và sử dụng Promise.all để tăng tốc độ tải trang Admin Stats | Nguyễn Văn Quang | admin-dashboard | Commit: perf(admin-dashboard): optimize financial stats fetching |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI sinh code boilerplate để fetch dữ liệu bằng Promise.all, hỗ trợ tính toán grid width và mapping điểm (points) cho SVG chart của biểu đồ doanh thu.
```

---

# [Phase 05] Testing & Debug

## Ngày thực hiện

```text
25/06/2026 - 05/07/2026
```

## Đã hoàn thành

- [x] Sửa lỗi tự động thay đổi Scope/Visibility của Problem khi thêm testcase.
- [x] Cập nhật Validation form Admin Problem (bắt lỗi thiếu testcase, limit...).
- [x] Dọn dẹp unused imports (imports rác) ở Dashboard components.

## Danh sách lỗi đã xử lý

| STT | Lỗi phát hiện | Nguyên nhân | Cách xử lý | Trạng thái |
|---:|---|---|---|---|
| 1 | Problem bị đổi scope sang public tự động khi thêm testcase mới | Cấu hình default parameter trong entity bị sai lệch lúc update | Sửa logic cập nhật entity để giữ nguyên `isPublic` state. | Fixed |
| 2 | Lỗi thiếu trường thông tin nhưng form Problem vẫn cho submit | Form validation lỏng lẻo | Thêm dấu * bắt buộc, bổ sung thông báo lỗi cụ thể cho từng trường (Title, Limits...). | Fixed |
| 3 | Tỉ lệ Acceptance Rate không tự cập nhật sau khi nộp bài | Component không refetch lại dữ liệu problem | Sửa đổi logic để gọi lại API refetch thông tin sau mỗi submission. | Fixed |

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Thêm asterisk(*) vào các nhãn bắt buộc, làm rõ thông báo lỗi form Problem | Nguyễn Văn Quang | admin-problem | Commit: feat(admin, problem): enhance problem form validation |
| 2 | Sửa lỗi auto-change problem scope/visibility sang public | Nguyễn Văn Quang | admin-problem | Commit: fix(admin-problem): stop auto-changing problem scope... |
| 3 | Dọn dẹp import rác ở AdminDashboardService | Nguyễn Văn Quang | admin-dashboard | Commit: chore(admin-dashboard): update dashboard components |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI giúp định vị nhanh các lỗi validation, viết các regex kiểm tra và tối ưu cấu trúc hàm AdminDashboardService.
```

---

# [Phase 06] Hoàn thiện báo cáo và demo

## Ngày thực hiện

```text
05/07/2026 - 09/07/2026
```

## Đã hoàn thành

- [x] Hoàn thiện `AI_AUDIT_LOG.md` và `PROMPTS.md`.
- [x] Cập nhật `CHANGELOG.md` cho các commit cá nhân.
- [x] Viết `REFLECTION.md` tự đánh giá quá trình học tập.

## Thay đổi chi tiết

| STT | Nội dung thay đổi | Người thực hiện | File/Module liên quan | Minh chứng |
|---:|---|---|---|---|
| 1 | Viết nội dung AI Audit Log và Prompts | Nguyễn Văn Quang | docs/ | Commit: Update AI_Audit_Log and Prompts |
| 2 | Rewrite lại CHANGELOG.md và REFLECTION.md dựa trên commit thật | Nguyễn Văn Quang | docs/ |  |

## AI có hỗ trợ không?

- [x] Có
- [ ] Không

Nếu có, mô tả AI đã hỗ trợ phần nào:

```text
AI hỗ trợ định dạng lại file Markdown, rà soát lịch sử git để tổng hợp log.
```

---

## 4. Tổng kết thay đổi cuối project

### 4.1. Các chức năng đã hoàn thành

| STT | Chức năng | Trạng thái | Minh chứng | Ghi chú |
|---:|---|---|---|---|
| 1 | Quản lý Problem & Testcase Builder | Completed | Commit: feat(admin-problems) | Có validation, versioning |
| 2 | Instructor Revenue Dashboard | Completed | Commit: feat(instructor-revenue) | Biểu đồ SVG, bộ lọc thời gian |
| 3 | Admin Financial Stats | Completed | Commit: feat(admin-financial) | Tối ưu bằng Promise.all |

### 4.2. Tổng hợp AI hỗ trợ trong project

| Hạng mục | AI có hỗ trợ không? | Mức độ hỗ trợ | Ghi chú |
|---|---|---|---|
| Requirement | Có | Trung bình | Gợi ý các metric dashboard |
| Design | Có | Trung bình | Gợi ý schema Problem Versioning |
| Coding | Có | Nhiều | boilerplate code, tính toán biểu đồ SVG, Promise.all |
| Debug | Có | Trung bình | Fix validation, scope thay đổi ngoài ý muốn |
| Report | Có | Nhiều | Sinh format Markdown báo cáo |

### 4.3. Bài học rút ra

```text
1. Hiệu suất API: Nhận ra tác hại của Monolithic API khi load lượng data lớn (thống kê). Việc tách nhỏ thành micro-endpoints kết hợp gọi song song bằng Promise.all cải thiện đáng kể UX.
2. Form Validation: Không bao giờ tin tưởng hoàn toàn vào dữ liệu đầu vào. Phải validate chặt chẽ (Testcase, constraints) để tránh lỗi runtime lúc thi đấu.
3. Sử dụng AI hiệu quả: AI rất giỏi trong việc xử lý thuật toán tính toán (vd: tính tọa độ điểm vẽ SVG line chart), tiết kiệm rất nhiều thời gian so với tính thủ công.
```

### 4.4. Hướng cải thiện tiếp theo

```text
1. Ứng dụng cache (Redis) cho các dashboard thống kê để giảm tải database vì các số liệu tài chính không nhất thiết phải real-time đến từng giây.
2. Cải tiến Testcase Builder có giao diện kéo thả trực quan hơn thay vì nhập text.
```

---

# 5. Cam kết cập nhật Changelog

Sinh viên/nhóm cam kết rằng nội dung changelog phản ánh đúng các thay đổi đã thực hiện trong quá trình làm bài tập/project.

| Đại diện sinh viên/nhóm | Ngày xác nhận |
|---|---|
| Nguyễn Văn Quang | 09/07/2026 |
