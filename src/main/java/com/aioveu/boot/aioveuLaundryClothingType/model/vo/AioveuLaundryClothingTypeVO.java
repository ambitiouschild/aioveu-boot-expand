package com.aioveu.boot.aioveuLaundryClothingType.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;

/**
 * 衣物类型视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
@Getter
@Setter
@Schema( description = "衣物类型视图对象")
public class AioveuLaundryClothingTypeVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "衣物类型ID")
    private Long id;
    @Schema(description = "类型代码")
    private String typeCode;
    @Schema(description = "类型名称")
    private String typeName;
    @Schema(description = "衣物类别,0-上装-top,1-下装-bottom,2-外套-outerwear,3-内衣-underwear,4-配饰-accessories,5-家居用品-home,6-特殊衣物-special")
    private Integer category;
    @Schema(description = "基础价格")
    private BigDecimal basePrice;
    @Schema(description = "标准处理时间(分钟)")
    private Integer processingTime;
    @Schema(description = "特殊处理要求")
    private String specialRequirements;
    @Schema(description = "是否精细衣物")
    private Integer isDelicate;
    @Schema(description = "状态(0-停用 1-启用)")
    private Integer status;
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
}
