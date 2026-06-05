# Kế hoạch thực hiện: Thay thế tính năng "Completed Practice Problems" bằng API Thống kê Lịch sử Submit

## 1. Mục tiêu
- Xóa bỏ tính năng lấy danh sách "Completed Practice Problems" (`/done-problems`) trên trang dashboard.
- Tạo một API mới (`/submission-statistics`) để thống kê lịch sử nộp bài dựa trên bảng `problem_submissions` (mỗi lượt submit tổng thể của một bài).
- Thống kê bao gồm: Tổng số lần nộp, ACCEPTED, WRONG_ANSWER, TIME_LIMIT_EXCEEDED, MEMORY_LIMIT_EXCEEDED.
- Tối ưu hóa truy vấn: Tránh lỗi N+1 và tích Đề-các (Cartesian product).

## 2. Chi tiết triển khai

### Bước 1: Tạo DTO cho Response
- Tạo file `SubmissionStatisticResponse.java` trong `com.swp391.coding_platform.dto.response`.
- DTO bao gồm các trường:
  - `totalSubmissions`
  - `totalAccepted`
  - `totalWrongAnswer`
  - `totalTimeLimitExceeded`
  - `totalMemoryLimitExceeded`

### Bước 2: Viết truy vấn Repository
- Cập nhật `ProblemSubmissionRepository.java`.
- Thêm phương thức `countVerdictsByUserId(@Param("userId") Integer userId)`.
- Sử dụng câu lệnh JPQL với `GROUP BY d.verdict` thay vì fetch toàn bộ entities. Việc này giúp xử lý thống kê ngay dưới cơ sở dữ liệu.
- **Lợi ích**:
  - Không sinh ra lỗi N+1 (vì chỉ thực hiện 1 câu query duy nhất).
  - Không bị tích Đề-các (vì không sử dụng JOIN FETCH bừa bãi hay JOIN nhiều bảng One-To-Many đồng thời để lấy dữ liệu chi tiết, chỉ cần join đúng đường dẫn `d.submission.user.id`).

### Bước 3: Cập nhật DashboardService
- Bỏ phương thức `getDoneProblems`.
- Thêm phương thức `getSubmissionStatistics(Integer userId)`.
- Sử dụng kết quả từ `countVerdictsByUserId` (trả về danh sách `Object[]` gồm `verdict` và `count`), sau đó map kết quả vào `SubmissionStatisticResponse`.
- Tiêm (inject) `ProblemSubmissionDetailRepository` vào service.

### Bước 4: Cập nhật DashboardController
- Thay thế endpoint `@GetMapping("/done-problems")` bằng `@GetMapping("/submission-statistics")`.
- Cập nhật kiểu trả về thành `ApiResponse<SubmissionStatisticResponse>`.

## 3. Hoàn tất
Các thay đổi này đảm bảo API mới chạy rất nhanh vì tính toán trực tiếp trên CSDL qua câu lệnh GROUP BY, giảm thiểu tối đa số lượng query (chỉ 1 câu) và không mang dữ liệu dư thừa về memory.
