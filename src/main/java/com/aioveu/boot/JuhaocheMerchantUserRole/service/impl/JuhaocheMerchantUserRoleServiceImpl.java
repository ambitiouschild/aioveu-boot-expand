package com.aioveu.boot.JuhaocheMerchantUserRole.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.JuhaocheMerchantUserRole.mapper.JuhaocheMerchantUserRoleMapper;
import com.aioveu.boot.JuhaocheMerchantUserRole.service.JuhaocheMerchantUserRoleService;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.entity.JuhaocheMerchantUserRole;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.form.JuhaocheMerchantUserRoleForm;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.query.JuhaocheMerchantUserRoleQuery;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.vo.JuhaocheMerchantUserRoleVO;
import com.aioveu.boot.JuhaocheMerchantUserRole.converter.JuhaocheMerchantUserRoleConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 商户用户角色服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:53
 */
@Service
@RequiredArgsConstructor
public class JuhaocheMerchantUserRoleServiceImpl extends ServiceImpl<JuhaocheMerchantUserRoleMapper, JuhaocheMerchantUserRole> implements JuhaocheMerchantUserRoleService {

    private final JuhaocheMerchantUserRoleConverter juhaocheMerchantUserRoleConverter;



    @Autowired
    private JuhaocheMerchantUserRoleMapper juhaocheMerchantUserRoleMapper;


    /**
    * 获取商户用户角色分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<JuhaocheMerchantUserRoleVO>} 商户用户角色分页列表
    */
    @Override
    public IPage<JuhaocheMerchantUserRoleVO> getJuhaocheMerchantUserRolePage(JuhaocheMerchantUserRoleQuery queryParams) {
        Page<JuhaocheMerchantUserRoleVO> pageVO = this.baseMapper.getJuhaocheMerchantUserRolePage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取商户用户角色表单数据
     *
     * @param id 商户用户角色ID
     * @return 商户用户角色表单数据
     */
    @Override
    public JuhaocheMerchantUserRoleForm getJuhaocheMerchantUserRoleFormData(Long id) {
        JuhaocheMerchantUserRole entity = this.getById(id);
        return juhaocheMerchantUserRoleConverter.toForm(entity);
    }
    
    /**
     * 新增商户用户角色
     *
     * @param formData 商户用户角色表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveJuhaocheMerchantUserRole(JuhaocheMerchantUserRoleForm formData) {
        JuhaocheMerchantUserRole entity = juhaocheMerchantUserRoleConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新商户用户角色
     *
     * @param id   商户用户角色ID
     * @param formData 商户用户角色表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateJuhaocheMerchantUserRole(Long id,JuhaocheMerchantUserRoleForm formData) {
        JuhaocheMerchantUserRole entity = juhaocheMerchantUserRoleConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除商户用户角色
     *
     * @param ids 商户用户角色ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteJuhaocheMerchantUserRoles(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的商户用户角色数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

    /**
     * 获取用户在商户下的角色
     */
    @Override
    public JuhaocheMerchantUserRole getUserRole(Long userId, Long merchantId, Long roleId) {
        return juhaocheMerchantUserRoleMapper.selectByUserAndMerchantAndRole(userId, merchantId, roleId);
    }

    /**
     * 获取用户在商户下的所有角色
     */
    @Override
    public List<JuhaocheMerchantUserRole> getUserRolesInMerchant(Long userId, Long merchantId) {
        return juhaocheMerchantUserRoleMapper.selectByUserAndMerchant(userId, merchantId);
    }

}
