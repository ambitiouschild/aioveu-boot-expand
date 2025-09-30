

-- 1. 创建数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS aioveu_boot CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

use aioveu_boot;


-- 2. 创建表 && 数据初始化
-- 会员管理模块 -- 独立会员表（与客户表分离）
-- ----------------------------
-- DROP TABLE IF EXISTS `aioveu_member`;

-- 创建会员信息表（规范化）
CREATE TABLE `aioveu_member` (
                                 `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员ID',
                                 `member_no` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员卡号',
                                 `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员姓名',
                                 `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
                                 `id_card` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号',
                                 `level_id` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '会员等级ID',
                                 `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入会时间',
                                 `total_consumption` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计消费金额',
                                 `last_visit` datetime DEFAULT NULL COMMENT '最后到店时间',
                                 `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(0-禁用 1-正常)',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 PRIMARY KEY (`id`),
                                 UNIQUE KEY `uniq_member_no` (`member_no`),
                                 UNIQUE KEY `uniq_phone` (`phone`),
                                 KEY `idx_level_id` (`level_id`),
                                 KEY `idx_join_date` (`join_date`),

                                 CONSTRAINT `fk_member_level` FOREIGN KEY (`level_id`) REFERENCES `aioveu_member_level` (`id`) ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会员信息表';

-- 插入模拟数据
INSERT INTO `aioveu_member` (
    `member_no`, `name`, `phone`, `id_card`, `level_id`,
    `join_date`, `total_consumption`, `last_visit`
) VALUES
      ('M20250001', '张三', '13800138001', '110101199001011234', 2, '2025-01-15 10:30:00', 1250.00, '2025-09-25 14:20:00'),
      ('M20250002', '李四', '13800138002', '110101199002022345', 1, '2025-02-20 11:15:00', 680.50, '2025-09-20 16:45:00'),
      ('M20250003', '王五', '13800138003', '110101199003033456', 3, '2025-03-10 09:45:00', 3250.00, '2025-09-26 10:30:00'),
      ('M20250004', '赵六', '13800138004', '110101199004044567', 2, '2025-04-05 14:20:00', 980.00, '2025-09-22 15:10:00'),
      ('M20250005', '钱七', '13800138005', '110101199005055678', 1, '2025-05-18 16:00:00', 420.00, '2025-09-18 11:30:00'),
      ('M20250006', '孙八', '13800138006', '110101199006066789', 3, '2025-06-22 13:40:00', 4800.00, '2025-09-25 17:20:00'),
      ('M20250007', '周九', '13800138007', '110101199007077890', 2, '2025-07-30 10:10:00', 1350.00, '2025-09-24 14:50:00'),
      ('M20250008', '吴十', '13800138008', '110101199008088901', 1, '2025-08-12 15:30:00', 250.00, '2025-09-19 10:15:00'),
      ('M20250009', '郑十一', '13800138009', '110101199009099012', 2, '2025-09-05 11:20:00', 750.00, '2025-09-26 09:40:00'),
      ('M20250010', '王芳', '13800138010', '110101199010101023', 3, '2025-09-20 14:00:00', 3200.00, '2025-09-26 16:00:00');