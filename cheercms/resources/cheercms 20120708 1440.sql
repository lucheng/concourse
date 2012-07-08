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
-- Definition of table `tbl_agreement`
--

DROP TABLE IF EXISTS `tbl_agreement`;
CREATE TABLE `tbl_agreement` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `content` varchar(10000) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_agreement`
--

/*!40000 ALTER TABLE `tbl_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_agreement` ENABLE KEYS */;


--
-- Definition of table `tbl_area`
--

DROP TABLE IF EXISTS `tbl_area`;
CREATE TABLE `tbl_area` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(10000) default NULL,
  `parent_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`,`parent_id`),
  KEY `FKFD0648E67F351C6` (`parent_id`),
  CONSTRAINT `FKFD0648E67F351C6` FOREIGN KEY (`parent_id`) REFERENCES `tbl_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_area`
--

/*!40000 ALTER TABLE `tbl_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_area` ENABLE KEYS */;


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
  `modifyDate` datetime default NULL,
  `hits` int(11) NOT NULL,
  `htmlFilePath` varchar(255) default NULL,
  `isPublication` bit(1) NOT NULL,
  `isRecommend` bit(1) NOT NULL,
  `isTop` bit(1) NOT NULL,
  `metaDescription` varchar(5000) default NULL,
  `metaKeywords` varchar(5000) default NULL,
  `pageCount` int(11) NOT NULL,
  `articleCategory_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK4CBE2D558DABEA31` (`category_id`),
  KEY `FK4CBE2D55A555E551` (`articleCategory_id`),
  CONSTRAINT `FK4CBE2D558DABEA31` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`),
  CONSTRAINT `FK4CBE2D55A555E551` FOREIGN KEY (`articleCategory_id`) REFERENCES `tbl_articlecategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_article`
--

/*!40000 ALTER TABLE `tbl_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_article` ENABLE KEYS */;


--
-- Definition of table `tbl_articlecategory`
--

DROP TABLE IF EXISTS `tbl_articlecategory`;
CREATE TABLE `tbl_articlecategory` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `metaDescription` varchar(5000) default NULL,
  `metaKeywords` varchar(5000) default NULL,
  `name` varchar(255) NOT NULL,
  `orderList` int(11) NOT NULL,
  `path` varchar(10000) default NULL,
  `parent_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKF7D729734BEF4CDB` (`parent_id`),
  CONSTRAINT `FKF7D729734BEF4CDB` FOREIGN KEY (`parent_id`) REFERENCES `tbl_articlecategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_articlecategory`
--

/*!40000 ALTER TABLE `tbl_articlecategory` DISABLE KEYS */;
INSERT INTO `tbl_articlecategory` (`id`,`createDate`,`modifyDate`,`metaDescription`,`metaKeywords`,`name`,`orderList`,`path`,`parent_id`) VALUES 
 (1,NULL,NULL,'111','111','林哲',1,NULL,NULL),
 (2,NULL,NULL,'qqq','qq','carus',11,'aaaa',NULL),
 (3,NULL,NULL,'sss','111','林哲',2,'aaaa',NULL);
/*!40000 ALTER TABLE `tbl_articlecategory` ENABLE KEYS */;


--
-- Definition of table `tbl_brand`
--

DROP TABLE IF EXISTS `tbl_brand`;
CREATE TABLE `tbl_brand` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `introduction` varchar(10000) default NULL,
  `logo` varchar(255) default NULL,
  `name` varchar(255) NOT NULL,
  `orderList` int(11) NOT NULL,
  `url` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_brand`
--

/*!40000 ALTER TABLE `tbl_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_brand` ENABLE KEYS */;


--
-- Definition of table `tbl_cartitem`
--

DROP TABLE IF EXISTS `tbl_cartitem`;
CREATE TABLE `tbl_cartitem` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `quantity` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK94A585D45FAF8DA3` (`member_id`),
  KEY `FK94A585D43A98251` (`product_id`),
  CONSTRAINT `FK94A585D43A98251` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`),
  CONSTRAINT `FK94A585D45FAF8DA3` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_cartitem`
--

/*!40000 ALTER TABLE `tbl_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cartitem` ENABLE KEYS */;


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
-- Definition of table `tbl_deliverycorp`
--

DROP TABLE IF EXISTS `tbl_deliverycorp`;
CREATE TABLE `tbl_deliverycorp` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `name` varchar(255) NOT NULL,
  `orderList` int(11) NOT NULL,
  `url` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_deliverycorp`
--

/*!40000 ALTER TABLE `tbl_deliverycorp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_deliverycorp` ENABLE KEYS */;


--
-- Definition of table `tbl_deliveryitem`
--

DROP TABLE IF EXISTS `tbl_deliveryitem`;
CREATE TABLE `tbl_deliveryitem` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `deliveryQuantity` int(11) NOT NULL,
  `productHtmlFilePath` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productSn` varchar(255) NOT NULL,
  `product_id` int(11) default NULL,
  `reship_id` int(11) default NULL,
  `shipping_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK9AB3F42828C5DEE3` (`shipping_id`),
  KEY `FK9AB3F428956AB183` (`reship_id`),
  KEY `FK9AB3F4283A98251` (`product_id`),
  CONSTRAINT `FK9AB3F42828C5DEE3` FOREIGN KEY (`shipping_id`) REFERENCES `tbl_shipping` (`id`),
  CONSTRAINT `FK9AB3F4283A98251` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`),
  CONSTRAINT `FK9AB3F428956AB183` FOREIGN KEY (`reship_id`) REFERENCES `tbl_reship` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_deliveryitem`
