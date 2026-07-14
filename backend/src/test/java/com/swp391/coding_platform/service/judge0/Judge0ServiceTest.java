package com.swp391.coding_platform.service.judge0;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.judge0.Judge0BatchRequest;
import com.swp391.coding_platform.dto.judge0.Judge0CallbackPayload;
import com.swp391.coding_platform.dto.judge0.Judge0CallbackPayload.Judge0Status;
import com.swp391.coding_platform.dto.judge0.Judge0TokenResponse;
import com.swp391.coding_platform.dto.request.OjSubmissionRequest;
import com.swp391.coding_platform.dto.response.OjSubmissionInitialResponse;
import com.swp391.coding_platform.entity.enums.OjVerdict;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionDetailEntity;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionEntity;
import com.swp391.coding_platform.entity.problem.ProblemTestcaseEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.contest.ContestProblemRepository;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.course.LessonProblemRepository;
import com.swp391.coding_platform.repository.course.LessonRepository;
import com.swp391.coding_platform.repository.problem.ProblemRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionDetailRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import com.swp391.coding_platform.repository.problem.ProblemTestcaseRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;

import java.time.Duration;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class Judge0ServiceTest {

    @Mock
    private ProblemSubmissionRepository problemSubmissionRepository;
    @Mock
    private ProblemSubmissionDetailRepository problemSubmissionDetailRepository;
    @Mock
    private ProblemTestcaseRepository problemTestcaseRepository;
    @Mock
    private UserRepository userRepository;
    @Mock
    private ProblemRepository problemRepository;
    @Mock
    private LessonRepository lessonRepository;
    @Mock
    private ContestRepository contestRepository;
    @Mock
    private ContestProblemRepository contestProblemRepository;
    @Mock
    private LessonProblemRepository lessonProblemRepository;
    @Mock
    private Judge0ClientService judge0ClientService;
    @Mock
    private SimpMessagingTemplate simpMessagingTemplate;
    @Mock
    private StringRedisTemplate stringRedisTemplate;
    @Mock
    private ObjectMapper objectMapper;
    @Mock
    private ValueOperations<String, String> valueOperations;

    @InjectMocks
    private Judge0Service judge0Service;

    private UserEntity mockUser;
    private ProblemEntity mockProblem;
    private ProblemTestcaseEntity mockTestcase;

    @BeforeEach
    void setUp() {
        mockUser = UserEntity.builder().id(1).status(com.swp391.coding_platform.entity.enums.UserStatus.ACTIVE).build();
        
        com.swp391.coding_platform.entity.problem.ProblemVersionEntity mockVersion = com.swp391.coding_platform.entity.problem.ProblemVersionEntity.builder()
                .id(1)
                .isActive(true)
                .timeLimitMs(1000)
                .memoryLimitKb(128000)
                .build();
                
        mockProblem = ProblemEntity.builder()
                .id(1)
                .isPublic(true)
                .versions(new java.util.ArrayList<>(java.util.List.of(mockVersion)))
                .build();
        mockVersion.setProblem(mockProblem);
        
        mockTestcase = ProblemTestcaseEntity.builder().id(1).inputData("1 2").expectedOutput("3").build();
    }

    @Test
    void submitCode_success() {
        OjSubmissionRequest request = new OjSubmissionRequest();
        request.setProblemId(1);
        request.setLanguageId(71);
        request.setSourceCode("print(sum(map(int, input().split())))");

        when(userRepository.findById(1)).thenReturn(Optional.of(mockUser));
        when(problemRepository.findByIdAndIsActiveTrueAndIsPublicTrue(1)).thenReturn(Optional.of(mockProblem));
        when(problemTestcaseRepository.findByProblemVersionIdOrderByOrderIndex(1)).thenReturn(List.of(mockTestcase));

        Judge0TokenResponse tokenResponse = new Judge0TokenResponse();
        tokenResponse.setToken("token123");
        when(judge0ClientService.sendBatchSubmission(any(Judge0BatchRequest.class))).thenReturn(List.of(tokenResponse));
        when(userRepository.getReferenceById(1)).thenReturn(mockUser);
        when(problemRepository.getReferenceById(1)).thenReturn(mockProblem);

        OjSubmissionInitialResponse response = judge0Service.submitCode(request, 1);

        assertNotNull(response);
        assertEquals(OjVerdict.PENDING.toString(), response.getStatus());
        verify(problemSubmissionRepository, times(1)).save(any(ProblemSubmissionEntity.class));
        verify(problemSubmissionDetailRepository, times(1)).saveAll(anyList());
        verify(problemRepository, times(1)).incrementTotalSubmission(1);
    }

    @Test
    void submitCode_userNotFound() {
        OjSubmissionRequest request = new OjSubmissionRequest();
        when(userRepository.findById(1)).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> judge0Service.submitCode(request, 1));
        assertEquals(ErrorCode.USER_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void submitCode_problemNotFound() {
        OjSubmissionRequest request = new OjSubmissionRequest();
        request.setProblemId(1);
        when(userRepository.findById(1)).thenReturn(Optional.of(mockUser));
        when(problemRepository.findByIdAndIsActiveTrueAndIsPublicTrue(1)).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> judge0Service.submitCode(request, 1));
        assertEquals(ErrorCode.OJ_PROBLEM_NOT_FOUND, ex.getErrorCode());
    }
}
