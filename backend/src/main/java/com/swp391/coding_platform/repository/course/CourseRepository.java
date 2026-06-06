package com.swp391.coding_platform.repository.course;

import com.swp391.coding_platform.entity.course.CourseEntity;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;


@Repository
public interface CourseRepository extends JpaRepository<CourseEntity, Long>, JpaSpecificationExecutor<CourseEntity> {
    @EntityGraph(attributePaths = {"categories", "teacherAssignments", "teacherAssignments.teacher"})
    @Query( "SELECT c " +
            "FROM CourseEntity c " +
            "WHERE c.id = :courseId " +
                   "AND c.status = 'ACTIVE'")
    Optional<CourseEntity> findCourseDetailById(@Param("courseId") Long courseId);

    @Modifying
    @Query("UPDATE CourseEntity c SET c.totalEnrolled = c.totalEnrolled + 1 WHERE c.id = :courseId")
    void incrementTotalEnrolled(@Param("courseId") Long courseId);

    @Modifying
    @Query("UPDATE CourseEntity c SET c.totalEnrolled = c.totalEnrolled + 1 WHERE c.id IN :courseIds")
    void incrementTotalEnrolledForCourses(@Param("courseIds") List<Long> courseIds);

    List<CourseEntity> findByInstructorId(Integer instructorId);
}


