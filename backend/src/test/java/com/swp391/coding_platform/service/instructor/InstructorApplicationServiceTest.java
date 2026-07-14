package com.swp391.coding_platform.service.instructor;

import com.swp391.coding_platform.dto.request.ApproveApplicationRequest;
import com.swp391.coding_platform.dto.request.InstructorApplyRequest;
import com.swp391.coding_platform.dto.response.InstructorApplicationResponse;
import com.swp391.coding_platform.entity.auth.RoleEntity;
import com.swp391.coding_platform.entity.enums.InstructorAppStatus;
import com.swp391.coding_platform.entity.enums.RoleName;
import com.swp391.coding_platform.entity.instructor.InstructorApplicationEntity;
import com.swp391.coding_platform.entity.user.UserEntity;
import com.swp391.coding_platform.exception.AppException;
import com.swp391.coding_platform.repository.auth.RoleRepository;
import com.swp391.coding_platform.repository.instructor.InstructorApplicationRepository;
import com.swp391.coding_platform.repository.instructor.InstructorRepository;
import com.swp391.coding_platform.repository.payment.WalletRepository;
import com.swp391.coding_platform.repository.user.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.HashSet;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class InstructorApplicationServiceTest {

    @Mock
    private InstructorApplicationRepository applicationRepository;

    @Mock
    private UserRepository userRepository;

    @Mock
    private RoleRepository roleRepository;

    @Mock
    private InstructorRepository instructorRepository;

    @Mock
    private WalletRepository walletRepository;

    @InjectMocks
    private InstructorApplicationService applicationService;

    @Test
    void apply_UserNotFound_ShouldThrowException() {
        when(userRepository.findById(1)).thenReturn(Optional.empty());

        InstructorApplyRequest request = new InstructorApplyRequest();
        assertThrows(AppException.class, () -> applicationService.apply(1, request));
    }

    @Test
    void apply_UserAlreadyInstructor_ShouldThrowException() {
        UserEntity user = new UserEntity();
        RoleEntity role = new RoleEntity();
        role.setName(RoleName.INSTRUCTOR);
        HashSet<RoleEntity> roles = new HashSet<>();
        roles.add(role);
        user.setRoles(roles);

        when(userRepository.findById(1)).thenReturn(Optional.of(user));

        InstructorApplyRequest request = new InstructorApplyRequest();
        assertThrows(AppException.class, () -> applicationService.apply(1, request));
    }

    @Test
    void approveApplication_ShouldApprove() {
        InstructorApplicationEntity app = new InstructorApplicationEntity();
        app.setId(1);
        app.setStatus(InstructorAppStatus.PENDING);
        app.setIntroduction("intro");
        
        UserEntity user = new UserEntity();
        user.setId(10);
        user.setUsername("testuser");
        user.setRoles(new HashSet<>());
        app.setUser(user);

        when(applicationRepository.findById(1)).thenReturn(Optional.of(app));
        when(applicationRepository.save(any())).thenReturn(app);
        
        RoleEntity role = new RoleEntity();
        role.setName(RoleName.INSTRUCTOR);
        when(roleRepository.findByName(RoleName.INSTRUCTOR)).thenReturn(Optional.of(role));

        ApproveApplicationRequest req = new ApproveApplicationRequest();
        req.setStatus("APPROVED");
        req.setAdminNote("Looks good");

        InstructorApplicationResponse res = applicationService.approveApplication(1, req);

        assertEquals("APPROVED", res.getStatus());
        verify(userRepository, times(1)).save(user);
        verify(instructorRepository, times(1)).save(any());
        verify(walletRepository, times(1)).save(any());
    }
}
