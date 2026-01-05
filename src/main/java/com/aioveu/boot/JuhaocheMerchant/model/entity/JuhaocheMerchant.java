package com.aioveu.boot.JuhaocheMerchant.model.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

/**
 * 商户主体实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Getter
@Setter
@TableName("juhaoche_merchant")
@Builder
public class JuhaocheMerchant extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 商户ID
     */
    private Long merchantId;
    /**
     * 商户名称
     */
    private String merchantName;
    /**
     * 商户编码
     */
    private String merchantCode;
    /**
     * 营业执照号
     */
    private String businessLicense;
    /**
     * 法人代表
     */
    private String legalPerson;
    /**
     * 联系手机
     */
    private String contactPhone;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 省份
     */
    private String province;
    /**
     * 城市
     */
    private String city;
    /**
     * 详细地址
     */
    private String address;
    /**
     * 行业类型
     */
    private String industryType;
    /**
     * 状态(0-待审核,1-正常,2-禁用,3-审核失败)
     */
    private Integer status;
    /**
     * 审核备注
     */
    private String auditRemark;
    /**
     * 审核时间
     */
    private LocalDateTime auditTime;
    /**
     * 审核人ID
     */
    private Long auditUserId;
    /**
     * 启用状态
     */
    private Integer isEnable;
    private Long createUser;
    private Long updateUser;
    private Integer isDel;
}
