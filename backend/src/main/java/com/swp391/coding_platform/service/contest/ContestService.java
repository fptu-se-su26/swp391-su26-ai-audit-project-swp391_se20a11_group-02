package com.swp391.coding_platform.service.contest;

import com.swp391.coding_platform.dto.request.ContestSearchRequest;
import com.swp391.coding_platform.dto.request.ContestRegisterRequest;
import com.swp391.coding_platform.dto.response.ContestProblemResponse;
import com.swp391.coding_platform.dto.response.ContestResponse;
import com.swp391.coding_platform.dto.response.ContestUserStatsResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.contest.ContestParticipantEntity;
import com.swp391.coding_platform.entity.contest.ContestProblemEntity;
import com.swp391.coding_platform.entity.contest.ContestProblemAttemptEntity;
import com.swp391.coding_platform.entity.enums.ContestStatus;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.mapper.ContestMapper;
import com.swp391.coding_platform.repository.contest.ContestParticipantRepository;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.contest.ContestProblemRepository;
import com.swp391.coding_platform.repository.contest.ContestProblemAttemptRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ContestService {

    ContestRepository contestRepository;
    ContestMapper contestMapper;
    UserRepository userRepository;
    ProblemSubmissionRepository problemSubmissionRepository;
    ContestParticipantRepository contestParticipantRepository;
    ContestProblemRepository contestProblemRepository;
    ContestProblemAttemptRepository contestProblemAttemptRepository;
    PasswordEncoder passwordEncoder;

    @Transactional(readOnly = true)
    public PageResponse<ContestResponse> getContests(ContestSearchRequest request, String username) {
        String statusFilter = request.getStatus();
        String accessFilter = request.getAccess();

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

        // Secure sort by whitelist
        String sortByField = "id";
        if (request.getSortBy() != null) {
            String requestedSortBy = request.getSortBy().trim();
            if (List.of("id", "title", "startTime", "endTime", "durations", "createdAt", "updatedAt").contains(requestedSortBy)) {
                sortByField = requestedSortBy;
            }
        }

        Sort.Direction direction = Sort.Direction.DESC;
        if (request.getSortDirection() != null && request.getSortDirection().equalsIgnoreCase("asc")) {
            direction = Sort.Direction.ASC;
        }

        Pageable pageable = PageRequest.of(request.getPage(), request.getSize(), Sort.by(direction, sortByField));

        Page<Object[]> contestPage = contestRepository.searchContestsWithStats(
                request.getSearch(),
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

    @Transactional(readOnly = true)
    public ContestResponse getContestById(Integer contestId, String username) {
        ContestEntity entity = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        long partCount = contestRepository.countParticipants(contestId);
        long probCount = contestRepository.countProblems(contestId);
        boolean isReg = false;
        if (username != null) {
            isReg = contestRepository.isUserRegistered(contestId, username);
        }

        ContestResponse response = contestMapper.toContestResponse(entity);
        response.setParticipantCount((int) partCount);
        response.setProblemCount((int) probCount);
        response.setIsUserRegistered(isReg);

        return response;
    }

    @Transactional
    public void registerForContest(Integer contestId, String username, ContestRegisterRequest request) {
        var user = userRepository.findByUsername(username)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));
        var contest = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        boolean alreadyRegistered = contestRepository.isUserRegistered(contestId, username);
        if (alreadyRegistered) {
            return;
        }

        // Verify password if contest is private
        if (contest.getPasswordHash() != null && !contest.getPasswordHash().trim().isEmpty()) {
            if (request == null || request.getPassword() == null ||
                    !passwordEncoder.matches(request.getPassword(), contest.getPasswordHash())) {
                throw new AppException(ErrorCode.CONTEST_PASSWORD_INVALID);
            }
        }

        ContestParticipantEntity participant = ContestParticipantEntity.builder()
                .contest(contest)
                .user(user)
                .joinedAt(java.time.Instant.now())
                .build();

        contestParticipantRepository.save(participant);
    }

    @Transactional(readOnly = true)
    public List<ContestProblemResponse> getContestProblems(Integer contestId, String username) {
        if (username == null) {
            throw new AppException(ErrorCode.UNAUTHENTICATED);
        }
        var contest = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        boolean isRegistered = contestRepository.isUserRegistered(contestId, username);
        if (!isRegistered) {
            throw new AppException(ErrorCode.CONTEST_NOT_JOINED);
        }

        List<ContestProblemEntity> contestProblems = contestProblemRepository.findByContestIdWithProblem(contestId);
        List<ContestProblemAttemptEntity> attempts = contestProblemAttemptRepository.findByContestIdAndUsername(contestId, username);

        return contestProblems.stream().map(cp -> {
            var problem = cp.getProblem();

            // Find user's attempt for this specific problem
            var attemptOpt = attempts.stream()
                    .filter(a -> a.getProblem().getId().equals(problem.getId()))
                    .findFirst();

            String status = "UNATTEMPTED";
            if (attemptOpt.isPresent()) {
                var attempt = attemptOpt.get();
                if (attempt.getIsSolved()) {
                    status = "SOLVED";
                } else if (attempt.getFailedAttemptsCount() > 0) {
                    status = "FAILED";
                }
            }

            return ContestProblemResponse.builder()
                    .problemId(problem.getId())
                    .title(problem.getTitle())
                    .orderIndex(cp.getOrderIndex())
                    .difficulty(problem.getDifficulty() != null ? problem.getDifficulty().name() : "MEDIUM")
                    .totalSubmission(problem.getTotalSubmission())
                    .totalAccepted(problem.getTotalAccepted())
                    .status(status)
                    .build();
        }).collect(Collectors.toList());
    }
}
