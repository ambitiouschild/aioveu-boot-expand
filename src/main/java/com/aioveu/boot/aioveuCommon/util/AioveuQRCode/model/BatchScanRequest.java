package com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model;

import lombok.Data;

import java.util.List;

@Data
public class BatchScanRequest {
    /**
     * 多个二维码内容
     */
    private List<String> qrContents;
}

