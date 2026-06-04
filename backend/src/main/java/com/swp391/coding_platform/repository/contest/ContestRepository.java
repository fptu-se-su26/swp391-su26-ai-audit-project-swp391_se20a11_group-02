package com.swp391.coding_platform.repository.contest;

import com.swp391.coding_platform.entity.contest.ContestEntity;
import com.swp391.coding_platform.entity.enums.ContestStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ContestRepository extends JpaRepository<ContestEntity, Integer> {

    @Query("SELECT c, " +
           "(SELECT COUNT(p) FROM ContestParticipantEntity p WHERE p.contest.id = c.id), " +
           "(SELECT COUNT(cp) FROM ContestProblemEntity cp WHERE cp.contest.id = c.id) " +
           "FROM ContestEntity c WHERE " +
           "(:search IS NULL OR :search = '' OR LOWER(c.title) LIKE LOWER(CONCAT('%', :search, '%'))) AND " +
           "(:checkStatus = false OR c.status = :status) AND " +
           "(:access = 'All' OR " +
           " (:access = 'Public' AND (c.passwordHash IS NULL OR c.passwordHash = '')) OR " +
           " (:access = 'Lock' AND c.passwordHash IS NOT NULL AND c.passwordHash <> ''))")
    Page<Object[]> searchContestsWithStats(
            @Param("search") String search,
            @Param("status") ContestStatus status,
            @Param("checkStatus") boolean checkStatus,
            @Param("access") String access,
            Pageable pageable);

    @Query("SELECT COUNT(p) > 0 FROM ContestParticipantEntity p WHERE p.contest.id = :contestId AND p.user.username = :username")
    boolean isUserRegistered(@Param("contestId") Integer contestId, @Param("username") String username);

    @Query("SELECT COUNT(p) FROM ContestParticipantEntity p WHERE p.contest.id = :contestId")
    long countParticipants(@Param("contestId") Integer contestId);

    @Query("SELECT COUNT(p) FROM ContestParticipantEntity p WHERE p.user.id = :userId")
    long countUserContests(@Param("userId") Integer userId);

    @Query("SELECT COUNT(cp) FROM ContestProblemEntity cp WHERE cp.contest.id = :contestId")
    long countProblems(@Param("contestId") Integer contestId);

    @Query("SELECT c FROM ContestEntity c WHERE c.status = :status ORDER BY c.startTime DESC")
    Page<ContestEntity> findOngoingContests(@Param("status") ContestStatus status, Pageable pageable);

    @Query("SELECT c FROM ContestEntity c WHERE c.status = :status ORDER BY c.startTime ASC")
    Page<ContestEntity> findUpcomingContests(@Param("status") ContestStatus status, Pageable pageable);
}
