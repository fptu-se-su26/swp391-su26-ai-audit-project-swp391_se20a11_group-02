package com.swp391.coding_platform.service.contest;

import com.swp391.coding_platform.configuration.RabbitMQConfig;
import com.swp391.coding_platform.dto.message.ContestRankingDbUpdateMessage;
import com.swp391.coding_platform.entity.contest.ContestRankingEntity;
import com.swp391.coding_platform.repository.contest.ContestRankingRepository;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ContestRankingDbService {

    ContestRankingRepository contestRankingRepository;
    ContestRepository contestRepository;
    UserRepository userRepository;

    /**
     * Tiêu thụ tin nhắn cập nhật xếp hạng từ RabbitMQ và lưu vào DB.
     */
    @RabbitListener(queues = RabbitMQConfig.CONTEST_RANKING_DB_UPDATE_QUEUE)
    @Transactional
    public void persistRankingToDatabase(ContestRankingDbUpdateMessage message) {
        Integer contestId = message.getContestId();
        Integer userId = message.getUserId();
        int problemsSolved = message.getProblemsSolved();
        int totalPenaltyMinutes = message.getTotalPenaltyMinutes();

        log.info("[RABBITMQ-CONSUMER] Received ranking update message for user {} in contest {} (Thread: {})",
                userId, contestId, Thread.currentThread().getName());
        try {
            var existingOpt = contestRankingRepository.findByContestIdAndUserId(contestId, userId);
            if (existingOpt.isPresent()) {
                ContestRankingEntity existing = existingOpt.get();
                existing.setProblemsSolved(problemsSolved);
                existing.setTotalPenalty(totalPenaltyMinutes);
                existing.setUpdatedAt(Instant.now());
                contestRankingRepository.save(existing);
                log.info("[RABBITMQ-CONSUMER] Successfully updated DB ranking for user {} in contest {}: solved={}, penalty={}min",
                        userId, contestId, problemsSolved, totalPenaltyMinutes);
            } else {
                ContestRankingEntity newRanking = ContestRankingEntity.builder()
                        .contest(contestRepository.getReferenceById(contestId))
                        .user(userRepository.getReferenceById(userId))
                        .problemsSolved(problemsSolved)
                        .totalPenalty(totalPenaltyMinutes)
                        .updatedAt(Instant.now())
                        .build();
                contestRankingRepository.save(newRanking);
                log.info("[RABBITMQ-CONSUMER] Successfully inserted DB ranking for user {} in contest {}: solved={}, penalty={}min",
                        userId, contestId, problemsSolved, totalPenaltyMinutes);
            }
        } catch (Exception e) {
            log.error("[RABBITMQ-CONSUMER] Failed to persist ranking to DB for user {} in contest {}: {}",
                    userId, contestId, e.getMessage(), e);
        }
    }
}
