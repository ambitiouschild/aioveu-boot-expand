package com.aioveu.boot.JuhaocheUserMerchant.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.JuhaocheUserMerchant.mapper.JuhaocheUserMerchantMapper;
import com.aioveu.boot.JuhaocheUserMerchant.service.JuhaocheUserMerchantService;
import com.aioveu.boot.JuhaocheUserMerchant.model.entity.JuhaocheUserMerchant;
import com.aioveu.boot.JuhaocheUserMerchant.model.form.JuhaocheUserMerchantForm;
import com.aioveu.boot.JuhaocheUserMerchant.model.query.JuhaocheUserMerchantQuery;
import com.aioveu.boot.JuhaocheUserMerchant.model.vo.JuhaocheUserMerchantVO;
import com.aioveu.boot.JuhaocheUserMerchant.converter.JuhaocheUserMerchantConverter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 用户-商户关联服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class JuhaocheUserMerchantServiceImpl extends ServiceImpl<JuhaocheUserMerchantMapper, JuhaocheUserMerchant> implements JuhaocheUserMerchantService {

    private final JuhaocheUserMerchantConverter juhaocheUserMerchantConverter;

    @Autowired
    private JuhaocheUserMerchantMapper juhaocheUserMerchantMapper;

    /**
    * 获取用户-商户关联分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<JuhaocheUserMerchantVO>} 用户-商户关联分页列表
    */
    @Override
    public IPage<JuhaocheUserMerchantVO> getJuhaocheUserMerchantPage(JuhaocheUserMerchantQuery queryParams) {
        Page<JuhaocheUserMerchantVO> pageVO = this.baseMapper.getJuhaocheUserMerchantPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取用户-商户关联表单数据
     *
     * @param id 用户-商户关联ID
     * @return 用户-商户关联表单数据
     */
    @Override
    public JuhaocheUserMerchantForm getJuhaocheUserMerchantFormData(Long id) {
        JuhaocheUserMerchant entity = this.getById(id);
        return juhaocheUserMerchantConverter.toForm(entity);
    }
    
    /**
     * 新增用户-商户关联
     *
     * @param formData 用户-商户关联表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveJuhaocheUserMerchant(JuhaocheUserMerchantForm formData) {
        JuhaocheUserMerchant entity = juhaocheUserMerchantConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新用户-商户关联
     *
     * @param id   用户-商户关联ID
     * @param formData 用户-商户关联表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateJuhaocheUserMerchant(Long id,JuhaocheUserMerchantForm formData) {
        JuhaocheUserMerchant entity = juhaocheUserMerchantConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除用户-商户关联
     *
     * @param ids 用户-商户关联ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteJuhaocheUserMerchants(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的用户-商户关联数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

    /**
     * 检查用户是否为商户的主账号
     */
    @Override
    public boolean isMerchantOwner(Long userId, Long merchantId) {
        if (userId == null || merchantId == null) {
            log.warn("参数不能为空: userId={}, merchantId={}", userId, merchantId);
            return false;
        }

        try {
            LambdaQueryWrapper<JuhaocheUserMerchant> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(JuhaocheUserMerchant::getUserId, userId)
                    .eq(JuhaocheUserMerchant::getMerchantId, merchantId)
                    .eq(JuhaocheUserMerchant::getIsOwner, 1) // 必须是主账号
                    .eq(JuhaocheUserMerchant::getIsEnable, 1)  // 必须启用
                    .eq(JuhaocheUserMerchant::getIsDel, 0);    // 未删除

            long count = count(queryWrapper);
            boolean isOwner = count > 0;

            log.debug("检查用户是否为商户主账号: userId={}, merchantId={}, result={}", userId, merchantId, isOwner);
            return isOwner;

        } catch (Exception e) {
            log.error("检查用户是否为商户主账号异常: userId={}, merchantId={}", userId, merchantId, e);
            return false;
        }
    }


    /**
     * 获取用户关联的商户列表
     */
    @Override
    public List<JuhaocheUserMerchant> getUserMerchants(Long userId) {
        if (userId == null) {
            log.warn("用户ID不能为空");
            return new ArrayList<>();
        }

        try {
            List<JuhaocheUserMerchant> userMerchants = juhaocheUserMerchantMapper.selectByUserId(userId);
            log.debug("获取用户关联商户列表成功: userId={}, count={}", userId, userMerchants.size());
            return userMerchants;
        } catch (Exception e) {
            log.error("获取用户关联商户列表异常: userId={}", userId, e);
            return new ArrayList<>();
        }
    }

}
