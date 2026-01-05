package com.aioveu.boot.JuhaocheMerchant.controller;


import com.aioveu.boot.JuhaocheJwtUtils.JwtUtils;
import com.aioveu.boot.JuhaocheMerchant.model.dto.MerchantRegisterDTO;
import com.aioveu.boot.JuhaocheMerchant.model.entity.JuhaocheMerchant;
import com.aioveu.boot.JuhaocheMerchant.model.request.MerchantRegisterRequest;
import com.aioveu.boot.JuhaocheMerchant.service.JuhaocheMerchantService;
import com.aioveu.boot.JuhaocheMerchantUserRole.model.entity.JuhaocheMerchantUserRole;
import com.aioveu.boot.JuhaocheMerchantUserRole.service.JuhaocheMerchantUserRoleService;
import com.aioveu.boot.JuhaocheRoles.model.entity.JuhaocheRoles;
import com.aioveu.boot.JuhaocheRoles.service.JuhaocheRolesService;
import com.aioveu.boot.JuhaocheUser.model.entity.JuhaocheUser;
import com.aioveu.boot.JuhaocheUser.service.JuhaocheUserService;
import com.aioveu.boot.JuhaocheUserMerchant.model.entity.JuhaocheUserMerchant;
import com.aioveu.boot.JuhaocheUserMerchant.service.JuhaocheUserMerchantService;
import com.aioveu.boot.aioveuCommon.util.NumberGenerator.IdGenerator;
import com.aioveu.boot.common.exception.BusinessException;
import lombok.RequiredArgsConstructor;
import org.apache.poi.hpsf.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.JuhaocheMerchant.model.form.JuhaocheMerchantForm;
import com.aioveu.boot.JuhaocheMerchant.model.query.JuhaocheMerchantQuery;
import com.aioveu.boot.JuhaocheMerchant.model.vo.JuhaocheMerchantVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.aioveu.boot.common.result.PageResult;
import com.aioveu.boot.common.result.Result;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;

import java.time.LocalDateTime;

/**
 * 商户主体前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:52
 */
@Tag(name = "聚好车商户主体接口")
@RestController
@RequestMapping("/api/v1/juhaoche-merchant")
@RequiredArgsConstructor
public class JuhaocheMerchantController  {

    private final JuhaocheMerchantService juhaocheMerchantService;

    @Autowired
    private JuhaocheUserMerchantService juhaocheUserMerchantService;

    @Autowired
    private JuhaocheUserService juhaocheUserService;

    @Autowired
    private JuhaocheRolesService juhaocheRolesService;

    @Autowired
    private JuhaocheMerchantUserRoleService juhaocheMerchantUserRoleService;

    @Autowired
    private IdGenerator idGenerator;





