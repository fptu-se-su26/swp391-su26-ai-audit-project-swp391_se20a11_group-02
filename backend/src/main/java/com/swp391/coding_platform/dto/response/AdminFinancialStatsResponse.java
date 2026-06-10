package com.swp391.coding_platform.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AdminFinancialStatsResponse {
    List<MonthlyFinancialRecord> financialMonthlyRecords;
    List<TopRevenueCourse> topRevenueCourses;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class MonthlyFinancialRecord {
        String label;
        String datePrefix;
        Long gross;
        Long count;
        Long rewards;
        Long server;
        Long marketing;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class TopRevenueCourse {
        String name;
        String tutor;
        Long sold;
        Long gross;
        Long payout;
        Long plat;
    }
}
