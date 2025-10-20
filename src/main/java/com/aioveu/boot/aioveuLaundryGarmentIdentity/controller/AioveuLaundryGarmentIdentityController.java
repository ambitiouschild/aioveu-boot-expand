package com.aioveu.boot.aioveuLaundryGarmentIdentity.controller;

import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model.QRCodeScanRequest;
import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model.AioveuGarmentInfo;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.vo.AioveuGarmentIdentityOptionVO;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.service.AioveuLaundryGarmentIdentityService;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.service.impl.AioveuGarmentInfoByCodeServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
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

import java.util.List;

/**
 * 衣物唯一编码前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
@Slf4j
@Tag(name = "衣物唯一编码接口")
@RestController
@RequestMapping("/api/v1/aioveu-laundry-garment-identity")
@RequiredArgsConstructor
public class AioveuLaundryGarmentIdentityController  {

    private final AioveuLaundryGarmentIdentityService aioveuLaundryGarmentIdentityService;
    private final AioveuGarmentInfoByCodeServiceImpl aioveuGarmentInfoByCode;

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

    /**
     * 扫描二维码获取信息  前端摄像头扫描的实现
     *
     * @param request 包含二维码内容的请求  您的这个接口是一个POST接口，需要客户端（如手机APP或微信小程序）主动调用，而不能直接在浏览器中通过扫描二维码调用。
     * 当您用手机扫描二维码时，手机浏览器会尝试访问二维码中的URL（如果二维码是URL）或者显示二维码中的文本（如果二维码是纯文本）。
     * 您的二维码内容如果是纯文本（衣物编码），那么手机扫描后只会显示这个文本（衣物编码），而不会调用您的POST接口。
     * 是的，这个 /scan接口设计为需要前端调用摄像头扫描二维码后，将扫描结果（衣物编码）通过 POST 请求发送到后端。后端根据衣物编码查询数据库并返回完整的衣物信息。
     *
     *                前端摄像头扫描（推荐）
     * @return 衣物信息
     */
    @PostMapping("/scan")
    @Operation(summary = " 前端扫描二维码获取信息")
    @PreAuthorize("@ss.hasPerm('aioveuQRCode:aioveu-QRCode:scan')")
    public Result<AioveuGarmentInfo> scanQRCode(@RequestBody QRCodeScanRequest request) {
        try {
            //  1. 获取二维码内容（即衣物唯一编码）
            String garmentCode = request.getQrContent();

            // 2. 验证编码格式
            if (!isValidGarmentCode(garmentCode)) {
                return Result.failed("无效的衣物编码格式");
            }

            // 3. 查询衣物信息
            AioveuGarmentInfo garmentInfo = aioveuGarmentInfoByCode.getGarmentInfoByCode(garmentCode);

            // 4. 记录扫描日志
            logScanEvent(request, garmentCode);


            return Result.success(garmentInfo);
        } catch (Exception e) {
            log.error("二维码扫描失败: {}", request.getQrContent(), e);
            return Result.failed("二维码扫描失败: " + e.getMessage());
        }
    }

    /**
     * 验证衣物编码格式
     */
    private boolean isValidGarmentCode(String code) {
        // 根据您的编码规则实现验证逻辑
        // 示例：GAR-SHIRT-20231015-0001-5A3B
        return code != null && code.startsWith("GAR-") && code.length() > 10;
    }

    /**
     * 记录扫描日志
     */
    private void logScanEvent(QRCodeScanRequest request, String garmentCode) {
        log.info("二维码扫描事件 - 扫描者: {}, 设备: {}, 位置: {}, 衣物编码: {}",
                request.getScannerId(),
                request.getDeviceInfo(),
//                request.getLocation(),
                garmentCode);

        // 实际项目中可以将这些信息存入数据库
        // scanLogService.logScanEvent(request, garmentCode);
    }



    /**
     * 不需要前端扫描的替代方案
     * 直接访问信息页面（推荐）
     *
     * @return 衣物信息
     */
    @GetMapping("/info/{garmentCode}")
    @Operation(summary = " 手机扫描二维码获取信息")
    public String showGarmentInfo(@PathVariable String garmentCode, Model model) {
        try {
            AioveuGarmentInfo garmentInfo = aioveuGarmentInfoByCode.getGarmentInfoByCode(garmentCode);
            model.addAttribute("garmentInfo", garmentInfo);
            return "garment-info";
        } catch (Exception e) {
            model.addAttribute("error", "无法获取衣物信息: " + e.getMessage());
            return "error";
        }
    }

    /**
     * 获取列表（用于下拉选择框）
     * @return 选项列表
     */
    @Operation(summary = "获取列表（用于下拉选择框）")
    @GetMapping("/options")
    public Result<List<AioveuGarmentIdentityOptionVO>> getAllGarmentIdentityOptions() {

        List<AioveuGarmentIdentityOptionVO> departments  = aioveuLaundryGarmentIdentityService.getAllGarmentIdentityOptions();

        return Result.success(departments);
    }
}
