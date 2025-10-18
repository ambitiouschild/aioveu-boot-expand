package com.aioveu.boot.aioveuCommon.util.AioveuPrint.model;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema( description = "打印请求视图对象")
public class AioveuPrintRequest {

    // 单个打印
    @Schema(description = "单个二维码")
    private String qrCode;           // 单个二维码

    // 批量打印
    @Schema(description = "批量二维码列表")
    private List<String> qrCodes;    // 批量二维码列表
    @Schema(description = "打印模板")
    private String template;         // 打印模板   标准模板 "standard"  标签模板 "label"  简约模板 "simple"  简约模板 "simple"
    @Schema(description = "打印份数")
    private Integer copies;          // 打印份数
    @Schema(description = "纸张大小 (A4, A5, 标签纸等)")
    private String paperSize;       // 纸张大小 (A4, A5, 标签纸等)

    // 打印配置
    @Schema(description = "是否显示衣物信息")
    private Boolean showInfo;       // 是否显示衣物信息
    @Schema(description = "是否显示logo")
    private Boolean showLogo;       // 是否显示logo
    @Schema(description = "打印方向 (portrait, landscape)")
    private String orientation;      // 打印方向 (portrait, landscape)


    // 标准模板 "standard"
    // 标签模板 "label"
    // 简约模板 "simple"

    // 批量打印模板  "batch"
    // 报告模板"report"
}

//AioveuPrintRequest请求示例
//{
//        "qrCode": "GAR-20251017-0001-48FC",
//        "qrCodes": [],
//        "template": "standard",
//        "copies": 0,
//        "paperSize": "A4",
//        "showInfo": true,
//        "showLogo": true,
//        "orientation": "portrait"
//        }
