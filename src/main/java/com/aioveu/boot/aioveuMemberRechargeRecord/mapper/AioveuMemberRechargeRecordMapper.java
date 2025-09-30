package com.aioveu.boot.aioveuMemberRechargeRecord.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.entity.AioveuMemberRechargeRecord;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.query.AioveuMemberRechargeRecordQuery;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.vo.AioveuMemberRechargeRecordVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 会员充值记录Mapper接口
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:08
 */
@Mapper
public interface AioveuMemberRechargeRecordMapper extends BaseMapper<AioveuMemberRechargeRecord> {

    /**
     * 获取会员充值记录分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return {@link Page<AioveuMemberRechargeRecordVO>} 会员充值记录分页列表
     */
    Page<AioveuMemberRechargeRecordVO> getAioveuMemberRechargeRecordPage(Page<AioveuMemberRechargeRecordVO> page, AioveuMemberRechargeRecordQuery queryParams);

}
