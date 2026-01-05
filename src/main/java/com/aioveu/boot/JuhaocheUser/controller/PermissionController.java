package com.aioveu.boot.JuhaocheUser.controller;


import com.aioveu.boot.JuhaocheJwtUtils.JwtTokenProvider;
import com.aioveu.boot.JuhaochePermissionsConfig.model.entity.JuhaochePermissionsConfig;
import com.aioveu.boot.JuhaochePermissionsConfig.service.JuhaochePermissionsConfigService;
import com.aioveu.boot.JuhaocheUser.model.permissionDto.PermissionCheckDTO;
import com.aioveu.boot.JuhaocheUser.model.permissionDto.PermissionCheckRequest;
import com.aioveu.boot.common.exception.BusinessException;
import com.aioveu.boot.common.result.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Tag(name = "聚好车权限验证接口实现")
@RestController
@RequestMapping("/api/v1/juhaoche-auth")
@RequiredArgsConstructor
public class PermissionController {


    @Autowired
    private JuhaochePermissionsConfigService permissionConfigService;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    /**
     * 权限验证接口
     */
    @Operation(summary = "权限验证接口")
    @PostMapping("/check-permission")
    public Result<PermissionCheckDTO> checkPermission(
            @RequestHeader("Authorization") String token,
            @RequestHeader("X-Merchant-Id") Long merchantId,
            @Valid @RequestBody PermissionCheckRequest request) {

        // 1. 解析Token中的权限信息
        Map<String, Object> claims = jwtTokenProvider.getClaimsFromToken(token);
        Long userId = (Long) claims.get("userId");
        Long tokenMerchantId = (Long) claims.get("merchantId");
        List<String> userPermissions = (List<String>) claims.get("permissions");

        // 2. 验证商户一致性
        if (!merchantId.equals(tokenMerchantId)) {
            throw new BusinessException("商户ID不匹配");
        }

        // 3. 获取接口所需的权限
        JuhaochePermissionsConfig permissionConfig = permissionConfigService.getByApiPath(
                request.getApiPath(), request.getHttpMethod());

        if (permissionConfig == null || permissionConfig.getIsEnable() == 0) {
            // 接口不需要权限控制
            return Result.success(PermissionCheckDTO.builder()
                    .hasPermission(true)
                    .requiredPermissions(new ArrayList<>())
                    .build());
        }

        // 4. 解析所需的权限编码
        List<String> requiredPermissions = Arrays.asList(
                permissionConfig.getPermissionIds().split(","));

        // 5. 检查权限
        boolean hasPermission = false;
        if (requiredPermissions.contains("*")) {
            // 需要所有权限（通配符）
            hasPermission = true;
        } else {
            // 检查用户是否拥有任一所需权限
            hasPermission = userPermissions.stream()
                    .anyMatch(requiredPermissions::contains);
        }

        // 6. 记录权限检查日志
//        permissionCheckLogService.logCheck(userId, merchantId,
//                request.getApiPath(), request.getHttpMethod(), hasPermission);

        PermissionCheckDTO result = PermissionCheckDTO.builder()
                .hasPermission(hasPermission)
                .requiredPermissions(requiredPermissions)
                .build();

        return Result.success(result);
    }

    /**
     * 权限验证拦截器（AOP实现）
     */
    @Component
    @Aspect
    public class PermissionAspect {

        @Autowired
        private PermissionController permissionController;

        @Around("@annotation(requiresPermission)")
        public Object checkPermission(ProceedingJoinPoint joinPoint, RequiresPermission requiresPermission)
                throws Throwable {

            // 获取请求信息
            HttpServletRequest request = ((ServletRequestAttributes)
                    RequestContextHolder.getRequestAttributes()).getRequest();

            String apiPath = request.getRequestURI();
            String httpMethod = request.getMethod();
            String token = request.getHeader("Authorization");
            String merchantIdHeader = request.getHeader("X-Merchant-Id");

            if (token == null || merchantIdHeader == null) {
                throw new BusinessException("缺少必要的认证信息");
            }

            Long merchantId = Long.valueOf(merchantIdHeader);

            // 调用权限验证
            PermissionCheckRequest checkRequest = new PermissionCheckRequest();
            checkRequest.setApiPath(apiPath);
            checkRequest.setHttpMethod(httpMethod);

            Result<PermissionCheckDTO> checkResult = permissionController
                    .checkPermission(token, merchantId, checkRequest);

            if (!checkResult.getData().isHasPermission()) {
                throw new BusinessException("无权限访问该接口");
            }

            return joinPoint.proceed();
        }
    }

    /**
     * 权限注解
     */
    @Target(ElementType.METHOD)
    @Retention(RetentionPolicy.RUNTIME)
    public @interface RequiresPermission {
    }

}
