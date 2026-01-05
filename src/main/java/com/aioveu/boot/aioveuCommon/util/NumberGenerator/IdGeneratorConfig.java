package com.aioveu.boot.aioveuCommon.util.NumberGenerator;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//配置类

@Configuration
public class IdGeneratorConfig {

    /**
     * 配置ID生成器
     */
    @Bean
    public IdGenerator idGenerator() {
        return new IdGenerator();
    }

    @Bean
    public RedisIdGenerator redisIdGenerator() {
        return new RedisIdGenerator();
    }
}
