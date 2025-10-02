package com.aioveu.boot.aioveuCommon.util.NameMappingService;

import java.util.List;
import java.util.Map;

/**
 * 通用ID-名称映射服务接口  这种设计使得名称映射功能可以在系统的任何地方复用，同时保持了代码的简洁性和一致性。
 */
public interface NameMappingService<T, ID> {

    /**
     * 根据ID列表获取名称映射
     *
     * @param ids ID列表
     * @return ID到名称的映射
     */
    Map<ID, String> getNameMapByIds(List<ID> ids);

    /**
     * 获取实体类型（用于日志和错误处理）
     */
    Class<T> getEntityType();

    /**
     * 获取ID字段名（用于查询）
     */
    String getIdFieldName();

    /**
     * 获取名称字段名（用于查询）
     */
    String getNameFieldName();
}
