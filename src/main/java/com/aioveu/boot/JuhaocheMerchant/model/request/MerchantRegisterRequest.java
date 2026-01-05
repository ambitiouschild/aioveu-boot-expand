package com.aioveu.boot.JuhaocheMerchant.model.request;


import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * 商户注册请求DTO
 */
@Data
public class MerchantRegisterRequest {

    @NotBlank(message = "商户名称不能为空")
    @Size(max = 100, message = "商户名称长度不能超过100字符")
    private String merchantName;

    @NotBlank(message = "营业执照号不能为空")
    @Pattern(regexp = "^[0-9A-Z]{15,18}$", message = "营业执照号格式不正确")
    private String businessLicense;

    @NotBlank(message = "法人姓名不能为空")
    @Size(max = 50, message = "法人姓名长度不能超过50字符")
    private String legalPerson;

    @NotBlank(message = "联系手机不能为空")
    @Pattern(regexp = "^1[3-9]\\d{9}$", message = "手机号格式不正确")
    private String contactPhone;

    @NotBlank(message = "行业类型不能为空")
    private String industryType;

    @NotBlank(message = "经营地址不能为空")
    @Size(max = 200, message = "地址长度不能超过200字符")
    private String address;
}
