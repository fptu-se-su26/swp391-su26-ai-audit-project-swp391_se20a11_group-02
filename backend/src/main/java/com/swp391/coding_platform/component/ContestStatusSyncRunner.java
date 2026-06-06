package com.swp391.coding_platform.component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class ContestStatusSyncRunner implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(ContestStatusSyncRunner.class);

    private final JdbcTemplate jdbcTemplate;

    public ContestStatusSyncRunner(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
        log.info("ContestStatusSyncRunner bean created successfully!");
    }

    @Override
    public void run(String... args) throws Exception {
        log.info("Synchronizing contest statuses based on current system time...");
        try {
            int runningCount = jdbcTemplate.update(
                    "UPDATE public.contest SET status = 'RUNNING' WHERE start_time <= CURRENT_TIMESTAMP AND end_time >= CURRENT_TIMESTAMP AND status = 'UPCOMING'");
            int endedCount = jdbcTemplate.update(
                    "UPDATE public.contest SET status = 'ENDED' WHERE end_time < CURRENT_TIMESTAMP AND status IN ('UPCOMING', 'RUNNING')");
            log.info("Contest status sync completed: {} moved to RUNNING, {} moved to ENDED.", runningCount,
                    endedCount);
        } catch (Exception e) {
            log.error("Failed to sync contest statuses on startup", e);
        }
    }
}
