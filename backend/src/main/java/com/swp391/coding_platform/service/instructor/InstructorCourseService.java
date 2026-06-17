package com.swp391.coding_platform.service.instructor;

import com.swp391.coding_platform.configuration.ModerationQueueConfig;
import com.swp391.coding_platform.dto.response.InstructorCourseResponse;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.enums.CourseStatus;
import com.swp391.coding_platform.entity.instructor.InstructorEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.instructor.InstructorRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class InstructorCourseService {
    private final InstructorRepository instructorRepository;
    private final CourseRepository courseRepository;
    private final RabbitTemplate rabbitTemplate;

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
            } else if ("REJECTED".equalsIgnoreCase(course.getStatus().name())) {
                status = "rejected";
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

    /**
     * Instructor nộp khóa học để AI kiểm duyệt.
     * Chỉ cho phép nộp nếu khóa học đang ở trạng thái REJECTED (nộp lại sau khi sửa).
     * Khóa học mới tạo đã có status PENDING mặc định — gọi trực tiếp trigger từ controller tạo course.
     */
    @Transactional
    public void submitCourseForReview(Integer userId, Long courseId) {
        InstructorEntity instructor = getInstructorByUserId(userId);

        // 1. Kiểm tra khóa học tồn tại và thuộc về instructor này
        CourseEntity course = courseRepository.findById(courseId)
                .orElseThrow(() -> new AppException(ErrorCode.COURSE_NOT_FOUND));

        if (!course.getInstructor().getId().equals(instructor.getId())) {
            log.warn("Instructor {} cố nộp khóa học {} không thuộc về họ", userId, courseId);
            throw new AppException(ErrorCode.ACCESS_DENIED);
        }

        // 2. Chỉ cho phép nộp lại khi đang bị REJECTED
        if (course.getStatus() != CourseStatus.REJECTED) {
            log.warn("Không thể submit khóa học {} với trạng thái hiện tại: {}", courseId, course.getStatus());
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        // 3. Đổi status sang PENDING và lưu
        course.setStatus(CourseStatus.PENDING);
        courseRepository.save(course);
        log.info("Instructor {} đã nộp lại khóa học {} để kiểm duyệt", userId, courseId);

        // 4. Đẩy courseId vào RabbitMQ để kích hoạt AI Moderation Pipeline
        rabbitTemplate.convertAndSend(
                ModerationQueueConfig.MODERATION_EXCHANGE,
                ModerationQueueConfig.MODERATION_ROUTING_KEY,
                courseId
        );
        log.info("Đã gửi courseId {} vào RabbitMQ queue để AI kiểm duyệt", courseId);
    }

    /**
     * Kích hoạt AI kiểm duyệt ngay khi khóa học vừa được tạo mới (status mặc định PENDING).
     * Gọi method này từ controller hoặc service tạo course.
     */
    public void triggerModerationForNewCourse(Long courseId) {
        rabbitTemplate.convertAndSend(
                ModerationQueueConfig.MODERATION_EXCHANGE,
                ModerationQueueConfig.MODERATION_ROUTING_KEY,
                courseId
        );
        log.info("Đã gửi courseId {} vào RabbitMQ queue để AI kiểm duyệt (khóa học mới)", courseId);
    }

    private InstructorEntity getInstructorByUserId(Integer userId) {
        InstructorEntity instructor = instructorRepository.findByUserId(userId)
                .orElseThrow(() -> new AppException(ErrorCode.RESOURCE_NOT_FOUND));
        if (instructor.getStatus() == com.swp391.coding_platform.entity.enums.InstructorStatus.SUSPENDED) {
            throw new AppException(ErrorCode.ACCESS_DENIED);
        }
        return instructor;
    }

    private String formatVndPrice(BigDecimal price) {
        if (price == null) return "0 ₫";
        java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance(java.util.Locale.GERMANY);
        return nf.format(price.longValue()) + " ₫";
    }
}

