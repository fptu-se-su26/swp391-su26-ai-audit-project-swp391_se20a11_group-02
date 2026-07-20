package com.swp391.coding_platform.automation_tests;

import io.restassured.RestAssured;
import org.junit.jupiter.api.BeforeEach;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.context.annotation.Import;
import com.swp391.coding_platform.TestcontainersConfiguration;
import java.util.Map;

import static io.restassured.RestAssured.given;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ActiveProfiles("test")
@Import(TestcontainersConfiguration.class)
@Sql(scripts = "/seed.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_CLASS)
public abstract class BaseApiTest {

    static {
        try {
            java.io.File envFile = new java.io.File("src/test/resources/application-test.properties").getAbsoluteFile();
            // Also load standard .env if exists
            java.io.File rootEnvFile = new java.io.File(".env").getAbsoluteFile();
            if (rootEnvFile.exists()) {
                java.nio.file.Files.lines(rootEnvFile.toPath())
                        .map(String::trim)
                        .filter(line -> !line.isEmpty() && !line.startsWith("#"))
                        .forEach(line -> {
                            int eqIndex = line.indexOf('=');
                            if (eqIndex > 0) {
                                String key = line.substring(0, eqIndex).trim();
                                String val = line.substring(eqIndex + 1).trim();
                                System.setProperty(key, val);
                            }
                        });
            }
            RestAssured.filters(new io.restassured.filter.log.RequestLoggingFilter(), new io.restassured.filter.log.ResponseLoggingFilter());
        } catch (Exception e) {
            System.err.println("Failed to load .env file in tests: " + e.getMessage());
        }
    }

    @LocalServerPort
    protected int port;

    @org.springframework.test.context.bean.override.mockito.MockitoBean
    protected com.swp391.coding_platform.service.judge0.Judge0ClientService judge0ClientService;

    @BeforeEach
    public void setUp() {
        RestAssured.port = port;
        RestAssured.baseURI = "http://localhost";
        RestAssured.basePath = "/nonstopcoding";

        if (judge0ClientService != null) {
            org.mockito.Mockito.when(judge0ClientService.sendBatchSubmission(org.mockito.Mockito.any()))
                .thenAnswer(invocation -> {
                    com.swp391.coding_platform.dto.judge0.Judge0BatchRequest batchReq = invocation.getArgument(0);
                    java.util.List<com.swp391.coding_platform.dto.judge0.Judge0TokenResponse> mockTokens = new java.util.ArrayList<>();
                    if (batchReq != null && batchReq.getSubmissions() != null) {
                        for (int i = 0; i < batchReq.getSubmissions().size(); i++) {
                            com.swp391.coding_platform.dto.judge0.Judge0TokenResponse resp = new com.swp391.coding_platform.dto.judge0.Judge0TokenResponse();
                            resp.setToken("mock-token-" + System.currentTimeMillis() + "-" + i);
                            mockTokens.add(resp);
                        }
                    }
                    return mockTokens;
                });
        }
    }

    protected String getAccessToken(String username, String password) {
        return given()
                .contentType("application/json")
                .body(Map.of("username", username, "password", password))
                .when()
                .post("/auth/login")
                .then()
                .statusCode(200)
                .extract()
                .cookie("access_token");
    }
}
