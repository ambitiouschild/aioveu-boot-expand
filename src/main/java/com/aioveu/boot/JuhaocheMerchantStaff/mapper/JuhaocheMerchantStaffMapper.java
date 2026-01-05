package com.aioveu.boot.JuhaocheMerchantStaff.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.JuhaocheMerchantStaff.model.entity.JuhaocheMerchantStaff;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheMerchantStaff.model.query.JuhaocheMerchantStaffQuery;
import com.aioveu.boot.JuhaocheMerchantStaff.model.vo.JuhaocheMerchantStaffVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商户员工信息Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:54
 */
@Mapper
public interface JuhaocheMerchantStaffMapper extends BaseMapper<JuhaocheMerchantStaff> {

    /**
     * 获取商户员工信息分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<JuhaocheMerchantStaffVO>} 商户员工信息分页列表
     */
    Page<JuhaocheMerchantStaffVO> getJuhaocheMerchantStaffPage(Page<JuhaocheMerchantStaffVO> page, JuhaocheMerchantStaffQuery queryParams);

}
