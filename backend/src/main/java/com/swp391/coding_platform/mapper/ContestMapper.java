package com.swp391.coding_platform.mapper;

import com.swp391.coding_platform.dto.response.ContestResponse;
import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.enums.ContestStatus;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ContestMapper {

    @Mapping(target = "creatorName", source = "createdBy.displayname")
    @Mapping(target = "isPrivate", expression = "java(contestEntity.getPasswordHash() != null && !contestEntity.getPasswordHash().trim().isEmpty())")
    @Mapping(target = "status", expression = "java(mapStatus(contestEntity.getStatus()))")
    ContestResponse toContestResponse(ContestEntity contestEntity);

    default String mapStatus(ContestStatus status) {
        if (status == null) return null;
        if (status == ContestStatus.RUNNING) {
            return "ONGOING";
        }
        return status.name();
    }
}
