package com.aioveu.boot.aioveuLaundryProcessImage.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 洗衣流程图片记录分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:58
 */
@Schema(description ="洗衣流程图片记录查询对象")
@Getter
@Setter
public class AioveuLaundryProcessImageQuery extends BasePageQuery {

    @Schema(description = "图片记录ID")
    private Long id;
    @Schema(description = "订单ID")
    private Long orderId;
    @Schema(description = "衣物明细ID")
    private Long itemId;
    @Schema(description = "图片类型 1-收衣时-receive,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-完成时-finish,6-问题衣物-problem,7-质检时-quality_check,8-交付时-delivery")
    private Integer imageType;
    @Schema(description = "上传人ID")
    private Long uploadUser;
}
