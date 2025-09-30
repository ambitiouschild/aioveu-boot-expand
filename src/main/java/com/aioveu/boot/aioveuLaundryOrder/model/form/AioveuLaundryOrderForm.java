package com.aioveu.boot.aioveuLaundryOrder.model.form;

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
 * 洗衣订单表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:43
 */
@Getter
@Setter
@Schema(description = "洗衣订单表单对象")
public class AioveuLaundryOrderForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "订单ID")
    private Long id;


    @Schema(description = "订单号")
    @NotBlank(message = "订单号不能为空")
    @Size(max=30, message="订单号长度不能超过30个字符")
    private String orderNo;

    @Schema(description = "会员ID")
    @NotNull(message = "会员ID不能为空")
    private Long memberId;

    @Schema(description = "客户姓名")
    @Size(max=50, message="客户姓名长度不能超过50个字符")
    private String customerName;

    @Schema(description = "客户电话")
    @Size(max=20, message="客户电话长度不能超过20个字符")
    private String customerPhone;

    @Schema(description = "订单状态 0创建,1接收,2洗衣,3干燥,4熨烫,5质量检查,6完成,7运送,8取消")
    @NotNull(message = "订单状态 0创建,1接收,2洗衣,3干燥,4熨烫,5质量检查,6完成,7运送,8取消不能为空")
    private Integer status;

    @Schema(description = "订单总额")
    @NotNull(message = "订单总额不能为空")
    private BigDecimal totalAmount;

    @Schema(description = "折扣金额")
    @NotNull(message = "折扣金额不能为空")
    private BigDecimal discountAmount;

    @Schema(description = "实付金额")
    @NotNull(message = "实付金额不能为空")
    private BigDecimal actualAmount;

    @Schema(description = "支付状态 1-未支付-unpaid,2-部分支付-partial,3-已支付-paid,4-未支付-refunded")
    @NotNull(message = "支付状态 1-未支付-unpaid,2-部分支付-partial,3-已支付-paid,4-未支付-refunded不能为空")
    private Integer paymentStatus;

    @Schema(description = "支付方式ID")
    @NotNull(message = "支付方式ID不能为空")
    private Integer paymentMethodId;

    @Schema(description = "收衣时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime receiveTime;

    @Schema(description = "完成时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime finishTime;

    @Schema(description = "交付时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime deliveryTime;

    @Schema(description = "备注")
    @Size(max=255, message="备注长度不能超过255个字符")
    private String remark;


}
