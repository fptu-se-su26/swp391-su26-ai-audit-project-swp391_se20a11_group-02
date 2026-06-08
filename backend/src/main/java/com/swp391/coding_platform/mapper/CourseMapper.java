package com.swp391.coding_platform.mapper;

import com.swp391.coding_platform.dto.response.CourseListItemResponse;
import com.swp391.coding_platform.dto.response.CourseDetailResponse;
import com.swp391.coding_platform.dto.response.CurriculumChapterResponse;
import com.swp391.coding_platform.dto.response.CurriculumLessonResponse;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.course.ChapterEntity;
import com.swp391.coding_platform.entity.course.LessonEntity;
import com.swp391.coding_platform.dto.response.CourseReviewDto;
import com.swp391.coding_platform.entity.course.CourseReviewEntity;
import com.swp391.coding_platform.dto.response.LearningDetailResponse;
import com.swp391.coding_platform.dto.response.LearningLessonResponse;
import com.swp391.coding_platform.dto.response.LearningCurriculumLessonResponse;
import com.swp391.coding_platform.dto.response.LearningCurriculumChapterResponse;
import org.mapstruct.Context;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import java.util.Set;
import java.util.List;

@Mapper(componentModel = "spring")
public interface CourseMapper {

    @Mapping(target = "enrolled", ignore = true)
    @Mapping(target = "progressPercentage", ignore = true)
    @Mapping(target = "instructorName", source = "instructor.fullName")
    CourseListItemResponse toCourseListItemResponse(CourseEntity courseEntity);

    @Mapping(target = "enrolled", ignore = true)
    @Mapping(target = "progressPercentage", ignore = true)
    @Mapping(target = "instructorName", source = "instructor.fullName")
    @Mapping(target = "instructorTitle", source = "instructor.major")
    @Mapping(target = "instructorBio", source = "instructor.bio")
    @Mapping(target = "instructorAvatarUrl", source = "instructor.user.avatarurl")
    @Mapping(target = "categoryName", expression = "java(courseEntity.getCategories() != null && !courseEntity.getCategories().isEmpty() ? courseEntity.getCategories().iterator().next().getName() : null)")
    CourseDetailResponse toCourseDetailResponse(CourseEntity courseEntity);

    CurriculumChapterResponse toCurriculumChapterResponse(ChapterEntity chapterEntity);

    @Mapping(target = "type", expression = "java(lessonEntity.getVideoUrl() != null && !lessonEntity.getVideoUrl().isEmpty() ? \"video\" : (lessonEntity.getTheoryContent() != null && !lessonEntity.getTheoryContent().isEmpty() ? \"reading\" : \"coding\"))")
    CurriculumLessonResponse toCurriculumLessonResponse(LessonEntity lessonEntity);

    @Mapping(target = "displayName", source = "user.displayname")
    @Mapping(target = "avatarUrl", source = "user.avatarurl")
    CourseReviewDto toCourseReviewDto(CourseReviewEntity reviewEntity);

    @Mapping(target = "courseId", source = "course.id")
    @Mapping(target = "courseTitle", source = "course.title")
    @Mapping(target = "instructorName", source = "course.instructor.fullName")
    @Mapping(target = "progressPercentage", source = "progressPercentage")
    @Mapping(target = "activeLessonId", source = "activeLesson.id")
    @Mapping(target = "activeLessonTitle", source = "activeLesson.title")
    @Mapping(target = "activeLessonVideoUrl", source = "activeLesson.videoUrl")
    @Mapping(target = "activeLessonTheoryContent", source = "activeLesson.theoryContent")
    LearningDetailResponse toLearningDetailResponse(CourseEntity course, int progressPercentage, LessonEntity activeLesson);

    LearningLessonResponse toLearningLessonResponse(LessonEntity lessonEntity);

    @Mapping(target = "isCompleted", expression = "java(completedLessonIds != null && completedLessonIds.contains(lessonEntity.getId().longValue()))")
    @Mapping(target = "type", expression = "java(lessonEntity.getVideoUrl() != null && !lessonEntity.getVideoUrl().isEmpty() ? \"video\" : (lessonEntity.getTheoryContent() != null && !lessonEntity.getTheoryContent().isEmpty() ? \"reading\" : \"coding\"))")
    LearningCurriculumLessonResponse toLearningCurriculumLessonResponse(LessonEntity lessonEntity, @Context Set<Long> completedLessonIds);

    LearningCurriculumChapterResponse toLearningCurriculumChapterResponse(ChapterEntity chapterEntity, @Context Set<Long> completedLessonIds);

    List<LearningCurriculumChapterResponse> toLearningCurriculumChapterResponses(List<ChapterEntity> chapterEntities, @Context Set<Long> completedLessonIds);
}
