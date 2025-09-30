package com.aioveu.boot.aioveuMemberRechargeRecord.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;

/**
 * 会员充值记录视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:08
 */
@Getter
@Setter
@Schema( description = "会员充值记录视图对象")
public class AioveuMemberRechargeRecordVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "充值记录ID")
    private Long id;
    @Schema(description = "充值单号")
    private String rechargeNo;
    @Schema(description = "会员ID")
    private Long memberId;
    @Schema(description = "充值金额")
    private BigDecimal amount;
    @Schema(description = "赠送金额")
    private BigDecimal giftAmount;
    @Schema(description = "支付方式 1-wechat,2-alipay,3-cash,4-card,5-bank")
    private Integer paymentType;
    @Schema(description = "充值时间")
    private LocalDateTime rechargeTime;
    @Schema(description = "操作员ID")
    private Long operatorId;
    @Schema(description = "状态1-pending待定,2-success成功,3-failed失败")
    private Integer status;
    @Schema(description = "备注")
    private String remark;
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
}
