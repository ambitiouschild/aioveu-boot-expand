package com.aioveu.boot.aioveuLaundryGarmentIdentity.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

/**
 * 衣物唯一编码视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
@Getter
@Setter
@Schema( description = "衣物唯一编码视图对象")
public class AioveuLaundryGarmentIdentityVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    @Schema(description = "衣物唯一编码ID")
    private Long id;

    @Schema(description = "衣物唯一编码(UUID格式)")
    private String garmentCode;
    @Schema(description = "关联订单明细")
    private Long garmentOrderDetailId;

    @Schema(description = "订单明细问题描述")
    private String itemProblemDesc;


    @Schema(description = "二维码存储路径")
    private String qrCodePath;
    @Schema(description = "编码状态 1-已存在-ACTIVE 2-已收回-RETIRED 3-已丢失-LOST")
    private Integer status;
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
}
