package com.aioveu.boot.JuhaocheUser.model.permissionDto;


import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 权限验证请求DTO
 */
@Data
public class PermissionCheckRequest {


    @NotBlank(message = "接口路径不能为空")
    private String apiPath;

    @NotBlank(message = "请求方法不能为空")
    private String httpMethod;

}
