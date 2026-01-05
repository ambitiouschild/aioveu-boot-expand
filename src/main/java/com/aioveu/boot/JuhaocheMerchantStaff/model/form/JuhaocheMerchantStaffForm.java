package com.aioveu.boot.JuhaocheMerchantStaff.model.form;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import jakarta.validation.constraints.*;

/**
 * 商户员工信息表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:54
 */
@Getter
@Setter
@Schema(description = "商户员工信息表单对象")
public class JuhaocheMerchantStaffForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    @Schema(description = "用户ID")
    @NotNull(message = "用户ID不能为空")
    private Long userId;

    @Schema(description = "商户ID")
    @NotNull(message = "商户ID不能为空")
    private Long merchantId;

    @Schema(description = "员工编号")
    @NotBlank(message = "员工编号不能为空")
    @Size(max=50, message="员工编号长度不能超过50个字符")
    private String staffNo;

    @Schema(description = "真实姓名")
    @NotBlank(message = "真实姓名不能为空")
    @Size(max=50, message="真实姓名长度不能超过50个字符")
    private String realName;

    @Schema(description = "部门")
    @Size(max=50, message="部门长度不能超过50个字符")
    private String department;

    @Schema(description = "职位")
    @Size(max=50, message="职位长度不能超过50个字符")
    private String position;

    @Schema(description = "工作手机")
    @Size(max=15, message="工作手机长度不能超过15个字符")
    private String workPhone;

    @Schema(description = "工作邮箱")
    @Size(max=100, message="工作邮箱长度不能超过100个字符")
    private String workEmail;

    @Schema(description = "入职日期")
    private LocalDateTime entryDate;

    @Schema(description = "状态(0-离职,1-在职,2-停职)")
    @NotNull(message = "状态(0-离职,1-在职,2-停职)不能为空")
    private Integer status;

    @Schema(description = "备注")
    @Size(max=200, message="备注长度不能超过200个字符")
    private String remark;

    @Schema(description = "启用状态")
    @NotNull(message = "启用状态不能为空")
    private Integer isEnable;

    private LocalDateTime createTime;

    private Long createUser;

    private LocalDateTime updateTime;

    private Long updateUser;

    @NotNull(message = "不能为空")
    private Integer isDel;


}
