package com.aioveu.boot.aioveuLaundryClothingType.service;

import com.aioveu.boot.aioveuLaundryClothingType.model.entity.AioveuLaundryClothingType;
import com.aioveu.boot.aioveuLaundryClothingType.model.form.AioveuLaundryClothingTypeForm;
import com.aioveu.boot.aioveuLaundryClothingType.model.query.AioveuLaundryClothingTypeQuery;
import com.aioveu.boot.aioveuLaundryClothingType.model.vo.AioveuLaundryClothingTypeOptionVO;
import com.aioveu.boot.aioveuLaundryClothingType.model.vo.AioveuLaundryClothingTypeVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 衣物类型服务类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:48
 */
public interface AioveuLaundryClothingTypeService extends IService<AioveuLaundryClothingType> {

    /**
     *衣物类型分页列表
     *
     * @return {@link IPage<AioveuLaundryClothingTypeVO>} 衣物类型分页列表
     */
    IPage<AioveuLaundryClothingTypeVO> getAioveuLaundryClothingTypePage(AioveuLaundryClothingTypeQuery queryParams);

    /**
     * 获取衣物类型表单数据
     *
     * @param id 衣物类型ID
     * @return 衣物类型表单数据
     */
     AioveuLaundryClothingTypeForm getAioveuLaundryClothingTypeFormData(Long id);

    /**
     * 新增衣物类型
     *
     * @param formData 衣物类型表单对象
     * @return 是否新增成功
     */
    boolean saveAioveuLaundryClothingType(AioveuLaundryClothingTypeForm formData);

    /**
     * 修改衣物类型
     *
     * @param id   衣物类型ID
     * @param formData 衣物类型表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuLaundryClothingType(Long id, AioveuLaundryClothingTypeForm formData);

    /**
     * 删除衣物类型
     *
     * @param ids 衣物类型ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuLaundryClothingTypes(String ids);

    /**
     * 获取选项列表（用于下拉选择框）
     *
     * @return 选项列表
     */
    List<AioveuLaundryClothingTypeOptionVO> getAllLaundryClothingTypeOptions();

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter  // 无参，全查
     */
    Map<Long, String> getLaundryClothingTypeMap();


    /**
     * 批量查询衣物类型
     */
    Map<Long, AioveuLaundryClothingType> getClothingTypesByIds(Set<Long> clothingTypeIds);

}
