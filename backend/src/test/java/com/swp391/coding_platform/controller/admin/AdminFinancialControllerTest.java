package com.swp391.coding_platform.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.service.admin.AdminFinancialService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@AutoConfigureMockMvc(addFilters = false)
@WebMvcTest(controllers = AdminFinancialController.class)

public class AdminFinancialControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private AdminFinancialService adminFinancialService;

    @MockBean
    private JdbcTemplate jdbcTemplate;

    @MockBean
    private com.swp391.coding_platform.repository.user.UserDailyActivityRepository userDailyActivityRepository;

    @Test
    public void getMonthlyRecords_ShouldReturnOk() throws Exception {
        when(adminFinancialService.getMonthlyFinancialRecords()).thenReturn(List.of());

        mockMvc.perform(get("/admin/financial/monthly-records")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    public void getTopCourses_ShouldReturnOk() throws Exception {
        when(adminFinancialService.getTopRevenueCoursesData()).thenReturn(List.of());

        mockMvc.perform(get("/admin/financial/top-courses")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }
}
