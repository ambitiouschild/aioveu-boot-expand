package com.aioveu.boot.JuhaochePermissionsConfig.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.JuhaochePermissionsConfig.mapper.JuhaochePermissionsConfigMapper;
import com.aioveu.boot.JuhaochePermissionsConfig.service.JuhaochePermissionsConfigService;
import com.aioveu.boot.JuhaochePermissionsConfig.model.entity.JuhaochePermissionsConfig;
import com.aioveu.boot.JuhaochePermissionsConfig.model.form.JuhaochePermissionsConfigForm;
import com.aioveu.boot.JuhaochePermissionsConfig.model.query.JuhaochePermissionsConfigQuery;
import com.aioveu.boot.JuhaochePermissionsConfig.model.vo.JuhaochePermissionsConfigVO;
import com.aioveu.boot.JuhaochePermissionsConfig.converter.JuhaochePermissionsConfigConverter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import org.springframework.util.StringUtils;

/**
 * 权限配置服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:51
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class JuhaochePermissionsConfigServiceImpl extends ServiceImpl<JuhaochePermissionsConfigMapper, JuhaochePermissionsConfig> implements JuhaochePermissionsConfigService {

    private final JuhaochePermissionsConfigConverter juhaochePermissionsConfigConverter;


    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    // 内存缓存
    private final Map<String, JuhaochePermissionsConfig> permissionConfigCache = new ConcurrentHashMap<>();
    private final Map<String, List<JuhaochePermissionsConfig>> apiPathCache = new ConcurrentHashMap<>();

    // 缓存键前缀
    private static final String PERMISSION_CONFIG_CACHE_PREFIX = "permission:config:";
    private static final String API_PATH_CACHE_PREFIX = "permission:api:";
    private static final String ALL_CONFIGS_CACHE_KEY = "permission:configs:all";
    private static final long CACHE_EXPIRE_HOURS = 24;

    /**
    * 获取权限配置分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<JuhaochePermissionsConfigVO>} 权限配置分页列表
    */
    @Override
    public IPage<JuhaochePermissionsConfigVO> getJuhaochePermissionsConfigPage(JuhaochePermissionsConfigQuery queryParams) {
        Page<JuhaochePermissionsConfigVO> pageVO = this.baseMapper.getJuhaochePermissionsConfigPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取权限配置表单数据
     *
     * @param id 权限配置ID
     * @return 权限配置表单数据
     */
    @Override
    public JuhaochePermissionsConfigForm getJuhaochePermissionsConfigFormData(Long id) {
        JuhaochePermissionsConfig entity = this.getById(id);
        return juhaochePermissionsConfigConverter.toForm(entity);
    }
    
    /**
     * 新增权限配置
     *
     * @param formData 权限配置表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveJuhaochePermissionsConfig(JuhaochePermissionsConfigForm formData) {
        JuhaochePermissionsConfig entity = juhaochePermissionsConfigConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新权限配置
     *
     * @param id   权限配置ID
     * @param formData 权限配置表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateJuhaochePermissionsConfig(Long id,JuhaochePermissionsConfigForm formData) {
        JuhaochePermissionsConfig entity = juhaochePermissionsConfigConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除权限配置
     *
     * @param ids 权限配置ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteJuhaochePermissionsConfigs(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的权限配置数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }


    /**
     * 根据API路径和HTTP方法获取权限配置
     */
    @Override
    public JuhaochePermissionsConfig getByApiPath(String apiPath, String httpMethod) {
        if (!StringUtils.hasText(apiPath) || !StringUtils.hasText(httpMethod)) {
            log.warn("API路径或HTTP方法为空: apiPath={}, httpMethod={}", apiPath, httpMethod);
            return null;
        }

        try {
            // 规范化路径和方法
            String normalizedPath = normalizeApiPath(apiPath);
            String normalizedMethod = normalizeHttpMethod(httpMethod);
            String cacheKey = buildCacheKey(normalizedPath, normalizedMethod);

            // 1. 尝试从内存缓存获取
            JuhaochePermissionsConfig cachedConfig = permissionConfigCache.get(cacheKey);
            if (cachedConfig != null) {
                return cachedConfig;
            }

            // 2. 尝试从Redis缓存获取
            cachedConfig = getFromRedisCache(cacheKey);
            if (cachedConfig != null) {
                // 放入内存缓存
                permissionConfigCache.put(cacheKey, cachedConfig);
                return cachedConfig;
            }

            // 3. 从数据库查询
            JuhaochePermissionsConfig config = getFromDatabase(normalizedPath, normalizedMethod);

            // 4. 缓存结果
            if (config != null) {
                cachePermissionConfig(cacheKey, config);
            } else {
                // 缓存空结果避免缓存穿透
                cacheNullResult(cacheKey);
            }

            return config;

        } catch (Exception e) {
            log.error("根据API路径获取权限配置异常: apiPath={}, httpMethod={}", apiPath, httpMethod, e);
            return null;
        }
    }

    // ================ 私有方法 ================

    /**
     * 从数据库查询权限配置
     */
    private JuhaochePermissionsConfig getFromDatabase(String apiPath, String httpMethod) {
        LambdaQueryWrapper<JuhaochePermissionsConfig> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(JuhaochePermissionsConfig::getApiPath, apiPath)
                .eq(JuhaochePermissionsConfig::getHttpMethod, httpMethod)
                .eq(JuhaochePermissionsConfig::getIsEnable, 1)
                .eq(JuhaochePermissionsConfig::getIsDel, 0);

        return getOne(queryWrapper);
    }

    /**
     * 从数据库查询同一API路径的所有配置
     */
    private List<JuhaochePermissionsConfig> getListFromDatabase(String apiPath) {
        LambdaQueryWrapper<JuhaochePermissionsConfig> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(JuhaochePermissionsConfig::getApiPath, apiPath)
                .eq(JuhaochePermissionsConfig::getIsEnable, 1)
                .eq(JuhaochePermissionsConfig::getIsDel, 0)
                .orderByAsc(JuhaochePermissionsConfig::getHttpMethod);

        return list(queryWrapper);
    }


    /**
     * 规范化API路径
     */
    private String normalizeApiPath(String apiPath) {
        if (apiPath == null) {
            return "";
        }

        // 移除首尾空格和斜杠
        String normalized = apiPath.trim();

        // 确保以斜杠开头
        if (!normalized.startsWith("/")) {
            normalized = "/" + normalized;
        }

        // 移除末尾斜杠（除非是根路径）
        if (normalized.length() > 1 && normalized.endsWith("/")) {
            normalized = normalized.substring(0, normalized.length() - 1);
        }

        return normalized;
    }

    /**
     * 规范化HTTP方法
     */
    private String normalizeHttpMethod(String httpMethod) {
        if (httpMethod == null) {
            return "GET";
        }

        return httpMethod.trim().toUpperCase();
    }

    /**
     * 构建缓存键
     */
    private String buildCacheKey(String apiPath, String httpMethod) {
        return PERMISSION_CONFIG_CACHE_PREFIX + apiPath + ":" + httpMethod;
    }

    /**
     * 从Redis获取单个配置
     */
    private JuhaochePermissionsConfig getFromRedisCache(String cacheKey) {
        try {
            Object cached = redisTemplate.opsForValue().get(cacheKey);
            if (cached instanceof JuhaochePermissionsConfig) {
                return (JuhaochePermissionsConfig) cached;
            }
            return null;
        } catch (Exception e) {
            log.warn("从Redis获取权限配置异常: key={}", cacheKey, e);
            return null;
        }
    }

    /**
     * 从Redis获取配置列表
     */
    private List<JuhaochePermissionsConfig> getListFromRedisCache(String cacheKey) {
        try {
            Object cached = redisTemplate.opsForValue().get(cacheKey);
            if (cached instanceof List) {
                @SuppressWarnings("unchecked")
                List<JuhaochePermissionsConfig> result = (List<JuhaochePermissionsConfig>) cached;
                return result;
            }
            return null;
        } catch (Exception e) {
            log.warn("从Redis获取权限配置列表异常: key={}", cacheKey, e);
            return null;
        }
    }

    /**
     * 缓存权限配置到Redis
     */
    private void cachePermissionConfig(String cacheKey, JuhaochePermissionsConfig config) {
        try {
            redisTemplate.opsForValue().set(cacheKey, config, CACHE_EXPIRE_HOURS, TimeUnit.HOURS);
            permissionConfigCache.put(cacheKey, config);
        } catch (Exception e) {
            log.warn("缓存权限配置到Redis异常: key={}", cacheKey, e);
        }
    }

    /**
     * 缓存API路径配置列表到Redis
     */
    private void cacheApiPathConfigs(String cacheKey, List<JuhaochePermissionsConfig> configs) {
        try {
            redisTemplate.opsForValue().set(cacheKey, configs, CACHE_EXPIRE_HOURS, TimeUnit.HOURS);
            apiPathCache.put(cacheKey, new ArrayList<>(configs));
        } catch (Exception e) {
            log.warn("缓存API路径配置列表到Redis异常: key={}", cacheKey, e);
        }
    }

    /**
     * 缓存空结果（防止缓存穿透）
     */
    private void cacheNullResult(String cacheKey) {
        try {
            // 缓存空对象，设置较短的过期时间
            redisTemplate.opsForValue().set(cacheKey, new JuhaochePermissionsConfig(), 5, TimeUnit.MINUTES);
            permissionConfigCache.put(cacheKey, new JuhaochePermissionsConfig());
        } catch (Exception e) {
            log.warn("缓存空结果异常: key={}", cacheKey, e);
        }
    }


    //=================================================================================

}
