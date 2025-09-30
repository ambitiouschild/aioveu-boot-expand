package com.aioveu.boot.aioveuLaundryOrder.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 洗衣订单实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:43
 */
@Getter
@Setter
@TableName("aioveu_laundry_order")
public class AioveuLaundryOrder extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 订单号
     */
    private String orderNo;
    /**
     * 会员ID
     */
    private Long memberId;
    /**
     * 客户姓名
     */
    private String customerName;
    /**
     * 客户电话
     */
    private String customerPhone;
    /**
     * 订单状态 0创建,1接收,2洗衣,3干燥,4熨烫,5质量检查,6完成,7运送,8取消
     */
    private Integer status;
    /**
     * 订单总额
     */
    private BigDecimal totalAmount;
    /**
     * 折扣金额
     */
    private BigDecimal discountAmount;
    /**
     * 实付金额
     */
    private BigDecimal actualAmount;
    /**
     * 支付状态 1-未支付-unpaid,2-部分支付-partial,3-已支付-paid,4-未支付-refunded
     */
    private Integer paymentStatus;
    /**
     * 支付方式ID
     */
    private Integer paymentMethodId;
    /**
     * 收衣时间
     */
    private LocalDateTime receiveTime;
    /**
     * 完成时间
     */
    private LocalDateTime finishTime;
    /**
     * 交付时间
     */
    private LocalDateTime deliveryTime;
    /**
     * 备注
     */
    private String remark;
}
