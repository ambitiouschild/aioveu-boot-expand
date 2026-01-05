package com.aioveu.boot.JuhaocheJwtUtils;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * JWT 配置类
 */
@Data
@Component
@ConfigurationProperties(prefix = "jwt")
public class JwtProperties {

    /**
     * 密钥
     */
    private String secret = "juhaoche-secret-key-2024-spring-boot-security-jwt-token-provider";

    /**
     * 令牌过期时间（分钟）
     */
    private Long expiration = 1440L; // 24小时

    /**
     * 令牌刷新时间（分钟）
     */
    private Long refreshExpiration = 10080L; // 7天

    /**
     * 签发者
     */
    private String issuer = "juhaoche-system";

    /**
     * 令牌前缀
     */
    private String tokenPrefix = "Bearer ";

    /**
     * 令牌请求头名称
     */
    private String tokenHeader = "Authorization";

    /**
     * 是否启用刷新令牌
     */
    private boolean enableRefresh = true;

    /**
     * 刷新令牌过期时间（分钟）
     */
    private Long refreshTokenExpiration = 43200L; // 30天
}
