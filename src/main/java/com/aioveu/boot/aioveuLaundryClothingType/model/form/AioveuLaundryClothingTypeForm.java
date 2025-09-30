package com.aioveu.boot.aioveuLaundryClothingType.model.form;

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
 * 衣物类型表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
@Getter
@Setter
@Schema(description = "衣物类型表单对象")
public class AioveuLaundryClothingTypeForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "衣物类型ID")
    private Long id;

    @Schema(description = "类型代码")
    @NotBlank(message = "类型代码不能为空")
    @Size(max=20, message="类型代码长度不能超过20个字符")
    private String typeCode;

    @Schema(description = "类型名称")
    @NotBlank(message = "类型名称不能为空")
    @Size(max=50, message="类型名称长度不能超过50个字符")
    private String typeName;

    @Schema(description = "衣物类别,0-上装-top,1-下装-bottom,2-外套-outerwear,3-内衣-underwear,4-配饰-accessories,5-家居用品-home,6-特殊衣物-special")
    @NotNull(message = "衣物类别,0-上装-top,1-下装-bottom,2-外套-outerwear,3-内衣-underwear,4-配饰-accessories,5-家居用品-home,6-特殊衣物-special不能为空")
    private Integer category;

    @Schema(description = "基础价格")
    private BigDecimal basePrice;

    @Schema(description = "标准处理时间(分钟)")
    @NotNull(message = "标准处理时间(分钟)不能为空")
    private Integer processingTime;

    @Schema(description = "特殊处理要求")
    @Size(max=65535, message="特殊处理要求长度不能超过65535个字符")
    private String specialRequirements;

    @Schema(description = "是否精细衣物")
    @NotNull(message = "是否精细衣物不能为空")
    private Integer isDelicate;

    @Schema(description = "状态(0-停用 1-启用)")
    @NotNull(message = "状态(0-停用 1-启用)不能为空")
    private Integer status;


}
