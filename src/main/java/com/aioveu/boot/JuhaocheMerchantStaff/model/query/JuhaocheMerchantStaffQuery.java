package com.aioveu.boot.JuhaocheMerchantStaff.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 商户员工信息分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:54
 */
@Schema(description ="商户员工信息查询对象")
@Getter
@Setter
public class JuhaocheMerchantStaffQuery extends BasePageQuery {

}
