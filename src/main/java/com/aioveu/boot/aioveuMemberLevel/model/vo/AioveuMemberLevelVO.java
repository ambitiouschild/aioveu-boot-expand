package com.aioveu.boot.aioveuMemberLevel.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;

/**
 * 会员等级视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 14:52
 */
@Getter
@Setter
@Schema( description = "会员等级视图对象")
public class AioveuMemberLevelVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "会员等级ID")
    private Long id;
    @Schema(description = "等级名称")
    private String levelName;
    @Schema(description = "最低消费额")
    private BigDecimal minAmount;
    @Schema(description = "折扣率")
    private BigDecimal discount;
    @Schema(description = "权益描述")
    private String benefits;
    @Schema(description = "状态(0-禁用 1-启用)")
    private Integer status;
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
}
