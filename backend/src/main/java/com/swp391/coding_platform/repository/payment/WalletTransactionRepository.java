package com.swp391.coding_platform.repository.payment;

import com.swp391.coding_platform.entity.payment.WalletTransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WalletTransactionRepository extends JpaRepository<WalletTransactionEntity, Integer> {
    List<WalletTransactionEntity> findByWalletIdOrderByCreatedAtDesc(Integer walletId);
}
