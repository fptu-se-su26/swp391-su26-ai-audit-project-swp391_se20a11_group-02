package com.swp391.coding_platform.service.contest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.dto.response.ContestScoreboardResponse;
import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.contest.ContestWinnerEntity;
import com.swp391.coding_platform.entity.enums.FinalizationStatus;
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
import java.util.*;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ContestFinalizationService {

    ContestRepository contestRepository;
    ContestWinnerRepository contestWinnerRepository;
    UserRepository userRepository;
    WalletService walletService;
    ContestRankingService contestRankingService;
    ObjectMapper objectMapper;

    /**
     * Khởi chạy tiến trình chốt sổ cho một cuộc thi.
     */
    public void finalizeContest(Integer contestId) {
        log.info("[FINALIZER] Starting finalization for contest id: {}", contestId);

        // 1. Cố gắng giành khóa trạng thái (Optimistic Lock)
        boolean locked = tryAcquireLock(contestId);
        if (!locked) {
            log.info("[FINALIZER] Contest {} is already being finalized or finalized by another instance.", contestId);
            return;
        }

        try {
            ContestEntity contest = contestRepository.findById(contestId)
                    .orElseThrow(() -> new IllegalArgumentException("Contest not found: " + contestId));

            // 2. Thực hiện chốt sổ và lưu snapshot đầy đủ ma trận bài giải
            List<ContestScoreboardResponse.TeamRow> finalScoreboard = getOrRebuildScoreboard(contest);
            saveSnapshot(contest, finalScoreboard);

            // 3. Phân phối phần thưởng cho Top 3
            distributeRewards(contest, finalScoreboard);

            // 4. Mark FINALIZED
            markAsFinalized(contestId);
            log.info("[FINALIZER] Successfully finalized contest id: {}", contestId);

        } catch (Exception e) {
            log.error("[FINALIZER] Critical failure finalizing contest id: {}", contestId, e);
            markAsFailed(contestId, e.getMessage());
        }
    }

    @Transactional
    public boolean tryAcquireLock(Integer contestId) {
        ContestEntity contest = contestRepository.findById(contestId).orElse(null);
        if (contest == null) return false;

        FinalizationStatus currentStatus = contest.getFinalizationStatus();
        Instant now = Instant.now();

        // Điều kiện Lock: PENDING, FAILED hoặc đang FINALIZING nhưng đã bị treo quá 10 phút
        boolean isEligible = currentStatus == FinalizationStatus.PENDING 
                || currentStatus == FinalizationStatus.FAILED
                || (currentStatus == FinalizationStatus.FINALIZING 
                    && contest.getFinalizationStartedAt() != null 
                    && contest.getFinalizationStartedAt().isBefore(now.minusSeconds(600)));

        if (!isEligible) {
            return false;
        }

        contest.setFinalizationStatus(FinalizationStatus.FINALIZING);
        contest.setFinalizationStartedAt(now);
        contest.setFinalizationError(null);
        contestRepository.save(contest);
        return true;
    }

    private List<ContestScoreboardResponse.TeamRow> getOrRebuildScoreboard(ContestEntity contest) {
        // Gọi thẳng ContestRankingService, nơi đã có sẵn logic check Redis và Fallback DB
        return contestRankingService.getScoreboard(contest.getId(), true).getRows();
    }

    @Transactional
    public void saveSnapshot(ContestEntity contest, List<ContestScoreboardResponse.TeamRow> scoreboard) throws Exception {
        String jsonSnapshot = objectMapper.writeValueAsString(scoreboard);
        contest.setFinalScoreboardSnapshot(jsonSnapshot);
        contestRepository.save(contest);
        log.info("[FINALIZER] Full scoreboard snapshot saved for contest {}", contest.getId());
    }

    private void distributeRewards(ContestEntity contest, List<ContestScoreboardResponse.TeamRow> scoreboard) {
        int maxWinners = Math.min(scoreboard.size(), 3);
        for (int i = 0; i < maxWinners; i++) {
            ContestScoreboardResponse.TeamRow row = scoreboard.get(i);
            int rank = row.getRank();
            
            BigDecimal prize = BigDecimal.ZERO;
            if (rank == 1) prize = contest.getReward1st();
            else if (rank == 2) prize = contest.getReward2nd();
            else if (rank == 3) prize = contest.getReward3rd();

            if (prize == null || prize.compareTo(BigDecimal.ZERO) <= 0) {
                log.info("[FINALIZER] Reward for Rank {} is 0 or null. Skipping reward logic.", rank);
                continue;
            }

            try {
                // Phân phối thưởng độc lập trong một transaction mới (propagation = REQUIRES_NEW)
                distributeRewardForWinner(contest.getId(), row.getUserId(), rank, prize);
            } catch (Exception e) {
                log.error("[FINALIZER] Failed to distribute reward for User {} at Rank {} in contest {}: {}",
                        row.getUserId(), rank, contest.getId(), e.getMessage());
                throw new RuntimeException("Error processing reward for rank " + rank + ": " + e.getMessage(), e);
            }
        }
    }

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

    @Transactional
    public void markAsFinalized(Integer contestId) {
        ContestEntity contest = contestRepository.findById(contestId).orElse(null);
        if (contest != null) {
            contest.setFinalizationStatus(FinalizationStatus.FINALIZED);
            contest.setFinalizedAt(Instant.now());
            contestRepository.save(contest);
        }
    }

    @Transactional
    public void markAsFailed(Integer contestId, String errorMessage) {
        try {
            ContestEntity contest = contestRepository.findById(contestId).orElse(null);
            if (contest != null) {
                contest.setFinalizationStatus(FinalizationStatus.FAILED);
                contest.setFinalizationError(errorMessage);
                contestRepository.save(contest);
            }
        } catch (Exception e) {
            log.error("[FINALIZER] Critical failure updating contest to FAILED state: {}", e.getMessage());
        }
    }
}
