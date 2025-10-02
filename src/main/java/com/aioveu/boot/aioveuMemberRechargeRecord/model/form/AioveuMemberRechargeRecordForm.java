package com.aioveu.boot.aioveuMemberRechargeRecord.model.form;

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
 * 会员充值记录表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:08
 */
@Getter
@Setter
@Schema(description = "会员充值记录表单对象")
public class AioveuMemberRechargeRecordForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "充值记录ID")
    private Long id;


    @Schema(description = "充值单号")
//    @NotBlank(message = "充值单号不能为空")
    @Size(max=30, message="充值单号长度不能超过30个字符")
    private String rechargeNo;

    @Schema(description = "会员ID")
    @NotNull(message = "会员ID不能为空")
    private Long memberId;

    @Schema(description = "充值金额")
    @NotNull(message = "充值金额不能为空")
    private BigDecimal amount;

    @Schema(description = "赠送金额")
    @NotNull(message = "赠送金额不能为空")
    private BigDecimal giftAmount;

    @Schema(description = "支付方式 1-wechat,2-alipay,3-cash,4-card,5-bank")
    @NotNull(message = "支付方式 1-wechat,2-alipay,3-cash,4-card,5-bank不能为空")
    private Integer paymentType;

    @Schema(description = "充值时间")
    @NotNull(message = "充值时间不能为空")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime rechargeTime;

    @Schema(description = "操作员ID")
    private Long operatorId;

    @Schema(description = "状态1-pending待定,2-success成功,3-failed失败")
    @NotNull(message = "状态1-pending待定,2-success成功,3-failed失败不能为空")
    private Integer status;

    @Schema(description = "备注")
    @Size(max=255, message="备注长度不能超过255个字符")
    private String remark;


}
