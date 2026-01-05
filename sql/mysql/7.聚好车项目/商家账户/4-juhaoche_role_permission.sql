
-- =============================================
-- 表4: 角色权限关联表
-- =============================================
CREATE TABLE IF NOT EXISTS `juhaoche_role_permission` (
                                                 `id` bigint AUTO_INCREMENT PRIMARY KEY,
                                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                                 `permission_id` bigint NOT NULL COMMENT '权限ID',
                                                 `create_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                                 `create_user` bigint,
                                                 `update_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                                 `update_user` bigint,
                                                 `is_del` tinyint DEFAULT 0 NOT NULL,
                                                 UNIQUE KEY `uk_role_permission` (`role_id`, `permission_id`),
    INDEX `idx_role_id` (`role_id`),
    INDEX `idx_permission_id` (`permission_id`)
    ) COMMENT '角色权限关联表';


-- 插入角色权限关联数据
INSERT INTO `juhaoche_role_permission` (`role_id`, `permission_id`) VALUES
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6),  -- 商户管理员拥有所有权限
(3, 3), (3, 4),  -- 采购专员
(4, 5),          -- 销售专员
(5, 6);          -- 财务专员