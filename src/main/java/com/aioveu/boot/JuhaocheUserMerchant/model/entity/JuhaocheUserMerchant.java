package com.aioveu.boot.JuhaocheUserMerchant.model.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 用户-商户关联实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Getter
@Setter
@TableName("juhaoche_user_merchant")
@Builder
public class JuhaocheUserMerchant extends BaseEntity {

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
     * 是否主账号(0-否,1-是)
     */
    private Integer isOwner;
    /**
     * 加入时间
     */
    private LocalDateTime joinTime;
    /**
     * 邀请人用户ID
     */
    private Long inviteUserId;
    /**
     * 启用状态
     */
    private Integer isEnable;
    private Long createUser;
    private Long updateUser;
    private Integer isDel;
}
