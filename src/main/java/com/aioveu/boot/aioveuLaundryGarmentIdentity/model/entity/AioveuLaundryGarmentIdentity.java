package com.aioveu.boot.aioveuLaundryGarmentIdentity.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 衣物唯一编码实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
@Getter
@Setter
@TableName("aioveu_laundry_garment_identity")
public class AioveuLaundryGarmentIdentity extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 衣物唯一编码(UUID格式)
     */
    private String garmentCode;
    /**
     * 关联订单明细
     */
    private Long garmentOrderDetailId;
    /**
     * 二维码存储路径
     */
    private String qrCodePath;
    /**
     * 编码状态 1-已存在-ACTIVE 2-已收回-RETIRED 3-已丢失-LOST
     */
    private Integer status;
}
