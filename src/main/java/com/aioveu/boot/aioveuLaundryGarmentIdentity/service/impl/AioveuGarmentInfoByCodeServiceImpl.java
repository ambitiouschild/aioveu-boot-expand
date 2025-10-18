package com.aioveu.boot.aioveuLaundryGarmentIdentity.service.impl;

import com.aioveu.boot.aioveuLaundryClothingType.model.entity.AioveuLaundryClothingType;
import com.aioveu.boot.aioveuLaundryClothingType.service.AioveuLaundryClothingTypeService;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.entity.AioveuLaundryGarmentIdentity;
import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model.AioveuGarmentInfo;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.service.AioveuLaundryGarmentIdentityService;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.entity.AioveuLaundryGarmentTracking;
import com.aioveu.boot.aioveuLaundryGarmentTracking.service.AioveuLaundryGarmentTrackingService;
import com.aioveu.boot.aioveuLaundryOrder.model.entity.AioveuLaundryOrder;
import com.aioveu.boot.aioveuLaundryOrder.service.AioveuLaundryOrderService;
import com.aioveu.boot.aioveuLaundryOrderItem.model.entity.AioveuLaundryOrderItem;
import com.aioveu.boot.aioveuLaundryOrderItem.service.AioveuLaundryOrderItemService;
import com.aioveu.boot.aioveuMember.model.entity.AioveuMember;
import com.aioveu.boot.aioveuMember.service.AioveuMemberService;
import com.aioveu.boot.common.exception.BusinessException;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 根据衣物编码查找衣物信息
 */

@Service
@RequiredArgsConstructor
public class AioveuGarmentInfoByCodeServiceImpl {


    @Autowired
    private AioveuLaundryOrderItemService aioveuLaundryOrderItemService;
    @Autowired
    private AioveuLaundryClothingTypeService aioveuLaundryClothingTypeService;
    @Autowired
    private AioveuLaundryOrderService aioveuLaundryOrderService;
    @Autowired
    private AioveuMemberService aioveuMemberService;
    @Autowired
    private AioveuLaundryGarmentTrackingService aioveuLaundryGarmentTrackingService;
    @Autowired
    private AioveuLaundryGarmentIdentityService aioveuLaundryGarmentIdentityService;

