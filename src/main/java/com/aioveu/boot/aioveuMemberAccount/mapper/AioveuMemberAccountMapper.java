package com.aioveu.boot.aioveuMemberAccount.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuMemberAccount.model.entity.AioveuMemberAccount;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuMemberAccount.model.query.AioveuMemberAccountQuery;
import com.aioveu.boot.aioveuMemberAccount.model.vo.AioveuMemberAccountVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 会员充值账户Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:02
 */
@Mapper
public interface AioveuMemberAccountMapper extends BaseMapper<AioveuMemberAccount> {

    /**
     * 获取会员充值账户分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<AioveuMemberAccountVO>} 会员充值账户分页列表
     */
    Page<AioveuMemberAccountVO> getAioveuMemberAccountPage(Page<AioveuMemberAccountVO> page, AioveuMemberAccountQuery queryParams);

}
