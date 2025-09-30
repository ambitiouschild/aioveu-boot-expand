package com.aioveu.boot.aioveuMemberAccount.controller;

import com.aioveu.boot.aioveuMemberAccount.service.AioveuMemberAccountService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuMemberAccount.model.form.AioveuMemberAccountForm;
import com.aioveu.boot.aioveuMemberAccount.model.query.AioveuMemberAccountQuery;
import com.aioveu.boot.aioveuMemberAccount.model.vo.AioveuMemberAccountVO;
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
 * 会员充值账户前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:02
 */
@Tag(name = "会员充值账户接口")
@RestController
@RequestMapping("/api/v1/aioveu-member-account")
@RequiredArgsConstructor
public class AioveuMemberAccountController  {

    private final AioveuMemberAccountService aioveuMemberAccountService;

    @Operation(summary = "会员充值账户分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuMemberAccount:aioveu-member-account:query')")
    public PageResult<AioveuMemberAccountVO> getAioveuMemberAccountPage(AioveuMemberAccountQuery queryParams ) {
        IPage<AioveuMemberAccountVO> result = aioveuMemberAccountService.getAioveuMemberAccountPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增会员充值账户")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuMemberAccount:aioveu-member-account:add')")
    public Result<Void> saveAioveuMemberAccount(@RequestBody @Valid AioveuMemberAccountForm formData ) {
        boolean result = aioveuMemberAccountService.saveAioveuMemberAccount(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取会员充值账户表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuMemberAccount:aioveu-member-account:edit')")
    public Result<AioveuMemberAccountForm> getAioveuMemberAccountForm(
        @Parameter(description = "会员充值账户ID") @PathVariable Long id
    ) {
        AioveuMemberAccountForm formData = aioveuMemberAccountService.getAioveuMemberAccountFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改会员充值账户")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuMemberAccount:aioveu-member-account:edit')")
    public Result<Void> updateAioveuMemberAccount(
            @Parameter(description = "会员充值账户ID") @PathVariable Long id,
            @RequestBody @Validated AioveuMemberAccountForm formData
    ) {
        boolean result = aioveuMemberAccountService.updateAioveuMemberAccount(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除会员充值账户")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuMemberAccount:aioveu-member-account:delete')")
    public Result<Void> deleteAioveuMemberAccounts(
        @Parameter(description = "会员充值账户ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuMemberAccountService.deleteAioveuMemberAccounts(ids);
        return Result.judge(result);
    }
}
