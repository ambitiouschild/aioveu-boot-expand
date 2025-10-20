package com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.io.Serial;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 衣物唯一编码视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-10-12 18:31
 */
@Getter
@Setter
@Schema( description = "衣物信息模型对象")

public class AioveuGarmentInfo {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "衣物唯一编码ID")
    private Long id;


    // 基础信息
    @Schema(description = "衣物唯一编码(UUID格式)")
    private String garmentCode;

    @Schema(description = "二维码存储路径")
    private String qrCodePath;//二维码URL

    @Schema(description = "编码状态 1-已存在-ACTIVE 2-已收回-RETIRED 3-已丢失-LOST")
    private int currentStatus;
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;


    // 订单明细信息
    private String problemDesc;
    private int processStatus;



    private String material;
    private String washingInstructions;  // 洗涤说明
    private String countryOfOrigin;  // 原产国
    private String brand;
    private String size;
    private String color;

    // 衣物类型信息
    private String garmentType;
    private int category;
    private BigDecimal basePrice;
    private Integer processingTime;






    // 订单信息
    private String orderNo;

    @Schema(description = "关联订单明细")
    private Integer orderStatus;
    private String customerPhone;
    private LocalDateTime orderTime;


    // 客户信息


    private String memberNo;
    private String name;
    private String phone;


    //最新流转记录
    private Integer OperationType;




}
