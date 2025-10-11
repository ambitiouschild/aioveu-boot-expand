package com.aioveu.boot.aioveuLaundryGarmentIdentity.service;

import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.entity.AioveuLaundryGarmentIdentity;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.form.AioveuLaundryGarmentIdentityForm;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.query.AioveuLaundryGarmentIdentityQuery;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.vo.AioveuLaundryGarmentIdentityVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 衣物唯一编码服务类
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
public interface AioveuLaundryGarmentIdentityService extends IService<AioveuLaundryGarmentIdentity> {

    /**
     *衣物唯一编码分页列表
     *
     * @return {@link IPage<AioveuLaundryGarmentIdentityVO>} 衣物唯一编码分页列表
     */
    IPage<AioveuLaundryGarmentIdentityVO> getAioveuLaundryGarmentIdentityPage(AioveuLaundryGarmentIdentityQuery queryParams);

    /**
     * 获取衣物唯一编码表单数据
     *
     * @param id 衣物唯一编码ID
     * @return 衣物唯一编码表单数据
     */
     AioveuLaundryGarmentIdentityForm getAioveuLaundryGarmentIdentityFormData(Long id);

    /**
     * 新增衣物唯一编码
     *
     * @param formData 衣物唯一编码表单对象
     * @return 是否新增成功
     */
    boolean saveAioveuLaundryGarmentIdentity(AioveuLaundryGarmentIdentityForm formData);

    /**
     * 修改衣物唯一编码
     *
     * @param id   衣物唯一编码ID
     * @param formData 衣物唯一编码表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuLaundryGarmentIdentity(Long id, AioveuLaundryGarmentIdentityForm formData);

    /**
     * 删除衣物唯一编码
     *
     * @param ids 衣物唯一编码ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuLaundryGarmentIdentitys(String ids);

}
