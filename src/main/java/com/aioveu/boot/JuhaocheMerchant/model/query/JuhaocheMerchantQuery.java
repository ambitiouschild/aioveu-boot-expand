package com.aioveu.boot.JuhaocheMerchant.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 商户主体分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Schema(description ="商户主体查询对象")
@Getter
@Setter
public class JuhaocheMerchantQuery extends BasePageQuery {

}
