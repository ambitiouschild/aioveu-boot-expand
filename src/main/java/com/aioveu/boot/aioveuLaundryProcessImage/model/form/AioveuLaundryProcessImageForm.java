package com.aioveu.boot.aioveuLaundryProcessImage.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.*;

/**
 * 洗衣流程图片记录表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:58
 */
@Getter
@Setter
@Schema(description = "洗衣流程图片记录表单对象")
public class AioveuLaundryProcessImageForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "洗衣流程图片记录ID")
    private Long id;

    @Schema(description = "订单ID")
    @NotNull(message = "订单ID不能为空")
    private Long orderId;

    @Schema(description = "衣物明细ID")
    private Long itemId;

    @Schema(description = "图片类型 1-收衣时-receive,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-完成时-finish,6-问题衣物-problem,7-质检时-quality_check,8-交付时-delivery")
    @NotNull(message = "图片类型 1-收衣时-receive,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-完成时-finish,6-问题衣物-problem,7-质检时-quality_check,8-交付时-delivery不能为空")
    private Integer imageType;

    @Schema(description = "图片路径")
    @Size(max=255, message="图片路径长度不能超过255个字符")
    private String imageUrl;

    @Schema(description = "上传人ID")
    private Long uploadUser;

    @Schema(description = "图片描述")
    @Size(max=255, message="图片描述长度不能超过255个字符")
    private String description;


}
