package com.aioveu.boot.JuhaochePermissionsConfig.service;

import com.aioveu.boot.JuhaochePermissionsConfig.model.entity.JuhaochePermissionsConfig;
import com.aioveu.boot.JuhaochePermissionsConfig.model.form.JuhaochePermissionsConfigForm;
import com.aioveu.boot.JuhaochePermissionsConfig.model.query.JuhaochePermissionsConfigQuery;
import com.aioveu.boot.JuhaochePermissionsConfig.model.vo.JuhaochePermissionsConfigVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 权限配置服务类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:51
 */
public interface JuhaochePermissionsConfigService extends IService<JuhaochePermissionsConfig> {

    /**
     *权限配置分页列表
     *
     * @return {@link IPage<JuhaochePermissionsConfigVO>} 权限配置分页列表
     */
    IPage<JuhaochePermissionsConfigVO> getJuhaochePermissionsConfigPage(JuhaochePermissionsConfigQuery queryParams);

    /**
     * 获取权限配置表单数据
     *
     * @param id 权限配置ID
     * @return 权限配置表单数据
     */
     JuhaochePermissionsConfigForm getJuhaochePermissionsConfigFormData(Long id);

    /**
     * 新增权限配置
     *
     * @param formData 权限配置表单对象
     * @return 是否新增成功
     */
    boolean saveJuhaochePermissionsConfig(JuhaochePermissionsConfigForm formData);

    /**
     * 修改权限配置
     *
     * @param id   权限配置ID
     * @param formData 权限配置表单对象
     * @return 是否修改成功
     */
    boolean updateJuhaochePermissionsConfig(Long id, JuhaochePermissionsConfigForm formData);

    /**
     * 删除权限配置
     *
     * @param ids 权限配置ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteJuhaochePermissionsConfigs(String ids);


    /**
     * 根据API路径和HTTP方法获取权限配置
     */
    JuhaochePermissionsConfig getByApiPath(String apiPath, String httpMethod);

}
