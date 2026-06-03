package com.swp391.coding_platform.service.user;

import com.swp391.coding_platform.dto.response.UserActivityResponse;
import com.swp391.coding_platform.repository.user.UserDailyActivityRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserActivityService {

    private final UserDailyActivityRepository activityRepository;

    public UserActivityResponse getUserActivitiesByYear(Integer userId, int year) {
        List<LocalDate> activeDates = activityRepository.findActiveDatesByYear(userId, year);
        Integer maxStreak = activityRepository.getMaxStreak(userId);
        Number currentStreakNum = activityRepository.getCurrentValidStreak(userId);
        Integer currentStreak = currentStreakNum != null ? currentStreakNum.intValue() : 0;

        return UserActivityResponse.builder()
                .userId(userId)
                .year(year)
                .maxStreak(maxStreak != null ? maxStreak : 0)
                .currentStreak(currentStreak)
                .activeDates(activeDates)
                .build();
    }
}
