package com.aioveu.boot; // 与主包相同

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@TestConfiguration
@ComponentScan(basePackages = "com.aioveu.boot")  //需要启动整个Spring Boot应用
public class TestConfig {
}
