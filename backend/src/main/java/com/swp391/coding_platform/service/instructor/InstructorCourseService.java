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

import com.swp391.coding_platform.dto.response.InstructorCourseDetailResponse;
import com.swp391.coding_platform.mapper.CourseMapper;
import java.util.stream.Collectors;
import com.swp391.coding_platform.dto.request.InstructorCourseCreateRequest;
import com.swp391.coding_platform.entity.enums.CourseStatus;
import java.time.Instant;

@Service
@RequiredArgsConstructor
@Slf4j
public class InstructorCourseService {
    private final InstructorRepository instructorRepository;
    private final CourseRepository courseRepository;
    private final CourseMapper courseMapper;
    private final com.swp391.coding_platform.repository.course.ChapterRepository chapterRepository;
    private final com.swp391.coding_platform.repository.course.LessonRepository lessonRepository;

    public InstructorCourseDetailResponse getCourseDetail(Integer userId, Long courseId) {
        InstructorEntity instructor = getInstructorByUserId(userId);
        CourseEntity course = courseRepository.findByIdAndInstructorId(courseId, instructor.getId())
                .orElseThrow(() -> new AppException(ErrorCode.COURSE_NOT_FOUND));

        InstructorCourseDetailResponse response = courseMapper.toInstructorCourseDetailResponse(course);
        
        if (course.getChapters() != null) {
            response.setChapters(course.getChapters().stream()
                    .map(courseMapper::toInstructorChapterResponse)
                    .collect(Collectors.toList()));
        }
        
        return response;
    }

    public InstructorCourseResponse createCourse(Integer userId, InstructorCourseCreateRequest request) {
        InstructorEntity instructor = getInstructorByUserId(userId);
        
        CourseEntity newCourse = CourseEntity.builder()
                .instructor(instructor)
                .title(request.getTitle())
                .shortDescription(request.getShortDescription())
                .thumbnailUrl("https://placehold.co/600x400/2563eb/ffffff?text=Course")
                .longDescription(request.getShortDescription())
                .price(request.getPrice() != null ? request.getPrice() : BigDecimal.ZERO)
                .type(request.getTopic() != null ? request.getTopic() : "OTHER")
                .status(CourseStatus.PENDING)
                .createdAt(Instant.now())
                .updatedAt(Instant.now())
                .totalEnrolled(0)
                .totalReviews(0)
                .averageRating(0.0)
                .totalLessons(0)
                .totalQuizzes(0)
                .totalVideos(0)
                .build();
                
        CourseEntity savedCourse = courseRepository.save(newCourse);
        
        String status = "review";
        String gradient = "from-orange-400 to-primary";
        if (savedCourse.getId() != null) {
            if (savedCourse.getId() % 3 == 0) gradient = "from-blue-500 to-indigo-600";
            else if (savedCourse.getId() % 3 == 1) gradient = "from-emerald-500 to-teal-600";
        }
        
        String icon = "code";
        if (savedCourse.getType().equalsIgnoreCase("DATABASE")) icon = "database";
        else if (savedCourse.getType().equalsIgnoreCase("DEVOPS")) icon = "dns";
        else if (savedCourse.getType().equalsIgnoreCase("DATA_SCIENCE")) icon = "analytics";

        return InstructorCourseResponse.builder()
                .id(String.valueOf(savedCourse.getId()))
                .title(savedCourse.getTitle())
                .level(request.getLevel() != null ? request.getLevel() : "Beginner")
                .topic(savedCourse.getType())
                .price(formatVndPrice(savedCourse.getPrice()))
                .studentsCount(0)
                .rating(0.0)
                .reviewsCount(0)
                .status(status)
                .icon(icon)
                .gradient(gradient)
                .description(savedCourse.getShortDescription())
                .build();
    }

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

