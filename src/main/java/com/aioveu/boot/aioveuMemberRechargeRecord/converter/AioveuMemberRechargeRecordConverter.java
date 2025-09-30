package com.aioveu.boot.aioveuMemberRechargeRecord.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.entity.AioveuMemberRechargeRecord;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.form.AioveuMemberRechargeRecordForm;

/**
 * 会员充值记录对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:08
 */
@Mapper(componentModel = "spring")
public interface AioveuMemberRechargeRecordConverter{

    AioveuMemberRechargeRecordForm toForm(AioveuMemberRechargeRecord entity);

    AioveuMemberRechargeRecord toEntity(AioveuMemberRechargeRecordForm formData);
}