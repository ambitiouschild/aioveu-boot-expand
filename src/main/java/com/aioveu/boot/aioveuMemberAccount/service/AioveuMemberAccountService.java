package com.aioveu.boot.aioveuMemberAccount.service;

import com.aioveu.boot.aioveuMemberAccount.model.entity.AioveuMemberAccount;
import com.aioveu.boot.aioveuMemberAccount.model.form.AioveuMemberAccountForm;
import com.aioveu.boot.aioveuMemberAccount.model.query.AioveuMemberAccountQuery;
import com.aioveu.boot.aioveuMemberAccount.model.vo.AioveuMemberAccountVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

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
     * 修改会员充值账户
     *
     * @param id   会员充值账户ID
     * @param formData 会员充值账户表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuMemberAccount(Long id, AioveuMemberAccountForm formData);

    /**
     * 删除会员充值账户
     *
     * @param ids 会员充值账户ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuMemberAccounts(String ids);

}
