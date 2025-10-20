package com.aioveu.boot.aioveuCommon.util.AioveuQRCode.service;


/**
 * 二维码服务接口层
 *
 * @author 可我不敌可爱
 * @since 2025/10/12
 */

public interface AioveuQRCodeService {



    String generateAndUploadQRCode(String content, int size);
}
