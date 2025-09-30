package com.aioveu.boot.aioveuMemberLevel.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.math.BigDecimal;
import jakarta.validation.constraints.*;

/**
 * 会员等级表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 14:52
 */
@Getter
@Setter
@Schema(description = "会员等级表单对象")
public class AioveuMemberLevelForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "会员等级ID")
    private Long id;

    @Schema(description = "等级名称")
    @NotBlank(message = "等级名称不能为空")
    @Size(max=20, message="等级名称长度不能超过20个字符")
    private String levelName;

    @Schema(description = "最低消费额")
    @NotNull(message = "最低消费额不能为空")
    private BigDecimal minAmount;

    @Schema(description = "折扣率")
    @NotNull(message = "折扣率不能为空")
    private BigDecimal discount;

    @Schema(description = "权益描述")
    @Size(max=65535, message="权益描述长度不能超过65535个字符")
    private String benefits;

    @Schema(description = "状态(0-禁用 1-启用)")
    @NotNull(message = "状态(0-禁用 1-启用)不能为空")
    private Integer status;


}
