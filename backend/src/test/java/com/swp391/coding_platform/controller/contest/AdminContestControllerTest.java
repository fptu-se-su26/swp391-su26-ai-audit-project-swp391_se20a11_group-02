package com.swp391.coding_platform.controller.contest;

import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.jdbc.core.JdbcTemplate;
import com.swp391.coding_platform.repository.user.UserDailyActivityRepository;

import com.swp391.coding_platform.dto.response.AdminContestResponse;
import com.swp391.coding_platform.service.contest.ContestService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(controllers = AdminContestController.class)

@AutoConfigureMockMvc(addFilters = false)
class AdminContestControllerTest {

    @MockBean
    private JdbcTemplate jdbcTemplate;

    @MockBean
    private UserDailyActivityRepository userDailyActivityRepository;

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ContestService contestService;

    @Test
    @WithMockUser(roles = "ADMIN")
    void getAdminContests_shouldReturnOk() throws Exception {
        AdminContestResponse response = AdminContestResponse.builder()
                .id(1)
                .title("Admin Contest")
                .status("PUBLISHED")
                .build();

        when(contestService.getAdminContests()).thenReturn(Collections.singletonList(response));

        mockMvc.perform(get("/admin/contests"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000))
                .andExpect(jsonPath("$.result[0].id").value(1))
                .andExpect(jsonPath("$.result[0].title").value("Admin Contest"));
    }
}
