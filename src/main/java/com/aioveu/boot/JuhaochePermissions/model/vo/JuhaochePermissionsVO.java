package com.aioveu.boot.JuhaochePermissions.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 权限视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:49
 */
@Getter
@Setter
@Schema( description = "权限视图对象")
public class JuhaochePermissionsVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键ID")
    private Long id;
    @Schema(description = "权限ID")
    private Long permissionId;
    @Schema(description = "权限名称")
    private String name;
    @Schema(description = "权限编码")
    private String code;
    @Schema(description = "权限描述")
    private String description;
    @Schema(description = "权限类型(menu,api,button)")
    private String permissionType;
    @Schema(description = "父权限ID")
    private Long parentId;
    @Schema(description = "状态: 0-禁用, 1-启用")
    private Integer isEnable;
    private LocalDateTime createTime;
    private Long createUser;
    private LocalDateTime updateTime;
    private Long updateUser;
    private Integer isDel;
}
