package com.swp391.coding_platform.repository.problem;

import com.swp391.coding_platform.entity.enums.ProblemScope;
import com.swp391.coding_platform.entity.problem.ProblemEntity;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.Import;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import com.swp391.coding_platform.TestcontainersConfiguration;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Import(TestcontainersConfiguration.class)
class ProblemRepositoryTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private ProblemRepository problemRepository;

    @Test
    void findByIdAndIsActiveTrueAndIsPublicTrue_shouldReturnPublicProblem() {
        com.swp391.coding_platform.entity.user.UserEntity user = com.swp391.coding_platform.entity.user.UserEntity.builder()
                .username("testuser1")
                .email("test1@example.com")
                .passwordHash("hash")
                .displayname("testuser")
                .build();
        entityManager.persist(user);

        com.swp391.coding_platform.entity.problem.ProblemVersionEntity version1 = com.swp391.coding_platform.entity.problem.ProblemVersionEntity.builder()
                .title("Public Problem")
                .isActive(true)
                .build();
        ProblemEntity publicProblem = ProblemEntity.builder()
                .createdBy(user)
                .isPublic(true)
                .isActive(true)
                .versions(new java.util.ArrayList<>(java.util.List.of(version1)))
                .build();
        version1.setProblem(publicProblem);
        entityManager.persist(publicProblem);
        
        com.swp391.coding_platform.entity.problem.ProblemVersionEntity version2 = com.swp391.coding_platform.entity.problem.ProblemVersionEntity.builder()
                .title("Private Problem")
                .isActive(true)
                .build();
        ProblemEntity privateProblem = ProblemEntity.builder()
                .createdBy(user)
                .isPublic(false)
                .isActive(true)
                .versions(new java.util.ArrayList<>(java.util.List.of(version2)))
                .build();
        version2.setProblem(privateProblem);
        entityManager.persist(privateProblem);
        
        entityManager.flush();

        Optional<ProblemEntity> found = problemRepository.findByIdAndIsActiveTrueAndIsPublicTrue(publicProblem.getId());
        assertThat(found).isPresent();
        assertThat(found.get().getCurrentVersion().getTitle()).isEqualTo("Public Problem");

        Optional<ProblemEntity> notFound = problemRepository.findByIdAndIsActiveTrueAndIsPublicTrue(privateProblem.getId());
        assertThat(notFound).isEmpty();
    }

    @Test
    void findByProblemScopeInAndIsActiveTrueAndIsPublicTrue_shouldReturnMatchingProblems() {
        com.swp391.coding_platform.entity.user.UserEntity user = com.swp391.coding_platform.entity.user.UserEntity.builder()
                .username("testuser2")
                .email("test2@example.com")
                .passwordHash("hash")
                .displayname("testuser")
                .build();
        entityManager.persist(user);

        com.swp391.coding_platform.entity.problem.ProblemVersionEntity version1 = com.swp391.coding_platform.entity.problem.ProblemVersionEntity.builder()
                .title("Matching")
                .isActive(true)
                .build();
        ProblemEntity matching = ProblemEntity.builder()
                .createdBy(user)
                .problemScope(ProblemScope.PRACTICE)
                .isActive(true)
                .isPublic(true)
                .versions(new java.util.ArrayList<>(java.util.List.of(version1)))
                .build();
        version1.setProblem(matching);
        entityManager.persist(matching);

        com.swp391.coding_platform.entity.problem.ProblemVersionEntity version2 = com.swp391.coding_platform.entity.problem.ProblemVersionEntity.builder()
                .title("Not Active")
                .isActive(true)
                .build();
        ProblemEntity notActive = ProblemEntity.builder()
                .createdBy(user)
                .problemScope(ProblemScope.PRACTICE)
                .isActive(false)
                .isPublic(true)
                .versions(new java.util.ArrayList<>(java.util.List.of(version2)))
                .build();
        version2.setProblem(notActive);
        entityManager.persist(notActive);

        entityManager.flush();

        List<ProblemEntity> results = problemRepository.findByProblemScopeInAndIsActiveTrueAndIsPublicTrue(
                List.of(ProblemScope.PRACTICE)
        );

        assertThat(results).hasSize(1);
        assertThat(results.get(0).getCurrentVersion().getTitle()).isEqualTo("Matching");
    }
}
