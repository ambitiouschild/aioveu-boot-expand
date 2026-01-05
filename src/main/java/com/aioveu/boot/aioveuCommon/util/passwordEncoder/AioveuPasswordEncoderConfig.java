package com.aioveu.boot.aioveuCommon.util.passwordEncoder;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.DelegatingPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.Pbkdf2PasswordEncoder;
import org.springframework.security.crypto.scrypt.SCryptPasswordEncoder;
import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;
import org.springframework.security.crypto.password.MessageDigestPasswordEncoder;
import org.springframework.beans.factory.annotation.Value;
import java.util.HashMap;
import java.util.Map;

/**
 * 密码加密配置类
 */
@Configuration
public class AioveuPasswordEncoderConfig {

    @Value("${security.password.encoder.type:bcrypt}")
    private String encoderType;

    @Value("${security.password.bcrypt.strength:10}")
    private int bcryptStrength;

    @Value("${security.password.pbkdf2.iterations:310000}")
    private int pbkdf2Iterations;

    @Value("${security.password.pbkdf2.secret:}")
    private String pbkdf2Secret;

    @Value("${security.password.argon2.saltLength:16}")
    private int argon2SaltLength;

    @Value("${security.password.argon2.hashLength:32}")
    private int argon2HashLength;

    @Value("${security.password.argon2.parallelism:1}")
    private int argon2Parallelism;

    @Value("${security.password.argon2.memory:4096}")
    private int argon2Memory;

    @Value("${security.password.argon2.iterations:3}")
    private int argon2Iterations;

    /**
     * 密码编码器 - 支持多种算法
     */

    /**
     * 重命名Bean方法，避免冲突
     * 这样就不会冲突了，但需要确保在需要的地方注入正确的Bean。
     */
    @Bean
    public PasswordEncoder aioveuPasswordEncoder() {
        return createPasswordEncoder(encoderType);
    }

    /**
     * 创建指定类型的密码编码器
     */
    public PasswordEncoder createPasswordEncoder(String type) {
        if (type == null) {
            type = "bcrypt";
        }

        switch (type.toLowerCase()) {
            case "bcrypt":
                return createBCryptPasswordEncoder();
            case "pbkdf2":
                return createPbkdf2PasswordEncoder();
            case "scrypt":
                return createSCryptPasswordEncoder();
            case "argon2":
                return createArgon2PasswordEncoder();
            case "sha256":
                return createMessageDigestPasswordEncoder("SHA-256");
            case "md5":
                return createMessageDigestPasswordEncoder("MD5");
            case "delegating":
                return createDelegatingPasswordEncoder();
            default:
                throw new IllegalArgumentException("不支持的密码编码器类型: " + type);
        }
    }

    /**
     * BCrypt 密码编码器（推荐）
     */
    private PasswordEncoder createBCryptPasswordEncoder() {
        return new BCryptPasswordEncoder(bcryptStrength);
    }

    /**
     * PBKDF2 密码编码器
     */
    private PasswordEncoder createPbkdf2PasswordEncoder() {
        Pbkdf2PasswordEncoder.SecretKeyFactoryAlgorithm algorithm =
                Pbkdf2PasswordEncoder.SecretKeyFactoryAlgorithm.PBKDF2WithHmacSHA256;

        if (pbkdf2Secret != null && !pbkdf2Secret.isEmpty()) {
            return new Pbkdf2PasswordEncoder(pbkdf2Secret, pbkdf2Iterations, 256, algorithm);
        } else {
            return new Pbkdf2PasswordEncoder("", pbkdf2Iterations, 256, algorithm);
        }
    }

    /**
     * SCrypt 密码编码器
     */
    private PasswordEncoder createSCryptPasswordEncoder() {
        return SCryptPasswordEncoder.defaultsForSpringSecurity_v5_8();
    }

    /**
     * Argon2 密码编码器（现代算法，安全性高）
     */
    private PasswordEncoder createArgon2PasswordEncoder() {
        return new Argon2PasswordEncoder(
                argon2SaltLength,
                argon2HashLength,
                argon2Parallelism,
                argon2Memory,
                argon2Iterations
        );
    }

    /**
     * 消息摘要密码编码器（不推荐用于新系统）
     */
    private PasswordEncoder createMessageDigestPasswordEncoder(String algorithm) {
        return new MessageDigestPasswordEncoder(algorithm);
    }

    /**
     * 委托密码编码器（支持多种算法，便于迁移）
     */
    private PasswordEncoder createDelegatingPasswordEncoder() {
        String defaultEncoderId = "bcrypt";
        Map<String, PasswordEncoder> encoders = new HashMap<>();

        encoders.put("bcrypt", createBCryptPasswordEncoder());
        encoders.put("pbkdf2", createPbkdf2PasswordEncoder());
        encoders.put("scrypt", createSCryptPasswordEncoder());
        encoders.put("argon2", createArgon2PasswordEncoder());
        encoders.put("sha256", createMessageDigestPasswordEncoder("SHA-256"));
        encoders.put("md5", createMessageDigestPasswordEncoder("MD5"));

        DelegatingPasswordEncoder delegatingPasswordEncoder =
                new DelegatingPasswordEncoder(defaultEncoderId, encoders);

        // 设置默认编码器用于新密码
        delegatingPasswordEncoder.setDefaultPasswordEncoderForMatches(encoders.get(defaultEncoderId));

        return delegatingPasswordEncoder;
    }
}
