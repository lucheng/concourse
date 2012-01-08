-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 01 月 08 日 11:55
-- 服务器版本: 5.5.8
-- PHP 版本: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `chinaihe`
--
DROP DATABASE `chinaihe`;
CREATE DATABASE `chinaihe` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `chinaihe`;

-- --------------------------------------------------------

--
-- 表的结构 `t_announce`
--

DROP TABLE IF EXISTS `t_announce`;
CREATE TABLE IF NOT EXISTS `t_announce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `comefrom` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL COMMENT '链接地址',
  `hits` int(11) NOT NULL,
  `postdate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `t_announce`
--


-- --------------------------------------------------------

--
-- 表的结构 `t_article`
--

DROP TABLE IF EXISTS `t_article`;
CREATE TABLE IF NOT EXISTS `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL,
  `username` varchar(50) NOT NULL,
  `comefrom` varchar(50) NOT NULL,
  `postdate` int(11) NOT NULL DEFAULT '0',
  `yeard` char(4) NOT NULL DEFAULT '0',
  `monthd` char(2) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0',
  `ischecked` tinyint(4) NOT NULL DEFAULT '1',
  `istop` tinyint(4) NOT NULL DEFAULT '0',
  `ispic` tinyint(1) NOT NULL DEFAULT '0',
  `isgood` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `content` mediumtext NOT NULL,
  `attachment` varchar(50) NOT NULL,
  `attachpath` varchar(50) NOT NULL,
  `attachthumb` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `t_article`
--

INSERT INTO `t_article` (`id`, `uid`, `subject`, `color`, `username`, `comefrom`, `postdate`, `yeard`, `monthd`, `hits`, `cid`, `ischecked`, `istop`, `ispic`, `isgood`, `link`, `message`, `content`, `attachment`, `attachpath`, `attachthumb`) VALUES
(1, 1, '【凡客诚品 全场95折】【V+代理下单】', '', 'admin', '', 1317614375, '0', '0', 3, 1, 1, 0, 0, 0, '', '【凡客诚品 全场95折】【V+代理下单】', '<p>&nbsp;【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】【凡客诚品 全场95折】【V+代理下单】</p>', '', '', ''),
(2, 1, 'sda', '', 'admin', '', 1318487296, '0', '0', 0, 21, 1, 0, 0, 0, '', 'sasa', '<p>&nbsp;<img width="2337" height="1700" alt="" src="/huanshang/Attachments/201110/20111013_062738_137.jpg" /></p>', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `t_category`
--

DROP TABLE IF EXISTS `t_category`;
CREATE TABLE IF NOT EXISTS `t_category` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `module` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowadd` varchar(50) NOT NULL DEFAULT '0',
  `allowedit` varchar(50) NOT NULL DEFAULT '0',
  `allowdel` varchar(50) NOT NULL DEFAULT '0',
  `tnum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cnum` int(10) unsigned NOT NULL DEFAULT '0',
  `displayorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `t_category`
--

INSERT INTO `t_category` (`id`, `module`, `parent_id`, `title`, `keywords`, `description`, `status`, `allowadd`, `allowedit`, `allowdel`, `tnum`, `cnum`, `displayorder`) VALUES
(1, 2, 0, '热点新闻', '', '', 1, '', '', '', 0, 0, 0),
(2, 2, 0, '桓尚新闻', '', '', 1, '', '', '', 0, 0, 0),
(4, 1, 0, '大班台', '', '大班台', 1, '', '', '', 0, 0, 0),
(8, 1, 20, '折叠活动屏风', '折叠活动屏风', '折叠活动屏风', 1, '3', '3', '3', 0, 0, 10),
(15, 1, 0, '快餐厅沙发', '快餐厅沙发', '快餐厅沙发', 1, '3', '3', '3', 0, 0, 0),
(16, 1, 0, 'KTV沙发', 'KTV沙发', 'KTV沙发', 1, '3', '3', '3', 0, 0, 0),
(17, 1, 0, '酒店沙发', '酒店沙发', '酒店沙发', 1, '3', '3', '3', 0, 0, 0),
(18, 1, 0, '快餐桌椅', '快餐桌椅', '快餐桌椅', 1, '3', '3', '3', 0, 0, 0),
(19, 1, 0, '礼堂椅', '礼堂椅', '礼堂椅', 1, '3', '3', '3', 0, 0, 0),
(20, 1, 0, '网吧沙发', '网吧沙发', '网吧沙发', 1, '3', '3', '3', 0, 0, 0),
(21, 2, 4, '北邮', '北邮', '北邮', 1, '3', '3', '3', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_comment`
--

DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE IF NOT EXISTS `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `ip` char(15) NOT NULL,
  `content` text NOT NULL,
  `ischecked` tinyint(1) NOT NULL DEFAULT '1',
  `postdate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `t_comment`
--


-- --------------------------------------------------------

--
-- 表的结构 `t_feedback`
--

DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE IF NOT EXISTS `t_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `ischecked` smallint(1) NOT NULL DEFAULT '0',
  `replydate` int(11) NOT NULL DEFAULT '0',
  `postdate` int(11) NOT NULL COMMENT '留言时间',
  `ip` varchar(50) NOT NULL COMMENT '留言IP',
  `intro` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `t_feedback`
--


-- --------------------------------------------------------

--
-- 表的结构 `t_link`
--

DROP TABLE IF EXISTS `t_link`;
CREATE TABLE IF NOT EXISTS `t_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(50) NOT NULL DEFAULT '1' COMMENT '链接类型：首页，内页，论坛,文字',
  `title` varchar(50) NOT NULL COMMENT '网站名称',
  `url` varchar(100) NOT NULL COMMENT '地址',
  `logo` varchar(50) NOT NULL,
  `intro` text NOT NULL COMMENT '简介',
  `postdate` int(11) NOT NULL COMMENT '添加时间',
  `ischecked` tinyint(1) NOT NULL DEFAULT '1' COMMENT '首页显示、内页显示等显示方式',
  `orders` smallint(6) NOT NULL COMMENT '排序数值，越小排得越前',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `t_link`
--

