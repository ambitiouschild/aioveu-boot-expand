package com.aioveu.boot.JuhaocheUser.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 用户分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:45
 */
@Schema(description ="用户查询对象")
@Getter
@Setter
public class JuhaocheUserQuery extends BasePageQuery {

    private String name;
    private String password;
    private String phone;
    private Integer isEnable;
}
