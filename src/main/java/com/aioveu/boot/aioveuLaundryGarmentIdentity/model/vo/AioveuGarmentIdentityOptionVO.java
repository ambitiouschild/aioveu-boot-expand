package com.aioveu.boot.aioveuLaundryGarmentIdentity.model.vo;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;

@Getter
@Setter
@NoArgsConstructor // 无参构造  某些框架（如 Jackson 反序列化、Hibernate）依赖无参构造函数
//添加 Lombok 注解（推荐）
@AllArgsConstructor // 添加这行注解 // 全参构造  如果添加了带参构造，编译器不再生成默认无参构造，需显式添加
@Schema( description = "衣物编码视图对象（用于下拉选择框）")
public class AioveuGarmentIdentityOptionVO {

    @Serial
    private static final long serialVersionUID = 1L;

    //必须使用和前端一样的字段，表单编辑时才会匹配
    @Schema(description = "衣物唯一编码ID")
    private Long id;
    @Schema(description = "衣物唯一编码(UUID格式)")
    private String garmentCode;
}
