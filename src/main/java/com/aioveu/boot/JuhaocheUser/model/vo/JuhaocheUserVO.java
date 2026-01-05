package com.aioveu.boot.JuhaocheUser.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 用户视图对象
 *
 * @author 可我不敌可爱
 * @since 2025-11-22 17:45
 */
@Getter
@Setter
@Schema( description = "用户视图对象")
public class JuhaocheUserVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;
    private Long userId;
    private String name;
    private String password;
    private String phone;
    private Integer isEnable;
    private LocalDateTime createTime;
    private Long createUser;
    private LocalDateTime updateTime;
    private Long updateUser;
    private Integer isDel;
}
