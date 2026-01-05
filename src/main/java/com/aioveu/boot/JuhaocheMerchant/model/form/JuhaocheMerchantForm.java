package com.aioveu.boot.JuhaocheMerchant.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.*;

/**
 * 商户主体表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Getter
@Setter
@Schema(description = "商户主体表单对象")
public class JuhaocheMerchantForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键ID")
    private Long id;

    @Schema(description = "商户ID")
    private Long merchantId;

    @Schema(description = "商户名称")
    @NotBlank(message = "商户名称不能为空")
    @Size(max=100, message="商户名称长度不能超过100个字符")
    private String merchantName;

    @Schema(description = "商户编码")
    @NotBlank(message = "商户编码不能为空")
    @Size(max=50, message="商户编码长度不能超过50个字符")
    private String merchantCode;

    @Schema(description = "营业执照号")
    @NotBlank(message = "营业执照号不能为空")
    @Size(max=50, message="营业执照号长度不能超过50个字符")
    private String businessLicense;

    @Schema(description = "法人代表")
    @Size(max=50, message="法人代表长度不能超过50个字符")
    private String legalPerson;

    @Schema(description = "联系手机")
    @NotBlank(message = "联系手机不能为空")
    @Size(max=15, message="联系手机长度不能超过15个字符")
    private String contactPhone;

    @Schema(description = "邮箱")
    @Size(max=100, message="邮箱长度不能超过100个字符")
    private String email;

    @Schema(description = "省份")
    @Size(max=50, message="省份长度不能超过50个字符")
    private String province;

    @Schema(description = "城市")
    @Size(max=50, message="城市长度不能超过50个字符")
    private String city;

    @Schema(description = "详细地址")
    @Size(max=200, message="详细地址长度不能超过200个字符")
    private String address;

    @Schema(description = "行业类型")
    @Size(max=50, message="行业类型长度不能超过50个字符")
    private String industryType;

    @Schema(description = "状态(0-待审核,1-正常,2-禁用,3-审核失败)")
    @NotNull(message = "状态(0-待审核,1-正常,2-禁用,3-审核失败)不能为空")
    private Integer status;

    @Schema(description = "审核备注")
    @Size(max=200, message="审核备注长度不能超过200个字符")
    private String auditRemark;

    @Schema(description = "审核时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime auditTime;

    @Schema(description = "审核人ID")
    private Long auditUserId;

    @Schema(description = "启用状态")
    @NotNull(message = "启用状态不能为空")
    private Integer isEnable;


    private Long createUser;


    private Long updateUser;

    @NotNull(message = "不能为空")
    private Integer isDel;


}
