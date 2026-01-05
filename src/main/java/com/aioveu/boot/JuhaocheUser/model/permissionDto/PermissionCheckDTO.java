package com.aioveu.boot.JuhaocheUser.model.permissionDto;


import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * 权限验证返回DTO
 */
@Data
@Builder
public class PermissionCheckDTO {


    /**
     * 是否拥有权限
     */
    private Boolean hasPermission;

    /**
     * 所需权限编码
     */
    private List<String> requiredPermissions;


    /**
     * 判断是否有权限的方法
     */
    public boolean isHasPermission() {
        return Boolean.TRUE.equals(hasPermission);
    }
}
