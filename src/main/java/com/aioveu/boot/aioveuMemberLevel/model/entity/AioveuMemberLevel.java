package com.aioveu.boot.aioveuMemberLevel.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 会员等级实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 14:52
 */
@Getter
@Setter
@TableName("aioveu_member_level")
public class AioveuMemberLevel extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 等级名称
     */
    private String levelName;
    /**
     * 最低消费额
     */
    private BigDecimal minAmount;
    /**
     * 折扣率
     */
    private BigDecimal discount;
    /**
     * 权益描述
     */
    private String benefits;
    /**
     * 状态(0-禁用 1-启用)
     */
    private Integer status;
}