--

/*!40000 ALTER TABLE `tbl_deliveryitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_deliveryitem` ENABLE KEYS */;


--
-- Definition of table `tbl_deliverytype`
--

DROP TABLE IF EXISTS `tbl_deliverytype`;
CREATE TABLE `tbl_deliverytype` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `continueWeight` double NOT NULL,
  `continueWeightPrice` decimal(15,5) NOT NULL,
  `continueWeightUnit` int(11) NOT NULL,
  `deliveryMethod` int(11) NOT NULL,
  `description` varchar(10000) default NULL,
  `firstWeight` double NOT NULL,
  `firstWeightPrice` decimal(15,5) NOT NULL,
  `firstWeightUnit` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `orderList` int(11) NOT NULL,
  `defaultDeliveryCorp_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK9AB9084F6AE03022` (`defaultDeliveryCorp_id`),
  CONSTRAINT `FK9AB9084F6AE03022` FOREIGN KEY (`defaultDeliveryCorp_id`) REFERENCES `tbl_deliverycorp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_deliverytype`
--

/*!40000 ALTER TABLE `tbl_deliverytype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_deliverytype` ENABLE KEYS */;


--
-- Definition of table `tbl_deposit`
--

DROP TABLE IF EXISTS `tbl_deposit`;
CREATE TABLE `tbl_deposit` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `balance` decimal(19,2) NOT NULL,
  `credit` decimal(19,2) NOT NULL,
  `debit` decimal(19,2) NOT NULL,
  `depositType` int(11) NOT NULL,
  `member_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKD50C76FD5FAF8DA3` (`member_id`),
  CONSTRAINT `FKD50C76FD5FAF8DA3` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_deposit`
--

/*!40000 ALTER TABLE `tbl_deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_deposit` ENABLE KEYS */;


--
-- Definition of table `tbl_footer`
--

DROP TABLE IF EXISTS `tbl_footer`;
CREATE TABLE `tbl_footer` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `content` varchar(10000) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_footer`
--

/*!40000 ALTER TABLE `tbl_footer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_footer` ENABLE KEYS */;


--
-- Definition of table `tbl_friendlink`
--

DROP TABLE IF EXISTS `tbl_friendlink`;
CREATE TABLE `tbl_friendlink` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `logo` varchar(255) default NULL,
  `name` varchar(255) NOT NULL,
  `orderList` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_friendlink`
--

/*!40000 ALTER TABLE `tbl_friendlink` DISABLE KEYS */;
INSERT INTO `tbl_friendlink` (`id`,`createDate`,`modifyDate`,`logo`,`name`,`orderList`,`url`) VALUES 
 (6,NULL,NULL,NULL,'林哲',2,'http://www.cheerfly.com'),
 (7,NULL,NULL,NULL,'carus',2,'http://www.cheerfly.com'),
 (8,NULL,NULL,NULL,'thinksaas',1,'http://www.baidu.com'),
 (9,NULL,NULL,NULL,'百度',3,'http://www.baidu.com'),
 (10,NULL,NULL,NULL,'百度1',2,'http://www.baidu.com'),
 (11,NULL,NULL,NULL,'thinksaas',2,'http://www.google.com'),
 (12,NULL,NULL,NULL,'linzhe',3,'http://www.baidu.com'),
 (13,NULL,NULL,NULL,'thinksaas',4,'http://www.360buy.com/product/276555.html'),
 (14,NULL,NULL,NULL,'yunbian',123,'http://www.google.com'),
 (15,NULL,NULL,NULL,'carus',4,'http://www.cheerfly.com'),
 (16,NULL,NULL,NULL,'carus',100,'http://www.baidu.com'),
 (18,'2012-05-31 22:06:16',NULL,NULL,'yunbian',2,'http://www.cheerfly.com');
/*!40000 ALTER TABLE `tbl_friendlink` ENABLE KEYS */;


--
-- Definition of table `tbl_log`
--

DROP TABLE IF EXISTS `tbl_log`;
CREATE TABLE `tbl_log` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `actionClassName` varchar(255) NOT NULL,
  `actionMethodName` varchar(255) NOT NULL,
  `info` varchar(5000) default NULL,
  `ip` varchar(255) NOT NULL,
  `operationName` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_log`
--

/*!40000 ALTER TABLE `tbl_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_log` ENABLE KEYS */;


--
-- Definition of table `tbl_logconfig`
--

