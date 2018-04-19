-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: crm3
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addr`
--

DROP TABLE IF EXISTS `addr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(30) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_5gv1lyygw93utvnxpu5hy43jx` (`address`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addr`
--

LOCK TABLES `addr` WRITE;
/*!40000 ALTER TABLE `addr` DISABLE KEYS */;
/*!40000 ALTER TABLE `addr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK2y94svpmqttx80mshyny85wqr` (`parent_id`) USING BTREE,
  CONSTRAINT `FK2y94svpmqttx80mshyny85wqr` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_attachment`
--

DROP TABLE IF EXISTS `crm_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(64) DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `att_type` varchar(20) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_mo4u1f5i9c0uq531tkeqaw5kd` (`file_path`) USING BTREE,
  KEY `FKmkoq53o6qwxpmiyerl1vm7vus` (`member_id`) USING BTREE,
  CONSTRAINT `FKmkoq53o6qwxpmiyerl1vm7vus` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_attachment`
--

LOCK TABLES `crm_attachment` WRITE;
/*!40000 ALTER TABLE `crm_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_member`
--

DROP TABLE IF EXISTS `crm_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `real_name` varchar(64) NOT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_3w4x463xehrckku45kvs911ml` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_member`
--

LOCK TABLES `crm_member` WRITE;
/*!40000 ALTER TABLE `crm_member` DISABLE KEYS */;
INSERT INTO `crm_member` VALUES (1,'9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','admin','','768870379@qq.com','GIRL',NULL,'管理员','18676037292',NULL,NULL),(31,'9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','gson','','wmails@126.com','BOY',NULL,'郭华','13203314875',NULL,NULL),(36,'9d164e30966906a1b733821bb2ee7d1d0e5ce6fd0c09da02ed951a3248e39f13','zhouzhou','','zhouzhou@qq.com','BOY',NULL,'zhouzhou','zhouzhou',NULL,NULL),(37,'b64827e40e2a110a69692b4d7f40c73ff42a3033ee3095a4f99a5352eac63e2d','shehong','','shehong@qq.com','BOY','2018-04-17 11:02:44','shehong','shehong',NULL,NULL),(38,'696039926dc14f886dcbe308939c9eb752cb063a83708ea025117310a39439da','suining','','suining@qq.com','BOY','2018-04-17 11:08:15','suining','suining',NULL,NULL),(39,'9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','hongqi','','hongqi@163.com','BOY',NULL,'hongqi','33333',NULL,NULL),(40,'6fd18ce66dd1a5dbbaaeb142d1a4f4e226de1f7d2f8645c68e14d444c0d40b82','chinachina','','chinachina@qq.com','BOY','2018-04-19 16:14:35','chinachina','chinachina',NULL,NULL),(41,'e58f87c992e9c0cf18b8bf376cba3c35c3b2e76dc588ea326179292384807764','admin999','','admin999@qq.com','BOY','2018-04-19 16:17:07','admin999','admin999',NULL,NULL);
/*!40000 ALTER TABLE `crm_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_member_role`
--

DROP TABLE IF EXISTS `crm_member_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_member_role` (
  `member_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKb17jj8ou6rp2lkxb5xen5tixe` (`role_id`) USING BTREE,
  KEY `FK76a8mc5mub4tu1gndxph4ypls` (`member_id`) USING BTREE,
  CONSTRAINT `FK76a8mc5mub4tu1gndxph4ypls` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`),
  CONSTRAINT `FKb17jj8ou6rp2lkxb5xen5tixe` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_member_role`
--

LOCK TABLES `crm_member_role` WRITE;
/*!40000 ALTER TABLE `crm_member_role` DISABLE KEYS */;
INSERT INTO `crm_member_role` VALUES (36,8),(38,8),(1,1),(39,9),(31,1),(40,8),(41,8);
/*!40000 ALTER TABLE `crm_member_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_resource`
--

DROP TABLE IF EXISTS `crm_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fun_urls` varchar(1024) DEFAULT NULL,
  `menu_url` varchar(128) DEFAULT NULL,
  `res_key` varchar(128) NOT NULL,
  `res_name` varchar(128) NOT NULL,
  `res_type` varchar(20) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_ic22mdco0hjpt8qjosdnyhxcx` (`res_key`) USING BTREE,
  KEY `FKo4megp72bdlng5bpjmo56v1wk` (`parent_id`) USING BTREE,
  CONSTRAINT `FKo4megp72bdlng5bpjmo56v1wk` FOREIGN KEY (`parent_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_resource`
--

LOCK TABLES `crm_resource` WRITE;
/*!40000 ALTER TABLE `crm_resource` DISABLE KEYS */;
INSERT INTO `crm_resource` VALUES (1,'','','system','系统管理','MENU','',NULL,0),(3,'/system/member/list','/system/member','system-member','用户管理','MENU','',1,NULL),(10,'/system/role/list,/system/role/resource/tree','/system/role','system-role','角色管理','MENU','',1,NULL),(11,'/system/resource/list','/system/resource','system-resource','资源管理','MENU','',1,NULL),(12,'','','role-create','创建角色','FUNCTION','',10,NULL),(13,'','/system/role/delete','role-delete','删除角色','FUNCTION','',10,NULL),(14,'/system/role/update,/system/role/save','','role-save','保存编辑','FUNCTION','',10,NULL),(17,'/system/role/resource/save','','reole-resource-save','分配资源','FUNCTION','',10,NULL),(18,'/system/resource/form,/system/resource/parent/tree,/system/resource/save','','resource-create','创建资源','FUNCTION','',11,NULL),(19,'/system/resource/form,/system/resource/parent/tree,/system/resource/save','','resource-edit','编辑','FUNCTION','',11,NULL),(20,'/system/resource/delete','','resource-delete','删除','FUNCTION','',11,NULL),(21,'/system/member/form,/system/member/save','','member-create','创建用户','FUNCTION','',3,NULL),(22,'/system/member/delete','','member-delete','删除用户','FUNCTION','',3,NULL),(23,'/system/member/form,/system/member/update','','member-edit','编辑用户','FUNCTION','',3,NULL),(26,'/system/member/password/reset','','member-reset-password','重置密码','FUNCTION','',3,NULL),(31,'/system/category/list','/system/category','system-category','Category','MENU','',1,NULL),(32,'/system/category/created','','category-create','created','MENU','',31,NULL),(33,'/system/category/edit','','cteated-edit','edit','MENU','',31,NULL),(34,'/system/category/del','','cteated-del','del','MENU','',31,NULL),(35,'/system/region/list','/system/region','region','region','MENU','',1,NULL),(36,'/system/region/created','','region-created','Created','FUNCTION','',35,NULL),(37,'/system/region/edit','','region-edit','editon','FUNCTION','',35,NULL),(38,'/system/region/del','','region-del','Delete','FUNCTION','',35,NULL);
/*!40000 ALTER TABLE `crm_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_role`
--

DROP TABLE IF EXISTS `crm_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(512) DEFAULT NULL,
  `role_name` varchar(30) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_r0jsnwb00o0n376ghyuahuqfg` (`role_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_role`
--

LOCK TABLES `crm_role` WRITE;
/*!40000 ALTER TABLE `crm_role` DISABLE KEYS */;
INSERT INTO `crm_role` VALUES (1,'有系统所有权限','管理员',''),(2,'主要是上课，可以查看学员管理模块','教员',''),(8,'customers','customer',''),(9,'managers','manager','');
/*!40000 ALTER TABLE `crm_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_role_resource`
--

DROP TABLE IF EXISTS `crm_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_role_resource` (
  `role_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  KEY `FKjwyt61kixx52wper9y0li38c2` (`resource_id`) USING BTREE,
  KEY `FKasi3s87a7p562cyw0jt3m0isf` (`role_id`) USING BTREE,
  CONSTRAINT `FKasi3s87a7p562cyw0jt3m0isf` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`),
  CONSTRAINT `FKjwyt61kixx52wper9y0li38c2` FOREIGN KEY (`resource_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_role_resource`
--

LOCK TABLES `crm_role_resource` WRITE;
/*!40000 ALTER TABLE `crm_role_resource` DISABLE KEYS */;
INSERT INTO `crm_role_resource` VALUES (1,1),(1,3),(1,21),(1,22),(1,23),(1,10),(1,12),(1,13),(1,14),(1,17),(1,11),(1,18),(1,19),(1,20);
/*!40000 ALTER TABLE `crm_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(64) DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `att_type` varchar(20) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_sysgmv0dvi7mlqanoy4gl22qd` (`file_path`) USING BTREE,
  KEY `FKgpextbyee3uk9u6o2381m7ft1` (`product_id`) USING BTREE,
  CONSTRAINT `FKgpextbyee3uk9u6o2381m7ft1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_product`
--

DROP TABLE IF EXISTS `inv_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_product` (
  `inv_id` bigint(20) NOT NULL,
  `prod_id` bigint(20) NOT NULL,
  KEY `FKt2d18vwkmbxtm1ge46aou9946` (`prod_id`) USING BTREE,
  KEY `FKg2707kw4x3s7og0qula324g5c` (`inv_id`) USING BTREE,
  CONSTRAINT `FKg2707kw4x3s7og0qula324g5c` FOREIGN KEY (`inv_id`) REFERENCES `inventory` (`id`),
  CONSTRAINT `FKt2d18vwkmbxtm1ge46aou9946` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_product`
--

LOCK TABLES `inv_product` WRITE;
/*!40000 ALTER TABLE `inv_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_region`
--

DROP TABLE IF EXISTS `inv_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_region` (
  `inv_id` bigint(20) NOT NULL,
  `region_id` bigint(20) NOT NULL,
  KEY `FKdru26soe1pe6ry3q9rl8rwqwk` (`region_id`) USING BTREE,
  KEY `FK47d449lal3ihr9oid9pv9rpfn` (`inv_id`) USING BTREE,
  CONSTRAINT `FK47d449lal3ihr9oid9pv9rpfn` FOREIGN KEY (`inv_id`) REFERENCES `inventory` (`id`),
  CONSTRAINT `FKdru26soe1pe6ry3q9rl8rwqwk` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_region`
--

LOCK TABLES `inv_region` WRITE;
/*!40000 ALTER TABLE `inv_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amountinstock` float DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `inv_status` varchar(16) DEFAULT NULL,
  `max_quantity` float DEFAULT NULL,
  `price` float NOT NULL,
  `refill_date` datetime DEFAULT NULL,
  `refill_point` float DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_addr`
--

DROP TABLE IF EXISTS `member_addr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_addr` (
  `member_id` bigint(20) NOT NULL,
  `addr_id` bigint(20) NOT NULL,
  KEY `FKf7o9fahg6ok4rk3g0nh4vvf2h` (`addr_id`) USING BTREE,
  KEY `FK7mgad085y1xs0h7pfoo4uu935` (`member_id`) USING BTREE,
  CONSTRAINT `FK7mgad085y1xs0h7pfoo4uu935` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`),
  CONSTRAINT `FKf7o9fahg6ok4rk3g0nh4vvf2h` FOREIGN KEY (`addr_id`) REFERENCES `region` (`id`),
  CONSTRAINT `FKg3wilnrdu5yt9y0c4q8vil8we` FOREIGN KEY (`addr_id`) REFERENCES `addr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_addr`
--

LOCK TABLES `member_addr` WRITE;
/*!40000 ALTER TABLE `member_addr` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_addr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_address`
--

DROP TABLE IF EXISTS `member_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_address` (
  `address_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  KEY `FKk13mwybln55iv5qpuy4tjc6p8` (`member_id`) USING BTREE,
  KEY `FKbo604x13by1qm2nd87re71vc` (`address_id`) USING BTREE,
  CONSTRAINT `FKbo604x13by1qm2nd87re71vc` FOREIGN KEY (`address_id`) REFERENCES `addr` (`id`),
  CONSTRAINT `FKk13mwybln55iv5qpuy4tjc6p8` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_address`
--

LOCK TABLES `member_address` WRITE;
/*!40000 ALTER TABLE `member_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_category`
--

DROP TABLE IF EXISTS `member_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_category` (
  `member_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  KEY `FK87r65a4xna6uray30n79f9ar4` (`category_id`) USING BTREE,
  KEY `FKrx7egqc6fjldgyrc15m31fx04` (`member_id`) USING BTREE,
  CONSTRAINT `FK87r65a4xna6uray30n79f9ar4` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKrx7egqc6fjldgyrc15m31fx04` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_category`
--

LOCK TABLES `member_category` WRITE;
/*!40000 ALTER TABLE `member_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_product`
--

DROP TABLE IF EXISTS `member_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_product` (
  `prod_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  KEY `FKs0fbwaae470y94rctpqxjqdld` (`member_id`) USING BTREE,
  KEY `FKid44ps6tj9hjvrcgqs4c7fcbu` (`prod_id`) USING BTREE,
  CONSTRAINT `FKid44ps6tj9hjvrcgqs4c7fcbu` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKs0fbwaae470y94rctpqxjqdld` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_product`
--

LOCK TABLES `member_product` WRITE;
/*!40000 ALTER TABLE `member_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_region`
--

DROP TABLE IF EXISTS `member_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_region` (
  `member_id` bigint(20) NOT NULL,
  `region_id` bigint(20) NOT NULL,
  KEY `FKni5rb06cm3rmodcu98o9wvbmx` (`region_id`),
  KEY `FK5yt4dfydi4bj1xvaa5fd4uf1u` (`member_id`),
  CONSTRAINT `FK5yt4dfydi4bj1xvaa5fd4uf1u` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`),
  CONSTRAINT `FKni5rb06cm3rmodcu98o9wvbmx` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_region`
--

LOCK TABLES `member_region` WRITE;
/*!40000 ALTER TABLE `member_region` DISABLE KEYS */;
INSERT INTO `member_region` VALUES (31,2),(31,3),(38,5),(38,6);
/*!40000 ALTER TABLE `member_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(30) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `prod_name` varchar(30) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `weight` float NOT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `quantity` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_7b3ahh336blyr3ptykear4g4x` (`color`) USING BTREE,
  UNIQUE KEY `UK_f1lygoborvothkuaqghjy8exw` (`prod_name`) USING BTREE,
  UNIQUE KEY `UK_nkh0lahdp4ycr2gsn9cguiuhy` (`weight`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `prod_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  KEY `FKkud35ls1d40wpjb5htpp14q4e` (`category_id`) USING BTREE,
  KEY `FKhvl7hyj55eqsnteolbf3h5x98` (`prod_id`) USING BTREE,
  CONSTRAINT `FKhvl7hyj55eqsnteolbf3h5x98` FOREIGN KEY (`prod_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKkud35ls1d40wpjb5htpp14q4e` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `whaddress` varchar(100) DEFAULT NULL,
  `whdesc` varchar(100) DEFAULT NULL,
  `whname` varchar(30) DEFAULT NULL,
  `wh_desc` varchar(100) DEFAULT NULL,
  `wh_name` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Center America',NULL,NULL,NULL,NULL,NULL,NULL),(2,'North America',NULL,NULL,NULL,NULL,NULL,NULL),(3,'South America',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Africa/Middle East',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Asia',NULL,NULL,NULL,NULL,NULL,NULL),(6,'Europe',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-19 17:06:23
