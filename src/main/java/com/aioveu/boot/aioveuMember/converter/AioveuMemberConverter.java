package com.aioveu.boot.aioveuMember.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuMember.model.entity.AioveuMember;
import com.aioveu.boot.aioveuMember.model.form.AioveuMemberForm;

/**
 * 会员信息管理对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 15:55
 */

//我们使用了MapStruct，并且配置了componentModel = "spring"。但是，MapStruct默认使用字段直接访问（field access）而不是setter方法。
// 因此，即使我们在表单类中自定义了setter方法，MapStruct也不会调用它。
@Mapper(componentModel = "spring")
public interface AioveuMemberConverter{

    AioveuMemberForm toForm(AioveuMember entity);

    AioveuMember toEntity(AioveuMemberForm formData);
}