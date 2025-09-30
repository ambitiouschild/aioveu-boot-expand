package com.aioveu.boot.aioveuLaundryProcessImage.service;

import com.aioveu.boot.aioveuLaundryProcessImage.model.entity.AioveuLaundryProcessImage;
import com.aioveu.boot.aioveuLaundryProcessImage.model.form.AioveuLaundryProcessImageForm;
import com.aioveu.boot.aioveuLaundryProcessImage.model.query.AioveuLaundryProcessImageQuery;
import com.aioveu.boot.aioveuLaundryProcessImage.model.vo.AioveuLaundryProcessImageVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 洗衣流程图片记录服务类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:58
 */
public interface AioveuLaundryProcessImageService extends IService<AioveuLaundryProcessImage> {

    /**
     *洗衣流程图片记录分页列表
     *
     * @return {@link IPage<AioveuLaundryProcessImageVO>} 洗衣流程图片记录分页列表
     */
    IPage<AioveuLaundryProcessImageVO> getAioveuLaundryProcessImagePage(AioveuLaundryProcessImageQuery queryParams);

    /**
     * 获取洗衣流程图片记录表单数据
     *
     * @param id 洗衣流程图片记录ID
     * @return 洗衣流程图片记录表单数据
     */
     AioveuLaundryProcessImageForm getAioveuLaundryProcessImageFormData(Long id);

    /**
     * 新增洗衣流程图片记录
     *
     * @param formData 洗衣流程图片记录表单对象
     * @return 是否新增成功
     */
    boolean saveAioveuLaundryProcessImage(AioveuLaundryProcessImageForm formData);

    /**
     * 修改洗衣流程图片记录
     *
     * @param id   洗衣流程图片记录ID
     * @param formData 洗衣流程图片记录表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuLaundryProcessImage(Long id, AioveuLaundryProcessImageForm formData);

    /**
     * 删除洗衣流程图片记录
     *
     * @param ids 洗衣流程图片记录ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuLaundryProcessImages(String ids);

}
