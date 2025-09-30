package com.aioveu.boot.aioveuMemberLevel.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;
import java.math.BigDecimal;

/**
 * 会员等级分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 14:52
 */
@Schema(description ="会员等级查询对象")
@Getter
@Setter
public class AioveuMemberLevelQuery extends BasePageQuery {

    @Schema(description = "会员等级ID")
    private Long id;
    @Schema(description = "等级名称")
    private String levelName;
    @Schema(description = "状态(0-禁用 1-启用)")
    private Integer status;
}
