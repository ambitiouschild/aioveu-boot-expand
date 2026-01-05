package com.aioveu.boot.JuhaocheMerchant.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

/**
 * 商户主体视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Getter
@Setter
@Schema( description = "商户主体视图对象")
public class JuhaocheMerchantVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键ID")
    private Long id;
    @Schema(description = "商户ID")
    private Long merchantId;
    @Schema(description = "商户名称")
    private String merchantName;
    @Schema(description = "商户编码")
    private String merchantCode;
    @Schema(description = "营业执照号")
    private String businessLicense;
    @Schema(description = "法人代表")
    private String legalPerson;
    @Schema(description = "联系手机")
    private String contactPhone;
    @Schema(description = "邮箱")
    private String email;
    @Schema(description = "省份")
    private String province;
    @Schema(description = "城市")
    private String city;
    @Schema(description = "详细地址")
    private String address;
    @Schema(description = "行业类型")
    private String industryType;
    @Schema(description = "状态(0-待审核,1-正常,2-禁用,3-审核失败)")
    private Integer status;
    @Schema(description = "审核备注")
    private String auditRemark;
    @Schema(description = "审核时间")
    private LocalDateTime auditTime;
    @Schema(description = "审核人ID")
    private Long auditUserId;
    @Schema(description = "启用状态")
    private Integer isEnable;
    private LocalDateTime createTime;
    private Long createUser;
    private LocalDateTime updateTime;
    private Long updateUser;
    private Integer isDel;
}
