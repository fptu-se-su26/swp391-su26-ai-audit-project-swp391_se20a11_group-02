package com.swp391.coding_platform.repository.user;

import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.repository.projection.RankingUserProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
        List<UserEntity> findAllByCreatedAtAfter(Instant after);
        long countByStatus(com.swp391.coding_platform.entity.enums.UserStatus status);
        @Modifying
        @Query("UPDATE UserEntity u SET u.score = COALESCE(u.score, 0) + :score WHERE u.id = :userId")
        void incrementUserScore(@Param("userId") Integer userId, @Param("score") Integer score);
        Optional<UserEntity> findByUsername(String username);

        boolean existsByUsername(String username);

        boolean existsByEmail(String email);

        Optional<UserEntity> findByEmail(String email);

        @Query("SELECT u FROM UserEntity u LEFT JOIN FETCH u.wallet WHERE u.username = :username")
        Optional<UserEntity> findByUsernameWithWallet(@Param("username") String username);

        @Query(value = "WITH UserScores AS (" +
                        "    SELECT " +
                        "        u.id AS user_id, " +
                        "        COALESCE(us.total_score, 0) AS total_score, " +
                        "        u.created_at " +
                        "    FROM public.users u " +
                        "    LEFT JOIN (" +
                        "        SELECT ps.user_id, SUM(p.score) AS total_score " +
                        "        FROM ( " +
                        "            SELECT DISTINCT user_id, problem_id " +
                        "            FROM public.problem_submissions " +
                        "            WHERE verdict = 'ACCEPTED' " +
                        "        ) ps " +
                        "        JOIN public.problems p ON p.id = ps.problem_id AND p.problem_scope = 'PRACTICE' " +
                        "        GROUP BY ps.user_id " +
                        "    ) us ON us.user_id = u.id " +
                        "), " +
                        "RankedUsers AS (" +
                        "    SELECT user_id, RANK() OVER (ORDER BY total_score DESC, created_at ASC) as current_rank " +
                        "    FROM UserScores " +
                        ") " +
                        "SELECT current_rank FROM RankedUsers WHERE user_id = :userId", nativeQuery = true)
        Integer getUserRanking(@Param("userId") Integer userId);

        @Query(value = "SELECT COUNT(DISTINCT ps.problem_id) FROM problem_submissions ps " +
                        "JOIN problems p ON ps.problem_id = p.id " +
                        "WHERE ps.user_id = :userId AND ps.verdict = 'ACCEPTED' AND p.problem_scope = 'PRACTICE'", nativeQuery = true)
        Long countSolvedPracticeProblemsByUserId(@Param("userId") Integer userId);

        @Query(value = "SELECT COUNT(*) " +
                        "FROM problems " +
                        "WHERE problem_scope = 'PRACTICE' " +
                        "AND is_active = true " +
                        "AND is_public = true", nativeQuery = true)
        Long countTotalPracticeProblems();

        @Query(value = "SELECT " +
                        "  u.id as userId, " +
                        "  u.displayname as displayname, " +
                        "  u.avatarurl as avatarurl, " +
                        "  COALESCE(us.total_score, 0) as points " +
                        "FROM public.users u " +
                        "LEFT JOIN (" +
                        "    SELECT ps.user_id, SUM(p.score) AS total_score " +
                        "    FROM ( " +
                        "        SELECT DISTINCT user_id, problem_id " +
                        "        FROM public.problem_submissions " +
                        "        WHERE verdict = 'ACCEPTED' " +
                        "    ) ps " +
                        "    JOIN public.problems p ON p.id = ps.problem_id AND p.problem_scope = 'PRACTICE' " +
                        "    GROUP BY ps.user_id " +
                        ") us ON us.user_id = u.id " +
                        "ORDER BY points DESC, u.id ASC", nativeQuery = true)
        List<RankingUserProjection> getGlobalRankingList();
}
