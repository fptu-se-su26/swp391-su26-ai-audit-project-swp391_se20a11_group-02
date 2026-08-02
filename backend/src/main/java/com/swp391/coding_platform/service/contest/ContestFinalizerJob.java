package com.swp391.coding_platform.service.contest;

import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.Instant;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ContestFinalizerJob {

    ContestRepository contestRepository;
    ContestFinalizationService contestFinalizationService;

    /**
     * Chạy định kỳ mỗi 30 giây để quét các contest đã kết thúc và tiến hành chốt sổ.
     */
    @Scheduled(fixedRate = 30000)
    public void scanAndFinalizeContests() {
        Instant now = Instant.now();
        // Thời gian timeout để phục hồi lock: 10 phút trước
        Instant timeoutLimit = now.minusSeconds(600);

        try {
            List<ContestEntity> contestsToFinalize = contestRepository.findContestsToFinalize(now, timeoutLimit);
            if (contestsToFinalize.isEmpty()) {
                return;
            }

            log.info("[FINALIZER-JOB] Found {} contests eligible for finalization.", contestsToFinalize.size());
            for (ContestEntity contest : contestsToFinalize) {
                try {
                    contestFinalizationService.finalizeContest(contest.getId());
                } catch (Exception e) {
                    log.error("[FINALIZER-JOB] Error triggering finalization for contest {}: {}", contest.getId(), e.getMessage());
                }
            }
        } catch (Exception e) {
            log.error("[FINALIZER-JOB] Failed to scan contests for finalization: {}", e.getMessage(), e);
        }
    }
}
