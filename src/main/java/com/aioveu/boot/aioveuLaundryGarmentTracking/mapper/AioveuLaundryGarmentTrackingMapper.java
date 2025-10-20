package com.aioveu.boot.aioveuLaundryGarmentTracking.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.entity.AioveuLaundryGarmentTracking;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.query.AioveuLaundryGarmentTrackingQuery;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.vo.AioveuLaundryGarmentTrackingVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

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


    /**
     * 获取每个衣物编码的最新记录ID
     */
    @Select({
            "<script>",
            "SELECT MAX(id) AS id",
            "FROM aioveu_laundry_garment_tracking",
            "WHERE garment_code IN",
            "  <foreach item='code' collection='garmentCodes' open='(' separator=',' close=')'>",
            "    #{code}",
            "  </foreach>",
            "GROUP BY garment_code",
            "</script>"
    })
    List<Long> selectLatestTrackingIdsByCodes(@Param("garmentCodes") List<String> garmentCodes);
}
