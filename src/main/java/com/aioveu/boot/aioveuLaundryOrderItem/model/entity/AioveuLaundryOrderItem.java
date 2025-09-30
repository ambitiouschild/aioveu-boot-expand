package com.aioveu.boot.aioveuLaundryOrderItem.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 洗衣订单衣物明细实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:55
 */
@Getter
@Setter
@TableName("aioveu_laundry_order_item")
public class AioveuLaundryOrderItem extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 订单ID
     */
    private Long orderId;
    /**
     * 衣物类型ID
     */
    private Long clothingTypeId;
    /**
     * 自定义衣物类型
     */
    private String customType;
    /**
     * 问题描述
     */
    private String problemDesc;
    /**
     * 价格
     */
    private BigDecimal price;
    /**
     * 处理状态 1-待处理-pending,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-质检中-quality_check,6-已完成-finished,7-问题衣物-problem
     */
    private Integer processStatus;
    /**
     * 特殊要求
     */
    private String specialInstruction;
    /**
     * 开始处理时间
     */
    private LocalDateTime startTime;
    /**
     * 完成处理时间
     */
    private LocalDateTime endTime;
}
