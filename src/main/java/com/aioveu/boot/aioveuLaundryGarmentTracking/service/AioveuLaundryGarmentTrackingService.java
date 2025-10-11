package com.aioveu.boot.aioveuLaundryGarmentTracking.service;

import com.aioveu.boot.aioveuLaundryGarmentTracking.model.entity.AioveuLaundryGarmentTracking;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.form.AioveuLaundryGarmentTrackingForm;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.query.AioveuLaundryGarmentTrackingQuery;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.vo.AioveuLaundryGarmentTrackingVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 衣物流转记录服务类
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:35
 */
public interface AioveuLaundryGarmentTrackingService extends IService<AioveuLaundryGarmentTracking> {

    /**
     *衣物流转记录分页列表
     *
     * @return {@link IPage<AioveuLaundryGarmentTrackingVO>} 衣物流转记录分页列表
     */
    IPage<AioveuLaundryGarmentTrackingVO> getAioveuLaundryGarmentTrackingPage(AioveuLaundryGarmentTrackingQuery queryParams);

    /**
     * 获取衣物流转记录表单数据
     *
     * @param id 衣物流转记录ID
     * @return 衣物流转记录表单数据
     */
     AioveuLaundryGarmentTrackingForm getAioveuLaundryGarmentTrackingFormData(Long id);

    /**
     * 新增衣物流转记录
     *
     * @param formData 衣物流转记录表单对象
     * @return 是否新增成功
     */
    boolean saveAioveuLaundryGarmentTracking(AioveuLaundryGarmentTrackingForm formData);

    /**
     * 修改衣物流转记录
     *
     * @param id   衣物流转记录ID
     * @param formData 衣物流转记录表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuLaundryGarmentTracking(Long id, AioveuLaundryGarmentTrackingForm formData);

    /**
     * 删除衣物流转记录
     *
     * @param ids 衣物流转记录ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuLaundryGarmentTrackings(String ids);

}
