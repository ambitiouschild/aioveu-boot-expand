package com.aioveu.boot.JuhaocheUser.model.dto;


import lombok.Builder;
import lombok.Data;

/**
 * 角色信息DTO
 */
@Data
@Builder
public class RoleInfoDTO {

    private Long roleId;
    private String roleName;
    private String roleCode;
}
