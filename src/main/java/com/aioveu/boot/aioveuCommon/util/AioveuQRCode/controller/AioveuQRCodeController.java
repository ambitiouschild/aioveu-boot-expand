package com.aioveu.boot.aioveuCommon.util.AioveuQRCode.controller;

import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model.QRCodeScanRequest;
import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.service.AioveuQRCodeService;
import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model.AioveuGarmentInfo;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.service.AioveuLaundryGarmentIdentityService;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.service.impl.AioveuGarmentInfoByCodeServiceImpl;
import com.aioveu.boot.common.result.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
/**
 * 扫描二维码获取信息的 Controller 实现方案，支持多种二维码内容格式
 *
 * @author 可我不敌可爱
 * @since 2025/10/12
 */
@Slf4j
@Tag(name = "二维码接口")
//@RestController
@Controller // 使用 @Controller 而不是 @RestController
@RequestMapping("/api/v1/QRCodes")
@RequiredArgsConstructor
public class AioveuQRCodeController {

    private final AioveuQRCodeService aioveuQRCodeService;

    @Autowired
    public AioveuLaundryGarmentIdentityService aioveuLaundryGarmentIdentityService;

    private final AioveuGarmentInfoByCodeServiceImpl aioveuGarmentInfoByCode;


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









//    @PostMapping("/garments/generate-batch")
//    @Operation(summary = " 批量生成二维码")
//    public Result<FileInfo> generateBatchGarmentCodes(
//            @Parameter(
//                    name = "file",
//                    description = "表单文件对象",
//                    required = true,
//                    in = ParameterIn.DEFAULT,
//                    schema = @Schema(name = "file", format = "binary")
//            )
//            @RequestPart(value = "file") MultipartFile file,
//            HttpServletRequest request // 添加请求对象获取协议信息
//    ) {
//        List<GarmentCodeResult> results = new ArrayList<>();
//
//        for (int i = 0; i < request.getQuantity(); i++) {
//            GarmentCodeService.GarmentCodeResult result =
//                    garmentCodeService.generateGarmentCode(request.getGarmentTypeCode());
//            results.add(result);
//        }
//
//        return Result.success(fileInfo);
//    }
//
//    @DeleteMapping
//    @Operation(summary = "文件删除")
//    @SneakyThrows
//    public Result<?> deleteFile(
//            @Parameter(description = "文件路径") @RequestParam String filePath
//    ) {
//        boolean result = fileService.deleteFile(filePath);
//        return Result.judge(result);
//    }
}
