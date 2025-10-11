package com.aioveu.boot.aioveuLaundryGarmentTracking.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 衣物流转记录分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:35
 */
@Schema(description ="衣物流转记录查询对象")
@Getter
@Setter
public class AioveuLaundryGarmentTrackingQuery extends BasePageQuery {

    @Schema(description = "衣物流转记录ID")
    private Long id;
    @Schema(description = "衣物编码")
    private Long garmentCode;
    @Schema(description = "操作类型,0-送厂清洗-SEND_FACTORY,1-工厂入库-FACTORY_IN,2-工厂出库-FACTORY_OUT,3-门店入库-STORE_IN,4-门店上挂-STORE_HANG,5-门店出库-STORE_OUT,6-返洗开始-RE_WASH_START")
    private Integer operationType;
    @Schema(description = "操作人ID")
    private Long operatorId;
    @Schema(description = "位置ID（仓库/门店）")
    private Long locationId;
    @Schema(description = "备注")
    private String remark;
}
