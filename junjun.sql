/*
 Navicat Premium Data Transfer

 Source Server         : 001
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : junjun

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 25/06/2021 13:12:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int(15) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `customer_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `customer_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `customer_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `customer_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户邮箱',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'A俊', '广州航海学院', '110', '110@163.com');
INSERT INTO `customer` VALUES (2, 'B俊', '广州航海学院', '110', '110@163.com');
INSERT INTO `customer` VALUES (3, 'C俊', '广州航海学院', '110', '110@163.com');
INSERT INTO `customer` VALUES (4, 'E俊', '广州航海学院', '110', '110@163.com');
INSERT INTO `customer` VALUES (5, 'F俊', '广州航海学院', '110', '110@163.com');
INSERT INTO `customer` VALUES (6, 'H俊', '广州航海学院', '110', '110@163.com');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `dict_id` int(15) NOT NULL AUTO_INCREMENT,
  `dict_type_code` int(20) NULL DEFAULT NULL,
  `dict_type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dict_item_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dict_enable` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (1, 1, '商品类别', '粮油调味品', NULL);
INSERT INTO `dict` VALUES (2, 2, '商品类别', '牛奶饮品', NULL);
INSERT INTO `dict` VALUES (3, 3, '商品类别', '饮料饮品', NULL);
INSERT INTO `dict` VALUES (4, 1, 'role', '入库操作员', NULL);
INSERT INTO `dict` VALUES (5, 2, 'role', '出库操作员', NULL);
INSERT INTO `dict` VALUES (6, 4, 'role', '仓库经理', NULL);
INSERT INTO `dict` VALUES (7, 5, 'role', '系统管理员', NULL);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employee_id` int(15) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_sex` int(1) NULL DEFAULT NULL,
  `employee_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_role` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'A俊', '123', 1, '110', 1);
INSERT INTO `employee` VALUES (2, 'B俊', '123', 1, '119', 2);
INSERT INTO `employee` VALUES (3, 'C俊', '123', 1, '120', 3);
INSERT INTO `employee` VALUES (4, '李出拳', '321', 0, '10086', 4);

-- ----------------------------
-- Table structure for in_data
-- ----------------------------
DROP TABLE IF EXISTS `in_data`;
CREATE TABLE `in_data`  (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_num` int(15) NULL DEFAULT NULL,
  `in_order_id` int(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for in_order
-- ----------------------------
DROP TABLE IF EXISTS `in_order`;
CREATE TABLE `in_order`  (
  `order_id` int(15) NOT NULL AUTO_INCREMENT,
  `order_date` datetime(0) NULL DEFAULT NULL,
  `order_supplier_id` int(15) NULL DEFAULT NULL,
  `order_storage_id` int(15) NULL DEFAULT NULL,
  `order_employee_id` int(15) NULL DEFAULT NULL,
  `order_product_id` int(15) NULL DEFAULT NULL,
  `order_product_num` int(15) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `1`(`order_supplier_id`) USING BTREE,
  INDEX `2`(`order_storage_id`) USING BTREE,
  INDEX `3`(`order_product_id`) USING BTREE,
  CONSTRAINT `1` FOREIGN KEY (`order_supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `2` FOREIGN KEY (`order_storage_id`) REFERENCES `storage` (`storage_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `3` FOREIGN KEY (`order_product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of in_order
-- ----------------------------
INSERT INTO `in_order` VALUES (5, '2021-06-24 00:00:00', 1, 1, 1, 1, 10);
INSERT INTO `in_order` VALUES (6, '2021-06-24 00:00:00', 1, 1, 1, 1, 10);
INSERT INTO `in_order` VALUES (7, '2021-06-24 00:00:00', 4, 1, 1, 4, 5);
INSERT INTO `in_order` VALUES (8, '2021-06-24 00:00:00', 4, 2, 1, 4, 10);
INSERT INTO `in_order` VALUES (9, '2021-06-24 00:00:00', 1, 1, 1, 1, 10);
INSERT INTO `in_order` VALUES (10, '2021-06-24 00:00:00', 16, 1, 1, 3, 10);
INSERT INTO `in_order` VALUES (11, '2021-06-24 00:00:00', 4, 2, 1, 1, 5);
INSERT INTO `in_order` VALUES (12, '2021-05-13 00:00:00', 1, 1, 1, 1, 5);
INSERT INTO `in_order` VALUES (13, '2021-06-25 00:00:00', 1, 1, 1, 1, 5);
INSERT INTO `in_order` VALUES (14, '2021-06-25 00:00:00', 1, 1, 1, 7, 15);

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `product_id` int(15) NOT NULL,
  `storage_id` int(15) NOT NULL,
  `product_num` int(15) NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`, `storage_id`) USING BTREE,
  INDEX `storage_id`(`storage_id`) USING BTREE,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `storage_id` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`storage_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (1, 1, 10);
INSERT INTO `inventory` VALUES (1, 2, 5);
INSERT INTO `inventory` VALUES (2, 1, 0);
INSERT INTO `inventory` VALUES (2, 2, 0);
INSERT INTO `inventory` VALUES (3, 1, 10);
INSERT INTO `inventory` VALUES (3, 2, 0);
INSERT INTO `inventory` VALUES (4, 1, 5);
INSERT INTO `inventory` VALUES (4, 2, 10);
INSERT INTO `inventory` VALUES (5, 1, 0);
INSERT INTO `inventory` VALUES (5, 2, 0);
INSERT INTO `inventory` VALUES (6, 1, 0);
INSERT INTO `inventory` VALUES (6, 2, 0);
INSERT INTO `inventory` VALUES (7, 1, 15);
INSERT INTO `inventory` VALUES (7, 2, 0);

-- ----------------------------
-- Table structure for out_data
-- ----------------------------
DROP TABLE IF EXISTS `out_data`;
CREATE TABLE `out_data`  (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_num` int(15) NULL DEFAULT NULL,
  `out_order_id` int(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for out_order
-- ----------------------------
DROP TABLE IF EXISTS `out_order`;
CREATE TABLE `out_order`  (
  `order_id` int(15) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `order_date` datetime(0) NULL DEFAULT NULL COMMENT '订单创建日期',
  `order_customer_id` int(15) NULL DEFAULT NULL COMMENT '订单所属客户id',
  `order_storage_id` int(15) NULL DEFAULT NULL COMMENT '出库仓库id',
  `order_employee_id` int(15) NULL DEFAULT NULL COMMENT '操作员（员工）id',
  `order_product_id` int(15) NULL DEFAULT NULL,
  `order_product_num` int(15) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of out_order
-- ----------------------------
INSERT INTO `out_order` VALUES (3, '2021-06-24 00:00:00', 1, 1, 1, 1, 20);
INSERT INTO `out_order` VALUES (4, '2021-06-24 00:00:00', 1, 1, 1, 1, 5);
INSERT INTO `out_order` VALUES (5, '2021-06-24 00:00:00', 1, 1, 1, 1, 5);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(15) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `product_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_type` int(20) NULL DEFAULT NULL COMMENT '商品类别号',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '海天酱油', 1);
INSERT INTO `product` VALUES (2, '金龙鱼花生油', 1);
INSERT INTO `product` VALUES (3, '海天花椒粉', 1);
INSERT INTO `product` VALUES (4, '伊利牛奶', 2);
INSERT INTO `product` VALUES (5, '晨光牛奶', 2);
INSERT INTO `product` VALUES (6, '康师傅冰红茶', 3);
INSERT INTO `product` VALUES (7, '统一冰红茶', 3);

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`  (
  `storage_id` int(15) NOT NULL AUTO_INCREMENT,
  `storage_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storage_address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storage_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES (1, '华南物流仓', '广东省广州市南沙区', '400823823');
INSERT INTO `storage` VALUES (2, '深圳大湾区物流仓', '广东省深圳市盐田区', '400732732');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `supplier_id` int(15) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_address` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '锐锋食品批发商行', '深圳市南山区新光路5号', '111');
INSERT INTO `supplier` VALUES (2, '深圳赏治食品有限公司', '广东省深圳市龙岗区爱联社区太平村88号A栋106', '0755-89725050');
INSERT INTO `supplier` VALUES (3, '深圳好食食品有限公司', '广东省深圳市龙岗区布吉镇坂田万科城', '0755-89725087');
INSERT INTO `supplier` VALUES (4, '深圳维他(光明)食品饮料有限公司', '深圳市光明区光明街道东周社区光明大道513号', '(0755)27402888');
INSERT INTO `supplier` VALUES (5, '深圳维他(光明)食品饮料有限公司', '深圳市光明区光明街道东周社区光明大道513号', '(0755)27402888');
INSERT INTO `supplier` VALUES (6, '深圳维他(光明)食品饮料有限公司', '深圳市光明区光明街道东周社区光明大道513号', '(0755)27402888');
INSERT INTO `supplier` VALUES (7, '深圳维他(光明)食品饮料有限公司', '深圳市光明区光明街道东周社区光明大道513号', '(0755)27402888');
INSERT INTO `supplier` VALUES (8, '深圳维他(光明)食品饮料有限公司', '深圳市光明区光明街道东周社区光明大道513号', '(0755)27402888');
INSERT INTO `supplier` VALUES (9, '深圳维他(光明)食品饮料有限公司', '深圳市光明区光明街道东周社区光明大道513号', '(0755)27402888');
INSERT INTO `supplier` VALUES (11, '深圳维他(光明)食品饮料有限公司', '深圳市光明区光明街道东周社区光明大道513号', '(0755)27402888');
INSERT INTO `supplier` VALUES (12, '深圳维他(光明)食品饮料有限公司', '深圳市光明区光明街道东周社区光明大道513号', '(0755)27402888');
INSERT INTO `supplier` VALUES (13, '深圳维他(光明)食品饮料有限公司', '深圳市光明区光明街道东周社区光明大道513号', '(0755)27402888');
INSERT INTO `supplier` VALUES (14, '深圳市新善美食品批发有限公司', '深圳市南山区南头街道101', '(0755)27402888');
INSERT INTO `supplier` VALUES (15, '锐锋食品批发商行', '锐锋食品批发商行', '(0755)27402888');
INSERT INTO `supplier` VALUES (16, '深圳市每一朵食品有限公司', '深圳市南山区', '(0755)27402888');
INSERT INTO `supplier` VALUES (19, '深圳市每一朵食品有限公司', '深圳市每一朵食品有限公司', '(0755)27402888');
INSERT INTO `supplier` VALUES (21, '深圳市恬静食品有限公司', '深圳市福田区', '(0755)27402888');

SET FOREIGN_KEY_CHECKS = 1;
