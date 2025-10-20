//package com.aioveu.boot.aioveu_laundry_garment_identity111;
//
//public class cc {
//
//    //生成衣物编码接口
//    @PostMapping("/garments/generate-code")
//    public Response generateGarmentCode(@RequestBody GarmentGenerateRequest request) {
//        // 为每件衣物生成唯一编码
//        for (int i = 0; i < request.getQuantity(); i++) {
//            String garmentCode = UUID.randomUUID().toString();
//            //编码格式：采用UUID v4生成36位唯一字符串
//            //生成技术​：
//            //
//            //使用ZXing库生成QR Code
//            //
//            //存储为PNG格式，分辨率300dpi
//            //
//            //文件命名：/qr_codes/{date}/{uuid}.png
//            // 生成二维码并存储
//            String qrPath = qrCodeService.generateQRCode(garmentCode);
//            garmentIdentityService.createIdentity(garmentCode,
//                    request.getOrderDetailId(), qrPath);
//        }
//        // 更新订单明细状态
//        orderDetailService.updateStatus(request.getOrderDetailId(), GarmentStatus.RECEIVED);
//    }
//
//    //扫码操作接口
//
//    @PostMapping("/garments/scan-operation")
//    public Response handleScanOperation(@RequestBody ScanOperationRequest request) {
//        // 验证衣物编码有效性
//        GarmentIdentity identity = identityService.getByIdentityCode(request.getGarmentCode());
//
//        // 状态机校验
//        statusMachineService.validateTransition(identity.getCurrentStatus(), request.getOperationType());
//
//        // 记录流转日志
//        trackingService.createTrackingRecord(
//                request.getGarmentCode(),
//                request.getOperationType(),
//                request.getOperatorId(),
//                request.getLocation()
//        );
//
//        // 更新当前状态
//        GarmentStatus newStatus = statusMachineService.getNextStatus(request.getOperationType());
//        detailService.updateStatus(identity.getGarmentOrderDetailId(), newStatus);
//    }
//
//    //衣物状态查询接口
//    @GetMapping("/garments/{code}/status")
//    public GarmentStatusResponse getGarmentStatus(@PathVariable String code) {
//        GarmentIdentity identity = identityService.getByIdentityCode(code);
//        List<TrackingRecord> history = trackingService.getTrackingHistory(code);
//
//        return new GarmentStatusResponse(
//                identity.getCurrentStatus(),
//                identity.getCreatedTime(),
//                history
//        );
//    }
//
//}
