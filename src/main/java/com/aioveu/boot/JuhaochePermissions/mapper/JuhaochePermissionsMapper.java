package com.aioveu.boot.JuhaochePermissions.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.JuhaochePermissions.model.entity.JuhaochePermissions;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaochePermissions.model.query.JuhaochePermissionsQuery;
import com.aioveu.boot.JuhaochePermissions.model.vo.JuhaochePermissionsVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 权限Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:49
 */
@Mapper
public interface JuhaochePermissionsMapper extends BaseMapper<JuhaochePermissions> {

    /**
     * 获取权限分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<JuhaochePermissionsVO>} 权限分页列表
     */
    Page<JuhaochePermissionsVO> getJuhaochePermissionsPage(Page<JuhaochePermissionsVO> page, JuhaochePermissionsQuery queryParams);

}
