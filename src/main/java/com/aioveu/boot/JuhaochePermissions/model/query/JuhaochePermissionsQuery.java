package com.aioveu.boot.JuhaochePermissions.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 权限分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:49
 */
@Schema(description ="权限查询对象")
@Getter
@Setter
public class JuhaochePermissionsQuery extends BasePageQuery {

    @Schema(description = "权限名称")
    private String name;
    @Schema(description = "权限编码")
    private String code;
    @Schema(description = "权限类型(menu,api,button)")
    private String permissionType;
}
