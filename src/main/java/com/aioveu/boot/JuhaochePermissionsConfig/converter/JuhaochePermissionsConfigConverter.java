package com.aioveu.boot.JuhaochePermissionsConfig.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaochePermissionsConfig.model.entity.JuhaochePermissionsConfig;
import com.aioveu.boot.JuhaochePermissionsConfig.model.form.JuhaochePermissionsConfigForm;

/**
 * 权限配置对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:51
 */
@Mapper(componentModel = "spring")
public interface JuhaochePermissionsConfigConverter{

    JuhaochePermissionsConfigForm toForm(JuhaochePermissionsConfig entity);

    JuhaochePermissionsConfig toEntity(JuhaochePermissionsConfigForm formData);
}