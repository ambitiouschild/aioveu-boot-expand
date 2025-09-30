package com.aioveu.boot.aioveuLaundryClothingType.controller;

import com.aioveu.boot.aioveuLaundryClothingType.service.AioveuLaundryClothingTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuLaundryClothingType.model.form.AioveuLaundryClothingTypeForm;
import com.aioveu.boot.aioveuLaundryClothingType.model.query.AioveuLaundryClothingTypeQuery;
import com.aioveu.boot.aioveuLaundryClothingType.model.vo.AioveuLaundryClothingTypeVO;
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
 * 衣物类型前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
@Tag(name = "衣物类型接口")
@RestController
@RequestMapping("/api/v1/aioveu-laundry-clothing-type")
@RequiredArgsConstructor
public class AioveuLaundryClothingTypeController  {

    private final AioveuLaundryClothingTypeService aioveuLaundryClothingTypeService;

    @Operation(summary = "衣物类型分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryClothingType:aioveu-laundry-clothing-type:query')")
    public PageResult<AioveuLaundryClothingTypeVO> getAioveuLaundryClothingTypePage(AioveuLaundryClothingTypeQuery queryParams ) {
        IPage<AioveuLaundryClothingTypeVO> result = aioveuLaundryClothingTypeService.getAioveuLaundryClothingTypePage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增衣物类型")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuLaundryClothingType:aioveu-laundry-clothing-type:add')")
    public Result<Void> saveAioveuLaundryClothingType(@RequestBody @Valid AioveuLaundryClothingTypeForm formData ) {
        boolean result = aioveuLaundryClothingTypeService.saveAioveuLaundryClothingType(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取衣物类型表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryClothingType:aioveu-laundry-clothing-type:edit')")
    public Result<AioveuLaundryClothingTypeForm> getAioveuLaundryClothingTypeForm(
        @Parameter(description = "衣物类型ID") @PathVariable Long id
    ) {
        AioveuLaundryClothingTypeForm formData = aioveuLaundryClothingTypeService.getAioveuLaundryClothingTypeFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改衣物类型")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryClothingType:aioveu-laundry-clothing-type:edit')")
    public Result<Void> updateAioveuLaundryClothingType(
            @Parameter(description = "衣物类型ID") @PathVariable Long id,
            @RequestBody @Validated AioveuLaundryClothingTypeForm formData
    ) {
        boolean result = aioveuLaundryClothingTypeService.updateAioveuLaundryClothingType(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除衣物类型")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryClothingType:aioveu-laundry-clothing-type:delete')")
    public Result<Void> deleteAioveuLaundryClothingTypes(
        @Parameter(description = "衣物类型ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuLaundryClothingTypeService.deleteAioveuLaundryClothingTypes(ids);
        return Result.judge(result);
    }
}
