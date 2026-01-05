package com.aioveu.boot.JuhaochePermissions.model.form;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import jakarta.validation.constraints.*;

/**
 * 权限表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:49
 */
@Getter
@Setter
@Schema(description = "权限表单对象")
public class JuhaochePermissionsForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键ID")
    private Long id;

    @Schema(description = "权限ID")
    private Long permissionId;

    @Schema(description = "权限名称")
    @NotBlank(message = "权限名称不能为空")
    @Size(max=100, message="权限名称长度不能超过100个字符")
    private String name;

    @Schema(description = "权限编码")
    @NotBlank(message = "权限编码不能为空")
    @Size(max=50, message="权限编码长度不能超过50个字符")
    private String code;

    @Schema(description = "权限描述")
    @Size(max=500, message="权限描述长度不能超过500个字符")
    private String description;

    @Schema(description = "权限类型(menu,api,button)")
    @NotBlank(message = "权限类型(menu,api,button)不能为空")
    @Size(max=20, message="权限类型(menu,api,button)长度不能超过20个字符")
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
