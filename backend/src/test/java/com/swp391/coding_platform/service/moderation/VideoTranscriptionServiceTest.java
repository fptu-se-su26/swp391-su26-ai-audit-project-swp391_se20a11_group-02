package com.swp391.coding_platform.service.moderation;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import java.io.File;
import java.nio.file.Files;
import java.util.concurrent.CompletableFuture;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class VideoTranscriptionServiceTest {

    @Mock
    private AudioProcessingService audioService;

    @Mock
    private ObjectMapper objectMapper;

    @InjectMocks
    private VideoTranscriptionService transcriptionService;

    @BeforeEach
    void setUp() {
        ReflectionTestUtils.setField(transcriptionService, "openAiApiKey", "test-key");
        ReflectionTestUtils.setField(transcriptionService, "geminiApiKey", "");
    }

    @Test
    void transcribeVideoAsync_AudioExtractionFails_ReturnsError() throws Exception {
        Long courseId = 1L;
        Long lessonId = 2L;
        String videoUrl = "http://example.com/video.mp4";

        when(audioService.extractAudioFromVideo(eq(videoUrl), anyString())).thenThrow(new RuntimeException("Extraction Failed"));

        CompletableFuture<String> future = transcriptionService.transcribeVideoAsync(courseId, lessonId, videoUrl);
        String result = future.join();

        assertTrue(result.contains("[SYSTEM_ERROR: AUDIO_QUALITY_TOO_BAD]"));
        assertTrue(result.contains("Extraction Failed"));
    }

    @Test
    void transcribeVideoAsync_AudioTooSmall_ReturnsError() throws Exception {
        Long courseId = 1L;
        Long lessonId = 2L;
        String videoUrl = "http://example.com/video.mp4";

        File mockFile = File.createTempFile("test_audio", ".mp3");
        Files.write(mockFile.toPath(), "small".getBytes());

        when(audioService.extractAudioFromVideo(eq(videoUrl), anyString())).thenReturn(mockFile);

        CompletableFuture<String> future = transcriptionService.transcribeVideoAsync(courseId, lessonId, videoUrl);
        String result = future.join();

        assertEquals("[SYSTEM_ERROR: AUDIO_QUALITY_TOO_BAD] File âm thanh trích xuất bị lỗi hoặc rỗng.", result);
        mockFile.delete();
    }

    @Test
    void transcribeVideoAsync_WithoutGeminiKey_ReturnsMockTranscription() throws Exception {
        Long courseId = 1L;
        Long lessonId = 2L;
        String videoUrl = "http://example.com/video.mp4";

        File mockFile = File.createTempFile("test_audio", ".mp3");
        byte[] dummyBytes = new byte[2048]; // Needs to be >= 1024 bytes
        Files.write(mockFile.toPath(), dummyBytes);

        when(audioService.extractAudioFromVideo(eq(videoUrl), anyString())).thenReturn(mockFile);

        CompletableFuture<String> future = transcriptionService.transcribeVideoAsync(courseId, lessonId, videoUrl);
        String result = future.join();

        assertEquals("Xin chào các bạn. Đây là video bài giảng về lập trình.", result);
        mockFile.delete();
    }
}
