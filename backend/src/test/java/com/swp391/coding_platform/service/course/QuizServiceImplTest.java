package com.swp391.coding_platform.service.course;

import com.swp391.coding_platform.dto.request.QuizSubmitRequest;
import com.swp391.coding_platform.dto.response.QuizDetailResponse;
import com.swp391.coding_platform.entity.course.QuizEntity;
import com.swp391.coding_platform.entity.course.LessonEntity;
import com.swp391.coding_platform.entity.enums.LessonStatus;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.mapper.QuizMapper;
import com.swp391.coding_platform.repository.course.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class QuizServiceImplTest {

    @Mock
    private QuizRepository quizRepository;
    @Mock
    private QuizQuestionRepository quizQuestionRepository;
    @Mock
    private QuizAttemptRepository quizAttemptRepository;
    @Mock
    private QuizAttemptAnswerRepository quizAttemptAnswerRepository;
    @Mock
    private QuizMapper quizMapper;

    @InjectMocks
    private QuizServiceImpl quizService;

    @Test
    void getQuizDetailByLessonId_NotFound_ThrowsException() {
        when(quizRepository.findByLessonId(1)).thenReturn(Optional.empty());

        assertThrows(AppException.class, () -> quizService.getQuizDetailByLessonId(1, 1));
    }

    @Test
    void getQuizDetailByLessonId_InactiveLesson_ThrowsException() {
        QuizEntity quiz = new QuizEntity();
        LessonEntity lesson = new LessonEntity();
        lesson.setStatus(LessonStatus.INACTIVE);
        quiz.setLesson(lesson);

        when(quizRepository.findByLessonId(1)).thenReturn(Optional.of(quiz));

        assertThrows(AppException.class, () -> quizService.getQuizDetailByLessonId(1, 1));
    }

    @Test
    void getQuizDetailByLessonId_Success_NotSubmitted() {
        QuizEntity quiz = new QuizEntity();
        quiz.setId(1);
        quiz.setTitle("Test Quiz");

        when(quizRepository.findByLessonId(1)).thenReturn(Optional.of(quiz));
        when(quizQuestionRepository.findByQuizIdWithOptions(1)).thenReturn(Collections.emptyList());
        when(quizAttemptRepository.findTopByUserIdAndQuizIdOrderBySubmittedAtDesc(1, 1)).thenReturn(Optional.empty());

        QuizDetailResponse response = quizService.getQuizDetailByLessonId(1, 1);

        assertNotNull(response);
        assertFalse(response.getSubmitted());
        assertEquals("Test Quiz", response.getTitle());
    }

    @Test
    void submitQuiz_QuizNotFound_ThrowsException() {
        QuizSubmitRequest request = new QuizSubmitRequest();
        when(quizRepository.findById(1)).thenReturn(Optional.empty());

        assertThrows(AppException.class, () -> quizService.submitQuiz(1, 1, request));
    }
}
