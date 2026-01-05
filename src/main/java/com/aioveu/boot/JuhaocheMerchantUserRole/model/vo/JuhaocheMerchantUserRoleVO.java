package com.aioveu.boot.JuhaocheMerchantUserRole.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

/**
 * 商户用户角色视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:53
 */
@Getter
@Setter
@Schema( description = "商户用户角色视图对象")
public class JuhaocheMerchantUserRoleVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;
    @Schema(description = "用户ID")
    private Long userId;
    @Schema(description = "商户ID")
    private Long merchantId;
    @Schema(description = "角色ID")
    private Long roleId;
    @Schema(description = "是否生效")
    private Integer isActive;
    @Schema(description = "授权时间")
    private LocalDateTime grantTime;
    @Schema(description = "授权人用户ID")
    private Long grantUserId;
    @Schema(description = "过期时间")
    private LocalDateTime expireTime;
    @Schema(description = "启用状态")
    private Integer isEnable;
    private LocalDateTime createTime;
    private Long createUser;
    private LocalDateTime updateTime;
    private Long updateUser;
    private Integer isDel;
}
