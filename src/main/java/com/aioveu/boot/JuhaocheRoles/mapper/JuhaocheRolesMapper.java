package com.aioveu.boot.JuhaocheRoles.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.JuhaocheRoles.model.entity.JuhaocheRoles;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheRoles.model.query.JuhaocheRolesQuery;
import com.aioveu.boot.JuhaocheRoles.model.vo.JuhaocheRolesVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 角色Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:48
 */
@Mapper
public interface JuhaocheRolesMapper extends BaseMapper<JuhaocheRoles> {

    /**
     * 获取角色分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<JuhaocheRolesVO>} 角色分页列表
     */
    Page<JuhaocheRolesVO> getJuhaocheRolesPage(Page<JuhaocheRolesVO> page, JuhaocheRolesQuery queryParams);

}
