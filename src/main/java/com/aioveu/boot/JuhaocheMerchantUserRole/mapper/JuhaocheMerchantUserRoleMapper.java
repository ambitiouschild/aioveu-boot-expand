package com.aioveu.boot.JuhaocheMerchantUserRole.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.entity.JuhaocheMerchantUserRole;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.query.JuhaocheMerchantUserRoleQuery;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.vo.JuhaocheMerchantUserRoleVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 商户用户角色Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:53
 */
@Mapper
public interface JuhaocheMerchantUserRoleMapper extends BaseMapper<JuhaocheMerchantUserRole> {

    /**
     * 获取商户用户角色分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<JuhaocheMerchantUserRoleVO>} 商户用户角色分页列表
     */
    Page<JuhaocheMerchantUserRoleVO> getJuhaocheMerchantUserRolePage(Page<JuhaocheMerchantUserRoleVO> page, JuhaocheMerchantUserRoleQuery queryParams);


    /**
     * 根据用户ID、商户ID、角色ID查询
     * 使用 MyBatis-Plus 的 LambdaQueryWrapper
     */
    default JuhaocheMerchantUserRole selectByUserAndMerchantAndRole(Long userId, Long merchantId, Long roleId) {
        if (userId == null || merchantId == null || roleId == null) {
            return null;
        }

        // 使用 LambdaQueryWrapper 构建查询条件
        LambdaQueryWrapper<JuhaocheMerchantUserRole> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(JuhaocheMerchantUserRole::getUserId, userId)
                .eq(JuhaocheMerchantUserRole::getMerchantId, merchantId)
                .eq(JuhaocheMerchantUserRole::getRoleId, roleId)
                .eq(JuhaocheMerchantUserRole::getIsEnable, 1)  // 启用状态
                .eq(JuhaocheMerchantUserRole::getIsDel, 0)     // 未删除
                .last("LIMIT 1");  // 限制返回一条记录

        return selectOne(queryWrapper);
    }

    /**
     * 根据用户ID、商户ID查询所有角色
     * 使用 MyBatis-Plus 的 LambdaQueryWrapper
     */
    default List<JuhaocheMerchantUserRole> selectByUserAndMerchant(Long userId, Long merchantId) {
        if (userId == null || merchantId == null) {
            return List.of();
        }

        // 使用 LambdaQueryWrapper 构建查询条件
        LambdaQueryWrapper<JuhaocheMerchantUserRole> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(JuhaocheMerchantUserRole::getUserId, userId)
                .eq(JuhaocheMerchantUserRole::getMerchantId, merchantId)
                .eq(JuhaocheMerchantUserRole::getIsEnable, 1)  // 启用状态
                .eq(JuhaocheMerchantUserRole::getIsDel, 0)     // 未删除
                .orderByDesc(JuhaocheMerchantUserRole::getCreateTime);  // 按创建时间倒序

        return selectList(queryWrapper);
    }
}
