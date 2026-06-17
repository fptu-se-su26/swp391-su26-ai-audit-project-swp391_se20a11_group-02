package com.swp391.coding_platform.service.moderation;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@Service
@Slf4j
public class AudioProcessingService {

    public File extractAudioFromVideo(String videoUrl, String targetAudioPath) throws IOException, InterruptedException {
        log.info("Bắt đầu trích xuất âm thanh từ Video URL: {}", videoUrl);

        // Tạo thư mục tạm nếu chưa tồn tại
        File targetFile = new File(targetAudioPath);
        File parentDir = targetFile.getParentFile();
        if (parentDir != null && !parentDir.exists()) {
            parentDir.mkdirs();
        }

        // Lệnh FFmpeg tách audio chất lượng vừa phải, mono, nén 32k giúp giảm dung lượng mạng truyền đi 90%
        ProcessBuilder pb = new ProcessBuilder(
            "ffmpeg", "-y",
            "-i", videoUrl,
            "-vn",                  // Loại bỏ video track
            "-acodec", "libmp3lame",// Sử dụng mp3
            "-ac", "1",             // Kênh đơn (mono)
            "-ar", "16000",         // 16kHz
            "-ab", "32k",           // Bitrate 32kbps
            targetAudioPath
        );

        pb.redirectErrorStream(true);
        Process process = pb.start();
        int exitCode = process.waitFor();

        if (exitCode != 0) {
            log.error("Tách âm thanh bằng FFmpeg thất bại. Lệnh trả về mã lỗi: {}", exitCode);
            throw new IOException("Lệnh trích xuất âm thanh FFmpeg thất bại.");
        }

        log.info("Trích xuất và nén âm thanh thành công tại: {}", targetAudioPath);
        return targetFile;
    }
}
