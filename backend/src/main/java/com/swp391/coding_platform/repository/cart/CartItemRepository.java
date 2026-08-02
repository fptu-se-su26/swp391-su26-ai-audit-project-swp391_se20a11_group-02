package com.swp391.coding_platform.repository.cart;

import com.swp391.coding_platform.entity.cart.CartItemEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.Optional;

@Repository
public interface CartItemRepository extends JpaRepository<CartItemEntity, Integer> {
    Optional<CartItemEntity> findByCartIdAndCourseId(Integer cartId, Long courseId);
    void deleteByCartIdAndCourseId(Integer cartId, Long courseId);
    void deleteByCartId(Integer cartId);
    
    @Modifying
    @Query("DELETE FROM CartItemEntity c WHERE c.course.id = :courseId")
    void deleteByCourseId(@Param("courseId") Long courseId);
}
