

-- =============================================
-- 表3: 权限表（调整结构）
-- =============================================

CREATE TABLE IF NOT EXISTS `juhaoche_permissions` (
                                             `id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
                                             `permission_id` bigint NOT NULL COMMENT '权限ID',
                                             `name` varchar(100) NOT NULL COMMENT '权限名称',
    `code` varchar(50) NOT NULL UNIQUE COMMENT '权限编码',
    `description` varchar(500) COMMENT '权限描述',
    `permission_type` varchar(20) NOT NULL COMMENT '权限类型(menu,api,button)',
    `parent_id` bigint DEFAULT 0 COMMENT '父权限ID',
    `is_enable` tinyint DEFAULT 1 COMMENT '状态: 0-禁用, 1-启用',
    `create_time` timestamp DEFAULT CURRENT_TIMESTAMP,
    `create_user` bigint,
    `update_time` timestamp DEFAULT CURRENT_TIMESTAMP,
    `update_user` bigint,
    `is_del` tinyint DEFAULT 0 NOT NULL,
    UNIQUE KEY `uk_permission_id` (`permission_id`),
    INDEX `idx_permission_code` (`code`),
    INDEX `idx_permission_type` (`permission_type`),
    INDEX `idx_parent_id` (`parent_id`)
    ) COMMENT '权限表';

-- =============================================
-- 插入模拟数据
-- =============================================


-- 插入权限数据
INSERT INTO `juhaoche_permissions` (`permission_id`, `name`, `code`, `description`, `permission_type`) VALUES
(1, '商户管理', 'merchant:manage', '商户信息管理权限', 'menu'),
(2, '员工管理', 'staff:manage', '员工账号管理权限', 'menu'),
(3, '采购查看', 'purchase:view', '查看采购信息', 'api'),
(4, '采购创建', 'purchase:create', '创建采购订单', 'api'),
(5, '销售管理', 'sale:manage', '销售业务管理', 'menu'),
(6, '财务审核', 'finance:audit', '财务审核权限', 'api');