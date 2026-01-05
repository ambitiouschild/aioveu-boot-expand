package com.aioveu.boot.JuhaocheUser.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.JuhaocheUser.model.entity.JuhaocheUser;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheUser.model.query.JuhaocheUserQuery;
import com.aioveu.boot.JuhaocheUser.model.vo.JuhaocheUserVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:45
 */
@Mapper
public interface JuhaocheUserMapper extends BaseMapper<JuhaocheUser> {

    /**
     * 获取用户分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<JuhaocheUserVO>} 用户分页列表
     */
    Page<JuhaocheUserVO> getJuhaocheUserPage(Page<JuhaocheUserVO> page, JuhaocheUserQuery queryParams);

}
