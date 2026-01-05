package com.aioveu.boot.JuhaocheUser.model.dto;


import lombok.Builder;
import lombok.Data;

/**
 * 商户信息DTO
 */
@Data
@Builder

public class MerchantInfoDTO {

    private Long merchantId;
    private String merchantName;
    private String merchantCode;
}
