package com.aioveu.boot.aioveuCommon.util.PhoneNumberUtils;

import org.springframework.util.StringUtils;

import java.util.regex.Pattern;
/**
 * 手机号清理工具类
 */
public class PhoneNumberUtils {

    // 中国大陆手机号正则表达式
    private static final Pattern CHINA_MOBILE_PATTERN = Pattern.compile("^1[3-9]\\d{9}$");

    // 国际手机号正则表达式（简化版，实际应根据业务需求调整）
    private static final Pattern INTERNATIONAL_PATTERN = Pattern.compile("^\\+?[1-9]\\d{1,14}$");

    /**
     * 清理手机号格式（基础版本）
     * @param phone 原始手机号
     * @return 清理后的手机号，如果格式不正确返回null
     */
    public static String cleanPhoneNumber(String phone) {
        if (!StringUtils.hasText(phone)) {
            return null;
        }

        // 移除所有非数字字符（除了+号）
        String cleaned = phone.replaceAll("[^0-9+]", "");

        // 处理国际号码（以+开头）
        if (cleaned.startsWith("+")) {
            return cleanInternationalNumber(cleaned);
        }

        // 处理中国大陆手机号
        return cleanChinaMobileNumber(cleaned);
    }

    /**
     * 清理中国大陆手机号
     */
    private static String cleanChinaMobileNumber(String phone) {
        // 移除+86、0086等国际前缀
        String cleaned = phone.replaceAll("^(\\+86|0086|86)", "");

        // 验证手机号长度和格式
        if (cleaned.length() != 11 || !cleaned.startsWith("1")) {
            return null;
        }

        // 验证具体的号段
        if (!CHINA_MOBILE_PATTERN.matcher(cleaned).matches()) {
            return null;
        }

        return cleaned;
    }

    /**
     * 清理国际手机号
     */
    private static String cleanInternationalNumber(String phone) {
        // 国际号码格式验证
        if (!INTERNATIONAL_PATTERN.matcher(phone).matches()) {
            return null;
        }

        // 国际号码长度验证（E.164标准：最大15位，包括国家代码）
        if (phone.length() < 3 || phone.length() > 15) {
            return null;
        }

        return phone;
    }

}
