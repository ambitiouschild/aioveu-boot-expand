package com.aioveu.boot.aioveuCommon.util.PhoneNumberUtils;


import lombok.Builder;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * 手机号清理工具类（增强版）
 */
@Slf4j
public class PhoneNumberCleaner {

    // 中国大陆运营商号段
    private static final String[] CHINA_MOBILE_PREFIXES = {
            "134", "135", "136", "137", "138", "139", "147", "148", "150", "151",
            "152", "157", "158", "159", "172", "178", "182", "183", "184", "187",
            "188", "195", "198"
    };

    private static final String[] CHINA_UNICOM_PREFIXES = {
            "130", "131", "132", "145", "146", "155", "156", "166", "167", "171",
            "175", "176", "185", "186", "196"
    };

    private static final String[] CHINA_TELECOM_PREFIXES = {
            "133", "149", "153", "173", "177", "180", "181", "189", "190", "191",
            "193", "199"
    };

    private static final String[] VIRTUAL_OPERATOR_PREFIXES = {
            "170", "171", "162", "165", "167", "170", "171"
    };

    // 正则表达式模式
    private static final Pattern CHINA_MOBILE_PATTERN = Pattern.compile("^1[3-9]\\d{9}$");
    private static final Pattern INTERNATIONAL_PATTERN = Pattern.compile("^\\+?[1-9]\\d{1,14}$");

    // 国家代码映射
    private static final Map<String, String> COUNTRY_CODES = new HashMap<>();
    static {
        COUNTRY_CODES.put("86", "CN");  // 中国
        COUNTRY_CODES.put("1", "US");   // 美国
        COUNTRY_CODES.put("44", "GB");  // 英国
        COUNTRY_CODES.put("81", "JP");  // 日本
        COUNTRY_CODES.put("82", "KR");  // 韩国
        COUNTRY_CODES.put("65", "SG");  // 新加坡
        COUNTRY_CODES.put("852", "HK"); // 香港
        COUNTRY_CODES.put("853", "MO"); // 澳门
        COUNTRY_CODES.put("886", "TW"); // 台湾
    }

    /**
     * 清理手机号格式（增强版）
     */
    public static CleanPhoneResult cleanPhoneNumber(String phone) {
        if (!StringUtils.hasText(phone)) {
            return CleanPhoneResult.error("手机号不能为空");
        }

        try {
            // 移除所有空白字符
            String cleaned = phone.replaceAll("\\s", "");

            if (cleaned.isEmpty()) {
                return CleanPhoneResult.error("手机号不能为空");
            }

            // 判断号码类型
            if (cleaned.startsWith("+")) {
                return cleanInternationalNumber(cleaned);
            } else if (cleaned.startsWith("0")) {
                return cleanNumberWithZeroPrefix(cleaned);
            } else {
                return cleanChinaMobileNumber(cleaned);
            }

        } catch (Exception e) {
            log.error("清理手机号异常: phone={}", phone, e);
            return CleanPhoneResult.error("手机号格式异常");
        }
    }

    /**
     * 清理中国大陆手机号
     */
    private static CleanPhoneResult cleanChinaMobileNumber(String phone) {
        String cleaned = phone;

        // 处理+86、0086等前缀
        if (cleaned.startsWith("+86")) {
            cleaned = cleaned.substring(3);
        } else if (cleaned.startsWith("0086")) {
            cleaned = cleaned.substring(4);
        } else if (cleaned.startsWith("86")) {
            cleaned = cleaned.substring(2);
        }

        // 验证长度
        if (cleaned.length() != 11) {
            return CleanPhoneResult.error("手机号长度不正确");
        }

        // 验证格式
        if (!CHINA_MOBILE_PATTERN.matcher(cleaned).matches()) {
            return CleanPhoneResult.error("手机号格式不正确");
        }

        // 验证号段
        String prefix = cleaned.substring(0, 3);
        String operator = getChinaOperator(prefix);
        if (operator == null) {
            return CleanPhoneResult.error("手机号号段不存在");
        }

        return CleanPhoneResult.success(cleaned, "CN", operator, PhoneType.MOBILE);
    }

