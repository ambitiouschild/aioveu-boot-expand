package com.aioveu.boot.JuhaocheMerchant.model.dto;


import lombok.Builder;
import lombok.Data;

/**
 * 商户注册返回DTO
 */
@Data
@Builder
public class MerchantRegisterDTO {
    private Long merchantId;
    private String merchantName;
    private String auditStatus;
}
