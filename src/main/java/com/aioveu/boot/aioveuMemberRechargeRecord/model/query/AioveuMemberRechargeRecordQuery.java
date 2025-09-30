package com.aioveu.boot.aioveuMemberRechargeRecord.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;
import java.math.BigDecimal;

/**
 * 会员充值记录分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:08
 */
@Schema(description ="会员充值记录查询对象")
@Getter
@Setter
public class AioveuMemberRechargeRecordQuery extends BasePageQuery {

    @Schema(description = "充值记录ID")
    private Long id;
    @Schema(description = "充值单号")
    private String rechargeNo;
    @Schema(description = "会员ID")
    private Long memberId;
    @Schema(description = "支付方式 1-wechat,2-alipay,3-cash,4-card,5-bank")
    private Integer paymentType;
}
