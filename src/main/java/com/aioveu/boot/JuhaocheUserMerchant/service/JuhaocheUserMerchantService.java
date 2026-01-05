package com.aioveu.boot.JuhaocheUserMerchant.service;

import com.aioveu.boot.JuhaocheUserMerchant.model.entity.JuhaocheUserMerchant;
import com.aioveu.boot.JuhaocheUserMerchant.model.form.JuhaocheUserMerchantForm;
import com.aioveu.boot.JuhaocheUserMerchant.model.query.JuhaocheUserMerchantQuery;
import com.aioveu.boot.JuhaocheUserMerchant.model.vo.JuhaocheUserMerchantVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 用户-商户关联服务类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
public interface JuhaocheUserMerchantService extends IService<JuhaocheUserMerchant> {

    /**
     *用户-商户关联分页列表
     *
     * @return {@link IPage<JuhaocheUserMerchantVO>} 用户-商户关联分页列表
     */
    IPage<JuhaocheUserMerchantVO> getJuhaocheUserMerchantPage(JuhaocheUserMerchantQuery queryParams);

    /**
     * 获取用户-商户关联表单数据
     *
     * @param id 用户-商户关联ID
     * @return 用户-商户关联表单数据
     */
     JuhaocheUserMerchantForm getJuhaocheUserMerchantFormData(Long id);

    /**
     * 新增用户-商户关联
     *
     * @param formData 用户-商户关联表单对象
     * @return 是否新增成功
     */
    boolean saveJuhaocheUserMerchant(JuhaocheUserMerchantForm formData);

    /**
     * 修改用户-商户关联
     *
     * @param id   用户-商户关联ID
     * @param formData 用户-商户关联表单对象
     * @return 是否修改成功
     */
    boolean updateJuhaocheUserMerchant(Long id, JuhaocheUserMerchantForm formData);

    /**
     * 删除用户-商户关联
     *
     * @param ids 用户-商户关联ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteJuhaocheUserMerchants(String ids);

    /**
     * 检查用户是否为商户的主账号
     * @param userId 用户ID
     * @param merchantId 商户ID
     * @return true-是主账号，false-不是主账号或不存在关联
     */
    boolean isMerchantOwner(Long userId, Long merchantId);

    /**
     * 获取用户关联的商户列表
     */
    List<JuhaocheUserMerchant> getUserMerchants(Long userId);

}
