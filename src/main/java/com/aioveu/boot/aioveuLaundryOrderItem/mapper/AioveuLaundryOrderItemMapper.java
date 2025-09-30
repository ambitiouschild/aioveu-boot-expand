package com.aioveu.boot.aioveuLaundryOrderItem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuLaundryOrderItem.model.entity.AioveuLaundryOrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryOrderItem.model.query.AioveuLaundryOrderItemQuery;
import com.aioveu.boot.aioveuLaundryOrderItem.model.vo.AioveuLaundryOrderItemVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 洗衣订单衣物明细Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:55
 */
@Mapper
public interface AioveuLaundryOrderItemMapper extends BaseMapper<AioveuLaundryOrderItem> {

    /**
     * 获取洗衣订单衣物明细分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<AioveuLaundryOrderItemVO>} 洗衣订单衣物明细分页列表
     */
    Page<AioveuLaundryOrderItemVO> getAioveuLaundryOrderItemPage(Page<AioveuLaundryOrderItemVO> page, AioveuLaundryOrderItemQuery queryParams);

}
