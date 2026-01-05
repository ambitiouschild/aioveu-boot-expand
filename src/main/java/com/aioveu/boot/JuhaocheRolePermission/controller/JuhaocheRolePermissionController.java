package com.aioveu.boot.JuhaocheRolePermission.controller;

import com.aioveu.boot.JuhaocheRolePermission.service.JuhaocheRolePermissionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.JuhaocheRolePermission.model.form.JuhaocheRolePermissionForm;
import com.aioveu.boot.JuhaocheRolePermission.model.query.JuhaocheRolePermissionQuery;
import com.aioveu.boot.JuhaocheRolePermission.model.vo.JuhaocheRolePermissionVO;
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
 * 角色权限关联前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:50
 */
@Tag(name = "聚好车角色权限关联接口")
@RestController
@RequestMapping("/api/v1/juhaoche-role-permission")
@RequiredArgsConstructor
public class JuhaocheRolePermissionController  {

    private final JuhaocheRolePermissionService juhaocheRolePermissionService;

    @Operation(summary = "角色权限关联分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('JuhaocheRolePermission:juhaoche-role-permission:query')")
    public PageResult<JuhaocheRolePermissionVO> getJuhaocheRolePermissionPage(JuhaocheRolePermissionQuery queryParams ) {
        IPage<JuhaocheRolePermissionVO> result = juhaocheRolePermissionService.getJuhaocheRolePermissionPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增角色权限关联")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('JuhaocheRolePermission:juhaoche-role-permission:add')")
    public Result<Void> saveJuhaocheRolePermission(@RequestBody @Valid JuhaocheRolePermissionForm formData ) {
        boolean result = juhaocheRolePermissionService.saveJuhaocheRolePermission(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取角色权限关联表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('JuhaocheRolePermission:juhaoche-role-permission:edit')")
    public Result<JuhaocheRolePermissionForm> getJuhaocheRolePermissionForm(
        @Parameter(description = "角色权限关联ID") @PathVariable Long id
    ) {
        JuhaocheRolePermissionForm formData = juhaocheRolePermissionService.getJuhaocheRolePermissionFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改角色权限关联")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('JuhaocheRolePermission:juhaoche-role-permission:edit')")
    public Result<Void> updateJuhaocheRolePermission(
            @Parameter(description = "角色权限关联ID") @PathVariable Long id,
            @RequestBody @Validated JuhaocheRolePermissionForm formData
    ) {
        boolean result = juhaocheRolePermissionService.updateJuhaocheRolePermission(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除角色权限关联")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('JuhaocheRolePermission:juhaoche-role-permission:delete')")
    public Result<Void> deleteJuhaocheRolePermissions(
        @Parameter(description = "角色权限关联ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = juhaocheRolePermissionService.deleteJuhaocheRolePermissions(ids);
        return Result.judge(result);
    }
}
