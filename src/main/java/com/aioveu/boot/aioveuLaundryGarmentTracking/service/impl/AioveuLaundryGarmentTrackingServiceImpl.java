package com.aioveu.boot.aioveuLaundryGarmentTracking.service.impl;

import com.aioveu.boot.aioveuCommon.util.AioveuNameSetter.AioveuNameSetter;
import com.aioveu.boot.aioveuEmployee.service.AioveuEmployeeService;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.form.AioveuLaundryGarmentIdentityForm;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.service.AioveuLaundryGarmentIdentityService;
import com.aioveu.boot.aioveuWarehouse.service.AioveuWarehouseService;
import com.aioveu.boot.common.exception.BusinessException;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuLaundryGarmentTracking.mapper.AioveuLaundryGarmentTrackingMapper;
import com.aioveu.boot.aioveuLaundryGarmentTracking.service.AioveuLaundryGarmentTrackingService;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.entity.AioveuLaundryGarmentTracking;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.form.AioveuLaundryGarmentTrackingForm;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.query.AioveuLaundryGarmentTrackingQuery;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.vo.AioveuLaundryGarmentTrackingVO;
import com.aioveu.boot.aioveuLaundryGarmentTracking.converter.AioveuLaundryGarmentTrackingConverter;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import org.springframework.util.CollectionUtils;

import static org.codehaus.groovy.runtime.DefaultGroovyMethods.last;