    public InstructorCourseResponse updateCourse(Integer userId, Long courseId, com.swp391.coding_platform.dto.request.InstructorCourseUpdateRequest request) {
        InstructorEntity instructor = getInstructorByUserId(userId);
        CourseEntity course = courseRepository.findByIdAndInstructorId(courseId, instructor.getId())
                .orElseThrow(() -> new AppException(ErrorCode.COURSE_NOT_FOUND));

        // Update all editable fields
        if (request.getTitle() != null) course.setTitle(request.getTitle());
        if (request.getShortDescription() != null) course.setShortDescription(request.getShortDescription());
        if (request.getLongDescription() != null) course.setLongDescription(request.getLongDescription());
        if (request.getTopic() != null) course.setType(request.getTopic());
        if (request.getPrice() != null) course.setPrice(request.getPrice());
        if (request.getWhatYouLearn() != null) course.setWhatYouLearn(request.getWhatYouLearn());
        if (request.getCourseHighlight() != null) course.setCourseHighlight(request.getCourseHighlight());
        if (request.getTechnologyTool() != null) course.setTechnologyTool(request.getTechnologyTool());
        if (request.getPrerequisites() != null) course.setPrerequisites(request.getPrerequisites());
        if (request.getTargetAudience() != null) course.setTargetAudience(request.getTargetAudience());
        if (request.getCompletionBenefits() != null) course.setCompletionBenefits(request.getCompletionBenefits());

        // Process Chapters and Lessons
        if (request.getChapters() != null) {
            java.util.List<com.swp391.coding_platform.entity.course.ChapterEntity> existingChapters = course.getChapters();
            if (existingChapters == null) {
                existingChapters = new java.util.ArrayList<>();
                course.setChapters(existingChapters);
            }

            java.util.List<com.swp391.coding_platform.entity.course.ChapterEntity> updatedChapters = new java.util.ArrayList<>();
            
            for (int i = 0; i < request.getChapters().size(); i++) {
                var chDto = request.getChapters().get(i);
                com.swp391.coding_platform.entity.course.ChapterEntity chEntity;

                if (chDto.getId() != null) {
                    chEntity = existingChapters.stream().filter(c -> c.getId().equals(chDto.getId())).findFirst().orElse(null);
                    if (chEntity == null) {
                        chEntity = new com.swp391.coding_platform.entity.course.ChapterEntity();
                        chEntity.setCourse(course);
                    }
                } else {
                    chEntity = new com.swp391.coding_platform.entity.course.ChapterEntity();
                    chEntity.setCourse(course);
                }

                chEntity.setTitle(chDto.getTitle());
                chEntity.setOrderIndex(i + 1);
                chEntity.setUpdatedAt(Instant.now());

                // Process Lessons
                if (chDto.getLessons() != null) {
                    java.util.List<com.swp391.coding_platform.entity.course.LessonEntity> existingLessons = chEntity.getLessons();
                    if (existingLessons == null) {
                        existingLessons = new java.util.ArrayList<>();
                        chEntity.setLessons(existingLessons);
                    }
                    java.util.List<com.swp391.coding_platform.entity.course.LessonEntity> updatedLessons = new java.util.ArrayList<>();

                    for (int j = 0; j < chDto.getLessons().size(); j++) {
                        var lesDto = chDto.getLessons().get(j);
                        com.swp391.coding_platform.entity.course.LessonEntity lesEntity;

                        if (lesDto.getId() != null) {
                            lesEntity = existingLessons.stream().filter(l -> l.getId().equals(lesDto.getId())).findFirst().orElse(null);
                            if (lesEntity == null) {
                                lesEntity = new com.swp391.coding_platform.entity.course.LessonEntity();
                                lesEntity.setChapter(chEntity);
                            }
                        } else {
                            lesEntity = new com.swp391.coding_platform.entity.course.LessonEntity();
                            lesEntity.setChapter(chEntity);
                        }

                        lesEntity.setTitle(lesDto.getTitle());
                        lesEntity.setTheoryContent(lesDto.getTheory());
                        lesEntity.setVideoUrl(lesDto.getVideo());
                        lesEntity.setIsTrial(lesDto.getIsTrial() != null ? lesDto.getIsTrial() : false);
                        lesEntity.setOrderIndex(j + 1);
                        lesEntity.setUpdatedAt(Instant.now());

                        updatedLessons.add(lesEntity);
                    }
                    
                    // Identify lessons to delete
                    java.util.List<com.swp391.coding_platform.entity.course.LessonEntity> lessonsToRemove = new java.util.ArrayList<>(existingLessons);
                    lessonsToRemove.removeAll(updatedLessons);
                    lessonRepository.deleteAll(lessonsToRemove);

                    chEntity.getLessons().clear();
                    chEntity.getLessons().addAll(updatedLessons);
                }

                updatedChapters.add(chEntity);
            }

            // Identify chapters to delete
            java.util.List<com.swp391.coding_platform.entity.course.ChapterEntity> chaptersToRemove = new java.util.ArrayList<>(existingChapters);
            chaptersToRemove.removeAll(updatedChapters);
            chapterRepository.deleteAll(chaptersToRemove);

            course.getChapters().clear();
            course.getChapters().addAll(updatedChapters);
            
            // Update total lessons
            int totalLessons = updatedChapters.stream().mapToInt(c -> c.getLessons() != null ? c.getLessons().size() : 0).sum();
            course.setTotalLessons(totalLessons);
        }

        // After edit, course goes back to PENDING for admin approval
        course.setStatus(CourseStatus.PENDING);
        course.setUpdatedAt(Instant.now());

        CourseEntity saved = courseRepository.save(course);

        // Build response
        String status = "review"; // PENDING = review
        String gradient = "from-orange-400 to-primary";
        if (saved.getId() % 3 == 0) gradient = "from-blue-500 to-indigo-600";
        else if (saved.getId() % 3 == 1) gradient = "from-emerald-500 to-teal-600";

        String icon = "code";
        if (saved.getType().equalsIgnoreCase("DATABASE")) icon = "database";
        else if (saved.getType().equalsIgnoreCase("DEVOPS")) icon = "dns";
        else if (saved.getType().equalsIgnoreCase("DATA_SCIENCE")) icon = "analytics";

        return InstructorCourseResponse.builder()
                .id(String.valueOf(saved.getId()))
                .title(saved.getTitle())
                .level(request.getLevel() != null ? request.getLevel() : "Intermediate")
                .topic(saved.getType())
                .price(formatVndPrice(saved.getPrice()))
                .studentsCount(saved.getTotalEnrolled())
                .rating(saved.getAverageRating())
                .reviewsCount(saved.getTotalReviews())
                .status(status)
                .icon(icon)
                .gradient(gradient)
                .description(saved.getShortDescription())
                .build();
    }

    private InstructorEntity getInstructorByUserId(Integer userId) {
        return instructorRepository.findByUserId(userId)
                .orElseThrow(() -> new AppException(ErrorCode.RESOURCE_NOT_FOUND));
    }

    private String formatVndPrice(BigDecimal price) {
        if (price == null) return "0 ₫";
        java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance(java.util.Locale.GERMANY);
        return nf.format(price.longValue()) + " ₫";
    }
}
