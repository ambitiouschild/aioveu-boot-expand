package com.aioveu.boot.JuhaocheRoles.model.dto;


import lombok.Builder;
import lombok.Data;

/**
 * 角色信息DTO
 */
@Data
@Builder
public class RolesDTO {


    private Long roleId;
    private String roleName;
    private String roleCode;
}
