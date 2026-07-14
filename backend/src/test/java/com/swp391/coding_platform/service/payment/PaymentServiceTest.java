package com.swp391.coding_platform.service.payment;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.swp391.coding_platform.configuration.ProjectProperties;
import com.swp391.coding_platform.entity.enums.PaymentType;
import com.swp391.coding_platform.entity.enums.StatusTransaction;
import com.swp391.coding_platform.entity.payment.PaymentTransactionEntity;
import com.swp391.coding_platform.entity.payment.WalletEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.payment.PaymentTransactionRepository;
import com.swp391.coding_platform.repository.payment.WalletRepository;
import com.swp391.coding_platform.repository.payment.WalletTransactionRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import vn.payos.PayOS;
import vn.payos.type.PaymentLinkData;
import vn.payos.type.Webhook;
import vn.payos.type.WebhookData;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.Collections;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class PaymentServiceTest {

    @Mock
    private PayOS payOS;

    @Mock
    private ProjectProperties.Payos payosProps;

    @Mock
    private WalletRepository walletRepository;

    @Mock
    private PaymentTransactionRepository paymentTransactionRepository;

    @Mock
    private WalletTransactionRepository walletTransactionRepository;

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private PaymentService paymentService;

    private UserEntity user;
    private WalletEntity wallet;
    private PaymentTransactionEntity transaction;

    @BeforeEach
    void setUp() {
        user = new UserEntity();
        user.setId(1);
        user.setUsername("testuser");

        wallet = new WalletEntity();
        wallet.setId(1);
        wallet.setUser(user);
        wallet.setBalance(new BigDecimal("100.00"));

        transaction = new PaymentTransactionEntity();
        transaction.setId(1);
        transaction.setWallet(wallet);
        transaction.setTransactionCode("123456");
        transaction.setAmount(new BigDecimal("50.00"));
        transaction.setType(PaymentType.DEPOSIT);
        transaction.setStatus(StatusTransaction.PENDING);
    }

    @Test
    void getUserBalance_UserHasWallet_ReturnsBalance() {
        when(walletRepository.findByUserId(1)).thenReturn(Optional.of(wallet));

        BigDecimal balance = paymentService.getUserBalance(1);

        assertEquals(new BigDecimal("100.00"), balance);
    }

    @Test
    void getUserBalance_UserHasNoWallet_ReturnsZero() {
        when(walletRepository.findByUserId(1)).thenReturn(Optional.empty());

        BigDecimal balance = paymentService.getUserBalance(1);

        assertEquals(BigDecimal.ZERO, balance);
    }

    @Test
    void cancelPayment_ValidRequest_CancelsPayment() throws Exception {
        when(paymentTransactionRepository.findByTransactionCode("123456")).thenReturn(Optional.of(transaction));

        paymentService.cancelPayment(1, "123456");

        assertEquals(StatusTransaction.CANCELLED, transaction.getStatus());
        verify(paymentTransactionRepository, times(1)).save(transaction);
        verify(payOS, times(1)).cancelPaymentLink(123456L, "Customer cancelled");
    }

    @Test
    void cancelPayment_TransactionNotFound_ThrowsException() {
        when(paymentTransactionRepository.findByTransactionCode("123456")).thenReturn(Optional.empty());

        AppException ex = assertThrows(AppException.class, () -> paymentService.cancelPayment(1, "123456"));
        assertEquals(ErrorCode.RESOURCE_NOT_FOUND, ex.getErrorCode());
    }

    @Test
    void cancelPayment_UserNotOwner_ThrowsException() {
        when(paymentTransactionRepository.findByTransactionCode("123456")).thenReturn(Optional.of(transaction));

        AppException ex = assertThrows(AppException.class, () -> paymentService.cancelPayment(2, "123456"));
        assertEquals(ErrorCode.UNAUTHENTICATED, ex.getErrorCode());
    }

    @Test
    void reconcilePendingTransactions_PaidTransaction_ProcessesPayment() throws Exception {
        when(paymentTransactionRepository.findByStatusAndCreatedAtBefore(eq(StatusTransaction.PENDING), any(Instant.class)))
                .thenReturn(Collections.singletonList(transaction));

        PaymentLinkData payosData = mock(PaymentLinkData.class);
        when(payosData.getStatus()).thenReturn("PAID");
        when(payOS.getPaymentLinkInformation(123456L)).thenReturn(payosData);

        when(walletRepository.findByUserIdWithLock(1)).thenReturn(Optional.of(wallet));

        paymentService.reconcilePendingTransactions();

        assertEquals(StatusTransaction.SUCCESS, transaction.getStatus());
        verify(paymentTransactionRepository, times(1)).save(transaction);
        verify(walletTransactionRepository, times(1)).save(any());
        assertEquals(new BigDecimal("150.00"), wallet.getBalance());
        verify(walletRepository, times(1)).save(wallet);
    }
}
