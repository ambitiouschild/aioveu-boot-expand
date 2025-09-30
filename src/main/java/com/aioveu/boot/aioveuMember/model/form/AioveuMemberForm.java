package com.aioveu.boot.aioveuMember.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.math.BigDecimal;
import jakarta.validation.constraints.*;

/**
 * 会员信息管理表单对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 15:55
 */
@Getter
@Setter
@Schema(description = "会员信息管理表单对象")
public class AioveuMemberForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "会员ID")
    private Long id;

    // 手动添加setter方法
    public void setId(Long id) {
        System.out.println("设置ID: " + id); // 添加日志
        this.id = id;
    }

    @Schema(description = "会员卡号")
    @NotBlank(message = "会员卡号不能为空")
    @Size(max=20, message="会员卡号长度不能超过20个字符")
    private String memberNo;

    @Schema(description = "会员姓名")
    @NotBlank(message = "会员姓名不能为空")
    @Size(max=50, message="会员姓名长度不能超过50个字符")
    private String name;

    @Schema(description = "手机号")
    @NotBlank(message = "手机号不能为空")
    @Size(max=20, message="手机号长度不能超过20个字符")
    private String phone;

    @Schema(description = "身份证号")
    @Size(max=30, message="身份证号长度不能超过30个字符")
    private String idCard;

    @Schema(description = "会员等级")
    @NotNull(message = "会员等级不能为空")
    private Long levelId;

    @Schema(description = "入会时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime joinDate;

    @Schema(description = "累计消费金额")
    private BigDecimal totalConsumption;

    @Schema(description = "最后到店时间")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime lastVisit;

    @Schema(description = "状态")
    private Integer status;


}
