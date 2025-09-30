package com.aioveu.boot.aioveuLaundryOrderItem.controller;

import com.aioveu.boot.aioveuLaundryOrderItem.service.AioveuLaundryOrderItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuLaundryOrderItem.model.form.AioveuLaundryOrderItemForm;
import com.aioveu.boot.aioveuLaundryOrderItem.model.query.AioveuLaundryOrderItemQuery;
import com.aioveu.boot.aioveuLaundryOrderItem.model.vo.AioveuLaundryOrderItemVO;
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
 * 洗衣订单衣物明细前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:55
 */
@Tag(name = "洗衣订单衣物明细接口")
@RestController
@RequestMapping("/api/v1/aioveu-laundry-order-item")
@RequiredArgsConstructor
public class AioveuLaundryOrderItemController  {

    private final AioveuLaundryOrderItemService aioveuLaundryOrderItemService;

    @Operation(summary = "洗衣订单衣物明细分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryOrderItem:aioveu-laundry-order-item:query')")
    public PageResult<AioveuLaundryOrderItemVO> getAioveuLaundryOrderItemPage(AioveuLaundryOrderItemQuery queryParams ) {
        IPage<AioveuLaundryOrderItemVO> result = aioveuLaundryOrderItemService.getAioveuLaundryOrderItemPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增洗衣订单衣物明细")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuLaundryOrderItem:aioveu-laundry-order-item:add')")
    public Result<Void> saveAioveuLaundryOrderItem(@RequestBody @Valid AioveuLaundryOrderItemForm formData ) {
        boolean result = aioveuLaundryOrderItemService.saveAioveuLaundryOrderItem(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取洗衣订单衣物明细表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryOrderItem:aioveu-laundry-order-item:edit')")
    public Result<AioveuLaundryOrderItemForm> getAioveuLaundryOrderItemForm(
        @Parameter(description = "洗衣订单衣物明细ID") @PathVariable Long id
    ) {
        AioveuLaundryOrderItemForm formData = aioveuLaundryOrderItemService.getAioveuLaundryOrderItemFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改洗衣订单衣物明细")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryOrderItem:aioveu-laundry-order-item:edit')")
    public Result<Void> updateAioveuLaundryOrderItem(
            @Parameter(description = "洗衣订单衣物明细ID") @PathVariable Long id,
            @RequestBody @Validated AioveuLaundryOrderItemForm formData
    ) {
        boolean result = aioveuLaundryOrderItemService.updateAioveuLaundryOrderItem(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除洗衣订单衣物明细")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryOrderItem:aioveu-laundry-order-item:delete')")
    public Result<Void> deleteAioveuLaundryOrderItems(
        @Parameter(description = "洗衣订单衣物明细ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuLaundryOrderItemService.deleteAioveuLaundryOrderItems(ids);
        return Result.judge(result);
    }
}
