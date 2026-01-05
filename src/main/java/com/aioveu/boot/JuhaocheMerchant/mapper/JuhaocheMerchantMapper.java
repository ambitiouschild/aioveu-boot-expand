package com.aioveu.boot.JuhaocheMerchant.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.JuhaocheMerchant.model.entity.JuhaocheMerchant;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.JuhaocheMerchant.model.query.JuhaocheMerchantQuery;
import com.aioveu.boot.JuhaocheMerchant.model.vo.JuhaocheMerchantVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 商户主体Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Mapper
public interface JuhaocheMerchantMapper extends BaseMapper<JuhaocheMerchant> {

    /**
     * 获取商户主体分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<JuhaocheMerchantVO>} 商户主体分页列表
     */
    Page<JuhaocheMerchantVO> getJuhaocheMerchantPage(Page<JuhaocheMerchantVO> page, JuhaocheMerchantQuery queryParams);


    /**
     * 根据营业执照号查询商户（不区分状态）
     */
    @Select("SELECT * FROM juhaoche_merchant WHERE business_license = #{businessLicense} AND is_del = 0 LIMIT 1")
    JuhaocheMerchant selectByBusinessLicense(@Param("businessLicense") String businessLicense);

    /**
     * 根据营业执照号查询商户（排除指定ID）
     */
    @Select("SELECT * FROM juhaoche_merchant WHERE business_license = #{businessLicense} AND merchant_id != #{excludeMerchantId} AND is_del = 0 LIMIT 1")
    JuhaocheMerchant selectByBusinessLicenseExcludeId(
            @Param("businessLicense") String businessLicense,
            @Param("excludeMerchantId") Long excludeMerchantId);

    /**
     * 检查营业执照号是否存在（返回count，性能更好）
     */
    @Select("SELECT COUNT(*) FROM juhaoche_merchant WHERE business_license = #{businessLicense} AND is_del = 0")
    int countByBusinessLicense(@Param("businessLicense") String businessLicense);

}
