package com.aioveu.boot.aioveuCommon.util.AioveuPrint.service;

import com.aioveu.boot.aioveuCommon.util.AioveuPrint.model.*;
import com.aioveu.boot.aioveuCommon.util.NumberGenerator.NoGenerator;
import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model.AioveuGarmentInfo;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.service.impl.AioveuGarmentInfoByCodeServiceImpl;
import com.aioveu.boot.common.exception.BusinessException;
import com.aioveu.boot.system.model.vo.DictItemOptionVO;
import com.aioveu.boot.system.service.DictItemService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;

/**
 * 打印服务实现类
 * 后端只负责生成打印内容（HTML），前端负责调用浏览器打印功能
 *
 *  由于时间有限，我们先实现生成HTML和预览功能，物理打印可以由前端调用浏览器的打印功能完成。
 *  根据需求，我们需要更改实现：后端只负责生成打印内容（HTML），然后返回给前端，由前端调用浏览器打印功能完成实际打印
 *  我们将移除与物理打印相关的代码（如调用打印机），只保留生成HTML和保存为文件的功能（用于预览）。
 *  我们将提供一个预览接口，让前端可以加载生成的HTML内容。
 *  修改点：
 * 移除物理打印相关的代码（sendToPrinter方法）
 * 在打印任务执行中，只生成HTML并保存，不调用打印机
 * 将打印任务状态更新为完成（因为生成HTML即视为完成）
 * 提供一个预览方法，用于返回生成的HTML内容
 * 注意：由于我们不再进行物理打印，因此打印任务的状态将简化为：生成HTML成功或失败。
 *
 * 我们将添加一个预览控制器，用于返回生成的HTML文件。
 *
 *
 * 调用情况：
 *  1.单个二维码打印 printSingleQrCode  --> 2.生成打印内容 generatePrintContent  --> 3.生成打印HTML内容 generatePrintHtml
 *  --> 4.1 生成单个二维码HTML generateSingleQrCodeHtml
 *  --> 4.2 生成批量二维码HTML generateBatchQrCodesHtml
 *
 *
 * @author 可我不敌可爱
 * @since 2025-10-17 19:06
 */


@Slf4j
@Service
@RequiredArgsConstructor

public class AioveuPrintServiceImpl {

    private final AioveuGarmentInfoByCodeServiceImpl aioveuGarmentInfoByCodeService;
    private final AioveuPrintTemplateServiceImpl aivoeuPrintTemplateService;

    private final NoGenerator noGenerator;

    private final AioveuPrintTemplateServiceImpl aioveuPrintTemplateService;

    // 打印任务缓存  存储打印任务
    private final Map<String, AioveuPrintJob> printJobs = new ConcurrentHashMap<>();

    // 存储异步任务
    private final Map<String, Future<?>> asyncTasks = new ConcurrentHashMap<>();

    // 线程池
    private final ExecutorService executor = Executors.newCachedThreadPool();

    private final AioveuPrintTemplateServiceImpl aioveuPrintTemplateServiceImpl;

    private final DictItemService dictItemService;

