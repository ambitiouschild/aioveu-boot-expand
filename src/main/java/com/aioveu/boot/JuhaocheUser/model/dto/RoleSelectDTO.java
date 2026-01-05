package com.aioveu.boot.JuhaocheUser.model.dto;


import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * 角色选择返回DTO
 */
@Data
@Builder
public class RoleSelectDTO {

    private String accessToken;
    private MerchantInfoDTO merchantInfo;
    private RoleInfoDTO roleInfo;
    private List<String> permissions;
}
