package com.swp391.coding_platform.service.problem;

import com.swp391.coding_platform.dto.request.AdminProblemRequest;
import com.swp391.coding_platform.dto.response.AdminProblemResponse;
import com.swp391.coding_platform.entity.enums.ProblemScope;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.problem.ProblemVersionEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.repository.problem.*;
import com.swp391.coding_platform.repository.user.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class AdminProblemServiceTest {

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
    @Mock
    private ProblemVersionRepository problemVersionRepository;

    @InjectMocks
    private AdminProblemService adminProblemService;

    @Test
    void getAdminProblems_Success() {
        ProblemEntity problem = new ProblemEntity();
        problem.setId(1);
        problem.setProblemScope(ProblemScope.PRACTICE);
        problem.setIsActive(true);
        problem.setTotalTestcase(5);
        ProblemVersionEntity version = new ProblemVersionEntity();
        version.setTitle("Test Problem");
        problem.setCurrentVersion(version);

        when(problemRepository.findByProblemScopeIn(anyList()))
                .thenReturn(Collections.singletonList(problem));
        when(problemTagMappingRepository.findByProblemId(1))
                .thenReturn(Collections.emptyList());

        List<AdminProblemResponse> result = adminProblemService.getAdminProblems();

        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals("Test Problem", result.get(0).getTitle());
    }

    @Test
    void createAdminProblem_UserNotFound_ThrowsException() {
        AdminProblemRequest request = new AdminProblemRequest();
        when(userRepository.findById(1)).thenReturn(Optional.empty());

        assertThrows(AppException.class, () -> adminProblemService.createAdminProblem(request, 1));
        verify(problemRepository, never()).save(any());
    }

    @Test
    void updateAdminProblem_ProblemNotFound_ThrowsException() {
        AdminProblemRequest request = new AdminProblemRequest();
        when(problemRepository.findById(1)).thenReturn(Optional.empty());

        assertThrows(AppException.class, () -> adminProblemService.updateAdminProblem(1, request));
        verify(problemRepository, never()).save(any());
    }
}
