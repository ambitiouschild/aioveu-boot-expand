package com.aioveu.boot.JuhaocheRolePermission.model.form;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import jakarta.validation.constraints.*;

/**
 * 角色权限关联表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:50
 */
@Getter
@Setter
@Schema(description = "角色权限关联表单对象")
public class JuhaocheRolePermissionForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    @Schema(description = "角色ID")
    @NotNull(message = "角色ID不能为空")
    private Long roleId;

    @Schema(description = "权限ID")
    @NotNull(message = "权限ID不能为空")
    private Long permissionId;

    private LocalDateTime createTime;

    private Long createUser;

    private LocalDateTime updateTime;

    private Long updateUser;

    private Integer isDel;


}
