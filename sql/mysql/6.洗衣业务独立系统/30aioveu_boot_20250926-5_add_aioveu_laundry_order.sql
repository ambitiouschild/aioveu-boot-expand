

-- 1. 创建数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS aioveu_boot CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

use aioveu_boot;


-- 2. 创建表 && 数据初始化
-- 洗衣业务独立系统模块 -- 洗衣订单表（独立业务）
-- ----------------------------
-- DROP TABLE IF EXISTS `aioveu_laundry_order`;

-- 创建洗衣订单表（规范化）
CREATE TABLE `aioveu_laundry_order` (
                                        `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
                                        `order_no` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
                                        `member_id` bigint(20) unsigned DEFAULT NULL COMMENT '会员ID',
                                        `customer_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户姓名',
                                        `customer_phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户电话',
                                        `status` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单状态 0创建,1接收,2洗衣,3干燥,4熨烫,5质量检查,6完成,7运送,8取消',
                                        `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总额',
                                        `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣金额',
                                        `actual_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实付金额',
                                        `payment_status` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付状态 1-未支付-unpaid,2-部分支付-partial,3-已支付-paid,4-未支付-refunded',
                                        `payment_method_id` tinyint(3) unsigned DEFAULT NULL COMMENT '支付方式ID',
                                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `receive_time` datetime DEFAULT NULL COMMENT '收衣时间',
                                        `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
                                        `delivery_time` datetime DEFAULT NULL COMMENT '交付时间',
                                        `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                                        PRIMARY KEY (`id`),
                                        UNIQUE KEY `uniq_order_no` (`order_no`),
                                        KEY `idx_member_id` (`member_id`),
                                        KEY `idx_customer_phone` (`customer_phone`),
                                        KEY `idx_status` (`status`),
                                        KEY `idx_create_time` (`create_time`),

                                        CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `aioveu_member` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='洗衣订单表';

-- 插入模拟数据
INSERT INTO `aioveu_laundry_order` (
    `order_no`, `member_id`, `customer_name`, `customer_phone`, `status`,
    `total_amount`, `discount_amount`, `actual_amount`, `payment_status`,
    `receive_time`, `finish_time`, `delivery_time`
) VALUES
-- 会员订单
('1', 1, NULL, NULL, '1', 150.00, 15.00, 135.00, '1', '2025-09-10 10:30:00', '2025-09-11 16:00:00', '2025-09-12 14:20:00'),
('2', 3, NULL, NULL, '2', 320.00, 64.00, 256.00, '1', '2025-09-12 11:15:00', '2025-09-14 10:30:00', NULL),
('3', 5, NULL, NULL, '3', 85.00, 8.50, 76.50, '2', '2025-09-15 14:20:00', NULL, NULL),
('4', 7, NULL, NULL, '4', 210.00, 42.00, 168.00, '4', '2025-09-18 09:45:00', NULL, NULL),
('5', 9, NULL, NULL, '5', 120.00, 12.00, 108.00, '4', '2025-09-20 16:30:00', NULL, NULL),

-- 非会员订单
('6', NULL, '张先生', '13800138011', '6', 95.00, 0.00, 95.00, '1', '2025-09-11 14:10:00', '2025-09-12 15:30:00', '2025-09-13 10:15:00'),
('7', NULL, '李女士', '13800138012', '6', 180.00, 0.00, 180.00, '1', '2025-09-13 10:20:00', '2025-09-15 11:45:00', NULL),
('8', NULL, '王先生', '13800138013', '5', 75.00, 0.00, 75.00, '2', '2025-09-16 15:30:00', NULL, NULL),
('9', NULL, '赵女士', '13800138014', '4', 210.00, 0.00, 210.00, '2', NULL, NULL, NULL),
('10', NULL, '钱先生', '13800138015', '3', 120.00, 0.00, 120.00, '2', '2025-09-22 11:00:00', NULL, NULL),

-- 大额订单
('11', 6, NULL, NULL, '2', 850.00, 170.00, 680.00, '2', '2025-09-25 14:45:00', NULL, NULL),
('12', 10, NULL, NULL, '1', 420.00, 84.00, 336.00, '2', '2025-09-26 10:20:00', NULL, NULL),
('13', 2, NULL, NULL, '2', 380.00, 38.00, 342.00, '3', '2025-09-20 11:30:00', '2025-09-22 14:00:00', '2025-09-25 16:45:00');