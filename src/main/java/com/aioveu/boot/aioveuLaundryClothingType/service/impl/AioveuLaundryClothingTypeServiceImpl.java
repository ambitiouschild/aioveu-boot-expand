package com.aioveu.boot.aioveuLaundryClothingType.service.impl;

import com.aioveu.boot.aioveuCommon.util.NumberGenerator.NoGenerator;
import com.aioveu.boot.aioveuLaundryClothingType.model.vo.AioveuLaundryClothingTypeOptionVO;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.Map;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 衣物类型服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AioveuLaundryClothingTypeServiceImpl extends ServiceImpl<AioveuLaundryClothingTypeMapper, AioveuLaundryClothingType> implements AioveuLaundryClothingTypeService {

    private final AioveuLaundryClothingTypeConverter aioveuLaundryClothingTypeConverter;

    // 通过依赖注入获取NoGenerator
    @Autowired
    private NoGenerator noGenerator;

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

        // 1.如果单号为空，则生成
        if (StrUtil.isBlank(formData.getTypeCode())) {

            String newTypeCode = noGenerator.generateLaundryClothingTypeCode();//单号生成器方法保持一致
            formData.setTypeCode(newTypeCode);
            log.info("生成的newTypeCode: " +  newTypeCode);

        }

        // 2.无论单号是生成的还是用户提供的，都要检查是否重复。
        LambdaQueryWrapper<AioveuLaundryClothingType> wrapper = new LambdaQueryWrapper<>();
        // 正确调用：传递 formData 参数
        wrapper.eq(AioveuLaundryClothingType::getTypeCode, formData.getTypeCode());

        //3.如果重复，则重新生成（如果是用户提供的，可能需要提示用户，但根据你的业务逻辑，这里选择重新生成）。

        while (this.count(wrapper) > 0) {
            // 重新生成单号
            String againTypeCode = noGenerator.generateLaundryClothingTypeCode();//单号生成器方法保持一致
            formData.setTypeCode(againTypeCode);
            log.info("生成的againTypeCode: " +  againTypeCode);

            //4.重新生成后，再次检查，直到不重复为止（或者设置最大重试次数）。
            // 更新查询条件，检查新生成的单号
            wrapper.clear();
            wrapper.eq(AioveuLaundryClothingType::getTypeCode, formData.getTypeCode());
        }


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

    /**
     * 获取选项列表（用于下拉选择框）
     *
     * @return 选项列表
     */
    @Override
    public List<AioveuLaundryClothingTypeOptionVO> getAllLaundryClothingTypeOptions() {

        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuLaundryClothingType> types = lambdaQuery()
                .select(AioveuLaundryClothingType::getId, AioveuLaundryClothingType::getTypeName)
                .list();

        // 2.转换为选项对象
        List<AioveuLaundryClothingTypeOptionVO>  typeOption  = types.stream()
                .map(type -> new AioveuLaundryClothingTypeOptionVO(type.getId(), type.getTypeName()))
                .collect(Collectors.toList());

        return typeOption;
    }

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter  无参数
     */
    @Override
    public Map<Long, String> getLaundryClothingTypeMap() {


        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuLaundryClothingType> types = lambdaQuery()
                .select(AioveuLaundryClothingType::getId, AioveuLaundryClothingType::getTypeName)
                .list();

        // 2.转换为Map: key=ID, value=名称
        return types.stream()
                .collect(Collectors.toMap(
                        AioveuLaundryClothingType::getId,
                        AioveuLaundryClothingType::getTypeName
                ));
    }

}
