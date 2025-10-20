package com.aioveu.boot.aioveuLaundryOrderItem.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryOrderItem.model.entity.AioveuLaundryOrderItem;
import com.aioveu.boot.aioveuLaundryOrderItem.model.form.AioveuLaundryOrderItemForm;
import org.mapstruct.Mapping;

/**
 * 洗衣订单衣物明细对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:55
 */
@Mapper(componentModel = "spring")
public interface AioveuLaundryOrderItemConverter{

    AioveuLaundryOrderItemForm toForm(AioveuLaundryOrderItem entity);

//    @Mapping(source = "totalOrderItemDesc", target = "totalOrderItemDesc")
    AioveuLaundryOrderItem toEntity(AioveuLaundryOrderItemForm formData);
}


//3. 清理并重新构建项目
//删除 target目录
//
//执行 mvn clean install
//
//确保 MapStruct 重新生成实现类