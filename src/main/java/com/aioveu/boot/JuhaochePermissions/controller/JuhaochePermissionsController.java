package com.aioveu.boot.JuhaochePermissions.controller;

import com.aioveu.boot.JuhaochePermissions.service.JuhaochePermissionsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.JuhaochePermissions.model.form.JuhaochePermissionsForm;
import com.aioveu.boot.JuhaochePermissions.model.query.JuhaochePermissionsQuery;
import com.aioveu.boot.JuhaochePermissions.model.vo.JuhaochePermissionsVO;
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
 * 权限前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:49
 */
@Tag(name = "聚好车权限接口")
@RestController
@RequestMapping("/api/v1/juhaoche-permissions")
@RequiredArgsConstructor
public class JuhaochePermissionsController  {

    private final JuhaochePermissionsService juhaochePermissionsService;

    @Operation(summary = "权限分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('JuhaochePermissions:juhaoche-permissions:query')")
    public PageResult<JuhaochePermissionsVO> getJuhaochePermissionsPage(JuhaochePermissionsQuery queryParams ) {
        IPage<JuhaochePermissionsVO> result = juhaochePermissionsService.getJuhaochePermissionsPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增权限")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('JuhaochePermissions:juhaoche-permissions:add')")
    public Result<Void> saveJuhaochePermissions(@RequestBody @Valid JuhaochePermissionsForm formData ) {
        boolean result = juhaochePermissionsService.saveJuhaochePermissions(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取权限表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('JuhaochePermissions:juhaoche-permissions:edit')")
    public Result<JuhaochePermissionsForm> getJuhaochePermissionsForm(
        @Parameter(description = "权限ID") @PathVariable Long id
    ) {
        JuhaochePermissionsForm formData = juhaochePermissionsService.getJuhaochePermissionsFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改权限")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('JuhaochePermissions:juhaoche-permissions:edit')")
    public Result<Void> updateJuhaochePermissions(
            @Parameter(description = "权限ID") @PathVariable Long id,
            @RequestBody @Validated JuhaochePermissionsForm formData
    ) {
        boolean result = juhaochePermissionsService.updateJuhaochePermissions(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除权限")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('JuhaochePermissions:juhaoche-permissions:delete')")
    public Result<Void> deleteJuhaochePermissionss(
        @Parameter(description = "权限ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = juhaochePermissionsService.deleteJuhaochePermissionss(ids);
        return Result.judge(result);
    }
}
