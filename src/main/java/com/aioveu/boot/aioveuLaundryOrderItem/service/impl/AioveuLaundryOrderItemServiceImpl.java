package com.aioveu.boot.aioveuLaundryOrderItem.service.impl;

import com.aioveu.boot.aioveuCommon.util.AioveuEntityUniqueValidator.AioveuEntityUniqueValidator;
import com.aioveu.boot.aioveuCommon.util.AioveuNameSetter.AioveuNameSetter;
import com.aioveu.boot.aioveuLaundryClothingType.service.AioveuLaundryClothingTypeService;
import com.aioveu.boot.aioveuLaundryOrder.service.AioveuLaundryOrderService;
import com.aioveu.boot.aioveuLaundryOrderItem.model.vo.AioveuLaundryOrderItemOption;
import com.aioveu.boot.aioveuMemberAccount.model.entity.AioveuMemberAccount;
import lombok.RequiredArgsConstructor;
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

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 洗衣订单衣物明细服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:55
 */
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
        Page<AioveuLaundryOrderItemVO> pageVO = this.baseMapper.getAioveuLaundryOrderItemPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
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

        // 字段1：检查编号是否唯一（对于不依赖外键的字段，不可重复）
        AioveuEntityUniqueValidator.validateUniqueForCreate(
                formData,
                AioveuLaundryOrderItemForm::getOrderId, // 获取账户号
                AioveuLaundryOrderItem::getOrderId,    // 实体字段
                this,
                "洗衣订单衣物明细",
                "订单号"
        );

        AioveuLaundryOrderItem entity = aioveuLaundryOrderItemConverter.toEntity(formData);
        return this.save(entity);
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
                .select(AioveuLaundryOrderItem::getId, AioveuLaundryOrderItem::getProblemDesc)
                .list();

        // 2.转换为Map: key=ID, value=名称
        return items.stream()
                .collect(Collectors.toMap(
                        AioveuLaundryOrderItem::getId,
                        AioveuLaundryOrderItem::getProblemDesc
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
                .select(AioveuLaundryOrderItem::getId, AioveuLaundryOrderItem::getProblemDesc)
                .list();

        // 2.转换为选项对象
        List<AioveuLaundryOrderItemOption>  itemOptionVO  = items.stream()
                .map(item -> new AioveuLaundryOrderItemOption(item.getId(), item.getProblemDesc()))
                .collect(Collectors.toList());

        return itemOptionVO;
    }

}
