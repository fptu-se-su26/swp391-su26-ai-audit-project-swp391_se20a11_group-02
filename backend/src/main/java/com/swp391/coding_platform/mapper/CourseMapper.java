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
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

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
