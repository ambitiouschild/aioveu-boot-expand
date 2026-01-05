package com.aioveu.boot.JuhaochePermissions.model.entity;

import lombok.Getter;
import lombok.Setter;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 权限实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:49
 */
@Getter
@Setter
@TableName("juhaoche_permissions")
public class JuhaochePermissions extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 权限ID
     */
    private Long permissionId;
    /**
     * 权限名称
     */
    private String name;
    /**
     * 权限编码
     */
    private String code;
    /**
     * 权限描述
     */
    private String description;
    /**
     * 权限类型(menu,api,button)
     */
    private String permissionType;
    /**
     * 父权限ID
     */
    private Long parentId;
    /**
     * 状态: 0-禁用, 1-启用
     */
    private Integer isEnable;
    private Long createUser;
    private Long updateUser;
    private Integer isDel;
}
