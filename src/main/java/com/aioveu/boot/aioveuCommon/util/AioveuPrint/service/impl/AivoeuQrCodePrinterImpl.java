package com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.impl;


import com.aioveu.boot.aioveuCommon.util.AioveuPrint.service.AioveuPrinter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class AivoeuQrCodePrinterImpl implements AioveuPrinter {

    @Override
    public void print(String content) {
        // 实际调用二维码打印机API
        log.info("调用二维码打印机打印内容");
    }

}
