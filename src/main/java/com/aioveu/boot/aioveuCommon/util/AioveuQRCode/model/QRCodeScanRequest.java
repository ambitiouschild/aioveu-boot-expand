package com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model;

import lombok.Data;

import java.util.List;
@Data
public class QRCodeScanRequest {

    /**
     * 二维码内容 （衣物唯一编码）
     */
    private String qrContent;

    /**
     * 扫描者ID（操作员）
     */
    private String scannerId;

    /**
     * 设备信息
     */
    private String deviceInfo;

//    /**
//     * 扫描位置
//     */
//    private String location;
}


