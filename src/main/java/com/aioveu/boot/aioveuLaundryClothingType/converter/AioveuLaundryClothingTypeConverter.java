package com.aioveu.boot.aioveuLaundryClothingType.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryClothingType.model.entity.AioveuLaundryClothingType;
import com.aioveu.boot.aioveuLaundryClothingType.model.form.AioveuLaundryClothingTypeForm;

/**
 * 衣物类型对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
@Mapper(componentModel = "spring")
public interface AioveuLaundryClothingTypeConverter{

    AioveuLaundryClothingTypeForm toForm(AioveuLaundryClothingType entity);

    AioveuLaundryClothingType toEntity(AioveuLaundryClothingTypeForm formData);
}