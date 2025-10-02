package com.aioveu.boot.aioveuMemberLevel.service.impl;

import com.aioveu.boot.aioveuCommon.util.NameMappingService.NameMappingService;
import com.aioveu.boot.aioveuMember.model.entity.AioveuMember;
import com.aioveu.boot.aioveuMemberLevel.model.vo.AioveuMemberLevelOptionsVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuMemberLevel.mapper.AioveuMemberLevelMapper;
import com.aioveu.boot.aioveuMemberLevel.service.AioveuMemberLevelService;
import com.aioveu.boot.aioveuMemberLevel.model.entity.AioveuMemberLevel;
import com.aioveu.boot.aioveuMemberLevel.model.form.AioveuMemberLevelForm;
import com.aioveu.boot.aioveuMemberLevel.model.query.AioveuMemberLevelQuery;
import com.aioveu.boot.aioveuMemberLevel.model.vo.AioveuMemberLevelVO;
import com.aioveu.boot.aioveuMemberLevel.converter.AioveuMemberLevelConverter;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 会员等级服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 14:52
 */
@Service
@RequiredArgsConstructor
public class AioveuMemberLevelServiceImpl extends ServiceImpl<AioveuMemberLevelMapper, AioveuMemberLevel> implements AioveuMemberLevelService {

    private final AioveuMemberLevelConverter aioveuMemberLevelConverter;

    /**
    * 获取会员等级分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuMemberLevelVO>} 会员等级分页列表
    */
    @Override
    public IPage<AioveuMemberLevelVO> getAioveuMemberLevelPage(AioveuMemberLevelQuery queryParams) {
        Page<AioveuMemberLevelVO> pageVO = this.baseMapper.getAioveuMemberLevelPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取会员等级表单数据
     *
     * @param id 会员等级ID
     * @return 会员等级表单数据
     */
    @Override
    public AioveuMemberLevelForm getAioveuMemberLevelFormData(Long id) {
        AioveuMemberLevel entity = this.getById(id);
        return aioveuMemberLevelConverter.toForm(entity);
    }
    
    /**
     * 新增会员等级
     *
     * @param formData 会员等级表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuMemberLevel(AioveuMemberLevelForm formData) {
        AioveuMemberLevel entity = aioveuMemberLevelConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新会员等级
     *
     * @param id   会员等级ID
     * @param formData 会员等级表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuMemberLevel(Long id,AioveuMemberLevelForm formData) {
        AioveuMemberLevel entity = aioveuMemberLevelConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除会员等级
     *
     * @param ids 会员等级ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuMemberLevels(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的会员等级数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter 有参构造，实体类id
     */
    @Override
    public Map<Long, String> getMemberLevelMapByIds(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return Map.of();
        }

        // 1.批量查询信息
//        List<AioveuMemberLevel> memberLevels = this.listByIds(ids);

         // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuMemberLevel> memberLevels = lambdaQuery()
                .select(AioveuMemberLevel::getId, AioveuMemberLevel::getLevelName)
                .in(AioveuMemberLevel::getId, ids)
                .list();

        // 2.转换为Map: key=ID, value=名称
        return memberLevels.stream()
                .collect(Collectors.toMap(
                        AioveuMemberLevel::getId,
                        AioveuMemberLevel::getLevelName
                ));
    }

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter 无参数
     */
    @Override
    public Map<Long, String> getMemberLevelMap() {
        // 1.批量查询信息
//        List<AioveuMemberLevel> memberLevels = this.list();

        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuMemberLevel> memberLevels = lambdaQuery()
                .select(AioveuMemberLevel::getId, AioveuMemberLevel::getLevelName)
                .list();

        // 2.转换为Map: key=ID, value=名称
        return memberLevels.stream()
                .collect(Collectors.toMap(
                        AioveuMemberLevel::getId,
                        AioveuMemberLevel::getLevelName
                ));
    }

    /**
     * 获取所有会员等级列表（用于下拉选择框） @AllArgsConstructor // 全参构造
     *
     * @return 部门选项列表
     */
    @Override
    public List<AioveuMemberLevelOptionsVO> getAllMemberLevelsOptions() {
//        // 1.查询所有部门
//        List<AioveuMemberLevel> memberLevels = this.list();

        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuMemberLevel> memberLevels = lambdaQuery()
                .select(AioveuMemberLevel::getId, AioveuMemberLevel::getLevelName)
                .list();


        // 2.转换为选项对象
        List<AioveuMemberLevelOptionsVO>  memberLevelVO  = memberLevels.stream()
                .map(memberLevel -> new AioveuMemberLevelOptionsVO(memberLevel.getId(), memberLevel.getLevelName()))
                .collect(Collectors.toList());

        return memberLevelVO;
    }

    /**
     * 获取所有会员等级列表（用于下拉选择框） // 无参构造 使用 Setter 初始化（不修改 VO 类）
     *
     * @return 会员等级选项列表
     */
    @Override
    public List<AioveuMemberLevelOptionsVO> getAllMemberLevelsOptions2() {
        return this.list().stream()
                .map(memberLevel -> {
                    AioveuMemberLevelOptionsVO vo = new AioveuMemberLevelOptionsVO();
                    vo.setId(memberLevel.getId());   //使用 Setter 初始化（不修改 VO 类）
                    vo.setLevelName(memberLevel.getLevelName());  //使用 Setter 初始化（不修改 VO 类）
                    return vo;
                })
                .collect(Collectors.toList());
    }

}
