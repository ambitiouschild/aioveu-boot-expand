package com.aioveu.boot.JuhaocheJwtUtils;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import lombok.extern.slf4j.Slf4j;
// 根据您的项目选择其中一个
import jakarta.servlet.http.HttpServletRequest;  // Spring Boot 3.x
// import javax.servlet.http.HttpServletRequest;  // Spring Boot 2.x
import java.util.Optional;
import java.util.function.Supplier;

/**
 * 安全工具类 - 用于获取当前登录用户信息
 */
@Slf4j
@Component

public class SecurityUtils {

    /**
     * 获取当前用户ID
     */
    public static Long getCurrentUserId() {
        try {
            Authentication authentication = getAuthentication();
            if (authentication == null || !authentication.isAuthenticated()) {
                return null;
            }

            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) principal;
                // 从UserDetails中提取用户ID
                return extractUserIdFromUserDetails(userDetails);
            } else if (principal instanceof String) {
                // 可能是用户名或用户ID字符串
                return parseUserId((String) principal);
            } else if (principal instanceof Long) {
                return (Long) principal;
            } else if (principal instanceof Integer) {
                return ((Integer) principal).longValue();
            }

            log.debug("无法从Authentication中提取用户ID: principal类型={}",
                    principal != null ? principal.getClass().getName() : "null");
            return null;

        } catch (Exception e) {
            log.warn("获取当前用户ID异常", e);
            return null;
        }
    }

    /**
     * 获取当前用户名
     */
    public static String getCurrentUsername() {
        try {
            Authentication authentication = getAuthentication();
            if (authentication == null || !authentication.isAuthenticated()) {
                return null;
            }

            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                return ((UserDetails) principal).getUsername();
            } else if (principal instanceof String) {
                return (String) principal;
            }

            return principal != null ? principal.toString() : null;

        } catch (Exception e) {
            log.warn("获取当前用户名异常", e);
            return null;
        }
    }

    /**
     * 获取当前用户详情
     */
    public static UserDetails getCurrentUserDetails() {
        try {
            Authentication authentication = getAuthentication();
            if (authentication == null || !authentication.isAuthenticated()) {
                return null;
            }

            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                return (UserDetails) principal;
            }

            return null;

        } catch (Exception e) {
            log.warn("获取当前用户详情异常", e);
            return null;
        }
    }

    /**
     * 获取当前认证信息
     */
    public static Authentication getAuthentication() {
        SecurityContext context = SecurityContextHolder.getContext();
        if (context == null) {
            return null;
        }
        return context.getAuthentication();
    }

    /**
     * 检查当前用户是否已认证
     */
    public static boolean isAuthenticated() {
        Authentication authentication = getAuthentication();
        return authentication != null && authentication.isAuthenticated();
    }

    /**
     * 检查当前用户是否有指定权限
     */
    public static boolean hasAuthority(String authority) {
        Authentication authentication = getAuthentication();
        if (authentication == null) {
            return false;
        }

        return authentication.getAuthorities().stream()
                .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals(authority));
    }

    /**
     * 检查当前用户是否有任意指定权限
     */
    public static boolean hasAnyAuthority(String... authorities) {
        Authentication authentication = getAuthentication();
        if (authentication == null || authorities == null) {
            return false;
        }

        for (String authority : authorities) {
            if (hasAuthority(authority)) {
                return true;
            }
        }

        return false;
    }

    /**
     * 获取当前请求的IP地址
     */
    public static String getCurrentUserIp() {
        try {
            HttpServletRequest request = getCurrentRequest();
            if (request == null) {
                return "unknown";
            }

            return getClientIpAddress(request);

        } catch (Exception e) {
            log.warn("获取用户IP地址异常", e);
            return "unknown";
        }
    }

    /**
     * 获取当前请求
     */
    public static HttpServletRequest getCurrentRequest() {
        try {
            ServletRequestAttributes attributes = (ServletRequestAttributes)
                    RequestContextHolder.getRequestAttributes();
            return attributes != null ? attributes.getRequest() : null;
        } catch (Exception e) {
            log.warn("获取当前请求异常", e);
            return null;
        }
    }

    /**
     * 安全地执行需要认证的操作
     */
    public static <T> Optional<T> executeWithAuthentication(Supplier<T> supplier) {
        if (!isAuthenticated()) {
            return Optional.empty();
        }

        try {
            return Optional.ofNullable(supplier.get());
        } catch (Exception e) {
            log.error("安全执行操作异常", e);
            return Optional.empty();
        }
    }

    /**
     * 安全地执行需要认证的操作（无返回值）
     */
    public static void executeWithAuthentication(Runnable runnable) {
        if (!isAuthenticated()) {
            return;
        }

        try {
            runnable.run();
        } catch (Exception e) {
            log.error("安全执行操作异常", e);
        }
    }

    // ================ 私有方法 ================

    /**
     * 从UserDetails中提取用户ID
     */
    private static Long extractUserIdFromUserDetails(UserDetails userDetails) {
        if (userDetails instanceof CustomUserDetails) {
            return ((CustomUserDetails) userDetails).getUserId();
        }

        // 尝试从用户名中解析用户ID（如果用户名就是用户ID）
        String username = userDetails.getUsername();
        return parseUserId(username);
    }

    /**
     * 解析用户ID
     */
    private static Long parseUserId(String str) {
        if (str == null || str.trim().isEmpty()) {
            return null;
        }

        try {
            return Long.parseLong(str.trim());
        } catch (NumberFormatException e) {
            // 如果不是数字，返回null
            return null;
        }
    }

    /**
     * 获取客户端IP地址
     */
    private static String getClientIpAddress(HttpServletRequest request) {
        String[] headers = {
                "X-Forwarded-For",
                "Proxy-Client-IP",
                "WL-Proxy-Client-IP",
                "HTTP_X_FORWARDED_FOR",
                "HTTP_X_FORWARDED",
                "HTTP_X_CLUSTER_CLIENT_IP",
                "HTTP_CLIENT_IP",
                "HTTP_FORWARDED_FOR",
                "HTTP_FORWARDED",
                "HTTP_VIA",
                "REMOTE_ADDR"
        };

        for (String header : headers) {
            String ip = request.getHeader(header);
            if (isValidIpAddress(ip)) {
                return getFirstIp(ip);
            }
        }

        return request.getRemoteAddr();
    }

    /**
     * 验证IP地址是否有效
     */
    private static boolean isValidIpAddress(String ip) {
        return ip != null &&
                ip.length() > 0 &&
                !"unknown".equalsIgnoreCase(ip) &&
                !"0:0:0:0:0:0:0:1".equals(ip) &&
                !"127.0.0.1".equals(ip);
    }

    /**
     * 获取第一个IP（处理多个IP的情况）
     */
    private static String getFirstIp(String ip) {
        if (ip == null) {
            return null;
        }

        // 处理多个IP的情况：client, proxy1, proxy2
        int index = ip.indexOf(',');
        if (index != -1) {
            return ip.substring(0, index).trim();
        }

        return ip.trim();
    }
}