    /**
     * 清理国际手机号
     */
    private static CleanPhoneResult cleanInternationalNumber(String phone) {
        if (!INTERNATIONAL_PATTERN.matcher(phone).matches()) {
            return CleanPhoneResult.error("国际手机号格式不正确");
        }

        // 提取国家代码
        String countryCode = extractCountryCode(phone);
        if (countryCode == null) {
            return CleanPhoneResult.error("无法识别的国家代码");
        }

        String localNumber = phone.substring(countryCode.length() + 1); // 去掉+和国家代码

        return CleanPhoneResult.success(phone,
                COUNTRY_CODES.getOrDefault(countryCode, "UNKNOWN"),
                "国际运营商",
                PhoneType.INTERNATIONAL);
    }

    /**
     * 清理以0开头的号码（可能是国际号码或特殊号码）
     */
    private static CleanPhoneResult cleanNumberWithZeroPrefix(String phone) {
        // 处理0086开头的中国号码
        if (phone.startsWith("0086")) {
            String chinaNumber = phone.substring(4); // 去掉0086
            CleanPhoneResult result = cleanChinaMobileNumber(chinaNumber);
            if (result.isValid()) {
                return CleanPhoneResult.success(result.getCleanNumber(),
                        result.getCountryCode(),
                        result.getOperator(),
                        result.getPhoneType());
            }
        }

        // 处理其他以0开头的情况（可能是固定电话或其他）
        if (phone.length() >= 3) {
            String prefix = phone.substring(0, 3);
            if (prefix.equals("010") || prefix.equals("020") || prefix.equals("021") ||
                    prefix.equals("022") || prefix.equals("023") || prefix.equals("024") ||
                    prefix.equals("025") || prefix.equals("027") || prefix.equals("028") ||
                    prefix.equals("029")) {
                return CleanPhoneResult.success(phone, "CN", "固定电话", PhoneType.LANDLINE);
            }
        }

        return CleanPhoneResult.error("无法识别的号码格式");
    }

    /**
     * 获取中国大陆运营商
     */
    private static String getChinaOperator(String prefix) {
        if (contains(CHINA_MOBILE_PREFIXES, prefix)) {
            return "中国移动";
        } else if (contains(CHINA_UNICOM_PREFIXES, prefix)) {
            return "中国联通";
        } else if (contains(CHINA_TELECOM_PREFIXES, prefix)) {
            return "中国电信";
        } else if (contains(VIRTUAL_OPERATOR_PREFIXES, prefix)) {
            return "虚拟运营商";
        } else {
            return null;
        }
    }

    /**
     * 提取国家代码
     */
    private static String extractCountryCode(String phone) {
        // 去掉+号
        String number = phone.substring(1);

        // 尝试提取1-3位国家代码
        for (int i = 1; i <= 3; i++) {
            if (number.length() >= i) {
                String potentialCode = number.substring(0, i);
                if (COUNTRY_CODES.containsKey(potentialCode)) {
                    return potentialCode;
                }
            }
        }

        return null;
    }

    /**
     * 检查数组是否包含元素
     */
    private static boolean contains(String[] array, String value) {
        for (String item : array) {
            if (item.equals(value)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 批量清理手机号
     */
    public static Map<String, CleanPhoneResult> batchCleanPhoneNumbers(List<String> phones) {
        Map<String, CleanPhoneResult> results = new HashMap<>();
        for (String phone : phones) {
            results.put(phone, cleanPhoneNumber(phone));
        }
        return results;
    }

    /**
     * 验证手机号是否有效（简化版）
     */
    public static boolean isValidPhoneNumber(String phone) {
        CleanPhoneResult result = cleanPhoneNumber(phone);
        return result != null && result.isValid();
    }

    /**
     * 手机号类型枚举
     */
    public enum PhoneType {
        MOBILE,        // 手机
        LANDLINE,      // 固定电话
        INTERNATIONAL, // 国际号码
        SPECIAL,       // 特殊号码
        UNKNOWN        // 未知类型
    }

    /**
     * 清理结果类
     */
    @Data
    @Builder
    public static class CleanPhoneResult {
        private boolean valid;
        private String originalNumber;
        private String cleanNumber;
        private String countryCode;
        private String operator;
        private PhoneType phoneType;
        private String errorMessage;

        public static CleanPhoneResult success(String cleanNumber, String countryCode,
                                               String operator, PhoneType phoneType) {
            return CleanPhoneResult.builder()
                    .valid(true)
                    .cleanNumber(cleanNumber)
                    .countryCode(countryCode)
                    .operator(operator)
                    .phoneType(phoneType)
                    .build();
        }

        public static CleanPhoneResult error(String errorMessage) {
            return CleanPhoneResult.builder()
                    .valid(false)
                    .errorMessage(errorMessage)
                    .build();
        }
    }




}