INSERT INTO `t_link` (`id`, `types`, `title`, `url`, `logo`, `intro`, `postdate`, `ischecked`, `orders`, `status`) VALUES
(1, '1', '百度', 'http://www.baidu.com', '', '百度', 1231923597, 1, 0, 1),
(2, '2', 'Google', 'http://www.google.com', '', 'Google', 1317787421, 1, 0, 1),
(3, '2', '经理1', '490000143', '', '', 1317787752, 1, 0, 1),
(6, '1', '北邮', 'http://www.bupt.edu.cn', '', '北京邮电大学', 1323784394, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_member`
--

DROP TABLE IF EXISTS `t_member`;
CREATE TABLE IF NOT EXISTS `t_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `question` varchar(50) NOT NULL COMMENT '问题',
  `answer` varchar(50) NOT NULL COMMENT '答案',
  `groupid` tinyint(2) NOT NULL DEFAULT '0',
  `regtime` int(11) NOT NULL COMMENT '注册时间',
  `lastlogintime` int(11) NOT NULL COMMENT '最后登录时间',
  `logintimes` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `ischecked` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否锁定',
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `sex` tinyint(4) NOT NULL COMMENT '性别真为男',
  `telphone` varchar(50) NOT NULL COMMENT '电话',
  `fax` varchar(50) NOT NULL COMMENT 'FAX',
  `email` varchar(50) NOT NULL COMMENT '电子邮件',
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `t_member`
--

INSERT INTO `t_member` (`id`, `username`, `password`, `question`, `answer`, `groupid`, `regtime`, `lastlogintime`, `logintimes`, `ischecked`, `realname`, `sex`, `telphone`, `fax`, `email`, `address`) VALUES
(1, 'admin', 'cf79ae6addba60ad018347359bd144d2', '', '', 1, 1230768000, 1230768000, 0, 1, '', 1, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `t_pages`
--

DROP TABLE IF EXISTS `t_pages`;
CREATE TABLE IF NOT EXISTS `t_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `seokeywords` varchar(250) NOT NULL,
  `seodescription` varchar(250) NOT NULL,
  `english` text NOT NULL,
  `chinese` text NOT NULL,
  `orders` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `t_pages`
--

INSERT INTO `t_pages` (`id`, `title`, `seokeywords`, `seodescription`, `english`, `chinese`, `orders`) VALUES
(1, '前沿观点', '', '', '', '', 0),
(11, '企业文化', '', '', '', '<p><span class="Apple-style-span" style="color: rgb(32, 32, 32); font-family: Simsun; line-height: 24px; ">\r\n<p><strong>设计理念：&nbsp;&nbsp;</strong></p>\r\n<p>&nbsp;&nbsp;<strong>&nbsp;创意空间 铺垫未来</strong></p>\r\n<p>我们让家具与科技相结合，注重低碳、时尚、人性，让未来之路充满希望。</p>\r\n<p>我们的家具设计，是赋予人性的关怀，让工作与生活温暖相伴。</p>\r\n<p>公司不仅制造家具，更关怀每一个你，和我们人类共同的生存坏境。</p>\r\n<p>我们洞察你的需要，前瞻你的未来，将你的梦想融入家具蓝图。</p>\r\n<p>是的，我们放怀于创想与创造，创造更高效的科技，每一个梦想的抵达，和始终同行的您！</p>\r\n<p><strong>&nbsp;&nbsp; 人才理念：</strong></p>\r\n<p><strong>&nbsp;&nbsp; 尊重人才 共赢发展</strong></p>\r\n<p>公司最注重的不是&ldquo;资本&rdquo;而是&ldquo;知本&rdquo;</p>\r\n<p>我们集结着各个领域的专业人才，有思想有创意并能及时的把握国际潮流设计大师；思想稳健、专业过感触的高素质的管理人才；经验丰富，计技术专才的设计师以为无数在家具领域积淀多年的能工巧匠！</p>\r\n<p>我们坚持以人为本、每一位员工提供适合其发展的舞台、并使其创造力都得到最佳的发挥。</p>\r\n<p><strong>&nbsp; &nbsp;服务理念：</strong></p>\r\n<p><strong>&nbsp;&nbsp;</strong>&nbsp;<strong>用心服务 至于完美</strong></p>\r\n<p>我们竭诚服务于每一位客人，源源不断地向顾客提供优质的产品和服务，我们孜孜不倦的追求和方向。</p>\r\n<p>客户的满意就是我们的工作标准，专程为您，我们无怨无悔。</p>\r\n<p>从售前设计的量身定制到售后服务的无微关切，我们让每一位都能至于完美。</p>\r\n</span></p>', 1231751240),
(2, '组织机构', '', '', '', '<p>&nbsp;<img src="http://localhost/chinaihe/Public/Upload/20111231195627_87958.jpg" alt="" border="0" /></p>', 1231751249),
(4, '企业荣誉', '', '', '', '<p>荣誉证书</p>', 1231751268),
(12, '服务保障', '', '', '', '<p><span class="Apple-style-span" style="color: rgb(32, 32, 32); font-family: Simsun; line-height: 24px; ">\r\n<p>为保障消费者利益，凡在旺派订购指定套餐产品成功的用户，可以享受以下承诺：</p>\r\n<p>1、免费上门量房服务；</p>\r\n<p>2、免费设计服务；</p>\r\n<p>3、产品颜色、型号与合同约定不符的，予以免费更换；</p>\r\n<p>4、产品与合同约定的产品尺寸不符时，予以免费修改；</p>\r\n<p>5、产品部件与合同约定的有明显色差或质量问题，予以免费重新生产；</p>\r\n<p>6、&ldquo;先行赔付&rdquo;保障；</p>\r\n<p>7、凡旺派购买的商品五年保修保质；</p>\r\n<p>8、投诉专人负责制，&ldquo;一站式&rdquo;为您服务。</p>\r\n<p>9、产品保修</p>\r\n<p>自交货之日起壹年之后，叁年之内，如产品在正常使用情况下，非人为因素产生的质量问题，消费者将享受免人工维修费（仅收取材料费）的服务。</p>\r\n</span></p>', 1317986736),
(13, '品牌站点', '', '', '', '<p>&nbsp;品牌站点</p>', 1317986754),
(9, '订购流程', '', '', '', '<p>&nbsp;订购流程</p>', 1317986794),
(10, '代理加盟', '', '', '', '<p>&nbsp;代理加盟</p>', 1317986808),
(5, '公益事业', '', '', '', '<p>&nbsp;公益事业</p>', 1317986874);

-- --------------------------------------------------------

--
-- 表的结构 `t_scroll`
--

DROP TABLE IF EXISTS `t_scroll`;
CREATE TABLE IF NOT EXISTS `t_scroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) NOT NULL COMMENT '网站名称',
  `url` varchar(100) NOT NULL COMMENT '地址',
  `attachment` varchar(50) NOT NULL,
  `content` text NOT NULL COMMENT '简介',
  `postdate` int(11) NOT NULL COMMENT '添加时间',
  `orders` smallint(6) NOT NULL COMMENT '排序数值，越小排得越前',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `t_scroll`
--

INSERT INTO `t_scroll` (`id`, `subject`, `url`, `attachment`, `content`, `postdate`, `orders`) VALUES
(1, '桓尚家具阿里巴巴', 'http://gxfans.cn.alibaba.com/', '4e6ff3e23215f.jpg', '桓尚家具阿里巴巴', 1231923826, 0),
(2, '桓尚家具慧聪网', 'http://490000143.b2b.hc360.com/', '4e6ff3b220c3c.jpg', '桓尚家具慧聪网', 1231923863, 0),
(3, '桓尚淘宝店铺', 'http://shop66810626.taobao.com/', '4e6ff36e59fe6.jpg', '桓尚淘宝店铺', 1231932490, 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_settings`
--

DROP TABLE IF EXISTS `t_settings`;
CREATE TABLE IF NOT EXISTS `t_settings` (
  `title` varchar(20) NOT NULL DEFAULT '',
  `values` text NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_settings`
--

INSERT INTO `t_settings` (`title`, `values`) VALUES
('sitename', '中国名牌研究网'),
('siteurl', 'http://localhost/chinaihe'),
('stopd', '系统维护中.....'),
('status', '1'),
('db_fields_cache', 'false'),
('email', 'XXX@mail.com'),
('address', '北京大学'),
('telephone', '010-64868986'),
('fax', '010-64868986'),
('default_module', 'Index'),
('debug_mode', 'false'),
('attachdir', 'Attachments'),
('attachsize', '2097192'),
('attachext', 'jpg,gif,png'),
('thumbmaxwidth', '237'),
('thumbmaxheight', '170'),
('thumbsuffix', '_thumb'),
('tmpl_cache_time', '-1'),
('sql_debug_log', 'false'),
('web_log_record', 'false'),
('seotitle', '中国名牌研究网,chinaihe.net'),
('seokeywords', '中国名牌研究网,chinaihe.net,北京大学'),
('seodescription', '中国名牌研究网网站系统'),
('sysversion', '1.1'),
('attach', 'true'),
('company', '中国名牌研究网'),
('think_html_token', ''),
('linkman', '王老师'),
('router_on', 'true'),
('html_url_suffix', '.html'),
('data_cache_type', 'File'),
('data_cache_subdir', 'false'),
('sdata_time', '60'),
('copyright', 'chinaihe.net'),
('beian', '京ICP10000号'),
('userid', ''),
('__hash__', 'c8a5cd5df339e31a0680628834fbdf60');

-- --------------------------------------------------------

--
-- 表的结构 `t_usergroup`
--

DROP TABLE IF EXISTS `t_usergroup`;
CREATE TABLE IF NOT EXISTS `t_usergroup` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `grouptitle` varchar(20) NOT NULL,
  `allowsystem` tinyint(1) NOT NULL DEFAULT '0',
  `allowlink` tinyint(1) NOT NULL DEFAULT '0',
  `allowdatabase` tinyint(1) NOT NULL DEFAULT '0',
  `allowpages` tinyint(1) NOT NULL DEFAULT '0',
  `allowarticle` tinyint(1) NOT NULL DEFAULT '0',
  `allowproduct` tinyint(1) NOT NULL DEFAULT '0',
  `allowcategory` tinyint(1) NOT NULL DEFAULT '0',
  `allowjob` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeedback` tinyint(1) NOT NULL DEFAULT '0',
  `allowannounce` tinyint(1) NOT NULL DEFAULT '0',
  `allowmember` tinyint(1) NOT NULL DEFAULT '0',
  `allowgroup` tinyint(1) NOT NULL DEFAULT '0',
  `allowscroll` tinyint(1) NOT NULL DEFAULT '0',
  `allowbat` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `t_usergroup`
--

INSERT INTO `t_usergroup` (`id`, `grouptitle`, `allowsystem`, `allowlink`, `allowdatabase`, `allowpages`, `allowarticle`, `allowproduct`, `allowcategory`, `allowjob`, `allowfeedback`, `allowannounce`, `allowmember`, `allowgroup`, `allowscroll`, `allowbat`) VALUES
(1, '超级管理', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, '禁止访问', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '普通管理', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0);
