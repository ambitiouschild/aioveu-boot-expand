package com.aioveu.boot.JuhaocheUser.controller;

import com.aioveu.boot.JuhaocheJwtUtils.JwtTokenProvider;
import com.aioveu.boot.JuhaocheJwtUtils.JwtUtils;
import com.aioveu.boot.JuhaocheJwtUtils.SecurityUtils;
import com.aioveu.boot.JuhaocheMerchant.model.entity.JuhaocheMerchant;
import com.aioveu.boot.JuhaocheMerchant.service.JuhaocheMerchantService;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.entity.JuhaocheMerchantUserRole;
import com.aioveu.boot.JuhaocheMerchantUserRole.service.JuhaocheMerchantUserRoleService;
import com.aioveu.boot.JuhaochePermissions.model.entity.JuhaochePermissions;
import com.aioveu.boot.JuhaocheRolePermission.model.entity.JuhaocheRolePermission;
import com.aioveu.boot.JuhaocheRolePermission.service.JuhaocheRolePermissionService;
import com.aioveu.boot.JuhaocheRoles.model.entity.JuhaocheRoles;
import com.aioveu.boot.JuhaocheRoles.service.JuhaocheRolesService;
import com.aioveu.boot.JuhaocheUser.model.dto.MerchantInfoDTO;
import com.aioveu.boot.JuhaocheUser.model.dto.RoleInfoDTO;
import com.aioveu.boot.JuhaocheUser.model.dto.RoleSelectDTO;
import com.aioveu.boot.JuhaocheUser.model.request.RoleSelectRequest;
import com.aioveu.boot.common.exception.BusinessException;
import com.aioveu.boot.common.result.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Tag(name = "聚好车角色选择接口实现")
@RestController
@RequestMapping("/api/v1/juhaoche-auth")
@RequiredArgsConstructor
public class JuhaocheAuthController {

    @Autowired
    private JuhaocheMerchantUserRoleService merchantUserRoleService;

    @Autowired
    private JuhaocheRolePermissionService juhaocheRolePermissionService;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;


    @Autowired
    private JuhaocheMerchantService merchantService;

    @Autowired
    private JuhaocheRolesService roleService;




    /**
     * 选择商户角色接口
     */
    @Operation(summary = "选择商户角色接口")
    @PostMapping("/select-role")
    public Result<RoleSelectDTO> selectRole(
            @RequestHeader(value = "Authorization", required = false) String token,
            @Valid @RequestBody RoleSelectRequest request) {

        Long userId;
        // 支持从token解析或从已登录会话中获取
        if (token != null && token.startsWith("Bearer ")) {
            userId = JwtUtils.getUserIdFromToken(token);
        } else {
            // 从安全上下文获取（如Spring Security）
            userId = SecurityUtils.getCurrentUserId();
        }

        if (userId == null) {
            throw new BusinessException("用户未登录");
        }

        // 1. 验证用户是否拥有该商户的指定角色
        JuhaocheMerchantUserRole userRole = merchantUserRoleService.getUserRole(
                userId, request.getMerchantId(), request.getRoleId());

        if (userRole == null || userRole.getIsActive() == 0 || userRole.getIsEnable() == 0) {
            throw new BusinessException("用户未拥有该角色或角色已禁用");
        }

        // 2. 验证商户状态
        JuhaocheMerchant merchant = merchantService.getByMerchantId(request.getMerchantId());
        if (merchant == null || merchant.getIsDel() == 1) {
            throw new BusinessException("商户不存在");
        }
        if (merchant.getIsEnable() == 0) {
            throw new BusinessException("商户已被禁用");
        }
        if (merchant.getStatus() != 1) {
            throw new BusinessException("商户未通过审核");
        }

        // 3. 获取角色权限信息
        JuhaocheRoles role = roleService.getById(request.getRoleId());
        List<JuhaochePermissions> permissions = juhaocheRolePermissionService.getPermissionsByRoleId(request.getRoleId());

        List<String> permissionCodes = permissions.stream()
                .filter(p -> p.getIsEnable() == 1)
                .map(JuhaochePermissions::getCode)
                .collect(Collectors.toList());

        // 4. 生成新的JWT Token（包含商户和角色信息）
        Map<String, Object> claims = new HashMap<>();
        claims.put("userId", userId);
        claims.put("merchantId", request.getMerchantId());
        claims.put("roleId", request.getRoleId());
        claims.put("permissions", permissionCodes);

        String newToken = jwtTokenProvider.generateToken(claims, userId);

        // 5. 构建返回结果
        MerchantInfoDTO merchantInfo = MerchantInfoDTO.builder()
                .merchantId(merchant.getMerchantId())
                .merchantName(merchant.getMerchantName())
                .merchantCode(merchant.getMerchantCode())
                .build();

        RoleInfoDTO roleInfo = RoleInfoDTO.builder()
                .roleId(role.getRoleId())
                .roleName(role.getName())
                .roleCode(role.getCode())
                .build();

        RoleSelectDTO result = RoleSelectDTO.builder()
                .accessToken(newToken)
                .merchantInfo(merchantInfo)
                .roleInfo(roleInfo)
                .permissions(permissionCodes)
                .build();

        return Result.success(result);
    }



}
