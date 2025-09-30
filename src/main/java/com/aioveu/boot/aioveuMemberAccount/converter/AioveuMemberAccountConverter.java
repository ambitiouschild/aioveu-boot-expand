package com.aioveu.boot.aioveuMemberAccount.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuMemberAccount.model.entity.AioveuMemberAccount;
import com.aioveu.boot.aioveuMemberAccount.model.form.AioveuMemberAccountForm;

/**
 * 会员充值账户对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:02
 */
@Mapper(componentModel = "spring")
public interface AioveuMemberAccountConverter{

    AioveuMemberAccountForm toForm(AioveuMemberAccount entity);

    AioveuMemberAccount toEntity(AioveuMemberAccountForm formData);
}