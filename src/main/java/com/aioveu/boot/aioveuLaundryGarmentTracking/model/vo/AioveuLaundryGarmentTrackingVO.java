package com.aioveu.boot.aioveuLaundryGarmentTracking.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

/**
 * 衣物流转记录视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:35
 */
@Getter
@Setter
@Schema( description = "衣物流转记录视图对象")
public class AioveuLaundryGarmentTrackingVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

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
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
}
