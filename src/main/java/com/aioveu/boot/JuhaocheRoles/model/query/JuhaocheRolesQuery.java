package com.aioveu.boot.JuhaocheRoles.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 角色分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:48
 */
@Schema(description ="角色查询对象")
@Getter
@Setter
public class JuhaocheRolesQuery extends BasePageQuery {

    @Schema(description = "角色名称")
    private String name;
    @Schema(description = "角色编码")
    private String code;
    @Schema(description = "角色类型(admin,buyer,seller,staff)")
    private String roleType;
    @Schema(description = "角色描述")
    private String description;
}
