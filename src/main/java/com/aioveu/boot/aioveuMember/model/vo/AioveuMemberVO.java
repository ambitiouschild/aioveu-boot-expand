package com.aioveu.boot.aioveuMember.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;

/**
 * 会员信息管理视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 15:55
 */
@Getter
@Setter
@Schema( description = "会员信息管理视图对象")
public class AioveuMemberVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "会员ID")
    private Long id;
    @Schema(description = "会员卡号")
    private String memberNo;
    @Schema(description = "会员姓名")
    private String name;
    @Schema(description = "手机号")
    private String phone;
    @Schema(description = "身份证号")
    private String idCard;
    @Schema(description = "会员等级")
    private Long levelId;
    @Schema(description = "入会时间")
    private LocalDateTime joinDate;
    @Schema(description = "累计消费金额")
    private BigDecimal totalConsumption;
    @Schema(description = "最后到店时间")
    private LocalDateTime lastVisit;
    @Schema(description = "状态")
    private Integer status;
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
}
