package com.aioveu.boot.aioveuCommon.util.NumberGenerator;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;


import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model.GarmentCodeResult;
import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.service.AioveuQRCodeService;
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

    // 声明并初始化 SEQUENCE_MAP  // 存储每日序列号的映射（日期+类型 -> 序列号）
    private static final ConcurrentHashMap<String, AtomicInteger> SEQUENCE_MAP = new ConcurrentHashMap<>();

    @Autowired
    private AioveuQRCodeService aioveuQRCodeService;

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
        return "可我不敌可爱" + dateStr + String.format("%04d", seq);
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
        return "紫罗兰" + dateStr + String.format("%04d", seq);
    }

    /**
     * 生成洗衣衣物类型（时间戳+序列号）
     * 格式：CT + 3位序列号
     * 示例：CT001
     */
    public String generateLaundryClothingTypeCode() {
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
        return "CT"  + String.format("%03d", seq);
    }

    /**
     * 生成洗衣订单号（时间戳+序列号）
     * 格式：LC + yyyyMMdd + 6位序列号
     * 示例：LC20251003000001
     */
    public String generateLaundryClothingOrderNo() {
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
        return "LC"  + dateStr + String.format("%04d", seq);
    }

    /**
     * 生成会员卡号（时间戳+序列号）
     * 格式：LC + yyyy + 4位序列号
     * 示例：M20250001
     */
    public String generateMemberNo() {
        // 获取当前日期字符串
        String dateStr = new SimpleDateFormat("yyyy").format(new Date());
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
        return "M"  + dateStr + String.format("%04d", seq);
    }

    /**
     * 生成衣物唯一二维码编码
     * 格式：GAR-[衣物类型代码]-[日期]-[序列号]-[随机后缀]
     * 示例：GAR-SHIRT-20251003-0001-5A3B
     *
     * 说明：
     * - GAR: 固定前缀，表示Garment
     * - 衣物类型代码: 3-5个字母的衣物类型缩写
     * - 日期: yyyyMMdd格式
     * - 序列号: 4位数字，每日重置
     * - 随机后缀: 4位16进制数，确保唯一性
     * @return 包含编码和二维码URL的对象
     * 总长度: 3 + 1 + 3-5 + 1 + 8 + 1 + 4 + 1 + 4 = 25-27字符
     */
    public GarmentCodeResult generateGarmentQRCode() {

//        // 验证衣物类型代码
//        if (garmentTypeCode == null || garmentTypeCode.length() < 3 || garmentTypeCode.length() > 5) {
//            throw new IllegalArgumentException("衣物类型代码必须是3-5个字母");
//        }

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

        // 生成4位随机后缀（16进制）
        String randomSuffix = generateRandomSuffix();

        // 格式化编码
        String garmentCode = String.format("GAR-%s-%04d-%s",dateStr, seq, randomSuffix);

        // 生成二维码并上传到MinIO
        String qrCodeUrl = aioveuQRCodeService.generateAndUploadQRCode(garmentCode, 300);

        // 格式化编码
        return new GarmentCodeResult(garmentCode, qrCodeUrl);
    }




    /**
     * 生成4位随机后缀（16进制）
     */
    private String generateRandomSuffix() {
        // 使用UUID生成随机部分
        UUID uuid = UUID.randomUUID();
        long mostSigBits = uuid.getMostSignificantBits();

        // 取最后16位（4个16进制字符）
        return String.format("%04X", mostSigBits & 0xFFFF);
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

    /**
     * 生成生成打印任务ID（时间戳+序列号）
     * 格式：PRINT-[日期]-[序列号]-[随机后缀]
     * 示例：PRINT-20251003-0001-5A3B
     */
    public String generatePrintId() {
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
        return "PRINT"  + dateStr + String.format("%04d", seq);
    }

}



