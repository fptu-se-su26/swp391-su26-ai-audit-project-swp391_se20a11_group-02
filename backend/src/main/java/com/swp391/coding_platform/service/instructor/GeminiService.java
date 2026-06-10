package com.swp391.coding_platform.service.instructor;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
@FieldDefaults(level = AccessLevel.PRIVATE)
public class GeminiService {

    @Value("${gemini.api-key:}")
    String apiKey;

    final WebClient webClient = WebClient.builder().build();
    final ObjectMapper objectMapper = new ObjectMapper();

    public static class EvaluationResult {
        public int score;
        public String specialization;
        public String technologies;
        public Double experienceYears;
        public String strengths;
        public String weaknesses;
        public String recommendation;
        public String summary;

        public EvaluationResult(int score, String specialization, String technologies, Double experienceYears, String strengths, String weaknesses, String recommendation, String summary) {
            this.score = score;
            this.specialization = specialization;
            this.technologies = technologies;
            this.experienceYears = experienceYears;
            this.strengths = strengths;
            this.weaknesses = weaknesses;
            this.recommendation = recommendation;
            this.summary = summary;
        }
    }

    private String callGemini(String prompt) {
        Map<String, Object> part = new HashMap<>();
        part.put("text", prompt);

        Map<String, Object> content = new HashMap<>();
        content.put("parts", new Object[]{part});

        Map<String, Object> genConfig = new HashMap<>();
        genConfig.put("responseMimeType", "application/json");

        Map<String, Object> requestBody = new HashMap<>();
        requestBody.put("contents", new Object[]{content});
        requestBody.put("generationConfig", genConfig);

        String url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-lite-latest:generateContent";

        return webClient.post()
                .uri(url)
                .header("Content-Type", "application/json")
                .header("x-goog-api-key", apiKey)
                .bodyValue(requestBody)
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }

