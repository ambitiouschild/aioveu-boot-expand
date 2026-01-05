

-- =============================================
-- 表1: 用户表
-- =============================================

-- 用户表（已存在）
CREATE TABLE IF NOT EXISTS `juhaoche_user` (
                                      `id` bigint AUTO_INCREMENT PRIMARY KEY,
                                      `user_id` bigint NOT NULL,
                                      `name` varchar(50) NOT NULL,
    `password` varchar(100) NOT NULL,
    `phone` varchar(15) NOT NULL,
    `is_enable` tinyint NOT NULL,
    `create_time` timestamp DEFAULT CURRENT_TIMESTAMP,
    `create_user` bigint,
    `update_time` timestamp DEFAULT CURRENT_TIMESTAMP,
    `update_user` bigint,
    `is_del` tinyint DEFAULT 0 NOT NULL,
    UNIQUE KEY `user_phone_uindex` (`phone`),
    UNIQUE KEY `uk_user_id` (`user_id`)
    ) COMMENT '用户表';


-- =============================================
-- 插入模拟数据
-- =============================================
-- 插入基础用户数据
INSERT INTO `juhaoche_user` (`user_id`, `name`, `password`, `phone`, `is_enable`) VALUES
(10001, '张伟', 'encrypted_password_1', '13800138001', 1),
(10002, '李娜', 'encrypted_password_2', '13900139002', 1),
(10003, '王强', 'encrypted_password_3', '13600136003', 1),
(10004, '陈明', 'encrypted_password_4', '13500135004', 1),
(10005, '李芳', 'encrypted_password_5', '13700137005', 1);