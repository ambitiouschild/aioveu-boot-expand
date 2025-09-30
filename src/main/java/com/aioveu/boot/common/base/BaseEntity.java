package com.aioveu.boot.common.base;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 基础实体类
 *
 * <p>实体类的基类，包含了实体类的公共属性，如创建时间、更新时间、逻辑删除标识等</p>
 *
 * @author Ray
 * @since 2024/6/23
 */
@Data
public class BaseEntity implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     * 如果您的实体类继承了 BaseEntity，那么数据库表设计时应该以 id作为主键，这样才能确保代码复用和框架正常工作
     * 数据库表设计必须匹配
     * 4. 为什么必须使用 id 作为主键？
     * 1.框架约定：
     * • MyBatis-Plus 默认使用 id作为主键字段名
     * • CRUD 方法（如 getById, updateById）依赖 id字段
     * 2.代码复用：
     * • BaseMapper中的方法基于 id操作
     * • 通用服务层实现依赖 id字段
     * 3.审计字段：
     * • createTime和 updateTime自动填充
     * • version实现乐观锁
     *5. 如果表主键不是 id 怎么办？
     * 方案1：修改表结构（推荐） ALTER TABLE your_table CHANGE COLUMN your_pk id BIGINT AUTO_INCREMENT;
     * 方案2：BaseEntity自定义主键字段名 @TableId(value = "your_pk", type = IdType.AUTO)
     * 方案3：不使用继承  // 手动添加其他通用字段
     *
     * 6. 最佳实践建议
     * 1.统一主键命名：
     * • 所有表使用 id作为主键列名
     * • 类型为 BIGINT AUTO_INCREMENT
     * 2.使用 BaseEntity：
     * • 减少重复代码
     * • 统一审计字段管理
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    @JsonInclude(value = JsonInclude.Include.NON_NULL)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonInclude(value = JsonInclude.Include.NON_NULL)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;

}
