package com.aioveu.boot.JuhaochePermissionsConfig.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 权限配置分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:51
 */
@Schema(description ="权限配置查询对象")
@Getter
@Setter
public class JuhaochePermissionsConfigQuery extends BasePageQuery {

}
