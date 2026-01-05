package com.aioveu.boot.JuhaocheJwtUtils;

import lombok.Builder;
import lombok.Data;

/**
 * 令牌对
 */
@Data
@Builder
public class TokenPair {
    private String accessToken;
    private String refreshToken;
    private String tokenType;
    private Long expiresIn;
}
