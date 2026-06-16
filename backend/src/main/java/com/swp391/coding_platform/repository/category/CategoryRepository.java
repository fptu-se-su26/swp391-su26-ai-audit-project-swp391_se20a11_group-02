package com.swp391.coding_platform.repository.category;

import com.swp391.coding_platform.entity.category.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<CategoryEntity, Integer> {
    @Query("SELECT c.name, COALESCE(SUM(co.totalEnrolled), 0) FROM CategoryEntity c " +
           "LEFT JOIN c.courses co " +
           "GROUP BY c.name")
    List<Object[]> findCategoryEnrollmentCounts();
}
