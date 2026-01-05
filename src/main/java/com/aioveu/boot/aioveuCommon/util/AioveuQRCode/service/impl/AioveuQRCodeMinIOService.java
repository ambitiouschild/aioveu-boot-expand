package com.aioveu.boot.aioveuCommon.util.AioveuQRCode.service.impl;


import com.aioveu.boot.aioveuCommon.util.AioveuQRCode.service.AioveuQRCodeService;
import com.aioveu.boot.aioveuCommon.util.MinIOService.MinIOService;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


/*
二维码生成服务

步骤：

添加ZXing依赖（如果尚未添加）

编写生成二维码图片的方法（返回BufferedImage或字节数组）

编写将图片上传到MinIO的方法

在生成衣物编码后，调用二维码生成并上传，保存URL

依赖（Maven）：

<dependency>
    <groupId>com.google.zxing</groupId>
    <artifactId>core</artifactId>
    <version>3.4.1</version>
</dependency>
<dependency>
    <groupId>com.google.zxing</groupId>
    <artifactId>javase</artifactId>
    <version>3.4.1</version>
</dependency>


MinioFileService已经实现了文件上传功能，并且包含了MinIO的配置和初始化。
为了避免重复配置，我们可以将MinioFileService中的MinIO客户端和配置复用到AioveuQRCodeService中。
直接复用MinioFileService中的MinIO客户端和配置，但需要确保配置不重复。

 */

/*
条件注解@ConditionalOnProperty(value = "lss.type", havingValue = "minio")：只有当配置属性lss.type的值为minio时，这个bean才会被创建。

如果配置中没有设置lss.type或者值不是minio，那么这个bean就不会被创建，从而导致Spring容器中找不到AioveuQRCodeService类型的bean。
 */
//@Component
@ConditionalOnProperty(value = "lss.type", havingValue = "minio")
@RequiredArgsConstructor
@Data
@Slf4j
@Service
public class AioveuQRCodeMinIOService implements AioveuQRCodeService {

    private final MinIOService minioService;


    /**
     * 生成二维码并上传到MinIO
     *
     * @param content 二维码内容
     * @param size 图片尺寸
     * @return MinIO中的文件URL
     */
    @Override
    public String generateAndUploadQRCode(String content, int size) {
        try {

            //手机访问
            //http://192.168.0.109:8989/api/v1/QRCodes/info/GAR-20251012-0001-44DC

            String localhostNewContent = "http://192.168.0.109:8989/api/v1/QRCodes/info/" + content;
            String onLineNewContent = "http://love.aioveu.com/api/v1/QRCodes/info/" + content;

            String aioveu = "http://feifei.aioveu.com";



            // 生成二维码图片
//            BufferedImage qrImage = generateQRCodeImage(aioveu, size);

            BufferedImage qrImage = generateQRCodeImage(content, size);

            // 转换为字节数组
            byte[] imageBytes = convertImageToBytes(qrImage);

            // 生成文件名
            String fileName = generateFileName(content);

            // 上传到MinIO 返回MinIO访问URL
            return minioService.uploadBytes(imageBytes, fileName,"image/png");


        } catch (WriterException | IOException e) {
            throw new RuntimeException("生成并上传二维码失败", e);
        }
    }

    /**
     * 生成二维码图片
     */
    private BufferedImage generateQRCodeImage(String content, int size) throws WriterException {
        Map<EncodeHintType, Object> hints = new HashMap<>();
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
        hints.put(EncodeHintType.MARGIN, 1);
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");

        QRCodeWriter writer = new QRCodeWriter();
        BitMatrix bitMatrix = writer.encode(content, BarcodeFormat.QR_CODE, size, size, hints);

        BufferedImage image = new BufferedImage(size, size, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < size; x++) {
            for (int y = 0; y < size; y++) {
                image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
            }
        }

        return image;
    }

    // 转换为字节数组
    private byte[] convertImageToBytes(BufferedImage image) throws IOException {
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write(image, "PNG", os);
        return os.toByteArray();
    }

    // 生成文件名
    private String generateFileName(String content) {
        return "qrcodes/" + System.currentTimeMillis() + "_" + content.hashCode() + ".png";
    }


}