    /**
     * 根据衣物编码获取衣物信息 通过衣物编码获取衣物信息并返回相关信息
     * 根据衣物编码列表批量获取衣物信息
     */
    public AioveuGarmentInfo getGarmentInfoByCode(String garmentCode) {

        // 1. 查询衣物身份信息
        LambdaQueryWrapper<AioveuLaundryGarmentIdentity> identityWrapper = new LambdaQueryWrapper<>();
        identityWrapper.eq(AioveuLaundryGarmentIdentity::getGarmentCode, garmentCode)
                .select(
                        AioveuLaundryGarmentIdentity::getId,
                        AioveuLaundryGarmentIdentity::getGarmentCode,
                        AioveuLaundryGarmentIdentity::getQrCodePath,
                        AioveuLaundryGarmentIdentity::getGarmentOrderDetailId,
                        AioveuLaundryGarmentIdentity::getStatus,
                        AioveuLaundryGarmentIdentity::getCreateTime,
                        AioveuLaundryGarmentIdentity::getUpdateTime
                );
        AioveuLaundryGarmentIdentity garmentIdentity = aioveuLaundryGarmentIdentityService.getOne(identityWrapper);

//        log.info("衣物身份信息： ", garmentIdentity.getGarmentCode());
        if (garmentIdentity == null) {
            throw new RuntimeException("未找到衣物编码: " + garmentCode);
        }

        // 2. 查询订单明细
        Long orderDetailId = garmentIdentity.getGarmentOrderDetailId();
        LambdaQueryWrapper<AioveuLaundryOrderItem> itemWrapper = new LambdaQueryWrapper<>();
        itemWrapper.eq(AioveuLaundryOrderItem::getId, orderDetailId)
                .select(
                        AioveuLaundryOrderItem::getOrderId,
                        AioveuLaundryOrderItem::getClothingTypeId,
                        AioveuLaundryOrderItem::getProblemDesc,
                        AioveuLaundryOrderItem::getProcessStatus
                );
        AioveuLaundryOrderItem orderItem = aioveuLaundryOrderItemService.getOne(itemWrapper);

        if (orderItem == null) {
            throw new RuntimeException("未找到订单明细: " + orderDetailId);
        }

        // 3. 查询衣物类型
        Long clothingTypeId = orderItem.getClothingTypeId();
        LambdaQueryWrapper<AioveuLaundryClothingType> typeWrapper = new LambdaQueryWrapper<>();
        typeWrapper.eq(AioveuLaundryClothingType::getId, clothingTypeId)
                .select(
                        AioveuLaundryClothingType::getTypeName,
                        AioveuLaundryClothingType::getCategory,
                        AioveuLaundryClothingType::getBasePrice,
                        AioveuLaundryClothingType::getProcessingTime,
                        AioveuLaundryClothingType::getSpecialRequirements
                );
        AioveuLaundryClothingType clothingType = aioveuLaundryClothingTypeService.getOne(typeWrapper);

        if (clothingType == null) {
            throw new RuntimeException("未找到衣物类型: " + clothingTypeId);
        }

        // 4. 查询订单信息
        Long orderId = orderItem.getOrderId();
        LambdaQueryWrapper<AioveuLaundryOrder> orderWrapper = new LambdaQueryWrapper<>();
        orderWrapper.eq(AioveuLaundryOrder::getId, orderId)
                .select(
                        AioveuLaundryOrder::getOrderNo,
                        AioveuLaundryOrder::getMemberId,
                        AioveuLaundryOrder::getStatus,
                        AioveuLaundryOrder::getCustomerPhone,
                        AioveuLaundryOrder::getRemark,
                        AioveuLaundryOrder::getCreateTime

                );
        AioveuLaundryOrder order = aioveuLaundryOrderService.getOne(orderWrapper);

        if (order == null) {
            throw new RuntimeException("未找到订单: " + orderId);
        }

        // 5. 查询客户信息
        Long memberId = order.getMemberId();
        LambdaQueryWrapper<AioveuMember> customerWrapper = new LambdaQueryWrapper<>();
        customerWrapper.eq(AioveuMember::getId, memberId)
                .select(
                        AioveuMember::getMemberNo,
                        AioveuMember::getName,
                        AioveuMember::getPhone
                );
        AioveuMember member = aioveuMemberService.getOne(customerWrapper);

        if (member == null) {
            throw new RuntimeException("未找到客户: " + memberId);
        }


        // 6. 查询流转记录 根据衣物ID查询流转记录（按时间倒序）
        LambdaQueryWrapper<AioveuLaundryGarmentTracking> trackingWrapper = new LambdaQueryWrapper<>();
        trackingWrapper.eq(AioveuLaundryGarmentTracking::getGarmentCode, garmentIdentity.getId())
                .orderByDesc(AioveuLaundryGarmentTracking::getUpdateTime)
                .last("LIMIT 1") // 确保只取一条记录
                .select(
                        AioveuLaundryGarmentTracking::getId,
                        AioveuLaundryGarmentTracking::getOperationType,
                        AioveuLaundryGarmentTracking::getOperatorId
                );
        AioveuLaundryGarmentTracking tracking = aioveuLaundryGarmentTrackingService.getOne(trackingWrapper);

        if (tracking == null) {
            throw new BusinessException("未找到衣物编码为 " + garmentCode + " 的最新流转记录");
        }

        // 7. 组装返回信息
        return buildGarmentInfo(
                garmentIdentity,
                orderItem,
                clothingType,
                order,
                member,
                tracking
        );

    }

