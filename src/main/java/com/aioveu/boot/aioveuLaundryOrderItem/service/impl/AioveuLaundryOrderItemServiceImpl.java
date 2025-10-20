package com.aioveu.boot.aioveuLaundryOrderItem.service.impl;

import com.aioveu.boot.aioveuCommon.util.AioveuEntityUniqueValidator.AioveuEntityUniqueValidator;
import com.aioveu.boot.aioveuCommon.util.AioveuNameSetter.AioveuNameSetter;
import com.aioveu.boot.aioveuLaundryClothingType.model.entity.AioveuLaundryClothingType;
import com.aioveu.boot.aioveuLaundryClothingType.service.AioveuLaundryClothingTypeService;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.entity.AioveuLaundryGarmentIdentity;
import com.aioveu.boot.aioveuLaundryOrder.model.entity.AioveuLaundryOrder;
import com.aioveu.boot.aioveuLaundryOrder.service.AioveuLaundryOrderService;
import com.aioveu.boot.aioveuLaundryOrderItem.model.vo.AioveuLaundryOrderItemOption;
import com.aioveu.boot.aioveuMemberAccount.model.entity.AioveuMemberAccount;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuLaundryOrderItem.mapper.AioveuLaundryOrderItemMapper;
import com.aioveu.boot.aioveuLaundryOrderItem.service.AioveuLaundryOrderItemService;
import com.aioveu.boot.aioveuLaundryOrderItem.model.entity.AioveuLaundryOrderItem;
import com.aioveu.boot.aioveuLaundryOrderItem.model.form.AioveuLaundryOrderItemForm;
import com.aioveu.boot.aioveuLaundryOrderItem.model.query.AioveuLaundryOrderItemQuery;
import com.aioveu.boot.aioveuLaundryOrderItem.model.vo.AioveuLaundryOrderItemVO;
import com.aioveu.boot.aioveuLaundryOrderItem.converter.AioveuLaundryOrderItemConverter;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import org.springframework.util.CollectionUtils;

