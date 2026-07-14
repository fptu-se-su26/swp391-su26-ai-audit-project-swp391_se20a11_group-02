package com.swp391.coding_platform.controller.problem;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.response.AdminProblemResponse;
import com.swp391.coding_platform.service.problem.AdminProblemService;
import com.swp391.coding_platform.service.problem.ProblemTagService;
import com.swp391.coding_platform.service.problem.ProblemTestcaseService;
import com.swp391.coding_platform.service.problem.UserProblemService;
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
@WebMvcTest(controllers = AdminProblemController.class)

public class AdminProblemControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private AdminProblemService adminProblemService;

    @MockBean
    private ProblemTagService problemTagService;

    @MockBean
    private ProblemTestcaseService problemTestcaseService;

    @MockBean
    private UserProblemService userProblemService;

    @MockBean
    private JdbcTemplate jdbcTemplate;

    @MockBean
    private com.swp391.coding_platform.repository.user.UserDailyActivityRepository userDailyActivityRepository;

    @Test
    public void getProblems_ShouldReturnOk() throws Exception {
        when(adminProblemService.getAdminProblems()).thenReturn(List.of(new AdminProblemResponse()));

        mockMvc.perform(get("/admin/problems")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    public void getAllTags_ShouldReturnOk() throws Exception {
        when(problemTagService.getAllTags()).thenReturn(List.of());

        mockMvc.perform(get("/admin/problems/tags")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }
}