    /**
     * 组装衣物信息
     */
    private AioveuGarmentInfo buildGarmentInfo(
            AioveuLaundryGarmentIdentity garmentIdentity,
            AioveuLaundryOrderItem orderItem,
            AioveuLaundryClothingType clothingType,
            AioveuLaundryOrder order,
            AioveuMember member,
            AioveuLaundryGarmentTracking tracking
    ) {
        AioveuGarmentInfo garmentInfo = new AioveuGarmentInfo();

        // 基础信息
        garmentInfo.setId(garmentIdentity.getId());
        garmentInfo.setGarmentCode(garmentIdentity.getGarmentCode());
        garmentInfo.setQrCodePath(garmentIdentity.getQrCodePath());
        garmentInfo.setCurrentStatus(garmentIdentity.getStatus());
        garmentInfo.setCreateTime(garmentIdentity.getCreateTime());
        garmentInfo.setUpdateTime(garmentIdentity.getUpdateTime());

        // 订单明细信息
        garmentInfo.setProblemDesc(orderItem.getProblemDesc());
        garmentInfo.setProcessStatus(orderItem.getProcessStatus());

        // 衣物类型信息
        garmentInfo.setGarmentType(clothingType.getTypeName());
        garmentInfo.setCategory(clothingType.getCategory());
        garmentInfo.setBasePrice(clothingType.getBasePrice());
        garmentInfo.setProcessingTime(clothingType.getProcessingTime());


        // 订单信息
        garmentInfo.setOrderNo(order.getOrderNo());
        garmentInfo.setOrderStatus(order.getStatus());
        garmentInfo.setCustomerPhone(order.getCustomerPhone());
        garmentInfo.setOrderTime(order.getCreateTime());

        // 客户信息
        garmentInfo.setMemberNo(member.getMemberNo());
        garmentInfo.setName(member.getName());
        garmentInfo.setPhone(member.getPhone());

        // 最新记录信息
        garmentInfo.setOperationType(tracking.getOperationType());

        return garmentInfo;
    }

    //根据二维码列表批量获取衣物信息
    public List<AioveuGarmentInfo> getGarmentsByQrCodes(List<String> garmentCodes) {
        // 1. 验证输入
        if (CollectionUtils.isEmpty(garmentCodes)) {
            return Collections.emptyList();
        }

        // 2. 批量查询衣物身份信息
        List<AioveuLaundryGarmentIdentity> garmentIdentities = aioveuLaundryGarmentIdentityService.getGarmentIdentitiesByCodes(garmentCodes);

        if (garmentIdentities.isEmpty()) {
            return Collections.emptyList();
        }

        // 3. 提取相关ID
        Set<Long> orderDetailIds = garmentIdentities.stream()
                .map(AioveuLaundryGarmentIdentity::getGarmentOrderDetailId)
                .collect(Collectors.toSet());

        Set<Long> clothingTypeIds = new HashSet<>();
        Set<Long> orderIds = new HashSet<>();
        Set<Long> memberIds = new HashSet<>();

        // 4. 批量查询订单明细
        Map<Long, AioveuLaundryOrderItem> orderItemsMap = aioveuLaundryOrderItemService.getOrderItemsByIds(orderDetailIds);
        for (AioveuLaundryOrderItem item : orderItemsMap.values()) {
            clothingTypeIds.add(item.getClothingTypeId());
            orderIds.add(item.getOrderId());
        }

        // 5. 批量查询订单信息
        Map<Long, AioveuLaundryOrder> ordersMap = aioveuLaundryOrderService.getOrdersByIds(orderIds);
        for (AioveuLaundryOrder order : ordersMap.values()) {
            memberIds.add(order.getMemberId());
        }

        // 6. 批量查询衣物类型
        Map<Long, AioveuLaundryClothingType> clothingTypesMap = aioveuLaundryClothingTypeService.getClothingTypesByIds(clothingTypeIds);

        // 7. 批量查询会员信息
        Map<Long, AioveuMember> membersMap = aioveuMemberService.getMembersByIds(memberIds);
        // 8. 批量查询最新流转记录
        Map<String, AioveuLaundryGarmentTracking> latestTrackingMap = aioveuLaundryGarmentTrackingService.getLatestTrackingByCodes(garmentCodes);

        // 9. 组装结果
        return assembleGarmentInfos(
                garmentIdentities,
                orderItemsMap,
                clothingTypesMap,
                ordersMap,
                membersMap,
                latestTrackingMap
        );


    }

