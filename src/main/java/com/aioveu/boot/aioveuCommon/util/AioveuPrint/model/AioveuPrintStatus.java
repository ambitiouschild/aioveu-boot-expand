package com.aioveu.boot.aioveuCommon.util.AioveuPrint.model;


/**
 * 打印状态枚举
 * 定义所有可能的打印状态值
 */
public enum AioveuPrintStatus {
    // 任务已创建，等待处理
    PENDING,    // 等待中

    // 正在生成打印内容
    GENERATING, // 处理中

    // 打印内容已生成，可预览
    GENERATED,


    // 用户已发送打印指令
    PRINTING,


    // 正在打印
    PROCESSING, // 处理中

    // 打印成功完成
    COMPLETED,  // 已完成

    // 打印失败
    FAILED ,     // 失败

    // 任务已取消
    CANCELLED    // 取消

}
