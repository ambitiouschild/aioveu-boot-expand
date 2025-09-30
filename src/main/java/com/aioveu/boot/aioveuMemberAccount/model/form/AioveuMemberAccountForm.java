package com.aioveu.boot.aioveuMemberAccount.model.form;

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
 * 会员充值账户表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:02
 */
@Getter
@Setter
@Schema(description = "会员充值账户表单对象")
public class AioveuMemberAccountForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "账户ID")
    private Long id;

    @Schema(description = "会员ID")
    @NotNull(message = "会员ID不能为空")
    private Long memberId;

    @Schema(description = "现金余额")
    @NotNull(message = "现金余额不能为空")
    private BigDecimal cashBalance;

    @Schema(description = "赠送余额")
    @NotNull(message = "赠送余额不能为空")
    private BigDecimal giftBalance;

    @Schema(description = "总余额")
    private BigDecimal totalBalance;

    @Schema(description = "最后充值时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime lastRechargeTime;

    @Schema(description = "账户状态(0-冻结 1-正常)")
    @NotNull(message = "账户状态(0-冻结 1-正常)不能为空")
    private Integer status;


}
