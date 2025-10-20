package com.aioveu.boot.aioveuCommon.util.MinIOService;


import cn.hutool.core.util.StrUtil;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import jakarta.annotation.PostConstruct;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.io.ByteArrayInputStream;
import java.io.InputStream;


/*

 * 创建共享的 MinIOService
 *
 * @author 可我不敌可爱
 * @since 2025/10/12

为了复用 MinioFileService中的 MinIO 配置和功能，我们将重构代码，
创建一个共享的 MinIO 服务类，然后让 MinioFileService和 AioveuQRCodeService都使用这个共享服务。

 */
@Slf4j
@Data
@Configuration
@ConfigurationProperties(prefix = "lss.minio")
public class MinIOService {

    private String endpoint;
    private String accessKey;
    private String secretKey;
    private String bucketName;
    private String customDomain;

    private MinioClient minioClient;

    @PostConstruct
    public void init() {
        try {
            minioClient = MinioClient.builder()
                    .endpoint(endpoint)
                    .credentials(accessKey, secretKey)
                    .build();

            log.info("MinIO 客户端初始化成功");
        } catch (Exception e) {
            log.error("MinIO 初始化失败", e);
            throw new RuntimeException("MinIO 初始化失败: " + e.getMessage());
        }
    }

    /**
     * 上传字节数组到 MinIO
     */
    public String uploadBytes(byte[] bytes, String fileName, String contentType) {
        try (InputStream inputStream = new ByteArrayInputStream(bytes)) {
            minioClient.putObject(
                    PutObjectArgs.builder()
                            .bucket(bucketName)
                            .object(fileName)
                            .contentType(contentType)
                            .stream(inputStream, bytes.length, -1)
                            .build()
            );

            return buildFileUrl(fileName);
        } catch (Exception e) {
            log.error("上传文件失败", e);
            throw new RuntimeException("文件上传失败", e);
        }
    }

    /**
     * 构建文件 URL
     */
    private String buildFileUrl(String fileName) {
        if (StrUtil.isNotBlank(customDomain)) {
            return customDomain + "/" + bucketName + "/" + fileName;
        } else {
            return endpoint + "/" + bucketName + "/" + fileName;
        }
    }
}
