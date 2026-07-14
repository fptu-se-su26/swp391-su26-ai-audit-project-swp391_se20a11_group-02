package com.swp391.coding_platform.service.admin;

import com.swp391.coding_platform.dto.response.AdminFinancialMonthlyRecordResponse;
import com.swp391.coding_platform.entity.enums.OrderStatus;
import com.swp391.coding_platform.entity.payment.OrderEntity;
import com.swp391.coding_platform.repository.payment.OrderItemRepository;
import com.swp391.coding_platform.repository.payment.OrderRepository;
import com.swp391.coding_platform.repository.payment.PayoutRequestRepository;
import com.swp391.coding_platform.repository.payment.WalletTransactionRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class AdminFinancialServiceTest {

    @Mock
    private OrderRepository orderRepository;

    @Mock
    private OrderItemRepository orderItemRepository;

    @Mock
    private WalletTransactionRepository walletTransactionRepository;

    @Mock
    private PayoutRequestRepository payoutRequestRepository;

    @InjectMocks
    private AdminFinancialService adminFinancialService;

    @Test
    void getMonthlyFinancialRecords_Success() {
        OrderEntity order = new OrderEntity();
        order.setTotalAmount(BigDecimal.valueOf(100));
        order.setCreatedAt(Instant.now());
        
        when(orderRepository.findAllByStatusWithDetails(OrderStatus.COMPLETED))
                .thenReturn(Collections.singletonList(order));
        
        when(walletTransactionRepository.findAll())
                .thenReturn(Collections.emptyList());

        List<AdminFinancialMonthlyRecordResponse> result = adminFinancialService.getMonthlyFinancialRecords();

        assertNotNull(result);
        assertEquals(12, result.size());
    }

    @Test
    void getMonthlyFinancialRecords_NoOrders_Success() {
        when(orderRepository.findAllByStatusWithDetails(OrderStatus.COMPLETED))
                .thenReturn(Collections.emptyList());
        
        when(walletTransactionRepository.findAll())
                .thenReturn(Collections.emptyList());

        List<AdminFinancialMonthlyRecordResponse> result = adminFinancialService.getMonthlyFinancialRecords();

        assertNotNull(result);
        assertEquals(12, result.size());
    }
}
