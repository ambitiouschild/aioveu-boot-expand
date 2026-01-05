package com.aioveu.boot.JuhaocheMerchantUserRole.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 商户用户角色分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:53
 */
@Schema(description ="商户用户角色查询对象")
@Getter
@Setter
public class JuhaocheMerchantUserRoleQuery extends BasePageQuery {

}
