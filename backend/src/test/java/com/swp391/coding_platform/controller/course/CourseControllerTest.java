package com.swp391.coding_platform.controller.course;

import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.jdbc.core.JdbcTemplate;
import com.swp391.coding_platform.repository.user.UserDailyActivityRepository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.request.CourseSearchRequest;
import com.swp391.coding_platform.dto.response.CourseDetailResponse;
import com.swp391.coding_platform.dto.response.CourseListItemResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.service.course.CourseService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.jwt;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(CourseController.class)
class CourseControllerTest {

    @MockBean
    private JdbcTemplate jdbcTemplate;

    @MockBean
    private UserDailyActivityRepository userDailyActivityRepository;

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private CourseService courseService;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    void getCourseList_ShouldReturnList() throws Exception {
        CourseListItemResponse item = new CourseListItemResponse();
        item.setId(1L);
        item.setTitle("Java Basics");

        PageResponse<CourseListItemResponse> pageResponse = PageResponse.from(new PageImpl<>(List.of(item)));

        when(courseService.getCourseList(eq(1L), any(CourseSearchRequest.class), any(Pageable.class)))
                .thenReturn(pageResponse);

        Jwt mockJwt = Jwt.withTokenValue("mock-token")
                .header("alg", "none")
                .claim("userId", 1)
                .build();

        mockMvc.perform(get("/courses")
                        .with(jwt().jwt(mockJwt))
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000))
                .andExpect(jsonPath("$.result.content[0].id").value(1))
                .andExpect(jsonPath("$.result.content[0].title").value("Java Basics"));
    }

    @Test
    void getCourseDetail_ShouldReturnDetail() throws Exception {
        CourseDetailResponse detail = new CourseDetailResponse();
        detail.setId(1L);
        detail.setTitle("Advanced Java");

        when(courseService.getCourseDetail(1L, 1L)).thenReturn(detail);

        Jwt mockJwt = Jwt.withTokenValue("mock-token")
                .header("alg", "none")
                .claim("userId", 1)
                .build();

        mockMvc.perform(get("/courses/1")
                        .with(jwt().jwt(mockJwt)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(1000))
                .andExpect(jsonPath("$.result.title").value("Advanced Java"));
    }
}
