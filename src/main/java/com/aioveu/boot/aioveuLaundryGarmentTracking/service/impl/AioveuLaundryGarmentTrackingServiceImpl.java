package com.aioveu.boot.aioveuLaundryGarmentTracking.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuLaundryGarmentTracking.mapper.AioveuLaundryGarmentTrackingMapper;
import com.aioveu.boot.aioveuLaundryGarmentTracking.service.AioveuLaundryGarmentTrackingService;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.entity.AioveuLaundryGarmentTracking;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.form.AioveuLaundryGarmentTrackingForm;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.query.AioveuLaundryGarmentTrackingQuery;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.vo.AioveuLaundryGarmentTrackingVO;
import com.aioveu.boot.aioveuLaundryGarmentTracking.converter.AioveuLaundryGarmentTrackingConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 衣物流转记录服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:35
 */
@Service
@RequiredArgsConstructor
public class AioveuLaundryGarmentTrackingServiceImpl extends ServiceImpl<AioveuLaundryGarmentTrackingMapper, AioveuLaundryGarmentTracking> implements AioveuLaundryGarmentTrackingService {

    private final AioveuLaundryGarmentTrackingConverter aioveuLaundryGarmentTrackingConverter;

    /**
    * 获取衣物流转记录分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuLaundryGarmentTrackingVO>} 衣物流转记录分页列表
    */
    @Override
    public IPage<AioveuLaundryGarmentTrackingVO> getAioveuLaundryGarmentTrackingPage(AioveuLaundryGarmentTrackingQuery queryParams) {
        Page<AioveuLaundryGarmentTrackingVO> pageVO = this.baseMapper.getAioveuLaundryGarmentTrackingPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取衣物流转记录表单数据
     *
     * @param id 衣物流转记录ID
     * @return 衣物流转记录表单数据
     */
    @Override
    public AioveuLaundryGarmentTrackingForm getAioveuLaundryGarmentTrackingFormData(Long id) {
        AioveuLaundryGarmentTracking entity = this.getById(id);
        return aioveuLaundryGarmentTrackingConverter.toForm(entity);
    }
    
    /**
     * 新增衣物流转记录
     *
     * @param formData 衣物流转记录表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuLaundryGarmentTracking(AioveuLaundryGarmentTrackingForm formData) {
        AioveuLaundryGarmentTracking entity = aioveuLaundryGarmentTrackingConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新衣物流转记录
     *
     * @param id   衣物流转记录ID
     * @param formData 衣物流转记录表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuLaundryGarmentTracking(Long id,AioveuLaundryGarmentTrackingForm formData) {
        AioveuLaundryGarmentTracking entity = aioveuLaundryGarmentTrackingConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除衣物流转记录
     *
     * @param ids 衣物流转记录ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuLaundryGarmentTrackings(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的衣物流转记录数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

}
