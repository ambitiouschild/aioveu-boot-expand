package com.aioveu.boot.aioveuLaundryGarmentTracking.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.entity.AioveuLaundryGarmentTracking;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.form.AioveuLaundryGarmentTrackingForm;

/**
 * 衣物流转记录对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:35
 */
@Mapper(componentModel = "spring")
public interface AioveuLaundryGarmentTrackingConverter{

    AioveuLaundryGarmentTrackingForm toForm(AioveuLaundryGarmentTracking entity);

    AioveuLaundryGarmentTracking toEntity(AioveuLaundryGarmentTrackingForm formData);
}