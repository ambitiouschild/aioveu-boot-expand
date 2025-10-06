package com.aioveu.boot;

import com.aioveu.boot.aioveuCommon.util.AioveuEntityUniqueValidator.AioveuEntityUniqueValidator;
import com.aioveu.boot.aioveuMemberAccount.model.entity.AioveuMemberAccount;
import com.aioveu.boot.aioveuMemberAccount.model.form.AioveuMemberAccountForm;
import com.aioveu.boot.aioveuMemberAccount.service.AioveuMemberAccountService;
import com.aioveu.boot.common.exception.BusinessException;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.sl.usermodel.ObjectMetaData;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
//import javax.persistence.EntityManager;

//坚持使用 @SpringBootTest注解，完全可以使用标准的 JPA EntityManager来操作数据库
@Slf4j
@SpringBootTest(classes = {AioveuBootApplication.class, TestConfig.class})
@ContextConfiguration(classes = TestConfig.class) // 添加这个注解
@Transactional // 测试结束后回滚事务
@EntityScan("com.aioveu.boot.aioveuMemberAccount.model.entity")
//在测试配置类中添加实体扫描
public class AioveuEntityUniqueValidatorTest {

    //使用Mockito模拟服务（适用于单元测试，不需要真实的数据库交互）
    @MockBean
    private AioveuMemberAccountService aioveuMemberAccountService;


    //使用Spring的依赖注入（适用于集成测试，需要真实的数据库交互）
    //如果你需要测试真实数据库行为，应该使用集成测试而不是单元测试
    @Autowired
    private AioveuMemberAccountService aioveuMemberAccountService2;

    // 使用标准的 JPA EntityManager
    @PersistenceContext
    private EntityManager entityManager;


    //验证字符串类型字段的唯一性
    // 创建会员账户      //测试方法不应该有参数。JUnit测试方法应该是无参的。所以我们需要在测试方法内部构建AioveuMemberAccountForm对象
    @Test
    public void testValidateUniqueForCreate_Success() {
        // 1. 准备测试数据
        AioveuMemberAccountForm form = new AioveuMemberAccountForm();
        form.setMemberId(100L); // 假设会员ID为100

        // 2. 模拟服务行为：当查询时返回0，表示不存在重复
        when(aioveuMemberAccountService.count(any(LambdaQueryWrapper.class))).thenReturn(0L);

        // 3. 调用验证方法（期望没有异常抛出）
        AioveuEntityUniqueValidator.validateUniqueForCreate(
                form,
                AioveuMemberAccountForm::getMemberId, // 获取账户号
                AioveuMemberAccount::getMemberId,    // 实体字段
                aioveuMemberAccountService,
                "会员账户",
                "账户号"
        );

        // 4. 验证模拟服务被调用
        verify(aioveuMemberAccountService, times(1)).count(any(LambdaQueryWrapper.class));

        // 继续创建逻辑...
    }

    @Test
    public void testValidateUniqueForCreate_Failure() {
        // 1. 准备测试数据
        AioveuMemberAccountForm form = new AioveuMemberAccountForm();
        form.setMemberId(1L); // 假设会员ID为1

        // 2. 模拟服务行为：返回1表示已有重复记录
        //在单元测试中，我们使用 Mockito 模拟了 aioveuMemberAccountService的行为
        //完全控制返回值：通过 when(...).thenReturn(...)我们直接指定了服务返回的值
        //隔离测试：测试只关注验证方法的逻辑，不依赖外部系统（如数据库）
        when(aioveuMemberAccountService.count(any(LambdaQueryWrapper.class))).thenReturn(1L);

        // 3. 验证会抛出异常
        BusinessException exception = assertThrows(BusinessException.class, () -> {
            AioveuEntityUniqueValidator.validateUniqueForCreate(
                    form,
                    AioveuMemberAccountForm::getMemberId,
                    AioveuMemberAccount::getMemberId,
                    aioveuMemberAccountService,
                    "会员账户",
                    "会员ID"
            );
        });

        // 4. 验证异常消息
        assertEquals("会员账户的会员ID[1]已存在", exception.getMessage());

        // 5. 验证服务被调用
        verify(aioveuMemberAccountService, times(1)).count(any(LambdaQueryWrapper.class));
    }

    //方案一：使用纯单元测试（不涉及数据库）
    @Test
    public void testValidateUniqueForUpdate_Success_Mocked() {
        // 1. 准备测试数据
        AioveuMemberAccount existingAccount = new AioveuMemberAccount();
        existingAccount.setId(1L);
        existingAccount.setMemberId(100L);

        // 2. 模拟服务行为
        when(aioveuMemberAccountService.getById(existingAccount.getId())).thenReturn(existingAccount);
        when(aioveuMemberAccountService.count(any())).thenReturn(0L);

        // 3. 准备更新表单
        AioveuMemberAccountForm form = new AioveuMemberAccountForm();
        form.setId(existingAccount.getId());
        form.setMemberId(100L);

        // 4. 调用验证方法
        assertDoesNotThrow(() -> {
            AioveuEntityUniqueValidator.validateUniqueForUpdate(
                    form,
                    AioveuMemberAccountForm::getMemberId,
                    AioveuMemberAccount::getMemberId,
                    AioveuMemberAccountForm::getId,
                    AioveuMemberAccount::getId,
                    aioveuMemberAccountService,
                    "会员账户",
                    "会员ID"
            );
        });
    }




