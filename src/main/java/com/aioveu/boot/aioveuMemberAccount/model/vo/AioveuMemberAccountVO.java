package com.aioveu.boot.aioveuMemberAccount.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;

/**
 * 会员充值账户视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:02
 */
@Getter
@Setter
@Schema( description = "会员充值账户视图对象")
public class AioveuMemberAccountVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "账户ID")
    private Long id;
    @Schema(description = "会员ID")
    private Long memberId;
    @Schema(description = "现金余额")
    private BigDecimal cashBalance;
    @Schema(description = "赠送余额")
    private BigDecimal giftBalance;
    @Schema(description = "总余额")
    private BigDecimal totalBalance;
    @Schema(description = "最后充值时间")
    private LocalDateTime lastRechargeTime;
    @Schema(description = "账户状态(0-冻结 1-正常)")
    private Integer status;
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
}
