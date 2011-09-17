-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema huanshang
--

CREATE DATABASE IF NOT EXISTS huanshang;
USE huanshang;

--
-- Definition of table `t_announce`
--

DROP TABLE IF EXISTS `t_announce`;
CREATE TABLE `t_announce` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `comefrom` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL COMMENT '链接地址',
  `hits` int(11) NOT NULL,
  `postdate` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_announce`
--

/*!40000 ALTER TABLE `t_announce` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_announce` ENABLE KEYS */;


--
-- Definition of table `t_article`
--

DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `subject` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL,
  `username` varchar(50) NOT NULL,
  `comefrom` varchar(50) NOT NULL,
  `postdate` int(11) NOT NULL default '0',
  `yeard` char(4) NOT NULL default '0',
  `monthd` char(2) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  `ischecked` tinyint(4) NOT NULL default '1',
  `istop` tinyint(4) NOT NULL default '0',
  `ispic` tinyint(1) NOT NULL default '0',
  `isgood` tinyint(1) NOT NULL default '0',
  `link` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `content` mediumtext NOT NULL,
  `attachment` varchar(50) NOT NULL,
  `attachpath` varchar(50) NOT NULL,
  `attachthumb` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_article`
--

/*!40000 ALTER TABLE `t_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_article` ENABLE KEYS */;


--
-- Definition of table `t_category`
--

DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `module` tinyint(1) NOT NULL default '0',
  `parentid` smallint(6) unsigned NOT NULL default '0',
  `title` varchar(50) NOT NULL,
  `keywords` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `allowadd` varchar(50) NOT NULL default '0',
  `allowedit` varchar(50) NOT NULL default '0',
  `allowdel` varchar(50) NOT NULL default '0',
  `tnum` mediumint(8) unsigned NOT NULL default '0',
  `cnum` int(10) unsigned NOT NULL default '0',
  `displayorder` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_category`
--

/*!40000 ALTER TABLE `t_category` DISABLE KEYS */;
INSERT INTO `t_category` (`id`,`module`,`parentid`,`title`,`keywords`,`description`,`status`,`allowadd`,`allowedit`,`allowdel`,`tnum`,`cnum`,`displayorder`) VALUES 
 (1,1,0,'屏风办公桌','','',1,'','','',0,0,0),
 (2,2,1,'新闻','','',1,'','','',0,0,0),
 (3,1,0,'办公椅','','',1,'','','',0,0,0),
 (4,1,0,'大班台','','大班台',1,'','','',0,0,0),
 (5,1,0,'电脑台','电脑台','电脑台',1,'','','',0,0,0),
 (6,1,0,'文件柜','文件柜','文件柜',1,'3','3','3',0,0,0),
 (7,1,0,'高隔断','高隔断','高隔断',1,'3','3','3',0,0,0),
 (8,1,0,'折叠活动屏风','折叠活动屏风','折叠活动屏风',1,'3','3','3',0,0,0),
 (9,1,0,'洽谈桌台','洽谈桌台','洽谈桌台',1,'3','3','3',0,0,0),
 (10,1,0,'会议桌','会议桌','会议桌',1,'3','3','3',0,0,0),
 (11,1,0,'办公沙发','办公沙发','办公沙发',1,'3','3','3',0,0,0),
 (12,1,0,'足疗沙发','足疗沙发','足疗沙发',1,'3','3','3',0,0,0),
 (13,1,0,'按摩床','按摩床','按摩床',1,'3','3','3',0,0,0),
 (14,1,0,'西餐厅沙发','西餐厅沙发','西餐厅沙发',1,'3','3','3',0,0,0),
 (15,1,0,'快餐厅沙发','快餐厅沙发','快餐厅沙发',1,'3','3','3',0,0,0),
 (16,1,0,'KTV沙发','KTV沙发','KTV沙发',1,'3','3','3',0,0,0),
 (17,1,0,'酒店沙发','酒店沙发','酒店沙发',1,'3','3','3',0,0,0),
 (18,1,0,'快餐桌椅','快餐桌椅','快餐桌椅',1,'3','3','3',0,0,0),
 (19,1,0,'礼堂椅','礼堂椅','礼堂椅',1,'3','3','3',0,0,0),
 (20,1,0,'网吧沙发','网吧沙发','网吧沙发',1,'3','3','3',0,0,0);