    /*
        方案二：使用内存数据库替代品
        1.使用 H2 内存数据库（最简单）
        2.使用 HSQLDB：
        3.使用 SQLite

        为什么我推荐配置 H2 内存数据库？
            1.零配置：
            只需添加依赖和几行配置
            不需要安装任何软件
            2.快速启动：
            内存数据库启动速度快
            适合测试环境
            3.隔离性好：
            每个测试有自己的数据库实例
            测试之间不会相互影响
            4.自动清理：
            测试结束后自动销毁数据库
            不会留下任何痕迹

        是的，在集成测试中，如果你要使用真实的数据库操作（如通过EntityManager进行持久化），
        那么必须配置一个数据库。否则，当测试尝试访问数据库时，会因为没有数据源配置而失败。
        在你的测试中，你使用了EntityManager来保存实体（entityManager.persist(existingAccount);），
        这需要连接到一个真实的数据库。如果你没有配置任何数据库，Spring Boot会尝试配置一个内存数据库（如H2），
        但前提是你已经添加了H2依赖。如果你没有添加内存数据库依赖，也没有配置外部数据库，那么测试就会失败。
        是的，在集成测试中必须配置测试数据库，特别是当你使用 EntityManager进行数据库操作时。
        如果不配置，你会遇到各种错误，包括你当前的 "Unable to locate persister" 错误。

        为什么必须配置测试数据库？
            1.数据库连接是必需的：
                当你使用 EntityManager.persist()时，需要实际的数据库连接
                没有数据库配置，Hibernate 无法执行任何数据库操作
            2.表结构需要创建：
                Hibernate 需要根据实体类创建表结构
                没有数据库，无法创建表结构
            3.事务管理需要数据库：
                @Transactional注解需要数据库事务支持
                没有数据库，事务管理无法工作
            4.实体映射验证需要数据库：
                Hibernate 在运行时验证实体映射
                没有数据库，无法完成验证
     */


    @Test
    @Transactional  //测试时必须启动测试配置的测试数据库
    public void testValidateUniqueForUpdate_Success() {
        // 1. 创建测试数据
        AioveuMemberAccount existingAccount = new AioveuMemberAccount();
        existingAccount.setMemberId(100L);


        // 使用 entityManager  保存实体
         entityManager.persist(existingAccount);
         entityManager.flush(); // 确保立即写入数据库

        //查询实体
//        AioveuMemberAccount foundAccount = entityManager.find(AioveuMemberAccount.class, existingAccount.getId());

        //更新实体
//        existingAccount.setMemberId(200L);
//        entityManager.merge(existingAccount);
//        entityManager.flush();


        // 删除实体
//        entityManager.remove(existingAccount);
//        entityManager.flush();


        // 2. 准备更新表单
        AioveuMemberAccountForm form = new AioveuMemberAccountForm();
        form.setId(existingAccount.getId()); // 设置ID用于排除自身
        form.setMemberId(100L); // 与现有记录相同

        // 3. 调用验证方法
        AioveuEntityUniqueValidator.validateUniqueForUpdate(
                form,
                AioveuMemberAccountForm::getMemberId,
                AioveuMemberAccount::getMemberId,
                AioveuMemberAccountForm::getId,
                AioveuMemberAccount::getId,
                aioveuMemberAccountService,
                "会员账户",
                "会员ID"
        );

        // 4. 验证通过（没有抛出异常）
        // 4. 验证模拟服务被调用
        verify(aioveuMemberAccountService, times(1)).count(any(LambdaQueryWrapper.class));
    }

    @Test
    @Transactional
    public void testValidateUniqueForUpdate_Failure() {
        // 1. 创建两个测试数据
        AioveuMemberAccount account1 = new AioveuMemberAccount();
        account1.setMemberId(100L);
        entityManager.persist(account1);
        entityManager.flush();

        AioveuMemberAccount account2 = new AioveuMemberAccount();
        account2.setMemberId(200L);
        entityManager.persist(account2);
        entityManager.flush();

        // 2. 准备更新表单（尝试将account2的会员ID改为100）
        AioveuMemberAccountForm form = new AioveuMemberAccountForm();
        form.setId(account2.getId());
        form.setMemberId(100L); // 与account1冲突

        // 3. 验证会抛出异常
        BusinessException exception = assertThrows(BusinessException.class, () -> {
            AioveuEntityUniqueValidator.validateUniqueForUpdate(
                    form,
                    AioveuMemberAccountForm::getMemberId,
                    AioveuMemberAccount::getMemberId,
                    AioveuMemberAccountForm::getId,
                    AioveuMemberAccount::getId,
                    aioveuMemberAccountService,
                    "会员账户",
                    "会员ID"
            );
        });

        // 4. 验证异常消息
        assertEquals("会员账户的会员ID[100]已存在", exception.getMessage());
    }
//}
//
//    //验证数字类型字段的唯一性
//
//    @Test
//    // 验证会员ID的唯一性
//    public void validateMemberId(Long memberId) {
//        // 创建临时表单对象
//        AioveuMemberAccountForm tempForm = new AioveuMemberAccountForm();
//        tempForm.setMemberId(memberId);
//
//        AioveuEntityUniqueValidator.validateUniqueForCreate(
//                tempForm,
//                AioveuMemberAccountForm::getMemberId, // 获取会员ID
//                AioveuMemberAccount::getMemberId,     // 实体字段
//                null, // 不需要排除自身
//                accountService,
//                "会员账户",
//                "会员ID"
//        );
//    }
//
//    //验证其他类型字段的唯一性
//
//    @Test
//    // 验证邮箱的唯一性
//    public void validateEmail(String email) {
//        // 创建临时表单对象
//        UserForm tempForm = new UserForm();
//        tempForm.setEmail(email);
//
//        AioveuEntityUniqueValidator.validateUniqueForCreate(
//                tempForm,
//                UserForm::getEmail,   // 获取邮箱
//                User::getEmail,       // 实体字段
//                null, // 不需要排除自身
//                userService,
//                "用户",
//                "邮箱"
//        );
//    }

}
