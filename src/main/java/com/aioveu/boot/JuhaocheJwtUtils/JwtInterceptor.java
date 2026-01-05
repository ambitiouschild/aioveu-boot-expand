package com.aioveu.boot.JuhaocheJwtUtils;


import com.aioveu.boot.common.exception.BusinessException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * JWT拦截器，自动解析Token并设置用户上下文  拦截器实现（用于自动解析Token）
 */
@Component
public class JwtInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 从请求头获取Token
        String token = request.getHeader("Authorization");

        if (token != null && token.startsWith("Bearer ")) {
            try {
                // 解析Token并设置用户上下文
                Long userId = JwtUtils.getUserIdFromToken(token);
                Long merchantId = JwtUtils.getMerchantIdFromToken(token);
                Long roleId = JwtUtils.getRoleIdFromToken(token);
                String username = JwtUtils.getUsernameFromToken(token);

                // 设置到当前线程上下文
                UserContext.setCurrentUserId(userId);
                UserContext.setCurrentMerchantId(merchantId);
                UserContext.setCurrentRoleId(roleId);
                UserContext.setCurrentUsername(username);

            } catch (BusinessException e) {
                // Token解析失败，但不中断请求，由具体接口判断是否需要登录
                UserContext.clear();
            }
        }

        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 请求完成后清理上下文
        UserContext.clear();
    }
}
