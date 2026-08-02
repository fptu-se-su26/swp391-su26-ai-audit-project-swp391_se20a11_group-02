package com.swp391.coding_platform.service.contest;

import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.contest.ContestWinnerEntity;
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
import java.util.Collections;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class ContestRewardExecutorTest {

    @Mock
    private ContestWinnerRepository contestWinnerRepository;
    @Mock
    private ContestRepository contestRepository;
    @Mock
    private UserRepository userRepository;
    @Mock
    private WalletService walletService;

    @InjectMocks
    private ContestRewardExecutor contestRewardExecutor;

    private ContestEntity testContest;
    private UserEntity user1;

    @BeforeEach
    void setUp() {
        user1 = UserEntity.builder().id(101).username("winner1").displayname("Winner 1").build();
        testContest = ContestEntity.builder().id(1).build();
    }

    @Test
    void distributeRewardForWinner_Success_SavesWinnerRecord() {
        when(contestWinnerRepository.findByContestId(1)).thenReturn(Collections.emptyList());
        when(walletService.addContestReward(101, BigDecimal.valueOf(1000), "contest:1:rank:1:user:101"))
                .thenReturn(new WalletTransactionEntity());
        when(contestRepository.getReferenceById(1)).thenReturn(testContest);
        when(userRepository.getReferenceById(101)).thenReturn(user1);

        contestRewardExecutor.distributeRewardForWinner(1, 101, 1, BigDecimal.valueOf(1000));

        verify(walletService, times(1)).addContestReward(101, BigDecimal.valueOf(1000), "contest:1:rank:1:user:101");
        verify(contestWinnerRepository, times(1)).save(any(ContestWinnerEntity.class));
    }

    @Test
    void distributeRewardForWinner_AlreadyExists_ShouldBeIdempotent() {
        ContestWinnerEntity existing = ContestWinnerEntity.builder()
                .contest(testContest)
                .user(user1)
                .rank(1)
                .rewardAmount(BigDecimal.valueOf(1000))
                .build();

        when(contestWinnerRepository.findByContestId(1)).thenReturn(List.of(existing));

        contestRewardExecutor.distributeRewardForWinner(1, 101, 1, BigDecimal.valueOf(1000));

        verify(walletService, never()).addContestReward(anyInt(), any(), anyString());
        verify(contestWinnerRepository, never()).save(any());
    }
}