    /**
     * 单个二维码打印
     */
    public AioveuPrintResponse printSingleQrCode(AioveuPrintRequest request) {
        try {
            // 验证二维码是否存在
            AioveuGarmentInfo garment = aioveuGarmentInfoByCodeService.getGarmentInfoByCode(request.getQrCode());
            if (garment == null) {
                throw new BusinessException("未找到对应的衣物信息");
            }

            // 生成打印任务
            String printId = noGenerator.generatePrintId();
            AioveuPrintJob job = new AioveuPrintJob(printId, Collections.singletonList(request.getQrCode()), request);
            job.setStatus(AioveuPrintStatus.PENDING);
            job.setTotal(1);
            printJobs.put(printId, job);

//            // 异步执行打印
//            CompletableFuture.runAsync(() -> generatePrintContent(job));

            // 异步执行打印
            Future<?> task = executor.submit(() -> {
                try {
                    generatePrintContent(job);
                } catch (Exception e) {
                    log.error("打印任务执行失败", e);
                    job.setStatus(AioveuPrintStatus.FAILED);
                    job.setErrorMessage(e.getMessage());
                }
            });

            // 注册任务
            addPrintJob(job, task);

            return AioveuPrintResponse.builder()
                    .success(true)
                    .message("打印任务已提交")
                    .printId(printId)
                    .total(1)
                    .previewUrl("/api/v1/aioveu-print/preview/" + printId)
                    .build();

        } catch (Exception e) {
            return AioveuPrintResponse.builder()
                    .success(false)
                    .message("打印失败: " + e.getMessage())
                    .build();
        }
    }

//    /**
//     * 具体打印任务类  打印服务是基于生成HTML内容，然后由浏览器打印，而不是直接使用AWT打印，因此我们的实现可能只是一个适配器，将打印任务转换为HTML生成和保存。
//     */
//    public class ConcretePrintJob extends PrintJob {
//        public ConcretePrintJob(String printId, List<String> qrCodes, AioveuPrintRequest request) {
//            super(printId, qrCodes, request);
//        }
//    }

    /**
     * 批量二维码打印
     */
    public AioveuPrintResponse printBatchQrCodes(AioveuPrintRequest request) {
        try {
            // 验证二维码列表
            if (request.getQrCodes() == null || request.getQrCodes().isEmpty()) {
                throw new BusinessException("请选择要打印的二维码");
            }

            // 限制批量打印数量
            if (request.getQrCodes().size() > 100) {
                throw new BusinessException("单次批量打印不能超过100个二维码");
            }

            // 验证所有二维码是否存在
            List<AioveuGarmentInfo> garments = aioveuGarmentInfoByCodeService.getGarmentsByQrCodes(request.getQrCodes());
            if (garments.size() != request.getQrCodes().size()) {
                throw new BusinessException("部分二维码对应的衣物信息不存在");
            }

            // 生成打印任务
            String printId = noGenerator.generatePrintId();
            AioveuPrintJob job = new AioveuPrintJob(printId, request.getQrCodes(), request);
            printJobs.put(printId, job);

            // 异步执行打印
            //我们已经将打印任务执行改为了生成打印内容，并将方法名改为 generatePrintContent。
//            CompletableFuture.runAsync(() -> generatePrintContent(job));

            // 异步执行打印
            Future<?> task = executor.submit(() -> {
                try {
                    generatePrintContent(job);
                } catch (Exception e) {
                    log.error("打印任务执行失败", e);
                    job.setStatus(AioveuPrintStatus.FAILED);
                    job.setErrorMessage(e.getMessage());
                }
            });

            // 注册任务
            addPrintJob(job, task);

            return AioveuPrintResponse.builder()
                    .success(true)
                    .message("批量打印任务已提交")
                    .printId(printId)
                    .total(request.getQrCodes().size())
                    .previewUrl("/api/print/preview/" + printId)
                    .build();

        } catch (Exception e) {
            return AioveuPrintResponse.builder()
                    .success(false)
                    .message("批量打印失败: " + e.getMessage())
                    .build();
        }
    }

    /**
     * 生成打印内容
     * 问题在于在生成打印内容的方法中，无论生成是否成功，最后都将状态设置为 COMPLETED。
     * 但实际上，只有在生成成功时才应该设置为 COMPLETED，如果出现异常，则应该设置为 FAILED。
     */
    private void generatePrintContent(AioveuPrintJob job) {
        try {
            // 正在生成打印内容
            job.setStatus(AioveuPrintStatus.GENERATING);
            job.setStartTime(LocalDateTime.now());

            // 记录开始时间
            log.info("开始生成打印任务 {} 的内容", job.getPrintId());

            // 生成打印内容
            String htmlContent = generatePrintHtml(job);
            job.setHtmlContent(htmlContent);


            // 只有在没有异常的情况下才设置为 COMPLETED // 内容生成完成，但尚未打印
            job.setStatus(AioveuPrintStatus.GENERATED);
            job.setEndTime(LocalDateTime.now());

            log.info("打印任务 {} 内容生成完成", job.getPrintId());
            log.info("打印任务 {} 内容生成完成m, 状态 {} ", job.getPrintId(), job.getStatus());

        } catch (Exception e) {
            job.setStatus(AioveuPrintStatus.FAILED);
            job.setErrorMessage(e.getMessage());
            log.error("打印内容生成失败", e);
        }
    }


