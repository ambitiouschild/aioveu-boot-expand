package com.aioveu.boot.aioveuMemberRechargeRecord.service.impl;

import com.aioveu.boot.aioveuCommon.util.NumberGenerator.NoGenerator;
import com.aioveu.boot.aioveuMemberAccount.model.entity.AioveuMemberAccount;
import com.aioveu.boot.aioveuMemberAccount.service.AioveuMemberAccountService;
import com.aioveu.boot.common.result.Result;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.hpsf.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import org.springframework.transaction.annotation.Transactional;

/**
 * 会员充值记录服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:08
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AioveuMemberRechargeRecordServiceImpl extends ServiceImpl<AioveuMemberRechargeRecordMapper, AioveuMemberRechargeRecord> implements AioveuMemberRechargeRecordService {

    private final AioveuMemberRechargeRecordConverter aioveuMemberRechargeRecordConverter;

    // 通过依赖注入获取NoGenerator
    @Autowired
    private NoGenerator noGenerator;

    @Autowired
    private AioveuMemberAccountService aioveuMemberAccountService;

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

        // 如果充值单号为空，则生成
        if (StrUtil.isBlank(formData.getRechargeNo())) {

            String newNo = noGenerator.generateAddRechargeNo();
            formData.setRechargeNo(newNo);
            log.info("生成的新RechargeNo: {}" +  noGenerator.generateRechargeNo());
        }

        AioveuMemberRechargeRecord entity = aioveuMemberRechargeRecordConverter.toEntity(formData);

        log.info("原始RechargeNo：" +  entity.getRechargeNo());


        return this.save(entity);
    }


    //--------------------------------------------------------------
    /**
     * 新增会员充值记录并执行充值操作
     *
     * @param formData 会员充值记录表单对象
     * @return 是否新增成功并充值成功
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    //方法返回值变更
    //从 boolean改为 RechargeResult
    //返回包含充值结果的详细对象
    public boolean saveAioveuMemberRechargeRecordandexecuteRecharge(AioveuMemberRechargeRecordForm formData) {


        // 1. 验证表单数据
        validateFormData(formData);//在服务方法中，如果仍然需要验证

        // 2. 转换表单数据为实体
        AioveuMemberRechargeRecord entity = aioveuMemberRechargeRecordConverter.toEntity(formData);


//        // 3. 设置充值记录状态为处理中
//        entity.setStatus(RechargeStatus.PROCESSING.getValue());

//        // 4. 生成交易流水号
//        if (StrUtil.isBlank(entity.getTransactionNo())) {
//            entity.setTransactionNo(generateTransactionNo());
//        }

        log.info("原始RechargeNo：" +  entity.getRechargeNo());
         // 4. 如果充值单号为空，则生成
        if (StrUtil.isBlank(entity.getRechargeNo())) {

            //实例化
//            NoGenerator noGenerator = new NoGenerator();

            String newNo = noGenerator.generateRechargeNo();
            entity.setRechargeNo(newNo);
            log.info("生成的新RechargeNo: {}" +  noGenerator.generateRechargeNo());
        }

        // 保存实体
        this.save(entity);

//        // 5. 保存充值记录
//        boolean saveSuccess = this.save(entity);
//        if (!saveSuccess) {
//            return new Result(false, "保存充值记录失败", BigDecimal.ZERO);
//        }

        // 6. 执行充值操作
        return executeRecharge(entity);
    }

    /**
     * 验证表单数据
     */
    private void validateFormData(AioveuMemberRechargeRecordForm formData) {
        Assert.notNull(formData, "表单数据不能为空");
        Assert.notNull(formData.getMemberId(), "会员ID不能为空");
        Assert.notNull(formData.getAmount(), "充值金额不能为空");
        Assert.isTrue(formData.getAmount().compareTo(BigDecimal.ZERO) > 0, "充值金额必须大于0");
        Assert.notNull(formData.getPaymentType(), "支付方式不能为空");
    }







    /**
     * 执行充值操作
     */
    private boolean executeRecharge(AioveuMemberRechargeRecord record) {
//        try {
            // 1. 获取或创建会员账户
            AioveuMemberAccount account = aioveuMemberAccountService.getOrCreateAccount(record.getMemberId());

//            // 2. 调用支付网关
//            boolean paymentSuccess = callPaymentGateway(record.getAmount(),
//                    PaymentType.valueOf(record.getPaymentType()),
//                    record.getTransactionNo());

              Boolean result = aioveuMemberAccountService.updateAccountAfterRecharge(account, record.getAmount(),record.getGiftAmount());

//            if (paymentSuccess) {
//                // 3. 支付成功，更新账户和记录
//                updateAccountAfterRecharge(account, record.getAmount());
//                updateRechargeRecordStatus(record, RechargeStatus.SUCCESS, "支付成功");
//
//                return new RechargeResult(true, "充值成功", account.getBalance());
//            } else {
//                // 4. 支付失败
//                updateRechargeRecordStatus(record, RechargeStatus.FAILED, "支付失败");
//
//                return new RechargeResult(false, "支付失败", account.getBalance());
//            }
//        } catch (Exception e) {
//            // 5. 处理异常
//            updateRechargeRecordStatus(record, RechargeStatus.FAILED, "系统错误: " + e.getMessage());
//            throw new RechargeException("充值过程中发生错误", e);
//        }
        return result;
    }



//    /**
//     * 模拟支付网关调用
//     */
//    private boolean callPaymentGateway(BigDecimal amount, PaymentType paymentType, String transactionNo) {
//        // 实际项目中这里会调用第三方支付接口
//        // 模拟支付成功
//        log.info("调用支付网关: 金额={}, 方式={}, 流水号={}", amount, paymentType, transactionNo);
//        return true; // 模拟总是成功
//    }



//    /**
//     * 更新充值记录状态
//     */
//    private void updateRechargeRecordStatus(AioveuMemberRechargeRecord record, RechargeStatus status, String remark) {
//        record.setStatus(status.getValue());
//        record.setRemark(remark);
//        this.updateById(record);
//    }






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
