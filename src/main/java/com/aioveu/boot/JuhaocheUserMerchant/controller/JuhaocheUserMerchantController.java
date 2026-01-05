package com.aioveu.boot.JuhaocheUserMerchant.controller;

import com.aioveu.boot.JuhaocheJwtUtils.JwtUtils;
import com.aioveu.boot.JuhaocheMerchant.model.entity.JuhaocheMerchant;
import com.aioveu.boot.JuhaocheMerchant.service.JuhaocheMerchantService;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.entity.JuhaocheMerchantUserRole;
import com.aioveu.boot.JuhaocheMerchantUserRole.service.JuhaocheMerchantUserRoleService;
import com.aioveu.boot.JuhaocheRoles.model.dto.RolesDTO;
import com.aioveu.boot.JuhaocheRoles.model.entity.JuhaocheRoles;
import com.aioveu.boot.JuhaocheRoles.service.JuhaocheRolesService;
import com.aioveu.boot.JuhaocheUserMerchant.model.dto.UserMerchantDTO;
import com.aioveu.boot.JuhaocheUserMerchant.model.entity.JuhaocheUserMerchant;
import com.aioveu.boot.JuhaocheUserMerchant.service.JuhaocheUserMerchantService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.JuhaocheUserMerchant.model.form.JuhaocheUserMerchantForm;
import com.aioveu.boot.JuhaocheUserMerchant.model.query.JuhaocheUserMerchantQuery;
import com.aioveu.boot.JuhaocheUserMerchant.model.vo.JuhaocheUserMerchantVO;
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

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 用户-商户关联前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Tag(name = "聚好车用户-商户关联接口")
@RestController
@RequestMapping("/api/v1/juhaoche-user-merchant")
@RequiredArgsConstructor
public class JuhaocheUserMerchantController  {

    private final JuhaocheUserMerchantService juhaocheUserMerchantService;


    @Autowired
    private JuhaocheMerchantUserRoleService juhaocheMerchantUserRoleService;

    @Autowired
    private JuhaocheMerchantService juhaocheMerchantService;


    @Autowired
    private JuhaocheRolesService juhaocheRolesService;



    @Operation(summary = "用户-商户关联分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('JuhaocheUserMerchant:juhaoche-user-merchant:query')")
    public PageResult<JuhaocheUserMerchantVO> getJuhaocheUserMerchantPage(JuhaocheUserMerchantQuery queryParams ) {
        IPage<JuhaocheUserMerchantVO> result = juhaocheUserMerchantService.getJuhaocheUserMerchantPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增用户-商户关联")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('JuhaocheUserMerchant:juhaoche-user-merchant:add')")
    public Result<Void> saveJuhaocheUserMerchant(@RequestBody @Valid JuhaocheUserMerchantForm formData ) {
        boolean result = juhaocheUserMerchantService.saveJuhaocheUserMerchant(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取用户-商户关联表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('JuhaocheUserMerchant:juhaoche-user-merchant:edit')")
    public Result<JuhaocheUserMerchantForm> getJuhaocheUserMerchantForm(
        @Parameter(description = "用户-商户关联ID") @PathVariable Long id
    ) {
        JuhaocheUserMerchantForm formData = juhaocheUserMerchantService.getJuhaocheUserMerchantFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改用户-商户关联")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('JuhaocheUserMerchant:juhaoche-user-merchant:edit')")
    public Result<Void> updateJuhaocheUserMerchant(
            @Parameter(description = "用户-商户关联ID") @PathVariable Long id,
            @RequestBody @Validated JuhaocheUserMerchantForm formData
    ) {
        boolean result = juhaocheUserMerchantService.updateJuhaocheUserMerchant(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除用户-商户关联")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('JuhaocheUserMerchant:juhaoche-user-merchant:delete')")
    public Result<Void> deleteJuhaocheUserMerchants(
        @Parameter(description = "用户-商户关联ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = juhaocheUserMerchantService.deleteJuhaocheUserMerchants(ids);
        return Result.judge(result);
    }


    /**
     * 获取用户商户列表接口
     */
    @Operation(summary = "获取用户商户列表接口")
    @GetMapping("/merchants")
    public Result<List<UserMerchantDTO>> getUserMerchants(
            @RequestHeader("Authorization") String token) {

        Long userId = JwtUtils.getUserIdFromToken(token);

        // 1. 获取用户关联的商户列表
        List<JuhaocheUserMerchant> userMerchants = juhaocheUserMerchantService.getUserMerchants(userId);

        List<UserMerchantDTO> result = new ArrayList<>();

        for (JuhaocheUserMerchant userMerchant : userMerchants) {
            JuhaocheMerchant merchant = juhaocheMerchantService.getByMerchantId(userMerchant.getMerchantId());
            if (merchant == null || merchant.getIsDel() == 1 || merchant.getIsEnable() == 0) {
                continue;
            }

            // 2. 获取用户在该商户下的角色
            List<JuhaocheMerchantUserRole> userRoles = juhaocheMerchantUserRoleService.getUserRolesInMerchant(
                    userId, userMerchant.getMerchantId());

            List<RolesDTO> roleDTOs = userRoles.stream()
                    .filter(ur -> ur.getIsActive() == 1 && ur.getIsEnable() == 1)
                    .map(ur -> {
                        JuhaocheRoles role = juhaocheRolesService.getById(ur.getRoleId());
                        if (role != null && role.getIsEnable() == 1) {
                            return RolesDTO.builder()
                                    .roleId(role.getRoleId())
                                    .roleName(role.getName())
                                    .roleCode(role.getCode())
                                    .build();
                        }
                        return null;
                    })
                    .filter(Objects::nonNull)
                    .collect(Collectors.toList());

            // 3. 构建返回DTO
            UserMerchantDTO dto = UserMerchantDTO.builder()
                    .merchantId(merchant.getMerchantId())
                    .merchantName(merchant.getMerchantName())
                    .merchantCode(merchant.getMerchantCode())
                    .isOwner(userMerchant.getIsOwner() == 1)
                    .merchantStatus(merchant.getStatus())
                    .roles(roleDTOs)
                    .build();

            result.add(dto);
        }

        return Result.success(result);
    }
}
