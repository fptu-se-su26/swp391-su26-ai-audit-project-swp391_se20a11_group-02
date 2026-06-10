package com.swp391.coding_platform.mapper;

import com.swp391.coding_platform.dto.response.*;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.course.ChapterEntity;
import com.swp391.coding_platform.entity.course.LessonEntity;
import com.swp391.coding_platform.entity.course.CourseReviewEntity;
import org.mapstruct.Context;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;
import java.util.Set;

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

    @Mapping(target = "videoUrl", expression = "java(lessonEntity.getIsTrial() != null && lessonEntity.getIsTrial() ? lessonEntity.getVideoUrl() : null)")
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

    @Mapping(target = "exercises", source = "lessonProblems")
    com.swp391.coding_platform.dto.response.InstructorLessonResponse toInstructorLessonResponse(LessonEntity lessonEntity);

    @Mapping(target = "id", source = "problem.id")
    @Mapping(target = "title", source = "problem.title")
    @Mapping(target = "difficulty", source = "problem.difficulty")
    com.swp391.coding_platform.dto.response.InstructorExerciseResponse toInstructorExerciseResponse(com.swp391.coding_platform.entity.course.LessonProblemEntity lessonProblemEntity);

    com.swp391.coding_platform.dto.response.InstructorQuizOptionResponse toInstructorQuizOptionResponse(com.swp391.coding_platform.entity.quiz.QuizOptionEntity optionEntity);
    com.swp391.coding_platform.dto.response.InstructorQuizQuestionResponse toInstructorQuizQuestionResponse(com.swp391.coding_platform.entity.quiz.QuizQuestionEntity questionEntity);
    com.swp391.coding_platform.dto.response.InstructorQuizResponse toInstructorQuizResponse(com.swp391.coding_platform.entity.quiz.QuizEntity quizEntity);

    com.swp391.coding_platform.dto.response.InstructorChapterResponse toInstructorChapterResponse(ChapterEntity chapterEntity);

    @Mapping(target = "level", constant = "Intermediate")
    @Mapping(target = "topic", source = "type")
    com.swp391.coding_platform.dto.response.InstructorCourseDetailResponse toInstructorCourseDetailResponse(CourseEntity courseEntity);
}
