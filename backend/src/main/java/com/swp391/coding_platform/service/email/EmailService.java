package com.swp391.coding_platform.service.email;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class EmailService {

    final JavaMailSender mailSender;

    @Value("${spring.mail.username:}")
    String fromEmail;

    @Value("${spring.mail.password:}")
    String mailPassword;

    @Async
    public void sendOtpEmail(String toEmail, String otpCode) {
        // Log hiển thị OTP trên Console để dễ dàng dev / test tại localhost
        log.info("==============================================");
        log.info("===> [LOCAL DEV OTP CODE FOR {}]: {} <===", toEmail, otpCode);
        log.info("==============================================");

        if (fromEmail == null || fromEmail.isBlank() || mailPassword == null || mailPassword.isBlank()) {
            log.warn("Chưa cấu hình SPRING_MAIL_USERNAME hoặc SPRING_MAIL_PASSWORD. Bạn có thể lấy mã OTP ở log trên để test!");
            return;
        }

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom(new jakarta.mail.internet.InternetAddress(fromEmail.trim(), "Coding Platform Support", "UTF-8"));
            helper.setTo(toEmail);
            helper.setSubject("Mã OTP Quên mật khẩu - Coding Platform");

            String htmlContent = buildOtpEmailTemplate(otpCode);
            helper.setText(htmlContent, true);

            mailSender.send(message);
            log.info("Successfully sent OTP email to {}", toEmail);
        } catch (MessagingException e) {
            log.error("Lỗi tạo email OTP gửi tới {}: {}", toEmail, e.getMessage());
        } catch (Exception e) {
            log.error("Không thể kết nối Mail Server (Lỗi mật khẩu hoặc SMTP): {}", e.getMessage());
        }
    }

    private String buildOtpEmailTemplate(String otpCode) {
        return """
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <style>
                    body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; margin: 0; padding: 20px; }
                    .container { max-width: 500px; margin: 0 auto; background-color: #ffffff; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.08); }
                    .header { background: linear-gradient(135deg, #4F46E5, #6366F1); padding: 30px; text-align: center; color: #ffffff; }
                    .header h1 { margin: 0; font-size: 24px; font-weight: 700; }
                    .content { padding: 30px; text-align: center; color: #333333; }
                    .content p { font-size: 15px; line-height: 1.6; color: #555555; margin-bottom: 25px; }
                    .otp-box { display: inline-block; background-color: #EEF2FF; border: 2px dashed #6366F1; border-radius: 8px; padding: 15px 35px; font-size: 32px; font-weight: 800; letter-spacing: 8px; color: #4F46E5; margin: 10px 0 25px 0; }
                    .footer { background-color: #f9fafb; padding: 20px; text-align: center; font-size: 12px; color: #9ca3af; border-top: 1px solid #f3f4f6; }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <h1>Coding Platform</h1>
                    </div>
                    <div class="content">
                        <h2>Yêu cầu đặt lại mật khẩu</h2>
                        <p>Bạn nhận được email này vì đã yêu cầu đặt lại mật khẩu. Sử dụng mã OTP bên dưới để tiếp tục quy trình:</p>
                        <div class="otp-box">%s</div>
                        <p>Mã OTP này có hiệu lực trong <strong>5 phút</strong>. Vui lòng không chia sẻ mã này với bất kỳ ai.</p>
                    </div>
                    <div class="footer">
                        <p>Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này.</p>
                    </div>
                </div>
            </body>
            </html>
            """.formatted(otpCode);
    }
}
