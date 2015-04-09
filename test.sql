-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add 公司信息',7,'add_company'),(20,'Can change 公司信息',7,'change_company'),(21,'Can delete 公司信息',7,'delete_company'),(22,'Can add 证件信息',8,'add_card'),(23,'Can change 证件信息',8,'change_card'),(24,'Can delete 证件信息',8,'delete_card'),(25,'Can add 人员信息',9,'add_person'),(26,'Can change 人员信息',9,'change_person'),(27,'Can delete 人员信息',9,'delete_person'),(28,'Can add 会议信息',10,'add_meeting'),(29,'Can change 会议信息',10,'change_meeting'),(30,'Can delete 会议信息',10,'delete_meeting'),(31,'Can add log entry',11,'add_logentry'),(32,'Can change log entry',11,'change_logentry'),(33,'Can delete log entry',11,'delete_logentry'),(34,'Can add post',12,'add_post'),(35,'Can change post',12,'change_post'),(36,'Can delete post',12,'delete_post'),(37,'Can add 作者',13,'add_author'),(38,'Can change 作者',13,'change_author'),(39,'Can delete 作者',13,'delete_author'),(40,'Can add 书',14,'add_book'),(41,'Can change 书',14,'change_book'),(42,'Can delete 书',14,'delete_book'),(43,'Can view content type',4,'view_contenttype'),(44,'Can view group',2,'view_group'),(45,'Can view log entry',11,'view_logentry'),(46,'Can view permission',1,'view_permission'),(47,'Can view post',12,'view_post'),(48,'Can view session',5,'view_session'),(49,'Can view site',6,'view_site'),(50,'Can view user',3,'view_user'),(51,'Can view 书',14,'view_book'),(52,'Can view 人员信息',9,'view_person'),(53,'Can view 会议信息',10,'view_meeting'),(54,'Can view 作者',13,'view_author'),(55,'Can view 公司信息',7,'view_company'),(56,'Can view 证件信息',8,'view_card'),(57,'Can add Bookmark',15,'add_bookmark'),(58,'Can change Bookmark',15,'change_bookmark'),(59,'Can delete Bookmark',15,'delete_bookmark'),(60,'Can add User Setting',16,'add_usersettings'),(61,'Can change User Setting',16,'change_usersettings'),(62,'Can delete User Setting',16,'delete_usersettings'),(63,'Can add User Widget',17,'add_userwidget'),(64,'Can change User Widget',17,'change_userwidget'),(65,'Can delete User Widget',17,'delete_userwidget');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$YxODwQC0KSSC$4feWWE/D7B6/pfTIQ0I84aBHfWivn1Kf43ZtJed49NU=','2014-08-22 09:07:53',1,'jiazj','','','1289521190@qq.com',1,1,'2014-05-15 07:03:21');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_company`
--

DROP TABLE IF EXISTS `company_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `site` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_company`
--

LOCK TABLES `company_company` WRITE;
/*!40000 ALTER TABLE `company_company` DISABLE KEYS */;
INSERT INTO `company_company` VALUES (1,'联碧','上海市松江区','./lbslogo.png','http://www.lianbi.com.cn/'),(2,'百度','上海市浦东新区','./bdlogo.gif','http://www.baidu.com/'),(3,'腾讯','深证市','./qqlogo_1x.png','http://www.qq.com/'),(4,'阿里巴巴','杭州市','./u2693571682296313550fm58.jpg','http://www.tmall.com/'),(8,'京东','上海市','./logo-201305.png','http://www.jd.com/'),(10,'Google','美国','./index.jpg','http://www.google.com/');
/*!40000 ALTER TABLE `company_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_post`
--

DROP TABLE IF EXISTS `company_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_post`
--

LOCK TABLES `company_post` WRITE;
/*!40000 ALTER TABLE `company_post` DISABLE KEYS */;
INSERT INTO `company_post` VALUES (1,'<h1><strong>1:这是一个什么</strong>&nbsp;&nbsp;&nbsp; <span style=\"background-color:Yellow;\">vaafsf</span></h1>\r\n\r\n<p>2.<img alt=\"\" src=\"/media/uploads/2014/07/03/ls-parm.jpg\" style=\"width: 200px; height: 218px;\" /></p>\r\n\r\n<p>3.哈哈哈哈</p>\r\n\r\n<p>4.啊实打实打算就</p>\r\n');
/*!40000 ALTER TABLE `company_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-05-15 08:52:58',1,7,'1','联碧',1,''),(2,'2014-05-15 08:54:54',1,7,'2','百度',1,''),(3,'2014-05-15 08:59:48',1,7,'3','腾讯',1,''),(4,'2014-05-15 09:04:58',1,7,'4','阿里巴巴',1,''),(5,'2014-05-15 09:07:17',1,8,'3','身份证:身份证',1,''),(6,'2014-05-15 09:08:38',1,8,'4','身份证:411528191111055322',1,''),(7,'2014-05-15 09:08:56',1,8,'5','身份证:411526985511200321',1,''),(8,'2014-05-15 09:09:47',1,9,'1','小贾',1,''),(9,'2014-05-15 09:10:26',1,9,'2','Rory',1,''),(10,'2014-05-15 09:11:14',1,9,'3','jiazj',1,''),(11,'2014-05-15 09:12:31',1,10,'1','ICT',1,''),(12,'2014-05-15 09:13:13',1,10,'2','O2O',1,''),(13,'2014-05-15 09:46:07',1,7,'4','阿里巴巴',2,'Changed addr.'),(14,'2014-05-15 09:46:15',1,7,'4','阿里巴巴',2,'Changed addr.'),(15,'2014-05-16 04:02:03',1,7,'4','阿里巴巴',2,'已修改 logo 。'),(16,'2014-05-16 04:11:16',1,7,'3','腾讯',2,'已修改 logo 。'),(17,'2014-05-16 04:11:35',1,7,'2','百度',2,'已修改 logo 。'),(18,'2014-05-16 04:11:40',1,7,'1','联碧',2,'已修改 logo 。'),(19,'2014-05-16 05:48:56',1,7,'8','京东',2,'已修改 logo 。'),(20,'2014-05-16 05:49:05',1,7,'4','阿里巴巴',2,'已修改 logo 。'),(21,'2014-05-16 05:49:11',1,7,'3','腾讯',2,'已修改 logo 。'),(22,'2014-05-16 05:49:15',1,7,'2','百度',2,'已修改 logo 。'),(23,'2014-05-16 05:49:21',1,7,'1','联碧',2,'已修改 logo 。'),(24,'2014-07-03 03:39:02',1,12,'1','Post object',1,''),(25,'2014-07-03 03:39:16',1,12,'1','Post object',2,'已修改 content 。'),(26,'2014-07-03 03:43:31',1,12,'1','Post object',2,'已修改 content 。'),(27,'2014-07-03 03:52:23',1,12,'1','Post object',2,'已修改 content 。'),(28,'2014-07-03 04:04:32',1,12,'1','Post object',2,'已修改 content 。'),(29,'2014-07-03 04:06:25',1,12,'1','Post object',2,'已修改 content 。'),(30,'2014-07-03 04:06:55',1,12,'1','Post object',2,'已修改 content 。'),(31,'2014-07-03 06:06:41',1,12,'1','Post object',2,'已修改 content 。'),(32,'2014-07-03 06:08:14',1,12,'1','Post object',2,'已修改 content 。'),(33,'2014-07-03 06:23:25',1,12,'1','Post object',2,'已修改 content 。'),(34,'2014-07-03 06:27:42',1,12,'1','Post object',2,'已修改 content 。'),(35,'2014-07-03 06:27:53',1,12,'1','Post object',2,'没有字段被修改。');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'公司信息','company','company'),(8,'证件信息','person','card'),(9,'人员信息','person','person'),(10,'会议信息','meeting','meeting'),(11,'log entry','admin','logentry'),(12,'post','company','post'),(13,'作者','person','author'),(14,'书','person','book'),(15,'Bookmark','xadmin','bookmark'),(16,'User Setting','xadmin','usersettings'),(17,'User Widget','xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('08v6vsrbrozeqt77hu5hmcjg26pkfg2f','NmFiZGJkNWRkNmZkNmU1NTA3OGQ3NTM4ZjUxYjFiMmNmYzk4NDUzZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-17 04:04:16'),('518xjbjgk8dtu2muii478yrbc41j0h0o','NmFiZGJkNWRkNmZkNmU1NTA3OGQ3NTM4ZjUxYjFiMmNmYzk4NDUzZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-17 03:37:47'),('5mefmz6cpds2fb1l0wrzhug6p3xzf13x','Mjc0YmUzNjcyMzk4M2M3OTNiODMyMjUwYjY5YWU0YWI3NmJjY2FlNTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==','2014-07-29 07:23:34'),('5zn3spv0bl8d1o5dnnnvpigiv5qfilz6','NmFiZGJkNWRkNmZkNmU1NTA3OGQ3NTM4ZjUxYjFiMmNmYzk4NDUzZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-29 02:12:14'),('96ve6zbikikz72u3hdflewo1su4ium52','NmFiZGJkNWRkNmZkNmU1NTA3OGQ3NTM4ZjUxYjFiMmNmYzk4NDUzZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-17 06:35:15'),('9shagt2alyzgnt9k4lqejdt8wef0xs65','NmFiZGJkNWRkNmZkNmU1NTA3OGQ3NTM4ZjUxYjFiMmNmYzk4NDUzZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-29 09:23:22'),('g2da7ap6ctt14argwc547fbs88k5xv1e','NmFiZGJkNWRkNmZkNmU1NTA3OGQ3NTM4ZjUxYjFiMmNmYzk4NDUzZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-17 03:52:07'),('nkcobzu81cujaf7jtkqho88c2vbfdp1d','NmFiZGJkNWRkNmZkNmU1NTA3OGQ3NTM4ZjUxYjFiMmNmYzk4NDUzZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-23 06:07:50'),('pc2uftrq6oxqh7nm18nr8a854ad1nsz9','Mjc0YmUzNjcyMzk4M2M3OTNiODMyMjUwYjY5YWU0YWI3NmJjY2FlNTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==','2014-06-17 01:16:20'),('qf1m65i2n6pbtv5zqqfeaww758tsoy7m','Mjc0YmUzNjcyMzk4M2M3OTNiODMyMjUwYjY5YWU0YWI3NmJjY2FlNTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==','2014-09-05 09:15:45'),('s7gw6m2vtpcc4ely56gsekmp1b4ix1fy','NmFiZGJkNWRkNmZkNmU1NTA3OGQ3NTM4ZjUxYjFiMmNmYzk4NDUzZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-18 00:47:35'),('wta45sti70tthcn6deq7m5c7184a1b0e','NmFiZGJkNWRkNmZkNmU1NTA3OGQ3NTM4ZjUxYjFiMmNmYzk4NDUzZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-17 06:10:00');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_meeting`
--

DROP TABLE IF EXISTS `meeting_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) NOT NULL,
  `m_time` datetime NOT NULL,
  `addr` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_meeting`
--

LOCK TABLES `meeting_meeting` WRITE;
/*!40000 ALTER TABLE `meeting_meeting` DISABLE KEYS */;
INSERT INTO `meeting_meeting` VALUES (1,'ICT','2014-05-21 04:00:00','上海市'),(2,'O2O','2014-05-26 04:00:00','北京市');
/*!40000 ALTER TABLE `meeting_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_meeting_company`
--

DROP TABLE IF EXISTS `meeting_meeting_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_meeting_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meeting_id` (`meeting_id`,`company_id`),
  KEY `meeting_meeting_company_7842a746` (`meeting_id`),
  KEY `meeting_meeting_company_0316dde1` (`company_id`),
  CONSTRAINT `company_id_refs_id_a354ce9c` FOREIGN KEY (`company_id`) REFERENCES `company_company` (`id`),
  CONSTRAINT `meeting_id_refs_id_687180f3` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meeting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_meeting_company`
