package com.aioveu.boot.JuhaocheMerchantStaff.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.JuhaocheMerchantStaff.mapper.JuhaocheMerchantStaffMapper;
import com.aioveu.boot.JuhaocheMerchantStaff.service.JuhaocheMerchantStaffService;
import com.aioveu.boot.JuhaocheMerchantStaff.model.entity.JuhaocheMerchantStaff;
import com.aioveu.boot.JuhaocheMerchantStaff.model.form.JuhaocheMerchantStaffForm;
import com.aioveu.boot.JuhaocheMerchantStaff.model.query.JuhaocheMerchantStaffQuery;
import com.aioveu.boot.JuhaocheMerchantStaff.model.vo.JuhaocheMerchantStaffVO;
import com.aioveu.boot.JuhaocheMerchantStaff.converter.JuhaocheMerchantStaffConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 商户员工信息服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:54
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class JuhaocheMerchantStaffServiceImpl extends ServiceImpl<JuhaocheMerchantStaffMapper, JuhaocheMerchantStaff> implements JuhaocheMerchantStaffService {

    private final JuhaocheMerchantStaffConverter juhaocheMerchantStaffConverter;

    /**
    * 获取商户员工信息分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<JuhaocheMerchantStaffVO>} 商户员工信息分页列表
    */
    @Override
    public IPage<JuhaocheMerchantStaffVO> getJuhaocheMerchantStaffPage(JuhaocheMerchantStaffQuery queryParams) {
        Page<JuhaocheMerchantStaffVO> pageVO = this.baseMapper.getJuhaocheMerchantStaffPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取商户员工信息表单数据
     *
     * @param id 商户员工信息ID
     * @return 商户员工信息表单数据
     */
    @Override
    public JuhaocheMerchantStaffForm getJuhaocheMerchantStaffFormData(Long id) {
        JuhaocheMerchantStaff entity = this.getById(id);
        return juhaocheMerchantStaffConverter.toForm(entity);
    }
    
    /**
     * 新增商户员工信息
     *
     * @param formData 商户员工信息表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveJuhaocheMerchantStaff(JuhaocheMerchantStaffForm formData) {
        JuhaocheMerchantStaff entity = juhaocheMerchantStaffConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新商户员工信息
     *
     * @param id   商户员工信息ID
     * @param formData 商户员工信息表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateJuhaocheMerchantStaff(Long id,JuhaocheMerchantStaffForm formData) {
        JuhaocheMerchantStaff entity = juhaocheMerchantStaffConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除商户员工信息
     *
     * @param ids 商户员工信息ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteJuhaocheMerchantStaffs(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的商户员工信息数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }


    /**
     * 检查手机号是否已存在于指定商户中
     */
    @Override
    public boolean checkPhoneExistsInMerchant(String phone, Long merchantId) {
        return true;
    }

    /**
     * 获取商户员工数量
     */
    @Override
    public long getStaffCount(Long merchantId) {
        if (merchantId == null || merchantId <= 0) {
            log.warn("商户ID无效: merchantId={}", merchantId);
            return 0;
        }

        try {
            LambdaQueryWrapper<JuhaocheMerchantStaff> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(JuhaocheMerchantStaff::getMerchantId, merchantId)
                    .eq(JuhaocheMerchantStaff::getIsEnable, 1)
                    .eq(JuhaocheMerchantStaff::getIsDel, 0);

//            // 状态筛选
//            if (status != null) {
//                queryWrapper.eq(JuhaocheMerchantStaff::getStatus, status);
//            }

            long count = count(queryWrapper);
//            log.debug("获取商户员工数量: merchantId={}, status={}, count={}",
//                    merchantId, status, count);

            return count;

        } catch (Exception e) {
//            log.error("获取商户员工数量异常: merchantId={}, status={}", merchantId, status, e);
            return 0;
        }
    }

}
