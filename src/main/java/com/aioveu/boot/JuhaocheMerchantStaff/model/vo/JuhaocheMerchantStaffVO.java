package com.aioveu.boot.JuhaocheMerchantStaff.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 商户员工信息视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:54
 */
@Getter
@Setter
@Schema( description = "商户员工信息视图对象")
public class JuhaocheMerchantStaffVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;
    @Schema(description = "用户ID")
    private Long userId;
    @Schema(description = "商户ID")
    private Long merchantId;
    @Schema(description = "员工编号")
    private String staffNo;
    @Schema(description = "真实姓名")
    private String realName;
    @Schema(description = "部门")
    private String department;
    @Schema(description = "职位")
    private String position;
    @Schema(description = "工作手机")
    private String workPhone;
    @Schema(description = "工作邮箱")
    private String workEmail;
    @Schema(description = "入职日期")
    private LocalDateTime entryDate;
    @Schema(description = "状态(0-离职,1-在职,2-停职)")
    private Integer status;
    @Schema(description = "备注")
    private String remark;
    @Schema(description = "启用状态")
    private Integer isEnable;
    private LocalDateTime createTime;
    private Long createUser;
    private LocalDateTime updateTime;
    private Long updateUser;
    private Integer isDel;
}
