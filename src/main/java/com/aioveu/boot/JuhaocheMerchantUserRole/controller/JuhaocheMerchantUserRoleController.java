package com.aioveu.boot.JuhaocheMerchantUserRole.controller;

import com.aioveu.boot.JuhaocheMerchantUserRole.service.JuhaocheMerchantUserRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.form.JuhaocheMerchantUserRoleForm;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.query.JuhaocheMerchantUserRoleQuery;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.vo.JuhaocheMerchantUserRoleVO;
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

/**
 * 商户用户角色前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:53
 */
@Tag(name = "聚好车商户用户角色接口")
@RestController
@RequestMapping("/api/v1/juhaoche-merchant-user-role")
@RequiredArgsConstructor
public class JuhaocheMerchantUserRoleController  {

    private final JuhaocheMerchantUserRoleService juhaocheMerchantUserRoleService;

    @Operation(summary = "商户用户角色分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchantUserRole:juhaoche-merchant-user-role:query')")
    public PageResult<JuhaocheMerchantUserRoleVO> getJuhaocheMerchantUserRolePage(JuhaocheMerchantUserRoleQuery queryParams ) {
        IPage<JuhaocheMerchantUserRoleVO> result = juhaocheMerchantUserRoleService.getJuhaocheMerchantUserRolePage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增商户用户角色")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchantUserRole:juhaoche-merchant-user-role:add')")
    public Result<Void> saveJuhaocheMerchantUserRole(@RequestBody @Valid JuhaocheMerchantUserRoleForm formData ) {
        boolean result = juhaocheMerchantUserRoleService.saveJuhaocheMerchantUserRole(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取商户用户角色表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchantUserRole:juhaoche-merchant-user-role:edit')")
    public Result<JuhaocheMerchantUserRoleForm> getJuhaocheMerchantUserRoleForm(
        @Parameter(description = "商户用户角色ID") @PathVariable Long id
    ) {
        JuhaocheMerchantUserRoleForm formData = juhaocheMerchantUserRoleService.getJuhaocheMerchantUserRoleFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改商户用户角色")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchantUserRole:juhaoche-merchant-user-role:edit')")
    public Result<Void> updateJuhaocheMerchantUserRole(
            @Parameter(description = "商户用户角色ID") @PathVariable Long id,
            @RequestBody @Validated JuhaocheMerchantUserRoleForm formData
    ) {
        boolean result = juhaocheMerchantUserRoleService.updateJuhaocheMerchantUserRole(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除商户用户角色")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchantUserRole:juhaoche-merchant-user-role:delete')")
    public Result<Void> deleteJuhaocheMerchantUserRoles(
        @Parameter(description = "商户用户角色ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = juhaocheMerchantUserRoleService.deleteJuhaocheMerchantUserRoles(ids);
        return Result.judge(result);
    }
}
