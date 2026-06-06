# Kế hoạch Thiết kế API Lịch sử Mua Khóa Học (Course Purchase History)

Dựa trên cấu trúc database hiện tại của dự án, chúng ta **không cần tạo thêm Entity (bảng) mới** vì các thông tin bạn yêu cầu đã được lưu trữ đầy đủ trong 2 entity có sẵn là `OrderEntity` và `OrderItemEntity`.

*   **`OrderEntity`**: Lưu thông tin `User`, tổng tiền (`totalAmount`), trạng thái (`status`), và thời gian mua (`createdAt`).
*   **`OrderItemEntity`**: Lưu thông tin `Course` đã mua trong order đó, và giá của khóa học tại thời điểm mua (`price`).

Dưới đây là kế hoạch chi tiết để xây dựng API này:

## 1. Thông tin Endpoint
*   **URL:** `GET /api/v1/orders/purchase-history` (hoặc `GET /api/v1/users/me/purchase-history`)
*   **Method:** `GET`
*   **Mô tả:** Lấy danh sách lịch sử các khóa học mà User đang đăng nhập đã mua thành công.
*   **Authentication:** Yêu cầu User phải đăng nhập (sử dụng Token JWT). Id của User sẽ được lấy trực tiếp từ `SecurityContext` (không truyền qua URL path để bảo mật).
*   **Query Parameters (Phân trang - Pagination):**
    *   `page` (int, default: 0): Trang hiện tại
    *   `size` (int, default: 10): Số lượng bản ghi trên mỗi trang

## 2. Thiết kế DTO (Data Transfer Object)

### 2.1. `PurchaseHistoryResponse`
Trả về thông tin tổng quan của một lần mua hàng (Order).
```java
@Data
@Builder
public class PurchaseHistoryResponse {
    private Integer orderId;
    private BigDecimal totalAmount;
    private OrderStatus status;
    private Instant purchaseDate; // Lấy từ createdAt của OrderEntity
    private List<PurchaseItemResponse> items; // Danh sách các khóa học trong lần mua này
}
```

### 2.2. `PurchaseItemResponse`
Trả về thông tin chi tiết từng khóa học được mua trong Order đó.
```java
@Data
@Builder
public class PurchaseItemResponse {
    private Integer courseId;
    private String courseTitle; // Tên khóa học
    private String courseThumbnail; // Ảnh đại diện khóa học (nếu có)
    private BigDecimal priceAtPurchase; // Giá lúc mua (Lấy từ price của OrderItemEntity)
}
```

## 3. Các lớp cần code (Implementation Plan)

### 3.1. Repository (`OrderRepository`)
Thêm phương thức để query Orders của một User với trạng thái cụ thể, sắp xếp theo thời gian mới nhất.
```java
public interface OrderRepository extends JpaRepository<OrderEntity, Integer> {
    Page<OrderEntity> findByUserIdAndStatusOrderByCreatedAtDesc(
        Integer userId, 
        OrderStatus status, 
        Pageable pageable
    );
}
```

### 3.2. Mapper (`OrderMapper` hoặc `PurchaseHistoryMapper`)
Tạo hoặc dùng MapStruct để map từ `OrderEntity` sang `PurchaseHistoryResponse` và `OrderItemEntity` sang `PurchaseItemResponse`.
*   Cần ánh xạ `OrderEntity.createdAt` sang `PurchaseHistoryResponse.purchaseDate`.
*   Cần ánh xạ `OrderItemEntity.price` sang `PurchaseItemResponse.priceAtPurchase`.
*   Cần ánh xạ `OrderItemEntity.course.title` sang `PurchaseItemResponse.courseTitle`.

### 3.3. Service (`OrderService` hoặc `PurchaseService`)
*   **Hàm:** `PageResponse<PurchaseHistoryResponse> getPurchaseHistory(int page, int size)`
*   **Logic:**
    1. Lấy `userId` từ context đăng nhập (ví dụ: `SecurityUtils.getCurrentUserId()`).
    2. Gọi `orderRepository.findByUserIdAndStatusOrderByCreatedAtDesc(userId, OrderStatus.COMPLETED, PageRequest.of(page, size))` để lấy các order đã thanh toán thành công.
    3. Dùng Mapper chuyển đổi `Page<OrderEntity>` sang object Response có chứa danh sách `PurchaseHistoryResponse` gửi về cho Controller.

### 3.4. Controller (`OrderController` hoặc `UserController`)
Tạo endpoint API nhận request, gọi Service và trả về HTTP 200 OK cùng với JSON response.

---

## 4. Ví dụ JSON Response trả về
```json
{
  "code": 200,
  "message": "Success",
  "data": {
    "content": [
      {
        "orderId": 105,
        "totalAmount": 299.00,
        "status": "COMPLETED",
        "purchaseDate": "2026-06-06T15:30:00Z",
        "items": [
          {
            "courseId": 12,
            "courseTitle": "Lập trình Java Spring Boot chuyên sâu",
            "courseThumbnail": "https://example.com/image.png",
            "priceAtPurchase": 299.00
          }
        ]
      }
    ],
    "pageNo": 0,
    "pageSize": 10,
    "totalElements": 1,
    "totalPages": 1,
    "last": true
  }
}
```
