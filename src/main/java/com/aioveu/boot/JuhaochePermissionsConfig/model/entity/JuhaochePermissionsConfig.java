package com.aioveu.boot.JuhaochePermissionsConfig.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Getter;
import lombok.Setter;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 权限配置实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:51
 */
@Getter
@Setter
@TableName("juhaoche_permissions_config")
public class JuhaochePermissionsConfig extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 权限配置名称
     */
    private String name;
    /**
     * API路径
     */
    private String apiPath;
    /**
     * 权限编码
     */
    private String permissionIds;
    /**
     * 权限配置描述
     */
    private String description;
    /**
     * 权限类型
     */
    private Integer type;
    /**
     * 状态: 0-禁用, 1-启用
     */

    /**
     * HTTP方法（GET, POST, PUT, DELETE等）
     */
    @TableField("http_method")
    private String httpMethod;

    private Integer isEnable;
    private Long createUser;
    private Long updateUser;
    private Integer isDel;
}
