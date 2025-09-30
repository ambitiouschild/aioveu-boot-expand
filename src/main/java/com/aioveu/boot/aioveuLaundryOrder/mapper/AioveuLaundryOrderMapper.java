package com.aioveu.boot.aioveuLaundryOrder.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuLaundryOrder.model.entity.AioveuLaundryOrder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryOrder.model.query.AioveuLaundryOrderQuery;
import com.aioveu.boot.aioveuLaundryOrder.model.vo.AioveuLaundryOrderVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 洗衣订单Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:43
 */
@Mapper
public interface AioveuLaundryOrderMapper extends BaseMapper<AioveuLaundryOrder> {

    /**
     * 获取洗衣订单分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<AioveuLaundryOrderVO>} 洗衣订单分页列表
     */
    Page<AioveuLaundryOrderVO> getAioveuLaundryOrderPage(Page<AioveuLaundryOrderVO> page, AioveuLaundryOrderQuery queryParams);

}
