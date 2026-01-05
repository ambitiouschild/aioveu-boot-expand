package com.aioveu.boot.JuhaocheMerchant.service;

import com.aioveu.boot.JuhaocheMerchant.model.entity.JuhaocheMerchant;
import com.aioveu.boot.JuhaocheMerchant.model.form.JuhaocheMerchantForm;
import com.aioveu.boot.JuhaocheMerchant.model.query.JuhaocheMerchantQuery;
import com.aioveu.boot.JuhaocheMerchant.model.vo.JuhaocheMerchantVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 商户主体服务类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
public interface JuhaocheMerchantService extends IService<JuhaocheMerchant> {

    /**
     *商户主体分页列表
     *
     * @return {@link IPage<JuhaocheMerchantVO>} 商户主体分页列表
     */
    IPage<JuhaocheMerchantVO> getJuhaocheMerchantPage(JuhaocheMerchantQuery queryParams);

    /**
     * 获取商户主体表单数据
     *
     * @param id 商户主体ID
     * @return 商户主体表单数据
     */
     JuhaocheMerchantForm getJuhaocheMerchantFormData(Long id);

    /**
     * 新增商户主体
     *
     * @param formData 商户主体表单对象
     * @return 是否新增成功
     */
    boolean saveJuhaocheMerchant(JuhaocheMerchantForm formData);

    /**
     * 修改商户主体
     *
     * @param id   商户主体ID
     * @param formData 商户主体表单对象
     * @return 是否修改成功
     */
    boolean updateJuhaocheMerchant(Long id, JuhaocheMerchantForm formData);

    /**
     * 删除商户主体
     *
     * @param ids 商户主体ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteJuhaocheMerchants(String ids);



    /**
     * 检查营业执照号是否存在
     * @param businessLicense 营业执照号
     * @return true-已存在，false-不存在
     */
    boolean checkBusinessLicenseExists(String businessLicense);


    /**
     * 根据商户ID查询商户信息
     * @param merchantId 商户ID
     * @return 商户信息，不存在返回null
     */
    JuhaocheMerchant getByMerchantId(Long merchantId);


    /**
     * 根据商户ID获取商户编码
     */
    String getMerchantCode(Long merchantId);

}