    public EvaluationResult evaluateCv(String cvText, String introduction) {
        if (apiKey == null || apiKey.trim().isEmpty()) {
            log.warn("Gemini API Key is not configured. Falling back to rule-based keyword matcher.");
            return evaluateCvFallback(cvText, introduction, "Không có Gemini API Key.");
        }

        try {
            // Step 1: Detect specialization
            String detectPrompt = "Bạn là một AI lọc hồ sơ tuyển dụng. Hãy đọc CV và lời giới thiệu sau, và xác định chuyên môn chính (Primary Specialization) của ứng viên.\n" +
                    "Chọn CHÍNH XÁC một trong các giá trị sau (không dịch sang tiếng Việt):\n" +
                    "Backend, Frontend, Full Stack, Mobile, AI/ML, DevOps, Data Engineering, Cyber Security, hoặc Other.\n\n" +
                    "Trả về một chuỗi JSON hợp lệ chứa duy nhất một trường:\n" +
                    "- \"specialization\": giá trị đã chọn (ví dụ: \"Backend\", \"Frontend\", \"Full Stack\", \"Mobile\", \"AI/ML\", \"DevOps\", \"Data Engineering\", \"Cyber Security\", \"Other\").\n\n" +
                    "Nội dung CV:\n" +
                    cvText + "\n\n" +
                    "Lời giới thiệu:\n" +
                    introduction;

            String responseDetect = callGemini(detectPrompt);
            JsonNode rootDetect = objectMapper.readTree(responseDetect);
            String aiTextJsonDetect = rootDetect.path("candidates")
                    .path(0)
                    .path("content")
                    .path("parts")
                    .path(0)
                    .path("text")
                    .asText();

            JsonNode aiJsonDetect = objectMapper.readTree(aiTextJsonDetect.trim());
            String specialization = aiJsonDetect.path("specialization").asText("Other").trim();
            
            // Normalize specialization
            String[] validSpecs = {"Backend", "Frontend", "Full Stack", "Mobile", "AI/ML", "DevOps", "Data Engineering", "Cyber Security", "Other"};
            boolean isValid = false;
            for (String spec : validSpecs) {
                if (spec.equalsIgnoreCase(specialization)) {
                    specialization = spec; // normalize casing
                    isValid = true;
                    break;
                }
            }
            if (!isValid) {
                specialization = "Other";
            }

            // Step 2: Evaluation using criteria
            String criteria = "";
            switch (specialization) {
                case "Backend" -> criteria = "1. Kiến thức sâu về ngôn ngữ lập trình server-side (Java/Spring Boot, Python/Django/FastAPI, Node.js, Go).\n" +
                        "2. Kinh nghiệm thiết kế CSDL quan hệ (PostgreSQL, MySQL) và NoSQL (MongoDB, Redis).\n" +
                        "3. Kiến thức về thiết kế API (REST, gRPC, GraphQL), bảo mật backend, kiến trúc microservices và tối ưu hóa hiệu năng máy chủ.";
                case "Frontend" -> criteria = "1. Sử dụng thành thạo HTML5, CSS3, JavaScript/TypeScript.\n" +
                        "2. Có kinh nghiệm với các thư viện/framework hiện đại như React, Next.js, Vue.js, Angular.\n" +
                        "3. Hiểu biết sâu về responsive design, quản lý state (Redux, Zustand), tối ưu hóa tốc độ tải trang và trải nghiệm người dùng UI/UX.";
                case "Full Stack" -> criteria = "1. Có năng lực xây dựng ứng dụng đầu-cuối (end-to-end) bao gồm cả Frontend (React/Next.js) và Backend (Spring Boot, Node.js).\n" +
                        "2. Thiết kế và tích hợp tốt giữa client và server thông qua REST API.\n" +
                        "3. Hiểu biết về thiết kế CSDL, bảo mật cơ bản và quy trình triển khai ứng dụng.";
                case "Mobile" -> criteria = "1. Thành thạo lập trình ứng dụng di động native (Kotlin, Swift) hoặc cross-platform (Flutter, React Native).\n" +
                        "2. Hiểu rõ vòng đời ứng dụng di động (app lifecycle), lưu trữ offline, kết nối API.\n" +
                        "3. Có kinh nghiệm đóng gói và đưa ứng dụng lên App Store/Google Play.";
                case "AI/ML" -> criteria = "1. Thành thạo lập trình Python và sử dụng các thư viện toán/dữ liệu (NumPy, Pandas, Scikit-learn).\n" +
                        "2. Có kinh nghiệm xây dựng mô hình học máy và học sâu với TensorFlow, PyTorch.\n" +
                        "3. Có kiến thức về xử lý ngôn ngữ tự nhiên (NLP), thị giác máy tính (Computer Vision), LLMs, RAG, hoặc phát triển giải pháp AI.";
                case "DevOps" -> criteria = "1. Thành thạo các công cụ CI/CD (Jenkins, GitHub Actions, GitLab CI).\n" +
                        "2. Kinh nghiệm với ảo hóa, container hóa (Docker, Kubernetes) và giám sát (Prometheus, Grafana).\n" +
                        "3. Sử dụng tốt dịch vụ điện toán đám mây (AWS, GCP, Azure) và công cụ Infrastructure as Code (Terraform).";
                case "Data Engineering" -> criteria = "1. Thành thạo xử lý dữ liệu lớn bằng SQL, Python/Scala và công nghệ Big Data (Hadoop, Spark).\n" +
                        "2. Thiết kế pipelines ETL/ELT hiệu quả (Sử dụng Airflow, Prefect).\n" +
                        "3. Kinh nghiệm làm việc với Data Warehouses (Snowflake, BigQuery) và hàng đợi thông điệp (Kafka).";
                case "Cyber Security" -> criteria = "1. Có chứng chỉ hoặc kiến thức sâu về an ninh mạng, kiểm thử xâm nhập (Penetration Testing).\n" +
                        "2. Hiểu biết về mật mã học, giao thức mạng bảo mật, quản lý định danh và quyền truy cập (IAM).\n" +
                        "3. Khả năng dò quét lỗ hổng bảo mật, ứng phó sự cố và áp dụng các tiêu chuẩn bảo mật (OWASP, ISO 27001).";
                default -> criteria = "1. Có tư duy logic lập trình tốt, sử dụng thành thạo Git và các công cụ phát triển phần mềm cơ bản.\n" +
                        "2. Hiểu biết về các khái niệm lập trình căn bản, cấu trúc dữ liệu và giải thuật.\n" +
                        "3. Có kỹ năng sư phạm hoặc truyền đạt thông tin dễ hiểu.";
            }

            String evalPrompt = "Bạn là một chuyên gia tuyển dụng và kiểm định chất lượng giảng viên lập trình (AI Auditor).\n" +
                    "Hãy đánh giá nội dung CV sau đây để ứng cử làm giảng viên lập trình chuyên môn \"" + specialization + "\" của hệ thống.\n\n" +
                    "Tiêu chí đánh giá chuyên môn cho chuyên ngành \"" + specialization + "\" như sau:\n" +
                    criteria + "\n\n" +
                    "Yêu cầu:\n" +
                    "1. Trích xuất các công nghệ (technologies) được nhắc đến trong CV, phân tách các công nghệ bằng dấu phẩy (ví dụ: \"Java, Spring Boot, MySQL\").\n" +
                    "2. Ước lượng số năm kinh nghiệm (years of experience) thực tế dựa trên thông tin CV. Trả về kiểu số thực (ví dụ 3.5 hoặc 5.0).\n" +
                    "3. Xác định ít nhất 2 thế mạnh (strengths) và 2 điểm yếu (weaknesses) của ứng viên bằng tiếng Việt. Mỗi thế mạnh/điểm yếu phân tách nhau bằng dấu chấm phẩy ; (ví dụ: \"Thế mạnh 1; Thế mạnh 2\").\n" +
                    "4. Đánh giá mức độ phù hợp và cho điểm số nguyên từ 0 đến 100.\n" +
                    "5. Đưa ra khuyến nghị (recommendation) thuộc một trong ba giá trị sau:\n" +
                    "   - LOW_MATCH (nếu score < 50)\n" +
                    "   - REVIEW_REQUIRED (nếu 50 <= score < 80)\n" +
                    "   - RECOMMENDED (nếu score >= 80)\n" +
                    "6. Tạo một tóm tắt (summary) ngắn khoảng 2-3 câu bằng tiếng Việt về tổng quan ứng viên và lý do chấm điểm.\n\n" +
                    "Trả về một chuỗi JSON hợp lệ chứa chính xác các trường sau:\n" +
                    "{\n" +
                    "  \"score\": 85,\n" +
                    "  \"technologies\": \"Java, Spring Boot, PostgreSQL, Docker\",\n" +
                    "  \"experienceYears\": 4.5,\n" +
                    "  \"strengths\": \"Có kinh nghiệm thực tế về microservices; Kỹ năng thiết kế hệ thống tốt.\",\n" +
                    "  \"weaknesses\": \"Thiếu kinh nghiệm giảng dạy chính thức; Chưa có chứng chỉ cloud.\",\n" +
                    "  \"recommendation\": \"RECOMMENDED\",\n" +
                    "  \"summary\": \"Ứng viên có nền tảng lập trình Backend vững chắc với 4.5 năm kinh nghiệm làm việc với Spring Boot và Docker. Điểm số phản ánh năng lực thực tế cao, tuy lượng kinh nghiệm sư phạm còn hạn chế.\"\n" +
                    "}\n\n" +
                    "Nội dung CV cần đánh giá:\n" +
                    cvText + "\n\n" +
                    "Lời giới thiệu của ứng viên:\n" +
                    introduction;

            String responseEval = callGemini(evalPrompt);
            JsonNode rootEval = objectMapper.readTree(responseEval);
            String aiTextJsonEval = rootEval.path("candidates")
                    .path(0)
                    .path("content")
                    .path("parts")
                    .path(0)
                    .path("text")
                    .asText();

            JsonNode aiJsonEval = objectMapper.readTree(aiTextJsonEval.trim());
            int score = aiJsonEval.path("score").asInt(50);
            String technologies = aiJsonEval.path("technologies").asText("").trim();
            double experienceYears = aiJsonEval.path("experienceYears").asDouble(2.0);
            String strengths = aiJsonEval.path("strengths").asText("").trim();
            String weaknesses = aiJsonEval.path("weaknesses").asText("").trim();
            String recommendation = aiJsonEval.path("recommendation").asText("REVIEW_REQUIRED").trim();
            String summary = aiJsonEval.path("summary").asText("Không có tóm tắt đánh giá từ AI.");

            // Standardize recommendation to make sure it's valid
            if (!"LOW_MATCH".equals(recommendation) && !"RECOMMENDED".equals(recommendation) && !"REVIEW_REQUIRED".equals(recommendation)) {
                if (score < 50) recommendation = "LOW_MATCH";
                else if (score >= 80) recommendation = "RECOMMENDED";
                else recommendation = "REVIEW_REQUIRED";
            }

            return new EvaluationResult(score, specialization, technologies, experienceYears, strengths, weaknesses, recommendation, summary);

        } catch (Exception e) {
            log.error("Error calling Gemini API for CV evaluation: {}", e.getMessage(), e);
            return evaluateCvFallback(cvText, introduction, "Lỗi kết nối Gemini API: " + e.getMessage());
        }
    }

