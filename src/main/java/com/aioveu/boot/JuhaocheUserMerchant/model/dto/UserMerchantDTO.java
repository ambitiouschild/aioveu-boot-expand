package com.aioveu.boot.JuhaocheUserMerchant.model.dto;


import com.aioveu.boot.JuhaocheRoles.model.dto.RolesDTO;
import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * 用户商户信息DTO
 */
@Data
@Builder
public class UserMerchantDTO {

    private Long merchantId;
    private String merchantName;
    private String merchantCode;
    private Boolean isOwner;
    private Integer merchantStatus;
    private List<RolesDTO> roles;
}
