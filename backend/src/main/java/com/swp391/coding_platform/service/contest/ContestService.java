package com.swp391.coding_platform.service.contest;

import com.swp391.coding_platform.dto.response.ContestResponse;
import com.swp391.coding_platform.dto.response.ContestUserStatsResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.contest.ContestParticipantEntity;
import com.swp391.coding_platform.entity.enums.ContestStatus;
import com.swp391.coding_platform.mapper.ContestMapper;
import com.swp391.coding_platform.repository.contest.ContestParticipantRepository;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
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
public class ContestService {

    ContestRepository contestRepository;
    ContestMapper contestMapper;
    UserRepository userRepository;
    ProblemSubmissionRepository problemSubmissionRepository;
    ContestParticipantRepository contestParticipantRepository;

    @Transactional(readOnly = true)
    public PageResponse<ContestResponse> getContests(
            String search,
            String statusFilter,
            String accessFilter,
            int page,
            int size,
            String username) {

        // Translate status filter to database enum value
        ContestStatus dbStatus = null;
        if (statusFilter != null && !statusFilter.equalsIgnoreCase("All")) {
            if (statusFilter.equalsIgnoreCase("Ongoing")) {
                dbStatus = ContestStatus.RUNNING;
            } else {
                try {
                    dbStatus = ContestStatus.valueOf(statusFilter.toUpperCase());
                } catch (IllegalArgumentException e) {
                    // Invalid status, ignore
                }
            }
        }

        // Paging page is 0-indexed in Spring Data. Sort by id DESC for default newest order.
        Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "id"));

        Page<Object[]> contestPage = contestRepository.searchContestsWithStats(
                search,
                dbStatus != null ? dbStatus : ContestStatus.UPCOMING,
                dbStatus != null,
                accessFilter != null ? accessFilter : "All",
                pageable
        );

        Page<ContestResponse> responsePage = contestPage.map(array -> {
            ContestEntity entity = (ContestEntity) array[0];
            Long partCount = (Long) array[1];
            Long probCount = (Long) array[2];

            ContestResponse response = contestMapper.toContestResponse(entity);
            response.setParticipantCount(partCount != null ? partCount.intValue() : 0);
            response.setProblemCount(probCount != null ? probCount.intValue() : 0);

            if (username != null) {
                response.setIsUserRegistered(contestRepository.isUserRegistered(entity.getId(), username));
            } else {
                response.setIsUserRegistered(false);
            }
            return response;
        });

        return PageResponse.from(responsePage);
    }

    @Transactional(readOnly = true)
    public ContestResponse getBannerContest(String username) {
        Pageable limitOne = PageRequest.of(0, 1);
        Page<ContestEntity> ongoingPage = contestRepository.findOngoingContests(ContestStatus.RUNNING, limitOne);
        ContestEntity bannerEntity = null;
        if (!ongoingPage.isEmpty()) {
            bannerEntity = ongoingPage.getContent().get(0);
        } else {
            Page<ContestEntity> upcomingPage = contestRepository.findUpcomingContests(ContestStatus.UPCOMING, limitOne);
            if (!upcomingPage.isEmpty()) {
                bannerEntity = upcomingPage.getContent().get(0);
            }
        }

        if (bannerEntity == null) {
            return null;
        }

        long partCount = contestRepository.countParticipants(bannerEntity.getId());
        long probCount = contestRepository.countProblems(bannerEntity.getId());
        boolean isReg = false;
        if (username != null) {
            isReg = contestRepository.isUserRegistered(bannerEntity.getId(), username);
        }

        ContestResponse response = contestMapper.toContestResponse(bannerEntity);
        response.setParticipantCount((int) partCount);
        response.setProblemCount((int) probCount);
        response.setIsUserRegistered(isReg);

        return response;
    }

    @Transactional(readOnly = true)
    public ContestUserStatsResponse getUserStats(String username) {
        if (username == null) {
            return null;
        }
        var userOpt = userRepository.findByUsername(username);
        if (userOpt.isEmpty()) {
            return null;
        }
        var user = userOpt.get();
        Integer rank = userRepository.getUserRanking(user.getId());
        long totalUsers = userRepository.count();
        long contestsCount = contestRepository.countUserContests(user.getId());

        var submissions = problemSubmissionRepository.findByUserId(user.getId());
        int totalSub = submissions.size();
        int accSub = (int) submissions.stream()
                .filter(s -> s.getVerdict() == com.swp391.coding_platform.entity.enums.OjVerdict.ACCEPTED)
                .count();
        int accuracy = totalSub > 0 ? (accSub * 100 / totalSub) : 0;

        return ContestUserStatsResponse.builder()
                .displayName(user.getDisplayname())
                .avatarUrl(user.getAvatarurl())
                .score(user.getScore())
                .rank(rank != null ? rank : 0)
                .totalUsers(totalUsers)
                .contestsCount(contestsCount)
                .avgAccuracy(accuracy)
                .build();
    }

    @Transactional
    public void registerForContest(Integer contestId, String username) {
        var user = userRepository.findByUsername(username)
                .orElseThrow(() -> new IllegalArgumentException("User not found"));
        var contest = contestRepository.findById(contestId)
                .orElseThrow(() -> new IllegalArgumentException("Contest not found"));

        boolean alreadyRegistered = contestRepository.isUserRegistered(contestId, username);
        if (alreadyRegistered) {
            return;
        }

        ContestParticipantEntity participant = ContestParticipantEntity.builder()
                .contest(contest)
                .user(user)
                .joinedAt(java.time.Instant.now())
                .build();

        contestParticipantRepository.save(participant);
    }
}
