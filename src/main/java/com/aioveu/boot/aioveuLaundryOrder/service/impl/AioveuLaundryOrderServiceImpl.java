package com.aioveu.boot.aioveuLaundryOrder.service.impl;

import com.aioveu.boot.aioveuCommon.util.AioveuNameSetter.AioveuNameSetter;
import com.aioveu.boot.aioveuCommon.util.NumberGenerator.NoGenerator;
import com.aioveu.boot.aioveuDepartment.model.entity.AioveuDepartment;
import com.aioveu.boot.aioveuLaundryOrder.model.vo.AioveuLaundryOrderOptionVO;
import com.aioveu.boot.aioveuMember.service.AioveuMemberService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuLaundryOrder.mapper.AioveuLaundryOrderMapper;
import com.aioveu.boot.aioveuLaundryOrder.service.AioveuLaundryOrderService;
import com.aioveu.boot.aioveuLaundryOrder.model.entity.AioveuLaundryOrder;
import com.aioveu.boot.aioveuLaundryOrder.model.form.AioveuLaundryOrderForm;
import com.aioveu.boot.aioveuLaundryOrder.model.query.AioveuLaundryOrderQuery;
import com.aioveu.boot.aioveuLaundryOrder.model.vo.AioveuLaundryOrderVO;
import com.aioveu.boot.aioveuLaundryOrder.converter.AioveuLaundryOrderConverter;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import org.springframework.util.CollectionUtils;

/**
 * 洗衣订单服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:43
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AioveuLaundryOrderServiceImpl extends ServiceImpl<AioveuLaundryOrderMapper, AioveuLaundryOrder> implements AioveuLaundryOrderService {

    private final AioveuLaundryOrderConverter aioveuLaundryOrderConverter;

    @Autowired
    private AioveuMemberService aioveuMemberService;

    // 通过依赖注入获取NoGenerator
    @Autowired
    private NoGenerator noGenerator;

    /**
    * 获取洗衣订单分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuLaundryOrderVO>} 洗衣订单分页列表
    */
    @Override
    public IPage<AioveuLaundryOrderVO> getAioveuLaundryOrderPage(AioveuLaundryOrderQuery queryParams) {
        Page<AioveuLaundryOrderVO> pageVO = this.baseMapper.getAioveuLaundryOrderPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );

        AioveuNameSetter.setNamesByMaps(
                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
                AioveuLaundryOrderVO::getMemberId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
                aioveuMemberService::getMemberNoMap,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
                AioveuLaundryOrderVO::setMemberNo             // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
        );

//        AioveuNameSetter.setNamesByMaps(
//                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
//                AioveuLaundryOrderVO::getMemberId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
//                aioveuMemberService::getMemberNameMap,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
//                AioveuLaundryOrderVO::setCustomerName             // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
//        );

