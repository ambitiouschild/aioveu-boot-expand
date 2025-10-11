

-- 1. 创建数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS aioveu_boot CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

use aioveu_boot;


-- 2. 创建表 && 数据初始化
-- 洗衣业务独立系统模块 -- 新增表：衣物唯一编码表 (garment_identity)
-- ----------------------------
-- DROP TABLE IF EXISTS `aioveu_laundry_garment_identity`;

-- 创建衣物唯一编码表（优化版）
CREATE TABLE `aioveu_laundry_garment_identity` (
                                                `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '衣物唯一编码ID',
                                                `garment_code` varchar(255) COLLATE utf8mb4_general_ci NOT NULL UNIQUE COMMENT '衣物唯一编码(UUID格式)',
                                                `garment_order_detail_id` BIGINT(20) unsigned NOT NULL COMMENT '关联订单明细',
                                                `qr_code_path` VARCHAR(255) NOT NULL COMMENT '二维码存储路径',
                                                `status` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT'编码状态 1-已存在-ACTIVE 2-已收回-RETIRED 3-已丢失-LOST',
                                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                PRIMARY KEY (`id`),
                                                UNIQUE KEY `uk_garment_code` (`garment_code`),
                                                KEY `idx_order_detail` (`garment_order_detail_id`),
                                                KEY `idx_create_time` (`create_time`),
                                                CONSTRAINT `fk_garment_order_detail`
                                                    FOREIGN KEY (`garment_order_detail_id`)
                                                        REFERENCES `aioveu_laundry_order_item` (`id`)
                                                        ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='衣物唯一编码表';

-- 假设已存在订单明细数据（示例ID：1-5）
INSERT INTO `aioveu_laundry_garment_identity`
(`garment_code`, `garment_order_detail_id`, `qr_code_path`, `status`)
VALUES
-- 订单1001的3件衣物
(UUID(), 1, '/qr_codes/2023/10/15/7a9b8c.png', 1),
(UUID(), 1, '/qr_codes/2023/10/15/5d2e4f.png', 1),
(UUID(), 1, '/qr_codes/2023/10/15/9a3b1c.png', 1),

-- 订单1002的2件衣物
(UUID(), 1, '/qr_codes/2023/10/16/2b8c7d.png', 1),
(UUID(), 1, '/qr_codes/2023/10/16/6e9f0a.png', 1),

-- 订单1003的1件衣物（已丢失）
(UUID(), 3, '/qr_codes/2023/10/17/1c3d5e.png', 3),

-- 订单1004的4件衣物（1件已退役）
(UUID(), 4, '/qr_codes/2023/10/18/4f6a8b.png', 1),
(UUID(), 4, '/qr_codes/2023/10/18/7c2e9d.png', 2),
(UUID(), 4, '/qr_codes/2023/10/18/3b1d4f.png', 1),
(UUID(), 4, '/qr_codes/2023/10/18/9e5a2c.png', 1),

-- 订单1005的2件衣物
(UUID(), 5, '/qr_codes/2023/10/19/8d3f7a.png', 1),
(UUID(), 5, '/qr_codes/2023/10/19/2b6c9e.png', 1);