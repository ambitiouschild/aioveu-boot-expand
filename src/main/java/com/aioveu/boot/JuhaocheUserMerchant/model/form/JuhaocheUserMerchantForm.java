package com.aioveu.boot.JuhaocheUserMerchant.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.*;

/**
 * 用户-商户关联表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Getter
@Setter
@Schema(description = "用户-商户关联表单对象")
public class JuhaocheUserMerchantForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    @Schema(description = "用户ID")
    private Long userId;

    @Schema(description = "商户ID")
    @NotNull(message = "商户ID不能为空")
    private Long merchantId;

    @Schema(description = "是否主账号(0-否,1-是)")
    @NotNull(message = "是否主账号(0-否,1-是)不能为空")
    private Integer isOwner;

    @Schema(description = "加入时间")
    @NotNull(message = "加入时间不能为空")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime joinTime;

    @Schema(description = "邀请人用户ID")
    private Long inviteUserId;

    @Schema(description = "启用状态")
    @NotNull(message = "启用状态不能为空")
    private Integer isEnable;

    private LocalDateTime createTime;

    private Long createUser;

    private LocalDateTime updateTime;

    private Long updateUser;

    @NotNull(message = "不能为空")
    private Integer isDel;


}
