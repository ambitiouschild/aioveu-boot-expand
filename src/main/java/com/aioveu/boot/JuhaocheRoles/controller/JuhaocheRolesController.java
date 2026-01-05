package com.aioveu.boot.JuhaocheRoles.controller;

import com.aioveu.boot.JuhaocheRoles.service.JuhaocheRolesService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.JuhaocheRoles.model.form.JuhaocheRolesForm;
import com.aioveu.boot.JuhaocheRoles.model.query.JuhaocheRolesQuery;
import com.aioveu.boot.JuhaocheRoles.model.vo.JuhaocheRolesVO;
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
 * 角色前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:48
 */
@Tag(name = "聚好车角色接口")
@RestController
@RequestMapping("/api/v1/juhaoche-roles")
@RequiredArgsConstructor
public class JuhaocheRolesController  {

    private final JuhaocheRolesService juhaocheRolesService;

    @Operation(summary = "角色分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('JuhaocheRoles:juhaoche-roles:query')")
    public PageResult<JuhaocheRolesVO> getJuhaocheRolesPage(JuhaocheRolesQuery queryParams ) {
        IPage<JuhaocheRolesVO> result = juhaocheRolesService.getJuhaocheRolesPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增角色")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('JuhaocheRoles:juhaoche-roles:add')")
    public Result<Void> saveJuhaocheRoles(@RequestBody @Valid JuhaocheRolesForm formData ) {
        boolean result = juhaocheRolesService.saveJuhaocheRoles(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取角色表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('JuhaocheRoles:juhaoche-roles:edit')")
    public Result<JuhaocheRolesForm> getJuhaocheRolesForm(
        @Parameter(description = "角色ID") @PathVariable Long id
    ) {
        JuhaocheRolesForm formData = juhaocheRolesService.getJuhaocheRolesFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改角色")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('JuhaocheRoles:juhaoche-roles:edit')")
    public Result<Void> updateJuhaocheRoles(
            @Parameter(description = "角色ID") @PathVariable Long id,
            @RequestBody @Validated JuhaocheRolesForm formData
    ) {
        boolean result = juhaocheRolesService.updateJuhaocheRoles(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除角色")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('JuhaocheRoles:juhaoche-roles:delete')")
    public Result<Void> deleteJuhaocheRoless(
        @Parameter(description = "角色ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = juhaocheRolesService.deleteJuhaocheRoless(ids);
        return Result.judge(result);
    }
}
