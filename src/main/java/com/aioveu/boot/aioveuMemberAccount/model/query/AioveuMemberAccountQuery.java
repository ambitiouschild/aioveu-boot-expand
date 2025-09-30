package com.aioveu.boot.aioveuMemberAccount.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;
import java.math.BigDecimal;

/**
 * 会员充值账户分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:02
 */
@Schema(description ="会员充值账户查询对象")
@Getter
@Setter
public class AioveuMemberAccountQuery extends BasePageQuery {

    @Schema(description = "账户ID")
    private Long id;
    @Schema(description = "会员ID")
    private Long memberId;
    @Schema(description = "账户状态(0-冻结 1-正常)")
    private Integer status;
}
