package com.aioveu.boot.aioveuCommon.util.validateFormData;

import com.aioveu.boot.aioveuMemberRechargeRecord.model.form.AioveuMemberRechargeRecordForm;
import com.aioveu.boot.aioveuMemberRechargeRecord.service.AioveuMemberRechargeRecordService;
import com.aioveu.boot.common.result.Result;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

public class AioveuController {

    //步骤2：在控制器方法参数前添加@Valid注解

    @Operation(summary = "新增会员充值记录")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuMemberRechargeRecord:aioveu-member-recharge-record:add')")
    //在控制器中，使用@Valid注解触发校验。
    public Result<Void> saveAioveuMemberRechargeRecord(@RequestBody @Valid AioveuMemberRechargeRecordForm formData ) {

        return Result.failed();
    }


    @Operation(summary = "新增会员充值记录执行充值")
    @PostMapping("/execute") // 修改为不同的路径
    //会员充值通常不用"recharge"这个词，更倾向于使用"add credit"或"renew membership"。
    //add credit‌：直接为账户增加余额，适用于手机话费、会员服务等场景。
    //renew membership‌：侧重会员资格的续订，常见于订阅服务。
    //recharge"主要用于设备充电
    //在会员体系中，若涉及设备租赁或实体卡充值，可能会使用"recharge card"，但日常会员服务充值更倾向用"add credit"或"renew membership"。
    @PreAuthorize("@ss.hasPerm('aioveuMemberRechargeRecord:aioveu-member-recharge-record:recharge')")
    public Result<Void> saveAioveuMemberRechargeRecordandexecuteRecharge(@RequestBody AioveuMemberRechargeRecordForm formData) {
            return Result.failed();
    }
}
