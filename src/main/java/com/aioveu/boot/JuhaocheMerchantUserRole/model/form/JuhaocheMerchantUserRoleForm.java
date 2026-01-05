package com.aioveu.boot.JuhaocheMerchantUserRole.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.*;

/**
 * 商户用户角色表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:53
 */
@Getter
@Setter
@Schema(description = "商户用户角色表单对象")
public class JuhaocheMerchantUserRoleForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    @Schema(description = "用户ID")
    @NotNull(message = "用户ID不能为空")
    private Long userId;

    @Schema(description = "商户ID")
    @NotNull(message = "商户ID不能为空")
    private Long merchantId;

    @Schema(description = "角色ID")
    @NotNull(message = "角色ID不能为空")
    private Long roleId;

    @Schema(description = "是否生效")
    @NotNull(message = "是否生效不能为空")
    private Integer isActive;

    @Schema(description = "授权时间")
    @NotNull(message = "授权时间不能为空")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime grantTime;

    @Schema(description = "授权人用户ID")
    private Long grantUserId;

    @Schema(description = "过期时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime expireTime;

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
