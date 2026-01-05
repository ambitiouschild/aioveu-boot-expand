

-- 使用数据库
CREATE DATABASE IF NOT EXISTS lss_boot DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE lss_boot;

-- =============================================
-- 表9: 商户用户角色表（扩展用户角色，增加商户维度）
-- =============================================

CREATE TABLE IF NOT EXISTS `juhaoche_merchant_user_role` (
                                                    `id` bigint AUTO_INCREMENT PRIMARY KEY,
                                                    `user_id` bigint NOT NULL COMMENT '用户ID',
                                                    `merchant_id` bigint NOT NULL COMMENT '商户ID',
                                                    `role_id` bigint NOT NULL COMMENT '角色ID',
                                                    `is_active` tinyint NOT NULL DEFAULT 1 COMMENT '是否生效',
                                                    `grant_time` datetime NOT NULL COMMENT '授权时间',
                                                    `grant_user_id` bigint COMMENT '授权人用户ID',
                                                    `expire_time` datetime COMMENT '过期时间',
                                                    `is_enable` tinyint NOT NULL DEFAULT 1 COMMENT '启用状态',
                                                    `create_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                                    `create_user` bigint,
                                                    `update_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                                    `update_user` bigint,
                                                    `is_del` tinyint DEFAULT 0 NOT NULL,
                                                    UNIQUE KEY `uk_merchant_user_role` (`user_id`, `merchant_id`, `role_id`),
    INDEX `idx_merchant_id` (`merchant_id`),
    INDEX `idx_role_id` (`role_id`),
    INDEX `idx_is_active` (`is_active`)
    ) COMMENT '商户用户角色表';


-- 插入商户用户角色数据
INSERT INTO `juhaoche_merchant_user_role` (`user_id`, `merchant_id`, `role_id`, `grant_time`) VALUES
(10001, 1, 2, '2024-01-10 08:00:00'),  -- 张伟在商户1是管理员
(10001, 1, 3, '2024-01-10 08:00:00'),  -- 张伟在商户1也是采购
(10003, 1, 3, '2024-01-13 11:00:00'),  -- 王强在商户1是采购
(10004, 1, 4, '2024-01-14 12:00:00');  -- 陈明在商户1是销售