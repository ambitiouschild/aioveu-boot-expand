package com.aioveu.boot.JuhaocheUser.model.request;


import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 角色选择请求DTO
 */
@Data
public class RoleSelectRequest {

    @NotNull(message = "商户ID不能为空")
    private Long merchantId;

    @NotNull(message = "角色ID不能为空")
    private Long roleId;
}
