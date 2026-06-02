# Kế Hoạch Triển Khai Tính Năng Đăng Nhập Google (OAuth2)

Tài liệu này mô tả chi tiết các thay đổi cần thiết cho Frontend, Backend và Database để hoàn thiện tính năng "Sign in with Google" dựa trên tiêu chuẩn bảo mật hiện tại của thư viện Google Identity Services.

## 1. Cấu Trúc Database (Database Schema Changes)

Để hỗ trợ một tài khoản hệ thống (User) liên kết với Google, chúng ta cần thay đổi bảng `users` và thêm một bảng `user_oauth_accounts`.

### 1.1 Cập nhật bảng `users`
Trường `password_hash` không thể bắt buộc (`NOT NULL`) vì tài khoản Google không cung cấp mật khẩu. Mở file `database/schema_db.sql` hoặc chạy lệnh SQL (Migration) sau:

```sql
ALTER TABLE public.users ALTER COLUMN password_hash DROP NOT NULL;
```

### 1.2 Thêm bảng `user_oauth_accounts`
Bảng này đóng vai trò cầu nối, ánh xạ giữa `id` của hệ thống bạn và `sub` của Google. Nó cũng sẵn sàng cho tương lai nếu muốn thêm Login Facebook, Github.

```sql
CREATE TABLE public.user_oauth_accounts (
    id SERIAL PRIMARY KEY,
    user_id integer NOT NULL,
    provider character varying(50) NOT NULL, -- Ví dụ: 'google'
    provider_user_id character varying(255) NOT NULL, -- ID của Google (trường 'sub')
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT fk_user_oauth FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE,
    CONSTRAINT unique_provider_user UNIQUE (provider, provider_user_id)
);
```

---

## 2. Backend API Design (Phần Xử Lý Hệ Thống)

Backend là cốt lõi đảm bảo an toàn cho hệ thống. Tuyệt đối **không tin tưởng** các thông tin Email hay Name từ Frontend truyền xuống trực tiếp.

### Endpoint: `POST /api/auth/google`

**Request Body từ Frontend:**
```json
{
  "idToken": "eyJhbGciOiJSUzI1NiIs..." // Google ID Token
}
```

**Các Bước Xử Lý Tại Service Layer:**
1. **Verify Token:** Sử dụng thư viện `google-auth-library` của Java/Spring Boot (nếu backend là Java) hoặc NodeJS. Gửi Token này lên server Google để xác thực chữ ký.
2. **Trích Xuất Thông Tin (Payload):** Nếu hợp lệ, lấy ra: `sub`, `email`, `name`, `picture`.
3. **Tra Cứu Database:**
   - Tìm kiếm trong `user_oauth_accounts` xem `provider = 'google'` và `provider_user_id = sub` đã tồn tại chưa.
   - **Trường hợp A (Login):** Đã tồn tại $\rightarrow$ Truy xuất được `user_id`. Chuyển sang Bước 4.
   - **Trường hợp B (Register/Link):** Chưa tồn tại $\rightarrow$ Kiểm tra tiếp trong bảng `users` bằng `email`.
      - *Nếu đã tồn tại user với email này:* Thực hiện Account Linking bằng cách INSERT một bản ghi vào `user_oauth_accounts` để ánh xạ `user_id` hiện tại với `sub` của Google. Chuyển sang Bước 4.
      - *Nếu chưa tồn tại:* Tiến hành Đăng ký mới.
         - Tự động sinh `username` từ `email` (Ví dụ: `nguyenvana_abc`).
         - INSERT vào bảng `users` (để `password_hash = NULL`). Lấy `user_id` mới.
         - INSERT vào bảng `user_oauth_accounts` (liên kết `user_id` và `sub`). Chuyển sang Bước 4.
4. **Cấp Quyền Đăng Nhập:** 
   - Từ `user_id` có được, Backend sinh ra hệ thống Access Token / Refresh Token (JWT nội bộ) theo chuẩn của dự án hiện tại.
   - Trả về Frontend. 
   - Từ thời điểm này, Google Token bị vô hiệu hóa / vứt bỏ. Toàn bộ session dùng JWT của hệ thống.

---

## 3. Frontend Integration

Frontend chịu trách nhiệm render giao diện UI Login của Google và lấy Token gửi về Backend.

- **Thư Viện Khuyên Dùng:** Nếu dùng React, sử dụng `@react-oauth/google` để tích hợp Google Identity Services.
- **Quy Trình:**
  1. Người dùng bấm nút "Sign in with Google".
  2. Bắt sự kiện `onSuccess` để nhận `credential` (chính là chuỗi `idToken`).
  3. POST `idToken` này về API `/api/auth/google` của Backend.
  4. Nhận lại System JWT từ Backend, lưu vào LocalStorage/Cookie, chuyển hướng người dùng vào Dashboard.

---

## 4. Bảo Mật & Lưu Ý Trải Nghiệm (UX)
1. **Vấn Đề Đổi Mật Khẩu:** Đối với User đăng ký qua Google (`password_hash` bị NULL), nếu họ truy cập màn hình "Đổi mật khẩu", Backend phải xử lý thành "Tạo mật khẩu lần đầu" (không bắt nhập mật khẩu cũ).
2. **Tính Duy Nhất Của Username:** Quá trình Backend tự động cắt ký tự từ Email để sinh Username cần đi kèm logic kiểm tra trùng (exists) và thêm hậu tố ngẫu nhiên (VD: từ `hoang@gmail.com` $\rightarrow$ `hoang_1`, `hoang_2`) để đảm bảo không bị lỗi Insert.