/*!40000 ALTER TABLE `t_category` ENABLE KEYS */;


--
-- Definition of table `t_comment`
--

DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL auto_increment,
  `tid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `ip` char(15) NOT NULL,
  `content` text NOT NULL,
  `ischecked` tinyint(1) NOT NULL default '1',
  `postdate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_comment`
--

/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_comment` ENABLE KEYS */;


--
-- Definition of table `t_feedback`
--

DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(50) NOT NULL COMMENT '反馈类型：建议，投诉，表扬，问题，留言。。',
  `username` varchar(50) NOT NULL COMMENT '留言者',
  `sex` tinyint(4) NOT NULL COMMENT '是为男，否为女',
  `tel` varchar(50) NOT NULL COMMENT '电话',
  `fax` varchar(50) NOT NULL COMMENT '传真',
  `qq` varchar(50) NOT NULL COMMENT 'QQ',
  `email` varchar(50) NOT NULL COMMENT 'email',
  `web` varchar(50) NOT NULL COMMENT '个人主页',
  `address` varchar(50) NOT NULL,
  `content` text NOT NULL COMMENT '回复内容',
  `reply` text NOT NULL,
  `ischecked` smallint(1) NOT NULL default '0',
  `replydate` int(11) NOT NULL default '0',
  `postdate` int(11) NOT NULL COMMENT '留言时间',
  `ip` varchar(50) NOT NULL COMMENT '留言IP',
  `intro` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_feedback`
--

/*!40000 ALTER TABLE `t_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_feedback` ENABLE KEYS */;


--
-- Definition of table `t_job`
--

DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL COMMENT '工作名称或招聘对象',
  `nums` int(11) NOT NULL COMMENT '招聘人数',
  `address` varchar(150) NOT NULL COMMENT '工作地点',
  `tel` varchar(50) NOT NULL COMMENT '联系电话',
  `money` text NOT NULL COMMENT '工资待遇',
  `intro` text NOT NULL COMMENT '招聘要求',
  `ischecked` tinyint(1) NOT NULL default '1',
  `exdate` int(11) NOT NULL COMMENT '有效天数',
  `postdate` int(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_job`
--

/*!40000 ALTER TABLE `t_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_job` ENABLE KEYS */;


--
-- Definition of table `t_link`
--

DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link` (
  `id` int(11) NOT NULL auto_increment,
  `types` varchar(50) NOT NULL COMMENT '链接类型：首页，内页，论坛,文字',
  `title` varchar(50) NOT NULL COMMENT '网站名称',
  `url` varchar(100) NOT NULL COMMENT '地址',
  `logo` varchar(50) NOT NULL,
  `intro` text NOT NULL COMMENT '简介',
  `postdate` int(11) NOT NULL COMMENT '添加时间',
  `ischecked` tinyint(1) NOT NULL default '1' COMMENT '首页显示、内页显示等显示方式',
  `orders` smallint(6) NOT NULL COMMENT '排序数值，越小排得越前',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_link`
--

/*!40000 ALTER TABLE `t_link` DISABLE KEYS */;
INSERT INTO `t_link` (`id`,`types`,`title`,`url`,`logo`,`intro`,`postdate`,`ischecked`,`orders`) VALUES 
 (1,'1','百度','http://www.baidu.com','','',1231923597,1,0);
/*!40000 ALTER TABLE `t_link` ENABLE KEYS */;


--
-- Definition of table `t_member`
--

DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `question` varchar(50) NOT NULL COMMENT '问题',
  `answer` varchar(50) NOT NULL COMMENT '答案',
  `groupid` tinyint(2) NOT NULL default '0',
  `regtime` int(11) NOT NULL COMMENT '注册时间',
  `lastlogintime` int(11) NOT NULL COMMENT '最后登录时间',
  `logintimes` int(11) NOT NULL default '0' COMMENT '登录次数',
  `ischecked` tinyint(1) NOT NULL default '1' COMMENT '是否锁定',
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `sex` tinyint(4) NOT NULL COMMENT '性别真为男',
  `telphone` varchar(50) NOT NULL COMMENT '电话',
  `fax` varchar(50) NOT NULL COMMENT 'FAX',
  `email` varchar(50) NOT NULL COMMENT '电子邮件',
  `address` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_member`
--

/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;
INSERT INTO `t_member` (`id`,`username`,`password`,`question`,`answer`,`groupid`,`regtime`,`lastlogintime`,`logintimes`,`ischecked`,`realname`,`sex`,`telphone`,`fax`,`email`,`address`) VALUES 
 (1,'admin','cf79ae6addba60ad018347359bd144d2','','',1,1230768000,1230768000,0,1,'',1,'','','','');
/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;


--
-- Definition of table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL auto_increment,
  `pid` tinyint(50) NOT NULL default '0' COMMENT '订单号',
  `company` varchar(50) NOT NULL COMMENT '公司名称',
  `username` varchar(50) NOT NULL COMMENT '收货人',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `zip` varchar(50) NOT NULL COMMENT '邮编',
  `tel` varchar(50) NOT NULL COMMENT '电话',
  `fax` varchar(50) NOT NULL COMMENT '传真',
  `email` varchar(50) NOT NULL COMMENT '电子邮件',
  `intro` text NOT NULL COMMENT '备注',
  `ischecked` tinyint(1) NOT NULL default '0',
  `postdate` int(11) NOT NULL COMMENT '订货日期',
  `pcode` varchar(50) NOT NULL COMMENT '产品编号',
  `subject` varchar(50) NOT NULL COMMENT '产品名称',
  `spec` varchar(50) NOT NULL COMMENT '产品型号',
  `numb` int(11) NOT NULL default '0' COMMENT '订购数量',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_order`
--

/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;


--
-- Definition of table `t_pages`
--

DROP TABLE IF EXISTS `t_pages`;
CREATE TABLE `t_pages` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(100) NOT NULL,
  `seotitle` varchar(250) NOT NULL,
  `seokeywords` varchar(250) NOT NULL,
  `seodescription` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `content` text NOT NULL,
  `postdate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_pages`
--

/*!40000 ALTER TABLE `t_pages` DISABLE KEYS */;
INSERT INTO `t_pages` (`id`,`subject`,`seotitle`,`seokeywords`,`seodescription`,`message`,`content`,`postdate`) VALUES 
 (1,'公司简介','','','','\r\n','<p style=\"margin-right: 80px; \">&nbsp;广西桓尚家具有限公司（简称&ldquo;桓尚家具&rdquo;），位于广西省南宁市。是一家专业生产销售办公家具的厂家。主要产品有：办公家具、办公屏风、办公沙发等。公司目前旗下有员工380人，年产销1000万，公司一贯坚持&ldquo;质量第一，用户至上，优质服务，信守合同&rdquo;的宗旨，凭借着高质量的产品，良好的信誉，优质的服务，产品畅销全国近三十多个省、市、自治区以及远销美国、迪拜等国家。竭诚与国内外商家双赢合作，共同发展，共创辉煌！</p>\r\n<p>&nbsp;地址：南宁市江南区星光大道223号荣宝华商城A3栋211室....&nbsp;</p>\r\n<p>&nbsp;</p>',1231751203),
 (2,'企业文化','','','','','<p>企业文化</p>',1231751240),
 (3,'组织机构','','','','','<p>组织机构</p>',1231751249),
 (4,'成长历程','','','','','<p>成长历程</p>',1231751258),
 (5,'荣誉证书','','','','','<p>荣誉证书</p>',1231751268);
/*!40000 ALTER TABLE `t_pages` ENABLE KEYS */;


--
-- Definition of table `t_product`
--

DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '1' COMMENT '用户ID',
  `cid` int(11) NOT NULL COMMENT '分类ID',
  `subject` varchar(50) NOT NULL COMMENT '产品名称',
  `color` varchar(7) NOT NULL,
  `spec` varchar(50) NOT NULL COMMENT '产品型号|规格',
  `size` varchar(50) NOT NULL COMMENT '产品尺寸',
  `keywords` varchar(50) NOT NULL COMMENT '关键字',
  `content` text NOT NULL COMMENT '产品说明',
  `meno` text NOT NULL,
  `attachpath` varchar(6) NOT NULL,
  `attachment` varchar(50) NOT NULL COMMENT '产品图片',
  `attachthumb` varchar(50) NOT NULL,
  `ischecked` tinyint(1) NOT NULL default '1' COMMENT '是否审核',
  `istop` tinyint(1) NOT NULL default '0' COMMENT '是否推荐',
  `isgood` tinyint(1) NOT NULL default '0',
  `hits` int(11) NOT NULL COMMENT '点击次数',
  `postdate` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_product`
--

/*!40000 ALTER TABLE `t_product` DISABLE KEYS */;
INSERT INTO `t_product` (`id`,`userid`,`cid`,`subject`,`color`,`spec`,`size`,`keywords`,`content`,`meno`,`attachpath`,`attachment`,`attachthumb`,`ischecked`,`istop`,`isgood`,`hits`,`postdate`) VALUES 
 (1,1,3,'桓尚家具经营供应办公家具培训桌','#4169E1','','','','<p>&nbsp;<span class=\"Apple-style-span\" style=\"font-family: arial; font-size: 14px; line-height: 22px; \">桓尚家具经营供应办公家具培训桌，办公家具培训桌价格，办公家具培训桌报价质量保证产品材质说明：常用颜色有灰白色、榉木纹、米</span></p>','','201109','4e6ef516985e6.jpg','4e6ef516985e6_thumb.jpg',1,0,0,14,1315894550);
/*!40000 ALTER TABLE `t_product` ENABLE KEYS */;


--
-- Definition of table `t_resume`
--

DROP TABLE IF EXISTS `t_resume`;
CREATE TABLE `t_resume` (
  `id` int(11) NOT NULL auto_increment,
  `jid` int(11) NOT NULL COMMENT '招聘信息ID',
  `username` varchar(50) NOT NULL COMMENT '姓名',
  `sex` varchar(50) NOT NULL COMMENT '性别',
  `age` varchar(50) NOT NULL COMMENT '出生日期',
  `marry` varchar(50) NOT NULL COMMENT '婚否',
  `school` varchar(50) NOT NULL COMMENT '学校',
  `degree` varchar(50) NOT NULL COMMENT '学历',
  `zhuanye` varchar(50) NOT NULL COMMENT '专业',
  `gradyear` varchar(50) NOT NULL COMMENT '毕业时间',
  `tel` varchar(50) NOT NULL COMMENT '电话',
  `email` varchar(50) NOT NULL COMMENT 'EMAIL',
  `address` varchar(50) NOT NULL COMMENT '联系地址',
  `rusumes` text NOT NULL,
  `postdate` int(11) NOT NULL COMMENT '应聘时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_resume`
--

/*!40000 ALTER TABLE `t_resume` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_resume` ENABLE KEYS */;


--
-- Definition of table `t_scroll`
--

DROP TABLE IF EXISTS `t_scroll`;
CREATE TABLE `t_scroll` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(50) NOT NULL COMMENT '网站名称',
  `url` varchar(100) NOT NULL COMMENT '地址',
  `attachment` varchar(50) NOT NULL,
  `content` text NOT NULL COMMENT '简介',
  `postdate` int(11) NOT NULL COMMENT '添加时间',
  `orders` smallint(6) NOT NULL COMMENT '排序数值，越小排得越前',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_scroll`
--

/*!40000 ALTER TABLE `t_scroll` DISABLE KEYS */;
INSERT INTO `t_scroll` (`id`,`subject`,`url`,`attachment`,`content`,`postdate`,`orders`) VALUES 
 (1,'桓尚家具阿里巴巴','http://gxfans.cn.alibaba.com/','4e6ff3e23215f.jpg','桓尚家具阿里巴巴',1231923826,0),
 (2,'桓尚家具慧聪网','http://490000143.b2b.hc360.com/','4e6ff3b220c3c.jpg','桓尚家具慧聪网',1231923863,0),
 (3,'桓尚淘宝店铺','http://shop66810626.taobao.com/','4e6ff36e59fe6.jpg','桓尚淘宝店铺',1231932490,0);
/*!40000 ALTER TABLE `t_scroll` ENABLE KEYS */;


--
-- Definition of table `t_settings`
--

DROP TABLE IF EXISTS `t_settings`;
CREATE TABLE `t_settings` (
  `title` varchar(20) NOT NULL default '',
  `values` text NOT NULL,
  PRIMARY KEY  (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_settings`
