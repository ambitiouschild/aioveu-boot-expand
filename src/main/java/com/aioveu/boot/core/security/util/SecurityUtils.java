package com.aioveu.boot.core.security.util;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.aioveu.boot.common.constant.SecurityConstants;
import com.aioveu.boot.common.constant.SystemConstants;
import com.aioveu.boot.core.security.model.SysUserDetails;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Collection;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Spring Security 工具类
 *
 * @author Ray
 * @since 2021/1/10
 */
@Slf4j
public class SecurityUtils {

    /**
     * 获取当前登录人信息
     *
     * @return Optional<SysUserDetails>
     */
    public static Optional<SysUserDetails> getUser() {

        log.info("获取当前的安全上下文（SecurityContext）中的认证信息（Authentication）");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();


        if (authentication != null) {

            log.info("直接从Authentication对象的getPrincipal()方法获取");
            Object principal = authentication.getPrincipal();


            if (principal instanceof SysUserDetails) {
                return Optional.of((SysUserDetails) principal);
            }
        }
        return Optional.empty();
    }


    /**
     * 获取用户ID
     *
     * @return Long
     */
    public static Long getUserId() {
        return getUser().map(SysUserDetails::getUserId).orElse(null);
    }


    /**
     * 获取用户账号
     *
     * @return String 用户账号
     */
    public static String getUsername() {
        return getUser().map(SysUserDetails::getUsername).orElse(null);
    }


    /**
     * 获取部门ID
     *
     * @return Long
     */
    public static Long getDeptId() {
        return getUser().map(SysUserDetails::getDeptId).orElse(null);
    }

    /**
     * 获取数据权限范围
     *
     * @return Integer
     */
    public static Integer getDataScope() {
        return getUser().map(SysUserDetails::getDataScope).orElse(null);
    }


    /**
     * 获取角色集合
     *
     * @return 角色集合
     */
    public static Set<String> getRoles() {
        return Optional.ofNullable(SecurityContextHolder.getContext().getAuthentication())// 1.获取认证信息
                .map(Authentication::getAuthorities) //2.提取权限列表
                .filter(CollectionUtil::isNotEmpty)  //3.过滤非空列表
                .stream()
                .flatMap(Collection::stream) //4.转换为 Stream
                .map(GrantedAuthority::getAuthority)   //5. 获取权限字符串
                // 筛选角色,authorities 中的角色都是以 ROLE_ 开头
                .filter(authority -> authority.startsWith(SecurityConstants.ROLE_PREFIX))  //6. 筛选角色权限，只保留以 "ROLE_"开头的权限（这些是角色）
                .map(authority -> StrUtil.removePrefix(authority, SecurityConstants.ROLE_PREFIX)) //7. 移除角色前缀，使用 Hutool 的 StrUtil.removePrefix()移除 "ROLE_"前缀
                .collect(Collectors.toSet()); //8. 收集为 Set，使用 Set 自动去重
    }

    /**
     * 是否超级管理员
     * <p>
     * 超级管理员忽视任何权限判断
     */
    public static boolean isRoot() {
        Set<String> roles = getRoles();
        return roles.contains(SystemConstants.ROOT_ROLE_CODE);
    }

    /**
     * 获取请求中的 Token
     *
     * @return Token 字符串
     */
    public static String getTokenFromRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getHeader(HttpHeaders.AUTHORIZATION);
    }


}