DROP TABLE IF EXISTS `tbl_logconfig`;
CREATE TABLE `tbl_logconfig` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `actionClassName` varchar(255) NOT NULL,
  `actionMethodName` varchar(255) NOT NULL,
  `description` varchar(5000) default NULL,
  `operationName` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `operationName` (`operationName`),
  UNIQUE KEY `actionClassName` (`actionClassName`,`actionMethodName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_logconfig`
--

/*!40000 ALTER TABLE `tbl_logconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_logconfig` ENABLE KEYS */;


--
-- Definition of table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE `tbl_member` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `memberRank_id` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `deposit` decimal(15,5) NOT NULL,
  `email` varchar(255) NOT NULL,
  `isAccountEnabled` bit(1) NOT NULL,
  `isAccountLocked` bit(1) NOT NULL,
  `lockedDate` datetime default NULL,
  `loginDate` datetime default NULL,
  `loginFailureCount` int(11) NOT NULL,
  `loginIp` varchar(255) default NULL,
  `password` varchar(255) NOT NULL,
  `passwordRecoverKey` varchar(255) default NULL,
  `point` int(11) NOT NULL,
  `registerIp` varchar(255) NOT NULL,
  `safeAnswer` varchar(255) default NULL,
  `safeQuestion` varchar(255) default NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FKA7AB363B9C6F65C3` (`memberRank_id`),
  KEY `FK7110225B9C6F65C3` (`memberRank_id`),
  CONSTRAINT `FK7110225B9C6F65C3` FOREIGN KEY (`memberRank_id`) REFERENCES `tbl_memberrank` (`id`),
  CONSTRAINT `FKA7AB363B9C6F65C3` FOREIGN KEY (`memberRank_id`) REFERENCES `tbl_member_rank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_member`
--

/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;


--
-- Definition of table `tbl_member_memberattributemapstore`
--

DROP TABLE IF EXISTS `tbl_member_memberattributemapstore`;
CREATE TABLE `tbl_member_memberattributemapstore` (
  `tbl_Member_id` int(11) NOT NULL,
  `element` varchar(255) default NULL,
  `memberAttributeMapStore_KEY` int(11) NOT NULL,
  PRIMARY KEY  (`tbl_Member_id`,`memberAttributeMapStore_KEY`),
  KEY `FK9B019243DCCC3262` (`tbl_Member_id`),
  KEY `FK9B01924318423B80` (`memberAttributeMapStore_KEY`),
  CONSTRAINT `FK9B01924318423B80` FOREIGN KEY (`memberAttributeMapStore_KEY`) REFERENCES `tbl_memberattribute` (`id`),
  CONSTRAINT `FK9B019243DCCC3262` FOREIGN KEY (`tbl_Member_id`) REFERENCES `tbl_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_member_memberattributemapstore`
--

/*!40000 ALTER TABLE `tbl_member_memberattributemapstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_member_memberattributemapstore` ENABLE KEYS */;


--
-- Definition of table `tbl_member_product`
--

DROP TABLE IF EXISTS `tbl_member_product`;
CREATE TABLE `tbl_member_product` (
  `favoriteMemberSet_id` int(11) NOT NULL,
  `favoriteProductSet_id` int(11) NOT NULL,
  PRIMARY KEY  (`favoriteMemberSet_id`,`favoriteProductSet_id`),
  KEY `FKE1F83EEB24994B91` (`favoriteProductSet_id`),
  KEY `FKE1F83EEBBB789591` (`favoriteMemberSet_id`),
  CONSTRAINT `FKE1F83EEB24994B91` FOREIGN KEY (`favoriteProductSet_id`) REFERENCES `tbl_product` (`id`),
  CONSTRAINT `FKE1F83EEBBB789591` FOREIGN KEY (`favoriteMemberSet_id`) REFERENCES `tbl_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_member_product`
--

/*!40000 ALTER TABLE `tbl_member_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_member_product` ENABLE KEYS */;


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
-- Definition of table `tbl_memberattribute`
--

DROP TABLE IF EXISTS `tbl_memberattribute`;
CREATE TABLE `tbl_memberattribute` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `attributeOptionStore` varchar(255) default NULL,
  `attributeType` int(11) NOT NULL,
  `isEnabled` bit(1) NOT NULL,
  `isRequired` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `orderList` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_memberattribute`
--

/*!40000 ALTER TABLE `tbl_memberattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_memberattribute` ENABLE KEYS */;


--
-- Definition of table `tbl_memberrank`
--

DROP TABLE IF EXISTS `tbl_memberrank`;
CREATE TABLE `tbl_memberrank` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `isDefault` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  `preferentialScale` double NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `point` (`point`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_memberrank`
--

/*!40000 ALTER TABLE `tbl_memberrank` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_memberrank` ENABLE KEYS */;


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
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKFE43540329D790D` (`parentid`),
  CONSTRAINT `FKFE43540329D790D` FOREIGN KEY (`parentid`) REFERENCES `tbl_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_menu`
--

/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
INSERT INTO `tbl_menu` (`id`,`name`,`orderList`,`status`,`url`,`parentid`,`createDate`,`modifyDate`) VALUES 
 (1,'网站设置',1,NULL,'menu/setting',NULL,NULL,NULL),
 (2,'管理员',2,NULL,'menu/admin',NULL,NULL,NULL),
 (3,'页面内容',3,NULL,'menu/content',NULL,NULL,NULL),
 (4,'会员管理',4,NULL,'menu/member',NULL,NULL,NULL),
 (5,'订单管理',5,NULL,'menu/order',NULL,NULL,NULL),
 (6,'商品管理',6,NULL,'menu/product',NULL,NULL,NULL),
 (7,'网站设置',1,NULL,'',1,NULL,NULL),
 (8,'支付管理',2,NULL,'javascript:void(0);',1,NULL,NULL),
 (9,'配送管理',3,NULL,'javascript:void(0);',1,NULL,NULL),
 (10,'支付方式',1,NULL,'',8,NULL,NULL),
 (11,'配送方式',1,NULL,'',9,NULL,NULL),
 (12,'城区管理',2,NULL,'',9,NULL,NULL),
 (13,'物流公司',3,NULL,'',9,NULL,NULL),
 (14,'管理员',1,NULL,'javascript:void(0);',2,NULL,NULL),
 (15,'站内消息',2,NULL,'javascript:void(0);',2,NULL,NULL),
 (16,'操作日志',3,NULL,'javascript:void(0);',2,NULL,NULL),
 (17,'管理员列表',1,NULL,'user/list',14,NULL,'2012-06-17 11:50:42'),
 (18,'角色管理',2,NULL,'role/list',14,NULL,'2012-06-17 12:22:00'),
 (19,'收件箱',1,NULL,'',15,NULL,NULL),
 (20,'发件箱',2,NULL,'',15,NULL,NULL),
 (21,'查看日志',1,NULL,'',16,NULL,NULL),
 (22,'系统设置',1,NULL,'setting/edit',7,NULL,'2012-06-02 10:01:36'),
 (23,'在线客服',2,NULL,'',7,NULL,NULL),
 (24,'内容管理',1,NULL,'',3,NULL,NULL),
 (25,'文章管理',2,NULL,'article/list',24,NULL,NULL),
 (26,'文章分类',3,NULL,'articleCategory/list',24,NULL,NULL),
 (27,'友情链接',4,NULL,'friendLink/list',24,NULL,NULL),
 (28,'导航管理',1,NULL,'',24,NULL,NULL),
 (29,'模板管理',2,NULL,'',3,NULL,NULL),
 (30,'缓存管理',3,NULL,'',3,NULL,NULL),
 (31,'网站更新',4,NULL,'',3,NULL,NULL),
 (32,'页面模板管理',1,NULL,'',29,NULL,NULL),
 (33,'邮件模板管理',2,NULL,'',29,NULL,NULL),
 (34,'打印模板管理',3,NULL,'',29,NULL,NULL),
 (35,'更新缓存',1,NULL,'',30,NULL,NULL),
 (36,'一键网站更新',1,NULL,'',31,NULL,NULL),
 (37,'文章更新',2,NULL,'',31,NULL,NULL),
 (38,'商品更新',3,NULL,'',31,NULL,NULL),
 (39,'会员管理',1,NULL,'',4,NULL,NULL),
 (40,'商品评论',2,NULL,'',39,NULL,NULL),
 (41,'会员注册项',3,NULL,'',39,NULL,NULL),
 (42,'会员管理',1,NULL,'',39,NULL,NULL),
 (43,'商品评论',2,NULL,'',4,NULL,NULL),
 (44,'在线留言',3,NULL,'',4,NULL,NULL),
 (45,'评论列表',1,NULL,'',43,NULL,NULL),
 (46,'评论设置',2,NULL,'',43,NULL,NULL),
 (47,'留言列表',1,NULL,'',44,NULL,NULL),
 (48,'留言设置',2,NULL,'',44,NULL,NULL),
 (49,'订单管理',1,NULL,'',5,NULL,NULL),
 (50,'收款单',2,NULL,'',49,NULL,NULL),
 (51,'订单列表',1,NULL,'',49,NULL,NULL),
 (52,'退款单',3,NULL,'',49,NULL,NULL),
 (53,'发货单',4,NULL,'',49,NULL,NULL),
 (54,'退货单',5,NULL,'',49,NULL,NULL),
 (55,'快递单管理',2,NULL,'',5,NULL,NULL),
 (56,'发货点管理',1,NULL,'',55,NULL,NULL),
 (57,'快递单模板',2,NULL,'',55,NULL,NULL),
 (58,'商品管理',1,NULL,'',6,NULL,NULL),
 (59,'添加商品',2,NULL,'',58,NULL,NULL),
 (60,'商品列表',1,NULL,'',58,NULL,NULL),
 (61,'到货通知',3,NULL,'',58,NULL,NULL),
 (62,'商品分类管理',2,NULL,'',6,NULL,NULL),
 (63,'商品类型管理',3,NULL,'',6,NULL,NULL),
 (64,'商品规格管理',4,NULL,'',6,NULL,NULL),
 (65,'品牌管理',5,NULL,'',6,NULL,NULL),
 (66,'分类列表',1,NULL,'productCategory/list',62,NULL,'2012-06-01 12:27:11'),
 (67,'添加分类',2,NULL,'productCategory/add',62,NULL,'2012-06-01 12:27:35'),
 (68,'类型列表',1,NULL,'',63,NULL,NULL),
 (69,'添加类型',2,NULL,'',63,NULL,NULL),
 (70,'商品规格',1,NULL,'',64,NULL,NULL),
 (71,'添加规格',2,NULL,'',64,NULL,NULL),
 (72,'品牌列表',1,NULL,'',65,NULL,NULL),
 (73,'添加品牌',2,NULL,'',65,NULL,NULL),
 (74,'资源管理',3,NULL,'resource/list',14,'2012-06-17 12:28:12',NULL);
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;


--
-- Definition of table `tbl_message`
--

DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `content` varchar(10000) NOT NULL,
  `deleteStatus` int(11) NOT NULL,
  `isRead` bit(1) NOT NULL,
  `isSaveDraftbox` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `fromMember_id` int(11) default NULL,
  `toMember_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKB1506066676E7539` (`fromMember_id`),
  KEY `FKB1506066C3289988` (`toMember_id`),
  CONSTRAINT `FKB1506066676E7539` FOREIGN KEY (`fromMember_id`) REFERENCES `tbl_member` (`id`),
  CONSTRAINT `FKB1506066C3289988` FOREIGN KEY (`toMember_id`) REFERENCES `tbl_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_message`
--

/*!40000 ALTER TABLE `tbl_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_message` ENABLE KEYS */;


--
-- Definition of table `tbl_navigation`
--

DROP TABLE IF EXISTS `tbl_navigation`;
CREATE TABLE `tbl_navigation` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `isBlankTarget` bit(1) NOT NULL,
  `isVisible` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `orderList` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_navigation`
--

/*!40000 ALTER TABLE `tbl_navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_navigation` ENABLE KEYS */;


--
-- Definition of table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `deliveryFee` decimal(15,5) NOT NULL,
  `deliveryTypeName` varchar(255) NOT NULL,
  `memo` varchar(5000) default NULL,
  `orderSn` varchar(255) NOT NULL,
  `orderStatus` int(11) NOT NULL,
  `paidAmount` decimal(15,5) NOT NULL,
  `paymentConfigName` varchar(255) NOT NULL,
  `paymentFee` decimal(15,5) NOT NULL,
  `paymentStatus` int(11) NOT NULL,
  `productTotalPrice` decimal(15,5) NOT NULL,
  `productTotalQuantity` int(11) NOT NULL,
  `productWeight` double NOT NULL,
  `productWeightUnit` int(11) NOT NULL,
  `shipAddress` varchar(255) NOT NULL,
  `shipArea` varchar(255) NOT NULL,
  `shipAreaPath` varchar(255) default NULL,
  `shipMobile` varchar(255) default NULL,
  `shipName` varchar(255) NOT NULL,
  `shipPhone` varchar(255) default NULL,
  `shipZipCode` varchar(255) NOT NULL,
  `shippingStatus` int(11) NOT NULL,
  `totalAmount` decimal(15,5) NOT NULL,
  `deliveryType_id` int(11) default NULL,
  `member_id` int(11) default NULL,
  `paymentConfig_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `orderSn` (`orderSn`),
  KEY `FKEB01736D5FAF8DA3` (`member_id`),
  KEY `FKEB01736DC564DE91` (`paymentConfig_id`),
  KEY `FKEB01736D2E128683` (`deliveryType_id`),
  CONSTRAINT `FKEB01736D2E128683` FOREIGN KEY (`deliveryType_id`) REFERENCES `tbl_deliverytype` (`id`),
  CONSTRAINT `FKEB01736D5FAF8DA3` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`),
  CONSTRAINT `FKEB01736DC564DE91` FOREIGN KEY (`paymentConfig_id`) REFERENCES `tbl_paymentconfig` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_order`
--

/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;


--
-- Definition of table `tbl_orderitem`
--

DROP TABLE IF EXISTS `tbl_orderitem`;
CREATE TABLE `tbl_orderitem` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `deliveryQuantity` int(11) NOT NULL,
  `productHtmlFilePath` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` decimal(15,5) NOT NULL,
  `productQuantity` int(11) NOT NULL,
  `productSn` varchar(255) NOT NULL,
  `totalDeliveryQuantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKDD32E420EF5EC3B1` (`order_id`),
  KEY `FKDD32E4203A98251` (`product_id`),
  CONSTRAINT `FKDD32E4203A98251` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`),
  CONSTRAINT `FKDD32E420EF5EC3B1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_orderitem`
--

/*!40000 ALTER TABLE `tbl_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_orderitem` ENABLE KEYS */;


--
-- Definition of table `tbl_orderlog`
--

DROP TABLE IF EXISTS `tbl_orderlog`;
CREATE TABLE `tbl_orderlog` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `info` varchar(5000) default NULL,
  `operator` varchar(255) default NULL,
  `orderLogType` int(11) NOT NULL,
  `orderSn` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKDDD86497EF5EC3B1` (`order_id`),
  CONSTRAINT `FKDDD86497EF5EC3B1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_orderlog`
--

/*!40000 ALTER TABLE `tbl_orderlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_orderlog` ENABLE KEYS */;


--
-- Definition of table `tbl_payment`
--

DROP TABLE IF EXISTS `tbl_payment`;
CREATE TABLE `tbl_payment` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `bankAccount` varchar(255) default NULL,
  `bankName` varchar(255) default NULL,
  `memo` varchar(5000) default NULL,
  `operator` varchar(255) default NULL,
  `payer` varchar(255) NOT NULL,
  `paymentConfigName` varchar(255) NOT NULL,
  `paymentFee` decimal(15,5) NOT NULL,
  `paymentSn` varchar(255) NOT NULL,
  `paymentStatus` int(11) NOT NULL,
  `paymentType` int(11) NOT NULL,
  `totalAmount` decimal(15,5) NOT NULL,
  `deposit_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  `paymentConfig_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `paymentSn` (`paymentSn`),
  KEY `FK4981926522886FF1` (`deposit_id`),
  KEY `FK49819265C564DE91` (`paymentConfig_id`),
  KEY `FK49819265EF5EC3B1` (`order_id`),
  CONSTRAINT `FK4981926522886FF1` FOREIGN KEY (`deposit_id`) REFERENCES `tbl_deposit` (`id`),
  CONSTRAINT `FK49819265C564DE91` FOREIGN KEY (`paymentConfig_id`) REFERENCES `tbl_paymentconfig` (`id`),
  CONSTRAINT `FK49819265EF5EC3B1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_payment`
--

/*!40000 ALTER TABLE `tbl_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_payment` ENABLE KEYS */;


--
-- Definition of table `tbl_paymentconfig`
--

DROP TABLE IF EXISTS `tbl_paymentconfig`;
CREATE TABLE `tbl_paymentconfig` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `configObjectStore` varchar(255) default NULL,
  `description` varchar(10000) default NULL,
  `name` varchar(255) NOT NULL,
  `orderList` int(11) NOT NULL,
  `paymentConfigType` int(11) NOT NULL,
  `paymentFee` decimal(15,5) default NULL,
  `paymentFeeType` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_paymentconfig`
--

/*!40000 ALTER TABLE `tbl_paymentconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_paymentconfig` ENABLE KEYS */;


--
-- Definition of table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `description` varchar(10000) default NULL,
  `freezeStore` int(11) NOT NULL,
  `htmlFilePath` varchar(255) NOT NULL,
  `isBest` bit(1) NOT NULL,
  `isHot` bit(1) NOT NULL,
  `isMarketable` bit(1) NOT NULL,
  `isNew` bit(1) NOT NULL,
  `marketPrice` decimal(15,5) NOT NULL,
  `metaDescription` varchar(5000) default NULL,
  `metaKeywords` varchar(5000) default NULL,
  `name` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  `price` decimal(15,5) NOT NULL,
  `productImageListStore` varchar(10000) default NULL,
  `productSn` varchar(255) NOT NULL,
  `store` int(11) default NULL,
  `weight` double NOT NULL,
  `weightUnit` int(11) NOT NULL,
  `brand_id` int(11) default NULL,
  `productCategory_id` int(11) NOT NULL,
  `productType_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `productSn` (`productSn`),
  KEY `FK65F32D4EA6BED0B1` (`productType_id`),
  KEY `FK65F32D4EF97B56B1` (`productCategory_id`),
  KEY `FK65F32D4EA3922D11` (`brand_id`),
  CONSTRAINT `FK65F32D4EA3922D11` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brand` (`id`),
  CONSTRAINT `FK65F32D4EA6BED0B1` FOREIGN KEY (`productType_id`) REFERENCES `tbl_producttype` (`id`),
  CONSTRAINT `FK65F32D4EF97B56B1` FOREIGN KEY (`productCategory_id`) REFERENCES `tbl_productcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_product`
--

/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;


--
-- Definition of table `tbl_product_productattributemapstore`
--

DROP TABLE IF EXISTS `tbl_product_productattributemapstore`;
CREATE TABLE `tbl_product_productattributemapstore` (
  `tbl_Product_id` int(11) NOT NULL,
  `element` varchar(255) default NULL,
  `productAttributeMapStore_KEY` int(11) NOT NULL,
  PRIMARY KEY  (`tbl_Product_id`,`productAttributeMapStore_KEY`),
  KEY `FK37678432B453488` (`productAttributeMapStore_KEY`),
  KEY `FK37678432A217572` (`tbl_Product_id`),
  CONSTRAINT `FK37678432A217572` FOREIGN KEY (`tbl_Product_id`) REFERENCES `tbl_product` (`id`),
  CONSTRAINT `FK37678432B453488` FOREIGN KEY (`productAttributeMapStore_KEY`) REFERENCES `tbl_productattribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_product_productattributemapstore`
--

/*!40000 ALTER TABLE `tbl_product_productattributemapstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_product_productattributemapstore` ENABLE KEYS */;


--
-- Definition of table `tbl_productattribute`
--

DROP TABLE IF EXISTS `tbl_productattribute`;
CREATE TABLE `tbl_productattribute` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `attributeOptionStore` varchar(255) default NULL,
  `attributeType` int(11) NOT NULL,
  `isEnabled` bit(1) NOT NULL,
  `isRequired` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `orderList` int(11) NOT NULL,
  `productType_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`,`productType_id`),
  KEY `FK6AE9B4EEA6BED0B1` (`productType_id`),
  CONSTRAINT `FK6AE9B4EEA6BED0B1` FOREIGN KEY (`productType_id`) REFERENCES `tbl_producttype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_productattribute`
--

/*!40000 ALTER TABLE `tbl_productattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_productattribute` ENABLE KEYS */;


--
-- Definition of table `tbl_productcategory`
--

DROP TABLE IF EXISTS `tbl_productcategory`;
CREATE TABLE `tbl_productcategory` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `metaDescription` varchar(5000) default NULL,
  `metaKeywords` varchar(5000) default NULL,
  `name` varchar(255) NOT NULL,
  `orderList` int(11) NOT NULL,
  `path` varchar(10000) default NULL,
  `parent_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKFE2D206C524543D4` (`parent_id`),
  CONSTRAINT `FKFE2D206C524543D4` FOREIGN KEY (`parent_id`) REFERENCES `tbl_productcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_productcategory`
--

/*!40000 ALTER TABLE `tbl_productcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_productcategory` ENABLE KEYS */;


--
-- Definition of table `tbl_producttype`
--

DROP TABLE IF EXISTS `tbl_producttype`;
CREATE TABLE `tbl_producttype` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_producttype`
--

/*!40000 ALTER TABLE `tbl_producttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_producttype` ENABLE KEYS */;


--
-- Definition of table `tbl_receiver`
--

DROP TABLE IF EXISTS `tbl_receiver`;
CREATE TABLE `tbl_receiver` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `address` varchar(5000) NOT NULL,
  `areaPath` varchar(10000) NOT NULL,
  `isDefault` bit(1) NOT NULL,
  `mobile` varchar(255) default NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) default NULL,
  `zipCode` varchar(255) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK641295705FAF8DA3` (`member_id`),
  CONSTRAINT `FK641295705FAF8DA3` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_receiver`
