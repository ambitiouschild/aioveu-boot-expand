/*
 Navicat Premium Data Transfer

 Source Server         : aioveu-boot_Local_3309
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3309
 Source Schema         : aioveu_boot

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 09/10/2025 16:07:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aioveu_attendance
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_attendance`;
CREATE TABLE `aioveu_attendance`  (
  `attendance_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` bigint UNSIGNED NOT NULL COMMENT '员工ID',
  `date` date NOT NULL COMMENT '日期',
  `checkin_time` datetime NULL DEFAULT NULL COMMENT '上班打卡时间',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '下班打卡时间',
  `work_hours` decimal(4, 1) NULL DEFAULT NULL COMMENT '工作时长(小时)',
  `status` tinyint NULL DEFAULT NULL COMMENT '考勤状态：0-正常，1-迟到，2-早退，3-缺勤，4-休假',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`attendance_id`) USING BTREE,
  INDEX `idx_date`(`date` ASC) USING BTREE,
  INDEX `idx_check_time`(`checkin_time` ASC) USING BTREE,
  INDEX `idx_employee`(`employee_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  CONSTRAINT `fk_attendance_employee` FOREIGN KEY (`employee_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '考勤表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_attendance
-- ----------------------------
INSERT INTO `aioveu_attendance` VALUES (1, 1, '2025-08-15', '2025-08-15 09:00:00', '2025-08-15 17:30:00', 8.0, 0, '2025-08-15 09:00:00', '2025-08-15 09:00:00');
INSERT INTO `aioveu_attendance` VALUES (2, 2, '2025-08-15', '2025-08-15 09:00:00', '2025-08-15 17:30:00', 8.0, 0, '2025-08-15 09:00:00', '2025-08-15 09:00:00');
INSERT INTO `aioveu_attendance` VALUES (3, 3, '2025-08-15', '2025-08-15 09:00:00', '2025-08-15 17:30:00', 8.0, 0, '2025-08-15 09:00:00', '2025-08-15 09:00:00');
INSERT INTO `aioveu_attendance` VALUES (4, 4, '2025-08-15', '2025-08-15 09:00:00', '2025-08-15 17:30:00', 8.0, 0, '2025-08-15 09:00:00', '2025-08-15 09:00:00');
INSERT INTO `aioveu_attendance` VALUES (5, 1, '2025-08-15', '2025-08-15 09:00:00', '2025-08-15 17:30:00', 8.0, 0, '2025-08-15 09:00:00', '2025-08-15 09:00:00');
INSERT INTO `aioveu_attendance` VALUES (6, 2, '2025-09-05', '2025-09-05 18:47:37', '2025-09-05 18:47:39', 6.0, 0, '2025-09-05 18:47:48', '2025-09-05 18:47:48');
INSERT INTO `aioveu_attendance` VALUES (7, 3, '2025-09-10', '2025-09-10 09:00:00', '2025-09-10 18:00:00', 8.0, 1, '2025-09-10 15:48:38', '2025-09-10 15:48:38');
INSERT INTO `aioveu_attendance` VALUES (8, 1, '2025-09-10', '2025-09-10 09:00:00', '2025-09-10 18:00:00', 8.0, 0, '2025-09-10 15:51:41', '2025-09-10 15:51:41');
INSERT INTO `aioveu_attendance` VALUES (9, 1, '2025-09-10', '2025-09-10 09:00:00', '2025-09-10 18:00:00', 8.0, 0, '2025-09-10 15:51:47', '2025-09-10 15:51:47');
INSERT INTO `aioveu_attendance` VALUES (10, 6, '2025-09-10', '2025-09-10 09:00:00', '2025-09-10 18:00:00', 8.0, 0, '2025-09-10 15:52:14', '2025-09-10 15:52:14');
INSERT INTO `aioveu_attendance` VALUES (11, 2, '2025-09-10', '2025-09-10 09:00:00', '2025-09-10 18:00:00', 8.0, 0, '2025-09-10 15:57:41', '2025-09-10 15:57:41');
INSERT INTO `aioveu_attendance` VALUES (12, 6, '2025-09-10', '2025-09-10 16:03:37', '2025-09-10 16:03:41', 8.0, 0, '2025-09-10 16:03:53', '2025-09-10 16:03:53');

-- ----------------------------
-- Table structure for aioveu_category
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_category`;
CREATE TABLE `aioveu_category`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID（主键）',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` bigint UNSIGNED NULL DEFAULT 0 COMMENT '父分类ID',
  `level` tinyint UNSIGNED NULL DEFAULT 1 COMMENT '分类层级',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name` ASC) USING BTREE,
  INDEX `idx_parent`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物资分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_category
-- ----------------------------
INSERT INTO `aioveu_category` VALUES (1, '办公设备', 0, 1, '办公室使用的各类设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (2, 'IT设备', 0, 1, '信息技术相关设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (3, '生产设备', 0, 1, '生产制造相关设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (4, '实验室设备', 0, 1, '科研实验相关设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (5, '其他设备', 0, 1, '其他未分类设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (6, '打印机', 1, 2, '各类打印机', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (7, '复印机', 1, 2, '复印设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (8, '扫描仪', 1, 2, '文档扫描设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (9, '投影仪', 1, 2, '投影设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (10, '服务器', 2, 2, '服务器设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (11, '网络设备', 2, 2, '路由器、交换机等', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (12, '存储设备', 2, 2, '存储服务器、NAS等', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (13, '工作站', 2, 2, '高性能计算工作站', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (14, '机床', 3, 2, '各类加工机床', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (15, '注塑机', 3, 2, '塑料成型设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (16, '装配线', 3, 2, '生产线装配设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (17, '检测设备', 3, 2, '质量检测设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (18, '分析仪器', 4, 2, '化学分析仪器', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (19, '显微镜', 4, 2, '各类显微镜', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (20, '培养箱', 4, 2, '细胞/细菌培养设备', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (21, '实验台', 4, 2, '实验室工作台', '2025-08-31 19:29:25', '2025-08-31 19:29:25');
INSERT INTO `aioveu_category` VALUES (22, '扫描器', 2, 1, NULL, '2025-09-05 17:04:09', '2025-09-05 17:04:09');
INSERT INTO `aioveu_category` VALUES (23, '可爱', 22, 1, '可爱', '2025-09-11 18:00:03', '2025-09-11 18:00:03');

-- ----------------------------
-- Table structure for aioveu_contact
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_contact`;
CREATE TABLE `aioveu_contact`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '联系人ID（主键）',
  `customer_id` bigint UNSIGNED NOT NULL COMMENT '客户ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人姓名',
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '办公电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `wechat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `is_primary` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是主要联系人：0-否，1-是',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '性别：0-女，1-男',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `hobbies` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '兴趣爱好',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_primary_contact`(`customer_id` ASC, `is_primary` ASC) USING BTREE,
  INDEX `idx_customer`(`customer_id` ASC) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE,
  INDEX `idx_mobile`(`mobile` ASC) USING BTREE,
  INDEX `idx_email`(`email` ASC) USING BTREE,
  INDEX `idx_primary`(`is_primary` ASC) USING BTREE,
  CONSTRAINT `fk_contact_customer` FOREIGN KEY (`customer_id`) REFERENCES `aioveu_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户联系人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_contact
-- ----------------------------
INSERT INTO `aioveu_contact` VALUES (1, 1, '张华', '采购经理', '采购部', '13800138001', '0755-12345678', 'zhanghua@huawei.com', 'zhanghua_hw', 1, 1, '1985-03-15', '登山、摄影', NULL, '2025-08-31 19:29:42', '2025-08-31 19:29:42');
INSERT INTO `aioveu_contact` VALUES (2, 1, '李梅', '技术总监', '研发部', '13900139002', '0755-87654321', 'limei@huawei.com', 'limei_hw', 0, 0, '1988-07-22', '阅读、旅行', NULL, '2025-08-31 19:29:42', '2025-08-31 19:29:42');
INSERT INTO `aioveu_contact` VALUES (3, 2, '王强', '市场总监', '市场部', '13700137003', '0755-23456789', 'wangqiang@tencent.com', 'wangqiang_tx', 1, 1, '1983-11-05', '高尔夫、品茶', NULL, '2025-08-31 19:29:42', '2025-08-31 19:29:42');
INSERT INTO `aioveu_contact` VALUES (4, 2, '赵雪', '财务经理', '财务部', '13600136004', '0755-98765432', 'zhaoxue@tencent.com', 'zhaoxue_tx', 0, 0, '1990-02-18', '瑜伽、烹饪', NULL, '2025-08-31 19:29:42', '2025-08-31 19:29:42');
INSERT INTO `aioveu_contact` VALUES (5, 3, '陈明', '运营总监', '运营部', '13500135005', '0571-12345678', 'chenming@alibaba.com', 'chenming_ali', 1, 1, '1980-09-30', '足球、音乐', NULL, '2025-08-31 19:29:42', '2025-08-31 19:29:42');
INSERT INTO `aioveu_contact` VALUES (6, 3, '刘芳', '人力资源', '人力资源部', '13400134006', '0571-87654321', 'liufang@alibaba.com', 'liufang_ali', 0, 0, '1987-04-12', '绘画、舞蹈', NULL, '2025-08-31 19:29:42', '2025-08-31 19:29:42');

-- ----------------------------
-- Table structure for aioveu_customer
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_customer`;
CREATE TABLE `aioveu_customer`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '客户ID（主键）',
  `customer_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户编号（唯一）',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '客户类型：1-企业，2-个人，3-政府，4-其他',
  `industry_id` int UNSIGNED NULL DEFAULT NULL COMMENT '行业分类ID',
  `credit_rating` tinyint UNSIGNED NOT NULL DEFAULT 3 COMMENT '信用等级：1-AAA，2-AA，3-A，4-B，5-C',
  `customer_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '客户状态：1-潜在客户，2-活跃客户，3-休眠客户，4-流失客户',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份',
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '中国' COMMENT '国家',
  `postal_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网址',
  `tax_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '税号',
  `bank_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `annual_revenue` decimal(15, 2) UNSIGNED NULL DEFAULT NULL COMMENT '年营业额',
  `employee_count` int UNSIGNED NULL DEFAULT NULL COMMENT '员工人数',
  `established_date` date NULL DEFAULT NULL COMMENT '成立日期',
  `source` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '客户来源：1-线上推广，2-线下活动，3-客户推荐，4-销售开发，5-其他',
  `sales_rep_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '销售负责人ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_customer_no`(`customer_no` ASC) USING BTREE,
  UNIQUE INDEX `uniq_tax_id`(`tax_id` ASC) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE,
  INDEX `idx_type`(`type` ASC) USING BTREE,
  INDEX `idx_industry`(`industry_id` ASC) USING BTREE,
  INDEX `idx_credit`(`credit_rating` ASC) USING BTREE,
  INDEX `idx_status`(`customer_status` ASC) USING BTREE,
  INDEX `idx_city`(`city` ASC) USING BTREE,
  INDEX `idx_sales_rep`(`sales_rep_id` ASC) USING BTREE,
  CONSTRAINT `fk_customer_sales_rep` FOREIGN KEY (`sales_rep_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_customer
-- ----------------------------
INSERT INTO `aioveu_customer` VALUES (1, 'CUST-001', '华为技术有限公司', 1, 2, 2, 2, '深圳市龙岗区坂田华为基地', '深圳', '广东', '中国', '518129', '0755-28780808', 'contact@huawei.com', 'www.huawei.com', '914403001922038726', '7559143870000001', '中国工商银行深圳分行', 891400000000.00, 195000, '1987-09-15', 5, 1, '2025-08-31 19:29:40', '2025-09-02 18:38:45');
INSERT INTO `aioveu_customer` VALUES (2, 'CUST-002', '腾讯科技', 1, 2, 1, 2, '深圳市南山区高新科技园', '深圳', '广东', '中国', '518057', '0755-86013388', 'service@tencent.com', 'www.tencent.com', '91440300708461136W', '7559143870000002', '中国建设银行深圳分行', 560100000000.00, 112771, '1998-11-11', 3, 2, '2025-08-31 19:29:40', '2025-09-02 18:37:03');
INSERT INTO `aioveu_customer` VALUES (3, 'CUST-003', '阿里巴巴集团', 1, 2, 1, 2, '杭州市余杭区文一西路969号', '杭州', '浙江', '中国', '311121', '0571-85022088', 'contact@alibaba.com', 'www.alibaba.com', '91330100779780458U', '5719143870000003', '中国银行杭州分行', 717300000000.00, 254941, '1999-09-09', 3, 3, '2025-08-31 19:29:40', '2025-09-03 12:29:13');
INSERT INTO `aioveu_customer` VALUES (4, 'CUST-004', '小米科技', 1, 2, 2, 2, '北京市海淀区清河中街68号', '北京', '北京', '中国', '100085', '4001005678', 'support@xiaomi.com', 'www.mi.com', '91110108551385082Q', '7559143870000004', '招商银行北京分行', 328300000000.00, 33427, '2010-04-06', 4, 4, '2025-08-31 19:29:40', '2025-08-31 19:29:40');

-- ----------------------------
-- Table structure for aioveu_department
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_department`;
CREATE TABLE `aioveu_department`  (
  `dept_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `parent_dept_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '上级部门ID，用于构建部门树',
  `manager_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '部门经理，关联employee表',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  UNIQUE INDEX `idx_dept_name`(`dept_name` ASC) USING BTREE,
  INDEX `fk_department_parent`(`parent_dept_id` ASC) USING BTREE,
  INDEX `fk_department_manager`(`manager_id` ASC) USING BTREE,
  CONSTRAINT `fk_department_manager` FOREIGN KEY (`manager_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_department_parent` FOREIGN KEY (`parent_dept_id`) REFERENCES `aioveu_department` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公司部门组织结构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_department
-- ----------------------------
INSERT INTO `aioveu_department` VALUES (1, '技术研发中心', NULL, 1, '2025-08-31 19:29:16', '2025-09-08 14:48:02');
INSERT INTO `aioveu_department` VALUES (2, '产品研发部', 8, 2, '2025-08-31 19:29:16', '2025-09-09 22:46:53');
INSERT INTO `aioveu_department` VALUES (3, '质量保障部', 1, 3, '2025-08-31 19:29:16', '2025-08-31 19:29:16');
INSERT INTO `aioveu_department` VALUES (4, '市场营销中心', NULL, 1, '2025-08-31 19:29:16', '2025-08-31 19:29:16');
INSERT INTO `aioveu_department` VALUES (5, '品牌推广部', 4, 2, '2025-08-31 19:29:16', '2025-08-31 19:29:16');
INSERT INTO `aioveu_department` VALUES (6, '客户关系部', 6, 3, '2025-08-31 19:29:16', '2025-09-05 16:37:19');
INSERT INTO `aioveu_department` VALUES (7, '人力资源中心', NULL, 1, '2025-08-31 19:29:16', '2025-08-31 19:29:16');
INSERT INTO `aioveu_department` VALUES (8, '人才发展部', 7, 2, '2025-08-31 19:29:16', '2025-08-31 19:29:16');
INSERT INTO `aioveu_department` VALUES (9, '薪酬福利部', 7, 3, '2025-08-31 19:29:16', '2025-08-31 19:29:16');
INSERT INTO `aioveu_department` VALUES (10, '爱我部', 2, NULL, '2025-09-05 16:36:44', '2025-09-05 16:36:44');
INSERT INTO `aioveu_department` VALUES (11, '111', 5, NULL, '2025-09-05 18:31:42', '2025-09-05 18:31:42');
INSERT INTO `aioveu_department` VALUES (12, '雒世松', 10, NULL, '2025-09-08 15:55:30', '2025-09-08 15:55:30');

-- ----------------------------
-- Table structure for aioveu_employee
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_employee`;
CREATE TABLE `aioveu_employee`  (
  `employee_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `emp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '员工编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '性别：0-女，1-男',
  `birth_date` date NULL DEFAULT NULL COMMENT '出生日期',
  `id_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `dept_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '所属部门',
  `position_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '岗位ID',
  `hire_date` date NOT NULL COMMENT '入职日期',
  `salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '基本薪资',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-离职，1-在职,2-休假,3-实习',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`employee_id`) USING BTREE,
  UNIQUE INDEX `uk_emp_code`(`emp_code` ASC) USING BTREE,
  UNIQUE INDEX `uk_id_card`(`id_card` ASC) USING BTREE,
  INDEX `fk_employee_position`(`position_id` ASC) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE,
  INDEX `idx_dept_position`(`dept_id` ASC, `position_id` ASC) USING BTREE,
  INDEX `idx_hire_date`(`hire_date` ASC) USING BTREE,
  CONSTRAINT `fk_employee_department` FOREIGN KEY (`dept_id`) REFERENCES `aioveu_department` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_employee_position` FOREIGN KEY (`position_id`) REFERENCES `aioveu_position` (`position_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_employee
-- ----------------------------
INSERT INTO `aioveu_employee` VALUES (1, 'EMP1001', '李白', 1, '1990-05-20', '410823199005201234', '13061656199', 'libai@aioveu.com', 1, 1, '2020-03-15', 20000.00, 3, '2025-08-31 19:29:19', '2025-09-11 15:39:34');
INSERT INTO `aioveu_employee` VALUES (2, 'EMP1002', '杜甫', 1, '1988-11-12', '410823198811121235', '13061656198', 'dufu@aioveu.com', 1, 2, '2019-07-22', 30000.00, 1, '2025-08-31 19:29:19', '2025-08-31 19:29:19');
INSERT INTO `aioveu_employee` VALUES (3, 'EMP1003', '李清照', 3, '1995-02-28', '410823199502281236', '13061656197', 'liqingzhao@aioveu.com', 2, 5, '2021-01-10', 50000.00, 1, '2025-08-31 19:29:19', '2025-09-11 15:39:00');
INSERT INTO `aioveu_employee` VALUES (4, 'EMP1004', '白居易', 1, '1992-08-15', '410823199208151237', '13061656196', 'baijuyi@aioveu.com', 3, 6, '2022-05-30', 50000.00, 1, '2025-08-31 19:29:19', '2025-08-31 19:29:19');
INSERT INTO `aioveu_employee` VALUES (5, 'EMP1005', '苏轼', 1, '1993-04-18', '410823199304181238', '13061656195', 'sushi@aioveu.com', 4, 7, '2023-02-14', 35000.00, 1, '2025-08-31 19:29:19', '2025-08-31 19:29:19');
INSERT INTO `aioveu_employee` VALUES (6, 'EMP1007', '苏寻', 1, NULL, NULL, '1111', NULL, 2, 2, '2025-09-05', 222.00, 0, '2025-09-05 16:43:16', '2025-09-05 16:43:16');
INSERT INTO `aioveu_employee` VALUES (7, '1111', '辛弃疾', 1, '2025-09-11', '11111', '222', '2222', 1, 1, '2025-09-11', 222222.00, 1, '2025-09-11 15:35:02', '2025-09-11 15:35:02');

-- ----------------------------
-- Table structure for aioveu_equipment
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_equipment`;
CREATE TABLE `aioveu_equipment`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '设备ID（主键）',
  `asset_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资产编号（唯一）',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备名称',
  `category_id` bigint UNSIGNED NOT NULL COMMENT '设备分类ID',
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  `serial_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '序列号（唯一）',
  `location_id` int UNSIGNED NULL DEFAULT NULL COMMENT '位置ID（关联位置表）',
  `department_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '所属部门ID',
  `responsible_person` bigint UNSIGNED NULL DEFAULT NULL COMMENT '责任人（关联员工表）',
  `purchase_date` date NULL DEFAULT NULL COMMENT '采购日期',
  `purchase_price` decimal(12, 2) UNSIGNED NULL DEFAULT NULL COMMENT '采购价格',
  `warranty_period` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '保修期（月）',
  `maintenance_cycle` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '维保周期（月）',
  `last_maintenance` date NULL DEFAULT NULL COMMENT '上次维保日期',
  `next_maintenance` date NULL DEFAULT NULL COMMENT '下次维保日期',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-在用，2-闲置，3-维修中，4-报废',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_asset_no`(`asset_no` ASC) USING BTREE,
  UNIQUE INDEX `serial_no`(`serial_no` ASC) USING BTREE,
  INDEX `fk_equipment_department`(`department_id` ASC) USING BTREE,
  INDEX `fk_equipment_responsible`(`responsible_person` ASC) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE,
  INDEX `idx_category`(`category_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_next_maintenance`(`next_maintenance` ASC) USING BTREE,
  CONSTRAINT `fk_equipment_category` FOREIGN KEY (`category_id`) REFERENCES `aioveu_category` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_equipment_department` FOREIGN KEY (`department_id`) REFERENCES `aioveu_department` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_equipment_responsible` FOREIGN KEY (`responsible_person`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_equipment
-- ----------------------------
INSERT INTO `aioveu_equipment` VALUES (1, 'ASSET-001', '激光打印机', 3, 'HP LaserJet Pro M404dn', 'SN-PRT-001', 1, 1, 1, '2022-01-15', 1200.00, 24, 6, '2023-05-10', NULL, 1, NULL, '2025-08-31 19:29:34', '2025-08-31 19:29:34');
INSERT INTO `aioveu_equipment` VALUES (2, 'ASSET-002', '投影仪', 9, 'Epson EB-U05', 'SN-PROJ-001', 2, 2, 2, '2022-03-20', 3500.00, 36, 12, '2023-04-15', NULL, 1, NULL, '2025-08-31 19:29:34', '2025-08-31 19:29:34');
INSERT INTO `aioveu_equipment` VALUES (3, 'ASSET-003', '服务器', 10, 'Dell PowerEdge R740', 'SN-SVR-001', 3, 3, 3, '2021-11-10', 25000.00, 48, 6, '2023-06-01', NULL, 1, NULL, '2025-08-31 19:29:34', '2025-08-31 19:29:34');
INSERT INTO `aioveu_equipment` VALUES (4, 'ASSET-004', '空调', 5, '格力 KFR-72LW', 'SN-AC-001', 4, 4, 4, '2020-07-05', 6500.00, 60, 3, '2023-05-20', NULL, 2, NULL, '2025-08-31 19:29:34', '2025-09-02 20:02:37');
INSERT INTO `aioveu_equipment` VALUES (5, 'ASSET-005', 'SS', 9, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2025-09-02 19:56:38', '2025-09-02 20:02:28');
INSERT INTO `aioveu_equipment` VALUES (6, '111', '投影仪11', 1, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2025-09-05 17:35:17', '2025-09-05 17:35:17');
INSERT INTO `aioveu_equipment` VALUES (7, '333', '111', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2025-09-05 19:37:38', '2025-09-05 19:37:38');

-- ----------------------------
-- Table structure for aioveu_inbound
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_inbound`;
CREATE TABLE `aioveu_inbound`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '入库ID（主键）',
  `inbound_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '入库单号（唯一）',
  `material_id` bigint UNSIGNED NOT NULL COMMENT '物资ID',
  `warehouse_id` bigint UNSIGNED NOT NULL COMMENT '仓库ID',
  `quantity` decimal(12, 4) UNSIGNED NOT NULL COMMENT '入库数量（支持小数计量）',
  `unit_price` decimal(12, 4) UNSIGNED NOT NULL COMMENT '入库单价',
  `total_amount` decimal(12, 4) UNSIGNED NOT NULL COMMENT '总金额',
  `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `production_date` date NULL DEFAULT NULL COMMENT '生产日期',
  `expiry_date` date NULL DEFAULT NULL COMMENT '有效期至',
  `supplier_id` int UNSIGNED NULL DEFAULT NULL COMMENT '供应商ID',
  `inbound_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '入库类型：1-采购入库，2-退货入库，3-调拨入库，4-其他',
  `in_time` datetime NOT NULL COMMENT '入库时间',
  `operator_id` bigint UNSIGNED NOT NULL COMMENT '操作员ID（关联员工表）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_inbound_no`(`inbound_no` ASC) USING BTREE,
  INDEX `fk_inbound_operator`(`operator_id` ASC) USING BTREE,
  INDEX `idx_material`(`material_id` ASC) USING BTREE,
  INDEX `idx_warehouse`(`warehouse_id` ASC) USING BTREE,
  INDEX `idx_supplier`(`supplier_id` ASC) USING BTREE,
  INDEX `idx_inbound_type`(`inbound_type` ASC) USING BTREE,
  INDEX `idx_in_time`(`in_time` ASC) USING BTREE,
  CONSTRAINT `fk_inbound_material` FOREIGN KEY (`material_id`) REFERENCES `aioveu_material` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_inbound_operator` FOREIGN KEY (`operator_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_inbound_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `aioveu_warehouse` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_inbound
-- ----------------------------
INSERT INTO `aioveu_inbound` VALUES (1, 'IN-202306-001', 1, 1, 100.0000, 25.9900, 2599.0000, 'BATCH-2023-06-001', '2023-06-01', '2024-06-01', 2001, 2, '2023-06-05 10:30:00', 1, '采购入库', '2025-08-31 19:29:32', '2025-09-05 19:31:51');
INSERT INTO `aioveu_inbound` VALUES (2, 'IN-202306-002', 2, 1, 50.0000, 15.5000, 775.0000, 'BATCH-2023-06-002', '2023-06-05', '2025-06-05', 2001, 1, '2023-06-05 14:15:00', 1, '采购入库', '2025-08-31 19:29:32', '2025-08-31 19:29:32');
INSERT INTO `aioveu_inbound` VALUES (3, 'IN-202306-003', 3, 2, 2000.0000, 12.5000, 25000.0000, 'BATCH-2023-05-001', '2023-05-15', '2024-05-15', 2003, 1, '2023-06-06 09:00:00', 2, '生产原料采购', '2025-08-31 19:29:32', '2025-08-31 19:29:32');
INSERT INTO `aioveu_inbound` VALUES (4, 'IN-202306-004', 4, 3, 50.0000, 89.0000, 4450.0000, 'BATCH-2023-07-001', '2023-07-01', '2026-07-01', 2002, 1, '2023-06-07 11:20:00', 3, '电子产品采购', '2025-08-31 19:29:32', '2025-08-31 19:29:32');
INSERT INTO `aioveu_inbound` VALUES (5, 'sss', 1, 2, 11.0000, 11.0000, 11.0000, NULL, NULL, NULL, NULL, 1, '2025-09-05 19:34:50', 6, '百度', '2025-09-05 19:34:51', '2025-09-05 19:36:09');
INSERT INTO `aioveu_inbound` VALUES (6, '112233', 7, 5, 12.0000, 12.0000, 333.0000, '', '2025-09-11', '2025-09-11', NULL, 3, '2025-09-11 21:15:19', 3, '', '2025-09-11 21:16:01', '2025-09-11 21:16:01');
INSERT INTO `aioveu_inbound` VALUES (7, '111', 3, 2, 33.0000, 44.0000, 55.0000, '', NULL, NULL, NULL, 1, '2025-09-11 23:16:09', 1, '', '2025-09-11 23:16:10', '2025-09-11 23:16:10');

-- ----------------------------
-- Table structure for aioveu_inventory
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_inventory`;
CREATE TABLE `aioveu_inventory`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '库存ID（主键）',
  `warehouse_id` bigint UNSIGNED NOT NULL COMMENT '仓库ID',
  `material_id` bigint UNSIGNED NOT NULL COMMENT '物资ID',
  `quantity` decimal(12, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '当前库存数量（支持小数计量）',
  `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `production_date` date NULL DEFAULT NULL COMMENT '生产日期',
  `expiry_date` date NULL DEFAULT NULL COMMENT '有效期至',
  `last_inbound` datetime NULL DEFAULT NULL COMMENT '最后入库时间',
  `last_outbound` datetime NULL DEFAULT NULL COMMENT '最后出库时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_warehouse_material_batch`(`warehouse_id` ASC, `material_id` ASC, `batch_number` ASC) USING BTREE,
  INDEX `idx_warehouse`(`warehouse_id` ASC) USING BTREE,
  INDEX `idx_material`(`material_id` ASC) USING BTREE,
  INDEX `idx_expiry`(`expiry_date` ASC) USING BTREE,
  INDEX `idx_batch`(`batch_number` ASC) USING BTREE,
  CONSTRAINT `fk_inventory_material` FOREIGN KEY (`material_id`) REFERENCES `aioveu_material` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_inventory_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `aioveu_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存表（记录每个仓库每个物资的库存）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_inventory
-- ----------------------------
INSERT INTO `aioveu_inventory` VALUES (1, 1, 1, 150.0000, 'BATCH-2023-06-001', '2023-06-01', '2024-06-01', '2025-09-11 21:01:24', '2025-09-11 21:01:27', '2025-08-31 19:29:30', '2025-09-11 21:01:27');
INSERT INTO `aioveu_inventory` VALUES (2, 1, 2, 300.0000, 'BATCH-2023-06-002', '2023-06-05', '2025-06-05', NULL, NULL, '2025-08-31 19:29:30', '2025-08-31 19:29:30');
INSERT INTO `aioveu_inventory` VALUES (3, 1, 3, 800.0000, 'BATCH-2023-06-003', '2023-06-10', NULL, NULL, NULL, '2025-08-31 19:29:30', '2025-08-31 19:29:30');
INSERT INTO `aioveu_inventory` VALUES (4, 2, 4, 2000.0000, 'BATCH-2023-05-001', '2023-05-15', '2024-05-15', NULL, NULL, '2025-08-31 19:29:30', '2025-08-31 19:29:30');
INSERT INTO `aioveu_inventory` VALUES (5, 2, 5, 15.0000, 'BATCH-2023-07-001', '2023-07-01', '2026-07-01', NULL, NULL, '2025-08-31 19:29:30', '2025-08-31 19:29:30');
INSERT INTO `aioveu_inventory` VALUES (6, 3, 6, 50.0000, 'BATCH-2023-04-001', '2023-04-10', '2025-04-10', NULL, NULL, '2025-08-31 19:29:30', '2025-08-31 19:29:30');
INSERT INTO `aioveu_inventory` VALUES (7, 3, 7, 100.0000, 'BATCH-2023-07-002', '2023-07-05', NULL, NULL, NULL, '2025-08-31 19:29:30', '2025-08-31 19:29:30');
INSERT INTO `aioveu_inventory` VALUES (8, 4, 4, 111.0000, NULL, NULL, NULL, NULL, NULL, '2025-09-05 19:22:50', '2025-09-05 19:22:50');
INSERT INTO `aioveu_inventory` VALUES (9, 5, 4, 12.0000, NULL, NULL, NULL, NULL, NULL, '2025-09-05 19:23:19', '2025-09-05 19:23:19');
INSERT INTO `aioveu_inventory` VALUES (10, 3, 4, 100.0000, NULL, NULL, NULL, NULL, NULL, '2025-09-05 19:23:34', '2025-09-05 19:23:34');
INSERT INTO `aioveu_inventory` VALUES (11, 2, 4, 10000.0000, NULL, NULL, NULL, NULL, NULL, '2025-09-05 19:23:45', '2025-09-05 19:23:45');
INSERT INTO `aioveu_inventory` VALUES (12, 5, 4, 10000.0000, NULL, NULL, NULL, NULL, NULL, '2025-09-05 19:23:54', '2025-09-05 19:23:54');
INSERT INTO `aioveu_inventory` VALUES (13, 5, 4, 11.0000, '', '2025-09-11', NULL, NULL, NULL, '2025-09-11 18:32:51', '2025-09-11 18:32:51');
INSERT INTO `aioveu_inventory` VALUES (14, 4, 5, 11.0000, '', NULL, NULL, NULL, NULL, '2025-09-11 18:35:50', '2025-09-11 18:35:50');
INSERT INTO `aioveu_inventory` VALUES (17, 3, 2, 11.0000, '', NULL, '2025-09-11', '2025-09-11 18:59:12', '2025-09-11 18:59:12', '2025-09-11 18:59:40', '2025-09-11 18:59:40');
INSERT INTO `aioveu_inventory` VALUES (18, 2, 2, 11.0000, NULL, NULL, NULL, '2021-09-01 00:00:00', '2033-08-13 01:00:00', '2025-09-11 19:28:40', '2025-09-11 19:28:40');
INSERT INTO `aioveu_inventory` VALUES (19, 2, 2, 111.0000, '', NULL, NULL, '2015-01-01 00:00:00', '2015-01-01 00:00:00', '2025-09-11 19:39:21', '2025-09-11 19:39:21');
INSERT INTO `aioveu_inventory` VALUES (21, 2, 3, 1200.0000, '', NULL, NULL, '2022-01-01 00:00:00', '2024-01-01 00:00:00', '2025-09-11 20:03:32', '2025-09-11 20:03:32');
INSERT INTO `aioveu_inventory` VALUES (22, 1, 2, 111.0000, '', NULL, NULL, '2025-09-12 20:09:00', '2025-09-15 20:10:00', '2025-09-11 20:10:16', '2025-09-11 20:10:16');
INSERT INTO `aioveu_inventory` VALUES (23, 5, 2, 100.0000, '', NULL, NULL, '2025-09-11 20:59:20', '2025-09-11 20:59:23', '2025-09-11 20:59:25', '2025-09-11 20:59:25');
INSERT INTO `aioveu_inventory` VALUES (29, 5, 3, 1111.0000, '', '2025-09-11', NULL, '2025-09-12 21:16:00', '2025-09-14 21:13:00', '2025-09-11 21:13:54', '2025-09-11 21:13:54');
INSERT INTO `aioveu_inventory` VALUES (30, 3, 4, 111.0000, '', NULL, NULL, '2025-09-06 21:32:00', '2025-09-03 21:33:00', '2025-09-11 21:33:13', '2025-09-11 21:33:13');
INSERT INTO `aioveu_inventory` VALUES (34, 4, 7, 22.0000, '', NULL, NULL, '2025-09-11 22:45:23', '2025-09-11 22:45:23', '2025-09-11 22:45:30', '2025-09-11 22:45:30');

-- ----------------------------
-- Table structure for aioveu_laundry_clothing_type
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_laundry_clothing_type`;
CREATE TABLE `aioveu_laundry_clothing_type`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '衣物类型ID',
  `type_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型代码',
  `type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称',
  `category` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '衣物类别,0-上装-top,1-下装-bottom,2-外套-outerwear,3-内衣-underwear,4-配饰-accessories,5-家居用品-home,6-特殊衣物-special',
  `base_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '基础价格',
  `processing_time` smallint NOT NULL DEFAULT 60 COMMENT '标准处理时间(分钟)',
  `special_requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '特殊处理要求',
  `is_delicate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否精细衣物',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态(0-停用 1-启用)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_type_code`(`type_code` ASC) USING BTREE,
  UNIQUE INDEX `uniq_type_name`(`type_name` ASC) USING BTREE,
  INDEX `idx_category`(`category` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '衣物类型主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_laundry_clothing_type
-- ----------------------------
INSERT INTO `aioveu_laundry_clothing_type` VALUES (1, 'CT001', '衬衫', 0, 30.00, 45, '需要单独熨烫', 0, 1, '2025-09-30 17:20:39', '2025-10-06 22:44:25');
INSERT INTO `aioveu_laundry_clothing_type` VALUES (2, 'CT002', 'T恤', 0, 25.00, 30, NULL, 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (3, 'CT003', '毛衣', 0, 40.00, 60, '需要平铺晾干', 1, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (4, 'CT004', '西裤', 1, 40.00, 50, '需要裤线熨烫', 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (5, 'CT005', '牛仔裤', 1, 35.00, 40, NULL, 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (6, 'CT006', '短裤', 1, 25.00, 30, NULL, 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (7, 'CT007', '羽绒服', 2, 80.00, 120, '需要低温烘干', 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (8, 'CT008', '羊毛大衣', 2, 150.00, 180, '需要专业干洗', 1, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (9, 'CT009', '夹克', 2, 70.00, 90, NULL, 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (10, 'CT010', '内衣', 3, 20.00, 30, '需要单独清洗', 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (11, 'CT011', '袜子', 3, 10.00, 20, '需要成对处理', 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (12, 'CT012', '领带', 4, 30.00, 25, '需要手洗', 1, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (13, 'CT013', '围巾', 4, 30.00, 30, '需要平铺晾干', 1, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (14, 'CT014', '床单', 5, 45.00, 60, NULL, 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (15, 'CT015', '被套', 5, 60.00, 90, NULL, 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (16, 'CT016', '窗帘', 5, 80.00, 120, '需要大容量洗衣机', 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (17, 'CT017', '婚纱', 6, 200.00, 240, '需要特别护理', 1, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (18, 'CT018', '皮衣', 6, 180.00, 180, '需要专业护理', 1, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (19, 'CT019', '地毯', 5, 150.00, 180, '需要深度清洁', 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (20, 'CT020', '制服', 0, 50.00, 60, '需要高温消毒', 0, 1, '2025-09-30 17:20:39', NULL);
INSERT INTO `aioveu_laundry_clothing_type` VALUES (41, 'CT021', '我爱你', 0, 11.00, 22, '哇哦你', 0, 1, '2025-10-06 22:45:18', '2025-10-06 22:45:18');
INSERT INTO `aioveu_laundry_clothing_type` VALUES (42, 'CT022', '婵娟', 0, 111.00, 222, '婵娟', 0, 1, '2025-10-06 22:45:51', '2025-10-06 22:45:51');
INSERT INTO `aioveu_laundry_clothing_type` VALUES (60, 'CT023', '雪山', 0, 22.00, 11, '雪山', 1, 1, '2025-10-06 23:00:44', '2025-10-06 23:00:44');
INSERT INTO `aioveu_laundry_clothing_type` VALUES (61, 'CT024', '杨柳', 0, 11.00, 22, '杨柳', 0, 1, '2025-10-06 23:01:05', '2025-10-06 23:01:05');

-- ----------------------------
-- Table structure for aioveu_laundry_order
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_laundry_order`;
CREATE TABLE `aioveu_laundry_order`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `member_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '会员ID',
  `customer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `customer_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户电话',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单状态 0创建,1接收,2洗衣,3干燥,4熨烫,5质量检查,6完成,7运送,8取消',
  `total_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总额',
  `discount_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣金额',
  `actual_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实付金额',
  `payment_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付状态 1-未支付-unpaid,2-部分支付-partial,3-已支付-paid,4-未支付-refunded',
  `payment_method_id` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '支付方式ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收衣时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '交付时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_customer_phone`(`customer_phone` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `aioveu_member` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '洗衣订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_laundry_order
-- ----------------------------
INSERT INTO `aioveu_laundry_order` VALUES (1, 'LC202510060001', 1, '李白', '13061656199', 1, 150.00, 15.00, 135.00, 1, NULL, '2025-09-30 17:18:19', '2025-09-10 10:30:00', '2025-09-11 16:00:00', '2025-09-12 14:20:00', '2025-10-06 23:15:00', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (2, 'LC202510060002', 3, '杜甫', '13061656199', 2, 320.00, 64.00, 256.00, 1, NULL, '2025-09-30 17:18:19', '2025-09-12 11:15:00', '2025-09-14 10:30:00', NULL, '2025-10-06 23:15:05', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (3, 'LC202510060003', 5, '王维', '13061656199', 3, 85.00, 8.50, 76.50, 2, NULL, '2025-09-30 17:18:19', '2025-09-15 14:20:00', NULL, NULL, '2025-10-06 23:15:08', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (4, 'LC202510060004', 7, '李清照', '13061656199', 4, 210.00, 42.00, 168.00, 4, NULL, '2025-09-30 17:18:19', '2025-09-18 09:45:00', NULL, NULL, '2025-10-06 23:15:10', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (5, 'LC202510060005', 9, '曹植', '13061656199', 5, 120.00, 12.00, 108.00, 4, NULL, '2025-09-30 17:18:19', '2025-09-20 16:30:00', NULL, NULL, '2025-10-06 23:15:13', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (6, 'LC202510060006', NULL, '张先生', '13800138011', 6, 95.00, 0.00, 95.00, 1, NULL, '2025-09-30 17:18:19', '2025-09-11 14:10:00', '2025-09-12 15:30:00', '2025-09-13 10:15:00', '2025-10-06 23:15:16', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (7, 'LC202510060007', NULL, '李女士111', '13800138012', 6, 180.00, 0.00, 180.00, 1, NULL, '2025-09-30 17:18:19', '2025-09-13 10:20:00', '2025-09-15 11:45:00', NULL, '2025-10-06 23:15:18', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (8, 'LC202510060008', NULL, '王先生', '13800138013', 5, 75.00, 0.00, 75.00, 2, NULL, '2025-09-30 17:18:19', '2025-09-16 15:30:00', NULL, NULL, '2025-10-06 23:15:20', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (9, 'LC202510060009', NULL, '赵女士', '13800138014', 4, 210.00, 0.00, 210.00, 2, NULL, '2025-09-30 17:18:19', NULL, NULL, NULL, '2025-10-06 23:15:23', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (10, 'LC202510060010', NULL, '钱先生', '13800138015', 3, 120.00, 0.00, 120.00, 2, NULL, '2025-09-30 17:18:19', '2025-09-22 11:00:00', NULL, NULL, '2025-10-06 23:15:27', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (11, 'LC202510060011', 6, NULL, NULL, 2, 850.00, 170.00, 680.00, 2, NULL, '2025-09-30 17:18:19', '2025-09-25 14:45:00', NULL, NULL, '2025-10-06 23:15:31', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (12, 'LC202510060012', 10, NULL, NULL, 1, 420.00, 84.00, 336.00, 2, NULL, '2025-09-30 17:18:19', '2025-09-26 10:20:00', NULL, NULL, '2025-10-06 23:15:34', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (13, 'LC202510060013', 2, NULL, NULL, 2, 380.00, 38.00, 342.00, 3, NULL, '2025-09-30 17:18:19', '2025-09-20 11:30:00', '2025-09-22 14:00:00', '2025-09-25 16:45:00', '2025-10-06 23:15:37', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (14, 'LC202510060014', NULL, '22', '13061656', 0, 1.00, 2.00, 3.00, 1, 22, '2025-10-06 21:39:34', '2025-10-06 21:38:31', '2025-10-06 21:38:33', '2025-10-06 21:38:34', '2025-10-06 23:15:43', '22');
INSERT INTO `aioveu_laundry_order` VALUES (17, 'LC202510060015', 2, '222', ' 12333', 0, 11.00, 222.00, 33.00, 2, NULL, '2025-10-06 22:03:46', '2025-10-06 21:58:45', '2025-10-06 21:58:46', '2025-10-06 21:58:47', '2025-10-06 23:15:50', '哈哈哈');
INSERT INTO `aioveu_laundry_order` VALUES (18, 'LC202510060016', 3, '222', '222', 0, 22.00, 11.00, 22.00, 2, NULL, '2025-10-06 22:04:26', '2025-10-06 22:04:22', NULL, NULL, '2025-10-06 23:15:54', '3ddd ');
INSERT INTO `aioveu_laundry_order` VALUES (19, 'LC202510060017', 2, NULL, NULL, 1, 22.00, 11.00, 1.00, 1, NULL, '2025-10-06 23:12:27', NULL, NULL, NULL, '2025-10-06 23:16:00', NULL);
INSERT INTO `aioveu_laundry_order` VALUES (21, 'LC202510060018', 3, '白雪', '1306165', 1, 140.00, 140.00, 140.00, 3, NULL, '2025-10-06 23:18:15', '2025-10-06 23:18:07', NULL, NULL, '2025-10-06 23:18:15', '白雪');

-- ----------------------------
-- Table structure for aioveu_laundry_order_item
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_laundry_order_item`;
CREATE TABLE `aioveu_laundry_order_item`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '衣物明细ID',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单ID',
  `clothing_type_id` bigint UNSIGNED NOT NULL COMMENT '衣物类型ID',
  `custom_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义衣物类型',
  `problem_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '问题描述',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `process_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '处理状态 1-待处理-pending,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-质检中-quality_check,6-已完成-finished,7-问题衣物-problem',
  `special_instruction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊要求',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始处理时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '完成处理时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_clothing_type`(`clothing_type_id` ASC) USING BTREE,
  INDEX `idx_process_status`(`process_status` ASC) USING BTREE,
  CONSTRAINT `fk_item_clothing_type` FOREIGN KEY (`clothing_type_id`) REFERENCES `aioveu_laundry_clothing_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_item_order` FOREIGN KEY (`order_id`) REFERENCES `aioveu_laundry_order` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '洗衣订单衣物明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_laundry_order_item
-- ----------------------------
INSERT INTO `aioveu_laundry_order_item` VALUES (1, 1, 1, '11', '领口发黄', 30.00, 6, '需要重点去黄', '2025-10-07 01:14:59', '2025-10-07 01:15:00', '2025-09-30 17:26:10', '2025-10-07 01:15:02');
INSERT INTO `aioveu_laundry_order_item` VALUES (2, 1, 4, '哈哈哈', '裤脚磨损', 40.00, 1, '需要修补', '2025-10-07 01:15:13', '2025-10-07 01:15:14', '2025-09-30 17:26:10', '2025-10-07 01:15:16');
INSERT INTO `aioveu_laundry_order_item` VALUES (3, 1, 7, NULL, '污渍较多', 80.00, 6, '需要深度清洁', '2025-10-07 01:15:07', '2025-10-07 01:15:09', '2025-09-30 17:26:10', '2025-10-07 01:15:10');
INSERT INTO `aioveu_laundry_order_item` VALUES (4, 2, 8, NULL, '整体清洁', 150.00, 6, '需要低温烘干', '2025-10-07 01:15:18', '2025-10-07 01:15:19', '2025-09-30 17:26:10', '2025-10-07 01:15:20');
INSERT INTO `aioveu_laundry_order_item` VALUES (5, 2, 3, NULL, '袖口起球', 70.00, 6, '需要去球处理', '2025-10-07 01:15:23', '2025-10-07 01:15:24', '2025-09-30 17:26:10', '2025-10-07 01:15:25');
INSERT INTO `aioveu_laundry_order_item` VALUES (6, 2, 13, NULL, '袖口起球', 30.00, 6, NULL, '2025-10-07 01:15:27', '2025-10-07 01:15:28', '2025-09-30 17:26:10', '2025-10-07 18:53:23');
INSERT INTO `aioveu_laundry_order_item` VALUES (7, 2, 12, NULL, '酒渍', 70.00, 6, '需要特殊去渍', '2025-10-07 01:15:32', '2025-10-07 01:15:33', '2025-09-30 17:26:10', '2025-10-07 01:15:35');
INSERT INTO `aioveu_laundry_order_item` VALUES (8, 3, 2, NULL, '汗渍', 25.00, 4, NULL, '2025-10-07 01:15:37', '2025-10-07 01:15:38', '2025-09-30 17:26:10', '2025-10-07 01:15:40');
INSERT INTO `aioveu_laundry_order_item` VALUES (9, 3, 5, NULL, '油渍', 35.00, 3, '需要重点去油', '2025-10-07 01:15:42', '2025-10-07 01:15:43', '2025-09-30 17:26:10', '2025-10-07 01:15:46');
INSERT INTO `aioveu_laundry_order_item` VALUES (10, 3, 6, NULL, '油渍', 25.00, 2, NULL, NULL, NULL, '2025-09-30 17:26:10', '2025-10-07 18:53:29');
INSERT INTO `aioveu_laundry_order_item` VALUES (11, 4, 17, NULL, '红酒渍', 120.00, 2, '需要特殊去渍', NULL, NULL, '2025-09-30 17:26:10', NULL);
INSERT INTO `aioveu_laundry_order_item` VALUES (12, 4, 13, NULL, '油渍', 30.00, 1, '需要手洗', NULL, NULL, '2025-09-30 17:26:10', '2025-10-07 18:53:30');
INSERT INTO `aioveu_laundry_order_item` VALUES (13, 4, 10, NULL, '油渍', 60.00, 1, '需要单独清洗', NULL, NULL, '2025-09-30 17:26:10', '2025-10-07 18:53:30');
INSERT INTO `aioveu_laundry_order_item` VALUES (14, 5, 9, NULL, '袖口污渍', 70.00, 1, NULL, NULL, NULL, '2025-09-30 17:26:10', NULL);
INSERT INTO `aioveu_laundry_order_item` VALUES (15, 5, 2, NULL, '油渍', 50.00, 1, NULL, NULL, NULL, '2025-09-30 17:26:10', '2025-10-07 18:53:32');
INSERT INTO `aioveu_laundry_order_item` VALUES (16, 6, 8, NULL, '整体清洁', 95.00, 6, '需要干洗', NULL, NULL, '2025-09-30 17:26:10', NULL);
INSERT INTO `aioveu_laundry_order_item` VALUES (17, 7, 16, NULL, '灰尘较多', 180.00, 5, '需要大容量洗衣机', NULL, NULL, '2025-09-30 17:26:10', NULL);
INSERT INTO `aioveu_laundry_order_item` VALUES (18, 8, 14, NULL, '油渍', 45.00, 3, NULL, NULL, NULL, '2025-09-30 17:26:10', '2025-10-07 18:53:33');
INSERT INTO `aioveu_laundry_order_item` VALUES (19, 8, 15, NULL, '油渍', 30.00, 2, NULL, NULL, NULL, '2025-09-30 17:26:10', '2025-10-07 18:53:34');
INSERT INTO `aioveu_laundry_order_item` VALUES (20, 9, 19, NULL, '宠物毛发', 210.00, 1, '需要深度清洁', NULL, NULL, '2025-09-30 17:26:10', NULL);
INSERT INTO `aioveu_laundry_order_item` VALUES (21, 10, 15, NULL, '油渍', 120.00, 7, '取消订单', NULL, NULL, '2025-09-30 17:26:10', '2025-10-07 18:53:35');
INSERT INTO `aioveu_laundry_order_item` VALUES (22, 11, 18, NULL, '整体清洁', 350.00, 2, '需要专业护理', NULL, NULL, '2025-09-30 17:26:10', NULL);
INSERT INTO `aioveu_laundry_order_item` VALUES (23, 11, 18, NULL, '油渍', 250.00, 1, '需要专业护理', NULL, NULL, '2025-09-30 17:26:10', '2025-10-07 18:53:37');
INSERT INTO `aioveu_laundry_order_item` VALUES (24, 11, 18, NULL, '油渍', 250.00, 1, '需要专业护理', NULL, NULL, '2025-09-30 17:26:10', '2025-10-07 18:53:38');
INSERT INTO `aioveu_laundry_order_item` VALUES (25, 12, 17, NULL, '整体清洁', 420.00, 1, '需要特别护理', NULL, NULL, '2025-09-30 17:26:10', NULL);
INSERT INTO `aioveu_laundry_order_item` VALUES (26, 13, 20, NULL, '油污', 150.00, 2, '需要去油', NULL, NULL, '2025-09-30 17:26:10', NULL);
INSERT INTO `aioveu_laundry_order_item` VALUES (27, 13, 5, NULL, '油漆渍', 120.00, 2, '需要特殊处理', NULL, NULL, '2025-09-30 17:26:10', NULL);
INSERT INTO `aioveu_laundry_order_item` VALUES (28, 13, 11, NULL, '油渍', 110.00, 1, '需要消毒', NULL, NULL, '2025-09-30 17:26:10', '2025-10-07 18:53:39');
INSERT INTO `aioveu_laundry_order_item` VALUES (29, 1, 3, 'ss', '油渍', 11.00, 2, '11', '2025-10-07 01:16:45', '2025-10-07 01:16:47', '2025-10-07 01:16:48', '2025-10-07 18:53:43');

-- ----------------------------
-- Table structure for aioveu_laundry_process_image
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_laundry_process_image`;
CREATE TABLE `aioveu_laundry_process_image`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图片记录ID',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单ID',
  `item_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '衣物明细ID',
  `image_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '图片类型 1-收衣时-receive,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-完成时-finish,6-问题衣物-problem,7-质检时-quality_check,8-交付时-delivery',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
  `upload_user` bigint UNSIGNED NULL DEFAULT NULL COMMENT '上传人ID',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_item_id`(`item_id` ASC) USING BTREE,
  INDEX `idx_image_type`(`image_type` ASC) USING BTREE,
  INDEX `idx_upload_time`(`create_time` ASC) USING BTREE,
  INDEX `fk_image_upload_user`(`upload_user` ASC) USING BTREE,
  CONSTRAINT `fk_image_item` FOREIGN KEY (`item_id`) REFERENCES `aioveu_laundry_order_item` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_image_order` FOREIGN KEY (`order_id`) REFERENCES `aioveu_laundry_order` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_image_upload_user` FOREIGN KEY (`upload_user`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '洗衣流程图片记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_laundry_process_image
-- ----------------------------
INSERT INTO `aioveu_laundry_process_image` VALUES (1, 1, 1, 1, 'https://minio.aioveu.com/aioveu/20250810/352485413d814dee87d9b7160dfe916e.png', 4, '整体收衣照片', '2025-09-30 17:35:05', '2025-10-07 20:56:25');
INSERT INTO `aioveu_laundry_process_image` VALUES (2, 1, 1, 1, 'http://localhost:9000/aioveu/20251008/644a4ee668cf421bbd74dae9869b111a.jpg', 1, '问题衣物特写', '2025-09-30 17:35:05', '2025-10-08 14:53:32');
INSERT INTO `aioveu_laundry_process_image` VALUES (3, 1, 1, 2, 'http://localhost:9000/aioveu/20251008/a808ff22a2964b7ea3e947594a1d9a0c.png', 2, '衬衫洗涤过程', '2025-09-30 17:35:05', '2025-10-08 14:54:49');
INSERT INTO `aioveu_laundry_process_image` VALUES (4, 1, 1, 4, 'http://localhost:9000/aioveu/20251008/6d949d28b8944bfbb6124b916c61f899.png', 3, '衬衫熨烫过程', '2025-09-30 17:35:05', '2025-10-08 14:55:59');
INSERT INTO `aioveu_laundry_process_image` VALUES (5, 1, 1, 5, 'https://minio.aioveu.com/aioveu/20250810/352485413d814dee87d9b7160dfe916e.png', 4, '衬衫完成效果', '2025-09-30 17:35:05', '2025-09-30 18:05:28');
INSERT INTO `aioveu_laundry_process_image` VALUES (6, 1, 2, 6, 'https://minio.aioveu.com/aioveu/20250810/352485413d814dee87d9b7160dfe916e.png', 2, '西裤磨损特写', '2025-09-30 17:35:05', '2025-10-08 02:54:54');
INSERT INTO `aioveu_laundry_process_image` VALUES (7, 1, 2, 5, 'http://localhost:9000/aioveu/20251008/d599cff100ea42de9dfcabece9d16c34.png', 3, '西裤修补后效果', '2025-09-30 17:35:05', '2025-10-08 02:55:48');
INSERT INTO `aioveu_laundry_process_image` VALUES (8, 1, 3, 5, 'https://oss.example.com/laundry/20250910/item3_finish.jpg', 4, '羽绒服完成效果', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (9, 2, NULL, 1, 'https://oss.example.com/laundry/20250912/order2_receive1.jpg', 1, '整体收衣照片', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (10, 2, 4, 2, 'https://oss.example.com/laundry/20250912/item4_washing.jpg', 2, '羊毛大衣洗涤', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (11, 2, 4, 3, 'https://oss.example.com/laundry/20250912/item4_drying.jpg', 3, '羊毛大衣烘干', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (12, 2, 5, 6, 'https://oss.example.com/laundry/20250912/item5_problem.jpg', 2, '羊绒衫起球问题', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (13, 2, 5, 5, 'https://oss.example.com/laundry/20250912/item5_finish.jpg', 3, '羊绒衫完成效果', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (14, 2, NULL, 7, 'https://oss.example.com/laundry/20250912/order2_quality1.jpg', 5, '整体质检', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (15, 2, NULL, 7, 'https://oss.example.com/laundry/20250912/order2_quality2.jpg', 5, '细节检查', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (16, 2, NULL, 8, 'https://oss.example.com/laundry/20250912/order2_delivery.jpg', 6, '交付照片', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (17, 3, 8, 6, 'https://oss.example.com/laundry/20250915/item8_problem.jpg', 1, '牛仔裤油渍问题', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (18, 3, 8, 2, 'https://oss.example.com/laundry/20250915/item8_washing.jpg', 2, '牛仔裤去油处理', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (19, 3, 8, 5, 'https://oss.example.com/laundry/20250915/item8_finish.jpg', 3, '牛仔裤完成效果', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (20, 3, 9, 4, 'https://oss.example.com/laundry/20250915/item9_ironing.jpg', 4, '运动裤熨烫', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (21, 4, 10, 1, 'https://oss.example.com/laundry/20250918/item10_receive.jpg', 1, '婚纱收衣照片', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (22, 4, 10, 6, 'https://oss.example.com/laundry/20250918/item10_problem.jpg', 2, '婚纱红酒渍特写', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (23, 4, 10, 2, 'https://oss.example.com/laundry/20250918/item10_washing.jpg', 3, '婚纱特殊处理', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (24, 4, 10, 5, 'https://oss.example.com/laundry/20250918/item10_finish.jpg', 4, '婚纱完成效果', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (25, 4, NULL, 8, 'https://oss.example.com/laundry/20250918/order4_delivery.jpg', 6, '婚纱交付', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (26, 5, 13, 1, 'https://oss.example.com/laundry/20250920/item13_receive.jpg', 1, '夹克收衣照片', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (27, 5, 13, 4, 'https://oss.example.com/laundry/20250920/item13_ironing1.jpg', 3, '夹克熨烫过程', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (28, 5, 13, 4, 'https://oss.example.com/laundry/20250920/item13_ironing2.jpg', 3, '袖口特写', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (29, 5, 13, 5, 'https://oss.example.com/laundry/20250920/item13_finish.jpg', 4, '夹克完成效果', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (30, 6, 14, 1, 'https://oss.example.com/laundry/20250922/item14_receive.jpg', 1, '西装外套收衣', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (31, 6, 14, 5, 'https://oss.example.com/laundry/20250922/item14_finish.jpg', 4, '西装完成效果', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (32, 7, 15, 2, 'https://oss.example.com/laundry/20250925/item15_washing1.jpg', 2, '窗帘洗涤过程', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (33, 7, 15, 2, 'https://oss.example.com/laundry/20250925/item15_washing2.jpg', 2, '大容量洗衣机', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (34, 7, 15, 7, 'https://oss.example.com/laundry/20250925/item15_quality.jpg', 5, '窗帘质检', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (35, 8, 16, 3, 'https://oss.example.com/laundry/20250926/item16_drying.jpg', 1, '床单烘干过程', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (36, 8, 17, 2, 'https://oss.example.com/laundry/20250926/item17_washing.jpg', 2, '被套洗涤过程', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (37, 9, 18, 6, 'https://oss.example.com/laundry/20250927/item18_problem.jpg', 5, '地毯污渍特写', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (38, 9, 18, 2, 'https://oss.example.com/laundry/20250927/item18_washing.jpg', 2, '地毯深度清洁', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (39, 10, NULL, 6, 'https://oss.example.com/laundry/20250928/order10_problem.jpg', 5, '毛毯问题说明', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (40, 10, NULL, 8, 'https://oss.example.com/laundry/20250928/order10_delivery.jpg', 6, '快递单号记录', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (41, 11, 19, 1, 'https://oss.example.com/laundry/20250929/item19_receive.jpg', 1, '皮衣收衣照片', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (42, 11, 19, 2, 'https://oss.example.com/laundry/20250929/item19_washing.jpg', 2, '皮衣专业处理', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (43, 11, 19, 5, 'https://oss.example.com/laundry/20250929/item19_finish.jpg', 4, '皮衣完成效果', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (44, 12, 20, 1, 'https://oss.example.com/laundry/20250930/item20_receive.jpg', 1, '婚纱收衣照片', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (45, 12, 20, 7, 'https://oss.example.com/laundry/20250930/item20_quality.jpg', 5, '婚纱质检', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (46, 13, 21, 6, 'https://oss.example.com/laundry/20251/item21_problem.jpg', 1, '制服油污问题', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (47, 13, 21, 2, 'https://oss.example.com/laundry/20251/item21_washing.jpg', 2, '制服去油处理', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (48, 13, 22, 6, 'https://oss.example.com/laundry/20251/item22_problem.jpg', 1, '工作裤油漆渍', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (49, 13, 22, 2, 'https://oss.example.com/laundry/20251/item22_washing.jpg', 2, '工作裤特殊处理', '2025-09-30 17:35:05', NULL);
INSERT INTO `aioveu_laundry_process_image` VALUES (55, 1, 1, 1, 'https://localhost/aioveu/20251008/b22ccf08758643ff8c323f45f7c3a925.png', 6, '嘎嘎嘎', '2025-10-08 02:03:23', '2025-10-08 02:03:23');
INSERT INTO `aioveu_laundry_process_image` VALUES (56, 2, NULL, 2, 'https://localhost/aioveu/20251008/f783b97ff7dc4644878863c5dd264c4d.png', NULL, '刚刚', '2025-10-08 02:05:36', '2025-10-08 02:05:36');
INSERT INTO `aioveu_laundry_process_image` VALUES (57, 1, 2, 1, 'http://localhost/aioveu/20251008/97b6b59dd881412fbf3953b35205cecf.png', 5, '杀杀杀', '2025-10-08 02:19:54', '2025-10-08 02:19:54');
INSERT INTO `aioveu_laundry_process_image` VALUES (59, 1, 2, 2, 'http://localhost:9000/aioveu/20251008/d599cff100ea42de9dfcabece9d16c34.png', 4, '哈哈哈哈', '2025-10-08 02:23:23', '2025-10-08 02:23:23');

-- ----------------------------
-- Table structure for aioveu_material
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_material`;
CREATE TABLE `aioveu_material`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '物资ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物资名称',
  `category_id` bigint UNSIGNED NOT NULL COMMENT '分类ID',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '个' COMMENT '单位',
  `spec` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `purchase_price` decimal(12, 2) UNSIGNED NOT NULL COMMENT '采购单价（正数）',
  `supplier_id` int UNSIGNED NULL DEFAULT NULL COMMENT '供应商ID',
  `min_stock` int UNSIGNED NULL DEFAULT 0 COMMENT '最低库存量（非负整数）',
  `max_stock` int UNSIGNED NULL DEFAULT 100 COMMENT '最高库存量（非负整数）',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '启用状态：0-禁用，1-启用',
  `barcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品条码（唯一标识）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `barcode`(`barcode` ASC) USING BTREE,
  INDEX `idx_category`(`category_id` ASC) USING BTREE,
  INDEX `idx_supplier`(`supplier_id` ASC) USING BTREE,
  INDEX `idx_barcode`(`barcode` ASC) USING BTREE,
  INDEX `idx_active`(`is_active` ASC) USING BTREE,
  CONSTRAINT `fk_material_category` FOREIGN KEY (`category_id`) REFERENCES `aioveu_category` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_stock_range` CHECK (`min_stock` <= `max_stock`)
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物资表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_material
-- ----------------------------
INSERT INTO `aioveu_material` VALUES (1, 'A4复印纸', 1, '包', '80g/500张', 25.99, 2001, 50, 200, 1, '6923456789012', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (2, '黑色签字笔', 1, '盒', '0.5mm/12支装', 15.50, 2001, 100, 500, 1, '6934567890123', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (3, '文件夹', 1, '个', 'A4尺寸/蓝色', 3.80, 2001, 200, 1000, 1, '6945678901234', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (4, '便签纸', 1, '本', '75x75mm/100页', 5.20, 2001, 150, 800, 1, '6956789012345', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (5, '笔记本电脑', 2, '台', '15.6英寸/i7/16GB', 6500.00, 2002, 5, 20, 1, '6967890123456', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (6, '无线鼠标', 2, '个', '蓝牙/静音', 89.00, 2002, 20, 100, 1, '6978901234567', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (7, 'USB闪存盘', 2, '个', '64GB/USB3.0', 45.00, 2002, 50, 300, 1, '6989012345678', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (8, '显示器', 2, '台', '27英寸/4K', 1999.00, 2002, 3, 15, 1, '6990123456789', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (9, '钢材', 3, '吨', 'Q235/Φ20mm', 4200.00, 2003, 10, 50, 1, '7001234567890', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (10, '塑料颗粒', 3, '千克', 'PP/白色', 12.50, 2003, 500, 2000, 1, '7012345678901', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (11, '电子元件', 3, '盒', 'SMD/1000pcs', 85.00, 2003, 100, 500, 1, '7023456789012', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (12, '润滑油', 3, '桶', '20L/工业级', 280.00, 2003, 5, 20, 1, '7034567890123', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (13, '洗手液', 11, '瓶', '500ml/抑菌', 18.00, 2004, 30, 150, 1, '7045678901234', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (14, '消毒湿巾', 11, '包', '80片/桶装', 25.00, 2004, 50, 300, 1, '7056789012345', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (15, '垃圾袋', 11, '卷', '大号/50个', 15.00, 2004, 100, 500, 1, '7067890123456', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (16, '空气清新剂', 11, '罐', '300ml/柠檬味', 22.00, 2004, 20, 100, 1, '7078901234567', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (17, '电动螺丝刀', 11, '把', '12V/锂电', 199.00, 2005, 10, 50, 1, '7089012345678', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (18, '万用表', 11, '台', '数字/自动量程', 150.00, 2005, 5, 30, 1, '7090123456789', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (19, '安全帽', 11, '顶', 'ABS材质/黄色', 35.00, 2005, 50, 200, 1, '7101234567890', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (20, '工具箱', 11, '套', '32件套', 280.00, 2005, 8, 40, 1, '7112345678901', '2025-08-31 19:29:26', '2025-08-31 19:29:26');
INSERT INTO `aioveu_material` VALUES (21, '钢琴', 2, '个', NULL, 11.00, NULL, 0, 100, 1, '222', '2025-09-05 17:15:22', '2025-09-05 17:15:39');
INSERT INTO `aioveu_material` VALUES (22, '111', 2, '个', NULL, 11.00, NULL, 0, 100, 0, '111', '2025-09-05 19:04:19', '2025-09-05 19:04:19');
INSERT INTO `aioveu_material` VALUES (24, '222', 1, '个', NULL, 111.00, NULL, 0, 100, 0, '333', '2025-09-05 19:08:00', '2025-09-05 19:08:00');
INSERT INTO `aioveu_material` VALUES (25, '333', 3, '个', NULL, 111.00, NULL, 0, 100, 0, '444', '2025-09-05 19:08:37', '2025-09-05 19:08:37');
INSERT INTO `aioveu_material` VALUES (26, '可爱', 23, '个', NULL, 100.00, NULL, 100, 100, 1, '11111', '2025-09-11 18:15:42', '2025-09-11 18:15:42');

-- ----------------------------
-- Table structure for aioveu_member
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_member`;
CREATE TABLE `aioveu_member`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '会员ID',
  `member_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员卡号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `id_card` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `level_id` bigint UNSIGNED NOT NULL DEFAULT 1 COMMENT '会员等级ID',
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入会时间',
  `total_consumption` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '累计消费金额',
  `last_visit` datetime NULL DEFAULT NULL COMMENT '最后到店时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态(0-禁用 1-正常)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_member_no`(`member_no` ASC) USING BTREE,
  UNIQUE INDEX `uniq_phone`(`phone` ASC) USING BTREE,
  INDEX `idx_level_id`(`level_id` ASC) USING BTREE,
  INDEX `idx_join_date`(`join_date` ASC) USING BTREE,
  CONSTRAINT `fk_member_level` FOREIGN KEY (`level_id`) REFERENCES `aioveu_member_level` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_member
-- ----------------------------
INSERT INTO `aioveu_member` VALUES (1, 'M20250001', '张三', '13800138001', '110101199001011234', 7, '2025-01-15 10:30:00', 1250.00, '2025-09-25 14:20:00', 0, '2025-09-27 14:28:51', '2025-10-02 15:21:28');
INSERT INTO `aioveu_member` VALUES (2, 'M20250002', '李四1', '13800138002', '110101199002022345', 1, '2025-02-20 11:15:00', 680.50, '2025-09-20 16:45:00', 1, '2025-09-27 14:28:51', '2025-10-07 20:10:23');
INSERT INTO `aioveu_member` VALUES (3, 'M20250003', '王五', '13800138003', '110101199003033456', 3, '2025-03-10 09:45:00', 3250.00, '2025-09-26 10:30:00', 0, '2025-09-27 14:28:51', '2025-10-01 01:32:26');
INSERT INTO `aioveu_member` VALUES (4, 'M20250004', '赵六', '13800138004', '110101199004044567', 2, '2025-04-05 14:20:00', 980.00, '2025-09-22 15:10:00', 1, '2025-09-27 14:28:51', NULL);
INSERT INTO `aioveu_member` VALUES (5, 'M20250005', '钱七', '13800138005', '110101199005055678', 7, '2025-05-18 16:00:00', 420.00, '2025-09-18 11:30:00', 1, '2025-09-27 14:28:51', '2025-10-02 14:22:37');
INSERT INTO `aioveu_member` VALUES (6, 'M20250006', '孙八', '13800138006', '110101199006066789', 3, '2025-06-22 13:40:00', 4800.00, '2025-09-25 17:20:00', 1, '2025-09-27 14:28:51', NULL);
INSERT INTO `aioveu_member` VALUES (7, 'M20250007', '周九', '13800138007', '110101199007077890', 2, '2025-07-30 10:10:00', 1350.00, '2025-09-24 14:50:00', 1, '2025-09-27 14:28:51', NULL);
INSERT INTO `aioveu_member` VALUES (8, 'M20250008', '吴十', '13800138008', '110101199008088901', 1, '2025-08-12 15:30:00', 250.00, '2025-09-19 10:15:00', 1, '2025-09-27 14:28:51', NULL);
INSERT INTO `aioveu_member` VALUES (9, 'M20250009', '郑十一', '13800138009', '110101199009099012', 2, '2025-09-05 11:20:00', 750.00, '2025-09-26 09:40:00', 1, '2025-09-27 14:28:51', NULL);
INSERT INTO `aioveu_member` VALUES (10, 'M20250010', '王芳', '13800138010', '110101199010101023', 3, '2025-09-20 14:00:00', 3200.00, '2025-09-26 16:00:00', 1, '2025-09-27 14:28:51', NULL);

-- ----------------------------
-- Table structure for aioveu_member_account
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_member_account`;
CREATE TABLE `aioveu_member_account`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `member_id` bigint UNSIGNED NOT NULL COMMENT '会员ID',
  `cash_balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '现金余额',
  `gift_balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '赠送余额',
  `total_balance` decimal(10, 2) GENERATED ALWAYS AS ((`cash_balance` + `gift_balance`)) VIRTUAL COMMENT '总余额' NULL,
  `last_recharge_time` datetime NULL DEFAULT NULL COMMENT '最后充值时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '账户状态(0-冻结 1-正常)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_total_balance`(`total_balance` ASC) USING BTREE,
  CONSTRAINT `fk_member_account_member` FOREIGN KEY (`member_id`) REFERENCES `aioveu_member` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员充值账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_member_account
-- ----------------------------
INSERT INTO `aioveu_member_account` VALUES (1, 1, 10901.00, 9202.00, DEFAULT, '2025-10-06 19:01:12', 0, '2025-09-27 14:43:17', '2025-10-06 19:16:04');
INSERT INTO `aioveu_member_account` VALUES (2, 2, 860.00, 105.00, DEFAULT, '2023-09-18 11:45:00', 1, '2025-09-27 14:43:17', '2025-10-01 02:08:37');
INSERT INTO `aioveu_member_account` VALUES (3, 3, 1631.00, 463.00, DEFAULT, '2023-09-25 10:20:00', 1, '2025-09-27 14:43:17', '2025-10-01 02:08:40');
INSERT INTO `aioveu_member_account` VALUES (4, 4, 200.00, 20.00, DEFAULT, '2023-09-15 16:10:00', 1, '2025-09-27 14:43:17', '2025-10-01 02:08:42');
INSERT INTO `aioveu_member_account` VALUES (5, 5, 100.00, 10.00, DEFAULT, '2023-09-10 09:30:00', 1, '2025-09-27 14:43:17', '2025-10-01 02:08:44');
INSERT INTO `aioveu_member_account` VALUES (6, 6, 2500.00, 250.00, DEFAULT, '2023-09-24 17:45:00', 1, '2025-09-27 14:43:17', '2025-10-01 02:08:46');
INSERT INTO `aioveu_member_account` VALUES (7, 7, 800.00, 80.00, DEFAULT, '2023-09-22 15:30:00', 1, '2025-09-27 14:43:17', '2025-10-01 02:08:48');
INSERT INTO `aioveu_member_account` VALUES (8, 8, 50.00, 5.00, DEFAULT, '2023-09-05 14:20:00', 1, '2025-09-27 14:43:17', '2025-10-01 02:08:16');
INSERT INTO `aioveu_member_account` VALUES (9, 9, 350.00, 35.00, DEFAULT, '2023-09-19 10:45:00', 1, '2025-09-27 14:43:17', '2025-10-01 02:08:19');
INSERT INTO `aioveu_member_account` VALUES (14, 10, 21.00, 32.00, DEFAULT, '2025-10-06 18:08:14', 0, '2025-10-06 18:08:16', '2025-10-06 18:08:16');

-- ----------------------------
-- Table structure for aioveu_member_level
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_member_level`;
CREATE TABLE `aioveu_member_level`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '会员等级ID',
  `level_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '等级名称',
  `min_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '最低消费额',
  `discount` decimal(4, 2) NOT NULL DEFAULT 1.00 COMMENT '折扣率',
  `benefits` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '权益描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_level_name`(`level_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_member_level
-- ----------------------------
INSERT INTO `aioveu_member_level` VALUES (1, '普通会员', 0.00, 1.00, '基础洗衣服务，无额外折扣', 1, '2025-09-27 14:13:34', '2025-10-01 22:39:07');
INSERT INTO `aioveu_member_level` VALUES (2, '银卡会员', 1000.00, 0.95, '享受95折优惠，每月1次免费熨烫服务', 1, '2025-09-27 14:13:34', '2025-09-30 23:46:23');
INSERT INTO `aioveu_member_level` VALUES (3, '金卡会员', 3000.00, 0.88, '享受88折优惠，每月2次免费加急服务，专属客服', 1, '2025-09-27 14:13:34', '2025-09-30 19:50:38');
INSERT INTO `aioveu_member_level` VALUES (4, '铂金会员', 8000.00, 0.80, '享受8折优惠，每月3次免费上门取送，生日礼包', 1, '2025-09-27 14:13:34', '2025-09-30 19:50:42');
INSERT INTO `aioveu_member_level` VALUES (5, '钻石会员', 15000.00, 0.75, '享受75折优惠，无限次免费上门取送，专属洗衣顾问', 1, '2025-09-27 14:13:34', '2025-09-30 19:50:47');
INSERT INTO `aioveu_member_level` VALUES (7, '至尊王者', 20000.00, 0.80, '至尊王者', 1, '2025-10-01 22:43:10', '2025-10-01 22:43:10');

-- ----------------------------
-- Table structure for aioveu_member_recharge_record
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_member_recharge_record`;
CREATE TABLE `aioveu_member_recharge_record`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '充值记录ID',
  `recharge_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '充值单号',
  `member_id` bigint UNSIGNED NOT NULL COMMENT '会员ID',
  `amount` decimal(10, 2) NOT NULL COMMENT '充值金额',
  `gift_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '赠送金额',
  `payment_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付方式 1-wechat,2-alipay,3-cash,4-card,5-bank',
  `recharge_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '充值时间',
  `operator_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '操作员ID',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1-pending待定,2-success成功,3-failed失败',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_recharge_no`(`recharge_no` ASC) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_recharge_time`(`recharge_time` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `fk_operator_member`(`operator_id` ASC) USING BTREE,
  CONSTRAINT `fk_operator_member` FOREIGN KEY (`operator_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_recharge_member` FOREIGN KEY (`member_id`) REFERENCES `aioveu_member` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员充值记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_member_recharge_record
-- ----------------------------
INSERT INTO `aioveu_member_recharge_record` VALUES (57, '紫罗兰20251003000001', 1, 22.00, 22.00, 2, '2025-10-03 06:27:36', 2, 2, '12哈哈哈', '2025-10-03 06:27:39', '2025-10-07 20:39:41');
INSERT INTO `aioveu_member_recharge_record` VALUES (58, '紫罗兰20251003000002', 1, 22.00, 22.00, 2, '2025-10-03 06:27:48', 1, 2, '2112', '2025-10-03 06:27:52', '2025-10-03 06:27:52');
INSERT INTO `aioveu_member_recharge_record` VALUES (59, '紫罗兰20251003000003', 1, 22.00, 22.00, 2, '2025-10-03 06:28:00', 1, 2, '121', '2025-10-03 06:28:03', '2025-10-03 06:28:03');
INSERT INTO `aioveu_member_recharge_record` VALUES (62, '可我不敌可爱20251003000001', 1, 22.00, 22.00, 1, '2025-10-03 06:30:56', 2, 1, '121', '2025-10-03 06:31:00', '2025-10-03 06:31:00');
INSERT INTO `aioveu_member_recharge_record` VALUES (63, '可我不敌可爱20251003000002', 1, 22.00, 22.00, 2, '2025-10-03 06:31:07', 1, 2, '212', '2025-10-03 06:31:11', '2025-10-03 06:31:11');
INSERT INTO `aioveu_member_recharge_record` VALUES (67, '可我不敌可爱20251003000003', 1, 2.00, 2.00, 1, '2025-10-03 06:37:03', 1, 1, '22', '2025-10-03 06:39:43', '2025-10-03 06:39:43');
INSERT INTO `aioveu_member_recharge_record` VALUES (68, '可我不敌可爱20251003000004', 2, 33.00, 33.00, 1, '2025-10-03 06:39:55', 2, 1, '232', '2025-10-03 06:39:59', '2025-10-03 06:39:59');
INSERT INTO `aioveu_member_recharge_record` VALUES (69, '可我不敌可爱20251003000005', 2, 323.00, 22.00, 2, '2025-10-03 06:40:07', 7, 2, '2323', '2025-10-03 06:40:11', '2025-10-07 20:39:33');
INSERT INTO `aioveu_member_recharge_record` VALUES (70, '可我不敌可爱20251003000006', 3, 131.00, 313.00, 2, '2025-10-03 06:40:41', 1, 2, '31313', '2025-10-03 06:40:45', '2025-10-03 06:40:45');
INSERT INTO `aioveu_member_recharge_record` VALUES (71, '可我不敌可爱20251006000001', 10, 10.00, 10.00, 1, '2025-10-06 19:57:44', 1, 2, 'www', '2025-10-06 19:57:49', '2025-10-06 19:57:49');

-- ----------------------------
-- Table structure for aioveu_outbound
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_outbound`;
CREATE TABLE `aioveu_outbound`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '出库ID（主键）',
  `outbound_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库单号（唯一）',
  `material_id` bigint UNSIGNED NOT NULL COMMENT '物资ID',
  `warehouse_id` bigint UNSIGNED NOT NULL COMMENT '仓库ID',
  `quantity` decimal(12, 4) UNSIGNED NOT NULL COMMENT '出库数量',
  `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `out_time` datetime NOT NULL COMMENT '出库时间',
  `operator_id` bigint UNSIGNED NOT NULL COMMENT '操作员ID（关联员工表）',
  `recipient_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '领用人ID（关联员工表）',
  `department_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '领用部门ID',
  `purpose` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用途说明',
  `project_id` int UNSIGNED NULL DEFAULT NULL COMMENT '关联项目ID',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-待出库，2-已出库，3-已取消',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_outbound_no`(`outbound_no` ASC) USING BTREE,
  INDEX `fk_outbound_department`(`department_id` ASC) USING BTREE,
  INDEX `idx_material`(`material_id` ASC) USING BTREE,
  INDEX `idx_warehouse`(`warehouse_id` ASC) USING BTREE,
  INDEX `idx_operator`(`operator_id` ASC) USING BTREE,
  INDEX `idx_recipient`(`recipient_id` ASC) USING BTREE,
  INDEX `idx_out_time`(`out_time` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  CONSTRAINT `fk_outbound_department` FOREIGN KEY (`department_id`) REFERENCES `aioveu_department` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_outbound_material` FOREIGN KEY (`material_id`) REFERENCES `aioveu_material` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_outbound_operator` FOREIGN KEY (`operator_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_outbound_recipient` FOREIGN KEY (`recipient_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_outbound_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `aioveu_warehouse` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_outbound
-- ----------------------------
INSERT INTO `aioveu_outbound` VALUES (1, 'OUT-202306-001', 1, 1, 50.0000, 'BATCH-2023-06-001', '2023-06-05 14:30:00', 1, 1, 1, '部门日常办公用品领用', 3001, 2, '2025-08-31 19:29:38', '2025-08-31 19:29:38');
INSERT INTO `aioveu_outbound` VALUES (2, 'OUT-202306-002', 2, 1, 20.0000, 'BATCH-2023-06-002', '2023-06-06 10:15:00', 1, 2, 2, '项目组办公用品领用', 3002, 2, '2025-08-31 19:29:38', '2025-08-31 19:29:38');
INSERT INTO `aioveu_outbound` VALUES (3, 'OUT-202306-003', 3, 2, 500.0000, 'BATCH-2023-05-001', '2023-06-07 09:45:00', 2, 3, 3, '生产原料领用', 3003, 2, '2025-08-31 19:29:38', '2025-08-31 19:29:38');
INSERT INTO `aioveu_outbound` VALUES (4, 'OUT-202306-004', 4, 3, 10.0000, 'BATCH-2023-07-001', '2023-06-08 11:20:00', 3, 4, 4, '设备维修配件更换', 3004, 2, '2025-08-31 19:29:38', '2025-08-31 19:29:38');
INSERT INTO `aioveu_outbound` VALUES (5, '11', 1, 1, 22.0000, NULL, '2025-09-05 18:18:23', 1, 1, 7, '11', NULL, 1, '2025-09-05 18:18:32', '2025-09-05 18:18:32');
INSERT INTO `aioveu_outbound` VALUES (7, '22', 1, 1, 11.0000, NULL, '2025-09-05 18:25:56', 6, 6, 2, 'ss', NULL, 1, '2025-09-05 18:26:52', '2025-09-05 18:26:52');
INSERT INTO `aioveu_outbound` VALUES (8, 'sss', 1, 2, 111.0000, NULL, '2025-09-05 19:53:58', 1, 2, 6, '使用', NULL, 3, '2025-09-05 19:54:00', '2025-09-05 19:54:49');
INSERT INTO `aioveu_outbound` VALUES (9, '22121', 2, 5, 323.0000, NULL, '2025-09-12 12:32:23', 2, 7, 2, '333', NULL, 2, '2025-09-12 12:32:37', '2025-09-12 12:32:37');

-- ----------------------------
-- Table structure for aioveu_performance
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_performance`;
CREATE TABLE `aioveu_performance`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '绩效记录ID',
  `employee_id` bigint UNSIGNED NOT NULL COMMENT '员工ID',
  `period_year` smallint UNSIGNED NOT NULL COMMENT '考核年份',
  `period_quarter` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '考核季度(1-4)',
  `kpi_score` tinyint UNSIGNED NULL DEFAULT NULL COMMENT 'KPI评分(1-100分)',
  `productivity` decimal(5, 2) UNSIGNED NULL DEFAULT NULL COMMENT '生产率百分比(%)',
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主管评语',
  `performance_grade` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '绩效等级',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_employee`(`employee_id` ASC) USING BTREE,
  INDEX `idx_period`(`period_year` ASC, `period_quarter` ASC) USING BTREE,
  CONSTRAINT `fk_performance_employee` FOREIGN KEY (`employee_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工绩效考评表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_performance
-- ----------------------------
INSERT INTO `aioveu_performance` VALUES (1, 1, 2024, 1, 92, 98.50, '张同学本季度表现优异，超额完成所有KPI指标。在项目A中发挥关键作用，带领团队提前两周完成交付。', 'A', '2024-03-31 18:00:00', '2025-08-31 21:36:58');
INSERT INTO `aioveu_performance` VALUES (2, 1, 2024, 2, 88, 95.20, '整体表现良好，但在项目C的需求分析阶段出现延误。建议加强时间管理能力，提高任务分解效率。', 'B', '2024-06-30 18:00:00', '2025-08-31 21:37:00');
INSERT INTO `aioveu_performance` VALUES (3, 2, 2024, 1, 75, 87.30, '基本达成考核目标，但在团队协作方面有待提高。建议多参与部门技术分享活动，增强沟通能力。', 'C', '2024-03-31 18:00:00', '2025-08-31 21:37:03');
INSERT INTO `aioveu_performance` VALUES (4, 3, 2024, 1, 95, 99.00, '杰出表现！不仅完成本职工作，还主动协助团队解决关键技术难题。提出的流程优化方案预计可节省10%工时。', 'D', '2024-03-31 18:00:00', '2025-08-31 21:37:05');
INSERT INTO `aioveu_performance` VALUES (5, 2, 2024, 2, 82, 90.50, '有明显进步，积极参与团队协作并按时完成任务。在客户沟通中展现出良好的专业素养。', 'A', '2024-06-30 18:00:00', '2025-08-31 21:37:06');
INSERT INTO `aioveu_performance` VALUES (6, 3, 2024, 2, 97, 99.50, '持续卓越表现！主导开发的自动化工具已推广至全部门使用，预计每年可节省人力成本约20万元。', 'B', '2024-06-30 18:00:00', '2025-08-31 21:37:12');
INSERT INTO `aioveu_performance` VALUES (7, 6, 2021, 1, 11, 11.00, '11', 'D', '2025-09-05 18:50:45', '2025-09-05 18:50:45');
INSERT INTO `aioveu_performance` VALUES (8, 3, 2099, 1, 11, 11.00, '222', 'D', '2025-09-05 18:51:07', '2025-09-05 18:51:07');

-- ----------------------------
-- Table structure for aioveu_position
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_position`;
CREATE TABLE `aioveu_position`  (
  `position_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `position_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `dept_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '所属部门ID',
  `position_level` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '职级(1-10，数字越大职级越高)',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '岗位描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`position_id`) USING BTREE,
  UNIQUE INDEX `idx_dept_position`(`dept_id` ASC, `position_name` ASC) USING BTREE,
  CONSTRAINT `fk_position_department` FOREIGN KEY (`dept_id`) REFERENCES `aioveu_department` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公司岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_position
-- ----------------------------
INSERT INTO `aioveu_position` VALUES (1, '董事长', 1, 10, '公司最高决策人，管理总经理', '2025-08-31 19:29:17', '2025-08-31 19:29:17');
INSERT INTO `aioveu_position` VALUES (2, '总经理', 1, 9, '负责公司日常管理，协调各部门工作', '2025-08-31 19:29:17', '2025-08-31 19:29:17');
INSERT INTO `aioveu_position` VALUES (3, '法务总监', 3, 8, '负责公司法律事务管理', '2025-08-31 19:29:17', '2025-08-31 19:29:17');
INSERT INTO `aioveu_position` VALUES (4, '财务总监', 4, 8, '负责公司财务管理工作', '2025-08-31 19:29:17', '2025-08-31 19:29:17');
INSERT INTO `aioveu_position` VALUES (5, '研发总监', 2, 8, '负责技术研发部门管理工作', '2025-08-31 19:29:17', '2025-08-31 19:29:17');
INSERT INTO `aioveu_position` VALUES (6, '高级工程师', 2, 6, '负责核心产品研发工作', '2025-08-31 19:29:17', '2025-08-31 19:29:17');
INSERT INTO `aioveu_position` VALUES (7, '财务专员', 4, 4, '负责日常财务处理工作', '2025-08-31 19:29:17', '2025-08-31 19:29:17');
INSERT INTO `aioveu_position` VALUES (8, '法务专员', 3, 4, '处理公司合同和合规事务', '2025-08-31 19:29:17', '2025-08-31 19:29:17');
INSERT INTO `aioveu_position` VALUES (9, '资源部长', 2, 1, NULL, '2025-09-05 16:16:25', '2025-09-05 16:16:25');
INSERT INTO `aioveu_position` VALUES (10, '环境部长', 2, NULL, NULL, '2025-09-05 16:31:36', '2025-09-05 16:31:36');
INSERT INTO `aioveu_position` VALUES (11, '书记员', 1, NULL, NULL, '2025-09-05 16:32:35', '2025-09-05 16:32:35');
INSERT INTO `aioveu_position` VALUES (12, '吹雪', 1, 111, '222222', '2025-09-09 18:31:41', '2025-09-09 18:31:41');

-- ----------------------------
-- Table structure for aioveu_procurement
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_procurement`;
CREATE TABLE `aioveu_procurement`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '采购ID（主键）',
  `procurement_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '采购单号（唯一）',
  `supplier_id` int UNSIGNED NOT NULL COMMENT '供应商ID',
  `material_id` bigint UNSIGNED NOT NULL COMMENT '物资ID',
  `quantity` int UNSIGNED NOT NULL COMMENT '采购数量',
  `unit_price` decimal(12, 4) UNSIGNED NOT NULL COMMENT '采购单价',
  `total_amount` decimal(12, 4) UNSIGNED NOT NULL COMMENT '总金额',
  `order_date` datetime NOT NULL COMMENT '下单时间',
  `expected_delivery` date NULL DEFAULT NULL COMMENT '预计到货日期',
  `actual_delivery` date NULL DEFAULT NULL COMMENT '实际到货日期',
  `receipt_date` datetime NULL DEFAULT NULL COMMENT '签收时间',
  `warehouse_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '入库仓库ID',
  `inbound_date` datetime NULL DEFAULT NULL COMMENT '入库时间',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1-待审核，2-已下单，3-已发货，4-已收货，5-已入库，6-已取消',
  `applicant_id` bigint UNSIGNED NOT NULL COMMENT '申请人ID（关联员工表）',
  `reviewer_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '审核人ID',
  `review_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_procurement_no`(`procurement_no` ASC) USING BTREE,
  INDEX `fk_procurement_warehouse`(`warehouse_id` ASC) USING BTREE,
  INDEX `fk_procurement_applicant`(`applicant_id` ASC) USING BTREE,
  INDEX `fk_procurement_reviewer`(`reviewer_id` ASC) USING BTREE,
  INDEX `idx_supplier`(`supplier_id` ASC) USING BTREE,
  INDEX `idx_material`(`material_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_order_date`(`order_date` ASC) USING BTREE,
  INDEX `idx_expected_delivery`(`expected_delivery` ASC) USING BTREE,
  CONSTRAINT `fk_procurement_applicant` FOREIGN KEY (`applicant_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_procurement_material` FOREIGN KEY (`material_id`) REFERENCES `aioveu_material` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_procurement_reviewer` FOREIGN KEY (`reviewer_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_procurement_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `aioveu_warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采购流程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_procurement
-- ----------------------------
INSERT INTO `aioveu_procurement` VALUES (1, 'PO-202306-001', 2001, 1, 100, 25.9900, 2599.0000, '2023-06-01 10:30:00', '2023-06-05', NULL, NULL, NULL, NULL, 2, 1, 1, NULL, NULL, '2025-08-31 19:29:36', '2025-08-31 19:29:36');
INSERT INTO `aioveu_procurement` VALUES (2, 'PO-202306-002', 2001, 2, 50, 15.5000, 775.0000, '2023-06-01 14:15:00', '2023-06-06', NULL, NULL, NULL, NULL, 2, 1, 1, NULL, NULL, '2025-08-31 19:29:36', '2025-08-31 19:29:36');
INSERT INTO `aioveu_procurement` VALUES (3, 'PO-202306-003', 2003, 3, 2000, 12.5000, 25000.0000, '2023-06-02 09:00:00', '2023-06-07', NULL, NULL, NULL, NULL, 2, 2, 2, NULL, NULL, '2025-08-31 19:29:36', '2025-08-31 19:29:36');
INSERT INTO `aioveu_procurement` VALUES (4, 'PO-202306-004', 2002, 4, 50, 89.0000, 4450.0000, '2023-06-03 11:20:00', '2023-06-08', NULL, NULL, NULL, NULL, 2, 3, 2, NULL, NULL, '2025-08-31 19:29:36', '2025-08-31 19:29:36');
INSERT INTO `aioveu_procurement` VALUES (5, '11', 22, 3, 11, 11.0000, 222.0000, '2025-09-05 17:42:36', NULL, NULL, NULL, 2, NULL, 1, 1, 1, '2025-09-05 00:00:00', NULL, '2025-09-05 17:42:53', '2025-09-05 17:42:53');
INSERT INTO `aioveu_procurement` VALUES (6, '22', 33, 2, 12, 32.0000, 45.0000, '2025-09-11 23:40:23', '2025-09-11', '2025-09-11', '2025-09-11 23:40:28', 2, '2025-09-11 23:40:35', 2, 2, 2, '2025-09-11 23:40:47', 'er', '2025-09-11 23:40:48', '2025-09-11 23:40:48');

-- ----------------------------
-- Table structure for aioveu_salary
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_salary`;
CREATE TABLE `aioveu_salary`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工资记录ID',
  `employee_id` bigint UNSIGNED NOT NULL COMMENT '员工ID',
  `salary_period` date NOT NULL COMMENT '工资周期（月份）',
  `base_salary` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '基本工资',
  `performance_bonus` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '绩效奖金',
  `overtime_pay` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '加班补贴',
  `allowances` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '各类津贴',
  `social_security` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '社保扣除',
  `housing_fund` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '住房公积金',
  `tax` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '个人所得税',
  `other_deductions` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '其他扣款',
  `net_salary` decimal(12, 2) NOT NULL COMMENT '实发工资',
  `payment_date` date NULL DEFAULT NULL COMMENT '实际发放日期',
  `payment_status` tinyint(1) NULL DEFAULT 0 COMMENT '发放状态：0-未发放，1-已发放，2-发放失败',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_employee_period`(`employee_id` ASC, `salary_period` ASC) USING BTREE,
  INDEX `idx_period`(`salary_period` ASC) USING BTREE,
  INDEX `idx_payment_status`(`payment_status` ASC) USING BTREE,
  CONSTRAINT `fk_salary_employee` FOREIGN KEY (`employee_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工工资明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_salary
-- ----------------------------
INSERT INTO `aioveu_salary` VALUES (1, 3, '2024-12-01', 10000.00, 1500.00, 300.00, 800.00, 850.00, 600.00, 280.00, 0.00, 10870.00, '2024-12-05', 1, '2025-08-31 19:29:23', '2025-09-08 20:26:27');
INSERT INTO `aioveu_salary` VALUES (2, 2, '2024-12-01', 8000.00, 1200.00, 150.00, 500.00, 700.00, 500.00, 210.00, 50.00, 7390.00, '2024-12-05', 1, '2025-08-31 19:29:23', '2025-08-31 19:29:23');
INSERT INTO `aioveu_salary` VALUES (3, 3, '2025-01-01', 12000.00, 2000.00, 500.00, 1000.00, 900.00, 800.00, 320.00, 100.00, 12380.00, NULL, 0, '2025-08-31 19:29:23', '2025-08-31 19:29:23');
INSERT INTO `aioveu_salary` VALUES (4, 2, '2025-01-01', 10000.00, 1300.00, 200.00, 800.00, 850.00, 600.00, 250.00, 0.00, 10600.00, '2025-09-02', 2, '2025-08-31 19:29:23', '2025-09-08 20:26:11');
INSERT INTO `aioveu_salary` VALUES (5, 1, '2025-09-05', 2222.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22222.00, NULL, 0, '2025-09-05 16:47:16', '2025-09-05 16:47:16');
INSERT INTO `aioveu_salary` VALUES (6, 5, '2025-09-05', 1111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1111.00, NULL, 0, '2025-09-05 18:54:35', '2025-09-08 20:25:46');
INSERT INTO `aioveu_salary` VALUES (9, 6, '2025-10-03', 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1111.00, NULL, 0, '2025-09-05 18:59:55', '2025-09-05 18:59:55');

-- ----------------------------
-- Table structure for aioveu_sales_order
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_sales_order`;
CREATE TABLE `aioveu_sales_order`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID（主键）',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号（唯一）',
  `customer_id` bigint UNSIGNED NOT NULL COMMENT '客户ID',
  `contact_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '联系人ID',
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `expected_delivery` date NULL DEFAULT NULL COMMENT '预计交货日期',
  `actual_delivery` date NULL DEFAULT NULL COMMENT '实际交货日期',
  `total_amount` decimal(15, 2) UNSIGNED NOT NULL COMMENT '订单总金额',
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'CNY' COMMENT '货币代码',
  `discount` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '整体折扣率',
  `tax_rate` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '税率',
  `tax_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '税额',
  `grand_total` decimal(15, 2) NULL DEFAULT NULL COMMENT '订单总额（含税）',
  `payment_terms` tinyint UNSIGNED NULL DEFAULT 1 COMMENT '付款条件：1-预付全款，2-货到付款，3-月结30天，4-月结60天，5-其他',
  `payment_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付状态：1-未支付，2-部分支付，3-已支付',
  `order_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单状态：1-待处理，2-已确认，3-生产中，4-已发货，5-已完成，6-已取消',
  `shipping_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `shipping_method` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '运输方式：1-快递，2-物流，3-自提，4-其他',
  `tracking_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `sales_rep_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '销售负责人ID',
  `operator_id` bigint UNSIGNED NOT NULL COMMENT '操作员ID',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_order_no`(`order_no` ASC) USING BTREE,
  INDEX `fk_order_contact`(`contact_id` ASC) USING BTREE,
  INDEX `fk_order_operator`(`operator_id` ASC) USING BTREE,
  INDEX `idx_customer`(`customer_id` ASC) USING BTREE,
  INDEX `idx_order_date`(`order_date` ASC) USING BTREE,
  INDEX `idx_order_status`(`order_status` ASC) USING BTREE,
  INDEX `idx_payment_status`(`payment_status` ASC) USING BTREE,
  INDEX `idx_sales_rep`(`sales_rep_id` ASC) USING BTREE,
  INDEX `idx_tracking_no`(`tracking_no` ASC) USING BTREE,
  CONSTRAINT `fk_order_contact` FOREIGN KEY (`contact_id`) REFERENCES `aioveu_contact` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `aioveu_customer` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_order_operator` FOREIGN KEY (`operator_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_order_sales_rep` FOREIGN KEY (`sales_rep_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '销售订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_sales_order
-- ----------------------------
INSERT INTO `aioveu_sales_order` VALUES (1, 'SO-202306-001', 1, 1, '2023-06-10 09:30:00', '2023-06-20', NULL, 50000.00, 'CNY', 0.05, 0.13, NULL, 54825.00, 3, 2, 2, '深圳市龙岗区坂田华为基地', 1, NULL, 1, 1, NULL, '2025-08-31 19:29:46', '2025-08-31 19:29:46');
INSERT INTO `aioveu_sales_order` VALUES (2, 'SO-202306-002', 2, 3, '2023-06-11 14:15:00', '2023-06-25', NULL, 30000.00, 'CNY', 0.00, 0.13, NULL, 33900.00, 1, 3, 6, '深圳市南山区高新科技园', 2, NULL, 2, 2, NULL, '2025-08-31 19:29:46', '2025-09-30 19:20:10');
INSERT INTO `aioveu_sales_order` VALUES (3, 'SO-202306-003', 3, 5, '2023-06-12 10:45:00', '2023-07-05', NULL, 150000.00, 'CNY', 0.10, 0.13, NULL, 154050.00, 4, 2, 1, '杭州市余杭区文一西路969号', 3, NULL, 3, 3, NULL, '2025-08-31 19:29:46', '2025-09-30 19:20:03');
INSERT INTO `aioveu_sales_order` VALUES (4, 'SO-202306-004', 4, 5, '2023-06-13 11:20:00', '2023-06-30', NULL, 75000.00, 'CNY', 0.00, 0.13, NULL, 84750.00, 2, 1, 2, '北京市海淀区清河中街68号', 1, NULL, 4, 4, '11', '2025-08-31 19:29:46', '2025-08-31 23:25:55');
INSERT INTO `aioveu_sales_order` VALUES (5, '1111', 2, 2, '2025-09-05 20:40:10', NULL, NULL, 2222.00, 'CNY', 0.00, 0.00, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, 2, 4, NULL, '2025-09-05 20:40:21', '2025-09-05 20:40:21');
INSERT INTO `aioveu_sales_order` VALUES (6, '2222', 2, 1, '2025-09-12 12:51:29', '2025-10-12', '2025-11-12', 222.00, 'CNY', 0.00, 0.00, NULL, NULL, 2, 2, 2, NULL, 2, NULL, 2, 3, '22', '2025-09-12 12:51:51', '2025-09-12 12:51:51');

-- ----------------------------
-- Table structure for aioveu_sales_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_sales_order_detail`;
CREATE TABLE `aioveu_sales_order_detail`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '明细ID（主键）',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单ID',
  `material_id` bigint UNSIGNED NOT NULL COMMENT '物资ID',
  `quantity` decimal(12, 4) UNSIGNED NOT NULL COMMENT '数量',
  `unit_price` decimal(12, 4) UNSIGNED NOT NULL COMMENT '单价',
  `discount` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '折扣率',
  `tax_rate` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '税率',
  `subtotal` decimal(15, 4) NULL DEFAULT NULL COMMENT '小计',
  `tax_amount` decimal(15, 4) NULL DEFAULT NULL COMMENT '税额',
  `total_price` decimal(15, 4) NULL DEFAULT NULL COMMENT '总金额',
  `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `delivery_date` date NULL DEFAULT NULL COMMENT '要求交货日期',
  `warehouse_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '发货仓库ID',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT '明细状态：1-待处理，2-备货中，3-已发货，4-已收货，5-已取消',
  `notes` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order`(`order_id` ASC) USING BTREE,
  INDEX `idx_material`(`material_id` ASC) USING BTREE,
  INDEX `idx_warehouse`(`warehouse_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  CONSTRAINT `fk_detail_material` FOREIGN KEY (`material_id`) REFERENCES `aioveu_material` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_detail_order` FOREIGN KEY (`order_id`) REFERENCES `aioveu_sales_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detail_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `aioveu_warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_sales_order_detail
-- ----------------------------
INSERT INTO `aioveu_sales_order_detail` VALUES (1, 1, 1, 100.0000, 25.9900, 0.05, 0.13, 2469.0500, 320.9765, 2790.0265, 'BATCH-2023-06-001', '2023-06-20', 1, 3, NULL, '2025-08-31 19:29:47', '2025-09-12 13:12:44');
INSERT INTO `aioveu_sales_order_detail` VALUES (2, 1, 2, 50.0000, 15.5000, 0.10, 0.13, NULL, NULL, NULL, 'BATCH-2023-06-002', '2023-06-20', 1, 3, NULL, '2025-08-31 19:29:47', '2025-08-31 19:29:47');
INSERT INTO `aioveu_sales_order_detail` VALUES (3, 2, 3, 2000.0000, 12.5000, 0.00, 0.13, NULL, NULL, NULL, 'BATCH-2023-05-001', '2023-06-25', 2, 2, NULL, '2025-08-31 19:29:47', '2025-08-31 19:29:47');
INSERT INTO `aioveu_sales_order_detail` VALUES (4, 3, 4, 50.0000, 89.0000, 0.15, 0.13, NULL, NULL, NULL, 'BATCH-2023-07-001', '2023-07-05', 3, 1, NULL, '2025-08-31 19:29:47', '2025-08-31 19:29:47');
INSERT INTO `aioveu_sales_order_detail` VALUES (5, 4, 5, 10.0000, 199.0000, 0.00, 0.13, NULL, NULL, NULL, 'BATCH-2023-06-003', '2023-06-30', 1, 1, NULL, '2025-08-31 19:29:47', '2025-08-31 19:29:47');
INSERT INTO `aioveu_sales_order_detail` VALUES (6, 1, 1, 1.0000, 22.0000, 0.00, 0.00, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 1, NULL, '2025-09-05 22:20:12', '2025-09-05 22:20:12');
INSERT INTO `aioveu_sales_order_detail` VALUES (7, 5, 1, 1.0000, 1.0000, 0.00, 0.00, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, 1, NULL, '2025-09-06 01:04:33', '2025-09-06 01:04:33');
INSERT INTO `aioveu_sales_order_detail` VALUES (8, 6, 3, 33.0000, 44.0000, 0.00, 0.00, 1452.0000, 0.0000, 1452.0000, NULL, '2025-09-12', 2, 2, '333', '2025-09-12 13:08:03', '2025-09-12 13:11:36');

-- ----------------------------
-- Table structure for aioveu_transaction
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_transaction`;
CREATE TABLE `aioveu_transaction`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '交易ID（主键）',
  `transaction_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易编号（唯一）',
  `customer_id` bigint UNSIGNED NOT NULL COMMENT '客户ID',
  `contact_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '联系人ID',
  `transaction_date` datetime NOT NULL COMMENT '交易日期',
  `amount` decimal(15, 2) NOT NULL COMMENT '交易金额',
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'CNY' COMMENT '货币代码',
  `payment_method` tinyint UNSIGNED NOT NULL COMMENT '支付方式：1-现金，2-银行转账，3-信用卡，4-支付宝，5-微信支付，6-其他',
  `payment_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付状态：1-待支付，2-部分支付，3-已支付，4-已退款',
  `transaction_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '交易类型：1-销售，2-服务，3-退款，4-其他',
  `invoice_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票号码',
  `product_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '产品ID',
  `quantity` int UNSIGNED NULL DEFAULT NULL COMMENT '数量',
  `unit_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '单价',
  `discount` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '折扣率',
  `tax_rate` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '税率',
  `tax_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '税额',
  `total_amount` decimal(15, 2) NULL DEFAULT NULL COMMENT '总金额',
  `sales_rep_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '销售负责人ID',
  `transaction_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '交易状态：1-进行中，2-已完成，3-已取消',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_transaction_no`(`transaction_no` ASC) USING BTREE,
  UNIQUE INDEX `uniq_invoice_no`(`invoice_no` ASC) USING BTREE,
  INDEX `fk_transaction_contact`(`contact_id` ASC) USING BTREE,
  INDEX `idx_customer`(`customer_id` ASC) USING BTREE,
  INDEX `idx_transaction_date`(`transaction_date` ASC) USING BTREE,
  INDEX `idx_payment_status`(`payment_status` ASC) USING BTREE,
  INDEX `idx_transaction_type`(`transaction_type` ASC) USING BTREE,
  INDEX `idx_sales_rep`(`sales_rep_id` ASC) USING BTREE,
  CONSTRAINT `fk_transaction_contact` FOREIGN KEY (`contact_id`) REFERENCES `aioveu_contact` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_customer` FOREIGN KEY (`customer_id`) REFERENCES `aioveu_customer` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_sales_rep` FOREIGN KEY (`sales_rep_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户交易记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_transaction
-- ----------------------------
INSERT INTO `aioveu_transaction` VALUES (1, 'TRX-202306-001', 1, 1, '2023-06-15 10:30:00', 50000.00, 'CNY', 2, 3, 1, 'INV-202306-001', 101, 10, 5000.00, 0.00, 0.13, 6500.00, 56500.00, 1, 2, NULL, '2025-08-31 19:29:44', '2025-09-30 19:12:30');
INSERT INTO `aioveu_transaction` VALUES (2, 'TRX-202306-002', 2, 3, '2023-06-16 14:15:00', 30000.00, 'CNY', 4, 3, 2, 'INV-202306-002', 102, 1, 30000.00, 0.00, 0.13, 3900.00, 33900.00, 2, 2, NULL, '2025-08-31 19:29:44', '2025-08-31 19:29:44');
INSERT INTO `aioveu_transaction` VALUES (3, 'TRX-202306-003', 3, 5, '2023-06-17 09:45:00', 150000.00, 'CNY', 2, 3, 1, 'INV-202306-003', 103, 5, 30000.00, 0.05, 0.13, 17550.00, 149550.00, 3, 2, NULL, '2025-08-31 19:29:44', '2025-08-31 19:29:44');
INSERT INTO `aioveu_transaction` VALUES (4, 'TRX-202306-004', 4, 5, '2023-06-18 11:20:00', -5000.00, 'CNY', 2, 4, 3, 'REF-202306-001', 101, 1, 5000.00, 0.00, 0.13, 650.00, -5650.00, 4, 2, NULL, '2025-08-31 19:29:44', '2025-08-31 19:29:44');
INSERT INTO `aioveu_transaction` VALUES (5, '111', 1, 2, '2025-09-05 20:29:51', 111.00, 'CNY', 2, 2, 2, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, 1, 1, NULL, '2025-09-05 20:30:07', '2025-09-05 20:30:07');
INSERT INTO `aioveu_transaction` VALUES (6, '11', 1, 1, '2025-09-05 20:32:47', 22.00, 'CNY', 1, 2, 1, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, 2, 1, NULL, '2025-09-05 20:32:55', '2025-09-05 20:32:55');
INSERT INTO `aioveu_transaction` VALUES (7, '222', 3, 3, '2025-09-12 12:44:59', 999.00, 'CNY', 3, 3, 2, NULL, NULL, NULL, NULL, 0.00, 0.00, NULL, NULL, 2, 3, 'www', '2025-09-12 12:45:23', '2025-09-12 12:45:23');

-- ----------------------------
-- Table structure for aioveu_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `aioveu_warehouse`;
CREATE TABLE `aioveu_warehouse`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '仓库ID（主键）',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库编码（唯一标识）',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库位置',
  `area` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '仓库面积（平方米）',
  `capacity` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '存储容量（立方米）',
  `manager_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '负责人ID（关联员工表）',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '仓库描述',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '启用状态：0-停用，1-启用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE,
  UNIQUE INDEX `uniq_code`(`code` ASC) USING BTREE,
  INDEX `fk_warehouse_manager`(`manager_id` ASC) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE,
  INDEX `idx_location`(`location` ASC) USING BTREE,
  INDEX `idx_active`(`is_active` ASC) USING BTREE,
  CONSTRAINT `fk_warehouse_manager` FOREIGN KEY (`manager_id`) REFERENCES `aioveu_employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓库信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aioveu_warehouse
-- ----------------------------
INSERT INTO `aioveu_warehouse` VALUES (1, '总部中心仓', 'WH-001', '北京市朝阳区科技园A栋B1层', 2000.00, 15000.00, 1, '010-12345678', '公司总部主要仓库，存放办公用品和电子产品', 1, '2025-08-31 19:29:28', '2025-08-31 19:29:28');
INSERT INTO `aioveu_warehouse` VALUES (2, '南方分仓', 'WH-002', '广州市天河区工业园C区8号', 1500.00, 12000.00, 2, '020-87654321', '华南地区分仓，主要存放季节性物资', 1, '2025-08-31 19:29:28', '2025-08-31 19:29:28');
INSERT INTO `aioveu_warehouse` VALUES (3, '生产原料仓', 'WH-003', '上海市浦东新区制造基地', 3000.00, 25000.00, 3, '021-11223344', '生产原材料专用仓库，恒温恒湿控制', 1, '2025-08-31 19:29:28', '2025-08-31 19:29:28');
INSERT INTO `aioveu_warehouse` VALUES (4, 'sss', 'sss', 'sss', NULL, NULL, 1, NULL, NULL, 1, '2025-09-05 17:19:54', '2025-09-05 17:19:54');
INSERT INTO `aioveu_warehouse` VALUES (5, '上海黄浦仓', '2222', '上海黄浦', 1200.00, 1200.00, 6, NULL, NULL, 0, '2025-09-05 19:16:29', '2025-09-05 19:16:29');

-- ----------------------------
-- Table structure for gen_config
-- ----------------------------
DROP TABLE IF EXISTS `gen_config`;
CREATE TABLE `gen_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表名',
  `module_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块名',
  `package_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '包名',
  `business_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务名',
  `entity_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实体类名',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者',
  `parent_menu_id` bigint NULL DEFAULT NULL COMMENT '上级菜单ID，对应sys_menu的id ',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tablename`(`table_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成基础配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_config
-- ----------------------------
INSERT INTO `gen_config` VALUES (1, 'aioveu_member_level', 'aioveuMemberLevel', 'com.aioveu.boot', '会员等级', 'AioveuMemberLevel', '可我不敌可爱', NULL, '2025-09-27 14:51:46', '2025-09-27 14:51:46', b'0');
INSERT INTO `gen_config` VALUES (3, 'aioveu_member', 'aioveuMember', 'com.aioveu.boot', '会员信息管理', 'AioveuMember', '可我不敌可爱', 250, '2025-09-27 15:55:43', '2025-09-27 15:55:43', b'0');
INSERT INTO `gen_config` VALUES (4, 'aioveu_member_account', 'aioveuMemberAccount', 'com.aioveu.boot', '会员充值账户', 'AioveuMemberAccount', '可我不敌可爱', 250, '2025-09-30 17:02:11', '2025-09-30 17:02:11', b'0');
INSERT INTO `gen_config` VALUES (5, 'aioveu_member_recharge_record', 'aioveuMemberRechargeRecord', 'com.aioveu.boot', '会员充值记录', 'AioveuMemberRechargeRecord', '可我不敌可爱', 250, '2025-09-30 17:08:12', '2025-09-30 17:08:12', b'0');
INSERT INTO `gen_config` VALUES (6, 'aioveu_laundry_order', 'aioveuLaundryOrder', 'com.aioveu.boot', '洗衣订单', 'AioveuLaundryOrder', '可我不敌可爱', 271, '2025-09-30 17:43:28', '2025-09-30 17:43:28', b'0');
INSERT INTO `gen_config` VALUES (7, 'aioveu_laundry_clothing_type', 'aioveuLaundryClothingType', 'com.aioveu.boot', '衣物类型', 'AioveuLaundryClothingType', '可我不敌可爱', 271, '2025-09-30 17:48:47', '2025-09-30 17:48:47', b'0');
INSERT INTO `gen_config` VALUES (8, 'aioveu_laundry_order_item', 'aioveuLaundryOrderItem', 'com.aioveu.boot', '洗衣订单衣物明细', 'AioveuLaundryOrderItem', '可我不敌可爱', 271, '2025-09-30 17:55:20', '2025-09-30 17:55:20', b'0');
INSERT INTO `gen_config` VALUES (9, 'aioveu_laundry_process_image', 'aioveuLaundryProcessImage', 'com.aioveu.boot', '洗衣流程图片记录', 'AioveuLaundryProcessImage', '可我不敌可爱', 271, '2025-09-30 17:58:39', '2025-09-30 17:58:39', b'0');

-- ----------------------------
-- Table structure for gen_field_config
-- ----------------------------
DROP TABLE IF EXISTS `gen_field_config`;
CREATE TABLE `gen_field_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `config_id` bigint NOT NULL COMMENT '关联的配置ID',
  `column_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `column_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `column_length` int NULL DEFAULT NULL,
  `field_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字段名称',
  `field_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段类型',
  `field_sort` int NULL DEFAULT NULL COMMENT '字段排序',
  `field_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段描述',
  `max_length` int NULL DEFAULT NULL,
  `is_required` tinyint(1) NULL DEFAULT NULL COMMENT '是否必填',
  `is_show_in_list` tinyint(1) NULL DEFAULT 0 COMMENT '是否在列表显示',
  `is_show_in_form` tinyint(1) NULL DEFAULT 0 COMMENT '是否在表单显示',
  `is_show_in_query` tinyint(1) NULL DEFAULT 0 COMMENT '是否在查询条件显示',
  `query_type` tinyint NULL DEFAULT NULL COMMENT '查询方式',
  `form_type` tinyint NULL DEFAULT NULL COMMENT '表单类型',
  `dict_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典类型',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `config_id`(`config_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成字段配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_field_config
-- ----------------------------
INSERT INTO `gen_field_config` VALUES (1, 1, 'id', 'bigint', NULL, 'id', 'Long', 1, '会员等级ID', NULL, 0, 1, 1, 1, 2, 1, NULL, '2025-09-27 14:51:46', '2025-09-27 14:51:46');
INSERT INTO `gen_field_config` VALUES (2, 1, 'level_name', 'varchar', NULL, 'levelName', 'String', 2, '等级名称', 20, 1, 1, 1, 1, 2, 1, NULL, '2025-09-27 14:51:46', '2025-09-27 14:51:46');
INSERT INTO `gen_field_config` VALUES (3, 1, 'min_amount', 'decimal', NULL, 'minAmount', 'BigDecimal', 3, '最低消费额', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-27 14:51:46', '2025-09-27 14:51:46');
INSERT INTO `gen_field_config` VALUES (4, 1, 'discount', 'decimal', NULL, 'discount', 'BigDecimal', 4, '折扣率', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-27 14:51:46', '2025-09-27 14:51:46');
INSERT INTO `gen_field_config` VALUES (5, 1, 'benefits', 'text', NULL, 'benefits', 'String', 5, '权益描述', 65535, 0, 1, 1, 0, 1, 1, NULL, '2025-09-27 14:51:46', '2025-09-27 14:51:46');
INSERT INTO `gen_field_config` VALUES (6, 1, 'status', 'tinyint', NULL, 'status', 'Integer', 6, '状态(0-禁用 1-启用)', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-27 14:51:46', '2025-09-27 14:51:46');
INSERT INTO `gen_field_config` VALUES (7, 1, 'create_time', 'datetime', NULL, 'createTime', 'LocalDateTime', 7, '创建时间', NULL, 1, 1, 0, 0, 1, 9, NULL, '2025-09-27 14:51:46', '2025-09-27 14:51:46');
INSERT INTO `gen_field_config` VALUES (8, 1, 'update_time', 'datetime', NULL, 'updateTime', 'LocalDateTime', 8, '更新时间', NULL, 0, 1, 0, 0, 1, 9, NULL, '2025-09-27 14:51:46', '2025-09-27 14:51:46');
INSERT INTO `gen_field_config` VALUES (21, 3, 'id', 'bigint', NULL, 'id', 'Long', 1, '会员ID', NULL, 1, 1, 0, 1, 2, 1, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (22, 3, 'member_no', 'varchar', NULL, 'memberNo', 'String', 2, '会员卡号', 20, 1, 1, 1, 1, 2, 1, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (23, 3, 'name', 'varchar', NULL, 'name', 'String', 3, '会员姓名', 50, 1, 1, 1, 1, 2, 1, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (24, 3, 'phone', 'varchar', NULL, 'phone', 'String', 4, '手机号', 20, 1, 1, 1, 1, 2, 1, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (25, 3, 'id_card', 'varchar', NULL, 'idCard', 'String', 5, '身份证号', 30, 0, 1, 1, 0, 1, 1, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (26, 3, 'level_id', 'bigint', NULL, 'levelId', 'Long', 6, '会员等级', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (27, 3, 'join_date', 'datetime', NULL, 'joinDate', 'LocalDateTime', 7, '入会时间', NULL, 0, 1, 1, 0, 1, 9, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (28, 3, 'total_consumption', 'decimal', NULL, 'totalConsumption', 'BigDecimal', 8, '累计消费金额', NULL, 0, 1, 1, 0, 1, 1, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (29, 3, 'last_visit', 'datetime', NULL, 'lastVisit', 'LocalDateTime', 9, '最后到店时间', NULL, 0, 1, 1, 0, 1, 9, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (30, 3, 'status', 'tinyint', NULL, 'status', 'Integer', 10, '状态', NULL, 0, 1, 1, 1, 2, 1, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (31, 3, 'create_time', 'datetime', NULL, 'createTime', 'LocalDateTime', 11, '创建时间', NULL, 0, 1, 0, 0, 1, 9, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (32, 3, 'update_time', 'datetime', NULL, 'updateTime', 'LocalDateTime', 12, '更新时间', NULL, 0, 1, 0, 0, 1, 9, NULL, '2025-09-27 15:55:43', '2025-09-27 15:55:43');
INSERT INTO `gen_field_config` VALUES (33, 4, 'id', 'bigint', NULL, 'id', 'Long', 1, '账户ID', NULL, 1, 1, 0, 1, 2, 1, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12');
INSERT INTO `gen_field_config` VALUES (34, 4, 'member_id', 'bigint', NULL, 'memberId', 'Long', 2, '会员ID', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12');
INSERT INTO `gen_field_config` VALUES (35, 4, 'cash_balance', 'decimal', NULL, 'cashBalance', 'BigDecimal', 3, '现金余额', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12');
INSERT INTO `gen_field_config` VALUES (36, 4, 'gift_balance', 'decimal', NULL, 'giftBalance', 'BigDecimal', 4, '赠送余额', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12');
INSERT INTO `gen_field_config` VALUES (37, 4, 'total_balance', 'decimal', NULL, 'totalBalance', 'BigDecimal', 5, '总余额', NULL, 0, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12');
INSERT INTO `gen_field_config` VALUES (38, 4, 'last_recharge_time', 'datetime', NULL, 'lastRechargeTime', 'LocalDateTime', 6, '最后充值时间', NULL, 0, 1, 1, 0, 1, 9, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12');
INSERT INTO `gen_field_config` VALUES (39, 4, 'status', 'tinyint', NULL, 'status', 'Integer', 7, '账户状态(0-冻结 1-正常)', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12');
INSERT INTO `gen_field_config` VALUES (40, 4, 'create_time', 'datetime', NULL, 'createTime', 'LocalDateTime', 8, '创建时间', NULL, 1, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12');
INSERT INTO `gen_field_config` VALUES (41, 4, 'update_time', 'datetime', NULL, 'updateTime', 'LocalDateTime', 9, '更新时间', NULL, 0, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12');
INSERT INTO `gen_field_config` VALUES (42, 5, 'id', 'bigint', NULL, 'id', 'Long', 1, '充值记录ID', NULL, 1, 1, 0, 1, 2, 1, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (43, 5, 'recharge_no', 'varchar', NULL, 'rechargeNo', 'String', 2, '充值单号', 30, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (44, 5, 'member_id', 'bigint', NULL, 'memberId', 'Long', 3, '会员ID', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (45, 5, 'amount', 'decimal', NULL, 'amount', 'BigDecimal', 4, '充值金额', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (46, 5, 'gift_amount', 'decimal', NULL, 'giftAmount', 'BigDecimal', 5, '赠送金额', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (47, 5, 'payment_type', 'tinyint', NULL, 'paymentType', 'Integer', 6, '支付方式 1-wechat,2-alipay,3-cash,4-card,5-bank', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (48, 5, 'recharge_time', 'datetime', NULL, 'rechargeTime', 'LocalDateTime', 7, '充值时间', NULL, 1, 1, 1, 0, 1, 9, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (49, 5, 'operator_id', 'bigint', NULL, 'operatorId', 'Long', 8, '操作员ID', NULL, 0, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (50, 5, 'status', 'tinyint', NULL, 'status', 'Integer', 9, '状态1-pending待定,2-success成功,3-failed失败', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (51, 5, 'remark', 'varchar', NULL, 'remark', 'String', 10, '备注', 255, 0, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (52, 5, 'create_time', 'datetime', NULL, 'createTime', 'LocalDateTime', 11, '创建时间', NULL, 1, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (53, 5, 'update_time', 'datetime', NULL, 'updateTime', 'LocalDateTime', 12, '更新时间', NULL, 0, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:08:14', '2025-09-30 17:08:14');
INSERT INTO `gen_field_config` VALUES (54, 6, 'id', 'bigint', NULL, 'id', 'Long', 1, '订单ID', NULL, 1, 1, 0, 1, 2, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (55, 6, 'order_no', 'varchar', NULL, 'orderNo', 'String', 2, '订单号', 30, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (56, 6, 'member_id', 'bigint', NULL, 'memberId', 'Long', 3, '会员ID', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (57, 6, 'customer_name', 'varchar', NULL, 'customerName', 'String', 4, '客户姓名', 50, 0, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (58, 6, 'customer_phone', 'varchar', NULL, 'customerPhone', 'String', 5, '客户电话', 20, 0, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (59, 6, 'status', 'tinyint', NULL, 'status', 'Integer', 6, '订单状态 0创建,1接收,2洗衣,3干燥,4熨烫,5质量检查,6完成,7运送,8取消', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (60, 6, 'total_amount', 'decimal', NULL, 'totalAmount', 'BigDecimal', 7, '订单总额', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (61, 6, 'discount_amount', 'decimal', NULL, 'discountAmount', 'BigDecimal', 8, '折扣金额', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (62, 6, 'actual_amount', 'decimal', NULL, 'actualAmount', 'BigDecimal', 9, '实付金额', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (63, 6, 'payment_status', 'tinyint', NULL, 'paymentStatus', 'Integer', 10, '支付状态 1-未支付-unpaid,2-部分支付-partial,3-已支付-paid,4-未支付-refunded', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (64, 6, 'payment_method_id', 'tinyint', NULL, 'paymentMethodId', 'Integer', 11, '支付方式ID', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (65, 6, 'create_time', 'datetime', NULL, 'createTime', 'LocalDateTime', 12, '创建时间', NULL, 1, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (66, 6, 'receive_time', 'datetime', NULL, 'receiveTime', 'LocalDateTime', 13, '收衣时间', NULL, 0, 1, 1, 0, 1, 9, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (67, 6, 'finish_time', 'datetime', NULL, 'finishTime', 'LocalDateTime', 14, '完成时间', NULL, 0, 1, 1, 0, 1, 9, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (68, 6, 'delivery_time', 'datetime', NULL, 'deliveryTime', 'LocalDateTime', 15, '交付时间', NULL, 0, 1, 1, 0, 1, 9, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (69, 6, 'update_time', 'datetime', NULL, 'updateTime', 'LocalDateTime', 16, '更新时间', NULL, 0, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (70, 6, 'remark', 'varchar', NULL, 'remark', 'String', 17, '备注', 255, 0, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29');
INSERT INTO `gen_field_config` VALUES (71, 7, 'id', 'bigint', NULL, 'id', 'Long', 1, '衣物类型ID', NULL, 1, 1, 0, 1, 2, 1, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (72, 7, 'type_code', 'varchar', NULL, 'typeCode', 'String', 2, '类型代码', 20, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (73, 7, 'type_name', 'varchar', NULL, 'typeName', 'String', 3, '类型名称', 50, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (74, 7, 'category', 'tinyint', NULL, 'category', 'Integer', 4, '衣物类别,0-上装-top,1-下装-bottom,2-外套-outerwear,3-内衣-underwear,4-配饰-accessories,5-家居用品-home,6-特殊衣物-special', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (75, 7, 'base_price', 'decimal', NULL, 'basePrice', 'BigDecimal', 5, '基础价格', NULL, 0, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (76, 7, 'processing_time', 'smallint', NULL, 'processingTime', 'Integer', 6, '标准处理时间(分钟)', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (77, 7, 'special_requirements', 'text', NULL, 'specialRequirements', 'String', 7, '特殊处理要求', 65535, 0, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (78, 7, 'is_delicate', 'tinyint', NULL, 'isDelicate', 'Integer', 8, '是否精细衣物', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (79, 7, 'status', 'tinyint', NULL, 'status', 'Integer', 9, '状态(0-停用 1-启用)', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (80, 7, 'create_time', 'datetime', NULL, 'createTime', 'LocalDateTime', 10, '创建时间', NULL, 1, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (81, 7, 'update_time', 'datetime', NULL, 'updateTime', 'LocalDateTime', 11, '更新时间', NULL, 0, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48');
INSERT INTO `gen_field_config` VALUES (82, 8, 'id', 'bigint', NULL, 'id', 'Long', 1, '衣物明细ID', NULL, 1, 1, 0, 1, 2, 1, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (83, 8, 'order_id', 'bigint', NULL, 'orderId', 'Long', 2, '订单ID', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (84, 8, 'clothing_type_id', 'bigint', NULL, 'clothingTypeId', 'Long', 3, '衣物类型ID', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (85, 8, 'custom_type', 'varchar', NULL, 'customType', 'String', 4, '自定义衣物类型', 50, 0, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (86, 8, 'problem_desc', 'text', NULL, 'problemDesc', 'String', 5, '问题描述', 65535, 0, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (87, 8, 'price', 'decimal', NULL, 'price', 'BigDecimal', 6, '价格', NULL, 1, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (88, 8, 'process_status', 'tinyint', NULL, 'processStatus', 'Integer', 7, '处理状态 1-待处理-pending,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-质检中-quality_check,6-已完成-finished,7-问题衣物-problem', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (89, 8, 'special_instruction', 'varchar', NULL, 'specialInstruction', 'String', 8, '特殊要求', 255, 0, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (90, 8, 'start_time', 'datetime', NULL, 'startTime', 'LocalDateTime', 9, '开始处理时间', NULL, 0, 1, 1, 0, 1, 9, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (91, 8, 'end_time', 'datetime', NULL, 'endTime', 'LocalDateTime', 10, '完成处理时间', NULL, 0, 1, 1, 0, 1, 9, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (92, 8, 'create_time', 'datetime', NULL, 'createTime', 'LocalDateTime', 11, '创建时间', NULL, 1, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (93, 8, 'update_time', 'datetime', NULL, 'updateTime', 'LocalDateTime', 12, '更新时间', NULL, 0, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21');
INSERT INTO `gen_field_config` VALUES (94, 9, 'id', 'bigint', NULL, 'id', 'Long', 1, '图片记录ID', NULL, 1, 1, 0, 1, 2, 1, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40');
INSERT INTO `gen_field_config` VALUES (95, 9, 'order_id', 'bigint', NULL, 'orderId', 'Long', 2, '订单ID', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40');
INSERT INTO `gen_field_config` VALUES (96, 9, 'item_id', 'bigint', NULL, 'itemId', 'Long', 3, '衣物明细ID', NULL, 0, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40');
INSERT INTO `gen_field_config` VALUES (97, 9, 'image_type', 'tinyint', NULL, 'imageType', 'Integer', 4, '图片类型 1-收衣时-receive,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-完成时-finish,6-问题衣物-problem,7-质检时-quality_check,8-交付时-delivery', NULL, 1, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40');
INSERT INTO `gen_field_config` VALUES (98, 9, 'image_url', 'varchar', NULL, 'imageUrl', 'String', 5, '图片路径', 255, 0, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40');
INSERT INTO `gen_field_config` VALUES (99, 9, 'upload_user', 'bigint', NULL, 'uploadUser', 'Long', 6, '上传人ID', NULL, 0, 1, 1, 1, 2, 1, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40');
INSERT INTO `gen_field_config` VALUES (100, 9, 'description', 'varchar', NULL, 'description', 'String', 7, '图片描述', 255, 0, 1, 1, 0, 1, 1, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40');
INSERT INTO `gen_field_config` VALUES (101, 9, 'create_time', 'datetime', NULL, 'createTime', 'LocalDateTime', 8, '创建时间', NULL, 1, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40');
INSERT INTO `gen_field_config` VALUES (102, 9, 'update_time', 'datetime', NULL, 'updateTime', 'LocalDateTime', 9, '更新时间', NULL, 0, 1, 0, 0, 1, 9, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '会员编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员姓名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员手机号',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '会员年龄',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除(1:已删除;0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `config_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置名称',
  `config_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置key',
  `config_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人ID',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '系统限流QPS', 'IP_QPS_THRESHOLD_LIMIT', '10', '单个IP请求的最大每秒查询数（QPS）阈值Key', '2025-08-31 19:27:52', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父节点id',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '父节点id路径',
  `sort` smallint NULL DEFAULT 0 COMMENT '显示顺序',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(1-正常 0-禁用)',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除标识(1-已删除 0-未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code` ASC) USING BTREE COMMENT '部门编号唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '可我不敌可爱', 'Aioveu', 0, '0', 1, 1, 1, NULL, 1, '2025-08-31 19:27:20', 0);
INSERT INTO `sys_dept` VALUES (2, '研发部门', 'RD001', 1, '0,1', 1, 1, 2, NULL, 2, '2025-08-31 19:27:20', 0);
INSERT INTO `sys_dept` VALUES (3, '测试部门', 'QA001', 1, '0,1', 1, 1, 2, NULL, 2, '2025-08-31 19:27:21', 0);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `dict_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型名称',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态(0:正常;1:禁用)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人ID',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '是否删除(1-删除，0-未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dict_code`(`dict_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'gender', '性别', 1, NULL, '2025-08-31 19:27:23', 1, '2025-08-31 19:27:23', 1, 0);
INSERT INTO `sys_dict` VALUES (2, 'notice_type', '通知类型', 1, NULL, '2025-08-31 19:27:23', 1, '2025-08-31 19:27:23', 1, 0);
INSERT INTO `sys_dict` VALUES (3, 'notice_level', '通知级别', 1, NULL, '2025-08-31 19:27:24', 1, '2025-08-31 19:27:24', 1, 0);
INSERT INTO `sys_dict` VALUES (4, 'employee_status', '员工状态', 1, '员工状态：0-离职，1-在职,2-休假,3-实习', '2025-08-31 21:28:43', NULL, '2025-08-31 21:28:43', NULL, 0);
INSERT INTO `sys_dict` VALUES (5, 'attendance_status', '考勤状态', 1, '考勤状态：0-正常，1-迟到，2-早退，3-缺勤，4-休假', '2025-08-31 21:30:09', NULL, '2025-08-31 21:30:09', NULL, 0);
INSERT INTO `sys_dict` VALUES (6, 'position_level', '职级(1-10)', 1, '职级(1-10，数字越大职级越高)', '2025-08-31 21:31:41', NULL, '2025-08-31 21:31:41', NULL, 0);
INSERT INTO `sys_dict` VALUES (7, 'performance_period_quarter', '考核季度(1-4)', 1, '考核季度(1-4)', '2025-08-31 21:34:27', NULL, '2025-08-31 21:34:27', NULL, 0);
INSERT INTO `sys_dict` VALUES (8, 'performance_grade', '绩效等级', 1, 'A b c d', '2025-08-31 21:36:02', NULL, '2025-08-31 21:36:02', NULL, 0);
INSERT INTO `sys_dict` VALUES (9, 'salary_payment_status', '工资发放状态', 1, '发放状态：0-未发放，1-已发放，2-发放失败', '2025-08-31 21:38:06', NULL, '2025-08-31 21:38:06', NULL, 0);
INSERT INTO `sys_dict` VALUES (10, 'material_is_active', '物资启用状态', 1, '启用状态：0-禁用，1-启用', '2025-08-31 21:39:01', NULL, '2025-08-31 21:39:01', NULL, 0);
INSERT INTO `sys_dict` VALUES (11, 'warehouse_is_active', '仓库启用状态', 1, '启用状态：0-停用，1-启用', '2025-08-31 21:39:42', NULL, '2025-08-31 21:39:42', NULL, 0);
INSERT INTO `sys_dict` VALUES (12, 'inbound_type', '入库类型', 1, '入库类型：1-采购入库，2-退货入库，3-调拨入库，4-其他', '2025-08-31 21:41:46', NULL, '2025-08-31 21:41:46', NULL, 0);
INSERT INTO `sys_dict` VALUES (13, 'equipment_status', '设备状态', 1, '状态：1-在用，2-闲置，3-维修中，4-报废', '2025-08-31 21:42:49', NULL, '2025-08-31 21:42:49', NULL, 0);
INSERT INTO `sys_dict` VALUES (14, 'procurement_status', '采购状态', 1, '状态：1-待审核，2-已下单，3-已发货，4-已收货，5-已入库，6-已取消', '2025-08-31 21:43:45', NULL, '2025-08-31 21:43:45', NULL, 0);
INSERT INTO `sys_dict` VALUES (15, 'outbound_status', '出库状态', 1, '状态：1-待出库，2-已出库，3-已取', '2025-08-31 21:45:19', NULL, '2025-08-31 21:45:19', NULL, 0);
INSERT INTO `sys_dict` VALUES (16, 'customer_customer_type', '客户类型', 1, '客户类型：1-企业，2-个人，3-政府，4-其他', '2025-08-31 21:46:13', NULL, '2025-08-31 21:46:13', NULL, 0);
INSERT INTO `sys_dict` VALUES (17, 'customer_credit_rating', '信用等级', 1, '信用等级：1-AAA，2-AA，3-A，4-B，5-C', '2025-08-31 21:47:19', NULL, '2025-08-31 21:47:19', NULL, 0);
INSERT INTO `sys_dict` VALUES (18, 'customer_status', '客户状态', 1, '客户状态：1-潜在客户，2-活跃客户，3-休眠客户，4-流失客户', '2025-08-31 21:48:30', NULL, '2025-08-31 21:48:30', NULL, 0);
INSERT INTO `sys_dict` VALUES (19, 'customer_source', '客户来源', 1, '客户来源：1-线上推广，2-线下活动，3-客户推荐，4-销售开发，5-其他', '2025-08-31 21:49:24', NULL, '2025-08-31 21:49:24', NULL, 0);
INSERT INTO `sys_dict` VALUES (20, 'contact_is_primary', '是否是主要联系人', 1, '是否是主要联系人：0-否，1-是', '2025-08-31 21:50:26', NULL, '2025-08-31 21:50:26', NULL, 0);
INSERT INTO `sys_dict` VALUES (21, 'transaction_payment_method', '交易支付方式', 1, '支付方式：1-现金，2-银行转账，3-信用卡，4-支付宝，5-微信支付，6-其他', '2025-08-31 21:51:02', NULL, '2025-08-31 21:51:02', NULL, 0);
INSERT INTO `sys_dict` VALUES (22, 'transaction_payment_status', '交易支付状态', 1, '支付状态：1-待支付，2-部分支付，3-已支付，4-已退款', '2025-08-31 21:53:55', NULL, '2025-08-31 21:53:55', NULL, 0);
INSERT INTO `sys_dict` VALUES (23, 'transaction_type', '交易类型', 1, '交易类型：1-销售，2-服务，3-退款，4-其他', '2025-08-31 21:54:47', NULL, '2025-08-31 21:54:47', NULL, 0);
INSERT INTO `sys_dict` VALUES (24, 'transaction_status', '交易状态', 1, '交易状态：1-进行中，2-已完成，3-已取', '2025-08-31 21:55:53', NULL, '2025-08-31 21:55:53', NULL, 0);
INSERT INTO `sys_dict` VALUES (25, 'salesOrder_payment_terms', '订单付款条件', 1, '付款条件：1-预付全款，2-货到付款，3-月结30天，4-月结60天，5-其他', '2025-08-31 21:56:43', NULL, '2025-08-31 21:56:43', NULL, 0);
INSERT INTO `sys_dict` VALUES (26, 'salesOrder_payment_status', '订单支付状态', 1, '支付状态：1-未支付，2-部分支付，3-已支付', '2025-08-31 21:57:54', NULL, '2025-08-31 21:57:54', NULL, 0);
INSERT INTO `sys_dict` VALUES (27, 'salesOrder_order_status', '订单状态', 1, '订单状态：1-待处理，2-已确认，3-生产中，4-已发货，5-已完成，6-已取消', '2025-08-31 21:58:34', NULL, '2025-08-31 21:58:34', NULL, 0);
INSERT INTO `sys_dict` VALUES (28, 'salesOrder_shipping_method', '订单运输方式', 1, '运输方式：1-快递，2-物流，3-自提，4-其他', '2025-08-31 22:00:01', NULL, '2025-08-31 22:00:01', NULL, 0);
INSERT INTO `sys_dict` VALUES (29, 'salesOrderDetail_status', '订单明细状态', 1, '明细状态：1-待处理，2-备货中，3-已发货，4-已收货，5-已取消', '2025-08-31 22:00:57', NULL, '2025-08-31 22:00:57', NULL, 0);
INSERT INTO `sys_dict` VALUES (30, 'member_level_status', '会员等级状态', 1, '会员等级状态(0-禁用 1-启用)', '2025-09-30 18:10:54', NULL, '2025-09-30 18:16:48', NULL, 0);
INSERT INTO `sys_dict` VALUES (31, 'member_status', '会员状态', 1, '会员状态(0-禁用 1-正常)', '2025-09-30 18:18:35', NULL, '2025-09-30 18:18:35', NULL, 0);
INSERT INTO `sys_dict` VALUES (32, 'member_account_status', '会员充值账户状态', 1, '会员充值账户状态(0-冻结 1-正常)', '2025-09-30 18:24:06', NULL, '2025-09-30 18:24:06', NULL, 0);
INSERT INTO `sys_dict` VALUES (33, 'member_recharge_record_payment_type', '会员充值记录支付方式', 1, '会员充值记录支付方式 1-wechat,2-alipay,3-cash,4-card,5-bank', '2025-09-30 18:29:03', NULL, '2025-09-30 18:29:03', NULL, 0);
INSERT INTO `sys_dict` VALUES (34, 'member_recharge_record_status', '会员充值记录充值状态', 1, '会员充值记录充值状态1-pending待定,2-success成功,3-failed失败', '2025-09-30 18:31:03', NULL, '2025-09-30 18:31:03', NULL, 0);
INSERT INTO `sys_dict` VALUES (35, 'laundry_order_status', '洗衣订单状态', 1, '洗衣订单状态 0创建,1接收,2洗衣,3干燥,4熨烫,5质量检查,6完成,7运送,8取消', '2025-09-30 18:35:04', NULL, '2025-09-30 18:35:04', NULL, 0);
INSERT INTO `sys_dict` VALUES (36, 'laundry_order_payment_status', '洗衣订单支付状态 ', 1, '洗衣订单支付状态 1-未支付-unpaid,2-部分支付-partial,3-已支付-paid,4-退还-refunded', '2025-09-30 18:38:02', NULL, '2025-09-30 18:38:02', NULL, 0);
INSERT INTO `sys_dict` VALUES (37, 'laundry_clothing_type_category', '衣物类别', 1, '衣物类别,0-上装-top,1-下装-bottom,2-外套-outerwear,3-内衣-underwear,4-配饰-accessories,5-家居用品-home,6-特殊衣物-special', '2025-09-30 18:45:42', NULL, '2025-09-30 18:45:42', NULL, 0);
INSERT INTO `sys_dict` VALUES (38, 'laundry_clothing_type_is_delicate', '衣物是否精细', 1, '是否精细衣物:0-非精细衣物,1-精细衣物', '2025-09-30 18:47:35', NULL, '2025-09-30 18:47:35', NULL, 0);
INSERT INTO `sys_dict` VALUES (39, 'laundry_clothing_type_status', '衣物类别状态', 1, '衣物类别状态(0-停用 1-启用)', '2025-09-30 18:48:29', NULL, '2025-09-30 18:48:29', NULL, 0);
INSERT INTO `sys_dict` VALUES (40, 'laundry_order_item_process_status', '洗衣订单衣物明细处理状态', 1, '洗衣订单衣物明细处理状态 1-待处理-pending,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-质检中-quality_check,6-已完成-finished,7-问题衣物-problem', '2025-09-30 18:53:09', NULL, '2025-09-30 18:53:09', NULL, 0);
INSERT INTO `sys_dict` VALUES (41, 'laundry_process_image_image_type', '洗衣流程图片记录图片类型', 1, '图片类型 1-收衣时-receive,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-完成时-finish,6-问题衣物-problem,7-质检时-quality_check,8-交付时-delivery', '2025-09-30 18:58:08', NULL, '2025-09-30 18:58:08', NULL, 0);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联字典编码，与sys_dict表中的dict_code对应',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典项值',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典项标签',
  `tag_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签类型，用于前端样式展示（如success、warning等）',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（1-正常，0-禁用）',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES (1, 'gender', '1', '男', 'primary', 1, 1, NULL, '2025-08-31 19:27:25', 1, '2025-08-31 19:27:25', 1);
INSERT INTO `sys_dict_item` VALUES (2, 'gender', '2', '女', 'danger', 1, 2, NULL, '2025-08-31 19:27:25', 1, '2025-08-31 19:27:25', 1);
INSERT INTO `sys_dict_item` VALUES (3, 'gender', '0', '保密', 'info', 1, 3, NULL, '2025-08-31 19:27:26', 1, '2025-08-31 19:27:26', 1);
INSERT INTO `sys_dict_item` VALUES (4, 'notice_type', '1', '系统升级', 'success', 1, 1, '', '2025-08-31 19:27:26', 1, '2025-08-31 19:27:26', 1);
INSERT INTO `sys_dict_item` VALUES (5, 'notice_type', '2', '系统维护', 'primary', 1, 2, '', '2025-08-31 19:27:26', 1, '2025-08-31 19:27:26', 1);
INSERT INTO `sys_dict_item` VALUES (6, 'notice_type', '3', '安全警告', 'danger', 1, 3, '', '2025-08-31 19:27:26', 1, '2025-08-31 19:27:26', 1);
INSERT INTO `sys_dict_item` VALUES (7, 'notice_type', '4', '假期通知', 'success', 1, 4, '', '2025-08-31 19:27:26', 1, '2025-08-31 19:27:26', 1);
INSERT INTO `sys_dict_item` VALUES (8, 'notice_type', '5', '公司新闻', 'primary', 1, 5, '', '2025-08-31 19:27:27', 1, '2025-08-31 19:27:27', 1);
INSERT INTO `sys_dict_item` VALUES (9, 'notice_type', '99', '其他', 'info', 1, 99, '', '2025-08-31 19:27:27', 1, '2025-08-31 19:27:27', 1);
INSERT INTO `sys_dict_item` VALUES (10, 'notice_level', 'L', '低', 'info', 1, 1, '', '2025-08-31 19:27:27', 1, '2025-08-31 19:27:27', 1);
INSERT INTO `sys_dict_item` VALUES (11, 'notice_level', 'M', '中', 'warning', 1, 2, '', '2025-08-31 19:27:27', 1, '2025-08-31 19:27:27', 1);
INSERT INTO `sys_dict_item` VALUES (12, 'notice_level', 'H', '高', 'danger', 1, 3, '', '2025-08-31 19:27:27', 1, '2025-08-31 19:27:27', 1);
INSERT INTO `sys_dict_item` VALUES (13, 'gender', '3', '外星人', 'success', 1, 3, NULL, '2025-08-31 21:28:11', NULL, '2025-08-31 21:28:11', NULL);
INSERT INTO `sys_dict_item` VALUES (14, 'employee_status', '0', '离职', 'info', 1, 0, NULL, '2025-08-31 21:29:09', NULL, '2025-08-31 21:29:09', NULL);
INSERT INTO `sys_dict_item` VALUES (15, 'employee_status', '1', '在职', 'success', 1, 1, NULL, '2025-08-31 21:29:19', NULL, '2025-08-31 21:29:19', NULL);
INSERT INTO `sys_dict_item` VALUES (16, 'employee_status', '2', '休假', 'warning', 1, 2, NULL, '2025-08-31 21:29:42', NULL, '2025-08-31 21:29:42', NULL);
INSERT INTO `sys_dict_item` VALUES (17, 'employee_status', '3', '实习', 'primary', 1, 3, NULL, '2025-08-31 21:29:54', NULL, '2025-08-31 21:29:54', NULL);
INSERT INTO `sys_dict_item` VALUES (18, 'attendance_status', '0', '正常', 'success', 1, 0, NULL, '2025-08-31 21:30:24', NULL, '2025-08-31 21:30:24', NULL);
INSERT INTO `sys_dict_item` VALUES (19, 'attendance_status', '1', '迟到', 'warning', 1, 1, NULL, '2025-08-31 21:30:43', NULL, '2025-08-31 21:30:43', NULL);
INSERT INTO `sys_dict_item` VALUES (20, 'attendance_status', '2', '早退', 'primary', 1, 2, NULL, '2025-08-31 21:30:58', NULL, '2025-08-31 21:30:58', NULL);
INSERT INTO `sys_dict_item` VALUES (21, 'attendance_status', '3', '缺勤', 'danger', 1, 3, NULL, '2025-08-31 21:31:09', NULL, '2025-08-31 21:31:09', NULL);
INSERT INTO `sys_dict_item` VALUES (22, 'attendance_status', '4', '休假', 'success', 1, 4, NULL, '2025-08-31 21:31:22', NULL, '2025-08-31 21:31:22', NULL);
INSERT INTO `sys_dict_item` VALUES (23, 'position_level', '1', '1', 'primary', 1, 1, NULL, '2025-08-31 21:32:25', NULL, '2025-08-31 21:32:25', NULL);
INSERT INTO `sys_dict_item` VALUES (24, 'position_level', '2', '2', 'primary', 1, 2, NULL, '2025-08-31 21:32:32', NULL, '2025-08-31 21:32:32', NULL);
INSERT INTO `sys_dict_item` VALUES (25, 'position_level', '3', '3', 'success', 1, 3, NULL, '2025-08-31 21:32:38', NULL, '2025-08-31 21:32:38', NULL);
INSERT INTO `sys_dict_item` VALUES (26, 'position_level', '4', '4', 'success', 1, 4, NULL, '2025-08-31 21:32:44', NULL, '2025-08-31 21:32:44', NULL);
INSERT INTO `sys_dict_item` VALUES (27, 'position_level', '5', '5', 'info', 1, 5, NULL, '2025-08-31 21:32:51', NULL, '2025-08-31 21:32:51', NULL);
INSERT INTO `sys_dict_item` VALUES (28, 'position_level', '6', '6', 'info', 1, 6, NULL, '2025-08-31 21:33:00', NULL, '2025-08-31 21:33:00', NULL);
INSERT INTO `sys_dict_item` VALUES (29, 'position_level', '7', '7', 'warning', 1, 7, NULL, '2025-08-31 21:33:12', NULL, '2025-08-31 21:33:12', NULL);
INSERT INTO `sys_dict_item` VALUES (30, 'position_level', '8', '8', 'warning', 1, 8, NULL, '2025-08-31 21:33:22', NULL, '2025-08-31 21:33:22', NULL);
INSERT INTO `sys_dict_item` VALUES (31, 'position_level', '9', '9', 'danger', 1, 9, NULL, '2025-08-31 21:33:32', NULL, '2025-08-31 21:33:32', NULL);
INSERT INTO `sys_dict_item` VALUES (32, 'position_level', '10', '10', 'danger', 1, 10, NULL, '2025-08-31 21:33:44', NULL, '2025-08-31 21:33:44', NULL);
INSERT INTO `sys_dict_item` VALUES (33, 'performance_period_quarter', '1', '第 1 季度', 'success', 1, 1, NULL, '2025-08-31 21:35:06', NULL, '2025-08-31 21:35:06', NULL);
INSERT INTO `sys_dict_item` VALUES (34, 'performance_period_quarter', '2', '第 2 季度', 'danger', 1, 2, NULL, '2025-08-31 21:35:19', NULL, '2025-08-31 21:35:19', NULL);
INSERT INTO `sys_dict_item` VALUES (35, 'performance_period_quarter', '3', '第 3 季度', 'warning', 1, 3, NULL, '2025-08-31 21:35:31', NULL, '2025-08-31 21:35:31', NULL);
INSERT INTO `sys_dict_item` VALUES (36, 'performance_period_quarter', '4', '第 4 季度', 'primary', 1, 4, NULL, '2025-08-31 21:35:43', NULL, '2025-08-31 21:35:43', NULL);
INSERT INTO `sys_dict_item` VALUES (37, 'performance_grade', 'A', 'A', 'success', 1, 1, NULL, '2025-08-31 21:37:28', NULL, '2025-08-31 21:37:28', NULL);
INSERT INTO `sys_dict_item` VALUES (38, 'performance_grade', 'B', 'B', 'primary', 1, 2, NULL, '2025-08-31 21:37:35', NULL, '2025-08-31 21:37:35', NULL);
INSERT INTO `sys_dict_item` VALUES (39, 'performance_grade', 'C', 'C', 'warning', 1, 3, NULL, '2025-08-31 21:37:44', NULL, '2025-08-31 21:37:44', NULL);
INSERT INTO `sys_dict_item` VALUES (40, 'performance_grade', 'D', 'D', 'danger', 1, 4, NULL, '2025-08-31 21:37:50', NULL, '2025-08-31 21:37:50', NULL);
INSERT INTO `sys_dict_item` VALUES (41, 'salary_payment_status', '0', '未发放', 'info', 1, 0, NULL, '2025-08-31 21:38:21', NULL, '2025-08-31 21:38:21', NULL);
INSERT INTO `sys_dict_item` VALUES (42, 'salary_payment_status', '1', '已发放', 'success', 1, 1, NULL, '2025-08-31 21:38:31', NULL, '2025-08-31 21:38:31', NULL);
INSERT INTO `sys_dict_item` VALUES (43, 'salary_payment_status', '2', '发放失败', 'danger', 1, 2, NULL, '2025-08-31 21:38:45', NULL, '2025-08-31 21:38:45', NULL);
INSERT INTO `sys_dict_item` VALUES (44, 'material_is_active', '0', '禁用', 'danger', 1, 0, NULL, '2025-08-31 21:39:14', NULL, '2025-08-31 21:39:14', NULL);
INSERT INTO `sys_dict_item` VALUES (45, 'material_is_active', '1', '启用', 'success', 1, 1, NULL, '2025-08-31 21:39:22', NULL, '2025-08-31 21:39:22', NULL);
INSERT INTO `sys_dict_item` VALUES (46, 'warehouse_is_active', '0', '停用', 'danger', 1, 0, NULL, '2025-08-31 21:39:56', NULL, '2025-08-31 21:39:56', NULL);
INSERT INTO `sys_dict_item` VALUES (47, 'warehouse_is_active', '1', '启用', 'success', 1, 1, NULL, '2025-08-31 21:40:03', NULL, '2025-08-31 21:40:03', NULL);
INSERT INTO `sys_dict_item` VALUES (48, 'inbound_type', '1', '采购入库', 'success', 1, 1, NULL, '2025-08-31 21:42:01', NULL, '2025-08-31 21:42:01', NULL);
INSERT INTO `sys_dict_item` VALUES (49, 'inbound_type', '2', '退货入库', 'danger', 1, 2, NULL, '2025-08-31 21:42:13', NULL, '2025-08-31 21:42:13', NULL);
INSERT INTO `sys_dict_item` VALUES (50, 'inbound_type', '3', '调拨入库', 'primary', 1, 3, NULL, '2025-08-31 21:42:26', NULL, '2025-08-31 21:42:26', NULL);
INSERT INTO `sys_dict_item` VALUES (51, 'inbound_type', '4', '其他', 'warning', 1, 4, NULL, '2025-08-31 21:42:35', NULL, '2025-08-31 21:42:35', NULL);
INSERT INTO `sys_dict_item` VALUES (52, 'equipment_status', '1', '在用', 'success', 1, 1, NULL, '2025-08-31 21:43:01', NULL, '2025-08-31 21:43:01', NULL);
INSERT INTO `sys_dict_item` VALUES (53, 'equipment_status', '2', '闲置', 'warning', 1, 2, NULL, '2025-08-31 21:43:10', NULL, '2025-08-31 21:43:10', NULL);
INSERT INTO `sys_dict_item` VALUES (54, 'equipment_status', '3', '维修中', 'primary', 1, 3, NULL, '2025-08-31 21:43:23', NULL, '2025-08-31 21:43:23', NULL);
INSERT INTO `sys_dict_item` VALUES (55, 'equipment_status', '4', '报废', 'danger', 1, 4, NULL, '2025-08-31 21:43:32', NULL, '2025-08-31 21:43:32', NULL);
INSERT INTO `sys_dict_item` VALUES (56, 'procurement_status', '1', '待审核', 'primary', 1, 1, NULL, '2025-08-31 21:44:07', NULL, '2025-08-31 21:44:07', NULL);
INSERT INTO `sys_dict_item` VALUES (57, 'procurement_status', '2', '已下单', 'warning', 1, 2, NULL, '2025-08-31 21:44:19', NULL, '2025-08-31 21:44:19', NULL);
INSERT INTO `sys_dict_item` VALUES (58, 'procurement_status', '3', '已发货', 'success', 1, 3, NULL, '2025-08-31 21:44:30', NULL, '2025-08-31 21:44:30', NULL);
INSERT INTO `sys_dict_item` VALUES (59, 'procurement_status', '4', '已收货', 'success', 1, 4, NULL, '2025-08-31 21:44:43', NULL, '2025-08-31 21:44:43', NULL);
INSERT INTO `sys_dict_item` VALUES (60, 'procurement_status', '5', '已入库', 'success', 1, 5, NULL, '2025-08-31 21:44:51', NULL, '2025-08-31 21:44:51', NULL);
INSERT INTO `sys_dict_item` VALUES (61, 'procurement_status', '6', '已取消', 'danger', 1, 6, NULL, '2025-08-31 21:45:02', NULL, '2025-08-31 21:45:02', NULL);
INSERT INTO `sys_dict_item` VALUES (62, 'outbound_status', '1', '待出库', 'warning', 1, 1, NULL, '2025-08-31 21:45:32', NULL, '2025-08-31 21:45:32', NULL);
INSERT INTO `sys_dict_item` VALUES (63, 'outbound_status', '2', '已出库', 'primary', 1, 2, NULL, '2025-08-31 21:45:41', NULL, '2025-08-31 21:45:41', NULL);
INSERT INTO `sys_dict_item` VALUES (64, 'outbound_status', '3', '已取', 'success', 1, 3, NULL, '2025-08-31 21:45:54', NULL, '2025-08-31 21:45:54', NULL);
INSERT INTO `sys_dict_item` VALUES (65, 'customer_customer_type', '1', '企业', 'primary', 1, 1, NULL, '2025-08-31 21:46:27', NULL, '2025-08-31 21:46:27', NULL);
INSERT INTO `sys_dict_item` VALUES (66, 'customer_customer_type', '2', '个人', 'success', 1, 2, NULL, '2025-08-31 21:46:36', NULL, '2025-08-31 21:46:36', NULL);
INSERT INTO `sys_dict_item` VALUES (67, 'customer_customer_type', '3', '政府', 'danger', 1, 3, NULL, '2025-08-31 21:46:47', NULL, '2025-08-31 21:46:47', NULL);
INSERT INTO `sys_dict_item` VALUES (68, 'customer_customer_type', '4', '其他', 'warning', 1, 4, NULL, '2025-08-31 21:47:02', NULL, '2025-08-31 21:47:02', NULL);
INSERT INTO `sys_dict_item` VALUES (69, 'customer_credit_rating', '1', 'AAA', 'success', 1, 1, NULL, '2025-08-31 21:47:30', NULL, '2025-08-31 21:47:30', NULL);
INSERT INTO `sys_dict_item` VALUES (70, 'customer_credit_rating', '2', 'AA', 'primary', 1, 2, NULL, '2025-08-31 21:47:38', NULL, '2025-08-31 21:47:38', NULL);
INSERT INTO `sys_dict_item` VALUES (71, 'customer_credit_rating', '3', 'A', 'warning', 1, 3, NULL, '2025-08-31 21:47:57', NULL, '2025-08-31 21:47:57', NULL);
INSERT INTO `sys_dict_item` VALUES (72, 'customer_credit_rating', '4', 'B', 'info', 1, 4, NULL, '2025-08-31 21:48:09', NULL, '2025-08-31 21:48:09', NULL);
INSERT INTO `sys_dict_item` VALUES (73, 'customer_credit_rating', '5', 'C', 'danger', 1, 5, NULL, '2025-08-31 21:48:16', NULL, '2025-08-31 21:48:16', NULL);
INSERT INTO `sys_dict_item` VALUES (74, 'customer_status', '1', '潜在客户', 'primary', 0, 1, NULL, '2025-08-31 21:48:42', NULL, '2025-08-31 21:48:42', NULL);
INSERT INTO `sys_dict_item` VALUES (75, 'customer_status', '2', '活跃客户', 'success', 1, 2, NULL, '2025-08-31 21:48:50', NULL, '2025-08-31 21:48:50', NULL);
INSERT INTO `sys_dict_item` VALUES (76, 'customer_status', '3', '休眠客户', 'warning', 1, 3, NULL, '2025-08-31 21:49:00', NULL, '2025-08-31 21:49:00', NULL);
INSERT INTO `sys_dict_item` VALUES (77, 'customer_status', '4', '流失客户', 'danger', 1, 4, NULL, '2025-08-31 21:49:09', NULL, '2025-08-31 21:49:09', NULL);
INSERT INTO `sys_dict_item` VALUES (78, 'customer_source', '1', '线上推广', 'primary', 1, 1, NULL, '2025-08-31 21:49:35', NULL, '2025-08-31 21:49:35', NULL);
INSERT INTO `sys_dict_item` VALUES (79, 'customer_source', '2', '线下活动', 'success', 1, 2, NULL, '2025-08-31 21:49:45', NULL, '2025-08-31 21:49:45', NULL);
INSERT INTO `sys_dict_item` VALUES (80, 'customer_source', '3', '客户推荐', 'warning', 1, 3, NULL, '2025-08-31 21:49:55', NULL, '2025-08-31 21:49:55', NULL);
INSERT INTO `sys_dict_item` VALUES (81, 'customer_source', '4', '销售开发', 'danger', 1, 4, NULL, '2025-08-31 21:50:03', NULL, '2025-08-31 21:50:03', NULL);
INSERT INTO `sys_dict_item` VALUES (82, 'customer_source', '5', '其他', 'info', 1, 5, NULL, '2025-08-31 21:50:11', NULL, '2025-08-31 21:50:11', NULL);
INSERT INTO `sys_dict_item` VALUES (83, 'contact_is_primary', '0', '否', 'danger', 1, 0, NULL, '2025-08-31 21:50:40', NULL, '2025-08-31 21:50:40', NULL);
INSERT INTO `sys_dict_item` VALUES (84, 'contact_is_primary', '1', '是', 'success', 1, 1, NULL, '2025-08-31 21:50:48', NULL, '2025-08-31 21:50:48', NULL);
INSERT INTO `sys_dict_item` VALUES (85, 'transaction_payment_method', '1', '现金', 'primary', 1, 1, NULL, '2025-08-31 21:51:51', NULL, '2025-08-31 21:51:51', NULL);
INSERT INTO `sys_dict_item` VALUES (86, 'transaction_payment_method', '2', '银行转账', 'warning', 1, 2, NULL, '2025-08-31 21:52:00', NULL, '2025-08-31 21:52:00', NULL);
INSERT INTO `sys_dict_item` VALUES (87, 'transaction_payment_method', '3', '信用卡', 'warning', 1, 3, NULL, '2025-08-31 21:52:29', NULL, '2025-08-31 21:52:29', NULL);
INSERT INTO `sys_dict_item` VALUES (88, 'transaction_payment_method', '4', '支付宝', 'primary', 1, 4, NULL, '2025-08-31 21:52:45', NULL, '2025-08-31 21:52:45', NULL);
INSERT INTO `sys_dict_item` VALUES (89, 'transaction_payment_method', '5', '微信支付', 'success', 1, 5, NULL, '2025-08-31 21:52:56', NULL, '2025-08-31 21:52:56', NULL);
INSERT INTO `sys_dict_item` VALUES (90, 'transaction_payment_method', '6', '其他', 'info', 1, 6, NULL, '2025-08-31 21:53:05', NULL, '2025-08-31 21:53:05', NULL);
INSERT INTO `sys_dict_item` VALUES (91, 'transaction_payment_status', '1', '待支付', 'warning', 1, 1, NULL, '2025-08-31 21:54:08', NULL, '2025-08-31 21:54:08', NULL);
INSERT INTO `sys_dict_item` VALUES (92, 'transaction_payment_status', '2', '部分支付', 'primary', 1, 2, NULL, '2025-08-31 21:54:17', NULL, '2025-08-31 21:54:17', NULL);
INSERT INTO `sys_dict_item` VALUES (93, 'transaction_payment_status', '3', '已支付', 'success', 1, 3, NULL, '2025-08-31 21:54:26', NULL, '2025-08-31 21:54:26', NULL);
INSERT INTO `sys_dict_item` VALUES (94, 'transaction_payment_status', '4', '已退款', 'danger', 1, 4, NULL, '2025-08-31 21:54:34', NULL, '2025-08-31 21:54:34', NULL);
INSERT INTO `sys_dict_item` VALUES (95, 'transaction_type', '1', '销售', 'danger', 1, 1, NULL, '2025-08-31 21:55:01', NULL, '2025-08-31 21:55:01', NULL);
INSERT INTO `sys_dict_item` VALUES (96, 'transaction_type', '2', '服务', 'success', 1, 2, NULL, '2025-08-31 21:55:09', NULL, '2025-08-31 21:55:09', NULL);
INSERT INTO `sys_dict_item` VALUES (97, 'transaction_type', '3', '退款', 'warning', 1, 3, NULL, '2025-08-31 21:55:17', NULL, '2025-08-31 21:55:17', NULL);
INSERT INTO `sys_dict_item` VALUES (98, 'transaction_type', '4', '其他', 'info', 1, 4, NULL, '2025-08-31 21:55:33', NULL, '2025-08-31 21:55:38', NULL);
INSERT INTO `sys_dict_item` VALUES (99, 'transaction_status', '1', '进行中', 'primary', 1, 1, NULL, '2025-08-31 21:56:06', NULL, '2025-08-31 21:56:06', NULL);
INSERT INTO `sys_dict_item` VALUES (100, 'transaction_status', '2', '已完成', 'warning', 1, 2, NULL, '2025-08-31 21:56:16', NULL, '2025-08-31 21:56:22', NULL);
INSERT INTO `sys_dict_item` VALUES (101, 'transaction_status', '3', '已取', 'success', 1, 3, NULL, '2025-08-31 21:56:31', NULL, '2025-08-31 21:56:31', NULL);
INSERT INTO `sys_dict_item` VALUES (102, 'salesOrder_payment_terms', '1', '预付全款', 'success', 1, 1, NULL, '2025-08-31 21:56:59', NULL, '2025-08-31 21:56:59', NULL);
INSERT INTO `sys_dict_item` VALUES (103, 'salesOrder_payment_terms', '2', '货到付款', 'warning', 1, 2, NULL, '2025-08-31 21:57:12', NULL, '2025-08-31 21:57:12', NULL);
INSERT INTO `sys_dict_item` VALUES (104, 'salesOrder_payment_terms', '3', '月结30天', 'primary', 1, 3, NULL, '2025-08-31 21:57:23', NULL, '2025-08-31 21:57:23', NULL);
INSERT INTO `sys_dict_item` VALUES (105, 'salesOrder_payment_terms', '4', '月结60天', 'danger', 1, 4, NULL, '2025-08-31 21:57:33', NULL, '2025-08-31 21:57:33', NULL);
INSERT INTO `sys_dict_item` VALUES (106, 'salesOrder_payment_terms', '5', '其他', 'info', 1, 5, NULL, '2025-08-31 21:57:42', NULL, '2025-08-31 21:57:42', NULL);
INSERT INTO `sys_dict_item` VALUES (107, 'salesOrder_payment_status', '1', '未支付', 'danger', 1, 1, NULL, '2025-08-31 21:58:04', NULL, '2025-08-31 21:58:04', NULL);
INSERT INTO `sys_dict_item` VALUES (108, 'salesOrder_payment_status', '2', '部分支付', 'primary', 1, 2, NULL, '2025-08-31 21:58:13', NULL, '2025-08-31 21:58:13', NULL);
INSERT INTO `sys_dict_item` VALUES (109, 'salesOrder_payment_status', '3', '已支付', 'success', 1, 3, NULL, '2025-08-31 21:58:22', NULL, '2025-08-31 21:58:22', NULL);
INSERT INTO `sys_dict_item` VALUES (110, 'salesOrder_order_status', '1', '待处理', 'warning', 1, 1, NULL, '2025-08-31 21:58:46', NULL, '2025-08-31 21:58:46', NULL);
INSERT INTO `sys_dict_item` VALUES (111, 'salesOrder_order_status', '2', '已确认', 'primary', 1, 2, NULL, '2025-08-31 21:59:03', NULL, '2025-08-31 21:59:03', NULL);
INSERT INTO `sys_dict_item` VALUES (112, 'salesOrder_order_status', '3', '生产中', 'warning', 1, 3, NULL, '2025-08-31 21:59:13', NULL, '2025-08-31 21:59:13', NULL);
INSERT INTO `sys_dict_item` VALUES (113, 'salesOrder_order_status', '4', '已发货', 'primary', 1, 4, NULL, '2025-08-31 21:59:30', NULL, '2025-08-31 21:59:30', NULL);
INSERT INTO `sys_dict_item` VALUES (114, 'salesOrder_order_status', '5', '已完成', 'success', 1, 5, NULL, '2025-08-31 21:59:39', NULL, '2025-08-31 21:59:39', NULL);
INSERT INTO `sys_dict_item` VALUES (115, 'salesOrder_order_status', '6', '已取消', 'danger', 1, 6, NULL, '2025-08-31 21:59:47', NULL, '2025-08-31 21:59:47', NULL);
INSERT INTO `sys_dict_item` VALUES (116, 'salesOrder_shipping_method', '1', '快递', 'primary', 1, 1, NULL, '2025-08-31 22:00:12', NULL, '2025-08-31 22:00:12', NULL);
INSERT INTO `sys_dict_item` VALUES (117, 'salesOrder_shipping_method', '2', '物流', 'warning', 1, 1, NULL, '2025-08-31 22:00:21', NULL, '2025-08-31 22:00:21', NULL);
INSERT INTO `sys_dict_item` VALUES (118, 'salesOrder_shipping_method', '3', '自提', 'success', 1, 3, NULL, '2025-08-31 22:00:31', NULL, '2025-08-31 22:00:31', NULL);
INSERT INTO `sys_dict_item` VALUES (119, 'salesOrder_shipping_method', '4', '其他', 'info', 1, 4, NULL, '2025-08-31 22:00:39', NULL, '2025-08-31 22:00:39', NULL);
INSERT INTO `sys_dict_item` VALUES (120, 'salesOrderDetail_status', '1', '待处理', 'warning', 1, 1, NULL, '2025-08-31 22:01:07', NULL, '2025-08-31 22:01:07', NULL);
INSERT INTO `sys_dict_item` VALUES (121, 'salesOrderDetail_status', '2', '备货中', 'primary', 1, 2, NULL, '2025-08-31 22:01:17', NULL, '2025-08-31 22:01:17', NULL);
INSERT INTO `sys_dict_item` VALUES (122, 'salesOrderDetail_status', '3', '已发货', 'success', 1, 3, NULL, '2025-08-31 22:01:26', NULL, '2025-08-31 22:01:26', NULL);
INSERT INTO `sys_dict_item` VALUES (123, 'salesOrderDetail_status', '4', '已收货', 'success', 1, 4, NULL, '2025-08-31 22:01:36', NULL, '2025-08-31 22:01:36', NULL);
INSERT INTO `sys_dict_item` VALUES (124, 'salesOrderDetail_status', '5', '已取消', 'danger', 1, 5, NULL, '2025-08-31 22:01:43', NULL, '2025-08-31 22:01:43', NULL);
INSERT INTO `sys_dict_item` VALUES (125, 'member_level', '0', '禁用', 'danger', 1, 0, NULL, '2025-09-30 18:11:41', NULL, '2025-09-30 18:11:41', NULL);
INSERT INTO `sys_dict_item` VALUES (126, 'member_level', '1', '启用', 'success', 1, 1, NULL, '2025-09-30 18:12:00', NULL, '2025-09-30 18:12:00', NULL);
INSERT INTO `sys_dict_item` VALUES (127, 'member_level_status', '0', '禁用', 'danger', 1, 0, NULL, '2025-09-30 18:17:08', NULL, '2025-09-30 18:17:08', NULL);
INSERT INTO `sys_dict_item` VALUES (128, 'member_level_status', '1', '启用', 'success', 1, 1, NULL, '2025-09-30 18:17:18', NULL, '2025-09-30 18:17:18', NULL);
INSERT INTO `sys_dict_item` VALUES (129, 'member_status', '0', '禁用', 'danger', 1, 0, NULL, '2025-09-30 18:18:47', NULL, '2025-09-30 18:18:47', NULL);
INSERT INTO `sys_dict_item` VALUES (130, 'member_status', '1', '正常', 'success', 1, 1, NULL, '2025-09-30 18:18:55', NULL, '2025-09-30 18:18:55', NULL);
INSERT INTO `sys_dict_item` VALUES (131, 'member_account_status', '0', '冻结', 'primary', 1, 0, NULL, '2025-09-30 18:24:22', NULL, '2025-09-30 18:24:22', NULL);
INSERT INTO `sys_dict_item` VALUES (132, 'member_account_status', '1', '正常', 'success', 1, 1, NULL, '2025-09-30 18:24:30', NULL, '2025-09-30 18:24:30', NULL);
INSERT INTO `sys_dict_item` VALUES (133, 'member_recharge_record_payment_type', '1', '微信', 'success', 1, 1, NULL, '2025-09-30 18:29:26', NULL, '2025-09-30 18:29:26', NULL);
INSERT INTO `sys_dict_item` VALUES (134, 'member_recharge_record_payment_type', '2', '支付宝', 'primary', 1, 2, NULL, '2025-09-30 18:29:49', NULL, '2025-09-30 18:29:49', NULL);
INSERT INTO `sys_dict_item` VALUES (135, 'member_recharge_record_payment_type', '3', '现金', 'info', 1, 3, NULL, '2025-09-30 18:30:14', NULL, '2025-09-30 18:30:14', NULL);
INSERT INTO `sys_dict_item` VALUES (136, 'member_recharge_record_payment_type', '4', '信用卡', 'warning', 1, 4, NULL, '2025-09-30 18:30:27', NULL, '2025-09-30 18:30:27', NULL);
INSERT INTO `sys_dict_item` VALUES (137, 'member_recharge_record_payment_type', '5', '银行', 'danger', 1, 5, NULL, '2025-09-30 18:30:48', NULL, '2025-09-30 18:30:48', NULL);
INSERT INTO `sys_dict_item` VALUES (138, 'member_recharge_record_status', '1', '待定', 'primary', 1, 1, NULL, '2025-09-30 18:31:19', NULL, '2025-09-30 18:31:19', NULL);
INSERT INTO `sys_dict_item` VALUES (139, 'member_recharge_record_status', '2', '成功', 'success', 1, 2, NULL, '2025-09-30 18:31:27', NULL, '2025-09-30 18:31:27', NULL);
INSERT INTO `sys_dict_item` VALUES (140, 'member_recharge_record_status', '3', '失败', 'danger', 1, 3, NULL, '2025-09-30 18:31:34', NULL, '2025-09-30 18:31:34', NULL);
INSERT INTO `sys_dict_item` VALUES (141, 'laundry_order_status', '0', '创建', 'primary', 1, 0, NULL, '2025-09-30 18:35:20', NULL, '2025-09-30 18:35:20', NULL);
INSERT INTO `sys_dict_item` VALUES (142, 'laundry_order_status', '1', '接收', 'success', 1, 1, NULL, '2025-09-30 18:35:28', NULL, '2025-09-30 18:35:28', NULL);
INSERT INTO `sys_dict_item` VALUES (143, 'laundry_order_status', '2', '洗衣', 'warning', 1, 2, NULL, '2025-09-30 18:35:43', NULL, '2025-09-30 18:36:10', NULL);
INSERT INTO `sys_dict_item` VALUES (144, 'laundry_order_status', '3', '干燥', 'warning', 1, 3, NULL, '2025-09-30 18:35:53', NULL, '2025-09-30 18:36:17', NULL);
INSERT INTO `sys_dict_item` VALUES (145, 'laundry_order_status', '4', '熨烫', 'danger', 1, 4, NULL, '2025-09-30 18:36:27', NULL, '2025-09-30 18:36:27', NULL);
INSERT INTO `sys_dict_item` VALUES (146, 'laundry_order_status', '5', '质量检查', 'warning', 1, 5, NULL, '2025-09-30 18:36:38', NULL, '2025-09-30 18:36:38', NULL);
INSERT INTO `sys_dict_item` VALUES (147, 'laundry_order_status', '6', '完成', 'success', 1, 6, NULL, '2025-09-30 18:36:48', NULL, '2025-09-30 18:36:48', NULL);
INSERT INTO `sys_dict_item` VALUES (148, 'laundry_order_status', '7', '运送', 'primary', 1, 7, NULL, '2025-09-30 18:36:59', NULL, '2025-09-30 18:36:59', NULL);
INSERT INTO `sys_dict_item` VALUES (149, 'laundry_order_status', '8', '取消', 'info', 1, 8, NULL, '2025-09-30 18:37:08', NULL, '2025-09-30 18:37:08', NULL);
INSERT INTO `sys_dict_item` VALUES (150, 'laundry_order_payment_status', '1', '未支付', 'info', 1, 1, NULL, '2025-09-30 18:38:16', NULL, '2025-09-30 18:38:16', NULL);
INSERT INTO `sys_dict_item` VALUES (151, 'laundry_order_payment_status', '2', '部分支付', 'warning', 1, 2, NULL, '2025-09-30 18:38:24', NULL, '2025-09-30 18:38:24', NULL);
INSERT INTO `sys_dict_item` VALUES (152, 'laundry_order_payment_status', '3', '已支付', 'success', 1, 3, NULL, '2025-09-30 18:38:42', NULL, '2025-09-30 18:38:42', NULL);
INSERT INTO `sys_dict_item` VALUES (153, 'laundry_order_payment_status', '4', '退还', 'danger', 1, 4, NULL, '2025-09-30 18:38:53', NULL, '2025-09-30 18:38:53', NULL);
INSERT INTO `sys_dict_item` VALUES (154, 'laundry_clothing_type_category', '0', '上装', 'primary', 1, 0, NULL, '2025-09-30 18:46:01', NULL, '2025-09-30 18:46:01', NULL);
INSERT INTO `sys_dict_item` VALUES (155, 'laundry_clothing_type_category', '1', '下装', 'success', 1, 1, NULL, '2025-09-30 18:46:09', NULL, '2025-09-30 18:46:25', NULL);
INSERT INTO `sys_dict_item` VALUES (156, 'laundry_clothing_type_category', '2', '外套', 'info', 1, 2, NULL, '2025-09-30 18:46:19', NULL, '2025-09-30 18:46:19', NULL);
INSERT INTO `sys_dict_item` VALUES (157, 'laundry_clothing_type_category', '3', '内衣', 'warning', 1, 3, NULL, '2025-09-30 18:46:36', NULL, '2025-09-30 18:46:36', NULL);
INSERT INTO `sys_dict_item` VALUES (158, 'laundry_clothing_type_category', '4', '配饰', 'danger', 1, 4, NULL, '2025-09-30 18:46:51', NULL, '2025-09-30 18:46:51', NULL);
INSERT INTO `sys_dict_item` VALUES (159, 'laundry_clothing_type_category', '5', '家居用品', 'warning', 1, 5, NULL, '2025-09-30 18:47:03', NULL, '2025-09-30 18:47:03', NULL);
INSERT INTO `sys_dict_item` VALUES (160, 'laundry_clothing_type_category', '6', '特殊衣物', 'danger', 1, 6, NULL, '2025-09-30 18:47:12', NULL, '2025-09-30 18:47:12', NULL);
INSERT INTO `sys_dict_item` VALUES (161, 'laundry_clothing_type_is_delicate', '0', '非精细衣物', 'success', 1, 0, NULL, '2025-09-30 18:47:58', NULL, '2025-09-30 18:47:58', NULL);
INSERT INTO `sys_dict_item` VALUES (162, 'laundry_clothing_type_is_delicate', '1', '精细衣物', 'danger', 1, 1, NULL, '2025-09-30 18:48:12', NULL, '2025-09-30 18:48:12', NULL);
INSERT INTO `sys_dict_item` VALUES (163, 'laundry_clothing_type_status', '0', '停用', 'danger', 1, 0, NULL, '2025-09-30 18:48:43', NULL, '2025-09-30 18:48:43', NULL);
INSERT INTO `sys_dict_item` VALUES (164, 'laundry_clothing_type_status', '1', '启用', 'success', 1, 1, NULL, '2025-09-30 18:48:50', NULL, '2025-09-30 18:48:50', NULL);
INSERT INTO `sys_dict_item` VALUES (165, 'laundry_order_item_process_status', '1', '待处理', 'primary', 1, 1, NULL, '2025-09-30 18:53:27', NULL, '2025-09-30 18:53:27', NULL);
INSERT INTO `sys_dict_item` VALUES (166, 'laundry_order_item_process_status', '2', '洗涤中', 'success', 1, 2, NULL, '2025-09-30 18:53:37', NULL, '2025-09-30 18:53:37', NULL);
INSERT INTO `sys_dict_item` VALUES (167, 'laundry_order_item_process_status', '3', '烘干中', 'warning', 1, 3, NULL, '2025-09-30 18:53:45', NULL, '2025-09-30 18:54:05', NULL);
INSERT INTO `sys_dict_item` VALUES (168, 'laundry_order_item_process_status', '4', '熨烫中', 'danger', 1, 4, NULL, '2025-09-30 18:54:00', NULL, '2025-09-30 18:54:00', NULL);
INSERT INTO `sys_dict_item` VALUES (169, 'laundry_order_item_process_status', '5', '质检中', 'primary', 1, 5, NULL, '2025-09-30 18:54:15', NULL, '2025-09-30 18:54:15', NULL);
INSERT INTO `sys_dict_item` VALUES (170, 'laundry_order_item_process_status', '6', '已完成', 'success', 1, 6, NULL, '2025-09-30 18:54:26', NULL, '2025-09-30 18:54:26', NULL);
INSERT INTO `sys_dict_item` VALUES (171, 'laundry_order_item_process_status', '7', '问题衣物', 'danger', 1, 7, NULL, '2025-09-30 18:54:42', NULL, '2025-09-30 18:54:42', NULL);
INSERT INTO `sys_dict_item` VALUES (172, 'laundry_process_image_image_type', '1', '收衣时', 'primary', 1, 1, NULL, '2025-09-30 18:58:23', NULL, '2025-09-30 18:58:23', NULL);
INSERT INTO `sys_dict_item` VALUES (173, 'laundry_process_image_image_type', '2', '洗涤中', 'success', 1, 2, NULL, '2025-09-30 18:58:32', NULL, '2025-09-30 18:58:32', NULL);
INSERT INTO `sys_dict_item` VALUES (174, 'laundry_process_image_image_type', '3', '烘干中', 'warning', 1, 3, NULL, '2025-09-30 18:58:42', NULL, '2025-09-30 18:58:42', NULL);
INSERT INTO `sys_dict_item` VALUES (175, 'laundry_process_image_image_type', '4', '熨烫中', 'danger', 1, 4, NULL, '2025-09-30 18:58:52', NULL, '2025-09-30 18:58:52', NULL);
INSERT INTO `sys_dict_item` VALUES (176, 'laundry_process_image_image_type', '5', '完成时', 'success', 1, 5, NULL, '2025-09-30 18:59:02', NULL, '2025-09-30 18:59:02', NULL);
INSERT INTO `sys_dict_item` VALUES (177, 'laundry_process_image_image_type', '6', '问题衣物', 'danger', 1, 6, NULL, '2025-09-30 18:59:13', NULL, '2025-09-30 18:59:13', NULL);
INSERT INTO `sys_dict_item` VALUES (178, 'laundry_process_image_image_type', '7', '质检时', 'primary', 1, 7, NULL, '2025-09-30 18:59:23', NULL, '2025-09-30 18:59:23', NULL);
INSERT INTO `sys_dict_item` VALUES (179, 'laundry_process_image_image_type', '8', '交付时', 'success', 1, 8, NULL, '2025-09-30 18:59:42', NULL, '2025-09-30 18:59:42', NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志模块',
  `request_method` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求参数(批量请求参数可能会超过text)',
  `response_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '返回参数',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志内容',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求路径',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方法名',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
  `execution_time` bigint NULL DEFAULT NULL COMMENT '执行时间(ms)',
  `browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
  `browser_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器版本',
  `os` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '终端系统',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除标识(1-已删除 0-未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1411 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'LOGIN', 'POST', 'admin 123456', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 484, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 19:40:10', 0);
INSERT INTO `sys_log` VALUES (2, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 19:42:07', 0);
INSERT INTO `sys_log` VALUES (3, 'LOGIN', 'POST', 'admin 123456', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 19:42:16', 0);
INSERT INTO `sys_log` VALUES (4, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 13, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 19:42:16', 0);
INSERT INTO `sys_log` VALUES (5, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 17, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 19:42:29', 0);
INSERT INTO `sys_log` VALUES (6, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 15, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 19:42:30', 0);
INSERT INTO `sys_log` VALUES (7, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 29, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 19:42:32', 0);
INSERT INTO `sys_log` VALUES (8, 'DEPT', 'GET', '{}', NULL, '部门列表', '/api/v1/dept', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 19:43:38', 0);
INSERT INTO `sys_log` VALUES (9, 'LOGIN', 'POST', 'admin 123456', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 19:58:03', 0);
INSERT INTO `sys_log` VALUES (10, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 19:58:03', 0);
INSERT INTO `sys_log` VALUES (11, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 19:58:19', 0);
INSERT INTO `sys_log` VALUES (12, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 19:58:20', 0);
INSERT INTO `sys_log` VALUES (13, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:02:23', 0);
INSERT INTO `sys_log` VALUES (14, 'LOGIN', 'POST', 'admin 123456', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:02:38', 0);
INSERT INTO `sys_log` VALUES (15, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:02:38', 0);
INSERT INTO `sys_log` VALUES (16, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:02:44', 0);
INSERT INTO `sys_log` VALUES (17, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:02:47', 0);
INSERT INTO `sys_log` VALUES (18, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:02:49', 0);
INSERT INTO `sys_log` VALUES (19, 'DEPT', 'GET', '{}', NULL, '部门列表', '/api/v1/dept', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:02:50', 0);
INSERT INTO `sys_log` VALUES (20, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:02:51', 0);
INSERT INTO `sys_log` VALUES (21, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:02:53', 0);
INSERT INTO `sys_log` VALUES (22, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:03:45', 0);
INSERT INTO `sys_log` VALUES (23, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:04:51', 0);
INSERT INTO `sys_log` VALUES (24, 'USER', 'POST', '{\"username\":\"aioveu\",\"nickname\":\"可我不敌可爱\",\"mobile\":\"13061656199\",\"gender\":1,\"email\":\"ambitiouschild@qq.com\",\"status\":1,\"deptId\":1,\"roleIds\":[2]}', NULL, '新增用户', '/api/v1/users', NULL, '172.18.0.1', '0', '内网IP', 406, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:05:27', 0);
INSERT INTO `sys_log` VALUES (25, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:05:27', 0);
INSERT INTO `sys_log` VALUES (26, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:05:32', 0);
INSERT INTO `sys_log` VALUES (27, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:05:37', 0);
INSERT INTO `sys_log` VALUES (28, 'LOGIN', 'POST', 'aioveu 123456', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:05:45', 0);
INSERT INTO `sys_log` VALUES (29, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:05:45', 0);
INSERT INTO `sys_log` VALUES (30, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:05:45', 0);
INSERT INTO `sys_log` VALUES (31, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:05:58', 0);
INSERT INTO `sys_log` VALUES (32, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:06:02', 0);
INSERT INTO `sys_log` VALUES (33, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:02', 0);
INSERT INTO `sys_log` VALUES (34, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:02', 0);
INSERT INTO `sys_log` VALUES (35, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:05', 0);
INSERT INTO `sys_log` VALUES (36, 'USER', 'PUT', '{\"avatar\":\"https://minio.aioveu.com/aioveu/20250831/ed8021fddd6943fd805e414323deaae9.png\"}', NULL, '个人中心修改用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 81, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:16', 0);
INSERT INTO `sys_log` VALUES (37, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:18', 0);
INSERT INTO `sys_log` VALUES (38, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:35', 0);
INSERT INTO `sys_log` VALUES (39, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:36', 0);
INSERT INTO `sys_log` VALUES (40, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:37', 0);
INSERT INTO `sys_log` VALUES (41, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:39', 0);
INSERT INTO `sys_log` VALUES (42, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:06:42', 0);
INSERT INTO `sys_log` VALUES (43, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:43', 0);
INSERT INTO `sys_log` VALUES (44, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:06:43', 0);
INSERT INTO `sys_log` VALUES (45, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:07:06', 0);
INSERT INTO `sys_log` VALUES (46, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:07:06', 0);
INSERT INTO `sys_log` VALUES (47, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:07:42', 0);
INSERT INTO `sys_log` VALUES (48, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 33, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:14:24', 0);
INSERT INTO `sys_log` VALUES (49, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 23, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:18:29', 0);
INSERT INTO `sys_log` VALUES (50, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:22:10', 0);
INSERT INTO `sys_log` VALUES (51, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 10, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:22:47', 0);
INSERT INTO `sys_log` VALUES (52, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:23:08', 0);
INSERT INTO `sys_log` VALUES (53, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:23:42', 0);
INSERT INTO `sys_log` VALUES (54, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:23:54', 0);
INSERT INTO `sys_log` VALUES (55, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:26:08', 0);
INSERT INTO `sys_log` VALUES (56, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 61, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:26:11', 0);
INSERT INTO `sys_log` VALUES (57, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:26:18', 0);
INSERT INTO `sys_log` VALUES (58, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:26:21', 0);
INSERT INTO `sys_log` VALUES (59, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 165, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:26:25', 0);
INSERT INTO `sys_log` VALUES (60, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 26, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:26:25', 0);
INSERT INTO `sys_log` VALUES (61, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:26:26', 0);
INSERT INTO `sys_log` VALUES (62, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:26:40', 0);
INSERT INTO `sys_log` VALUES (63, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:27:13', 0);
INSERT INTO `sys_log` VALUES (64, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:27:16', 0);
INSERT INTO `sys_log` VALUES (65, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:27:19', 0);
INSERT INTO `sys_log` VALUES (66, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:27:19', 0);
INSERT INTO `sys_log` VALUES (67, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:27:19', 0);
INSERT INTO `sys_log` VALUES (68, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:27:34', 0);
INSERT INTO `sys_log` VALUES (69, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:27:34', 0);
INSERT INTO `sys_log` VALUES (70, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:27:51', 0);
INSERT INTO `sys_log` VALUES (71, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:28:37', 0);
INSERT INTO `sys_log` VALUES (72, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:28:48', 0);
INSERT INTO `sys_log` VALUES (73, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:28:50', 0);
INSERT INTO `sys_log` VALUES (74, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:28:50', 0);
INSERT INTO `sys_log` VALUES (75, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 81, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:28:54', 0);
INSERT INTO `sys_log` VALUES (76, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:29:01', 0);
INSERT INTO `sys_log` VALUES (77, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:29:02', 0);
INSERT INTO `sys_log` VALUES (78, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:29:20', 0);
INSERT INTO `sys_log` VALUES (79, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:29:36', 0);
INSERT INTO `sys_log` VALUES (80, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:34:13', 0);
INSERT INTO `sys_log` VALUES (81, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:34:16', 0);
INSERT INTO `sys_log` VALUES (82, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:34:18', 0);
INSERT INTO `sys_log` VALUES (83, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:34:19', 0);
INSERT INTO `sys_log` VALUES (84, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:34:19', 0);
INSERT INTO `sys_log` VALUES (85, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:34:29', 0);
INSERT INTO `sys_log` VALUES (86, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:34:53', 0);
INSERT INTO `sys_log` VALUES (87, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:35:49', 0);
INSERT INTO `sys_log` VALUES (88, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:35:50', 0);
INSERT INTO `sys_log` VALUES (89, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:36:04', 0);
INSERT INTO `sys_log` VALUES (90, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:36:16', 0);
INSERT INTO `sys_log` VALUES (91, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:37:19', 0);
INSERT INTO `sys_log` VALUES (92, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:37:39', 0);
INSERT INTO `sys_log` VALUES (93, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:38:28', 0);
INSERT INTO `sys_log` VALUES (94, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:38:39', 0);
INSERT INTO `sys_log` VALUES (95, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:39:53', 0);
INSERT INTO `sys_log` VALUES (96, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:40:06', 0);
INSERT INTO `sys_log` VALUES (97, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:40:07', 0);
INSERT INTO `sys_log` VALUES (98, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:40:35', 0);
INSERT INTO `sys_log` VALUES (99, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:40:35', 0);
INSERT INTO `sys_log` VALUES (100, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:42:17', 0);
INSERT INTO `sys_log` VALUES (101, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:44:34', 0);
INSERT INTO `sys_log` VALUES (102, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:44:43', 0);
INSERT INTO `sys_log` VALUES (103, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:44:45', 0);
INSERT INTO `sys_log` VALUES (104, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:46:38', 0);
INSERT INTO `sys_log` VALUES (105, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:46:41', 0);
INSERT INTO `sys_log` VALUES (106, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:51:22', 0);
INSERT INTO `sys_log` VALUES (107, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:52:02', 0);
INSERT INTO `sys_log` VALUES (108, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:53:01', 0);
INSERT INTO `sys_log` VALUES (109, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:53:19', 0);
INSERT INTO `sys_log` VALUES (110, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:53:51', 0);
INSERT INTO `sys_log` VALUES (111, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:54:09', 0);
INSERT INTO `sys_log` VALUES (112, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:54:12', 0);
INSERT INTO `sys_log` VALUES (113, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:54:12', 0);
INSERT INTO `sys_log` VALUES (114, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:54:18', 0);
INSERT INTO `sys_log` VALUES (115, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-08-31 20:54:32', 0);
INSERT INTO `sys_log` VALUES (116, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:54:35', 0);
INSERT INTO `sys_log` VALUES (117, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:54:35', 0);
INSERT INTO `sys_log` VALUES (118, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:54:36', 0);
INSERT INTO `sys_log` VALUES (119, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:54:53', 0);
INSERT INTO `sys_log` VALUES (120, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:56:41', 0);
INSERT INTO `sys_log` VALUES (121, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:57:00', 0);
INSERT INTO `sys_log` VALUES (122, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:57:10', 0);
INSERT INTO `sys_log` VALUES (123, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:57:20', 0);
INSERT INTO `sys_log` VALUES (124, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:57:23', 0);
INSERT INTO `sys_log` VALUES (125, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:57:26', 0);
INSERT INTO `sys_log` VALUES (126, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:57:32', 0);
INSERT INTO `sys_log` VALUES (127, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:57:34', 0);
INSERT INTO `sys_log` VALUES (128, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 50, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:57:37', 0);
INSERT INTO `sys_log` VALUES (129, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:57:37', 0);
INSERT INTO `sys_log` VALUES (130, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:57:38', 0);
INSERT INTO `sys_log` VALUES (131, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:58:08', 0);
INSERT INTO `sys_log` VALUES (132, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:58:10', 0);
INSERT INTO `sys_log` VALUES (133, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:58:34', 0);
INSERT INTO `sys_log` VALUES (134, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:58:47', 0);
INSERT INTO `sys_log` VALUES (135, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:58:57', 0);
INSERT INTO `sys_log` VALUES (136, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 20:59:06', 0);
INSERT INTO `sys_log` VALUES (137, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:59:06', 0);
INSERT INTO `sys_log` VALUES (138, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:59:30', 0);
INSERT INTO `sys_log` VALUES (139, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:59:43', 0);
INSERT INTO `sys_log` VALUES (140, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 20:59:52', 0);
INSERT INTO `sys_log` VALUES (141, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:00:06', 0);
INSERT INTO `sys_log` VALUES (142, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:00:12', 0);
INSERT INTO `sys_log` VALUES (143, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:00:18', 0);
INSERT INTO `sys_log` VALUES (144, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:00:24', 0);
INSERT INTO `sys_log` VALUES (145, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:00:30', 0);
INSERT INTO `sys_log` VALUES (146, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:00:44', 0);
INSERT INTO `sys_log` VALUES (147, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:00:46', 0);
INSERT INTO `sys_log` VALUES (148, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:00:54', 0);
INSERT INTO `sys_log` VALUES (149, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:00:57', 0);
INSERT INTO `sys_log` VALUES (150, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 21:01:00', 0);
INSERT INTO `sys_log` VALUES (151, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:01:00', 0);
INSERT INTO `sys_log` VALUES (152, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:01:00', 0);
INSERT INTO `sys_log` VALUES (153, 'DEPT', 'GET', '{}', NULL, '部门列表', '/api/v1/dept', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:27:47', 0);
INSERT INTO `sys_log` VALUES (154, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:27:48', 0);
INSERT INTO `sys_log` VALUES (155, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:28:43', 0);
INSERT INTO `sys_log` VALUES (156, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:30:10', 0);
INSERT INTO `sys_log` VALUES (157, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:31:41', 0);
INSERT INTO `sys_log` VALUES (158, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:34:28', 0);
INSERT INTO `sys_log` VALUES (159, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:36:02', 0);
INSERT INTO `sys_log` VALUES (160, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:38:06', 0);
INSERT INTO `sys_log` VALUES (161, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:39:01', 0);
INSERT INTO `sys_log` VALUES (162, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:39:43', 0);
INSERT INTO `sys_log` VALUES (163, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:41:46', 0);
INSERT INTO `sys_log` VALUES (164, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:42:50', 0);
INSERT INTO `sys_log` VALUES (165, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:43:46', 0);
INSERT INTO `sys_log` VALUES (166, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:45:20', 0);
INSERT INTO `sys_log` VALUES (167, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:46:13', 0);
INSERT INTO `sys_log` VALUES (168, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:47:19', 0);
INSERT INTO `sys_log` VALUES (169, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:48:31', 0);
INSERT INTO `sys_log` VALUES (170, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:49:24', 0);
INSERT INTO `sys_log` VALUES (171, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:50:27', 0);
INSERT INTO `sys_log` VALUES (172, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:51:03', 0);
INSERT INTO `sys_log` VALUES (173, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:53:55', 0);
INSERT INTO `sys_log` VALUES (174, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:54:47', 0);
INSERT INTO `sys_log` VALUES (175, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:55:53', 0);
INSERT INTO `sys_log` VALUES (176, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:56:43', 0);
INSERT INTO `sys_log` VALUES (177, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:57:54', 0);
INSERT INTO `sys_log` VALUES (178, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 21:58:35', 0);
INSERT INTO `sys_log` VALUES (179, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:00:01', 0);
INSERT INTO `sys_log` VALUES (180, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:00:57', 0);
INSERT INTO `sys_log` VALUES (181, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:05:24', 0);
INSERT INTO `sys_log` VALUES (182, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:05:56', 0);
INSERT INTO `sys_log` VALUES (183, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:06:15', 0);
INSERT INTO `sys_log` VALUES (184, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:06:27', 0);
INSERT INTO `sys_log` VALUES (185, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:06:37', 0);
INSERT INTO `sys_log` VALUES (186, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:06:48', 0);
INSERT INTO `sys_log` VALUES (187, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:07:03', 0);
INSERT INTO `sys_log` VALUES (188, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:07:14', 0);
INSERT INTO `sys_log` VALUES (189, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:07:25', 0);
INSERT INTO `sys_log` VALUES (190, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:07:38', 0);
INSERT INTO `sys_log` VALUES (191, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:07:52', 0);
INSERT INTO `sys_log` VALUES (192, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:08:04', 0);
INSERT INTO `sys_log` VALUES (193, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:08:19', 0);
INSERT INTO `sys_log` VALUES (194, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:08:29', 0);
INSERT INTO `sys_log` VALUES (195, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:08:42', 0);
INSERT INTO `sys_log` VALUES (196, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:08:52', 0);
INSERT INTO `sys_log` VALUES (197, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:09:26', 0);
INSERT INTO `sys_log` VALUES (198, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:09:43', 0);
INSERT INTO `sys_log` VALUES (199, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:09:52', 0);
INSERT INTO `sys_log` VALUES (200, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:10:03', 0);
INSERT INTO `sys_log` VALUES (201, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:10:14', 0);
INSERT INTO `sys_log` VALUES (202, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:10:16', 0);
INSERT INTO `sys_log` VALUES (203, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 22:10:19', 0);
INSERT INTO `sys_log` VALUES (204, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:10:19', 0);
INSERT INTO `sys_log` VALUES (205, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:10:20', 0);
INSERT INTO `sys_log` VALUES (206, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:29:05', 0);
INSERT INTO `sys_log` VALUES (207, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 22:29:10', 0);
INSERT INTO `sys_log` VALUES (208, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:29:10', 0);
INSERT INTO `sys_log` VALUES (209, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 8, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:57:23', 0);
INSERT INTO `sys_log` VALUES (210, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:58:34', 0);
INSERT INTO `sys_log` VALUES (211, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:58:59', 0);
INSERT INTO `sys_log` VALUES (212, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:59:18', 0);
INSERT INTO `sys_log` VALUES (213, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:59:37', 0);
INSERT INTO `sys_log` VALUES (214, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 22:59:53', 0);
INSERT INTO `sys_log` VALUES (215, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:00:12', 0);
INSERT INTO `sys_log` VALUES (216, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:00:30', 0);
INSERT INTO `sys_log` VALUES (217, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:00:46', 0);
INSERT INTO `sys_log` VALUES (218, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:01:01', 0);
INSERT INTO `sys_log` VALUES (219, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:01:26', 0);
INSERT INTO `sys_log` VALUES (220, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:01:39', 0);
INSERT INTO `sys_log` VALUES (221, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:01:55', 0);
INSERT INTO `sys_log` VALUES (222, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:02:06', 0);
INSERT INTO `sys_log` VALUES (223, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:02:20', 0);
INSERT INTO `sys_log` VALUES (224, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:02:34', 0);
INSERT INTO `sys_log` VALUES (225, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:02:47', 0);
INSERT INTO `sys_log` VALUES (226, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:02:58', 0);
INSERT INTO `sys_log` VALUES (227, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:03:08', 0);
INSERT INTO `sys_log` VALUES (228, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:03:19', 0);
INSERT INTO `sys_log` VALUES (229, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:03:33', 0);
INSERT INTO `sys_log` VALUES (230, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:04:13', 0);
INSERT INTO `sys_log` VALUES (231, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:05:06', 0);
INSERT INTO `sys_log` VALUES (232, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:05:16', 0);
INSERT INTO `sys_log` VALUES (233, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:05:24', 0);
INSERT INTO `sys_log` VALUES (234, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:05:33', 0);
INSERT INTO `sys_log` VALUES (235, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:05:45', 0);
INSERT INTO `sys_log` VALUES (236, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:06:01', 0);
INSERT INTO `sys_log` VALUES (237, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:06:12', 0);
INSERT INTO `sys_log` VALUES (238, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:06:26', 0);
INSERT INTO `sys_log` VALUES (239, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:06:40', 0);
INSERT INTO `sys_log` VALUES (240, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:06:50', 0);
INSERT INTO `sys_log` VALUES (241, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:07:00', 0);
INSERT INTO `sys_log` VALUES (242, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:07:09', 0);
INSERT INTO `sys_log` VALUES (243, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:07:24', 0);
INSERT INTO `sys_log` VALUES (244, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 20, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:07:35', 0);
INSERT INTO `sys_log` VALUES (245, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:07:46', 0);
INSERT INTO `sys_log` VALUES (246, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:07:57', 0);
INSERT INTO `sys_log` VALUES (247, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:08:07', 0);
INSERT INTO `sys_log` VALUES (248, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:08:18', 0);
INSERT INTO `sys_log` VALUES (249, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:08:27', 0);
INSERT INTO `sys_log` VALUES (250, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:08:37', 0);
INSERT INTO `sys_log` VALUES (251, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:08:49', 0);
INSERT INTO `sys_log` VALUES (252, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:09:00', 0);
INSERT INTO `sys_log` VALUES (253, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:09:10', 0);
INSERT INTO `sys_log` VALUES (254, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:09:22', 0);
INSERT INTO `sys_log` VALUES (255, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:10:31', 0);
INSERT INTO `sys_log` VALUES (256, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:10:41', 0);
INSERT INTO `sys_log` VALUES (257, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:11:01', 0);
INSERT INTO `sys_log` VALUES (258, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:11:18', 0);
INSERT INTO `sys_log` VALUES (259, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:11:35', 0);
INSERT INTO `sys_log` VALUES (260, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:11:55', 0);
INSERT INTO `sys_log` VALUES (261, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:12:11', 0);
INSERT INTO `sys_log` VALUES (262, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:12:29', 0);
INSERT INTO `sys_log` VALUES (263, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:12:43', 0);
INSERT INTO `sys_log` VALUES (264, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:12:53', 0);
INSERT INTO `sys_log` VALUES (265, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:13:04', 0);
INSERT INTO `sys_log` VALUES (266, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:13:15', 0);
INSERT INTO `sys_log` VALUES (267, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:13:24', 0);
INSERT INTO `sys_log` VALUES (268, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:13:35', 0);
INSERT INTO `sys_log` VALUES (269, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:13:48', 0);
INSERT INTO `sys_log` VALUES (270, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:13:57', 0);
INSERT INTO `sys_log` VALUES (271, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:14:07', 0);
INSERT INTO `sys_log` VALUES (272, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:14:17', 0);
INSERT INTO `sys_log` VALUES (273, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:14:34', 0);
INSERT INTO `sys_log` VALUES (274, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:14:44', 0);
INSERT INTO `sys_log` VALUES (275, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:14:53', 0);
INSERT INTO `sys_log` VALUES (276, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:15:01', 0);
INSERT INTO `sys_log` VALUES (277, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:15:11', 0);
INSERT INTO `sys_log` VALUES (278, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:15:27', 0);
INSERT INTO `sys_log` VALUES (279, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 9, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:15:37', 0);
INSERT INTO `sys_log` VALUES (280, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:15:47', 0);
INSERT INTO `sys_log` VALUES (281, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:15:58', 0);
INSERT INTO `sys_log` VALUES (282, 'DEPT', 'GET', '{}', NULL, '部门列表', '/api/v1/dept', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:16:02', 0);
INSERT INTO `sys_log` VALUES (283, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:16:19', 0);
INSERT INTO `sys_log` VALUES (284, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:16:21', 0);
INSERT INTO `sys_log` VALUES (285, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 23:16:24', 0);
INSERT INTO `sys_log` VALUES (286, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:16:25', 0);
INSERT INTO `sys_log` VALUES (287, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:16:25', 0);
INSERT INTO `sys_log` VALUES (288, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:18:01', 0);
INSERT INTO `sys_log` VALUES (289, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 16, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:19:21', 0);
INSERT INTO `sys_log` VALUES (290, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:20:16', 0);
INSERT INTO `sys_log` VALUES (291, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:20:22', 0);
INSERT INTO `sys_log` VALUES (292, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:20:28', 0);
INSERT INTO `sys_log` VALUES (293, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:20:34', 0);
INSERT INTO `sys_log` VALUES (294, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:20:49', 0);
INSERT INTO `sys_log` VALUES (295, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:21:11', 0);
INSERT INTO `sys_log` VALUES (296, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:22:16', 0);
INSERT INTO `sys_log` VALUES (297, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 23:22:19', 0);
INSERT INTO `sys_log` VALUES (298, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:22:19', 0);
INSERT INTO `sys_log` VALUES (299, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 23:22:19', 0);
INSERT INTO `sys_log` VALUES (300, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:22:19', 0);
INSERT INTO `sys_log` VALUES (301, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:23:59', 0);
INSERT INTO `sys_log` VALUES (302, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:24:09', 0);
INSERT INTO `sys_log` VALUES (303, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:24:17', 0);
INSERT INTO `sys_log` VALUES (304, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:24:22', 0);
INSERT INTO `sys_log` VALUES (305, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:24:26', 0);
INSERT INTO `sys_log` VALUES (306, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:24:30', 0);
INSERT INTO `sys_log` VALUES (307, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:25:22', 0);
INSERT INTO `sys_log` VALUES (308, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:25:35', 0);
INSERT INTO `sys_log` VALUES (309, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 23:25:39', 0);
INSERT INTO `sys_log` VALUES (310, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:25:39', 0);
INSERT INTO `sys_log` VALUES (311, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:26:36', 0);
INSERT INTO `sys_log` VALUES (312, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:26:53', 0);
INSERT INTO `sys_log` VALUES (313, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:26:55', 0);
INSERT INTO `sys_log` VALUES (314, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:27:03', 0);
INSERT INTO `sys_log` VALUES (315, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 50, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-08-31 23:27:05', 0);
INSERT INTO `sys_log` VALUES (316, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:27:06', 0);
INSERT INTO `sys_log` VALUES (317, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-08-31 23:28:44', 0);
INSERT INTO `sys_log` VALUES (318, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 01:34:41', 0);
INSERT INTO `sys_log` VALUES (319, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:34:41', 0);
INSERT INTO `sys_log` VALUES (320, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 9, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:35:08', 0);
INSERT INTO `sys_log` VALUES (321, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 9, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:36:27', 0);
INSERT INTO `sys_log` VALUES (322, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:36:42', 0);
INSERT INTO `sys_log` VALUES (323, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:37:13', 0);
INSERT INTO `sys_log` VALUES (324, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:37:23', 0);
INSERT INTO `sys_log` VALUES (325, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:37:28', 0);
INSERT INTO `sys_log` VALUES (326, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:38:04', 0);
INSERT INTO `sys_log` VALUES (327, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 01:38:06', 0);
INSERT INTO `sys_log` VALUES (328, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:38:06', 0);
INSERT INTO `sys_log` VALUES (329, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:38:06', 0);
INSERT INTO `sys_log` VALUES (330, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:38:27', 0);
INSERT INTO `sys_log` VALUES (331, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:38:41', 0);
INSERT INTO `sys_log` VALUES (332, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:38:46', 0);
INSERT INTO `sys_log` VALUES (333, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:38:55', 0);
INSERT INTO `sys_log` VALUES (334, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:39:01', 0);
INSERT INTO `sys_log` VALUES (335, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:39:06', 0);
INSERT INTO `sys_log` VALUES (336, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:39:17', 0);
INSERT INTO `sys_log` VALUES (337, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 50, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 01:39:20', 0);
INSERT INTO `sys_log` VALUES (338, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:39:20', 0);
INSERT INTO `sys_log` VALUES (339, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '172.18.0.1', '0', '内网IP', 18, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:39:54', 0);
INSERT INTO `sys_log` VALUES (340, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:40:09', 0);
INSERT INTO `sys_log` VALUES (341, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 01:40:15', 0);
INSERT INTO `sys_log` VALUES (342, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:40:15', 0);
INSERT INTO `sys_log` VALUES (343, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '172.18.0.1', '0', '内网IP', 7, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:40:18', 0);
INSERT INTO `sys_log` VALUES (344, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:40:26', 0);
INSERT INTO `sys_log` VALUES (345, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:41:03', 0);
INSERT INTO `sys_log` VALUES (346, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 50, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 01:41:06', 0);
INSERT INTO `sys_log` VALUES (347, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:41:06', 0);
INSERT INTO `sys_log` VALUES (348, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:41:23', 0);
INSERT INTO `sys_log` VALUES (349, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:41:44', 0);
INSERT INTO `sys_log` VALUES (350, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:42:00', 0);
INSERT INTO `sys_log` VALUES (351, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:42:05', 0);
INSERT INTO `sys_log` VALUES (352, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:42:10', 0);
INSERT INTO `sys_log` VALUES (353, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:42:19', 0);
INSERT INTO `sys_log` VALUES (354, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 50, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 01:42:25', 0);
INSERT INTO `sys_log` VALUES (355, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:42:25', 0);
INSERT INTO `sys_log` VALUES (356, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:42:58', 0);
INSERT INTO `sys_log` VALUES (357, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 01:43:02', 0);
INSERT INTO `sys_log` VALUES (358, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:43:02', 0);
INSERT INTO `sys_log` VALUES (359, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:44:27', 0);
INSERT INTO `sys_log` VALUES (360, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:45:08', 0);
INSERT INTO `sys_log` VALUES (361, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:45:34', 0);
INSERT INTO `sys_log` VALUES (362, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:45:54', 0);
INSERT INTO `sys_log` VALUES (363, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:46:01', 0);
INSERT INTO `sys_log` VALUES (364, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:46:07', 0);
INSERT INTO `sys_log` VALUES (365, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:46:14', 0);
INSERT INTO `sys_log` VALUES (366, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 49, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 01:46:17', 0);
INSERT INTO `sys_log` VALUES (367, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:46:17', 0);
INSERT INTO `sys_log` VALUES (368, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:46:41', 0);
INSERT INTO `sys_log` VALUES (369, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:46:53', 0);
INSERT INTO `sys_log` VALUES (370, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:46:58', 0);
INSERT INTO `sys_log` VALUES (371, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:47:02', 0);
INSERT INTO `sys_log` VALUES (372, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:47:06', 0);
INSERT INTO `sys_log` VALUES (373, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 50, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 01:47:09', 0);
INSERT INTO `sys_log` VALUES (374, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:47:09', 0);
INSERT INTO `sys_log` VALUES (375, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:47:09', 0);
INSERT INTO `sys_log` VALUES (376, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:47:57', 0);
INSERT INTO `sys_log` VALUES (377, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:48:00', 0);
INSERT INTO `sys_log` VALUES (378, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 50, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 01:48:03', 0);
INSERT INTO `sys_log` VALUES (379, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:48:03', 0);
INSERT INTO `sys_log` VALUES (380, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 01:48:03', 0);
INSERT INTO `sys_log` VALUES (381, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 379, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 21:37:55', 0);
INSERT INTO `sys_log` VALUES (382, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 12, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 21:37:55', 0);
INSERT INTO `sys_log` VALUES (383, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 610, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-01 23:35:12', 0);
INSERT INTO `sys_log` VALUES (384, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 151, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-01 23:35:12', 0);
INSERT INTO `sys_log` VALUES (385, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 837, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-02 14:02:46', 0);
INSERT INTO `sys_log` VALUES (386, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 64, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 14:02:46', 0);
INSERT INTO `sys_log` VALUES (387, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 136, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:19:09', 0);
INSERT INTO `sys_log` VALUES (388, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:19:22', 0);
INSERT INTO `sys_log` VALUES (389, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 141, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:19:24', 0);
INSERT INTO `sys_log` VALUES (390, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:19:31', 0);
INSERT INTO `sys_log` VALUES (391, 'LOGIN', 'POST', 'test 123456', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-02 15:19:39', 0);
INSERT INTO `sys_log` VALUES (392, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 3, '2025-09-02 15:19:39', 0);
INSERT INTO `sys_log` VALUES (393, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 3, '2025-09-02 15:22:36', 0);
INSERT INTO `sys_log` VALUES (394, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-02 15:22:40', 0);
INSERT INTO `sys_log` VALUES (395, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:22:40', 0);
INSERT INTO `sys_log` VALUES (396, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:22:44', 0);
INSERT INTO `sys_log` VALUES (397, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:22:45', 0);
INSERT INTO `sys_log` VALUES (398, 'USER', 'GET', '{}', NULL, '用户表单数据', '/api/v1/users/3/form', NULL, '172.18.0.1', '0', '内网IP', 26, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:22:51', 0);
INSERT INTO `sys_log` VALUES (399, 'USER', 'GET', '{}', NULL, '用户表单数据', '/api/v1/users/3/form', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:23:42', 0);
INSERT INTO `sys_log` VALUES (400, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:24:00', 0);
INSERT INTO `sys_log` VALUES (401, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:24:19', 0);
INSERT INTO `sys_log` VALUES (402, 'USER', 'POST', '{\"username\":\"admin1\",\"nickname\":\"系统管理员1\",\"gender\":1,\"avatar\":\"https://minio.aioveu.com/aioveu/20250810/352485413d814dee87d9b7160dfe916e.png\",\"status\":1,\"deptId\":2,\"roleIds\":[4]}', NULL, '新增用户', '/api/v1/users', NULL, '172.18.0.1', '0', '内网IP', 350, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:25:09', 0);
INSERT INTO `sys_log` VALUES (403, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:25:10', 0);
INSERT INTO `sys_log` VALUES (404, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:25:22', 0);
INSERT INTO `sys_log` VALUES (405, 'LOGIN', 'POST', 'admin1 123456', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-02 15:25:30', 0);
INSERT INTO `sys_log` VALUES (406, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 5, '2025-09-02 15:25:30', 0);
INSERT INTO `sys_log` VALUES (407, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 5, '2025-09-02 15:25:44', 0);
INSERT INTO `sys_log` VALUES (408, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 50, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-02 15:25:49', 0);
INSERT INTO `sys_log` VALUES (409, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:25:49', 0);
INSERT INTO `sys_log` VALUES (410, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 8, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:25:51', 0);
INSERT INTO `sys_log` VALUES (411, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:25:54', 0);
INSERT INTO `sys_log` VALUES (412, 'DEPT', 'GET', '{}', NULL, '部门列表', '/api/v1/dept', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 15:27:25', 0);
INSERT INTO `sys_log` VALUES (413, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 20:07:16', 0);
INSERT INTO `sys_log` VALUES (414, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-02 20:07:21', 0);
INSERT INTO `sys_log` VALUES (415, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 20:07:21', 0);
INSERT INTO `sys_log` VALUES (416, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 20:07:25', 0);
INSERT INTO `sys_log` VALUES (417, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 50, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-02 20:07:56', 0);
INSERT INTO `sys_log` VALUES (418, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 20:07:56', 0);
INSERT INTO `sys_log` VALUES (419, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 20:36:15', 0);
INSERT INTO `sys_log` VALUES (420, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 50, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-02 20:36:18', 0);
INSERT INTO `sys_log` VALUES (421, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-02 20:36:18', 0);
INSERT INTO `sys_log` VALUES (422, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-03 12:27:22', 0);
INSERT INTO `sys_log` VALUES (423, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 8889, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-03 12:27:22', 0);
INSERT INTO `sys_log` VALUES (424, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 381, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-03 12:27:24', 0);
INSERT INTO `sys_log` VALUES (425, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-03 12:31:38', 0);
INSERT INTO `sys_log` VALUES (426, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-03 12:31:38', 0);
INSERT INTO `sys_log` VALUES (427, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-03 12:31:45', 0);
INSERT INTO `sys_log` VALUES (428, 'LOGIN', 'POST', 'aioveu aioveu1', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 97, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-03 12:31:49', 0);
INSERT INTO `sys_log` VALUES (429, 'LOGIN', 'POST', 'aioveu aioveu1', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-03 12:35:32', 0);
INSERT INTO `sys_log` VALUES (430, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-03 12:35:40', 0);
INSERT INTO `sys_log` VALUES (431, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-03 12:35:40', 0);
INSERT INTO `sys_log` VALUES (432, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 552, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-04 18:06:00', 0);
INSERT INTO `sys_log` VALUES (433, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 37, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-04 18:06:01', 0);
INSERT INTO `sys_log` VALUES (434, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 516, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-05 15:56:02', 0);
INSERT INTO `sys_log` VALUES (435, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 16, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-05 15:56:02', 0);
INSERT INTO `sys_log` VALUES (436, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 616, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-05 23:24:07', 0);
INSERT INTO `sys_log` VALUES (437, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 65, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-05 23:24:07', 0);
INSERT INTO `sys_log` VALUES (438, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 288, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-06 00:18:38', 0);
INSERT INTO `sys_log` VALUES (439, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 13, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-06 00:18:38', 0);
INSERT INTO `sys_log` VALUES (440, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-06 00:27:58', 0);
INSERT INTO `sys_log` VALUES (441, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-06 00:27:58', 0);
INSERT INTO `sys_log` VALUES (442, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 276, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-06 00:36:46', 0);
INSERT INTO `sys_log` VALUES (443, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 12, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-06 00:36:46', 0);
INSERT INTO `sys_log` VALUES (444, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 795, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-06 00:47:51', 0);
INSERT INTO `sys_log` VALUES (445, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 75, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-06 00:47:51', 0);
INSERT INTO `sys_log` VALUES (446, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 446, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-06 00:59:17', 0);
INSERT INTO `sys_log` VALUES (447, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 14, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-06 00:59:17', 0);
INSERT INTO `sys_log` VALUES (448, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 113, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-06 01:39:55', 0);
INSERT INTO `sys_log` VALUES (449, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-06 01:39:55', 0);
INSERT INTO `sys_log` VALUES (450, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 336, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-06 17:35:24', 0);
INSERT INTO `sys_log` VALUES (451, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 13, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-06 17:35:24', 0);
INSERT INTO `sys_log` VALUES (452, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 31, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-09-07 17:03:44', 0);
INSERT INTO `sys_log` VALUES (453, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 229, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-07 17:03:57', 0);
INSERT INTO `sys_log` VALUES (454, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 65, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-07 17:03:57', 0);
INSERT INTO `sys_log` VALUES (455, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-07 17:06:16', 0);
INSERT INTO `sys_log` VALUES (456, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 17:06:16', 0);
INSERT INTO `sys_log` VALUES (457, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 126, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 17:25:01', 0);
INSERT INTO `sys_log` VALUES (458, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 7, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 17:28:47', 0);
INSERT INTO `sys_log` VALUES (459, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 7, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 17:28:51', 0);
INSERT INTO `sys_log` VALUES (460, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 9, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:09:08', 0);
INSERT INTO `sys_log` VALUES (461, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:25:04', 0);
INSERT INTO `sys_log` VALUES (462, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:25:14', 0);
INSERT INTO `sys_log` VALUES (463, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:25:14', 0);
INSERT INTO `sys_log` VALUES (464, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:25:19', 0);
INSERT INTO `sys_log` VALUES (465, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 7, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:25:22', 0);
INSERT INTO `sys_log` VALUES (466, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:25:24', 0);
INSERT INTO `sys_log` VALUES (467, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 8, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:25:47', 0);
INSERT INTO `sys_log` VALUES (468, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:26:19', 0);
INSERT INTO `sys_log` VALUES (469, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 8, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:38:47', 0);
INSERT INTO `sys_log` VALUES (470, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:38:53', 0);
INSERT INTO `sys_log` VALUES (471, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:49:53', 0);
INSERT INTO `sys_log` VALUES (472, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:49:56', 0);
INSERT INTO `sys_log` VALUES (473, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 9, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:49:58', 0);
INSERT INTO `sys_log` VALUES (474, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 7, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:50:00', 0);
INSERT INTO `sys_log` VALUES (475, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 8, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:50:04', 0);
INSERT INTO `sys_log` VALUES (476, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:50:07', 0);
INSERT INTO `sys_log` VALUES (477, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 8, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 18:50:10', 0);
INSERT INTO `sys_log` VALUES (478, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 19:04:41', 0);
INSERT INTO `sys_log` VALUES (479, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 62, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-07 21:53:39', 0);
INSERT INTO `sys_log` VALUES (480, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 21:53:39', 0);
INSERT INTO `sys_log` VALUES (481, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 21:53:55', 0);
INSERT INTO `sys_log` VALUES (482, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 21:53:58', 0);
INSERT INTO `sys_log` VALUES (483, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 22:06:24', 0);
INSERT INTO `sys_log` VALUES (484, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 22:06:34', 0);
INSERT INTO `sys_log` VALUES (485, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 60, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-07 23:22:42', 0);
INSERT INTO `sys_log` VALUES (486, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:22:42', 0);
INSERT INTO `sys_log` VALUES (487, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:24:58', 0);
INSERT INTO `sys_log` VALUES (488, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:27:39', 0);
INSERT INTO `sys_log` VALUES (489, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:27:42', 0);
INSERT INTO `sys_log` VALUES (490, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:27:46', 0);
INSERT INTO `sys_log` VALUES (491, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:27:48', 0);
INSERT INTO `sys_log` VALUES (492, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:27:52', 0);
INSERT INTO `sys_log` VALUES (493, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:28:01', 0);
INSERT INTO `sys_log` VALUES (494, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:28:05', 0);
INSERT INTO `sys_log` VALUES (495, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:28:09', 0);
INSERT INTO `sys_log` VALUES (496, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:28:13', 0);
INSERT INTO `sys_log` VALUES (497, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:28:16', 0);
INSERT INTO `sys_log` VALUES (498, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:28:19', 0);
INSERT INTO `sys_log` VALUES (499, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:28:23', 0);
INSERT INTO `sys_log` VALUES (500, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:28:26', 0);
INSERT INTO `sys_log` VALUES (501, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-07 23:36:49', 0);
INSERT INTO `sys_log` VALUES (502, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:36:49', 0);
INSERT INTO `sys_log` VALUES (503, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:36:58', 0);
INSERT INTO `sys_log` VALUES (504, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:36:59', 0);
INSERT INTO `sys_log` VALUES (505, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:37:06', 0);
INSERT INTO `sys_log` VALUES (506, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-07 23:37:08', 0);
INSERT INTO `sys_log` VALUES (507, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 00:26:54', 0);
INSERT INTO `sys_log` VALUES (508, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:26:54', 0);
INSERT INTO `sys_log` VALUES (509, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:27:00', 0);
INSERT INTO `sys_log` VALUES (510, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:27:13', 0);
INSERT INTO `sys_log` VALUES (511, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:27:20', 0);
INSERT INTO `sys_log` VALUES (512, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:27:24', 0);
INSERT INTO `sys_log` VALUES (513, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:27:24', 0);
INSERT INTO `sys_log` VALUES (514, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:27:33', 0);
INSERT INTO `sys_log` VALUES (515, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:27:33', 0);
INSERT INTO `sys_log` VALUES (516, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 8, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:27:49', 0);
INSERT INTO `sys_log` VALUES (517, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:28:32', 0);
INSERT INTO `sys_log` VALUES (518, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 00:28:34', 0);
INSERT INTO `sys_log` VALUES (519, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 60, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 01:07:36', 0);
INSERT INTO `sys_log` VALUES (520, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 01:07:36', 0);
INSERT INTO `sys_log` VALUES (521, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 343, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-08 13:43:31', 0);
INSERT INTO `sys_log` VALUES (522, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 75, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 13:43:32', 0);
INSERT INTO `sys_log` VALUES (523, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 158, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 13:45:34', 0);
INSERT INTO `sys_log` VALUES (524, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 10, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 13:45:39', 0);
INSERT INTO `sys_log` VALUES (525, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 43, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 13:45:47', 0);
INSERT INTO `sys_log` VALUES (526, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 13:45:47', 0);
INSERT INTO `sys_log` VALUES (527, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 14:06:12', 0);
INSERT INTO `sys_log` VALUES (528, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 6, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 14:06:12', 0);
INSERT INTO `sys_log` VALUES (529, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 6, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:06:39', 0);
INSERT INTO `sys_log` VALUES (530, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:10:09', 0);
INSERT INTO `sys_log` VALUES (531, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:10:42', 0);
INSERT INTO `sys_log` VALUES (532, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:11:09', 0);
INSERT INTO `sys_log` VALUES (533, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:11:59', 0);
INSERT INTO `sys_log` VALUES (534, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:12:08', 0);
INSERT INTO `sys_log` VALUES (535, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:12:15', 0);
INSERT INTO `sys_log` VALUES (536, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:12:25', 0);
INSERT INTO `sys_log` VALUES (537, 'LOGIN', 'POST', 'admin 123456', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-08 15:12:48', 0);
INSERT INTO `sys_log` VALUES (538, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-09-08 15:13:23', 0);
INSERT INTO `sys_log` VALUES (539, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:13:51', 0);
INSERT INTO `sys_log` VALUES (540, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:31:11', 0);
INSERT INTO `sys_log` VALUES (541, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:36:02', 0);
INSERT INTO `sys_log` VALUES (542, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:36:13', 0);
INSERT INTO `sys_log` VALUES (543, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:37:14', 0);
INSERT INTO `sys_log` VALUES (544, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:38:08', 0);
INSERT INTO `sys_log` VALUES (545, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:38:13', 0);
INSERT INTO `sys_log` VALUES (546, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-08 15:48:33', 0);
INSERT INTO `sys_log` VALUES (547, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:48:33', 0);
INSERT INTO `sys_log` VALUES (548, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 15:51:24', 0);
INSERT INTO `sys_log` VALUES (549, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 15:51:50', 0);
INSERT INTO `sys_log` VALUES (550, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:53:15', 0);
INSERT INTO `sys_log` VALUES (551, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:53:16', 0);
INSERT INTO `sys_log` VALUES (552, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 15:54:01', 0);
INSERT INTO `sys_log` VALUES (553, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 15:54:21', 0);
INSERT INTO `sys_log` VALUES (554, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 15:54:21', 0);
INSERT INTO `sys_log` VALUES (555, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 15:55:07', 0);
INSERT INTO `sys_log` VALUES (556, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 15:58:42', 0);
INSERT INTO `sys_log` VALUES (557, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:02:46', 0);
INSERT INTO `sys_log` VALUES (558, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:04:20', 0);
INSERT INTO `sys_log` VALUES (559, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 7, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:04:25', 0);
INSERT INTO `sys_log` VALUES (560, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:04:48', 0);
INSERT INTO `sys_log` VALUES (561, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:04:50', 0);
INSERT INTO `sys_log` VALUES (562, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:05:50', 0);
INSERT INTO `sys_log` VALUES (563, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:07:20', 0);
INSERT INTO `sys_log` VALUES (564, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 16:07:54', 0);
INSERT INTO `sys_log` VALUES (565, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:07:54', 0);
INSERT INTO `sys_log` VALUES (566, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:07:59', 0);
INSERT INTO `sys_log` VALUES (567, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:08:02', 0);
INSERT INTO `sys_log` VALUES (568, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:08:17', 0);
INSERT INTO `sys_log` VALUES (569, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:08:17', 0);
INSERT INTO `sys_log` VALUES (570, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:21:59', 0);
INSERT INTO `sys_log` VALUES (571, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:22:05', 0);
INSERT INTO `sys_log` VALUES (572, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 16:24:52', 0);
INSERT INTO `sys_log` VALUES (573, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:24:52', 0);
INSERT INTO `sys_log` VALUES (574, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:34:09', 0);
INSERT INTO `sys_log` VALUES (575, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:40:34', 0);
INSERT INTO `sys_log` VALUES (576, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:41:25', 0);
INSERT INTO `sys_log` VALUES (577, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:43:44', 0);
INSERT INTO `sys_log` VALUES (578, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:46:12', 0);
INSERT INTO `sys_log` VALUES (579, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:46:18', 0);
INSERT INTO `sys_log` VALUES (580, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:48:26', 0);
INSERT INTO `sys_log` VALUES (581, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:52:14', 0);
INSERT INTO `sys_log` VALUES (582, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:56:12', 0);
INSERT INTO `sys_log` VALUES (583, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:56:26', 0);
INSERT INTO `sys_log` VALUES (584, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 16:57:46', 0);
INSERT INTO `sys_log` VALUES (585, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 16:58:46', 0);
INSERT INTO `sys_log` VALUES (586, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:03:30', 0);
INSERT INTO `sys_log` VALUES (587, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:10:44', 0);
INSERT INTO `sys_log` VALUES (588, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:18:32', 0);
INSERT INTO `sys_log` VALUES (589, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 17:20:43', 0);
INSERT INTO `sys_log` VALUES (590, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:20:44', 0);
INSERT INTO `sys_log` VALUES (591, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:22:26', 0);
INSERT INTO `sys_log` VALUES (592, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:27:39', 0);
INSERT INTO `sys_log` VALUES (593, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:27:51', 0);
INSERT INTO `sys_log` VALUES (594, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:28:59', 0);
INSERT INTO `sys_log` VALUES (595, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:32:34', 0);
INSERT INTO `sys_log` VALUES (596, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:33:00', 0);
INSERT INTO `sys_log` VALUES (597, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:35:25', 0);
INSERT INTO `sys_log` VALUES (598, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:36:18', 0);
INSERT INTO `sys_log` VALUES (599, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:38:52', 0);
INSERT INTO `sys_log` VALUES (600, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:40:51', 0);
INSERT INTO `sys_log` VALUES (601, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:42:04', 0);
INSERT INTO `sys_log` VALUES (602, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:43:15', 0);
INSERT INTO `sys_log` VALUES (603, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:44:20', 0);
INSERT INTO `sys_log` VALUES (604, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:44:30', 0);
INSERT INTO `sys_log` VALUES (605, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 17:46:53', 0);
INSERT INTO `sys_log` VALUES (606, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:14:13', 0);
INSERT INTO `sys_log` VALUES (607, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:15:04', 0);
INSERT INTO `sys_log` VALUES (608, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:15:16', 0);
INSERT INTO `sys_log` VALUES (609, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:15:25', 0);
INSERT INTO `sys_log` VALUES (610, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:17:29', 0);
INSERT INTO `sys_log` VALUES (611, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:17:43', 0);
INSERT INTO `sys_log` VALUES (612, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:18:33', 0);
INSERT INTO `sys_log` VALUES (613, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:19:10', 0);
INSERT INTO `sys_log` VALUES (614, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:21:03', 0);
INSERT INTO `sys_log` VALUES (615, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 18:28:04', 0);
INSERT INTO `sys_log` VALUES (616, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 18:28:07', 0);
INSERT INTO `sys_log` VALUES (617, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:28:07', 0);
INSERT INTO `sys_log` VALUES (618, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:28:53', 0);
INSERT INTO `sys_log` VALUES (619, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:29:46', 0);
INSERT INTO `sys_log` VALUES (620, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:30:04', 0);
INSERT INTO `sys_log` VALUES (621, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:33:12', 0);
INSERT INTO `sys_log` VALUES (622, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-08 18:37:04', 0);
INSERT INTO `sys_log` VALUES (623, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:37:04', 0);
INSERT INTO `sys_log` VALUES (624, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:38:42', 0);
INSERT INTO `sys_log` VALUES (625, 'USER', 'GET', '{}', NULL, '用户表单数据', '/api/v1/users/5/form', NULL, '172.18.0.1', '0', '内网IP', 30, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:38:43', 0);
INSERT INTO `sys_log` VALUES (626, 'USER', 'GET', '{}', NULL, '用户表单数据', '/api/v1/users/4/form', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:38:48', 0);
INSERT INTO `sys_log` VALUES (627, 'USER', 'GET', '{}', NULL, '用户表单数据', '/api/v1/users/2/form', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:38:54', 0);
INSERT INTO `sys_log` VALUES (628, 'USER', 'GET', '{}', NULL, '用户表单数据', '/api/v1/users/3/form', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:38:57', 0);
INSERT INTO `sys_log` VALUES (629, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:39:07', 0);
INSERT INTO `sys_log` VALUES (630, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:39:22', 0);
INSERT INTO `sys_log` VALUES (631, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:39:28', 0);
INSERT INTO `sys_log` VALUES (632, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:39:56', 0);
INSERT INTO `sys_log` VALUES (633, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:40:02', 0);
INSERT INTO `sys_log` VALUES (634, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-08 18:45:31', 0);
INSERT INTO `sys_log` VALUES (635, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:45:31', 0);
INSERT INTO `sys_log` VALUES (636, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:45:41', 0);
INSERT INTO `sys_log` VALUES (637, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:45:43', 0);
INSERT INTO `sys_log` VALUES (638, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:45:48', 0);
INSERT INTO `sys_log` VALUES (639, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:45:49', 0);
INSERT INTO `sys_log` VALUES (640, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:45:54', 0);
INSERT INTO `sys_log` VALUES (641, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:45:56', 0);
INSERT INTO `sys_log` VALUES (642, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:45:58', 0);
INSERT INTO `sys_log` VALUES (643, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:46:00', 0);
INSERT INTO `sys_log` VALUES (644, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:46:02', 0);
INSERT INTO `sys_log` VALUES (645, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:46:04', 0);
INSERT INTO `sys_log` VALUES (646, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 5, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:56:55', 0);
INSERT INTO `sys_log` VALUES (647, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 18:56:56', 0);
INSERT INTO `sys_log` VALUES (648, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 18:56:58', 0);
INSERT INTO `sys_log` VALUES (649, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 18:59:07', 0);
INSERT INTO `sys_log` VALUES (650, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:00:00', 0);
INSERT INTO `sys_log` VALUES (651, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 17, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:01:23', 0);
INSERT INTO `sys_log` VALUES (652, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:02:53', 0);
INSERT INTO `sys_log` VALUES (653, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:03:08', 0);
INSERT INTO `sys_log` VALUES (654, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-08 19:03:13', 0);
INSERT INTO `sys_log` VALUES (655, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:03:13', 0);
INSERT INTO `sys_log` VALUES (656, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:03:24', 0);
INSERT INTO `sys_log` VALUES (657, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:04:32', 0);
INSERT INTO `sys_log` VALUES (658, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:05:42', 0);
INSERT INTO `sys_log` VALUES (659, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:06:20', 0);
INSERT INTO `sys_log` VALUES (660, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-08 19:06:31', 0);
INSERT INTO `sys_log` VALUES (661, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:06:32', 0);
INSERT INTO `sys_log` VALUES (662, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:06:48', 0);
INSERT INTO `sys_log` VALUES (663, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:06:48', 0);
INSERT INTO `sys_log` VALUES (664, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:08:41', 0);
INSERT INTO `sys_log` VALUES (665, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:09:00', 0);
INSERT INTO `sys_log` VALUES (666, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:09:31', 0);
INSERT INTO `sys_log` VALUES (667, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:10:12', 0);
INSERT INTO `sys_log` VALUES (668, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-08 19:11:23', 0);
INSERT INTO `sys_log` VALUES (669, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:11:23', 0);
INSERT INTO `sys_log` VALUES (670, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:11:38', 0);
INSERT INTO `sys_log` VALUES (671, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 19:12:25', 0);
INSERT INTO `sys_log` VALUES (672, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 19:12:33', 0);
INSERT INTO `sys_log` VALUES (673, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:13:37', 0);
INSERT INTO `sys_log` VALUES (674, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:13:44', 0);
INSERT INTO `sys_log` VALUES (675, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:13:50', 0);
INSERT INTO `sys_log` VALUES (676, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:14:45', 0);
INSERT INTO `sys_log` VALUES (677, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-08 19:15:44', 0);
INSERT INTO `sys_log` VALUES (678, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 1, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:15:44', 0);
INSERT INTO `sys_log` VALUES (679, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:16:21', 0);
INSERT INTO `sys_log` VALUES (680, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:16:23', 0);
INSERT INTO `sys_log` VALUES (681, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-08 19:16:33', 0);
INSERT INTO `sys_log` VALUES (682, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:16:33', 0);
INSERT INTO `sys_log` VALUES (683, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:16:50', 0);
INSERT INTO `sys_log` VALUES (684, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:16:52', 0);
INSERT INTO `sys_log` VALUES (685, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:16:54', 0);
INSERT INTO `sys_log` VALUES (686, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:16:56', 0);
INSERT INTO `sys_log` VALUES (687, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:16:57', 0);
INSERT INTO `sys_log` VALUES (688, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:16:58', 0);
INSERT INTO `sys_log` VALUES (689, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:16:59', 0);
INSERT INTO `sys_log` VALUES (690, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:17:00', 0);
INSERT INTO `sys_log` VALUES (691, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:17:01', 0);
INSERT INTO `sys_log` VALUES (692, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:17:02', 0);
INSERT INTO `sys_log` VALUES (693, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:17:03', 0);
INSERT INTO `sys_log` VALUES (694, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:17:05', 0);
INSERT INTO `sys_log` VALUES (695, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:17:06', 0);
INSERT INTO `sys_log` VALUES (696, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:17:07', 0);
INSERT INTO `sys_log` VALUES (697, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:17:09', 0);
INSERT INTO `sys_log` VALUES (698, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-08 19:24:27', 0);
INSERT INTO `sys_log` VALUES (699, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 19:24:27', 0);
INSERT INTO `sys_log` VALUES (700, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 19:24:29', 0);
INSERT INTO `sys_log` VALUES (701, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 19:24:30', 0);
INSERT INTO `sys_log` VALUES (702, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 19:24:31', 0);
INSERT INTO `sys_log` VALUES (703, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 19:24:35', 0);
INSERT INTO `sys_log` VALUES (704, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:25:34', 0);
INSERT INTO `sys_log` VALUES (705, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:25:39', 0);
INSERT INTO `sys_log` VALUES (706, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:25:45', 0);
INSERT INTO `sys_log` VALUES (707, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-08 19:25:59', 0);
INSERT INTO `sys_log` VALUES (708, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 1, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:25:59', 0);
INSERT INTO `sys_log` VALUES (709, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:27:38', 0);
INSERT INTO `sys_log` VALUES (710, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:30:04', 0);
INSERT INTO `sys_log` VALUES (711, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:31:03', 0);
INSERT INTO `sys_log` VALUES (712, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:31:08', 0);
INSERT INTO `sys_log` VALUES (713, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:37:36', 0);
INSERT INTO `sys_log` VALUES (714, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:40:46', 0);
INSERT INTO `sys_log` VALUES (715, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:42:09', 0);
INSERT INTO `sys_log` VALUES (716, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:42:23', 0);
INSERT INTO `sys_log` VALUES (717, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:44:22', 0);
INSERT INTO `sys_log` VALUES (718, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 19:47:26', 0);
INSERT INTO `sys_log` VALUES (719, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:48:50', 0);
INSERT INTO `sys_log` VALUES (720, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 19:49:23', 0);
INSERT INTO `sys_log` VALUES (721, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:49:23', 0);
INSERT INTO `sys_log` VALUES (722, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:49:41', 0);
INSERT INTO `sys_log` VALUES (723, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:52:04', 0);
INSERT INTO `sys_log` VALUES (724, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:54:38', 0);
INSERT INTO `sys_log` VALUES (725, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:58:02', 0);
INSERT INTO `sys_log` VALUES (726, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:58:23', 0);
INSERT INTO `sys_log` VALUES (727, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 19:59:42', 0);
INSERT INTO `sys_log` VALUES (728, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:07:31', 0);
INSERT INTO `sys_log` VALUES (729, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:15:03', 0);
INSERT INTO `sys_log` VALUES (730, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:18:37', 0);
INSERT INTO `sys_log` VALUES (731, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:19:34', 0);
INSERT INTO `sys_log` VALUES (732, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:21:13', 0);
INSERT INTO `sys_log` VALUES (733, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:23:23', 0);
INSERT INTO `sys_log` VALUES (734, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 20:24:53', 0);
INSERT INTO `sys_log` VALUES (735, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:32:29', 0);
INSERT INTO `sys_log` VALUES (736, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:34:21', 0);
INSERT INTO `sys_log` VALUES (737, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:35:19', 0);
INSERT INTO `sys_log` VALUES (738, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:36:44', 0);
INSERT INTO `sys_log` VALUES (739, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:38:46', 0);
INSERT INTO `sys_log` VALUES (740, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:39:05', 0);
INSERT INTO `sys_log` VALUES (741, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:41:20', 0);
INSERT INTO `sys_log` VALUES (742, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 20:49:35', 0);
INSERT INTO `sys_log` VALUES (743, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:49:35', 0);
INSERT INTO `sys_log` VALUES (744, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:49:56', 0);
INSERT INTO `sys_log` VALUES (745, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 20:50:06', 0);
INSERT INTO `sys_log` VALUES (746, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:50:06', 0);
INSERT INTO `sys_log` VALUES (747, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:50:39', 0);
INSERT INTO `sys_log` VALUES (748, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:50:43', 0);
INSERT INTO `sys_log` VALUES (749, 'ROLE', 'GET', '{\"pageNum\":2,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:50:45', 0);
INSERT INTO `sys_log` VALUES (750, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:50:58', 0);
INSERT INTO `sys_log` VALUES (751, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:50:58', 0);
INSERT INTO `sys_log` VALUES (752, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:51:01', 0);
INSERT INTO `sys_log` VALUES (753, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:51:03', 0);
INSERT INTO `sys_log` VALUES (754, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 20:51:46', 0);
INSERT INTO `sys_log` VALUES (755, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:04:00', 0);
INSERT INTO `sys_log` VALUES (756, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:07:18', 0);
INSERT INTO `sys_log` VALUES (757, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:15:49', 0);
INSERT INTO `sys_log` VALUES (758, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:21:11', 0);
INSERT INTO `sys_log` VALUES (759, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 51, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 21:21:58', 0);
INSERT INTO `sys_log` VALUES (760, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:21:58', 0);
INSERT INTO `sys_log` VALUES (761, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:24:16', 0);
INSERT INTO `sys_log` VALUES (762, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:30:19', 0);
INSERT INTO `sys_log` VALUES (763, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 21:31:39', 0);
INSERT INTO `sys_log` VALUES (764, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:31:39', 0);
INSERT INTO `sys_log` VALUES (765, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 21:36:56', 0);
INSERT INTO `sys_log` VALUES (766, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:36:56', 0);
INSERT INTO `sys_log` VALUES (767, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:39:10', 0);
INSERT INTO `sys_log` VALUES (768, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 21:41:51', 0);
INSERT INTO `sys_log` VALUES (769, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:41:51', 0);
INSERT INTO `sys_log` VALUES (770, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-08 21:43:01', 0);
INSERT INTO `sys_log` VALUES (771, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 21:43:01', 0);
INSERT INTO `sys_log` VALUES (772, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:43:16', 0);
INSERT INTO `sys_log` VALUES (773, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 21:44:17', 0);
INSERT INTO `sys_log` VALUES (774, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:44:17', 0);
INSERT INTO `sys_log` VALUES (775, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:47:06', 0);
INSERT INTO `sys_log` VALUES (776, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 21:48:28', 0);
INSERT INTO `sys_log` VALUES (777, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 21:48:36', 0);
INSERT INTO `sys_log` VALUES (778, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:48:52', 0);
INSERT INTO `sys_log` VALUES (779, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 21:51:23', 0);
INSERT INTO `sys_log` VALUES (780, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:51:32', 0);
INSERT INTO `sys_log` VALUES (781, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 21:51:45', 0);
INSERT INTO `sys_log` VALUES (782, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 21:53:44', 0);
INSERT INTO `sys_log` VALUES (783, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 21:54:37', 0);
INSERT INTO `sys_log` VALUES (784, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 21:57:40', 0);
INSERT INTO `sys_log` VALUES (785, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:57:42', 0);
INSERT INTO `sys_log` VALUES (786, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 21:58:44', 0);
INSERT INTO `sys_log` VALUES (787, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 21:58:44', 0);
INSERT INTO `sys_log` VALUES (788, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 21:58:46', 0);
INSERT INTO `sys_log` VALUES (789, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:00:09', 0);
INSERT INTO `sys_log` VALUES (790, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:00:35', 0);
INSERT INTO `sys_log` VALUES (791, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:01:12', 0);
INSERT INTO `sys_log` VALUES (792, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:03:25', 0);
INSERT INTO `sys_log` VALUES (793, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:04:30', 0);
INSERT INTO `sys_log` VALUES (794, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:05:27', 0);
INSERT INTO `sys_log` VALUES (795, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:09:04', 0);
INSERT INTO `sys_log` VALUES (796, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:13:47', 0);
INSERT INTO `sys_log` VALUES (797, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:14:08', 0);
INSERT INTO `sys_log` VALUES (798, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:14:09', 0);
INSERT INTO `sys_log` VALUES (799, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:24:27', 0);
INSERT INTO `sys_log` VALUES (800, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:24:28', 0);
INSERT INTO `sys_log` VALUES (801, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 22:25:34', 0);
INSERT INTO `sys_log` VALUES (802, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:25:34', 0);
INSERT INTO `sys_log` VALUES (803, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 1, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:26:25', 0);
INSERT INTO `sys_log` VALUES (804, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:27:21', 0);
INSERT INTO `sys_log` VALUES (805, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:28:04', 0);
INSERT INTO `sys_log` VALUES (806, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:29:04', 0);
INSERT INTO `sys_log` VALUES (807, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:30:44', 0);
INSERT INTO `sys_log` VALUES (808, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 22:31:10', 0);
INSERT INTO `sys_log` VALUES (809, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 22:31:13', 0);
INSERT INTO `sys_log` VALUES (810, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:31:13', 0);
INSERT INTO `sys_log` VALUES (811, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:31:29', 0);
INSERT INTO `sys_log` VALUES (812, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:33:13', 0);
INSERT INTO `sys_log` VALUES (813, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:33:43', 0);
INSERT INTO `sys_log` VALUES (814, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-08 22:34:32', 0);
INSERT INTO `sys_log` VALUES (815, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 22:34:32', 0);
INSERT INTO `sys_log` VALUES (816, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:34:55', 0);
INSERT INTO `sys_log` VALUES (817, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 22:39:52', 0);
INSERT INTO `sys_log` VALUES (818, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:39:53', 0);
INSERT INTO `sys_log` VALUES (819, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:41:24', 0);
INSERT INTO `sys_log` VALUES (820, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:41:38', 0);
INSERT INTO `sys_log` VALUES (821, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:42:24', 0);
INSERT INTO `sys_log` VALUES (822, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:42:42', 0);
INSERT INTO `sys_log` VALUES (823, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-08 22:43:34', 0);
INSERT INTO `sys_log` VALUES (824, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:44:58', 0);
INSERT INTO `sys_log` VALUES (825, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 22:48:25', 0);
INSERT INTO `sys_log` VALUES (826, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-08 22:49:15', 0);
INSERT INTO `sys_log` VALUES (827, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 23:10:11', 0);
INSERT INTO `sys_log` VALUES (828, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 23:10:38', 0);
INSERT INTO `sys_log` VALUES (829, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 23:10:38', 0);
INSERT INTO `sys_log` VALUES (830, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 23:12:10', 0);
INSERT INTO `sys_log` VALUES (831, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 23:13:25', 0);
INSERT INTO `sys_log` VALUES (832, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-08 23:17:29', 0);
INSERT INTO `sys_log` VALUES (833, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-08 23:17:29', 0);
INSERT INTO `sys_log` VALUES (834, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 536, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-09 17:20:14', 0);
INSERT INTO `sys_log` VALUES (835, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:16', 0);
INSERT INTO `sys_log` VALUES (836, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:16', 0);
INSERT INTO `sys_log` VALUES (837, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:16', 0);
INSERT INTO `sys_log` VALUES (838, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 61, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:24', 0);
INSERT INTO `sys_log` VALUES (839, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:39', 0);
INSERT INTO `sys_log` VALUES (840, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:40', 0);
INSERT INTO `sys_log` VALUES (841, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:42', 0);
INSERT INTO `sys_log` VALUES (842, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:47', 0);
INSERT INTO `sys_log` VALUES (843, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:48', 0);
INSERT INTO `sys_log` VALUES (844, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:49', 0);
INSERT INTO `sys_log` VALUES (845, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:50', 0);
INSERT INTO `sys_log` VALUES (846, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:50', 0);
INSERT INTO `sys_log` VALUES (847, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:20:51', 0);
INSERT INTO `sys_log` VALUES (848, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:29', 0);
INSERT INTO `sys_log` VALUES (849, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:33', 0);
INSERT INTO `sys_log` VALUES (850, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:34', 0);
INSERT INTO `sys_log` VALUES (851, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:35', 0);
INSERT INTO `sys_log` VALUES (852, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:35', 0);
INSERT INTO `sys_log` VALUES (853, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:36', 0);
INSERT INTO `sys_log` VALUES (854, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:36', 0);
INSERT INTO `sys_log` VALUES (855, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:36', 0);
INSERT INTO `sys_log` VALUES (856, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:37', 0);
INSERT INTO `sys_log` VALUES (857, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:37', 0);
INSERT INTO `sys_log` VALUES (858, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:37', 0);
INSERT INTO `sys_log` VALUES (859, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:52', 0);
INSERT INTO `sys_log` VALUES (860, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:53', 0);
INSERT INTO `sys_log` VALUES (861, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:53', 0);
INSERT INTO `sys_log` VALUES (862, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:53', 0);
INSERT INTO `sys_log` VALUES (863, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:54', 0);
INSERT INTO `sys_log` VALUES (864, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:54', 0);
INSERT INTO `sys_log` VALUES (865, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:21:54', 0);
INSERT INTO `sys_log` VALUES (866, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:22:00', 0);
INSERT INTO `sys_log` VALUES (867, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:22:02', 0);
INSERT INTO `sys_log` VALUES (868, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:22:05', 0);
INSERT INTO `sys_log` VALUES (869, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:22:07', 0);
INSERT INTO `sys_log` VALUES (870, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:22:08', 0);
INSERT INTO `sys_log` VALUES (871, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:22:15', 0);
INSERT INTO `sys_log` VALUES (872, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:23:03', 0);
INSERT INTO `sys_log` VALUES (873, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:25:20', 0);
INSERT INTO `sys_log` VALUES (874, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:25:22', 0);
INSERT INTO `sys_log` VALUES (875, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:25:38', 0);
INSERT INTO `sys_log` VALUES (876, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:25:39', 0);
INSERT INTO `sys_log` VALUES (877, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:25:41', 0);
INSERT INTO `sys_log` VALUES (878, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:25:42', 0);
INSERT INTO `sys_log` VALUES (879, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:27:05', 0);
INSERT INTO `sys_log` VALUES (880, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:30:10', 0);
INSERT INTO `sys_log` VALUES (881, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:30:12', 0);
INSERT INTO `sys_log` VALUES (882, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:30:13', 0);
INSERT INTO `sys_log` VALUES (883, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:30:14', 0);
INSERT INTO `sys_log` VALUES (884, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:31:47', 0);
INSERT INTO `sys_log` VALUES (885, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:32:15', 0);
INSERT INTO `sys_log` VALUES (886, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:32:17', 0);
INSERT INTO `sys_log` VALUES (887, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:32:18', 0);
INSERT INTO `sys_log` VALUES (888, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:32:19', 0);
INSERT INTO `sys_log` VALUES (889, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:34:23', 0);
INSERT INTO `sys_log` VALUES (890, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:34:24', 0);
INSERT INTO `sys_log` VALUES (891, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:34:25', 0);
INSERT INTO `sys_log` VALUES (892, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:34:26', 0);
INSERT INTO `sys_log` VALUES (893, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:34:26', 0);
INSERT INTO `sys_log` VALUES (894, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:34:32', 0);
INSERT INTO `sys_log` VALUES (895, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:34:33', 0);
INSERT INTO `sys_log` VALUES (896, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:34:34', 0);
INSERT INTO `sys_log` VALUES (897, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:34:34', 0);
INSERT INTO `sys_log` VALUES (898, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:35:50', 0);
INSERT INTO `sys_log` VALUES (899, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:35:51', 0);
INSERT INTO `sys_log` VALUES (900, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:35:52', 0);
INSERT INTO `sys_log` VALUES (901, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:35:52', 0);
INSERT INTO `sys_log` VALUES (902, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:35:53', 0);
INSERT INTO `sys_log` VALUES (903, 'LOGIN', 'POST', 'admin 123456', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:36:02', 0);
INSERT INTO `sys_log` VALUES (904, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-09-09 17:39:34', 0);
INSERT INTO `sys_log` VALUES (905, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:35', 0);
INSERT INTO `sys_log` VALUES (906, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:36', 0);
INSERT INTO `sys_log` VALUES (907, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:36', 0);
INSERT INTO `sys_log` VALUES (908, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:36', 0);
INSERT INTO `sys_log` VALUES (909, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:37', 0);
INSERT INTO `sys_log` VALUES (910, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:37', 0);
INSERT INTO `sys_log` VALUES (911, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:37', 0);
INSERT INTO `sys_log` VALUES (912, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:38', 0);
INSERT INTO `sys_log` VALUES (913, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 62, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:38', 0);
INSERT INTO `sys_log` VALUES (914, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:38', 0);
INSERT INTO `sys_log` VALUES (915, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:39', 0);
INSERT INTO `sys_log` VALUES (916, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:39:39', 0);
INSERT INTO `sys_log` VALUES (917, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-09 17:40:57', 0);
INSERT INTO `sys_log` VALUES (918, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 82, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:40:57', 0);
INSERT INTO `sys_log` VALUES (919, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:28', 0);
INSERT INTO `sys_log` VALUES (920, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:30', 0);
INSERT INTO `sys_log` VALUES (921, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:30', 0);
INSERT INTO `sys_log` VALUES (922, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:31', 0);
INSERT INTO `sys_log` VALUES (923, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:31', 0);
INSERT INTO `sys_log` VALUES (924, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:31', 0);
INSERT INTO `sys_log` VALUES (925, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:32', 0);
INSERT INTO `sys_log` VALUES (926, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:32', 0);
INSERT INTO `sys_log` VALUES (927, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:32', 0);
INSERT INTO `sys_log` VALUES (928, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:32', 0);
INSERT INTO `sys_log` VALUES (929, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:33', 0);
INSERT INTO `sys_log` VALUES (930, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:33', 0);
INSERT INTO `sys_log` VALUES (931, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:34', 0);
INSERT INTO `sys_log` VALUES (932, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:34', 0);
INSERT INTO `sys_log` VALUES (933, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:34', 0);
INSERT INTO `sys_log` VALUES (934, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:35', 0);
INSERT INTO `sys_log` VALUES (935, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:41:36', 0);
INSERT INTO `sys_log` VALUES (936, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:42:39', 0);
INSERT INTO `sys_log` VALUES (937, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:42:55', 0);
INSERT INTO `sys_log` VALUES (938, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:43:35', 0);
INSERT INTO `sys_log` VALUES (939, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:43:39', 0);
INSERT INTO `sys_log` VALUES (940, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:43:46', 0);
INSERT INTO `sys_log` VALUES (941, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:43:48', 0);
INSERT INTO `sys_log` VALUES (942, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 59, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:24', 0);
INSERT INTO `sys_log` VALUES (943, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:25', 0);
INSERT INTO `sys_log` VALUES (944, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:26', 0);
INSERT INTO `sys_log` VALUES (945, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:27', 0);
INSERT INTO `sys_log` VALUES (946, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:27', 0);
INSERT INTO `sys_log` VALUES (947, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:28', 0);
INSERT INTO `sys_log` VALUES (948, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:28', 0);
INSERT INTO `sys_log` VALUES (949, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:29', 0);
INSERT INTO `sys_log` VALUES (950, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:29', 0);
INSERT INTO `sys_log` VALUES (951, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:29', 0);
INSERT INTO `sys_log` VALUES (952, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:30', 0);
INSERT INTO `sys_log` VALUES (953, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:30', 0);
INSERT INTO `sys_log` VALUES (954, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:30', 0);
INSERT INTO `sys_log` VALUES (955, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:33', 0);
INSERT INTO `sys_log` VALUES (956, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 60, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:34', 0);
INSERT INTO `sys_log` VALUES (957, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:34', 0);
INSERT INTO `sys_log` VALUES (958, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:45:34', 0);
INSERT INTO `sys_log` VALUES (959, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:46:16', 0);
INSERT INTO `sys_log` VALUES (960, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:46:17', 0);
INSERT INTO `sys_log` VALUES (961, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:46:18', 0);
INSERT INTO `sys_log` VALUES (962, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:46:19', 0);
INSERT INTO `sys_log` VALUES (963, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:46:20', 0);
INSERT INTO `sys_log` VALUES (964, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:48:30', 0);
INSERT INTO `sys_log` VALUES (965, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:48:31', 0);
INSERT INTO `sys_log` VALUES (966, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:48:32', 0);
INSERT INTO `sys_log` VALUES (967, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:50:06', 0);
INSERT INTO `sys_log` VALUES (968, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:50:17', 0);
INSERT INTO `sys_log` VALUES (969, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:50:35', 0);
INSERT INTO `sys_log` VALUES (970, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:53:10', 0);
INSERT INTO `sys_log` VALUES (971, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:53:11', 0);
INSERT INTO `sys_log` VALUES (972, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:53:12', 0);
INSERT INTO `sys_log` VALUES (973, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:53:13', 0);
INSERT INTO `sys_log` VALUES (974, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:53:15', 0);
INSERT INTO `sys_log` VALUES (975, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 61, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:53:24', 0);
INSERT INTO `sys_log` VALUES (976, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:54:01', 0);
INSERT INTO `sys_log` VALUES (977, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:54:02', 0);
INSERT INTO `sys_log` VALUES (978, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 60, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:54:02', 0);
INSERT INTO `sys_log` VALUES (979, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:54:02', 0);
INSERT INTO `sys_log` VALUES (980, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:54:03', 0);
INSERT INTO `sys_log` VALUES (981, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:54:03', 0);
INSERT INTO `sys_log` VALUES (982, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:54:03', 0);
INSERT INTO `sys_log` VALUES (983, 'LOGIN', 'POST', 'admin 123456', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-09 17:55:15', 0);
INSERT INTO `sys_log` VALUES (984, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-09-09 17:55:33', 0);
INSERT INTO `sys_log` VALUES (985, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:56:06', 0);
INSERT INTO `sys_log` VALUES (986, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:58:38', 0);
INSERT INTO `sys_log` VALUES (987, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 17:58:46', 0);
INSERT INTO `sys_log` VALUES (988, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 61, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:01:13', 0);
INSERT INTO `sys_log` VALUES (989, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:01:14', 0);
INSERT INTO `sys_log` VALUES (990, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:01:15', 0);
INSERT INTO `sys_log` VALUES (991, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:01:16', 0);
INSERT INTO `sys_log` VALUES (992, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:02:41', 0);
INSERT INTO `sys_log` VALUES (993, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:05:41', 0);
INSERT INTO `sys_log` VALUES (994, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:07:38', 0);
INSERT INTO `sys_log` VALUES (995, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:07:44', 0);
INSERT INTO `sys_log` VALUES (996, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:07:45', 0);
INSERT INTO `sys_log` VALUES (997, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:07:48', 0);
INSERT INTO `sys_log` VALUES (998, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:07:49', 0);
INSERT INTO `sys_log` VALUES (999, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:07:50', 0);
INSERT INTO `sys_log` VALUES (1000, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:08:44', 0);
INSERT INTO `sys_log` VALUES (1001, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:11:44', 0);
INSERT INTO `sys_log` VALUES (1002, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-09-09 18:13:36', 0);
INSERT INTO `sys_log` VALUES (1003, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2025-09-09 18:13:36', 0);
INSERT INTO `sys_log` VALUES (1004, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:15:35', 0);
INSERT INTO `sys_log` VALUES (1005, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:15:36', 0);
INSERT INTO `sys_log` VALUES (1006, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:15:37', 0);
INSERT INTO `sys_log` VALUES (1007, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:15:50', 0);
INSERT INTO `sys_log` VALUES (1008, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 63, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:18:57', 0);
INSERT INTO `sys_log` VALUES (1009, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:19:01', 0);
INSERT INTO `sys_log` VALUES (1010, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:19:02', 0);
INSERT INTO `sys_log` VALUES (1011, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:19:02', 0);
INSERT INTO `sys_log` VALUES (1012, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:19:03', 0);
INSERT INTO `sys_log` VALUES (1013, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:19:04', 0);
INSERT INTO `sys_log` VALUES (1014, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:19:05', 0);
INSERT INTO `sys_log` VALUES (1015, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:19:05', 0);
INSERT INTO `sys_log` VALUES (1016, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:19:08', 0);
INSERT INTO `sys_log` VALUES (1017, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:19:09', 0);
INSERT INTO `sys_log` VALUES (1018, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:42', 0);
INSERT INTO `sys_log` VALUES (1019, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:44', 0);
INSERT INTO `sys_log` VALUES (1020, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:45', 0);
INSERT INTO `sys_log` VALUES (1021, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:45', 0);
INSERT INTO `sys_log` VALUES (1022, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:46', 0);
INSERT INTO `sys_log` VALUES (1023, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:47', 0);
INSERT INTO `sys_log` VALUES (1024, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:48', 0);
INSERT INTO `sys_log` VALUES (1025, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:49', 0);
INSERT INTO `sys_log` VALUES (1026, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:50', 0);
INSERT INTO `sys_log` VALUES (1027, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:50', 0);
INSERT INTO `sys_log` VALUES (1028, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:51', 0);
INSERT INTO `sys_log` VALUES (1029, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:51', 0);
INSERT INTO `sys_log` VALUES (1030, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:52', 0);
INSERT INTO `sys_log` VALUES (1031, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:52', 0);
INSERT INTO `sys_log` VALUES (1032, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:21:53', 0);
INSERT INTO `sys_log` VALUES (1033, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 60, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:23:34', 0);
INSERT INTO `sys_log` VALUES (1034, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 18:23:45', 0);
INSERT INTO `sys_log` VALUES (1035, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 18:23:45', 0);
INSERT INTO `sys_log` VALUES (1036, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 18:26:11', 0);
INSERT INTO `sys_log` VALUES (1037, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 18:26:14', 0);
INSERT INTO `sys_log` VALUES (1038, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 18:26:14', 0);
INSERT INTO `sys_log` VALUES (1039, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 18:27:01', 0);
INSERT INTO `sys_log` VALUES (1040, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 18:27:07', 0);
INSERT INTO `sys_log` VALUES (1041, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 18:27:10', 0);
INSERT INTO `sys_log` VALUES (1042, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 18:27:10', 0);
INSERT INTO `sys_log` VALUES (1043, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:27:15', 0);
INSERT INTO `sys_log` VALUES (1044, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:27:18', 0);
INSERT INTO `sys_log` VALUES (1045, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:27:19', 0);
INSERT INTO `sys_log` VALUES (1046, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:27:37', 0);
INSERT INTO `sys_log` VALUES (1047, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:27:37', 0);
INSERT INTO `sys_log` VALUES (1048, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:27:38', 0);
INSERT INTO `sys_log` VALUES (1049, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-09 18:27:56', 0);
INSERT INTO `sys_log` VALUES (1050, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:27:56', 0);
INSERT INTO `sys_log` VALUES (1051, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:28:56', 0);
INSERT INTO `sys_log` VALUES (1052, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-09 18:28:57', 0);
INSERT INTO `sys_log` VALUES (1053, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:28:57', 0);
INSERT INTO `sys_log` VALUES (1054, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:29:20', 0);
INSERT INTO `sys_log` VALUES (1055, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-09 18:29:55', 0);
INSERT INTO `sys_log` VALUES (1056, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:29:55', 0);
INSERT INTO `sys_log` VALUES (1057, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:30:33', 0);
INSERT INTO `sys_log` VALUES (1058, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-09 18:30:38', 0);
INSERT INTO `sys_log` VALUES (1059, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:30:38', 0);
INSERT INTO `sys_log` VALUES (1060, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:33:24', 0);
INSERT INTO `sys_log` VALUES (1061, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-09 18:33:27', 0);
INSERT INTO `sys_log` VALUES (1062, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 18:33:27', 0);
INSERT INTO `sys_log` VALUES (1063, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 18:38:45', 0);
INSERT INTO `sys_log` VALUES (1064, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 18:38:48', 0);
INSERT INTO `sys_log` VALUES (1065, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 18:38:48', 0);
INSERT INTO `sys_log` VALUES (1066, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 19:08:02', 0);
INSERT INTO `sys_log` VALUES (1067, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 19:08:03', 0);
INSERT INTO `sys_log` VALUES (1068, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 19:08:03', 0);
INSERT INTO `sys_log` VALUES (1069, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 19:08:06', 0);
INSERT INTO `sys_log` VALUES (1070, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 19:08:08', 0);
INSERT INTO `sys_log` VALUES (1071, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 19:23:04', 0);
INSERT INTO `sys_log` VALUES (1072, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 19:23:04', 0);
INSERT INTO `sys_log` VALUES (1073, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 19:30:57', 0);
INSERT INTO `sys_log` VALUES (1074, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 19:30:58', 0);
INSERT INTO `sys_log` VALUES (1075, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-09 19:50:24', 0);
INSERT INTO `sys_log` VALUES (1076, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 19:50:24', 0);
INSERT INTO `sys_log` VALUES (1077, 'LOGIN', 'POST', 'aioveuProcurement aioveuProcurement', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 68, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:33:09', 0);
INSERT INTO `sys_log` VALUES (1078, 'LOGIN', 'POST', 'aioveuProcurement aioveuProcurement', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:33:11', 0);
INSERT INTO `sys_log` VALUES (1079, 'LOGIN', 'POST', 'aioveuProcurement aioveuProcurement', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:33:12', 0);
INSERT INTO `sys_log` VALUES (1080, 'LOGIN', 'POST', 'aioveuProcurement aioveuProcurement', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:33:12', 0);
INSERT INTO `sys_log` VALUES (1081, 'LOGIN', 'POST', 'aioveuProcurement aioveuProcurement', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:33:13', 0);
INSERT INTO `sys_log` VALUES (1082, 'LOGIN', 'POST', 'aioveuProcurement aioveuProcurement', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 53, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:33:15', 0);
INSERT INTO `sys_log` VALUES (1083, 'LOGIN', 'POST', 'aioveuProcurement aioveuProcurement', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:33:17', 0);
INSERT INTO `sys_log` VALUES (1084, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:33:25', 0);
INSERT INTO `sys_log` VALUES (1085, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 21:33:25', 0);
INSERT INTO `sys_log` VALUES (1086, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 21:35:06', 0);
INSERT INTO `sys_log` VALUES (1087, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:35:11', 0);
INSERT INTO `sys_log` VALUES (1088, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 21:35:11', 0);
INSERT INTO `sys_log` VALUES (1089, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 61, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 21:35:14', 0);
INSERT INTO `sys_log` VALUES (1090, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:36:12', 0);
INSERT INTO `sys_log` VALUES (1091, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 21:36:12', 0);
INSERT INTO `sys_log` VALUES (1092, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 21:49:07', 0);
INSERT INTO `sys_log` VALUES (1093, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 21:49:07', 0);
INSERT INTO `sys_log` VALUES (1094, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-09 22:22:51', 0);
INSERT INTO `sys_log` VALUES (1095, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-09 22:22:51', 0);
INSERT INTO `sys_log` VALUES (1096, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 22:25:55', 0);
INSERT INTO `sys_log` VALUES (1097, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 22:25:55', 0);
INSERT INTO `sys_log` VALUES (1098, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 22:57:08', 0);
INSERT INTO `sys_log` VALUES (1099, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 22:57:13', 0);
INSERT INTO `sys_log` VALUES (1100, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:07:04', 0);
INSERT INTO `sys_log` VALUES (1101, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:12:50', 0);
INSERT INTO `sys_log` VALUES (1102, 'USER', 'GET', '', NULL, '获取个人中心用户信息', '/api/v1/users/profile', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:14:01', 0);
INSERT INTO `sys_log` VALUES (1103, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-09 23:22:32', 0);
INSERT INTO `sys_log` VALUES (1104, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:22:32', 0);
INSERT INTO `sys_log` VALUES (1105, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 137, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:34:37', 0);
INSERT INTO `sys_log` VALUES (1106, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:36:16', 0);
INSERT INTO `sys_log` VALUES (1107, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:36:16', 0);
INSERT INTO `sys_log` VALUES (1108, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:39:11', 0);
INSERT INTO `sys_log` VALUES (1109, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:39:11', 0);
INSERT INTO `sys_log` VALUES (1110, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:39:15', 0);
INSERT INTO `sys_log` VALUES (1111, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:39:15', 0);
INSERT INTO `sys_log` VALUES (1112, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:39:35', 0);
INSERT INTO `sys_log` VALUES (1113, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-09 23:39:45', 0);
INSERT INTO `sys_log` VALUES (1114, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-10 00:57:56', 0);
INSERT INTO `sys_log` VALUES (1115, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-10 00:57:56', 0);
INSERT INTO `sys_log` VALUES (1116, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 5, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-10 00:58:56', 0);
INSERT INTO `sys_log` VALUES (1117, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '172.18.0.1', '0', '内网IP', 6, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-10 00:59:03', 0);
INSERT INTO `sys_log` VALUES (1118, 'SETTING', 'GET', '{\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}', NULL, '系统配置分页列表', '/api/v1/config/page', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-10 00:59:06', 0);
INSERT INTO `sys_log` VALUES (1119, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 55, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-10 01:24:58', 0);
INSERT INTO `sys_log` VALUES (1120, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-10 01:24:58', 0);
INSERT INTO `sys_log` VALUES (1121, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 0, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-10 01:26:25', 0);
INSERT INTO `sys_log` VALUES (1122, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-10 01:26:30', 0);
INSERT INTO `sys_log` VALUES (1123, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-10 01:26:30', 0);
INSERT INTO `sys_log` VALUES (1124, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'Safari', '18.6', 'iPhone', NULL, '2025-09-10 01:30:05', 0);
INSERT INTO `sys_log` VALUES (1125, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 2, 'Safari', '18.6', 'iPhone', 4, '2025-09-10 01:30:05', 0);
INSERT INTO `sys_log` VALUES (1126, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 544, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-10 14:46:17', 0);
INSERT INTO `sys_log` VALUES (1127, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 14, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-10 14:46:18', 0);
INSERT INTO `sys_log` VALUES (1128, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 61, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-10 14:53:32', 0);
INSERT INTO `sys_log` VALUES (1129, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-10 14:53:32', 0);
INSERT INTO `sys_log` VALUES (1130, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '172.18.0.1', '0', '内网IP', 1, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-10 14:58:04', 0);
INSERT INTO `sys_log` VALUES (1131, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-10 14:58:06', 0);
INSERT INTO `sys_log` VALUES (1132, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-10 14:58:06', 0);
INSERT INTO `sys_log` VALUES (1133, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'MicroMessenger', '8.0.61', 'iPhone', NULL, '2025-09-10 15:08:02', 0);
INSERT INTO `sys_log` VALUES (1134, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.61', 'iPhone', 4, '2025-09-10 15:08:02', 0);
INSERT INTO `sys_log` VALUES (1135, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 58, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-10 15:56:53', 0);
INSERT INTO `sys_log` VALUES (1136, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-10 15:56:53', 0);
INSERT INTO `sys_log` VALUES (1137, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-10 16:38:55', 0);
INSERT INTO `sys_log` VALUES (1138, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-10 16:38:55', 0);
INSERT INTO `sys_log` VALUES (1139, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 369, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-11 15:10:08', 0);
INSERT INTO `sys_log` VALUES (1140, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 120, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-11 15:10:09', 0);
INSERT INTO `sys_log` VALUES (1141, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-11 15:10:31', 0);
INSERT INTO `sys_log` VALUES (1142, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-11 15:10:31', 0);
INSERT INTO `sys_log` VALUES (1143, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-11 15:43:20', 0);
INSERT INTO `sys_log` VALUES (1144, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-11 15:43:20', 0);
INSERT INTO `sys_log` VALUES (1145, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '172.18.0.1', '0', '内网IP', 136, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-11 15:43:52', 0);
INSERT INTO `sys_log` VALUES (1146, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 64, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-11 17:57:58', 0);
INSERT INTO `sys_log` VALUES (1147, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-11 17:57:58', 0);
INSERT INTO `sys_log` VALUES (1148, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-11 19:06:01', 0);
INSERT INTO `sys_log` VALUES (1149, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-11 19:06:01', 0);
INSERT INTO `sys_log` VALUES (1150, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-11 21:08:50', 0);
INSERT INTO `sys_log` VALUES (1151, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-11 21:08:50', 0);
INSERT INTO `sys_log` VALUES (1152, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-11 21:45:56', 0);
INSERT INTO `sys_log` VALUES (1153, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-11 21:45:56', 0);
INSERT INTO `sys_log` VALUES (1154, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 57, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-11 23:53:42', 0);
INSERT INTO `sys_log` VALUES (1155, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-11 23:53:42', 0);
INSERT INTO `sys_log` VALUES (1156, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 487, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-12 12:09:25', 0);
INSERT INTO `sys_log` VALUES (1157, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 12, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-12 12:09:25', 0);
INSERT INTO `sys_log` VALUES (1158, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-12 12:10:22', 0);
INSERT INTO `sys_log` VALUES (1159, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-12 12:10:22', 0);
INSERT INTO `sys_log` VALUES (1160, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 54, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-12 12:20:36', 0);
INSERT INTO `sys_log` VALUES (1161, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 4, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-12 12:20:36', 0);
INSERT INTO `sys_log` VALUES (1162, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 52, 'MicroMessenger', '8.0.5', 'iPhone', NULL, '2025-09-12 12:23:14', 0);
INSERT INTO `sys_log` VALUES (1163, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'MicroMessenger', '8.0.5', 'iPhone', 4, '2025-09-12 12:23:14', 0);
INSERT INTO `sys_log` VALUES (1164, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '172.18.0.1', '0', '内网IP', 56, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-12 14:03:05', 0);
INSERT INTO `sys_log` VALUES (1165, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '172.18.0.1', '0', '内网IP', 3, 'Chrome', '139.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-12 14:03:05', 0);
INSERT INTO `sys_log` VALUES (1166, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 718, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-26 18:15:06', 0);
INSERT INTO `sys_log` VALUES (1167, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 11, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:15:06', 0);
INSERT INTO `sys_log` VALUES (1168, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 52, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:15:13', 0);
INSERT INTO `sys_log` VALUES (1169, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":4,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 8, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:15:16', 0);
INSERT INTO `sys_log` VALUES (1170, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":3,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 8, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:15:18', 0);
INSERT INTO `sys_log` VALUES (1171, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":2,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:15:21', 0);
INSERT INTO `sys_log` VALUES (1172, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:15:24', 0);
INSERT INTO `sys_log` VALUES (1173, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:16:03', 0);
INSERT INTO `sys_log` VALUES (1174, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":2,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:16:07', 0);
INSERT INTO `sys_log` VALUES (1175, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":3,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:16:09', 0);
INSERT INTO `sys_log` VALUES (1176, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":4,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:16:11', 0);
INSERT INTO `sys_log` VALUES (1177, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-26 18:16:12', 0);
INSERT INTO `sys_log` VALUES (1178, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 705, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-27 14:02:41', 0);
INSERT INTO `sys_log` VALUES (1179, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 15, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 14:02:41', 0);
INSERT INTO `sys_log` VALUES (1180, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 464, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-27 14:48:30', 0);
INSERT INTO `sys_log` VALUES (1181, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 11, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 14:48:30', 0);
INSERT INTO `sys_log` VALUES (1182, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 27, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 14:48:34', 0);
INSERT INTO `sys_log` VALUES (1183, 'OTHER', 'POST', '{\"tableName\":\"aioveu_member_level\",\"businessName\":\"会员等级\",\"moduleName\":\"aioveuMemberLevel\",\"packageName\":\"com.aioveu.boot\",\"entityName\":\"AioveuMemberLevel\",\"author\":\"可我不敌可爱\",\"fieldConfigs\":[{\"columnName\":\"id\",\"columnType\":\"bigint\",\"fieldName\":\"id\",\"fieldSort\":1,\"fieldType\":\"Long\",\"fieldComment\":\"会员等级ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":0,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"level_name\",\"columnType\":\"varchar\",\"fieldName\":\"levelName\",\"fieldSort\":2,\"fieldType\":\"String\",\"fieldComment\":\"等级名称\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":20,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"min_amount\",\"columnType\":\"decimal\",\"fieldName\":\"minAmount\",\"fieldSort\":3,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"最低消费额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"discount\",\"columnType\":\"decimal\",\"fieldName\":\"discount\",\"fieldSort\":4,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"折扣率\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"benefits\",\"columnType\":\"text\",\"fieldName\":\"benefits\",\"fieldSort\":5,\"fieldType\":\"String\",\"fieldComment\":\"权益描述\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"maxLength\":65535,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"status\",\"columnType\":\"tinyint\",\"fieldName\":\"status\",\"fieldSort\":6,\"fieldType\":\"Integer\",\"fieldComment\":\"状态(0-禁用 1-启用)\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"fieldName\":\"createTime\",\"fieldSort\":7,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"创建时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":1,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"fieldName\":\"updateTime\",\"fieldSort\":8,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"更新时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"}],\"backendAppName\":\"aioveu-boot\",\"frontendAppName\":\"vue3-element-admin\"}', NULL, '生成代码', '/api/v1/codegen/aioveu_member_level/config', NULL, '169.254.175.185', '0', '内网IP', 406, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 14:51:47', 0);
INSERT INTO `sys_log` VALUES (1184, 'OTHER', 'GET', 'aioveu_member_level', NULL, '预览生成代码', '/api/v1/codegen/aioveu_member_level/preview', NULL, '169.254.175.185', '0', '内网IP', 219, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 14:51:47', 0);
INSERT INTO `sys_log` VALUES (1185, 'OTHER', 'GET', 'aioveu_member_level', NULL, '下载代码', '/api/v1/codegen/aioveu_member_level/download', NULL, '169.254.175.185', '0', '内网IP', 42, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 14:52:08', 0);
INSERT INTO `sys_log` VALUES (1186, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 28, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 14:58:54', 0);
INSERT INTO `sys_log` VALUES (1187, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 14:59:30', 0);
INSERT INTO `sys_log` VALUES (1188, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 21, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 14:59:35', 0);
INSERT INTO `sys_log` VALUES (1189, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 10, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:00:35', 0);
INSERT INTO `sys_log` VALUES (1190, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:02:32', 0);
INSERT INTO `sys_log` VALUES (1191, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:02:35', 0);
INSERT INTO `sys_log` VALUES (1192, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:02:43', 0);
INSERT INTO `sys_log` VALUES (1193, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:02:45', 0);
INSERT INTO `sys_log` VALUES (1194, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 118, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-27 15:02:49', 0);
INSERT INTO `sys_log` VALUES (1195, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:02:49', 0);
INSERT INTO `sys_log` VALUES (1196, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:02:49', 0);
INSERT INTO `sys_log` VALUES (1197, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:03:08', 0);
INSERT INTO `sys_log` VALUES (1198, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:07:40', 0);
INSERT INTO `sys_log` VALUES (1199, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:08:01', 0);
INSERT INTO `sys_log` VALUES (1200, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 8, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:09:02', 0);
INSERT INTO `sys_log` VALUES (1201, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:09:18', 0);
INSERT INTO `sys_log` VALUES (1202, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:09:28', 0);
INSERT INTO `sys_log` VALUES (1203, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:09:31', 0);
INSERT INTO `sys_log` VALUES (1204, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 58, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-27 15:09:38', 0);
INSERT INTO `sys_log` VALUES (1205, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 2, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:09:39', 0);
INSERT INTO `sys_log` VALUES (1206, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:09:39', 0);
INSERT INTO `sys_log` VALUES (1207, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 14, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:11:46', 0);
INSERT INTO `sys_log` VALUES (1208, 'OTHER', 'POST', '{\"tableName\":\"aioveu_member\",\"businessName\":\"会员信息\",\"moduleName\":\"aioveuMember\",\"packageName\":\"com.aioveu.boot\",\"entityName\":\"AioveuMember\",\"author\":\"可我不敌可爱\",\"parentMenuId\":250,\"fieldConfigs\":[{\"columnName\":\"id\",\"columnType\":\"bigint\",\"fieldName\":\"id\",\"fieldSort\":1,\"fieldType\":\"Long\",\"fieldComment\":\"会员ID\",\"isShowInList\":0,\"isShowInForm\":0,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"member_no\",\"columnType\":\"varchar\",\"fieldName\":\"memberNo\",\"fieldSort\":2,\"fieldType\":\"String\",\"fieldComment\":\"会员卡号\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":20,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"name\",\"columnType\":\"varchar\",\"fieldName\":\"name\",\"fieldSort\":3,\"fieldType\":\"String\",\"fieldComment\":\"会员姓名\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":50,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"phone\",\"columnType\":\"varchar\",\"fieldName\":\"phone\",\"fieldSort\":4,\"fieldType\":\"String\",\"fieldComment\":\"手机号\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":20,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"id_card\",\"columnType\":\"varchar\",\"fieldName\":\"idCard\",\"fieldSort\":5,\"fieldType\":\"String\",\"fieldComment\":\"身份证号\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"maxLength\":30,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"level_id\",\"columnType\":\"bigint\",\"fieldName\":\"levelId\",\"fieldSort\":6,\"fieldType\":\"Long\",\"fieldComment\":\"会员等级ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"join_date\",\"columnType\":\"datetime\",\"fieldName\":\"joinDate\",\"fieldSort\":7,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"入会时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"total_consumption\",\"columnType\":\"decimal\",\"fieldName\":\"totalConsumption\",\"fieldSort\":8,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"累计消费金额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"last_visit\",\"columnType\":\"datetime\",\"fieldName\":\"lastVisit\",\"fieldSort\":9,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"最后到店时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"status\",\"columnType\":\"tinyint\",\"fieldName\":\"status\",\"fieldSort\":10,\"fieldType\":\"Integer\",\"fieldComment\":\"状态(0-禁用 1-正常)\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"fieldName\":\"createTime\",\"fieldSort\":11,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"创建时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":1,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"fieldName\":\"updateTime\",\"fieldSort\":12,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"更新时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"}],\"backendAppName\":\"aioveu-boot\",\"frontendAppName\":\"vue3-element-admin\"}', NULL, '生成代码', '/api/v1/codegen/aioveu_member/config', NULL, '169.254.175.185', '0', '内网IP', 782, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:14:02', 0);
INSERT INTO `sys_log` VALUES (1209, 'OTHER', 'GET', 'aioveu_member', NULL, '预览生成代码', '/api/v1/codegen/aioveu_member/preview', NULL, '169.254.175.185', '0', '内网IP', 96, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:14:02', 0);
INSERT INTO `sys_log` VALUES (1210, 'OTHER', 'GET', 'aioveu_member', NULL, '下载代码', '/api/v1/codegen/aioveu_member/download', NULL, '169.254.175.185', '0', '内网IP', 38, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:14:05', 0);
INSERT INTO `sys_log` VALUES (1211, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 18, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:18:11', 0);
INSERT INTO `sys_log` VALUES (1212, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 21, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:28:23', 0);
INSERT INTO `sys_log` VALUES (1213, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:28:42', 0);
INSERT INTO `sys_log` VALUES (1214, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:28:49', 0);
INSERT INTO `sys_log` VALUES (1215, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 0, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:28:51', 0);
INSERT INTO `sys_log` VALUES (1216, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 120, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-27 15:28:54', 0);
INSERT INTO `sys_log` VALUES (1217, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:28:55', 0);
INSERT INTO `sys_log` VALUES (1218, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 57, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:28:56', 0);
INSERT INTO `sys_log` VALUES (1219, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:28:56', 0);
INSERT INTO `sys_log` VALUES (1220, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 59, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:29:00', 0);
INSERT INTO `sys_log` VALUES (1221, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:29:00', 0);
INSERT INTO `sys_log` VALUES (1222, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 59, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:29:01', 0);
INSERT INTO `sys_log` VALUES (1223, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:29:02', 0);
INSERT INTO `sys_log` VALUES (1224, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:29:03', 0);
INSERT INTO `sys_log` VALUES (1225, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 14, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:29:23', 0);
INSERT INTO `sys_log` VALUES (1226, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 11, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:33:51', 0);
INSERT INTO `sys_log` VALUES (1227, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:37:00', 0);
INSERT INTO `sys_log` VALUES (1228, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 119, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-27 15:37:03', 0);
INSERT INTO `sys_log` VALUES (1229, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:37:03', 0);
INSERT INTO `sys_log` VALUES (1230, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 58, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:37:06', 0);
INSERT INTO `sys_log` VALUES (1231, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:37:06', 0);
INSERT INTO `sys_log` VALUES (1232, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 58, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:37:06', 0);
INSERT INTO `sys_log` VALUES (1233, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:37:06', 0);
INSERT INTO `sys_log` VALUES (1234, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:53:21', 0);
INSERT INTO `sys_log` VALUES (1235, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 8, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:53:26', 0);
INSERT INTO `sys_log` VALUES (1236, 'OTHER', 'POST', '{\"tableName\":\"aioveu_member\",\"businessName\":\"会员信息管理\",\"moduleName\":\"aioveuMember\",\"packageName\":\"com.aioveu.boot\",\"entityName\":\"AioveuMember\",\"author\":\"可我不敌可爱\",\"parentMenuId\":250,\"fieldConfigs\":[{\"columnName\":\"id\",\"columnType\":\"bigint\",\"fieldName\":\"id\",\"fieldSort\":1,\"fieldType\":\"Long\",\"fieldComment\":\"会员ID\",\"isShowInList\":1,\"isShowInForm\":0,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"member_no\",\"columnType\":\"varchar\",\"fieldName\":\"memberNo\",\"fieldSort\":2,\"fieldType\":\"String\",\"fieldComment\":\"会员卡号\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":20,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"name\",\"columnType\":\"varchar\",\"fieldName\":\"name\",\"fieldSort\":3,\"fieldType\":\"String\",\"fieldComment\":\"会员姓名\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":50,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"phone\",\"columnType\":\"varchar\",\"fieldName\":\"phone\",\"fieldSort\":4,\"fieldType\":\"String\",\"fieldComment\":\"手机号\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":20,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"id_card\",\"columnType\":\"varchar\",\"fieldName\":\"idCard\",\"fieldSort\":5,\"fieldType\":\"String\",\"fieldComment\":\"身份证号\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"maxLength\":30,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"level_id\",\"columnType\":\"bigint\",\"fieldName\":\"levelId\",\"fieldSort\":6,\"fieldType\":\"Long\",\"fieldComment\":\"会员等级\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"join_date\",\"columnType\":\"datetime\",\"fieldName\":\"joinDate\",\"fieldSort\":7,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"入会时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"total_consumption\",\"columnType\":\"decimal\",\"fieldName\":\"totalConsumption\",\"fieldSort\":8,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"累计消费金额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"last_visit\",\"columnType\":\"datetime\",\"fieldName\":\"lastVisit\",\"fieldSort\":9,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"最后到店时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"status\",\"columnType\":\"tinyint\",\"fieldName\":\"status\",\"fieldSort\":10,\"fieldType\":\"Integer\",\"fieldComment\":\"状态\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":0,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"fieldName\":\"createTime\",\"fieldSort\":11,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"创建时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"fieldName\":\"updateTime\",\"fieldSort\":12,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"更新时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"}],\"backendAppName\":\"aioveu-boot\",\"frontendAppName\":\"vue3-element-admin\"}', NULL, '生成代码', '/api/v1/codegen/aioveu_member/config', NULL, '169.254.175.185', '0', '内网IP', 143, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:55:44', 0);
INSERT INTO `sys_log` VALUES (1237, 'OTHER', 'GET', 'aioveu_member', NULL, '预览生成代码', '/api/v1/codegen/aioveu_member/preview', NULL, '169.254.175.185', '0', '内网IP', 101, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:55:44', 0);
INSERT INTO `sys_log` VALUES (1238, 'OTHER', 'GET', 'aioveu_member', NULL, '下载代码', '/api/v1/codegen/aioveu_member/download', NULL, '169.254.175.185', '0', '内网IP', 39, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:55:46', 0);
INSERT INTO `sys_log` VALUES (1239, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:57:25', 0);
INSERT INTO `sys_log` VALUES (1240, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:57:34', 0);
INSERT INTO `sys_log` VALUES (1241, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 29, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:58:17', 0);
INSERT INTO `sys_log` VALUES (1242, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 15, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:58:23', 0);
INSERT INTO `sys_log` VALUES (1243, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-27 15:58:33', 0);
INSERT INTO `sys_log` VALUES (1244, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 691, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-30 17:00:13', 0);
INSERT INTO `sys_log` VALUES (1245, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:00:14', 0);
INSERT INTO `sys_log` VALUES (1246, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 662, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:00:26', 0);
INSERT INTO `sys_log` VALUES (1247, 'OTHER', 'POST', '{\"tableName\":\"aioveu_member_account\",\"businessName\":\"会员充值账户\",\"moduleName\":\"aioveuMemberAccount\",\"packageName\":\"com.aioveu.boot\",\"entityName\":\"AioveuMemberAccount\",\"author\":\"可我不敌可爱\",\"parentMenuId\":250,\"fieldConfigs\":[{\"columnName\":\"id\",\"columnType\":\"bigint\",\"fieldName\":\"id\",\"fieldSort\":1,\"fieldType\":\"Long\",\"fieldComment\":\"账户ID\",\"isShowInList\":1,\"isShowInForm\":0,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"member_id\",\"columnType\":\"bigint\",\"fieldName\":\"memberId\",\"fieldSort\":2,\"fieldType\":\"Long\",\"fieldComment\":\"会员ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"cash_balance\",\"columnType\":\"decimal\",\"fieldName\":\"cashBalance\",\"fieldSort\":3,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"现金余额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"gift_balance\",\"columnType\":\"decimal\",\"fieldName\":\"giftBalance\",\"fieldSort\":4,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"赠送余额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"total_balance\",\"columnType\":\"decimal\",\"fieldName\":\"totalBalance\",\"fieldSort\":5,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"总余额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"last_recharge_time\",\"columnType\":\"datetime\",\"fieldName\":\"lastRechargeTime\",\"fieldSort\":6,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"最后充值时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"status\",\"columnType\":\"tinyint\",\"fieldName\":\"status\",\"fieldSort\":7,\"fieldType\":\"Integer\",\"fieldComment\":\"账户状态(0-冻结 1-正常)\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"fieldName\":\"createTime\",\"fieldSort\":8,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"创建时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":1,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"fieldName\":\"updateTime\",\"fieldSort\":9,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"更新时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"}],\"backendAppName\":\"aioveu-boot\",\"frontendAppName\":\"vue3-element-admin\"}', NULL, '生成代码', '/api/v1/codegen/aioveu_member_account/config', NULL, '169.254.175.185', '0', '内网IP', 1171, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:02:13', 0);
INSERT INTO `sys_log` VALUES (1248, 'OTHER', 'GET', 'aioveu_member_account', NULL, '预览生成代码', '/api/v1/codegen/aioveu_member_account/preview', NULL, '169.254.175.185', '0', '内网IP', 243, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:02:13', 0);
INSERT INTO `sys_log` VALUES (1249, 'OTHER', 'GET', 'aioveu_member_account', NULL, '下载代码', '/api/v1/codegen/aioveu_member_account/download', NULL, '169.254.175.185', '0', '内网IP', 40, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:02:16', 0);
INSERT INTO `sys_log` VALUES (1250, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:04:30', 0);
INSERT INTO `sys_log` VALUES (1251, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 11, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:04:37', 0);
INSERT INTO `sys_log` VALUES (1252, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:04:44', 0);
INSERT INTO `sys_log` VALUES (1253, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:04:51', 0);
INSERT INTO `sys_log` VALUES (1254, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:04:54', 0);
INSERT INTO `sys_log` VALUES (1255, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 58, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-30 17:04:58', 0);
INSERT INTO `sys_log` VALUES (1256, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:04:58', 0);
INSERT INTO `sys_log` VALUES (1257, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:04:58', 0);
INSERT INTO `sys_log` VALUES (1258, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:05:16', 0);
INSERT INTO `sys_log` VALUES (1259, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 14, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:06:14', 0);
INSERT INTO `sys_log` VALUES (1260, 'OTHER', 'POST', '{\"tableName\":\"aioveu_member_recharge_record\",\"businessName\":\"会员充值记录\",\"moduleName\":\"aioveuMemberRechargeRecord\",\"packageName\":\"com.aioveu.boot\",\"entityName\":\"AioveuMemberRechargeRecord\",\"author\":\"可我不敌可爱\",\"parentMenuId\":250,\"fieldConfigs\":[{\"columnName\":\"id\",\"columnType\":\"bigint\",\"fieldName\":\"id\",\"fieldSort\":1,\"fieldType\":\"Long\",\"fieldComment\":\"充值记录ID\",\"isShowInList\":1,\"isShowInForm\":0,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"recharge_no\",\"columnType\":\"varchar\",\"fieldName\":\"rechargeNo\",\"fieldSort\":2,\"fieldType\":\"String\",\"fieldComment\":\"充值单号\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":30,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"member_id\",\"columnType\":\"bigint\",\"fieldName\":\"memberId\",\"fieldSort\":3,\"fieldType\":\"Long\",\"fieldComment\":\"会员ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"amount\",\"columnType\":\"decimal\",\"fieldName\":\"amount\",\"fieldSort\":4,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"充值金额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"gift_amount\",\"columnType\":\"decimal\",\"fieldName\":\"giftAmount\",\"fieldSort\":5,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"赠送金额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"payment_type\",\"columnType\":\"tinyint\",\"fieldName\":\"paymentType\",\"fieldSort\":6,\"fieldType\":\"Integer\",\"fieldComment\":\"支付方式 1-wechat,2-alipay,3-cash,4-card,5-bank\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"recharge_time\",\"columnType\":\"datetime\",\"fieldName\":\"rechargeTime\",\"fieldSort\":7,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"充值时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"operator_id\",\"columnType\":\"bigint\",\"fieldName\":\"operatorId\",\"fieldSort\":8,\"fieldType\":\"Long\",\"fieldComment\":\"操作员ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"status\",\"columnType\":\"tinyint\",\"fieldName\":\"status\",\"fieldSort\":9,\"fieldType\":\"Integer\",\"fieldComment\":\"状态1-pending待定,2-success成功,3-failed失败\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"remark\",\"columnType\":\"varchar\",\"fieldName\":\"remark\",\"fieldSort\":10,\"fieldType\":\"String\",\"fieldComment\":\"备注\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"maxLength\":255,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"fieldName\":\"createTime\",\"fieldSort\":11,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"创建时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":1,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"fieldName\":\"updateTime\",\"fieldSort\":12,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"更新时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"}],\"backendAppName\":\"aioveu-boot\",\"frontendAppName\":\"vue3-element-admin\"}', NULL, '生成代码', '/api/v1/codegen/aioveu_member_recharge_record/config', NULL, '169.254.175.185', '0', '内网IP', 1880, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:08:14', 0);
INSERT INTO `sys_log` VALUES (1261, 'OTHER', 'GET', 'aioveu_member_recharge_record', NULL, '预览生成代码', '/api/v1/codegen/aioveu_member_recharge_record/preview', NULL, '169.254.175.185', '0', '内网IP', 128, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:08:14', 0);
INSERT INTO `sys_log` VALUES (1262, 'OTHER', 'GET', 'aioveu_member_recharge_record', NULL, '下载代码', '/api/v1/codegen/aioveu_member_recharge_record/download', NULL, '169.254.175.185', '0', '内网IP', 42, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:08:17', 0);
INSERT INTO `sys_log` VALUES (1263, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 17, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:10:06', 0);
INSERT INTO `sys_log` VALUES (1264, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 24, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:10:10', 0);
INSERT INTO `sys_log` VALUES (1265, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 8, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:10:19', 0);
INSERT INTO `sys_log` VALUES (1266, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:10:26', 0);
INSERT INTO `sys_log` VALUES (1267, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:10:28', 0);
INSERT INTO `sys_log` VALUES (1268, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 118, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-30 17:10:31', 0);
INSERT INTO `sys_log` VALUES (1269, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:10:31', 0);
INSERT INTO `sys_log` VALUES (1270, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:10:32', 0);
INSERT INTO `sys_log` VALUES (1271, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:39:56', 0);
INSERT INTO `sys_log` VALUES (1272, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:40:23', 0);
INSERT INTO `sys_log` VALUES (1273, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 8, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:41:15', 0);
INSERT INTO `sys_log` VALUES (1274, 'OTHER', 'POST', '{\"tableName\":\"aioveu_laundry_order\",\"businessName\":\"洗衣订单\",\"moduleName\":\"aioveuLaundryOrder\",\"packageName\":\"com.aioveu.boot\",\"entityName\":\"AioveuLaundryOrder\",\"author\":\"可我不敌可爱\",\"parentMenuId\":271,\"fieldConfigs\":[{\"columnName\":\"id\",\"columnType\":\"bigint\",\"fieldName\":\"id\",\"fieldSort\":1,\"fieldType\":\"Long\",\"fieldComment\":\"订单ID\",\"isShowInList\":1,\"isShowInForm\":0,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"order_no\",\"columnType\":\"varchar\",\"fieldName\":\"orderNo\",\"fieldSort\":2,\"fieldType\":\"String\",\"fieldComment\":\"订单号\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":30,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"member_id\",\"columnType\":\"bigint\",\"fieldName\":\"memberId\",\"fieldSort\":3,\"fieldType\":\"Long\",\"fieldComment\":\"会员ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"customer_name\",\"columnType\":\"varchar\",\"fieldName\":\"customerName\",\"fieldSort\":4,\"fieldType\":\"String\",\"fieldComment\":\"客户姓名\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":0,\"maxLength\":50,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"customer_phone\",\"columnType\":\"varchar\",\"fieldName\":\"customerPhone\",\"fieldSort\":5,\"fieldType\":\"String\",\"fieldComment\":\"客户电话\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"maxLength\":20,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"status\",\"columnType\":\"tinyint\",\"fieldName\":\"status\",\"fieldSort\":6,\"fieldType\":\"Integer\",\"fieldComment\":\"订单状态 0创建,1接收,2洗衣,3干燥,4熨烫,5质量检查,6完成,7运送,8取消\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"total_amount\",\"columnType\":\"decimal\",\"fieldName\":\"totalAmount\",\"fieldSort\":7,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"订单总额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"discount_amount\",\"columnType\":\"decimal\",\"fieldName\":\"discountAmount\",\"fieldSort\":8,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"折扣金额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"actual_amount\",\"columnType\":\"decimal\",\"fieldName\":\"actualAmount\",\"fieldSort\":9,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"实付金额\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"payment_status\",\"columnType\":\"tinyint\",\"fieldName\":\"paymentStatus\",\"fieldSort\":10,\"fieldType\":\"Integer\",\"fieldComment\":\"支付状态 1-未支付-unpaid,2-部分支付-partial,3-已支付-paid,4-未支付-refunded\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"payment_method_id\",\"columnType\":\"tinyint\",\"fieldName\":\"paymentMethodId\",\"fieldSort\":11,\"fieldType\":\"Integer\",\"fieldComment\":\"支付方式ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"fieldName\":\"createTime\",\"fieldSort\":12,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"创建时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":1,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"receive_time\",\"columnType\":\"datetime\",\"fieldName\":\"receiveTime\",\"fieldSort\":13,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"收衣时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"finish_time\",\"columnType\":\"datetime\",\"fieldName\":\"finishTime\",\"fieldSort\":14,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"完成时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"delivery_time\",\"columnType\":\"datetime\",\"fieldName\":\"deliveryTime\",\"fieldSort\":15,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"交付时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"fieldName\":\"updateTime\",\"fieldSort\":16,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"更新时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"remark\",\"columnType\":\"varchar\",\"fieldName\":\"remark\",\"fieldSort\":17,\"fieldType\":\"String\",\"fieldComment\":\"备注\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"maxLength\":255,\"formType\":\"INPUT\",\"queryType\":\"EQ\"}],\"backendAppName\":\"aioveu-boot\",\"frontendAppName\":\"vue3-element-admin\"}', NULL, '生成代码', '/api/v1/codegen/aioveu_laundry_order/config', NULL, '169.254.175.185', '0', '内网IP', 1221, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:43:30', 0);
INSERT INTO `sys_log` VALUES (1275, 'OTHER', 'GET', 'aioveu_laundry_order', NULL, '预览生成代码', '/api/v1/codegen/aioveu_laundry_order/preview', NULL, '169.254.175.185', '0', '内网IP', 109, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:43:30', 0);
INSERT INTO `sys_log` VALUES (1276, 'OTHER', 'GET', 'aioveu_laundry_order', NULL, '下载代码', '/api/v1/codegen/aioveu_laundry_order/download', NULL, '169.254.175.185', '0', '内网IP', 36, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:43:33', 0);
INSERT INTO `sys_log` VALUES (1277, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:45:13', 0);
INSERT INTO `sys_log` VALUES (1278, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 28, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:45:34', 0);
INSERT INTO `sys_log` VALUES (1279, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:46:10', 0);
INSERT INTO `sys_log` VALUES (1280, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:46:18', 0);
INSERT INTO `sys_log` VALUES (1281, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:46:21', 0);
INSERT INTO `sys_log` VALUES (1282, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 122, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-30 17:46:25', 0);
INSERT INTO `sys_log` VALUES (1283, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:46:25', 0);
INSERT INTO `sys_log` VALUES (1284, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:46:25', 0);
INSERT INTO `sys_log` VALUES (1285, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 11, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:46:47', 0);
INSERT INTO `sys_log` VALUES (1286, 'OTHER', 'POST', '{\"tableName\":\"aioveu_laundry_clothing_type\",\"businessName\":\"衣物类型\",\"moduleName\":\"aioveuLaundryClothingType\",\"packageName\":\"com.aioveu.boot\",\"entityName\":\"AioveuLaundryClothingType\",\"author\":\"可我不敌可爱\",\"parentMenuId\":271,\"fieldConfigs\":[{\"columnName\":\"id\",\"columnType\":\"bigint\",\"fieldName\":\"id\",\"fieldSort\":1,\"fieldType\":\"Long\",\"fieldComment\":\"衣物类型ID\",\"isShowInList\":1,\"isShowInForm\":0,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"type_code\",\"columnType\":\"varchar\",\"fieldName\":\"typeCode\",\"fieldSort\":2,\"fieldType\":\"String\",\"fieldComment\":\"类型代码\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":20,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"type_name\",\"columnType\":\"varchar\",\"fieldName\":\"typeName\",\"fieldSort\":3,\"fieldType\":\"String\",\"fieldComment\":\"类型名称\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"maxLength\":50,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"category\",\"columnType\":\"tinyint\",\"fieldName\":\"category\",\"fieldSort\":4,\"fieldType\":\"Integer\",\"fieldComment\":\"衣物类别,0-上装-top,1-下装-bottom,2-外套-outerwear,3-内衣-underwear,4-配饰-accessories,5-家居用品-home,6-特殊衣物-special\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"base_price\",\"columnType\":\"decimal\",\"fieldName\":\"basePrice\",\"fieldSort\":5,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"基础价格\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"processing_time\",\"columnType\":\"smallint\",\"fieldName\":\"processingTime\",\"fieldSort\":6,\"fieldType\":\"Integer\",\"fieldComment\":\"标准处理时间(分钟)\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"special_requirements\",\"columnType\":\"text\",\"fieldName\":\"specialRequirements\",\"fieldSort\":7,\"fieldType\":\"String\",\"fieldComment\":\"特殊处理要求\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":0,\"maxLength\":65535,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"is_delicate\",\"columnType\":\"tinyint\",\"fieldName\":\"isDelicate\",\"fieldSort\":8,\"fieldType\":\"Integer\",\"fieldComment\":\"是否精细衣物\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"status\",\"columnType\":\"tinyint\",\"fieldName\":\"status\",\"fieldSort\":9,\"fieldType\":\"Integer\",\"fieldComment\":\"状态(0-停用 1-启用)\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"fieldName\":\"createTime\",\"fieldSort\":10,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"创建时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":1,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"fieldName\":\"updateTime\",\"fieldSort\":11,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"更新时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"}],\"backendAppName\":\"aioveu-boot\",\"frontendAppName\":\"vue3-element-admin\"}', NULL, '生成代码', '/api/v1/codegen/aioveu_laundry_clothing_type/config', NULL, '169.254.175.185', '0', '内网IP', 842, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:48:48', 0);
INSERT INTO `sys_log` VALUES (1287, 'OTHER', 'GET', 'aioveu_laundry_clothing_type', NULL, '预览生成代码', '/api/v1/codegen/aioveu_laundry_clothing_type/preview', NULL, '169.254.175.185', '0', '内网IP', 102, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:48:48', 0);
INSERT INTO `sys_log` VALUES (1288, 'OTHER', 'GET', 'aioveu_laundry_clothing_type', NULL, '下载代码', '/api/v1/codegen/aioveu_laundry_clothing_type/download', NULL, '169.254.175.185', '0', '内网IP', 36, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:48:51', 0);
INSERT INTO `sys_log` VALUES (1289, 'OTHER', 'GET', 'aioveu_laundry_clothing_type', NULL, '下载代码', '/api/v1/codegen/aioveu_laundry_clothing_type/download', NULL, '169.254.175.185', '0', '内网IP', 36, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:50:20', 0);
INSERT INTO `sys_log` VALUES (1290, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 8, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:52:23', 0);
INSERT INTO `sys_log` VALUES (1291, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 36, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:52:42', 0);
INSERT INTO `sys_log` VALUES (1292, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 28, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:52:48', 0);
INSERT INTO `sys_log` VALUES (1293, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:52:49', 0);
INSERT INTO `sys_log` VALUES (1294, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:52:56', 0);
INSERT INTO `sys_log` VALUES (1295, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 2, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:53:01', 0);
INSERT INTO `sys_log` VALUES (1296, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 121, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-30 17:53:07', 0);
INSERT INTO `sys_log` VALUES (1297, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:53:07', 0);
INSERT INTO `sys_log` VALUES (1298, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:53:08', 0);
INSERT INTO `sys_log` VALUES (1299, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:53:45', 0);
INSERT INTO `sys_log` VALUES (1300, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:54:09', 0);
INSERT INTO `sys_log` VALUES (1301, 'OTHER', 'POST', '{\"tableName\":\"aioveu_laundry_order_item\",\"businessName\":\"洗衣订单衣物明细\",\"moduleName\":\"aioveuLaundryOrderItem\",\"packageName\":\"com.aioveu.boot\",\"entityName\":\"AioveuLaundryOrderItem\",\"author\":\"可我不敌可爱\",\"parentMenuId\":271,\"fieldConfigs\":[{\"columnName\":\"id\",\"columnType\":\"bigint\",\"fieldName\":\"id\",\"fieldSort\":1,\"fieldType\":\"Long\",\"fieldComment\":\"衣物明细ID\",\"isShowInList\":1,\"isShowInForm\":0,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"order_id\",\"columnType\":\"bigint\",\"fieldName\":\"orderId\",\"fieldSort\":2,\"fieldType\":\"Long\",\"fieldComment\":\"订单ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"clothing_type_id\",\"columnType\":\"bigint\",\"fieldName\":\"clothingTypeId\",\"fieldSort\":3,\"fieldType\":\"Long\",\"fieldComment\":\"衣物类型ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"custom_type\",\"columnType\":\"varchar\",\"fieldName\":\"customType\",\"fieldSort\":4,\"fieldType\":\"String\",\"fieldComment\":\"自定义衣物类型\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":0,\"maxLength\":50,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"problem_desc\",\"columnType\":\"text\",\"fieldName\":\"problemDesc\",\"fieldSort\":5,\"fieldType\":\"String\",\"fieldComment\":\"问题描述\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"maxLength\":65535,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"price\",\"columnType\":\"decimal\",\"fieldName\":\"price\",\"fieldSort\":6,\"fieldType\":\"BigDecimal\",\"fieldComment\":\"价格\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"process_status\",\"columnType\":\"tinyint\",\"fieldName\":\"processStatus\",\"fieldSort\":7,\"fieldType\":\"Integer\",\"fieldComment\":\"处理状态 1-待处理-pending,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-质检中-quality_check,6-已完成-finished,7-问题衣物-problem\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"special_instruction\",\"columnType\":\"varchar\",\"fieldName\":\"specialInstruction\",\"fieldSort\":8,\"fieldType\":\"String\",\"fieldComment\":\"特殊要求\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":0,\"maxLength\":255,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"fieldName\":\"startTime\",\"fieldSort\":9,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"开始处理时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"fieldName\":\"endTime\",\"fieldSort\":10,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"完成处理时间\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"fieldName\":\"createTime\",\"fieldSort\":11,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"创建时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":1,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"fieldName\":\"updateTime\",\"fieldSort\":12,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"更新时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"}],\"backendAppName\":\"aioveu-boot\",\"frontendAppName\":\"vue3-element-admin\"}', NULL, '生成代码', '/api/v1/codegen/aioveu_laundry_order_item/config', NULL, '169.254.175.185', '0', '内网IP', 1171, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:55:21', 0);
INSERT INTO `sys_log` VALUES (1302, 'OTHER', 'GET', 'aioveu_laundry_order_item', NULL, '预览生成代码', '/api/v1/codegen/aioveu_laundry_order_item/preview', NULL, '169.254.175.185', '0', '内网IP', 100, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:55:21', 0);
INSERT INTO `sys_log` VALUES (1303, 'OTHER', 'GET', 'aioveu_laundry_order_item', NULL, '下载代码', '/api/v1/codegen/aioveu_laundry_order_item/download', NULL, '169.254.175.185', '0', '内网IP', 40, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:55:23', 0);
INSERT INTO `sys_log` VALUES (1304, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:56:53', 0);
INSERT INTO `sys_log` VALUES (1305, 'OTHER', 'POST', '{\"tableName\":\"aioveu_laundry_process_image\",\"businessName\":\"洗衣流程图片记录\",\"moduleName\":\"aioveuLaundryProcessImage\",\"packageName\":\"com.aioveu.boot\",\"entityName\":\"AioveuLaundryProcessImage\",\"author\":\"可我不敌可爱\",\"parentMenuId\":271,\"fieldConfigs\":[{\"columnName\":\"id\",\"columnType\":\"bigint\",\"fieldName\":\"id\",\"fieldSort\":1,\"fieldType\":\"Long\",\"fieldComment\":\"图片记录ID\",\"isShowInList\":1,\"isShowInForm\":0,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"order_id\",\"columnType\":\"bigint\",\"fieldName\":\"orderId\",\"fieldSort\":2,\"fieldType\":\"Long\",\"fieldComment\":\"订单ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"item_id\",\"columnType\":\"bigint\",\"fieldName\":\"itemId\",\"fieldSort\":3,\"fieldType\":\"Long\",\"fieldComment\":\"衣物明细ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":0,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"image_type\",\"columnType\":\"tinyint\",\"fieldName\":\"imageType\",\"fieldSort\":4,\"fieldType\":\"Integer\",\"fieldComment\":\"图片类型 1-收衣时-receive,2-洗涤中-washing,3-烘干中-drying,4-熨烫中-ironing,5-完成时-finish,6-问题衣物-problem,7-质检时-quality_check,8-交付时-delivery\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":1,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"image_url\",\"columnType\":\"varchar\",\"fieldName\":\"imageUrl\",\"fieldSort\":5,\"fieldType\":\"String\",\"fieldComment\":\"图片路径\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"maxLength\":255,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"upload_user\",\"columnType\":\"bigint\",\"fieldName\":\"uploadUser\",\"fieldSort\":6,\"fieldType\":\"Long\",\"fieldComment\":\"上传人ID\",\"isShowInList\":1,\"isShowInForm\":1,\"isShowInQuery\":1,\"isRequired\":0,\"formType\":\"INPUT\",\"queryType\":\"LIKE\"},{\"columnName\":\"description\",\"columnType\":\"varchar\",\"fieldName\":\"description\",\"fieldSort\":7,\"fieldType\":\"String\",\"fieldComment\":\"图片描述\",\"isShowInList\":1,\"isShowInForm\":1,\"isRequired\":0,\"maxLength\":255,\"formType\":\"INPUT\",\"queryType\":\"EQ\"},{\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"fieldName\":\"createTime\",\"fieldSort\":8,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"创建时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":1,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"},{\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"fieldName\":\"updateTime\",\"fieldSort\":9,\"fieldType\":\"LocalDateTime\",\"fieldComment\":\"更新时间\",\"isShowInList\":1,\"isShowInForm\":0,\"isRequired\":0,\"formType\":\"DATE_TIME\",\"queryType\":\"EQ\"}],\"backendAppName\":\"aioveu-boot\",\"frontendAppName\":\"vue3-element-admin\"}', NULL, '生成代码', '/api/v1/codegen/aioveu_laundry_process_image/config', NULL, '169.254.175.185', '0', '内网IP', 1367, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:58:40', 0);
INSERT INTO `sys_log` VALUES (1306, 'OTHER', 'GET', 'aioveu_laundry_process_image', NULL, '预览生成代码', '/api/v1/codegen/aioveu_laundry_process_image/preview', NULL, '169.254.175.185', '0', '内网IP', 34, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:58:40', 0);
INSERT INTO `sys_log` VALUES (1307, 'OTHER', 'GET', 'aioveu_laundry_process_image', NULL, '下载代码', '/api/v1/codegen/aioveu_laundry_process_image/download', NULL, '169.254.175.185', '0', '内网IP', 39, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 17:58:48', 0);
INSERT INTO `sys_log` VALUES (1308, 'OTHER', 'GET', '{\"excludeTables\":[\"gen_config\",\"gen_field_config\"],\"pageNum\":1,\"pageSize\":10}', NULL, '代码生成分页列表', '/api/v1/codegen/table/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:01:30', 0);
INSERT INTO `sys_log` VALUES (1309, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 31, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:04:05', 0);
INSERT INTO `sys_log` VALUES (1310, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 15, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:04:11', 0);
INSERT INTO `sys_log` VALUES (1311, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:04:31', 0);
INSERT INTO `sys_log` VALUES (1312, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:04:34', 0);
INSERT INTO `sys_log` VALUES (1313, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 121, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-09-30 18:04:37', 0);
INSERT INTO `sys_log` VALUES (1314, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 8, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:04:37', 0);
INSERT INTO `sys_log` VALUES (1315, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:04:37', 0);
INSERT INTO `sys_log` VALUES (1316, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:10:00', 0);
INSERT INTO `sys_log` VALUES (1317, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:10:55', 0);
INSERT INTO `sys_log` VALUES (1318, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:11:09', 0);
INSERT INTO `sys_log` VALUES (1319, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:11:12', 0);
INSERT INTO `sys_log` VALUES (1320, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:16:22', 0);
INSERT INTO `sys_log` VALUES (1321, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:16:48', 0);
INSERT INTO `sys_log` VALUES (1322, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:18:35', 0);
INSERT INTO `sys_log` VALUES (1323, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:24:07', 0);
INSERT INTO `sys_log` VALUES (1324, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:29:03', 0);
INSERT INTO `sys_log` VALUES (1325, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:31:04', 0);
INSERT INTO `sys_log` VALUES (1326, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:35:04', 0);
INSERT INTO `sys_log` VALUES (1327, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:38:03', 0);
INSERT INTO `sys_log` VALUES (1328, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:45:42', 0);
INSERT INTO `sys_log` VALUES (1329, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:47:36', 0);
INSERT INTO `sys_log` VALUES (1330, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:48:29', 0);
INSERT INTO `sys_log` VALUES (1331, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:53:09', 0);
INSERT INTO `sys_log` VALUES (1332, 'DICT', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '字典分页列表', '/api/v1/dicts/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-09-30 18:58:08', 0);
INSERT INTO `sys_log` VALUES (1333, 'LOGIN', 'POST', 'admin 123456', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 125, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-01 00:29:08', 0);
INSERT INTO `sys_log` VALUES (1334, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 60, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-01 00:29:18', 0);
INSERT INTO `sys_log` VALUES (1335, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 720, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-01 22:38:27', 0);
INSERT INTO `sys_log` VALUES (1336, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-01 22:38:28', 0);
INSERT INTO `sys_log` VALUES (1337, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 736, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-02 14:10:13', 0);
INSERT INTO `sys_log` VALUES (1338, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-02 14:10:13', 0);
INSERT INTO `sys_log` VALUES (1339, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 549, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-03 01:24:50', 0);
INSERT INTO `sys_log` VALUES (1340, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-03 01:24:50', 0);
INSERT INTO `sys_log` VALUES (1341, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-03 01:52:38', 0);
INSERT INTO `sys_log` VALUES (1342, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-03 01:53:08', 0);
INSERT INTO `sys_log` VALUES (1343, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-03 01:53:11', 0);
INSERT INTO `sys_log` VALUES (1344, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-03 01:53:21', 0);
INSERT INTO `sys_log` VALUES (1345, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-03 01:53:25', 0);
INSERT INTO `sys_log` VALUES (1346, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 119, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-03 01:53:29', 0);
INSERT INTO `sys_log` VALUES (1347, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-03 01:53:29', 0);
INSERT INTO `sys_log` VALUES (1348, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-03 01:53:30', 0);
INSERT INTO `sys_log` VALUES (1349, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 57, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-03 02:22:03', 0);
INSERT INTO `sys_log` VALUES (1350, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '140.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-03 02:22:03', 0);
INSERT INTO `sys_log` VALUES (1351, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 663, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-06 13:11:45', 0);
INSERT INTO `sys_log` VALUES (1352, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-06 13:11:45', 0);
INSERT INTO `sys_log` VALUES (1353, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-06 18:21:29', 0);
INSERT INTO `sys_log` VALUES (1354, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 118, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-06 18:21:33', 0);
INSERT INTO `sys_log` VALUES (1355, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-06 18:21:33', 0);
INSERT INTO `sys_log` VALUES (1356, 'LOGIN', 'POST', 'admin 123456', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 471, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-06 18:50:29', 0);
INSERT INTO `sys_log` VALUES (1357, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 467, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-06 18:52:47', 0);
INSERT INTO `sys_log` VALUES (1358, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-06 18:56:47', 0);
INSERT INTO `sys_log` VALUES (1359, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 59, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-06 18:56:51', 0);
INSERT INTO `sys_log` VALUES (1360, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-06 18:56:51', 0);
INSERT INTO `sys_log` VALUES (1361, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 63, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-06 19:21:14', 0);
INSERT INTO `sys_log` VALUES (1362, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-06 19:21:14', 0);
INSERT INTO `sys_log` VALUES (1363, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 125, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-06 23:29:44', 0);
INSERT INTO `sys_log` VALUES (1364, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 777, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-07 18:10:27', 0);
INSERT INTO `sys_log` VALUES (1365, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 12, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 18:10:27', 0);
INSERT INTO `sys_log` VALUES (1366, 'USER', 'GET', '{\"keywords\":\"\",\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 63, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:10:20', 0);
INSERT INTO `sys_log` VALUES (1367, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:10:27', 0);
INSERT INTO `sys_log` VALUES (1368, 'USER', 'GET', '{\"keywords\":\"\",\"createTime\":[],\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '导出用户', '/api/v1/users/export', NULL, '169.254.175.185', '0', '内网IP', 1107, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:10:38', 0);
INSERT INTO `sys_log` VALUES (1369, 'USER', 'GET', '{\"keywords\":\"\",\"createTime\":[],\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '导出用户', '/api/v1/users/export', NULL, '169.254.175.185', '0', '内网IP', 22, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:10:39', 0);
INSERT INTO `sys_log` VALUES (1370, 'USER', 'GET', '{}', NULL, '用户表单数据', '/api/v1/users/5/form', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:10:50', 0);
INSERT INTO `sys_log` VALUES (1371, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:12:49', 0);
INSERT INTO `sys_log` VALUES (1372, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:12:50', 0);
INSERT INTO `sys_log` VALUES (1373, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:12:51', 0);
INSERT INTO `sys_log` VALUES (1374, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:12:52', 0);
INSERT INTO `sys_log` VALUES (1375, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:13:51', 0);
INSERT INTO `sys_log` VALUES (1376, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:15:11', 0);
INSERT INTO `sys_log` VALUES (1377, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:15:19', 0);
INSERT INTO `sys_log` VALUES (1378, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:16:13', 0);
INSERT INTO `sys_log` VALUES (1379, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:30:51', 0);
INSERT INTO `sys_log` VALUES (1380, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:36:42', 0);
INSERT INTO `sys_log` VALUES (1381, 'USER', 'GET', '{}', NULL, '用户表单数据', '/api/v1/users/5/form', NULL, '169.254.175.185', '0', '内网IP', 2, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:37:07', 0);
INSERT INTO `sys_log` VALUES (1382, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 10, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:49:55', 0);
INSERT INTO `sys_log` VALUES (1383, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 2, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:50:11', 0);
INSERT INTO `sys_log` VALUES (1384, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 120, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-07 21:50:14', 0);
INSERT INTO `sys_log` VALUES (1385, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 7, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:50:14', 0);
INSERT INTO `sys_log` VALUES (1386, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 58, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:50:17', 0);
INSERT INTO `sys_log` VALUES (1387, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:50:17', 0);
INSERT INTO `sys_log` VALUES (1388, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 8, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:50:20', 0);
INSERT INTO `sys_log` VALUES (1389, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 57, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-07 21:55:22', 0);
INSERT INTO `sys_log` VALUES (1390, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:55:22', 0);
INSERT INTO `sys_log` VALUES (1391, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:55:29', 0);
INSERT INTO `sys_log` VALUES (1392, 'USER', 'GET', '{\"keywords\":\"\",\"createTime\":[],\"isRoot\":false,\"pageNum\":1,\"pageSize\":10}', NULL, '导出用户', '/api/v1/users/export', NULL, '169.254.175.185', '0', '内网IP', 37, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 21:57:56', 0);
INSERT INTO `sys_log` VALUES (1393, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 22:05:42', 0);
INSERT INTO `sys_log` VALUES (1394, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 22:06:15', 0);
INSERT INTO `sys_log` VALUES (1395, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 22:11:13', 0);
INSERT INTO `sys_log` VALUES (1396, 'USER', 'GET', '{\"isRoot\":false,\"pageNum\":1,\"pageSize\":20}', NULL, '用户分页列表', '/api/v1/users/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-07 22:20:01', 0);
INSERT INTO `sys_log` VALUES (1397, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 125, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-08 00:04:34', 0);
INSERT INTO `sys_log` VALUES (1398, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 10, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 00:04:34', 0);
INSERT INTO `sys_log` VALUES (1399, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 11, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 00:09:11', 0);
INSERT INTO `sys_log` VALUES (1400, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 00:09:49', 0);
INSERT INTO `sys_log` VALUES (1401, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 9, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 00:10:05', 0);
INSERT INTO `sys_log` VALUES (1402, 'MENU', 'GET', '{}', NULL, '菜单列表', '/api/v1/menus', NULL, '169.254.175.185', '0', '内网IP', 10, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 00:10:24', 0);
INSERT INTO `sys_log` VALUES (1403, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 6, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 00:10:27', 0);
INSERT INTO `sys_log` VALUES (1404, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 4, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 00:10:37', 0);
INSERT INTO `sys_log` VALUES (1405, 'LOGIN', 'DELETE', '{}', NULL, '注销', '/api/v1/auth/logout', NULL, '169.254.175.185', '0', '内网IP', 1, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 00:10:40', 0);
INSERT INTO `sys_log` VALUES (1406, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 57, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-08 00:10:42', 0);
INSERT INTO `sys_log` VALUES (1407, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 3, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 00:10:43', 0);
INSERT INTO `sys_log` VALUES (1408, 'ROLE', 'GET', '{\"pageNum\":1,\"pageSize\":10}', NULL, '角色分页列表', '/api/v1/roles/page', NULL, '169.254.175.185', '0', '内网IP', 5, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 00:10:43', 0);
INSERT INTO `sys_log` VALUES (1409, 'LOGIN', 'POST', 'aioveu aioveu', NULL, '登录', '/api/v1/auth/login', NULL, '169.254.175.185', '0', '内网IP', 1046, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2025-10-08 14:52:41', 0);
INSERT INTO `sys_log` VALUES (1410, 'USER', 'GET', '', NULL, '获取当前登录用户信息', '/api/v1/users/me', NULL, '169.254.175.185', '0', '内网IP', 13, 'Chrome', '141.0.0.0', 'Windows 10 or Windows Server 2016', 4, '2025-10-08 14:52:41', 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint NOT NULL COMMENT '父菜单ID',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父节点ID路径',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `type` tinyint NOT NULL COMMENT '菜单类型（1-菜单 2-目录 3-外链 4-按钮）',
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由名称（Vue Router 中用于命名路由）',
  `route_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由路径（Vue Router 中定义的 URL 路径）',
  `component` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径（组件页面完整路径，相对于 src/views/，缺省后缀 .vue）',
  `perm` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '【按钮】权限标识',
  `always_show` tinyint NULL DEFAULT 0 COMMENT '【目录】只有一个子路由是否始终显示（1-是 0-否）',
  `keep_alive` tinyint NULL DEFAULT 0 COMMENT '【菜单】是否开启页面缓存（1-是 0-否）',
  `visible` tinyint(1) NULL DEFAULT 1 COMMENT '显示状态（1-显示 0-隐藏）',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `redirect` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转路径',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 296 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '0', '系统管理', 2, '', '/system', 'Layout', NULL, NULL, NULL, 1, 5, 'system', '/system/user', '2025-08-31 19:27:28', '2025-08-31 20:23:42', NULL);
INSERT INTO `sys_menu` VALUES (2, 1, '0,1', '用户管理', 1, 'User', 'user', 'system/user/index', NULL, NULL, 1, 1, 1, 'el-icon-User', NULL, '2025-08-31 19:27:28', '2025-08-31 19:27:28', NULL);
INSERT INTO `sys_menu` VALUES (3, 1, '0,1', '角色管理', 1, 'Role', 'role', 'system/role/index', NULL, NULL, 1, 1, 2, 'role', NULL, '2025-08-31 19:27:28', '2025-08-31 19:27:28', NULL);
INSERT INTO `sys_menu` VALUES (4, 1, '0,1', '菜单管理', 1, 'SysMenu', 'menu', 'system/menu/index', NULL, NULL, 1, 1, 3, 'menu', NULL, '2025-08-31 19:27:28', '2025-08-31 19:27:28', NULL);
INSERT INTO `sys_menu` VALUES (5, 1, '0,1', '部门管理', 1, 'Dept', 'dept', 'system/dept/index', NULL, NULL, 1, 1, 4, 'tree', NULL, '2025-08-31 19:27:28', '2025-08-31 19:27:28', NULL);
INSERT INTO `sys_menu` VALUES (6, 1, '0,1', '字典管理', 1, 'Dict', 'dict', 'system/dict/index', NULL, NULL, 1, 1, 5, 'dict', NULL, '2025-08-31 19:27:29', '2025-08-31 19:27:29', NULL);
INSERT INTO `sys_menu` VALUES (20, 0, '0', '多级菜单', 2, NULL, '/multi-level', 'Layout', NULL, 1, NULL, 1, 9, 'cascader', '', '2025-08-31 19:27:29', '2025-08-31 19:27:29', NULL);
INSERT INTO `sys_menu` VALUES (21, 20, '0,20', '菜单一级', 1, NULL, 'multi-level1', 'demo/multi-level/level1', NULL, 1, NULL, 1, 1, '', '', '2025-08-31 19:27:29', '2025-08-31 19:27:29', NULL);
INSERT INTO `sys_menu` VALUES (22, 21, '0,20,21', '菜单二级', 1, NULL, 'multi-level2', 'demo/multi-level/children/level2', NULL, 0, NULL, 1, 1, '', NULL, '2025-08-31 19:27:29', '2025-08-31 19:27:29', NULL);
INSERT INTO `sys_menu` VALUES (23, 22, '0,20,21,22', '菜单三级-1', 1, NULL, 'multi-level3-1', 'demo/multi-level/children/children/level3-1', NULL, 0, 1, 1, 1, '', '', '2025-08-31 19:27:29', '2025-08-31 19:27:29', NULL);
INSERT INTO `sys_menu` VALUES (24, 22, '0,20,21,22', '菜单三级-2', 1, NULL, 'multi-level3-2', 'demo/multi-level/children/children/level3-2', NULL, 0, 1, 1, 2, '', '', '2025-08-31 19:27:29', '2025-08-31 19:27:29', NULL);
INSERT INTO `sys_menu` VALUES (26, 0, '0', '平台文档', 2, '', '/doc', 'Layout', NULL, NULL, NULL, 1, 8, 'document', 'https://juejin.cn/post/7228990409909108793', '2025-08-31 19:27:30', '2025-08-31 19:27:30', NULL);
INSERT INTO `sys_menu` VALUES (30, 26, '0,26', '平台文档(外链)', 3, 'internal-doc-2', 'internal-doc-2', 'demo/internal-doc', NULL, 1, 1, 1, 2, 'document', '', '2025-08-31 19:27:30', '2025-09-01 01:46:57', NULL);
INSERT INTO `sys_menu` VALUES (31, 2, '0,1,2', '用户新增', 4, NULL, '', NULL, 'sys:user:add', NULL, NULL, 1, 1, '', '', '2025-08-31 19:27:30', '2025-08-31 19:27:30', NULL);
INSERT INTO `sys_menu` VALUES (32, 2, '0,1,2', '用户编辑', 4, NULL, '', NULL, 'sys:user:edit', NULL, NULL, 1, 2, '', '', '2025-08-31 19:27:30', '2025-08-31 19:27:30', NULL);
INSERT INTO `sys_menu` VALUES (33, 2, '0,1,2', '用户删除', 4, NULL, '', NULL, 'sys:user:delete', NULL, NULL, 1, 3, '', '', '2025-08-31 19:27:30', '2025-08-31 19:27:30', NULL);
INSERT INTO `sys_menu` VALUES (36, 0, '0', '组件封装', 2, NULL, '/component', 'Layout', NULL, NULL, NULL, 1, 10, 'menu', '', '2025-08-31 19:27:30', '2025-08-31 19:27:30', NULL);
INSERT INTO `sys_menu` VALUES (37, 36, '0,36', '富文本编辑器', 1, NULL, 'wang-editor', 'demo/wang-editor', NULL, NULL, 1, 1, 2, '', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (38, 36, '0,36', '图片上传', 1, NULL, 'upload', 'demo/upload', NULL, NULL, 1, 1, 3, '', '', '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (39, 36, '0,36', '图标选择器', 1, NULL, 'icon-selector', 'demo/icon-selector', NULL, NULL, 1, 1, 4, '', '', '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (40, 0, '0', '接口文档', 2, NULL, '/api', 'Layout', NULL, 1, NULL, 1, 7, 'api', '', '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (41, 40, '0,40', 'Apifox', 1, NULL, 'apifox', 'demo/api/apifox', NULL, NULL, 1, 1, 1, 'api', '', '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (70, 3, '0,1,3', '角色新增', 4, NULL, '', NULL, 'sys:role:add', NULL, NULL, 1, 2, '', NULL, '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (71, 3, '0,1,3', '角色编辑', 4, NULL, '', NULL, 'sys:role:edit', NULL, NULL, 1, 3, '', NULL, '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (72, 3, '0,1,3', '角色删除', 4, NULL, '', NULL, 'sys:role:delete', NULL, NULL, 1, 4, '', NULL, '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (73, 4, '0,1,4', '菜单新增', 4, NULL, '', NULL, 'sys:menu:add', NULL, NULL, 1, 1, '', NULL, '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (74, 4, '0,1,4', '菜单编辑', 4, NULL, '', NULL, 'sys:menu:edit', NULL, NULL, 1, 3, '', NULL, '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (75, 4, '0,1,4', '菜单删除', 4, NULL, '', NULL, 'sys:menu:delete', NULL, NULL, 1, 3, '', NULL, '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (76, 5, '0,1,5', '部门新增', 4, NULL, '', NULL, 'sys:dept:add', NULL, NULL, 1, 1, '', NULL, '2025-08-31 19:27:31', '2025-08-31 19:27:31', NULL);
INSERT INTO `sys_menu` VALUES (77, 5, '0,1,5', '部门编辑', 4, NULL, '', NULL, 'sys:dept:edit', NULL, NULL, 1, 2, '', NULL, '2025-08-31 19:27:32', '2025-08-31 19:27:32', NULL);
INSERT INTO `sys_menu` VALUES (78, 5, '0,1,5', '部门删除', 4, NULL, '', NULL, 'sys:dept:delete', NULL, NULL, 1, 3, '', NULL, '2025-08-31 19:27:32', '2025-08-31 19:27:32', NULL);
INSERT INTO `sys_menu` VALUES (79, 6, '0,1,6', '字典新增', 4, NULL, '', NULL, 'sys:dict:add', NULL, NULL, 1, 1, '', NULL, '2025-08-31 19:27:32', '2025-08-31 19:27:32', NULL);
INSERT INTO `sys_menu` VALUES (81, 6, '0,1,6', '字典编辑', 4, NULL, '', NULL, 'sys:dict:edit', NULL, NULL, 1, 2, '', NULL, '2025-08-31 19:27:32', '2025-08-31 19:27:32', NULL);
INSERT INTO `sys_menu` VALUES (84, 6, '0,1,6', '字典删除', 4, NULL, '', NULL, 'sys:dict:delete', NULL, NULL, 1, 3, '', NULL, '2025-08-31 19:27:32', '2025-08-31 19:27:32', NULL);
INSERT INTO `sys_menu` VALUES (88, 2, '0,1,2', '重置密码', 4, NULL, '', NULL, 'sys:user:reset-password', NULL, NULL, 1, 4, '', NULL, '2025-08-31 19:27:33', '2025-08-31 19:27:33', NULL);
INSERT INTO `sys_menu` VALUES (89, 0, '0', '功能演示', 2, NULL, '/function', 'Layout', NULL, NULL, NULL, 1, 12, 'menu', '', '2025-08-31 19:27:33', '2025-08-31 19:27:33', NULL);
INSERT INTO `sys_menu` VALUES (90, 89, '0,89', 'Websocket', 1, NULL, '/function/websocket', 'demo/websocket', NULL, NULL, 1, 1, 3, '', '', '2025-08-31 19:27:33', '2025-08-31 19:27:33', NULL);
INSERT INTO `sys_menu` VALUES (95, 36, '0,36', '字典组件', 1, NULL, 'dict-demo', 'demo/dictionary', NULL, NULL, 1, 1, 4, '', '', '2025-08-31 19:27:33', '2025-08-31 19:27:33', NULL);
INSERT INTO `sys_menu` VALUES (97, 89, '0,89', 'Icons', 1, NULL, 'icon-demo', 'demo/icons', NULL, NULL, 1, 1, 2, 'el-icon-Notification', '', '2025-08-31 19:27:33', '2025-08-31 19:27:33', NULL);
INSERT INTO `sys_menu` VALUES (102, 26, '0,26', 'document', 3, 'internal-doc-1', 'internal-doc-1', 'demo/internal-doc', NULL, NULL, NULL, 1, 1, 'document', '', '2025-08-31 19:27:33', '2025-09-01 01:47:02', NULL);
INSERT INTO `sys_menu` VALUES (105, 2, '0,1,2', '用户查询', 4, NULL, '', NULL, 'sys:user:query', 0, 0, 1, 0, '', NULL, '2025-08-31 19:27:34', '2025-08-31 19:27:34', NULL);
INSERT INTO `sys_menu` VALUES (106, 2, '0,1,2', '用户导入', 4, NULL, '', NULL, 'sys:user:import', NULL, NULL, 1, 5, '', NULL, '2025-08-31 19:27:34', '2025-08-31 19:27:34', NULL);
INSERT INTO `sys_menu` VALUES (107, 2, '0,1,2', '用户导出', 4, NULL, '', NULL, 'sys:user:export', NULL, NULL, 1, 6, '', NULL, '2025-08-31 19:27:34', '2025-08-31 19:27:34', NULL);
INSERT INTO `sys_menu` VALUES (108, 36, '0,36', '增删改查', 1, NULL, 'curd', 'demo/curd/index', NULL, NULL, 1, 1, 0, '', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (109, 36, '0,36', '列表选择器', 1, NULL, 'table-select', 'demo/table-select/index', NULL, NULL, 1, 1, 1, '', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (110, 0, '0', '路由参数', 2, NULL, '/route-param', 'Layout', NULL, 1, 1, 1, 11, 'el-icon-ElementPlus', NULL, '2025-08-31 19:27:34', '2025-08-31 19:27:34', NULL);
INSERT INTO `sys_menu` VALUES (111, 110, '0,110', '参数(type=1)', 1, NULL, 'route-param-type1', 'demo/route-param', NULL, 0, 1, 1, 1, 'el-icon-Star', NULL, '2025-08-31 19:27:34', '2025-08-31 19:27:34', '{\"type\": \"1\"}');
INSERT INTO `sys_menu` VALUES (112, 110, '0,110', '参数(type=2)', 1, NULL, 'route-param-type2', 'demo/route-param', NULL, 0, 1, 1, 2, 'el-icon-StarFilled', NULL, '2025-08-31 19:27:35', '2025-08-31 19:27:35', '{\"type\": \"2\"}');
INSERT INTO `sys_menu` VALUES (117, 1, '0,1', '系统日志', 1, 'Log', 'log', 'system/log/index', NULL, 0, 1, 1, 6, 'document', NULL, '2025-08-31 19:27:35', '2025-08-31 19:27:35', NULL);
INSERT INTO `sys_menu` VALUES (118, 0, '0', '系统工具', 2, NULL, '/codegen', 'Layout', NULL, 0, 1, 1, 6, 'menu', NULL, '2025-08-31 19:27:35', '2025-08-31 20:23:54', NULL);
INSERT INTO `sys_menu` VALUES (119, 118, '0,118', '代码生成', 1, 'Codegen', 'codegen', 'codegen/index', NULL, 0, 1, 1, 1, 'code', NULL, '2025-08-31 19:27:36', '2025-08-31 19:27:36', NULL);
INSERT INTO `sys_menu` VALUES (120, 1, '0,1', '系统配置', 1, 'Config', 'config', 'system/config/index', NULL, 0, 1, 1, 7, 'setting', NULL, '2025-08-31 19:27:36', '2025-08-31 19:27:36', NULL);
INSERT INTO `sys_menu` VALUES (121, 120, '0,1,120', '系统配置查询', 4, NULL, '', NULL, 'sys:config:query', 0, 1, 1, 1, '', NULL, '2025-08-31 19:27:36', '2025-08-31 19:27:36', NULL);
INSERT INTO `sys_menu` VALUES (122, 120, '0,1,120', '系统配置新增', 4, NULL, '', NULL, 'sys:config:add', 0, 1, 1, 2, '', NULL, '2025-08-31 19:27:36', '2025-08-31 19:27:36', NULL);
INSERT INTO `sys_menu` VALUES (123, 120, '0,1,120', '系统配置修改', 4, NULL, '', NULL, 'sys:config:update', 0, 1, 1, 3, '', NULL, '2025-08-31 19:27:36', '2025-08-31 19:27:36', NULL);
INSERT INTO `sys_menu` VALUES (124, 120, '0,1,120', '系统配置删除', 4, NULL, '', NULL, 'sys:config:delete', 0, 1, 1, 4, '', NULL, '2025-08-31 19:27:36', '2025-08-31 19:27:36', NULL);
INSERT INTO `sys_menu` VALUES (125, 120, '0,1,120', '系统配置刷新', 4, NULL, '', NULL, 'sys:config:refresh', 0, 1, 1, 5, '', NULL, '2025-08-31 19:27:36', '2025-08-31 19:27:36', NULL);
INSERT INTO `sys_menu` VALUES (126, 1, '0,1', '通知公告', 1, 'Notice', 'notice', 'system/notice/index', NULL, NULL, NULL, 1, 9, '', NULL, '2025-08-31 19:27:36', '2025-08-31 19:27:36', NULL);
INSERT INTO `sys_menu` VALUES (127, 126, '0,1,126', '通知查询', 4, NULL, '', NULL, 'sys:notice:query', NULL, NULL, 1, 1, '', NULL, '2025-08-31 19:27:36', '2025-08-31 19:27:36', NULL);
INSERT INTO `sys_menu` VALUES (128, 126, '0,1,126', '通知新增', 4, NULL, '', NULL, 'sys:notice:add', NULL, NULL, 1, 2, '', NULL, '2025-08-31 19:27:36', '2025-08-31 19:27:36', NULL);
INSERT INTO `sys_menu` VALUES (129, 126, '0,1,126', '通知编辑', 4, NULL, '', NULL, 'sys:notice:edit', NULL, NULL, 1, 3, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (130, 126, '0,1,126', '通知删除', 4, NULL, '', NULL, 'sys:notice:delete', NULL, NULL, 1, 4, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (133, 126, '0,1,126', '通知发布', 4, NULL, '', NULL, 'sys:notice:publish', 0, 1, 1, 5, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (134, 126, '0,1,126', '通知撤回', 4, NULL, '', NULL, 'sys:notice:revoke', 0, 1, 1, 6, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (135, 1, '0,1', '字典项', 1, 'DictItem', 'dict-item', 'system/dict/dict-item', NULL, 0, 1, 0, 6, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (136, 135, '0,1,135', '字典项新增', 4, NULL, '', NULL, 'sys:dict-item:add', NULL, NULL, 1, 2, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (137, 135, '0,1,135', '字典项编辑', 4, NULL, '', NULL, 'sys:dict-item:edit', NULL, NULL, 1, 3, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (138, 135, '0,1,135', '字典项删除', 4, NULL, '', NULL, 'sys:dict-item:delete', NULL, NULL, 1, 4, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (139, 3, '0,1,3', '角色查询', 4, NULL, '', NULL, 'sys:role:query', NULL, NULL, 1, 1, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (140, 4, '0,1,4', '菜单查询', 4, NULL, '', NULL, 'sys:menu:query', NULL, NULL, 1, 1, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (141, 5, '0,1,5', '部门查询', 4, NULL, '', NULL, 'sys:dept:query', NULL, NULL, 1, 1, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (142, 6, '0,1,6', '字典查询', 4, NULL, '', NULL, 'sys:dict:query', NULL, NULL, 1, 1, '', NULL, '2025-08-31 19:27:37', '2025-08-31 19:27:37', NULL);
INSERT INTO `sys_menu` VALUES (143, 135, '0,1,135', '字典项查询', 4, NULL, '', NULL, 'sys:dict-item:query', NULL, NULL, 1, 1, '', NULL, '2025-08-31 19:27:38', '2025-08-31 19:27:38', NULL);
INSERT INTO `sys_menu` VALUES (144, 26, '0,26', '后端文档', 3, 'internal-doc-3', 'internal-doc-3', 'demo/internal-doc', NULL, 1, 1, 1, 3, 'document', '', '2024-10-05 23:36:03', '2025-09-01 01:46:53', NULL);
INSERT INTO `sys_menu` VALUES (145, 26, '0,26', '移动端文档', 3, 'doc3', 'https://aioveu.com', 'demo/internal-doc', NULL, 1, 1, 1, 4, 'document', '', '2024-10-05 23:36:03', '2025-09-01 01:47:57', NULL);
INSERT INTO `sys_menu` VALUES (146, 36, '0,36', '拖拽组件', 1, NULL, 'drag', 'demo/drag', NULL, NULL, NULL, 1, 5, '', '', '2025-03-31 14:14:45', '2025-03-31 14:14:52', NULL);
INSERT INTO `sys_menu` VALUES (147, 36, '0,36', '滚动文本', 1, NULL, 'text-scroll', 'demo/text-scroll', NULL, NULL, NULL, 1, 6, '', '', '2025-03-31 14:14:49', '2025-03-31 14:14:56', NULL);
INSERT INTO `sys_menu` VALUES (148, 89, '0,89', '字典实时同步', 1, NULL, 'dict-sync', 'demo/dict-sync', NULL, NULL, NULL, 1, 3, '', '', '2025-03-31 14:14:49', '2025-03-31 14:14:56', NULL);
INSERT INTO `sys_menu` VALUES (149, 0, '0', '人员管理', 2, NULL, '/aioveuUser', 'Layout', NULL, 1, 1, 1, 1, 'user', NULL, '2025-08-31 20:14:23', '2025-08-31 20:44:43', NULL);
INSERT INTO `sys_menu` VALUES (150, 149, '0,149', '部门管理', 1, 'aioveu_department', 'aioveu_department', 'aioveuDepartment/aioveu-department/index', NULL, 1, 1, 1, 1, 'menu', NULL, '2025-08-31 20:18:28', '2025-08-31 20:59:42', NULL);
INSERT INTO `sys_menu` VALUES (151, 150, '0,149,150', '部门查询', 4, NULL, NULL, NULL, 'aioveuDepartment:aioveu-department:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 20:22:10', '2025-08-31 20:22:10', NULL);
INSERT INTO `sys_menu` VALUES (152, 150, '0,149,150', '部门新增', 4, NULL, NULL, NULL, 'aioveuDepartment:aioveu-department:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 20:22:47', '2025-08-31 20:22:47', NULL);
INSERT INTO `sys_menu` VALUES (153, 150, '0,149,150', '部门编辑', 4, NULL, NULL, NULL, 'aioveuDepartment:aioveu-department:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 20:23:08', '2025-08-31 20:23:08', NULL);
INSERT INTO `sys_menu` VALUES (154, 150, '0,149,150', '部门删除', 4, NULL, NULL, NULL, 'aioveuDepartment:aioveu-department:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 20:26:07', '2025-08-31 20:26:07', NULL);
INSERT INTO `sys_menu` VALUES (155, 149, '0,149', '岗位管理', 1, 'aioveu_position', 'aioveu_position', 'aioveuPosition/aioveu-position/index', NULL, 1, 1, 1, 2, 'menu', NULL, '2025-08-31 20:52:01', '2025-08-31 21:00:06', NULL);
INSERT INTO `sys_menu` VALUES (156, 149, '0,149', '员工管理', 1, 'AioveuEmployee', 'aioveu_employee', 'aioveuEmployee/aioveu-employee/index', NULL, 1, 1, 1, 3, 'menu', NULL, '2025-08-31 20:53:01', '2025-08-31 21:00:12', NULL);
INSERT INTO `sys_menu` VALUES (157, 149, '0,149', '考勤管理', 1, 'aioveu_attendance', 'aioveu_attendance', 'aioveuAttendance/aioveu-attendance/index', NULL, 1, 1, 1, 4, 'menu', NULL, '2025-08-31 20:53:18', '2025-08-31 21:00:17', NULL);
INSERT INTO `sys_menu` VALUES (158, 149, '0,149', '绩效管理', 1, 'aioveu_performance', 'aioveu_performance', 'aioveuPerformance/aioveu-performance/index', NULL, 1, 1, 1, 5, 'menu', NULL, '2025-08-31 20:53:51', '2025-08-31 21:00:23', NULL);
INSERT INTO `sys_menu` VALUES (159, 149, '0,149', '薪资管理', 1, 'aioveu_salary', 'aioveu_salary', 'aioveuSalary/aioveu-salary/index', NULL, 1, 1, 1, 6, NULL, NULL, '2025-08-31 20:54:09', '2025-08-31 21:00:30', NULL);
INSERT INTO `sys_menu` VALUES (160, 155, '0,149,155', '岗位查询', 4, NULL, NULL, NULL, 'aioveuPosition:aioveu-position:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 20:56:41', '2025-08-31 20:56:41', NULL);
INSERT INTO `sys_menu` VALUES (161, 155, '0,149,155', '岗位新增', 4, NULL, NULL, NULL, 'aioveuPosition:aioveu-position:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 20:56:59', '2025-08-31 20:56:59', NULL);
INSERT INTO `sys_menu` VALUES (162, 155, '0,149,155', '岗位编辑', 4, NULL, NULL, NULL, 'aioveuPosition:aioveu-position:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 20:57:10', '2025-08-31 20:57:10', NULL);
INSERT INTO `sys_menu` VALUES (163, 155, '0,149,155', '岗位删除', 4, NULL, NULL, NULL, 'aioveuPosition:aioveu-position:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 20:57:20', '2025-08-31 20:57:20', NULL);
INSERT INTO `sys_menu` VALUES (164, 156, '0,149,156', '员工查询', 4, NULL, NULL, NULL, 'aioveuEmployee:aioveu-employee:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 22:05:56', '2025-08-31 22:05:56', NULL);
INSERT INTO `sys_menu` VALUES (165, 156, '0,149,156', '员工新增', 4, NULL, NULL, NULL, 'aioveuEmployee:aioveu-employee:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 22:06:14', '2025-08-31 22:06:14', NULL);
INSERT INTO `sys_menu` VALUES (166, 156, '0,149,156', '员工编辑', 4, NULL, NULL, NULL, 'aioveuEmployee:aioveu-employee:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 22:06:27', '2025-08-31 22:06:27', NULL);
INSERT INTO `sys_menu` VALUES (167, 156, '0,149,156', '员工删除', 4, NULL, NULL, NULL, 'aioveuEmployee:aioveu-employee:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 22:06:37', '2025-08-31 22:06:37', NULL);
INSERT INTO `sys_menu` VALUES (168, 157, '0,149,157', '考勤查询', 4, NULL, NULL, NULL, 'aioveuAttendance:aioveu-attendance:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 22:06:48', '2025-08-31 22:06:48', NULL);
INSERT INTO `sys_menu` VALUES (169, 157, '0,149,157', '考勤新增', 4, NULL, NULL, NULL, 'aioveuAttendance:aioveu-attendance:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 22:07:02', '2025-08-31 22:07:02', NULL);
INSERT INTO `sys_menu` VALUES (170, 157, '0,149,157', '考勤编辑', 4, NULL, NULL, NULL, 'aioveuAttendance:aioveu-attendance:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 22:07:13', '2025-08-31 22:07:13', NULL);
INSERT INTO `sys_menu` VALUES (171, 157, '0,149,157', '考勤删除', 4, NULL, NULL, NULL, 'aioveuAttendance:aioveu-attendance:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 22:07:24', '2025-08-31 22:07:24', NULL);
INSERT INTO `sys_menu` VALUES (172, 158, '0,149,158', '绩效查询', 4, NULL, NULL, NULL, 'aioveuPerformance:aioveu-performance:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 22:07:38', '2025-08-31 22:07:38', NULL);
INSERT INTO `sys_menu` VALUES (173, 158, '0,149,158', '绩效新增', 4, NULL, NULL, NULL, 'aioveuPerformance:aioveu-performance:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 22:07:52', '2025-08-31 22:07:52', NULL);
INSERT INTO `sys_menu` VALUES (174, 158, '0,149,158', '绩效编辑', 4, NULL, NULL, NULL, 'aioveuPerformance:aioveu-performance:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 22:08:04', '2025-08-31 22:08:04', NULL);
INSERT INTO `sys_menu` VALUES (175, 158, '0,149,158', '绩效删除', 4, NULL, NULL, NULL, 'aioveuPerformance:aioveu-performance:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 22:08:19', '2025-08-31 22:08:19', NULL);
INSERT INTO `sys_menu` VALUES (176, 159, '0,149,159', '薪资查询', 4, NULL, NULL, NULL, 'aioveuSalary:aioveu-salary:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 22:08:29', '2025-08-31 22:08:29', NULL);
INSERT INTO `sys_menu` VALUES (178, 159, '0,149,159', '薪资新增', 4, NULL, NULL, NULL, 'aioveuSalary:aioveu-salary:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 22:08:52', '2025-08-31 22:08:52', NULL);
INSERT INTO `sys_menu` VALUES (179, 159, '0,149,159', '薪资编辑', 4, NULL, NULL, NULL, 'aioveuSalary:aioveu-salary:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 22:09:43', '2025-08-31 22:09:43', NULL);
INSERT INTO `sys_menu` VALUES (180, 159, '0,149,159', '薪资删除', 4, NULL, NULL, NULL, 'aioveuSalary:aioveu-salary:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 22:09:52', '2025-08-31 22:09:52', NULL);
INSERT INTO `sys_menu` VALUES (181, 0, '0', '物资管理', 2, NULL, '/aioveuMaterial', 'Layout', NULL, 1, 1, 1, 2, 'message', NULL, '2025-08-31 22:58:34', '2025-08-31 23:10:40', NULL);
INSERT INTO `sys_menu` VALUES (182, 181, '0,181', '物资分类管理', 1, 'aioveu_category', 'aioveu_category', 'aioveuCategory/aioveu-category/index', NULL, 0, 1, 1, 1, 'menu', NULL, '2025-08-31 22:58:59', '2025-08-31 22:58:59', NULL);
INSERT INTO `sys_menu` VALUES (183, 181, '0,181', '物资管理', 1, 'aioveu_material', 'aioveu_material', 'aioveuMaterial/aioveu-material/index', NULL, 1, 1, 1, 2, 'menu', NULL, '2025-08-31 22:59:18', '2025-08-31 22:59:18', NULL);
INSERT INTO `sys_menu` VALUES (184, 181, '0,181', '仓库管理', 1, 'aioveu_warehouse', 'aioveu_warehouse', 'aioveuWarehouse/aioveu-warehouse/index', NULL, 1, 1, 1, 3, 'menu', NULL, '2025-08-31 22:59:36', '2025-08-31 22:59:36', NULL);
INSERT INTO `sys_menu` VALUES (185, 181, '0,181', '库存管理', 1, 'aioveu_inventory', 'aioveu_inventory', 'aioveuInventory/aioveu-inventory/index', NULL, 1, 1, 1, 4, 'menu', NULL, '2025-08-31 22:59:52', '2025-08-31 22:59:52', NULL);
INSERT INTO `sys_menu` VALUES (186, 181, '0,181', '入库管理', 1, 'aioveu_inbound', 'aioveu_inbound', 'aioveuInbound/aioveu-inbound/index', NULL, 1, 1, 1, 5, 'menu', NULL, '2025-08-31 23:00:12', '2025-08-31 23:00:12', NULL);
INSERT INTO `sys_menu` VALUES (187, 181, '0,181', '设备管理', 1, 'aioveu_equipment', 'aioveu_equipment', 'aioveuEquipment/aioveu-equipment/index', NULL, 1, 1, 1, 6, 'menu', NULL, '2025-08-31 23:00:30', '2025-08-31 23:00:30', NULL);
INSERT INTO `sys_menu` VALUES (188, 181, '0,181', '采购管理', 1, 'aioveu_procurement', 'aioveu_procurement', 'aioveu/aioveu-procurement/index', NULL, 1, 1, 1, 7, 'menu', NULL, '2025-08-31 23:00:46', '2025-08-31 23:19:20', NULL);
INSERT INTO `sys_menu` VALUES (189, 181, '0,181', '出库管理', 1, 'aioveu_outbound', 'aioveu_outbound', 'aioveuOutbound/aioveu-outbound/index', NULL, 1, 1, 1, 8, 'menu', NULL, '2025-08-31 23:01:01', '2025-08-31 23:01:01', NULL);
INSERT INTO `sys_menu` VALUES (190, 182, '0,181,182', '物资分类查询', 4, NULL, NULL, NULL, 'aioveuCategory:aioveu-category:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:01:25', '2025-08-31 23:01:25', NULL);
INSERT INTO `sys_menu` VALUES (191, 182, '0,181,182', '物资分类新增', 4, NULL, NULL, NULL, 'aioveuCategory:aioveu-category:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:01:39', '2025-08-31 23:01:39', NULL);
INSERT INTO `sys_menu` VALUES (192, 182, '0,181,182', '物资分类编辑', 4, NULL, NULL, NULL, 'aioveuCategory:aioveu-category:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:01:54', '2025-08-31 23:01:54', NULL);
INSERT INTO `sys_menu` VALUES (194, 182, '0,181,182', '物资分类删除', 4, NULL, NULL, NULL, 'aioveuCategory:aioveu-category:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:02:34', '2025-08-31 23:02:34', NULL);
INSERT INTO `sys_menu` VALUES (195, 183, '0,181,183', '物资查询', 4, NULL, NULL, NULL, 'aioveuMaterial:aioveu-material:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:02:47', '2025-08-31 23:02:47', NULL);
INSERT INTO `sys_menu` VALUES (196, 183, '0,181,183', '物资新增', 4, NULL, NULL, NULL, 'aioveuMaterial:aioveu-material:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:02:58', '2025-08-31 23:02:58', NULL);
INSERT INTO `sys_menu` VALUES (197, 183, '0,181,183', '物资编辑', 4, NULL, NULL, NULL, 'aioveuMaterial:aioveu-material:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:03:08', '2025-08-31 23:03:08', NULL);
INSERT INTO `sys_menu` VALUES (198, 183, '0,181,183', '物资删除', 4, NULL, NULL, NULL, 'aioveuMaterial:aioveu-material:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:03:19', '2025-08-31 23:03:19', NULL);
INSERT INTO `sys_menu` VALUES (200, 184, '0,181,184', '仓库查询', 4, NULL, NULL, NULL, 'aioveuWarehouse:aioveu-warehouse:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:05:06', '2025-08-31 23:05:06', NULL);
INSERT INTO `sys_menu` VALUES (201, 184, '0,181,184', '仓库新增', 4, NULL, NULL, NULL, 'aioveuWarehouse:aioveu-warehouse:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:05:16', '2025-08-31 23:05:16', NULL);
INSERT INTO `sys_menu` VALUES (202, 184, '0,181,184', '仓库编辑', 4, NULL, NULL, NULL, 'aioveuWarehouse:aioveu-warehouse:edit', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:05:23', '2025-08-31 23:05:23', NULL);
INSERT INTO `sys_menu` VALUES (203, 184, '0,181,184', '仓库删除', 4, NULL, NULL, NULL, 'aioveuWarehouse:aioveu-warehouse:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:05:33', '2025-08-31 23:05:33', NULL);
INSERT INTO `sys_menu` VALUES (204, 185, '0,181,185', '库存查询', 4, NULL, NULL, NULL, 'aioveuInventory:aioveu-inventory:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:05:45', '2025-08-31 23:05:45', NULL);
INSERT INTO `sys_menu` VALUES (205, 185, '0,181,185', '库存新增', 4, NULL, NULL, NULL, 'aioveuInventory:aioveu-inventory:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:06:01', '2025-08-31 23:06:01', NULL);
INSERT INTO `sys_menu` VALUES (206, 185, '0,181,185', '库存编辑', 4, NULL, NULL, NULL, 'aioveuInventory:aioveu-inventory:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:06:12', '2025-08-31 23:06:12', NULL);
INSERT INTO `sys_menu` VALUES (207, 185, '0,181,185', '库存删除', 4, NULL, NULL, NULL, 'aioveuInventory:aioveu-inventory:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:06:26', '2025-08-31 23:06:26', NULL);
INSERT INTO `sys_menu` VALUES (208, 186, '0,181,186', '入库查询', 4, NULL, NULL, NULL, 'aioveuInbound:aioveu-inbound:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:06:40', '2025-08-31 23:06:40', NULL);
INSERT INTO `sys_menu` VALUES (209, 186, '0,181,186', '入库新增', 4, NULL, NULL, NULL, 'aioveuInbound:aioveu-inbound:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:06:49', '2025-08-31 23:06:49', NULL);
INSERT INTO `sys_menu` VALUES (210, 186, '0,181,186', '入库编辑', 4, NULL, NULL, NULL, 'aioveuInbound:aioveu-inbound:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:07:00', '2025-08-31 23:07:00', NULL);
INSERT INTO `sys_menu` VALUES (211, 186, '0,181,186', '入库删除', 4, NULL, NULL, NULL, 'aioveuInbound:aioveu-inbound:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:07:09', '2025-08-31 23:07:09', NULL);
INSERT INTO `sys_menu` VALUES (212, 187, '0,181,187', '设备查询', 4, NULL, NULL, NULL, 'aioveuEquipment:aioveu-equipment:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:07:24', '2025-08-31 23:07:24', NULL);
INSERT INTO `sys_menu` VALUES (213, 187, '0,181,187', '设备新增', 4, NULL, NULL, NULL, 'aioveuEquipment:aioveu-equipment:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:07:34', '2025-08-31 23:07:34', NULL);
INSERT INTO `sys_menu` VALUES (214, 187, '0,181,187', '设备编辑', 4, NULL, NULL, NULL, 'aioveuEquipment:aioveu-equipment:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:07:45', '2025-08-31 23:07:45', NULL);
INSERT INTO `sys_menu` VALUES (215, 187, '0,181,187', '设备删除', 4, NULL, NULL, NULL, 'aioveuEquipment:aioveu-equipment:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:07:57', '2025-08-31 23:07:57', NULL);
INSERT INTO `sys_menu` VALUES (216, 188, '0,181,188', '采购查询', 4, NULL, NULL, NULL, 'aioveu:aioveu-procurement:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:08:07', '2025-08-31 23:20:15', NULL);
INSERT INTO `sys_menu` VALUES (217, 188, '0,181,188', '采购新增', 4, NULL, NULL, NULL, 'aioveu:aioveu-procurement:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:08:17', '2025-08-31 23:20:21', NULL);
INSERT INTO `sys_menu` VALUES (218, 188, '0,181,188', '采购编辑', 4, NULL, NULL, NULL, 'aioveu:aioveu-procurement:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:08:26', '2025-08-31 23:20:28', NULL);
INSERT INTO `sys_menu` VALUES (219, 188, '0,181,188', '采购删除', 4, NULL, NULL, NULL, 'aioveu:aioveu-procurement:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:08:37', '2025-08-31 23:20:33', NULL);
INSERT INTO `sys_menu` VALUES (220, 189, '0,181,189', '出库查询', 4, NULL, NULL, NULL, 'aioveuOutbound:aioveu-outbound:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:08:49', '2025-08-31 23:08:49', NULL);
INSERT INTO `sys_menu` VALUES (221, 189, '0,181,189', '出库新增', 4, NULL, NULL, NULL, 'aioveuOutbound:aioveu-outbound:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:09:00', '2025-08-31 23:09:00', NULL);
INSERT INTO `sys_menu` VALUES (222, 189, '0,181,189', '出库编辑', 4, NULL, NULL, NULL, 'aioveuOutbound:aioveu-outbound:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:09:10', '2025-08-31 23:09:10', NULL);
INSERT INTO `sys_menu` VALUES (223, 189, '0,181,189', '出库删除', 4, NULL, NULL, NULL, 'aioveuOutbound:aioveu-outbound:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:09:22', '2025-08-31 23:09:22', NULL);
INSERT INTO `sys_menu` VALUES (224, 0, '0', '客户管理', 2, NULL, '/aioveuMember', 'Layout', NULL, 0, 1, 1, 3, 'csdn', NULL, '2025-08-31 23:10:31', '2025-08-31 23:10:31', NULL);
INSERT INTO `sys_menu` VALUES (225, 224, '0,224', '客户管理', 1, 'aioveu_customer', 'aioveu_customer', 'aioveuCustomer/aioveu-customer/index', NULL, 1, 1, 1, 1, 'menu', NULL, '2025-08-31 23:11:01', '2025-08-31 23:11:01', NULL);
INSERT INTO `sys_menu` VALUES (226, 224, '0,224', '联系人管理', 1, 'aioveu_contact', 'aioveu_contact', 'aioveuContact/aioveu-contact/index', NULL, 1, 1, 1, 2, 'menu', NULL, '2025-08-31 23:11:17', '2025-08-31 23:11:17', NULL);
INSERT INTO `sys_menu` VALUES (227, 224, '0,224', '交易管理', 1, 'aioveu_transaction', 'aioveu_transaction', 'aioveuTransaction/aioveu-transaction/index', NULL, 1, 1, 1, 3, 'menu', NULL, '2025-08-31 23:11:35', '2025-08-31 23:11:35', NULL);
INSERT INTO `sys_menu` VALUES (228, 224, '0,224', '订单管理', 1, 'aioveu_sales_order', 'aioveu_sales_order', 'aioveuSalesOrder/aioveu-sales-order/index', NULL, 1, 1, 1, 4, 'menu', NULL, '2025-08-31 23:11:55', '2025-08-31 23:24:08', NULL);
INSERT INTO `sys_menu` VALUES (229, 224, '0,224', '订单明细管理', 1, 'aioveu_sales_order_detail', 'aioveu_sales_order_detail', 'aioveuSalesOrderDetail/aioveu-sales-order-detail/index', NULL, 1, 1, 1, 5, 'menu', NULL, '2025-08-31 23:12:11', '2025-08-31 23:12:11', NULL);
INSERT INTO `sys_menu` VALUES (230, 225, '0,224,225', '客户查询', 4, NULL, NULL, NULL, 'aioveuCustomer:aioveu-customer:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:12:28', '2025-08-31 23:12:28', NULL);
INSERT INTO `sys_menu` VALUES (231, 225, '0,224,225', '客户新增', 4, NULL, NULL, NULL, 'aioveuCustomer:aioveu-customer:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:12:43', '2025-08-31 23:12:43', NULL);
INSERT INTO `sys_menu` VALUES (232, 225, '0,224,225', '客户编辑', 4, NULL, NULL, NULL, 'aioveuCustomer:aioveu-customer:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:12:52', '2025-08-31 23:12:52', NULL);
INSERT INTO `sys_menu` VALUES (233, 225, '0,224,225', '客户删除', 4, NULL, NULL, NULL, 'aioveuCustomer:aioveu-customer:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:13:03', '2025-08-31 23:13:03', NULL);
INSERT INTO `sys_menu` VALUES (234, 226, '0,224,226', '联系人查询', 4, NULL, NULL, NULL, 'aioveuContact:aioveu-contact:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:13:14', '2025-08-31 23:13:14', NULL);
INSERT INTO `sys_menu` VALUES (235, 226, '0,224,226', '联系人新增', 4, NULL, NULL, NULL, 'aioveuContact:aioveu-contact:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:13:24', '2025-08-31 23:13:24', NULL);
INSERT INTO `sys_menu` VALUES (236, 226, '0,224,226', '联系人编辑', 4, NULL, NULL, NULL, 'aioveuContact:aioveu-contact:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:13:34', '2025-08-31 23:13:34', NULL);
INSERT INTO `sys_menu` VALUES (237, 226, '0,224,226', '联系人删除', 4, NULL, NULL, NULL, 'aioveuContact:aioveu-contact:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:13:48', '2025-08-31 23:13:48', NULL);
INSERT INTO `sys_menu` VALUES (238, 227, '0,224,227', '交易查询', 4, NULL, NULL, NULL, 'aioveuTransaction:aioveu-transaction:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:13:57', '2025-08-31 23:13:57', NULL);
INSERT INTO `sys_menu` VALUES (239, 227, '0,224,227', '交易新增', 4, NULL, NULL, NULL, 'aioveuTransaction:aioveu-transaction:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:14:07', '2025-08-31 23:14:07', NULL);
INSERT INTO `sys_menu` VALUES (240, 227, '0,224,227', '交易编辑', 4, NULL, NULL, NULL, 'aioveuTransaction:aioveu-transaction:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:14:16', '2025-08-31 23:14:16', NULL);
INSERT INTO `sys_menu` VALUES (241, 227, '0,224,227', '交易删除', 4, NULL, NULL, NULL, 'aioveuTransaction:aioveu-transaction:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:14:34', '2025-08-31 23:14:34', NULL);
INSERT INTO `sys_menu` VALUES (242, 228, '0,224,228', '订单查询', 4, NULL, NULL, NULL, 'aioveuSalesOrder:aioveu-sales-order:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:14:44', '2025-08-31 23:24:17', NULL);
INSERT INTO `sys_menu` VALUES (243, 228, '0,224,228', '订单新增', 4, NULL, NULL, NULL, 'aioveuSalesOrder:aioveu-sales-order:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:14:52', '2025-08-31 23:24:22', NULL);
INSERT INTO `sys_menu` VALUES (244, 228, '0,224,228', '订单编辑', 4, NULL, NULL, NULL, 'aioveuSalesOrder:aioveu-sales-order:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:15:01', '2025-08-31 23:24:26', NULL);
INSERT INTO `sys_menu` VALUES (245, 228, '0,224,228', '订单删除', 4, NULL, NULL, NULL, 'aioveuSalesOrder:aioveu-sales-order:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:15:11', '2025-08-31 23:24:30', NULL);
INSERT INTO `sys_menu` VALUES (246, 229, '0,224,229', '订单明细查询', 4, NULL, NULL, NULL, 'aioveuSalesOrderDetail:aioveu-sales-order-detail:query', 0, 1, 1, 1, NULL, NULL, '2025-08-31 23:15:26', '2025-08-31 23:15:26', NULL);
INSERT INTO `sys_menu` VALUES (247, 229, '0,224,229', '订单明细新增', 4, NULL, NULL, NULL, 'aioveuSalesOrderDetail:aioveu-sales-order-detail:add', 0, 1, 1, 2, NULL, NULL, '2025-08-31 23:15:37', '2025-08-31 23:15:37', NULL);
INSERT INTO `sys_menu` VALUES (248, 229, '0,224,229', '订单明细编辑', 4, NULL, NULL, NULL, 'aioveuSalesOrderDetail:aioveu-sales-order-detail:edit', 0, 1, 1, 3, NULL, NULL, '2025-08-31 23:15:47', '2025-08-31 23:15:47', NULL);
INSERT INTO `sys_menu` VALUES (249, 229, '0,224,229', '订单明细删除', 4, NULL, NULL, NULL, 'aioveuSalesOrderDetail:aioveu-sales-order-detail:delete', 0, 1, 1, 4, NULL, NULL, '2025-08-31 23:15:57', '2025-08-31 23:26:52', NULL);
INSERT INTO `sys_menu` VALUES (250, 0, '0', '会员管理', 2, NULL, '/member', 'Layout', NULL, 1, 1, 1, 4, 'todo', NULL, '2025-09-27 15:00:34', '2025-09-27 15:00:34', NULL);
INSERT INTO `sys_menu` VALUES (251, 250, '0,250', '会员等级管理', 1, 'aioveu_member_level', 'aioveu_member_level', 'aioveuMemberLevel/aioveu-member-level/index', NULL, 1, 1, 1, 1, 'todo', NULL, '2025-09-27 15:02:32', '2025-09-27 15:02:32', NULL);
INSERT INTO `sys_menu` VALUES (252, 251, '0,250,251', '会员等级查询', 4, NULL, NULL, NULL, 'aioveuMemberLevel:aioveu-member-level:query', 0, 1, 1, 1, NULL, NULL, '2025-09-27 15:07:40', '2025-09-27 15:07:40', NULL);
INSERT INTO `sys_menu` VALUES (253, 251, '0,250,251', '会员等级新增', 4, NULL, NULL, NULL, 'aioveuMemberLevel:aioveu-member-level:add', 0, 1, 1, 2, NULL, NULL, '2025-09-27 15:08:01', '2025-09-27 15:08:01', NULL);
INSERT INTO `sys_menu` VALUES (254, 251, '0,250,251', '会员等级编辑', 4, NULL, NULL, NULL, 'aioveuMemberLevel:aioveu-member-level:edit', 0, 1, 1, 3, NULL, NULL, '2025-09-27 15:09:01', '2025-09-27 15:09:01', NULL);
INSERT INTO `sys_menu` VALUES (255, 251, '0,250,251', '会员等级删除', 4, NULL, NULL, NULL, 'aioveuMemberLevel:aioveu-member-level:delete', 0, 1, 1, 4, NULL, NULL, '2025-09-27 15:09:17', '2025-09-27 15:09:17', NULL);
INSERT INTO `sys_menu` VALUES (256, 250, '0,250', '会员信息', 1, 'AioveuMember', 'aioveu-member', 'aioveuMember/aioveu-member/index', NULL, 0, 0, 1, 2, NULL, NULL, '2025-09-27 15:14:01', '2025-09-27 15:14:01', NULL);
INSERT INTO `sys_menu` VALUES (257, 256, '0,250,257', '查询', 4, NULL, NULL, NULL, 'aioveuMember:aioveu-member:query', 0, 0, 1, 1, NULL, NULL, '2025-09-27 15:14:02', '2025-09-27 15:14:02', NULL);
INSERT INTO `sys_menu` VALUES (258, 256, '0,250,258', '新增', 4, NULL, NULL, NULL, 'aioveuMember:aioveu-member:add', 0, 0, 1, 2, NULL, NULL, '2025-09-27 15:14:02', '2025-09-27 15:14:02', NULL);
INSERT INTO `sys_menu` VALUES (259, 256, '0,250,259', '编辑', 4, NULL, NULL, NULL, 'aioveuMember:aioveu-member:edit', 0, 0, 1, 3, NULL, NULL, '2025-09-27 15:14:02', '2025-09-27 15:14:02', NULL);
INSERT INTO `sys_menu` VALUES (260, 256, '0,250,260', '删除', 4, NULL, NULL, NULL, 'aioveuMember:aioveu-member:delete', 0, 0, 1, 4, NULL, NULL, '2025-09-27 15:14:02', '2025-09-27 15:14:02', NULL);
INSERT INTO `sys_menu` VALUES (261, 250, '0,250', '会员充值账户', 1, 'AioveuMemberAccount', 'aioveu-member-account', 'aioveuMemberAccount/aioveu-member-account/index', NULL, 0, 0, 1, 3, NULL, NULL, '2025-09-30 17:02:11', '2025-09-30 17:02:11', NULL);
INSERT INTO `sys_menu` VALUES (262, 261, '0,250,262', '查询', 4, NULL, NULL, NULL, 'aioveuMemberAccount:aioveu-member-account:query', 0, 0, 1, 1, NULL, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12', NULL);
INSERT INTO `sys_menu` VALUES (263, 261, '0,250,263', '新增', 4, NULL, NULL, NULL, 'aioveuMemberAccount:aioveu-member-account:add', 0, 0, 1, 2, NULL, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12', NULL);
INSERT INTO `sys_menu` VALUES (264, 261, '0,250,264', '编辑', 4, NULL, NULL, NULL, 'aioveuMemberAccount:aioveu-member-account:edit', 0, 0, 1, 3, NULL, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12', NULL);
INSERT INTO `sys_menu` VALUES (265, 261, '0,250,265', '删除', 4, NULL, NULL, NULL, 'aioveuMemberAccount:aioveu-member-account:delete', 0, 0, 1, 4, NULL, NULL, '2025-09-30 17:02:12', '2025-09-30 17:02:12', NULL);
INSERT INTO `sys_menu` VALUES (266, 250, '0,250', '会员充值记录', 1, 'AioveuMemberRechargeRecord', 'aioveu-member-recharge-record', 'aioveuMemberRechargeRecord/aioveu-member-recharge-record/index', NULL, 0, 0, 1, 4, NULL, NULL, '2025-09-30 17:08:12', '2025-09-30 17:08:12', NULL);
INSERT INTO `sys_menu` VALUES (267, 266, '0,250,267', '查询', 4, NULL, NULL, NULL, 'aioveuMemberRechargeRecord:aioveu-member-recharge-record:query', 0, 0, 1, 1, NULL, NULL, '2025-09-30 17:08:12', '2025-09-30 17:08:12', NULL);
INSERT INTO `sys_menu` VALUES (268, 266, '0,250,268', '新增', 4, NULL, NULL, NULL, 'aioveuMemberRechargeRecord:aioveu-member-recharge-record:add', 0, 0, 1, 2, NULL, NULL, '2025-09-30 17:08:12', '2025-09-30 17:08:12', NULL);
INSERT INTO `sys_menu` VALUES (269, 266, '0,250,269', '编辑', 4, NULL, NULL, NULL, 'aioveuMemberRechargeRecord:aioveu-member-recharge-record:edit', 0, 0, 1, 3, NULL, NULL, '2025-09-30 17:08:13', '2025-09-30 17:08:13', NULL);
INSERT INTO `sys_menu` VALUES (270, 266, '0,250,270', '删除', 4, NULL, NULL, NULL, 'aioveuMemberRechargeRecord:aioveu-member-recharge-record:delete', 0, 0, 1, 4, NULL, NULL, '2025-09-30 17:08:13', '2025-09-30 17:08:13', NULL);
INSERT INTO `sys_menu` VALUES (271, 0, '0', '洗衣业务', 2, NULL, '/laundry', 'Layout', NULL, 1, 1, 1, 4, 'project', NULL, '2025-09-30 17:41:15', '2025-09-30 17:41:15', NULL);
INSERT INTO `sys_menu` VALUES (272, 271, '0,271', '洗衣订单', 1, 'AioveuLaundryOrder', 'aioveu-laundry-order', 'aioveuLaundryOrder/aioveu-laundry-order/index', NULL, 0, 0, 1, 1, NULL, NULL, '2025-09-30 17:43:28', '2025-09-30 17:43:28', NULL);
INSERT INTO `sys_menu` VALUES (273, 272, '0,271,273', '查询', 4, NULL, NULL, NULL, 'aioveuLaundryOrder:aioveu-laundry-order:query', 0, 0, 1, 1, NULL, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29', NULL);
INSERT INTO `sys_menu` VALUES (274, 272, '0,271,274', '新增', 4, NULL, NULL, NULL, 'aioveuLaundryOrder:aioveu-laundry-order:add', 0, 0, 1, 2, NULL, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29', NULL);
INSERT INTO `sys_menu` VALUES (275, 272, '0,271,275', '编辑', 4, NULL, NULL, NULL, 'aioveuLaundryOrder:aioveu-laundry-order:edit', 0, 0, 1, 3, NULL, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29', NULL);
INSERT INTO `sys_menu` VALUES (276, 272, '0,271,276', '删除', 4, NULL, NULL, NULL, 'aioveuLaundryOrder:aioveu-laundry-order:delete', 0, 0, 1, 4, NULL, NULL, '2025-09-30 17:43:29', '2025-09-30 17:43:29', NULL);
INSERT INTO `sys_menu` VALUES (277, 271, '0,271', '衣物类型', 1, 'AioveuLaundryClothingType', 'aioveu-laundry-clothing-type', 'aioveuLaundryClothingType/aioveu-laundry-clothing-type/index', NULL, 0, 0, 1, 2, NULL, NULL, '2025-09-30 17:48:47', '2025-09-30 17:48:47', NULL);
INSERT INTO `sys_menu` VALUES (278, 277, '0,271,278', '查询', 4, NULL, NULL, NULL, 'aioveuLaundryClothingType:aioveu-laundry-clothing-type:query', 0, 0, 1, 1, NULL, NULL, '2025-09-30 17:48:47', '2025-09-30 17:48:47', NULL);
INSERT INTO `sys_menu` VALUES (279, 277, '0,271,279', '新增', 4, NULL, NULL, NULL, 'aioveuLaundryClothingType:aioveu-laundry-clothing-type:add', 0, 0, 1, 2, NULL, NULL, '2025-09-30 17:48:47', '2025-09-30 17:48:47', NULL);
INSERT INTO `sys_menu` VALUES (280, 277, '0,271,280', '编辑', 4, NULL, NULL, NULL, 'aioveuLaundryClothingType:aioveu-laundry-clothing-type:edit', 0, 0, 1, 3, NULL, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48', NULL);
INSERT INTO `sys_menu` VALUES (281, 277, '0,271,281', '删除', 4, NULL, NULL, NULL, 'aioveuLaundryClothingType:aioveu-laundry-clothing-type:delete', 0, 0, 1, 4, NULL, NULL, '2025-09-30 17:48:48', '2025-09-30 17:48:48', NULL);
INSERT INTO `sys_menu` VALUES (282, 271, '0,271', '洗衣订单衣物明细', 1, 'AioveuLaundryOrderItem', 'aioveu-laundry-order-item', 'aioveuLaundryOrderItem/aioveu-laundry-order-item/index', NULL, 0, 0, 1, 3, NULL, NULL, '2025-09-30 17:55:20', '2025-09-30 17:55:20', NULL);
INSERT INTO `sys_menu` VALUES (283, 282, '0,271,283', '查询', 4, NULL, NULL, NULL, 'aioveuLaundryOrderItem:aioveu-laundry-order-item:query', 0, 0, 1, 1, NULL, NULL, '2025-09-30 17:55:20', '2025-09-30 17:55:20', NULL);
INSERT INTO `sys_menu` VALUES (284, 282, '0,271,284', '新增', 4, NULL, NULL, NULL, 'aioveuLaundryOrderItem:aioveu-laundry-order-item:add', 0, 0, 1, 2, NULL, NULL, '2025-09-30 17:55:20', '2025-09-30 17:55:20', NULL);
INSERT INTO `sys_menu` VALUES (285, 282, '0,271,285', '编辑', 4, NULL, NULL, NULL, 'aioveuLaundryOrderItem:aioveu-laundry-order-item:edit', 0, 0, 1, 3, NULL, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21', NULL);
INSERT INTO `sys_menu` VALUES (286, 282, '0,271,286', '删除', 4, NULL, NULL, NULL, 'aioveuLaundryOrderItem:aioveu-laundry-order-item:delete', 0, 0, 1, 4, NULL, NULL, '2025-09-30 17:55:21', '2025-09-30 17:55:21', NULL);
INSERT INTO `sys_menu` VALUES (287, 271, '0,271', '洗衣流程图片记录', 1, 'AioveuLaundryProcessImage', 'aioveu-laundry-process-image', 'aioveuLaundryProcessImage/aioveu-laundry-process-image/index', NULL, 0, 0, 1, 4, NULL, NULL, '2025-09-30 17:58:39', '2025-09-30 17:58:39', NULL);
INSERT INTO `sys_menu` VALUES (288, 287, '0,271,288', '查询', 4, NULL, NULL, NULL, 'aioveuLaundryProcessImage:aioveu-laundry-process-image:query', 0, 0, 1, 1, NULL, NULL, '2025-09-30 17:58:39', '2025-09-30 17:58:39', NULL);
INSERT INTO `sys_menu` VALUES (289, 287, '0,271,289', '新增', 4, NULL, NULL, NULL, 'aioveuLaundryProcessImage:aioveu-laundry-process-image:add', 0, 0, 1, 2, NULL, NULL, '2025-09-30 17:58:39', '2025-09-30 17:58:39', NULL);
INSERT INTO `sys_menu` VALUES (290, 287, '0,271,290', '编辑', 4, NULL, NULL, NULL, 'aioveuLaundryProcessImage:aioveu-laundry-process-image:edit', 0, 0, 1, 3, NULL, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40', NULL);
INSERT INTO `sys_menu` VALUES (291, 287, '0,271,291', '删除', 4, NULL, NULL, NULL, 'aioveuLaundryProcessImage:aioveu-laundry-process-image:delete', 0, 0, 1, 4, NULL, NULL, '2025-09-30 17:58:40', '2025-09-30 17:58:40', NULL);
INSERT INTO `sys_menu` VALUES (292, 266, '0,250,266', '会员充值', 4, NULL, NULL, NULL, 'aioveuMemberRechargeRecord:aioveu-member-recharge-record:recharge', 0, 1, 1, 5, NULL, NULL, '2025-10-03 01:53:08', '2025-10-03 01:53:08', NULL);
INSERT INTO `sys_menu` VALUES (293, 287, '0,271,287', '导出', 4, NULL, NULL, NULL, 'aioveuLaundryProcessImage:aioveu-laundry-process-image:export', 0, 1, 1, 5, NULL, NULL, '2025-10-08 00:09:48', '2025-10-08 00:09:48', NULL);
INSERT INTO `sys_menu` VALUES (294, 287, '0,271,287', '导入', 4, NULL, NULL, NULL, 'aioveuLaundryProcessImage:aioveu-laundry-process-image:import', 0, 1, 1, 6, NULL, NULL, '2025-10-08 00:10:05', '2025-10-08 00:10:05', NULL);
INSERT INTO `sys_menu` VALUES (295, 287, '0,271,287', '模板下载', 4, NULL, NULL, NULL, 'aioveuLaundryProcessImage:aioveu-laundry-process-image:template', 0, 1, 1, 7, NULL, NULL, '2025-10-08 00:10:24', '2025-10-08 00:10:24', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '通知标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '通知内容',
  `type` tinyint NOT NULL COMMENT '通知类型（关联字典编码：notice_type）',
  `level` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知等级（字典code：notice_level）',
  `target_type` tinyint NOT NULL COMMENT '目标类型（1: 全体, 2: 指定）',
  `target_user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标人ID集合（多个使用英文逗号,分割）',
  `publisher_id` bigint NULL DEFAULT NULL COMMENT '发布人ID',
  `publish_status` tinyint NULL DEFAULT 0 COMMENT '发布状态（0: 未发布, 1: 已发布, -1: 已撤回）',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `revoke_time` datetime NULL DEFAULT NULL COMMENT '撤回时间',
  `create_by` bigint NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除（0: 未删除, 1: 已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, 'v2.12.0 新增系统日志，访问趋势统计功能。', '<p>1. 消息通知</p><p>2. 字典重构</p><p>3. 代码生成</p>', 1, 'L', 1, '2', 1, 1, '2025-08-31 19:27:53', '2025-08-31 19:27:53', 2, '2025-08-31 19:27:53', 1, '2025-08-31 19:27:53', 0);
INSERT INTO `sys_notice` VALUES (2, 'v2.13.0 新增菜单搜索。', '<p>1. 消息通知</p><p>2. 字典重构</p><p>3. 代码生成</p>', 1, 'L', 1, '2', 1, 1, '2025-08-31 19:27:53', '2025-08-31 19:27:53', 2, '2025-08-31 19:27:53', 1, '2025-08-31 19:27:53', 0);
INSERT INTO `sys_notice` VALUES (3, 'v2.14.0 新增个人中心。', '<p>1. 消息通知</p><p>2. 字典重构</p><p>3. 代码生成</p>', 1, 'L', 1, '2', 2, 1, '2025-08-31 19:27:53', '2025-08-31 19:27:53', 2, '2025-08-31 19:27:53', 2, '2025-08-31 19:27:53', 0);
INSERT INTO `sys_notice` VALUES (4, 'v2.15.0 登录页面改造。', '<p>1. 消息通知</p><p>2. 字典重构</p><p>3. 代码生成</p>', 1, 'L', 1, '2', 2, 1, '2025-08-31 19:27:53', '2025-08-31 19:27:53', 2, '2025-08-31 19:27:53', 2, '2025-08-31 19:27:53', 0);
INSERT INTO `sys_notice` VALUES (5, 'v2.16.0 通知公告、字典翻译组件。', '<p>1. 消息通知</p><p>2. 字典重构</p><p>3. 代码生成</p>', 1, 'L', 1, '2', 2, 1, '2025-08-31 19:27:53', '2025-08-31 19:27:53', 2, '2025-08-31 19:27:53', 2, '2025-08-31 19:27:53', 0);
INSERT INTO `sys_notice` VALUES (6, '系统将于本周六凌晨 2 点进行维护，预计维护时间为 2 小时。', '<p>1. 消息通知</p><p>2. 字典重构</p><p>3. 代码生成</p>', 2, 'H', 1, '2', 2, 1, '2025-08-31 19:27:54', '2025-08-31 19:27:54', 2, '2025-08-31 19:27:54', 2, '2025-08-31 19:27:54', 0);
INSERT INTO `sys_notice` VALUES (7, '最近发现一些钓鱼邮件，请大家提高警惕，不要点击陌生链接。', '<p>1. 消息通知</p><p>2. 字典重构</p><p>3. 代码生成</p>', 3, 'L', 1, '2', 2, 1, '2025-08-31 19:27:54', '2025-08-31 19:27:54', 2, '2025-08-31 19:27:54', 2, '2025-08-31 19:27:54', 0);
INSERT INTO `sys_notice` VALUES (8, '国庆假期从 10 月 1 日至 10 月 7 日放假，共 7 天。', '<p>1. 消息通知</p><p>2. 字典重构</p><p>3. 代码生成</p>', 4, 'L', 1, '2', 2, 1, '2025-08-31 19:27:54', '2025-08-31 19:27:54', 2, '2025-08-31 19:27:54', 2, '2025-08-31 19:27:54', 0);
INSERT INTO `sys_notice` VALUES (9, '公司将在 10 月 15 日举办新产品发布会，敬请期待。', '公司将在 10 月 15 日举办新产品发布会，敬请期待。', 5, 'H', 1, '2', 2, 1, '2025-08-31 19:27:54', '2025-08-31 19:27:54', 2, '2025-08-31 19:27:54', 2, '2025-08-31 19:27:54', 0);
INSERT INTO `sys_notice` VALUES (10, 'v2.16.1 版本发布。', 'v2.16.1 版本修复了 WebSocket 重复连接导致的后台线程阻塞问题，优化了通知公告。', 1, 'M', 1, '2', 2, 1, '2025-08-31 19:27:54', '2025-08-31 19:27:54', 2, '2025-08-31 19:27:54', 2, '2025-08-31 19:27:54', 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '角色状态(1-正常 0-停用)',
  `data_scope` tinyint NULL DEFAULT NULL COMMENT '数据权限(1-所有数据 2-部门及子部门数据 3-本部门数据 4-本人数据)',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人 ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE COMMENT '角色名称唯一索引',
  UNIQUE INDEX `uk_code`(`code` ASC) USING BTREE COMMENT '角色编码唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'ROOT', 1, 1, 1, NULL, '2025-08-31 19:27:39', NULL, '2025-08-31 19:27:39', 0);
INSERT INTO `sys_role` VALUES (2, '系统管理员', 'ADMIN', 2, 1, 1, NULL, '2025-08-31 19:27:39', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (3, '访问游客', 'GUEST', 3, 1, 3, NULL, '2025-08-31 19:27:39', NULL, '2025-08-31 19:27:39', 0);
INSERT INTO `sys_role` VALUES (4, '系统管理员1', 'ADMIN1', 4, 1, 4, NULL, '2025-08-31 19:27:39', NULL, '2025-09-02 15:24:19', 0);
INSERT INTO `sys_role` VALUES (5, '系统管理员2', 'ADMIN2', 5, 1, 1, NULL, '2025-08-31 19:27:39', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (6, '系统管理员3', 'ADMIN3', 6, 1, 1, NULL, '2025-08-31 19:27:39', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (7, '系统管理员4', 'ADMIN4', 7, 1, 1, NULL, '2025-08-31 19:27:39', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (8, '系统管理员5', 'ADMIN5', 8, 1, 1, NULL, '2025-08-31 19:27:39', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (9, '系统管理员6', 'ADMIN6', 9, 1, 1, NULL, '2025-08-31 19:27:39', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (10, '系统管理员7', 'ADMIN7', 10, 1, 1, NULL, '2025-08-31 19:27:39', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (11, '系统管理员8', 'ADMIN8', 11, 1, 1, NULL, '2025-08-31 19:27:39', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (12, '系统管理员9', 'ADMIN9', 12, 1, 1, NULL, '2025-08-31 19:27:39', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  UNIQUE INDEX `uk_roleid_menuid`(`role_id` ASC, `menu_id` ASC) USING BTREE COMMENT '角色菜单唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 20);
INSERT INTO `sys_role_menu` VALUES (2, 21);
INSERT INTO `sys_role_menu` VALUES (2, 22);
INSERT INTO `sys_role_menu` VALUES (2, 23);
INSERT INTO `sys_role_menu` VALUES (2, 24);
INSERT INTO `sys_role_menu` VALUES (2, 26);
INSERT INTO `sys_role_menu` VALUES (2, 30);
INSERT INTO `sys_role_menu` VALUES (2, 31);
INSERT INTO `sys_role_menu` VALUES (2, 32);
INSERT INTO `sys_role_menu` VALUES (2, 33);
INSERT INTO `sys_role_menu` VALUES (2, 36);
INSERT INTO `sys_role_menu` VALUES (2, 37);
INSERT INTO `sys_role_menu` VALUES (2, 38);
INSERT INTO `sys_role_menu` VALUES (2, 39);
INSERT INTO `sys_role_menu` VALUES (2, 40);
INSERT INTO `sys_role_menu` VALUES (2, 41);
INSERT INTO `sys_role_menu` VALUES (2, 70);
INSERT INTO `sys_role_menu` VALUES (2, 71);
INSERT INTO `sys_role_menu` VALUES (2, 72);
INSERT INTO `sys_role_menu` VALUES (2, 73);
INSERT INTO `sys_role_menu` VALUES (2, 74);
INSERT INTO `sys_role_menu` VALUES (2, 75);
INSERT INTO `sys_role_menu` VALUES (2, 76);
INSERT INTO `sys_role_menu` VALUES (2, 77);
INSERT INTO `sys_role_menu` VALUES (2, 78);
INSERT INTO `sys_role_menu` VALUES (2, 79);
INSERT INTO `sys_role_menu` VALUES (2, 81);
INSERT INTO `sys_role_menu` VALUES (2, 84);
INSERT INTO `sys_role_menu` VALUES (2, 88);
INSERT INTO `sys_role_menu` VALUES (2, 89);
INSERT INTO `sys_role_menu` VALUES (2, 90);
INSERT INTO `sys_role_menu` VALUES (2, 95);
INSERT INTO `sys_role_menu` VALUES (2, 97);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 118);
INSERT INTO `sys_role_menu` VALUES (2, 119);
INSERT INTO `sys_role_menu` VALUES (2, 120);
INSERT INTO `sys_role_menu` VALUES (2, 121);
INSERT INTO `sys_role_menu` VALUES (2, 122);
INSERT INTO `sys_role_menu` VALUES (2, 123);
INSERT INTO `sys_role_menu` VALUES (2, 124);
INSERT INTO `sys_role_menu` VALUES (2, 125);
INSERT INTO `sys_role_menu` VALUES (2, 126);
INSERT INTO `sys_role_menu` VALUES (2, 127);
INSERT INTO `sys_role_menu` VALUES (2, 128);
INSERT INTO `sys_role_menu` VALUES (2, 129);
INSERT INTO `sys_role_menu` VALUES (2, 130);
INSERT INTO `sys_role_menu` VALUES (2, 133);
INSERT INTO `sys_role_menu` VALUES (2, 134);
INSERT INTO `sys_role_menu` VALUES (2, 135);
INSERT INTO `sys_role_menu` VALUES (2, 136);
INSERT INTO `sys_role_menu` VALUES (2, 137);
INSERT INTO `sys_role_menu` VALUES (2, 138);
INSERT INTO `sys_role_menu` VALUES (2, 139);
INSERT INTO `sys_role_menu` VALUES (2, 140);
INSERT INTO `sys_role_menu` VALUES (2, 141);
INSERT INTO `sys_role_menu` VALUES (2, 142);
INSERT INTO `sys_role_menu` VALUES (2, 143);
INSERT INTO `sys_role_menu` VALUES (2, 144);
INSERT INTO `sys_role_menu` VALUES (2, 145);
INSERT INTO `sys_role_menu` VALUES (2, 146);
INSERT INTO `sys_role_menu` VALUES (2, 147);
INSERT INTO `sys_role_menu` VALUES (2, 148);
INSERT INTO `sys_role_menu` VALUES (2, 149);
INSERT INTO `sys_role_menu` VALUES (2, 150);
INSERT INTO `sys_role_menu` VALUES (2, 151);
INSERT INTO `sys_role_menu` VALUES (2, 152);
INSERT INTO `sys_role_menu` VALUES (2, 153);
INSERT INTO `sys_role_menu` VALUES (2, 154);
INSERT INTO `sys_role_menu` VALUES (2, 155);
INSERT INTO `sys_role_menu` VALUES (2, 156);
INSERT INTO `sys_role_menu` VALUES (2, 157);
INSERT INTO `sys_role_menu` VALUES (2, 158);
INSERT INTO `sys_role_menu` VALUES (2, 159);
INSERT INTO `sys_role_menu` VALUES (2, 160);
INSERT INTO `sys_role_menu` VALUES (2, 161);
INSERT INTO `sys_role_menu` VALUES (2, 162);
INSERT INTO `sys_role_menu` VALUES (2, 163);
INSERT INTO `sys_role_menu` VALUES (2, 164);
INSERT INTO `sys_role_menu` VALUES (2, 165);
INSERT INTO `sys_role_menu` VALUES (2, 166);
INSERT INTO `sys_role_menu` VALUES (2, 167);
INSERT INTO `sys_role_menu` VALUES (2, 168);
INSERT INTO `sys_role_menu` VALUES (2, 169);
INSERT INTO `sys_role_menu` VALUES (2, 170);
INSERT INTO `sys_role_menu` VALUES (2, 171);
INSERT INTO `sys_role_menu` VALUES (2, 172);
INSERT INTO `sys_role_menu` VALUES (2, 173);
INSERT INTO `sys_role_menu` VALUES (2, 174);
INSERT INTO `sys_role_menu` VALUES (2, 175);
INSERT INTO `sys_role_menu` VALUES (2, 176);
INSERT INTO `sys_role_menu` VALUES (2, 178);
INSERT INTO `sys_role_menu` VALUES (2, 179);
INSERT INTO `sys_role_menu` VALUES (2, 180);
INSERT INTO `sys_role_menu` VALUES (2, 181);
INSERT INTO `sys_role_menu` VALUES (2, 182);
INSERT INTO `sys_role_menu` VALUES (2, 183);
INSERT INTO `sys_role_menu` VALUES (2, 184);
INSERT INTO `sys_role_menu` VALUES (2, 185);
INSERT INTO `sys_role_menu` VALUES (2, 186);
INSERT INTO `sys_role_menu` VALUES (2, 187);
INSERT INTO `sys_role_menu` VALUES (2, 188);
INSERT INTO `sys_role_menu` VALUES (2, 189);
INSERT INTO `sys_role_menu` VALUES (2, 190);
INSERT INTO `sys_role_menu` VALUES (2, 191);
INSERT INTO `sys_role_menu` VALUES (2, 192);
INSERT INTO `sys_role_menu` VALUES (2, 194);
INSERT INTO `sys_role_menu` VALUES (2, 195);
INSERT INTO `sys_role_menu` VALUES (2, 196);
INSERT INTO `sys_role_menu` VALUES (2, 197);
INSERT INTO `sys_role_menu` VALUES (2, 198);
INSERT INTO `sys_role_menu` VALUES (2, 200);
INSERT INTO `sys_role_menu` VALUES (2, 201);
INSERT INTO `sys_role_menu` VALUES (2, 202);
INSERT INTO `sys_role_menu` VALUES (2, 203);
INSERT INTO `sys_role_menu` VALUES (2, 204);
INSERT INTO `sys_role_menu` VALUES (2, 205);
INSERT INTO `sys_role_menu` VALUES (2, 206);
INSERT INTO `sys_role_menu` VALUES (2, 207);
INSERT INTO `sys_role_menu` VALUES (2, 208);
INSERT INTO `sys_role_menu` VALUES (2, 209);
INSERT INTO `sys_role_menu` VALUES (2, 210);
INSERT INTO `sys_role_menu` VALUES (2, 211);
INSERT INTO `sys_role_menu` VALUES (2, 212);
INSERT INTO `sys_role_menu` VALUES (2, 213);
INSERT INTO `sys_role_menu` VALUES (2, 214);
INSERT INTO `sys_role_menu` VALUES (2, 215);
INSERT INTO `sys_role_menu` VALUES (2, 216);
INSERT INTO `sys_role_menu` VALUES (2, 217);
INSERT INTO `sys_role_menu` VALUES (2, 218);
INSERT INTO `sys_role_menu` VALUES (2, 219);
INSERT INTO `sys_role_menu` VALUES (2, 220);
INSERT INTO `sys_role_menu` VALUES (2, 221);
INSERT INTO `sys_role_menu` VALUES (2, 222);
INSERT INTO `sys_role_menu` VALUES (2, 223);
INSERT INTO `sys_role_menu` VALUES (2, 224);
INSERT INTO `sys_role_menu` VALUES (2, 225);
INSERT INTO `sys_role_menu` VALUES (2, 226);
INSERT INTO `sys_role_menu` VALUES (2, 227);
INSERT INTO `sys_role_menu` VALUES (2, 228);
INSERT INTO `sys_role_menu` VALUES (2, 229);
INSERT INTO `sys_role_menu` VALUES (2, 230);
INSERT INTO `sys_role_menu` VALUES (2, 231);
INSERT INTO `sys_role_menu` VALUES (2, 232);
INSERT INTO `sys_role_menu` VALUES (2, 233);
INSERT INTO `sys_role_menu` VALUES (2, 234);
INSERT INTO `sys_role_menu` VALUES (2, 235);
INSERT INTO `sys_role_menu` VALUES (2, 236);
INSERT INTO `sys_role_menu` VALUES (2, 237);
INSERT INTO `sys_role_menu` VALUES (2, 238);
INSERT INTO `sys_role_menu` VALUES (2, 239);
INSERT INTO `sys_role_menu` VALUES (2, 240);
INSERT INTO `sys_role_menu` VALUES (2, 241);
INSERT INTO `sys_role_menu` VALUES (2, 242);
INSERT INTO `sys_role_menu` VALUES (2, 243);
INSERT INTO `sys_role_menu` VALUES (2, 244);
INSERT INTO `sys_role_menu` VALUES (2, 245);
INSERT INTO `sys_role_menu` VALUES (2, 246);
INSERT INTO `sys_role_menu` VALUES (2, 247);
INSERT INTO `sys_role_menu` VALUES (2, 248);
INSERT INTO `sys_role_menu` VALUES (2, 249);
INSERT INTO `sys_role_menu` VALUES (2, 250);
INSERT INTO `sys_role_menu` VALUES (2, 251);
INSERT INTO `sys_role_menu` VALUES (2, 252);
INSERT INTO `sys_role_menu` VALUES (2, 253);
INSERT INTO `sys_role_menu` VALUES (2, 254);
INSERT INTO `sys_role_menu` VALUES (2, 255);
INSERT INTO `sys_role_menu` VALUES (2, 256);
INSERT INTO `sys_role_menu` VALUES (2, 257);
INSERT INTO `sys_role_menu` VALUES (2, 258);
INSERT INTO `sys_role_menu` VALUES (2, 259);
INSERT INTO `sys_role_menu` VALUES (2, 260);
INSERT INTO `sys_role_menu` VALUES (2, 261);
INSERT INTO `sys_role_menu` VALUES (2, 262);
INSERT INTO `sys_role_menu` VALUES (2, 263);
INSERT INTO `sys_role_menu` VALUES (2, 264);
INSERT INTO `sys_role_menu` VALUES (2, 265);
INSERT INTO `sys_role_menu` VALUES (2, 266);
INSERT INTO `sys_role_menu` VALUES (2, 267);
INSERT INTO `sys_role_menu` VALUES (2, 268);
INSERT INTO `sys_role_menu` VALUES (2, 269);
INSERT INTO `sys_role_menu` VALUES (2, 270);
INSERT INTO `sys_role_menu` VALUES (2, 271);
INSERT INTO `sys_role_menu` VALUES (2, 272);
INSERT INTO `sys_role_menu` VALUES (2, 273);
INSERT INTO `sys_role_menu` VALUES (2, 274);
INSERT INTO `sys_role_menu` VALUES (2, 275);
INSERT INTO `sys_role_menu` VALUES (2, 276);
INSERT INTO `sys_role_menu` VALUES (2, 277);
INSERT INTO `sys_role_menu` VALUES (2, 278);
INSERT INTO `sys_role_menu` VALUES (2, 279);
INSERT INTO `sys_role_menu` VALUES (2, 280);
INSERT INTO `sys_role_menu` VALUES (2, 281);
INSERT INTO `sys_role_menu` VALUES (2, 282);
INSERT INTO `sys_role_menu` VALUES (2, 283);
INSERT INTO `sys_role_menu` VALUES (2, 284);
INSERT INTO `sys_role_menu` VALUES (2, 285);
INSERT INTO `sys_role_menu` VALUES (2, 286);
INSERT INTO `sys_role_menu` VALUES (2, 287);
INSERT INTO `sys_role_menu` VALUES (2, 288);
INSERT INTO `sys_role_menu` VALUES (2, 289);
INSERT INTO `sys_role_menu` VALUES (2, 290);
INSERT INTO `sys_role_menu` VALUES (2, 291);
INSERT INTO `sys_role_menu` VALUES (2, 292);
INSERT INTO `sys_role_menu` VALUES (2, 293);
INSERT INTO `sys_role_menu` VALUES (2, 294);
INSERT INTO `sys_role_menu` VALUES (2, 295);
INSERT INTO `sys_role_menu` VALUES (3, 149);
INSERT INTO `sys_role_menu` VALUES (3, 150);
INSERT INTO `sys_role_menu` VALUES (3, 151);
INSERT INTO `sys_role_menu` VALUES (3, 152);
INSERT INTO `sys_role_menu` VALUES (3, 153);
INSERT INTO `sys_role_menu` VALUES (3, 154);
INSERT INTO `sys_role_menu` VALUES (4, 149);
INSERT INTO `sys_role_menu` VALUES (4, 150);
INSERT INTO `sys_role_menu` VALUES (4, 151);
INSERT INTO `sys_role_menu` VALUES (4, 152);
INSERT INTO `sys_role_menu` VALUES (4, 153);
INSERT INTO `sys_role_menu` VALUES (4, 154);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` tinyint(1) NULL DEFAULT 1 COMMENT '性别((1-男 2-女 0-保密)',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门ID',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态(1-正常 0-禁用)',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人ID',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除标识(0-未删除 1-已删除)',
  `openid` char(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信 openid',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', '可我不敌可爱', 0, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', NULL, 'https://minio.aioveu.com/aioveu/20250810/352485413d814dee87d9b7160dfe916e.png', '13061656199', 1, 'ambitiouschild@qq.com', '2025-08-31 19:27:48', NULL, '2025-08-31 19:27:48', NULL, 0, NULL);
INSERT INTO `sys_user` VALUES (2, 'admin', '系统管理员', 1, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', 1, 'https://minio.aioveu.com/aioveu/20250810/352485413d814dee87d9b7160dfe916e.png', '13061656199', 1, 'ambitiouschild@qq.com', '2025-08-31 19:27:48', NULL, '2025-08-31 19:27:48', NULL, 0, NULL);
INSERT INTO `sys_user` VALUES (3, 'test', '测试小用户', 1, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', 3, 'https://minio.aioveu.com/aioveu/20250810/352485413d814dee87d9b7160dfe916e.png', '13061656199', 1, 'ambitiouschild@qq.com', '2025-08-31 19:27:48', NULL, '2025-08-31 19:27:48', NULL, 0, NULL);
INSERT INTO `sys_user` VALUES (4, 'aioveu', '可我不敌可爱', 1, '$2a$10$yTnPzczp2Pr9VMrXDKd60eu0Nlp5rhQ27saGitg/pdrhdbMlhAi0W', 1, 'https://minio.aioveu.com/aioveu/20250810/352485413d814dee87d9b7160dfe916e.png', '13061656199', 1, 'ambitiouschild@qq.com', '2025-08-31 20:05:27', 2, '2025-08-31 20:06:16', NULL, 0, NULL);
INSERT INTO `sys_user` VALUES (5, 'admin1', '系统管理员1', 1, '$2a$10$iuzQMAgT5nnaQkO02vzBfO8N5KTMjGX30OFjGUDARcYs256CqAH6i', 2, 'https://minio.aioveu.com/aioveu/20250810/352485413d814dee87d9b7160dfe916e.png', NULL, 1, NULL, '2025-09-02 15:25:09', 4, '2025-09-02 15:25:09', NULL, 0, NULL);

-- ----------------------------
-- Table structure for sys_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_notice`;
CREATE TABLE `sys_user_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `notice_id` bigint NOT NULL COMMENT '公共通知id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `is_read` bigint NULL DEFAULT 0 COMMENT '读取状态（0: 未读, 1: 已读）',
  `read_time` datetime NULL DEFAULT NULL COMMENT '阅读时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除(0: 未删除, 1: 已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_notice
-- ----------------------------
INSERT INTO `sys_user_notice` VALUES (1, 1, 2, 1, NULL, '2025-08-31 19:27:55', '2025-08-31 19:27:55', 0);
INSERT INTO `sys_user_notice` VALUES (2, 2, 2, 1, NULL, '2025-08-31 19:27:55', '2025-08-31 19:27:55', 0);
INSERT INTO `sys_user_notice` VALUES (3, 3, 2, 1, NULL, '2025-08-31 19:27:55', '2025-08-31 19:27:55', 0);
INSERT INTO `sys_user_notice` VALUES (4, 4, 2, 1, NULL, '2025-08-31 19:27:55', '2025-08-31 19:27:55', 0);
INSERT INTO `sys_user_notice` VALUES (5, 5, 2, 1, NULL, '2025-08-31 19:27:55', '2025-08-31 19:27:55', 0);
INSERT INTO `sys_user_notice` VALUES (6, 6, 2, 1, NULL, '2025-08-31 19:27:55', '2025-08-31 19:27:55', 0);
INSERT INTO `sys_user_notice` VALUES (7, 7, 2, 1, NULL, '2025-08-31 19:27:55', '2025-08-31 19:27:55', 0);
INSERT INTO `sys_user_notice` VALUES (8, 8, 2, 1, NULL, '2025-08-31 19:27:56', '2025-08-31 19:27:56', 0);
INSERT INTO `sys_user_notice` VALUES (9, 9, 2, 1, NULL, '2025-08-31 19:27:56', '2025-08-31 19:27:56', 0);
INSERT INTO `sys_user_notice` VALUES (10, 10, 2, 1, NULL, '2025-08-31 19:27:56', '2025-08-31 19:27:56', 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (5, 4);

SET FOREIGN_KEY_CHECKS = 1;
