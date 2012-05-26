-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.18-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cheercms
--

CREATE DATABASE IF NOT EXISTS cheercms;
USE cheercms;

--
-- Definition of table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL auto_increment,
  `department` varchar(255) default NULL,
  `email` varchar(255) NOT NULL,
  `isAccountEnabled` bit(1) NOT NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_admin`
--

/*!40000 ALTER TABLE `tbl_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_admin` ENABLE KEYS */;


--
-- Definition of table `tbl_article`
--

DROP TABLE IF EXISTS `tbl_article`;
CREATE TABLE `tbl_article` (
  `id` int(11) NOT NULL auto_increment,
  `author` varchar(255) default NULL,
  `content` varchar(255) default NULL,
  `createDate` datetime default NULL,
  `status` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `category_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK4CBE2D558DABEA31` (`category_id`),
  CONSTRAINT `FK4CBE2D558DABEA31` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_article`
--

/*!40000 ALTER TABLE `tbl_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_article` ENABLE KEYS */;


--
-- Definition of table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `orderList` int(11) NOT NULL,
  `status` varchar(255) default NULL,
  `parent_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK8B8475AD780ED17A` USING BTREE (`parent_id`),
  KEY `FK936F045F84A7E1B7` (`parent_id`),
  CONSTRAINT `FK936F045F84A7E1B7` FOREIGN KEY (`parent_id`) REFERENCES `tbl_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_category`
--

/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` (`id`,`name`,`orderList`,`status`,`parent_id`) VALUES 
 (1,'林哲',11,NULL,NULL),
 (2,'thinksaas',123,NULL,NULL);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;


--
-- Definition of table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE `tbl_member` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `memberRank_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA7AB363B9C6F65C3` (`memberRank_id`),
  CONSTRAINT `FKA7AB363B9C6F65C3` FOREIGN KEY (`memberRank_id`) REFERENCES `tbl_member_rank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_member`
--

/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;


--
-- Definition of table `tbl_member_rank`
--

DROP TABLE IF EXISTS `tbl_member_rank`;
CREATE TABLE `tbl_member_rank` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `preferentialScale` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `is_default` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_member_rank`
--

/*!40000 ALTER TABLE `tbl_member_rank` DISABLE KEYS */;
INSERT INTO `tbl_member_rank` (`id`,`name`,`preferentialScale`,`score`,`is_default`) VALUES 
 (1,'普通会员',100,0,1),
 (2,'一级会员',98,2000,0),
 (3,'二级会员',95,5000,0),
 (4,'三级会员',90,10000,0);
/*!40000 ALTER TABLE `tbl_member_rank` ENABLE KEYS */;


--
-- Definition of table `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `orderList` int(11) NOT NULL,
  `status` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `parentid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKFE43540329D790D` (`parentid`),
  CONSTRAINT `FKFE43540329D790D` FOREIGN KEY (`parentid`) REFERENCES `tbl_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_menu`
--

/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
INSERT INTO `tbl_menu` (`id`,`name`,`orderList`,`status`,`url`,`parentid`) VALUES 
 (1,'网站设置',1,NULL,'menu/setting',NULL),
 (2,'管理员',2,NULL,'menu/admin',NULL),
 (3,'页面内容',3,NULL,'menu/content',NULL),
 (4,'会员管理',4,NULL,'menu/member',NULL),
 (5,'订单管理',5,NULL,'menu/order',NULL),
 (6,'商品管理',6,NULL,'menu/product',NULL),
 (7,'网站设置',1,NULL,'javascript:void(0);',1),
 (8,'支付管理',2,NULL,'javascript:void(0);',1),
 (9,'配送管理',3,NULL,'javascript:void(0);',1),
 (10,'支付方式',1,NULL,'',8),
 (11,'配送方式',1,NULL,'',9),
 (12,'城区管理',2,NULL,'',9),
 (13,'物流公司',3,NULL,'',9),
 (14,'管理员',1,NULL,'javascript:void(0);',2),
 (15,'站内消息',2,NULL,'javascript:void(0);',2),
 (16,'操作日志',3,NULL,'javascript:void(0);',2),
 (17,'管理员列表',1,NULL,'',14),
 (18,'角色管理',2,NULL,'',14),
 (19,'收件箱',1,NULL,'',15),
 (20,'发件箱',2,NULL,'',15),
 (21,'查看日志',1,NULL,'',16),
 (22,'系统设置',1,NULL,'',7),
 (23,'在线客服',2,NULL,'',7),
 (24,'内容管理',1,NULL,'',3),
 (25,'文章管理',2,NULL,'',24),
 (26,'文章分类',3,NULL,'',24),
 (27,'友情链接',4,NULL,'',24),
 (28,'导航管理',1,NULL,'',24),
 (29,'模板管理',2,NULL,'',3),
 (30,'缓存管理',3,NULL,'',3),
 (31,'网站更新',4,NULL,'',3),
 (32,'页面模板管理',1,NULL,'',29),
 (33,'邮件模板管理',2,NULL,'',29),
 (34,'打印模板管理',3,NULL,'',29),
 (35,'更新缓存',1,NULL,'',30),
 (36,'一键网站更新',1,NULL,'',31),
 (37,'文章更新',2,NULL,'',31),
 (38,'商品更新',3,NULL,'',31);
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
