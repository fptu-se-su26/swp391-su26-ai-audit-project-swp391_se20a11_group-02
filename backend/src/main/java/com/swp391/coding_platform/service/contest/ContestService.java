package com.swp391.coding_platform.service.contest;

import com.swp391.coding_platform.dto.request.ContestSearchRequest;
import com.swp391.coding_platform.dto.request.ContestRegisterRequest;
import com.swp391.coding_platform.dto.request.AdminContestRequest;
import com.swp391.coding_platform.dto.request.AdminContestProblemRequest;
import com.swp391.coding_platform.dto.response.ContestProblemResponse;
import com.swp391.coding_platform.dto.response.ContestResponse;
import com.swp391.coding_platform.dto.response.ContestUserStatsResponse;
import com.swp391.coding_platform.dto.response.PageResponse;
import com.swp391.coding_platform.dto.response.AdminContestResponse;
import com.swp391.coding_platform.dto.response.AdminContestProblemResponse;
import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.contest.ContestParticipantEntity;
import com.swp391.coding_platform.entity.contest.ContestProblemEntity;
import com.swp391.coding_platform.entity.contest.ContestProblemAttemptEntity;
import com.swp391.coding_platform.entity.enums.ContestStatus;
import com.swp391.coding_platform.entity.enums.ScoringRule;
import com.swp391.coding_platform.entity.enums.ProblemScope;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.mapper.ContestMapper;
import com.swp391.coding_platform.repository.contest.ContestParticipantRepository;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.contest.ContestProblemRepository;
import com.swp391.coding_platform.repository.contest.ContestProblemAttemptRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import com.swp391.coding_platform.repository.problem.ProblemRepository;
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

