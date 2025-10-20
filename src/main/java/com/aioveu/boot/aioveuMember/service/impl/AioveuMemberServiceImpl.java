package com.aioveu.boot.aioveuMember.service.impl;

import com.aioveu.boot.aioveuCommon.util.AioveuNameSetter.AioveuNameSetter;
import com.aioveu.boot.aioveuCommon.util.NumberGenerator.NoGenerator;
import com.aioveu.boot.aioveuMember.model.vo.AioveuMemberOptionVO;
import com.aioveu.boot.aioveuMemberLevel.service.AioveuMemberLevelService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
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

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import org.springframework.util.CollectionUtils;

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

    // 通过依赖注入获取NoGenerator
    @Autowired
    private NoGenerator noGenerator;

    /**
    * 获取会员信息管理分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AioveuMemberVO>} 会员信息管理分页列表
    */
    @Override
    public IPage<AioveuMemberVO> getAioveuMemberPage(AioveuMemberQuery queryParams) {

        Page<AioveuMemberVO> page = new Page<>(queryParams.getPageNum(), queryParams.getPageSize());
        page.addOrder(OrderItem.desc("update_time"));  // ✅ 在查询前设置排序

        Page<AioveuMemberVO> pageVO = this.baseMapper.getAioveuMemberPage(
                page,
                queryParams
        );

//        AioveuNameSetter.setNamesByIds(
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


        // 1.如果单号为空，则生成
        if (StrUtil.isBlank(formData.getMemberNo())) {

            String newMemberNo = noGenerator.generateMemberNo();//单号生成器方法保持一致
            formData.setMemberNo(newMemberNo);
            log.info("生成的newMemberNo: " +  newMemberNo);

        }

        // 2.无论单号是生成的还是用户提供的，都要检查是否重复。
        LambdaQueryWrapper<AioveuMember> wrapper = new LambdaQueryWrapper<>();
        // 正确调用：传递 formData 参数
        wrapper.eq(AioveuMember::getMemberNo, formData.getMemberNo());

        //3.如果重复，则重新生成（如果是用户提供的，可能需要提示用户，但根据业务逻辑，这里选择重新生成）。
        while (this.count(wrapper) > 0) {
            // 重新生成单号
            String againMemberNo = noGenerator.generateMemberNo();//单号生成器方法保持一致
            formData.setMemberNo(againMemberNo);
            log.info("生成的againMemberNo: " +  againMemberNo);

            //4.重新生成后，再次检查，直到不重复为止（或者设置最大重试次数）。
            // 更新查询条件，检查新生成的单号
            wrapper.clear();
            wrapper.eq(AioveuMember::getMemberNo, formData.getMemberNo());
        }

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

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter  无参数
     */
    @Override
    public Map<Long, String> getMemberNoMap() {

        // 1.批量查询信息
//        List<AioveuMemberLevel> memberLevels = this.list();

        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuMember> memberNos = lambdaQuery()
                .select(AioveuMember::getId, AioveuMember::getMemberNo)
                .list();

        // 2.转换为Map: key=ID, value=名称
        return memberNos.stream()
                .collect(Collectors.toMap(
                        AioveuMember::getId,
                        AioveuMember::getMemberNo
                ));
    }

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter 会员姓名 // 全参
     */
    @Override
    public Map<Long, String> getMemberNameMap() {

        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuMember> names = lambdaQuery()
                .select(AioveuMember::getId, AioveuMember::getName)
                .list();

        // 2.转换为Map: key=ID, value=名称
        return names.stream()
                .collect(Collectors.toMap(
                        AioveuMember::getId,
                        AioveuMember::getName
                ));
    }

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter 会员手机号 // 全参
     */
    @Override
    public Map<Long, String> getMemberPhoneMap(){
        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuMember> memberPhones = lambdaQuery()
                .select(AioveuMember::getId, AioveuMember::getPhone)
                .list();

        // 2.转换为Map: key=ID, value=名称
        return memberPhones.stream()
                .collect(Collectors.toMap(
                        AioveuMember::getId,
                        AioveuMember::getPhone
                ));

    }

    /**
     * 获取所有会员卡号列表（用于下拉选择框）
     *
     * @return 会员卡号选项列表
     */
    @Override
    public List<AioveuMemberOptionVO> getAllMemberNoOptions() {
        // 1.使用 LambdaQueryWrapper，编译时安全
        List<AioveuMember> members = lambdaQuery()
                .select(AioveuMember::getId, AioveuMember::getMemberNo)
                .list();

        // 2.转换为选项对象
        List<AioveuMemberOptionVO>  aioveuMemberOptionVO  = members.stream()
                .map(member -> new AioveuMemberOptionVO(member.getId(), member.getMemberNo()))
                .collect(Collectors.toList());

        return aioveuMemberOptionVO;

    }



    /**
     * 批量查询会员信息
     */
    @Override
    public Map<Long, AioveuMember> getMembersByIds(Set<Long> memberIds) {
        if (CollectionUtils.isEmpty(memberIds)) {
            return Collections.emptyMap();
        }

        LambdaQueryWrapper<AioveuMember> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(AioveuMember::getId, memberIds)
                .select(
                        AioveuMember::getId,
                        AioveuMember::getMemberNo,
                        AioveuMember::getName,
                        AioveuMember::getPhone
                );

        List<AioveuMember> members = this.list(wrapper);
        return members.stream()
                .collect(Collectors.toMap(AioveuMember::getId, Function.identity()));
    }

}
