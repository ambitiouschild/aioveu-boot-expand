package com.aioveu.boot.aioveuMemberLevel.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuMemberLevel.model.entity.AioveuMemberLevel;
import com.aioveu.boot.aioveuMemberLevel.model.form.AioveuMemberLevelForm;

/**
 * 会员等级对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 14:52
 */
@Mapper(componentModel = "spring")
public interface AioveuMemberLevelConverter{

    AioveuMemberLevelForm toForm(AioveuMemberLevel entity);

    AioveuMemberLevel toEntity(AioveuMemberLevelForm formData);
}