--

LOCK TABLES `meeting_meeting_company` WRITE;
/*!40000 ALTER TABLE `meeting_meeting_company` DISABLE KEYS */;
INSERT INTO `meeting_meeting_company` VALUES (1,1,1),(2,1,2),(3,1,4),(4,2,1),(5,2,2),(6,2,3),(7,2,4);
/*!40000 ALTER TABLE `meeting_meeting_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_author`
--

DROP TABLE IF EXISTS `person_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `title` varchar(3) NOT NULL,
  `birth_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_author`
--

LOCK TABLES `person_author` WRITE;
/*!40000 ALTER TABLE `person_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_book`
--

DROP TABLE IF EXISTS `person_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `authors_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_book_1314c5eb` (`authors_id`),
  CONSTRAINT `authors_id_refs_id_5125de33` FOREIGN KEY (`authors_id`) REFERENCES `person_author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_book`
--

LOCK TABLES `person_book` WRITE;
/*!40000 ALTER TABLE `person_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_card`
--

DROP TABLE IF EXISTS `person_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type` varchar(20) NOT NULL,
  `card_num` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_card`
--

LOCK TABLES `person_card` WRITE;
/*!40000 ALTER TABLE `person_card` DISABLE KEYS */;
INSERT INTO `person_card` VALUES (3,'身份证','411528198811055011'),(4,'身份证','411528191111055322'),(5,'身份证','411526985511200321');
/*!40000 ALTER TABLE `person_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_person`
--

DROP TABLE IF EXISTS `person_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `mail` varchar(75) NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_id` (`card_id`),
  KEY `person_person_0316dde1` (`company_id`),
  CONSTRAINT `card_id_refs_id_d2d14474` FOREIGN KEY (`card_id`) REFERENCES `person_card` (`id`),
  CONSTRAINT `company_id_refs_id_e79d1ca7` FOREIGN KEY (`company_id`) REFERENCES `company_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_person`
--

LOCK TABLES `person_person` WRITE;
/*!40000 ALTER TABLE `person_person` DISABLE KEYS */;
INSERT INTO `person_person` VALUES (1,'小贾',23,'13917974506',1,'1289521190@qq.com',3),(2,'Rory',24,'13917974506',2,'Rory_jia@flyme.com',4),(3,'jiazj',25,'13917974506',3,'rory.jia@gmail.com',5);
/*!40000 ALTER TABLE `person_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url_name` varchar(64) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_6340c63c` (`user_id`),
  KEY `xadmin_bookmark_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_af66fd92` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_91d2dce8` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_a4128191` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,1,'dashboard:home:pos','');
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_97371ff7` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-08  9:59:11
