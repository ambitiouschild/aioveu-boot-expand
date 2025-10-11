

-- 1. 创建数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS aioveu_boot CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

use aioveu_boot;


-- 2. 创建表 && 数据初始化
-- 洗衣业务独立系统模块 -- 衣物流转记录表 (garment_tracking)
-- ----------------------------
-- DROP TABLE IF EXISTS `aioveu_laundry_garment_tracking`;

-- 创建衣物流转记录表 (garment_tracking)（规范化）
CREATE TABLE `aioveu_laundry_garment_tracking` (
                                                `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '衣物流转记录ID',
                                                `garment_code` bigint(20) unsigned NOT NULL COMMENT '衣物编码',
                                                `operation_type` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '操作类型,0-送厂清洗-SEND_FACTORY,1-工厂入库-FACTORY_IN,2-工厂出库-FACTORY_OUT,3-门店入库-STORE_IN,4-门店上挂-STORE_HANG,5-门店出库-STORE_OUT,6-返洗开始-RE_WASH_START',
                                                `operator_id` bigint(20) unsigned NOT NULL COMMENT '操作人ID',
                                                `location_id` bigint(20) unsigned NOT NULL COMMENT '位置ID（仓库/门店）',
                                                `remark` VARCHAR(255) COMMENT '备注',
                                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                PRIMARY KEY (`id`),
                                                KEY `idx_garment_code` (`garment_code`),
                                                KEY `idx_operation_time` (`create_time`),
                                                KEY `idx_operator` (`operator_id`),
                                                KEY `idx_location` (`location_id`),
                                                CONSTRAINT `fk_tracking_garment`
                                                    FOREIGN KEY (`garment_code`)
                                                        REFERENCES `aioveu_laundry_garment_identity` (`id`)
                                                        ON DELETE CASCADE,
                                                CONSTRAINT `fk_tracking_operator`
                                                        FOREIGN KEY (`operator_id`)
                                                        REFERENCES `aioveu_employee` (`employee_id`)
                                                        ON DELETE CASCADE,
                                                CONSTRAINT `fk_tracking_location`
                                                    FOREIGN KEY (`location_id`)
                                                        REFERENCES `aioveu_warehouse` (`id`)
                                                        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='衣物流转记录表';

-- 假设已存在衣物编码和员工数据
INSERT INTO `aioveu_laundry_garment_tracking`
(`garment_code`, `operation_type`, `operator_id`, `location_id`, `remark`)
VALUES
-- 衣物1的完整流程
(1, 1, 1, 1,  '门店送厂清洗'),
(1, 2, 1, 1,  '工厂入库'),
(1, 3, 2, 1,  '清洗完成出库'),
(1, 4, 2, 1, '门店入库'),
(1, 1, 3, 1, '门店上挂'),
(1, 2, 4, 1, '客户取走'),

-- 衣物2的流程（含返洗）
(2, 1, 1, 1,  '门店送厂清洗'),
(2, 2, 1, 2,  '工厂入库'),
(2, 2, 3, 3,  '质检不达标返洗'),
(2, 5, 2, 3,  '返洗后出库'),
(2, 6, 2, 1,  '门店入库'),

-- 衣物3的流程
(3, 1, 5, 1,  '分店送厂清洗'),
(3, 2, 4, 1,  '工厂B区入库'),
(3, 3, 5, 1,  '清洗完成出库');