package com.aioveu.boot.aioveuLaundryGarmentIdentity.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.*;

/**
 * 衣物唯一编码表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
@Getter
@Setter
@Schema(description = "衣物唯一编码表单对象")
public class AioveuLaundryGarmentIdentityForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "衣物唯一编码ID")
    private Long id;

    @Schema(description = "衣物唯一编码(UUID格式)")
//    @NotBlank(message = "衣物唯一编码(UUID格式)不能为空")
    @Size(max=255, message="衣物唯一编码(UUID格式)长度不能超过255个字符")
    private String garmentCode;

    @Schema(description = "关联订单明细")
    @NotNull(message = "关联订单明细不能为空")
    private Long garmentOrderDetailId;

    @Schema(description = "二维码存储路径")
    @Size(max=255, message="二维码存储路径长度不能超过255个字符")
    private String qrCodePath;

    @Schema(description = "编码状态 1-已存在-ACTIVE 2-已收回-RETIRED 3-已丢失-LOST")
    @NotNull(message = "编码状态 1-已存在-ACTIVE 2-已收回-RETIRED 3-已丢失-LOST不能为空")
    private Integer status;

    @Schema(description = "创建时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    @Schema(description = "更新时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;


}
