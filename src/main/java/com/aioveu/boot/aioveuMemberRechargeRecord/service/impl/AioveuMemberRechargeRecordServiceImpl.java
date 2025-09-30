package com.aioveu.boot.aioveuMemberRechargeRecord.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuMemberRechargeRecord.mapper.AioveuMemberRechargeRecordMapper;
import com.aioveu.boot.aioveuMemberRechargeRecord.service.AioveuMemberRechargeRecordService;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.entity.AioveuMemberRechargeRecord;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.form.AioveuMemberRechargeRecordForm;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.query.AioveuMemberRechargeRecordQuery;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.vo.AioveuMemberRechargeRecordVO;
import com.aioveu.boot.aioveuMemberRechargeRecord.converter.AioveuMemberRechargeRecordConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 会员充值记录服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:08
 */
@Service
@RequiredArgsConstructor
public class AioveuMemberRechargeRecordServiceImpl extends ServiceImpl<AioveuMemberRechargeRecordMapper, AioveuMemberRechargeRecord> implements AioveuMemberRechargeRecordService {

    private final AioveuMemberRechargeRecordConverter aioveuMemberRechargeRecordConverter;

    /**
    * 获取会员充值记录分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuMemberRechargeRecordVO>} 会员充值记录分页列表
    */
    @Override
    public IPage<AioveuMemberRechargeRecordVO> getAioveuMemberRechargeRecordPage(AioveuMemberRechargeRecordQuery queryParams) {
        Page<AioveuMemberRechargeRecordVO> pageVO = this.baseMapper.getAioveuMemberRechargeRecordPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取会员充值记录表单数据
     *
     * @param id 会员充值记录ID
     * @return 会员充值记录表单数据
     */
    @Override
    public AioveuMemberRechargeRecordForm getAioveuMemberRechargeRecordFormData(Long id) {
        AioveuMemberRechargeRecord entity = this.getById(id);
        return aioveuMemberRechargeRecordConverter.toForm(entity);
    }
    
    /**
     * 新增会员充值记录
     *
     * @param formData 会员充值记录表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuMemberRechargeRecord(AioveuMemberRechargeRecordForm formData) {
        AioveuMemberRechargeRecord entity = aioveuMemberRechargeRecordConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新会员充值记录
     *
     * @param id   会员充值记录ID
     * @param formData 会员充值记录表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuMemberRechargeRecord(Long id,AioveuMemberRechargeRecordForm formData) {
        AioveuMemberRechargeRecord entity = aioveuMemberRechargeRecordConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除会员充值记录
     *
     * @param ids 会员充值记录ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuMemberRechargeRecords(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的会员充值记录数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

}
