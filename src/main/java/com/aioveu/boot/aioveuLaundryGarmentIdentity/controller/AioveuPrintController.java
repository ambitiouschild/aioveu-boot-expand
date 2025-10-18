package com.aioveu.boot.aioveuLaundryGarmentIdentity.controller;


import com.aioveu.boot.aioveuCommon.util.AioveuPrint.model.*;
import com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.AioveuPrintServiceImpl;
import com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.AioveuPrintTemplateServiceImpl;
import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model.AioveuGarmentInfo;
import com.aioveu.boot.common.exception.BusinessException;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import com.aioveu.boot.common.result.Result;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 衣物类型前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
@Tag(name = "打印接口")
@RestController
@RequestMapping("/api/v1/aioveu-print")
@RequiredArgsConstructor

public class AioveuPrintController {

    private final AioveuPrintServiceImpl aioveuPrintService;

    private final  AioveuPrintTemplateServiceImpl aioveuPrintTemplateService;

    /**
     * 单个二维码打印
     */
    @Operation(summary = "单个二维码打印")
    @PostMapping("/single")
    @PreAuthorize("@ss.hasPerm('aioveuPrint:aioveu-print:print')")
    public Result<AioveuPrintResponse> printSingle(@RequestBody AioveuPrintRequest request) {
        AioveuPrintResponse response = aioveuPrintService.printSingleQrCode(request);
        return Result.success(response);
    }

    /**
     * 批量二维码打印
     */
    @Operation(summary = "批量二维码打印")
    @PostMapping("/batch")
    @PreAuthorize("@ss.hasPerm('aioveuPrint:aioveu-print:batchPrint')")
    public Result<AioveuPrintResponse> printBatch(@RequestBody AioveuPrintRequest request) {
        AioveuPrintResponse response = aioveuPrintService.printBatchQrCodes(request);
        return Result.success(response);
    }

    /**
     * 获取打印预览
     */
    @Operation(summary = "获取打印预览")
    @GetMapping("/preview/{printId}")
    @PreAuthorize("@ss.hasPerm('aioveuPrint:aioveu-print:preview')")
    public void getPrintPreview(@PathVariable String printId, HttpServletResponse response) {

        aioveuPrintService.getPrintPreview(printId, response);
    }

    /**
     * 获取打印状态
     */
    @Operation(summary = "获取打印状态")
    @GetMapping("/status/{printId}")
    @PreAuthorize("@ss.hasPerm('aioveuPrint:aioveu-print:status')")
    public Result<AioveuPrintStatusVO> getPrintStatus(@PathVariable String printId) {
        AioveuPrintStatusVO statusVO = aioveuPrintService.getPrintStatus(printId);
        return Result.success(statusVO);
    }
    /**
     * 取消打印任务
     *
     * @param printId 打印任务ID
     * @return 操作结果
     */

    @Operation(summary = "取消打印任务")
    @PutMapping("/cancel/{printId}")
    @PreAuthorize("@ss.hasPerm('aioveuPrint:aioveu-print:cancel')")
    public Result<Void> cancelPrintJob(@PathVariable String printId) {
        aioveuPrintService.cancelPrintJob(printId);
        return Result.success();
    }

    @Operation(summary = "执行打印任务")
    @PostMapping("/execute/{printId}")
    @PreAuthorize("@ss.hasPerm('aioveuPrint:aioveu-print:execute')")
    public Result<Void> executePrint(@PathVariable String printId) {
        aioveuPrintService.executePrint(printId);
        return Result.success();
    }




    @Operation(summary = "模板预览功能")
    @GetMapping("/template/preview/{templateName}")
    @PreAuthorize("@ss.hasPerm('aioveuPrint:aioveu-print:template')")
    public void previewTemplate(@PathVariable String templateName, HttpServletResponse response) {
        AivoeuPrintTemplate template = aioveuPrintTemplateService.getTemplate(templateName);

        // 创建示例数据
        AioveuGarmentInfo garment = new AioveuGarmentInfo();
        garment.setGarmentCode("GAR-20251017-0001-48FC");
        garment.setGarmentType("羽绒服");
        garment.setOperationType(1);
        garment.setCreateTime(LocalDateTime.now());

        String qrCodeImageUrl = "http://localhost:9000/aioveu/qrcodes/1760200075746_50000471.png";


//        // 创建格式化器
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//        String printTime = LocalDateTime.now().format(formatter);
        // 生成预览内容

        //在预览接口中，您使用的是硬编码的参数，并且这些参数中不包含需要格式化的部分，所以不会出错。
        // 而在实际打印服务中，参数是从数据库获取的，可能某个参数中包含了%符号，并且这个参数在格式化时被当作格式字符串的一部分，导致错误。
//        硬编码值的特殊性
//        虽然看起来与实际数据相同，但在 Java 字符串中，%符号不会被解释为格式符，因为：
//        1.它是作为字符串字面量传递的
//        2.它没有被包含在格式字符串中
//        3.String.format()只解析第一个参数（模板字符串）中的格式符
        String htmlContent = String.format(template.getSingleTemplate(),
                "http://localhost:9000/aioveu/qrcodes/1760692693602_-344834629.png",
                "GAR-20251017-0001-48FC",
                "羽绒服",
                "送厂清洗",
                "2025-10-17 17:18:14",
                "2025-10-18",
                "2025-10-18 06:37:11");


        // 添加HTML头部
        String fullHtml = "<!DOCTYPE html><html><head><style>" + template.getCss() + "</style></head><body>" + htmlContent + "</body></html>";

        try {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(fullHtml);
        } catch (IOException e) {
            throw new BusinessException("生成模板预览失败", e);
        }
    }



}
