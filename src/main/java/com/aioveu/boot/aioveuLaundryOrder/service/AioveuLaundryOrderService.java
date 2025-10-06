package com.aioveu.boot.aioveuLaundryOrder.service;

import com.aioveu.boot.aioveuLaundryOrder.model.entity.AioveuLaundryOrder;
import com.aioveu.boot.aioveuLaundryOrder.model.form.AioveuLaundryOrderForm;
import com.aioveu.boot.aioveuLaundryOrder.model.query.AioveuLaundryOrderQuery;
import com.aioveu.boot.aioveuLaundryOrder.model.vo.AioveuLaundryOrderOptionVO;
import com.aioveu.boot.aioveuLaundryOrder.model.vo.AioveuLaundryOrderVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * 洗衣订单服务类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:43
 */
public interface AioveuLaundryOrderService extends IService<AioveuLaundryOrder> {

    /**
     *洗衣订单分页列表
     *
     * @return {@link IPage<AioveuLaundryOrderVO>} 洗衣订单分页列表
     */
    IPage<AioveuLaundryOrderVO> getAioveuLaundryOrderPage(AioveuLaundryOrderQuery queryParams);

    /**
     * 获取洗衣订单表单数据
     *
     * @param id 洗衣订单ID
     * @return 洗衣订单表单数据
     */
     AioveuLaundryOrderForm getAioveuLaundryOrderFormData(Long id);

    /**
     * 新增洗衣订单
     *
     * @param formData 洗衣订单表单对象
     * @return 是否新增成功
     */
    boolean saveAioveuLaundryOrder(AioveuLaundryOrderForm formData);

    /**
     * 修改洗衣订单
     *
     * @param id   洗衣订单ID
     * @param formData 洗衣订单表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuLaundryOrder(Long id, AioveuLaundryOrderForm formData);

    /**
     * 删除洗衣订单
     *
     * @param ids 洗衣订单ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuLaundryOrders(String ids);

    /**
     * 获取选项列表（用于下拉选择框）
     *
     * @return 选项列表
     */
    List<AioveuLaundryOrderOptionVO> getAllLaundryOrderOptions();

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter  // 无参，全查
     */
    Map<Long, String> getLaundryOrderNoMap();

}
