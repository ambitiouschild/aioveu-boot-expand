package com.aioveu.boot.aioveuLaundryProcessImage.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

/**
 * 洗衣流程图片记录视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:58
 */
@Getter
@Setter
@Schema( description = "洗衣流程图片记录视图对象")
public class AioveuLaundryProcessImageVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "图片记录ID")
    private Long id;
    @Schema(description = "订单ID")
    private Long orderId;
    @Schema(description = "衣物明细ID")
    private Long itemId;
    @Schema(description = "图片类型 1-收衣时-receive,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-完成时-finish,6-问题衣物-problem,7-质检时-quality_check,8-交付时-delivery")
    private Integer imageType;
    @Schema(description = "图片路径")
    private String imageUrl;
    @Schema(description = "上传人ID")
    private Long uploadUser;
    @Schema(description = "图片描述")
    private String description;
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
}
