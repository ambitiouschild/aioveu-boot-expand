package com.aioveu.boot;

import com.aioveu.boot.aioveuCommon.util.NumberGenerator.NoGenerator;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@Slf4j
@SpringBootTest
@ContextConfiguration(classes = TestConfig.class) // 添加这个注解

public class NoGeneratorTest {


    @Test
    public void testNoGeneratorBeanExists() {
            //实例化
            NoGenerator noGenerator = new NoGenerator();

            String newNo = noGenerator.generateRechargeNo();
            log.info("生成的新RechargeNo" +  newNo);
    }
}
