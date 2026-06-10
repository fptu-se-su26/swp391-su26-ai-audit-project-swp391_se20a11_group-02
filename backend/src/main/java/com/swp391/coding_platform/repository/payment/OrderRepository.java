package com.swp391.coding_platform.repository.payment;

import com.swp391.coding_platform.entity.payment.OrderEntity;
import com.swp391.coding_platform.entity.enums.OrderStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.Instant;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity, Integer> {
    List<OrderEntity> findAllByStatusAndCreatedAtAfter(OrderStatus status, Instant after);
    Page<OrderEntity> findByUserIdAndStatusOrderByCreatedAtDesc(Integer userId, OrderStatus status, Pageable pageable);
}
