package com.aioveu.boot.aioveuLaundryGarmentIdentity.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.entity.AioveuLaundryGarmentIdentity;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.form.AioveuLaundryGarmentIdentityForm;

/**
 * 衣物唯一编码对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
@Mapper(componentModel = "spring")
public interface AioveuLaundryGarmentIdentityConverter{

    AioveuLaundryGarmentIdentityForm toForm(AioveuLaundryGarmentIdentity entity);

    AioveuLaundryGarmentIdentity toEntity(AioveuLaundryGarmentIdentityForm formData);
}