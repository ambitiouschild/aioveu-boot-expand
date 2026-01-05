package com.aioveu.boot.JuhaocheRoles.service;

import com.aioveu.boot.JuhaocheRoles.model.entity.JuhaocheRoles;
import com.aioveu.boot.JuhaocheRoles.model.form.JuhaocheRolesForm;
import com.aioveu.boot.JuhaocheRoles.model.query.JuhaocheRolesQuery;
import com.aioveu.boot.JuhaocheRoles.model.vo.JuhaocheRolesVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 角色服务类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:48
 */
public interface JuhaocheRolesService extends IService<JuhaocheRoles> {

    /**
     *角色分页列表
     *
     * @return {@link IPage<JuhaocheRolesVO>} 角色分页列表
     */
    IPage<JuhaocheRolesVO> getJuhaocheRolesPage(JuhaocheRolesQuery queryParams);

    /**
     * 获取角色表单数据
     *
     * @param id 角色ID
     * @return 角色表单数据
     */
     JuhaocheRolesForm getJuhaocheRolesFormData(Long id);

    /**
     * 新增角色
     *
     * @param formData 角色表单对象
     * @return 是否新增成功
     */
    boolean saveJuhaocheRoles(JuhaocheRolesForm formData);

    /**
     * 修改角色
     *
     * @param id   角色ID
     * @param formData 角色表单对象
     * @return 是否修改成功
     */
    boolean updateJuhaocheRoles(Long id, JuhaocheRolesForm formData);

    /**
     * 删除角色
     *
     * @param ids 角色ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteJuhaocheRoless(String ids);

    /**
     * 根据角色编码查询角色信息
     * @param code 角色编码
     * @return 角色信息
     */
    JuhaocheRoles getByCode(String code);



}
