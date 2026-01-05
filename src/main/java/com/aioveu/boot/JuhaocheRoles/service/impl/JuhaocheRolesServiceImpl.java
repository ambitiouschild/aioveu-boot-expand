package com.aioveu.boot.JuhaocheRoles.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import jakarta.persistence.Cacheable;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.JuhaocheRoles.mapper.JuhaocheRolesMapper;
import com.aioveu.boot.JuhaocheRoles.service.JuhaocheRolesService;
import com.aioveu.boot.JuhaocheRoles.model.entity.JuhaocheRoles;
import com.aioveu.boot.JuhaocheRoles.model.form.JuhaocheRolesForm;
import com.aioveu.boot.JuhaocheRoles.model.query.JuhaocheRolesQuery;
import com.aioveu.boot.JuhaocheRoles.model.vo.JuhaocheRolesVO;
import com.aioveu.boot.JuhaocheRoles.converter.JuhaocheRolesConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 角色服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:48
 */
@Service
@RequiredArgsConstructor
public class JuhaocheRolesServiceImpl extends ServiceImpl<JuhaocheRolesMapper, JuhaocheRoles> implements JuhaocheRolesService {

    private final JuhaocheRolesConverter juhaocheRolesConverter;

    /**
    * 获取角色分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<JuhaocheRolesVO>} 角色分页列表
    */
    @Override
    public IPage<JuhaocheRolesVO> getJuhaocheRolesPage(JuhaocheRolesQuery queryParams) {
        Page<JuhaocheRolesVO> pageVO = this.baseMapper.getJuhaocheRolesPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取角色表单数据
     *
     * @param id 角色ID
     * @return 角色表单数据
     */
    @Override
    public JuhaocheRolesForm getJuhaocheRolesFormData(Long id) {
        JuhaocheRoles entity = this.getById(id);
        return juhaocheRolesConverter.toForm(entity);
    }
    
    /**
     * 新增角色
     *
     * @param formData 角色表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveJuhaocheRoles(JuhaocheRolesForm formData) {
        JuhaocheRoles entity = juhaocheRolesConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新角色
     *
     * @param id   角色ID
     * @param formData 角色表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateJuhaocheRoles(Long id,JuhaocheRolesForm formData) {
        JuhaocheRoles entity = juhaocheRolesConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除角色
     *
     * @param ids 角色ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteJuhaocheRoless(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的角色数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }


    /**
     * 根据角色编码查询角色信息（带缓存）
     */
    @Override
    public JuhaocheRoles getByCode(String code) {

        // 方式1：使用自定义SQL（推荐，性能更好）
        // return baseMapper.selectByCode(code);

        // 方式2：使用LambdaQueryWrapper（更灵活）
        LambdaQueryWrapper<JuhaocheRoles> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(JuhaocheRoles::getCode, code)
                .eq(JuhaocheRoles::getIsDel, 0);  // 默认查询启用的角色

        return getOne(queryWrapper);
    }

}
