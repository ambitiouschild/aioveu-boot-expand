package com.aioveu.boot.aioveuLaundryOrder.service.impl;

import com.aioveu.boot.aioveuCommon.util.AioveuNameSetter.AioveuNameSetter;
import com.aioveu.boot.aioveuCommon.util.NumberGenerator.NoGenerator;
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

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

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

        // 如果充值单号为空，则生成
        if (StrUtil.isBlank(formData.getOrderNo())) {

            String newNo = noGenerator.generateAddRechargeNo();//单号生成器方法保持一致
            formData.setOrderNo(newNo);
            log.info("生成的newNo: " +  newNo);
        }

        // 字段1：检查编号是否唯一（对于不依赖外键的字段，不可重复）
        LambdaQueryWrapper<AioveuLaundryOrder> wrapper = new LambdaQueryWrapper<>();
        // 正确调用：传递 formData 参数
        wrapper.eq(AioveuLaundryOrder::getOrderNo, formData.getOrderNo());

        if (this.count(wrapper) > 0) {
            // 重新生成单号
            String againNo = noGenerator.generateAddRechargeNo();//单号生成器方法保持一致
            formData.setOrderNo(againNo);
            log.info("生成的againNo: " +  againNo);
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

}
