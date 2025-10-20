package com.aioveu.boot.aioveuLaundryGarmentTracking.service;

import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.form.AioveuLaundryGarmentIdentityForm;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.entity.AioveuLaundryGarmentTracking;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.form.AioveuLaundryGarmentTrackingForm;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.query.AioveuLaundryGarmentTrackingQuery;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.vo.AioveuLaundryGarmentTrackingVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;

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


    /**
     * 获取每个衣物编码的最新记录ID
     */
    List<Long> getLatestTrackingIdsByCodes(List<String> garmentCodes);


    /**
     * 批量查询最新流转记录
     */
    Map<String, AioveuLaundryGarmentTracking> getLatestTrackingByCodes(List<String> garmentCodes);


    /**
     * 新增衣物编码后自动创建衣物流转记录
     */
//    boolean createInitialTrackingRecord(AioveuLaundryGarmentIdentityForm formData);


    /*
     * 根据二维码查找最新流转记录
     */
    AioveuLaundryGarmentTracking getLatestTrackingByGarmentCode(String garmentCode);

}
