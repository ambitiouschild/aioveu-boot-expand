package com.aioveu.boot.JuhaochePermissionsConfig.model.form;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import jakarta.validation.constraints.*;

/**
 * 权限配置表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:51
 */
@Getter
@Setter
@Schema(description = "权限配置表单对象")
public class JuhaochePermissionsConfigForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "权限关联ID")
    private Long id;

    @Schema(description = "权限配置名称")
    @NotBlank(message = "权限配置名称不能为空")
    @Size(max=100, message="权限配置名称长度不能超过100个字符")
    private String name;

    @Schema(description = "API路径")
    @NotBlank(message = "API路径不能为空")
    @Size(max=200, message="API路径长度不能超过200个字符")
    private String apiPath;

    @Schema(description = "权限编码")
    @NotBlank(message = "权限编码不能为空")
    @Size(max=100, message="权限编码长度不能超过100个字符")
    private String permissionIds;

    @Schema(description = "权限配置描述")
    @Size(max=500, message="权限配置描述长度不能超过500个字符")
    private String description;

    @Schema(description = "权限类型")
    @NotNull(message = "权限类型不能为空")
    private Integer type;

    @Schema(description = "状态: 0-禁用, 1-启用")
    private Integer isEnable;

    private LocalDateTime createTime;

    private Long createUser;

    private LocalDateTime updateTime;

    private Long updateUser;

    private Integer isDel;


}
