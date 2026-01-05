package com.aioveu.boot.JuhaocheUser.service;

import com.aioveu.boot.JuhaocheUser.model.entity.JuhaocheUser;
import com.aioveu.boot.JuhaocheUser.model.form.JuhaocheUserForm;
import com.aioveu.boot.JuhaocheUser.model.query.JuhaocheUserQuery;
import com.aioveu.boot.JuhaocheUser.model.vo.JuhaocheUserVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 用户服务类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:45
 */
public interface JuhaocheUserService extends IService<JuhaocheUser> {

    /**
     *用户分页列表
     *
     * @return {@link IPage<JuhaocheUserVO>} 用户分页列表
     */
    IPage<JuhaocheUserVO> getJuhaocheUserPage(JuhaocheUserQuery queryParams);

    /**
     * 获取用户表单数据
     *
     * @param id 用户ID
     * @return 用户表单数据
     */
     JuhaocheUserForm getJuhaocheUserFormData(Long id);

    /**
     * 新增用户
     *
     * @param formData 用户表单对象
     * @return 是否新增成功
     */
    boolean saveJuhaocheUser(JuhaocheUserForm formData);

    /**
     * 修改用户
     *
     * @param id   用户ID
     * @param formData 用户表单对象
     * @return 是否修改成功
     */
    boolean updateJuhaocheUser(Long id, JuhaocheUserForm formData);

    /**
     * 删除用户
     *
     * @param ids 用户ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteJuhaocheUsers(String ids);

    /**
     * 根据手机号查询用户信息
     * @param phone 手机号
     * @return 用户信息，不存在返回null
     */
    JuhaocheUser getByPhone(String phone);

}
