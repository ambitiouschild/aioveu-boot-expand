package com.aioveu.boot.JuhaocheMerchantUserRole.service;

import com.aioveu.boot.JuhaocheMerchantUserRole.model.entity.JuhaocheMerchantUserRole;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.form.JuhaocheMerchantUserRoleForm;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.query.JuhaocheMerchantUserRoleQuery;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.vo.JuhaocheMerchantUserRoleVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 商户用户角色服务类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:53
 */
public interface JuhaocheMerchantUserRoleService extends IService<JuhaocheMerchantUserRole> {

    /**
     *商户用户角色分页列表
     *
     * @return {@link IPage<JuhaocheMerchantUserRoleVO>} 商户用户角色分页列表
     */
    IPage<JuhaocheMerchantUserRoleVO> getJuhaocheMerchantUserRolePage(JuhaocheMerchantUserRoleQuery queryParams);

    /**
     * 获取商户用户角色表单数据
     *
     * @param id 商户用户角色ID
     * @return 商户用户角色表单数据
     */
     JuhaocheMerchantUserRoleForm getJuhaocheMerchantUserRoleFormData(Long id);

    /**
     * 新增商户用户角色
     *
     * @param formData 商户用户角色表单对象
     * @return 是否新增成功
     */
    boolean saveJuhaocheMerchantUserRole(JuhaocheMerchantUserRoleForm formData);

    /**
     * 修改商户用户角色
     *
     * @param id   商户用户角色ID
     * @param formData 商户用户角色表单对象
     * @return 是否修改成功
     */
    boolean updateJuhaocheMerchantUserRole(Long id, JuhaocheMerchantUserRoleForm formData);

    /**
     * 删除商户用户角色
     *
     * @param ids 商户用户角色ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteJuhaocheMerchantUserRoles(String ids);


    /**
     * 获取用户在商户下的角色
     */
    public JuhaocheMerchantUserRole getUserRole(Long userId, Long merchantId, Long roleId);

    /**
     * 获取用户在商户下的所有角色
     */
    public List<JuhaocheMerchantUserRole> getUserRolesInMerchant(Long userId, Long merchantId);

}
