package com.aioveu.boot.aioveuMemberRechargeRecord.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 会员充值记录实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:08
 */
@Getter
@Setter
@TableName("aioveu_member_recharge_record")
public class AioveuMemberRechargeRecord extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 充值单号
     */
    private String rechargeNo;
    /**
     * 会员ID
     */
    private Long memberId;
    /**
     * 充值金额
     */
    private BigDecimal amount;
    /**
     * 赠送金额
     */
    private BigDecimal giftAmount;
    /**
     * 支付方式 1-wechat,2-alipay,3-cash,4-card,5-bank
     */
    private Integer paymentType;
    /**
     * 充值时间
     */
    private LocalDateTime rechargeTime;
    /**
     * 操作员ID
     */
    private Long operatorId;
    /**
     * 状态1-pending待定,2-success成功,3-failed失败
     */
    private Integer status;
    /**
     * 备注
     */
    private String remark;
}
