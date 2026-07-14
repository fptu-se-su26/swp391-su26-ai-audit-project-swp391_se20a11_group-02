package com.swp391.coding_platform.service.problem;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.response.ProblemListItemResponse;
import com.swp391.coding_platform.entity.enums.ProblemScope;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.repository.problem.ProblemCommentRepository;
import com.swp391.coding_platform.repository.problem.ProblemRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import com.swp391.coding_platform.repository.problem.ProblemTagMappingRepository;
import com.swp391.coding_platform.repository.problem.ProblemTagRepository;
import com.swp391.coding_platform.repository.problem.ProblemTestcaseRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class UserProblemServiceTest {

    @Mock
    private ProblemRepository problemRepository;
    @Mock
    private ProblemTagMappingRepository problemTagMappingRepository;
    @Mock
    private ProblemSubmissionRepository problemSubmissionRepository;
    @Mock
    private ProblemCommentRepository problemCommentRepository;
    @Mock
    private UserRepository userRepository;
    @Mock
    private ProblemTestcaseRepository problemTestcaseRepository;
    @Mock
    private ProblemTagRepository problemTagRepository;

    @InjectMocks
    private UserProblemService userProblemService;

    private ProblemEntity mockProblem;

    @BeforeEach
    void setUp() {
        com.swp391.coding_platform.entity.problem.ProblemVersionEntity mockVersion = com.swp391.coding_platform.entity.problem.ProblemVersionEntity.builder()
                .title("Test Problem")
                .isActive(true)
                .build();
        
        mockProblem = ProblemEntity.builder()
                .id(1)
                .isActive(true)
                .isPublic(true)
                .problemScope(ProblemScope.PRACTICE)
                .versions(new java.util.ArrayList<>(java.util.List.of(mockVersion)))
                .build();
    }

    @Test
    void getProblems_success() {
        when(problemRepository.findByProblemScopeInAndIsActiveTrueAndIsPublicTrue(anyList()))
                .thenReturn(List.of(mockProblem));
        when(problemTagMappingRepository.findByProblemIdIn(anyList()))
                .thenReturn(Collections.emptyList());
        when(problemSubmissionRepository.findByUserIdAndProblemIdIn(eq(1), anyList()))
                .thenReturn(Collections.emptyList());

        List<ProblemListItemResponse> result = userProblemService.getProblems(1);

        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals(1, result.get(0).getId());
        assertEquals("Test Problem", result.get(0).getTitle());
    }

    @Test
    void getProblems_empty() {
        when(problemRepository.findByProblemScopeInAndIsActiveTrueAndIsPublicTrue(anyList()))
                .thenReturn(Collections.emptyList());

        List<ProblemListItemResponse> result = userProblemService.getProblems(1);

        assertNotNull(result);
        assertTrue(result.isEmpty());
    }
}
