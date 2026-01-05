package com.aioveu.boot.JuhaocheRolePermission.model.entity;

import lombok.Getter;
import lombok.Setter;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 角色权限关联实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:50
 */
@Getter
@Setter
@TableName("juhaoche_role_permission")
public class JuhaocheRolePermission extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 角色ID
     */
    private Long roleId;
    /**
     * 权限ID
     */
    private Long permissionId;
    private Long createUser;
    private Long updateUser;
    private Integer isDel;
}
