package com.aioveu.boot.aioveuLaundryClothingType.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;
import java.math.BigDecimal;

/**
 * 衣物类型分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
@Schema(description ="衣物类型查询对象")
@Getter
@Setter
public class AioveuLaundryClothingTypeQuery extends BasePageQuery {

    @Schema(description = "衣物类型ID")
    private Long id;
    @Schema(description = "类型代码")
    private String typeCode;
    @Schema(description = "类型名称")
    private String typeName;
    @Schema(description = "衣物类别,0-上装-top,1-下装-bottom,2-外套-outerwear,3-内衣-underwear,4-配饰-accessories,5-家居用品-home,6-特殊衣物-special")
    private Integer category;
    @Schema(description = "特殊处理要求")
    private String specialRequirements;
    @Schema(description = "是否精细衣物")
    private Integer isDelicate;
}
