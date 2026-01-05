package com.aioveu.boot.JuhaochePermissionsConfig.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.JuhaochePermissionsConfig.model.entity.JuhaochePermissionsConfig;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaochePermissionsConfig.model.query.JuhaochePermissionsConfigQuery;
import com.aioveu.boot.JuhaochePermissionsConfig.model.vo.JuhaochePermissionsConfigVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 权限配置Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:51
 */
@Mapper
public interface JuhaochePermissionsConfigMapper extends BaseMapper<JuhaochePermissionsConfig> {

    /**
     * 获取权限配置分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<JuhaochePermissionsConfigVO>} 权限配置分页列表
     */
    Page<JuhaochePermissionsConfigVO> getJuhaochePermissionsConfigPage(Page<JuhaochePermissionsConfigVO> page, JuhaochePermissionsConfigQuery queryParams);

}
