package com.swp391.coding_platform.service.admin;

import com.swp391.coding_platform.dto.response.AdminDashboardStatsResponse;
import com.swp391.coding_platform.dto.response.AdminDashboardStatsResponse.MonthlyStat;
import com.swp391.coding_platform.dto.response.AdminDashboardStatsResponse.TopCategory;
import com.swp391.coding_platform.dto.response.AdminDashboardStatsResponse.TopCourse;
import com.swp391.coding_platform.dto.response.AdminDashboardStatsResponse.TopInstructor;
import com.swp391.coding_platform.dto.response.AdminDashboardStatsResponse.TopProblem;
import com.swp391.coding_platform.dto.response.AdminDepositHistoryResponse;
import com.swp391.coding_platform.dto.response.AdminFinancialStatsResponse;
import com.swp391.coding_platform.dto.response.AdminFinancialStatsResponse.MonthlyFinancialRecord;
import com.swp391.coding_platform.dto.response.AdminFinancialStatsResponse.TopRevenueCourse;
import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.course.CourseEntity;
import com.swp391.coding_platform.entity.enums.OrderStatus;
import com.swp391.coding_platform.entity.enums.StatusTransaction;
import com.swp391.coding_platform.entity.enums.TransactionType;
import com.swp391.coding_platform.entity.enums.UserStatus;
import com.swp391.coding_platform.entity.payment.OrderEntity;
import com.swp391.coding_platform.entity.payment.OrderItemEntity;
import com.swp391.coding_platform.entity.payment.WalletTransactionEntity;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.entity.instructor.InstructorEntity;
import com.swp391.coding_platform.repository.category.CategoryRepository;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.course.CourseRepository;
import com.swp391.coding_platform.repository.instructor.InstructorRepository;
import com.swp391.coding_platform.repository.payment.OrderRepository;
import com.swp391.coding_platform.repository.payment.OrderItemRepository;
import com.swp391.coding_platform.repository.payment.WalletTransactionRepository;
import com.swp391.coding_platform.repository.problem.ProblemRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import com.swp391.coding_platform.repository.user.UserRepository;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AdminDashboardService {

    UserRepository userRepository;
    ContestRepository contestRepository;
    CourseRepository courseRepository;
    InstructorRepository instructorRepository;
    ProblemRepository problemRepository;
    OrderRepository orderRepository;
    OrderItemRepository orderItemRepository;
    WalletTransactionRepository walletTransactionRepository;
    CategoryRepository categoryRepository;
    ProblemSubmissionRepository problemSubmissionRepository;

    public AdminDashboardStatsResponse getDashboardStats() {
        // 1. KPI Counts
        long activeUsers = userRepository.countByStatus(UserStatus.ACTIVE);
        long activeContests = contestRepository.countActiveContests(Instant.now());
        long totalCourses = courseRepository.count();
        long totalInstructors = instructorRepository.count();
        long totalProblems = problemRepository.count();

        // Total Revenue: sum of completed orders
        List<OrderEntity> allCompletedOrders = orderRepository.findAllByStatus(OrderStatus.COMPLETED);
        long totalRevenue = allCompletedOrders.stream()
                .mapToLong(o -> o.getTotalAmount().longValue())
                .sum();

        // 2. Platform Monthly Stats (Last 12 Months)
        List<MonthlyStat> financialChartData = getMonthlyStats(allCompletedOrders);

        // 3. Top Registered Categories
        List<TopCategory> topCategories = getTopCategories();

        // 4. Top Subscribed Courses
        List<TopCourse> topCourses = getTopSubscribedCourses();

        // 5. Top Instructors
        List<TopInstructor> topInstructors = getTopInstructors();

        // 6. Top Submitted Problems
        List<TopProblem> topProblems = getTopSubmittedProblems();

        return AdminDashboardStatsResponse.builder()
                .activeUsers(activeUsers)
                .activeContests(activeContests)
                .totalCourses(totalCourses)
                .totalInstructors(totalInstructors)
                .totalProblems(totalProblems)
                .totalRevenue(totalRevenue)
                .financialChartData(financialChartData)
                .topCategories(topCategories)
                .topCourses(topCourses)
                .topInstructors(topInstructors)
                .topProblems(topProblems)
                .build();
    }

    public List<AdminDepositHistoryResponse> getRecentDeposits() {
        Pageable pageable = PageRequest.of(0, 5);
        List<WalletTransactionEntity> deposits = walletTransactionRepository.findRecentTransactions(
                TransactionType.DEPOSIT, StatusTransaction.SUCCESS, pageable);

        return deposits.stream().map(wt -> {
            String userName = "Unknown User";
            if (wt.getWallet() != null && wt.getWallet().getUser() != null) {
                userName = wt.getWallet().getUser().getDisplayname();
            }
            return AdminDepositHistoryResponse.builder()
                    .id(String.valueOf(wt.getId()))
                    .userName(userName)
                    .amount(wt.getAmount().longValue())
                    .date(wt.getCreatedAt().toString())
                    .build();
        }).collect(Collectors.toList());
    }

    private List<MonthlyStat> getMonthlyStats(List<OrderEntity> completedOrders) {
        List<MonthlyStat> monthlyStats = new ArrayList<>();
        DateTimeFormatter labelFormatter = DateTimeFormatter.ofPattern("MMM yy", Locale.ENGLISH);
        LocalDate today = LocalDate.now();

        // Initialize 12 month buckets ending at the current month
        for (int i = 11; i >= 0; i--) {
            LocalDate monthDate = today.minusMonths(i);
            String label = monthDate.format(labelFormatter);
            monthlyStats.add(new MonthlyStat(label, 0L, 0L, 0L));
        }

        Map<String, MonthlyStat> statMap = monthlyStats.stream()
                .collect(Collectors.toMap(MonthlyStat::getLabel, s -> s));

        // Aggregate User Registrations
        Instant oneYearAgo = today.minusMonths(11).withDayOfMonth(1).atStartOfDay(ZoneId.systemDefault()).toInstant();
        List<UserEntity> newUsers = userRepository.findAllByCreatedAtAfter(oneYearAgo);
        for (UserEntity user : newUsers) {
            if (user.getCreatedAt() != null) {
                LocalDate date = user.getCreatedAt().atZone(ZoneId.systemDefault()).toLocalDate();
                String label = date.format(labelFormatter);
                MonthlyStat stat = statMap.get(label);
                if (stat != null) {
                    stat.setUsersCount(stat.getUsersCount() + 1);
                }
            }
        }

        // Aggregate Revenue and Course Sales (Completed Orders)
        for (OrderEntity order : completedOrders) {
            if (order.getCreatedAt() != null && order.getCreatedAt().isAfter(oneYearAgo)) {
                LocalDate date = order.getCreatedAt().atZone(ZoneId.systemDefault()).toLocalDate();
                String label = date.format(labelFormatter);
                MonthlyStat stat = statMap.get(label);
                if (stat != null) {
                    stat.setAmount(stat.getAmount() + order.getTotalAmount().longValue());
                    stat.setCount(stat.getCount() + 1);
                }
            }
        }

        return monthlyStats;
    }

    private List<TopCategory> getTopCategories() {
        List<Object[]> results = categoryRepository.findCategoryEnrollmentCounts();
        List<TopCategory> topCategories = new ArrayList<>();

        String[] defaultColors = {"#F36F21", "#12284C", "#10B981", "#3B82F6", "#6B7280"};
        int colorIdx = 0;

        for (Object[] row : results) {
            String name = (String) row[0];
            long count = ((Number) row[1]).longValue();
            String color = getCategoryColor(name);
            topCategories.add(new TopCategory(name, count, color));
        }

        // Sort descending
        topCategories.sort((c1, c2) -> Long.compare(c2.getCount(), c1.getCount()));

        // Pad with mock data if database has no categories to prevent empty visual state
        if (topCategories.isEmpty()) {
            topCategories.add(new TopCategory("Web Developer", 180, "#F36F21"));
            topCategories.add(new TopCategory("Data Science & AI", 140, "#12284C"));
            topCategories.add(new TopCategory("Mobile App", 95, "#10B981"));
            topCategories.add(new TopCategory("Cloud Computing", 65, "#3B82F6"));
            topCategories.add(new TopCategory("Others", 40, "#6B7280"));
        }

        return topCategories.stream().limit(5).collect(Collectors.toList());
    }

    private String getCategoryColor(String name) {
        if (name == null) return "#6B7280";
        String lower = name.toLowerCase();
        if (lower.contains("web")) return "#F36F21";
        if (lower.contains("data") || lower.contains("ai") || lower.contains("science") || lower.contains("machine")) return "#12284C";
        if (lower.contains("mobile") || lower.contains("app")) return "#10B981";
        if (lower.contains("cloud") || lower.contains("devops")) return "#3B82F6";
        return "#6B7280";
    }

    private List<TopCourse> getTopSubscribedCourses() {
        Pageable pageable = PageRequest.of(0, 4);
        List<CourseEntity> courses = courseRepository.findTopCourses(pageable);
        List<TopCourse> topCourses = new ArrayList<>();

        String[] colors = {"#F36F21", "#10B981", "#3B82F6", "#6366F1"};
        int i = 0;

        for (CourseEntity c : courses) {
            String instructorName = "Unknown Instructor";
            if (c.getInstructor() != null) {
                instructorName = c.getInstructor().getFullName();
            }
            String color = colors[i % colors.length];
            topCourses.add(new TopCourse(c.getTitle(), instructorName, c.getTotalEnrolled().longValue(), color));
            i++;
        }

        // Pad with mock data if database has no courses to prevent empty state
        if (topCourses.isEmpty()) {
            topCourses.add(new TopCourse("React Full-Stack (Dr. Jenkins)", "Dr. Jenkins", 120, "#F36F21"));
            topCourses.add(new TopCourse("Java Algorithms (Alice Miller)", "Alice Miller", 95, "#10B981"));
            topCourses.add(new TopCourse("Go Microservices (John Doe)", "John Doe", 80, "#3B82F6"));
            topCourses.add(new TopCourse("Python ML (Dr. Jenkins)", "Dr. Jenkins", 50, "#6366F1"));
        }

        return topCourses;
    }

    private List<TopInstructor> getTopInstructors() {
        Pageable pageable = PageRequest.of(0, 4);
        List<Object[]> results = courseRepository.findTopInstructors(pageable);
        List<TopInstructor> topInstructors = new ArrayList<>();

        String[] colors = {"#F36F21", "#12284C", "#10B981", "#3B82F6"};
        int i = 0;

        for (Object[] row : results) {
            String name = (String) row[0];
            long count = ((Number) row[1]).longValue();
            String color = colors[i % colors.length];
            topInstructors.add(new TopInstructor(name, count, color));
            i++;
        }

        // Pad with mock data if database has no instructors to prevent empty state
        if (topInstructors.isEmpty()) {
            topInstructors.add(new TopInstructor("Dr. Jenkins", 170, "#F36F21"));
            topInstructors.add(new TopInstructor("Alice Miller", 115, "#12284C"));
            topInstructors.add(new TopInstructor("John Doe", 80, "#10B981"));
            topInstructors.add(new TopInstructor("Sarah Connor", 55, "#3B82F6"));
        }

        return topInstructors;
    }

    private List<TopProblem> getTopSubmittedProblems() {
        Pageable pageable = PageRequest.of(0, 4);
        List<Object[]> results = problemSubmissionRepository.findTopProblems(pageable);
        List<TopProblem> topProblems = new ArrayList<>();

        String[] colors = {"#F36F21", "#12284C", "#10B981", "#3B82F6"};
        int i = 0;

        for (Object[] row : results) {
            String name = (String) row[0];
            String difficulty = String.valueOf(row[1]);
            long count = ((Number) row[2]).longValue();
            String color = colors[i % colors.length];
            topProblems.add(new TopProblem(name, difficulty, count, color));
            i++;
        }

        // Pad with mock data if database has no problem submissions to prevent empty state
        if (topProblems.isEmpty()) {
            topProblems.add(new TopProblem("Two Sum", "EASY", 350, "#F36F21"));
            topProblems.add(new TopProblem("Binary Search", "EASY", 240, "#12284C"));
            topProblems.add(new TopProblem("Longest Path", "HARD", 180, "#10B981"));
            topProblems.add(new TopProblem("Valid Parentheses", "MEDIUM", 150, "#3B82F6"));
        }

        return topProblems;
    }

    @org.springframework.transaction.annotation.Transactional(readOnly = true)
    public AdminFinancialStatsResponse getFinancialStats() {
        // Query completed orders
        List<OrderEntity> allCompletedOrders = orderRepository.findAllByStatusWithDetails(OrderStatus.COMPLETED);

        // Query successful AWARD transactions (if any)
        List<WalletTransactionEntity> awards = walletTransactionRepository.findAll().stream()
                .filter(t -> t.getType() == TransactionType.AWARD && t.getStatus() == StatusTransaction.SUCCESS)
                .collect(Collectors.toList());

        // 1. Get Monthly Financial Records (Last 12 Months)
        List<MonthlyFinancialRecord> financialMonthlyRecords = getMonthlyFinancialRecords(allCompletedOrders, awards);

        // 2. Get Top Revenue Generating Courses
        List<TopRevenueCourse> topRevenueCourses = getTopRevenueCoursesData();

        return AdminFinancialStatsResponse.builder()
                .financialMonthlyRecords(financialMonthlyRecords)
                .topRevenueCourses(topRevenueCourses)
                .build();
    }

    private List<MonthlyFinancialRecord> getMonthlyFinancialRecords(
            List<OrderEntity> completedOrders, List<WalletTransactionEntity> awards) {

        List<MonthlyFinancialRecord> records = new ArrayList<>();
        DateTimeFormatter labelFormatter = DateTimeFormatter.ofPattern("MMM yy", Locale.ENGLISH);
        DateTimeFormatter datePrefixFormatter = DateTimeFormatter.ofPattern("yyyy-MM");
        LocalDate today = LocalDate.now();

        // Server & Marketing simulated expenses
        Map<String, Long> marketingMap = new HashMap<>();
        marketingMap.put("Jul 25", 1000000L);
        marketingMap.put("Aug 25", 1200000L);
        marketingMap.put("Sep 25", 1000000L);
        marketingMap.put("Oct 25", 1500000L);
        marketingMap.put("Nov 25", 1500000L);
        marketingMap.put("Dec 25", 2000000L);
        marketingMap.put("Jan 26", 800000L);
        marketingMap.put("Feb 26", 1000000L);
        marketingMap.put("Mar 26", 1500000L);
        marketingMap.put("Apr 26", 1200000L);
        marketingMap.put("May 26", 1800000L);
        marketingMap.put("Jun 26", 2000000L);

        Instant oneYearAgo = today.minusMonths(11).withDayOfMonth(1).atStartOfDay(ZoneId.systemDefault()).toInstant();

        for (int i = 11; i >= 0; i--) {
            LocalDate monthDate = today.minusMonths(i);
            String label = monthDate.format(labelFormatter);
            String datePrefix = monthDate.format(datePrefixFormatter);

            // Server cost simulation
            long serverCost = (monthDate.isBefore(LocalDate.of(2025, 11, 1))) ? 1200000L : 1500000L;
            long marketingCost = marketingMap.getOrDefault(label, 1500000L);

            records.add(new MonthlyFinancialRecord(label, datePrefix, 0L, 0L, 0L, serverCost, marketingCost));
        }

        Map<String, MonthlyFinancialRecord> recordMap = records.stream()
                .collect(Collectors.toMap(MonthlyFinancialRecord::getLabel, r -> r));

        // Aggregate completed orders for gross revenue and sales counts
        for (OrderEntity order : completedOrders) {
            if (order.getCreatedAt() != null && order.getCreatedAt().isAfter(oneYearAgo)) {
                LocalDate date = order.getCreatedAt().atZone(ZoneId.systemDefault()).toLocalDate();
                String label = date.format(labelFormatter);
                MonthlyFinancialRecord rec = recordMap.get(label);
                if (rec != null) {
                    rec.setGross(rec.getGross() + order.getTotalAmount().longValue());
                    long itemsCount = order.getOrderItems() != null ? order.getOrderItems().size() : 0;
                    rec.setCount(rec.getCount() + itemsCount);
                }
            }
        }

        // Aggregate awards
        for (WalletTransactionEntity tx : awards) {
            if (tx.getCreatedAt() != null && tx.getCreatedAt().isAfter(oneYearAgo)) {
                LocalDate date = tx.getCreatedAt().atZone(ZoneId.systemDefault()).toLocalDate();
                String label = date.format(labelFormatter);
                MonthlyFinancialRecord rec = recordMap.get(label);
                if (rec != null) {
                    rec.setRewards(rec.getRewards() + tx.getAmount().longValue());
                }
            }
        }

        return records;
    }

    private List<TopRevenueCourse> getTopRevenueCoursesData() {
        List<OrderItemEntity> completedOrderItems = orderItemRepository.findAllCompletedOrderItemsWithDetails();

        Map<CourseEntity, List<OrderItemEntity>> itemsByCourse = completedOrderItems.stream()
                .filter(item -> item.getCourse() != null)
                .collect(Collectors.groupingBy(OrderItemEntity::getCourse));

        List<TopRevenueCourse> topRevenueCourses = itemsByCourse.entrySet().stream()
                .map(entry -> {
                    CourseEntity course = entry.getKey();
                    List<OrderItemEntity> items = entry.getValue();
                    long sold = items.size();
                    long gross = items.stream().mapToLong(item -> item.getPrice().longValue()).sum();
                    long payout = Math.round(gross * 0.7);
                    long plat = Math.round(gross * 0.3);
                    String tutor = course.getInstructor() != null ? course.getInstructor().getFullName() : "Unknown Instructor";
                    return new TopRevenueCourse(course.getTitle(), tutor, sold, gross, payout, plat);
                })
                .sorted((c1, c2) -> Long.compare(c2.getGross(), c1.getGross()))
                .collect(Collectors.toList());

        return topRevenueCourses;
    }

    @org.springframework.transaction.annotation.Transactional(readOnly = true)
    public com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse getFinancialDetails() {
        // Query completed orders with details to avoid N+1 queries
        List<OrderEntity> completedOrders = orderRepository.findAllByStatusWithDetails(OrderStatus.COMPLETED).stream()
                .sorted(Comparator.comparing(OrderEntity::getCreatedAt).reversed())
                .collect(Collectors.toList());

        // Query successful AWARD transactions
        List<WalletTransactionEntity> awards = walletTransactionRepository.findAll().stream()
                .filter(t -> t.getType() == TransactionType.AWARD && t.getStatus() == StatusTransaction.SUCCESS)
                .sorted(Comparator.comparing(WalletTransactionEntity::getCreatedAt).reversed())
                .collect(Collectors.toList());

        // 1. Order details list
        List<com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.OrderDetails> orderDetailsList = completedOrders.stream().map(o -> {
            String customerName = o.getUser() != null ? o.getUser().getDisplayname() : "Unknown";
            String customerEmail = o.getUser() != null ? o.getUser().getEmail() : "Unknown";
            String courses = o.getOrderItems() != null ? o.getOrderItems().stream()
                    .map(item -> item.getCourse() != null ? item.getCourse().getTitle() : "Unknown Course")
                    .collect(Collectors.joining(", ")) : "";
            long gross = o.getTotalAmount().longValue();
            long plat = Math.round(gross * 0.3);
            long instructor = Math.round(gross * 0.7);

            return com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.OrderDetails.builder()
                    .id(String.valueOf(o.getId()))
                    .customerName(customerName)
                    .customerEmail(customerEmail)
                    .courses(courses)
                    .grossAmount(gross)
                    .instructorShare(instructor)
                    .platformCut(plat)
                    .date(o.getCreatedAt().toString())
                    .build();
        }).collect(Collectors.toList());

        // 2. Award details list
        List<com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.AwardDetails> awardDetailsList = awards.stream().map(t -> {
            String userName = "Unknown";
            String userEmail = "Unknown";
            if (t.getWallet() != null && t.getWallet().getUser() != null) {
                userName = t.getWallet().getUser().getDisplayname();
                userEmail = t.getWallet().getUser().getEmail();
            }
            return com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.AwardDetails.builder()
                    .id(String.valueOf(t.getId()))
                    .userName(userName)
                    .userEmail(userEmail)
                    .amount(t.getAmount().longValue())
                    .date(t.getCreatedAt().toString())
                    .referenceId(t.getReferenceId())
                    .build();
        }).collect(Collectors.toList());

        // 3. Sale details list
        List<OrderItemEntity> completedOrderItems = orderItemRepository.findAllCompletedOrderItemsWithDetails().stream()
                .sorted(Comparator.comparing((OrderItemEntity item) -> item.getOrder().getCreatedAt()).reversed())
                .collect(Collectors.toList());

        List<com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.SaleDetails> saleDetailsList = completedOrderItems.stream().map(item -> {
            String courseTitle = item.getCourse() != null ? item.getCourse().getTitle() : "Unknown Course";
            String instructorName = (item.getCourse() != null && item.getCourse().getInstructor() != null) ? 
                    item.getCourse().getInstructor().getFullName() : "Unknown Instructor";
            String customerName = (item.getOrder() != null && item.getOrder().getUser() != null) ? 
                    item.getOrder().getUser().getDisplayname() : "Unknown Customer";

            return com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.SaleDetails.builder()
                    .orderId(String.valueOf(item.getOrder().getId()))
                    .courseTitle(courseTitle)
                    .instructorName(instructorName)
                    .customerName(customerName)
                    .price(item.getPrice().longValue())
                    .date(item.getOrder().getCreatedAt().toString())
                    .build();
        }).collect(Collectors.toList());

        // 4. Monthly breakdowns for all time
        List<com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.MonthlyFinancialBreakdown> monthlyBreakdowns = 
                getMonthlyFinancialBreakdownsAllTime(completedOrders, awards);

        return com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.builder()
                .orders(orderDetailsList)
                .awards(awardDetailsList)
                .sales(saleDetailsList)
                .monthlyBreakdowns(monthlyBreakdowns)
                .build();
    }

    private List<com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.MonthlyFinancialBreakdown> getMonthlyFinancialBreakdownsAllTime(
            List<OrderEntity> completedOrders, List<WalletTransactionEntity> awards) {

        List<com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.MonthlyFinancialBreakdown> records = new ArrayList<>();
        DateTimeFormatter labelFormatter = DateTimeFormatter.ofPattern("MMM yy", Locale.ENGLISH);
        DateTimeFormatter datePrefixFormatter = DateTimeFormatter.ofPattern("yyyy-MM");
        LocalDate today = LocalDate.now();

        Map<String, Long> marketingMap = new HashMap<>();
        marketingMap.put("Jul 25", 1000000L);
        marketingMap.put("Aug 25", 1200000L);
        marketingMap.put("Sep 25", 1000000L);
        marketingMap.put("Oct 25", 1500000L);
        marketingMap.put("Nov 25", 1500000L);
        marketingMap.put("Dec 25", 2000000L);
        marketingMap.put("Jan 26", 800000L);
        marketingMap.put("Feb 26", 1000000L);
        marketingMap.put("Mar 26", 1500000L);
        marketingMap.put("Apr 26", 1200000L);
        marketingMap.put("May 26", 1800000L);
        marketingMap.put("Jun 26", 2000000L);

        LocalDate startDate = today.minusMonths(11).withDayOfMonth(1);
        if (!completedOrders.isEmpty()) {
            LocalDate oldestOrderDate = completedOrders.stream()
                    .filter(o -> o.getCreatedAt() != null)
                    .map(o -> o.getCreatedAt().atZone(ZoneId.systemDefault()).toLocalDate())
                    .min(Comparator.naturalOrder())
                    .orElse(today)
                    .withDayOfMonth(1);
            if (oldestOrderDate.isBefore(startDate)) {
                startDate = oldestOrderDate;
            }
        }

        LocalDate temp = startDate;
        while (!temp.isAfter(today)) {
            String label = temp.format(labelFormatter);
            String datePrefix = temp.format(datePrefixFormatter);

            long serverCost = (temp.isBefore(LocalDate.of(2025, 11, 1))) ? 1200000L : 1500000L;
            long marketingCost = marketingMap.getOrDefault(label, 1500000L);

            records.add(new com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.MonthlyFinancialBreakdown(
                    label, datePrefix, 0L, 0L, 0L, serverCost, marketingCost, 0L));
            temp = temp.plusMonths(1);
        }

        Map<String, com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.MonthlyFinancialBreakdown> recordMap = records.stream()
                .collect(Collectors.toMap(com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.MonthlyFinancialBreakdown::getLabel, r -> r));

        Instant startInstant = startDate.atStartOfDay(ZoneId.systemDefault()).toInstant();

        for (OrderEntity order : completedOrders) {
            if (order.getCreatedAt() != null && !order.getCreatedAt().isBefore(startInstant)) {
                LocalDate date = order.getCreatedAt().atZone(ZoneId.systemDefault()).toLocalDate();
                String label = date.format(labelFormatter);
                com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.MonthlyFinancialBreakdown rec = recordMap.get(label);
                if (rec != null) {
                    rec.setGross(rec.getGross() + order.getTotalAmount().longValue());
                    long itemsCount = order.getOrderItems() != null ? order.getOrderItems().size() : 0;
                    rec.setCount(rec.getCount() + itemsCount);
                }
            }
        }

        for (WalletTransactionEntity tx : awards) {
            if (tx.getCreatedAt() != null && !tx.getCreatedAt().isBefore(startInstant)) {
                LocalDate date = tx.getCreatedAt().atZone(ZoneId.systemDefault()).toLocalDate();
                String label = date.format(labelFormatter);
                com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.MonthlyFinancialBreakdown rec = recordMap.get(label);
                if (rec != null) {
                    rec.setRewards(rec.getRewards() + tx.getAmount().longValue());
                }
            }
        }

        for (com.swp391.coding_platform.dto.response.AdminFinancialDetailsResponse.MonthlyFinancialBreakdown rec : records) {
            long gross = rec.getGross();
            long platformShare = Math.round(gross * 0.3);
            long gatewayFees = Math.round(gross * 0.02);
            long otherExpenses = rec.getServer() + rec.getMarketing() + gatewayFees;
            long netProfit = platformShare - rec.getRewards() - otherExpenses;
            rec.setNetProfit(netProfit);
        }

        return records;
    }
}
