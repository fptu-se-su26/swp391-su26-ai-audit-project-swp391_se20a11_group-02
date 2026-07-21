# Stage 1: Build
FROM node:20-alpine AS build
WORKDIR /app

# Sao chép files cấu hình package
COPY package*.json ./

# Cài đặt dependencies
RUN npm ci

# Sao chép toàn bộ mã nguồn
COPY . .

# Khai báo các đối số và biến môi trường khi build (Vite inject lúc compile)
ARG VITE_API_BASE_URL
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL

ARG VITE_GOOGLE_CLIENT_ID
ENV VITE_GOOGLE_CLIENT_ID=$VITE_GOOGLE_CLIENT_ID

# Build project ra thư mục dist
RUN npm run build

# Stage 2: Serve
FROM nginx:1.25-alpine

# Sao chép build output sang thư mục serve của Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Sao chép file cấu hình Nginx custom
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Mở port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
