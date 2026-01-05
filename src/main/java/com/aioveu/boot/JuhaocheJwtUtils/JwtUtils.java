package com.aioveu.boot.JuhaocheJwtUtils;

import com.aioveu.boot.common.exception.BusinessException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@Component
public class JwtUtils {

    @Value("${jwt.secret:myDefaultSecretKeyForJWTTokenGeneration2024}")
    private String jwtSecret;

    @Value("${jwt.expiration:86400000}") // 默认24小时
    private long jwtExpiration;

    // 生成安全的密钥
    private SecretKey getSigningKey() {
        return Keys.hmacShaKeyFor(jwtSecret.getBytes());
    }



    /**
     * 从token中获取所有声明信息（核心方法）
     * 返回Map格式的所有声明
     */
    public static Map<String, Object> getClaimsFromToken(String token) {
        try {
            Claims claims = getAllClaimsFromToken(token);
            return convertClaimsToMap(claims);
        } catch (Exception e) {
            throw new BusinessException("获取Token声明信息失败: " + e.getMessage());
        }
    }

    /**
     * 从token中提取用户ID
     */
    public static Long getUserIdFromToken(String token) {
        return getClaimFromToken(token, claims -> claims.get("userId", Long.class));
    }

    /**
     * 从token中提取商户ID
     */
    public static Long getMerchantIdFromToken(String token) {
        return getClaimFromToken(token, claims -> claims.get("merchantId", Long.class));
    }

    /**
     * 从token中提取角色ID
     */
    public static Long getRoleIdFromToken(String token) {
        return getClaimFromToken(token, claims -> claims.get("roleId", Long.class));
    }

    /**
     * 从token中提取权限列表
     */
    @SuppressWarnings("unchecked")
    public static List<String> getPermissionsFromToken(String token) {
        return getClaimFromToken(token, claims -> claims.get("permissions", List.class));
    }

    /**
     * 从token中提取用户名
     */
    public static String getUsernameFromToken(String token) {
        return getClaimFromToken(token, Claims::getSubject);
    }

    /**
     * 从token中提取过期时间
     */
    public static Date getExpirationDateFromToken(String token) {
        return getClaimFromToken(token, Claims::getExpiration);
    }

    /**
     * 通用的claims提取方法
     */
    public static <T> T getClaimFromToken(String token, Function<Claims, T> claimsResolver) {
        try {
            final Claims claims = getAllClaimsFromToken(token);
            return claimsResolver.apply(claims);
        } catch (Exception e) {
            throw new BusinessException("Token解析失败: " + e.getMessage());
        }
    }

    /**
     * 获取token中的所有claims
     */
    private static Claims getAllClaimsFromToken(String token) {
        // 移除Bearer前缀
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7);
        }

        if (token == null || token.trim().isEmpty()) {
            throw new BusinessException("Token不能为空");
        }

        try {
            return Jwts.parserBuilder()
                    .setSigningKey(getInstance().getSigningKey())
                    .build()
                    .parseClaimsJws(token)
                    .getBody();
        } catch (io.jsonwebtoken.ExpiredJwtException e) {
            throw new BusinessException("Token已过期");
        } catch (io.jsonwebtoken.MalformedJwtException e) {
            throw new BusinessException("Token格式错误");
        } catch (io.jsonwebtoken.UnsupportedJwtException e) {
            throw new BusinessException("不支持的Token格式");
        } catch (io.jsonwebtoken.security.SecurityException e) {
            throw new BusinessException("Token签名验证失败");
        } catch (Exception e) {
            throw new BusinessException("Token解析异常: " + e.getMessage());
        }
    }

    /**
     * 将Claims转换为Map
     */
    private static Map<String, Object> convertClaimsToMap(Claims claims) {
        Map<String, Object> claimsMap = new HashMap<>();

        if (claims == null) {
            return claimsMap;
        }

        // 标准JWT声明字段
        if (claims.getIssuer() != null) {
            claimsMap.put("issuer", claims.getIssuer());
        }
        if (claims.getSubject() != null) {
            claimsMap.put("subject", claims.getSubject());
        }
        if (claims.getAudience() != null) {
            claimsMap.put("audience", claims.getAudience());
        }
        if (claims.getExpiration() != null) {
            claimsMap.put("expiration", claims.getExpiration());
        }
        if (claims.getNotBefore() != null) {
            claimsMap.put("notBefore", claims.getNotBefore());
        }
        if (claims.getIssuedAt() != null) {
            claimsMap.put("issuedAt", claims.getIssuedAt());
        }
        if (claims.getId() != null) {
            claimsMap.put("jwtId", claims.getId());
        }

        // 自定义声明字段
        for (Map.Entry<String, Object> entry : claims.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();

            // 跳过标准字段（已经单独处理）
            if (!isStandardClaim(key)) {
                claimsMap.put(key, value);
            }
        }

        return claimsMap;
    }

    /**
     * 检查是否为标准JWT声明字段
     */
    private static boolean isStandardClaim(String claimName) {
        return "iss".equals(claimName) ||
                "sub".equals(claimName) ||
                "aud".equals(claimName) ||
                "exp".equals(claimName) ||
                "nbf".equals(claimName) ||
                "iat".equals(claimName) ||
                "jti".equals(claimName);
    }

    /**
     * 生成JWT Token（基础版本）
     */
    public String generateToken(Long userId, String username) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("userId", userId);
        return generateToken(claims, username);
    }

    /**
     * 生成带商户角色的JWT Token
     */
    public String generateTokenWithMerchantRole(Long userId, String username,
                                                Long merchantId, Long roleId, List<String> permissions) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("userId", userId);
        claims.put("merchantId", merchantId);
        claims.put("roleId", roleId);
        claims.put("permissions", permissions);
        return generateToken(claims, username);
    }

    /**
     * 生成Token的核心方法
     */
    private String generateToken(Map<String, Object> claims, String subject) {
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(subject)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + jwtExpiration))
                .signWith(getSigningKey())
                .compact();
    }

    /**
     * 验证Token是否有效
     */
    public static boolean validateToken(String token) {
        try {
            getAllClaimsFromToken(token);
            return true;
        } catch (BusinessException e) {
            return false;
        }
    }

    /**
     * 检查Token是否即将过期（在指定时间内过期）
     */
    public static boolean isTokenExpiringSoon(String token, long minutes) {
        try {
            Date expiration = getExpirationDateFromToken(token);
            long timeUntilExpiration = expiration.getTime() - System.currentTimeMillis();
            return timeUntilExpiration > 0 && timeUntilExpiration < (minutes * 60 * 1000);
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 刷新Token（延长有效期）
     */
    public String refreshToken(String token) {
        try {
            Claims claims = getAllClaimsFromToken(token);
            String username = claims.getSubject();
            Long userId = claims.get("userId", Long.class);

            // 保留原有的claims
            Map<String, Object> newClaims = new HashMap<>(claims);

            return generateToken(newClaims, username);
        } catch (Exception e) {
            throw new BusinessException("Token刷新失败: " + e.getMessage());
        }
    }

    /**
     * 获取单例实例（用于静态方法调用实例方法）
     */
    private static JwtUtils getInstance() {
        return SpringContextHolder.getBean(JwtUtils.class);
    }

    // Getter和Setter
    public String getJwtSecret() {
        return jwtSecret;
    }

    public void setJwtSecret(String jwtSecret) {
        this.jwtSecret = jwtSecret;
    }

    public long getJwtExpiration() {
        return jwtExpiration;
    }

    public void setJwtExpiration(long jwtExpiration) {
        this.jwtExpiration = jwtExpiration;
    }
}
