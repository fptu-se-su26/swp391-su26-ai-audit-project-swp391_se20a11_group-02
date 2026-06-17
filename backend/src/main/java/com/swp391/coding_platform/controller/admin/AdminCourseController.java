package com.swp391.coding_platform.controller.admin;

import com.swp391.coding_platform.dto.response.AdminCourseResponse;
import com.swp391.coding_platform.dto.response.ApiResponse;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.course.ChapterRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/admin/courses")
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminCourseController {

    private final CourseRepository courseRepository;
    private final ChapterRepository chapterRepository;

    @GetMapping
    public ResponseEntity<ApiResponse<List<AdminCourseResponse>>> getCourses() {
        log.info("Admin retrieving all courses for review");
        
        List<CourseEntity> courses = courseRepository.findAll();
        List<AdminCourseResponse> result = courses.stream().map(c -> {
            int totalChapters = chapterRepository.countByCourseId(c.getId());
            
            return AdminCourseResponse.builder()
                    .id(c.getId())
                    .instructorId(c.getInstructor().getId())
                    .instructorName(c.getInstructor().getFullName())
                    .instructorAvatarUrl(c.getInstructor().getUser() != null ? c.getInstructor().getUser().getAvatarurl() : null)
                    .title(c.getTitle())
                    .thumbnailUrl(c.getThumbnailUrl())
                    .shortDescription(c.getShortDescription())
                    .longDescription(c.getLongDescription())
                    .status(c.getStatus().name())
                    .price(c.getPrice())
                    .averageRating(c.getAverageRating())
                    .totalReviews(c.getTotalReviews())
                    .totalEnrolled(c.getTotalEnrolled())
                    .totalLessons(c.getTotalLessons())
                    .totalQuizzes(c.getTotalQuizzes())
                    .totalVideos(c.getTotalVideos())
                    .totalChapters(totalChapters)
                    .build();
        }).collect(Collectors.toList());

        return ResponseEntity.ok(ApiResponse.<List<AdminCourseResponse>>builder()
                .status(200)
                .code(1000)
                .message("Fetched admin courses successfully")
                .result(result)
                .timestamp(Instant.now().toString())
                .build());
    }
}
