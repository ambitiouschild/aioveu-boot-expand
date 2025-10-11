package com.aioveu.boot.aioveuLaundryGarmentTracking.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 衣物流转记录实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:35
 */
@Getter
@Setter
@TableName("aioveu_laundry_garment_tracking")
public class AioveuLaundryGarmentTracking extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 衣物编码
     */
    private Long garmentCode;
    /**
     * 操作类型,0-送厂清洗-SEND_FACTORY,1-工厂入库-FACTORY_IN,2-工厂出库-FACTORY_OUT,3-门店入库-STORE_IN,4-门店上挂-STORE_HANG,5-门店出库-STORE_OUT,6-返洗开始-RE_WASH_START
     */
    private Integer operationType;
    /**
     * 操作人ID
     */
    private Long operatorId;
    /**
     * 位置ID（仓库/门店）
     */
    private Long locationId;
    /**
     * 备注
     */
    private String remark;
}