    /**
     * 获取打印预览
     */
    public void getPrintPreview(String printId, HttpServletResponse response) {
        AioveuPrintJob job = printJobs.get(printId);
        if (job == null) {
            throw new BusinessException("打印任务不存在");
        }

        if (job.getStatus() != AioveuPrintStatus.GENERATED) {
            throw new BusinessException("打印内容尚未生成完成");
        }

        try {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(job.getHtmlContent());
        } catch (IOException e) {
            throw new BusinessException("生成预览失败", e);
        }
    }

    /**
     * 获取打印内容
     */
    public String getPrintContent(String printId) {
        AioveuPrintJob job = printJobs.get(printId);
        if (job == null) {
            throw new BusinessException("打印任务不存在");
        }

        if (job.getStatus() != AioveuPrintStatus.COMPLETED) {
            throw new BusinessException("打印内容尚未生成完成");
        }

        return job.getHtmlContent();
    }

    /**
     * 获取打印状态
     */
    public AioveuPrintStatusVO getPrintStatus(String printId) {
        AioveuPrintJob job = printJobs.get(printId);
        if (job == null) {
            throw new BusinessException("打印任务不存在");
        }

        AioveuPrintStatusVO statusVO = new AioveuPrintStatusVO();
        statusVO.setPrintId(printId);
        statusVO.setAioveuPrintStatus(job.getStatus());  // 直接设置枚举值
        statusVO.setStartTime(job.getStartTime());
        statusVO.setEndTime(job.getEndTime());
        statusVO.setErrorMessage(job.getErrorMessage());
        statusVO.setTotal(job.getQrCodes().size());

        return statusVO;
    }






    /**
     * 生成打印HTML内容
     */
    private String generatePrintHtml(AioveuPrintJob job) {

        // 获取模板
        //在调用 getTemplate方法时，使用模板键（"standard"、"label"、"simple"等）而不是模板描述：
        AivoeuPrintTemplate template = aioveuPrintTemplateServiceImpl.getTemplate(job.getRequest().getTemplate());

        StringBuilder html = new StringBuilder();
        html.append("<!DOCTYPE html>");
        html.append("<html><head>");
        html.append("<meta charset=\"UTF-8\">");
        html.append("<title>衣物二维码打印</title>");
        html.append("<style>").append(template.getCss()).append("</style>");
        html.append("</head><body>");
        html.append("<script>");
        html.append("function printDocument() {");
        html.append("  window.print();");
        html.append("}");
        html.append("</script>");
        html.append("</head><body>");

        // 根据模板类型生成不同的内容
        // 单个打印
        if (job.getQrCodes().size() == 1) {
            html.append(generateSingleQrCodeHtml(job.getQrCodes().get(0), template));
        }
        // 批量打印
        else {
            html.append(generateBatchQrCodesHtml(job.getQrCodes(), template, job.getRequest()));
        }

        html.append("</body></html>");
        return html.toString();
    }

