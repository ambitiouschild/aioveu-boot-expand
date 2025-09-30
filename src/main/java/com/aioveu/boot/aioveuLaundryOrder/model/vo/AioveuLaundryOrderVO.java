package com.aioveu.boot.aioveuLaundryOrder.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;

/**
 * 洗衣订单视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:43
 */
@Getter
@Setter
@Schema( description = "洗衣订单视图对象")
public class AioveuLaundryOrderVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "订单ID")
    private Long id;
    @Schema(description = "订单号")
    private String orderNo;
    @Schema(description = "会员ID")
    private Long memberId;
    @Schema(description = "客户姓名")
    private String customerName;
    @Schema(description = "客户电话")
    private String customerPhone;
    @Schema(description = "订单状态 0创建,1接收,2洗衣,3干燥,4熨烫,5质量检查,6完成,7运送,8取消")
    private Integer status;
    @Schema(description = "订单总额")
    private BigDecimal totalAmount;
    @Schema(description = "折扣金额")
    private BigDecimal discountAmount;
    @Schema(description = "实付金额")
    private BigDecimal actualAmount;
    @Schema(description = "支付状态 1-未支付-unpaid,2-部分支付-partial,3-已支付-paid,4-未支付-refunded")
    private Integer paymentStatus;
    @Schema(description = "支付方式ID")
    private Integer paymentMethodId;
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "收衣时间")
    private LocalDateTime receiveTime;
    @Schema(description = "完成时间")
    private LocalDateTime finishTime;
    @Schema(description = "交付时间")
    private LocalDateTime deliveryTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
    @Schema(description = "备注")
    private String remark;
}
