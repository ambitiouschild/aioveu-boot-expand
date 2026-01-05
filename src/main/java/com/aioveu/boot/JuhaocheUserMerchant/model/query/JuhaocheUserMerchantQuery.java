package com.aioveu.boot.JuhaocheUserMerchant.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 用户-商户关联分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Schema(description ="用户-商户关联查询对象")
@Getter
@Setter
public class JuhaocheUserMerchantQuery extends BasePageQuery {

}
