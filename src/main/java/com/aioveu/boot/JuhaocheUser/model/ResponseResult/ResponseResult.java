package com.aioveu.boot.JuhaocheUser.model.ResponseResult;


import lombok.Builder;
import lombok.Data;

/**
 * 统一响应结果
 */
@Data
@Builder
public class ResponseResult<T> {
    private String code;
    private String message;
    private T data;
    private Long timestamp;

    public static <T> ResponseResult<T> success(T data) {
        return ResponseResult.<T>builder()
                .code("200")
                .message("成功")
                .data(data)
                .timestamp(System.currentTimeMillis())
                .build();
    }
}
