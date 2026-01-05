package com.aioveu.boot.JuhaocheMerchantStaff.service;

import com.aioveu.boot.JuhaocheMerchantStaff.model.entity.JuhaocheMerchantStaff;
import com.aioveu.boot.JuhaocheMerchantStaff.model.form.JuhaocheMerchantStaffForm;
import com.aioveu.boot.JuhaocheMerchantStaff.model.query.JuhaocheMerchantStaffQuery;
import com.aioveu.boot.JuhaocheMerchantStaff.model.vo.JuhaocheMerchantStaffVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 商户员工信息服务类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:54
 */
public interface JuhaocheMerchantStaffService extends IService<JuhaocheMerchantStaff> {

    /**
     *商户员工信息分页列表
     *
     * @return {@link IPage<JuhaocheMerchantStaffVO>} 商户员工信息分页列表
     */
    IPage<JuhaocheMerchantStaffVO> getJuhaocheMerchantStaffPage(JuhaocheMerchantStaffQuery queryParams);

    /**
     * 获取商户员工信息表单数据
     *
     * @param id 商户员工信息ID
     * @return 商户员工信息表单数据
     */
     JuhaocheMerchantStaffForm getJuhaocheMerchantStaffFormData(Long id);

    /**
     * 新增商户员工信息
     *
     * @param formData 商户员工信息表单对象
     * @return 是否新增成功
     */
    boolean saveJuhaocheMerchantStaff(JuhaocheMerchantStaffForm formData);

    /**
     * 修改商户员工信息
     *
     * @param id   商户员工信息ID
     * @param formData 商户员工信息表单对象
     * @return 是否修改成功
     */
    boolean updateJuhaocheMerchantStaff(Long id, JuhaocheMerchantStaffForm formData);

    /**
     * 删除商户员工信息
     *
     * @param ids 商户员工信息ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteJuhaocheMerchantStaffs(String ids);

    /**
     * 检查手机号是否已存在于指定商户中
     * @param phone 手机号
     * @param merchantId 商户ID
     * @return true-已存在，false-不存在
     */
    boolean checkPhoneExistsInMerchant(String phone, Long merchantId);


    /**
     * 获取商户员工数量
     */
    long getStaffCount(Long merchantId);

}
