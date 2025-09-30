package com.aioveu.boot.aioveuMember.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;
import java.math.BigDecimal;

/**
 * 会员信息管理分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 15:55
 */
@Schema(description ="会员信息管理查询对象")
@Getter
@Setter
public class AioveuMemberQuery extends BasePageQuery {

    @Schema(description = "会员ID")
    private Long id;
    @Schema(description = "会员卡号")
    private String memberNo;
    @Schema(description = "会员姓名")
    private String name;
    @Schema(description = "手机号")
    private String phone;
    @Schema(description = "会员等级")
    private Long levelId;
    @Schema(description = "状态")
    private Integer status;
}
