package com.aioveu.boot.aioveuLaundryGarmentIdentity.controller;

import com.aioveu.boot.aioveuLaundryGarmentIdentity.service.AioveuLaundryGarmentIdentityService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.form.AioveuLaundryGarmentIdentityForm;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.query.AioveuLaundryGarmentIdentityQuery;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.vo.AioveuLaundryGarmentIdentityVO;
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
 * 衣物唯一编码前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
@Tag(name = "衣物唯一编码接口")
@RestController
@RequestMapping("/api/v1/aioveu-laundry-garment-identity")
@RequiredArgsConstructor
public class AioveuLaundryGarmentIdentityController  {

    private final AioveuLaundryGarmentIdentityService aioveuLaundryGarmentIdentityService;

    @Operation(summary = "衣物唯一编码分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryGarmentIdentity:aioveu-laundry-garment-identity:query')")
    public PageResult<AioveuLaundryGarmentIdentityVO> getAioveuLaundryGarmentIdentityPage(AioveuLaundryGarmentIdentityQuery queryParams ) {
        IPage<AioveuLaundryGarmentIdentityVO> result = aioveuLaundryGarmentIdentityService.getAioveuLaundryGarmentIdentityPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增衣物唯一编码")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuLaundryGarmentIdentity:aioveu-laundry-garment-identity:add')")
    public Result<Void> saveAioveuLaundryGarmentIdentity(@RequestBody @Valid AioveuLaundryGarmentIdentityForm formData ) {
        boolean result = aioveuLaundryGarmentIdentityService.saveAioveuLaundryGarmentIdentity(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取衣物唯一编码表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryGarmentIdentity:aioveu-laundry-garment-identity:edit')")
    public Result<AioveuLaundryGarmentIdentityForm> getAioveuLaundryGarmentIdentityForm(
        @Parameter(description = "衣物唯一编码ID") @PathVariable Long id
    ) {
        AioveuLaundryGarmentIdentityForm formData = aioveuLaundryGarmentIdentityService.getAioveuLaundryGarmentIdentityFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改衣物唯一编码")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryGarmentIdentity:aioveu-laundry-garment-identity:edit')")
    public Result<Void> updateAioveuLaundryGarmentIdentity(
            @Parameter(description = "衣物唯一编码ID") @PathVariable Long id,
            @RequestBody @Validated AioveuLaundryGarmentIdentityForm formData
    ) {
        boolean result = aioveuLaundryGarmentIdentityService.updateAioveuLaundryGarmentIdentity(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除衣物唯一编码")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryGarmentIdentity:aioveu-laundry-garment-identity:delete')")
    public Result<Void> deleteAioveuLaundryGarmentIdentitys(
        @Parameter(description = "衣物唯一编码ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuLaundryGarmentIdentityService.deleteAioveuLaundryGarmentIdentitys(ids);
        return Result.judge(result);
    }
}
