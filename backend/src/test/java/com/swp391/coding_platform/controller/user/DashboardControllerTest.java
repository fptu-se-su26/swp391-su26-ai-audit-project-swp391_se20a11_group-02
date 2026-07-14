package com.swp391.coding_platform.controller.user;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.response.DashboardStatsResponse;
import com.swp391.coding_platform.service.user.DashboardService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(controllers = DashboardController.class)
@AutoConfigureMockMvc(addFilters = false)
public class DashboardControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private DashboardService dashboardService;

    @MockBean
    private JdbcTemplate jdbcTemplate;

    @MockBean
    private com.swp391.coding_platform.repository.user.UserDailyActivityRepository userDailyActivityRepository;

    @Test
    public void getDashboardStats_ShouldReturnOk() throws Exception {
        when(dashboardService.getDashboardStats(any())).thenReturn(new DashboardStatsResponse());

        mockMvc.perform(get("/me/dashboard-stats")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    public void getUserActivities_ShouldReturnOk() throws Exception {
        when(dashboardService.getUserActivitiesByYear(any(), org.mockito.ArgumentMatchers.anyInt())).thenReturn(com.swp391.coding_platform.dto.response.UserActivityResponse.builder().build());

        mockMvc.perform(get("/me/activities")
                .param("year", "2024")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }
}
