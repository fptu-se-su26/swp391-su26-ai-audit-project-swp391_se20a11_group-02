package com.swp391.coding_platform.service.course;

import com.swp391.coding_platform.dto.request.CourseSearchRequest;
import com.swp391.coding_platform.dto.response.CourseListItemResponse;
import com.swp391.coding_platform.dto.response.CourseDetailResponse;
import com.swp391.coding_platform.dto.response.CurriculumChapterResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.mapper.CourseMapper;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.course.ChapterEntity;
import com.swp391.coding_platform.entity.progress.CompletedLessonsCountEntity;
import com.swp391.coding_platform.entity.enums.EnrollmentStatus;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.course.ChapterRepository;
import com.swp391.coding_platform.repository.course.EnrollmentRepository;
import com.swp391.coding_platform.repository.progress.CompletedLessonCountRepository;
import com.swp391.coding_platform.repository.progress.LessonProgressRepository;
import com.swp391.coding_platform.repository.specification.CourseSpecification;
import com.swp391.coding_platform.util.ProgressUtils;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import java.util.*;
import java.util.stream.Collectors;


@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CourseService {
    CourseRepository courseRepository;
    CourseMapper courseMapper;
    CompletedLessonCountRepository completedLessonCountRepository;
    LessonProgressRepository lessonProgressRepository;
    EnrollmentRepository enrollmentRepository;
    ChapterRepository chapterRepository;

    public PageResponse<CourseListItemResponse> getCourseList(Long userId, CourseSearchRequest searchRequest, Pageable pageable) {

        // 1. Khởi tạo Specification cơ bản (Luôn là khóa học ACTIVE)
        Specification<CourseEntity> spec = Specification.allOf(CourseSpecification.isStatusActive());

        // 2. Nối (Chaining) các điều kiện linh hoạt dựa vào Request từ User
        if (searchRequest != null) {
            spec = spec.and(CourseSpecification.hasKeyword(searchRequest.getKeyword()))
                    .and(CourseSpecification.hasCategories(searchRequest.getCategoryIds()))
                    .and(CourseSpecification.hasPriceBetween(searchRequest.getMinPrice(), searchRequest.getMaxPrice()))
                    .and(CourseSpecification.hasRatingBetween(searchRequest.getMinRating(), searchRequest.getMaxRating()))
                    .and(CourseSpecification.hasTeacherName(searchRequest.getInstructorName()));
        }

        // 3. Gọi DB (JpaSpecificationExecutor lo toàn bộ việc sinh câu SQL) (QUERY 1)
        Page<CourseEntity> courseEntities = courseRepository.findAll(spec, pageable);

        Set<Long> enrolledCourseIds = new HashSet<>();  // Lưu danh sách courseId mà user đã enrolled
        Map<Long, Integer> courseProgressMap = new HashMap<>(); // Lưu danh sách Map courseId + completedLesson

        if (userId != null) {
            // Lấy ra các courseId hiện có
            List<Long> currentCourseIds = courseEntities.getContent().stream()
                    .map(CourseEntity::getId)
                    .toList();

            // 4. Lấy danh sách các Course ID mà user đã mua trong số các ID trên (QUERY 2)
            enrolledCourseIds = enrollmentRepository.findEnrolledCourseIdsByUserIdAndCourseIds(userId, currentCourseIds, List.of(EnrollmentStatus.ACTIVE, EnrollmentStatus.COMPLETED));

            // 5. Nếu user có mua ít nhất 1 khóa, tiến hành lấy tiến độ (QUERY 3)
            if (!enrolledCourseIds.isEmpty()) {
                List<CompletedLessonsCountEntity> completedLessonsCountEntities =
                        completedLessonCountRepository.findByUserIdAndCourseIdIn(userId, enrolledCourseIds);

                courseProgressMap = getCourseProgressMap(completedLessonsCountEntities);
            }
        }

        // 6. Lắp ráp dữ liệu trên RAM
        final Set<Long> finalEnrolledIds = enrolledCourseIds;
        final Map<Long, Integer> finalProgressMap = courseProgressMap;

        Page<CourseListItemResponse> courseListItemResponsePage = courseEntities.map(courseEntity -> {
            CourseListItemResponse courseListItemResponse = courseMapper.toCourseListItemResponse(courseEntity);

            boolean isEnrolled = finalEnrolledIds.contains(courseEntity.getId());
            courseListItemResponse.setEnrolled(isEnrolled);

            int progressPercentage = 0;
            if (isEnrolled) {
                int completeLessons = finalProgressMap.getOrDefault(courseEntity.getId(), 0);
                int totalLesson = courseEntity.getTotalLessons() != null ? courseEntity.getTotalLessons() : 0;
                progressPercentage = ProgressUtils.calculatePercentage(completeLessons, totalLesson);
            }

            courseListItemResponse.setProgressPercentage(progressPercentage);

            return courseListItemResponse;

        });

        return PageResponse.from(courseListItemResponsePage);
    }



    private Map<Long, Integer> getCourseProgressMap(List<CompletedLessonsCountEntity> completedLessonsCountEntities){
        return completedLessonsCountEntities.stream()
                .collect(Collectors.toMap(
                        entity -> entity.getCourse().getId(),
                        CompletedLessonsCountEntity::getCompletedLessonsCount
                ));
    }

    private Boolean isEnrollCourseById(Long courseId, Long userId) {
        return enrollmentRepository.existsByUserIdAndCourseIdAndStatusIn(
                userId, courseId, List.of(EnrollmentStatus.ACTIVE, EnrollmentStatus.COMPLETED));
    }

    private Integer getCompleteLessons(Long courseId, Long userId) {
        CompletedLessonsCountEntity completedLessonsCountEntity = completedLessonCountRepository.getByUserIdAndCourseId(userId, courseId)
                .orElse(null);

        return completedLessonsCountEntity != null ? completedLessonsCountEntity.getCompletedLessonsCount() : 0;
    }

    public CourseDetailResponse getCourseDetail(Long userId, Long courseId) {
        CourseEntity courseEntity = courseRepository.findById(courseId)
                .orElseThrow(() -> new AppException(ErrorCode.COURSE_NOT_FOUND));

        CourseDetailResponse response = courseMapper.toCourseDetailResponse(courseEntity);

        if (userId != null) {
            boolean isEnrolled = isEnrollCourseById(courseId, userId);
            response.setEnrolled(isEnrolled);

            if (isEnrolled) {
                int completeLessons = getCompleteLessons(courseId, userId);
                int totalLesson = courseEntity.getTotalLessons() != null ? courseEntity.getTotalLessons() : 0;
                response.setProgressPercentage(ProgressUtils.calculatePercentage(completeLessons, totalLesson));
            } else {
                response.setProgressPercentage(0);
            }
        } else {
            response.setEnrolled(false);
            response.setProgressPercentage(0);
        }

        return response;
    }

    public List<CurriculumChapterResponse> getCourseCurriculum(Long courseId) {
        if (!courseRepository.existsById(courseId)) {
            throw new AppException(ErrorCode.COURSE_NOT_FOUND);
        }

        List<ChapterEntity> chapters = chapterRepository.findByCourseIdOrderByOrderIndexAsc(courseId);

        return chapters.stream()
                .map(courseMapper::toCurriculumChapterResponse)
                .collect(Collectors.toList());
    }
}
