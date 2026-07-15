package com.swp391.coding_platform.controller.contest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.request.ContestRegisterRequest;
import com.swp391.coding_platform.dto.request.ContestSearchRequest;
import com.swp391.coding_platform.dto.response.*;
import com.swp391.coding_platform.repository.user.UserDailyActivityRepository;
import com.swp391.coding_platform.service.contest.ContestService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(controllers = ContestController.class)
@AutoConfigureMockMvc(addFilters = false)
class ContestControllerTest {

    @MockBean
    private JdbcTemplate jdbcTemplate;

    @MockBean
    private UserDailyActivityRepository userDailyActivityRepository;

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ContestService contestService;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    void getContests_shouldReturnOk() throws Exception {
        ContestResponse response = ContestResponse.builder()
                .id(1)
                .title("Weekly Contest 1")
                .status("ONGOING")
                .build();
        
        PageResponse<ContestResponse> pageResponse = new PageResponse<>();
        pageResponse.setContent(Collections.singletonList(response));

        when(contestService.getContests(any(ContestSearchRequest.class), any())).thenReturn(pageResponse);

        mockMvc.perform(get("/contests"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000))
                .andExpect(jsonPath("$.result.content[0].id").value(1))
                .andExpect(jsonPath("$.result.content[0].title").value("Weekly Contest 1"));
    }

    @Test
    void getBannerContest_shouldReturnOk() throws Exception {
        ContestResponse response = ContestResponse.builder().id(2).title("Banner Contest").build();
        when(contestService.getBannerContest(any())).thenReturn(response);

        mockMvc.perform(get("/contests/banner"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.id").value(2))
                .andExpect(jsonPath("$.result.title").value("Banner Contest"));
    }

    @Test
    void getUserStats_shouldReturnOk() throws Exception {
        ContestUserStatsResponse stats = ContestUserStatsResponse.builder().displayName("Alice").score(1500).build();
        when(contestService.getUserStats(any())).thenReturn(stats);

        mockMvc.perform(get("/contests/user-stats"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.displayName").value("Alice"))
                .andExpect(jsonPath("$.result.score").value(1500));
    }

    @Test
    void getMyContestStats_shouldReturnOk() throws Exception {
        MyContestStatsResponse stats = MyContestStatsResponse.builder().totalContests(5L).build();
        when(contestService.getMyContestStats(any())).thenReturn(stats);

        mockMvc.perform(get("/contests/my-stats"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.totalContests").value(5));
    }

    @Test
    void getMyContestHistory_shouldReturnOk() throws Exception {
        MyContestHistoryResponse history = MyContestHistoryResponse.builder().title("Match 1").rank(3).build();
        when(contestService.getMyContestHistory(any())).thenReturn(List.of(history));

        mockMvc.perform(get("/contests/my-history"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result[0].title").value("Match 1"))
                .andExpect(jsonPath("$.result[0].rank").value(3));
    }

    @Test
    void getContestById_shouldReturnOk() throws Exception {
        ContestResponse response = ContestResponse.builder().id(10).title("Specific Match").build();
        when(contestService.getContestById(eq(10), any())).thenReturn(response);

        mockMvc.perform(get("/contests/10"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.title").value("Specific Match"));
    }

    @Test
    void registerForContest_shouldReturnOk() throws Exception {
        ContestRegisterRequest req = new ContestRegisterRequest("password123");

        mockMvc.perform(post("/contests/10/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(req)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value("Registered for contest successfully"));

        verify(contestService, times(1)).registerForContest(eq(10), any(), any(ContestRegisterRequest.class));
    }

    @Test
    void getContestProblems_shouldReturnOk() throws Exception {
        ContestProblemResponse prob = ContestProblemResponse.builder().problemId(100).title("Solve Two Sum").build();
        when(contestService.getContestProblems(eq(10), any(), anyBoolean())).thenReturn(List.of(prob));

        mockMvc.perform(get("/contests/10/problems"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result[0].title").value("Solve Two Sum"));
    }

    @Test
    void getContestProblemDetail_shouldReturnOk() throws Exception {
        ContestProblemDetailResponse detail = ContestProblemDetailResponse.builder().id(100).title("Sum").description("Desc").build();
        when(contestService.getContestProblemDetail(eq(10), eq(100), any(), anyBoolean())).thenReturn(detail);

        mockMvc.perform(get("/contests/10/problems/100"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.title").value("Sum"));
    }

    @Test
    void getContestSubmissions_shouldReturnOk() throws Exception {
        ContestSubmissionResponse sub = ContestSubmissionResponse.builder().id(500).problemTitle("Two Sum").status("ACCEPTED").build();
        when(contestService.getContestSubmissions(eq(10), any(), anyBoolean())).thenReturn(List.of(sub));

        mockMvc.perform(get("/contests/10/submissions"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result[0].status").value("ACCEPTED"));
    }
}
