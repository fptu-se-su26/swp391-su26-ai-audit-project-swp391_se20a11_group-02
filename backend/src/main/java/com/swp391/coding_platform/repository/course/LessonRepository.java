package com.swp391.coding_platform.repository.course;

import com.swp391.coding_platform.entity.course.LessonEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LessonRepository extends JpaRepository<LessonEntity, Integer> {
}
