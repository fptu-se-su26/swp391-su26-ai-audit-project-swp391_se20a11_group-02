package com.swp391.coding_platform.controller.course;

import com.swp391.coding_platform.dto.request.CourseSearchRequest;
import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.dto.response.CourseListItemResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.service.course.CourseService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;

@Slf4j
@RestController
@RequestMapping("/courses")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CourseController {

    CourseService courseService;

    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<CourseListItemResponse>>> getCourseList(
            @AuthenticationPrincipal Jwt jwt,
            @Valid CourseSearchRequest courseSearchRequest){

        Long userId = null;
        if(jwt != null){
            userId = jwt.getClaim("userId");
        }

        Pageable pageable = courseSearchRequest.getPageable();

        var result = courseService.
                getCourseList(userId, courseSearchRequest, pageable);

        return ResponseEntity.ok(ApiResponse.<PageResponse<CourseListItemResponse>>builder()
                .status(200)
                .code(1000)
                .message("Get course list successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }

}
