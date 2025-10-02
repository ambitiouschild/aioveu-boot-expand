package com.aioveu.boot.aioveuMember.service;

import com.aioveu.boot.aioveuMember.model.entity.AioveuMember;
import com.aioveu.boot.aioveuMember.model.form.AioveuMemberForm;
import com.aioveu.boot.aioveuMember.model.query.AioveuMemberQuery;
import com.aioveu.boot.aioveuMember.model.vo.AioveuMemberVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * 会员信息管理服务类
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 15:55
 */
public interface AioveuMemberService extends IService<AioveuMember> {

    /**
     *会员信息管理分页列表
     *
     * @return {@link IPage<AioveuMemberVO>} 会员信息管理分页列表
     */
    IPage<AioveuMemberVO> getAioveuMemberPage(AioveuMemberQuery queryParams);

    /**
     * 获取会员信息管理表单数据
     *
     * @param id 会员信息管理ID
     * @return 会员信息管理表单数据
     */
     AioveuMemberForm getAioveuMemberFormData(Long id);

    /**
     * 新增会员信息管理
     *
     * @param formData 会员信息管理表单对象
     * @return 是否新增成功
     */
    boolean saveAioveuMember(AioveuMemberForm formData);

    /**
     * 修改会员信息管理
     *
     * @param id   会员信息管理ID
     * @param formData 会员信息管理表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuMember(Long id, AioveuMemberForm formData);

    /**
     * 删除会员信息管理
     *
     * @param ids 会员信息管理ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuMembers(String ids);


    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter  // 无参，全查
     */
    Map<Long, String> getMemberNoMap();

}
