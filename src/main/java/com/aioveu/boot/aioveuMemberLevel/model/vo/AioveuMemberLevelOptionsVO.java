package com.aioveu.boot.aioveuMemberLevel.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
/**
 * 会员等级列表（用于下拉选择框）
 *
 * @author 可我不敌可爱
 * @since 2025-10-01 22:58
 */
@Getter
@Setter
@NoArgsConstructor // 无参构造  某些框架（如 Jackson 反序列化、Hibernate）依赖无参构造函数
//添加 Lombok 注解（推荐）
@AllArgsConstructor // 添加这行注解 // 全参构造  如果添加了带参构造，编译器不再生成默认无参构造，需显式添加
@Schema( description = "会员等级列表（用于下拉选择框）")
public class AioveuMemberLevelOptionsVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "会员等级ID")
    private Long id;
    @Schema(description = "等级名称")
    private String levelName;

}
