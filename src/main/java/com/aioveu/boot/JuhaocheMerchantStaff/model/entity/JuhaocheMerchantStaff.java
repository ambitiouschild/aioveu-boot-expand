package com.aioveu.boot.JuhaocheMerchantStaff.model.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import com.baomidou.mybatisplus.annotation.TableName;
import com.aioveu.boot.common.base.BaseEntity;

import java.time.LocalDateTime;

/**
 * 商户员工信息实体对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:54
 */
@Getter
@Setter
@TableName("juhaoche_merchant_staff")
@Builder
public class JuhaocheMerchantStaff extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    private Long userId;
    /**
     * 商户ID
     */
    private Long merchantId;
    /**
     * 员工编号
     */
    private String staffNo;
    /**
     * 真实姓名
     */
    private String realName;
    /**
     * 部门
     */
    private String department;
    /**
     * 职位
     */
    private String position;
    /**
     * 工作手机
     */
    private String workPhone;
    /**
     * 工作邮箱
     */
    private String workEmail;
    /**
     * 入职日期
     */
    private LocalDateTime entryDate;
    /**
     * 状态(0-离职,1-在职,2-停职)
     */
    private Integer status;
    /**
     * 备注
     */
    private String remark;
    /**
     * 启用状态
     */
    private Integer isEnable;
    private Long createUser;
    private Long updateUser;
    private Integer isDel;
}
