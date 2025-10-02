package com.aioveu.boot.aioveuCommon.util.NumberGenerator;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import static org.hibernate.validator.internal.util.Contracts.assertTrue;



/*
* No. 是法语词 numero （来源于拉丁语）的缩写，保留了其开头的 n 和结尾的 o ，
* 即法语中通常写作 no ，该词传入英语国家后，被广泛采用，并且有了多种写法，
* 像 №、Nº、No. 或 no. 等，喜欢用哪个，看心情或者习惯吧。
*
* */

@Component // 添加这个注解 确保NoGenerator类被声明为Spring Bean
public class NoGenerator {

    // 声明并初始化 SEQUENCE_MAP
    private static final Map<String, AtomicInteger> SEQUENCE_MAP = new ConcurrentHashMap<>();


        /**
     * 生成交易流水号
     */
    public String generateTransactionNo() {
        return "TR" + System.currentTimeMillis() + UUID.randomUUID().toString().replace("-", "").substring(0, 6);
    }

    /**
     * generateRechargeNo()是一个实例方法（非静态方法），因此必须通过类的实例来调用
     * 1.静态方法：
     * 属于类本身
     * 可以直接通过类名调用
     * 只能访问静态成员
     * 2.实例方法：
     * 属于类的实例
     * 必须通过实例调用
     * 可以访问静态成员和实例成员

     */

    /**
     * 生成充值单号（时间戳+序列号）
     * 格式：TR + yyyyMMdd + 6位序列号
     * 示例：TR20251003000001
     */
    public String generateRechargeNo() {
        // 获取当前日期字符串
        String dateStr = new SimpleDateFormat("yyyyMMdd").format(new Date());
        // 获取或创建序列号计数器
        AtomicInteger sequence = SEQUENCE_MAP.computeIfAbsent(dateStr, k -> new AtomicInteger(0));
        // 递增序列号
        int seq = sequence.incrementAndGet();
        // 处理溢出（超过999999）
        if (seq > 999999) {
            sequence.set(1);
            seq = 1;
        }
        // 正确格式化序列号
        return "可我不敌可爱" + dateStr + String.format("%06d", seq);
    }

    /**
     * 生成新增单号（时间戳+序列号）
     * 格式：TR + yyyyMMdd + 6位序列号
     * 示例：TR20251003000001
     */
    public String generateAddRechargeNo() {
        // 获取当前日期字符串
        String dateStr = new SimpleDateFormat("yyyyMMdd").format(new Date());
        // 获取或创建序列号计数器
        AtomicInteger sequence = SEQUENCE_MAP.computeIfAbsent(dateStr, k -> new AtomicInteger(0));
        // 递增序列号
        int seq = sequence.incrementAndGet();
        // 处理溢出（超过999999）
        if (seq > 999999) {
            sequence.set(1);
            seq = 1;
        }
        // 正确格式化序列号
        return "紫罗兰" + dateStr + String.format("%06d", seq);
    }

    /**
     * 每天凌晨0点重置序列号
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public void resetSequence() {
        // 获取今天的日期字符串
        String today = new SimpleDateFormat("yyyyMMdd").format(new Date());

        // 移除所有非今天的序列号
        SEQUENCE_MAP.keySet().removeIf(key -> !key.equals(today));

        // 初始化今天的序列号（如果不存在）
        SEQUENCE_MAP.putIfAbsent(today, new AtomicInteger(0));
    }
}



