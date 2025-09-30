package com.aioveu.boot.aioveuLaundryOrderItem.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;

/**
 * 洗衣订单衣物明细视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:55
 */
@Getter
@Setter
@Schema( description = "洗衣订单衣物明细视图对象")
public class AioveuLaundryOrderItemVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "衣物明细ID")
    private Long id;
    @Schema(description = "订单ID")
    private Long orderId;
    @Schema(description = "衣物类型ID")
    private Long clothingTypeId;
    @Schema(description = "自定义衣物类型")
    private String customType;
    @Schema(description = "问题描述")
    private String problemDesc;
    @Schema(description = "价格")
    private BigDecimal price;
    @Schema(description = "处理状态 1-待处理-pending,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-质检中-quality_check,6-已完成-finished,7-问题衣物-problem")
    private Integer processStatus;
    @Schema(description = "特殊要求")
    private String specialInstruction;
    @Schema(description = "开始处理时间")
    private LocalDateTime startTime;
    @Schema(description = "完成处理时间")
    private LocalDateTime endTime;
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
}
