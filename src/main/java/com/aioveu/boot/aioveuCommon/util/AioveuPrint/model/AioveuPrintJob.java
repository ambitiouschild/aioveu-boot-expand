package com.aioveu.boot.aioveuCommon.util.AioveuPrint.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 打印任务类
 *  定义自定义的 PrintJob 类
 */

@Setter
@Getter
@NoArgsConstructor // 无参构造  某些框架（如 Jackson 反序列化、Hibernate）依赖无参构造函数
//添加 Lombok 注解（推荐）
@AllArgsConstructor // 添加这行注解 // 全参构造  如果添加了带参构造，编译器不再生成默认无参构造，需显式添加
public class AioveuPrintJob {

    private  String printId;
    private  List<String> qrCodes;
    private  AioveuPrintRequest request;
    private AioveuPrintStatus status;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private String htmlContent;
    private String errorMessage;

    private String filePath; // 临时文件路径

    private Integer total;

    // 添加构造函数
    public AioveuPrintJob(String printId, List<String> qrCodes, AioveuPrintRequest request) {
        this.printId = printId;
        this.qrCodes = qrCodes;
        this.request = request;
    }

}
