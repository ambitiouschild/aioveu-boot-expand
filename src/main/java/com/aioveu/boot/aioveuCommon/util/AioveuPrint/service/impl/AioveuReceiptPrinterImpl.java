package com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.impl;

/*
小票收据打印机接口的实现
 */

import com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.AioveuPrinter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class AioveuReceiptPrinterImpl implements AioveuPrinter {

    @Override
    public void print(String content) {

        // 实际调用小票打印机API
        log.info("调用小票打印机打印内容");

        // 实现小票打印逻辑
        log.info("打印小票内容: {}", content);
        // 实际调用小票打印机API
    }
}
