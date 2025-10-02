package com.aioveu.boot;


import com.aioveu.boot.aioveuCommon.util.NumberGenerator.NoGenerator;
import com.google.gson.internal.LinkedTreeMap;
import lombok.extern.slf4j.Slf4j;
import org.checkerframework.checker.units.qual.K;
import org.junit.jupiter.api.Test;
import org.junit.platform.commons.logging.Logger;
import org.junit.platform.commons.logging.LoggerFactory;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;



@Slf4j
//只需要测试NoGenerator的生成逻辑，不需要启动整个Spring Boot应用。因此，我们可以使用普通的JUnit测试，而不使用@SpringBootTest。
//这里我们只是简单测试生成单号，所以可以直接创建一个NoGenerator实例
public class NoGeneratorTest2 {


    // 声明并初始化 SEQUENCE_MAP
    private static final Map<String, AtomicInteger> SEQUENCE_MAP = new ConcurrentHashMap<>();

//    private static final Logger log = LoggerFactory.getLogger(NoGeneratorTest.class);

    @Test
    public void testGenerateRechargeNo() {
        // 1. 创建实例
        NoGenerator noGenerator = new NoGenerator();

        // 2. 生成充值单号
        String newNo = noGenerator.generateRechargeNo();

        // 3. 记录日志
        log.info("生成的新RechargeNo： "+ newNo);

        // 4. 验证格式
        assert newNo.startsWith("可我不敌可爱") : "充值单号应以 可我不敌可爱 开头";
//        assert newNo.length() == 16 : "充值单号长度应为 16 位";
//        assert newNo.matches("TR\\d{14}") : "充值单号格式应为 TR + 8位日期 + 6位序列号";

        System.out.println("生成的充值单号: " + newNo);
    }

    @Test
    public void testGenerateAddRechargeNo() {
        // 1. 创建实例
        NoGenerator noGenerator = new NoGenerator();

        // 2. 生成充值单号
        String newNo = noGenerator.generateAddRechargeNo();

        // 3. 记录日志
        log.info("生成的新RechargeNo： "+ newNo);

        // 生成单号
        String no1 = noGenerator.generateAddRechargeNo();
        String no2 = noGenerator.generateAddRechargeNo();
        System.out.println("第一个单号: " + no1); // 紫罗兰20251003000001
        System.out.println("第二个单号: " + no2); // 紫罗兰20251003000002

        // 4. 验证格式
        assert newNo.startsWith("紫罗兰") : "新增充值记录单号应以 紫罗兰 开头";
//        assert newNo.length() == 16 : "充值单号长度应为 16 位";
//        assert newNo.matches("TR\\d{14}") : "充值单号格式应为 TR + 8位日期 + 6位序列号";

        System.out.println("新增充值记录单号: " + newNo);
    }





    @Test
    //添加测试重置功能
    public void testResetSequence() {
        // 1. 创建实例
        NoGenerator noGenerator = new NoGenerator();

        // 2. 生成一个单号
        String firstNo = noGenerator.generateRechargeNo();
        log.info("第一次生成的单号: {}", firstNo);

        // 3. 重置序列号
        noGenerator.resetSequence();

        // 4. 再次生成单号
        String secondNo = noGenerator.generateRechargeNo();
        log.info("重置后生成的单号: {}", secondNo);

        // 5. 验证重置效果
        assert secondNo.endsWith("000001") : "重置后序列号应从000001开始";
    }


    @Test
    //添加序列号溢出测试
    public void testSequenceOverflow() {
        // 1. 创建实例
        NoGenerator noGenerator = new NoGenerator();

        // 2. 模拟序列号溢出
        String dateStr = LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE);
        SEQUENCE_MAP.put(dateStr, new AtomicInteger(999999));

        // 3. 生成单号
        String overflowNo = noGenerator.generateRechargeNo();
        log.info("溢出后生成的单号: {}", overflowNo);

        // 4. 验证溢出处理
        assert overflowNo.endsWith("000001") : "溢出后序列号应重置为000001";
    }


}
