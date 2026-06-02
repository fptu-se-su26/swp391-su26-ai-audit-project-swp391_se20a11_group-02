package com.swp391.coding_platform.mapper;

import com.swp391.coding_platform.dto.response.CourseListItemResponse;
import com.swp391.coding_platform.entity.course.CourseEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface CourseMapper {

    @Mapping(target = "enrolled", ignore = true)
    @Mapping(target = "progressPercentage", ignore = true)
    @Mapping(target = "instructorName", source = "instructor.fullName")
    CourseListItemResponse toCourseListItemResponse(CourseEntity courseEntity);
}
