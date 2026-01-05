package com.aioveu.boot.JuhaocheMerchantStaff.controller;

import com.aioveu.boot.JuhaocheJwtUtils.JwtUtils;
import com.aioveu.boot.JuhaocheMerchant.model.entity.JuhaocheMerchant;
import com.aioveu.boot.JuhaocheMerchant.service.JuhaocheMerchantService;
import com.aioveu.boot.JuhaocheMerchantStaff.model.dto.StaffCreateDTO;
import com.aioveu.boot.JuhaocheMerchantStaff.model.entity.JuhaocheMerchantStaff;
import com.aioveu.boot.JuhaocheMerchantStaff.model.request.StaffCreateRequest;
import com.aioveu.boot.JuhaocheMerchantStaff.service.JuhaocheMerchantStaffService;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.entity.JuhaocheMerchantUserRole;
import com.aioveu.boot.JuhaocheMerchantUserRole.service.JuhaocheMerchantUserRoleService;
import com.aioveu.boot.JuhaocheRoles.model.entity.JuhaocheRoles;
import com.aioveu.boot.JuhaocheRoles.service.JuhaocheRolesService;
import com.aioveu.boot.JuhaocheUser.model.entity.JuhaocheUser;
import com.aioveu.boot.JuhaocheUser.service.JuhaocheUserService;
import com.aioveu.boot.JuhaocheUserMerchant.model.entity.JuhaocheUserMerchant;
import com.aioveu.boot.JuhaocheUserMerchant.service.JuhaocheUserMerchantService;
import com.aioveu.boot.aioveuCommon.util.NumberGenerator.IdGenerator;
import com.aioveu.boot.aioveuCommon.util.passwordEncoder.PasswordService;
import com.aioveu.boot.common.exception.BusinessException;
import lombok.RequiredArgsConstructor;
import org.apache.poi.hpsf.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.JuhaocheMerchantStaff.model.form.JuhaocheMerchantStaffForm;
import com.aioveu.boot.JuhaocheMerchantStaff.model.query.JuhaocheMerchantStaffQuery;
import com.aioveu.boot.JuhaocheMerchantStaff.model.vo.JuhaocheMerchantStaffVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.aioveu.boot.common.result.PageResult;
import com.aioveu.boot.common.result.Result;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;

import java.time.LocalDateTime;

/**
 * 商户员工信息前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:54
 */
@Tag(name = "聚好车商户员工信息接口")
@RestController
@RequestMapping("/api/v1/juhaoche-merchant-staff/{merchantId}")
@RequiredArgsConstructor
public class JuhaocheMerchantStaffController  {

    private final JuhaocheMerchantStaffService juhaocheMerchantStaffService;

    @Autowired
    private JuhaocheUserService juhaocheUserService;

    @Autowired
    private JuhaocheMerchantUserRoleService juhaocheMerchantUserRoleService;


    @Autowired
    private JuhaocheUserMerchantService juhaocheUserMerchantService;


    @Autowired
    private JuhaocheMerchantService juhaocheMerchantService;


    @Autowired
    private JuhaocheRolesService juhaocheRolesService;

    @Autowired
    private IdGenerator idGenerator;

    @Autowired
    private PasswordService passwordService;

    @Autowired
    private PasswordEncoder passwordEncoder;



