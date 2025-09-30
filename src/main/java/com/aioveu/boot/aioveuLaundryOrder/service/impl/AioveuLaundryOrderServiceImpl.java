package com.aioveu.boot.aioveuLaundryOrder.service.impl;

import lombok.RequiredArgsConstructor;
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
@Service
@RequiredArgsConstructor
public class AioveuLaundryOrderServiceImpl extends ServiceImpl<AioveuLaundryOrderMapper, AioveuLaundryOrder> implements AioveuLaundryOrderService {

    private final AioveuLaundryOrderConverter aioveuLaundryOrderConverter;

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
