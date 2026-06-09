package com.swp391.coding_platform.service.judge0;

import com.swp391.coding_platform.dto.judge0.Judge0BatchRequest;
import com.swp391.coding_platform.dto.judge0.Judge0CallbackPayload;
import com.swp391.coding_platform.dto.judge0.Judge0SubmissionItem;
import com.swp391.coding_platform.dto.judge0.Judge0TokenResponse;
import com.swp391.coding_platform.dto.request.OjSubmissionRequest;
import com.swp391.coding_platform.dto.response.OjSubmissionInitialResponse;
import com.swp391.coding_platform.dto.response.OjWebSocketMessage;
import com.swp391.coding_platform.entity.enums.OjVerdict;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionDetailEntity;
import com.swp391.coding_platform.entity.problem.ProblemSubmissionEntity;
import com.swp391.coding_platform.entity.problem.ProblemTestcaseEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.contest.ContestProblemRepository;
import com.swp391.coding_platform.repository.contest.ContestRepository;
import com.swp391.coding_platform.repository.course.LessonProblemRepository;
import com.swp391.coding_platform.repository.course.LessonRepository;
import com.swp391.coding_platform.repository.problem.ProblemRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionDetailRepository;
import com.swp391.coding_platform.repository.problem.ProblemSubmissionRepository;
import com.swp391.coding_platform.repository.problem.ProblemTestcaseRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.support.TransactionSynchronization;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class Judge0Service {
    ProblemSubmissionRepository problemSubmissionRepository;
    ProblemSubmissionDetailRepository problemSubmissionDetailRepository;
    ProblemTestcaseRepository problemTestcaseRepository;
    UserRepository userRepository;
    ProblemRepository problemRepository;
    LessonRepository lessonRepository;
    ContestRepository contestRepository;
    ContestProblemRepository contestProblemRepository;
    LessonProblemRepository lessonProblemRepository;

    Judge0ClientService judge0ClientService;
    SimpMessagingTemplate simpMessagingTemplate;

    StringRedisTemplate stringRedisTemplate;

    @Autowired
    @Lazy
    @NonFinal
    Judge0Service self;

    @NonFinal
    @Value("${app.webhook-base-url}")
    String webhookBaseUrl;

    @Transactional
    public OjSubmissionInitialResponse submitCode(OjSubmissionRequest request, Integer userId) {
        // Check user status
        UserEntity user = userRepository.findById(userId)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));
        user.validateStatus();

        ProblemEntity ojProblem = problemRepository.findByIdAndIsPublicTrue(request.getProblemId())
                .orElseThrow(() -> new AppException(ErrorCode.OJ_PROBLEM_NOT_FOUND));
        
        // Xác thực bài toán có thuộc cuộc thi hoặc bài học không
        if (request.getContestId() != null) {
            boolean belongsToContest = contestProblemRepository.existsByContestIdAndProblemId(request.getContestId(), request.getProblemId());
            if (!belongsToContest) {
                throw new AppException(ErrorCode.OJ_PROBLEM_NOT_FOUND);
            }
        }
        
        if (request.getLessonId() != null) {
            boolean belongsToLesson = lessonProblemRepository.existsByLessonIdAndProblemId(request.getLessonId(), request.getProblemId());
            if (!belongsToLesson) {
                throw new AppException(ErrorCode.OJ_PROBLEM_NOT_FOUND);
            }
        }
        
        // Kiểm tra bài toán và lấy danh sách Testcases từ Database
        List<ProblemTestcaseEntity> problemTestcaseEntityList = problemTestcaseRepository
                .findByProblemIdOrderByOrderIndex(request.getProblemId());
        if (problemTestcaseEntityList.isEmpty()) {
            throw new AppException(ErrorCode.TESTCASE_NOT_FOUND);
        }

        // Tạo bản ghi "Mẹ" (OnlineJudgeSubmissionEntity) với trạng thái mặc định là
        // PENDING
        ProblemSubmissionEntity problemSubmissionEntity = ProblemSubmissionEntity.builder()
                .user(userRepository.getReferenceById(userId))
                .problem(problemRepository.getReferenceById(request.getProblemId()))
                .languageId(request.getLanguageId())
                .sourceCode(request.getSourceCode())
                .verdict(OjVerdict.PENDING)
                .lesson(request.getLessonId() != null ? lessonRepository.getReferenceById(request.getLessonId()) : null)
                .contest(request.getContestId() != null ? contestRepository.getReferenceById(request.getContestId())
                        : null)
                .build();

        // Đóng gói dữ liệu (Code + Testcases) để gửi sang Judge0
        List<Judge0SubmissionItem> judge0SubmissionItemList = new ArrayList<>();
        String callbackUrl = webhookBaseUrl + "/online-judge/submissions";

        // Tính limit dựa trên ngôn ngữ (Gợi ý dùng hệ số nhân)
        double timeLimitSeconds = calculateTimeLimitForLanguage(problemSubmissionEntity.getProblem().getTimeLimitMs(), request.getLanguageId());

        for (ProblemTestcaseEntity testcase : problemTestcaseEntityList) {
            // Chuẩn hóa lại chuỗi \n bị gõ nhầm thành ký tự literal trong DB
            String cleanStdin = testcase.getInputData() != null ? testcase.getInputData().replace("\\n", "\n") : "";
            String cleanExpected = testcase.getExpectedOutput() != null ? testcase.getExpectedOutput().replace("\\n", "\n") : "";

            Judge0SubmissionItem item = Judge0SubmissionItem.builder()
                    .languageId(request.getLanguageId())
                    .sourceCode(request.getSourceCode())
                    .stdin(cleanStdin)
                    .expectedOutput(cleanExpected)
                    .callbackUrl(callbackUrl)
                    .cpuTimeLimit(timeLimitSeconds)
                    .memoryLimit(problemSubmissionEntity.getProblem().getMemoryLimitKb())
                    .build();
            judge0SubmissionItemList.add(item);
        }

        Judge0BatchRequest judge0BatchRequest = Judge0BatchRequest.builder()
                .submissions(judge0SubmissionItemList)
                .build();

        // Gọi API Judge0 (Giai đoạn giao tiếp mạng)
        List<Judge0TokenResponse> tokenList = judge0ClientService.sendBatchSubmission(judge0BatchRequest);

        // Đảm bảo Judge0 trả về số lượng token khớp với số lượng testcase
        if (tokenList.isEmpty() || tokenList.size() != problemTestcaseEntityList.size()) {
            throw new AppException(ErrorCode.JUDGE0_SUBMISSION_FAILED);
        }

        // Lưu submission "mẹ" trước để có ID cho các chi tiết
        problemSubmissionRepository.save(problemSubmissionEntity);

        // Tăng tổng số lượt nộp bài (totalSubmission) theo cơ chế Atomic
        problemRepository.incrementTotalSubmission(request.getProblemId());

        // Tạo bản ghi "Con" (OnlineJudgeSubmissionDetailEntity) cho từng testcase
        List<ProblemSubmissionDetailEntity> submissionDetails = new ArrayList<>();
        for (int i = 0; i < tokenList.size(); i++) {
            ProblemSubmissionDetailEntity detailEntity = ProblemSubmissionDetailEntity.builder()
                    .submission(problemSubmissionEntity)
                    .testcase(problemTestcaseEntityList.get(i))
                    .token(tokenList.get(i).getToken())
                    .verdict(OjVerdict.PENDING)
                    .build();
            submissionDetails.add(detailEntity);
        }
        problemSubmissionDetailRepository.saveAll(submissionDetails);

        // Trả về Response cho Frontend ngay lập tức
        return OjSubmissionInitialResponse.builder()
                .submissionId(problemSubmissionEntity.getId())
                .status(OjVerdict.PENDING.toString())
                .message("Submission received and is being processed.")
                .build();
    }

    public void processJudge0Callback(Judge0CallbackPayload judge0CallbackPayload) {

        // Bỏ qua các webhook có trạng thái trung gian (In Queue, Processing)
        if (judge0CallbackPayload.getStatus() != null && judge0CallbackPayload.getStatus().getId() <= 2) {
            log.info("Bỏ qua webhook trạng thái trung gian: {}", judge0CallbackPayload.getStatus().getId());
            return;
        }

        ProblemSubmissionDetailEntity submissionDetail = null;
        int maxRetries = 10;
        for (int i = 0; i < maxRetries; i++) {
            submissionDetail = problemSubmissionDetailRepository
                    .findByTokenWithSubmissionAndProblem(judge0CallbackPayload.getToken())
                    .orElse(null);
            if (submissionDetail != null) {
                break;
            }
            try {
                log.warn("Token {} chưa có trong DB. Đang thử lại lần {}/{}...", judge0CallbackPayload.getToken(), i + 1, maxRetries);
                Thread.sleep(500);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                break;
            }
        }

        if (submissionDetail == null) {
            log.error("Token {} không tồn tại sau {} lần thử. Bỏ qua webhook.", judge0CallbackPayload.getToken(), maxRetries);
            throw new AppException(ErrorCode.JUDGE0_SUBMISSION_FAILED);
        }

        // 1. Cập nhật chi tiết testcase (chạy trong transaction riêng biệt và commit luôn)
        self.updateSubmissionDetail(judge0CallbackPayload);

        // 2. Chạy logic kết quả tổng hợp sau khi đã commit chi tiết testcase thành công
        ProblemSubmissionEntity submissionEntity = submissionDetail.getSubmission();
        Integer submissionId = submissionEntity.getId();
        boolean isContestMode = submissionEntity.getContest() != null;
        Integer userId = submissionEntity.getUser().getId();
        Integer testcaseId = submissionDetail.getTestcase().getId();

        // Lấy thông tin cần thiết từ submissionDetail
        OjVerdict testcaseVerdict = mapJudge0StatusToOjVerdict(judge0CallbackPayload.getStatus().getId());
        Integer detailExecutionTime = parseExecutionTime(judge0CallbackPayload.getTime());
        Integer detailMemoryUsed = judge0CallbackPayload.getMemory();
        String inputData = !isContestMode ? submissionDetail.getTestcase().getInputData() : null;
        String expectedOutput = !isContestMode ? submissionDetail.getTestcase().getExpectedOutput() : null;
        
        // Cần giải mã Base64 cho compileOutput và actualOutput
        String compileOutput = !isContestMode ? decodeBase64Safe(judge0CallbackPayload.getCompileOutput()) : null;
        String actualOut = decodeBase64Safe(judge0CallbackPayload.getStdout());
        String stderrOut = decodeBase64Safe(judge0CallbackPayload.getStderr());
        if ((actualOut == null || actualOut.trim().isEmpty()) && stderrOut != null && !stderrOut.trim().isEmpty()) {
            actualOut = stderrOut;
        }
        String actualOutput = !isContestMode ? actualOut : null;

        // Tiến hành đếm tiến trình trên Redis
        String redisKey = "oj_progress:" + submissionId;
        String failedKey = "oj_failed:" + submissionId;
        
        boolean isEarlyFinish = false;
        
        if (isContestMode && testcaseVerdict != OjVerdict.ACCEPTED) {
            Boolean isFirstFail = stringRedisTemplate.opsForValue().setIfAbsent(failedKey, "1", Duration.ofHours(1));
            if (Boolean.TRUE.equals(isFirstFail)) {
                isEarlyFinish = true;
            }
        }

        String token = judge0CallbackPayload.getToken();
        Long added = stringRedisTemplate.opsForSet().add(redisKey, token);
        if (added != null && added == 1L) {
            stringRedisTemplate.expire(redisKey, Duration.ofHours(1));
        }

        // Đếm tổng số testcase của bài toán
        long totalTestcases = problemSubmissionDetailRepository.countBySubmissionId(submissionId);
        Long processedCount = stringRedisTemplate.opsForSet().size(redisKey);
        int processedCountInt = processedCount != null ? processedCount.intValue() : 0;

        boolean isNormalFinish = processedCount != null && processedCount == totalTestcases 
                                 && Boolean.FALSE.equals(stringRedisTemplate.hasKey(failedKey));

        OjVerdict overallVerdict = OjVerdict.PENDING;
        Integer maxTime = detailExecutionTime;
        Integer maxMemory = detailMemoryUsed;

        if (isEarlyFinish || isNormalFinish) {
            // Gọi finalizeSubmission (sẽ mở transaction mới và commit kết quả tổng hợp)
            ProblemSubmissionEntity finalizedSubmission = self.finalizeSubmission(submissionId, testcaseVerdict, isEarlyFinish);
            overallVerdict = finalizedSubmission.getVerdict();
            maxTime = finalizedSubmission.getExecutionTime();
            maxMemory = finalizedSubmission.getMemoryUsed();

            if (processedCount != null && processedCount == totalTestcases) {
                stringRedisTemplate.delete(redisKey);
                stringRedisTemplate.delete(failedKey);
            }
        }

        // Bắn WebSocket thông báo tiến trình cho Frontend
        OjWebSocketMessage wsMessage = OjWebSocketMessage.builder()
                .submissionId(submissionId)
                .testcaseId(testcaseId)
                .testcaseVerdict(testcaseVerdict)
                .overallVerdict(overallVerdict)
                .executionTimeMs((isEarlyFinish || isNormalFinish) ? maxTime : detailExecutionTime)
                .memoryUsedKb((isEarlyFinish || isNormalFinish) ? maxMemory : detailMemoryUsed)
                .totalTestcases((int) totalTestcases)
                .processedTestcases(processedCountInt)
                .build();

        if (!isContestMode) {
            wsMessage.setInput(inputData);
            wsMessage.setExpectedOutput(expectedOutput);
            wsMessage.setCompileOutput(compileOutput);
            wsMessage.setActualOutput(actualOutput);
            simpMessagingTemplate.convertAndSend("/topic/submissions/" + userId, wsMessage);
            log.info("PRACTICE MODE: Bắn WebSocket tiến trình {}/{} cho Submission {}",
                    wsMessage.getProcessedTestcases(), wsMessage.getTotalTestcases(), submissionId);
        } else if (isEarlyFinish || isNormalFinish) {
            wsMessage.setTestcaseId(null);
            wsMessage.setTestcaseVerdict(null);
            simpMessagingTemplate.convertAndSend("/topic/submissions/" + userId, wsMessage);
            log.info("CONTEST MODE: Đã chấm xong toàn bộ. Bắn WebSocket tổng kết (Verdict: {}) cho Submission {}",
                    overallVerdict, submissionId);
        } else {
            log.info("CONTEST MODE: Đang chấm testcase lẻ (Submission {}). Bỏ qua bắn WebSocket để bảo mật.", submissionId);
        }
    }

    @Transactional
    public void updateSubmissionDetail(Judge0CallbackPayload judge0CallbackPayload) {
        ProblemSubmissionDetailEntity submissionDetail = problemSubmissionDetailRepository
                .findByTokenWithSubmissionAndProblem(judge0CallbackPayload.getToken())
                .orElseThrow(() -> new AppException(ErrorCode.SUBMISSION_NOT_FOUND));

        // Chuyển đổi trạng thái từ Judge0 sang hệ thống của mình
        OjVerdict testcaseVerdict = mapJudge0StatusToOjVerdict(judge0CallbackPayload.getStatus().getId());

        // Cập nhật kết quả cho SubmissionDetail (Submission Con)
        submissionDetail.setVerdict(testcaseVerdict);
        submissionDetail.setExecutionTime(parseExecutionTime(judge0CallbackPayload.getTime()));
        submissionDetail.setMemoryUsed(judge0CallbackPayload.getMemory());
        
        // Judge0 Webhook luôn trả output dưới dạng Base64, nên ta cần giải mã nó
        submissionDetail.setStdout(decodeBase64Safe(judge0CallbackPayload.getStdout()));
        submissionDetail.setStderr(decodeBase64Safe(judge0CallbackPayload.getStderr()));
        submissionDetail.setCompileOutput(decodeBase64Safe(judge0CallbackPayload.getCompileOutput()));
        
        problemSubmissionDetailRepository.save(submissionDetail);
    }

    @Transactional
    public ProblemSubmissionEntity finalizeSubmission(Integer submissionId, OjVerdict testcaseVerdict, boolean isEarlyFinish) {
        ProblemSubmissionEntity submissionEntity = problemSubmissionRepository.findById(submissionId)
                .orElseThrow(() -> new AppException(ErrorCode.SUBMISSION_NOT_FOUND));

        OjVerdict overallVerdict;
        if (isEarlyFinish) {
            overallVerdict = testcaseVerdict;
        } else {
            overallVerdict = problemSubmissionDetailRepository
                    .findFirstBySubmissionIdAndVerdictNotOrderByTestcaseOrderIndexAsc(submissionId, OjVerdict.ACCEPTED)
                    .map(ProblemSubmissionDetailEntity::getVerdict)
                    .orElse(OjVerdict.ACCEPTED);
        }

        var maxStats = problemSubmissionDetailRepository.findMaxStatsBySubmissionId(submissionId)
                .orElseThrow(() -> new AppException(ErrorCode.SUBMISSION_NOT_FOUND));

        boolean isFirstSolve = false;
        if (overallVerdict == OjVerdict.ACCEPTED) {
            long pastAcceptedCount = problemSubmissionRepository.countByUserIdAndProblemIdAndVerdict(
                    submissionEntity.getUser().getId(),
                    submissionEntity.getProblem().getId(),
                    OjVerdict.ACCEPTED
            );
            if (pastAcceptedCount == 0) {
                isFirstSolve = true;
            }
        }

        submissionEntity.setVerdict(overallVerdict);
        submissionEntity.setExecutionTime(maxStats.getMaxTime());
        submissionEntity.setMemoryUsed(maxStats.getMaxMemory());
        problemSubmissionRepository.save(submissionEntity);

        if (overallVerdict == OjVerdict.ACCEPTED) {
            problemRepository.incrementTotalAccepted(submissionEntity.getProblem().getId());
            if (isFirstSolve && submissionEntity.getProblem().getScore() != null) {
                userRepository.incrementUserScore(
                        submissionEntity.getUser().getId(),
                        submissionEntity.getProblem().getScore().intValue()
                );
            }
        }
        return submissionEntity;
    }

    // --- Hàm bổ trợ ---
    private OjVerdict mapJudge0StatusToOjVerdict(Integer judge0StatusId) {
        return switch (judge0StatusId) {
            case 3 -> OjVerdict.ACCEPTED;
            case 4 -> OjVerdict.WRONG_ANSWER;
            case 5 -> OjVerdict.TIME_LIMIT_EXCEEDED;
            case 6 -> OjVerdict.COMPILATION_ERROR;
            // Map thêm các trạng thái khác (Runtime Error, Memory Limit...)
            default -> OjVerdict.RUNTIME_ERROR;
        };
    }

    private Integer parseExecutionTime(String timeStr) {
        // Judge0 trả về time dạng string ví dụ "0.045" (giây)
        if (timeStr == null)
            return 0;
        try {
            return (int) (Double.parseDouble(timeStr) * 1000); // Chuyển sang mili-giây
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private double calculateTimeLimitForLanguage(Integer baseTimeMs, Integer languageId) {
        if (baseTimeMs == null) {
            return 2.0; // Default fallback to 2 seconds if null
        }
        double baseSec = baseTimeMs / 1000.0;
        return switch (languageId) {
            // C, C++ & Golang (compiled languages, extremely fast execution)
            case 48, 49, 50, 75, 52, 53, 54, 76, 60 -> baseSec;
            
            // Java & C# (VM/CLR-based, needs JVM/Mono startup overhead buffer)
            case 62, 51 -> baseSec * 2.0 + 1.0;
            
            // JavaScript & TypeScript (Node.js JIT startup overhead)
            case 63, 74 -> baseSec * 2.0;
            
            // Python (interpreted, slower execution speed)
            case 70, 71 -> baseSec * 3.0;
            
            // Default fallback to base time
            default -> baseSec;
        };
    }

    private String decodeBase64Safe(String base64Str) {
        if (base64Str == null || base64Str.trim().isEmpty()) return base64Str;
        try {
            // Loại bỏ khoảng trắng/xuống dòng thừa vì Judge0 có thể có \n trong chuỗi Base64
            String cleanBase64 = base64Str.replaceAll("\\s+", "");
            byte[] decodedBytes = java.util.Base64.getDecoder().decode(cleanBase64);
            return new String(decodedBytes, java.nio.charset.StandardCharsets.UTF_8);
        } catch (Exception e) {
            log.warn("Lỗi giải mã Base64 từ Judge0: {}", e.getMessage());
            // Trả về chuỗi gốc nếu không phải Base64 hợp lệ
            return base64Str; 
        }
    }

}
