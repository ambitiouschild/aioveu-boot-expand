package com.aioveu.boot.aioveuLaundryOrderItem.service;

import com.aioveu.boot.aioveuLaundryOrderItem.model.entity.AioveuLaundryOrderItem;
import com.aioveu.boot.aioveuLaundryOrderItem.model.form.AioveuLaundryOrderItemForm;
import com.aioveu.boot.aioveuLaundryOrderItem.model.query.AioveuLaundryOrderItemQuery;
import com.aioveu.boot.aioveuLaundryOrderItem.model.vo.AioveuLaundryOrderItemVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 洗衣订单衣物明细服务类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:55
 */
public interface AioveuLaundryOrderItemService extends IService<AioveuLaundryOrderItem> {

    /**
     *洗衣订单衣物明细分页列表
     *
     * @return {@link IPage<AioveuLaundryOrderItemVO>} 洗衣订单衣物明细分页列表
     */
    IPage<AioveuLaundryOrderItemVO> getAioveuLaundryOrderItemPage(AioveuLaundryOrderItemQuery queryParams);

    /**
     * 获取洗衣订单衣物明细表单数据
     *
     * @param id 洗衣订单衣物明细ID
     * @return 洗衣订单衣物明细表单数据
     */
     AioveuLaundryOrderItemForm getAioveuLaundryOrderItemFormData(Long id);

    /**
     * 新增洗衣订单衣物明细
     *
     * @param formData 洗衣订单衣物明细表单对象
     * @return 是否新增成功
     */
    boolean saveAioveuLaundryOrderItem(AioveuLaundryOrderItemForm formData);

    /**
     * 修改洗衣订单衣物明细
     *
     * @param id   洗衣订单衣物明细ID
     * @param formData 洗衣订单衣物明细表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuLaundryOrderItem(Long id, AioveuLaundryOrderItemForm formData);

    /**
     * 删除洗衣订单衣物明细
     *
     * @param ids 洗衣订单衣物明细ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuLaundryOrderItems(String ids);

}
