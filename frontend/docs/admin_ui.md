# Tài Liệu Yêu Cầu Thiết Kế UI Admin (Admin Dashboard)

Tài liệu này chuẩn hóa các yêu cầu thiết kế giao diện Admin cho hệ thống. Giao diện này sẽ cung cấp đầy đủ các tính năng quản lý, thống kê và xét duyệt dữ liệu hệ thống.

---

## 1. Thiết Kế Tổng Quan (Layout & Theme)
*   **Bố cục (Layout):** Tương tự như trang Dashboard dành cho Instructor.
*   **Thanh điều hướng bên trái (Sidebar Navbar):**
    *   Có khả năng bật/tắt (collapsible).
    *   Chứa các liên kết điều hướng nhanh:
        *   `Dashboard`
        *   `Courses`
        *   `Problems`
        *   `Contest`
        *   `Instructor`
        *   `Users`
        *   `Financial Statistics`
*   **Khu vực nội dung chính (Main Content Area):** Hiển thị chi tiết nội dung tương ứng với mục được chọn từ Navbar.

---

## 2. Chi Tiết Các Phân Hệ Giao Diện

### 2.1. Phân hệ Dashboard
Là nơi tổng hợp các thông tin quan trọng và tổng quan nhất của hệ thống.
*   **Thẻ chỉ số tổng quan (Quick Cards):**
    *   Doanh thu tháng này.
    *   Số lượng người dùng đang hoạt động (Active Users).
    *   Số lượng cuộc thi (Contest) đang diễn ra.
    *   Số lượng khóa học (Courses) hiện có.
    *   Số lượng giảng viên (Instructors) trên hệ thống.
*   **Biểu đồ thống kê xu hướng (Charts):**
    *   *Biểu đồ hình cột (Bar Chart):* Doanh thu của 12 tháng gần nhất.
    *   *Biểu đồ hình cột/đường (Bar/Line Chart):* Số lượng người dùng đăng ký mới theo từng tháng (12 tháng gần nhất).
*   **Thống kê xếp hạng (Top Rankings) & Bộ lọc tháng (1, 3, 9, 12 tháng):**
    *   *Top Categories (Biểu đồ tròn - Pie Chart):* Các danh mục khóa học được đăng ký nhiều nhất (ví dụ: Web Development, Data Science, Mobile App, etc.).
    *   *Top Courses (Biểu đồ tròn - Pie Chart):* Các khóa học được mua nhiều nhất (hiển thị thông tin: Tên khóa học, Giảng viên, Số lượng đăng ký, Đánh giá/Rating, Doanh thu).
*   **Hoạt động gần đây (Recent Activity Feed):**
    *   Ghi lại log thời gian thực của hệ thống (ví dụ: Đăng ký tài khoản mới, Nạp tiền thành công, Mua khóa học...).
*   **Danh sách xét duyệt nhanh (Pending Approvals Summary):**
    *   Các yêu cầu đăng ký tài khoản Instructor chưa được duyệt.
    *   Các yêu cầu phê duyệt khóa học (Courses) mới từ Instructor.

### 2.2. Phân hệ Courses (Quản lý Khóa học)
*   **Danh sách khóa học hiện tại:**
    *   Hiển thị dưới dạng lưới thẻ (Card grid) tương tự như trang chủ.
    *   Bổ sung các thông số quản trị trên card: Doanh thu khóa học, Số lượng học viên đã mua, Đánh giá (Rating), Số lượng chương học.
*   **Khu vực xét duyệt khóa học (Pending Courses Approval):**
    *   Danh sách các khóa học đang chờ phê duyệt.
    *   Hiển thị rõ thông tin người tạo (Instructor), thông tin mô tả khóa học, và các nút thao tác nhanh (Duyệt / Từ chối).

### 2.3. Phân hệ Problems (Quản lý Bài tập Lập trình)
*   **Danh sách Problems:** Hiển thị thông số thống kê chi tiết cho từng problem.
*   **Form tạo Problem mới:**
    *   Đọc và phân tích thông tin từ các backend entities và schema database (`init.sql`) để xác định đầy đủ các trường thông tin cần nhập (ví dụ: tên bài, mô tả bài, giới hạn thời gian, giới hạn bộ nhớ, phân loại độ khó...).
    *   *Lưu ý:* Hiện tại chưa cần làm phần thêm testcase phức tạp, chỉ cần tạo thông tin cơ bản cho Problem.

