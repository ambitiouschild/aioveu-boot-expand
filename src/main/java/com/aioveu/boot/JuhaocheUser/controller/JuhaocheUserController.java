package com.aioveu.boot.JuhaocheUser.controller;

import com.aioveu.boot.JuhaocheUser.service.JuhaocheUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.JuhaocheUser.model.form.JuhaocheUserForm;
import com.aioveu.boot.JuhaocheUser.model.query.JuhaocheUserQuery;
import com.aioveu.boot.JuhaocheUser.model.vo.JuhaocheUserVO;
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
 * 用户前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:45
 */
@Tag(name = "聚好车用户接口")
@RestController
@RequestMapping("/api/v1/juhaoche-user")
@RequiredArgsConstructor
public class JuhaocheUserController  {

    private final JuhaocheUserService juhaocheUserService;

    @Operation(summary = "用户分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('JuhaocheUser:juhaoche-user:query')")
    public PageResult<JuhaocheUserVO> getJuhaocheUserPage(JuhaocheUserQuery queryParams ) {
        IPage<JuhaocheUserVO> result = juhaocheUserService.getJuhaocheUserPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增用户")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('JuhaocheUser:juhaoche-user:add')")
    public Result<Void> saveJuhaocheUser(@RequestBody @Valid JuhaocheUserForm formData ) {
        boolean result = juhaocheUserService.saveJuhaocheUser(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取用户表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('JuhaocheUser:juhaoche-user:edit')")
    public Result<JuhaocheUserForm> getJuhaocheUserForm(
        @Parameter(description = "用户ID") @PathVariable Long id
    ) {
        JuhaocheUserForm formData = juhaocheUserService.getJuhaocheUserFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改用户")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('JuhaocheUser:juhaoche-user:edit')")
    public Result<Void> updateJuhaocheUser(
            @Parameter(description = "用户ID") @PathVariable Long id,
            @RequestBody @Validated JuhaocheUserForm formData
    ) {
        boolean result = juhaocheUserService.updateJuhaocheUser(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除用户")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('JuhaocheUser:juhaoche-user:delete')")
    public Result<Void> deleteJuhaocheUsers(
        @Parameter(description = "用户ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = juhaocheUserService.deleteJuhaocheUsers(ids);
        return Result.judge(result);
    }
}
