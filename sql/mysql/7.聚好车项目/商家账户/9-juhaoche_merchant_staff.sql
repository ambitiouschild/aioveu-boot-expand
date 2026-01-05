

-- 使用数据库
CREATE DATABASE IF NOT EXISTS lss_boot DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE lss_boot;

-- =============================================
-- 表5: 商户员工账号表（子账号扩展信息）
-- =============================================
-- 商户员工信息表
CREATE TABLE IF NOT EXISTS `juhaoche_merchant_staff` (
                                                `id` bigint AUTO_INCREMENT PRIMARY KEY,
                                                `user_id` bigint NOT NULL COMMENT '用户ID',
                                                `merchant_id` bigint NOT NULL COMMENT '商户ID',
                                                `staff_no` varchar(50) NOT NULL COMMENT '员工编号',
                                                `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
                                                `department` varchar(50) COMMENT '部门',
                                                `position` varchar(50) COMMENT '职位',
                                                `work_phone` varchar(15) COMMENT '工作手机',
                                                `work_email` varchar(100) COMMENT '工作邮箱',
                                                `entry_date` date COMMENT '入职日期',
                                                `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态(0-离职,1-在职,2-停职)',
                                                `remark` varchar(200) COMMENT '备注',
                                                `is_enable` tinyint NOT NULL DEFAULT 1 COMMENT '启用状态',
                                                `create_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                                `create_user` bigint,
                                                `update_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                                `update_user` bigint,
                                                `is_del` tinyint DEFAULT 0 NOT NULL,
                                                UNIQUE KEY `uk_staff_no` (`merchant_id`, `staff_no`),
                                                UNIQUE KEY `uk_user_merchant` (`user_id`, `merchant_id`),
                                                INDEX `idx_merchant_id` (`merchant_id`),
                                                INDEX `idx_status` (`status`)
) COMMENT '商户员工信息表';





-- =============================================
-- 插入模拟数据
-- =============================================

-- 插入商户员工数据
INSERT INTO `juhaoche_merchant_staff` (`user_id`, `merchant_id`, `staff_no`, `real_name`, `department`, `position`) VALUES
(10001, 1, 'BJTech001', '张伟', '管理层', '总经理'),
(10003, 1, 'BJTech002', '王强', '采购部', '采购专员'),
(10004, 1, 'BJTech003', '陈明', '销售部', '销售经理');