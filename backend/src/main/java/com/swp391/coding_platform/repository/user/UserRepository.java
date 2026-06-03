package com.swp391.coding_platform.repository.user;

import com.swp391.coding_platform.entity.user.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
    Optional<UserEntity> findByUsername(String username);
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
    Optional<UserEntity> findByEmail(String email);

    @Query("SELECT u FROM UserEntity u LEFT JOIN FETCH u.wallet WHERE u.username = :username")
    Optional<UserEntity> findByUsernameWithWallet(@Param("username") String username);

    @Query(value = "SELECT " +
            "  u.id as userId, " +
            "  u.displayname as displayname, " +
            "  u.avatarurl as avatarurl, " +
            "  COALESCE(SUM(DISTINCT CASE WHEN ps.verdict = 'ACCEPTED' THEN p.score END), 0) as points, " +
            "  COUNT(DISTINCT CASE WHEN ps.verdict = 'ACCEPTED' THEN ps.problem_id END) as solved, " +
            "  CAST(COUNT(CASE WHEN ps.verdict = 'ACCEPTED' THEN 1 END) * 100.0 / NULLIF(COUNT(ps.id), 0) AS numeric(5,2)) as accuracy, " +
            "  (" +
            "    SELECT ps_sub.language_id " +
            "    FROM public.problem_submissions ps_sub " +
            "    WHERE ps_sub.user_id = u.id " +
            "    GROUP BY ps_sub.language_id " +
            "    ORDER BY COUNT(ps_sub.id) DESC, ps_sub.language_id " +
            "    LIMIT 1" +
            "  ) as languageId " +
            "FROM public.users u " +
            "LEFT JOIN public.problem_submissions ps ON u.id = ps.user_id AND (:checkDate = false OR ps.submitted_at >= :startDate) " +
            "LEFT JOIN public.problems p ON ps.problem_id = p.id " +
            "GROUP BY u.id " +
            "ORDER BY points DESC, solved DESC, u.id ASC", nativeQuery = true)
    List<RankingUserProjection> getGlobalRankingList(@Param("checkDate") boolean checkDate, @Param("startDate") Instant startDate);

    @Query(value = "WITH leaderboard AS (" +
            "  SELECT " +
            "    u.id as userId, " +
            "    COALESCE(SUM(DISTINCT CASE WHEN ps.verdict = 'ACCEPTED' THEN p.score END), 0) as points, " +
            "    COUNT(DISTINCT CASE WHEN ps.verdict = 'ACCEPTED' THEN ps.problem_id END) as solved, " +
            "    ROW_NUMBER() OVER (ORDER BY COALESCE(SUM(DISTINCT CASE WHEN ps.verdict = 'ACCEPTED' THEN p.score END), 0) DESC, COUNT(DISTINCT CASE WHEN ps.verdict = 'ACCEPTED' THEN ps.problem_id END) DESC, u.id ASC) as rank " +
            "  FROM public.users u " +
            "  LEFT JOIN public.problem_submissions ps ON u.id = ps.user_id AND (:checkDate = false OR ps.submitted_at >= :startDate) " +
            "  LEFT JOIN public.problems p ON ps.problem_id = p.id " +
            "  GROUP BY u.id" +
            ") " +
            "SELECT rank FROM leaderboard WHERE userId = :userId", nativeQuery = true)
    Integer getUserRank(@Param("userId") Integer userId, @Param("checkDate") boolean checkDate, @Param("startDate") Instant startDate);

    @Query(value = "SELECT DISTINCT CAST(ps.submitted_at AS date) " +
            "FROM public.problem_submissions ps " +
            "WHERE ps.user_id = :userId AND ps.verdict = 'ACCEPTED' " +
            "ORDER BY 1 DESC", nativeQuery = true)
    List<java.sql.Date> getAcceptedSubmissionDates(@Param("userId") Integer userId);
}