--

/*!40000 ALTER TABLE `tbl_receiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_receiver` ENABLE KEYS */;


--
-- Definition of table `tbl_refund`
--

DROP TABLE IF EXISTS `tbl_refund`;
CREATE TABLE `tbl_refund` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `bankAccount` varchar(255) default NULL,
  `bankName` varchar(255) default NULL,
  `memo` varchar(5000) default NULL,
  `operator` varchar(255) default NULL,
  `payee` varchar(255) NOT NULL,
  `paymentConfigName` varchar(255) NOT NULL,
  `refundSn` varchar(255) NOT NULL,
  `refundType` int(11) NOT NULL,
  `totalAmount` decimal(15,5) NOT NULL,
  `deposit_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  `paymentConfig_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `refundSn` (`refundSn`),
  KEY `FK7995773922886FF1` (`deposit_id`),
  KEY `FK79957739C564DE91` (`paymentConfig_id`),
  KEY `FK79957739EF5EC3B1` (`order_id`),
  CONSTRAINT `FK7995773922886FF1` FOREIGN KEY (`deposit_id`) REFERENCES `tbl_deposit` (`id`),
  CONSTRAINT `FK79957739C564DE91` FOREIGN KEY (`paymentConfig_id`) REFERENCES `tbl_paymentconfig` (`id`),
  CONSTRAINT `FK79957739EF5EC3B1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_refund`
