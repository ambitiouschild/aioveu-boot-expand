package com.aioveu.boot.JuhaocheUserMerchant.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.JuhaocheUserMerchant.model.entity.JuhaocheUserMerchant;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheUserMerchant.model.query.JuhaocheUserMerchantQuery;
import com.aioveu.boot.JuhaocheUserMerchant.model.vo.JuhaocheUserMerchantVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 用户-商户关联Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Mapper
public interface JuhaocheUserMerchantMapper extends BaseMapper<JuhaocheUserMerchant> {

    /**
     * 获取用户-商户关联分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<JuhaocheUserMerchantVO>} 用户-商户关联分页列表
     */
    Page<JuhaocheUserMerchantVO> getJuhaocheUserMerchantPage(Page<JuhaocheUserMerchantVO> page, JuhaocheUserMerchantQuery queryParams);


    /**
     * 根据用户ID获取用户关联的商户列表
     */
    default List<JuhaocheUserMerchant> selectByUserId(Long userId) {
        if (userId == null) {
            return List.of();
        }

        LambdaQueryWrapper<JuhaocheUserMerchant> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(JuhaocheUserMerchant::getUserId, userId)
                .eq(JuhaocheUserMerchant::getIsEnable, 1)
                .eq(JuhaocheUserMerchant::getIsDel, 0)
                .orderByDesc(JuhaocheUserMerchant::getCreateTime);

        return selectList(queryWrapper);
    }
}
