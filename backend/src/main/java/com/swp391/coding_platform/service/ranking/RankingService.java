package com.swp391.coding_platform.service.ranking;

import com.swp391.coding_platform.dto.response.RankingUserResponse;
import com.swp391.coding_platform.dto.response.UserRankStatsResponse;
import com.swp391.coding_platform.repository.user.RankingUserProjection;
import com.swp391.coding_platform.repository.user.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RankingService {

    UserRepository userRepository;

    @Transactional(readOnly = true)
    public List<RankingUserResponse> getGlobalRankings(String filter) {
        boolean checkDate = !"all".equalsIgnoreCase(filter);
        Instant startDate = Instant.now();
        if ("weekly".equalsIgnoreCase(filter)) {
            startDate = Instant.now().minus(7, ChronoUnit.DAYS);
        } else if ("monthly".equalsIgnoreCase(filter)) {
            startDate = Instant.now().minus(30, ChronoUnit.DAYS);
        }

        List<RankingUserProjection> projections = userRepository.getGlobalRankingList(checkDate, startDate);
        List<RankingUserResponse> responses = new ArrayList<>();
        
        for (int i = 0; i < projections.size(); i++) {
            RankingUserProjection p = projections.get(i);
            double points = p.getPoints() != null ? p.getPoints() : 0.0;
            responses.add(RankingUserResponse.builder()
                    .rank(i + 1)
                    .userId(p.getUserId())
                    .name(p.getDisplayname())
                    .avatar(p.getAvatarurl())
                    .points(points)
                    .solved(p.getSolved() != null ? p.getSolved() : 0L)
                    .accuracy(p.getAccuracy() != null ? p.getAccuracy() : 0.0)
                    .language(mapLanguageId(p.getLanguageId()))
                    .title(mapTitle(points))
                    .titleClass(mapTitleClass(points))
                    .build());
        }
        return responses;
    }

    @Transactional(readOnly = true)
    public UserRankStatsResponse getUserRankStats(Integer userId, String filter) {
        boolean checkDate = !"all".equalsIgnoreCase(filter);
        Instant startDate = Instant.now();
        if ("weekly".equalsIgnoreCase(filter)) {
            startDate = Instant.now().minus(7, ChronoUnit.DAYS);
        } else if ("monthly".equalsIgnoreCase(filter)) {
            startDate = Instant.now().minus(30, ChronoUnit.DAYS);
        }

        Integer userRank = userRepository.getUserRank(userId, checkDate, startDate);
        if (userRank == null) {
            userRank = 0;
        }

        List<RankingUserProjection> allRankings = userRepository.getGlobalRankingList(checkDate, startDate);
        double points = 0.0;
        long solved = 0L;
        
        for (RankingUserProjection p : allRankings) {
            if (p.getUserId().equals(userId)) {
                points = p.getPoints() != null ? p.getPoints() : 0.0;
                solved = p.getSolved() != null ? p.getSolved() : 0L;
                break;
            }
        }

        List<java.sql.Date> acceptedDates = userRepository.getAcceptedSubmissionDates(userId);
        int streak = calculateStreak(acceptedDates);

        double pointsToNextRank = 0.0;
        String nextRankUserName = "";

        if (userRank > 1 && userRank - 2 < allRankings.size()) {
            RankingUserProjection nextRankUser = allRankings.get(userRank - 2);
            double nextRankPoints = nextRankUser.getPoints() != null ? nextRankUser.getPoints() : 0.0;
            pointsToNextRank = nextRankPoints - points;
            nextRankUserName = nextRankUser.getDisplayname();
        }

        return UserRankStatsResponse.builder()
                .rank(userRank)
                .points(points)
                .solved(solved)
                .streak(streak)
                .pointsToNextRank(pointsToNextRank)
                .nextRankUserName(nextRankUserName)
                .build();
    }

    private String mapLanguageId(Integer languageId) {
        if (languageId == null) return "C++";
        switch (languageId) {
            case 62: return "Java";
            case 63: return "JavaScript";
            case 71: return "Python";
            case 80: return "R";
            case 54:
            default: return "C++";
        }
    }

    private String mapTitle(double points) {
        if (points >= 5000) return "Grandmaster";
        if (points >= 3000) return "Master";
        if (points >= 2000) return "Guardian";
        if (points >= 1000) return "Knight";
        if (points >= 500) return "DP Wizard";
        if (points >= 200) return "Recursion Master";
        return "Novice";
    }

    private String mapTitleClass(double points) {
        if (points >= 5000) return "bg-[#F36F21]/10 text-[#F36F21] border-[#F36F21]/20";
        if (points >= 3000) return "bg-[#46A040]/10 text-[#46A040] border-[#46A040]/25";
        if (points >= 2000) return "bg-[#12284C]/10 text-[#12284C] border-[#12284C]/25";
        if (points >= 1000) return "bg-blue-100 text-blue-800";
        if (points >= 500) return "bg-[#fce2d3] text-primary";
        if (points >= 200) return "bg-pink-100 text-pink-800";
        return "bg-slate-100 text-slate-800";
    }

    private int calculateStreak(List<java.sql.Date> dates) {
        if (dates == null || dates.isEmpty()) return 0;

        LocalDate today = LocalDate.now();
        LocalDate lastDate = dates.get(0).toLocalDate();

        if (!lastDate.equals(today) && !lastDate.equals(today.minusDays(1))) {
            return 0;
        }

        int streak = 1;
        for (int i = 1; i < dates.size(); i++) {
            LocalDate current = dates.get(i).toLocalDate();
            LocalDate prev = dates.get(i - 1).toLocalDate();
            if (current.equals(prev.minusDays(1))) {
                streak++;
            } else if (!current.equals(prev)) {
                break;
            }
        }
        return streak;
    }
}
