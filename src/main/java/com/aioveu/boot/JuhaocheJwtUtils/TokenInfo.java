package com.aioveu.boot.JuhaocheJwtUtils;

import lombok.Builder;
import lombok.Data;
import org.apache.poi.hpsf.Date;

import java.util.List;

/**
 * 令牌信息
 */
@Data
@Builder
public class TokenInfo {
    private Long userId;
    private String username;
    private Long merchantId;
    private List<String> permissions;
    private List<String> roles;
    private Date issuedAt;
    private Date expiration;
    private Long remainingMinutes;
}
