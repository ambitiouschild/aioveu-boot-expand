package com.aioveu.boot.aioveuLaundryProcessImage.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryProcessImage.model.entity.AioveuLaundryProcessImage;
import com.aioveu.boot.aioveuLaundryProcessImage.model.form.AioveuLaundryProcessImageForm;

/**
 * 洗衣流程图片记录对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:58
 */
@Mapper(componentModel = "spring")
public interface AioveuLaundryProcessImageConverter{

    AioveuLaundryProcessImageForm toForm(AioveuLaundryProcessImage entity);

    AioveuLaundryProcessImage toEntity(AioveuLaundryProcessImageForm formData);
}