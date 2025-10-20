package com.aioveu.boot.aioveuCommon.util.AioveuQRCode.model;

/**
 * 返回结果对象
 */
public class GarmentCodeResult {

        private final String garmentCode;
        private final String qrCodeUrl;

        public GarmentCodeResult(String garmentCode, String qrCodeUrl) {
            this.garmentCode = garmentCode;
            this.qrCodeUrl = qrCodeUrl;
        }

        // Getters
        public String getGarmentCode() { return garmentCode; }
        public String getQrCodeUrl() { return qrCodeUrl; }


}
