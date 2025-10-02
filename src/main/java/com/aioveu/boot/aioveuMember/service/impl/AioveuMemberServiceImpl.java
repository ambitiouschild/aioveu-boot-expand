package com.aioveu.boot.aioveuMember.service.impl;

import com.aioveu.boot.aioveuCommon.util.AioveuNameSetter.AioveuNameSetter;
import com.aioveu.boot.aioveuMemberLevel.service.AioveuMemberLevelService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.aioveu.boot.aioveuMember.mapper.AioveuMemberMapper;
import com.aioveu.boot.aioveuMember.service.AioveuMemberService;
import com.aioveu.boot.aioveuMember.model.entity.AioveuMember;
import com.aioveu.boot.aioveuMember.model.form.AioveuMemberForm;
import com.aioveu.boot.aioveuMember.model.query.AioveuMemberQuery;
import com.aioveu.boot.aioveuMember.model.vo.AioveuMemberVO;
import com.aioveu.boot.aioveuMember.converter.AioveuMemberConverter;

import java.util.Arrays;
import java.util.List;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 会员信息管理服务实现类
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 15:55
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AioveuMemberServiceImpl extends ServiceImpl<AioveuMemberMapper, AioveuMember> implements AioveuMemberService {

    private final AioveuMemberConverter aioveuMemberConverter;

    @Autowired
    private AioveuMemberLevelService aioveuMemberLevelService;

    /**
    * 获取会员信息管理分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuMemberVO>} 会员信息管理分页列表
    */
    @Override
    public IPage<AioveuMemberVO> getAioveuMemberPage(AioveuMemberQuery queryParams) {
        Page<AioveuMemberVO> pageVO = this.baseMapper.getAioveuMemberPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );

//        AioveuNameSetter.setNames(
//                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
//                AioveuMemberVO::getLevelId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
//                aioveuMemberLevelService::getMemberLevelMapByIds,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
//                AioveuMemberVO::setLevelName             // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
//        );

        AioveuNameSetter.setNamesByMaps(
                pageVO.getRecords(),             //1.VO列表,pageVO.getRecords(),List<T> vos，应该是List<VO>列表类型而不是单个对象
                AioveuMemberVO::getLevelId,           // 2.获取列表所有ID,Function<T, K> idGetter, 返回Long
                aioveuMemberLevelService::getMemberLevelMap,      // 3.批量查询列表名称信息,NameService<K> nameService,接受List<Long>，返回Map<Long, String>
                AioveuMemberVO::setLevelName             // 4设置列表名称,NameSetter<T> nameSetter, 接受VO和String
        );


        return pageVO;
    }
    
    /**
     * 获取会员信息管理表单数据
     *
     * @param id 会员信息管理ID
     * @return 会员信息管理表单数据
     */
    @Override
    public AioveuMemberForm getAioveuMemberFormData(Long id) {
        AioveuMember entity = this.getById(id);
        return aioveuMemberConverter.toForm(entity);
    }
    
    /**
     * 新增会员信息管理
     *
     * @param formData 会员信息管理表单对象
     * @return 是否新增成功
     */
    @Override
    public boolean saveAioveuMember(AioveuMemberForm formData) {
        AioveuMember entity = aioveuMemberConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新会员信息管理
     *
     * @param id   会员信息管理ID
     * @param formData 会员信息管理表单对象
     * @return 是否修改成功
     */
    @Override
    public boolean updateAioveuMember(Long id,AioveuMemberForm formData) {
        AioveuMember entity = aioveuMemberConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除会员信息管理
     *
     * @param ids 会员信息管理ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    @Override
    public boolean deleteAioveuMembers(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的会员信息管理数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

}
