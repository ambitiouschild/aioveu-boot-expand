package com.aioveu.boot.aioveuLaundryProcessImage.converter;

import com.aioveu.boot.aioveuLaundryProcessImage.model.vo.AioveuLaundryProcessImageVO;
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

    // 实体转VO表单
    AioveuLaundryProcessImageForm toForm(AioveuLaundryProcessImage entity);

    // 表单转实体
    AioveuLaundryProcessImage toEntity(AioveuLaundryProcessImageForm formData);

    // 实体转VO方法
    AioveuLaundryProcessImageVO toVo(AioveuLaundryProcessImage entity);
}