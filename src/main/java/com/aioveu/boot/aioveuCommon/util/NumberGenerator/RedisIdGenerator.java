package com.aioveu.boot.aioveuCommon.util.NumberGenerator;


import org.apache.poi.hpsf.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

/**
 * 基于Redis的分布式ID生成器
 * 适合需要顺序ID且对性能要求不高的场景
 */
@Component
public class RedisIdGenerator {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    /**
     * 生成带业务前缀的ID
     * 格式：业务前缀 + 时间戳 + 自增序列
     */
    public String generateBusinessId(String businessPrefix) {
        String dateStr = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String key = "id_generator:" + businessPrefix + ":" + dateStr;

        // 使用Redis原子操作获取自增序列
        Long sequence = redisTemplate.opsForValue().increment(key, 1);

        // 设置过期时间（1天）
        redisTemplate.expire(key, 1, TimeUnit.DAYS);

        // 格式化序列号（6位数字，不足补0）
        String sequenceStr = String.format("%06d", sequence);

        return businessPrefix + dateStr + sequenceStr;
    }

    /**
     * 生成订单ID
     */
    public String generateOrderId() {
        return generateBusinessId("ORD");
    }

    /**
     * 生成商户ID
     */
    public String generateMerchantId() {
        return generateBusinessId("MCH");
    }

    /**
     * 生成用户ID
     */
    public String generateUserId() {
        return generateBusinessId("USR");
    }
}
