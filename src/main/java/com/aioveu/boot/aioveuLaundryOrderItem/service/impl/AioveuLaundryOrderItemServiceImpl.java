package com.aioveu.boot.aioveuLaundryOrderItem.service.impl;

import lombok.RequiredArgsConstructor;
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

}
