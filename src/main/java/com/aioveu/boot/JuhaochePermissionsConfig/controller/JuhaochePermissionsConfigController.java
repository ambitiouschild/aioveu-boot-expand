package com.aioveu.boot.JuhaochePermissionsConfig.controller;

import com.aioveu.boot.JuhaochePermissionsConfig.service.JuhaochePermissionsConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.JuhaochePermissionsConfig.model.form.JuhaochePermissionsConfigForm;
import com.aioveu.boot.JuhaochePermissionsConfig.model.query.JuhaochePermissionsConfigQuery;
import com.aioveu.boot.JuhaochePermissionsConfig.model.vo.JuhaochePermissionsConfigVO;
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
 * 权限配置前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:51
 */
@Tag(name = "聚好车权限配置接口")
@RestController
@RequestMapping("/api/v1/juhaoche-permissions-config")
@RequiredArgsConstructor
public class JuhaochePermissionsConfigController  {

    private final JuhaochePermissionsConfigService juhaochePermissionsConfigService;

    @Operation(summary = "权限配置分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('JuhaochePermissionsConfig:juhaoche-permissions-config:query')")
    public PageResult<JuhaochePermissionsConfigVO> getJuhaochePermissionsConfigPage(JuhaochePermissionsConfigQuery queryParams ) {
        IPage<JuhaochePermissionsConfigVO> result = juhaochePermissionsConfigService.getJuhaochePermissionsConfigPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增权限配置")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('JuhaochePermissionsConfig:juhaoche-permissions-config:add')")
    public Result<Void> saveJuhaochePermissionsConfig(@RequestBody @Valid JuhaochePermissionsConfigForm formData ) {
        boolean result = juhaochePermissionsConfigService.saveJuhaochePermissionsConfig(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取权限配置表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('JuhaochePermissionsConfig:juhaoche-permissions-config:edit')")
    public Result<JuhaochePermissionsConfigForm> getJuhaochePermissionsConfigForm(
        @Parameter(description = "权限配置ID") @PathVariable Long id
    ) {
        JuhaochePermissionsConfigForm formData = juhaochePermissionsConfigService.getJuhaochePermissionsConfigFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改权限配置")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('JuhaochePermissionsConfig:juhaoche-permissions-config:edit')")
    public Result<Void> updateJuhaochePermissionsConfig(
            @Parameter(description = "权限配置ID") @PathVariable Long id,
            @RequestBody @Validated JuhaochePermissionsConfigForm formData
    ) {
        boolean result = juhaochePermissionsConfigService.updateJuhaochePermissionsConfig(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除权限配置")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('JuhaochePermissionsConfig:juhaoche-permissions-config:delete')")
    public Result<Void> deleteJuhaochePermissionsConfigs(
        @Parameter(description = "权限配置ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = juhaochePermissionsConfigService.deleteJuhaochePermissionsConfigs(ids);
        return Result.judge(result);
    }
}
