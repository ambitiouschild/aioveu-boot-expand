package com.aioveu.boot.aioveuLaundryClothingType.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 衣物类型实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
@Getter
@Setter
@TableName("aioveu_laundry_clothing_type")
public class AioveuLaundryClothingType extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 类型代码
     */
    private String typeCode;
    /**
     * 类型名称
     */
    private String typeName;
    /**
     * 衣物类别,0-上装-top,1-下装-bottom,2-外套-outerwear,3-内衣-underwear,4-配饰-accessories,5-家居用品-home,6-特殊衣物-special
     */
    private Integer category;
    /**
     * 基础价格
     */
    private BigDecimal basePrice;
    /**
     * 标准处理时间(分钟)
     */
    private Integer processingTime;
    /**
     * 特殊处理要求
     */
    private String specialRequirements;
    /**
     * 是否精细衣物
     */
    private Integer isDelicate;
    /**
     * 状态(0-停用 1-启用)
     */
    private Integer status;
}
