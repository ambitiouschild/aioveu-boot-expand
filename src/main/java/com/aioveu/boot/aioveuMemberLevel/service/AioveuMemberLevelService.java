package com.aioveu.boot.aioveuMemberLevel.service;

import com.aioveu.boot.aioveuMember.model.entity.AioveuMember;
import com.aioveu.boot.aioveuMemberLevel.model.entity.AioveuMemberLevel;
import com.aioveu.boot.aioveuMemberLevel.model.form.AioveuMemberLevelForm;
import com.aioveu.boot.aioveuMemberLevel.model.query.AioveuMemberLevelQuery;
import com.aioveu.boot.aioveuMemberLevel.model.vo.AioveuMemberLevelOptionsVO;
import com.aioveu.boot.aioveuMemberLevel.model.vo.AioveuMemberLevelVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 会员等级服务类
 *
 * @author 可我不敌可爱
 * @since 2025-09-27 14:52
 */
public interface AioveuMemberLevelService extends IService<AioveuMemberLevel> {

    /**
     *会员等级分页列表
     *
     * @return {@link IPage<AioveuMemberLevelVO>} 会员等级分页列表
     */
    IPage<AioveuMemberLevelVO> getAioveuMemberLevelPage(AioveuMemberLevelQuery queryParams);

    /**
     * 获取会员等级表单数据
     *
     * @param id 会员等级ID
     * @return 会员等级表单数据
     */
     AioveuMemberLevelForm getAioveuMemberLevelFormData(Long id);

    /**
     * 新增会员等级
     *
     * @param formData 会员等级表单对象
     * @return 是否新增成功
     */
    boolean saveAioveuMemberLevel(AioveuMemberLevelForm formData);

    /**
     * 修改会员等级
     *
     * @param id   会员等级ID
     * @param formData 会员等级表单对象
     * @return 是否修改成功
     */
    boolean updateAioveuMemberLevel(Long id, AioveuMemberLevelForm formData);

    /**
     * 删除会员等级
     *
     * @param ids 会员等级ID，多个以英文逗号(,)分割
     * @return 是否删除成功
     */
    boolean deleteAioveuMemberLevels(String ids);

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter
     */

    Map<Long, String> getMemberLevelMapByIds(List<Long> ids);

    /**
     * 批量获取映射信息（新增方法）用于AioveuNameSetter
     */

    Map<Long, String> getMemberLevelMap();


    /**
     * 获取所有会员等级列表（用于下拉选择框） @AllArgsConstructor // 全参构造
     *
     * @return 会员等级选项列表
     */
    List<AioveuMemberLevelOptionsVO> getAllMemberLevelsOptions();

    /**
     * 获取所有会员等级列表（用于下拉选择框） // 无参构造 使用 Setter 初始化（不修改 VO 类）
     *
     * @return 会员等级选项列表
     */
    List<AioveuMemberLevelOptionsVO> getAllMemberLevelsOptions2();

}
