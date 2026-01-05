package com.aioveu.boot.JuhaocheMerchantUserRole.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.entity.JuhaocheMerchantUserRole;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.form.JuhaocheMerchantUserRoleForm;

/**
 * 商户用户角色对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:53
 */
@Mapper(componentModel = "spring")
public interface JuhaocheMerchantUserRoleConverter{

    JuhaocheMerchantUserRoleForm toForm(JuhaocheMerchantUserRole entity);

    JuhaocheMerchantUserRole toEntity(JuhaocheMerchantUserRoleForm formData);
}