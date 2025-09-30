package com.aioveu.boot.aioveuMember.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 会员信息管理实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 15:55
 */
@Getter
@Setter
@TableName("aioveu_member")
public class AioveuMember extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 会员卡号
     */
    private String memberNo;
    /**
     * 会员姓名
     */
    private String name;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 身份证号
     */
    private String idCard;
    /**
     * 会员等级
     */
    private Long levelId;
    /**
     * 入会时间
     */
    private LocalDateTime joinDate;
    /**
     * 累计消费金额
     */
    private BigDecimal totalConsumption;
    /**
     * 最后到店时间
     */
    private LocalDateTime lastVisit;
    /**
     * 状态
     */
    private Integer status;
}
