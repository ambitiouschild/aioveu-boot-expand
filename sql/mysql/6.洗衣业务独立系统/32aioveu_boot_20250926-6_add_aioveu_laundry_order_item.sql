

-- 1. 创建数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS aioveu_boot CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

use aioveu_boot;


-- 2. 创建表 && 数据初始化
-- 洗衣业务独立系统模块 -- 衣物明细表
-- ----------------------------
-- DROP TABLE IF EXISTS `aioveu_laundry_order_item`;

-- 创建洗衣订单衣物明细表（规范化）
CREATE TABLE `aioveu_laundry_order_item` (
                                             `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '衣物明细ID',
                                             `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
                                             `clothing_type_id` bigint(20) unsigned NOT NULL COMMENT '衣物类型ID',
                                             `custom_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '自定义衣物类型',
                                             `problem_desc` text COLLATE utf8mb4_general_ci COMMENT '问题描述',
                                             `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
                                             `process_status` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '处理状态 1-待处理-pending,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-质检中-quality_check,6-已完成-finished,7-问题衣物-problem',
                                             `special_instruction` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '特殊要求',
                                             `start_time` datetime DEFAULT NULL COMMENT '开始处理时间',
                                             `end_time` datetime DEFAULT NULL COMMENT '完成处理时间',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             KEY `idx_order_id` (`order_id`),
                                             KEY `idx_clothing_type` (`clothing_type_id`),
                                             KEY `idx_process_status` (`process_status`),

                                             CONSTRAINT `fk_item_order` FOREIGN KEY (`order_id`) REFERENCES `aioveu_laundry_order` (`id`) ON DELETE CASCADE,
                                             CONSTRAINT `fk_item_clothing_type` FOREIGN KEY (`clothing_type_id`) REFERENCES `aioveu_laundry_clothing_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='洗衣订单衣物明细表';

-- 插入模拟数据（基于衣物类型ID）
INSERT INTO `aioveu_laundry_order_item` (
    `order_id`, `clothing_type_id`, `problem_desc`, `price`, `special_instruction`, `process_status`
) VALUES
-- 订单1 (假设订单ID=1)
(1, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT001'), '领口发黄', 30.00, '需要重点去黄', 6),
(1, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT004'), '裤脚磨损', 40.00, '需要修补', 6),
(1, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT007'), '污渍较多', 80.00, '需要深度清洁', 6),

-- 订单2 (假设订单ID=2)
(2, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT008'), '整体清洁', 150.00, '需要低温烘干', 6),
(2, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT003'), '袖口起球', 70.00, '需要去球处理', 6),
(2, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT013'), NULL, 30.00, NULL, 6),
(2, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT012'), '酒渍', 70.00, '需要特殊去渍', 6),

-- 订单3 (假设订单ID=3)
(3, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT002'), '汗渍', 25.00, NULL, 4),
(3, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT005'), '油渍', 35.00, '需要重点去油', 3),
(3, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT006'), NULL, 25.00, NULL, 2),

-- 订单4 (假设订单ID=4)
(4, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT017'), '红酒渍', 120.00, '需要特殊去渍', 2),
(4, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT013'), NULL, 30.00, '需要手洗', 1),
(4, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT010'), NULL, 60.00, '需要单独清洗', 1),

-- 订单5 (假设订单ID=5)
(5, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT009'), '袖口污渍', 70.00, NULL, 1),
(5, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT002'), NULL, 50.00, NULL, 1),

-- 订单6 (假设订单ID=6)
(6, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT008'), '整体清洁', 95.00, '需要干洗', 6),

-- 订单7 (假设订单ID=7)
(7, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT016'), '灰尘较多', 180.00, '需要大容量洗衣机', 5),

-- 订单8 (假设订单ID=8)
(8, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT014'), NULL, 45.00, NULL, 3),
(8, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT015'), NULL, 30.00, NULL, 2),

-- 订单9 (假设订单ID=9)
(9, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT019'), '宠物毛发', 210.00, '需要深度清洁', 1),

-- 订单10 (假设订单ID=10)
(10, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT015'), NULL, 120.00, '取消订单', 7),

-- 订单11 (假设订单ID=11)
(11, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT018'), '整体清洁', 350.00, '需要专业护理', 2),
(11, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT018'), NULL, 250.00, '需要专业护理', 1),
(11, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT018'), NULL, 250.00, '需要专业护理', 1),

-- 订单12 (假设订单ID=12)
(12, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT017'), '整体清洁', 420.00, '需要特别护理', 1),

-- 订单13 (假设订单ID=13)
(13, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT020'), '油污', 150.00, '需要去油', 2),
(13, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT005'), '油漆渍', 120.00, '需要特殊处理', 2),
(13, (SELECT id FROM aioveu_laundry_clothing_type WHERE type_code='CT011'), NULL, 110.00, '需要消毒', 1);



-- -- 修改洗衣订单衣物明细表
-- ALTER TABLE `aioveu_laundry_order_item`
--     CHANGE COLUMN `clothing_type` `clothing_type_id` bigint(20) unsigned NOT NULL COMMENT '衣物类型ID',
--     ADD COLUMN `custom_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '自定义衣物类型',
--     ADD CONSTRAINT `fk_item_clothing_type` FOREIGN KEY (`clothing_type_id`) REFERENCES `aioveu_clothing_type` (`id`);
--
-- -- 更新索引
-- ALTER TABLE `aioveu_laundry_order_item`
-- DROP INDEX `idx_clothing_type`,
-- ADD KEY `idx_clothing_type_id` (`clothing_type_id`);