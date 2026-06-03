package com.swp391.coding_platform.mapper;

import com.swp391.coding_platform.dto.response.CourseListItemResponse;
import com.swp391.coding_platform.dto.response.CourseDetailResponse;
import com.swp391.coding_platform.entity.course.CourseEntity;
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
}