    /**
     * 组装衣物信息
     */
    private List<AioveuGarmentInfo> assembleGarmentInfos(
            List<AioveuLaundryGarmentIdentity> garmentIdentities,
            Map<Long, AioveuLaundryOrderItem> orderItemsMap,
            Map<Long, AioveuLaundryClothingType> clothingTypesMap,
            Map<Long, AioveuLaundryOrder> ordersMap,
            Map<Long, AioveuMember> membersMap,
            Map<String, AioveuLaundryGarmentTracking> latestTrackingMap
    ) {
        List<AioveuGarmentInfo> results = new ArrayList<>();

        for (AioveuLaundryGarmentIdentity identity : garmentIdentities) {
            // 获取订单明细
            AioveuLaundryOrderItem orderItem = orderItemsMap.get(identity.getGarmentOrderDetailId());
            if (orderItem == null) {
                continue;
            }

            // 获取衣物类型
            AioveuLaundryClothingType clothingType = clothingTypesMap.get(orderItem.getClothingTypeId());
            if (clothingType == null) {
                continue;
            }

            // 获取订单
            AioveuLaundryOrder order = ordersMap.get(orderItem.getOrderId());
            if (order == null) {
                continue;
            }

            // 获取会员
            AioveuMember member = membersMap.get(order.getMemberId());
            if (member == null) {
                continue;
            }

            // 获取最新流转记录
            AioveuLaundryGarmentTracking tracking = latestTrackingMap.get(identity.getGarmentCode());

            // 组装信息
            results.add(buildGarmentInfo(identity, orderItem, clothingType, order, member, tracking));
        }

        return results;
    }


    // 转换为映射：二维码 -> 衣物信息
    public Map<String, AioveuGarmentInfo> getGarmentsMapByQrCodes(List<String> qrCodes) {
        List<AioveuGarmentInfo> garments = getGarmentsByQrCodes(qrCodes);

        // 转换为映射：二维码 -> 衣物信息
        return garments.stream()
                .collect(Collectors.toMap(
                        AioveuGarmentInfo::getGarmentCode,
                        Function.identity(),
                        (existing, replacement) -> existing // 如果有重复键，保留第一个
                ));
    }


    /**
     * 根据衣物编码列表批量获取衣物信息（带验证）
     */
    // 验证是否所有二维码都有对应的衣物信息
    public List<AioveuGarmentInfo> getGarmentsByQrCodesWithValidation(List<String> qrCodes) {
        List<AioveuGarmentInfo> garments = getGarmentsByQrCodes(qrCodes);

        // 验证是否所有二维码都有对应的衣物信息
        if (garments.size() != qrCodes.size()) {
            // 找出缺失的二维码
            Set<String> foundCodes = garments.stream()
                    .map(AioveuGarmentInfo::getGarmentCode)
                    .collect(Collectors.toSet());

            List<String> missingCodes = qrCodes.stream()
                    .filter(code -> !foundCodes.contains(code))
                    .collect(Collectors.toList());

            throw new BusinessException("部分二维码对应的衣物信息不存在: " + missingCodes);
        }

        return garments;
    }


    /**
     * 获取二维码图片URL
     */
    public String getQrCodeImageUrl(String garmentCode) {
        // 实际实现根据您的系统架构
        // 这里是一个示例实现

        // 1. 查询衣物身份信息
        LambdaQueryWrapper<AioveuLaundryGarmentIdentity> identityWrapper = new LambdaQueryWrapper<>();
        identityWrapper.eq(AioveuLaundryGarmentIdentity::getGarmentCode, garmentCode)
                .select(
                        AioveuLaundryGarmentIdentity::getGarmentCode,
                        AioveuLaundryGarmentIdentity::getQrCodePath
                );
        AioveuLaundryGarmentIdentity garmentIdentity = aioveuLaundryGarmentIdentityService.getOne(identityWrapper);
        return garmentIdentity.getQrCodePath();
    }


}
