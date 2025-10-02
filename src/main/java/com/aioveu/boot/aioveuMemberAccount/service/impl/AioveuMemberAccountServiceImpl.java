package com.aioveu.boot.aioveuMemberAccount.service.impl;

import com.aioveu.boot.aioveuCommon.util.AioveuNameSetter.AioveuNameSetter;
import com.aioveu.boot.aioveuMember.service.AioveuMemberService;
import lombok.RequiredArgsConstructor;
import org.apache.poi.hpsf.Date;
import org.springframework.beans.factory.annotation.Autowired;
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

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
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

    @Autowired
    private AioveuMemberService aioveuMemberService;

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

        AioveuNameSetter.setNamesByMaps(
                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
                AioveuMemberAccountVO::getMemberId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
                aioveuMemberService::getMemberNoMap,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
                AioveuMemberAccountVO::setMemberNo             // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
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
     * 根据会员ID获取账户
     */
    @Override
    public AioveuMemberAccount getAccountByMemberId(Long memberId) {
        LambdaQueryWrapper<AioveuMemberAccount> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(AioveuMemberAccount::getMemberId, memberId);
        return getOne(wrapper);
    }

    /**
     * 获取或创建会员账户
     */
    @Override
    //将getOrCreateAccount方法的访问权限改为public，因为实现接口的方法必须具有相同的访问权限（public）
    public AioveuMemberAccount getOrCreateAccount(Long memberId) {
        AioveuMemberAccount account = this.getAccountByMemberId(memberId);
        if (account == null) {
            // 如果账户不存在，创建新账户
            account = new AioveuMemberAccount();
            account.setMemberId(memberId);
            account.setCashBalance(BigDecimal.ZERO);
            account.setGiftBalance(BigDecimal.ZERO);
            this.save(account);
        }
        return account;
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
     * 充值成功后更新账户
     * @param account   会员充值账户ID
     * @param amount    充值金额
     * @param giftAmount    赠送金额
     * @return 是否修改成功
     */
    @Override
    public boolean updateAccountAfterRecharge(AioveuMemberAccount account, BigDecimal amount,BigDecimal giftAmount) {

        // 更新现金余额
        BigDecimal newBalance = account.getCashBalance().add(amount);
        account.setCashBalance(newBalance);

        // 更新累计充值金额
        BigDecimal newGiftBalance = account.getGiftBalance().add(giftAmount);
        account.setGiftBalance(newGiftBalance);

        // 更新最后充值时间
        return this.updateById(account);
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
