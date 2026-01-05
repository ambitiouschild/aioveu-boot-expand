package com.aioveu.boot.JuhaocheMerchant.service.impl;

import cn.idev.excel.util.StringUtils;
import com.aioveu.boot.common.exception.BusinessException;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.JuhaocheMerchant.mapper.JuhaocheMerchantMapper;
import com.aioveu.boot.JuhaocheMerchant.service.JuhaocheMerchantService;
import com.aioveu.boot.JuhaocheMerchant.model.entity.JuhaocheMerchant;
import com.aioveu.boot.JuhaocheMerchant.model.form.JuhaocheMerchantForm;
import com.aioveu.boot.JuhaocheMerchant.model.query.JuhaocheMerchantQuery;
import com.aioveu.boot.JuhaocheMerchant.model.vo.JuhaocheMerchantVO;
import com.aioveu.boot.JuhaocheMerchant.converter.JuhaocheMerchantConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 商户主体服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class JuhaocheMerchantServiceImpl extends ServiceImpl<JuhaocheMerchantMapper, JuhaocheMerchant> implements JuhaocheMerchantService {

    private final JuhaocheMerchantConverter juhaocheMerchantConverter;


    @Autowired
    private JuhaocheMerchantMapper juhaocheMerchantMapper;

    /**
    * 获取商户主体分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<JuhaocheMerchantVO>} 商户主体分页列表
    */
    @Override
    public IPage<JuhaocheMerchantVO> getJuhaocheMerchantPage(JuhaocheMerchantQuery queryParams) {
        Page<JuhaocheMerchantVO> pageVO = this.baseMapper.getJuhaocheMerchantPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取商户主体表单数据
     *
     * @param id 商户主体ID
     * @return 商户主体表单数据
     */
    @Override
    public JuhaocheMerchantForm getJuhaocheMerchantFormData(Long id) {
        JuhaocheMerchant entity = this.getById(id);
        return juhaocheMerchantConverter.toForm(entity);
    }
    
    /**
     * 新增商户主体
     *
     * @param formData 商户主体表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveJuhaocheMerchant(JuhaocheMerchantForm formData) {
        JuhaocheMerchant entity = juhaocheMerchantConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新商户主体
     *
     * @param id   商户主体ID
     * @param formData 商户主体表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateJuhaocheMerchant(Long id,JuhaocheMerchantForm formData) {
        JuhaocheMerchant entity = juhaocheMerchantConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除商户主体
     *
     * @param ids 商户主体ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteJuhaocheMerchants(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的商户主体数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }


    /**
     * 检查营业执照号是否存在
     * @param businessLicense 营业执照号
     * @return true-已存在，false-不存在
     */
    public boolean checkBusinessLicenseExists(String businessLicense) {
        if (StringUtils.isBlank(businessLicense)) {
            throw new BusinessException("营业执照号不能为空");
        }

        // 清理营业执照号格式（去除空格等）
        String cleanedLicense = cleanBusinessLicense(businessLicense);

        // 查询是否存在有效的营业执照号（未删除且状态正常的记录）
        JuhaocheMerchant merchant = juhaocheMerchantMapper.selectByBusinessLicense(cleanedLicense);

        return merchant != null && merchant.getIsDel() == 0;
    }


    /**
     * 清理营业执照号格式
     */
    private String cleanBusinessLicense(String businessLicense) {
        if (businessLicense == null) {
            return null;
        }
        // 去除空格、横杠等特殊字符，只保留字母和数字
        return businessLicense.replaceAll("[^a-zA-Z0-9]", "").toUpperCase();
    }

    /**
     * 检查营业执照号是否存在（排除指定商户ID）
     * 用于更新商户信息时的校验
     */
    public boolean checkBusinessLicenseExists(String businessLicense, Long excludeMerchantId) {
        if (StringUtils.isBlank(businessLicense)) {
            throw new BusinessException("营业执照号不能为空");
        }

        String cleanedLicense = cleanBusinessLicense(businessLicense);
        JuhaocheMerchant merchant = juhaocheMerchantMapper.selectByBusinessLicenseExcludeId(
                cleanedLicense, excludeMerchantId);

        return merchant != null && merchant.getIsDel() == 0;
    }

    /**
     * 验证营业执照号格式
     */
    public boolean validateBusinessLicenseFormat(String businessLicense) {
        if (StringUtils.isBlank(businessLicense)) {
            return false;
        }

        String cleaned = cleanBusinessLicense(businessLicense);

        // 中国大陆营业执照号规则：15位或18位数字字母组合
        // 15位：纯数字（老版营业执照）
        // 18位：统一社会信用代码
        if (cleaned.length() == 15) {
            return cleaned.matches("^[0-9]{15}$");
        } else if (cleaned.length() == 18) {
            return cleaned.matches("^[0-9A-Z]{18}$");
        }

        return false;
    }


    /**
     * 根据商户ID查询商户信息
     */
    @Override
    public JuhaocheMerchant getByMerchantId(Long merchantId) {
        if (merchantId == null || merchantId <= 0) {
            log.warn("商户ID参数无效: merchantId={}", merchantId);
            return null;
        }

        try {
            LambdaQueryWrapper<JuhaocheMerchant> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(JuhaocheMerchant::getMerchantId, merchantId)
                    .eq(JuhaocheMerchant::getIsDel, 0);

//            // 如果需要检查启用状态
//            if (checkEnable) {
//                queryWrapper.eq(JuhaocheMerchant::getIsEnable, 1);
//            }

            JuhaocheMerchant merchant = getOne(queryWrapper);

            if (merchant == null) {
                log.debug("商户不存在: merchantId={}", merchantId);
            } else {
                log.debug("查询商户成功: merchantId={}, merchantName={}",
                        merchantId, merchant.getMerchantName());
            }

            return merchant;

        } catch (Exception e) {
            log.error("查询商户信息异常: merchantId={}", merchantId, e);
            return null;
        }
    }

    /**
     * 根据商户ID获取商户编码
     */
    @Override
    public String getMerchantCode(Long merchantId) {

        if (merchantId == null || merchantId <= 0) {
            log.warn("商户ID无效: merchantId={}", merchantId);
            return null;
        }

        try {
            LambdaQueryWrapper<JuhaocheMerchant> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(JuhaocheMerchant::getMerchantId, merchantId)
                    .eq(JuhaocheMerchant::getIsEnable, 1)
                    .eq(JuhaocheMerchant::getIsDel, 0)
                    .select(JuhaocheMerchant::getMerchantCode);

            JuhaocheMerchant merchant = getOne(queryWrapper);

            if (merchant == null) {
                log.warn("商户不存在或已禁用: merchantId={}", merchantId);
                return null;
            }

            String merchantCode = merchant.getMerchantCode();
            log.debug("获取商户编码成功: merchantId={}, merchantCode={}", merchantId, merchantCode);

            return merchantCode;

        } catch (Exception e) {
            log.error("获取商户编码异常: merchantId={}", merchantId, e);
            return null;
        }
    }





}
