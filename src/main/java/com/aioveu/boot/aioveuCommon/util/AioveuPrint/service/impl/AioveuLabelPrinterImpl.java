package com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.impl;


/*
水洗唛打印机接口实现
 */

import com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.AioveuPrinter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class AioveuLabelPrinterImpl implements AioveuPrinter {

    @Override
    public void print(String content) {
        // 实现标签打印逻辑
        log.info("打印水洗唛内容: {}", content);
        // 实际调用标签打印机API
    }
}
