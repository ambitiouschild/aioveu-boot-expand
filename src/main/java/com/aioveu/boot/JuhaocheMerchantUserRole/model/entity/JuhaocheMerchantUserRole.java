package com.aioveu.boot.JuhaocheMerchantUserRole.model.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 商户用户角色实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:53
 */
@Getter
@Setter
@TableName("juhaoche_merchant_user_role")
@Builder
public class JuhaocheMerchantUserRole extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    private Long userId;
    /**
     * 商户ID
     */
    private Long merchantId;
    /**
     * 角色ID
     */
    private Long roleId;
    /**
     * 是否生效
     */
    private Integer isActive;
    /**
     * 授权时间
     */
    private LocalDateTime grantTime;
    /**
     * 授权人用户ID
     */
    private Long grantUserId;
    /**
     * 过期时间
     */
    private LocalDateTime expireTime;
    /**
     * 启用状态
     */
    private Integer isEnable;
    private Long createUser;
    private Long updateUser;
    private Integer isDel;
}
