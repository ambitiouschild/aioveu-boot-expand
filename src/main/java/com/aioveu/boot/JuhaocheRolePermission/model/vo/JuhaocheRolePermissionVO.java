package com.aioveu.boot.JuhaocheRolePermission.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 角色权限关联视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:50
 */
@Getter
@Setter
@Schema( description = "角色权限关联视图对象")
public class JuhaocheRolePermissionVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;
    @Schema(description = "角色ID")
    private Long roleId;
    @Schema(description = "权限ID")
    private Long permissionId;
    private LocalDateTime createTime;
    private Long createUser;
    private LocalDateTime updateTime;
    private Long updateUser;
    private Integer isDel;
}
