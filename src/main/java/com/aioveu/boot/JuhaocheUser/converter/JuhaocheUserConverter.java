package com.aioveu.boot.JuhaocheUser.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheUser.model.entity.JuhaocheUser;
import com.aioveu.boot.JuhaocheUser.model.form.JuhaocheUserForm;

/**
 * 用户对象转换器
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:45
 */
@Mapper(componentModel = "spring")
public interface JuhaocheUserConverter{

    JuhaocheUserForm toForm(JuhaocheUser entity);

    JuhaocheUser toEntity(JuhaocheUserForm formData);
}