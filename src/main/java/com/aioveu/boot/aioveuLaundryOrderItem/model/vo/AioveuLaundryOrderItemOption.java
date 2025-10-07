package com.aioveu.boot.aioveuLaundryOrderItem.model.vo;

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
@Schema( description = "问题描述视图对象")
public class AioveuLaundryOrderItemOption {

    @Serial
    private static final long serialVersionUID = 1L;

    //必须使用和前端一样的字段，表单编辑时才会匹配
    @Schema(description = "衣物明细ID")
    private Long itemId;
    @Schema(description = "问题描述")
    private String problemDesc;

}
