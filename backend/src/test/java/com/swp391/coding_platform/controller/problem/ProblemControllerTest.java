package com.swp391.coding_platform.controller.problem;

import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.jdbc.core.JdbcTemplate;
import com.swp391.coding_platform.repository.user.UserDailyActivityRepository;

import com.swp391.coding_platform.dto.response.ProblemListItemResponse;
import com.swp391.coding_platform.service.problem.UserProblemService;
import com.swp391.coding_platform.service.problem.ProblemSubmissionService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.jwt;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(controllers = ProblemController.class)
class ProblemControllerTest {

    @MockBean
    private JdbcTemplate jdbcTemplate;

    @MockBean
    private UserDailyActivityRepository userDailyActivityRepository;

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private UserProblemService userProblemService;

    @MockBean
    private ProblemSubmissionService problemSubmissionService;

    @MockBean
    private com.swp391.coding_platform.service.problem.ProblemCommentService problemCommentService;

    @Test
    void getProblems_shouldReturnOk() throws Exception {
        ProblemListItemResponse problem = ProblemListItemResponse.builder()
                .id(1)
                .title("Two Sum")
                .difficulty("Easy")
                .score(10)
                .isSolved(true)
                .build();

        when(userProblemService.getProblems(any())).thenReturn(Collections.singletonList(problem));

        Jwt jwt = Jwt.withTokenValue("token").header("alg", "none").claim("userId", 1).build();

        mockMvc.perform(get("/api/problems")
                        .with(jwt().jwt(jwt)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000))
                .andExpect(jsonPath("$.result[0].id").value(1))
                .andExpect(jsonPath("$.result[0].title").value("Two Sum"));
    }
}
