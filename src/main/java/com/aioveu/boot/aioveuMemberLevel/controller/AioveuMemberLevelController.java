package com.aioveu.boot.aioveuMemberLevel.controller;

import com.aioveu.boot.aioveuMemberLevel.service.AioveuMemberLevelService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuMemberLevel.model.form.AioveuMemberLevelForm;
import com.aioveu.boot.aioveuMemberLevel.model.query.AioveuMemberLevelQuery;
import com.aioveu.boot.aioveuMemberLevel.model.vo.AioveuMemberLevelVO;
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
 * 会员等级前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 14:52
 */
@Tag(name = "会员等级接口")
@RestController
@RequestMapping("/api/v1/aioveu-member-level")
@RequiredArgsConstructor
public class AioveuMemberLevelController  {

    private final AioveuMemberLevelService aioveuMemberLevelService;

    @Operation(summary = "会员等级分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuMemberLevel:aioveu-member-level:query')")
    public PageResult<AioveuMemberLevelVO> getAioveuMemberLevelPage(AioveuMemberLevelQuery queryParams ) {
        IPage<AioveuMemberLevelVO> result = aioveuMemberLevelService.getAioveuMemberLevelPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增会员等级")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuMemberLevel:aioveu-member-level:add')")
    public Result<Void> saveAioveuMemberLevel(@RequestBody @Valid AioveuMemberLevelForm formData ) {
        boolean result = aioveuMemberLevelService.saveAioveuMemberLevel(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取会员等级表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuMemberLevel:aioveu-member-level:edit')")
    public Result<AioveuMemberLevelForm> getAioveuMemberLevelForm(
        @Parameter(description = "会员等级ID") @PathVariable Long id
    ) {
        AioveuMemberLevelForm formData = aioveuMemberLevelService.getAioveuMemberLevelFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改会员等级")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuMemberLevel:aioveu-member-level:edit')")
    public Result<Void> updateAioveuMemberLevel(
            @Parameter(description = "会员等级ID") @PathVariable Long id,
            @RequestBody @Validated AioveuMemberLevelForm formData
    ) {
        boolean result = aioveuMemberLevelService.updateAioveuMemberLevel(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除会员等级")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuMemberLevel:aioveu-member-level:delete')")
    public Result<Void> deleteAioveuMemberLevels(
        @Parameter(description = "会员等级ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuMemberLevelService.deleteAioveuMemberLevels(ids);
        return Result.judge(result);
    }
}
