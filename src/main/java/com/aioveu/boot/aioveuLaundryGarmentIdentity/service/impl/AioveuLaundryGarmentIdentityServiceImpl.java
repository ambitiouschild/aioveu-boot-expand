package com.aioveu.boot.aioveuLaundryGarmentIdentity.service.impl;

import com.aioveu.boot.aioveuCommon.util.NumberGenerator.NoGenerator;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.mapper.AioveuLaundryGarmentIdentityMapper;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.service.AioveuLaundryGarmentIdentityService;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.entity.AioveuLaundryGarmentIdentity;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.form.AioveuLaundryGarmentIdentityForm;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.query.AioveuLaundryGarmentIdentityQuery;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.vo.AioveuLaundryGarmentIdentityVO;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.converter.AioveuLaundryGarmentIdentityConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;



/**
 * 衣物唯一编码服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AioveuLaundryGarmentIdentityServiceImpl extends ServiceImpl<AioveuLaundryGarmentIdentityMapper, AioveuLaundryGarmentIdentity> implements AioveuLaundryGarmentIdentityService {

    private final AioveuLaundryGarmentIdentityConverter aioveuLaundryGarmentIdentityConverter;

    // 通过依赖注入获取NoGenerator
    @Autowired
    private NoGenerator noGenerator;

    /**
    * 获取衣物唯一编码分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuLaundryGarmentIdentityVO>} 衣物唯一编码分页列表
    */
    @Override
    public IPage<AioveuLaundryGarmentIdentityVO> getAioveuLaundryGarmentIdentityPage(AioveuLaundryGarmentIdentityQuery queryParams) {
        Page<AioveuLaundryGarmentIdentityVO> pageVO = this.baseMapper.getAioveuLaundryGarmentIdentityPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取衣物唯一编码表单数据
     *
     * @param id 衣物唯一编码ID
     * @return 衣物唯一编码表单数据
     */
    @Override
    public AioveuLaundryGarmentIdentityForm getAioveuLaundryGarmentIdentityFormData(Long id) {
        AioveuLaundryGarmentIdentity entity = this.getById(id);
        return aioveuLaundryGarmentIdentityConverter.toForm(entity);
    }
    
    /**
     * 新增衣物唯一编码
     *
     * @param formData 衣物唯一编码表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuLaundryGarmentIdentity(AioveuLaundryGarmentIdentityForm formData) {

        // 1.如果单号为空，则生成
        if (StrUtil.isBlank(formData.getGarmentCode())) {

            String newGarmentCode = noGenerator.generateGarmentQRCode();//单号生成器方法保持一致
            formData.setGarmentCode(newGarmentCode);
            log.info("生成的newGarmentCode: " +  newGarmentCode);

        }

        // 2.无论单号是生成的还是用户提供的，都要检查是否重复。
        LambdaQueryWrapper<AioveuLaundryGarmentIdentity> wrapper = new LambdaQueryWrapper<>();
        // 正确调用：传递 formData 参数
        wrapper.eq(AioveuLaundryGarmentIdentity::getGarmentCode, formData.getGarmentCode());

        //3.如果重复，则重新生成（如果是用户提供的，可能需要提示用户，但根据业务逻辑，这里选择重新生成）。
        while (this.count(wrapper) > 0) {
            // 重新生成单号
            String againGarmentCode = noGenerator.generateGarmentQRCode();//单号生成器方法保持一致
            formData.setGarmentCode(againGarmentCode);
            log.info("生成的againTypeCode: " +  againGarmentCode);

            //4.重新生成后，再次检查，直到不重复为止（或者设置最大重试次数）。
            // 更新查询条件，检查新生成的单号
            wrapper.clear();
            wrapper.eq(AioveuLaundryGarmentIdentity::getGarmentCode, formData.getGarmentCode());
        }

        AioveuLaundryGarmentIdentity entity = aioveuLaundryGarmentIdentityConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新衣物唯一编码
     *
     * @param id   衣物唯一编码ID
     * @param formData 衣物唯一编码表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuLaundryGarmentIdentity(Long id,AioveuLaundryGarmentIdentityForm formData) {
        AioveuLaundryGarmentIdentity entity = aioveuLaundryGarmentIdentityConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除衣物唯一编码
     *
     * @param ids 衣物唯一编码ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuLaundryGarmentIdentitys(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的衣物唯一编码数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

}
