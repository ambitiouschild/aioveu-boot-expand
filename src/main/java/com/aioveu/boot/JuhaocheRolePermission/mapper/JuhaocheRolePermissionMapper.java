package com.aioveu.boot.JuhaocheRolePermission.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.JuhaocheRolePermission.model.entity.JuhaocheRolePermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheRolePermission.model.query.JuhaocheRolePermissionQuery;
import com.aioveu.boot.JuhaocheRolePermission.model.vo.JuhaocheRolePermissionVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 角色权限关联Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:50
 */
@Mapper
public interface JuhaocheRolePermissionMapper extends BaseMapper<JuhaocheRolePermission> {

    /**
     * 获取角色权限关联分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<JuhaocheRolePermissionVO>} 角色权限关联分页列表
     */
    Page<JuhaocheRolePermissionVO> getJuhaocheRolePermissionPage(Page<JuhaocheRolePermissionVO> page, JuhaocheRolePermissionQuery queryParams);

}
