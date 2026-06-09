package com.swp391.coding_platform.repository.payment;

import com.swp391.coding_platform.entity.payment.WalletTransactionEntity;
import com.swp391.coding_platform.entity.enums.TransactionType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WalletTransactionRepository extends JpaRepository<WalletTransactionEntity, Integer> {
    List<WalletTransactionEntity> findByWalletIdOrderByCreatedAtDesc(Integer walletId);
    Page<WalletTransactionEntity> findByWalletUserId(Integer userId, Pageable pageable);
    Page<WalletTransactionEntity> findByWalletUserIdAndType(Integer userId, TransactionType type, Pageable pageable);

    @Query("SELECT COALESCE(SUM(t.amount), 0) FROM WalletTransactionEntity t " +
           "WHERE t.wallet.id = :walletId " +
           "AND t.type = :type " +
           "AND t.status = :status")
    java.math.BigDecimal sumAmountByWalletIdAndTypeAndStatus(
            @Param("walletId") Integer walletId,
            @Param("type") TransactionType type,
            @Param("status") com.swp391.coding_platform.entity.enums.StatusTransaction status);
}
