package com.aioveu.boot.aioveuCommon.util.AioveuEntityUniqueValidator;


/*
 * @Description: TODO 通用实体唯一性验证工具类
 * @ClassName:  AioveuEntityUniqueValidator
 * @Author: 可我不敌可爱
 * @Email: ambitiouschild@qq.com
 * @Date:  2025/10/6  15:59
 * @LastEditors: 可我不敌可爱
 * @LastEditTime: 2025/10/6  15:59
 */

import cn.idev.excel.util.StringUtils;
import com.aioveu.boot.common.base.BaseEntity;
import com.aioveu.boot.common.exception.BusinessException;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.service.IService;
import com.google.common.base.Function;

public class AioveuEntityUniqueValidator {

    /**
     * 验证实体字段的唯一性（支持多种数据类型）
     *
     * @param <T> 表单数据类型
     * @param <E> 实体类型
     * @param <F> 字段值类型
     * @param formData 表单数据对象
     * @param fieldValueGetter 获取字段值的函数
     * @param entityFieldGetter 实体字段的getter方法
     * @param entityService 实体服务
     * @param entityName 实体名称（用于错误消息）
     * @param fieldName 字段名称（用于错误消息）
     *  validateUnique(
     *         formData,
     *         fieldValueGetter,
     *         entityFieldGetter,
     *         null, // 不需要ID
     *         null, // 不需要实体ID字段
     *         entityService,
     *         entityName,
     *         fieldName
     *     );
     */

    // 重载方法：用于更新操作（需要排除自身）
    public static <T, E, F> void validateUniqueForCreate(
            T formData,
            Function<T, F> fieldValueGetter,
            SFunction<E, F> entityFieldGetter,
            IService<E> entityService,
            String entityName,
            String fieldName) {

        F fieldValue = fieldValueGetter.apply(formData);
        if (fieldValue == null || (fieldValue instanceof String && StringUtils.isEmpty((String) fieldValue))) {
            return; // 空值不验证
        }

        LambdaQueryWrapper<E> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(entityFieldGetter, fieldValue);


        if (entityService.count(wrapper) > 0) {
            throw new BusinessException(String.format("%s的%s[%s]已存在", entityName, fieldName, fieldValue));
        }
    }











    /**
     * 验证实体字段的唯一性（支持多种数据类型）
     *
     * @param <T> 表单数据类型
     * @param <E> 实体类型
     * @param <F> 字段值类型
     * @param formData 表单数据对象
     * @param fieldValueGetter 获取字段值的函数
     * @param entityFieldGetter 实体字段的getter方法
     * @param idGetter 获取ID的函数（用于更新操作时排除自身）
     * @param entityIdGetter 实体ID字段的getter方法
     * @param entityService 实体服务
     * @param entityName 实体名称（用于错误消息）
     * @param fieldName 字段名称（用于错误消息）
     *
     * validateUnique(
     *         formData,
     *         fieldValueGetter,
     *         entityFieldGetter,
     *         idGetter,
     *         entityIdGetter,
     *         entityService,
     *         entityName,
     *         fieldName
     *     );
     */
    // 重载方法：用于更新操作（需要排除自身）
    public static <T, E, F> void validateUniqueForUpdate(
            T formData,
            Function<T, F> fieldValueGetter,
            SFunction<E, F> entityFieldGetter,
            Function<T, Long> idGetter,
            SFunction<E, Long> entityIdGetter, // 新增参数：实体ID字段的getter
            IService<E> entityService,
            String entityName,
            String fieldName) {

        F fieldValue = fieldValueGetter.apply(formData);
        if (fieldValue == null || (fieldValue instanceof String && StringUtils.isEmpty((String) fieldValue))) {
            return; // 空值不验证
        }

        LambdaQueryWrapper<E> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(entityFieldGetter, fieldValue);

        // 处理更新操作（排除自身）
        if (idGetter != null) {
            Long id = idGetter.apply(formData);
            if (id != null) {
//                wrapper.ne(BaseEntity::getId, id); // 假设所有实体都有id字段
                //"Non-static method cannot be referenced from a static context" 表明你试图在静态方法中引用一个非静态方法。

                // 使用传入的entityIdGetter来指定ID字段
                wrapper.ne(entityIdGetter, id);
            }
        }

        if (entityService.count(wrapper) > 0) {
            throw new BusinessException(String.format("%s的%s[%s]已存在", entityName, fieldName, fieldValue));
        }
    }

}
