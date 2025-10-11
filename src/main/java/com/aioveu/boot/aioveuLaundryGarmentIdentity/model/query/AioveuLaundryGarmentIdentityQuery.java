package com.aioveu.boot.aioveuLaundryGarmentIdentity.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 衣物唯一编码分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
@Schema(description ="衣物唯一编码查询对象")
@Getter
@Setter
public class AioveuLaundryGarmentIdentityQuery extends BasePageQuery {

    @Schema(description = "衣物唯一编码ID")
    private Long id;
    @Schema(description = "衣物唯一编码(UUID格式)")
    private String garmentCode;
    @Schema(description = "关联订单明细")
    private Long garmentOrderDetailId;
    @Schema(description = "编码状态 1-已存在-ACTIVE 2-已收回-RETIRED 3-已丢失-LOST")
    private Integer status;
}
