package com.aioveu.boot.aioveuLaundryOrder.controller;

import com.aioveu.boot.aioveuLaundryOrder.service.AioveuLaundryOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuLaundryOrder.model.form.AioveuLaundryOrderForm;
import com.aioveu.boot.aioveuLaundryOrder.model.query.AioveuLaundryOrderQuery;
import com.aioveu.boot.aioveuLaundryOrder.model.vo.AioveuLaundryOrderVO;
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
 * 洗衣订单前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:43
 */
@Tag(name = "洗衣订单接口")
@RestController
@RequestMapping("/api/v1/aioveu-laundry-order")
@RequiredArgsConstructor
public class AioveuLaundryOrderController  {

    private final AioveuLaundryOrderService aioveuLaundryOrderService;

    @Operation(summary = "洗衣订单分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryOrder:aioveu-laundry-order:query')")
    public PageResult<AioveuLaundryOrderVO> getAioveuLaundryOrderPage(AioveuLaundryOrderQuery queryParams ) {
        IPage<AioveuLaundryOrderVO> result = aioveuLaundryOrderService.getAioveuLaundryOrderPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增洗衣订单")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuLaundryOrder:aioveu-laundry-order:add')")
    public Result<Void> saveAioveuLaundryOrder(@RequestBody @Valid AioveuLaundryOrderForm formData ) {
        boolean result = aioveuLaundryOrderService.saveAioveuLaundryOrder(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取洗衣订单表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryOrder:aioveu-laundry-order:edit')")
    public Result<AioveuLaundryOrderForm> getAioveuLaundryOrderForm(
        @Parameter(description = "洗衣订单ID") @PathVariable Long id
    ) {
        AioveuLaundryOrderForm formData = aioveuLaundryOrderService.getAioveuLaundryOrderFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改洗衣订单")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryOrder:aioveu-laundry-order:edit')")
    public Result<Void> updateAioveuLaundryOrder(
            @Parameter(description = "洗衣订单ID") @PathVariable Long id,
            @RequestBody @Validated AioveuLaundryOrderForm formData
    ) {
        boolean result = aioveuLaundryOrderService.updateAioveuLaundryOrder(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除洗衣订单")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryOrder:aioveu-laundry-order:delete')")
    public Result<Void> deleteAioveuLaundryOrders(
        @Parameter(description = "洗衣订单ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuLaundryOrderService.deleteAioveuLaundryOrders(ids);
        return Result.judge(result);
    }
}
