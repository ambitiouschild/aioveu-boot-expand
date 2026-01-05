package com.aioveu.boot.JuhaocheJwtUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import lombok.Data;
import lombok.Builder;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * 自定义用户详情实现
 * 用于存储Spring Security认证用户信息
 */
@Data
@Builder

public class CustomUserDetails implements UserDetails{

    private final Long userId;
    private final String username;
    private final String password;
    private final Collection<? extends GrantedAuthority> authorities;
    private final boolean enabled;
    private final boolean accountNonExpired;
    private final boolean credentialsNonExpired;
    private final boolean accountNonLocked;

    // 扩展字段
    private final String name;
    private final String phone;
    private final String email;
    private final Integer userType;

    // 修复：正确的默认构造器 - 修正参数顺序
    public CustomUserDetails() {
        this(null, null, null, true, true, true, true, Collections.emptyList(), null, null, null, null);
    }

    // 基础构造器
    public CustomUserDetails(Long userId, String username, String password,
                             Collection<? extends GrantedAuthority> authorities) {
        this(userId, username, password, true, true, true, true, authorities, null, null, null, null);
    }

    // 完整构造器
    public CustomUserDetails(Long userId, String username, String password,
                             boolean enabled, boolean accountNonExpired,
                             boolean credentialsNonExpired, boolean accountNonLocked,
                             Collection<? extends GrantedAuthority> authorities,
                             String name, String phone, String email, Integer userType) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.enabled = enabled;
        this.accountNonExpired = accountNonExpired;
        this.credentialsNonExpired = credentialsNonExpired;
        this.accountNonLocked = accountNonLocked;
        this.authorities = authorities != null ? authorities : Collections.emptyList();
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.userType = userType;
    }

    // ================ UserDetails 接口方法 ================

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return accountNonExpired;
    }

    @Override
    public boolean isAccountNonLocked() {
        return accountNonLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return credentialsNonExpired;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    // ================ 自定义方法 ================

    public Long getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public Integer getUserType() {
        return userType;
    }

    @Override
    public String toString() {
        return "CustomUserDetails{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", userType=" + userType +
                ", enabled=" + enabled +
                '}';
    }

    /**
     * 构建器模式
     */
    public static CustomUserDetailsBuilder builder() {
        return new CustomUserDetailsBuilder();
    }

    public static class CustomUserDetailsBuilder {
        private Long userId;
        private String username;
        private String password;
        private Collection<? extends GrantedAuthority> authorities;
        private boolean enabled = true;
        private boolean accountNonExpired = true;
        private boolean credentialsNonExpired = true;
        private boolean accountNonLocked = true;
        private String name;
        private String phone;
        private String email;
        private Integer userType;

        public CustomUserDetailsBuilder userId(Long userId) {
            this.userId = userId;
            return this;
        }

        public CustomUserDetailsBuilder username(String username) {
            this.username = username;
            return this;
        }

        public CustomUserDetailsBuilder password(String password) {
            this.password = password;
            return this;
        }

        public CustomUserDetailsBuilder authorities(Collection<? extends GrantedAuthority> authorities) {
            this.authorities = authorities;
            return this;
        }

        public CustomUserDetailsBuilder enabled(boolean enabled) {
            this.enabled = enabled;
            return this;
        }

        public CustomUserDetailsBuilder accountNonExpired(boolean accountNonExpired) {
            this.accountNonExpired = accountNonExpired;
            return this;
        }

        public CustomUserDetailsBuilder credentialsNonExpired(boolean credentialsNonExpired) {
            this.credentialsNonExpired = credentialsNonExpired;
            return this;
        }

        public CustomUserDetailsBuilder accountNonLocked(boolean accountNonLocked) {
            this.accountNonLocked = accountNonLocked;
            return this;
        }

        public CustomUserDetailsBuilder name(String name) {
            this.name = name;
            return this;
        }

        public CustomUserDetailsBuilder phone(String phone) {
            this.phone = phone;
            return this;
        }

        public CustomUserDetailsBuilder email(String email) {
            this.email = email;
            return this;
        }

        public CustomUserDetailsBuilder userType(Integer userType) {
            this.userType = userType;
            return this;
        }

        public CustomUserDetails build() {
            return new CustomUserDetails(
                    userId, username, password, enabled, accountNonExpired,
                    credentialsNonExpired, accountNonLocked, authorities,
                    name, phone, email, userType
            );
        }
    }
}
