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
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class ContestFinalizationServiceTest {

    @Mock
    private ContestRepository contestRepository;
    @Mock
    private ContestWinnerRepository contestWinnerRepository;
    @Mock
    private UserRepository userRepository;
    @Mock
    private WalletService walletService;
    @Mock
    private ContestRankingService contestRankingService;
    @Mock
    private ContestRewardExecutor contestRewardExecutor;
    @Mock
    private ObjectMapper objectMapper;

    @InjectMocks
    private ContestFinalizationService contestFinalizationService;

    private ContestEntity testContest;
    private UserEntity user1;
    private UserEntity user2;
    private UserEntity user3;

    @BeforeEach
    void setUp() {
        user1 = UserEntity.builder().id(101).username("winner1").displayname("Winner 1").build();
        user2 = UserEntity.builder().id(102).username("winner2").displayname("Winner 2").build();
        user3 = UserEntity.builder().id(103).username("winner3").displayname("Winner 3").build();

        testContest = ContestEntity.builder()
                .id(1)
                .title("Annual Code Challenge")
                .status(com.swp391.coding_platform.entity.enums.ContestStatus.PUBLISHED)
                .reward1st(BigDecimal.valueOf(1000))
                .reward2nd(BigDecimal.valueOf(500))
                .reward3rd(BigDecimal.valueOf(250))
                .finalizationStatus(FinalizationStatus.PENDING)
                .build();
    }

    @Test
    void tryAcquireLock_PendingStatus_ReturnsTrue() {
        when(contestRepository.findById(1)).thenReturn(Optional.of(testContest));

        boolean acquired = contestFinalizationService.tryAcquireLock(1);

        assertTrue(acquired);
        assertEquals(FinalizationStatus.FINALIZING, testContest.getFinalizationStatus());
        assertNotNull(testContest.getFinalizationStartedAt());
        verify(contestRepository, times(1)).save(testContest);
    }

    @Test
    void tryAcquireLock_AlreadyFinalized_ReturnsFalse() {
        testContest.setFinalizationStatus(FinalizationStatus.FINALIZED);
        when(contestRepository.findById(1)).thenReturn(Optional.of(testContest));

        boolean acquired = contestFinalizationService.tryAcquireLock(1);

        assertFalse(acquired);
        verify(contestRepository, never()).save(any());
    }

    @Test
    void finalizeContest_Success_DistributesRewardsToTop3() throws Exception {
        when(contestRepository.findById(1)).thenReturn(Optional.of(testContest));

        ContestScoreboardResponse.TeamRow row1 = ContestScoreboardResponse.TeamRow.builder().userId(101).rank(1).build();
        ContestScoreboardResponse.TeamRow row2 = ContestScoreboardResponse.TeamRow.builder().userId(102).rank(2).build();
        ContestScoreboardResponse.TeamRow row3 = ContestScoreboardResponse.TeamRow.builder().userId(103).rank(3).build();
        List<ContestScoreboardResponse.TeamRow> rows = List.of(row1, row2, row3);

        ContestScoreboardResponse mockScoreboard = ContestScoreboardResponse.builder().rows(rows).build();

        when(contestRankingService.getScoreboard(eq(1), eq(true))).thenReturn(mockScoreboard);
        when(objectMapper.writeValueAsString(any())).thenReturn("[{\"userId\":101,\"rank\":1}]");

        contestFinalizationService.finalizeContest(1);

        verify(contestRewardExecutor, times(1)).distributeRewardForWinner(eq(1), eq(101), eq(1), argThat(p -> p.compareTo(BigDecimal.valueOf(1000)) == 0));
        verify(contestRewardExecutor, times(1)).distributeRewardForWinner(eq(1), eq(102), eq(2), argThat(p -> p.compareTo(BigDecimal.valueOf(500)) == 0));
        verify(contestRewardExecutor, times(1)).distributeRewardForWinner(eq(1), eq(103), eq(3), argThat(p -> p.compareTo(BigDecimal.valueOf(250)) == 0));
        assertEquals(FinalizationStatus.FINALIZED, testContest.getFinalizationStatus());
    }

    @Test
    void finalizeContest_TiedRank1_SplitsPrizePoolEqually() throws Exception {
        when(contestRepository.findById(1)).thenReturn(Optional.of(testContest));

        // Two participants tied for Rank 1 (occupying positions 1 & 2, pool = 1000 + 500 = 1500 => 750 each)
        ContestScoreboardResponse.TeamRow row1 = ContestScoreboardResponse.TeamRow.builder().userId(101).rank(1).build();
        ContestScoreboardResponse.TeamRow row2 = ContestScoreboardResponse.TeamRow.builder().userId(102).rank(1).build();
        ContestScoreboardResponse.TeamRow row3 = ContestScoreboardResponse.TeamRow.builder().userId(103).rank(3).build();
        List<ContestScoreboardResponse.TeamRow> rows = List.of(row1, row2, row3);

        ContestScoreboardResponse mockScoreboard = ContestScoreboardResponse.builder().rows(rows).build();

        when(contestRankingService.getScoreboard(eq(1), eq(true))).thenReturn(mockScoreboard);
        when(objectMapper.writeValueAsString(any())).thenReturn("[]");

        contestFinalizationService.finalizeContest(1);

        // Tied Rank 1: (1000 + 500) / 2 = 750 each
        verify(contestRewardExecutor, times(1)).distributeRewardForWinner(eq(1), eq(101), eq(1), argThat(p -> p.compareTo(BigDecimal.valueOf(750)) == 0));
        verify(contestRewardExecutor, times(1)).distributeRewardForWinner(eq(1), eq(102), eq(1), argThat(p -> p.compareTo(BigDecimal.valueOf(750)) == 0));
        // Rank 3 gets 250
        verify(contestRewardExecutor, times(1)).distributeRewardForWinner(eq(1), eq(103), eq(3), argThat(p -> p.compareTo(BigDecimal.valueOf(250)) == 0));
        assertEquals(FinalizationStatus.FINALIZED, testContest.getFinalizationStatus());
    }

    @Test
    void finalizeContest_ScoreboardFetchFails_MarksAsFailed() {
        when(contestRepository.findById(1)).thenReturn(Optional.of(testContest));
        when(contestRankingService.getScoreboard(eq(1), eq(true))).thenThrow(new RuntimeException("Redis connection error"));

        contestFinalizationService.finalizeContest(1);

        assertEquals(FinalizationStatus.FAILED, testContest.getFinalizationStatus());
        assertEquals("Redis connection error", testContest.getFinalizationError());
    }
}
