package com.aioveu.boot.JuhaocheJwtUtils;

/**
 * 用户上下文持有器
 */
public class UserContext {

    private static final ThreadLocal<Long> CURRENT_USER_ID = new ThreadLocal<>();
    private static final ThreadLocal<Long> CURRENT_MERCHANT_ID = new ThreadLocal<>();
    private static final ThreadLocal<Long> CURRENT_ROLE_ID = new ThreadLocal<>();
    private static final ThreadLocal<String> CURRENT_USERNAME = new ThreadLocal<>();

    public static Long getCurrentUserId() {
        return CURRENT_USER_ID.get();
    }

    public static void setCurrentUserId(Long userId) {
        CURRENT_USER_ID.set(userId);
    }

    public static Long getCurrentMerchantId() {
        return CURRENT_MERCHANT_ID.get();
    }

    public static void setCurrentMerchantId(Long merchantId) {
        CURRENT_MERCHANT_ID.set(merchantId);
    }

    public static Long getCurrentRoleId() {
        return CURRENT_ROLE_ID.get();
    }

    public static void setCurrentRoleId(Long roleId) {
        CURRENT_ROLE_ID.set(roleId);
    }

    public static String getCurrentUsername() {
        return CURRENT_USERNAME.get();
    }

    public static void setCurrentUsername(String username) {
        CURRENT_USERNAME.set(username);
    }

    public static void clear() {
        CURRENT_USER_ID.remove();
        CURRENT_MERCHANT_ID.remove();
        CURRENT_ROLE_ID.remove();
        CURRENT_USERNAME.remove();
    }
}
