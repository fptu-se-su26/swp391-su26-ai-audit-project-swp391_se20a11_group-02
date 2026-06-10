package com.swp391.coding_platform.service.instructor;

import com.swp391.coding_platform.dto.request.ApproveApplicationRequest;
import com.swp391.coding_platform.dto.request.InstructorApplyRequest;
import com.swp391.coding_platform.dto.response.InstructorApplicationResponse;
import com.swp391.coding_platform.entity.auth.RoleEntity;
import com.swp391.coding_platform.entity.enums.InstructorAppStatus;
import com.swp391.coding_platform.entity.enums.InstructorStatus;
import com.swp391.coding_platform.entity.enums.RoleName;
import com.swp391.coding_platform.entity.enums.UserStatus;
import com.swp391.coding_platform.entity.instructor.InstructorApplicationEntity;
import com.swp391.coding_platform.entity.instructor.InstructorEntity;
import com.swp391.coding_platform.entity.payment.WalletEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.exception.ErrorCode;
import com.swp391.coding_platform.repository.auth.RoleRepository;
import com.swp391.coding_platform.repository.instructor.InstructorApplicationRepository;
import com.swp391.coding_platform.repository.instructor.InstructorRepository;
import com.swp391.coding_platform.repository.payment.WalletRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.math.BigDecimal;
import java.time.Instant;
import java.net.URI;
import java.net.URL;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class InstructorApplicationService {

    InstructorApplicationRepository applicationRepository;
    UserRepository userRepository;
    RoleRepository roleRepository;
    InstructorRepository instructorRepository;
    WalletRepository walletRepository;
    GeminiService geminiService;

    @Transactional
    public InstructorApplicationResponse apply(Integer userId, org.springframework.web.multipart.MultipartFile cvFile, String introduction) {
        UserEntity user = userRepository.findById(userId)
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));

        // Check if user is already an instructor
        boolean isAlreadyInstructor = user.getRoles().stream()
                .anyMatch(role -> role.getName() == RoleName.INSTRUCTOR);
        if (isAlreadyInstructor || instructorRepository.findByUserId(userId).isPresent()) {
            throw new AppException(ErrorCode.ALREADY_INSTRUCTOR);
        }

        // Check if there is already a pending application
        List<InstructorApplicationEntity> userApps = applicationRepository.findByUserIdOrderByCreatedAtDesc(userId);
        if (!userApps.isEmpty()) {
            InstructorAppStatus latestStatus = userApps.get(0).getStatus();
            if (latestStatus == InstructorAppStatus.PENDING) {
                throw new AppException(ErrorCode.APPLICATION_PENDING);
            }
        }

        if (cvFile == null || cvFile.isEmpty()) {
            throw new AppException(ErrorCode.INVALID_CV_FORMAT);
        }

        if (cvFile.getSize() > 5 * 1024 * 1024) {
            throw new AppException(ErrorCode.FILE_TOO_LARGE);
        }

        String originalFilename = cvFile.getOriginalFilename();
        if (originalFilename == null || (!originalFilename.toLowerCase().endsWith(".pdf") && !originalFilename.toLowerCase().endsWith(".docx"))) {
            throw new AppException(ErrorCode.INVALID_CV_FORMAT);
        }

        // Try parsing the file synchronously to validate if it's a valid and readable CV (PDF or DOCX)
        try (InputStream is = cvFile.getInputStream()) {
            String text = "";
            if (originalFilename.toLowerCase().endsWith(".pdf")) {
                try (PDDocument document = Loader.loadPDF(is.readAllBytes())) {
                    PDFTextStripper stripper = new PDFTextStripper();
                    text = stripper.getText(document);
                }
            } else {
                try (XWPFDocument doc = new XWPFDocument(is)) {
                    XWPFWordExtractor extractor = new XWPFWordExtractor(doc);
                    text = extractor.getText();
                }
            }

            if (text == null || text.trim().isEmpty()) {
                throw new AppException(ErrorCode.INVALID_CV_CONTENT);
            }
            
            // Basic heuristic check to see if it resembles a CV / resume
            String textLower = text.toLowerCase();
            boolean looksLikeCv = textLower.contains("cv")
                    || textLower.contains("resume")
                    || textLower.contains("profile")
                    || textLower.contains("experience")
                    || textLower.contains("kinh nghiệm")
                    || textLower.contains("học vấn")
                    || textLower.contains("education")
                    || textLower.contains("kỹ năng")
                    || textLower.contains("skills")
                    || textLower.contains("giới thiệu")
                    || textLower.contains("tốt nghiệp")
                    || textLower.contains("năm sinh")
                    || textLower.contains("email")
                    || textLower.contains("phone")
                    || textLower.contains("sđt")
                    || textLower.contains("dự án")
                    || textLower.contains("project");
            
            if (!looksLikeCv) {
                throw new AppException(ErrorCode.NOT_A_CV);
            }
        } catch (AppException e) {
            throw e;
        } catch (Exception e) {
            log.error("Failed to parse file during CV upload validation: {}", e.getMessage());
            throw new AppException(ErrorCode.INVALID_CV_FORMAT);
        }

        // Resolve target base directory to always be backend folder
        java.io.File rootDir = new java.io.File(".").getAbsoluteFile();
        java.io.File backendDir = new java.io.File(rootDir, "backend");
        java.io.File baseDir = backendDir.exists() && backendDir.isDirectory() ? backendDir : rootDir;
        java.io.File uploadDir = new java.io.File(baseDir, "uploads/cvs");
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String savedFilename = UUID.randomUUID().toString() + "_" + originalFilename;
        java.io.File destFile = new java.io.File(uploadDir, savedFilename);
        try {
            cvFile.transferTo(destFile);
        } catch (java.io.IOException e) {
            log.error("Failed to save CV file: {}", e.getMessage());
            throw new AppException(ErrorCode.FILE_SAVE_ERROR);
        }

        String cvUrl = "http://localhost:8080/nonstopcoding/uploads/cvs/" + savedFilename;

        // Create and save application
        InstructorApplicationEntity entity = InstructorApplicationEntity.builder()
                .user(user)
                .cvUrl(cvUrl)
                .introduction(introduction)
                .status(InstructorAppStatus.PENDING)
                .aiScore(0)
                .aiSummary("Hệ thống đang tiến hành quét CV và đánh giá tự động bằng AI ngầm...")
                .build();

        entity = applicationRepository.save(entity);

        // Async AI Evaluation call
        evaluateCvAsync(entity.getId());

        return mapToResponse(entity);
    }

    @Async
    @Transactional
    public void evaluateCvAsync(Integer applicationId) {
        Optional<InstructorApplicationEntity> appOpt = applicationRepository.findById(applicationId);
        if (appOpt.isEmpty()) {
            return;
        }

        InstructorApplicationEntity application = appOpt.get();
        String cvText = "";
        try {
            String cvUrl = application.getCvUrl();
            byte[] bytes = null;

            if (cvUrl != null && cvUrl.contains("/uploads/cvs/")) {
                // Local file on disk
                String filename = cvUrl.substring(cvUrl.lastIndexOf("/") + 1);
                java.io.File rootDir = new java.io.File(".").getAbsoluteFile();
                java.io.File backendDir = new java.io.File(rootDir, "backend");
                java.io.File baseDir = backendDir.exists() && backendDir.isDirectory() ? backendDir : rootDir;
                java.io.File localFile = new java.io.File(baseDir, "uploads/cvs/" + filename);

                log.info("Reading local file: {}", localFile.getAbsolutePath());
                bytes = java.nio.file.Files.readAllBytes(localFile.toPath());
            } else if (cvUrl != null && (cvUrl.startsWith("http://") || cvUrl.startsWith("https://"))) {
                // Remote URL fallback
                log.info("Downloading file from URL: {}", cvUrl);
                URL url = URI.create(cvUrl).toURL();
                try (InputStream in = url.openStream()) {
                    bytes = in.readAllBytes();
                }
            }

            if (bytes != null) {
                String cvUrlLower = cvUrl != null ? cvUrl.toLowerCase() : "";
                if (cvUrlLower.endsWith(".docx")) {
                    try (XWPFDocument doc = new XWPFDocument(new java.io.ByteArrayInputStream(bytes))) {
                        XWPFWordExtractor extractor = new XWPFWordExtractor(doc);
                        cvText = extractor.getText();
                        log.info("Extracted text successfully from CV DOCX.");
                    }
                } else {
                    try (PDDocument document = Loader.loadPDF(bytes)) {
                        PDFTextStripper stripper = new PDFTextStripper();
                        cvText = stripper.getText(document);
                        log.info("Extracted text successfully from CV PDF.");
                    }
                }
            } else {
                log.warn("Invalid CV URL. Skipping text extraction.");
            }
        } catch (Exception e) {
            log.error("Failed to parse CV from URL: {}. Error: {}", application.getCvUrl(), e.getMessage());
            cvText = "Không thể tải hoặc trích xuất văn bản từ CV. Lỗi: " + e.getMessage();
        }

        // Call Gemini (or fallback)
        GeminiService.EvaluationResult evaluation = geminiService.evaluateCv(cvText, application.getIntroduction());

        // Update database
        application.setAiScore(evaluation.score);
        application.setAiSummary(evaluation.summary);
        application.setAiSpecialization(evaluation.specialization);
        application.setAiTechnologies(evaluation.technologies);
        application.setAiExperienceYears(evaluation.experienceYears);
        application.setAiStrengths(evaluation.strengths);
        application.setAiWeaknesses(evaluation.weaknesses);
        application.setAiRecommendation(evaluation.recommendation);

        if (evaluation.score < 50) {
            application.setStatus(InstructorAppStatus.AI_REJECTED);
            application.setAdminNote("Hệ thống tự động từ chối do điểm đánh giá hồ sơ bằng AI dưới 50 (" + evaluation.score + "/100).");
        } else {
            application.setStatus(InstructorAppStatus.PENDING);
        }
        applicationRepository.save(application);
        log.info("Background AI CV evaluation complete for application ID: {}. Score: {}", applicationId, evaluation.score);
    }

    @Transactional(readOnly = true)
    public List<InstructorApplicationResponse> getApplications() {
        return applicationRepository.findAllByOrderByCreatedAtDesc().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public InstructorApplicationResponse getMyApplicationStatus(Integer userId) {
        List<InstructorApplicationEntity> list = applicationRepository.findByUserIdOrderByCreatedAtDesc(userId);
        if (list.isEmpty()) {
            return null;
        }
        return mapToResponse(list.get(0));
    }

    @Transactional
    public InstructorApplicationResponse approveApplication(Integer appId, ApproveApplicationRequest request) {
        InstructorApplicationEntity application = applicationRepository.findById(appId)
                .orElseThrow(() -> new AppException(ErrorCode.RESOURCE_NOT_FOUND));

        if (application.getStatus() != InstructorAppStatus.PENDING) {
            throw new RuntimeException("Đơn đăng ký này đã được xử lý trước đó.");
        }

        InstructorAppStatus targetStatus;
        try {
            targetStatus = InstructorAppStatus.valueOf(request.getStatus().toUpperCase());
        } catch (IllegalArgumentException e) {
            throw new RuntimeException("Trạng thái duyệt không hợp lệ. Chỉ chấp nhận APPROVED hoặc REJECTED.");
        }

        application.setStatus(targetStatus);
        application.setAdminNote(request.getAdminNote());
        application = applicationRepository.save(application);

        if (targetStatus == InstructorAppStatus.APPROVED) {
            UserEntity user = application.getUser();

            // Add INSTRUCTOR role to user
            RoleEntity instructorRole = roleRepository.findByName(RoleName.INSTRUCTOR)
                    .orElseGet(() -> roleRepository.save(RoleEntity.builder().name(RoleName.INSTRUCTOR).build()));

            Set<RoleEntity> roles = new HashSet<>(user.getRoles());
            roles.add(instructorRole);
            user.setRoles(roles);
            userRepository.save(user);

            // Create Instructor Profile
            if (instructorRepository.findByUserId(user.getId()).isEmpty()) {
                InstructorEntity instructor = InstructorEntity.builder()
                        .user(user)
                        .fullName(user.getDisplayname() != null ? user.getDisplayname() : user.getUsername())
                        .major("Software Engineering")
                        .bio(application.getIntroduction())
                        .status(InstructorStatus.ACTIVE)
                        .hiredByAdmin(true)
                        .build();
                instructorRepository.save(instructor);
            }

            // Create Wallet if not exists
            if (user.getWallet() == null) {
                WalletEntity wallet = WalletEntity.builder()
                        .user(user)
                        .balance(BigDecimal.ZERO)
                        .status(UserStatus.ACTIVE)
                        .build();
                walletRepository.save(wallet);
            }
            log.info("User {} has been successfully approved to be an INSTRUCTOR.", user.getUsername());
        }

        return mapToResponse(application);
    }

    private InstructorApplicationResponse mapToResponse(InstructorApplicationEntity entity) {
        return InstructorApplicationResponse.builder()
                .id(entity.getId())
                .userId(entity.getUser().getId())
                .fullName(entity.getUser().getDisplayname() != null ? entity.getUser().getDisplayname() : entity.getUser().getUsername())
                .email(entity.getUser().getEmail())
                .cvUrl(entity.getCvUrl())
                .introduction(entity.getIntroduction())
                .status(entity.getStatus().name())
                .adminNote(entity.getAdminNote())
                .aiScore(entity.getAiScore())
                .aiSummary(entity.getAiSummary())
                .aiSpecialization(entity.getAiSpecialization())
                .aiTechnologies(entity.getAiTechnologies())
                .aiExperienceYears(entity.getAiExperienceYears())
                .aiStrengths(entity.getAiStrengths())
                .aiWeaknesses(entity.getAiWeaknesses())
                .aiRecommendation(entity.getAiRecommendation())
                .createdAt(entity.getCreatedAt())
                .build();
    }

    @Scheduled(cron = "0 0 0 * * ?") // Runs daily at midnight
    @Transactional
    public void cleanupRejectedApplications() {
        log.info("Starting automatic cleanup of rejected instructor applications older than 7 days...");
        Instant cutoff = Instant.now().minus(java.time.Duration.ofDays(7));
        
        List<InstructorApplicationEntity> oldRejectedApps = applicationRepository
                .findByStatusAndUpdatedAtBefore(InstructorAppStatus.REJECTED, cutoff);
                
        if (oldRejectedApps.isEmpty()) {
            log.info("No rejected instructor applications older than 7 days found.");
            return;
        }

        // Resolve target base directory to identify local CV files
        java.io.File rootDir = new java.io.File(".").getAbsoluteFile();
        java.io.File backendDir = new java.io.File(rootDir, "backend");
        java.io.File baseDir = backendDir.exists() && backendDir.isDirectory() ? backendDir : rootDir;

        for (InstructorApplicationEntity app : oldRejectedApps) {
            try {
                String cvUrl = app.getCvUrl();
                if (cvUrl != null && cvUrl.contains("/uploads/cvs/")) {
                    String filename = cvUrl.substring(cvUrl.lastIndexOf("/") + 1);
                    java.io.File localFile = new java.io.File(baseDir, "uploads/cvs/" + filename);
                    if (localFile.exists()) {
                        boolean deleted = localFile.delete();
                        if (deleted) {
                            log.info("Deleted CV file from disk: {}", localFile.getAbsolutePath());
                        } else {
                            log.warn("Failed to delete CV file from disk: {}", localFile.getAbsolutePath());
                        }
                    }
                }
            } catch (Exception e) {
                log.error("Error deleting CV file for application ID {}: {}", app.getId(), e.getMessage());
            }
        }

        applicationRepository.deleteAll(oldRejectedApps);
        log.info("Successfully cleaned up {} rejected instructor applications.", oldRejectedApps.size());
    }
}
