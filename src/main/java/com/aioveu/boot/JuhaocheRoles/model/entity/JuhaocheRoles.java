package com.aioveu.boot.JuhaocheRoles.model.entity;

import lombok.Getter;
import lombok.Setter;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 角色实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:48
 */
@Getter
@Setter
@TableName("juhaoche_roles")
public class JuhaocheRoles extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 角色ID
     */
    private Long roleId;
    /**
     * 角色名称
     */
    private String name;
    /**
     * 角色编码
     */
    private String code;
    /**
     * 角色类型(admin,buyer,seller,staff)
     */
    private String roleType;
    /**
     * 角色描述
     */
    private String description;
    /**
     * 商户级别(0-平台级,1-商户级)
     */
    private Integer merchantLevel;
    /**
     * 状态: 0-禁用, 1-启用
     */
    private Integer isEnable;
    private Long createUser;
    private Long updateUser;
    private Integer isDel;
}
