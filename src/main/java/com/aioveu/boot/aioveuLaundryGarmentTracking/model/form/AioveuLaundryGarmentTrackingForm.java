package com.aioveu.boot.aioveuLaundryGarmentTracking.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.*;

/**
 * 衣物流转记录表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:35
 */
@Getter
@Setter
@Schema(description = "衣物流转记录表单对象")
public class AioveuLaundryGarmentTrackingForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "衣物流转记录ID")
    private Long id;

    @Schema(description = "衣物编码")
    @NotNull(message = "衣物编码不能为空")
    private Long garmentCode;

    @Schema(description = "操作类型,0-送厂清洗-SEND_FACTORY,1-工厂入库-FACTORY_IN,2-工厂出库-FACTORY_OUT,3-门店入库-STORE_IN,4-门店上挂-STORE_HANG,5-门店出库-STORE_OUT,6-返洗开始-RE_WASH_START")
    @NotNull(message = "操作类型,0-送厂清洗-SEND_FACTORY,1-工厂入库-FACTORY_IN,2-工厂出库-FACTORY_OUT,3-门店入库-STORE_IN,4-门店上挂-STORE_HANG,5-门店出库-STORE_OUT,6-返洗开始-RE_WASH_START不能为空")
    private Integer operationType;

    @Schema(description = "操作人ID")
    private Long operatorId;

    @Schema(description = "位置ID（仓库/门店）")
    private Long locationId;

    @Schema(description = "备注")
    @Size(max=255, message="备注长度不能超过255个字符")
    private String remark;

//    @Schema(description = "创建时间")
//    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
//    private LocalDateTime createTime;
//
//    @Schema(description = "更新时间")
//    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
//    private LocalDateTime updateTime;


}
