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
  PRIMARY KEY (`id`),
  KEY `FK2y94svpmqttx80mshyny85wqr` (`parent_id`),
  CONSTRAINT `FK2y94svpmqttx80mshyny85wqr` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mo4u1f5i9c0uq531tkeqaw5kd` (`file_path`),
  KEY `FKmkoq53o6qwxpmiyerl1vm7vus` (`member_id`),
  CONSTRAINT `FKmkoq53o6qwxpmiyerl1vm7vus` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3w4x463xehrckku45kvs911ml` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_member`
--

LOCK TABLES `crm_member` WRITE;
/*!40000 ALTER TABLE `crm_member` DISABLE KEYS */;
INSERT INTO `crm_member` VALUES (1,'9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','admin','','768870379@qq.com','GIRL','2017-06-30 00:00:00','管理员','18676037292',NULL,NULL),(31,'9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0','gson','\0','wmails@126.com','BOY','2017-05-08 00:00:00','郭华','13203314875',NULL,NULL),(36,'9d164e30966906a1b733821bb2ee7d1d0e5ce6fd0c09da02ed951a3248e39f13','zhouzhou','','zhouzhou@qq.com','BOY',NULL,'zhouzhou','zhouzhou',NULL,NULL),(37,'b64827e40e2a110a69692b4d7f40c73ff42a3033ee3095a4f99a5352eac63e2d','shehong','','shehong@qq.com','BOY','2018-04-17 11:02:44','shehong','shehong',NULL,NULL),(38,'696039926dc14f886dcbe308939c9eb752cb063a83708ea025117310a39439da','suining','','suining@qq.com','BOY','2018-04-17 11:08:15','suining','suining',NULL,NULL);
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
  KEY `FKb17jj8ou6rp2lkxb5xen5tixe` (`role_id`),
  KEY `FK76a8mc5mub4tu1gndxph4ypls` (`member_id`),
  CONSTRAINT `FK76a8mc5mub4tu1gndxph4ypls` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`),
  CONSTRAINT `FKb17jj8ou6rp2lkxb5xen5tixe` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_member_role`
--

LOCK TABLES `crm_member_role` WRITE;
/*!40000 ALTER TABLE `crm_member_role` DISABLE KEYS */;
INSERT INTO `crm_member_role` VALUES (36,8),(38,8);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ic22mdco0hjpt8qjosdnyhxcx` (`res_key`),
  KEY `FKo4megp72bdlng5bpjmo56v1wk` (`parent_id`),
  CONSTRAINT `FKo4megp72bdlng5bpjmo56v1wk` FOREIGN KEY (`parent_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_resource`
--

LOCK TABLES `crm_resource` WRITE;
/*!40000 ALTER TABLE `crm_resource` DISABLE KEYS */;
INSERT INTO `crm_resource` VALUES (1,'','','system','系统管理','MENU','',NULL,0),(3,'/system/member/list','/system/member','system-member','用户管理','MENU','',1,NULL),(10,'/system/role/list,/system/role/resource/tree','/system/role','system-role','角色管理','MENU','',1,NULL),(11,'/system/resource/list','/system/resource','system-resource','资源管理','MENU','',1,NULL),(12,'','','role-create','创建角色','FUNCTION','',10,NULL),(13,'','/system/role/delete','role-delete','删除角色','FUNCTION','',10,NULL),(14,'/system/role/update,/system/role/save','','role-save','保存编辑','FUNCTION','',10,NULL),(17,'/system/role/resource/save','','reole-resource-save','分配资源','FUNCTION','',10,NULL),(18,'/system/resource/form,/system/resource/parent/tree,/system/resource/save','','resource-create','创建资源','FUNCTION','',11,NULL),(19,'/system/resource/form,/system/resource/parent/tree,/system/resource/save','','resource-edit','编辑','FUNCTION','',11,NULL),(20,'/system/resource/delete','','resource-delete','删除','FUNCTION','',11,NULL),(21,'/system/member/form,/system/member/save','','member-create','创建用户','FUNCTION','',3,NULL),(22,'/system/member/delete','','member-delete','删除用户','FUNCTION','',3,NULL),(23,'/system/member/form,/system/member/update','','member-edit','编辑用户','FUNCTION','',3,NULL),(26,'/system/member/password/reset','','member-reset-password','重置密码','FUNCTION','',3,NULL);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r0jsnwb00o0n376ghyuahuqfg` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
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
  KEY `FKjwyt61kixx52wper9y0li38c2` (`resource_id`),
  KEY `FKasi3s87a7p562cyw0jt3m0isf` (`role_id`),
  CONSTRAINT `FKasi3s87a7p562cyw0jt3m0isf` FOREIGN KEY (`role_id`) REFERENCES `crm_role` (`id`),
  CONSTRAINT `FKjwyt61kixx52wper9y0li38c2` FOREIGN KEY (`resource_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
-- Table structure for table `member_category`
--

DROP TABLE IF EXISTS `member_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_category` (
  `member_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  KEY `FK87r65a4xna6uray30n79f9ar4` (`category_id`),
  KEY `FKrx7egqc6fjldgyrc15m31fx04` (`member_id`),
  CONSTRAINT `FK87r65a4xna6uray30n79f9ar4` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKrx7egqc6fjldgyrc15m31fx04` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_category`
--

LOCK TABLES `member_category` WRITE;
/*!40000 ALTER TABLE `member_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_region`
--

DROP TABLE IF EXISTS `member_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_region` (
  `member_id` bigint(20) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  KEY `FKni5rb06cm3rmodcu98o9wvbmx` (`region_id`),
  KEY `FK5yt4dfydi4bj1xvaa5fd4uf1u` (`member_id`),
  CONSTRAINT `FK5yt4dfydi4bj1xvaa5fd4uf1u` FOREIGN KEY (`member_id`) REFERENCES `crm_member` (`id`),
  CONSTRAINT `FKfqffjx3xai2t994qcb9x30fk2` FOREIGN KEY (`member_id`) REFERENCES `crm_resource` (`id`),
  CONSTRAINT `FKni5rb06cm3rmodcu98o9wvbmx` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_region`
--

LOCK TABLES `member_region` WRITE;
/*!40000 ALTER TABLE `member_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_region` ENABLE KEYS */;
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
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Center America','Center America'),(2,'North America','North America'),(3,'South America','South America'),(4,'Africa/Middle East','Africa/Middle East'),(5,'Asia','Asia'),(6,'Europe','Europe');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_member`
--

DROP TABLE IF EXISTS `region_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_member` (
  `region_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_p7qe5r3ie3vl0qg3792udtpwi` (`member_id`),
  KEY `FKiqs4wflwbcpktlo516os324u7` (`region_id`),
  CONSTRAINT `FKiqs4wflwbcpktlo516os324u7` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  CONSTRAINT `FKq026i9geti9ri0mhjg2ybq0ee` FOREIGN KEY (`member_id`) REFERENCES `crm_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_member`
--

LOCK TABLES `region_member` WRITE;
/*!40000 ALTER TABLE `region_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `region_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-17 23:24:25