/**
 * 洗衣订单衣物明细服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:55
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AioveuLaundryOrderItemServiceImpl extends ServiceImpl<AioveuLaundryOrderItemMapper, AioveuLaundryOrderItem> implements AioveuLaundryOrderItemService {

    private final AioveuLaundryOrderItemConverter aioveuLaundryOrderItemConverter;

    @Autowired
    private AioveuLaundryOrderService aioveuLaundryOrderService;

    @Autowired
    private AioveuLaundryClothingTypeService aioveuLaundryClothingTypeService;


    /**
    * 获取洗衣订单衣物明细分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuLaundryOrderItemVO>} 洗衣订单衣物明细分页列表
    */
    @Override
    public IPage<AioveuLaundryOrderItemVO> getAioveuLaundryOrderItemPage(AioveuLaundryOrderItemQuery queryParams) {

        // 1. 创建Page对象时直接添加排序
        Page<AioveuLaundryOrderItemVO> page = new Page<>(queryParams.getPageNum(), queryParams.getPageSize());
        page.addOrder(OrderItem.desc("update_time"));  // ✅ 在查询前设置排序

        // 2. 将已包含排序条件的Page对象传入Mapper
        Page<AioveuLaundryOrderItemVO> pageVO = this.baseMapper.getAioveuLaundryOrderItemPage(
                page,
                queryParams
        );

        AioveuNameSetter.setNamesByMaps(
                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
                AioveuLaundryOrderItemVO::getOrderId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
                aioveuLaundryOrderService::getLaundryOrderNoMap,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
                AioveuLaundryOrderItemVO::setOrderNo             // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
        );

        AioveuNameSetter.setNamesByMaps(
                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
                AioveuLaundryOrderItemVO::getClothingTypeId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
                aioveuLaundryClothingTypeService::getLaundryClothingTypeMap,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
                AioveuLaundryOrderItemVO::setClothingTypeName             // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
        );

        return pageVO;
    }
    
    /**
     * 获取洗衣订单衣物明细表单数据
     *
     * @param id 洗衣订单衣物明细ID
     * @return 洗衣订单衣物明细表单数据
     */
    @Override
    public AioveuLaundryOrderItemForm getAioveuLaundryOrderItemFormData(Long id) {
        AioveuLaundryOrderItem entity = this.getById(id);
        return aioveuLaundryOrderItemConverter.toForm(entity);
    }
    
    /**
     * 新增洗衣订单衣物明细
     *
     * @param formData 洗衣订单衣物明细表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuLaundryOrderItem(AioveuLaundryOrderItemForm formData) {

        //生成唯一全部洗衣订单衣物明细并设置到formData
        buildTotalOrderItemDesc(formData);

        // 字段1：检查编号是否唯一（对于不依赖外键的字段，不可重复）
        AioveuEntityUniqueValidator.validateUniqueForCreate(
                formData,
                AioveuLaundryOrderItemForm::getTotalOrderItemDesc, // 获取实体
                AioveuLaundryOrderItem::getTotalOrderItemDesc,    // 实体字段
                this,
                "洗衣订单衣物明细",
                "唯一信息"
        );

        // 转换为实体并保存
        AioveuLaundryOrderItem entity = aioveuLaundryOrderItemConverter.toEntity(formData);
        return this.save(entity);
    }

    /**
     * 生成唯一完整洗衣订单衣物明细并设置到formData
     * 移除其保存实体的职责，只负责构建描述
     * 改为 private方法，不暴露为接口
     * @param formData 洗衣订单衣物明细表单对象
     */
    private void buildTotalOrderItemDesc(AioveuLaundryOrderItemForm formData) {

        //1.获取订单号
        LambdaQueryWrapper<AioveuLaundryOrder> orderWrapper = new LambdaQueryWrapper<>();
        orderWrapper.eq(AioveuLaundryOrder::getId, formData.getOrderId())
                .select(AioveuLaundryOrder::getOrderNo);

        // 安全获取查询结果，避免空指针
        AioveuLaundryOrder  orderEntity  = aioveuLaundryOrderService.getOne(orderWrapper);
        // 使用三元运算符处理可能的空值
        String orderNo = (orderEntity != null && orderEntity.getOrderNo() != null)
                ? orderEntity.getOrderNo()
                : "未知订单";

        //2.获取衣物类型
        LambdaQueryWrapper<AioveuLaundryClothingType> clothingTypeWrapper = new LambdaQueryWrapper<>();
        clothingTypeWrapper.eq(AioveuLaundryClothingType::getId, formData.getClothingTypeId())
                .select(AioveuLaundryClothingType::getTypeName);

        // 安全获取查询结果，避免空指针
        AioveuLaundryClothingType clothingTypeEntity  = aioveuLaundryClothingTypeService.getOne(clothingTypeWrapper);
        // 使用三元运算符处理可能的空值
        String clothingTypeName = (clothingTypeEntity != null && clothingTypeEntity.getTypeName() != null)
                ? clothingTypeEntity.getTypeName()
                : "未知类型";

        // 3. 构建问题描述
        StringBuilder totalOrderItemDescBuilder = new StringBuilder()
                .append(orderNo)
                .append(" - ")  // 添加分隔符
                .append(clothingTypeName)
                .append(" - ")  // 添加分隔符
                .append(formData.getProblemDesc() != null ? formData.getProblemDesc() : "");

        // 4. 设置回formData
        formData.setTotalOrderItemDesc(totalOrderItemDescBuilder.toString());
        String totalOrderItemDesc = totalOrderItemDescBuilder.toString();

        log.info("构建订单衣物描述：订单ID={}, 类型ID={} , 问题描述={}",
                orderNo, clothingTypeName, formData.getProblemDesc());

        log.info("完整订单衣物描述：{}",
                totalOrderItemDesc);
    }
    
    /**
     * 更新洗衣订单衣物明细
     *
     * @param id   洗衣订单衣物明细ID
     * @param formData 洗衣订单衣物明细表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuLaundryOrderItem(Long id,AioveuLaundryOrderItemForm formData) {

        //生成唯一全部洗衣订单衣物明细并设置到formData
        buildTotalOrderItemDesc(formData);

        AioveuLaundryOrderItem entity = aioveuLaundryOrderItemConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除洗衣订单衣物明细
     *
     * @param ids 洗衣订单衣物明细ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuLaundryOrderItems(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的洗衣订单衣物明细数据为空");
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
    public Map<Long, String> getItemProblemDescMap() {


        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuLaundryOrderItem> items = lambdaQuery()
                .select(AioveuLaundryOrderItem::getId, AioveuLaundryOrderItem::getTotalOrderItemDesc)
                .list();

        //在Java的Collectors.toMap方法中，如果值为null，就会抛出NullPointerException。
        // 因为toMap方法默认不允许值为null。要保证唯一且不为空
        // 2.转换为Map: key=ID, value=名称
        return items.stream()
                .collect(Collectors.toMap(
                        AioveuLaundryOrderItem::getId,
                        AioveuLaundryOrderItem::getTotalOrderItemDesc
                ));
    }

    /**
     * 获取选项列表（用于下拉选择框）
     *
     * @return 选项列表
     */
    @Override
    public List<AioveuLaundryOrderItemOption> getAllLaundryOrderItemOptions() {

        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuLaundryOrderItem> items = lambdaQuery()
                .select(AioveuLaundryOrderItem::getId, AioveuLaundryOrderItem::getTotalOrderItemDesc)
                .list();

        // 2.转换为选项对象
        List<AioveuLaundryOrderItemOption>  itemOptionVO  = items.stream()
                .map(item -> new AioveuLaundryOrderItemOption(item.getId(), item.getTotalOrderItemDesc()))
                .collect(Collectors.toList());

        return itemOptionVO;
    }


    /**
     * 批量查询订单明细
     */
    @Override
    public Map<Long, AioveuLaundryOrderItem> getOrderItemsByIds(Set<Long> orderDetailIds) {
        if (CollectionUtils.isEmpty(orderDetailIds)) {
            return Collections.emptyMap();
        }

        LambdaQueryWrapper<AioveuLaundryOrderItem> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(AioveuLaundryOrderItem::getId, orderDetailIds)
                .select(
                        AioveuLaundryOrderItem::getId,
                        AioveuLaundryOrderItem::getOrderId,
                        AioveuLaundryOrderItem::getClothingTypeId,
                        AioveuLaundryOrderItem::getProblemDesc,
                        AioveuLaundryOrderItem::getProcessStatus
                );

        List<AioveuLaundryOrderItem> items = this.list(wrapper);
        return items.stream()
                .collect(Collectors.toMap(AioveuLaundryOrderItem::getId, Function.identity()));
    }


    /**
     * 根据订单号查询订单所有衣物明细
     */
    @Override
    public List<AioveuLaundryOrderItem> getOrderItemByOrderNo(String orderNo) {

        LambdaQueryWrapper<AioveuLaundryOrder> orderWrapper = new LambdaQueryWrapper<>();
        orderWrapper.eq(AioveuLaundryOrder::getOrderNo, orderNo)
                .select(
                        AioveuLaundryOrder::getId,
                        AioveuLaundryOrder::getOrderNo,
                        AioveuLaundryOrder::getMemberId,
                        AioveuLaundryOrder::getCustomerPhone,
                        AioveuLaundryOrder::getStatus,

                        AioveuLaundryOrder::getTotalAmount,
                        AioveuLaundryOrder::getDiscountAmount,
                        AioveuLaundryOrder::getActualAmount,
                        AioveuLaundryOrder::getPaymentStatus,
                        AioveuLaundryOrder::getPaymentMethodId,
                        AioveuLaundryOrder::getRemark,
                        AioveuLaundryOrder::getCreateTime
                );

        AioveuLaundryOrder order = aioveuLaundryOrderService.getOne(orderWrapper);

        Long orderId = order.getId();

        LambdaQueryWrapper<AioveuLaundryOrderItem> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(AioveuLaundryOrderItem::getOrderId, orderId)
                // 指定只选择 orderNo 字段，而不是所有字段
                // 这是一个性能优化，减少不必要的数据传输
                .select(
                        AioveuLaundryOrderItem::getId,
                        AioveuLaundryOrderItem::getOrderId,
                        AioveuLaundryOrderItem::getCustomType,
                        AioveuLaundryOrderItem::getPrice,
                        AioveuLaundryOrderItem::getSpecialInstruction
                );

        List<AioveuLaundryOrderItem>  orderItems = this.list(wrapper);

        return orderItems;


    }
}
