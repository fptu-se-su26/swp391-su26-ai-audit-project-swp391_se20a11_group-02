package com.swp391.coding_platform.integration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swp391.coding_platform.event.SubmissionJudgedEvent;
import com.swp391.coding_platform.dto.response.ContestScoreboardResponse;
import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.contest.ContestProblemEntity;
import com.swp391.coding_platform.entity.contest.ContestWinnerEntity;
import com.swp391.coding_platform.entity.enums.ContestStatus;
import com.swp391.coding_platform.entity.enums.FinalizationStatus;
import com.swp391.coding_platform.entity.payment.WalletEntity;
import com.swp391.coding_platform.entity.payment.WalletTransactionEntity;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.repository.contest.ContestProblemRepository;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.contest.ContestWinnerRepository;
import com.swp391.coding_platform.repository.payment.WalletRepository;
import com.swp391.coding_platform.repository.payment.WalletTransactionRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import com.swp391.coding_platform.service.contest.ContestFinalizationService;
import com.swp391.coding_platform.service.contest.ContestRankingService;
import com.swp391.coding_platform.service.contest.ContestRewardExecutor;
import com.swp391.coding_platform.service.payment.WalletService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.core.ZSetOperations;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.*;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
public class ContestModuleIntegrationTest {

    @Mock
    ContestRepository contestRepository;
    @Mock
    ContestProblemRepository contestProblemRepository;
    @Mock
    UserRepository userRepository;
    @Mock
    ContestWinnerRepository contestWinnerRepository;
    @Mock
    WalletRepository walletRepository;
    @Mock
    WalletTransactionRepository walletTransactionRepository;
    @Mock
    StringRedisTemplate stringRedisTemplate;
    @Mock
    RabbitTemplate rabbitTemplate;
    @Mock
    ZSetOperations<String, String> zSetOperations;
    @Mock
    HashOperations<String, Object, Object> hashOperations;
    @Mock
    ValueOperations<String, String> valueOperations;

    WalletService walletService;
    ContestRankingService contestRankingService;
    ContestFinalizationService contestFinalizationService;

    ObjectMapper objectMapper = new ObjectMapper();

    UserEntity user1;
    UserEntity user2;
    UserEntity user3;
    ContestEntity contest;
    ProblemEntity problemA;
    ProblemEntity problemB;

    @BeforeEach
    void setUp() {
        walletService = new WalletService(walletRepository, walletTransactionRepository, userRepository);
        contestRankingService = new ContestRankingService(
                stringRedisTemplate, contestRepository, contestProblemRepository,
                userRepository, null, null, objectMapper, rabbitTemplate
        );
        ContestRewardExecutor contestRewardExecutor = new ContestRewardExecutor(
                contestWinnerRepository, contestRepository, userRepository, walletService
        );
        contestFinalizationService = new ContestFinalizationService(
                contestRepository, contestWinnerRepository, userRepository,
                walletService, contestRankingService, contestRewardExecutor, objectMapper
        );

        when(stringRedisTemplate.opsForZSet()).thenReturn(zSetOperations);
        when(stringRedisTemplate.opsForHash()).thenReturn(hashOperations);
        when(stringRedisTemplate.opsForValue()).thenReturn(valueOperations);

        // Mock Users
        user1 = UserEntity.builder().id(101).username("alice").displayname("Alice").build();
        user2 = UserEntity.builder().id(102).username("bob").displayname("Bob").build();
        user3 = UserEntity.builder().id(103).username("charlie").displayname("Charlie").build();

        when(userRepository.findById(101)).thenReturn(Optional.of(user1));
        when(userRepository.findById(102)).thenReturn(Optional.of(user2));
        when(userRepository.findById(103)).thenReturn(Optional.of(user3));
        when(userRepository.findAllById(any())).thenReturn(List.of(user1, user2, user3));
        when(userRepository.getReferenceById(101)).thenReturn(user1);
        when(userRepository.getReferenceById(102)).thenReturn(user2);
        when(userRepository.getReferenceById(103)).thenReturn(user3);

        // Mock Contest
        contest = ContestEntity.builder()
                .id(1)
                .title("Winter Coding Cup")
                .status(ContestStatus.PUBLISHED)
                .finalizationStatus(FinalizationStatus.PENDING)
                .startTime(Instant.now().minus(2, ChronoUnit.HOURS))
                .endTime(Instant.now().minus(10, ChronoUnit.MINUTES))
                .reward1st(new BigDecimal("1000.00"))
                .reward2nd(new BigDecimal("500.00"))
                .reward3rd(new BigDecimal("250.00"))
                .build();

        when(contestRepository.findById(1)).thenReturn(Optional.of(contest));
        when(contestRepository.getReferenceById(1)).thenReturn(contest);

        // Mock Problems
        problemA = ProblemEntity.builder().id(10).build();
        problemB = ProblemEntity.builder().id(11).build();

        ContestProblemEntity cp1 = ContestProblemEntity.builder().id(1).contest(contest).problem(problemA).orderIndex(0).build();
        ContestProblemEntity cp2 = ContestProblemEntity.builder().id(2).contest(contest).problem(problemB).orderIndex(1).build();

        when(contestProblemRepository.findByContestIdWithProblem(1)).thenReturn(new ArrayList<>(List.of(cp1, cp2)));
    }