--

/*!40000 ALTER TABLE `t_settings` DISABLE KEYS */;
INSERT INTO `t_settings` (`title`,`values`) VALUES 
 ('sitename','广西桓尚家具'),
 ('siteurl','http://localhost'),
 ('stopd','系统维护中.....'),
 ('status','1'),
 ('db_fields_cache','false'),
 ('email','m23linzhe@gmail.com'),
 ('address','南宁市江南区星光大道223号荣宝华商城A3栋211室'),
 ('telephone','0771-4868986'),
 ('fax','0771-4868986'),
 ('default_module','Index'),
 ('debug_mode','false'),
 ('attachdir','Attachments'),
 ('attachsize','2097192'),
 ('attachext','jpg,gif,png'),
 ('thumbmaxwidth','300'),
 ('thumbmaxheight','200'),
 ('thumbsuffix','_thumb'),
 ('tmpl_cache_time','-1'),
 ('sql_debug_log','false'),
 ('web_log_record','false'),
 ('seotitle','广西桓尚家具'),
 ('seokeywords','广西桓尚家具'),
 ('seodescription','广西桓尚家具网站系统'),
 ('sysversion','1.1'),
 ('attach','true'),
 ('company','广西桓尚家具有限公司'),
 ('think_html_token',''),
 ('linkman','联系人'),
 ('router_on','true'),
 ('html_url_suffix','.html'),
 ('data_cache_type','File'),
 ('data_cache_subdir','false'),
 ('sdata_time','60');
/*!40000 ALTER TABLE `t_settings` ENABLE KEYS */;


--
-- Definition of table `t_usergroup`
--

DROP TABLE IF EXISTS `t_usergroup`;
CREATE TABLE `t_usergroup` (
  `id` tinyint(1) NOT NULL auto_increment,
  `grouptitle` varchar(20) NOT NULL,
  `allowsystem` tinyint(1) NOT NULL default '0',
  `allowlink` tinyint(1) NOT NULL default '0',
  `allowdatabase` tinyint(1) NOT NULL default '0',
  `allowpages` tinyint(1) NOT NULL default '0',
  `allowarticle` tinyint(1) NOT NULL default '0',
  `allowproduct` tinyint(1) NOT NULL default '0',
  `allowcategory` tinyint(1) NOT NULL default '0',
  `allowjob` tinyint(1) NOT NULL default '0',
  `allowfeedback` tinyint(1) NOT NULL default '0',
  `allowannounce` tinyint(1) NOT NULL default '0',
  `allowmember` tinyint(1) NOT NULL default '0',
  `allowgroup` tinyint(1) NOT NULL default '0',
  `allowscroll` tinyint(1) NOT NULL default '0',
  `allowbat` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_usergroup`
--

/*!40000 ALTER TABLE `t_usergroup` DISABLE KEYS */;
INSERT INTO `t_usergroup` (`id`,`grouptitle`,`allowsystem`,`allowlink`,`allowdatabase`,`allowpages`,`allowarticle`,`allowproduct`,`allowcategory`,`allowjob`,`allowfeedback`,`allowannounce`,`allowmember`,`allowgroup`,`allowscroll`,`allowbat`) VALUES 
 (1,'超级管理',1,1,1,1,1,1,1,1,1,1,1,1,1,1),
 (2,'禁止访问',0,0,0,0,0,0,0,0,0,0,0,0,0,0),
 (3,'普通管理',1,1,1,1,1,1,0,1,1,1,1,1,1,0);
/*!40000 ALTER TABLE `t_usergroup` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
