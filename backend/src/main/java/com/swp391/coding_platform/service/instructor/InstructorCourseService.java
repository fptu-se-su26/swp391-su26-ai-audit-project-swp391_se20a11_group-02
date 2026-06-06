package com.swp391.coding_platform.service.instructor;

import com.swp391.coding_platform.dto.response.InstructorCourseResponse;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.instructor.InstructorEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.instructor.InstructorRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class InstructorCourseService {
    private final InstructorRepository instructorRepository;
    private final CourseRepository courseRepository;

    public List<InstructorCourseResponse> getCourses(Integer userId) {
        InstructorEntity instructor = getInstructorByUserId(userId);

        List<CourseEntity> courses = courseRepository.findByInstructorId(instructor.getId());
        List<InstructorCourseResponse> responses = new ArrayList<>();

        for (CourseEntity course : courses) {
            String status = "draft";
            if ("APPROVED".equalsIgnoreCase(course.getStatus().name())) {
                status = "published";
            } else if ("PENDING".equalsIgnoreCase(course.getStatus().name())) {
                status = "review";
            }

            // Map gradient & icon based on topic/id
            String gradient = "from-orange-400 to-primary";
            if (course.getId() % 3 == 0) {
                gradient = "from-blue-500 to-indigo-600";
            } else if (course.getId() % 3 == 1) {
                gradient = "from-emerald-500 to-teal-600";
            }

            String icon = "code";
            if (course.getType().equalsIgnoreCase("DATABASE")) {
                icon = "database";
            } else if (course.getType().equalsIgnoreCase("DEVOPS")) {
                icon = "dns";
            } else if (course.getType().equalsIgnoreCase("DATA_SCIENCE")) {
                icon = "analytics";
            }

            responses.add(InstructorCourseResponse.builder()
                    .id(String.valueOf(course.getId()))
                    .title(course.getTitle())
                    .level("Intermediate")
                    .topic(course.getType())
                    .price(formatVndPrice(course.getPrice()))
                    .studentsCount(course.getTotalEnrolled())
                    .rating(course.getAverageRating())
                    .reviewsCount(course.getTotalReviews())
                    .status(status)
                    .icon(icon)
                    .gradient(gradient)
                    .description(course.getShortDescription())
                    .build());
        }

        return responses;
    }

    private InstructorEntity getInstructorByUserId(Integer userId) {
        return instructorRepository.findByUserId(userId)
                .orElseThrow(() -> new AppException(ErrorCode.RESOURCE_NOT_FOUND));
    }

    private String formatVndPrice(BigDecimal price) {
        if (price == null) return "0 ₫";
        java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance(java.util.Locale.GERMANY); // formats using dots like 499.000
        return nf.format(price.longValue()) + " ₫";
    }
}

