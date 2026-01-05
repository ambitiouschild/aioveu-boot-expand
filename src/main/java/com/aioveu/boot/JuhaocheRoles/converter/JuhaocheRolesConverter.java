package com.aioveu.boot.JuhaocheRoles.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheRoles.model.entity.JuhaocheRoles;
import com.aioveu.boot.JuhaocheRoles.model.form.JuhaocheRolesForm;

/**
 * 角色对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:48
 */
@Mapper(componentModel = "spring")
public interface JuhaocheRolesConverter{

    JuhaocheRolesForm toForm(JuhaocheRoles entity);

    JuhaocheRoles toEntity(JuhaocheRolesForm formData);
}