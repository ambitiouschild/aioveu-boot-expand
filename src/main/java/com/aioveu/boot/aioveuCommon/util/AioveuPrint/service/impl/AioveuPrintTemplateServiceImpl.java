package com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.impl;

import com.aioveu.boot.aioveuCommon.util.AioveuPrint.model.AivoeuPrintTemplate;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * 打印模板服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-10-17 19:06
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AioveuPrintTemplateServiceImpl {

    private final Map<String, AivoeuPrintTemplate> templates = new HashMap<>();

    @PostConstruct
    public void initTemplates() {

        log.info("===== 开始初始化打印模板 =====");
        // 标准模板
        AivoeuPrintTemplate standardTemplate = createStandardTemplate();
        templates.put("standard", standardTemplate);
        log.info("添加标准模板: {}", standardTemplate.getName());


        // 标签模板
        templates.put("label", createLabelTemplate());
        // 简约模板
        templates.put("simple", createSimpleTemplate());

        // 批量打印模板
        templates.put("batch", createBatchTemplate());
        // 报告模板
        templates.put("report", createReportTemplate());

        log.info("初始化 {} 个打印模板", templates.size());

        // 添加小票模板
        templates.put("receipt", createReceiptTemplate());
        log.info("添加小票模板");

        // 添加水洗唛模板
        templates.put("care_label", createStandardCareLabelTemplate());
        log.info("添加水洗唛模板");

    }










    /**
     * 创建标准模板
     */
    private AivoeuPrintTemplate createStandardTemplate() {
        String css = """
            body { 
                font-family: 'Microsoft YaHei', sans-serif; 
                margin: 20px;
                color: #333;
            }
            .qr-container {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            }
            .header {
                text-align: center;
                margin-bottom: 20px;
                padding-bottom: 15px;
                border-bottom: 1px solid #eee;
            }
            .header h2 {
                margin: 0;
                color: #1a73e8;
                font-size: 24px;
            }
            .qr-content {
                display: flex;
                align-items: center;
                gap: 30px;
            }
            .qr-image-container {
                flex: 0 0 200px;
            }
            .qr-image {
                width: 200px;
                height: 200px;
                border: 1px solid #ddd;
                padding: 10px;
                border-radius: 4px;
            }
            .garment-info {
                flex: 1;
            }
            .info-item {
                margin-bottom: 12px;
                display: flex;
            }
            .info-label {
                font-weight: bold;
                width: 100px;
                color: #666;
            }
            .info-value {
                flex: 1;
            }
            .footer {
                margin-top: 25px;
                padding-top: 15px;
                border-top: 1px solid #eee;
                text-align: center;
                font-size: 14px;
                color: #888;
            }
            @media print {
                body { margin: 0; }
                .qr-container { border: none; box-shadow: none; }
            }
            """;

        String singleTemplate = """
            <div class="qr-container">
                <div class="header">
                    <h2>衣物二维码</h2>
                </div>
                
                <div class="qr-content">
                    <div class="qr-image-container">
                        <img src="%s" class="qr-image">
                    </div>
                    
                    <div class="garment-info">
                        <div class="info-item">
                            <span class="info-label">衣物编码:</span>
                            <span class="info-value">%s</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">衣物类型:</span>
                            <span class="info-value">%s</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">最新流转记录:</span>
                            <span class="info-value">%s</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">创建时间:</span>
                            <span class="info-value">%s</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">当前时间:</span>
                            <span class="info-value">%s</span>
                        </div>
                    </div>
                </div>
                
                <div class="footer">
                    <p>打印时间: %s | 系统: 可我不敌可爱洗衣管理系统</p>
                </div>
            </div>
            """;

        return new AivoeuPrintTemplate(
                "standard",
                "标准模板",
                css,
                singleTemplate,
                null // 标准模板没有批量模板
        );
    }


    /**
     * 创建小票模板
     */
    private AivoeuPrintTemplate createReceiptTemplate() {
        String css = """
            body { 
                font-family: 'Microsoft YaHei', sans-serif; 
                max-width: 80mm;
                margin: 0 auto;
                padding: 10px;
                background: white;
                color: #333;
            }
            .receipt-header {
                text-align: center;
                padding-bottom: 10px;
                border-bottom: 1px dashed #ccc;
            }
            .shop-name {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 5px;
            }
            .shop-info {
                font-size: 12px;
                margin-bottom: 5px;
            }
            .order-info {
                margin: 10px 0;
                font-size: 12px;
            }
            .items-table {
                width: 100%;
                border-collapse: collapse;
                margin: 10px 0;
                font-size: 12px;
            }
            .items-table th {
                text-align: left;
                padding: 5px 0;
                border-bottom: 1px dashed #ccc;
            }
            .items-table td {
                padding: 5px 0;
                border-bottom: 1px dashed #eee;
            }
            .item-name {
                width: 50%;
            }
            .item-price, .item-quantity, .item-total {
                width: 16.66%;
                text-align: right;
            }
            .summary {
                margin: 10px 0;
                padding-top: 10px;
                border-top: 1px dashed #ccc;
                font-size: 13px;
            }
            .summary-row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 5px;
            }
            .footer {
                margin-top: 15px;
                padding-top: 10px;
                border-top: 1px dashed #ccc;
                font-size: 11px;
                text-align: center;
                color: #666;
            }
            @media print {
                body { 
                    margin: 0;
                    padding: 5mm;
                }
            }
            """;

        String singleTemplate = """
            <div class="receipt">
                <div class="receipt-header">
                    <div class="shop-name">%s</div>
                    <div class="shop-info">%s</div>
                    <div class="shop-info">电话: %s</div>
                </div>
                
                <div class="order-info">
                    <div>订单号: %s</div>
                    <div>时间: %s</div>
                </div>
                
                <table class="items-table">
                    <thead>
                        <tr>
                            <th class="item-name">商品</th>
                            <th class="item-price">单价</th>
                            <th class="item-quantity">数量</th>
                            <th class="item-total">金额</th>
                        </tr>
                    </thead>
                    <tbody>
                        %s
                    </tbody>
                </table>
                
                <div class="summary">
                    <div class="summary-row">
                        <span>合计:</span>
                        <span>¥%s</span>
                    </div>
                    <div class="summary-row">
                        <span>支付方式:</span>
                        <span>%s</span>
                    </div>
                    <div class="summary-row">
                        <span>实收:</span>
                        <span>¥%s</span>
                    </div>
                    <div class="summary-row">
                        <span>找零:</span>
                        <span>¥%s</span>
                    </div>
                </div>
                
                <div class="footer">
                    <div>%s</div>
                    <div>打印时间: %s</div>
                    <div>谢谢惠顾，欢迎再次光临</div>
                </div>
            </div>
            """;

        String itemTemplate = """
            <tr>
                <td class="item-name">%s</td>
                <td class="item-price">¥%s</td>
                <td class="item-quantity">%d</td>
                <td class="item-total">¥%s</td>
            </tr>
            """;

        return new AivoeuPrintTemplate(
                "receipt",
                "小票模板",
                css,
                singleTemplate,
                null,
                itemTemplate
        );
    }

    /**
     * 标准洗衣店水洗唛模板
     * 符合国际洗涤标签标准
     */
    private AivoeuPrintTemplate createStandardCareLabelTemplate() {
        String css = """
    /* 标准水洗唛样式 - 符合行业标准 */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: Arial, sans-serif;
        font-size: 8px;
        background: white;
        line-height: 1.2;
    }
    
    /* 标准水洗唛尺寸：80mm × 40mm */
    .care-label {
        width: 80mm;
        height: 40mm;
        border: 1px solid #000;
        display: flex;
        page-break-inside: avoid;
        margin-bottom: 2mm;
    }
    
    /* 批量打印容器 */
    .batch-container {
        display: flex;
        flex-direction: column;
        gap: 2mm;
        padding: 5mm;
    }
    
    /* 二维码区域 - 左侧30% */
    .qr-section {
        width: 25%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        border-right: 1px solid #000;
        padding: 1mm;
        background: #f8f8f8;
    }
    
    .qr-code {
        width: 100%;
        max-width: 20mm; /* 限制最大宽度 */
        height: auto;
        object-fit: contain;
    }
    
    /* 信息区域 - 右侧70% */
    .info-section {
        width: 75%; /* 从60%增加到75% */
        padding: 1.5mm;
        display: flex;
        flex-direction: column;
    }
    
    /* 顶部信息行 */
    .header-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 1mm;
        border-bottom: 1px dashed #ccc;
        padding-bottom: 0.5mm;
    }
    
    .garment-code {
        font-weight: bold;
        font-size: 9px;
    }
    
    .brand {
        font-size: 8px;
        color: #666;
    }
    
    /* 材质和产地行 */
    .material-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 1mm;
        font-size: 7px;
    }
    
    /* 洗涤符号区域 - 国际标准符号 */
    .symbols-section {
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 0.5mm;
        margin: 1mm 0;
        text-align: center;
    }
    
    .symbol-item {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    
    .symbol {
        font-size: 12px;
        margin-bottom: 0.2mm;
    }
    
    .symbol-label {
        font-size: 6px;
        color: #666;
    }
    
    /* 洗涤说明区域 */
    .instructions-section {
        margin-top: 0.5mm;
        padding-top: 0.5mm;
        border-top: 1px dashed #ccc;
    }
    
    .instructions {
        font-size: 7px;
        line-height: 1.1;
                max-height: 12mm; /* 限制高度 */
                            overflow: hidden;
                            text-overflow: ellipsis;
    }
    
    /* 底部信息 */
    .footer {
        margin-top: auto;
        display: flex;
        justify-content: space-between;
        font-size: 6px;
        color: #666;
    }
    
    /* 打印优化 */
    @media print {
        body {
            margin: 0;
            padding: 0;
        }
        
        .care-label {
            border: 1px solid #000;
            margin-bottom: 2mm;
        }
        
        .no-print {
            display: none !important;
        }
    }
    
    /* 错误状态 */
    .error {
        color: #d00;
        font-style: italic;
        text-align: center;
    }
    
    /* 加载状态 */
    .loading {
        text-align: center;
        color: #666;
    }
    """;

        String singleTemplate = """
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>标准水洗唛打印</title>
        <style>%s</style>
    </head>
    <body>
        <div class="care-label">
            <!-- 左侧二维码区域 -->
            <div class="qr-section">
                <img src="%s" class="qr-code" alt="衣物二维码" 
                     onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
                <div class="error" style="display:none;">[二维码加载失败]</div>
            </div>
            
            <!-- 右侧信息区域 -->
            <div class="info-section">
                <!-- 顶部信息 -->
                <div class="header-row">
                    <div class="garment-code">衣物编码: %s</div>
                    <div class="brand">品牌: %s</div>
                </div>
                
                <!-- 材质和产地 -->
                <div class="material-row">
                    <div>材质: %s</div>
                    <div>产地: %s</div>
                </div>
                
                <!-- 国际标准洗涤符号 -->
                <div class="symbols-section">
                    <div class="symbol-item">
                        <div class="symbol">🛁</div>
                        <div class="symbol-label">%s°C</div>
                    </div>
                    <div class="symbol-item">
                        <div class="symbol">🚫</div>
                        <div class="symbol-label">漂白</div>
                    </div>
                    <div class="symbol-item">
                        <div class="symbol">♨️</div>
                        <div class="symbol-label">熨烫</div>
                    </div>
                    <div class="symbol-item">
                        <div class="symbol">🧼</div>
                        <div class="symbol-label">干洗</div>
                    </div>
                    <div class="symbol-item">
                        <div class="symbol">☀️</div>
                        <div class="symbol-label">晾干</div>
                    </div>
                </div>
                
                <!-- 洗涤说明 -->
                <div class="instructions-section">
                    <div class="instructions">%s</div>
                </div>
                
                <!-- 底部信息 -->
                <div class="footer">
                    <div>打印时间: %s</div>
                    <div>洗衣店名称</div>
                </div>
            </div>
        </div>
        
        <div class="no-print" style="text-align: center; margin-top: 5mm; font-size: 8px;">
            标准水洗唛 - 单件
        </div>
    </body>
    </html>
    """;

        String batchTemplate = """
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>标准水洗唛批量打印</title>
        <style>%s</style>
    </head>
    <body>
        <div class="batch-container">
            %s
        </div>
        
        <div class="no-print" style="text-align: center; margin-top: 5mm; font-size: 8px;">
            打印时间: %s | 共 %d 件 | 标准水洗唛批量打印
        </div>
    </body>
    </html>
    """;

        String itemTemplate = """
    <div class="care-label">
        <!-- 左侧二维码区域 -->
        <div class="qr-section">
            <img src="%s" class="qr-code" alt="衣物二维码" 
                 onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
            <div class="error" style="display:none;">[二维码加载失败]</div>
        </div>
        
        <!-- 右侧信息区域 -->
        <div class="info-section">
            <!-- 顶部信息 -->
            <div class="header-row">
                <div class="garment-code">衣物编码: %s</div>
                <div class="brand">品牌: %s</div>
            </div>
            
            <!-- 材质和产地 -->
            <div class="material-row">
                <div>材质: %s</div>
                <div>产地: %s</div>
            </div>
            
            <!-- 国际标准洗涤符号 -->
            <div class="symbols-section">
                <div class="symbol-item">
                    <div class="symbol">🛁</div>
                    <div class="symbol-label">%s°C</div>
                </div>
                <div class="symbol-item">
                    <div class="symbol">🚫</div>
                    <div class="symbol-label">漂白</div>
                </div>
                <div class="symbol-item">
                    <div class="symbol">♨️</div>
                    <div class="symbol-label">熨烫</div>
                </div>
                <div class="symbol-item">
                    <div class="symbol">🧼</div>
                    <div class="symbol-label">干洗</div>
                </div>
                <div class="symbol-item">
                    <div class="symbol">☀️</div>
                    <div class="symbol-label">晾干</div>
                </div>
            </div>
            
            <!-- 洗涤说明 -->
            <div class="instructions-section">
                <div class="instructions">%s</div>
            </div>
            
            <!-- 底部信息 -->
            <div class="footer">
                <div>打印时间: %s</div>
                <div>洗衣店名称</div>
            </div>
        </div>
    </div>
    """;

        return new AivoeuPrintTemplate(
                "standard_care_label",
                "标准洗衣店水洗唛模板",
                css,
                singleTemplate,
                batchTemplate,
                itemTemplate
        );
    }










    /**
     * 创建标签模板
     */
    private AivoeuPrintTemplate createLabelTemplate() {
        String css = """
            body { 
                margin: 0;
                padding: 10px;
                font-family: Arial, sans-serif;
            }
            .label-container {
                width: 300px;
                height: 150px;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 10px;
                display: flex;
                align-items: center;
                box-sizing: border-box;
                page-break-inside: avoid;
            }
            .qr-image {
                width: 120px;
                height: 120px;
                border: 1px solid #eee;
                padding: 5px;
                margin-right: 15px;
            }
            .label-info {
                flex: 1;
            }
            .label-title {
                font-size: 16px;
                font-weight: bold;
                margin-bottom: 5px;
                color: #1a73e8;
            }
            .label-item {
                font-size: 13px;
                margin-bottom: 3px;
            }
            .label-code {
                font-weight: bold;
                font-size: 14px;
            }
            .label-footer {
                font-size: 10px;
                color: #888;
                margin-top: 5px;
            }
            @media print {
                .label-container {
                    border: none;
                }
            }
            """;

        String singleTemplate = """
            <div class="label-container">
                <img src="%s" class="qr-image">
                <div class="label-info">
                    <div class="label-title">衣物标签</div>
                    <div class="label-item label-code">编码: %s</div>
                    <div class="label-item">类型: %s</div>
                    <div class="label-item">颜色: %s</div>
                    <div class="label-item">状态: %s</div>
                    <div class="label-footer">打印时间: %s</div>
                </div>
            </div>
            """;

        return new AivoeuPrintTemplate(
                "label",
                "标签模板",
                css,
                singleTemplate,
                null
        );
    }

    /**
     * 创建简约模板
     */
    private AivoeuPrintTemplate createSimpleTemplate() {
        String css = """
            body { 
                margin: 0;
                padding: 0;
            }
            .simple-container {
                text-align: center;
                padding: 15px;
            }
            .qr-image {
                width: 150px;
                height: 150px;
                margin: 0 auto 10px;
            }
            .simple-code {
                font-size: 14px;
                font-weight: bold;
                margin-bottom: 5px;
            }
            .simple-type {
                font-size: 13px;
                color: #666;
            }
            .simple-date {
                font-size: 12px;
                color: #999;
                margin-top: 10px;
            }
            """;

        String singleTemplate = """
            <div class="simple-container">
                <img src="%s" class="qr-image">
                <div class="simple-code">%s</div>
                <div class="simple-type">%s</div>
                <div class="simple-date">%s</div>
            </div>
            """;

        return new AivoeuPrintTemplate(
                "simple",
                "简约模板",
                css,
                singleTemplate,
                null
        );
    }

    /**
     * 创建批量打印模板
     */
    private AivoeuPrintTemplate createBatchTemplate() {
        String css = """
            body { 
                font-family: 'Microsoft YaHei', sans-serif; 
                margin: 15px;
                color: #333;
            }
            .batch-header {
                text-align: center;
                margin-bottom: 20px;
                padding-bottom: 15px;
                border-bottom: 1px solid #eee;
            }
            .batch-title {
                margin: 0;
                color: #1a73e8;
                font-size: 22px;
            }
            .batch-info {
                display: flex;
                justify-content: center;
                gap: 30px;
                margin-top: 10px;
                font-size: 14px;
            }
            .qr-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }
            .qr-item {
                text-align: center;
                padding: 15px;
                border: 1px solid #e0e0e0;
                border-radius: 6px;
                background: #f9f9f9;
                page-break-inside: avoid;
            }
            .item-qr {
                width: 120px;
                height: 120px;
                margin: 0 auto 10px;
                border: 1px solid #ddd;
                padding: 5px;
            }
            .item-code {
                font-weight: bold;
                font-size: 14px;
                margin-bottom: 5px;
            }
            .item-type {
                font-size: 13px;
                color: #666;
            }
            .batch-footer {
                text-align: center;
                padding-top: 15px;
                border-top: 1px solid #eee;
                font-size: 13px;
                color: #888;
            }
            @media print {
                body { margin: 10px; }
                .qr-item { border: 1px solid #eee; }
            }
            """;

        String batchTemplate = """
            <div class="batch-header">
                <h2 class="batch-title">衣物二维码批量打印</h2>
                <div class="batch-info">
                    <div>打印时间: %s</div>
                    <div>总计: %d 个</div>
                </div>
            </div>
            
            <div class="qr-grid">
                <!-- 动态生成二维码项 -->
                %s
            </div>
            
            <div class="batch-footer">
                <p>系统: 可我不敌可爱洗衣管理系统 | 页码: {pageNum}/{totalPages}</p>
            </div>
            """;

        String itemTemplate = """
            <div class="qr-item">
                <img src="%s" class="item-qr">
                <div class="item-code">%s</div>
                <div class="item-type">%s</div>
            </div>
            """;

        return new AivoeuPrintTemplate(
                "batch",
                "批量模板",
                css,
                null, // 单件模板为空
                batchTemplate,
                itemTemplate
        );
    }

    /**
     * 创建报告模板
     */
    private AivoeuPrintTemplate createReportTemplate() {
        String css = """
            body { 
                font-family: 'Microsoft YaHei', sans-serif; 
                margin: 20px;
                color: #333;
            }
            .report-header {
                text-align: center;
                margin-bottom: 30px;
            }
            .report-title {
                margin: 0;
                color: #1a73e8;
                font-size: 24px;
            }
            .report-subtitle {
                margin-top: 5px;
                color: #666;
                font-size: 16px;
            }
            .report-info {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
                padding-bottom: 15px;
                border-bottom: 1px solid #eee;
            }
            .info-block {
                flex: 1;
            }
            .info-label {
                font-weight: bold;
                margin-bottom: 5px;
                color: #444;
            }
            .table-container {
                margin-bottom: 30px;
            }
            .report-table {
                width: 100%;
                border-collapse: collapse;
            }
            .report-table th {
                background-color: #f5f7fa;
                padding: 12px 15px;
                text-align: left;
                border-bottom: 2px solid #ebeef5;
                font-weight: bold;
                color: #606266;
            }
            .report-table td {
                padding: 10px 15px;
                border-bottom: 1px solid #ebeef5;
            }
            .report-table tr:hover {
                background-color: #f5f7fa;
            }
            .qr-cell {
                text-align: center;
            }
            .qr-small {
                width: 80px;
                height: 80px;
            }
            .summary {
                margin-top: 30px;
                padding: 15px;
                background-color: #f9f9f9;
                border-radius: 6px;
            }
            .summary-title {
                font-weight: bold;
                margin-bottom: 10px;
                color: #444;
            }
            .report-footer {
                margin-top: 40px;
                padding-top: 15px;
                border-top: 1px solid #eee;
                text-align: right;
                font-size: 14px;
                color: #888;
            }
            @media print {
                body { margin: 0; }
                .report-header { margin-top: 20px; }
            }
            """;

        String reportTemplate = """
            <div class="report-header">
                <h1 class="report-title">衣物二维码打印报告</h1>
                <div class="report-subtitle">打印时间: %s</div>
            </div>
            
            <div class="report-info">
                <div class="info-block">
                    <div class="info-label">打印模板:</div>
                    <div>%s</div>
                </div>
                <div class="info-block">
                    <div class="info-label">打印数量:</div>
                    <div>%d 个</div>
                </div>
                <div class="info-block">
                    <div class="info-label">操作人员:</div>
                    <div>%s</div>
                </div>
            </div>
            
            <div class="table-container">
                <table class="report-table">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>二维码</th>
                            <th>衣物编码</th>
                            <th>衣物类型</th>
                            <th>颜色</th>
                            <th>状态</th>
                            <th>创建时间</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 动态生成表格行 -->
                        %s
                    </tbody>
                </table>
            </div>
            
            <div class="summary">
                <div class="summary-title">打印统计</div>
                <div>成功打印: %d 个</div>
                <div>失败: %d 个</div>
            </div>
            
            <div class="report-footer">
                <p>系统: AIO洗衣管理系统 | 打印时间: %s</p>
            </div>
            """;

        String rowTemplate = """
            <tr>
                <td>%d</td>
                <td class="qr-cell"><img src="%s" class="qr-small"></td>
                <td>%s</td>
                <td>%s</td>
                <td>%s</td>
                <td>%s</td>
                <td>%s</td>
            </tr>
            """;

        return new AivoeuPrintTemplate(
                "report",
                "报告模板",
                css,
                null,
                reportTemplate,
                rowTemplate
        );
    }

    /**
     * 获取打印模板
     * @param templateName 模板名称
     * @return 打印模板对象
     */
    public AivoeuPrintTemplate getTemplate(String templateName) {
        AivoeuPrintTemplate template = templates.get(templateName);
        if (template == null) {
            log.warn("未找到模板: {}, 使用默认标准模板", templateName);
            return templates.get("standard");
        }
        return template;
    }

    /**
     * 获取所有可用模板
     * @return 模板名称到模板对象的映射
     */
    public Map<String, AivoeuPrintTemplate> getAllTemplates() {
        return new HashMap<>(templates);
    }

}
