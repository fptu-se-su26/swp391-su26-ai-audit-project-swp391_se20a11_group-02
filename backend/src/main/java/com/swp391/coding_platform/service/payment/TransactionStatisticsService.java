package com.swp391.coding_platform.service.payment;

import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.dto.response.TransactionStatisticResponse;
import com.swp391.coding_platform.entity.enums.TransactionType;
import com.swp391.coding_platform.entity.payment.WalletTransactionEntity;
import com.swp391.coding_platform.mapper.WalletTransactionMapper;
import com.swp391.coding_platform.repository.payment.WalletTransactionRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TransactionStatisticsService {

    WalletTransactionRepository walletTransactionRepository;
    WalletTransactionMapper walletTransactionMapper;

    @Transactional(readOnly = true)
    public PageResponse<TransactionStatisticResponse> getTransactionStatistics(Integer userId, TransactionType type, Pageable pageable) {
        // Enforce maximum of 10 records per page as requested
        int pageSize = Math.min(pageable.getPageSize(), 10);

        // Always sort by transaction time descending (newest transactions first)
        Pageable cappedPageable = PageRequest.of(
                pageable.getPageNumber(),
                pageSize,
                Sort.by(Sort.Direction.DESC, "createdAt")
        );

        Page<WalletTransactionEntity> transactionPage;
        if (type == null) {
            transactionPage = walletTransactionRepository.findByWalletUserId(userId, cappedPageable);
        } else {
            transactionPage = walletTransactionRepository.findByWalletUserIdAndType(userId, type, cappedPageable);
        }

        // Map using MapStruct mapper
        Page<TransactionStatisticResponse> dtoPage = transactionPage.map(walletTransactionMapper::toTransactionStatisticResponse);

        return PageResponse.from(dtoPage);
    }
}
