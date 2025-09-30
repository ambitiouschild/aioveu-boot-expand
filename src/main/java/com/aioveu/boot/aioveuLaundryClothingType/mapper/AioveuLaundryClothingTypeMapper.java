package com.aioveu.boot.aioveuLaundryClothingType.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuLaundryClothingType.model.entity.AioveuLaundryClothingType;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryClothingType.model.query.AioveuLaundryClothingTypeQuery;
import com.aioveu.boot.aioveuLaundryClothingType.model.vo.AioveuLaundryClothingTypeVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 衣物类型Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
@Mapper
public interface AioveuLaundryClothingTypeMapper extends BaseMapper<AioveuLaundryClothingType> {

    /**
     * 获取衣物类型分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<AioveuLaundryClothingTypeVO>} 衣物类型分页列表
     */
    Page<AioveuLaundryClothingTypeVO> getAioveuLaundryClothingTypePage(Page<AioveuLaundryClothingTypeVO> page, AioveuLaundryClothingTypeQuery queryParams);

}
