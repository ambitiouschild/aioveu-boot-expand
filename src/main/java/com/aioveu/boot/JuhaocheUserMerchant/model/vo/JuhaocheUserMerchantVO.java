package com.aioveu.boot.JuhaocheUserMerchant.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

/**
 * 用户-商户关联视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Getter
@Setter
@Schema( description = "用户-商户关联视图对象")
public class JuhaocheUserMerchantVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;
    @Schema(description = "用户ID")
    private Long userId;
    @Schema(description = "商户ID")
    private Long merchantId;
    @Schema(description = "是否主账号(0-否,1-是)")
    private Integer isOwner;
    @Schema(description = "加入时间")
    private LocalDateTime joinTime;
    @Schema(description = "邀请人用户ID")
    private Long inviteUserId;
    @Schema(description = "启用状态")
    private Integer isEnable;
    private LocalDateTime createTime;
    private Long createUser;
    private LocalDateTime updateTime;
    private Long updateUser;
    private Integer isDel;
}
