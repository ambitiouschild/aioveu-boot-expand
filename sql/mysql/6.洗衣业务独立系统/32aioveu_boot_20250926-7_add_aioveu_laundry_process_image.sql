

-- 1. 创建数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS aioveu_boot CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

use aioveu_boot;


-- 2. 创建表 && 数据初始化
-- 洗衣业务独立系统模块 -- 图片记录表（独立存储）
-- ----------------------------
-- DROP TABLE IF EXISTS `aioveu_laundry_process_image`;

-- 创建洗衣流程图片记录表（规范化）
CREATE TABLE `aioveu_laundry_process_image` (
                                                `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片记录ID',
                                                `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
                                                `item_id` bigint(20) unsigned DEFAULT NULL COMMENT '衣物明细ID',
                                                `image_type` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '图片类型 1-收衣时-receive,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-完成时-finish,6-问题衣物-problem,7-质检时-quality_check,8-交付时-delivery',
                                                `image_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
                                                `upload_user` bigint(20) unsigned COMMENT '上传人ID',
                                                `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片描述',
                                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                PRIMARY KEY (`id`),
                                                KEY `idx_order_id` (`order_id`),
                                                KEY `idx_item_id` (`item_id`),
                                                KEY `idx_image_type` (`image_type`),
                                                KEY `idx_upload_time` (`create_time`),
                                            -- 删除订单 → 自动删除相关图片
                                                CONSTRAINT `fk_image_order` FOREIGN KEY (`order_id`) REFERENCES `aioveu_laundry_order` (`id`) ON DELETE CASCADE,
                                            -- 删除衣物明细 → 保留图片但清除关联
                                                CONSTRAINT `fk_image_item` FOREIGN KEY (`item_id`) REFERENCES `aioveu_laundry_order_item` (`id`) ON DELETE SET NULL,
                                            -- 删除员工 → 保留图片但清除上传者信息
                                                CONSTRAINT `fk_image_upload_user` FOREIGN KEY (`upload_user`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE SET NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='洗衣流程图片记录表';

-- 插入洗衣流程图片记录模拟数据
INSERT INTO `aioveu_laundry_process_image` (
    `order_id`, `item_id`, `image_type`, `image_url`, `upload_user`, `description`
) VALUES
-- 订单1的图片记录
(1, NULL, 1, 'https://oss.example.com/laundry/20250910/order1_receive1.jpg', 1, '整体收衣照片'),
(1, NULL, 1, 'https://oss.example.com/laundry/20250910/order1_receive2.jpg', 1, '问题衣物特写'),
(1, 1, 2, 'https://oss.example.com/laundry/20250910/item1_washing.jpg', 2, '衬衫洗涤过程'),
(1, 1, 4, 'https://oss.example.com/laundry/20250910/item1_ironing.jpg', 3, '衬衫熨烫过程'),
(1, 1, 5, 'https://oss.example.com/laundry/20250910/item1_finish.jpg', 4, '衬衫完成效果'),
(1, 2, 6, 'https://oss.example.com/laundry/20250910/item2_problem.jpg', 2, '西裤磨损特写'),
(1, 2, 5, 'https://oss.example.com/laundry/20250910/item2_finish.jpg', 3, '西裤修补后效果'),
(1, 3, 5, 'https://oss.example.com/laundry/20250910/item3_finish.jpg', 4, '羽绒服完成效果'),

-- 订单2的图片记录
(2, NULL, 1, 'https://oss.example.com/laundry/20250912/order2_receive1.jpg', 1, '整体收衣照片'),
(2, 4, 2, 'https://oss.example.com/laundry/20250912/item4_washing.jpg', 2, '羊毛大衣洗涤'),
(2, 4, 3, 'https://oss.example.com/laundry/20250912/item4_drying.jpg', 3, '羊毛大衣烘干'),
(2, 5, 6, 'https://oss.example.com/laundry/20250912/item5_problem.jpg', 2, '羊绒衫起球问题'),
(2, 5, 5, 'https://oss.example.com/laundry/20250912/item5_finish.jpg', 3, '羊绒衫完成效果'),
(2, NULL, 7, 'https://oss.example.com/laundry/20250912/order2_quality1.jpg', 5, '整体质检'),
(2, NULL, 7, 'https://oss.example.com/laundry/20250912/order2_quality2.jpg', 5, '细节检查'),
(2, NULL, 8, 'https://oss.example.com/laundry/20250912/order2_delivery.jpg', 6, '交付照片'),

-- 订单3的图片记录
(3, 8, 6, 'https://oss.example.com/laundry/20250915/item8_problem.jpg', 1, '牛仔裤油渍问题'),
(3, 8, 2, 'https://oss.example.com/laundry/20250915/item8_washing.jpg', 2, '牛仔裤去油处理'),
(3, 8, 5, 'https://oss.example.com/laundry/20250915/item8_finish.jpg', 3, '牛仔裤完成效果'),
(3, 9, 4, 'https://oss.example.com/laundry/20250915/item9_ironing.jpg', 4, '运动裤熨烫'),

-- 订单4的图片记录
(4, 10, 1, 'https://oss.example.com/laundry/20250918/item10_receive.jpg', 1, '婚纱收衣照片'),
(4, 10, 6, 'https://oss.example.com/laundry/20250918/item10_problem.jpg', 2, '婚纱红酒渍特写'),
(4, 10, 2, 'https://oss.example.com/laundry/20250918/item10_washing.jpg', 3, '婚纱特殊处理'),
(4, 10, 5, 'https://oss.example.com/laundry/20250918/item10_finish.jpg', 4, '婚纱完成效果'),
(4, NULL, 8, 'https://oss.example.com/laundry/20250918/order4_delivery.jpg', 6, '婚纱交付'),

-- 订单5的图片记录
(5, 13, 1, 'https://oss.example.com/laundry/20250920/item13_receive.jpg', 1, '夹克收衣照片'),
(5, 13, 4, 'https://oss.example.com/laundry/20250920/item13_ironing1.jpg', 3, '夹克熨烫过程'),
(5, 13, 4, 'https://oss.example.com/laundry/20250920/item13_ironing2.jpg', 3, '袖口特写'),
(5, 13, 5, 'https://oss.example.com/laundry/20250920/item13_finish.jpg', 4, '夹克完成效果'),

-- 订单6的图片记录
(6, 14, 1, 'https://oss.example.com/laundry/20250922/item14_receive.jpg', 1, '西装外套收衣'),
(6, 14, 5, 'https://oss.example.com/laundry/20250922/item14_finish.jpg', 4, '西装完成效果'),

-- 订单7的图片记录
(7, 15, 2, 'https://oss.example.com/laundry/20250925/item15_washing1.jpg', 2, '窗帘洗涤过程'),
(7, 15, 2, 'https://oss.example.com/laundry/20250925/item15_washing2.jpg', 2, '大容量洗衣机'),
(7, 15, 7, 'https://oss.example.com/laundry/20250925/item15_quality.jpg', 5, '窗帘质检'),

-- 订单8的图片记录
(8, 16, 3, 'https://oss.example.com/laundry/20250926/item16_drying.jpg', 1, '床单烘干过程'),
(8, 17, 2, 'https://oss.example.com/laundry/20250926/item17_washing.jpg', 2, '被套洗涤过程'),

-- 订单9的图片记录
(9, 18, 6, 'https://oss.example.com/laundry/20250927/item18_problem.jpg', 5, '地毯污渍特写'),
(9, 18, 2, 'https://oss.example.com/laundry/20250927/item18_washing.jpg', 2, '地毯深度清洁'),

-- 订单10的图片记录
(10, NULL, 6, 'https://oss.example.com/laundry/20250928/order10_problem.jpg', 5, '毛毯问题说明'),
(10, NULL, 8, 'https://oss.example.com/laundry/20250928/order10_delivery.jpg', 6, '快递单号记录'),

-- 订单11的图片记录
(11, 19, 1, 'https://oss.example.com/laundry/20250929/item19_receive.jpg', 1, '皮衣收衣照片'),
(11, 19, 2, 'https://oss.example.com/laundry/20250929/item19_washing.jpg', 2, '皮衣专业处理'),
(11, 19, 5, 'https://oss.example.com/laundry/20250929/item19_finish.jpg', 4, '皮衣完成效果'),

-- 订单12的图片记录
(12, 20, 1, 'https://oss.example.com/laundry/20250930/item20_receive.jpg', 1, '婚纱收衣照片'),
(12, 20, 7, 'https://oss.example.com/laundry/20250930/item20_quality.jpg', 5, '婚纱质检'),

-- 订单13的图片记录
(13, 21, 6, 'https://oss.example.com/laundry/20251/item21_problem.jpg', 1, '制服油污问题'),
(13, 21, 2, 'https://oss.example.com/laundry/20251/item21_washing.jpg', 2, '制服去油处理'),
(13, 22, 6, 'https://oss.example.com/laundry/20251/item22_problem.jpg', 1, '工作裤油漆渍'),
(13, 22, 2, 'https://oss.example.com/laundry/20251/item22_washing.jpg', 2, '工作裤特殊处理');