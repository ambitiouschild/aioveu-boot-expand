package com.aioveu.boot.JuhaochePermissions.service;

import com.aioveu.boot.JuhaochePermissions.model.entity.JuhaochePermissions;
import com.aioveu.boot.JuhaochePermissions.model.form.JuhaochePermissionsForm;
import com.aioveu.boot.JuhaochePermissions.model.query.JuhaochePermissionsQuery;
import com.aioveu.boot.JuhaochePermissions.model.vo.JuhaochePermissionsVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 权限服务类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:49
 */
public interface JuhaochePermissionsService extends IService<JuhaochePermissions> {

    /**
     *权限分页列表
     *
     * @return {@link IPage<JuhaochePermissionsVO>} 权限分页列表
     */
    IPage<JuhaochePermissionsVO> getJuhaochePermissionsPage(JuhaochePermissionsQuery queryParams);

    /**
     * 获取权限表单数据
     *
     * @param id 权限ID
     * @return 权限表单数据
     */
     JuhaochePermissionsForm getJuhaochePermissionsFormData(Long id);

    /**
     * 新增权限
     *
     * @param formData 权限表单对象
     * @return 是否新增成功
     */
    boolean saveJuhaochePermissions(JuhaochePermissionsForm formData);

    /**
     * 修改权限
     *
     * @param id   权限ID
     * @param formData 权限表单对象
     * @return 是否修改成功
     */
    boolean updateJuhaochePermissions(Long id, JuhaochePermissionsForm formData);

    /**
     * 删除权限
     *
     * @param ids 权限ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteJuhaochePermissionss(String ids);

}