//        AioveuNameSetter.setNamesByMaps(
//                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
//                AioveuLaundryOrderVO::getMemberId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
//                aioveuMemberService::getMemberPhoneMap,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
//                AioveuLaundryOrderVO::setCustomerPhone            // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
//        );

        return pageVO;
    }
    
    /**
     * 获取洗衣订单表单数据
     *
     * @param id 洗衣订单ID
     * @return 洗衣订单表单数据
     */
    @Override
    public AioveuLaundryOrderForm getAioveuLaundryOrderFormData(Long id) {
        AioveuLaundryOrder entity = this.getById(id);
        return aioveuLaundryOrderConverter.toForm(entity);
    }
    
    /**
     * 新增洗衣订单
     *
     * @param formData 洗衣订单表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuLaundryOrder(AioveuLaundryOrderForm formData) {

        // 1.如果单号为空，则生成
        if (StrUtil.isBlank(formData.getOrderNo())) {

            String newOrderNo = noGenerator.generateLaundryClothingOrderNo();//单号生成器方法保持一致
            formData.setOrderNo(newOrderNo);
            log.info("生成的newOrderNo: " +  newOrderNo);
        }

        //  2.无论单号是生成的还是用户提供的，都要检查是否重复。
        LambdaQueryWrapper<AioveuLaundryOrder> wrapper = new LambdaQueryWrapper<>();
        // 正确调用：传递 formData 参数
        wrapper.eq(AioveuLaundryOrder::getOrderNo, formData.getOrderNo());

        //3.如果重复，则重新生成（如果是用户提供的，可能需要提示用户，但根据业务逻辑，这里选择重新生成）。
        while (this.count(wrapper) > 0) {
            // 重新生成单号
            String againOrderNo = noGenerator.generateLaundryClothingOrderNo();//单号生成器方法保持一致
            formData.setOrderNo(againOrderNo);
            log.info("生成的againOrderNo: " +  againOrderNo);

            //4.重新生成后，再次检查，直到不重复为止（或者设置最大重试次数）。
            // 更新查询条件，检查新生成的单号
            wrapper.clear();
            wrapper.eq(AioveuLaundryOrder::getOrderNo, formData.getOrderNo());
        }

        AioveuLaundryOrder entity = aioveuLaundryOrderConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新洗衣订单
     *
     * @param id   洗衣订单ID
     * @param formData 洗衣订单表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuLaundryOrder(Long id,AioveuLaundryOrderForm formData) {
        AioveuLaundryOrder entity = aioveuLaundryOrderConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除洗衣订单
     *
     * @param ids 洗衣订单ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuLaundryOrders(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的洗衣订单数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

    /**
     * 获取选项列表（用于下拉选择框）
     *
     * @return 选项列表
     */
    @Override
    public List<AioveuLaundryOrderOptionVO> getAllLaundryOrderOptions() {

        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuLaundryOrder> laundryOrders = lambdaQuery()
                .select(AioveuLaundryOrder::getId, AioveuLaundryOrder::getOrderNo)
                .list();

        // 2.转换为选项对象
        List<AioveuLaundryOrderOptionVO>  laundryOrderOptionVO  = laundryOrders.stream()
                .map(laundryOrder -> new AioveuLaundryOrderOptionVO(laundryOrder.getId(), laundryOrder.getOrderNo()))
                .collect(Collectors.toList());

        return laundryOrderOptionVO;
    }

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter  无参数
     */
    @Override
    public Map<Long, String> getLaundryOrderNoMap() {


        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuLaundryOrder> laundryOrders = lambdaQuery()
                .select(AioveuLaundryOrder::getId, AioveuLaundryOrder::getOrderNo)
                .list();

        // 2.转换为Map: key=ID, value=名称
        return laundryOrders.stream()
                .collect(Collectors.toMap(
                        AioveuLaundryOrder::getId,
                        AioveuLaundryOrder::getOrderNo
                ));
    }


    /**
     * 批量查询订单信息
     */
    @Override
    public Map<Long, AioveuLaundryOrder> getOrdersByIds(Set<Long> orderIds) {
        if (CollectionUtils.isEmpty(orderIds)) {
            return Collections.emptyMap();
        }

        LambdaQueryWrapper<AioveuLaundryOrder> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(AioveuLaundryOrder::getId, orderIds)
                .select(
                        AioveuLaundryOrder::getId,
                        AioveuLaundryOrder::getOrderNo,
                        AioveuLaundryOrder::getMemberId,
                        AioveuLaundryOrder::getStatus,
                        AioveuLaundryOrder::getCustomerPhone,
                        AioveuLaundryOrder::getRemark,
                        AioveuLaundryOrder::getCreateTime
                );

        List<AioveuLaundryOrder> orders = this.list(wrapper);
        return orders.stream()
                .collect(Collectors.toMap(AioveuLaundryOrder::getId, Function.identity()));
    }


    /**
     * 根据订单id查询订单信息
     */
    @Override
    public AioveuLaundryOrder getOrderByOrderNo(String orderNo) {

        LambdaQueryWrapper<AioveuLaundryOrder> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(AioveuLaundryOrder::getOrderNo, orderNo)
                // 指定只选择 orderNo 字段，而不是所有字段
                // 这是一个性能优化，减少不必要的数据传输
                .select(
                        AioveuLaundryOrder::getId,
                        AioveuLaundryOrder::getOrderNo,
                        AioveuLaundryOrder::getMemberId,
                        AioveuLaundryOrder::getCustomerName,
                        AioveuLaundryOrder::getCustomerPhone,
                        AioveuLaundryOrder::getStatus,
                        AioveuLaundryOrder::getTotalAmount,
                        AioveuLaundryOrder::getDiscountAmount,
                        AioveuLaundryOrder::getActualAmount,
                        AioveuLaundryOrder::getPaymentStatus,
                        AioveuLaundryOrder::getPaymentMethodId,
                        AioveuLaundryOrder::getCreateTime,
                        AioveuLaundryOrder::getRemark
                );

        AioveuLaundryOrder order = this.getOne(wrapper);

        return order;

    }
}