    /**
     * 生成单个二维码HTML
     */
    private String generateSingleQrCodeHtml(String qrCode, AivoeuPrintTemplate template) {

        try {
            // 获取衣物信息
            log.info("===== 开始生成单个二维码HTML =====");
            log.info("二维码: {}", qrCode);
            log.info("模板名称: {}", template.getName());

            //您的模板预览接口成功是因为在预览接口中，您使用了硬编码的参数值，这些参数值中不包含特殊字符（如%），
            // 所以没有触发格式化错误。而在实际打印服务中，参数值（特别是二维码图片URL）中包含了%符号，导致格式化失败。

            // 获取衣物信息
            AioveuGarmentInfo garment = aioveuGarmentInfoByCodeService.getGarmentInfoByCode(qrCode);
            if (garment == null) {
                throw new BusinessException("未找到衣物信息: " + qrCode);
            }

            // 获取衣物二维码
            String qrCodeImageUrl = aioveuGarmentInfoByCodeService.getQrCodeImageUrl(qrCode);
            if (qrCodeImageUrl == null || qrCodeImageUrl.isEmpty()) {
                throw new BusinessException("未找到二维码图片: " + qrCode);
            }

            // 获取操作类型字典项
            List<DictItemOptionVO> dictItemOptionVOs = dictItemService.getDictItems("laundry_garment_tracking_operation_type");

            // 根据操作类型值查找对应的标签
            String operationTypeName = dictItemOptionVOs.stream()
                    .filter(item -> item.getValue().equals(String.valueOf(garment.getOperationType())))
                    .findFirst()
                    .map(DictItemOptionVO::getLabel)
                    .orElse("未知操作类型");


            // 创建格式化器 格式化时间
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String createTime = garment.getCreateTime() != null ?
                    garment.getCreateTime().format(formatter) : "N/A";
            String printTime = LocalDateTime.now().format(formatter);
            String currentDate = LocalDate.now().toString();



            // 计算占位符数量
            int placeholderCount = countPlaceholders(template.getSingleTemplate());
            log.info("模板占位符数量: {}", placeholderCount);

            // 记录所有参数
            log.info("模板内容:\n{}", template.getSingleTemplate());
            log.info("参数列表:");
            log.info("1. qrCodeImageUrl: {}", qrCodeImageUrl);
            log.info("2. garmentCode: {}", garment.getGarmentCode());
            log.info("3. garmentType: {}", garment.getGarmentType());
            log.info("4. operationType: {}", operationTypeName);
            log.info("5. createTime: {}", createTime);
            log.info("6. currentDate: {}", currentDate);
            log.info("7. printTime: {}", printTime);

            // 准备参数数组
            Object[] args = {
                    qrCodeImageUrl,
                    garment.getGarmentCode(),
                    garment.getGarmentType(),
                    garment.getOperationType(),
                    createTime,
                    currentDate,
                    printTime
            };

            // 处理 null 值
            for (int i = 0; i < args.length; i++) {
                if (args[i] == null) {
                    args[i] = "";
                    log.warn("参数 {} 为 null，已替换为空字符串", i + 1);
                }
            }

            // 安全格式化
//            String result = safeFormat(template.getSingleTemplate(), args);

            // 确保参数顺序与模板中的占位符顺序一致
            // 根据模板类型使用不同的格式化方式
            //明确区分模板键和模板描述
            switch (template.getId()) {
                case "standard":

                    log.info("使用标准模板");
                    //在您的实际打印服务中，qrCodeImageUrl参数值包含%符号
                    //当这个值被传递给String.format()时，%被解释为格式说明符的开始，从而导致MissingFormatArgumentException。
                    return safeFormat(template.getSingleTemplate(),
                            qrCodeImageUrl,      // 第一个 %s: 二维码图片URL  这个URL包含 %符号（在 -344834629中），这可能导致格式化错误。
                            garment.getGarmentCode(),  // 第二个 %s: 衣物编码
                            garment.getGarmentType(),  // 第三个 %s: 衣物类型
                            operationTypeName,  // 第四个 %s: 衣物流转  operationType字段被设计为显示操作类型名称，而不是数字代码
                            createTime,     // 第五个 %s: 创建时间
                            currentDate,  // 第六个 %s: 当前时间
                            printTime);  // 第七个 %s: 打印日期


                case "label":
                    log.info("使用标签模板");
                    return String.format(template.getSingleTemplate(),
                            qrCodeImageUrl,
                            garment.getGarmentCode(),
                            garment.getGarmentType(),
                            garment.getCreateTime(),     // 第四个 %s: 创建时间
                            LocalDate.now().toString(),
                            LocalDateTime.now().format(formatter));

                case "simple":


                    log.info("使用简约模板");
                    return String.format(template.getSingleTemplate(),
                            qrCodeImageUrl,
                            garment.getGarmentCode(),
                            garment.getGarmentType(),
                            LocalDate.now().toString(),
                            LocalDateTime.now().format(formatter));

                default:
                    log.warn("未知模板名称: {}, 使用默认标准模板", template.getName());
                    return String.format(template.getSingleTemplate(),
                            qrCodeImageUrl,
                            garment.getGarmentCode(),
                            garment.getGarmentType(),
                            garment.getCreateTime(),
                            LocalDate.now().toString(),
                            LocalDateTime.now().format(formatter));
                }

            }catch(Exception e) {
                log.error("生成单个二维码HTML失败", e);
                return "<div class=\"error\">生成二维码信息失败: " + e.getMessage() + "</div>";
            }
        }

