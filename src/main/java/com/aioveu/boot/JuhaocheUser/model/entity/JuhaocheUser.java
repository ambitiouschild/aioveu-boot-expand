package com.aioveu.boot.JuhaocheUser.model.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 用户实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:45
 */
@Getter
@Setter
@TableName("juhaoche_user")
@Builder
public class JuhaocheUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private Long userId;
    private String name;
    private String password;
    private String phone;
    private Integer isEnable;
    private Long createUser;
    private Long updateUser;
    private Integer isDel;
}
