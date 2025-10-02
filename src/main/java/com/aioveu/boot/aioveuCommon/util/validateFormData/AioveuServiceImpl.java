package com.aioveu.boot.aioveuCommon.util.validateFormData;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.entity.AioveuMemberRechargeRecord;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.form.AioveuMemberRechargeRecordForm;
import com.aioveu.boot.common.result.Result;

import java.math.BigDecimal;

public class AioveuServiceImpl {

    public boolean saveAioveuMemberRechargeRecordandexecuteRecharge(AioveuMemberRechargeRecordForm formData) {

        //在服务方法中，如果仍然需要验证，可以保留validateFormData方法，但确保它包含对充值单号的校验。
        // 1. 验证表单数据
        validateFormData(formData);//在服务方法中，如果仍然需要验证

        return true;
    }

    /**
     * 验证表单数据
     */
    private void validateFormData(AioveuMemberRechargeRecordForm formData) {
        Assert.notNull(formData, "表单数据不能为空");
        Assert.notNull(formData.getMemberId(), "会员ID不能为空");
        Assert.notNull(formData.getAmount(), "充值金额不能为空");
        Assert.isTrue(formData.getAmount().compareTo(BigDecimal.ZERO) > 0, "充值金额必须大于0");
        Assert.notNull(formData.getPaymentType(), "支付方式不能为空");
    }
}
