package com.aioveu.boot.JuhaocheUserMerchant.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheUserMerchant.model.entity.JuhaocheUserMerchant;
import com.aioveu.boot.JuhaocheUserMerchant.model.form.JuhaocheUserMerchantForm;

/**
 * 用户-商户关联对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Mapper(componentModel = "spring")
public interface JuhaocheUserMerchantConverter{

    JuhaocheUserMerchantForm toForm(JuhaocheUserMerchant entity);

    JuhaocheUserMerchant toEntity(JuhaocheUserMerchantForm formData);
}