package com.aioveu.boot.aioveuCommon.util.AioveuPrint.model;


import lombok.Data;

import java.time.LocalDateTime;

/**
 * 打印状态信息
 * 创建状态模型类
 */
@Data
public class AioveuPrintStatusVO {

    /**
     * 打印任务ID
     */
    private String printId;

    /**
     * 打印状态
     */
    private AioveuPrintStatus aioveuPrintStatus;

    /**
     * 开始时间
     */
    private LocalDateTime startTime;

    /**
     * 结束时间
     */
    private LocalDateTime endTime;

    /**
     * 错误信息
     */
    private String errorMessage;

    /**
     * 打印总数
     */
    private Integer total;
}
