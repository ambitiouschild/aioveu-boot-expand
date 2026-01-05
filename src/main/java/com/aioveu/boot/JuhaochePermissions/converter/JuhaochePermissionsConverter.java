package com.aioveu.boot.JuhaochePermissions.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaochePermissions.model.entity.JuhaochePermissions;
import com.aioveu.boot.JuhaochePermissions.model.form.JuhaochePermissionsForm;

/**
 * 权限对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:49
 */
@Mapper(componentModel = "spring")
public interface JuhaochePermissionsConverter{

    JuhaochePermissionsForm toForm(JuhaochePermissions entity);

    JuhaochePermissions toEntity(JuhaochePermissionsForm formData);
}