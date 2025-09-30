package com.aioveu.boot.aioveuMember.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuMember.model.entity.AioveuMember;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuMember.model.query.AioveuMemberQuery;
import com.aioveu.boot.aioveuMember.model.vo.AioveuMemberVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 会员信息管理Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 15:55
 */
@Mapper
public interface AioveuMemberMapper extends BaseMapper<AioveuMember> {

    /**
     * 获取会员信息管理分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<AioveuMemberVO>} 会员信息管理分页列表
     */
    Page<AioveuMemberVO> getAioveuMemberPage(Page<AioveuMemberVO> page, AioveuMemberQuery queryParams);

}
