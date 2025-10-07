package com.aioveu.boot.aioveuLaundryProcessImage.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuLaundryProcessImage.model.entity.AioveuLaundryProcessImage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuLaundryProcessImage.model.query.AioveuLaundryProcessImageQuery;
import com.aioveu.boot.aioveuLaundryProcessImage.model.vo.AioveuLaundryProcessImageVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 洗衣流程图片记录Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:58
 */
@Mapper
public interface AioveuLaundryProcessImageMapper extends BaseMapper<AioveuLaundryProcessImage> {

    /**
     * 获取洗衣流程图片记录分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<AioveuLaundryProcessImageVO>} 洗衣流程图片记录分页列表
     */
    Page<AioveuLaundryProcessImageVO> getAioveuLaundryProcessImagePage(Page<AioveuLaundryProcessImageVO> page, AioveuLaundryProcessImageQuery queryParams);

    /**
     * 批量插入洗衣流程图片记录
     * @param list 实体列表
     * @return 插入条数
     */
    int batchInsert(@Param("list") List<AioveuLaundryProcessImage> list);

}
