package com.aioveu.boot.aioveuLaundryProcessImage.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 洗衣流程图片记录实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:58
 */
@Getter
@Setter
@TableName("aioveu_laundry_process_image")
public class AioveuLaundryProcessImage extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 订单ID
     */
    private Long orderId;
    /**
     * 衣物明细ID
     */
    private Long itemId;
    /**
     * 图片类型 1-收衣时-receive,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-完成时-finish,6-问题衣物-problem,7-质检时-quality_check,8-交付时-delivery
     */
    private Integer imageType;
    /**
     * 图片路径
     */
    private String imageUrl;
    /**
     * 上传人ID
     */
    private Long uploadUser;
    /**
     * 图片描述
     */
    private String description;
}
