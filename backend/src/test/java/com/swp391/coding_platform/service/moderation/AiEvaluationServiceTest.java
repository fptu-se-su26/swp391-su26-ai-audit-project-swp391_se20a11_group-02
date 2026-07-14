package com.swp391.coding_platform.service.moderation;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.moderation.CourseModerationPayload;
import com.swp391.coding_platform.dto.moderation.ModerationResult;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.reactive.function.client.WebClient;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
class AiEvaluationServiceTest {

    @Mock
    private WebClient webClient;

    private ObjectMapper objectMapper;
    private AiEvaluationService aiEvaluationService;

    @BeforeEach
    void setUp() {
        objectMapper = new ObjectMapper();
        aiEvaluationService = new AiEvaluationService(webClient, objectMapper);
    }

    @Test
    void testEvaluateCourse_MissingApiKey_ReturnsMock() {
        ReflectionTestUtils.setField(aiEvaluationService, "geminiApiKey", "");
        CourseModerationPayload payload = new CourseModerationPayload();

        ModerationResult result = aiEvaluationService.evaluateCourse(payload);

        assertTrue(result.getIsClean());
        assertTrue(result.getCourseViolations().isEmpty());
        assertTrue(result.getLessonViolations().isEmpty());
    }

    @Test
    void testEvaluateSingleLesson_MissingApiKey_ReturnsMock() {
        ReflectionTestUtils.setField(aiEvaluationService, "geminiApiKey", null);
        CourseModerationPayload.LessonPayload payload = new CourseModerationPayload.LessonPayload();

        ModerationResult result = aiEvaluationService.evaluateSingleLesson(payload);

        assertTrue(result.getIsClean());
        assertTrue(result.getLessonViolations().isEmpty());
    }
}
