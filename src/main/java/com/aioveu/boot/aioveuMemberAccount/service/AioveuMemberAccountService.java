package com.aioveu.boot.aioveuMemberAccount.service;

import com.aioveu.boot.aioveuMemberAccount.model.entity.AioveuMemberAccount;
import com.aioveu.boot.aioveuMemberAccount.model.form.AioveuMemberAccountForm;
import com.aioveu.boot.aioveuMemberAccount.model.query.AioveuMemberAccountQuery;
import com.aioveu.boot.aioveuMemberAccount.model.vo.AioveuMemberAccountVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;

/**
 * 会员充值账户服务类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:02
 */
public interface AioveuMemberAccountService extends IService<AioveuMemberAccount> {

    /**
     *会员充值账户分页列表
     *
     * @return {@link IPage<AioveuMemberAccountVO>} 会员充值账户分页列表
     */
    IPage<AioveuMemberAccountVO> getAioveuMemberAccountPage(AioveuMemberAccountQuery queryParams);

    /**
     * 获取会员充值账户表单数据
     *
     * @param id 会员充值账户ID
     * @return 会员充值账户表单数据
     */
     AioveuMemberAccountForm getAioveuMemberAccountFormData(Long id);

    /**
     * 新增会员充值账户
     *
     * @param formData 会员充值账户表单对象
     * @return 是否新增成功
     */
    boolean saveAioveuMemberAccount(AioveuMemberAccountForm formData);


    /**
     * 根据会员ID获取账户
     *
     * @param memberId 会员ID
     * @return 会员账户
     */
    AioveuMemberAccount getAccountByMemberId(Long memberId);

    /**
     * 获取或创建会员账户
     *
     * @param memberId 会员ID
     * @return 会员账户
     */
    AioveuMemberAccount getOrCreateAccount(Long memberId);

    /**
     * 修改会员充值账户
     *
     * @param id   会员充值账户ID
     * @param formData 会员充值账户表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuMemberAccount(Long id, AioveuMemberAccountForm formData);

    /**
     * 充值成功后更新账户
     * @param account   会员充值账户ID
     * @param amount    充值金额
     * @param giftAmount    赠送金额
     * @return 是否修改成功
     */
    boolean updateAccountAfterRecharge(AioveuMemberAccount account, BigDecimal amount,BigDecimal giftAmount);


    /**
     * 删除会员充值账户
     *
     * @param ids 会员充值账户ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuMemberAccounts(String ids);

}
