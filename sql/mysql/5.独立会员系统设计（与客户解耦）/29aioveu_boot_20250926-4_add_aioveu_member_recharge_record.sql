

-- 1. 创建数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS aioveu_boot CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

use aioveu_boot;


-- 2. 创建表 && 数据初始化
-- 会员管理模块 -- 充值记录表（完全独立）
-- ----------------------------
-- DROP TABLE IF EXISTS `aioveu_member_recharge_record`;

-- 创建会员充值记录表（规范化）
CREATE TABLE `aioveu_member_recharge_record` (
                                                 `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '充值记录ID',
                                                 `recharge_no` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '充值单号',
                                                 `member_id` bigint(20) unsigned NOT NULL COMMENT '会员ID',
                                                 `amount` decimal(10,2) NOT NULL COMMENT '充值金额',
                                                 `gift_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送金额',
                                                 `payment_type` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付方式 1-wechat,2-alipay,3-cash,4-card,5-bank',
                                                 `recharge_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '充值时间',
                                                 `operator_id` bigint(20) unsigned DEFAULT NULL COMMENT '操作员ID',
                                                 `status` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1-pending待定,2-success成功,3-failed失败',
                                                 `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                 `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                 PRIMARY KEY (`id`),
                                                 UNIQUE KEY `uniq_recharge_no` (`recharge_no`),
                                                 KEY `idx_member_id` (`member_id`),
                                                 KEY `idx_recharge_time` (`recharge_time`),
                                                 KEY `idx_status` (`status`),
                                                 CONSTRAINT `fk_recharge_member` FOREIGN KEY (`member_id`) REFERENCES `aioveu_member` (`id`) ON DELETE CASCADE,
                                                 CONSTRAINT `fk_operator_member` FOREIGN KEY (`operator_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会员充值记录表';

-- 插入模拟数据（假设已有10个会员）
INSERT INTO `aioveu_member_recharge_record` (
    `recharge_no`, `member_id`, `amount`, `gift_amount`, `payment_type`, `recharge_time`, `operator_id`, `status`
) VALUES
      ('RC20250901001', 1, 200.00, 20.00, '1', '2025-09-01 10:30:00', 1, '2'),
      ('RC20250902002', 2, 100.00, 10.00, '2', '2025-09-02 14:15:00', 2, '2'),
      ('RC20250905003', 3, 500.00, 50.00, '3', '2025-09-05 11:20:00', 1, '2'),
      ('RC20250908004', 4, 300.00, 30.00, '4', '2025-09-08 16:45:00', 3, '2'),
      ('RC20250910005', 5, 150.00, 15.00, '1', '2025-09-10 09:30:00', 2, '2'),
      ('RC20250912006', 6, 1000.00, 100.00, '2', '2025-09-12 13:40:00', 1, '2'),
      ('RC20250915007', 7, 400.00, 40.00, '3', '2025-09-15 15:20:00', 3, '2'),
      ('RC20250918008', 8, 50.00, 5.00, '4', '2025-09-18 11:10:00', 2, '2'),
      ('RC20250920009', 9, 250.00, 25.00, '1', '2025-09-20 14:30:00', 1, '2'),
      ('RC20250922010', 10, 800.00, 80.00, '2', '2025-09-22 17:00:00', 3, '2'),
      ('RC20250925011', 1, 300.00, 30.00, '3', '2025-09-25 10:45:00', 2, '2'),
      ('RC20250925012', 3, 1000.00, 100.00, '4', '2025-09-25 14:20:00', 1, '2'),
      ('RC20250926013', 6, 1500.00, 150.00, '1', '2025-09-26 09:15:00', 3, '1'),
      ('RC20250926014', 10, 400.00, 40.00, '2', '2025-09-26 11:30:00', 2, '3');