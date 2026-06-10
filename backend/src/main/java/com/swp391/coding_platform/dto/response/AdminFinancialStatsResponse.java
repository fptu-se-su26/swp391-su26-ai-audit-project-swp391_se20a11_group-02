package com.swp391.coding_platform.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AdminFinancialStatsResponse {
    private List<MonthlyFinancialRecord> financialMonthlyRecords;
    private List<TopRevenueCourse> topRevenueCourses;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class MonthlyFinancialRecord {
        private String label;        // e.g., "Jul 25"
        private String datePrefix;   // e.g., "2025-07"
        private long gross;          // gross revenue from completed orders
        private long count;          // courses sold
        private long rewards;        // contest awards paid
        private long server;         // simulated server cost
        private long marketing;      // simulated marketing cost
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class TopRevenueCourse {
        private String name;
        private String tutor;
        private long sold;
        private long gross;
        private long payout;
        private long plat;
    }
}
