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
    ContestRewardExecutor contestRewardExecutor;
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
        boolean isEligible = contest.getStatus() == com.swp391.coding_platform.entity.enums.ContestStatus.PUBLISHED
                && (currentStatus == FinalizationStatus.PENDING 
                || currentStatus == FinalizationStatus.FAILED
                || (currentStatus == FinalizationStatus.FINALIZING 
                    && contest.getFinalizationStartedAt() != null 
                    && contest.getFinalizationStartedAt().isBefore(now.minusSeconds(600))));

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
        if (scoreboard.isEmpty()) return;

        BigDecimal[] baseRewards = new BigDecimal[3];
        baseRewards[0] = contest.getReward1st() != null ? contest.getReward1st() : BigDecimal.ZERO;
        baseRewards[1] = contest.getReward2nd() != null ? contest.getReward2nd() : BigDecimal.ZERO;
        baseRewards[2] = contest.getReward3rd() != null ? contest.getReward3rd() : BigDecimal.ZERO;

        int i = 0;
        while (i < scoreboard.size()) {
            int currentRank = scoreboard.get(i).getRank();
            
            if (currentRank > 3) {
                break;
            }

            int j = i;
            while (j < scoreboard.size() && scoreboard.get(j).getRank() == currentRank) {
                j++;
            }
            int tiedCount = j - i;

            BigDecimal totalPool = BigDecimal.ZERO;
            for (int pos = i; pos < Math.min(j, 3); pos++) {
                totalPool = totalPool.add(baseRewards[pos]);
            }

            BigDecimal prize = tiedCount > 0 
                ? totalPool.divide(BigDecimal.valueOf(tiedCount), 2, java.math.RoundingMode.HALF_UP) 
                : BigDecimal.ZERO;

            for (int pos = i; pos < j; pos++) {
                ContestScoreboardResponse.TeamRow row = scoreboard.get(pos);
                if (prize.compareTo(BigDecimal.ZERO) <= 0) {
                    log.info("[FINALIZER] Reward for Rank {} is 0 or null. Skipping reward logic.", row.getRank());
                    continue;
                }

                try {
                    // Phân phối thưởng qua ContestRewardExecutor (Spring AOP Proxy -> REQUIRES_NEW)
                    contestRewardExecutor.distributeRewardForWinner(contest.getId(), row.getUserId(), row.getRank(), prize);
                } catch (Exception e) {
                    log.error("[FINALIZER] Failed to distribute reward for User {} at Rank {} in contest {}: {}",
                            row.getUserId(), row.getRank(), contest.getId(), e.getMessage());
                    throw new RuntimeException("Error processing reward for rank " + row.getRank() + ": " + e.getMessage(), e);
                }
            }

            i = j;
        }
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
