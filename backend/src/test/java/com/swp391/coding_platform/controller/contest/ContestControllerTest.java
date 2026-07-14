package com.swp391.coding_platform.controller.contest;

import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.jdbc.core.JdbcTemplate;
import com.swp391.coding_platform.repository.user.UserDailyActivityRepository;

import com.swp391.coding_platform.dto.request.ContestSearchRequest;
import com.swp391.coding_platform.dto.response.ContestResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.service.contest.ContestService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
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
}
