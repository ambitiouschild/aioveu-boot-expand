package com.aioveu.boot.aioveuLaundryOrderItem.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryOrderItem.model.entity.AioveuLaundryOrderItem;
import com.aioveu.boot.aioveuLaundryOrderItem.model.form.AioveuLaundryOrderItemForm;

/**
 * 洗衣订单衣物明细对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:55
 */
@Mapper(componentModel = "spring")
public interface AioveuLaundryOrderItemConverter{

    AioveuLaundryOrderItemForm toForm(AioveuLaundryOrderItem entity);

    AioveuLaundryOrderItem toEntity(AioveuLaundryOrderItemForm formData);
}