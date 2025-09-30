

-- 1. 创建数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS aioveu_boot CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

use aioveu_boot;


-- 2. 创建表 && 数据初始化
-- 会员管理模块 -- 会员等级表（独立配置）
-- ----------------------------
-- DROP TABLE IF EXISTS `aioveu_member_level`;

-- 创建会员等级表（规范化）
CREATE TABLE `aioveu_member_level` (
                                       `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员等级ID',
                                       `level_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '等级名称',
                                       `min_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低消费额',
                                       `discount` decimal(4,2) NOT NULL DEFAULT '1.00' COMMENT '折扣率',
                                       `benefits` text COLLATE utf8mb4_general_ci COMMENT '权益描述',
                                       `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(0-禁用 1-启用)',
                                       `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       PRIMARY KEY (`id`),
                                       UNIQUE KEY `uniq_level_name` (`level_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会员等级表';

-- 插入模拟数据
INSERT INTO `aioveu_member_level` (
    `level_name`, `min_amount`, `discount`, `benefits`
) VALUES
      ('普通会员', 0.00, 1.00, '基础洗衣服务，无额外折扣'),
      ('银卡会员', 1000.00, 0.95, '享受95折优惠，每月1次免费熨烫服务'),
      ('金卡会员', 3000.00, 0.88, '享受88折优惠，每月2次免费加急服务，专属客服'),
      ('铂金会员', 8000.00, 0.80, '享受8折优惠，每月3次免费上门取送，生日礼包'),
      ('钻石会员', 15000.00, 0.75, '享受75折优惠，无限次免费上门取送，专属洗衣顾问');