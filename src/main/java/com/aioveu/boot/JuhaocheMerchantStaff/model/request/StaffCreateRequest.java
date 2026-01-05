package com.aioveu.boot.JuhaocheMerchantStaff.model.request;


import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.util.List;

/**
 * 创建子账号请求DTO
 */
@Data
public class StaffCreateRequest {


    @NotBlank(message = "手机号不能为空")
    @Pattern(regexp = "^1[3-9]\\d{9}$", message = "手机号格式不正确")
    private String phone;

    @NotBlank(message = "真实姓名不能为空")
    @Size(max = 50, message = "真实姓名长度不能超过50字符")
    private String realName;

    @Size(max = 50, message = "部门名称长度不能超过50字符")
    private String department;

    @Size(max = 50, message = "职位名称长度不能超过50字符")
    private String position;

    @NotEmpty(message = "至少分配一个角色")
    private List<Long> roleIds;
}
