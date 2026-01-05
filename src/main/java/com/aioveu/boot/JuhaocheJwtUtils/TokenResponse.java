package com.aioveu.boot.JuhaocheJwtUtils;

import lombok.Builder;
import lombok.Data;

/**
 * 令牌响应
 */
@Data
@Builder
public class TokenResponse {

    private boolean success;
    private String code;
    private String message;
    private TokenPair data;
    private Long timestamp;
}
