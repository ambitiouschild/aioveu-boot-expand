package com.aioveu.boot.aioveuMember.controller;

import com.aioveu.boot.aioveuMember.service.AioveuMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuMember.model.form.AioveuMemberForm;
import com.aioveu.boot.aioveuMember.model.query.AioveuMemberQuery;
import com.aioveu.boot.aioveuMember.model.vo.AioveuMemberVO;
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
 * 会员信息管理前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 15:55
 */
@Tag(name = "会员信息管理接口")
@RestController
@RequestMapping("/api/v1/aioveu-member")
@RequiredArgsConstructor
public class AioveuMemberController  {

    private final AioveuMemberService aioveuMemberService;

    @Operation(summary = "会员信息管理分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuMember:aioveu-member:query')")
    public PageResult<AioveuMemberVO> getAioveuMemberPage(AioveuMemberQuery queryParams ) {
        IPage<AioveuMemberVO> result = aioveuMemberService.getAioveuMemberPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增会员信息管理")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuMember:aioveu-member:add')")
    public Result<Void> saveAioveuMember(@RequestBody @Valid AioveuMemberForm formData ) {
        boolean result = aioveuMemberService.saveAioveuMember(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取会员信息管理表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuMember:aioveu-member:edit')")
    public Result<AioveuMemberForm> getAioveuMemberForm(
        @Parameter(description = "会员信息管理ID") @PathVariable Long id
    ) {
        AioveuMemberForm formData = aioveuMemberService.getAioveuMemberFormData(id);

        return Result.success(formData);
    }

    @Operation(summary = "修改会员信息管理")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuMember:aioveu-member:edit')")
    public Result<Void> updateAioveuMember(
            @Parameter(description = "会员信息管理ID") @PathVariable Long id,
            @RequestBody @Validated AioveuMemberForm formData
    ) {
        boolean result = aioveuMemberService.updateAioveuMember(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除会员信息管理")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuMember:aioveu-member:delete')")
    public Result<Void> deleteAioveuMembers(
        @Parameter(description = "会员信息管理ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuMemberService.deleteAioveuMembers(ids);
        return Result.judge(result);
    }
}
