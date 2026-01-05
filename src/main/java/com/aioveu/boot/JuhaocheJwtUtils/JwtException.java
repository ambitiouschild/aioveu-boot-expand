package com.aioveu.boot.JuhaocheJwtUtils;
/**
 * JWT异常类
 */
public class JwtException extends RuntimeException{


    private String errorCode;

    public JwtException(String message) {
        super(message);
    }

    public JwtException(String errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public JwtException(String message, Throwable cause) {
        super(message, cause);
    }

    public JwtException(String errorCode, String message, Throwable cause) {
        super(message, cause);
        this.errorCode = errorCode;
    }

    public String getErrorCode() {
        return errorCode;
    }
}
