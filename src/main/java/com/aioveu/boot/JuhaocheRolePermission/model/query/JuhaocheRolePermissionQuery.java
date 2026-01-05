package com.aioveu.boot.JuhaocheRolePermission.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

/**
 * 角色权限关联分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:50
 */
@Schema(description ="角色权限关联查询对象")
@Getter
@Setter
public class JuhaocheRolePermissionQuery extends BasePageQuery {

    private LocalDateTime updateTime;
}
