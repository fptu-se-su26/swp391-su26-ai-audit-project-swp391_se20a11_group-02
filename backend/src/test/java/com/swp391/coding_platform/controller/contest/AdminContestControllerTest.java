package com.swp391.coding_platform.controller.contest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.request.AdminContestProblemRequest;
import com.swp391.coding_platform.dto.request.AdminContestRequest;
import com.swp391.coding_platform.dto.response.AdminContestProblemResponse;
import com.swp391.coding_platform.dto.response.AdminContestResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.repository.user.UserDailyActivityRepository;
import com.swp391.coding_platform.service.contest.ContestService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

import java.time.Instant;
import java.util.Collections;
import java.util.List;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.parallel.Execution;
import org.junit.jupiter.api.parallel.ExecutionMode;

@WebMvcTest(controllers = AdminContestController.class)
@AutoConfigureMockMvc(addFilters = false)
@Execution(ExecutionMode.SAME_THREAD)
class AdminContestControllerTest {

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

    @BeforeEach
    void setUp() {
        reset(contestService);
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void getAdminContests_shouldReturnOk() throws Exception {
        AdminContestResponse response = AdminContestResponse.builder()
                .id(1)
                .title("Admin Contest")
                .status("PUBLISHED")
                .build();

        PageResponse<AdminContestResponse> pageResponse = PageResponse.<AdminContestResponse>builder()
                .content(Collections.singletonList(response))
                .page(0)
                .size(10)
                .totalElements(1L)
                .totalPages(1)
                .build();

        doReturn(pageResponse).when(contestService).getAdminContests(anyInt(), anyInt(), anyString(), anyString());

        mockMvc.perform(get("/admin/contests"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000))
                .andExpect(jsonPath("$.result.content[0].id").value(1))
                .andExpect(jsonPath("$.result.content[0].title").value("Admin Contest"));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void createContest_shouldReturnOk() throws Exception {
        AdminContestRequest req = AdminContestRequest.builder()
                .title("New Math Contest")
                .scoringRule("ICPC")
                .startTime(Instant.now())
                .endTime(Instant.now().plusSeconds(3600))
                .reward1st(java.math.BigDecimal.valueOf(1000))
                .reward2nd(java.math.BigDecimal.valueOf(500))
                .reward3rd(java.math.BigDecimal.valueOf(250))
                .build();
        
        AdminContestResponse res = AdminContestResponse.builder()
                .id(5)
                .title("New Math Contest")
                .reward1st(java.math.BigDecimal.valueOf(1000))
                .reward2nd(java.math.BigDecimal.valueOf(500))
                .reward3rd(java.math.BigDecimal.valueOf(250))
                .build();
        doReturn(res).when(contestService).createAdminContest(any(), any());

        mockMvc.perform(post("/admin/contests")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(req)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.id").value(5))
                .andExpect(jsonPath("$.result.title").value("New Math Contest"))
                .andExpect(jsonPath("$.result.reward1st").value(1000));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void createContest_NegativeReward_shouldReturnBadRequest() throws Exception {
        AdminContestRequest req = AdminContestRequest.builder()
                .title("Invalid Reward Contest")
                .scoringRule("ICPC")
                .startTime(Instant.now())
                .endTime(Instant.now().plusSeconds(3600))
                .reward1st(java.math.BigDecimal.valueOf(-100))
                .build();

        mockMvc.perform(post("/admin/contests")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(req)))
                .andExpect(status().isBadRequest());
    }


    @Test
    @WithMockUser(roles = "ADMIN")
    void getContestById_shouldReturnOk() throws Exception {
        AdminContestResponse res = AdminContestResponse.builder().id(10).title("Specific Match").build();
        doReturn(res).when(contestService).getAdminContestById(any());

        mockMvc.perform(get("/admin/contests/10"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.title").value("Specific Match"));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void updateContest_shouldReturnOk() throws Exception {
        AdminContestRequest req = AdminContestRequest.builder()
                .title("Updated Title")
                .scoringRule("ICPC")
                .startTime(Instant.now())
                .endTime(Instant.now().plusSeconds(3600))
                .build();

        AdminContestResponse res = AdminContestResponse.builder().id(10).title("Updated Title").build();
        doReturn(res).when(contestService).updateAdminContest(any(), any());

        mockMvc.perform(put("/admin/contests/10")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(req)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.title").value("Updated Title"));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void deleteContest_shouldReturnOk() throws Exception {
        mockMvc.perform(delete("/admin/contests/10"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value("Deleted/Cancelled contest successfully"));

        verify(contestService, times(1)).deleteAdminContest(10);
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void publishContest_shouldReturnOk() throws Exception {
        AdminContestResponse res = AdminContestResponse.builder().id(10).databaseStatus("PUBLISHED").build();
        doReturn(res).when(contestService).publishAdminContest(any());

        mockMvc.perform(put("/admin/contests/10/publish"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.databaseStatus").value("PUBLISHED"));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void unpublishContest_shouldReturnOk() throws Exception {
        AdminContestResponse res = AdminContestResponse.builder().id(10).databaseStatus("DRAFT").build();
        doReturn(res).when(contestService).unpublishAdminContest(any());

        mockMvc.perform(put("/admin/contests/10/unpublish"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.databaseStatus").value("DRAFT"));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void restoreContest_shouldReturnOk() throws Exception {
        AdminContestResponse res = AdminContestResponse.builder().id(10).databaseStatus("DRAFT").build();
        doReturn(res).when(contestService).restoreAdminContest(any());

        mockMvc.perform(put("/admin/contests/10/restore"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result.databaseStatus").value("DRAFT"));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void hardDeleteContest_shouldReturnOk() throws Exception {
        mockMvc.perform(delete("/admin/contests/10/hard"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value("Permanently deleted contest successfully"));

        verify(contestService, times(1)).hardDeleteAdminContest(10);
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void getContestProblems_shouldReturnOk() throws Exception {
        AdminContestProblemResponse prob = AdminContestProblemResponse.builder().problemId(100).title("Sum").build();
        doReturn(List.of(prob)).when(contestService).getAdminContestProblems(any());

        mockMvc.perform(get("/admin/contests/10/problems"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.result[0].title").value("Sum"));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void addProblemToContest_shouldReturnOk() throws Exception {
        AdminContestProblemRequest req = new AdminContestProblemRequest();
        req.setProblemId(100);
        req.setOrderIndex(1);

        mockMvc.perform(post("/admin/contests/10/problems")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(req)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value("Added problem to contest successfully"));

        verify(contestService, times(1)).addProblemToContest(any(), any());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void removeProblemFromContest_shouldReturnOk() throws Exception {
        mockMvc.perform(delete("/admin/contests/10/problems/100"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value("Removed problem from contest successfully"));

        verify(contestService, times(1)).removeProblemFromContest(10, 100);
    }
}
