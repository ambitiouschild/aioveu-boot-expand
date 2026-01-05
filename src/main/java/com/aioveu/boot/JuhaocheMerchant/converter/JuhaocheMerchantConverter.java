package com.aioveu.boot.JuhaocheMerchant.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheMerchant.model.entity.JuhaocheMerchant;
import com.aioveu.boot.JuhaocheMerchant.model.form.JuhaocheMerchantForm;

/**
 * 商户主体对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Mapper(componentModel = "spring")
public interface JuhaocheMerchantConverter{

    JuhaocheMerchantForm toForm(JuhaocheMerchant entity);

    JuhaocheMerchant toEntity(JuhaocheMerchantForm formData);
}