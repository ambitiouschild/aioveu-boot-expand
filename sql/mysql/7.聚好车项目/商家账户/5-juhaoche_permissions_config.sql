


-- =============================================
-- 表5: 权限配置表
-- =============================================



-- 权限配置表（已存在）
CREATE TABLE IF NOT EXISTS `juhaoche_permissions_config` (
                                                    `id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '权限关联ID',
                                                    `name` varchar(100) NOT NULL COMMENT '权限配置名称',
    `api_path` varchar(200) NOT NULL COMMENT 'API路径',
    `permission_ids` varchar(100) NOT NULL COMMENT '权限编码',
    `description` varchar(500) COMMENT '权限配置描述',
    `type` tinyint NOT NULL COMMENT '权限类型',
    `is_enable` tinyint DEFAULT 1 COMMENT '状态: 0-禁用, 1-启用',
    `create_time` timestamp DEFAULT CURRENT_TIMESTAMP,
    `create_user` bigint,
    `update_time` timestamp DEFAULT CURRENT_TIMESTAMP,
    `update_user` bigint,
    `is_del` tinyint DEFAULT 0 NOT NULL,
    UNIQUE KEY `permissions_config_api_path_uindex` (`api_path`),
    INDEX `idx_api_path` (`api_path`),
    INDEX `idx_is_enable` (`is_enable`)
    ) COMMENT '权限配置表';