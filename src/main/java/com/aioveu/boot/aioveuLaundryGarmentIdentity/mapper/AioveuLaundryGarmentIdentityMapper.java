package com.aioveu.boot.aioveuLaundryGarmentIdentity.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.entity.AioveuLaundryGarmentIdentity;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.query.AioveuLaundryGarmentIdentityQuery;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.vo.AioveuLaundryGarmentIdentityVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 衣物唯一编码Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
@Mapper
public interface AioveuLaundryGarmentIdentityMapper extends BaseMapper<AioveuLaundryGarmentIdentity> {

    /**
     * 获取衣物唯一编码分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<AioveuLaundryGarmentIdentityVO>} 衣物唯一编码分页列表
     */
    Page<AioveuLaundryGarmentIdentityVO> getAioveuLaundryGarmentIdentityPage(Page<AioveuLaundryGarmentIdentityVO> page, AioveuLaundryGarmentIdentityQuery queryParams);

}
