package com.swp391.coding_platform;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import jakarta.annotation.PostConstruct;

@SpringBootApplication
public class CodingPlatformApplication {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void checkTables() {
        try {
            java.util.List<String> tables = jdbcTemplate.queryForList(
                "SELECT table_name FROM information_schema.tables WHERE table_schema='public'", String.class);
            System.out.println("====== TABLES IN DB ======");
            tables.forEach(System.out::println);
            System.out.println("==========================");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	public static void main(String[] args) {
		SpringApplication.run(CodingPlatformApplication.class, args);
	}
}
