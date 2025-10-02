package com.aioveu.boot.aioveuMemberRechargeRecord.service;

import com.aioveu.boot.aioveuMemberRechargeRecord.model.entity.AioveuMemberRechargeRecord;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.form.AioveuMemberRechargeRecordForm;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.query.AioveuMemberRechargeRecordQuery;
import com.aioveu.boot.aioveuMemberRechargeRecord.model.vo.AioveuMemberRechargeRecordVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 会员充值记录服务类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:08
 */
public interface AioveuMemberRechargeRecordService extends IService<AioveuMemberRechargeRecord> {

    /**
     *会员充值记录分页列表
     *
     * @return {@link IPage<AioveuMemberRechargeRecordVO>} 会员充值记录分页列表
     */
    IPage<AioveuMemberRechargeRecordVO> getAioveuMemberRechargeRecordPage(AioveuMemberRechargeRecordQuery queryParams);

    /**
     * 获取会员充值记录表单数据
     *
     * @param id 会员充值记录ID
     * @return 会员充值记录表单数据
     */
     AioveuMemberRechargeRecordForm getAioveuMemberRechargeRecordFormData(Long id);

    /**
     * 新增会员充值记录
     *
     * @param formData 会员充值记录表单对象
     * @return 是否新增成功
     */
    boolean saveAioveuMemberRechargeRecord(AioveuMemberRechargeRecordForm formData);


    /**
     * 新增会员充值记录并执行充值操作
     *
     * @param formData 会员充值记录表单对象
     * @return 是否新增成功并充值成功
     */
    boolean saveAioveuMemberRechargeRecordandexecuteRecharge(AioveuMemberRechargeRecordForm formData);

    /**
     * 修改会员充值记录
     *
     * @param id   会员充值记录ID
     * @param formData 会员充值记录表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuMemberRechargeRecord(Long id, AioveuMemberRechargeRecordForm formData);

    /**
     * 删除会员充值记录
     *
     * @param ids 会员充值记录ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuMemberRechargeRecords(String ids);

}
