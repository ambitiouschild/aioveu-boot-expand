package com.aioveu.boot.JuhaocheMerchantStaff.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheMerchantStaff.model.entity.JuhaocheMerchantStaff;
import com.aioveu.boot.JuhaocheMerchantStaff.model.form.JuhaocheMerchantStaffForm;

/**
 * 商户员工信息对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:54
 */
@Mapper(componentModel = "spring")
public interface JuhaocheMerchantStaffConverter{

    JuhaocheMerchantStaffForm toForm(JuhaocheMerchantStaff entity);

    JuhaocheMerchantStaff toEntity(JuhaocheMerchantStaffForm formData);
}