package com.aioveu.boot.aioveuMemberAccount.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 会员充值账户实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:02
 */
@Getter
@Setter
@TableName("aioveu_member_account")
public class AioveuMemberAccount extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 会员ID
     */
    private Long memberId;
    /**
     * 现金余额
     */
    private BigDecimal cashBalance;
    /**
     * 赠送余额
     */
    private BigDecimal giftBalance;
    /**
     * 总余额
     */
    @TableField(exist = false) // 标记为数据库不存在的字段
    private BigDecimal totalBalance;
    /**
     * 最后充值时间
     */
    private LocalDateTime lastRechargeTime;
    /**
     * 账户状态(0-冻结 1-正常)
     */
    private Integer status;
}
