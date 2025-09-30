package com.aioveu.boot.aioveuLaundryOrderItem.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.math.BigDecimal;
import jakarta.validation.constraints.*;

/**
 * 洗衣订单衣物明细表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:55
 */
@Getter
@Setter
@Schema(description = "洗衣订单衣物明细表单对象")
public class AioveuLaundryOrderItemForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "洗衣订单衣物明细ID")
    private Long id;

    @Schema(description = "订单ID")
    @NotNull(message = "订单ID不能为空")
    private Long orderId;

    @Schema(description = "衣物类型ID")
    @NotNull(message = "衣物类型ID不能为空")
    private Long clothingTypeId;

    @Schema(description = "自定义衣物类型")
    @Size(max=50, message="自定义衣物类型长度不能超过50个字符")
    private String customType;

    @Schema(description = "问题描述")
    @Size(max=65535, message="问题描述长度不能超过65535个字符")
    private String problemDesc;

    @Schema(description = "价格")
    @NotNull(message = "价格不能为空")
    private BigDecimal price;

    @Schema(description = "处理状态 1-待处理-pending,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-质检中-quality_check,6-已完成-finished,7-问题衣物-problem")
    @NotNull(message = "处理状态 1-待处理-pending,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-质检中-quality_check,6-已完成-finished,7-问题衣物-problem不能为空")
    private Integer processStatus;

    @Schema(description = "特殊要求")
    @Size(max=255, message="特殊要求长度不能超过255个字符")
    private String specialInstruction;

    @Schema(description = "开始处理时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime startTime;

    @Schema(description = "完成处理时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime endTime;


}
