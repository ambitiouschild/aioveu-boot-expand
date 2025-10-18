package com.aioveu.boot.aioveuCommon.util.AioveuPrint.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;

@Getter
@Builder
@Data
@Schema( description = "打印视图对象")
public class AioveuPrintResponse {

    @Schema(description = "打印状态")
    private Boolean success;

    @Schema(description = "打印信息")
    private String message;

    @Schema(description = "打印id")
    private String printId;

    @Schema(description = "打印数目")
    private Integer total;

    @Schema(description = "打印预览URL")
    private String previewUrl;      // 打印预览URL

}


//{
//        "code": "00000",
//        "data": {
//        "success": true,
//        "message": "打印任务已提交",
//        "printId": "PRINT202510180001",
//        "total": 1,
//        "previewUrl": "/api/print/preview/PRINT202510180001"
//        },
//        "msg": "一切ok"
//        }
