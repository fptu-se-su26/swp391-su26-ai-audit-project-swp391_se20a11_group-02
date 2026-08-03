package com.swp391.coding_platform.service.contest;

import com.swp391.coding_platform.dto.response.ContestScoreboardResponse;
import com.swp391.coding_platform.dto.response.ContestScoreboardResponse.ProblemSummary;
import com.swp391.coding_platform.dto.response.ContestScoreboardResponse.TeamRow;
import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.contest.ContestProblemEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.event.SubmissionJudgedEvent;
import com.swp391.coding_platform.repository.contest.ContestProblemRepository;
import com.swp391.coding_platform.configuration.RabbitMQConfig;
import com.swp391.coding_platform.dto.message.ContestRankingDbUpdateMessage;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.contest.ContestRankingRepository;
import com.swp391.coding_platform.repository.contest.ContestProblemAttemptRepository;
import com.swp391.coding_platform.entity.contest.ContestRankingEntity;
import com.swp391.coding_platform.entity.contest.ContestProblemAttemptEntity;
import com.swp391.coding_platform.repository.user.UserRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.time.Instant;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ContestRankingService {

    StringRedisTemplate stringRedisTemplate;
    ContestRepository contestRepository;
    ContestProblemRepository contestProblemRepository;
    UserRepository userRepository;
    ContestRankingRepository contestRankingRepository;
    ContestProblemAttemptRepository contestProblemAttemptRepository;
    ObjectMapper objectMapper;
    RabbitTemplate rabbitTemplate;

    org.springframework.data.redis.core.script.RedisScript<String> updateRankingScript = createUpdateRankingScript();

    private static org.springframework.data.redis.core.script.RedisScript<String> createUpdateRankingScript() {
        org.springframework.data.redis.core.script.DefaultRedisScript<String> script = new org.springframework.data.redis.core.script.DefaultRedisScript<>();
        script.setLocation(new org.springframework.core.io.ClassPathResource("scripts/update_ranking.lua"));
        script.setResultType(String.class);
        return script;
    }

    @Transactional
    public ContestScoreboardResponse updateContestRanking(SubmissionJudgedEvent event) {
        Integer contestId = event.getContestId();
        Integer userId = event.getUserId();
        Integer problemId = event.getProblemId();
        String verdict = event.getVerdict();
        Instant submitTime = event.getSubmitTime();

        ContestEntity contest = contestRepository.findById(contestId).orElse(null);
        if (contest == null) {
            log.warn("Contest not found for id: {}", contestId);
            return null;
        }

        // Redis Key cho participant state (live vs public)
        String liveHashKey = "contest:participant:" + contestId + ":" + userId + ":live";
        String publicHashKey = "contest:participant:" + contestId + ":" + userId + ":public";
        String field = "problem_" + problemId;

        boolean verdictIsAc = "ACCEPTED".equalsIgnoreCase(verdict);
        boolean isCompilationError = "COMPILATION_ERROR".equalsIgnoreCase(verdict);

        if (isCompilationError) {
            // Compilation error is not penalized
            return getScoreboard(contestId, false);
        }

        int isAcNew = verdictIsAc ? 1 : 0;
        long diffSeconds = Duration.between(contest.getStartTime(), submitTime).getSeconds();
        if (diffSeconds < 0) diffSeconds = 0;

        // Thực thi Redis Lua Script để cập nhật trạng thái bài nộp một cách NGUYÊN TỬ (Atomic Execution)
        String luaResult = stringRedisTemplate.execute(
                updateRankingScript,
                Collections.singletonList(liveHashKey),
                field,
                String.valueOf(isAcNew),
                String.valueOf(diffSeconds)
        );

        if (luaResult != null && luaResult.startsWith("ALREADY_SOLVED")) {
            log.info("User {} already solved problem {} in contest {}. Ignoring current submission.", userId, problemId, contestId);
            return getScoreboard(contestId, false);
        }

        String newStatus = luaResult;
        int isAc = 0;
        int wrongAttempts = 0;
        long firstAcTimeSeconds = 0;

        if (newStatus != null && !newStatus.trim().isEmpty()) {
            String[] parts = newStatus.split(":");
            if (parts.length >= 3) {
                isAc = Integer.parseInt(parts[0]);
                wrongAttempts = Integer.parseInt(parts[1]);
                firstAcTimeSeconds = Long.parseLong(parts[2]);
            }
        }

        if (verdictIsAc) {
            // Lưu người đầu tiên giải được (first solver) bài này
            String firstSolveKey = "contest:first_solve:" + contestId + ":" + problemId;
            stringRedisTemplate.opsForValue().setIfAbsent(firstSolveKey, String.valueOf(userId));
        }

        log.info("Updated live status for user {} on problem {} to {}", userId, problemId, newStatus);

        // Duyệt qua tất cả các bài toán của user đó trong Contest để tính điểm tổng hợp (dựa trên Live Hash)
        List<ContestProblemEntity> contestProblems = contestProblemRepository.findByContestIdWithProblem(contestId);
        
        int problemsSolved = 0;
        long totalPenaltySeconds = 0;

        for (ContestProblemEntity cp : contestProblems) {
            String f = "problem_" + cp.getProblem().getId();
            String status = (String) stringRedisTemplate.opsForHash().get(liveHashKey, f);
            if (status != null && !status.trim().isEmpty()) {
                String[] parts = status.split(":");
                if (parts.length >= 3) {
                    int pAc = Integer.parseInt(parts[0]);
                    int pWrong = Integer.parseInt(parts[1]);
                    long pAcTime = Long.parseLong(parts[2]);

                    if (pAc == 1) {
                        problemsSolved += 1;
                        totalPenaltySeconds += pAcTime + ((long) pWrong * 20 * 60);
                    }
                }
            }
        }

        // Tính toán Score nguyên bản dịch chuyển (ZSET Score)
        // Formula: score = (problemsSolved * 10^10) + (10^9 - totalPenaltySeconds)
        long baseScore = 1_000_000_000L;
        double zsetScore = ((double) problemsSolved * 1e10) + (baseScore - totalPenaltySeconds);

        // Cập nhật ZSET Live Scoreboard
        String liveScoreboardKey = "contest:scoreboard:" + contestId + ":live";
        stringRedisTemplate.opsForZSet().add(liveScoreboardKey, String.valueOf(userId), zsetScore);

        // Xử lý Contest (Đóng băng bảng điểm đã được bỏ, cập nhật luôn public và live)
        String publicScoreboardKey = "contest:scoreboard:" + contestId + ":public";
        stringRedisTemplate.opsForZSet().add(publicScoreboardKey, String.valueOf(userId), zsetScore);
        stringRedisTemplate.opsForHash().put(publicHashKey, field, newStatus);
        log.info("Updated public status and scoreboard for user {} on problem {}", userId, problemId);

        // Đặt thời hạn tự động dọn dẹp RAM Redis (7 ngày sau khi cuộc thi kết thúc)
        applyRedisTtlIfEnded(contest, liveScoreboardKey, publicScoreboardKey, liveHashKey, publicHashKey);

        // ==========================================
        // PERSIST RANKING TO DATABASE (Lưu xuống DB để không mất khi Redis restart)
        // ==========================================
        ContestRankingDbUpdateMessage dbMessage = ContestRankingDbUpdateMessage.builder()
                .contestId(contestId)
                .userId(userId)
                .problemsSolved(problemsSolved)
                .totalPenaltyMinutes((int) (totalPenaltySeconds / 60))
                .problemId(problemId)
                .isSolved(isAc == 1)
                .solvedAtSeconds(isAc == 1 ? (int) firstAcTimeSeconds : null)
                .failedAttemptsCount(wrongAttempts)
                .build();
        rabbitTemplate.convertAndSend(RabbitMQConfig.CONTEST_RANKING_DB_UPDATE_QUEUE, dbMessage);
        log.info("Sent contest ranking DB update message to RabbitMQ for user {} in contest {}", userId, contestId);

        // Trả về scoreboard để stream (mặc định stream bảng public cho đại chúng)
        return getScoreboard(contestId, false);
    }

    public ContestScoreboardResponse getScoreboard(Integer contestId, boolean isLive) {
        ContestEntity contest = contestRepository.findById(contestId).orElse(null);
        if (contest != null && contest.getFinalScoreboardSnapshot() != null) {
            try {
                List<TeamRow> rows = objectMapper.readValue(
                        contest.getFinalScoreboardSnapshot(),
                        new TypeReference<List<TeamRow>>() {}
                );
                return ContestScoreboardResponse.builder()
                        .contestId(contestId)
                        .rows(rows)
                        .build();
            } catch (Exception e) {
                log.error("Failed to parse scoreboard snapshot for contest {}", contestId, e);
            }
        }

        // Tự động giải băng nếu contest đã kết thúc
        boolean finalLive = isLive;
        if (!finalLive) {
            if (contest != null && Instant.now().isAfter(contest.getEndTime())) {
                finalLive = true;
            }
        }

        String zsetKey = "contest:scoreboard:" + contestId + (finalLive ? ":live" : ":public");

        Set<ZSetOperations.TypedTuple<String>> rankedMembers = null;
        try {
            rankedMembers = stringRedisTemplate.opsForZSet().reverseRangeWithScores(zsetKey, 0, -1);
        } catch (Exception e) {
            log.warn("Failed to read ZSET from Redis for contest {}. Falling back to DB.", contestId, e);
        }

        if (rankedMembers == null || rankedMembers.isEmpty()) {
            return getScoreboardFromDb(contestId);
        }

        List<ContestProblemEntity> contestProblems = new ArrayList<>(contestProblemRepository.findByContestIdWithProblem(contestId));
        contestProblems.sort(Comparator.comparing(ContestProblemEntity::getOrderIndex));

        List<Integer> userIds = rankedMembers.stream()
                .map(m -> Integer.parseInt(m.getValue()))
                .collect(Collectors.toList());

        List<UserEntity> users = userRepository.findAllById(userIds);
        Map<Integer, UserEntity> userMap = users.stream()
                .collect(Collectors.toMap(UserEntity::getId, u -> u));

        // Pipelined Hash Reads cho toàn bộ (rankedMembers x contestProblems) tránh N+1 Redis network calls
        final String suffix = finalLive ? ":live" : ":public";
        List<Object> rawResults = null;
        try {
            final Set<ZSetOperations.TypedTuple<String>> membersToFetch = rankedMembers;
            rawResults = stringRedisTemplate.executePipelined(
                    (org.springframework.data.redis.core.RedisCallback<Object>) connection -> {
                        for (ZSetOperations.TypedTuple<String> tuple : membersToFetch) {
                            String userIdStr = tuple.getValue();
                            String participantHashKey = "contest:participant:" + contestId + ":" + userIdStr + suffix;
                            byte[] keyBytes = participantHashKey.getBytes(java.nio.charset.StandardCharsets.UTF_8);
                            for (ContestProblemEntity cp : contestProblems) {
                                byte[] fieldBytes = ("problem_" + cp.getProblem().getId()).getBytes(java.nio.charset.StandardCharsets.UTF_8);
                                connection.hashCommands().hGet(keyBytes, fieldBytes);
                            }
                        }
                        return null;
                    }
            );
        } catch (Exception e) {
            log.warn("Pipelined Redis read failed for contest {}. Proceeding with fallback.", contestId, e);
        }

        List<TeamRow> rows = new ArrayList<>();
        int rank = 1;
        int resultIdx = 0;

        for (ZSetOperations.TypedTuple<String> tuple : rankedMembers) {
            Integer userId = Integer.parseInt(tuple.getValue());
            Double scoreVal = tuple.getScore();
            if (scoreVal == null) {
                resultIdx += contestProblems.size();
                continue;
            }

            // Sử dụng Math.round để tránh sai số nốt thập phân IEEE 754 của số thực double
            long scoreLong = Math.round(scoreVal);
            int solved = (int) (scoreLong / 10_000_000_000L);
            long penaltySeconds = 1_000_000_000L - (scoreLong % 10_000_000_000L);
            int penaltyMinutes = (int) (penaltySeconds / 60);

            UserEntity user = userMap.get(userId);
            String name = user != null ? user.getUsername() : "User_" + userId;
            String displayName = user != null ? user.getDisplayname() : "User_" + userId;
            String affiliation = "Participant";

            Map<String, ProblemSummary> submissionsMap = new HashMap<>();
            int totalAttempts = 0;

            String participantHashKey = "contest:participant:" + contestId + ":" + userId + suffix;

            for (ContestProblemEntity cp : contestProblems) {
                String label = String.valueOf((char) ('A' + cp.getOrderIndex()));
                String f = "problem_" + cp.getProblem().getId();

                String statusStr = null;
                if (rawResults != null && resultIdx < rawResults.size()) {
                    Object rawVal = rawResults.get(resultIdx++);
                    if (rawVal instanceof String) {
                        statusStr = (String) rawVal;
                    } else if (rawVal instanceof byte[]) {
                        statusStr = new String((byte[]) rawVal, java.nio.charset.StandardCharsets.UTF_8);
                    }
                } else {
                    statusStr = (String) stringRedisTemplate.opsForHash().get(participantHashKey, f);
                }

                int isAc = 0;
                int wrongAttempts = 0;
                long acTimeSec = 0;

                if (statusStr != null && !statusStr.trim().isEmpty()) {
                    String[] parts = statusStr.split(":");
                    if (parts.length >= 3) {
                        isAc = Integer.parseInt(parts[0]);
                        wrongAttempts = Integer.parseInt(parts[1]);
                        acTimeSec = Long.parseLong(parts[2]);
                    }
                }

                totalAttempts += wrongAttempts + isAc;

                String status = "unattempted";
                if (isAc == 1) {
                    String firstSolveKey = "contest:first_solve:" + contestId + ":" + cp.getProblem().getId();
                    String firstSolverId = stringRedisTemplate.opsForValue().get(firstSolveKey);
                    if (String.valueOf(userId).equals(firstSolverId)) {
                        status = "first_solve";
                    } else {
                        status = "accepted";
                    }
                } else if (wrongAttempts > 0) {
                    status = "failed";
                }

                String timeStr = isAc == 1 ? formatElapsed(acTimeSec * 1000) : null;

                submissionsMap.put(label, ProblemSummary.builder()
                        .time(timeStr)
                        .penalty(wrongAttempts)
                        .status(status)
                        .build());
            }

            rows.add(TeamRow.builder()
                    .rank(rank++)
                    .userId(userId)
                    .name(name)
                    .displayName(displayName)
                    .affiliation(affiliation)
                    .solved(solved)
                    .totalAttempts(totalAttempts)
                    .totalPenalty(penaltyMinutes)
                    .submissions(submissionsMap)
                    .build());
        }

        return ContestScoreboardResponse.builder()
                .contestId(contestId)
                .rows(rows)
                .build();
    }

    private void applyRedisTtlIfEnded(ContestEntity contest, String liveScoreboardKey, String publicScoreboardKey, String liveHashKey, String publicHashKey) {
        if (contest != null && contest.getEndTime() != null) {
            try {
                Instant expireAt = contest.getEndTime().plus(7, java.time.temporal.ChronoUnit.DAYS);
                long ttlSeconds = java.time.Duration.between(Instant.now(), expireAt).getSeconds();
                if (ttlSeconds > 0) {
                    stringRedisTemplate.expire(liveScoreboardKey, java.time.Duration.ofSeconds(ttlSeconds));
                    stringRedisTemplate.expire(publicScoreboardKey, java.time.Duration.ofSeconds(ttlSeconds));
                    stringRedisTemplate.expire(liveHashKey, java.time.Duration.ofSeconds(ttlSeconds));
                    stringRedisTemplate.expire(publicHashKey, java.time.Duration.ofSeconds(ttlSeconds));
                }
            } catch (Exception e) {
                log.warn("Failed to set TTL for contest Redis keys", e);
            }
        }
    }

    private String formatElapsed(long elapsedMs) {
        long totalSecs = elapsedMs / 1000;
        long hrs = totalSecs / 3600;
        long mins = (totalSecs % 3600) / 60;
        long secs = totalSecs % 60;
        return String.format("%d:%02d:%02d", hrs, mins, secs);
    }

    @Transactional(readOnly = true)
    public ContestScoreboardResponse getScoreboardFromDb(Integer contestId) {
        log.info("[FALLBACK] Rebuilding scoreboard from DB for contest {}", contestId);
        List<ContestRankingEntity> rankings = contestRankingRepository
                .findByContestIdOrderByProblemsSolvedDescTotalPenaltyAscUpdatedAtAsc(contestId);

        List<ContestProblemEntity> contestProblems = contestProblemRepository.findByContestIdWithProblem(contestId);
        contestProblems.sort(Comparator.comparing(ContestProblemEntity::getOrderIndex));

        // Xác định người đầu tiên giải được (First Solver) cho mỗi bài toán trong contest từ DB
        List<ContestProblemAttemptEntity> solvedAttempts = contestProblemAttemptRepository
                .findSolvedAttemptsByContestId(contestId);

        // Key: problemId, Value: userId của người giải đầu tiên
        Map<Integer, Integer> firstSolverMap = new HashMap<>();
        Map<Integer, Integer> minSolvedTimeMap = new HashMap<>(); // Key: problemId, Value: min time in seconds

        for (ContestProblemAttemptEntity attempt : solvedAttempts) {
            Integer problemId = attempt.getProblem().getId();
            Integer solvedAt = attempt.getSolvedAtSeconds();
            if (solvedAt != null) {
                Integer currentMin = minSolvedTimeMap.get(problemId);
                if (currentMin == null || solvedAt < currentMin) {
                    minSolvedTimeMap.put(problemId, solvedAt);
                    firstSolverMap.put(problemId, attempt.getUser().getId());
                }
            }
        }

        List<TeamRow> rows = new ArrayList<>();
        int rank = 1;

        for (ContestRankingEntity r : rankings) {
            Integer userId = r.getUser().getId();
            String name = r.getUser().getUsername();
            String displayName = r.getUser().getDisplayname() != null ? r.getUser().getDisplayname() : r.getUser().getUsername();
            String affiliation = "Participant";
            int solved = r.getProblemsSolved();
            int penaltyMinutes = r.getTotalPenalty();

            // Lấy tất cả attempts của user này
            List<ContestProblemAttemptEntity> userAttempts = contestProblemAttemptRepository
                    .findByContestIdAndUserId(contestId, userId);
            Map<Integer, ContestProblemAttemptEntity> attemptMap = userAttempts.stream()
                    .collect(Collectors.toMap(a -> a.getProblem().getId(), a -> a));

            Map<String, ProblemSummary> submissionsMap = new HashMap<>();
            int totalAttempts = 0;

            for (ContestProblemEntity cp : contestProblems) {
                String label = String.valueOf((char) ('A' + cp.getOrderIndex()));
                ContestProblemAttemptEntity attempt = attemptMap.get(cp.getProblem().getId());

                int isAc = 0;
                int wrongAttempts = 0;
                Integer acTimeSec = 0;

                if (attempt != null) {
                    isAc = attempt.getIsSolved() ? 1 : 0;
                    wrongAttempts = attempt.getFailedAttemptsCount();
                    acTimeSec = attempt.getSolvedAtSeconds();
                }

                totalAttempts += wrongAttempts + isAc;

                String status = "unattempted";
                if (isAc == 1) {
                    Integer firstSolverId = firstSolverMap.get(cp.getProblem().getId());
                    if (userId.equals(firstSolverId)) {
                        status = "first_solve";
                    } else {
                        status = "accepted";
                    }
                } else if (wrongAttempts > 0) {
                    status = "failed";
                }

                String timeStr = isAc == 1 && acTimeSec != null ? formatElapsed(acTimeSec * 1000) : null;

                submissionsMap.put(label, ProblemSummary.builder()
                        .time(timeStr)
                        .penalty(wrongAttempts)
                        .status(status)
                        .build());
            }

            rows.add(TeamRow.builder()
                    .rank(rank++)
                    .userId(userId)
                    .name(name)
                    .displayName(displayName)
                    .affiliation(affiliation)
                    .solved(solved)
                    .totalAttempts(totalAttempts)
                    .totalPenalty(penaltyMinutes)
                    .submissions(submissionsMap)
                    .build());
        }

        return ContestScoreboardResponse.builder()
                .contestId(contestId)
                .rows(rows)
                .build();
    }
}
