

-- 使用数据库
CREATE DATABASE IF NOT EXISTS lss_boot DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE lss_boot;

-- =============================================
-- 表7: 用户-商户关联表
-- =============================================
-- 用户-商户关联表
CREATE TABLE IF NOT EXISTS `juhaoche_user_merchant` (
                                               `id` bigint AUTO_INCREMENT PRIMARY KEY,
                                               `user_id` bigint NOT NULL COMMENT '用户ID',
                                               `merchant_id` bigint NOT NULL COMMENT '商户ID',
                                               `is_owner` tinyint NOT NULL DEFAULT 0 COMMENT '是否主账号(0-否,1-是)',
                                               `join_time` datetime NOT NULL COMMENT '加入时间',
                                               `invite_user_id` bigint COMMENT '邀请人用户ID',
                                               `is_enable` tinyint NOT NULL DEFAULT 1 COMMENT '启用状态',
                                               `create_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                               `create_user` bigint,
                                               `update_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                               `update_user` bigint,
                                               `is_del` tinyint DEFAULT 0 NOT NULL,
                                               UNIQUE KEY `uk_user_merchant` (`user_id`, `merchant_id`),
                                               INDEX `idx_merchant_id` (`merchant_id`),
                                               INDEX `idx_is_owner` (`is_owner`)
) COMMENT '用户-商户关联表';


-- =============================================
-- 插入模拟数据
-- =============================================

-- 插入用户-商户关联数据
INSERT INTO `juhaoche_user_merchant` (`user_id`, `merchant_id`, `is_owner`, `join_time`) VALUES
(10001, 1, 1, '2024-01-10 08:00:00'),  -- 张伟是商户1的老板
(10002, 2, 1, '2024-01-11 09:00:00'),  -- 李娜是商户2的老板
(10003, 1, 0, '2024-01-13 11:00:00'),  -- 王强是商户1的员工
(10004, 1, 0, '2024-01-14 12:00:00');  -- 陈明是商户1的员工