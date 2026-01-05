package com.aioveu.boot.JuhaochePermissionsConfig.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 权限配置视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:51
 */
@Getter
@Setter
@Schema( description = "权限配置视图对象")
public class JuhaochePermissionsConfigVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "权限关联ID")
    private Long id;
    @Schema(description = "权限配置名称")
    private String name;
    @Schema(description = "API路径")
    private String apiPath;
    @Schema(description = "权限编码")
    private String permissionIds;
    @Schema(description = "权限配置描述")
    private String description;
    @Schema(description = "权限类型")
    private Integer type;
    @Schema(description = "状态: 0-禁用, 1-启用")
    private Integer isEnable;
    private LocalDateTime createTime;
    private Long createUser;
    private LocalDateTime updateTime;
    private Long updateUser;
    private Integer isDel;
}
