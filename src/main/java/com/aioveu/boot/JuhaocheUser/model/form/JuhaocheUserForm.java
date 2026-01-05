package com.aioveu.boot.JuhaocheUser.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import jakarta.validation.constraints.*;

/**
 * 用户表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:45
 */
@Getter
@Setter
@Schema(description = "用户表单对象")
public class JuhaocheUserForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    private Long userId;

    @NotBlank(message = "不能为空")
    @Size(max=50, message="长度不能超过50个字符")
    private String name;

    @NotBlank(message = "不能为空")
    @Size(max=100, message="长度不能超过100个字符")
    private String password;

    @Size(max=15, message="长度不能超过15个字符")
    private String phone;

    @NotNull(message = "不能为空")
    private Integer isEnable;


    private Long createUser;


    private Long updateUser;

    private Integer isDel;


}