import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;
import com.swp391.coding_platform.dto.response.ContestSubmissionResponse;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionEntity;

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
    ProblemRepository problemRepository;
    PasswordEncoder passwordEncoder;

    private String calculateStatus(ContestEntity contest, Instant now) {
        if (contest.getStatus() == ContestStatus.DELETED) {
            return "DELETED";
        }
        if (contest.getStatus() == ContestStatus.DRAFT) {
            return "DRAFT";
        }
        if (now.isBefore(contest.getStartTime())) {
            return "UPCOMING";
        } else if (now.isAfter(contest.getEndTime())) {
            return "ENDED";
        } else {
            return "ONGOING";
        }
    }

    @Transactional(readOnly = true)
    public PageResponse<ContestResponse> getContests(ContestSearchRequest request, String username) {
        String statusFilter = request.getStatus();
        String accessFilter = request.getAccess();

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

        Instant now = Instant.now();
        Page<Object[]> contestPage = contestRepository.searchContestsWithStats(
                request.getSearch(),
                statusFilter != null ? statusFilter : "All",
                now,
                accessFilter != null ? accessFilter : "All",
                pageable
        );

        Page<ContestResponse> responsePage = contestPage.map(array -> {
            ContestEntity entity = (ContestEntity) array[0];
            Long partCount = (Long) array[1];
            Long probCount = (Long) array[2];

            ContestResponse response = contestMapper.toContestResponse(entity);
            response.setStatus(calculateStatus(entity, now));
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
        Instant now = Instant.now();
        Page<ContestEntity> upcomingPage = contestRepository.findUpcomingContests(now, limitOne);
        
        if (upcomingPage.isEmpty()) {
            return null;
        }

        ContestEntity bannerEntity = upcomingPage.getContent().get(0);

        long partCount = contestRepository.countParticipants(bannerEntity.getId());
        long probCount = contestRepository.countProblems(bannerEntity.getId());
        boolean isReg = false;
        if (username != null) {
            isReg = contestRepository.isUserRegistered(bannerEntity.getId(), username);
        }

        ContestResponse response = contestMapper.toContestResponse(bannerEntity);
        response.setStatus(calculateStatus(bannerEntity, now));
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
        response.setStatus(calculateStatus(entity, Instant.now()));
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

        if (calculateStatus(contest, java.time.Instant.now()).equals("ENDED")) {
            throw new AppException(ErrorCode.CONTEST_ALREADY_ENDED);
        }

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

    @Transactional(readOnly = true)
    public List<AdminContestResponse> getAdminContests() {
        List<Object[]> results = contestRepository.getAdminContestsWithStats();
        Instant now = Instant.now();
        return results.stream().map(array -> {
            ContestEntity entity = (ContestEntity) array[0];
            Long partCount = (Long) array[1];
            Long probCount = (Long) array[2];
            Long subCount = (Long) array[3];
            Double avgScore = (Double) array[4];

            AdminContestResponse response = contestMapper.toAdminContestResponse(entity);
            response.setStatus(calculateStatus(entity, now));
            response.setParticipantCount(partCount != null ? partCount.intValue() : 0);
            response.setProblemCount(probCount != null ? probCount.intValue() : 0);
            response.setSubmissionCount(subCount != null ? subCount.intValue() : 0);
            response.setAverageScore(avgScore != null ? avgScore : 0.0);
            return response;
        }).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public AdminContestResponse getAdminContestById(Integer id) {
        ContestEntity entity = contestRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        long partCount = contestRepository.countParticipants(id);
        long probCount = contestRepository.countProblems(id);
        long subCount = problemSubmissionRepository.countByContestId(id);
        Double avgScore = problemSubmissionRepository.getAverageScoreByContestId(id);

        AdminContestResponse response = contestMapper.toAdminContestResponse(entity);
        response.setStatus(calculateStatus(entity, Instant.now()));
        response.setParticipantCount((int) partCount);
        response.setProblemCount((int) probCount);
        response.setSubmissionCount((int) subCount);
        response.setAverageScore(avgScore != null ? avgScore : 0.0);
        return response;
    }

    @Transactional
    public AdminContestResponse createAdminContest(AdminContestRequest request, Integer adminUserId) {
        var creator = userRepository.findById(adminUserId)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));

        String passwordHash = null;
        if (request.getPassword() != null && !request.getPassword().trim().isEmpty()) {
            passwordHash = passwordEncoder.encode(request.getPassword().trim());
        }

        long durationMinutes = java.time.Duration.between(request.getStartTime(), request.getEndTime()).toMinutes();

        ContestEntity contest = ContestEntity.builder()
                .title(request.getTitle())
                .description(request.getDescription())
                .scoringRule(ScoringRule.valueOf(request.getScoringRule()))
                .passwordHash(passwordHash)
                .startTime(request.getStartTime())
                .endTime(request.getEndTime())
                .durations((int) durationMinutes)
                .status(ContestStatus.DRAFT)
                .createdBy(creator)
                .build();

        ContestEntity saved = contestRepository.save(contest);
        return getAdminContestById(saved.getId());
    }

    @Transactional
    public AdminContestResponse updateAdminContest(Integer id, AdminContestRequest request) {
        ContestEntity contest = contestRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        Instant now = Instant.now();
        String currentStatus = calculateStatus(contest, now);

        if (currentStatus.equals("DELETED")) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        if (currentStatus.equals("ONGOING") || currentStatus.equals("ENDED")) {
            boolean timesChanged = !contest.getStartTime().equals(request.getStartTime()) ||
                                   !contest.getEndTime().equals(request.getEndTime());
            boolean scoringRuleChanged = contest.getScoringRule() != ScoringRule.valueOf(request.getScoringRule());
            if (timesChanged || scoringRuleChanged) {
                throw new AppException(ErrorCode.INVALID_REQUEST);
            }
            contest.setTitle(request.getTitle());
            contest.setDescription(request.getDescription());
        } else {
            contest.setTitle(request.getTitle());
            contest.setDescription(request.getDescription());
            contest.setScoringRule(ScoringRule.valueOf(request.getScoringRule()));
            contest.setStartTime(request.getStartTime());
            contest.setEndTime(request.getEndTime());

            long durationMinutes = java.time.Duration.between(request.getStartTime(), request.getEndTime()).toMinutes();
            contest.setDurations((int) durationMinutes);

            if (request.getPassword() != null) {
                if (request.getPassword().trim().isEmpty()) {
                    contest.setPasswordHash(null);
                } else {
                    contest.setPasswordHash(passwordEncoder.encode(request.getPassword().trim()));
                }
            }
        }

        contestRepository.save(contest);
        return getAdminContestById(id);
    }

    @Transactional
    public void deleteAdminContest(Integer id) {
        ContestEntity contest = contestRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        Instant now = Instant.now();
        String currentStatus = calculateStatus(contest, now);
        if (!currentStatus.equals("DRAFT") && !currentStatus.equals("UPCOMING")) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        contest.setStatus(ContestStatus.DELETED);
        contestRepository.save(contest);
    }

    @Transactional
    public AdminContestResponse publishAdminContest(Integer id) {
        ContestEntity contest = contestRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        if (contest.getStatus() != ContestStatus.DRAFT) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        contest.setStatus(ContestStatus.PUBLISHED);
        contestRepository.save(contest);
        return getAdminContestById(id);
    }

    @Transactional
    public AdminContestResponse restoreAdminContest(Integer id) {
        ContestEntity contest = contestRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        if (contest.getStatus() != ContestStatus.DELETED) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        contest.setStatus(ContestStatus.DRAFT);
        contestRepository.save(contest);
        return getAdminContestById(id);
    }

    @Transactional
    public void hardDeleteAdminContest(Integer id) {
        ContestEntity contest = contestRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        if (contest.getStatus() != ContestStatus.DELETED) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        long subCount = problemSubmissionRepository.countByContestId(id);
        if (subCount > 0) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        contestParticipantRepository.deleteByContestId(id);

        List<ContestProblemEntity> cpList = contestProblemRepository.findByContestIdWithProblem(id);
        for (ContestProblemEntity cp : cpList) {
            ProblemEntity problem = cp.getProblem();
            problem.setProblemScope(ProblemScope.PRACTICE);
            problem.setIsPublic(false);
            problemRepository.save(problem);
        }
        contestProblemRepository.deleteByContestId(id);

        contestRepository.delete(contest);
    }

    @Transactional(readOnly = true)
    public List<AdminContestProblemResponse> getAdminContestProblems(Integer contestId) {
        List<ContestProblemEntity> contestProblems = contestProblemRepository.findByContestIdWithProblem(contestId);
        return contestProblems.stream()
                .map(contestMapper::toAdminContestProblemResponse)
                .collect(Collectors.toList());
    }

    @Transactional
    public void addProblemToContest(Integer contestId, AdminContestProblemRequest request) {
        var contest = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        Instant now = Instant.now();
        String currentStatus = calculateStatus(contest, now);
        if (currentStatus.equals("ONGOING") || currentStatus.equals("ENDED") || currentStatus.equals("DELETED")) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        var problem = problemRepository.findById(request.getProblemId())
                .orElseThrow(() -> new AppException(ErrorCode.OJ_PROBLEM_NOT_FOUND));

        boolean exists = contestProblemRepository.existsByContestIdAndProblemId(contestId, request.getProblemId());
        if (exists) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        problem.setProblemScope(ProblemScope.CONTEST);
        problemRepository.save(problem);

        ContestProblemEntity cp = ContestProblemEntity.builder()
                .contest(contest)
                .problem(problem)
                .orderIndex(request.getOrderIndex())
                .build();

        contestProblemRepository.save(cp);
    }

    @Transactional
    public void removeProblemFromContest(Integer contestId, Integer problemId) {
        var contest = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        Instant now = Instant.now();
        String currentStatus = calculateStatus(contest, now);
        if (currentStatus.equals("ONGOING") || currentStatus.equals("ENDED") || currentStatus.equals("DELETED")) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        ContestProblemEntity cp = contestProblemRepository.findByContestIdAndProblemId(contestId, problemId)
                .orElseThrow(() -> new AppException(ErrorCode.RESOURCE_NOT_FOUND));

        contestProblemRepository.delete(cp);

        ProblemEntity problem = cp.getProblem();
        problem.setProblemScope(ProblemScope.PRACTICE);
        problem.setIsPublic(false);
        problemRepository.save(problem);
    }

    @Transactional(readOnly = true)
    public List<ContestSubmissionResponse> getContestSubmissions(Integer contestId, String username, boolean isAdmin) {
        if (username == null) {
            throw new AppException(ErrorCode.UNAUTHENTICATED);
        }

        ContestEntity contest = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        List<ProblemSubmissionEntity> submissions;
        if (isAdmin) {
            submissions = problemSubmissionRepository.findByContestId(contestId);
        } else {
            boolean isRegistered = contestRepository.isUserRegistered(contestId, username);
            if (!isRegistered) {
                throw new AppException(ErrorCode.CONTEST_NOT_JOINED);
            }
            submissions = problemSubmissionRepository.findByContestId(contestId);
        }

        List<ContestProblemEntity> cpList = contestProblemRepository.findByContestIdWithProblem(contestId);
        Map<Integer, String> problemLabelMap = new HashMap<>();
        for (ContestProblemEntity cp : cpList) {
            char label = (char) ('A' + cp.getOrderIndex());
            problemLabelMap.put(cp.getProblem().getId(), String.valueOf(label));
        }

        DateTimeFormatter formatter = DateTimeFormatter
                .ofPattern("yyyy-MM-dd HH:mm:ss")
                .withZone(java.time.ZoneId.systemDefault());

        return submissions.stream().map(s -> {
            String label = problemLabelMap.getOrDefault(s.getProblem().getId(), "?");
            
            String subStatus = s.getVerdict() == com.swp391.coding_platform.entity.enums.OjVerdict.ACCEPTED ? "Accepted"
                    : s.getVerdict().name().replace("_", " ");
            subStatus = Arrays.stream(subStatus.split(" "))
                    .map(word -> word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase())
                    .collect(Collectors.joining(" "));

            String langStr = "Java";
            if (s.getLanguageId() == 2)
                langStr = "Python 3";
            else if (s.getLanguageId() == 3)
                langStr = "C++";
            else if (s.getLanguageId() == 4)
                langStr = "JavaScript";

            String runtimeStr = s.getExecutionTime() != null ? String.format(Locale.US, "%.1f ms", (double) s.getExecutionTime())
                    : "N/A";
            String memoryStr = s.getMemoryUsed() != null
                    ? String.format(Locale.US, "%.1f MB", s.getMemoryUsed() / 1024.0)
                    : "N/A";
            String timeStr = formatter.format(s.getSubmittedAt());
            String statusClass = s.getVerdict() == com.swp391.coding_platform.entity.enums.OjVerdict.ACCEPTED ? "text-brand-green" : "text-red-600";

            return ContestSubmissionResponse.builder()
                    .id(s.getId())
                    .submittedAt(timeStr)
                    .username(s.getUser().getUsername())
                    .problemLabel(label)
                    .problemId(s.getProblem().getId())
                    .problemTitle(s.getProblem().getTitle())
                    .status(subStatus)
                    .lang(langStr)
                    .runtime(runtimeStr)
                    .memory(memoryStr)
                    .statusClass(statusClass)
                    .build();
        }).collect(Collectors.toList());
    }
}