    private EvaluationResult evaluateCvFallback(String cvText, String introduction, String note) {
        String combined = (cvText + " " + introduction).toLowerCase();
        int score = 40; // Base score
        StringBuilder detectedSkills = new StringBuilder();

        // 1. Detect specialization
        String specialization = "Other";
        int backendHits = 0;
        int frontendHits = 0;
        int mobileHits = 0;
        int aimlHits = 0;
        int devopsHits = 0;
        int dataHits = 0;
        int cyberHits = 0;

        if (combined.contains("java") || combined.contains("spring") || combined.contains("springboot") || combined.contains("backend") || combined.contains("postgres") || combined.contains("mysql") || combined.contains("node") || combined.contains("express")) {
            backendHits += 3;
        }
        if (combined.contains("react") || combined.contains("nextjs") || combined.contains("next.js") || combined.contains("frontend") || combined.contains("html") || combined.contains("css") || combined.contains("vue") || combined.contains("angular") || combined.contains("ui/ux")) {
            frontendHits += 3;
        }
        if (combined.contains("flutter") || combined.contains("react native") || combined.contains("swift") || combined.contains("kotlin") || combined.contains("android") || combined.contains("ios") || combined.contains("mobile")) {
            mobileHits += 3;
        }
        if (combined.contains("python") || combined.contains("pytorch") || combined.contains("tensorflow") || combined.contains("machine learning") || combined.contains("deep learning") || combined.contains("ai/ml") || combined.contains("model") || combined.contains("nlp")) {
            aimlHits += 3;
        }
        if (combined.contains("docker") || combined.contains("kubernetes") || combined.contains("devops") || combined.contains("jenkins") || combined.contains("ci/cd") || combined.contains("terraform") || combined.contains("aws") || combined.contains("gcp")) {
            devopsHits += 3;
        }
        if (combined.contains("spark") || combined.contains("kafka") || combined.contains("hadoop") || combined.contains("airflow") || combined.contains("etl") || combined.contains("data engineering") || combined.contains("big data")) {
            dataHits += 3;
        }
        if (combined.contains("security") || combined.contains("cyber") || combined.contains("pentest") || combined.contains("firewall") || combined.contains("cryptography") || combined.contains("vulnerability")) {
            cyberHits += 3;
        }

        // Determine major hits
        int maxHits = 0;
        if (backendHits > maxHits) { maxHits = backendHits; specialization = "Backend"; }
        if (frontendHits > maxHits) { maxHits = frontendHits; specialization = "Frontend"; }
        if (mobileHits > maxHits) { maxHits = mobileHits; specialization = "Mobile"; }
        if (aimlHits > maxHits) { maxHits = aimlHits; specialization = "AI/ML"; }
        if (devopsHits > maxHits) { maxHits = devopsHits; specialization = "DevOps"; }
        if (dataHits > maxHits) { maxHits = dataHits; specialization = "Data Engineering"; }
        if (cyberHits > maxHits) { maxHits = cyberHits; specialization = "Cyber Security"; }

        if (backendHits > 1 && frontendHits > 1 && maxHits < 6) {
            specialization = "Full Stack";
        }

        // 2. Extract technologies
        if (combined.contains("java")) { score += 10; detectedSkills.append("Java, "); }
        if (combined.contains("spring") || combined.contains("springboot")) { score += 10; detectedSkills.append("Spring Boot, "); }
        if (combined.contains("react") || combined.contains("nextjs") || combined.contains("next.js")) { score += 10; detectedSkills.append("React/Next.js, "); }
        if (combined.contains("python") || combined.contains("django") || combined.contains("fastapi")) { score += 10; detectedSkills.append("Python, "); }
        if (combined.contains("c++") || combined.contains("cpp")) { score += 10; detectedSkills.append("C++, "); }
        if (combined.contains("database") || combined.contains("sql") || combined.contains("postgres") || combined.contains("mysql")) { score += 5; detectedSkills.append("Database, "); }
        if (combined.contains("docker") || combined.contains("kubernetes") || combined.contains("devops")) { score += 5; detectedSkills.append("DevOps, "); }
        if (combined.contains("teaching") || combined.contains("giảng dạy") || combined.contains("sư phạm") || combined.contains("tutor") || combined.contains("dạy")) { score += 15; detectedSkills.append("Giảng dạy, "); }
        if (combined.contains("senior") || combined.contains("lead") || combined.contains("experienced") || combined.contains("kinh nghiệm")) { score += 10; detectedSkills.append("Kinh nghiệm thực tế, "); }

        if (score > 100) score = 100;
        String skillsStr = detectedSkills.length() > 2 ? detectedSkills.substring(0, detectedSkills.length() - 2) : "Kỹ năng lập trình cơ bản";

        // 3. Estimate years of experience
        double expYears = 2.0;
        if (combined.contains("5 năm") || combined.contains("5 years") || combined.contains("senior") || combined.contains("8 năm") || combined.contains("8 years")) {
            expYears = 5.5;
        } else if (combined.contains("3 năm") || combined.contains("3 years") || combined.contains("mid-level")) {
            expYears = 3.0;
        } else if (combined.contains("1 năm") || combined.contains("1 year") || combined.contains("junior")) {
            expYears = 1.0;
        }

        // 4. Strengths and weaknesses
        String strengths = "Có kiến thức tốt về chuyên ngành " + specialization + "; Thành thạo công nghệ: " + skillsStr;
        String weaknesses = "Cần tích lũy thêm kỹ năng sư phạm truyền đạt; Chưa có nhiều chứng chỉ chuyên môn quốc tế được ghi nhận.";

        // 5. Recommendation
        String recommendation;
        if (score < 50) {
            recommendation = "LOW_MATCH";
        } else if (score >= 80) {
            recommendation = "RECOMMENDED";
        } else {
            recommendation = "REVIEW_REQUIRED";
        }

        String summary = String.format("Hồ sơ được quét tự động bằng từ khóa chuyên ngành (%s). Chuyên môn phát hiện: %s. Công nghệ: %s. Kỹ năng giảng dạy và thâm niên được ưu tiên tính điểm.",
                note, specialization, skillsStr);

        return new EvaluationResult(score, specialization, skillsStr, expYears, strengths, weaknesses, recommendation, summary);
    }}
