package com.aioveu.boot.aioveuLaundryGarmentIdentity.service.impl;


import com.aioveu.boot.aioveuCommon.util.AioveuEntityUniqueValidator.AioveuEntityUniqueValidator;
import com.aioveu.boot.aioveuCommon.util.AioveuEvent.AioveuGarmentCreatedEvent.AioveuGarmentCreatedEvent;
import com.aioveu.boot.aioveuCommon.util.AioveuNameSetter.AioveuNameSetter;
import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model.GarmentCodeResult;
import com.aioveu.boot.aioveuCommon.util.NumberGenerator.NoGenerator;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.vo.AioveuGarmentIdentityOptionVO;
import com.aioveu.boot.aioveuLaundryOrderItem.service.AioveuLaundryOrderItemService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import groovy.lang.Lazy;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.mapper.AioveuLaundryGarmentIdentityMapper;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.service.AioveuLaundryGarmentIdentityService;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.entity.AioveuLaundryGarmentIdentity;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.form.AioveuLaundryGarmentIdentityForm;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.query.AioveuLaundryGarmentIdentityQuery;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.vo.AioveuLaundryGarmentIdentityVO;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.converter.AioveuLaundryGarmentIdentityConverter;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;



/**
 * 衣物唯一编码服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:31
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AioveuLaundryGarmentIdentityServiceImpl extends ServiceImpl<AioveuLaundryGarmentIdentityMapper, AioveuLaundryGarmentIdentity> implements AioveuLaundryGarmentIdentityService {

    private final AioveuLaundryGarmentIdentityConverter aioveuLaundryGarmentIdentityConverter;


    // 通过依赖注入获取NoGenerator
    @Autowired
    private NoGenerator noGenerator;
    @Autowired
    private AioveuLaundryOrderItemService aioveuLaundryOrderItemService;

    private final ApplicationEventPublisher eventPublisher;


    /**
    * 获取衣物唯一编码分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuLaundryGarmentIdentityVO>} 衣物唯一编码分页列表
    */
    @Override
    public IPage<AioveuLaundryGarmentIdentityVO> getAioveuLaundryGarmentIdentityPage(AioveuLaundryGarmentIdentityQuery queryParams) {

        // 1. 创建Page对象时直接添加排序
        Page<AioveuLaundryGarmentIdentityVO> page = new Page<>(queryParams.getPageNum(), queryParams.getPageSize());
        page.addOrder(OrderItem.desc("update_time"));  // ✅ 在查询前设置排序

        // 2. 将已包含排序条件的Page对象传入Mapper
        Page<AioveuLaundryGarmentIdentityVO> pageVO = this.baseMapper.getAioveuLaundryGarmentIdentityPage(
                page,
                queryParams
        );

        //3. 后续设置名称等操作
        AioveuNameSetter.setNamesByMaps(
                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
                AioveuLaundryGarmentIdentityVO::getGarmentOrderDetailId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
                aioveuLaundryOrderItemService::getItemProblemDescMap,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
                AioveuLaundryGarmentIdentityVO::setItemProblemDesc            // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
        );


        return pageVO;
    }
    
    /**
     * 获取衣物唯一编码表单数据
     *
     * @param id 衣物唯一编码ID
     * @return 衣物唯一编码表单数据
     */
    @Override
    public AioveuLaundryGarmentIdentityForm getAioveuLaundryGarmentIdentityFormData(Long id) {
        AioveuLaundryGarmentIdentity entity = this.getById(id);
        return aioveuLaundryGarmentIdentityConverter.toForm(entity);
    }
    
    /**
     * 新增衣物唯一编码
     *
     * @param formData 衣物唯一编码表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuLaundryGarmentIdentity(AioveuLaundryGarmentIdentityForm formData) {

        // 字段1：检查编号是否唯一（对于不依赖外键的字段，不可重复）
        AioveuEntityUniqueValidator.validateUniqueForCreate(
                formData,
                AioveuLaundryGarmentIdentityForm::getGarmentOrderDetailId, // 获取实体
                AioveuLaundryGarmentIdentity::getGarmentOrderDetailId,    // 实体字段
                this,
                "衣物唯一编码",
                "关联订单明细"
        );

        // 1.如果单号为空，则生成
        if (StrUtil.isBlank(formData.getGarmentCode())) {

            // 生成编码和二维码
            GarmentCodeResult result =
                    noGenerator.generateGarmentQRCode();

            String newGarmentCode = result.getGarmentCode();
            String newQrCodeUrl = result.getQrCodeUrl();
            formData.setGarmentCode(newGarmentCode);
            formData.setQrCodePath(newQrCodeUrl);
            log.info("生成的newGarmentCode: " +  newGarmentCode);
            log.info("生成的newQrCodeUrl: " +  newQrCodeUrl);

        }

        // 2.无论单号是生成的还是用户提供的，都要检查是否重复。
        LambdaQueryWrapper<AioveuLaundryGarmentIdentity> wrapper = new LambdaQueryWrapper<>();
        // 正确调用：传递 formData 参数
        wrapper.eq(AioveuLaundryGarmentIdentity::getGarmentCode, formData.getGarmentCode());

        //3.如果重复，则重新生成（如果是用户提供的，可能需要提示用户，但根据业务逻辑，这里选择重新生成）。
        while (this.count(wrapper) > 0) {
            // 重新生成单号
            // 生成编码和二维码
            GarmentCodeResult result =
                    noGenerator.generateGarmentQRCode();
            String againGarmentCode = result.getGarmentCode();
            formData.setGarmentCode(againGarmentCode);
            log.info("生成的againTypeCode: " +  againGarmentCode);

            //4.重新生成后，再次检查，直到不重复为止（或者设置最大重试次数）。
            // 更新查询条件，检查新生成的单号
            wrapper.clear();
            wrapper.eq(AioveuLaundryGarmentIdentity::getGarmentCode, formData.getGarmentCode());
        }


        //在洗衣管理系统中，新增衣物编码后自动创建衣物流转记录是一个重要的业务流程。这可以确保衣物从进入系统开始就有完整的流转历史
        // 创建初始流转记录
//        initialTrackingRecord.createInitialTrackingRecord(formData);



        // 创建衣物身份记录
        AioveuLaundryGarmentIdentity entity = aioveuLaundryGarmentIdentityConverter.toEntity(formData);

        // 保存衣物信息
        boolean result = this.save(entity);

        if (result) {
            // 发布事件，而不是直接调用 InitialTrackingRecord
            log.info("发布为ID创建的服装事件: {}", formData.getGarmentCode());
            // 确保使用正确的事件类
            eventPublisher.publishEvent(new AioveuGarmentCreatedEvent(this, entity));
        } else {
            log.error("服装保存失败，跳过事件发布");
        }

        // 保存到数据库
        return result;
    }
    
    /**
     * 更新衣物唯一编码
     *
     * @param id   衣物唯一编码ID
     * @param formData 衣物唯一编码表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuLaundryGarmentIdentity(Long id,AioveuLaundryGarmentIdentityForm formData) {

        // 字段1：检查编号是否唯一（对于不依赖外键的字段，不可重复）
        AioveuEntityUniqueValidator.validateUniqueForCreate(
                formData,
                AioveuLaundryGarmentIdentityForm::getGarmentOrderDetailId, // 获取实体
                AioveuLaundryGarmentIdentity::getGarmentOrderDetailId,    // 实体字段
                this,
                "衣物唯一编码",
                "关联订单明细"
        );

        AioveuLaundryGarmentIdentity entity = aioveuLaundryGarmentIdentityConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除衣物唯一编码
     *
     * @param ids 衣物唯一编码ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuLaundryGarmentIdentitys(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的衣物唯一编码数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }



    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter  无参数
     */
    @Override
    public Map<Long, String> getGarmentCodeMap() {


        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuLaundryGarmentIdentity> identities = lambdaQuery()
                .select(AioveuLaundryGarmentIdentity::getId, AioveuLaundryGarmentIdentity::getGarmentCode)
                .list();

        // 2.转换为Map: key=ID, value=名称
        return identities.stream()
                .collect(Collectors.toMap(
                        AioveuLaundryGarmentIdentity::getId,
                        AioveuLaundryGarmentIdentity::getGarmentCode
                ));
    }

    /**
     * 获取选项列表（用于下拉选择框） @AllArgsConstructor // 全参构造
     *
     * @return 选项列表
     */
    @Override
    public List<AioveuGarmentIdentityOptionVO> getAllGarmentIdentityOptions() {

        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuLaundryGarmentIdentity> garmentIdentitys = lambdaQuery()
                .select(AioveuLaundryGarmentIdentity::getId, AioveuLaundryGarmentIdentity::getGarmentCode)
                .list();

        // 2.转换为选项对象
        List<AioveuGarmentIdentityOptionVO>  garmentIdentityOptions  = garmentIdentitys.stream()
                .map(garmentIdentity -> new AioveuGarmentIdentityOptionVO(garmentIdentity.getId(), garmentIdentity.getGarmentCode()))
                .collect(Collectors.toList());

        return garmentIdentityOptions;
    }

    /**
     * 批量查询衣物身份信息
     */
    @Override
    public List<AioveuLaundryGarmentIdentity> getGarmentIdentitiesByCodes(List<String> garmentCodes) {
        LambdaQueryWrapper<AioveuLaundryGarmentIdentity> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(AioveuLaundryGarmentIdentity::getGarmentCode, garmentCodes)
                .select(
                        AioveuLaundryGarmentIdentity::getId,
                        AioveuLaundryGarmentIdentity::getGarmentCode,
                        AioveuLaundryGarmentIdentity::getQrCodePath,
                        AioveuLaundryGarmentIdentity::getGarmentOrderDetailId,
                        AioveuLaundryGarmentIdentity::getStatus,
                        AioveuLaundryGarmentIdentity::getCreateTime,
                        AioveuLaundryGarmentIdentity::getUpdateTime
                );
        return this.list(wrapper);
    }
}
