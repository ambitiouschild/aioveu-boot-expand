package com.aioveu.boot.aioveuMemberRechargeRecord.controller;

import com.aioveu.boot.aioveuMemberRechargeRecord.service.AioveuMemberRechargeRecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.form.AioveuMemberRechargeRecordForm;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.query.AioveuMemberRechargeRecordQuery;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.vo.AioveuMemberRechargeRecordVO;
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
 * 会员充值记录前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:08
 */
@Tag(name = "会员充值记录接口")
@RestController
@RequestMapping("/api/v1/aioveu-member-recharge-record")
@RequiredArgsConstructor
public class AioveuMemberRechargeRecordController  {

    private final AioveuMemberRechargeRecordService aioveuMemberRechargeRecordService;

    @Operation(summary = "会员充值记录分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuMemberRechargeRecord:aioveu-member-recharge-record:query')")
    public PageResult<AioveuMemberRechargeRecordVO> getAioveuMemberRechargeRecordPage(AioveuMemberRechargeRecordQuery queryParams ) {
        IPage<AioveuMemberRechargeRecordVO> result = aioveuMemberRechargeRecordService.getAioveuMemberRechargeRecordPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增会员充值记录")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuMemberRechargeRecord:aioveu-member-recharge-record:add')")
    public Result<Void> saveAioveuMemberRechargeRecord(@RequestBody @Valid AioveuMemberRechargeRecordForm formData ) {
        boolean result = aioveuMemberRechargeRecordService.saveAioveuMemberRechargeRecord(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取会员充值记录表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuMemberRechargeRecord:aioveu-member-recharge-record:edit')")
    public Result<AioveuMemberRechargeRecordForm> getAioveuMemberRechargeRecordForm(
        @Parameter(description = "会员充值记录ID") @PathVariable Long id
    ) {
        AioveuMemberRechargeRecordForm formData = aioveuMemberRechargeRecordService.getAioveuMemberRechargeRecordFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改会员充值记录")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuMemberRechargeRecord:aioveu-member-recharge-record:edit')")
    public Result<Void> updateAioveuMemberRechargeRecord(
            @Parameter(description = "会员充值记录ID") @PathVariable Long id,
            @RequestBody @Validated AioveuMemberRechargeRecordForm formData
    ) {
        boolean result = aioveuMemberRechargeRecordService.updateAioveuMemberRechargeRecord(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除会员充值记录")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuMemberRechargeRecord:aioveu-member-recharge-record:delete')")
    public Result<Void> deleteAioveuMemberRechargeRecords(
        @Parameter(description = "会员充值记录ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuMemberRechargeRecordService.deleteAioveuMemberRechargeRecords(ids);
        return Result.judge(result);
    }
}
