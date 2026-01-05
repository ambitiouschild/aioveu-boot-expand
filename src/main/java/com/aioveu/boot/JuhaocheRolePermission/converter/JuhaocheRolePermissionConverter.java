package com.aioveu.boot.JuhaocheRolePermission.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheRolePermission.model.entity.JuhaocheRolePermission;
import com.aioveu.boot.JuhaocheRolePermission.model.form.JuhaocheRolePermissionForm;

/**
 * 角色权限关联对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:50
 */
@Mapper(componentModel = "spring")
public interface JuhaocheRolePermissionConverter{

    JuhaocheRolePermissionForm toForm(JuhaocheRolePermission entity);

    JuhaocheRolePermission toEntity(JuhaocheRolePermissionForm formData);
}