    @Test
    @DisplayName("Integration Test: Full Contest Lifecycle (Submission Judging -> Atomic Score Updates -> Finalization & Wallet Rewards)")
    void testFullContestLifecycleIntegration() {
        // 1. Mock Lua Script execution & ZSET Scoreboard
        when(stringRedisTemplate.execute(any(), anyList(), any())).thenReturn("1:0:1200");

        Set<ZSetOperations.TypedTuple<String>> mockZset = new LinkedHashSet<>();
        mockZset.add(ZSetOperations.TypedTuple.of("101", 20000000000.0 - 1200)); // Solved 2, penalty 1200s
        mockZset.add(ZSetOperations.TypedTuple.of("102", 10000000000.0 - 600));  // Solved 1, penalty 600s
        mockZset.add(ZSetOperations.TypedTuple.of("103", 10000000000.0 - 1800)); // Solved 1, penalty 1800s

        when(zSetOperations.reverseRangeWithScores("contest:scoreboard:1:live", 0, -1)).thenReturn(mockZset);
        when(hashOperations.get(contains("101"), anyString())).thenReturn("1:0:600");
        when(hashOperations.get(contains("102"), anyString())).thenReturn("1:0:600");
        when(hashOperations.get(contains("103"), anyString())).thenReturn("1:2:600");

        // 2. Submit Judged Events
        SubmissionJudgedEvent event1 = SubmissionJudgedEvent.builder()
                .contestId(1)
                .userId(101)
                .problemId(10)
                .verdict("ACCEPTED")
                .submitTime(Instant.now().minus(1, ChronoUnit.HOURS))
                .build();

        ContestScoreboardResponse liveScoreboard = contestRankingService.updateContestRanking(event1);

        assertNotNull(liveScoreboard);
        assertEquals(3, liveScoreboard.getRows().size());

        // 3. Mock User Wallets for Finalization
        WalletEntity w1 = WalletEntity.builder().user(user1).balance(BigDecimal.ZERO).build();
        WalletEntity w2 = WalletEntity.builder().user(user2).balance(BigDecimal.ZERO).build();
        WalletEntity w3 = WalletEntity.builder().user(user3).balance(BigDecimal.ZERO).build();

        when(walletRepository.findByUserIdWithLock(101)).thenReturn(Optional.of(w1));
        when(walletRepository.findByUserIdWithLock(102)).thenReturn(Optional.of(w2));
        when(walletRepository.findByUserIdWithLock(103)).thenReturn(Optional.of(w3));
        when(walletRepository.save(any(WalletEntity.class))).thenAnswer(invocation -> invocation.getArgument(0));
        when(walletTransactionRepository.save(any(WalletTransactionEntity.class))).thenAnswer(invocation -> invocation.getArgument(0));
        when(contestWinnerRepository.save(any(ContestWinnerEntity.class))).thenAnswer(invocation -> invocation.getArgument(0));

        // 4. Execute Contest Finalization
        contestFinalizationService.finalizeContest(1);

        // 5. Verify Winner Rewards Distributed
        assertEquals(FinalizationStatus.FINALIZED, contest.getFinalizationStatus());
        assertNotNull(contest.getFinalScoreboardSnapshot());

        // Verify Rank 1 (Alice) got 1000.00 VND
        assertEquals(new BigDecimal("1000.00"), w1.getBalance());

        // Verify Rank 2 (Bob) got 500.00 VND
        assertEquals(new BigDecimal("500.00"), w2.getBalance());

        // Verify Rank 3 (Charlie) got 250.00 VND
        assertEquals(new BigDecimal("250.00"), w3.getBalance());

        // Verify 3 winner records saved
        verify(contestWinnerRepository, times(3)).save(any(ContestWinnerEntity.class));
    }
}
