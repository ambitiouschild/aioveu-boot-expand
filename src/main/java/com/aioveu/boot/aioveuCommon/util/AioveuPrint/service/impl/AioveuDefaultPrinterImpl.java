package com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.impl;


import com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.AioveuPrinter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class AioveuDefaultPrinterImpl implements AioveuPrinter {

    @Override
    public void print(String content) {
        // 默认打印机逻辑
        log.info("调用默认打印机打印内容");
    }
}
