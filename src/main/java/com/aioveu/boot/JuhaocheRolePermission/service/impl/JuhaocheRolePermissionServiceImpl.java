package com.aioveu.boot.JuhaocheRolePermission.service.impl;

import com.aioveu.boot.JuhaochePermissions.model.entity.JuhaochePermissions;
import com.aioveu.boot.JuhaochePermissions.service.JuhaochePermissionsService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.JuhaocheRolePermission.mapper.JuhaocheRolePermissionMapper;
import com.aioveu.boot.JuhaocheRolePermission.service.JuhaocheRolePermissionService;
import com.aioveu.boot.JuhaocheRolePermission.model.entity.JuhaocheRolePermission;
import com.aioveu.boot.JuhaocheRolePermission.model.form.JuhaocheRolePermissionForm;
import com.aioveu.boot.JuhaocheRolePermission.model.query.JuhaocheRolePermissionQuery;
import com.aioveu.boot.JuhaocheRolePermission.model.vo.JuhaocheRolePermissionVO;
import com.aioveu.boot.JuhaocheRolePermission.converter.JuhaocheRolePermissionConverter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import org.springframework.util.CollectionUtils;

/**
 * 角色权限关联服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:50
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class JuhaocheRolePermissionServiceImpl extends ServiceImpl<JuhaocheRolePermissionMapper, JuhaocheRolePermission> implements JuhaocheRolePermissionService {

    private final JuhaocheRolePermissionConverter juhaocheRolePermissionConverter;


    @Autowired
    private JuhaochePermissionsService juhaochePermissionsService;

    /**
    * 获取角色权限关联分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<JuhaocheRolePermissionVO>} 角色权限关联分页列表
    */
    @Override
    public IPage<JuhaocheRolePermissionVO> getJuhaocheRolePermissionPage(JuhaocheRolePermissionQuery queryParams) {
        Page<JuhaocheRolePermissionVO> pageVO = this.baseMapper.getJuhaocheRolePermissionPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取角色权限关联表单数据
     *
     * @param id 角色权限关联ID
     * @return 角色权限关联表单数据
     */
    @Override
    public JuhaocheRolePermissionForm getJuhaocheRolePermissionFormData(Long id) {
        JuhaocheRolePermission entity = this.getById(id);
        return juhaocheRolePermissionConverter.toForm(entity);
    }
    
    /**
     * 新增角色权限关联
     *
     * @param formData 角色权限关联表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveJuhaocheRolePermission(JuhaocheRolePermissionForm formData) {
        JuhaocheRolePermission entity = juhaocheRolePermissionConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新角色权限关联
     *
     * @param id   角色权限关联ID
     * @param formData 角色权限关联表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateJuhaocheRolePermission(Long id,JuhaocheRolePermissionForm formData) {
        JuhaocheRolePermission entity = juhaocheRolePermissionConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除角色权限关联
     *
     * @param ids 角色权限关联ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteJuhaocheRolePermissions(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的角色权限关联数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }


    /**
     * 根据角色ID获取权限列表
     */
    @Override
    public List<JuhaochePermissions> getPermissionsByRoleId(Long roleId) {
        if (roleId == null || roleId <= 0) {
            log.warn("角色ID无效: roleId={}", roleId);
            return new ArrayList<>();
        }

        try {
            // 1. 使用 MyBatis-Plus 的 LambdaQueryWrapper 查询角色权限关联
            LambdaQueryWrapper<JuhaocheRolePermission> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(JuhaocheRolePermission::getRoleId, roleId)
//                    .eq(JuhaocheRolePermission::getIsEnable, 1)
                    .eq(JuhaocheRolePermission::getIsDel, 0)
                    .select(JuhaocheRolePermission::getPermissionId);

            List<JuhaocheRolePermission> rolePermissions = list(wrapper);

            if (CollectionUtils.isEmpty(rolePermissions)) {
                return new ArrayList<>();
            }

            // 2. 提取权限ID列表
            List<Long> permissionIds = rolePermissions.stream()
                    .map(JuhaocheRolePermission::getPermissionId)
                    .distinct()
                    .collect(Collectors.toList());

            // 3. 使用 MyBatis-Plus 的 listByIds 批量查询权限详情
            LambdaQueryWrapper<JuhaochePermissions> permissionWrapper = new LambdaQueryWrapper<>();
            permissionWrapper.in(JuhaochePermissions::getId, permissionIds)
                    .eq(JuhaochePermissions::getIsEnable, 1)
                    .eq(JuhaochePermissions::getIsDel, 0);
//                    .orderByAsc(JuhaochePermissions::getSortOrder);

            return juhaochePermissionsService.list(permissionWrapper);

        } catch (Exception e) {
            log.error("根据角色ID获取权限列表异常: roleId={}", roleId, e);
            return new ArrayList<>();
        }
    }

}
