package com.aioveu.boot.aioveuLaundryGarmentTracking.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.entity.AioveuLaundryGarmentTracking;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.query.AioveuLaundryGarmentTrackingQuery;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.vo.AioveuLaundryGarmentTrackingVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 衣物流转记录Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:35
 */
@Mapper
public interface AioveuLaundryGarmentTrackingMapper extends BaseMapper<AioveuLaundryGarmentTracking> {

    /**
     * 获取衣物流转记录分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<AioveuLaundryGarmentTrackingVO>} 衣物流转记录分页列表
     */
    Page<AioveuLaundryGarmentTrackingVO> getAioveuLaundryGarmentTrackingPage(Page<AioveuLaundryGarmentTrackingVO> page, AioveuLaundryGarmentTrackingQuery queryParams);

}
