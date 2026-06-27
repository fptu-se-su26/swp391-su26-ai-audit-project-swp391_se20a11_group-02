# TÀI LIỆU ĐẶC TẢ API TỔNG HỢP (CODING PLATFORM)

# MODULE: QUẢN LÝ ĐĂNG NHẬP & BẢO MẬT (Auth)

Tài liệu này đặc tả các API liên quan đến quá trình xác thực, đăng ký và quản lý phiên đăng nhập (JWT, Cookies) trong hệ thống Backend. Các API này trả về Token để sử dụng cho các luồng nghiệp vụ tiếp theo.

---

## 1. Đăng nhập hệ thống (Email/Username)

- **Mô tả chức năng**: Cho phép người dùng xác thực tài khoản bằng `username` và `password`. API trả về thông tin người dùng và tự động gắn Access/Refresh token vào HTTP-Only Cookies.
- **Method**: `POST`
- **Endpoint**: `/auth/login`
- **Authentication**: `None`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Content-Type: application/json`

#### B. Path Variables / Query Parameters
*Không yêu cầu*

#### C. Request Body (JSON)
```json
{
  "username": "ngocthanh2005",
  "password": "mySecurePassword123"
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Mô tả: Tên đăng nhập và mật khẩu chính xác, đăng nhập thành công. Access Token và Refresh Token được trả về và tự động gán vào Cookies `access_token`, `refresh_token`.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Login successfully",
  "result": {
    "accessToken": null, // Đã được gắn vào HTTP-Only Cookie
    "refreshToken": null, // Đã được gắn vào HTTP-Only Cookie
    "id": 1,
    "displayName": "Ngọc Thành",
    "avatarUrl": "https://example.com/avatar.jpg",
    "email": "thanh@example.com",
    "balance": 100000.00,
    "roles": ["ROLE_USER", "ROLE_ADMIN"],
    "username": "ngocthanh2005",
    "status": "ACTIVE",
    "lockReason": null,
    "lockAppeal": null
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản B: Lỗi xác thực dữ liệu (Client Error - 400)**
- Mô tả: Người dùng truyền thiếu hoặc để trống `username` hoặc `password`.
- Status Code: `400 Bad Request`
- Response Body (JSON):
```json
{
  "status": 400,
  "code": 1001,
  "message": "Username / Password invalid",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản C: Lỗi nghiệp vụ (Client Error - 400 / 401 / 404)**
- Mô tả: Sai mật khẩu, tài khoản không tồn tại, hoặc tài khoản đã bị khóa.
- Status Code: `400 Bad Request` hoặc `401 Unauthorized`
- Response Body (JSON):
```json
{
  "status": 400,
  "code": 1002,
  "message": "Mật khẩu không chính xác hoặc tài khoản không tồn tại",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 2. Đăng nhập bằng Google (OAuth2)

- **Mô tả chức năng**: Xác thực đăng nhập sử dụng Google ID Token nhận được từ Frontend. Nếu tài khoản chưa tồn tại, hệ thống tự động tạo mới.
- **Method**: `POST`
- **Endpoint**: `/auth/google`
- **Authentication**: `None`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Content-Type: application/json`

#### B. Path Variables / Query Parameters
*Không yêu cầu*

#### C. Request Body (JSON)
```json
{
  "idToken": "eyJhbGciOiJSUzI1NiIsImtpZ...[Google ID Token]"
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Mô tả: ID Token hợp lệ, hệ thống đối chiếu thành công và trả về thông tin người dùng cùng Cookies.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Google login successfully",
  "result": {
    "accessToken": null, 
    "refreshToken": null, 
    "id": 2,
    "displayName": "Nguyễn Văn A",
    "avatarUrl": "https://lh3.googleusercontent.com/a/...",
    "email": "nguyenvana@gmail.com",
    "balance": 0.00,
    "roles": ["ROLE_USER"],
    "username": "google_nguyenvana123",
    "status": "ACTIVE",
    "lockReason": null,
    "lockAppeal": null
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản B: Lỗi ID Token (Client Error - 400)**
- Mô tả: Client gửi thiếu `idToken` trong Body.
- Status Code: `400 Bad Request`
- Response Body (JSON):
```json
{
  "status": 400,
  "code": 4000,
  "message": "ID Token is required",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản C: Lỗi xác thực Token Google (Unauthorized - 401)**
- Mô tả: ID Token đã hết hạn, bị giả mạo, hoặc không hợp lệ từ phía Google.
- Status Code: `401 Unauthorized`
- Response Body (JSON):
```json
{
  "status": 401,
  "code": 1003,
  "message": "Google token is invalid or expired",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 3. Đăng ký tài khoản mới

- **Mô tả chức năng**: Cho phép người dùng đăng ký tài khoản mới vào hệ thống với Username, Password, và Email. Sau khi đăng ký thành công, hệ thống tự đăng nhập và cấp Cookies.
- **Method**: `POST`
- **Endpoint**: `/auth/register`
- **Authentication**: `None`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Content-Type: application/json`

#### B. Path Variables / Query Parameters
*Không yêu cầu*

#### C. Request Body (JSON)
```json
{
  "username": "ngocthanh2024",
  "password": "Password@123",
  "confirmPassword": "Password@123",
  "displayname": "Ngọc Thành Đẹp Trai",
  "email": "thanh@fpt.edu.vn"
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Mô tả: Dữ liệu hợp lệ, tài khoản được tạo mới trong DB.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Register account successfully",
  "result": {
    "accessToken": null, 
    "refreshToken": null, 
    "id": 3,
    "displayName": "Ngọc Thành Đẹp Trai",
    "avatarUrl": null,
    "email": "thanh@fpt.edu.vn",
    "balance": 0.00,
    "roles": ["ROLE_USER"],
    "username": "ngocthanh2024",
    "status": "ACTIVE",
    "lockReason": null,
    "lockAppeal": null
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản B: Lỗi xác thực dữ liệu (Client Error - 400)**
- Mô tả: Username < 4 ký tự, Password < 4 ký tự, email không đúng định dạng.
- Status Code: `400 Bad Request`
- Response Body (JSON):
```json
{
  "status": 400,
  "code": 4000,
  "message": "USERNAME_INVALID", 
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản C: Lỗi nghiệp vụ (Client Error - 400)**
- Mô tả: Username hoặc Email đã tồn tại trong hệ thống, hoặc `password` không khớp `confirmPassword`.
- Status Code: `400 Bad Request`
- Response Body (JSON):
```json
{
  "status": 400,
  "code": 1004,
  "message": "Username hoặc Email đã được sử dụng",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 4. Đăng xuất hệ thống

- **Mô tả chức năng**: Xóa phiên đăng nhập hiện tại bằng cách hủy token trong Database và xóa Cookies ở phía trình duyệt (set Max-Age = 0).
- **Method**: `POST`
- **Endpoint**: `/auth/logout`
- **Authentication**: `Cookies (access_token & refresh_token)`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
*Không yêu cầu* (Sử dụng Cookie)

#### B. Path Variables / Query Parameters
*Không yêu cầu*

#### C. Request Body (JSON)
*Không yêu cầu*

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Mô tả: Xóa token thành công, server trả về header `Set-Cookie` với thời hạn đã hết.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Logout successfully",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 5. Làm mới Token (Refresh Token)

- **Mô tả chức năng**: Sử dụng `refresh_token` trong Cookie để yêu cầu cấp lại cặp `access_token` và `refresh_token` mới khi `access_token` cũ đã hết hạn.
- **Method**: `POST`
- **Endpoint**: `/auth/refresh`
- **Authentication**: `Cookie (refresh_token)`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
*Không yêu cầu* (Sử dụng Cookie)

#### B. Path Variables / Query Parameters
*Không yêu cầu*

#### C. Request Body (JSON)
*Không yêu cầu*

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Mô tả: `refresh_token` hợp lệ, Server trả về thông tin user mới và tự động set Cookie mới.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Refresh token successfully",
  "result": {
    "accessToken": null, 
    "refreshToken": null, 
    "id": 1,
    "displayName": "Ngọc Thành",
    "avatarUrl": "https://example.com/avatar.jpg",
    "email": "thanh@example.com",
    "balance": 100000.00,
    "roles": ["ROLE_USER", "ROLE_ADMIN"],
    "username": "ngocthanh2005",
    "status": "ACTIVE",
    "lockReason": null,
    "lockAppeal": null
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản B: Refresh Token hết hạn hoặc không tồn tại (Unauthorized - 401)**
- Mô tả: Token truyền lên đã hết hạn, không có trong Cookie, hoặc đã bị đăng xuất trước đó.
- Status Code: `401 Unauthorized`
- Response Body (JSON):
```json
{
  "status": 401,
  "code": 4001,
  "message": "Unauthenticated",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```


---

# MODULE: QUẢN LÝ NGƯỜI DÙNG & HỒ SƠ (Users & Dashboard)

Tài liệu này đặc tả các API liên quan đến thao tác trên tài khoản cá nhân của người dùng, lấy thông tin thống kê học tập (Dashboard) và các chức năng quản trị viên thao tác với người dùng (Khóa/Mở khóa tài khoản).

---

## 1. Đổi mật khẩu

- **Mô tả chức năng**: Cho phép người dùng đang đăng nhập thay đổi mật khẩu tài khoản của mình. Cần cung cấp mật khẩu cũ và mật khẩu mới.
- **Method**: `PATCH`
- **Endpoint**: `/me/change-password`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Content-Type: application/json`
- `Authorization: Bearer {{access_token}}`

#### B. Path Variables / Query Parameters
*Không yêu cầu*

#### C. Request Body (JSON)
```json
{
  "oldPassword": "oldSecurePassword123",
  "newPassword": "newSecurePassword123",
  "confirmNewPassword": "newSecurePassword123"
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Mô tả: Mật khẩu cũ chính xác và mật khẩu mới hợp lệ, đổi mật khẩu thành công.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Password changed successfully",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản B: Lỗi xác thực dữ liệu (Client Error - 400)**
- Mô tả: Mật khẩu quá ngắn (< 4 ký tự) hoặc bỏ trống.
- Status Code: `400 Bad Request`
- Response Body (JSON):
```json
{
  "status": 400,
  "code": 4000,
  "message": "NEW_PASSWORD_INVALID", 
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản C: Sai mật khẩu cũ hoặc không khớp (Client Error - 400)**
- Mô tả: Mật khẩu cũ không đúng, hoặc `newPassword` không khớp `confirmNewPassword`.
- Status Code: `400 Bad Request`
- Response Body (JSON):
```json
{
  "status": 400,
  "code": 1005,
  "message": "Mật khẩu cũ không chính xác hoặc mật khẩu mới không khớp",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 2. Lấy thông tin cá nhân (My Profile)

- **Mô tả chức năng**: Trả về thông tin chi tiết của người dùng đang đăng nhập hiện tại dựa trên Token.
- **Method**: `GET`
- **Endpoint**: `/me/my-info`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

#### B. Path Variables / Query Parameters
*Không yêu cầu*

#### C. Request Body (JSON)
*Không yêu cầu*

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Mô tả: Token hợp lệ, trả về thông tin hồ sơ của user.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "User info retrieved successfully",
  "result": {
    "id": 1,
    "displayName": "Ngọc Thành",
    "email": "thanh@example.com",
    "avatarUrl": "https://example.com/avatar.jpg",
    "status": "ACTIVE",
    "lockReason": null,
    "lockAppeal": null
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản B: Lỗi xác thực Token (Unauthorized - 401)**
- Mô tả: Token không hợp lệ, bị giả mạo hoặc hết hạn.
- Status Code: `401 Unauthorized`
- Response Body (JSON):
```json
{
  "status": 401,
  "code": 4001,
  "message": "Unauthenticated",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 3. Gửi yêu cầu khiếu nại (Appeal)

- **Mô tả chức năng**: Cho phép người dùng (thường là bị khóa tài khoản một phần) gửi lý do khiếu nại lên Admin.
- **Method**: `POST`
- **Endpoint**: `/me/appeal`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Content-Type: application/json`
- `Authorization: Bearer {{access_token}}`

#### B. Path Variables / Query Parameters
*Không yêu cầu*

#### C. Request Body (JSON)
```json
{
  "appealReason": "Tôi không vi phạm quy chế thi, vui lòng xem xét lại tài khoản của tôi."
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Mô tả: Gửi khiếu nại thành công.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Appeal submitted successfully",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản B: Thiếu lý do khiếu nại (Client Error - 400)**
- Mô tả: Bỏ trống `appealReason`.
- Status Code: `400 Bad Request`
- Response Body (JSON):
```json
{
  "status": 400,
  "code": 4000,
  "message": "Appeal reason is required",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 4. Lấy thống kê tổng quan (Dashboard Stats)

- **Mô tả chức năng**: Trả về số liệu thống kê tổng quan của user (khóa học đã đăng ký, bài tập hoàn thành, số dư hiện tại, v.v.)
- **Method**: `GET`
- **Endpoint**: `/me/dashboard-stats`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

#### B. Path Variables / Query Parameters
*Không yêu cầu*

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Get dashboard stats successfully",
  "result": {
    "enrolled": 5,
    "completedCourses": 2,
    "solvedPractice": 45,
    "totalPracticeProblems": 100,
    "ranking": 12,
    "totalUsers": 500,
    "currentBalance": 150000.00
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 5. Lấy lịch sử hoạt động (Activity Heatmap)

- **Mô tả chức năng**: Lấy danh sách các ngày hoạt động (đóng góp, giải bài tập) trong một năm cụ thể để vẽ biểu đồ Heatmap.
- **Method**: `GET`
- **Endpoint**: `/me/activities`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

#### B. Path Variables / Query Parameters
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mặc định | Mô tả ý nghĩa |
| :--- | :--- | :--- | :--- | :--- |
| `year` | Integer | Y | Không | Năm cần thống kê hoạt động (Ví dụ: 2024) |

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Get user activities successfully",
  "result": {
    "userId": 1,
    "year": 2024,
    "maxStreak": 15,
    "currentStreak": 3,
    "activeDates": [
      "2024-01-01",
      "2024-01-02",
      "2024-05-15"
    ]
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 6. Lấy danh sách khóa học đang tham gia (Enrolled Courses)

- **Mô tả chức năng**: Lấy danh sách các khóa học mà người dùng đã thanh toán/đăng ký, kèm theo tiến độ học tập (Progress).
- **Method**: `GET`
- **Endpoint**: `/me/enrolled-courses`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Get enrolled courses successfully",
  "result": [
    {
      "id": 1,
      "title": "Java Spring Boot Masterclass",
      "thumbnailUrl": "https://example.com/java.png",
      "shortDescription": "Learn Spring Boot from scratch",
      "price": 500000.00,
      "averageRating": 4.8,
      "totalReviews": 120,
      "totalEnrolled": 1500,
      "enrolled": true,
      "progressPercentage": 45,
      "instructorName": "Ngọc Thành"
    }
  ],
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 7. Lấy thống kê trạng thái bài nộp (Submission Statistics)

- **Mô tả chức năng**: Thống kê số lượng bài nộp (Accepted, Wrong Answer, TLE, MLE) của người dùng trên toàn hệ thống.
- **Method**: `GET`
- **Endpoint**: `/me/submission-statistics`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Get submission statistics successfully",
  "result": {
    "totalSubmissions": 1050,
    "totalAccepted": 400,
    "totalWrongAnswer": 500,
    "totalTimeLimitExceeded": 100,
    "totalMemoryLimitExceeded": 50
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 8. Lấy danh sách toàn bộ người dùng (Dành cho Admin)

- **Mô tả chức năng**: Admin xem danh sách chi tiết tất cả người dùng trong hệ thống kèm tổng số tiền nạp, khóa học đã mua, trạng thái online...
- **Method**: `GET`
- **Endpoint**: `/admin/users`
- **Authentication**: `Bearer Token` - **Role: Admin**

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Fetched all users successfully",
  "result": [
    {
      "id": 1,
      "name": "Nguyễn Văn A",
      "email": "nva@gmail.com",
      "registerDate": "2024-01-01T10:00:00Z",
      "status": "ACTIVE",
      "balance": 50000.00,
      "totalDeposited": 200000.00,
      "totalPurchased": 150000.00,
      "purchasedCourses": [
        {
          "id": "COURSE1",
          "title": "Java Basic",
          "price": 150000.00,
          "date": "2024-02-01T10:00:00Z"
        }
      ],
      "isOnline": true,
      "lockReason": null,
      "lockAppeal": null
    }
  ],
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản C: Lỗi phân quyền (Forbidden - 403)**
- Mô tả: Tài khoản gửi request không có quyền `ROLE_ADMIN`.
- Status Code: `403 Forbidden`
- Response Body (JSON):
```json
{
  "status": 403,
  "code": 4003,
  "message": "Access Denied",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 9. Khóa / Mở khóa người dùng (Dành cho Admin)

- **Mô tả chức năng**: Admin thay đổi trạng thái của người dùng (ACTIVE hoặc LOCKED) và cung cấp lý do nếu khóa.
- **Method**: `POST`
- **Endpoint**: `/admin/users/{userId}/lock`
- **Authentication**: `Bearer Token` - **Role: Admin**

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Content-Type: application/json`
- `Authorization: Bearer {{access_token}}`

#### B. Path Variables / Query Parameters
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mặc định | Mô tả ý nghĩa |
| :--- | :--- | :--- | :--- | :--- |
| `userId` | Integer | Y | Không | ID của người dùng cần thay đổi trạng thái |

#### C. Request Body (JSON)
```json
{
  "status": "LOCKED",
  "reason": "Phát hiện gian lận trong kỳ thi"
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Mô tả: Trạng thái người dùng đã được cập nhật thành công.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "User status updated successfully",
  "result": {
    "id": 2,
    "name": "Trần Văn B",
    "email": "tvb@gmail.com",
    "status": "LOCKED",
    "lockReason": "Phát hiện gian lận trong kỳ thi",
    "lockAppeal": null
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản B: Sai ID hoặc Thiếu tham số (Client Error - 400)**
- Mô tả: Bỏ trống trường `status`.
- Status Code: `400 Bad Request`
- Response Body (JSON):
```json
{
  "status": 400,
  "code": 4000,
  "message": "Status is required",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```


---

# MODULE: QUẢN LÝ DANH MỤC (Categories)

Tài liệu này đặc tả các API liên quan đến thao tác truy xuất dữ liệu danh mục khóa học trong hệ thống. Các danh mục này thường được dùng để phân loại và lọc khóa học ở phía Frontend.

---

## 1. Lấy toàn bộ danh sách danh mục (Categories)

- **Mô tả chức năng**: Trả về toàn bộ danh sách các danh mục khóa học (Categories) đang có trong hệ thống bao gồm `id`, `name` và `description`. API được mở công khai (Public) để người dùng chưa đăng nhập vẫn xem được.
- **Method**: `GET`
- **Endpoint**: `/categories`
- **Authentication**: `None`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
*Không yêu cầu*

#### B. Path Variables / Query Parameters
*Không yêu cầu*

#### C. Request Body (JSON)
*Không yêu cầu*

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Mô tả: Server trả về mảng danh sách các danh mục hợp lệ.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": null,
  "code": 200,
  "message": "Success",
  "result": [
    {
      "id": 1,
      "name": "Java Spring Boot",
      "description": "Các khóa học liên quan đến lập trình Backend với Spring Boot",
      "createdAt": "2024-01-01T10:00:00Z",
      "updatedAt": "2024-01-01T10:00:00Z"
    },
    {
      "id": 2,
      "name": "ReactJS",
      "description": "Lập trình Frontend sử dụng ReactJS",
      "createdAt": "2024-02-01T10:00:00Z",
      "updatedAt": "2024-02-01T10:00:00Z"
    }
  ],
  "timestamp": null
}
```
*(Lưu ý: API này đang sử dụng trực tiếp đối tượng `CategoryEntity` nên có thể chứa `createdAt` và `updatedAt`)*


---

# MODULE: QUẢN LÝ KHÓA HỌC & BÀI TRẮC NGHIỆM (Courses & Quizzes)

Tài liệu này đặc tả các API dành cho học viên và người dùng khách quan để tìm kiếm khóa học, xem chi tiết, học bài (Learning Detail), tương tác bình luận/đánh giá và làm bài trắc nghiệm (Quiz).

---

## 1. Tìm kiếm và Lọc danh sách khóa học

- **Mô tả chức năng**: Trả về danh sách khóa học có phân trang, hỗ trợ tìm kiếm theo từ khóa, danh mục, khoảng giá, đánh giá và tên giảng viên. Hỗ trợ sắp xếp (Sort).
- **Method**: `GET`
- **Endpoint**: `/courses`
- **Authentication**: `None` (Tùy chọn Bearer Token. Nếu có token, hệ thống sẽ trả thêm cờ `enrolled` để biết user đã mua chưa).

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}` (Tùy chọn)

#### B. Path Variables / Query Parameters
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mặc định | Mô tả ý nghĩa |
| :--- | :--- | :--- | :--- | :--- |
| `keyword` | String | N | Không | Tìm kiếm theo tên khóa học |
| `categoryIds` | List<Long> | N | Không | Lọc theo ID danh mục (Ví dụ: `categoryIds=1,2`) |
| `minPrice` | BigDecimal | N | Không | Giá thấp nhất |
| `maxPrice` | BigDecimal | N | Không | Giá cao nhất |
| `minRating` | Double | N | Không | Đánh giá sao thấp nhất |
| `maxRating` | Double | N | Không | Đánh giá sao cao nhất |
| `instructorName`| String | N | Không | Tên giảng viên |
| `page` | Integer | N | `0` | Trang hiện tại (0-indexed) |
| `size` | Integer | N | `12` | Số lượng trên 1 trang (Tối đa 20) |
| `sortBy` | String[] | N | `totalEnrolled` | Trường cần sắp xếp |
| `order` | String[] | N | `desc` | Chiều sắp xếp (`asc`/`desc`) |

#### C. Request Body (JSON)
*Không yêu cầu*

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Get course list successfully",
  "result": {
    "content": [
      {
        "id": 1,
        "title": "Java Spring Boot Masterclass",
        "thumbnailUrl": "https://...",
        "shortDescription": "Learn Spring Boot",
        "price": 500000.00,
        "averageRating": 4.8,
        "totalReviews": 120,
        "totalEnrolled": 1500,
        "enrolled": false,
        "progressPercentage": null,
        "instructorName": "Ngọc Thành"
      }
    ],
    "pageNumber": 0,
    "pageSize": 12,
    "totalElements": 1,
    "totalPages": 1,
    "last": true
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 2. Xem chi tiết khóa học (Overview)

- **Mô tả chức năng**: Trả về thông tin chi tiết của một khóa học (giá, giảng viên, tổng thời lượng...).
- **Method**: `GET`
- **Endpoint**: `/courses/{id}`
- **Authentication**: `None` (Tùy chọn Token để check `isEnrolled`)

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
*Tùy chọn Header Authorization*

#### B. Path Variables / Query Parameters
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mặc định | Mô tả ý nghĩa |
| :--- | :--- | :--- | :--- | :--- |
| `id` | Long | Y | Không | ID của khóa học |

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Get course detail successfully",
  "result": {
    "id": 1,
    "title": "Java Spring Boot Masterclass",
    "description": "Nội dung chi tiết dài...",
    "price": 500000.00,
    "instructorName": "Ngọc Thành",
    "isEnrolled": false
    // ... và các trường chi tiết khác
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 3. Lấy khung chương trình khóa học (Public Curriculum)

- **Mô tả chức năng**: Trả về danh sách Chapter và Lesson của khóa học dùng để hiển thị ở trang giới thiệu (Chưa học). Không trả về nội dung bài học.
- **Method**: `GET`
- **Endpoint**: `/courses/{id}/curriculum`
- **Authentication**: `None`

---

## 4. Lấy chi tiết không gian học tập (Learning Detail)

- **Mô tả chức năng**: Trả về thông tin phục vụ cho không gian học (Video đang xem dở, tiến độ thực tế, tổng bài học). API này bắt buộc user phải mua khóa học.
- **Method**: `GET`
- **Endpoint**: `/courses/{id}/learning-detail`
- **Authentication**: `Bearer Token`

### KỊCH BẢN PHẢN HỒI DỮ LIỆU
**Kịch bản C: Lỗi phân quyền (Forbidden - 403)**
- Mô tả: Học viên chưa mua khóa học này (`@PreAuthorize("@courseSecurity.canAccessCourse(#id)")` từ chối).
- Status Code: `403 Forbidden`

---

## 5. Lấy nội dung chi tiết một Bài học (Learning Lesson)

- **Mô tả chức năng**: Trả về nội dung bài học (Video URL, Reading Text) hoặc cấu trúc nếu là Quiz/Coding. Bắt buộc đã mua khóa học.
- **Method**: `GET`
- **Endpoint**: `/courses/{id}/lessons/{lessonId}`
- **Authentication**: `Bearer Token`

---

## 6. Đánh dấu hoàn thành Bài học

- **Mô tả chức năng**: Đánh dấu lessonId thành trạng thái "Đã hoàn thành" để cập nhật tiến độ (% progress) khóa học.
- **Method**: `POST`
- **Endpoint**: `/courses/{id}/lessons/{lessonId}/complete`
- **Authentication**: `Bearer Token`

---

## 7. Lấy danh sách bình luận của bài học (Lesson Comments)

- **Mô tả chức năng**: Trả về danh sách các bình luận dưới một bài học cụ thể (có hỗ trợ sub-comments/reply).
- **Method**: `GET`
- **Endpoint**: `/courses/lessons/{lessonId}/comments`
- **Authentication**: `Bearer Token`

---

## 8. Đăng bình luận vào bài học

- **Mô tả chức năng**: Đăng một bình luận hoặc phản hồi vào bài học.
- **Method**: `POST`
- **Endpoint**: `/courses/lessons/{lessonId}/comments`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON)
```json
{
  "content": "Bài học này rất hay, cảm ơn giảng viên!",
  "parentId": null // Gửi ID của bình luận cha nếu đây là Reply
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU
**Kịch bản B: Lỗi xác thực dữ liệu (400)**
- Mô tả: Để trống nội dung bình luận.
- Status Code: `400 Bad Request`

---

## 9. Lấy bài trắc nghiệm của bài học (Quiz Detail)

- **Mô tả chức năng**: Trả về danh sách câu hỏi và các lựa chọn (Options) của một bài Quiz. Nếu người dùng đã từng nộp bài, trả về thêm đáp án mà họ đã chọn trước đó.
- **Method**: `GET`
- **Endpoint**: `/courses/{courseId}/lessons/{lessonId}/quiz`
- **Authentication**: `Bearer Token`

---

## 10. Nộp bài trắc nghiệm (Submit Quiz)

- **Mô tả chức năng**: Chấm điểm tự động các câu trả lời trắc nghiệm do học viên gửi lên. Trả về chi tiết các câu đúng/sai và điểm số.
- **Method**: `POST`
- **Endpoint**: `/courses/{courseId}/quizzes/{quizId}/submit`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON)
```json
{
  "answers": [
    {
      "questionId": 1,
      "selectedOptionId": 3
    },
    {
      "questionId": 2,
      "selectedOptionId": null // Bỏ qua câu hỏi này
    }
  ]
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU

**Kịch bản A: Nộp bài thành công (200)**
- Mô tả: Bài được chấm thành công. Trả về kết quả đúng sai từng câu và tổng số câu đúng.
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Submit quiz successfully",
  "result": {
    "quizId": 1,
    "totalQuestions": 10,
    "correctAnswers": 8,
    "score": 8.0,
    "passed": true,
    "details": [
      {
        "questionId": 1,
        "isCorrect": true,
        "correctOptionId": 3,
        "explanation": "Spring Boot là một framework Java."
      }
    ]
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 11. Đánh giá khóa học (Course Review)

- **Mô tả chức năng**: Viết review sao và nhận xét cho một khóa học đã học. Có thể dùng để tạo mới hoặc cập nhật review (Upsert).
- **Method**: `POST`
- **Endpoint**: `/courses/{id}/reviews`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON)
```json
{
  "star": 5,
  "content": "Tuyệt vời!"
}
```
*(Lưu ý: `star` phải từ 1 đến 5)*


---

# MODULE: QUẢN LÝ GIẢNG VIÊN (Instructors)

Tài liệu này đặc tả các API dành riêng cho người dùng có vai trò là Giảng viên (`ROLE_INSTRUCTOR`), bao gồm quy trình đăng ký làm giảng viên, quản lý khóa học (Tạo, Sửa, Thêm bài học, Đăng tải file) và xem báo cáo doanh thu.

---

## 1. Đăng ký trở thành giảng viên (Apply)

- **Mô tả chức năng**: Học viên gửi đơn đăng ký để trở thành Giảng viên hệ thống. Cần cung cấp chuyên ngành và tiểu sử cá nhân.
- **Method**: `POST`
- **Endpoint**: `/instructor-applications/apply`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### C. Request Body (JSON)
```json
{
  "fullName": "Nguyễn Văn A",
  "major": "Kỹ thuật phần mềm",
  "bio": "Senior Backend Developer với 5 năm kinh nghiệm."
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU
**Kịch bản A: Thành công (200)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Registered as instructor successfully",
  "result": {
    "status": "PENDING"
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 2. Kiểm tra trạng thái đơn đăng ký (My Status)

- **Mô tả chức năng**: Lấy trạng thái duyệt đơn đăng ký giảng viên hiện tại của người dùng.
- **Method**: `GET`
- **Endpoint**: `/instructor-applications/my-status`
- **Authentication**: `Bearer Token`

---

## 3. Lấy danh sách khóa học của giảng viên (My Courses)

- **Mô tả chức năng**: Lấy danh sách toàn bộ khóa học do giảng viên này tạo ra (Bao gồm cả Nháp, Đang duyệt, Đã xuất bản).
- **Method**: `GET`
- **Endpoint**: `/instructor/courses`
- **Authentication**: `Bearer Token` - **Role: Instructor**

---

## 4. Tạo khóa học mới (Khởi tạo bản nháp)

- **Mô tả chức năng**: Tạo mới một khóa học dạng bản nháp. Chưa có bài học/chương học.
- **Method**: `POST`
- **Endpoint**: `/instructor/courses`
- **Authentication**: `Bearer Token` - **Role: Instructor**

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON)
```json
{
  "title": "Khoá học Spring Boot",
  "shortDescription": "Học Spring Boot cơ bản",
  "longDescription": "Mô tả siêu dài về khóa học...",
  "categoryIds": [1, 2],
  "isFree": false,
  "price": 500000.00,
  "whatYouLearn": ["Biết code Java", "Biết cấu hình Web"],
  "courseHighlight": ["Thực hành nhiều", "Cập nhật 2024"],
  "technologyTool": ["IntelliJ", "Java 21"],
  "prerequisites": ["Biết Java core"],
  "targetAudience": ["Sinh viên IT"],
  "completionBenefits": ["Nhận chứng chỉ", "Có dự án thực tế"],
  "thumbnailUrl": "https://..."
}
```

---

## 5. Upload File Media (Hình ảnh, Video lên Cloudinary)

- **Mô tả chức năng**: API nhận file qua form-data và upload lên Cloudinary, trả về link trực tiếp. Dùng cho Thumbnail khóa học hoặc Video bài học.
- **Method**: `POST`
- **Endpoint**: `/instructor/upload`
- **Authentication**: `Bearer Token` - **Role: Instructor**

### 1. THAM SỐ ĐẦU VÀO
#### A. Headers
- `Content-Type: multipart/form-data`

#### B. Form Data
- `file`: File cần upload (Binary)
- `folderName` (Tùy chọn): Tên thư mục lưu trên mây (Mặc định: "courses")

---

## 6. Cập nhật chi tiết Khóa học, Chương, Bài học (Bản nháp)

- **Mô tả chức năng**: Lưu lại toàn bộ nội dung bản nháp khóa học bao gồm cấu trúc Chương (Chapters), Bài học (Lessons), Trắc nghiệm (Quizzes) và Bài tập code (Exercises).
- **Method**: `PUT`
- **Endpoint**: `/instructor/courses/{id}`
- **Authentication**: `Bearer Token` - **Role: Instructor**

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON)
```json
{
  "title": "Spring Boot Căn bản",
  // Các field của khóa học...
  "chapters": [
    {
      "id": null, // Để null nếu là chương tạo mới
      "title": "Chương 1: Giới thiệu",
      "lessons": [
        {
          "id": null,
          "title": "Bài 1.1: Khái niệm",
          "video": "https://...",
          "theory": "Nội dung lý thuyết (Markdown/HTML)",
          "isTrial": true,
          "quizzes": [
            {
               "id": null,
               "title": "Trắc nghiệm chương 1",
               "questions": [
                  {
                     "content": "Spring là gì?",
                     "options": [
                        { "content": "Ngôn ngữ lập trình", "isCorrect": false },
                        { "content": "Framework Java", "isCorrect": true }
                     ]
                  }
               ]
            }
          ],
          "exercises": []
        }
      ]
    }
  ]
}
```

---

## 7. Phát sinh Testcase tự động (Judge0)

- **Mô tả chức năng**: Sinh Testcases mẫu tự động cho bài tập lập trình dựa trên mã nguồn sinh test của Giảng viên.
- **Method**: `POST`
- **Endpoint**: `/instructor/testcases/generate`
- **Authentication**: `Bearer Token` - **Role: Instructor**

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON)
```json
{
  "language": "java",
  "code": "import java.util.*;\n..."
}
```

---

## 8. Nộp khóa học để kiểm duyệt (Submit Review)

- **Mô tả chức năng**: Khi khóa học đã soạn thảo xong, giảng viên bấm nút này để đổi trạng thái khóa học từ DRAFT sang PENDING_REVIEW để Admin kiểm duyệt.
- **Method**: `PUT`
- **Endpoint**: `/instructor/courses/{courseId}/submit-review`
- **Authentication**: `Bearer Token` - **Role: Instructor**

---

## 9. Thống kê kinh doanh & Doanh thu tổng quan (Revenue)

- **Mô tả chức năng**: Cung cấp hàng loạt các số liệu tổng quan về khóa học, doanh thu, tăng trưởng.
- **Method**: `GET`
- **Endpoint**: `/instructor/revenue/summary`
- **Authentication**: `Bearer Token` - **Role: Instructor**

### 1. THAM SỐ ĐẦU VÀO
#### B. Path Variables / Query Parameters
- `filter`: Bộ lọc thời gian (Mặc định: `this-month`)
- `startDate`: YYYY-MM-DD
- `endDate`: YYYY-MM-DD

---

*(Bao gồm thêm các API `/instructor/revenue/*` cho biểu đồ, lịch sử rút tiền, số lượng bán của từng khóa học...)*


---

# MODULE: GIỎ HÀNG (Cart)

Tài liệu này đặc tả các API liên quan đến quản lý giỏ hàng của học viên. Giỏ hàng lưu trữ ID của các khóa học mà học viên dự định thanh toán. Dữ liệu giỏ hàng được liên kết với tài khoản người dùng thông qua Token.

---

## 1. Lấy danh sách ID khóa học trong giỏ hàng

- **Mô tả chức năng**: Trả về một mảng chứa ID của tất cả các khóa học hiện đang nằm trong giỏ hàng của người dùng. Frontend có thể dùng danh sách ID này để fetch thêm thông tin chi tiết của khóa học nếu cần.
- **Method**: `GET`
- **Endpoint**: `/cart`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công hoàn toàn (Happy Path - 2xx)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": null,
  "code": 200,
  "message": "Cart fetched successfully",
  "result": [
    1,
    5,
    12
  ],
  "timestamp": null
}
```

---

## 2. Thêm khóa học vào giỏ hàng

- **Mô tả chức năng**: Thêm một khóa học cụ thể vào giỏ hàng của người dùng thông qua ID.
- **Method**: `POST`
- **Endpoint**: `/cart/{courseId}`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

#### B. Path Variables / Query Parameters
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mặc định | Mô tả ý nghĩa |
| :--- | :--- | :--- | :--- | :--- |
| `courseId` | Long | Y | Không | ID của khóa học cần thêm vào giỏ hàng |

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công (200)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": null,
  "code": 200,
  "message": "Course added to cart successfully",
  "result": null,
  "timestamp": null
}
```

---

## 3. Xóa một khóa học khỏi giỏ hàng

- **Mô tả chức năng**: Gỡ bỏ một khóa học khỏi giỏ hàng.
- **Method**: `DELETE`
- **Endpoint**: `/cart/{courseId}`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

#### B. Path Variables / Query Parameters
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mặc định | Mô tả ý nghĩa |
| :--- | :--- | :--- | :--- | :--- |
| `courseId` | Long | Y | Không | ID của khóa học cần xóa khỏi giỏ |

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công (200)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": null,
  "code": 200,
  "message": "Course removed from cart successfully",
  "result": null,
  "timestamp": null
}
```

---

## 4. Xóa toàn bộ giỏ hàng (Clear Cart)

- **Mô tả chức năng**: Làm rỗng toàn bộ giỏ hàng của người dùng. Thường được gọi sau khi người dùng đã thanh toán thành công để dọn dẹp giỏ hàng cũ.
- **Method**: `DELETE`
- **Endpoint**: `/cart/clear`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công (200)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": null,
  "code": 200,
  "message": "Cart cleared successfully",
  "result": null,
  "timestamp": null
}
```


---

# MODULE: THANH TOÁN VÀ GIAO DỊCH (Payment & Orders)

Tài liệu này đặc tả quy trình thanh toán trong hệ thống. Quy trình được thiết kế theo hướng: Người dùng Nạp tiền (Deposit) vào Ví ảo (Wallet) thông qua cổng thanh toán PayOS -> Dùng số dư trong Ví để Mua khóa học (Checkout).

---

## 1. Lấy số dư Ví hiện tại (Wallet Balance)

- **Mô tả chức năng**: Trả về số dư tài khoản hiện tại của người dùng.
- **Method**: `GET`
- **Endpoint**: `/payment/balance`
- **Authentication**: `Bearer Token`

### 1. KỊCH BẢN PHẢN HỒI DỮ LIỆU
**Kịch bản A: Thành công (200)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": null,
  "code": 1000,
  "message": "Get user balance successfully",
  "result": 500000.00,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 2. Tạo yêu cầu Nạp tiền qua PayOS (Deposit)

- **Mô tả chức năng**: Tạo một đường link thanh toán (Mã QR) để người dùng chuyển khoản nạp tiền vào ví.
- **Method**: `POST`
- **Endpoint**: `/payment/deposit`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON)
```json
{
  "amount": 50000 // Số tiền cần nạp, tối thiểu 2000 VNĐ
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU
**Kịch bản A: Thành công (200)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Payment link created successfully",
  "result": {
    "checkoutUrl": "https://pay.payos.vn/...",
    "transactionCode": "123456789"
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 3. Webhook nhận thông báo từ PayOS

- **Mô tả chức năng**: Endpoint này chỉ dành cho hệ thống PayOS gọi về (Server to Server) để báo cáo trạng thái thanh toán (Thành công/Thất bại). Khi thành công, hệ thống sẽ tự động cộng tiền vào Ví người dùng.
- **Method**: `POST`
- **Endpoint**: `/payment/webhook`
- **Authentication**: `None` (Có cơ chế Verify Signature riêng của PayOS)

---

## 4. Hủy giao dịch nạp tiền

- **Mô tả chức năng**: Người dùng chủ động bấm Hủy hoặc Đóng màn hình quét QR.
- **Method**: `POST`
- **Endpoint**: `/payment/cancel/{transactionCode}`
- **Authentication**: `Bearer Token`

---

## 5. Thanh toán Mua Khóa Học bằng Ví (Checkout)

- **Mô tả chức năng**: Dùng số tiền trong Ví để mua danh sách các khóa học. Nếu số dư không đủ sẽ báo lỗi. Nếu thành công, các khóa học sẽ được mở khóa và trừ tiền.
- **Method**: `POST`
- **Endpoint**: `/orders/checkout`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON)
```json
{
  "courseIds": [1, 5, 12]
}
```

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU
**Kịch bản B: Số dư không đủ (400)**
- Mô tả: Tổng tiền khóa học > Số dư Ví.
- Status Code: `400 Bad Request`
- Response Body (JSON):
```json
{
  "status": 400,
  "code": 4000,
  "message": "INSUFFICIENT_BALANCE",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 6. Lịch sử Mua Khóa học (Purchase History)

- **Mô tả chức năng**: Danh sách các đơn hàng mua khóa học đã thực hiện của user (Có phân trang).
- **Method**: `GET`
- **Endpoint**: `/orders/purchase-history`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO
#### B. Query Parameters
- `page` (Mặc định: 0)
- `size` (Mặc định: 10)

---

## 7. Lịch sử Giao dịch Ví (Wallet Transactions)

- **Mô tả chức năng**: Thống kê lịch sử biến động số dư trong ví (Cộng tiền nạp, Trừ tiền mua khóa học, Cộng tiền nhận doanh thu giảng viên).
- **Method**: `GET`
- **Endpoint**: `/wallet/transactions`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO
#### B. Query Parameters
- `type` (Tùy chọn): Lọc theo loại (`DEPOSIT`, `PAYMENT`, `PAYOUT`)

---

## 8. Lịch sử Giao dịch qua Cổng thanh toán (Payment Transactions)

- **Mô tả chức năng**: Liệt kê các lệnh nạp/rút tiền liên kết với ngân hàng/PayOS (Chờ thanh toán, Đã thành công, Đã hủy).
- **Method**: `GET`
- **Endpoint**: `/payment/transactions`
- **Authentication**: `Bearer Token`


---

# MODULE: BÀI TẬP & CHẤM ĐIỂM TỰ ĐỘNG (Problems & Judge0)

Tài liệu này đặc tả các API liên quan đến Hệ thống chấm code tự động (Online Judge), Thư viện bài tập (Problems) dành cho học viên và bộ API Quản lý Bài tập dành cho Admin.

---

## 1. Lấy danh sách Bài tập (Học viên)

- **Mô tả chức năng**: Trả về danh sách bài tập khả dụng trong hệ thống. Nếu có Token, sẽ kèm theo trạng thái bài (Chưa làm, Đã giải, Đang cố gắng).
- **Method**: `GET`
- **Endpoint**: `/api/problems`
- **Authentication**: `None` (Tùy chọn Token)

---

## 2. Xem mô tả chi tiết Bài tập

- **Mô tả chức năng**: Trả về nội dung mô tả bài tập (HTML/Markdown), các ràng buộc, input/output mẫu phục vụ cho việc hiển thị màn hình Editor.
- **Method**: `GET`
- **Endpoint**: `/api/problems/{id}/description`
- **Authentication**: `None` (Tùy chọn Token)

---

## 3. Xem danh sách bình luận (Thảo luận / Discussion)

- **Mô tả chức năng**: Lấy danh sách các trao đổi, thảo luận của học viên dưới một bài tập.
- **Method**: `GET`
- **Endpoint**: `/api/problems/{id}/discussion`
- **Authentication**: `None`

---

## 4. Viết bình luận vào mục Thảo luận

- **Method**: `POST`
- **Endpoint**: `/api/problems/{id}/discussion`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON)
```json
{
  "content": "Mình bị lỗi Time Limit Exceeded ở bài này, ai giúp với?",
  "parentId": null
}
```

---

## 5. Xem Lời giải mẫu (Solution)

- **Mô tả chức năng**: Xem mã nguồn và giải thích lời giải mẫu.
- **Method**: `GET`
- **Endpoint**: `/api/problems/{id}/solution`
- **Authentication**: `Bearer Token`

---

## 6. Lịch sử Nộp bài (Submissions) của User

- **Mô tả chức năng**: Xem danh sách các lần nộp bài của chính User hiện tại cho bài tập `{id}` kèm theo trạng thái đúng/sai, TLE...
- **Method**: `GET`
- **Endpoint**: `/api/problems/{id}/submissions`
- **Authentication**: `Bearer Token`

---

## 7. Nộp mã nguồn chấm tự động (Judge0 Submit)

- **Mô tả chức năng**: API cốt lõi để nộp mã nguồn. Request sẽ được gửi đến hàng đợi (Queue) của Judge0. Trả về thông tin ban đầu báo hiệu "Đang chấm".
- **Method**: `POST`
- **Endpoint**: `/online-judge/submissions`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON)
```json
{
  "problemId": 1,
  "lessonId": null,
  "contestId": null,
  "languageId": 62, // 62 là Java
  "sourceCode": "import java.util.Scanner;\npublic class Main {\n  public static void main(String[] args) {\n    System.out.println(\"Hello\");\n  }\n}"
}
```

---

## 8. Webhook Trả kết quả chấm (Judge0 Callback)

- **Mô tả chức năng**: API Server-to-Server để Judge0 (hoặc RabbitMQ Worker) gọi về khi đã chấm xong code để cập nhật kết quả vào DB.
- **Method**: `PUT`
- **Endpoint**: `/online-judge/submissions`
- **Authentication**: `None` (Chỉ chấp nhận từ Internal Server)

---

# BỘ API QUẢN TRỊ BÀI TẬP (ADMIN)
*(Bắt buộc: `ROLE_ADMIN`)*

## 9. Quản lý chung Bài tập (CRUD)

- **Lấy danh sách Problem**: `GET /admin/problems`
- **Lấy danh sách Tags**: `GET /admin/problems/tags`
- **Tạo mới Problem**: `POST /admin/problems`
- **Sửa Problem**: `PUT /admin/problems/{id}`
- **Xóa Problem**: `DELETE /admin/problems/{id}`

### DTO Tạo/Sửa Problem (JSON Body)
```json
{
  "title": "Tính tổng 2 số A và B",
  "description": "Nhập vào 2 số nguyên A, B. In ra tổng.",
  "inputDescription": "Một dòng chứa 2 số nguyên cách nhau khoảng trắng.",
  "outputDescription": "Một số nguyên duy nhất là tổng A + B.",
  "constraints": "0 <= A, B <= 10^9",
  "exampleInput": "2 3",
  "exampleOutput": "5",
  "hint": "Cẩn thận tràn kiểu int",
  "problemScope": "PUBLIC", // HOẶC COURSE, CONTEST
  "difficulty": "EASY",
  "totalTestcases": 10,
  "timeLimitMs": 1000,
  "memoryLimitKb": 128000,
  "isPublic": true,
  "score": 10.0,
  "tags": ["Math", "Basic"]
}
```

## 10. Các thao tác đặc biệt trên Problem

- **Đổi phạm vi (Scope)**: `POST /admin/problems/{id}/scope`
  - Body: `{"problemScope": "COURSE"}`
- **Bật/Tắt công khai**: `POST /admin/problems/{id}/public`
  - Body: `{"isPublic": false}`
- **Kích hoạt Bài tập**: `POST /admin/problems/{id}/activate` (Xác nhận số lượng testcases)
  - Body: `{"totalTestcases": 15}`

## 11. Quản lý Bộ Testcases (Admin)

- **Lấy danh sách Testcases**: `GET /admin/problems/{id}/testcases`
- **Cập nhật/Lưu Testcases**: `POST /admin/problems/{id}/testcases`
```json
[
  {
    "problemId": 1,
    "inputData": "1 2\n",
    "expectedOutput": "3\n",
    "orderIndex": 1
  },
  {
    "problemId": 1,
    "inputData": "100 200\n",
    "expectedOutput": "300\n",
    "orderIndex": 2
  }
]
```


---

# MODULE: KỲ THI / CONTESTS (Contests & Scoreboard)

Tài liệu này đặc tả các API dành cho Kỳ thi lập trình (Contest), bao gồm quản lý thông tin kỳ thi, đăng ký tham gia, xem đề bài trong kỳ thi, luồng dữ liệu bảng xếp hạng trực tiếp (Scoreboard Stream bằng SSE) và bộ API cho Admin.

---

## 1. Tìm kiếm và Lấy danh sách Kỳ thi

- **Mô tả chức năng**: Trả về danh sách các kỳ thi có phân trang, hỗ trợ tìm kiếm và lọc.
- **Method**: `GET`
- **Endpoint**: `/contests`
- **Authentication**: `None` (Tùy chọn Token)

### 1. THAM SỐ ĐẦU VÀO
#### B. Query Parameters
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mặc định | Mô tả ý nghĩa |
| :--- | :--- | :--- | :--- | :--- |
| `search` | String | N | Không | Tìm theo tên kỳ thi |
| `status` | String | N | `All` | Lọc theo trạng thái: `UPCOMING`, `ONGOING`, `ENDED` |
| `access` | String | N | `All` | Lọc theo loại hình: `PUBLIC`, `PRIVATE` (Cần mật khẩu) |
| `page` | Integer | N | `0` | Trang hiện tại |
| `size` | Integer | N | `5` | Số lượng kỳ thi trên mỗi trang |

---

## 2. Thống kê thông tin Kỳ thi của người dùng (My Stats)

- **Mô tả chức năng**: Lấy thông tin thống kê chung: Tổng số kỳ thi đã tham gia, Xếp hạng cao nhất, v.v.
- **Method**: `GET`
- **Endpoint**: `/contests/my-stats`
- **Authentication**: `Bearer Token`

---

## 3. Lịch sử tham gia Kỳ thi (My History)

- **Mô tả chức năng**: Lấy danh sách lịch sử các kỳ thi đã tham gia kèm thứ hạng và điểm số của user.
- **Method**: `GET`
- **Endpoint**: `/contests/my-history`
- **Authentication**: `Bearer Token`

---

## 4. Xem chi tiết Kỳ thi

- **Mô tả chức năng**: Lấy thông tin chi tiết một kỳ thi (thời gian, luật tính điểm ICPC/IOI, số lượng đăng ký).
- **Method**: `GET`
- **Endpoint**: `/contests/{contestId}`
- **Authentication**: `None` (Tùy chọn Token)

---

## 5. Đăng ký tham gia Kỳ thi

- **Mô tả chức năng**: Học viên nhấn Đăng ký tham gia. Đối với kỳ thi Private, cần gửi kèm mật khẩu.
- **Method**: `POST`
- **Endpoint**: `/contests/{contestId}/register`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO
#### C. Request Body (JSON - Tùy chọn)
```json
{
  "password": "secret_password" 
}
```

---

## 6. Lấy danh sách bài tập trong Kỳ thi

- **Mô tả chức năng**: Trả về danh sách bài tập (Problem) của kỳ thi. Yêu cầu user đã đăng ký và kỳ thi đã bắt đầu.
- **Method**: `GET`
- **Endpoint**: `/contests/{contestId}/problems`
- **Authentication**: `Bearer Token`

---

## 7. Lấy nội dung chi tiết bài tập trong Kỳ thi

- **Mô tả chức năng**: Xem đề bài, ràng buộc của một bài tập cụ thể thuộc Contest.
- **Method**: `GET`
- **Endpoint**: `/contests/{contestId}/problems/{problemId}`
- **Authentication**: `Bearer Token`

---

## 8. Bảng xếp hạng (Scoreboard) - Static Snapshot

- **Mô tả chức năng**: Lấy bảng xếp hạng theo định dạng JSON tại một thời điểm. Dùng cho cả lúc đang thi và lúc thi xong.
- **Method**: `GET`
- **Endpoint**: `/api/v1/contests/{contestId}/scoreboard`
- **Authentication**: `Bearer Token`
- **Query Parameter**: `live=true` (Chỉ Admin mới có quyền bỏ qua tính năng đóng băng / freeze scoreboard).

---

## 9. Bảng xếp hạng (Scoreboard) - Server-Sent Events (SSE Stream)

- **Mô tả chức năng**: Mở một kết nối liên tục từ Client tới Server. Server sẽ push dữ liệu xuống mỗi khi có người nộp bài mới thay đổi thứ hạng (Tránh gọi API liên tục gây quá tải).
- **Method**: `GET`
- **Endpoint**: `/api/v1/contests/{contestId}/scoreboard/stream`
- **Authentication**: `Bearer Token`
- **Header Response**: `Content-Type: text/event-stream`

---

# BỘ API QUẢN LÝ KỲ THI (ADMIN)
*(Bắt buộc: `ROLE_ADMIN`)*

## 10. Quản lý Kỳ thi (CRUD)

- **Lấy danh sách**: `GET /admin/contests`
- **Xem chi tiết**: `GET /admin/contests/{id}`
- **Tạo mới**: `POST /admin/contests`
- **Cập nhật**: `PUT /admin/contests/{id}`
- **Xóa mềm (Cancel)**: `DELETE /admin/contests/{id}`
- **Xóa vĩnh viễn**: `DELETE /admin/contests/{id}/hard`
- **Phát hành (Publish)**: `PUT /admin/contests/{id}/publish`
- **Khôi phục (Restore)**: `PUT /admin/contests/{id}/restore`

### DTO Tạo Kỳ thi (JSON Body)
```json
{
  "title": "Kỳ thi thử Thuật toán Lần 1",
  "description": "Nội dung mô tả luật thi...",
  "scoringRule": "ICPC", 
  "password": null, // Nếu có chữ sẽ thành thi Private
  "startTime": "2024-11-25T08:00:00Z",
  "endTime": "2024-11-25T11:00:00Z"
}
```

## 11. Quản lý Bài tập của Kỳ thi (Contest Problems)

- **Danh sách Bài tập**: `GET /admin/contests/{id}/problems`
- **Thêm Bài tập vào Kỳ thi**: `POST /admin/contests/{id}/problems`
```json
{
  "problemId": 5,
  "orderIndex": 1
}
```
- **Gỡ Bài tập khỏi Kỳ thi**: `DELETE /admin/contests/{id}/problems/{problemId}`


---

# MODULE: XẾP HẠNG (Ranking)

Tài liệu này đặc tả các API liên quan đến Bảng xếp hạng toàn cầu (Global Leaderboard) của hệ thống dựa trên điểm số làm bài tập (Problems) hoặc thi đấu (Contests).

---

## 1. Lấy Bảng xếp hạng Toàn Cầu (Global Leaderboard)

- **Mô tả chức năng**: Trả về danh sách người dùng có điểm số cao nhất hệ thống, được sắp xếp giảm dần. Có thể lọc theo thời gian.
- **Method**: `GET`
- **Endpoint**: `/rankings`
- **Authentication**: `None`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### B. Path Variables / Query Parameters
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mặc định | Mô tả ý nghĩa |
| :--- | :--- | :--- | :--- | :--- |
| `filter` | String | N | `all` | Lọc theo thời gian: `all`, `month`, `week` |

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công (200)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Get global rankings successfully",
  "result": [
    {
      "rank": 1,
      "userId": 5,
      "displayName": "Nguyễn Văn A",
      "avatarUrl": "https://...",
      "score": 1500,
      "problemsSolved": 150,
      "contestsParticipated": 10
    }
  ],
  "timestamp": "2024-10-25T10:15:30Z"
}
```

---

## 2. Lấy Thông tin Xếp hạng của Cá nhân (My Rank Stats)

- **Mô tả chức năng**: Trả về thứ hạng hiện tại, tổng điểm và thống kê làm bài của chính người dùng đang đăng nhập để hiển thị nổi bật trên Bảng xếp hạng.
- **Method**: `GET`
- **Endpoint**: `/rankings/me`
- **Authentication**: `Bearer Token`

### 1. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

#### A. Headers
- `Authorization: Bearer {{access_token}}`

#### B. Path Variables / Query Parameters
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mặc định | Mô tả ý nghĩa |
| :--- | :--- | :--- | :--- | :--- |
| `filter` | String | N | `all` | Lọc theo thời gian: `all`, `month`, `week` |

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU (EXPECTED RESPONSES)

**Kịch bản A: Thành công (200)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "status": 200,
  "code": 1000,
  "message": "Get user rank stats successfully",
  "result": {
    "currentRank": 42,
    "totalUsers": 1000,
    "score": 850,
    "problemsSolved": 85,
    "contestsParticipated": 5,
    "percentile": 95.8 // Nằm trong top 4.2%
  },
  "timestamp": "2024-10-25T10:15:30Z"
}
```

**Kịch bản B: Lỗi xác thực Token (401)**
- Mô tả: Người dùng chưa đăng nhập.
- Status Code: `401 Unauthorized`
- Response Body (JSON):
```json
{
  "status": 401,
  "code": 1005,
  "message": "Unauthenticated",
  "result": null,
  "timestamp": "2024-10-25T10:15:30Z"
}
```


---

# MODULE: KIỂM DUYỆT AI (Moderation)

Tài liệu này đặc tả các API liên quan đến hệ thống kiểm duyệt khóa học tự động bằng AI (AI Moderation System).

---

## 1. Kích hoạt Kiểm duyệt Khóa học (Thủ công / Testing)

- **Mô tả chức năng**: Gửi tín hiệu báo cho RabbitMQ Worker biết cần đưa khóa học này vào quá trình kiểm duyệt AI.
- **Method**: `POST`
- **Endpoint**: `/api/moderation/test/{courseId}`
- **Authentication**: `None` (Hiện tại đang thiết kế public cho mục đích Testing)

### 1. THAM SỐ ĐẦU VÀO
#### B. Path Variables
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mô tả |
| :--- | :--- | :--- | :--- |
| `courseId` | Long | Y | ID khóa học cần kiểm duyệt |

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU
**Kịch bản A: Thành công (200)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "message": "Đã gửi yêu cầu duyệt khóa học vào hàng đợi RabbitMQ thành công!",
  "courseId": 15
}
```

---

## 2. Lấy Báo cáo Kiểm duyệt (Report)

- **Mô tả chức năng**: Trả về dữ liệu chi tiết của báo cáo kiểm duyệt từ AI (Những lỗi vi phạm nào được phát hiện, trạng thái).
- **Method**: `GET`
- **Endpoint**: `/api/moderation/report/{courseId}`
- **Authentication**: `None`

### 1. THAM SỐ ĐẦU VÀO
#### B. Path Variables
| Tên trường | Kiểu dữ liệu | Bắt buộc | Mô tả |
| :--- | :--- | :--- | :--- |
| `courseId` | Long | Y | ID khóa học cần xem báo cáo |

### 2. KỊCH BẢN PHẢN HỒI DỮ LIỆU
**Kịch bản A: Thành công (200)**
- Status Code: `200 OK`
- Response Body (JSON):
```json
{
  "id": 1,
  "courseId": 15,
  "status": "REJECTED",
  "reason": "[\"Video bài học chứa từ ngữ không phù hợp\", \"Thiếu bài tập kiểm tra\"]",
  "checkedAt": "2024-10-25T10:15:30Z"
}
```

**Kịch bản B: Không tìm thấy báo cáo (404)**
- Mô tả: Khóa học chưa được kiểm duyệt.
- Status Code: `404 Not Found`
- Response Body (JSON):
```json
{
  "message": "Chưa có báo cáo kiểm duyệt cho khóa học này."
}
```


---

# MODULE: QUẢN TRỊ VIÊN CẤP CAO (Super Admin)

Tài liệu này đặc tả bộ API dành riêng cho Quản trị viên cấp cao (Admin), bao gồm các chức năng quản lý Dashboard, duyệt Khóa học, duyệt hồ sơ Giảng viên và Quản lý Tài chính.

---

*(Tất cả API trong tài liệu này đều bắt buộc `ROLE_ADMIN`)*

## 1. Dashboard Thống kê tổng quan (Admin Dashboard)

- **Mô tả chức năng**: Cung cấp các con số tổng quan cho trang chủ Admin: Số lượng user, doanh thu tổng, số lượng khóa học, v.v.
- **Method**: `GET`
- **Endpoint**: `/admin/dashboard/stats`
- **Authentication**: `Bearer Token` (ROLE_ADMIN)

## 2. Lịch sử Giao dịch Nạp tiền (Deposit History)

- **Mô tả chức năng**: Lấy danh sách các giao dịch nạp tiền của người dùng.
- **Method**: `GET`
- **Endpoint 1**: `/admin/dashboard/recent-deposits` (Chỉ lấy giao dịch gần đây nhất)
- **Endpoint 2**: `/admin/dashboard/all-deposits` (Lấy toàn bộ lịch sử nạp tiền)
- **Authentication**: `Bearer Token` (ROLE_ADMIN)

---

## 3. Quản lý Khóa học của Giảng viên (Admin Course)

### 3.1 Lấy danh sách Khóa học cần duyệt
- **Mô tả chức năng**: Trả về danh sách toàn bộ khóa học trong hệ thống, bao gồm các khóa học ở trạng thái `PENDING` chờ duyệt.
- **Method**: `GET`
- **Endpoint**: `/admin/courses`

### 3.2 Phê duyệt hoặc Từ chối Khóa học
- **Mô tả chức năng**: Đổi trạng thái khóa học từ `PENDING` sang `APPROVED` hoặc `REJECTED`.
- **Method**: `POST`
- **Endpoint**: `/admin/courses/{courseId}/approve`
- **Request Body (JSON)**:
```json
{
  "status": "APPROVED", // Hoặc "REJECTED"
  "adminNote": "Khóa học chất lượng rất tốt."
}
```

---

## 4. Quản lý Giảng viên (Admin Instructor)

### 4.1 Lấy danh sách Giảng viên hiện tại
- **Mô tả chức năng**: Danh sách các giảng viên đang hoạt động trên nền tảng.
- **Method**: `GET`
- **Endpoint**: `/admin/instructors`

### 4.2 Lấy danh sách Đơn đăng ký làm Giảng viên
- **Mô tả chức năng**: Trả về các đơn xin trở thành giảng viên của người dùng (Bao gồm thông tin kinh nghiệm, link CV...).
- **Method**: `GET`
- **Endpoint**: `/admin/instructors/applications`

### 4.3 Phê duyệt Đơn đăng ký Giảng viên
- **Mô tả chức năng**: Duyệt (Cấp quyền Instructor) hoặc Từ chối đơn xin làm giảng viên.
- **Method**: `POST`
- **Endpoint**: `/admin/instructors/applications/{id}/approve`
- **Request Body (JSON)**:
```json
{
  "status": "APPROVED", // Hoặc "REJECTED"
  "adminNote": "Hồ sơ ấn tượng, đủ điều kiện."
}
```

### 4.4 Khóa/Mở khóa tài khoản Giảng viên (Đình chỉ)
- **Mô tả chức năng**: Đổi trạng thái hoạt động của giảng viên (ví dụ: Vi phạm chính sách nên bị cấm).
- **Method**: `POST`
- **Endpoint**: `/admin/instructors/{id}/status`
- **Request Body (JSON)**:
```json
{
  "status": "SUSPENDED" // Hoặc "ACTIVE"
}
```

---

## 5. Quản lý Tài chính (Admin Financial)

### 5.1 Biểu đồ Doanh thu hàng tháng
- **Mô tả chức năng**: Dữ liệu phục vụ vẽ biểu đồ doanh thu theo từng tháng trong năm.
- **Method**: `GET`
- **Endpoint**: `/admin/financial/monthly-records`

### 5.2 Top Khóa học doanh thu cao nhất
- **Mô tả chức năng**: Danh sách các khóa học bán chạy nhất, mang lại nhiều doanh thu nhất.
- **Method**: `GET`
- **Endpoint**: `/admin/financial/top-courses`

### 5.3 Chi tiết Doanh thu Nền tảng (Audit)
- **Mô tả chức năng**: Bản báo cáo chi tiết về dòng tiền, tổng thu, phần trăm chia sẻ cho giảng viên.
- **Method**: `GET`
- **Endpoint**: `/admin/financial/details`


---

