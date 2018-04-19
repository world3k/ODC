/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : crm3

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 19/04/2018 22:49:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addr
-- ----------------------------
DROP TABLE IF EXISTS `addr`;
CREATE TABLE `addr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_5gv1lyygw93utvnxpu5hy43jx`(`address`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `weight` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2y94svpmqttx80mshyny85wqr`(`parent_id`) USING BTREE,
  CONSTRAINT `FK2y94svpmqttx80mshyny85wqr` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_attachment
-- ----------------------------
DROP TABLE IF EXISTS `crm_attachment`;
CREATE TABLE `crm_attachment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_path` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_size` bigint(20) NULL DEFAULT NULL,
  `original_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `suffix` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `upload_time` datetime(0) NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_mo4u1f5i9c0uq531tkeqaw5kd`(`file_path`) USING BTREE,
  INDEX `FKmkoq53o6qwxpmiyerl1vm7vus`(`member_id`) USING BTREE,
  CONSTRAINT `FKmkoq53o6qwxpmiyerl1vm7vus` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_member
-- ----------------------------
DROP TABLE IF EXISTS `crm_member`;
CREATE TABLE `crm_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hiredate` datetime(0) NULL DEFAULT NULL,
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_3w4x463xehrckku45kvs911ml`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_member
-- ----------------------------
INSERT INTO `crm_member` VALUES (1, '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'admin', b'1', '768870379@qq.com', 'GIRL', NULL, '管理员', '18676037292', NULL, NULL);
INSERT INTO `crm_member` VALUES (31, '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', 'gson', b'0', 'wmails@126.com', 'BOY', '2017-05-08 00:00:00', '郭华', '13203314875', NULL, NULL);
INSERT INTO `crm_member` VALUES (36, '9d164e30966906a1b733821bb2ee7d1d0e5ce6fd0c09da02ed951a3248e39f13', 'zhouzhou', b'1', 'zhouzhou@qq.com', 'BOY', NULL, 'zhouzhou', 'zhouzhou', NULL, NULL);
INSERT INTO `crm_member` VALUES (37, 'b64827e40e2a110a69692b4d7f40c73ff42a3033ee3095a4f99a5352eac63e2d', 'shehong', b'1', 'shehong@qq.com', 'BOY', '2018-04-17 11:02:44', 'shehong', 'shehong', NULL, NULL);
INSERT INTO `crm_member` VALUES (38, '696039926dc14f886dcbe308939c9eb752cb063a83708ea025117310a39439da', 'suining', b'1', 'suining@qq.com', 'BOY', '2018-04-17 11:08:15', 'suining', 'suining', NULL, NULL);

-- ----------------------------
-- Table structure for crm_member_role
-- ----------------------------
DROP TABLE IF EXISTS `crm_member_role`;
CREATE TABLE `crm_member_role`  (
  `member_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  INDEX `FKb17jj8ou6rp2lkxb5xen5tixe`(`role_id`) USING BTREE,
  INDEX `FK76a8mc5mub4tu1gndxph4ypls`(`member_id`) USING BTREE,
  CONSTRAINT `FK76a8mc5mub4tu1gndxph4ypls` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKb17jj8ou6rp2lkxb5xen5tixe` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_member_role
-- ----------------------------
INSERT INTO `crm_member_role` VALUES (36, 8);
INSERT INTO `crm_member_role` VALUES (38, 8);
INSERT INTO `crm_member_role` VALUES (1, 1);

-- ----------------------------
-- Table structure for crm_resource
-- ----------------------------
DROP TABLE IF EXISTS `crm_resource`;
CREATE TABLE `crm_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fun_urls` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `res_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `res_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `res_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `weight` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_ic22mdco0hjpt8qjosdnyhxcx`(`res_key`) USING BTREE,
  INDEX `FKo4megp72bdlng5bpjmo56v1wk`(`parent_id`) USING BTREE,
  CONSTRAINT `FKo4megp72bdlng5bpjmo56v1wk` FOREIGN KEY (`parent_id`) REFERENCES `crm_resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_resource
-- ----------------------------
INSERT INTO `crm_resource` VALUES (1, '', '', 'system', '系统管理', 'MENU', b'1', NULL, 0);
INSERT INTO `crm_resource` VALUES (3, '/system/member/list', '/system/member', 'system-member', '用户管理', 'MENU', b'1', 1, NULL);
INSERT INTO `crm_resource` VALUES (10, '/system/role/list,/system/role/resource/tree', '/system/role', 'system-role', '角色管理', 'MENU', b'1', 1, NULL);
INSERT INTO `crm_resource` VALUES (11, '/system/resource/list', '/system/resource', 'system-resource', '资源管理', 'MENU', b'1', 1, NULL);
INSERT INTO `crm_resource` VALUES (12, '', '', 'role-create', '创建角色', 'FUNCTION', b'1', 10, NULL);
INSERT INTO `crm_resource` VALUES (13, '', '/system/role/delete', 'role-delete', '删除角色', 'FUNCTION', b'1', 10, NULL);
INSERT INTO `crm_resource` VALUES (14, '/system/role/update,/system/role/save', '', 'role-save', '保存编辑', 'FUNCTION', b'1', 10, NULL);
INSERT INTO `crm_resource` VALUES (17, '/system/role/resource/save', '', 'reole-resource-save', '分配资源', 'FUNCTION', b'1', 10, NULL);
INSERT INTO `crm_resource` VALUES (18, '/system/resource/form,/system/resource/parent/tree,/system/resource/save', '', 'resource-create', '创建资源', 'FUNCTION', b'1', 11, NULL);
INSERT INTO `crm_resource` VALUES (19, '/system/resource/form,/system/resource/parent/tree,/system/resource/save', '', 'resource-edit', '编辑', 'FUNCTION', b'1', 11, NULL);
INSERT INTO `crm_resource` VALUES (20, '/system/resource/delete', '', 'resource-delete', '删除', 'FUNCTION', b'1', 11, NULL);
INSERT INTO `crm_resource` VALUES (21, '/system/member/form,/system/member/save', '', 'member-create', '创建用户', 'FUNCTION', b'1', 3, NULL);
INSERT INTO `crm_resource` VALUES (22, '/system/member/delete', '', 'member-delete', '删除用户', 'FUNCTION', b'1', 3, NULL);
INSERT INTO `crm_resource` VALUES (23, '/system/member/form,/system/member/update', '', 'member-edit', '编辑用户', 'FUNCTION', b'1', 3, NULL);
INSERT INTO `crm_resource` VALUES (26, '/system/member/password/reset', '', 'member-reset-password', '重置密码', 'FUNCTION', b'1', 3, NULL);
INSERT INTO `crm_resource` VALUES (31, '/system/category/list', '/system/category', 'system-category', 'Category', 'MENU', b'1', 1, NULL);
INSERT INTO `crm_resource` VALUES (32, '/system/category/created', '', 'category-create', 'created', 'MENU', b'1', 31, NULL);
INSERT INTO `crm_resource` VALUES (33, '/system/category/edit', '', 'cteated-edit', 'edit', 'MENU', b'1', 31, NULL);
INSERT INTO `crm_resource` VALUES (34, '/system/category/del', '', 'cteated-del', 'del', 'MENU', b'1', 31, NULL);
INSERT INTO `crm_resource` VALUES (35, '/system/region/list', '/system/region', 'region', 'region', 'MENU', b'1', 1, NULL);
INSERT INTO `crm_resource` VALUES (36, '/system/region/created', '', 'region-created', 'Created', 'FUNCTION', b'1', 35, NULL);
INSERT INTO `crm_resource` VALUES (37, '/system/region/edit', '', 'region-edit', 'editon', 'FUNCTION', b'1', 35, NULL);
INSERT INTO `crm_resource` VALUES (38, '/system/region/del', '', 'region-del', 'Delete', 'FUNCTION', b'1', 35, NULL);

-- ----------------------------
-- Table structure for crm_role
-- ----------------------------
DROP TABLE IF EXISTS `crm_role`;
CREATE TABLE `crm_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_r0jsnwb00o0n376ghyuahuqfg`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_role
-- ----------------------------
INSERT INTO `crm_role` VALUES (1, '有系统所有权限', '管理员', b'1');
INSERT INTO `crm_role` VALUES (2, '主要是上课，可以查看学员管理模块', '教员', b'1');
INSERT INTO `crm_role` VALUES (8, 'customers', 'customer', b'1');
INSERT INTO `crm_role` VALUES (9, 'managers', 'manager', b'1');

-- ----------------------------
-- Table structure for crm_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `crm_role_resource`;
CREATE TABLE `crm_role_resource`  (
  `role_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  INDEX `FKjwyt61kixx52wper9y0li38c2`(`resource_id`) USING BTREE,
  INDEX `FKasi3s87a7p562cyw0jt3m0isf`(`role_id`) USING BTREE,
  CONSTRAINT `FKasi3s87a7p562cyw0jt3m0isf` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKjwyt61kixx52wper9y0li38c2` FOREIGN KEY (`resource_id`) REFERENCES `crm_resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_role_resource
-- ----------------------------
INSERT INTO `crm_role_resource` VALUES (1, 1);
INSERT INTO `crm_role_resource` VALUES (1, 3);
INSERT INTO `crm_role_resource` VALUES (1, 21);
INSERT INTO `crm_role_resource` VALUES (1, 22);
INSERT INTO `crm_role_resource` VALUES (1, 23);
INSERT INTO `crm_role_resource` VALUES (1, 10);
INSERT INTO `crm_role_resource` VALUES (1, 12);
INSERT INTO `crm_role_resource` VALUES (1, 13);
INSERT INTO `crm_role_resource` VALUES (1, 14);
INSERT INTO `crm_role_resource` VALUES (1, 17);
INSERT INTO `crm_role_resource` VALUES (1, 11);
INSERT INTO `crm_role_resource` VALUES (1, 18);
INSERT INTO `crm_role_resource` VALUES (1, 19);
INSERT INTO `crm_role_resource` VALUES (1, 20);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_size` bigint(20) NULL DEFAULT NULL,
  `original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `suffix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `att_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_time` datetime(0) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_sysgmv0dvi7mlqanoy4gl22qd`(`file_path`) USING BTREE,
  INDEX `FKgpextbyee3uk9u6o2381m7ft1`(`product_id`) USING BTREE,
  CONSTRAINT `FKgpextbyee3uk9u6o2381m7ft1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inv_product
-- ----------------------------
DROP TABLE IF EXISTS `inv_product`;
CREATE TABLE `inv_product`  (
  `inv_id` bigint(20) NOT NULL,
  `prod_id` bigint(20) NOT NULL,
  INDEX `FKt2d18vwkmbxtm1ge46aou9946`(`prod_id`) USING BTREE,
  INDEX `FKg2707kw4x3s7og0qula324g5c`(`inv_id`) USING BTREE,
  CONSTRAINT `FKg2707kw4x3s7og0qula324g5c` FOREIGN KEY (`inv_id`) REFERENCES `inventory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt2d18vwkmbxtm1ge46aou9946` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inv_region
-- ----------------------------
DROP TABLE IF EXISTS `inv_region`;
CREATE TABLE `inv_region`  (
  `inv_id` bigint(20) NOT NULL,
  `region_id` bigint(20) NOT NULL,
  INDEX `FKdru26soe1pe6ry3q9rl8rwqwk`(`region_id`) USING BTREE,
  INDEX `FK47d449lal3ihr9oid9pv9rpfn`(`inv_id`) USING BTREE,
  CONSTRAINT `FK47d449lal3ihr9oid9pv9rpfn` FOREIGN KEY (`inv_id`) REFERENCES `inventory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdru26soe1pe6ry3q9rl8rwqwk` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amountinstock` float NULL DEFAULT NULL,
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inv_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `max_quantity` float NULL DEFAULT NULL,
  `price` float NOT NULL,
  `refill_date` datetime(0) NULL DEFAULT NULL,
  `refill_point` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_addr
-- ----------------------------
DROP TABLE IF EXISTS `member_addr`;
CREATE TABLE `member_addr`  (
  `member_id` bigint(20) NOT NULL,
  `addr_id` bigint(20) NOT NULL,
  INDEX `FKf7o9fahg6ok4rk3g0nh4vvf2h`(`addr_id`) USING BTREE,
  INDEX `FK7mgad085y1xs0h7pfoo4uu935`(`member_id`) USING BTREE,
  CONSTRAINT `FK7mgad085y1xs0h7pfoo4uu935` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKf7o9fahg6ok4rk3g0nh4vvf2h` FOREIGN KEY (`addr_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_address
-- ----------------------------
DROP TABLE IF EXISTS `member_address`;
CREATE TABLE `member_address`  (
  `address_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  INDEX `FKk13mwybln55iv5qpuy4tjc6p8`(`member_id`) USING BTREE,
  INDEX `FKbo604x13by1qm2nd87re71vc`(`address_id`) USING BTREE,
  CONSTRAINT `FKbo604x13by1qm2nd87re71vc` FOREIGN KEY (`address_id`) REFERENCES `addr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKk13mwybln55iv5qpuy4tjc6p8` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_category
-- ----------------------------
DROP TABLE IF EXISTS `member_category`;
CREATE TABLE `member_category`  (
  `member_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  INDEX `FK87r65a4xna6uray30n79f9ar4`(`category_id`) USING BTREE,
  INDEX `FKrx7egqc6fjldgyrc15m31fx04`(`member_id`) USING BTREE,
  CONSTRAINT `FK87r65a4xna6uray30n79f9ar4` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrx7egqc6fjldgyrc15m31fx04` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_product
-- ----------------------------
DROP TABLE IF EXISTS `member_product`;
CREATE TABLE `member_product`  (
  `prod_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  INDEX `FKs0fbwaae470y94rctpqxjqdld`(`member_id`) USING BTREE,
  INDEX `FKid44ps6tj9hjvrcgqs4c7fcbu`(`prod_id`) USING BTREE,
  CONSTRAINT `FKid44ps6tj9hjvrcgqs4c7fcbu` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKs0fbwaae470y94rctpqxjqdld` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_region
-- ----------------------------
DROP TABLE IF EXISTS `member_region`;
CREATE TABLE `member_region`  (
  `member_id` bigint(20) NOT NULL,
  `region_id` bigint(20) NOT NULL,
  INDEX `FKni5rb06cm3rmodcu98o9wvbmx`(`region_id`) USING BTREE,
  INDEX `FK5yt4dfydi4bj1xvaa5fd4uf1u`(`member_id`) USING BTREE,
  CONSTRAINT `FK5yt4dfydi4bj1xvaa5fd4uf1u` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKni5rb06cm3rmodcu98o9wvbmx` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_region
-- ----------------------------
INSERT INTO `member_region` VALUES (31, 2);
INSERT INTO `member_region` VALUES (37, 4);
INSERT INTO `member_region` VALUES (37, 5);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prod_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `weight` float NOT NULL,
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_7b3ahh336blyr3ptykear4g4x`(`color`) USING BTREE,
  UNIQUE INDEX `UK_f1lygoborvothkuaqghjy8exw`(`prod_name`) USING BTREE,
  UNIQUE INDEX `UK_nkh0lahdp4ycr2gsn9cguiuhy`(`weight`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `prod_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  INDEX `FKkud35ls1d40wpjb5htpp14q4e`(`category_id`) USING BTREE,
  INDEX `FKhvl7hyj55eqsnteolbf3h5x98`(`prod_id`) USING BTREE,
  CONSTRAINT `FKhvl7hyj55eqsnteolbf3h5x98` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKkud35ls1d40wpjb5htpp14q4e` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `whaddress` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `whdesc` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `whname` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `wh_desc` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `wh_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES (1, 'Center America', 'Center America', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `region` VALUES (2, 'North America', 'North America', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `region` VALUES (3, 'South America', 'South America', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `region` VALUES (4, 'Africa/Middle East', 'Africa/Middle East', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `region` VALUES (5, 'Asia', 'Asia', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `region` VALUES (6, 'Europe', 'Europe', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for region_member
-- ----------------------------
DROP TABLE IF EXISTS `region_member`;
CREATE TABLE `region_member`  (
  `region_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  UNIQUE INDEX `UK_p7qe5r3ie3vl0qg3792udtpwi`(`member_id`) USING BTREE,
  INDEX `FKiqs4wflwbcpktlo516os324u7`(`region_id`) USING BTREE,
  CONSTRAINT `FKiqs4wflwbcpktlo516os324u7` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKq026i9geti9ri0mhjg2ybq0ee` FOREIGN KEY (`member_id`) REFERENCES `crm_resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
