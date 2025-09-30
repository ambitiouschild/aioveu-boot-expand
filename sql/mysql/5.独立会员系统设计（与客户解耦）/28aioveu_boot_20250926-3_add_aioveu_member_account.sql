

-- 1. 创建数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS aioveu_boot CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

use aioveu_boot;


-- 2. 创建表 && 数据初始化
-- 会员管理模块 -- -- 独立充值账户表
-- ----------------------------
-- DROP TABLE IF EXISTS `aioveu_member_account`;

-- 创建会员充值账户表（规范化）
CREATE TABLE `aioveu_member_account` (
                                         `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '账户ID',
                                         `member_id` bigint(20) unsigned NOT NULL COMMENT '会员ID',
                                         `cash_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '现金余额',
                                         `gift_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送余额',
                                         `total_balance` decimal(10,2) GENERATED ALWAYS AS (`cash_balance` + `gift_balance`) VIRTUAL COMMENT '总余额',
                                         `last_recharge_time` datetime DEFAULT NULL COMMENT '最后充值时间',
                                         `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户状态(0-冻结 1-正常)',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uniq_member_id` (`member_id`),
                                         KEY `idx_total_balance` (`total_balance`),
                                         CONSTRAINT `fk_member_account_member` FOREIGN KEY (`member_id`) REFERENCES `aioveu_member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会员充值账户表';

-- 插入模拟数据（假设已有10个会员）
INSERT INTO `aioveu_member_account` (`member_id`, `cash_balance`, `gift_balance`, `last_recharge_time`) VALUES

(1, 500.00, 50.00, '2023-09-20 14:30:00'),
(2, 300.00, 30.00, '2023-09-18 11:45:00'),
(3, 1500.00, 150.00, '2023-09-25 10:20:00'),
(4, 200.00, 20.00, '2023-09-15 16:10:00'),
(5, 100.00, 10.00, '2023-09-10 09:30:00'),
(6, 2500.00, 250.00, '2023-09-24 17:45:00'),
(7, 800.00, 80.00, '2023-09-22 15:30:00'),
(8, 50.00, 5.00, '2023-09-05 14:20:00'),
(9, 350.00, 35.00, '2023-09-19 10:45:00'),
(10, 1200.00, 120.00, '2023-09-25 16:30:00');