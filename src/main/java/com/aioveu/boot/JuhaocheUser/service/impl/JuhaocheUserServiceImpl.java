package com.aioveu.boot.JuhaocheUser.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.JuhaocheUser.mapper.JuhaocheUserMapper;
import com.aioveu.boot.JuhaocheUser.service.JuhaocheUserService;
import com.aioveu.boot.JuhaocheUser.model.entity.JuhaocheUser;
import com.aioveu.boot.JuhaocheUser.model.form.JuhaocheUserForm;
import com.aioveu.boot.JuhaocheUser.model.query.JuhaocheUserQuery;
import com.aioveu.boot.JuhaocheUser.model.vo.JuhaocheUserVO;
import com.aioveu.boot.JuhaocheUser.converter.JuhaocheUserConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import org.springframework.util.StringUtils;

import static com.aioveu.boot.aioveuCommon.util.PhoneNumberUtils.PhoneNumberUtils.cleanPhoneNumber;

/**
 * 用户服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:45
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class JuhaocheUserServiceImpl extends ServiceImpl<JuhaocheUserMapper, JuhaocheUser> implements JuhaocheUserService {

    private final JuhaocheUserConverter juhaocheUserConverter;

    /**
    * 获取用户分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<JuhaocheUserVO>} 用户分页列表
    */
    @Override
    public IPage<JuhaocheUserVO> getJuhaocheUserPage(JuhaocheUserQuery queryParams) {
        Page<JuhaocheUserVO> pageVO = this.baseMapper.getJuhaocheUserPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取用户表单数据
     *
     * @param id 用户ID
     * @return 用户表单数据
     */
    @Override
    public JuhaocheUserForm getJuhaocheUserFormData(Long id) {
        JuhaocheUser entity = this.getById(id);
        return juhaocheUserConverter.toForm(entity);
    }
    
    /**
     * 新增用户
     *
     * @param formData 用户表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveJuhaocheUser(JuhaocheUserForm formData) {
        JuhaocheUser entity = juhaocheUserConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新用户
     *
     * @param id   用户ID
     * @param formData 用户表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateJuhaocheUser(Long id,JuhaocheUserForm formData) {
        JuhaocheUser entity = juhaocheUserConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除用户
     *
     * @param ids 用户ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteJuhaocheUsers(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的用户数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

    /**
     * 根据手机号查询用户信息
     */
    @Override
    public JuhaocheUser getByPhone(String phone) {
        if (!StringUtils.hasText(phone)) {
            log.warn("手机号不能为空");
            return null;
        }

        try {
            // 清理手机号格式
            String cleanedPhone = cleanPhoneNumber(phone);
            if (cleanedPhone == null) {
                log.warn("手机号格式不正确: phone={}", phone);
                return null;
            }

            LambdaQueryWrapper<JuhaocheUser> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(JuhaocheUser::getPhone, cleanedPhone);

//            // 如果不包含已删除用户，添加删除条件
//            if (!includeDeleted) {
//                queryWrapper.eq(JuhaocheUser::getIsDel, 0);
//            }

            JuhaocheUser user = getOne(queryWrapper);

            if (user == null) {
                log.debug("用户不存在: phone={}", cleanedPhone);
            } else {
                log.debug("查询用户成功: phone={}, userId={}, name={}",
                        cleanedPhone, user.getUserId(), user.getName());
            }

            return user;

        } catch (Exception e) {
            log.error("根据手机号查询用户异常: phone={}", phone, e);
            return null;
        }
    }
}
