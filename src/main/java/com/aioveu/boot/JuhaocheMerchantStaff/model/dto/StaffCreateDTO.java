package com.aioveu.boot.JuhaocheMerchantStaff.model.dto;


import lombok.Builder;
import lombok.Data;

/**
 * 创建子账号返回DTO
 */
@Data
@Builder
public class StaffCreateDTO {


    private Long staffId;
    private String staffNo;
    private String realName;
    private String initialPassword;
}