    @Operation(summary = "商户员工信息分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchantStaff:juhaoche-merchant-staff:query')")
    public PageResult<JuhaocheMerchantStaffVO> getJuhaocheMerchantStaffPage(JuhaocheMerchantStaffQuery queryParams ) {
        IPage<JuhaocheMerchantStaffVO> result = juhaocheMerchantStaffService.getJuhaocheMerchantStaffPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增商户员工信息")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchantStaff:juhaoche-merchant-staff:add')")
    public Result<Void> saveJuhaocheMerchantStaff(@RequestBody @Valid JuhaocheMerchantStaffForm formData ) {
        boolean result = juhaocheMerchantStaffService.saveJuhaocheMerchantStaff(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取商户员工信息表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchantStaff:juhaoche-merchant-staff:edit')")
    public Result<JuhaocheMerchantStaffForm> getJuhaocheMerchantStaffForm(
        @Parameter(description = "商户员工信息ID") @PathVariable Long id
    ) {
        JuhaocheMerchantStaffForm formData = juhaocheMerchantStaffService.getJuhaocheMerchantStaffFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改商户员工信息")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchantStaff:juhaoche-merchant-staff:edit')")
    public Result<Void> updateJuhaocheMerchantStaff(
            @Parameter(description = "商户员工信息ID") @PathVariable Long id,
            @RequestBody @Validated JuhaocheMerchantStaffForm formData
    ) {
        boolean result = juhaocheMerchantStaffService.updateJuhaocheMerchantStaff(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除商户员工信息")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchantStaff:juhaoche-merchant-staff:delete')")
    public Result<Void> deleteJuhaocheMerchantStaffs(
        @Parameter(description = "商户员工信息ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = juhaocheMerchantStaffService.deleteJuhaocheMerchantStaffs(ids);
        return Result.judge(result);
    }


    /**
     * 创建子账号接口
     */
    @Operation(summary = "创建子账号接口")
    @PostMapping("/staff")
    public Result<StaffCreateDTO> createStaff(
            @RequestHeader("Authorization") String token,
            @PathVariable("merchantId") Long merchantId,
            @Valid @RequestBody StaffCreateRequest request) {

        // 1. 验证操作权限
        Long operatorId = JwtUtils.getUserIdFromToken(token);
        if (!juhaocheUserMerchantService.isMerchantOwner(operatorId, merchantId)) {
            throw new BusinessException("无操作权限，只有主账号可以创建子账号");
        }

        // 2. 验证商户状态
        JuhaocheMerchant merchant = juhaocheMerchantService.getByMerchantId(merchantId);
        if (merchant == null || merchant.getIsDel() == 1) {
            throw new BusinessException("商户不存在");
        }
        if (merchant.getStatus() != 1) {
            throw new BusinessException("商户状态异常，无法创建子账号");
        }

        // 3. 检查手机号是否已绑定该商户
        if (juhaocheMerchantStaffService.checkPhoneExistsInMerchant(request.getPhone(), merchantId)) {
            throw new BusinessException("该手机号已绑定当前商户");
        }

        JuhaocheUser staffUser;
        boolean isNewUser = false;

        // 4. 检查用户是否存在
        staffUser = juhaocheUserService.getByPhone(request.getPhone());
        if (staffUser == null) {
            // 创建新用户
            String initialPassword = generateInitialPassword();
            staffUser = JuhaocheUser.builder()
                    .userId(idGenerator.generateId())
                    .name(request.getRealName())
                    .phone(request.getPhone())
                    .password(passwordEncoder.encode(initialPassword))
                    .isEnable(1)
                    .createUser(operatorId)
                    .updateUser(operatorId)
                    .build();
            juhaocheUserService.save(staffUser);
            isNewUser = true;
        }

        // 5. 创建员工记录
        String staffNo = generateStaffNo(merchantId);
        JuhaocheMerchantStaff merchantStaff = JuhaocheMerchantStaff.builder()
                .userId(staffUser.getUserId())
                .merchantId(merchantId)
                .staffNo(staffNo)
                .realName(request.getRealName())
                .department(request.getDepartment())
                .position(request.getPosition())
                .workPhone(request.getPhone())
                .entryDate(LocalDateTime.now())
                .status(1) // 在职
                .isEnable(1)
                .createUser(operatorId)
                .updateUser(operatorId)
                .build();
        juhaocheMerchantStaffService.save(merchantStaff);

        // 6. 建立用户-商户关联
        JuhaocheUserMerchant userMerchant = JuhaocheUserMerchant.builder()
                .userId(staffUser.getUserId())
                .merchantId(merchantId)
                .isOwner(0) // 子账号
                .joinTime(LocalDateTime.now())
                .inviteUserId(operatorId)
                .isEnable(1)
                .createUser(operatorId)
                .updateUser(operatorId)
                .build();
        juhaocheUserMerchantService.save(userMerchant);

        // 7. 分配角色
        if (request.getRoleIds() != null && !request.getRoleIds().isEmpty()) {
            for (Long roleId : request.getRoleIds()) {
                JuhaocheRoles role = juhaocheRolesService.getById(roleId);
                if (role != null && role.getMerchantLevel() == 1) { // 只允许分配商户级角色
                    JuhaocheMerchantUserRole merchantUserRole = JuhaocheMerchantUserRole.builder()
                            .userId(staffUser.getUserId())
                            .merchantId(merchantId)
                            .roleId(roleId)
                            .isActive(1)
                            .grantTime(LocalDateTime.now())
                            .grantUserId(operatorId)
                            .isEnable(1)
                            .createUser(operatorId)
                            .updateUser(operatorId)
                            .build();
                    juhaocheMerchantUserRoleService.save(merchantUserRole);
                }
            }
        }

        // 8. 返回结果
        StaffCreateDTO result = StaffCreateDTO.builder()
                .staffId(merchantStaff.getId())
                .staffNo(staffNo)
                .realName(request.getRealName())
                .initialPassword(isNewUser ? "123456" : null) // 新用户返回初始密码
                .build();

        return Result.success(result);
    }

    private String generateStaffNo(Long merchantId) {
        String merchantCode = juhaocheMerchantService.getMerchantCode(merchantId);
        Long staffCount = juhaocheMerchantStaffService.getStaffCount(merchantId);
        return merchantCode + String.format("%03d", staffCount + 1);
    }

    private String generateInitialPassword() {
        return "123456"; // 实际项目中应该生成随机密码
    }
}
