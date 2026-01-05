
-- =============================================
-- 表2: 角色表
-- =============================================
-- 角色表（调整结构）
CREATE TABLE IF NOT EXISTS `juhaoche_roles` (
                                       `id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
                                       `role_id` bigint NOT NULL COMMENT '角色ID',
                                       `name` varchar(100) NOT NULL COMMENT '角色名称',
                                       `code` varchar(50) NOT NULL UNIQUE COMMENT '角色编码',
                                       `role_type` varchar(20) NOT NULL COMMENT '角色类型(admin,buyer,seller,staff)',
                                       `description` varchar(500) COMMENT '角色描述',
                                       `merchant_level` tinyint DEFAULT 0 COMMENT '商户级别(0-平台级,1-商户级)',
                                       `is_enable` tinyint DEFAULT 1 COMMENT '状态: 0-禁用, 1-启用',
                                       `create_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                       `create_user` bigint,
                                       `update_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                       `update_user` bigint,
                                       `is_del` tinyint DEFAULT 0 NOT NULL,
                                       UNIQUE KEY `uk_role_id` (`role_id`),
                                       INDEX `idx_role_code` (`code`),
                                       INDEX `idx_role_type` (`role_type`),
                                       INDEX `idx_merchant_level` (`merchant_level`)
) COMMENT '角色表';

-- =============================================
-- 插入模拟数据
-- =============================================

-- 插入角色数据（系统预设角色）
INSERT INTO `juhaoche_roles` (`role_id`, `name`, `code`, `role_type`, `description`, `merchant_level`) VALUES
(1, '平台管理员', 'PLATFORM_ADMIN', 'admin', '平台级管理员', 0),
(2, '商户管理员', 'MERCHANT_ADMIN', 'admin', '商户管理员', 1),
(3, '采购专员', 'BUYER', 'buyer', '负责采购业务', 1),
(4, '销售专员', 'SELLER', 'seller', '负责销售业务', 1),
(5, '财务专员', 'FINANCE', 'staff', '负责财务管理', 1),
(6, '运营专员', 'OPERATOR', 'staff', '负责运营管理', 1);
