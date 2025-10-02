package com.aioveu.boot.aioveuCommon.util.NameMappingService.impl;

import com.aioveu.boot.aioveuCommon.util.NameMappingService.NameMappingService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 通用ID-名称映射服务抽象基类
 */
public abstract class NameMappingServiceImpl<M extends BaseMapper<T>, T, ID>
        extends ServiceImpl<M, T> implements NameMappingService<T, ID> {

    @Override
    public Map<ID, String> getNameMapByIds(List<ID> ids) {
        if (ids == null || ids.isEmpty()) {
            return Map.of();
        }

        // 使用LambdaQueryWrapper安全查询
        LambdaQueryWrapper<T> wrapper = new LambdaQueryWrapper<>();
        wrapper.select(getIdSelector(), getNameSelector());
        wrapper.in(getIdSelector(), ids);

        List<T> entities = list(wrapper);

        return entities.stream()
                .collect(Collectors.toMap(
                        this::getIdValue,
                        this::getNameValue
                ));
    }

    /**
     * 获取ID选择器（由子类实现）
     */
    protected abstract SFunction<T, ?> getIdSelector();

    /**
     * 获取名称选择器（由子类实现）
     */
    protected abstract SFunction<T, ?> getNameSelector();

    /**
     * 从实体获取ID值（由子类实现）
     */
    protected abstract ID getIdValue(T entity);

    /**
     * 从实体获取名称值（由子类实现）
     */
    protected abstract String getNameValue(T entity);
}

//在其他实现类里调用
//要在其他服务实现类中调用 getNameMapByIds方法，您需要遵循以下步骤：
/*
*
* 1. 确保服务类实现了 NameMappingService接口
*
* 2. 在需要调用的类中注入服务
    // 注入会员等级服务
    @Autowired
    private NameMappingService<AioveuMemberLevel, Long> memberLevelMappingService;


    // 或者直接注入具体实现
    @Autowired
    private AioveuMemberLevelService memberLevelService;
*
* 3. 直接调用 getNameMapByIds 方法，无需在对应服务设置
*
*     // 1.需要查询的ID列表
    List<Long> ids = Arrays.asList(1L, 2L, 3L);

    // 2.调用映射服务获取名称映射
        Map<Long, String> nameMap = nameMappingService.getNameMapByIds(ids);

    //2. 或者直接通过具体服务调用
    Map<Long, String> nameMap = memberLevelService.getNameMapByIds(ids);

   // 3. 使用映射结果

* */
