package com.swp391.coding_platform.repository.payment;

import com.swp391.coding_platform.entity.payment.PaymentTransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PaymentTransactionRepository extends JpaRepository<PaymentTransactionEntity, Integer> {
    Optional<PaymentTransactionEntity> findByTransactionCode(String transactionCode);
}
