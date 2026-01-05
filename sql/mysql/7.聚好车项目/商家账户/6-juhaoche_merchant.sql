

-- 使用数据库
CREATE DATABASE IF NOT EXISTS lss_boot DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE lss_boot;

-- =============================================
-- 表6: 商户主体表
-- =============================================
-- 商户主体表
CREATE TABLE IF NOT EXISTS `juhaoche_merchant` (
                                          `id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
                                          `merchant_id` bigint NOT NULL COMMENT '商户ID',
                                          `merchant_name` varchar(100) NOT NULL COMMENT '商户名称',
                                          `merchant_code` varchar(50) NOT NULL UNIQUE COMMENT '商户编码',
                                          `business_license` varchar(50) NOT NULL COMMENT '营业执照号',
                                          `legal_person` varchar(50) COMMENT '法人代表',
                                          `contact_phone` varchar(15) NOT NULL COMMENT '联系手机',
                                          `email` varchar(100) COMMENT '邮箱',
                                          `province` varchar(50) COMMENT '省份',
                                          `city` varchar(50) COMMENT '城市',
                                          `address` varchar(200) COMMENT '详细地址',
                                          `industry_type` varchar(50) COMMENT '行业类型',
                                          `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态(0-待审核,1-正常,2-禁用,3-审核失败)',
                                          `audit_remark` varchar(200) COMMENT '审核备注',
                                          `audit_time` datetime COMMENT '审核时间',
                                          `audit_user_id` bigint COMMENT '审核人ID',
                                          `is_enable` tinyint NOT NULL DEFAULT 1 COMMENT '启用状态',
                                          `create_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                          `create_user` bigint,
                                          `update_time` timestamp DEFAULT CURRENT_TIMESTAMP,
                                          `update_user` bigint,
                                          `is_del` tinyint DEFAULT 0 NOT NULL,
                                          UNIQUE KEY `uk_merchant_id` (`merchant_id`),
                                          UNIQUE KEY `uk_business_license` (`business_license`),
                                          INDEX `idx_status` (`status`),
                                          INDEX `idx_industry_type` (`industry_type`)
) COMMENT '商户主体表';

-- =============================================
-- 插入模拟数据
-- =============================================
-- 插入商户数据
INSERT INTO `juhaoche_merchant` (`merchant_id`, `merchant_name`, `merchant_code`, `business_license`, `contact_phone`, `status`) VALUES
(1, '北京科技贸易有限公司', 'BJTech001', '91110105MA01XYZ123', '13800138001', 1),
(2, '上海时尚服饰有限公司', 'SHFashion002', '91310115MA02ABC456', '13900139002', 1);