    @Operation(summary = "商户主体分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchant:juhaoche-merchant:query')")
    public PageResult<JuhaocheMerchantVO> getJuhaocheMerchantPage(JuhaocheMerchantQuery queryParams ) {
        IPage<JuhaocheMerchantVO> result = juhaocheMerchantService.getJuhaocheMerchantPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增商户主体")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchant:juhaoche-merchant:add')")
    public Result<Void> saveJuhaocheMerchant(@RequestBody @Valid JuhaocheMerchantForm formData ) {
        boolean result = juhaocheMerchantService.saveJuhaocheMerchant(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取商户主体表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchant:juhaoche-merchant:edit')")
    public Result<JuhaocheMerchantForm> getJuhaocheMerchantForm(
        @Parameter(description = "商户主体ID") @PathVariable Long id
    ) {
        JuhaocheMerchantForm formData = juhaocheMerchantService.getJuhaocheMerchantFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改商户主体")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchant:juhaoche-merchant:edit')")
    public Result<Void> updateJuhaocheMerchant(
            @Parameter(description = "商户主体ID") @PathVariable Long id,
            @RequestBody @Validated JuhaocheMerchantForm formData
    ) {
        boolean result = juhaocheMerchantService.updateJuhaocheMerchant(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除商户主体")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('JuhaocheMerchant:juhaoche-merchant:delete')")
    public Result<Void> deleteJuhaocheMerchants(
        @Parameter(description = "商户主体ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = juhaocheMerchantService.deleteJuhaocheMerchants(ids);
        return Result.judge(result);
    }

    /**
     * 商户注册接口
     */

    @Operation(summary = "商户注册接口")
    @PostMapping("/register")
    public Result<MerchantRegisterDTO> registerMerchant(
            @RequestHeader("Authorization") String token,
            @Valid @RequestBody MerchantRegisterRequest request) {

        // 1. 解析用户ID
        Long userId = JwtUtils.getUserIdFromToken(token);

        // 2. 校验用户状态
        JuhaocheUser user = juhaocheUserService.getById(userId);
        if (user == null || user.getIsDel() == 1) {
            throw new BusinessException("用户不存在");
        }
        if (user.getIsEnable() == 0) {
            throw new BusinessException("用户已被禁用");
        }

        // 3. 校验营业执照唯一性
        if (juhaocheMerchantService.checkBusinessLicenseExists(request.getBusinessLicense())) {
            throw new BusinessException("营业执照号已存在");
        }

        // 4. 创建商户主体
        JuhaocheMerchant merchant = JuhaocheMerchant.builder()
                // 方式1：使用雪花算法生成数字ID（推荐）
                .merchantId(idGenerator.generateId())
                // 方式2：使用静态方法（需要SpringContextHolder支持）
                // Long merchantId = IdGenerator.nextId();
                // 方式3：使用Redis生成带业务前缀的ID
                // String merchantCode = redisIdGenerator.generateMerchantId();


                .merchantName(request.getMerchantName())
                .merchantCode(generateMerchantCode())
                .businessLicense(request.getBusinessLicense())
                .legalPerson(request.getLegalPerson())
                .contactPhone(request.getContactPhone())
                .industryType(request.getIndustryType())
                .address(request.getAddress())
                .status(0) // 待审核
                .isEnable(1)
                .createUser(userId)
                .updateUser(userId)
                .build();
        juhaocheMerchantService.save(merchant);

        // 5. 建立用户-商户关联（主账号）
        JuhaocheUserMerchant userMerchant = JuhaocheUserMerchant.builder()
                .userId(userId)
                .merchantId(merchant.getMerchantId())
                .isOwner(1) // 主账号
                .joinTime(LocalDateTime.now())
                .isEnable(1)
                .createUser(userId)
                .updateUser(userId)
                .build();
        juhaocheUserMerchantService.save(userMerchant);

        // 6. 分配商户管理员角色
        JuhaocheRoles merchantAdminRole = juhaocheRolesService.getByCode("MERCHANT_ADMIN");
        if (merchantAdminRole != null) {
            JuhaocheMerchantUserRole merchantUserRole = JuhaocheMerchantUserRole.builder()
                    .userId(userId)
                    .merchantId(merchant.getMerchantId())
                    .roleId(merchantAdminRole.getRoleId())
                    .isActive(1)
                    .grantTime(LocalDateTime.now())
                    .grantUserId(userId)
                    .isEnable(1)
                    .createUser(userId)
                    .updateUser(userId)
                    .build();
            juhaocheMerchantUserRoleService.save(merchantUserRole);
        }

        // 7. 返回结果
        MerchantRegisterDTO result = MerchantRegisterDTO.builder()
                .merchantId(merchant.getMerchantId())
                .merchantName(merchant.getMerchantName())
                .auditStatus("PENDING")
                .build();

        return Result.success(result);
    }

    /**
     * 生成商户编码
     */
    private String generateMerchantCode() {
        String timestamp = String.valueOf(System.currentTimeMillis());
        String random = String.valueOf((int)((Math.random() * 9 + 1) * 1000));
        return "MC" + timestamp.substring(5) + random;
    }



}
