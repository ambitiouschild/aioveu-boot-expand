package com.aioveu.boot.aioveuCommon.util.validateFormData;


import jakarta.validation.constraints.NotBlank;

//步骤1：在表单类中添加校验注解
public class AioveuForm {

    @NotBlank(message = "充值单号不能为空")
    private String rechargeNo;
}