/**
 * 衣物流转记录服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-10-11 18:35
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AioveuLaundryGarmentTrackingServiceImpl extends ServiceImpl<AioveuLaundryGarmentTrackingMapper, AioveuLaundryGarmentTracking> implements AioveuLaundryGarmentTrackingService {

    private final AioveuLaundryGarmentTrackingConverter aioveuLaundryGarmentTrackingConverter;

    @Autowired
    public AioveuLaundryGarmentIdentityService aioveuLaundryGarmentIdentityService;
    @Autowired
    private AioveuEmployeeService aioveuEmployeeService;
    @Autowired
    private AioveuWarehouseService aioveuWarehouseService;
    @Autowired
    private AioveuLaundryGarmentTrackingMapper aioveuLaundryGarmentTrackingMapper;

    /**
    * 获取衣物流转记录分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuLaundryGarmentTrackingVO>} 衣物流转记录分页列表
    */
    @Override
    public IPage<AioveuLaundryGarmentTrackingVO> getAioveuLaundryGarmentTrackingPage(AioveuLaundryGarmentTrackingQuery queryParams) {

        // 1. 创建Page对象时直接添加排序
        Page<AioveuLaundryGarmentTrackingVO> page = new Page<>(queryParams.getPageNum(), queryParams.getPageSize());
        page.addOrder(OrderItem.desc("update_time"));  // ✅ 在查询前设置排序

        // 2. 将已包含排序条件的Page对象传入Mapper
        Page<AioveuLaundryGarmentTrackingVO> pageVO = this.baseMapper.getAioveuLaundryGarmentTrackingPage(
                page,
                queryParams
        );

        AioveuNameSetter.setNamesByMaps(
                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
                AioveuLaundryGarmentTrackingVO::getGarmentCode,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
                aioveuLaundryGarmentIdentityService::getGarmentCodeMap,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
                AioveuLaundryGarmentTrackingVO::setGarmentCodeName             // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
        );

        AioveuNameSetter.setNamesByIds(
                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
                AioveuLaundryGarmentTrackingVO::getOperatorId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
                aioveuEmployeeService::getEmployeeMapByIds,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
                AioveuLaundryGarmentTrackingVO::setOperatorName             // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
        );

        AioveuNameSetter.setNamesByIds(
                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
                AioveuLaundryGarmentTrackingVO::getLocationId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
                aioveuWarehouseService::getWarehouseMapByIds,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
                AioveuLaundryGarmentTrackingVO::setLocationName             // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
        );


        return pageVO;
    }
    
    /**
     * 获取衣物流转记录表单数据
     *
     * @param id 衣物流转记录ID
     * @return 衣物流转记录表单数据
     */
    @Override
    public AioveuLaundryGarmentTrackingForm getAioveuLaundryGarmentTrackingFormData(Long id) {
        AioveuLaundryGarmentTracking entity = this.getById(id);
        return aioveuLaundryGarmentTrackingConverter.toForm(entity);
    }
    
    /**
     * 新增衣物流转记录
     *
     * 1.在衣物流转记录系统中，操作类型的更改不应该直接在记录表里修改，而是应该通过新增一条记录来实现。
     * 这种设计符合审计追踪的原则，确保每条记录都是不可变的，任何状态变更都会产生新的记录。
     * 2.通过新增记录而不是修改现有记录来实现状态变更，可以确保系统的可审计性、数据完整性和业务逻辑清晰性。
     * 这种设计符合现代系统设计的最佳实践，特别适合需要严格审计追踪的业务场景。
     *
     * 1.完整性原则：完整记录衣物的整个生命周期
     * 2.不可变性原则：流转记录一旦创建，不应被修改
     * 3.审计追踪原则：所有状态变更都应留下新的记录
     * 4.可追溯原则：可以追溯任何时间点的状态
     *
     * @param formData 衣物流转记录表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuLaundryGarmentTracking(AioveuLaundryGarmentTrackingForm formData) {
        AioveuLaundryGarmentTracking entity = aioveuLaundryGarmentTrackingConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新衣物流转记录
     *
     * 1.我理解您希望简化操作流程，通过编辑功能实现新增记录的需求。这
     * 是一个很好的优化思路，可以显著提高用户体验。
     * 下面我将设计一个完整的解决方案，允许用户通过编辑界面实现新增记录的功能。
     *
     *
     * @param id   衣物流转记录ID
     * @param formData 衣物流转记录表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuLaundryGarmentTracking(Long id,AioveuLaundryGarmentTrackingForm formData) {
        AioveuLaundryGarmentTracking entity = aioveuLaundryGarmentTrackingConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除衣物流转记录
     *
     * @param ids 衣物流转记录ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuLaundryGarmentTrackings(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的衣物流转记录数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }


    /**
     * 批量状态变更
     * @param orderItemIds 订单明细ID列表
     * @param targetStatus 目标状态
     * @param operatorId 操作人ID
     * @param batchRemarks 批量备注
     */


    /**
     * 获取指定衣物的最新流转记录
     * @param garmentCode 衣物编码
     * @return 最新流转记录
     */
    public AioveuLaundryGarmentTracking getLatestTrackingRecord(String garmentCode) {

        // 使用SQL查询（更高效）
        QueryWrapper<AioveuLaundryGarmentTracking> querywrapper = new QueryWrapper<>();
        querywrapper.eq("garment_code", garmentCode)
                .orderByDesc("update_time")
                .last("LIMIT 1");


        // 使用LambdaQueryWrapper构建查询
        LambdaQueryWrapper<AioveuLaundryGarmentTracking> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(AioveuLaundryGarmentTracking::getGarmentCode, garmentCode)
                .orderByDesc(AioveuLaundryGarmentTracking::getUpdateTime)
                .last("LIMIT 1"); // 确保只取一条记录

        AioveuLaundryGarmentTracking record = this.getOne(wrapper);

        if (record == null) {
            throw new BusinessException("未找到衣物编码为 " + garmentCode + " 的最新流转记录");
        }

        return record;
    }

    /**
     * 获取每个衣物编码的最新记录ID
     */
    @Override
    public List<Long> getLatestTrackingIdsByCodes(List<String> garmentCodes) {
        if (CollectionUtils.isEmpty(garmentCodes)) {
            return Collections.emptyList();
        }

        // 分批处理（避免SQL过长）
        List<Long> allIds = new ArrayList<>();
        int batchSize = 500;
        for (int i = 0; i < garmentCodes.size(); i += batchSize) {
            int end = Math.min(i + batchSize, garmentCodes.size());
            List<String> batch = garmentCodes.subList(i, end);
            allIds.addAll(aioveuLaundryGarmentTrackingMapper .selectLatestTrackingIdsByCodes(batch));
        }

        return allIds;
    }

    /**
     * 批量查询最新流转记录
     */
    @Override
    public Map<String, AioveuLaundryGarmentTracking> getLatestTrackingByCodes(List<String> garmentCodes) {
        // 获取每个衣物编码的最新记录ID
        List<Long> latestIds = this.getLatestTrackingIdsByCodes(garmentCodes);
        if (CollectionUtils.isEmpty(latestIds)) {
            log.info("未找到任何最新流转记录ID");
            return Collections.emptyMap();
        }

        // 批量查询记录
        LambdaQueryWrapper<AioveuLaundryGarmentTracking> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(AioveuLaundryGarmentTracking::getId, latestIds)
                .select(
                        AioveuLaundryGarmentTracking::getId,
                        AioveuLaundryGarmentTracking::getGarmentCode,
                        AioveuLaundryGarmentTracking::getOperationType,
                        AioveuLaundryGarmentTracking::getOperatorId
                );


        List<AioveuLaundryGarmentTracking> trackings = this.list(wrapper);
        return trackings.stream()
                .collect(Collectors.toMap(
                        tracking -> String.valueOf(tracking.getGarmentCode()), // 显式调用String.valueOf
                        Function.identity(),
                        (existing, replacement) -> existing // 如果有重复键，保留第一个
                ));
    }


    /*
     * 根据二维码查找最新流转记录
     */

    @Override
    public AioveuLaundryGarmentTracking getLatestTrackingByGarmentCode(String garmentCode) {
        try {
            return createDefaultTrackingRecord(garmentCode);
//            return this.findTopByGarmentCodeOrderByOperationTimeDesc(garmentCode)
//                    .orElseGet(() -> createDefaultTrackingRecord(garmentCode));
        } catch (Exception e) {
            log.error("获取衣物流转记录失败: {}", e.getMessage(), e);
            return createDefaultTrackingRecord(garmentCode);
        }
    }

    private AioveuLaundryGarmentTracking createDefaultTrackingRecord(String garmentCode) {
        log.warn("为衣物 {} 创建默认流转记录", garmentCode);

        AioveuLaundryGarmentTracking tracking = new AioveuLaundryGarmentTracking();
//        tracking.setGarmentCode(garmentCode);
        tracking.setOperationType(1); // 默认操作类型

        tracking.setOperatorId(1L);
        tracking.setLocationId(1l);
//        tracking.setNotes("自动生成的默认流转记录");
//        tracking.setStatus(1); // 有效状态

        return tracking;
    }



}
