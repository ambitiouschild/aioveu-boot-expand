package com.aioveu.boot.aioveuLaundryGarmentTracking.controller;

import com.aioveu.boot.aioveuLaundryGarmentTracking.service.AioveuLaundryGarmentTrackingService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.form.AioveuLaundryGarmentTrackingForm;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.query.AioveuLaundryGarmentTrackingQuery;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.vo.AioveuLaundryGarmentTrackingVO;
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
 * 衣物流转记录前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:35
 */
@Tag(name = "衣物流转记录接口")
@RestController
@RequestMapping("/api/v1/aioveu-laundry-garment-tracking")
@RequiredArgsConstructor
public class AioveuLaundryGarmentTrackingController  {

    private final AioveuLaundryGarmentTrackingService aioveuLaundryGarmentTrackingService;

    @Operation(summary = "衣物流转记录分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryGarmentTracking:aioveu-laundry-garment-tracking:query')")
    public PageResult<AioveuLaundryGarmentTrackingVO> getAioveuLaundryGarmentTrackingPage(AioveuLaundryGarmentTrackingQuery queryParams ) {
        IPage<AioveuLaundryGarmentTrackingVO> result = aioveuLaundryGarmentTrackingService.getAioveuLaundryGarmentTrackingPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增衣物流转记录")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuLaundryGarmentTracking:aioveu-laundry-garment-tracking:add')")
    public Result<Void> saveAioveuLaundryGarmentTracking(@RequestBody @Valid AioveuLaundryGarmentTrackingForm formData ) {
        boolean result = aioveuLaundryGarmentTrackingService.saveAioveuLaundryGarmentTracking(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取衣物流转记录表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryGarmentTracking:aioveu-laundry-garment-tracking:edit')")
    public Result<AioveuLaundryGarmentTrackingForm> getAioveuLaundryGarmentTrackingForm(
        @Parameter(description = "衣物流转记录ID") @PathVariable Long id
    ) {
        AioveuLaundryGarmentTrackingForm formData = aioveuLaundryGarmentTrackingService.getAioveuLaundryGarmentTrackingFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改衣物流转记录")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryGarmentTracking:aioveu-laundry-garment-tracking:edit')")
    public Result<Void> updateAioveuLaundryGarmentTracking(
            @Parameter(description = "衣物流转记录ID") @PathVariable Long id,
            @RequestBody @Validated AioveuLaundryGarmentTrackingForm formData
    ) {
        boolean result = aioveuLaundryGarmentTrackingService.updateAioveuLaundryGarmentTracking(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除衣物流转记录")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryGarmentTracking:aioveu-laundry-garment-tracking:delete')")
    public Result<Void> deleteAioveuLaundryGarmentTrackings(
        @Parameter(description = "衣物流转记录ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuLaundryGarmentTrackingService.deleteAioveuLaundryGarmentTrackings(ids);
        return Result.judge(result);
    }
}
