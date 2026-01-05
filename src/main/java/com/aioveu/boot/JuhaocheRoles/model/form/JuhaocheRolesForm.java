package com.aioveu.boot.JuhaocheRoles.model.form;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import jakarta.validation.constraints.*;

/**
 * 角色表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:48
 */
@Getter
@Setter
@Schema(description = "角色表单对象")
public class JuhaocheRolesForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键ID")
    private Long id;

    @Schema(description = "角色ID")
    private Long roleId;

    @Schema(description = "角色名称")
    @NotBlank(message = "角色名称不能为空")
    @Size(max=100, message="角色名称长度不能超过100个字符")
    private String name;

    @Schema(description = "角色编码")
    @NotBlank(message = "角色编码不能为空")
    @Size(max=50, message="角色编码长度不能超过50个字符")
    private String code;

    @Schema(description = "角色类型(admin,buyer,seller,staff)")
    @NotBlank(message = "角色类型(admin,buyer,seller,staff)不能为空")
    @Size(max=20, message="角色类型(admin,buyer,seller,staff)长度不能超过20个字符")
    private String roleType;

    @Schema(description = "角色描述")
    @Size(max=500, message="角色描述长度不能超过500个字符")
    private String description;

    @Schema(description = "商户级别(0-平台级,1-商户级)")
    private Integer merchantLevel;

    @Schema(description = "状态: 0-禁用, 1-启用")
    private Integer isEnable;

    private LocalDateTime createTime;

    private Long createUser;

    private LocalDateTime updateTime;

    private Long updateUser;

    private Integer isDel;


}