### 2.4. Phân hệ Contest (Quản lý Cuộc thi)
*   **Danh sách Contest:** Thống kê chi tiết các thông số của cuộc thi bao gồm:
    *   Số lượng người tham gia.
    *   Thời gian bắt đầu & Thời gian kết thúc.
    *   Điểm số trung bình.
    *   Số lượng bài nộp (Submissions).
*   **Form tạo Contest mới:**
    *   Đọc hiểu database schema để làm form nhập thông tin cơ bản của cuộc thi (tên cuộc thi, thời gian diễn ra, thể lệ...).
    *   *Lưu ý:* Chưa cần làm phần thêm bài tập (Problems) vào cuộc thi ở bước này.

### 2.5. Phân hệ Instructor (Quản lý Giảng viên)
*   **Danh sách Giảng viên:**
    *   Hiển thị dưới dạng thẻ (Card) giống giao diện trang chủ.
    *   Bổ sung thông tin: Số lượng người theo dõi (Followers), Đánh giá trung bình (Rating), Số lượng khóa học đã xuất bản.
*   **Khu vực phê duyệt đăng ký Instructor (Pending Instructors Approval):**
    *   Hiển thị danh sách tài khoản người dùng đăng ký nâng cấp lên Instructor kèm hồ sơ/thông tin liên quan.
    *   Có nút thao tác (Duyệt / Từ chối).

### 2.6. Phân hệ Users (Quản lý Người dùng)
*   **Danh sách Người dùng:** Hiển thị dưới dạng bảng dữ liệu (Table) với các thông tin:
    *   Tên người dùng, Email, Ngày đăng ký.
    *   Trạng thái tài khoản (Đã duyệt / Đang bị khóa).
    *   Số dư tài khoản (Balance).
    *   Thống kê tài chính cá nhân: Tổng số tiền đã nạp, danh sách các khóa học đã mua.
*   **Bộ lọc & Tìm kiếm:** Tìm kiếm theo tên, lọc theo trạng thái hoạt động (Approve / Lock).
*   **Thao tác quản trị:** Khóa (Lock) hoặc Mở khóa (Unlock) tài khoản người dùng.

### 2.7. Phân hệ Financial Statistics (Thống kê Tài chính)
*   Hiển thị báo cáo tài chính chuyên sâu cho hệ thống.
*   **Thẻ thống kê tài chính (Financial Metric Cards):** Doanh thu tổng, doanh thu theo kỳ, số giao dịch thành công, tỷ lệ hoàn tiền (nếu có).
*   **Biểu đồ phân tích tài chính chuyên nghiệp:**
    *   Biểu đồ phân tích dòng tiền vào/ra theo thời gian.
    *   Biểu đồ thể hiện thị phần doanh thu của các giảng viên/khóa học hàng đầu.
    *   Yêu cầu: Giao diện biểu đồ hiện đại, trực quan, dễ nhìn và có độ phản hồi cao.

---

## 3. Quy Tắc Thực Thi Khi Code (Dành cho AI Agent)
1.  **Đọc hiểu cơ sở dữ liệu:** Trước khi code các tính năng liên quan đến dữ liệu (như tạo Problem, Contest, nạp/rút tiền), bắt buộc phải đọc và tham chiếu đến cấu trúc bảng trong `init.sql` và các file Java/C# Entity của Backend để thiết kế form và API Call chuẩn xác.
2.  **Tính tự động hóa cao:** Khi bắt đầu quá trình sinh mã nguồn (Vibe code), hãy hoàn thiện toàn bộ các file từ đầu đến cuối. 
3.  **Xử lý xung đột (Conflict resolution):** Nếu phát hiện xung đột hoặc vấn đề cấu trúc không đồng nhất, hãy tự đưa ra quyết định tối ưu nhất dựa trên tiêu chuẩn dự án và ghi lại nhật ký (log) vào thư mục log của dự án thay vì dừng lại hỏi người dùng.