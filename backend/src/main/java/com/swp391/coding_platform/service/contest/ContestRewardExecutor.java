package com.swp391.coding_platform.service.contest;

import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.contest.ContestWinnerEntity;
import com.swp391.coding_platform.entity.payment.WalletTransactionEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.contest.ContestWinnerRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import com.swp391.coding_platform.service.payment.WalletService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.Instant;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ContestRewardExecutor {

    ContestWinnerRepository contestWinnerRepository;
    ContestRepository contestRepository;
    UserRepository userRepository;
    WalletService walletService;

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void distributeRewardForWinner(Integer contestId, Integer userId, int rank, BigDecimal prize) {
        String referenceId = "contest:" + contestId + ":rank:" + rank + ":user:" + userId;
        log.info("[REWARD] Distributing {} to User {} for Rank {} (ref: {})", prize, userId, rank, referenceId);

        // 1. Kiểm tra Check-then-Act tránh throw exception trùng lặp
        boolean winnerExists = contestWinnerRepository.findByContestId(contestId).stream()
                .anyMatch(w -> w.getRank() == rank && w.getUser().getId().equals(userId));

        if (winnerExists) {
            log.info("[REWARD-IDEMPOTENT] Winner record already exists for contest {} rank {}. Skipping.", contestId, rank);
            return;
        }

        // 2. Thực hiện cộng ví an toàn (Idempotent)
        WalletTransactionEntity walletTx = walletService.addContestReward(userId, prize, referenceId);

        // 3. Ghi chép vào Contest_Winner
        ContestEntity contestRef = contestRepository.getReferenceById(contestId);
        UserEntity userRef = userRepository.getReferenceById(userId);

        ContestWinnerEntity winner = ContestWinnerEntity.builder()
                .contest(contestRef)
                .user(userRef)
                .rank(rank)
                .rewardAmount(prize)
                .walletTransaction(walletTx)
                .createdAt(Instant.now())
                .build();

        contestWinnerRepository.save(winner);
        log.info("[REWARD] Completed distribution for Rank {} to User {}", rank, userId);
    }
}
