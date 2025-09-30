package com.aioveu.boot.aioveuMemberAccount.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuMemberAccount.mapper.AioveuMemberAccountMapper;
import com.aioveu.boot.aioveuMemberAccount.service.AioveuMemberAccountService;
import com.aioveu.boot.aioveuMemberAccount.model.entity.AioveuMemberAccount;
import com.aioveu.boot.aioveuMemberAccount.model.form.AioveuMemberAccountForm;
import com.aioveu.boot.aioveuMemberAccount.model.query.AioveuMemberAccountQuery;
import com.aioveu.boot.aioveuMemberAccount.model.vo.AioveuMemberAccountVO;
import com.aioveu.boot.aioveuMemberAccount.converter.AioveuMemberAccountConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 会员充值账户服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:02
 */
@Service
@RequiredArgsConstructor
public class AioveuMemberAccountServiceImpl extends ServiceImpl<AioveuMemberAccountMapper, AioveuMemberAccount> implements AioveuMemberAccountService {

    private final AioveuMemberAccountConverter aioveuMemberAccountConverter;

    /**
    * 获取会员充值账户分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuMemberAccountVO>} 会员充值账户分页列表
    */
    @Override
    public IPage<AioveuMemberAccountVO> getAioveuMemberAccountPage(AioveuMemberAccountQuery queryParams) {
        Page<AioveuMemberAccountVO> pageVO = this.baseMapper.getAioveuMemberAccountPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取会员充值账户表单数据
     *
     * @param id 会员充值账户ID
     * @return 会员充值账户表单数据
     */
    @Override
    public AioveuMemberAccountForm getAioveuMemberAccountFormData(Long id) {
        AioveuMemberAccount entity = this.getById(id);
        return aioveuMemberAccountConverter.toForm(entity);
    }
    
    /**
     * 新增会员充值账户
     *
     * @param formData 会员充值账户表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuMemberAccount(AioveuMemberAccountForm formData) {
        AioveuMemberAccount entity = aioveuMemberAccountConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新会员充值账户
     *
     * @param id   会员充值账户ID
     * @param formData 会员充值账户表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuMemberAccount(Long id,AioveuMemberAccountForm formData) {
        AioveuMemberAccount entity = aioveuMemberAccountConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除会员充值账户
     *
     * @param ids 会员充值账户ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuMemberAccounts(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的会员充值账户数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

}
