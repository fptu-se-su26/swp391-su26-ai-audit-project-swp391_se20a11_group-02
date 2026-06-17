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
import com.swp391.coding_platform.dto.response.ContestProblemDetailResponse;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionEntity;
import com.swp391.coding_platform.repository.problem.ProblemTagMappingRepository;
import com.swp391.coding_platform.entity.problem.ProblemTagMappingEntity;
import com.swp391.coding_platform.entity.enums.OjVerdict;

@Service
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
    ProblemTagMappingRepository problemTagMappingRepository;
    PasswordEncoder passwordEncoder;

    public ContestService(
            ContestRepository contestRepository,
            ContestMapper contestMapper,
            UserRepository userRepository,
            ProblemSubmissionRepository problemSubmissionRepository,
            ContestParticipantRepository contestParticipantRepository,
            ContestProblemRepository contestProblemRepository,
            ContestProblemAttemptRepository contestProblemAttemptRepository,
            ProblemRepository problemRepository,
            ProblemTagMappingRepository problemTagMappingRepository,
            PasswordEncoder passwordEncoder
    ) {
        this.contestRepository = contestRepository;
        this.contestMapper = contestMapper;
        this.userRepository = userRepository;
        this.problemSubmissionRepository = problemSubmissionRepository;
        this.contestParticipantRepository = contestParticipantRepository;
        this.contestProblemRepository = contestProblemRepository;
        this.contestProblemAttemptRepository = contestProblemAttemptRepository;
        this.problemRepository = problemRepository;
        this.problemTagMappingRepository = problemTagMappingRepository;
        this.passwordEncoder = passwordEncoder;
    }

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
    public PageResponse<ContestResponse> getContests(ContestSearchRequest request, Integer userId) {
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

            if (userId != null) {
                response.setIsUserRegistered(contestRepository.isUserRegistered(entity.getId(), userId));
            } else {
                response.setIsUserRegistered(false);
            }
            return response;
        });

        return PageResponse.from(responsePage);
    }

    @Transactional(readOnly = true)
    public ContestResponse getBannerContest(Integer userId) {
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
        if (userId != null) {
            isReg = contestRepository.isUserRegistered(bannerEntity.getId(), userId);
        }

        ContestResponse response = contestMapper.toContestResponse(bannerEntity);
        response.setStatus(calculateStatus(bannerEntity, now));
        response.setParticipantCount((int) partCount);
        response.setProblemCount((int) probCount);
        response.setIsUserRegistered(isReg);

        return response;
    }

    @Transactional(readOnly = true)
    public ContestUserStatsResponse getUserStats(Integer userId) {
        if (userId == null) {
            return null;
        }
        var userOpt = userRepository.findById(userId);
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
    public ContestResponse getContestById(Integer contestId, Integer userId) {
        ContestEntity entity = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        long partCount = contestRepository.countParticipants(contestId);
        long probCount = contestRepository.countProblems(contestId);
        boolean isReg = false;
        if (userId != null) {
            isReg = contestRepository.isUserRegistered(contestId, userId);
        }

        ContestResponse response = contestMapper.toContestResponse(entity);
        response.setStatus(calculateStatus(entity, Instant.now()));
        response.setParticipantCount((int) partCount);
        response.setProblemCount((int) probCount);
        response.setIsUserRegistered(isReg);

        return response;
    }

    @Transactional
    public void registerForContest(Integer contestId, Integer userId, ContestRegisterRequest request) {
        if (userId == null) {
            throw new AppException(ErrorCode.UNAUTHENTICATED);
        }
        var user = userRepository.findById(userId)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));
        var contest = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        if (calculateStatus(contest, java.time.Instant.now()).equals("ENDED")) {
            throw new AppException(ErrorCode.CONTEST_ALREADY_ENDED);
        }

        boolean alreadyRegistered = contestRepository.isUserRegistered(contestId, userId);
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
    public List<ContestProblemResponse> getContestProblems(Integer contestId, Integer userId) {
        if (userId == null) {
            throw new AppException(ErrorCode.UNAUTHENTICATED);
        }
        var contest = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        boolean isRegistered = contestRepository.isUserRegistered(contestId, userId);
        if (!isRegistered) {
            throw new AppException(ErrorCode.CONTEST_NOT_JOINED);
        }
        // Block access if contest has not started yet (UPCOMING)
        // ENDED is allowed: users can review problems after contest ends
        String currentStatus = calculateStatus(contest, java.time.Instant.now());
        if (currentStatus.equals("UPCOMING")) {
            throw new AppException(ErrorCode.CONTEST_NOT_STARTED);
        }

        List<ContestProblemEntity> contestProblems = contestProblemRepository.findByContestIdWithProblem(contestId);
        List<ContestProblemAttemptEntity> attempts = contestProblemAttemptRepository.findByContestIdAndUserId(contestId, userId);

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
    }

    @Transactional(readOnly = true)
    public List<ContestSubmissionResponse> getContestSubmissions(Integer contestId, Integer userId, boolean isAdmin) {
        if (userId == null) {
            throw new AppException(ErrorCode.UNAUTHENTICATED);
        }

        ContestEntity contest = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        List<ProblemSubmissionEntity> submissions;
        if (isAdmin) {
            submissions = problemSubmissionRepository.findByContestId(contestId);
        } else {
            boolean isRegistered = contestRepository.isUserRegistered(contestId, userId);
            if (!isRegistered) {
                throw new AppException(ErrorCode.CONTEST_NOT_JOINED);
            }
            // Block access if contest has not started yet
            String currentStatus = calculateStatus(contest, java.time.Instant.now());
            if (currentStatus.equals("UPCOMING")) {
                throw new AppException(ErrorCode.CONTEST_NOT_STARTED);
            }
            submissions = problemSubmissionRepository.findByContestIdAndUserId(contestId, userId);
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

    @Transactional(readOnly = true)
    public ContestProblemDetailResponse getContestProblemDetail(Integer contestId, Integer problemId, Integer userId) {
        if (userId == null) {
            throw new AppException(ErrorCode.UNAUTHENTICATED);
        }

        ContestEntity contest = contestRepository.findById(contestId)
                .orElseThrow(() -> new AppException(ErrorCode.CONTEST_NOT_FOUND));

        // Verify user registration
        boolean isRegistered = contestRepository.isUserRegistered(contestId, userId);
        if (!isRegistered) {
            throw new AppException(ErrorCode.CONTEST_NOT_JOINED);
        }

        // Verify contest has started (throw 403 / CONTEST_NOT_STARTED if upcoming)
        Instant now = Instant.now();
        String currentStatus = calculateStatus(contest, now);
        if (currentStatus.equals("UPCOMING")) {
            throw new AppException(ErrorCode.CONTEST_NOT_STARTED);
        }

        // Check if the problem belongs to the contest
        ContestProblemEntity cp = contestProblemRepository.findByContestIdAndProblemId(contestId, problemId)
                .orElseThrow(() -> new AppException(ErrorCode.RESOURCE_NOT_FOUND));

        ProblemEntity problem = cp.getProblem();

        List<ProblemTagMappingEntity> mappings = problemTagMappingRepository.findByProblemId(problemId);
        List<String> tags = mappings.stream().map(m -> m.getTag().getName()).toList();

        Map<String, String> templates = generateTemplates(problem.getTitle());

        String attemptStatus = "unsolved";
        String sourceCode = null;

        // Fetch user's attempts in this contest for this problem
        Optional<ContestProblemAttemptEntity> attemptOpt = contestProblemAttemptRepository.findByContestIdAndUserIdAndProblemId(contestId, userId, problemId);
        if (attemptOpt.isPresent()) {
            ContestProblemAttemptEntity attempt = attemptOpt.get();
            if (attempt.getIsSolved()) {
                attemptStatus = "solved";
            } else if (attempt.getFailedAttemptsCount() > 0) {
                attemptStatus = "attempted";
            }
        }

        // Fetch user's submissions in this contest for this problem to get the last source code
        List<ProblemSubmissionEntity> subs = problemSubmissionRepository.findByContestIdAndUserId(contestId, userId);
        if (subs != null && !subs.isEmpty()) {
            List<ProblemSubmissionEntity> problemSubs = subs.stream()
                    .filter(s -> s.getProblem().getId().equals(problemId))
                    .sorted(Comparator.comparing(ProblemSubmissionEntity::getSubmittedAt).reversed())
                    .toList();
            if (!problemSubs.isEmpty()) {
                Optional<ProblemSubmissionEntity> acceptedOpt = problemSubs.stream().filter(s -> s.getVerdict() == OjVerdict.ACCEPTED).findFirst();
                if (acceptedOpt.isPresent()) {
                    sourceCode = acceptedOpt.get().getSourceCode();
                } else {
                    sourceCode = problemSubs.get(0).getSourceCode();
                }
            }
        }

        String difficultyStr = "Medium";
        if (problem.getDifficulty() != null) {
            String name = problem.getDifficulty().name();
            difficultyStr = name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
        }

        String acceptance = "0.0%";
        if (problem.getTotalSubmission() != null && problem.getTotalSubmission() > 0) {
            double rate = (problem.getTotalAccepted() * 100.0) / problem.getTotalSubmission();
            acceptance = String.format(Locale.US, "%.1f%%", rate);
        }
        Integer totalSolved = problem.getTotalAccepted() != null ? problem.getTotalAccepted() : 0;

        char labelChar = (char) ('A' + cp.getOrderIndex());

        return ContestProblemDetailResponse.builder()
                .id(problem.getId())
                .title(problem.getTitle())
                .difficulty(difficultyStr)
                .description(problem.getDescription())
                .inputDescription(problem.getInputDescription())
                .outputDescription(problem.getOutputDescription())
                .constraints(problem.getConstraints())
                .exampleInput(problem.getExampleInput())
                .exampleOutput(problem.getExampleOutput())
                .tags(tags)
                .templates(templates)
                .status(attemptStatus)
                .acceptance(acceptance)
                .totalSolved(totalSolved)
                .sourceCode(sourceCode)
                .problemLabel(String.valueOf(labelChar))
                .timeLimitMs(problem.getTimeLimitMs())
                .memoryLimitKb(problem.getMemoryLimitKb())
                .build();
    }

    private Map<String, String> generateTemplates(String title) {
        Map<String, String> templates = new HashMap<>();
        String cleanTitle = title != null ? title.trim().toLowerCase() : "";

        if (cleanTitle.contains("two sum")) {
            templates.put("Java", "class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        // Write your code here\n        return new int[0];\n    }\n}");
            templates.put("Python 3", "class Solution:\n    def twoSum(self, nums: List[int], target: int) -> List[int]:\n        # Write your code here\n        return []");
            templates.put("C++", "class Solution {\npublic:\n    vector<int> twoSum(vector<int>& nums, int target) {\n        // Write your code here\n        return {};\n    }\n};");
            templates.put("JavaScript", "var twoSum = function(nums, target) {\n    // Write your code here\n    return [];\n};");
        } else if (cleanTitle.contains("add two numbers")) {
            templates.put("Java", "class Solution {\n    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {\n        // Write your code here\n        return null;\n    }\n}");
            templates.put("Python 3", "class Solution:\n    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:\n        # Write your code here\n        return None");
            templates.put("C++", "class Solution {\npublic:\n    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {\n        // Write your code here\n        return nullptr;\n    }\n};");
            templates.put("JavaScript", "var addTwoNumbers = function(l1, l2) {\n    // Write your code here\n    return null;\n};");
        } else if (cleanTitle.contains("longest substring")) {
            templates.put("Java", "class Solution {\n    public int lengthOfLongestSubstring(String s) {\n        // Write your code here\n        return 0;\n    }\n}");
            templates.put("Python 3", "class Solution:\n    def lengthOfLongestSubstring(self, s: str) -> int:\n        # Write your code here\n        return 0");
            templates.put("C++", "class Solution {\npublic:\n    int lengthOfLongestSubstring(string s) {\n        // Write your code here\n        return 0;\n    }\n};");
            templates.put("JavaScript", "var lengthOfLongestSubstring = function(s) {\n    // Write your code here\n    return 0;\n};");
        } else {
            templates.put("Java", "class Solution {\n    public void solve() {\n        // Write your code here\n    }\n}");
            templates.put("Python 3", "class Solution:\n    def solve(self):\n        # Write your code here\n        pass");
            templates.put("C++", "class Solution {\npublic:\n    void solve() {\n        // Write your code here\n    }\n};");
            templates.put("JavaScript", "var solve = function() {\n    // Write your code here\n};");
        }
        return templates;
    }
}
