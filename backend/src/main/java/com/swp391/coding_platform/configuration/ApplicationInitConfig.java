package com.swp391.coding_platform.configuration;

import com.swp391.coding_platform.entity.auth.RoleEntity;
import com.swp391.coding_platform.entity.enums.RoleName;
import com.swp391.coding_platform.entity.enums.UserStatus;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.repository.auth.RoleRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Set;

@Slf4j
@Configuration
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Profile("dev")
public class ApplicationInitConfig {

    PasswordEncoder passwordEncoder;

    @Bean
    ApplicationRunner applicationRunner(
            UserRepository userRepository,
            RoleRepository roleRepository
    ) {
        log.info("Init application for dev environment...");

        return args -> {
            if (userRepository.findByUsername("admin").isEmpty()) {
                var adminRole = roleRepository.findByName(RoleName.ADMIN)
                        .orElseGet(() -> roleRepository.save(RoleEntity.builder().name(RoleName.ADMIN).build()));

                UserEntity adminUser = UserEntity.builder()
                        .username("admin")
                        .passwordHash(passwordEncoder.encode("admin"))
                        .displayname("admin")
                        .email("admin@gmail.com")
                        .status(UserStatus.ACTIVE)
                        .roles(Set.of(adminRole))
                        .build();

                userRepository.save(adminUser);

                log.warn("Dev admin user has been created. Please change the default password if needed.");
            }
        };
    }
}
