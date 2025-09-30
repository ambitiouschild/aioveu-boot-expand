package com.aioveu.boot.aioveuLaundryClothingType.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuLaundryClothingType.mapper.AioveuLaundryClothingTypeMapper;
import com.aioveu.boot.aioveuLaundryClothingType.service.AioveuLaundryClothingTypeService;
import com.aioveu.boot.aioveuLaundryClothingType.model.entity.AioveuLaundryClothingType;
import com.aioveu.boot.aioveuLaundryClothingType.model.form.AioveuLaundryClothingTypeForm;
import com.aioveu.boot.aioveuLaundryClothingType.model.query.AioveuLaundryClothingTypeQuery;
import com.aioveu.boot.aioveuLaundryClothingType.model.vo.AioveuLaundryClothingTypeVO;
import com.aioveu.boot.aioveuLaundryClothingType.converter.AioveuLaundryClothingTypeConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 衣物类型服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
@Service
@RequiredArgsConstructor
public class AioveuLaundryClothingTypeServiceImpl extends ServiceImpl<AioveuLaundryClothingTypeMapper, AioveuLaundryClothingType> implements AioveuLaundryClothingTypeService {

    private final AioveuLaundryClothingTypeConverter aioveuLaundryClothingTypeConverter;

    /**
    * 获取衣物类型分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuLaundryClothingTypeVO>} 衣物类型分页列表
    */
    @Override
    public IPage<AioveuLaundryClothingTypeVO> getAioveuLaundryClothingTypePage(AioveuLaundryClothingTypeQuery queryParams) {
        Page<AioveuLaundryClothingTypeVO> pageVO = this.baseMapper.getAioveuLaundryClothingTypePage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取衣物类型表单数据
     *
     * @param id 衣物类型ID
     * @return 衣物类型表单数据
     */
    @Override
    public AioveuLaundryClothingTypeForm getAioveuLaundryClothingTypeFormData(Long id) {
        AioveuLaundryClothingType entity = this.getById(id);
        return aioveuLaundryClothingTypeConverter.toForm(entity);
    }
    
    /**
     * 新增衣物类型
     *
     * @param formData 衣物类型表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuLaundryClothingType(AioveuLaundryClothingTypeForm formData) {
        AioveuLaundryClothingType entity = aioveuLaundryClothingTypeConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新衣物类型
     *
     * @param id   衣物类型ID
     * @param formData 衣物类型表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuLaundryClothingType(Long id,AioveuLaundryClothingTypeForm formData) {
        AioveuLaundryClothingType entity = aioveuLaundryClothingTypeConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除衣物类型
     *
     * @param ids 衣物类型ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuLaundryClothingTypes(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的衣物类型数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

}