        //实现安全格式化方法
    private String safeFormat(String template, Object... args) {
        try {
            // 转义参数中的 % 符号
            Object[] escapedArgs = new Object[args.length];
            for (int i = 0; i < args.length; i++) {
                if (args[i] instanceof String) {
                    escapedArgs[i] = ((String) args[i]).replace("%", "%%");
                } else {
                    escapedArgs[i] = args[i];
                }
            }

            return String.format(template, escapedArgs);
        } catch (Exception e) {
            log.error("格式化字符串失败", e);
            return "<div class=\"error\">格式化错误: " + e.getMessage() + "</div>";
        }
    }

    /**
     * 计算占位符数量
     */
    private int countPlaceholders(String template) {
        int count = 0;
        int index = 0;
        while ((index = template.indexOf("%s", index)) != -1) {
            count++;
            index += 2;
        }
        return count;
    }

    /**
     * 生成批量二维码HTML
     */
    private String generateBatchQrCodesHtml(List<String> qrCodes, AivoeuPrintTemplate template, AioveuPrintRequest request) {
        StringBuilder content = new StringBuilder();
        content.append("<div class=\"batch-container\">");

        // 表头
        if (Boolean.TRUE.equals(request.getShowInfo())) {
            content.append("<div class=\"batch-header\">");
            content.append("<h2>衣物二维码批量打印</h2>");
            content.append("<p>打印时间: ").append(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"))).append("</p>");
            content.append("<p>总计: ").append(qrCodes.size()).append(" 个二维码</p>");
            content.append("</div>");
        }

        // 二维码网格
        content.append("<div class=\"qr-grid\">");

        for (String qrCode : qrCodes) {
            AioveuGarmentInfo garment = aioveuGarmentInfoByCodeService.getGarmentInfoByCode(qrCode);
            String qrCodeImageUrl = aioveuGarmentInfoByCodeService.getQrCodeImageUrl(qrCode);

            content.append("<div class=\"qr-item\">");
            content.append("<img src=\"").append(qrCodeImageUrl).append("\" class=\"qr-image\">");

            if (Boolean.TRUE.equals(request.getShowInfo())) {
                content.append("<div class=\"garment-info\">");
                content.append("<p class=\"code\">").append(garment.getGarmentCode()).append("</p>");
                content.append("<p class=\"type\">").append(garment.getOperationType()).append("</p>");
                content.append("</div>");
            }

            content.append("</div>");
        }

        content.append("</div></div>");


        return content.toString();
    }


    //生成批量模板HTML内容
    private String generateBatchTemplateHtml(List<String> qrCodes,
                                             AivoeuPrintTemplate template,
                                             AioveuPrintRequest request) {
        // 生成每个二维码的HTML项
        StringBuilder itemsHtml = new StringBuilder();
        for (String qrCode : qrCodes) {
            AioveuGarmentInfo garment = aioveuGarmentInfoByCodeService.getGarmentInfoByCode(qrCode);
            String qrCodeImageUrl = aioveuGarmentInfoByCodeService.getQrCodeImageUrl(qrCode);

            String itemHtml = String.format(template.getItemTemplate(),
                    qrCodeImageUrl,
                    garment.getGarmentCode(),
                    garment.getGarmentType());

            itemsHtml.append(itemHtml);
        }

        // 格式化批量模板
        return String.format(template.getBatchTemplate(),
                LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")),
                qrCodes.size(),
                itemsHtml.toString());
    }




    /**
     * 取消打印任务
     *
     * @param printId 打印任务ID
     */
    public void cancelPrintJob(String printId) {
        AioveuPrintJob job = printJobs.get(printId);
        if (job == null) {
            throw new BusinessException("打印任务不存在");
        }

        // 检查任务状态是否允许取消
        if (job.getStatus() != AioveuPrintStatus.PENDING && job.getStatus() != AioveuPrintStatus.PROCESSING) {
            throw new BusinessException("当前状态不允许取消");
        }

        // 取消异步任务
        Future<?> task = asyncTasks.get(printId);
        if (task != null) {
            task.cancel(true);
            asyncTasks.remove(printId);
        }

        // 更新任务状态
        job.setStatus(AioveuPrintStatus.CANCELLED);
        job.setEndTime(LocalDateTime.now());

        // 清理资源
        cleanupPrintJob(job);
    }

    /**
     * 清理打印任务资源
     */
    private void cleanupPrintJob(AioveuPrintJob job) {
        // 删除临时文件
        if (job.getFilePath() != null) {
            try {
                Files.deleteIfExists(Paths.get(job.getFilePath()));
            } catch (IOException e) {
                log.error("删除打印临时文件失败", e);
            }
        }

        // 清理其他资源...
    }

    /**
     * 添加打印任务到缓存
     */
    public void addPrintJob(AioveuPrintJob job, Future<?> task) {
        printJobs.put(job.getPrintId(), job);
        asyncTasks.put(job.getPrintId(), task);
    }

    // 添加打印执行方法
    public void executePrint(String printId) {

        // 创建打印任务
        AioveuPrintJob job = printJobs.get(printId);

        if (job.getStatus() != AioveuPrintStatus.GENERATED) {
            throw new IllegalStateException("打印任务状态无效，无法执行打印");
        }

        try {
            job.setStatus(AioveuPrintStatus.PRINTING);
            job.setStartTime(LocalDateTime.now());

            // 实际执行打印操作
            this.print(job.getHtmlContent());


            // 打印完成   // 更新任务状态
            job.setStatus(AioveuPrintStatus.COMPLETED);
            job.setEndTime(LocalDateTime.now());

            log.info("打印任务 {} 执行成功，耗时: {} 毫秒",
                    job.getPrintId(),
                    Duration.between(job.getStartTime(), job.getEndTime()).toMillis());

        } catch (Exception e) {
            job.setStatus(AioveuPrintStatus.FAILED);
            job.setErrorMessage(e.getMessage());
            job.setEndTime(LocalDateTime.now());

            log.error("打印任务 {} 执行失败，耗时: {} 毫秒，错误: {}",
                    job.getPrintId(),
                    Duration.between(job.getStartTime(), job.getEndTime()).toMillis(),
                    e.getMessage(), e);
        }
    }

    /**
     * 实际执行打印操作
     * @param htmlContent HTML内容
     */
    public void print(String htmlContent) {
        try {
            // 实际打印逻辑
            log.info("开始打印HTML内容，长度: {}", htmlContent.length());

            // 这里应该是实际调用打印机的代码
            // 例如：使用打印机API发送打印任务

            // 模拟打印延迟
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }


            log.info("打印任务已发送");
        } catch (Exception e) {
            log.error("打印失败", e);
            throw new RuntimeException("打印失败", e);
        }
    }

}