--

/*!40000 ALTER TABLE `tbl_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_refund` ENABLE KEYS */;


--
-- Definition of table `tbl_reship`
--

DROP TABLE IF EXISTS `tbl_reship`;
CREATE TABLE `tbl_reship` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `deliveryCorpName` varchar(255) NOT NULL,
  `deliveryFee` decimal(19,2) NOT NULL,
  `deliverySn` varchar(255) default NULL,
  `deliveryTypeName` varchar(255) NOT NULL,
  `memo` varchar(255) default NULL,
  `reshipSn` varchar(255) NOT NULL,
  `shipAddress` varchar(255) NOT NULL,
  `shipArea` varchar(255) NOT NULL,
  `shipAreaPath` varchar(255) default NULL,
  `shipMobile` varchar(255) default NULL,
  `shipName` varchar(255) NOT NULL,
  `shipPhone` varchar(255) default NULL,
  `shipZipCode` varchar(255) NOT NULL,
  `deliveryType_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `reshipSn` (`reshipSn`),
  KEY `FK799B2EB0EF5EC3B1` (`order_id`),
  KEY `FK799B2EB02E128683` (`deliveryType_id`),
  CONSTRAINT `FK799B2EB02E128683` FOREIGN KEY (`deliveryType_id`) REFERENCES `tbl_deliverytype` (`id`),
  CONSTRAINT `FK799B2EB0EF5EC3B1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_reship`
--

/*!40000 ALTER TABLE `tbl_reship` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reship` ENABLE KEYS */;


