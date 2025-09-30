package com.aioveu.boot.aioveuLaundryProcessImage.controller;

import com.aioveu.boot.aioveuLaundryProcessImage.service.AioveuLaundryProcessImageService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuLaundryProcessImage.model.form.AioveuLaundryProcessImageForm;
import com.aioveu.boot.aioveuLaundryProcessImage.model.query.AioveuLaundryProcessImageQuery;
import com.aioveu.boot.aioveuLaundryProcessImage.model.vo.AioveuLaundryProcessImageVO;
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
 * 洗衣流程图片记录前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:58
 */
@Tag(name = "洗衣流程图片记录接口")
@RestController
@RequestMapping("/api/v1/aioveu-laundry-process-image")
@RequiredArgsConstructor
public class AioveuLaundryProcessImageController  {

    private final AioveuLaundryProcessImageService aioveuLaundryProcessImageService;

    @Operation(summary = "洗衣流程图片记录分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:query')")
    public PageResult<AioveuLaundryProcessImageVO> getAioveuLaundryProcessImagePage(AioveuLaundryProcessImageQuery queryParams ) {
        IPage<AioveuLaundryProcessImageVO> result = aioveuLaundryProcessImageService.getAioveuLaundryProcessImagePage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增洗衣流程图片记录")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:add')")
    public Result<Void> saveAioveuLaundryProcessImage(@RequestBody @Valid AioveuLaundryProcessImageForm formData ) {
        boolean result = aioveuLaundryProcessImageService.saveAioveuLaundryProcessImage(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取洗衣流程图片记录表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:edit')")
    public Result<AioveuLaundryProcessImageForm> getAioveuLaundryProcessImageForm(
        @Parameter(description = "洗衣流程图片记录ID") @PathVariable Long id
    ) {
        AioveuLaundryProcessImageForm formData = aioveuLaundryProcessImageService.getAioveuLaundryProcessImageFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改洗衣流程图片记录")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:edit')")
    public Result<Void> updateAioveuLaundryProcessImage(
            @Parameter(description = "洗衣流程图片记录ID") @PathVariable Long id,
            @RequestBody @Validated AioveuLaundryProcessImageForm formData
    ) {
        boolean result = aioveuLaundryProcessImageService.updateAioveuLaundryProcessImage(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除洗衣流程图片记录")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:delete')")
    public Result<Void> deleteAioveuLaundryProcessImages(
        @Parameter(description = "洗衣流程图片记录ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuLaundryProcessImageService.deleteAioveuLaundryProcessImages(ids);
        return Result.judge(result);
    }
}
