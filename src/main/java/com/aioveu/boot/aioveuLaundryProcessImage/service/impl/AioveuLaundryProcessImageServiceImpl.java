package com.aioveu.boot.aioveuLaundryProcessImage.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuLaundryProcessImage.mapper.AioveuLaundryProcessImageMapper;
import com.aioveu.boot.aioveuLaundryProcessImage.service.AioveuLaundryProcessImageService;
import com.aioveu.boot.aioveuLaundryProcessImage.model.entity.AioveuLaundryProcessImage;
import com.aioveu.boot.aioveuLaundryProcessImage.model.form.AioveuLaundryProcessImageForm;
import com.aioveu.boot.aioveuLaundryProcessImage.model.query.AioveuLaundryProcessImageQuery;
import com.aioveu.boot.aioveuLaundryProcessImage.model.vo.AioveuLaundryProcessImageVO;
import com.aioveu.boot.aioveuLaundryProcessImage.converter.AioveuLaundryProcessImageConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 洗衣流程图片记录服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:58
 */
@Service
@RequiredArgsConstructor
public class AioveuLaundryProcessImageServiceImpl extends ServiceImpl<AioveuLaundryProcessImageMapper, AioveuLaundryProcessImage> implements AioveuLaundryProcessImageService {

    private final AioveuLaundryProcessImageConverter aioveuLaundryProcessImageConverter;

    /**
    * 获取洗衣流程图片记录分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuLaundryProcessImageVO>} 洗衣流程图片记录分页列表
    */
    @Override
    public IPage<AioveuLaundryProcessImageVO> getAioveuLaundryProcessImagePage(AioveuLaundryProcessImageQuery queryParams) {
        Page<AioveuLaundryProcessImageVO> pageVO = this.baseMapper.getAioveuLaundryProcessImagePage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取洗衣流程图片记录表单数据
     *
     * @param id 洗衣流程图片记录ID
     * @return 洗衣流程图片记录表单数据
     */
    @Override
    public AioveuLaundryProcessImageForm getAioveuLaundryProcessImageFormData(Long id) {
        AioveuLaundryProcessImage entity = this.getById(id);
        return aioveuLaundryProcessImageConverter.toForm(entity);
    }
    
    /**
     * 新增洗衣流程图片记录
     *
     * @param formData 洗衣流程图片记录表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuLaundryProcessImage(AioveuLaundryProcessImageForm formData) {
        AioveuLaundryProcessImage entity = aioveuLaundryProcessImageConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新洗衣流程图片记录
     *
     * @param id   洗衣流程图片记录ID
     * @param formData 洗衣流程图片记录表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuLaundryProcessImage(Long id,AioveuLaundryProcessImageForm formData) {
        AioveuLaundryProcessImage entity = aioveuLaundryProcessImageConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除洗衣流程图片记录
     *
     * @param ids 洗衣流程图片记录ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuLaundryProcessImages(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的洗衣流程图片记录数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

}
