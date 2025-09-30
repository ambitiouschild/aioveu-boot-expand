package com.aioveu.boot.aioveuLaundryOrder.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryOrder.model.entity.AioveuLaundryOrder;
import com.aioveu.boot.aioveuLaundryOrder.model.form.AioveuLaundryOrderForm;

/**
 * 洗衣订单对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:43
 */
@Mapper(componentModel = "spring")
public interface AioveuLaundryOrderConverter{

    AioveuLaundryOrderForm toForm(AioveuLaundryOrder entity);

    AioveuLaundryOrder toEntity(AioveuLaundryOrderForm formData);
}