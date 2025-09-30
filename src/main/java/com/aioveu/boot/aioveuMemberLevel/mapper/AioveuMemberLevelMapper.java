package com.aioveu.boot.aioveuMemberLevel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuMemberLevel.model.entity.AioveuMemberLevel;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuMemberLevel.model.query.AioveuMemberLevelQuery;
import com.aioveu.boot.aioveuMemberLevel.model.vo.AioveuMemberLevelVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 会员等级Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 14:52
 */
@Mapper
public interface AioveuMemberLevelMapper extends BaseMapper<AioveuMemberLevel> {

    /**
     * 获取会员等级分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<AioveuMemberLevelVO>} 会员等级分页列表
     */
    Page<AioveuMemberLevelVO> getAioveuMemberLevelPage(Page<AioveuMemberLevelVO> page, AioveuMemberLevelQuery queryParams);

}
