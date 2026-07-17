package com.swp391.coding_platform.service.payment;

import com.swp391.coding_platform.entity.enums.StatusTransaction;
import com.swp391.coding_platform.entity.enums.TransactionType;
import com.swp391.coding_platform.entity.enums.UserStatus;
import com.swp391.coding_platform.entity.payment.WalletEntity;
import com.swp391.coding_platform.entity.payment.WalletTransactionEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.event.UserRegisteredEvent;
import com.swp391.coding_platform.repository.payment.WalletRepository;
import com.swp391.coding_platform.repository.payment.WalletTransactionRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import java.math.BigDecimal;
import java.util.Optional;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.event.TransactionPhase;
import org.springframework.transaction.event.TransactionalEventListener;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class WalletService {
    WalletRepository walletRepository;
    WalletTransactionRepository walletTransactionRepository;

    @TransactionalEventListener(phase = TransactionPhase.BEFORE_COMMIT)
    public void handleUserRegisteredEvent(UserRegisteredEvent event) {
        UserEntity user = event.getUserEntity();

        // Logic tạo ví
        WalletEntity wallet = WalletEntity.builder()
                .user(user)
                .balance(BigDecimal.ZERO)
                .status(UserStatus.ACTIVE)
                .build();

        walletRepository.save(wallet);
    }

    @Transactional
    public WalletTransactionEntity addContestReward(Integer userId, BigDecimal amount, String referenceId) {
        // Fetch wallet with lock (findByUserIdWithLock is already available in WalletRepository)
        WalletEntity wallet = walletRepository.findByUserIdWithLock(userId)
                .orElseThrow(() -> new IllegalArgumentException("Wallet not found for user: " + userId));

        // Check if transaction with this referenceId already exists to ensure idempotency
        Optional<WalletTransactionEntity> existingTx = walletTransactionRepository
                .findByTypeAndReferenceId(TransactionType.AWARD, referenceId);
        if (existingTx.isPresent()) {
            log.info("[IDEMPOTENT] Contest reward already distributed for referenceId: {}. Skipping balance update.", referenceId);
            return existingTx.get();
        }

        // Save wallet transaction
        WalletTransactionEntity walletTx = WalletTransactionEntity.builder()
                .wallet(wallet)
                .amount(amount)
                .type(TransactionType.AWARD)
                .status(StatusTransaction.SUCCESS)
                .referenceId(referenceId)
                .build();
        WalletTransactionEntity savedTx = walletTransactionRepository.save(walletTx);

        // Update balance
        wallet.setBalance(wallet.getBalance().add(amount));
        walletRepository.save(wallet);

        log.info("Successfully distributed contest reward of {} to user {} for referenceId: {}", amount, userId, referenceId);
        return savedTx;
    }
}