--
-- Definition of table `tbl_resource`
--

DROP TABLE IF EXISTS `tbl_resource`;
CREATE TABLE `tbl_resource` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `description` varchar(5000) default NULL,
  `isSystem` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_resource`
--

/*!40000 ALTER TABLE `tbl_resource` DISABLE KEYS */;
INSERT INTO `tbl_resource` (`id`,`createDate`,`modifyDate`,`description`,`isSystem`,`name`,`value`) VALUES 
 (1,'2012-06-17 13:01:00',NULL,'价格',0x01,'网站设置','ROLE_SETTING');
/*!40000 ALTER TABLE `tbl_resource` ENABLE KEYS */;


--
-- Definition of table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `description` varchar(5000) default NULL,
  `enable` bit(1) NOT NULL,
  `isSystem` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_role`
--

/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;


--
-- Definition of table `tbl_role_resource`
--

DROP TABLE IF EXISTS `tbl_role_resource`;
CREATE TABLE `tbl_role_resource` (
  `roleSet_id` int(11) NOT NULL,
  `resourceSet_id` int(11) NOT NULL,
  PRIMARY KEY  (`roleSet_id`,`resourceSet_id`),
  KEY `FK830D5AF67ACBE2ED` (`roleSet_id`),
  KEY `FK830D5AF6254CFB9D` (`resourceSet_id`),
  CONSTRAINT `FK830D5AF6254CFB9D` FOREIGN KEY (`resourceSet_id`) REFERENCES `tbl_resource` (`id`),
  CONSTRAINT `FK830D5AF67ACBE2ED` FOREIGN KEY (`roleSet_id`) REFERENCES `tbl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_role_resource`
--

/*!40000 ALTER TABLE `tbl_role_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_role_resource` ENABLE KEYS */;


--
-- Definition of table `tbl_shipping`
--

DROP TABLE IF EXISTS `tbl_shipping`;
CREATE TABLE `tbl_shipping` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `deliveryCorpName` varchar(255) NOT NULL,
  `deliveryFee` decimal(19,2) NOT NULL,
  `deliverySn` varchar(255) default NULL,
  `deliveryTypeName` varchar(255) NOT NULL,
  `memo` varchar(255) default NULL,
  `shipAddress` varchar(255) NOT NULL,
  `shipArea` varchar(255) NOT NULL,
  `shipAreaPath` varchar(255) default NULL,
  `shipMobile` varchar(255) default NULL,
  `shipName` varchar(255) NOT NULL,
  `shipPhone` varchar(255) default NULL,
  `shipZipCode` varchar(255) NOT NULL,
  `shippingSn` varchar(255) NOT NULL,
  `deliveryType_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `shippingSn` (`shippingSn`),
  KEY `FK7581892FEF5EC3B1` (`order_id`),
  KEY `FK7581892F2E128683` (`deliveryType_id`),
  CONSTRAINT `FK7581892F2E128683` FOREIGN KEY (`deliveryType_id`) REFERENCES `tbl_deliverytype` (`id`),
  CONSTRAINT `FK7581892FEF5EC3B1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_shipping`
--

/*!40000 ALTER TABLE `tbl_shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_shipping` ENABLE KEYS */;


--
-- Definition of table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `modifyDate` datetime default NULL,
  `accountNonExpired` bit(1) NOT NULL,
  `accountNonLocked` bit(1) NOT NULL,
  `credentialsNonExpired` bit(1) NOT NULL,
  `department` varchar(255) default NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `lockedDate` datetime default NULL,
  `loginDate` datetime default NULL,
  `loginFailureCount` int(11) NOT NULL,
  `loginIp` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_user`
--

/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;


--
-- Definition of table `tbl_user_role`
--

DROP TABLE IF EXISTS `tbl_user_role`;
CREATE TABLE `tbl_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`),
  KEY `FK8BC2D293EA5E663` (`role_id`),
  KEY `FK8BC2D29E3D0AA43` (`user_id`),
  CONSTRAINT `FK8BC2D293EA5E663` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`id`),
  CONSTRAINT `FK8BC2D29E3D0AA43` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tbl_user_role`
--

/*!40000 ALTER TABLE `tbl_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
