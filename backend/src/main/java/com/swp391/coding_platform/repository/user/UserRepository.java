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
            "  u.score as points " +
            "FROM public.users u " +
            "ORDER BY u.score DESC, u.id ASC", nativeQuery = true)
    List<RankingUserProjection> getGlobalRankingList();

    @Query(value = "WITH leaderboard AS (" +
            "  SELECT " +
            "    u.id as userId, " +
            "    u.score as points, " +
            "    ROW_NUMBER() OVER (ORDER BY u.score DESC, u.id ASC) as rank " +
            "  FROM public.users u" +
            ") " +
            "SELECT rank FROM leaderboard WHERE userId = :userId", nativeQuery = true)
    Integer getUserRank(@Param("userId") Integer userId);
}
