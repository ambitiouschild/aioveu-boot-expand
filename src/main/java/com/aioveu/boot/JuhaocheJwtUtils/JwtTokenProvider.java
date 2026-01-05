package com.aioveu.boot.JuhaocheJwtUtils;


import com.aioveu.boot.common.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * JWT令牌提供者
 */
@Slf4j
@Component

public class JwtTokenProvider {

    @Autowired
    private JwtUtils jwtUtils;

    /**
     * 从令牌中获取所有声明信息
     * 这是您需要的主要方法
     */
    public Map<String, Object> getClaimsFromToken(String token) {
        try {
            return jwtUtils.getClaimsFromToken(token);
        } catch (Exception e) {
//            log.warn("从令牌获取声明信息失败: token={}", maskToken(token), e);
            throw new BusinessException("获取令牌声明信息失败: " + e.getMessage());
        }
    }

    /**
     * 生成令牌（基于声明和用户ID）
     */
    public String generateToken(Map<String, Object> claims, Long userId) {
        return generateToken(claims, userId);
    }


}
