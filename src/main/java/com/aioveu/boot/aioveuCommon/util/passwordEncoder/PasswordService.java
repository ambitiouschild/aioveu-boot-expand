package com.aioveu.boot.aioveuCommon.util.passwordEncoder;


import com.aioveu.boot.common.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;

/**
 * 密码服务  自定义密码编码器服务
 */
@Service
@Slf4j
public class PasswordService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    /**
     * 加密密码
     */
    public String encodePassword(String rawPassword) {
        if (rawPassword == null || rawPassword.trim().isEmpty()) {
            throw new IllegalArgumentException("密码不能为空");
        }

        try {
            String encodedPassword = passwordEncoder.encode(rawPassword);
            log.debug("密码加密成功: 原始长度={}, 加密后长度={}",
                    rawPassword.length(), encodedPassword.length());
            return encodedPassword;
        } catch (Exception e) {
            log.error("密码加密失败", e);
            throw new BusinessException("密码加密失败");
        }
    }

    /**
     * 验证密码
     */
    public boolean matches(String rawPassword, String encodedPassword) {
        if (rawPassword == null || encodedPassword == null) {
            return false;
        }

        try {
            boolean matches = passwordEncoder.matches(rawPassword, encodedPassword);
            log.debug("密码验证结果: matches={}", matches);
            return matches;
        } catch (Exception e) {
            log.error("密码验证异常", e);
            return false;
        }
    }

    /**
     * 生成随机密码
     */
    public String generateRandomPassword(int length) {
        if (length < 8) {
            length = 8; // 最小长度8位
        }
        if (length > 32) {
            length = 32; // 最大长度32位
        }

        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*";
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder(length);

        // 确保包含至少一个大写字母、小写字母、数字和特殊字符
        password.append((char) ('A' + random.nextInt(26))); // 大写字母
        password.append((char) ('a' + random.nextInt(26))); // 小写字母
        password.append((char) ('0' + random.nextInt(10))); // 数字
        password.append("!@#$%^&*".charAt(random.nextInt(8))); // 特殊字符

        // 生成剩余字符
        for (int i = 4; i < length; i++) {
            password.append(characters.charAt(random.nextInt(characters.length())));
        }

        // 打乱顺序
        String shuffledPassword = shuffleString(password.toString(), random);

        log.debug("生成随机密码: length={}", length);
        return shuffledPassword;
    }

    /**
     * 生成安全的初始密码
     */
    public String generateSecureInitialPassword() {
        // 生成12位随机密码
        String randomPassword = generateRandomPassword(12);

        // 对密码进行二次加密（可选）
        String encodedPassword = encodePassword(randomPassword);

        log.info("生成安全初始密码");
        return randomPassword; // 返回明文密码用于发送给用户
    }

    /**
     * 检查密码强度
     */
    public PasswordStrength checkPasswordStrength(String password) {
        if (password == null || password.length() < 8) {
            return PasswordStrength.WEAK;
        }

        int score = 0;

        // 长度评分
        if (password.length() >= 12) score += 2;
        else if (password.length() >= 8) score += 1;

        // 包含大写字母
        if (password.matches(".*[A-Z].*")) score += 1;

        // 包含小写字母
        if (password.matches(".*[a-z].*")) score += 1;

        // 包含数字
        if (password.matches(".*\\d.*")) score += 1;

        // 包含特殊字符
        if (password.matches(".*[!@#$%^&*].*")) score += 1;

        // 无连续字符
        if (!hasConsecutiveChars(password)) score += 1;

        // 无常见模式
        if (!isCommonPattern(password)) score += 1;

        if (score >= 6) return PasswordStrength.STRONG;
        if (score >= 4) return PasswordStrength.MEDIUM;
        return PasswordStrength.WEAK;
    }

    /**
     * 密码升级检查（如果使用旧算法，需要重新加密）
     */
    public boolean needsUpgrade(String encodedPassword) {
        if (encodedPassword == null) {
            return true;
        }

        // 检查是否使用弱算法（MD5、SHA等）
        if (encodedPassword.startsWith("{md5}") ||
                encodedPassword.startsWith("{sha256}") ||
                encodedPassword.length() < 20) { // 简单判断
            return true;
        }

        return false;
    }

    /**
     * 升级密码（从旧算法迁移到新算法）
     */
    public String upgradePassword(String rawPassword, String oldEncodedPassword) {
        if (needsUpgrade(oldEncodedPassword)) {
            String newEncodedPassword = encodePassword(rawPassword);
            log.info("密码算法升级完成");
            return newEncodedPassword;
        }
        return oldEncodedPassword;
    }

    // ================ 私有方法 ================

    /**
     * 打乱字符串顺序
     */
    private String shuffleString(String input, SecureRandom random) {
        char[] characters = input.toCharArray();
        for (int i = characters.length - 1; i > 0; i--) {
            int index = random.nextInt(i + 1);
            char temp = characters[index];
            characters[index] = characters[i];
            characters[i] = temp;
        }
        return new String(characters);
    }

    /**
     * 检查是否有连续字符
     */
    private boolean hasConsecutiveChars(String password) {
        for (int i = 0; i < password.length() - 2; i++) {
            char c1 = password.charAt(i);
            char c2 = password.charAt(i + 1);
            char c3 = password.charAt(i + 2);

            if (c1 + 1 == c2 && c2 + 1 == c3) {
                return true; // 如abc, 123等
            }
        }
        return false;
    }

    /**
     * 检查是否是常见模式
     */
    private boolean isCommonPattern(String password) {
        String[] commonPatterns = {
                "123456", "password", "admin", "qwerty", "111111",
                "12345678", "123456789", "123123", "000000"
        };

        String lowerPassword = password.toLowerCase();
        for (String pattern : commonPatterns) {
            if (lowerPassword.contains(pattern)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 密码强度枚举
     */
    public enum PasswordStrength {
        WEAK, MEDIUM, STRONG
    }
}
