

-- 1. 创建数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS aioveu_boot CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

use aioveu_boot;


-- 2. 创建表 && 数据初始化
-- 洗衣业务独立系统模块 -- 创建衣物类型主表
-- ----------------------------
-- DROP TABLE IF EXISTS `aioveu_laundry_clothing_type`;

-- 创建洗衣订单衣物明细表（规范化）
CREATE TABLE `aioveu_laundry_clothing_type` (
                                                `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '衣物类型ID',
                                                `type_code` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型代码',
                                                `type_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称',
                                                `category` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '衣物类别,0-上装-top,1-下装-bottom,2-外套-outerwear,3-内衣-underwear,4-配饰-accessories,5-家居用品-home,6-特殊衣物-special',
                                                `base_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '基础价格',
                                                `processing_time` smallint(6) NOT NULL DEFAULT '60' COMMENT '标准处理时间(分钟)',
                                                `special_requirements` text COLLATE utf8mb4_general_ci COMMENT '特殊处理要求',
                                                `is_delicate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精细衣物',
                                                `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(0-停用 1-启用)',
                                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                PRIMARY KEY (`id`),
                                                UNIQUE KEY `uniq_type_code` (`type_code`),
                                                UNIQUE KEY `uniq_type_name` (`type_name`),
                                                KEY `idx_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='衣物类型主表';

-- 插入标准衣物类型数据
INSERT INTO `aioveu_laundry_clothing_type` (
    `type_code`, `type_name`, `category`, `base_price`, `processing_time`, `special_requirements`, `is_delicate`
) VALUES
      ('CT001', '衬衫', '0', 30.00, 45, '需要单独熨烫', 0),
      ('CT002', 'T恤', '0', 25.00, 30, NULL, 0),
      ('CT003', '毛衣', '0', 40.00, 60, '需要平铺晾干', 1),
      ('CT004', '西裤', '1', 40.00, 50, '需要裤线熨烫', 0),
      ('CT005', '牛仔裤', '1', 35.00, 40, NULL, 0),
      ('CT006', '短裤', '1', 25.00, 30, NULL, 0),
      ('CT007', '羽绒服', '2', 80.00, 120, '需要低温烘干', 0),
      ('CT008', '羊毛大衣', '2', 150.00, 180, '需要专业干洗', 1),
      ('CT009', '夹克', '2', 70.00, 90, NULL, 0),
      ('CT010', '内衣', '3', 20.00, 30, '需要单独清洗', 0),
      ('CT011', '袜子', '3', 10.00, 20, '需要成对处理', 0),
      ('CT012', '领带', '4', 30.00, 25, '需要手洗', 1),
      ('CT013', '围巾', '4', 30.00, 30, '需要平铺晾干', 1),
      ('CT014', '床单', '5', 45.00, 60, NULL, 0),
      ('CT015', '被套', '5', 60.00, 90, NULL, 0),
      ('CT016', '窗帘', '5', 80.00, 120, '需要大容量洗衣机', 0),
      ('CT017', '婚纱', '6', 200.00, 240, '需要特别护理', 1),
      ('CT018', '皮衣', '6', 180.00, 180, '需要专业护理', 1),
      ('CT019', '地毯', '5', 150.00, 180, '需要深度清洁', 0),
      ('CT020', '制服', '0', 50.00, 60, '需要高温消毒', 0);