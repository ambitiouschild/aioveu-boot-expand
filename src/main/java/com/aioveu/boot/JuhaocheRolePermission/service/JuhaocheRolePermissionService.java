package com.aioveu.boot.JuhaocheRolePermission.service;

import com.aioveu.boot.JuhaochePermissions.model.entity.JuhaochePermissions;
import com.aioveu.boot.JuhaocheRolePermission.model.entity.JuhaocheRolePermission;
import com.aioveu.boot.JuhaocheRolePermission.model.form.JuhaocheRolePermissionForm;
import com.aioveu.boot.JuhaocheRolePermission.model.query.JuhaocheRolePermissionQuery;
import com.aioveu.boot.JuhaocheRolePermission.model.vo.JuhaocheRolePermissionVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 角色权限关联服务类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:50
 */
public interface JuhaocheRolePermissionService extends IService<JuhaocheRolePermission> {

    /**
     *角色权限关联分页列表
     *
     * @return {@link IPage<JuhaocheRolePermissionVO>} 角色权限关联分页列表
     */
    IPage<JuhaocheRolePermissionVO> getJuhaocheRolePermissionPage(JuhaocheRolePermissionQuery queryParams);

    /**
     * 获取角色权限关联表单数据
     *
     * @param id 角色权限关联ID
     * @return 角色权限关联表单数据
     */
     JuhaocheRolePermissionForm getJuhaocheRolePermissionFormData(Long id);

    /**
     * 新增角色权限关联
     *
     * @param formData 角色权限关联表单对象
     * @return 是否新增成功
     */
    boolean saveJuhaocheRolePermission(JuhaocheRolePermissionForm formData);

    /**
     * 修改角色权限关联
     *
     * @param id   角色权限关联ID
     * @param formData 角色权限关联表单对象
     * @return 是否修改成功
     */
    boolean updateJuhaocheRolePermission(Long id, JuhaocheRolePermissionForm formData);

    /**
     * 删除角色权限关联
     *
     * @param ids 角色权限关联ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteJuhaocheRolePermissions(String ids);

    /**
     * 根据角色ID获取权限列表
     * @param roleId 角色ID
     * @return 权限列表
     */
    List<JuhaochePermissions> getPermissionsByRoleId(Long roleId);

}
