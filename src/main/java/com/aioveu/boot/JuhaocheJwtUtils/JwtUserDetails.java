package com.aioveu.boot.JuhaocheJwtUtils;
import lombok.Builder;
import lombok.Data;
import java.util.Date;
import java.util.List;

/**
 * JWT用户详情
 */
@Data
@Builder
public class JwtUserDetails {

    private Long userId;
    private String username;
    private String name;
    private Integer userType;
    private Long merchantId;
    private List<String> permissions;
    private List<String> roles;
    private String loginIp;
    private Date loginTime;
}
