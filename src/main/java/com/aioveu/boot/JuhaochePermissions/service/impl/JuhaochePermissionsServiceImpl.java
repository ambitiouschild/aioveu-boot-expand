package com.aioveu.boot.JuhaochePermissions.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.JuhaochePermissions.mapper.JuhaochePermissionsMapper;
import com.aioveu.boot.JuhaochePermissions.service.JuhaochePermissionsService;
import com.aioveu.boot.JuhaochePermissions.model.entity.JuhaochePermissions;
import com.aioveu.boot.JuhaochePermissions.model.form.JuhaochePermissionsForm;
import com.aioveu.boot.JuhaochePermissions.model.query.JuhaochePermissionsQuery;
import com.aioveu.boot.JuhaochePermissions.model.vo.JuhaochePermissionsVO;
import com.aioveu.boot.JuhaochePermissions.converter.JuhaochePermissionsConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 权限服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:49
 */
@Service
@RequiredArgsConstructor
public class JuhaochePermissionsServiceImpl extends ServiceImpl<JuhaochePermissionsMapper, JuhaochePermissions> implements JuhaochePermissionsService {

    private final JuhaochePermissionsConverter juhaochePermissionsConverter;

    /**
    * 获取权限分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<JuhaochePermissionsVO>} 权限分页列表
    */
    @Override
    public IPage<JuhaochePermissionsVO> getJuhaochePermissionsPage(JuhaochePermissionsQuery queryParams) {
        Page<JuhaochePermissionsVO> pageVO = this.baseMapper.getJuhaochePermissionsPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取权限表单数据
     *
     * @param id 权限ID
     * @return 权限表单数据
     */
    @Override
    public JuhaochePermissionsForm getJuhaochePermissionsFormData(Long id) {
        JuhaochePermissions entity = this.getById(id);
        return juhaochePermissionsConverter.toForm(entity);
    }
    
    /**
     * 新增权限
     *
     * @param formData 权限表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveJuhaochePermissions(JuhaochePermissionsForm formData) {
        JuhaochePermissions entity = juhaochePermissionsConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新权限
     *
     * @param id   权限ID
     * @param formData 权限表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateJuhaochePermissions(Long id,JuhaochePermissionsForm formData) {
        JuhaochePermissions entity = juhaochePermissionsConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除权限
     *
     * @param ids 权限ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteJuhaochePermissionss(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的权限数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

}
