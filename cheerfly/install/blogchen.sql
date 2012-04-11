-- phpMyAdmin SQL Dump
-- version 3.4.8
-- http://www.phpmyadmin.net
--
-- 主机: 61.139.126.88
-- 生成日期: 2012 年 04 月 08 日 14:16
-- 服务器版本: 5.1.58
-- PHP 版本: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `blogchen`
--

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_admin`
--

CREATE TABLE IF NOT EXISTS `fanwe_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(60) NOT NULL,
  `admin_pwd` char(32) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` mediumint(8) unsigned DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `role_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_user` (`admin_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_admin`
--

INSERT INTO `fanwe_admin` (`id`, `admin_name`, `admin_pwd`, `last_login_time`, `last_login_ip`, `login_count`, `create_time`, `update_time`, `status`, `role_id`) VALUES
(1, 'admin', '7fef6171469e80d32c0559f88b377245', 1333834094, '59.64.255.241', 53, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_admin_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_module` varchar(60) NOT NULL DEFAULT '',
  `log_action` varchar(60) NOT NULL DEFAULT '',
  `data_id` int(11) NOT NULL COMMENT '操作的相关数据主键',
  `log_time` int(11) NOT NULL,
  `admin_id` mediumint(8) NOT NULL DEFAULT '0',
  `ip` varchar(60) NOT NULL DEFAULT '',
  `log_result` tinyint(1) NOT NULL COMMENT '0:失败 1:成功',
  `log_msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `fanwe_admin_log`
--

INSERT INTO `fanwe_admin_log` (`id`, `log_module`, `log_action`, `data_id`, `log_time`, `admin_id`, `ip`, `log_result`, `log_msg`) VALUES
(1, 'SysConf', 'update', 0, 1332012119, 1, '127.0.0.1', 1, ''),
(2, 'SysConf', 'update', 0, 1332017170, 1, '127.0.0.1', 1, ''),
(3, 'SysConf', 'update', 0, 1332048224, 1, '123.124.21.94', 1, ''),
(4, 'SysConf', 'update', 0, 1332048523, 1, '123.124.21.94', 1, ''),
(5, 'SysConf', 'update', 0, 1332115480, 1, '1.202.148.194', 1, ''),
(6, 'SysConf', 'update', 0, 1332194973, 1, '1.202.148.194', 1, ''),
(7, 'SysConf', 'update', 0, 1332367228, 1, '1.202.148.194', 1, ''),
(8, 'SysConf', 'update', 0, 1332382501, 1, '59.64.255.241', 1, ''),
(9, 'SysConf', 'update', 0, 1332962285, 1, '59.64.167.62', 1, ''),
(10, 'SysConf', 'update', 0, 1332965737, 1, '59.64.167.62', 1, ''),
(11, 'SysConf', 'update', 0, 1333565893, 1, '59.64.167.62', 1, ''),
(12, 'SysConf', 'update', 0, 1333565902, 1, '59.64.167.62', 1, ''),
(13, 'SysConf', 'update', 0, 1333691382, 1, '127.0.0.1', 1, ''),
(14, 'SysConf', 'update', 0, 1333746278, 1, '59.64.255.241', 1, ''),
(15, 'SysConf', 'update', 0, 1333785044, 1, '59.64.255.241', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_adv`
--

CREATE TABLE IF NOT EXISTS `fanwe_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` mediumint(8) NOT NULL,
  `name` varchar(20) NOT NULL,
  `code` text NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1: 图片 2:flash 3:文字 4:外部调用',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `target_key` varchar(60) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '10',
  `small` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `position_id` (`position_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `fanwe_adv`
--

INSERT INTO `fanwe_adv` (`id`, `position_id`, `name`, `code`, `type`, `status`, `url`, `desc`, `target_key`, `sort`, `small`) VALUES
(1, 1, '头部广告', './public/upload/adv/201112/20/4ef04005a01f5.jpg', 1, 1, 'http://www.cheerfly.com', '', '', 100, ''),
(2, 2, '敏敏', './public/upload/adv/201112/20/4ef049a01bcd9.jpg', 1, 1, 'http://www.cheerfly.com', '做简单系的女生', '', 100, './public/upload/adv/201112/20/4ef04b090f189.jpg'),
(3, 2, '圣诞狂享乐', './public/upload/adv/201112/20/4ef0508170a06.jpg', 1, 1, 'http://www.cheerfly.com', '趣购街圣诞送好礼', '', 100, './public/upload/adv/201112/20/4ef050816fdb2.jpg'),
(4, 3, '上衣分类广告', './public/upload/adv/201112/10/4ee306f901380.jpg', 1, 1, 'http://www.cheerfly.com', '', 'coats', 100, ''),
(5, 3, '下装广告', './public/upload/adv/201112/10/4ee30ef2eb5f5.jpg', 1, 1, 'http://www.cheerfly.com', '', 'pants', 100, ''),
(6, 3, '鞋子', './public/upload/adv/201112/15/4ee9f16713e1d.jpg', 1, 1, 'http://www.cheerfly.com/book.php?action=cate&cate=shoes', '', 'shoes', 100, ''),
(7, 2, '广告轮播3', './public/upload/adv/201112/16/4eeb58dd196da.png', 1, 1, 'http://www.cheerfly.com', '轮播广告3说明', '', 100, './public/upload/adv/201112/16/4eeb590118e19.jpg'),
(8, 2, '洋洋得意', './public/upload/adv/201112/20/4ef04c8e9f488.jpg', 1, 1, 'http://www.cheerfly.com', '淑女的你还不心动吗？', '', 99, './public/upload/adv/201112/20/4ef04c54a34d1.jpg'),
(9, 4, '会员信息底部广告1', '', 1, 1, 'http://www.cheerfly.com', '广告1', '', 100, './public/upload/adv/201112/16/4eeb5a5bbbe79.jpg'),
(10, 4, '会员信息底部广告2', '', 1, 1, 'http://www.cheerfly.com', '广告2', '', 100, ''),
(11, 4, '会员信息底部广告3', '', 1, 1, 'http://www.cheerfly.com', '广告3', '', 100, ''),
(12, 4, '会员信息底部广告4', '', 1, 1, 'http://www.cheerfly.com', '广告4', '', 100, ''),
(13, 4, '会员信息底部广告5', '', 1, 1, 'http://www.cheerfly.com', '广告5', '', 100, './public/upload/adv/201112/16/4eeb5abf8670f.jpg'),
(14, 4, '会员信息底部广告6', '', 1, 1, 'http://www.cheerfly.com', '会员信息底部广告6', '', 100, './public/upload/adv/201112/16/4eeb5ab515624.jpg'),
(15, 3, '包包广告', './public/upload/adv/201203/27/4f71a4d0d5ebe.jpg', 1, 1, 'http://www.cheerfly.com/book.php?action=cate&cate=bags', '', 'bags', 100, ''),
(16, 3, '配饰广告', './public/upload/adv/201203/27/4f71a57df0049.jpg', 1, 1, 'http://www.cheerfly.com/book.php?action=cate&cate=accessories', '', 'accessories', 100, '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_adv_layout`
--

CREATE TABLE IF NOT EXISTS `fanwe_adv_layout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(255) DEFAULT NULL,
  `layout_id` varchar(255) DEFAULT NULL,
  `tmpl` varchar(255) DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL,
  `item_limit` int(11) DEFAULT NULL,
  `target_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`page`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_adv_layout`
--

INSERT INTO `fanwe_adv_layout` (`id`, `page`, `layout_id`, `tmpl`, `rec_id`, `item_limit`, `target_id`) VALUES
(1, '/inc/header', '头部广告位', 'pink2', 1, 0, ''),
(2, '/page/index_index', '首页轮播广告位', 'pink2', 2, 0, ''),
(3, '/inc/index/index_cate_share', '分类右侧大图广告185X330', 'pink2', 3, 1, ''),
(4, '/page/index_index', '首页右侧用户信息底部广告位', 'pink2', 4, 6, '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_adv_position`
--

CREATE TABLE IF NOT EXISTS `fanwe_adv_position` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_flash` tinyint(1) NOT NULL DEFAULT '0',
  `flash_style` varchar(60) NOT NULL,
  `style` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_adv_position`
--

INSERT INTO `fanwe_adv_position` (`id`, `name`, `width`, `height`, `is_flash`, `flash_style`, `style`, `status`) VALUES
(1, '头部广告', 960, 86, 0, '', '<div class="blank15"></div>\r\n<table cellpadding="0" cellspacing="0">\r\n{loop $adv_list $adv}\r\n<tr><td>{$adv[html]}</td></tr>\r\n{/loop}\r\n</table>', 1),
(2, '首页轮播', 443, 283, 0, '', '<table cellpadding="0" cellspacing="0">\r\n{loop $adv_list $adv}\r\n<tr><td>{$adv[html]}</td></tr>\r\n{/loop}\r\n</table>', 1),
(3, '分类广告位', 185, 330, 0, '', '<table cellpadding="0" cellspacing="0">\r\n{loop $adv_list $adv}\r\n<tr><td>{$adv[html]}</td></tr>\r\n{/loop}\r\n</table>', 1),
(4, '会员信息底部广告', 0, 0, 0, '', '<table cellpadding="0" cellspacing="0">\r\n{loop $adv_list $adv}\r\n<tr><td>{$adv[html]}</td></tr>\r\n{/loop}\r\n</table>', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_album`
--

CREATE TABLE IF NOT EXISTS `fanwe_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` smallint(6) NOT NULL DEFAULT '0',
  `share_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `show_type` tinyint(1) NOT NULL DEFAULT '0',
  `tags` text,
  `content` text,
  `photo_count` int(11) NOT NULL DEFAULT '0',
  `goods_count` int(11) NOT NULL DEFAULT '0',
  `img_count` int(11) NOT NULL DEFAULT '0',
  `best_count` int(11) NOT NULL DEFAULT '0',
  `collect_count` int(11) NOT NULL DEFAULT '0',
  `share_count` int(11) NOT NULL DEFAULT '0',
  `create_day` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `cache_data` text,
  `is_index` tinyint(1) DEFAULT '0',
  `is_flash` tinyint(1) NOT NULL DEFAULT '0',
  `is_best` tinyint(1) NOT NULL DEFAULT '0',
  `flash_img` varchar(255) NOT NULL DEFAULT '',
  `best_img` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(5) NOT NULL DEFAULT '100',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `share_id` (`share_id`),
  KEY `is_index` (`is_index`),
  KEY `is_best` (`is_best`),
  KEY `is_flash` (`is_flash`),
  KEY `img_count` (`img_count`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_album`
--

INSERT INTO `fanwe_album` (`id`, `cid`, `share_id`, `uid`, `title`, `show_type`, `tags`, `content`, `photo_count`, `goods_count`, `img_count`, `best_count`, `collect_count`, `share_count`, `create_day`, `create_time`, `cache_data`, `is_index`, `is_flash`, `is_best`, `flash_img`, `best_img`, `sort`, `status`) VALUES
(1, 1, 13, 1, '美丽而不失优雅', 3, '时尚 购物 搭配秀', '', 13, 0, 13, 0, 1, 13, 1332316800, 1332382741, 'a:1:{s:4:"imgs";a:6:{i:0;a:10:{s:8:"share_id";s:2:"40";s:2:"id";s:2:"16";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/40/75e762fc9073ac45668237ce2b25c11cO5kIaV.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/40/m/16";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"367";s:10:"img_height";s:3:"550";}i:1;a:10:{s:8:"share_id";s:2:"39";s:2:"id";s:2:"15";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/39/3d054aa638de584e7ed9201657267171LM58v8.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/39/m/15";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"600";s:10:"img_height";s:3:"813";}i:2;a:10:{s:8:"share_id";s:2:"38";s:2:"id";s:2:"14";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/38/74222a4714cde54c497fdca4a0d7099cwFwFEc.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/38/m/14";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"720";s:10:"img_height";s:3:"662";}i:3;a:10:{s:8:"share_id";s:2:"37";s:2:"id";s:2:"13";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/37/31cb9267e4a38130c1a155b190740072FNdnm0.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/37/m/13";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"600";s:10:"img_height";s:3:"860";}i:4;a:10:{s:8:"share_id";s:2:"36";s:2:"id";s:2:"12";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/36/d556e88059c2bc79afbaebc1f5b69edckHc2rA.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/36/m/12";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"596";s:10:"img_height";s:3:"900";}i:5;a:10:{s:8:"share_id";s:2:"35";s:2:"id";s:2:"11";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/35/67b2ff69383527f70807e1159db26f79f8Jno5.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/35/m/11";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"350";s:10:"img_height";s:3:"450";}}}', 1, 1, 1, '', '', 100, 1),
(2, 1, 41, 1, '流行时尚', 3, '时尚 秀场 晒货', '', 6, 0, 6, 0, 0, 6, 1332576000, 1332579122, 'a:1:{s:4:"imgs";a:6:{i:0;a:10:{s:8:"share_id";s:2:"47";s:2:"id";s:2:"22";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/32/a85552bfa583157bd9e06f960a70efd294xO4H.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/47/m/22";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"438";s:10:"img_height";s:3:"655";}i:1;a:10:{s:8:"share_id";s:2:"46";s:2:"id";s:2:"21";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/33/78ca250512e5cf48224dab306449ef0botqtqv.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/46/m/21";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"460";s:10:"img_height";s:3:"507";}i:2;a:10:{s:8:"share_id";s:2:"45";s:2:"id";s:2:"20";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/35/67b2ff69383527f70807e1159db26f79f8Jno5.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/45/m/20";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"350";s:10:"img_height";s:3:"450";}i:3;a:10:{s:8:"share_id";s:2:"44";s:2:"id";s:2:"19";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/38/74222a4714cde54c497fdca4a0d7099cwFwFEc.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/44/m/19";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"720";s:10:"img_height";s:3:"662";}i:4;a:10:{s:8:"share_id";s:2:"43";s:2:"id";s:2:"18";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/39/3d054aa638de584e7ed9201657267171LM58v8.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/43/m/18";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"600";s:10:"img_height";s:3:"813";}i:5;a:10:{s:8:"share_id";s:2:"42";s:2:"id";s:2:"17";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/40/75e762fc9073ac45668237ce2b25c11cO5kIaV.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:13:"/note/42/m/17";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"367";s:10:"img_height";s:3:"550";}}}', 1, 1, 1, '', '', 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_album_best`
--

CREATE TABLE IF NOT EXISTS `fanwe_album_best` (
  `album_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `best_day` int(11) NOT NULL DEFAULT '0',
  `best_time` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `aid_uid` (`album_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_album_category`
--

CREATE TABLE IF NOT EXISTS `fanwe_album_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `img` varchar(255) NOT NULL DEFAULT '',
  `img_hover` varchar(255) NOT NULL DEFAULT '',
  `seo_title` varchar(255) NOT NULL DEFAULT '',
  `seo_keywords` text,
  `seo_desc` text,
  `sort` smallint(5) NOT NULL DEFAULT '10',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_album_category`
--

INSERT INTO `fanwe_album_category` (`id`, `name`, `img`, `img_hover`, `seo_title`, `seo_keywords`, `seo_desc`, `sort`, `status`) VALUES
(1, '时尚', './public/upload/images/201111/27/4ed1e6e200df4.png', './public/upload/images/201111/27/4ed1e7c940571.png', '', '', '', 100, 1),
(2, '美容', './public/upload/images/201111/27/4ed1e6f2a68d5.png', './public/upload/images/201111/27/4ed1e7da120e5.png', '', '', '', 100, 1),
(3, '购物', './public/upload/images/201111/27/4ed1e700ade32.png', './public/upload/images/201111/27/4ed1e7e7800fe.png', '', '', '', 100, 1),
(4, '生活', './public/upload/images/201111/27/4ed1e709c63b5.png', './public/upload/images/201111/27/4ed1e7ee17598.png', '', '', '', 100, 1),
(5, '其他', './public/upload/images/201111/27/4ed1e71912037.png', './public/upload/images/201111/27/4ed1e7f5e1d65.png', '', '', '', 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_album_rec`
--

CREATE TABLE IF NOT EXISTS `fanwe_album_rec` (
  `album_id` int(11) NOT NULL,
  `ashare_id` int(11) NOT NULL,
  `share_id` int(11) NOT NULL,
  `rec_id` int(11) NOT NULL,
  `type` enum('photo','goods') NOT NULL,
  KEY `share_id` (`share_id`),
  KEY `album_id` (`album_id`),
  KEY `ashare_id` (`ashare_id`),
  KEY `album_id_2` (`album_id`,`share_id`,`rec_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_album_rec`
--

INSERT INTO `fanwe_album_rec` (`album_id`, `ashare_id`, `share_id`, `rec_id`, `type`) VALUES
(2, 42, 40, 16, 'photo'),
(2, 43, 39, 15, 'photo'),
(2, 44, 38, 14, 'photo'),
(2, 45, 35, 11, 'photo'),
(2, 46, 33, 9, 'photo'),
(2, 47, 32, 8, 'photo');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_album_share`
--

CREATE TABLE IF NOT EXISTS `fanwe_album_share` (
  `album_id` int(11) NOT NULL,
  `share_id` int(11) NOT NULL,
  `cid` smallint(6) NOT NULL DEFAULT '0',
  `create_day` int(11) NOT NULL DEFAULT '0',
  KEY `album_id` (`album_id`),
  KEY `cid` (`cid`),
  KEY `create_day` (`create_day`),
  KEY `share_id` (`share_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_album_share`
--

INSERT INTO `fanwe_album_share` (`album_id`, `share_id`, `cid`, `create_day`) VALUES
(1, 14, 1, 1332316800),
(1, 29, 1, 1332576000),
(1, 30, 1, 1332576000),
(1, 31, 1, 1332576000),
(1, 32, 1, 1332576000),
(1, 33, 1, 1332576000),
(1, 34, 1, 1332576000),
(1, 35, 1, 1332576000),
(1, 36, 1, 1332576000),
(1, 37, 1, 1332576000),
(1, 38, 1, 1332576000),
(1, 39, 1, 1332576000),
(1, 40, 1, 1332576000),
(2, 42, 1, 1332576000),
(2, 43, 1, 1332576000),
(2, 44, 1, 1332576000),
(2, 45, 1, 1332576000),
(2, 46, 1, 1332576000),
(2, 47, 1, 1332576000);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_album_tags`
--

CREATE TABLE IF NOT EXISTS `fanwe_album_tags` (
  `tag_name` varchar(60) NOT NULL,
  `album_count` int(11) NOT NULL DEFAULT '0',
  `tag_img` varchar(255) NOT NULL DEFAULT '',
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `tag_name` (`tag_name`),
  KEY `is_new` (`is_new`),
  KEY `album_count` (`album_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_album_tags`
--

INSERT INTO `fanwe_album_tags` (`tag_name`, `album_count`, `tag_img`, `is_new`) VALUES
('时尚', 2, '', 1),
('购物', 1, '', 1),
('搭配秀', 1, '', 1),
('秀场', 1, '', 1),
('晒货', 1, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_album_tags_related`
--

CREATE TABLE IF NOT EXISTS `fanwe_album_tags_related` (
  `tag_name` varchar(60) NOT NULL,
  `album_id` int(11) NOT NULL,
  UNIQUE KEY `tag_aid` (`tag_name`,`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_album_tags_related`
--

INSERT INTO `fanwe_album_tags_related` (`tag_name`, `album_id`) VALUES
('搭配秀', 1),
('时尚', 1),
('时尚', 2),
('晒货', 2),
('秀场', 2),
('购物', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_ask`
--

CREATE TABLE IF NOT EXISTS `fanwe_ask` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT '',
  `sort` smallint(5) DEFAULT '100',
  `uid` int(11) DEFAULT NULL,
  `user_name` char(15) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `thread_count` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `fanwe_ask`
--

INSERT INTO `fanwe_ask` (`aid`, `name`, `sort`, `uid`, `user_name`, `create_time`, `status`, `thread_count`) VALUES
(1, '服装搭配', 100, 0, '', 1308802605, 1, 1),
(2, '美容美妆', 99, 0, '', 1308802605, 1, 0),
(3, '配件饰品', 98, 0, '', 1308802605, 1, 0),
(4, '塑身美体', 97, 0, '', 1308802605, 1, 0),
(5, '鞋帽箱包', 96, 0, '', 1308802605, 1, 0),
(6, '礼物推荐', 95, 0, '', 1308802605, 1, 0),
(7, '家居母婴', 94, 0, '', 1308802605, 1, 0),
(8, '食品保健', 93, 0, '', 1308802605, 1, 0),
(9, '数码家电', 92, 0, '', 1308802605, 1, 0),
(10, '真假鉴别', 91, 0, '', 1308802605, 1, 0),
(11, '方维答疑', 90, 0, '', 1308802605, 1, 0),
(12, '五六折答疑', 89, 0, '', 1308802605, 1, 0),
(13, '淘宝答疑', 88, 0, '', 1308802605, 1, 0),
(14, '其他', 87, 0, '', 1308802605, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_ask_fields`
--

CREATE TABLE IF NOT EXISTS `fanwe_ask_fields` (
  `aid` smallint(6) unsigned NOT NULL,
  `desc` text NOT NULL,
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_desc` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_ask_fields`
--

INSERT INTO `fanwe_ask_fields` (`aid`, `desc`, `seo_keywords`, `seo_desc`, `logo`) VALUES
(1, '', '', '', ''),
(2, '', '', '', ''),
(3, '', '', '', ''),
(4, '', '', '', ''),
(5, '', '', '', ''),
(6, '', '', '', ''),
(7, '', '', '', ''),
(8, '', '', '', ''),
(9, '', '', '', ''),
(10, '', '', '', ''),
(11, '', '', '', ''),
(12, '', '', '', ''),
(13, '', '', '', ''),
(14, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_ask_post`
--

CREATE TABLE IF NOT EXISTS `fanwe_ask_post` (
  `pid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `share_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `user_name` char(15) DEFAULT '',
  `content` text,
  `is_best` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  KEY `share_id` (`share_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_ask_thread`
--

CREATE TABLE IF NOT EXISTS `fanwe_ask_thread` (
  `tid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `share_id` int(11) DEFAULT NULL,
  `title` varchar(80) DEFAULT '',
  `content` text,
  `uid` int(11) DEFAULT NULL,
  `user_name` char(15) DEFAULT '',
  `is_solve` tinyint(1) DEFAULT '0',
  `is_top` tinyint(1) DEFAULT '0',
  `is_best` tinyint(1) DEFAULT '0',
  `sort` smallint(5) DEFAULT '100',
  `status` tinyint(1) DEFAULT '1',
  `post_count` int(11) DEFAULT '0',
  `click_count` int(11) DEFAULT '0',
  `lastpost` int(11) DEFAULT '0',
  `lastposter` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`),
  KEY `share_id` (`share_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_atme`
--

CREATE TABLE IF NOT EXISTS `fanwe_atme` (
  `uid` int(11) DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `share_id` int(11) DEFAULT '0',
  KEY `uid` (`uid`) USING BTREE,
  KEY `share_id` (`share_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_atme`
--

INSERT INTO `fanwe_atme` (`uid`, `user_name`, `share_id`) VALUES
(3, '', 58);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event`
--

CREATE TABLE IF NOT EXISTS `fanwe_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `share_id` int(11) NOT NULL,
  `is_event` tinyint(1) NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `last_share` int(11) NOT NULL DEFAULT '0',
  `last_time` int(11) NOT NULL DEFAULT '0',
  `thread_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `title` (`title`) USING BTREE,
  KEY `share_id` (`share_id`),
  KEY `thread_count` (`thread_count`),
  KEY `last_share` (`last_share`),
  KEY `is_hot` (`is_hot`),
  KEY `is_event` (`is_event`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_share`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_share` (
  `event_id` int(11) NOT NULL,
  `share_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  KEY `event_id` (`event_id`),
  KEY `share_id` (`share_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_exchange_goods`
--

CREATE TABLE IF NOT EXISTS `fanwe_exchange_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `goods_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:虚拟卡 1:实体商品',
  `img` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `integral` int(11) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  `buy_count` int(11) NOT NULL DEFAULT '0',
  `user_num` smallint(5) NOT NULL DEFAULT '1',
  `is_best` tinyint(1) NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0',
  `begin_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `begin_end_time` (`begin_time`,`end_time`),
  KEY `status` (`status`),
  KEY `sort` (`sort`),
  KEY `is_best` (`is_best`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_expression`
--

CREATE TABLE IF NOT EXISTS `fanwe_expression` (
  `expression_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'tusiji',
  `emotion` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`expression_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=135 ;

--
-- 转存表中的数据 `fanwe_expression`
--

INSERT INTO `fanwe_expression` (`expression_id`, `title`, `type`, `emotion`, `filename`) VALUES
(19, '傲慢', 'qq', '[傲慢]', 'aoman.gif'),
(20, '白眼', 'qq', '[白眼]', 'baiyan.gif'),
(21, '鄙视', 'qq', '[鄙视]', 'bishi.gif'),
(22, '闭嘴', 'qq', '[闭嘴]', 'bizui.gif'),
(23, '擦汗', 'qq', '[擦汗]', 'cahan.gif'),
(24, '菜刀', 'qq', '[菜刀]', 'caidao.gif'),
(25, '差劲', 'qq', '[差劲]', 'chajin.gif'),
(26, '欢庆', 'qq', '[欢庆]', 'cheer.gif'),
(27, '虫子', 'qq', '[虫子]', 'chong.gif'),
(28, '呲牙', 'qq', '[呲牙]', 'ciya.gif'),
(29, '捶打', 'qq', '[捶打]', 'da.gif'),
(30, '大便', 'qq', '[大便]', 'dabian.gif'),
(31, '大兵', 'qq', '[大兵]', 'dabing.gif'),
(32, '大叫', 'qq', '[大叫]', 'dajiao.gif'),
(33, '大哭', 'qq', '[大哭]', 'daku.gif'),
(34, '蛋糕', 'qq', '[蛋糕]', 'dangao.gif'),
(35, '发怒', 'qq', '[发怒]', 'fanu.gif'),
(36, '刀', 'qq', '[刀]', 'dao.gif'),
(37, '得意', 'qq', '[得意]', 'deyi.gif'),
(38, '凋谢', 'qq', '[凋谢]', 'diaoxie.gif'),
(39, '饿', 'qq', '[饿]', 'er.gif'),
(40, '发呆', 'qq', '[发呆]', 'fadai.gif'),
(41, '发抖', 'qq', '[发抖]', 'fadou.gif'),
(42, '饭', 'qq', '[饭]', 'fan.gif'),
(43, '飞吻', 'qq', '[飞吻]', 'feiwen.gif'),
(44, '奋斗', 'qq', '[奋斗]', 'fendou.gif'),
(45, '尴尬', 'qq', '[尴尬]', 'gangga.gif'),
(46, '给力', 'qq', '[给力]', 'geili.gif'),
(47, '勾引', 'qq', '[勾引]', 'gouyin.gif'),
(48, '鼓掌', 'qq', '[鼓掌]', 'guzhang.gif'),
(49, '哈哈', 'qq', '[哈哈]', 'haha.gif'),
(50, '害羞', 'qq', '[害羞]', 'haixiu.gif'),
(51, '哈欠', 'qq', '[哈欠]', 'haqian.gif'),
(52, '花', 'qq', '[花]', 'hua.gif'),
(53, '坏笑', 'qq', '[坏笑]', 'huaixiao.gif'),
(54, '挥手', 'qq', '[挥手]', 'huishou.gif'),
(55, '回头', 'qq', '[回头]', 'huitou.gif'),
(56, '激动', 'qq', '[激动]', 'jidong.gif'),
(57, '惊恐', 'qq', '[惊恐]', 'jingkong.gif'),
(58, '惊讶', 'qq', '[惊讶]', 'jingya.gif'),
(59, '咖啡', 'qq', '[咖啡]', 'kafei.gif'),
(60, '可爱', 'qq', '[可爱]', 'keai.gif'),
(61, '可怜', 'qq', '[可怜]', 'kelian.gif'),
(62, '磕头', 'qq', '[磕头]', 'ketou.gif'),
(63, '示爱', 'qq', '[示爱]', 'kiss.gif'),
(64, '酷', 'qq', '[酷]', 'ku.gif'),
(65, '难过', 'qq', '[难过]', 'kuaikule.gif'),
(66, '骷髅', 'qq', '[骷髅]', 'kulou.gif'),
(67, '困', 'qq', '[困]', 'kun.gif'),
(68, '篮球', 'qq', '[篮球]', 'lanqiu.gif'),
(69, '冷汗', 'qq', '[冷汗]', 'lenghan.gif'),
(70, '流汗', 'qq', '[流汗]', 'liuhan.gif'),
(71, '流泪', 'qq', '[流泪]', 'liulei.gif'),
(72, '礼物', 'qq', '[礼物]', 'liwu.gif'),
(73, '爱心', 'qq', '[爱心]', 'love.gif'),
(74, '骂人', 'qq', '[骂人]', 'ma.gif'),
(75, '不开心', 'qq', '[不开心]', 'nanguo.gif'),
(76, '不好', 'qq', '[不好]', 'no.gif'),
(77, '很好', 'qq', '[很好]', 'ok.gif'),
(78, '佩服', 'qq', '[佩服]', 'peifu.gif'),
(79, '啤酒', 'qq', '[啤酒]', 'pijiu.gif'),
(80, '乒乓', 'qq', '[乒乓]', 'pingpang.gif'),
(81, '撇嘴', 'qq', '[撇嘴]', 'pizui.gif'),
(82, '强', 'qq', '[强]', 'qiang.gif'),
(83, '亲亲', 'qq', '[亲亲]', 'qinqin.gif'),
(84, '出丑', 'qq', '[出丑]', 'qioudale.gif'),
(85, '足球', 'qq', '[足球]', 'qiu.gif'),
(86, '拳头', 'qq', '[拳头]', 'quantou.gif'),
(87, '弱', 'qq', '[弱]', 'ruo.gif'),
(88, '色', 'qq', '[色]', 'se.gif'),
(89, '闪电', 'qq', '[闪电]', 'shandian.gif'),
(90, '胜利', 'qq', '[胜利]', 'shengli.gif'),
(91, '衰', 'qq', '[衰]', 'shuai.gif'),
(92, '睡觉', 'qq', '[睡觉]', 'shuijiao.gif'),
(93, '太阳', 'qq', '[太阳]', 'taiyang.gif'),
(96, '啊', 'tusiji', '[啊]', 'aa.gif'),
(97, '暗爽', 'tusiji', '[暗爽]', 'anshuang.gif'),
(98, 'byebye', 'tusiji', '[byebye]', 'baibai.gif'),
(99, '不行', 'tusiji', '[不行]', 'buxing.gif'),
(100, '戳眼', 'tusiji', '[戳眼]', 'chuoyan.gif'),
(101, '很得意', 'tusiji', '[很得意]', 'deyi.gif'),
(102, '顶', 'tusiji', '[顶]', 'ding.gif'),
(103, '抖抖', 'tusiji', '[抖抖]', 'douxiong.gif'),
(104, '哼', 'tusiji', '[哼]', 'heng.gif'),
(105, '挥汗', 'tusiji', '[挥汗]', 'huihan.gif'),
(106, '昏迷', 'tusiji', '[昏迷]', 'hunmi.gif'),
(107, '互拍', 'tusiji', '[互拍]', 'hupai.gif'),
(108, '瞌睡', 'tusiji', '[瞌睡]', 'keshui.gif'),
(109, '笼子', 'tusiji', '[笼子]', 'longzi.gif'),
(110, '听歌', 'tusiji', '[听歌]', 'music.gif'),
(111, '奶瓶', 'tusiji', '[奶瓶]', 'naiping.gif'),
(112, '扭背', 'tusiji', '[扭背]', 'niubei.gif'),
(113, '拍砖', 'tusiji', '[拍砖]', 'paizhuan.gif'),
(114, '飘过', 'tusiji', '[飘过]', 'piaoguo.gif'),
(115, '揉脸', 'tusiji', '[揉脸]', 'roulian.gif'),
(116, '闪闪', 'tusiji', '[闪闪]', 'shanshan.gif'),
(117, '生日', 'tusiji', '[生日]', 'shengri.gif'),
(118, '摊手', 'tusiji', '[摊手]', 'tanshou.gif'),
(119, '躺坐', 'tusiji', '[躺坐]', 'tanzuo.gif'),
(120, '歪头', 'tusiji', '[歪头]', 'waitou.gif'),
(121, '我踢', 'tusiji', '[我踢]', 'woti.gif'),
(122, '无聊', 'tusiji', '[无聊]', 'wuliao.gif'),
(123, '醒醒', 'tusiji', '[醒醒]', 'xingxing.gif'),
(124, '睡了', 'tusiji', '[睡了]', 'xixishui.gif'),
(125, '旋转', 'tusiji', '[旋转]', 'xuanzhuan.gif'),
(126, '摇晃', 'tusiji', '[摇晃]', 'yaohuang.gif'),
(127, '耶', 'tusiji', '[耶]', 'yeah.gif'),
(128, '郁闷', 'tusiji', '[郁闷]', 'yumen.gif'),
(129, '晕厥', 'tusiji', '[晕厥]', 'yunjue.gif'),
(130, '砸', 'tusiji', '[砸]', 'za.gif'),
(131, '震荡', 'tusiji', '[震荡]', 'zhendang.gif'),
(132, '撞墙', 'tusiji', '[撞墙]', 'zhuangqiang.gif'),
(133, '转头', 'tusiji', '[转头]', 'zhuantou.gif'),
(134, '抓墙', 'tusiji', '[抓墙]', 'zhuaqiang.gif');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_forum`
--

CREATE TABLE IF NOT EXISTS `fanwe_forum` (
  `fid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT '',
  `uid` int(11) DEFAULT '0',
  `user_name` char(15) DEFAULT '',
  `parent_id` smallint(6) DEFAULT '0',
  `sort` smallint(5) DEFAULT '100',
  `create_time` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `thread_count` int(11) DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `fanwe_forum`
--

INSERT INTO `fanwe_forum` (`fid`, `name`, `uid`, `user_name`, `parent_id`, `sort`, `create_time`, `status`, `thread_count`) VALUES
(1, '购物实拍', 0, '', 0, 1, 1310766076, 1, 1),
(2, '人人都爱小胖妞', 0, '', 0, 2, 1310766092, 1, 1),
(3, '服装配饰', 0, '', 0, 3, 1310766101, 1, 0),
(4, '时尚潮流', 0, '', 0, 4, 1310766108, 1, 0),
(5, '败家俱乐部', 0, '', 0, 5, 1310766115, 1, 0),
(6, '美容保养', 0, '', 0, 6, 1310766123, 1, 0),
(7, '家居生活', 0, '', 0, 7, 1310766131, 1, 0),
(8, '时尚大水塘', 0, '', 0, 8, 1310766143, 1, 0),
(9, '时尚活动吧', 0, '', 0, 9, 1310766160, 1, 0),
(10, '网购', 0, '', 1, 10, 1310766185, 1, 1),
(11, '实体', 0, '', 1, 11, 1310766193, 1, 0),
(12, '港台', 0, '', 1, 12, 1310766229, 1, 0),
(13, '海外', 0, '', 1, 13, 1310766237, 1, 0),
(14, '搭配日记', 0, '', 2, 14, 1310766257, 1, 0),
(15, '彩妆look', 0, '', 2, 15, 1310766270, 1, 0),
(16, '清新素颜', 0, '', 2, 16, 1310766280, 1, 0),
(17, '其它', 0, '', 2, 17, 1310766288, 1, 1),
(18, '时尚单品', 0, '', 3, 18, 1310766316, 1, 0),
(19, '风格搭配', 0, '', 3, 19, 1310766328, 1, 0),
(20, '就爱配饰', 0, '', 3, 20, 1310766337, 1, 0),
(21, '鞋包控', 0, '', 3, 21, 1310766346, 1, 0),
(22, '品牌大片', 0, '', 4, 22, 1310766364, 1, 0),
(23, '明星look', 0, '', 4, 23, 1310766377, 1, 0),
(24, '街拍&名博', 0, '', 4, 24, 1310766385, 1, 0),
(25, '其它', 0, '', 4, 25, 1310766394, 1, 0),
(26, '败家攻略', 0, '', 5, 26, 1310766411, 1, 0),
(27, '收藏夹', 0, '', 5, 27, 1310766418, 1, 0),
(28, '淘宝潮流榜', 0, '', 5, 28, 1310766425, 1, 0),
(29, '其它', 0, '', 5, 29, 1310766432, 1, 0),
(30, '护肤', 0, '', 6, 30, 1310766446, 1, 0),
(31, '靓妆', 0, '', 6, 31, 1310766455, 1, 0),
(32, '美甲&香水', 0, '', 6, 32, 1310766487, 1, 0),
(33, '美体', 0, '', 6, 33, 1310766498, 1, 0),
(34, '其它', 0, '', 6, 34, 1310766506, 1, 0),
(35, '吃喝玩乐', 0, '', 7, 35, 1310766521, 1, 0),
(36, '我爱我家', 0, '', 7, 36, 1310766530, 1, 0),
(37, '小物&DIY', 0, '', 7, 37, 1310766541, 1, 0),
(38, '手机数码', 0, '', 7, 38, 1310766549, 1, 0),
(39, '亲子乐园', 0, '', 7, 39, 1310766558, 1, 0),
(40, '其它', 0, '', 7, 40, 1310766567, 1, 0),
(41, '试用报告', 0, '', 9, 41, 1310766590, 1, 0),
(42, '随便说说', 0, '', 9, 42, 1310766598, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_forum_fields`
--

CREATE TABLE IF NOT EXISTS `fanwe_forum_fields` (
  `fid` smallint(6) unsigned NOT NULL,
  `desc` text,
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_desc` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_forum_fields`
--

INSERT INTO `fanwe_forum_fields` (`fid`, `desc`, `seo_keywords`, `seo_desc`, `logo`, `img`) VALUES
(1, '血拼归来啰！包裹到手啦! 新货入荷要上蘑菇街来秀一秀。无论是得意的宝贝，还是恼人的次品，与 蘑菇们一起分享吧。', '', '', './public/upload/images/201108/18/4e4c3d36ef43a.jpg', './public/upload/images/201108/18/4e4c3d3700552.jpg'),
(2, '小蘑菇们，来蘑菇街露个脸，互相熟悉一下吧。当然笑笑更cute哦：）', '', '', './public/upload/images/201108/18/4e4c3d8103d07.png', './public/upload/images/201108/18/4e4c3d81044b3.jpg'),
(3, '新衣上身，美的冒泡，子曰独美美不如众美美，还不秀出来？：）', '', '', './public/upload/images/201108/18/4e4c3db681396.jpg', './public/upload/images/201108/18/4e4c3db6819aa.jpg'),
(4, '搜寻最in的潮牌潮品，关注最新鲜的时尚资讯，一切尽在时尚潮流吧~\r\n关注时尚，打造属于你的个性穿搭，你也能够成为 时尚达人！\r\n赶紧跟随我们的脚步 HIGH起来吧~ GO ！', '', '', './public/upload/images/201108/18/4e4c3e173115f.jpg', './public/upload/images/201108/18/4e4c3e1731781.jpg'),
(5, '把你收藏的好店、好商品分享给大家吧！地球人都会感谢你的。', '', '', './public/upload/images/201108/18/4e4c3e686baf3.jpg', './public/upload/images/201108/18/4e4c3e686c0ef.jpg'),
(6, '白嫩嫩，水当当，佛说又美又白的水蘑菇是靠保养出来滴：）', '', '', './public/upload/images/201108/18/4e4c3ea63269d.jpg', './public/upload/images/201108/18/4e4c3ea632c94.jpg'),
(7, '家居小物，吃喝玩乐，手机数码…………大家给力的聊吧！', '', '', './public/upload/images/201108/18/4e4c3ed3eb234.jpg', './public/upload/images/201108/18/4e4c3ed3eb824.jpg'),
(8, '无主题的主题吧，欢迎扎堆唠嗑。', '', '', './public/upload/images/201108/18/4e4c3ef744f84.png', './public/upload/images/201108/18/4e4c3ef7455b1.jpg'),
(9, '蘑菇街官方活动吧，来许下你的礼物愿望吧，蘑菇街帮你实现。', '', '', './public/upload/images/201108/18/4e4c3f1ab95aa.png', './public/upload/images/201108/18/4e4c3f1ab9b72.jpg'),
(10, '', '', '', '', ''),
(11, '', '', '', '', ''),
(12, '', '', '', '', ''),
(13, '', '', '', '', ''),
(14, '', '', '', '', ''),
(15, '', '', '', '', ''),
(16, '', '', '', '', ''),
(17, '', '', '', '', ''),
(18, '', '', '', '', ''),
(19, '', '', '', '', ''),
(20, '', '', '', '', ''),
(21, '', '', '', '', ''),
(22, '', '', '', '', ''),
(23, '', '', '', '', ''),
(24, '', '', '', '', ''),
(25, '', '', '', '', ''),
(26, '', '', '', '', ''),
(27, '', '', '', '', ''),
(28, '', '', '', '', ''),
(29, '', '', '', '', ''),
(30, '', '', '', '', ''),
(31, '', '', '', '', ''),
(32, '', '', '', '', ''),
(33, '', '', '', '', ''),
(34, '', '', '', '', ''),
(35, '', '', '', '', ''),
(36, '', '', '', '', ''),
(37, '', '', '', '', ''),
(38, '', '', '', '', ''),
(39, '', '', '', '', ''),
(40, '', '', '', '', ''),
(41, '', '', '', '', ''),
(42, '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_forum_post`
--

CREATE TABLE IF NOT EXISTS `fanwe_forum_post` (
  `pid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `share_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `user_name` char(15) DEFAULT '',
  `content` text,
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  KEY `share_id` (`share_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_forum_thread`
--

CREATE TABLE IF NOT EXISTS `fanwe_forum_thread` (
  `tid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(6) NOT NULL,
  `share_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT '',
  `content` text,
  `is_top` tinyint(1) DEFAULT '0',
  `is_best` tinyint(1) DEFAULT '0',
  `is_event` tinyint(1) NOT NULL DEFAULT '0',
  `sort` smallint(5) DEFAULT '100',
  `status` tinyint(1) DEFAULT '1',
  `post_count` smallint(6) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `click_count` int(11) NOT NULL DEFAULT '0',
  `lastpost` int(11) NOT NULL DEFAULT '0',
  `lastposter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `fid` (`fid`),
  KEY `uid` (`uid`),
  KEY `share_id` (`share_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_forum_thread`
--

INSERT INTO `fanwe_forum_thread` (`tid`, `fid`, `share_id`, `uid`, `title`, `content`, `is_top`, `is_best`, `is_event`, `sort`, `status`, `post_count`, `create_time`, `click_count`, `lastpost`, `lastposter`) VALUES
(1, 17, 52, 1, '人人都爱小胖妞', '据说科学家做了这样一个实验并得到证实：如果一个人每天站在镜子前，冲自己微笑，告诉自己“我很美”，那么他真的越来越美——心理暗示的力量如此强大。一个女人，有了自信便有了美。有了自信便会感觉到，爱情在自己生命中的地位也没那么重要，有很多事情可以享受，爱情也许很卑微。胖妞们记住，你们也很美丽', 0, 0, 0, 100, 1, 0, 1332701606, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_friend_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_friend_link` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(255) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `sort` smallint(5) NOT NULL DEFAULT '100',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_friend_link`
--

INSERT INTO `fanwe_friend_link` (`id`, `name`, `url`, `img`, `width`, `height`, `sort`, `status`) VALUES
(1, '腾讯', 'http://www.qq.com/', '', 0, 0, 100, 1),
(2, 'Google', 'http://www.google.com/', '', 0, 0, 100, 1),
(3, '百度', 'http://www.baidu.com/', '', 0, 0, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_goods_category`
--

CREATE TABLE IF NOT EXISTS `fanwe_goods_category` (
  `cate_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) DEFAULT '0',
  `cate_name` varchar(80) DEFAULT '',
  `short_name` varchar(60) NOT NULL DEFAULT '',
  `cate_code` varchar(80) DEFAULT '',
  `cate_icon` varchar(255) DEFAULT '',
  `desc` varchar(255) DEFAULT '',
  `seo_keywords` varchar(255) DEFAULT '',
  `seo_desc` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT '0',
  `sort` smallint(6) NOT NULL DEFAULT '100',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  `is_root` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `fanwe_goods_category`
--

INSERT INTO `fanwe_goods_category` (`cate_id`, `parent_id`, `cate_name`, `short_name`, `cate_code`, `cate_icon`, `desc`, `seo_keywords`, `seo_desc`, `create_time`, `sort`, `status`, `is_index`, `is_root`) VALUES
(1, 0, '逛街啦！', '最新分享', '', './public/upload/images/201108/03/4e38bfee1e8c2.png', '告诉大家你爱的宝贝', '', '', 1312313198, 100, 1, 0, 1),
(2, 0, '上装', '上装', 'coats', './public/upload/images/201108/03/4e38c0bba963c.png', '告诉大家你爱的上装', '', '', 1312313403, 100, 1, 1, 0),
(3, 0, '下装', '下装', 'pants', './public/upload/images/201108/03/4e38c0e27b92f.png', '告诉大家你爱的下装', '', '', 1312313442, 100, 1, 1, 0),
(4, 0, '鞋子', '鞋子', 'shoes', './public/upload/images/201108/03/4e38c0ff4dd7b.png', '告诉大家你爱的鞋子', '', '', 1312313471, 100, 1, 1, 0),
(5, 0, '包包', '包包', 'bags', './public/upload/images/201108/03/4e38c1331dede.png', '告诉大家你爱的包包', '', '', 1312313523, 100, 1, 1, 0),
(6, 0, '配饰', '配饰', 'accessories', './public/upload/images/201108/03/4e38c15488fc5.png', '告诉大家你爱的配饰', '', '', 1312313556, 100, 1, 1, 0),
(7, 0, '美妆', '美妆', 'beauties', './public/upload/images/201108/03/4e38c189a9d38.png', '告诉大家你爱的美妆', '', '', 1312313609, 100, 1, 1, 0),
(8, 0, '家居', '家居', 'home', './public/upload/images/201108/03/4e38c1a893442.png', '告诉大家你爱的家居', '', '', 1312313640, 100, 1, 1, 0),
(9, 1, '百变style', '', '', '', '', '', '', 1312313702, 100, 1, 0, 0),
(10, 1, '酷感夏日', '', '', '', '', '', '', 1312313722, 100, 1, 0, 0),
(11, 1, '人气top', '', '', '', '', '', '', 1312313730, 100, 1, 0, 0),
(12, 1, '流行元素', '', '', '', '', '', '', 1312313739, 100, 1, 0, 0),
(13, 1, '潮流hunter', '', '', '', '', '', '', 1312313747, 100, 1, 0, 0),
(14, 2, 'T台热荐', '', '', '', '', '', '', 1312313773, 100, 1, 0, 0),
(15, 2, '潮流趋势', '', '', '', '', '', '', 1312313780, 100, 1, 0, 0),
(16, 2, '最夯风格', '', '', '', '', '', '', 1312313788, 100, 1, 0, 0),
(17, 2, '专属衣厨', '', '', '', '', '', '', 1312313797, 100, 1, 0, 0),
(18, 2, '内衣', '', '', '', '', '', '', 1312313805, 100, 1, 0, 0),
(19, 3, '流行元素', '', '', '', '', '', '', 1312313825, 100, 1, 0, 0),
(20, 3, '裙子vs裤子', '', '', '', '', '', '', 1312313834, 100, 1, 0, 0),
(21, 3, '牛仔很忙', '', '', '', '', '', '', 1312313845, 100, 1, 0, 0),
(22, 4, '类别', '', '', '', '', '', '', 1312313893, 100, 1, 0, 0),
(23, 4, '鞋型', '', '', '', '', '', '', 1312313900, 100, 1, 0, 0),
(24, 4, '风格&元素', '', '', '', '', '', '', 1312313909, 100, 1, 0, 0),
(25, 4, '流行大集合', '', '', '', '', '', '', 1312313920, 100, 1, 0, 0),
(26, 5, '有型有款', '', '', '', '', '', '', 1312313938, 100, 1, 0, 0),
(27, 5, '风格&元素', '', '', '', '', '', '', 1312313947, 100, 1, 0, 0),
(28, 5, '潮流风向标', '', '', '', '', '', '', 1312313956, 100, 1, 0, 0),
(29, 6, '配件', '', '', '', '', '', '', 1312313971, 100, 1, 0, 0),
(30, 6, '风格', '', '', '', '', '', '', 1312313979, 100, 1, 0, 0),
(31, 6, '元素', '', '', '', '', '', '', 1312313987, 100, 1, 0, 0),
(32, 7, '护肤', '', '', '', '', '', '', 1312314004, 100, 1, 0, 0),
(33, 7, '彩妆', '', '', '', '', '', '', 1312314011, 100, 1, 0, 0),
(34, 7, '热门品牌', '', '', '', '', '', '', 1312314020, 100, 1, 0, 0),
(35, 7, '热门讨论', '', '', '', '', '', '', 1312314028, 100, 1, 0, 0),
(36, 8, '生活&趣玩', '', '', '', '', '', '', 1312314041, 100, 1, 0, 0),
(37, 8, '瓶瓶&罐罐', '', '', '', '', '', '', 1312314052, 100, 1, 0, 0),
(38, 8, '文具控', '', '', '', '', '', '', 1312314060, 100, 1, 0, 0),
(39, 8, '收纳控', '', '', '', '', '', '', 1312314068, 100, 1, 0, 0),
(40, 8, '数码控', '', '', '', '', '', '', 1312314077, 100, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_goods_category_tags`
--

CREATE TABLE IF NOT EXISTS `fanwe_goods_category_tags` (
  `cate_id` smallint(6) NOT NULL,
  `tag_id` smallint(6) NOT NULL,
  `weight` smallint(6) NOT NULL DEFAULT '1',
  KEY `cate_id` (`cate_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_goods_category_tags`
--

INSERT INTO `fanwe_goods_category_tags` (`cate_id`, `tag_id`, `weight`) VALUES
(9, 1, 1),
(9, 2, 1),
(9, 3, 1),
(9, 4, 1),
(9, 5, 1),
(9, 6, 1),
(9, 7, 1),
(9, 8, 1),
(9, 9, 1),
(10, 10, 1),
(10, 11, 1),
(10, 12, 1),
(10, 13, 1),
(10, 14, 1),
(10, 15, 1),
(10, 16, 1),
(10, 17, 1),
(10, 18, 1),
(10, 19, 1),
(11, 20, 1),
(11, 21, 1),
(11, 22, 1),
(11, 23, 1),
(11, 24, 1),
(11, 25, 1),
(11, 26, 1),
(11, 27, 1),
(11, 28, 1),
(11, 29, 1),
(11, 30, 1),
(12, 31, 1),
(12, 32, 1),
(12, 33, 1),
(12, 34, 1),
(12, 35, 1),
(12, 36, 1),
(12, 37, 1),
(12, 38, 1),
(12, 39, 1),
(12, 40, 1),
(12, 41, 1),
(12, 42, 1),
(13, 43, 1),
(13, 44, 1),
(13, 45, 1),
(13, 46, 1),
(13, 47, 1),
(13, 48, 1),
(13, 49, 1),
(13, 50, 1),
(13, 51, 1),
(13, 52, 1),
(13, 53, 1),
(13, 54, 1),
(13, 55, 1),
(13, 56, 1),
(14, 16, 1),
(14, 26, 1),
(14, 11, 1),
(14, 57, 1),
(14, 22, 1),
(14, 58, 1),
(14, 10, 1),
(14, 17, 1),
(14, 59, 1),
(15, 60, 1),
(15, 61, 1),
(15, 62, 1),
(15, 32, 1),
(15, 2, 1),
(15, 40, 1),
(15, 63, 1),
(15, 64, 1),
(15, 65, 1),
(15, 66, 1),
(15, 67, 1),
(15, 68, 1),
(16, 69, 1),
(16, 70, 1),
(16, 71, 1),
(16, 72, 1),
(16, 73, 1),
(16, 4, 1),
(16, 74, 1),
(16, 5, 1),
(16, 1, 1),
(17, 75, 1),
(17, 76, 1),
(17, 11, 1),
(17, 77, 1),
(17, 78, 1),
(17, 79, 1),
(17, 59, 1),
(18, 80, 1),
(18, 81, 1),
(18, 82, 1),
(18, 83, 1),
(18, 84, 1),
(19, 85, 1),
(19, 86, 1),
(19, 42, 1),
(19, 65, 1),
(19, 87, 1),
(19, 88, 1),
(19, 36, 1),
(19, 89, 1),
(19, 90, 1),
(20, 91, 1),
(20, 92, 1),
(20, 93, 1),
(20, 94, 1),
(20, 95, 1),
(20, 96, 1),
(20, 97, 1),
(20, 98, 1),
(20, 15, 1),
(20, 99, 1),
(20, 21, 1),
(20, 100, 1),
(21, 101, 1),
(21, 102, 1),
(21, 103, 1),
(21, 104, 1),
(21, 105, 1),
(21, 106, 1),
(21, 107, 1),
(22, 13, 1),
(22, 108, 1),
(22, 109, 1),
(22, 23, 1),
(22, 110, 1),
(22, 111, 1),
(22, 112, 1),
(22, 113, 1),
(22, 114, 1),
(22, 115, 1),
(22, 116, 1),
(22, 12, 1),
(22, 117, 1),
(22, 118, 1),
(22, 119, 1),
(23, 120, 1),
(23, 121, 1),
(23, 122, 1),
(23, 123, 1),
(23, 124, 1),
(23, 125, 1),
(23, 126, 1),
(23, 127, 1),
(23, 128, 1),
(23, 129, 1),
(23, 37, 1),
(24, 130, 1),
(24, 131, 1),
(24, 132, 1),
(24, 55, 1),
(24, 133, 1),
(24, 134, 1),
(24, 65, 1),
(24, 85, 1),
(24, 135, 1),
(24, 32, 1),
(24, 136, 1),
(24, 1, 1),
(24, 137, 1),
(25, 138, 1),
(25, 139, 1),
(25, 140, 1),
(25, 141, 1),
(25, 142, 1),
(25, 53, 1),
(25, 143, 1),
(25, 144, 1),
(25, 145, 1),
(25, 146, 1),
(26, 27, 1),
(26, 28, 1),
(26, 147, 1),
(26, 148, 1),
(26, 149, 1),
(26, 150, 1),
(26, 151, 1),
(26, 152, 1),
(26, 153, 1),
(26, 154, 1),
(26, 155, 1),
(26, 156, 1),
(26, 157, 1),
(26, 158, 1),
(26, 159, 1),
(26, 160, 1),
(26, 161, 1),
(26, 162, 1),
(26, 163, 1),
(26, 164, 1),
(27, 2, 1),
(27, 1, 1),
(27, 165, 1),
(27, 166, 1),
(27, 167, 1),
(27, 64, 1),
(27, 168, 1),
(27, 169, 1),
(27, 32, 1),
(27, 65, 1),
(27, 170, 1),
(27, 171, 1),
(28, 172, 1),
(28, 173, 1),
(28, 38, 1),
(28, 174, 1),
(28, 175, 1),
(28, 176, 1),
(28, 177, 1),
(28, 178, 1),
(28, 179, 1),
(28, 180, 1),
(29, 18, 1),
(29, 181, 1),
(29, 182, 1),
(29, 183, 1),
(29, 184, 1),
(29, 185, 1),
(29, 186, 1),
(29, 187, 1),
(29, 188, 1),
(29, 189, 1),
(29, 190, 1),
(29, 191, 1),
(29, 192, 1),
(29, 193, 1),
(29, 194, 1),
(29, 195, 1),
(29, 196, 1),
(30, 197, 1),
(30, 198, 1),
(30, 2, 1),
(30, 199, 1),
(30, 60, 1),
(30, 6, 1),
(30, 200, 1),
(30, 201, 1),
(30, 9, 1),
(30, 202, 1),
(30, 203, 1),
(30, 204, 1),
(31, 205, 1),
(31, 206, 1),
(31, 207, 1),
(31, 208, 1),
(31, 209, 1),
(31, 210, 1),
(31, 211, 1),
(31, 212, 1),
(31, 213, 1),
(32, 214, 1),
(32, 215, 1),
(32, 216, 1),
(32, 217, 1),
(32, 218, 1),
(32, 219, 1),
(33, 232, 1),
(32, 221, 1),
(32, 220, 1),
(32, 223, 1),
(33, 235, 1),
(33, 231, 1),
(33, 230, 1),
(32, 227, 1),
(33, 234, 1),
(33, 233, 1),
(33, 236, 1),
(33, 237, 1),
(33, 238, 1),
(33, 239, 1),
(33, 240, 1),
(34, 241, 1),
(34, 242, 1),
(34, 243, 1),
(34, 244, 1),
(34, 245, 1),
(34, 246, 1),
(34, 247, 1),
(34, 248, 1),
(34, 249, 1),
(34, 250, 1),
(34, 251, 1),
(35, 224, 1),
(35, 225, 1),
(35, 252, 1),
(35, 253, 1),
(35, 226, 1),
(35, 254, 1),
(35, 227, 1),
(35, 228, 1),
(35, 229, 1),
(35, 255, 1),
(36, 256, 1),
(36, 257, 1),
(36, 258, 1),
(36, 259, 1),
(36, 260, 1),
(36, 261, 1),
(36, 198, 1),
(36, 262, 1),
(36, 263, 1),
(37, 264, 1),
(37, 265, 1),
(37, 266, 1),
(37, 267, 1),
(37, 268, 1),
(37, 269, 1),
(37, 270, 1),
(38, 271, 1),
(38, 272, 1),
(38, 273, 1),
(38, 274, 1),
(38, 275, 1),
(38, 276, 1),
(38, 277, 1),
(38, 278, 1),
(38, 279, 1),
(38, 280, 1),
(39, 281, 1),
(39, 282, 1),
(39, 283, 1),
(39, 153, 1),
(39, 284, 1),
(39, 285, 1),
(40, 286, 1),
(40, 287, 1),
(40, 288, 1),
(40, 289, 1),
(40, 290, 1),
(40, 291, 1),
(40, 292, 1),
(2, 17, 100),
(2, 293, 100),
(2, 294, 100),
(2, 295, 100),
(2, 16, 100),
(2, 296, 100),
(2, 59, 100),
(2, 297, 100),
(2, 298, 100),
(2, 299, 100),
(2, 300, 100),
(2, 301, 100),
(2, 302, 100),
(2, 303, 100),
(2, 304, 100),
(2, 15, 100),
(2, 10, 100),
(2, 11, 100),
(2, 305, 100),
(2, 306, 100),
(2, 307, 100),
(2, 308, 100),
(2, 309, 100),
(2, 310, 100),
(2, 311, 100),
(2, 312, 100),
(2, 313, 100),
(2, 314, 100),
(2, 315, 100),
(2, 316, 100),
(2, 317, 100),
(2, 318, 100),
(2, 319, 100),
(2, 320, 100),
(2, 321, 100),
(2, 322, 100),
(2, 323, 100),
(2, 324, 100),
(2, 325, 100),
(2, 101, 100),
(2, 326, 100),
(2, 327, 100),
(2, 99, 100),
(2, 93, 100),
(2, 328, 100),
(2, 329, 100),
(2, 330, 100),
(2, 331, 100),
(2, 332, 100),
(2, 333, 100),
(2, 334, 100),
(2, 335, 100),
(2, 336, 100),
(2, 337, 100),
(2, 338, 100),
(2, 339, 100),
(2, 340, 100),
(2, 341, 100),
(2, 342, 100),
(2, 343, 100),
(2, 344, 100),
(2, 345, 100),
(2, 346, 100),
(2, 347, 100),
(2, 348, 100),
(2, 349, 100),
(2, 350, 100),
(2, 351, 100),
(2, 352, 100),
(2, 80, 100),
(2, 82, 100),
(2, 83, 100),
(2, 353, 100),
(3, 354, 100),
(3, 105, 100),
(3, 104, 100),
(3, 355, 100),
(3, 356, 100),
(3, 106, 100),
(3, 14, 100),
(3, 357, 100),
(3, 100, 100),
(3, 358, 100),
(3, 359, 100),
(3, 96, 100),
(3, 360, 100),
(3, 107, 100),
(3, 361, 100),
(3, 94, 100),
(3, 97, 100),
(3, 362, 100),
(3, 98, 100),
(3, 363, 100),
(3, 364, 100),
(3, 365, 100),
(3, 366, 100),
(3, 367, 100),
(3, 368, 100),
(3, 349, 100),
(3, 369, 100),
(3, 370, 100),
(4, 110, 100),
(4, 23, 100),
(4, 12, 100),
(4, 371, 100),
(4, 372, 100),
(4, 373, 100),
(4, 118, 100),
(4, 374, 100),
(4, 375, 100),
(4, 376, 100),
(4, 111, 100),
(4, 109, 100),
(4, 377, 100),
(4, 378, 100),
(4, 379, 100),
(4, 380, 100),
(4, 112, 100),
(4, 381, 100),
(4, 382, 100),
(4, 116, 100),
(4, 383, 100),
(4, 384, 100),
(4, 385, 100),
(4, 386, 100),
(4, 387, 100),
(5, 388, 100),
(5, 27, 100),
(5, 148, 100),
(5, 149, 100),
(5, 150, 100),
(5, 151, 100),
(5, 28, 100),
(5, 389, 100),
(5, 390, 100),
(5, 164, 100),
(5, 391, 100),
(5, 392, 100),
(5, 393, 100),
(5, 394, 100),
(5, 395, 100),
(5, 396, 100),
(5, 397, 100),
(5, 398, 100),
(5, 399, 100),
(5, 400, 100),
(5, 401, 100),
(5, 153, 100),
(5, 154, 100),
(5, 402, 100),
(5, 403, 100),
(5, 160, 100),
(5, 404, 100),
(5, 405, 100),
(5, 162, 100),
(5, 172, 100),
(5, 406, 100),
(5, 407, 100),
(5, 408, 100),
(5, 147, 100),
(5, 409, 100),
(5, 410, 100),
(5, 411, 100),
(5, 412, 100),
(5, 413, 100),
(5, 414, 100),
(5, 415, 100),
(5, 416, 100),
(5, 417, 100),
(6, 418, 100),
(6, 188, 100),
(6, 419, 100),
(6, 420, 100),
(6, 421, 100),
(6, 18, 100),
(6, 181, 100),
(6, 422, 100),
(6, 423, 100),
(6, 424, 100),
(6, 425, 100),
(6, 183, 100),
(6, 426, 100),
(6, 427, 100),
(6, 428, 100),
(6, 429, 100),
(6, 430, 100),
(6, 431, 100),
(6, 432, 100),
(6, 433, 100),
(6, 434, 100),
(6, 435, 100),
(6, 436, 100),
(6, 437, 100),
(6, 438, 100),
(6, 439, 100),
(6, 440, 100),
(6, 441, 100),
(6, 442, 100),
(6, 443, 100),
(6, 194, 100),
(6, 444, 100),
(6, 445, 100),
(6, 446, 100),
(6, 185, 100),
(6, 447, 100),
(6, 193, 100),
(6, 448, 100),
(6, 189, 100),
(6, 449, 100),
(6, 450, 100),
(6, 451, 100),
(6, 452, 100),
(6, 187, 100),
(6, 182, 100),
(6, 453, 100),
(6, 454, 100),
(6, 259, 100),
(6, 455, 100),
(6, 285, 100),
(6, 456, 100),
(6, 457, 100),
(6, 458, 100),
(6, 459, 100),
(6, 460, 100),
(6, 461, 100),
(6, 462, 100),
(6, 463, 100),
(6, 464, 100),
(6, 465, 100),
(6, 466, 100),
(6, 467, 100),
(6, 468, 100),
(6, 469, 100),
(6, 470, 100),
(6, 471, 100),
(6, 472, 100),
(6, 473, 100),
(6, 196, 100),
(6, 186, 100),
(6, 474, 100),
(6, 475, 100),
(6, 476, 100),
(6, 191, 100),
(6, 477, 100),
(6, 478, 100),
(6, 479, 100),
(6, 480, 100),
(6, 481, 100),
(6, 482, 100),
(6, 483, 100),
(6, 484, 100),
(6, 485, 100),
(6, 486, 100),
(6, 487, 100),
(6, 488, 100),
(6, 489, 100),
(6, 490, 100),
(7, 491, 100),
(7, 252, 100),
(7, 492, 100),
(7, 493, 100),
(7, 215, 100),
(7, 494, 100),
(7, 495, 100),
(7, 496, 100),
(7, 497, 100),
(7, 220, 100),
(7, 498, 100),
(7, 499, 100),
(7, 500, 100),
(7, 501, 100),
(7, 502, 100),
(7, 237, 100),
(7, 239, 100),
(7, 503, 100),
(7, 504, 100),
(7, 233, 100),
(7, 505, 100),
(7, 238, 100),
(7, 506, 100),
(7, 507, 100),
(7, 232, 100),
(7, 508, 100),
(7, 219, 100),
(7, 509, 100),
(7, 510, 100),
(7, 231, 100),
(7, 511, 100),
(7, 512, 100),
(7, 513, 100),
(7, 514, 100),
(7, 515, 100),
(7, 516, 100),
(7, 517, 100),
(7, 518, 100),
(7, 519, 100),
(7, 520, 100),
(7, 521, 100),
(7, 240, 100),
(7, 522, 100),
(7, 523, 100),
(7, 524, 100),
(7, 525, 100),
(7, 526, 100),
(7, 527, 100),
(7, 528, 100),
(7, 529, 100),
(7, 530, 100),
(7, 531, 100),
(7, 218, 100),
(7, 532, 100),
(7, 533, 100),
(7, 534, 100),
(7, 535, 100),
(7, 536, 100),
(7, 537, 100),
(7, 538, 100),
(7, 224, 100),
(7, 539, 100),
(7, 540, 100),
(7, 541, 100),
(8, 542, 100),
(8, 543, 100),
(8, 544, 100),
(8, 545, 100),
(8, 546, 100),
(8, 547, 100),
(8, 548, 100),
(8, 549, 100),
(8, 550, 100),
(8, 551, 100),
(8, 552, 100),
(8, 553, 100),
(8, 554, 100),
(8, 555, 100),
(8, 556, 100),
(8, 557, 100),
(8, 558, 100),
(8, 559, 100),
(8, 560, 100),
(8, 561, 100),
(8, 562, 100),
(8, 563, 100),
(8, 564, 100),
(8, 565, 100),
(8, 566, 100),
(8, 567, 100),
(8, 568, 100),
(8, 569, 100),
(8, 570, 100),
(8, 571, 100),
(8, 572, 100),
(8, 573, 100),
(8, 574, 100),
(8, 575, 100),
(8, 576, 100),
(8, 577, 100),
(8, 578, 100),
(8, 579, 100),
(8, 580, 100),
(8, 581, 100),
(8, 582, 100),
(8, 583, 100),
(8, 584, 100),
(8, 585, 100),
(8, 586, 100),
(8, 587, 100),
(8, 588, 100),
(8, 589, 100),
(8, 590, 100),
(8, 591, 100),
(8, 592, 100),
(8, 593, 100),
(8, 594, 100),
(8, 595, 100),
(8, 596, 100),
(8, 597, 100),
(8, 598, 100),
(8, 599, 100),
(8, 600, 100),
(8, 601, 100),
(8, 602, 100),
(8, 603, 100),
(8, 604, 100),
(8, 259, 100),
(8, 605, 100),
(8, 606, 100),
(8, 607, 100),
(8, 608, 100),
(8, 609, 100),
(8, 610, 100),
(8, 611, 100),
(8, 612, 100),
(8, 473, 100),
(8, 613, 100),
(8, 614, 100),
(8, 615, 100),
(8, 616, 100),
(8, 617, 100),
(8, 618, 100),
(8, 619, 100),
(8, 274, 100),
(8, 620, 100),
(8, 277, 100),
(8, 621, 100),
(8, 266, 100),
(8, 622, 100),
(8, 623, 100),
(8, 624, 100),
(8, 625, 100),
(8, 626, 100),
(8, 627, 100),
(8, 628, 100),
(8, 629, 100),
(8, 630, 100),
(8, 631, 100),
(8, 632, 100),
(8, 633, 100),
(8, 634, 100),
(8, 635, 100),
(8, 636, 100),
(8, 637, 100),
(8, 638, 100),
(8, 639, 100),
(8, 640, 100),
(8, 641, 100),
(8, 642, 100),
(8, 643, 100),
(8, 644, 100),
(8, 645, 100),
(8, 646, 100),
(8, 647, 100),
(8, 648, 100),
(8, 649, 100),
(8, 650, 100),
(8, 651, 100),
(8, 652, 100),
(8, 653, 100),
(8, 654, 100),
(8, 263, 100),
(8, 655, 100),
(8, 656, 100),
(8, 657, 100),
(8, 658, 100),
(8, 265, 100),
(8, 659, 100),
(8, 269, 100),
(8, 264, 100),
(8, 660, 100),
(8, 661, 100),
(8, 662, 100),
(8, 663, 100),
(8, 664, 100),
(8, 665, 100),
(8, 666, 100),
(8, 667, 100),
(8, 668, 100),
(8, 669, 100),
(8, 670, 100),
(8, 671, 100),
(8, 672, 100),
(8, 673, 100),
(8, 674, 100),
(8, 675, 100),
(8, 676, 100),
(8, 677, 100),
(8, 678, 100),
(8, 679, 100),
(8, 680, 100),
(8, 681, 100),
(8, 682, 100),
(8, 683, 100),
(8, 466, 100),
(8, 684, 100),
(8, 685, 100),
(8, 686, 100),
(8, 261, 100),
(8, 687, 100),
(8, 688, 100),
(8, 689, 100),
(8, 268, 100),
(8, 690, 100),
(8, 691, 100),
(8, 692, 100),
(8, 693, 100),
(8, 694, 100),
(8, 695, 100),
(8, 696, 100),
(8, 697, 100),
(8, 698, 100),
(8, 699, 100),
(8, 700, 100),
(8, 701, 100),
(8, 702, 100),
(8, 703, 100),
(8, 704, 100),
(8, 705, 100),
(8, 706, 100),
(8, 707, 100),
(8, 708, 100),
(8, 709, 100),
(8, 710, 100),
(8, 711, 100),
(8, 712, 100),
(8, 713, 100),
(8, 714, 100),
(8, 715, 100),
(8, 716, 100),
(8, 717, 100),
(8, 718, 100),
(8, 719, 100),
(8, 285, 100),
(8, 720, 100),
(8, 281, 100),
(8, 721, 100),
(8, 153, 100),
(8, 722, 100),
(8, 723, 100),
(8, 724, 100),
(8, 725, 100),
(8, 726, 100),
(8, 727, 100),
(8, 278, 100),
(8, 728, 100),
(8, 729, 100),
(8, 730, 100),
(8, 731, 100),
(8, 732, 100),
(8, 733, 100),
(8, 734, 100),
(8, 735, 100),
(8, 161, 100),
(8, 736, 100),
(8, 737, 100),
(8, 738, 100),
(8, 739, 100),
(8, 740, 100),
(8, 741, 100),
(8, 742, 100),
(8, 743, 100),
(8, 744, 100),
(8, 745, 100),
(8, 746, 100),
(8, 747, 100),
(2, 748, 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_goods_tags`
--

CREATE TABLE IF NOT EXISTS `fanwe_goods_tags` (
  `tag_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) DEFAULT NULL,
  `tag_code` varchar(100) NOT NULL DEFAULT '',
  `sort` smallint(5) NOT NULL DEFAULT '100',
  `is_hot` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_code` (`tag_code`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=803 ;

--
-- 转存表中的数据 `fanwe_goods_tags`
--

INSERT INTO `fanwe_goods_tags` (`tag_id`, `tag_name`, `tag_code`, `sort`, `is_hot`, `count`) VALUES
(1, '欧美', '欧美', 100, 1, 206),
(2, '复古', '复古', 100, 1, 4407),
(3, '海军', '海军', 100, 0, 53),
(4, '度假', '度假', 100, 0, 12),
(5, '日系', '日系', 100, 1, 704),
(6, '田园', '田园', 100, 1, 606),
(7, '清新', '清新', 100, 0, 60),
(8, '休闲', '休闲', 100, 1, 715),
(9, '波西米亚', '波西米亚', 100, 1, 207),
(10, 'T恤', 'T恤', 100, 1, 104),
(11, '背心', '背心', 100, 1, 339),
(12, '凉鞋', '凉鞋', 100, 1, 811),
(13, '拖鞋', '拖鞋', 100, 1, 399),
(14, '短裤', '短裤', 100, 1, 422),
(15, '半身裙', '半身裙', 100, 1, 137),
(16, '衬衫', '衬衫', 100, 0, 66),
(17, '连衣裙', '连衣裙', 100, 1, 171),
(18, '帽子', '帽子', 100, 1, 191),
(19, '坡跟鞋', '坡跟鞋', 100, 0, 4),
(20, '短袖', '短袖', 100, 1, 785),
(21, '连体裤', '连体裤', 100, 1, 181),
(22, '罩衫', '罩衫', 100, 0, 79),
(23, '帆布鞋', '帆布鞋', 100, 1, 237),
(24, '长裙', '长裙', 100, 1, 166),
(25, '罗马鞋', '罗马鞋', 100, 0, 10),
(26, '泳衣', '泳衣', 100, 0, 0),
(27, '单肩包', '单肩包', 100, 1, 832),
(28, '钱包', '钱包', 100, 1, 592),
(29, '防晒衣', '防晒衣', 100, 0, 0),
(30, '夏日美包', '夏日美包', 100, 0, 5),
(31, '七夕', '七夕', 100, 1, 136),
(32, '波点', '波点', 100, 1, 550),
(33, '显瘦', '显瘦', 100, 1, 167),
(34, '字母', '字母', 100, 1, 151),
(35, '雪纺', '雪纺', 100, 1, 478),
(36, '条纹', '条纹', 100, 1, 581),
(37, '厚底', '厚底', 100, 1, 435),
(38, '荧光色', '荧光色', 100, 0, 5),
(39, '露肩', '露肩', 100, 0, 35),
(40, '动物纹', '动物纹', 100, 0, 0),
(41, '印花', '印花', 100, 1, 348),
(42, '糖果色', '糖果色', 100, 1, 558),
(43, '蓝精灵', '蓝精灵', 100, 0, 19),
(44, 'lena同款', 'lena同款', 100, 0, 0),
(45, '星座', '星座', 100, 0, 1),
(46, '轻松熊', '轻松熊', 100, 1, 489),
(47, '城市猎人', '城市猎人', 100, 0, 4),
(48, '西瓜', '西瓜', 100, 1, 112),
(49, '街拍', '街拍', 100, 0, 17),
(50, '兔子', '兔子', 100, 1, 459),
(51, '大嘴猴', '大嘴猴', 100, 1, 102),
(52, '猫头鹰', '猫头鹰', 100, 0, 59),
(53, '徐濠萦', '徐濠萦', 100, 0, 80),
(54, '绯闻女孩', '绯闻女孩', 100, 0, 38),
(55, 'vivi同款', 'vivi同款', 100, 0, 0),
(56, 'hello kitty', 'hello kitty', 100, 0, 0),
(57, '防晒衫', '防晒衫', 100, 0, 0),
(58, '透视装', '透视装', 100, 0, 2),
(59, '雪纺衫', '雪纺衫', 100, 0, 32),
(60, '简约', '简约', 100, 1, 527),
(61, '卡通', '卡通', 100, 1, 970),
(62, 'BF风', 'BF风', 100, 0, 0),
(63, '撞色', '撞色', 100, 1, 348),
(64, '拼接', '拼接', 100, 1, 300),
(65, '蕾丝', '蕾丝', 100, 1, 971),
(66, '钩花', '钩花', 100, 0, 36),
(67, '军装', '军装', 100, 0, 5),
(68, '透视', '透视', 100, 0, 0),
(69, 'OL', 'OL', 100, 1, 164),
(70, '公主', '公主', 100, 1, 808),
(71, '森系', '森系', 100, 0, 16),
(72, '学院', '学院', 100, 0, 49),
(73, '中性', '中性', 100, 0, 94),
(74, '英伦', '英伦', 100, 1, 177),
(75, '娃娃衫', '娃娃衫', 100, 0, 19),
(76, 'T裙', 'T裙', 100, 0, 0),
(77, '马甲', '马甲', 100, 0, 15),
(78, '露肩T', '露肩T', 100, 0, 2),
(79, '短T', '短T', 100, 0, 7),
(80, '文胸', '文胸', 100, 0, 14),
(81, '小可爱', '小可爱', 100, 0, 0),
(82, '睡衣', '睡衣', 100, 0, 18),
(83, '家居服', '家居服', 100, 0, 6),
(84, '美体衣', '美体衣', 100, 0, 0),
(85, '碎花', '碎花', 100, 1, 438),
(86, '做旧', '做旧', 100, 0, 19),
(87, '卡其', '卡其', 100, 0, 1),
(88, '百搭', '百搭', 100, 1, 740),
(89, '破洞', '破洞', 100, 1, 133),
(90, '星条旗', '星条旗', 100, 0, 0),
(91, '运动裤', '运动裤', 100, 0, 9),
(92, '卡其裤', '卡其裤', 100, 0, 4),
(93, '迷你裙', '迷你裙', 100, 0, 2),
(94, '直筒裤', '直筒裤', 100, 0, 3),
(95, '纱裙', '纱裙', 100, 0, 20),
(96, '铅笔裤', '铅笔裤', 100, 0, 31),
(97, '休闲裤', '休闲裤', 100, 0, 67),
(98, '哈伦裤', '哈伦裤', 100, 1, 160),
(99, '蓬蓬裙', '蓬蓬裙', 100, 0, 22),
(100, '阔腿裤', '阔腿裤', 100, 0, 9),
(101, '牛仔裙', '牛仔裙', 100, 0, 0),
(102, '高腰', '高腰', 100, 1, 186),
(103, '垮裤', '垮裤', 100, 0, 22),
(104, '七分裤', '七分裤', 100, 0, 59),
(105, '九分裤', '九分裤', 100, 0, 48),
(106, '五分裤', '五分裤', 100, 0, 11),
(107, '背带裤', '背带裤', 100, 0, 64),
(108, '洞洞鞋', '洞洞鞋', 100, 0, 1),
(109, '靴子', '靴子', 100, 0, 40),
(110, '单鞋', '单鞋', 100, 1, 493),
(111, '娃娃鞋', '娃娃鞋', 100, 0, 30),
(112, '板鞋', '板鞋', 100, 0, 40),
(113, '果冻鞋', '果冻鞋', 100, 0, 6),
(114, '雨鞋', '雨鞋', 100, 0, 45),
(115, '家居鞋', '家居鞋', 100, 0, 23),
(116, '松糕鞋', '松糕鞋', 100, 0, 30),
(117, '摇摇鞋', '摇摇鞋', 100, 0, 9),
(118, '平底鞋', '平底鞋', 100, 1, 132),
(119, '人字拖', '人字拖', 100, 1, 115),
(120, '平跟', '平跟', 100, 0, 69),
(121, '高跟', '高跟', 100, 1, 176),
(122, '粗跟', '粗跟', 100, 0, 51),
(123, '坡跟', '坡跟', 100, 1, 385),
(124, '低帮', '低帮', 100, 0, 21),
(125, '高帮', '高帮', 100, 0, 63),
(126, '鱼嘴', '鱼嘴', 100, 1, 197),
(127, '圆头', '圆头', 100, 0, 49),
(128, '尖头', '尖头', 100, 0, 55),
(129, '防水台', '防水台', 100, 1, 133),
(130, '罗马', '罗马', 100, 0, 5),
(131, '裸色', '裸色', 100, 1, 288),
(132, '草编', '草编', 100, 1, 210),
(133, '木底', '木底', 100, 0, 4),
(134, '镂空', '镂空', 100, 1, 413),
(135, '豹纹', '豹纹', 100, 1, 455),
(136, '花朵', '花朵', 100, 1, 625),
(137, '复古英伦', '复古英伦', 100, 0, 1),
(138, '恋爱七夕', '恋爱七夕', 100, 0, 0),
(139, '匡威', '匡威', 100, 0, 10),
(140, 'adidas', 'adidas', 100, 0, 2),
(141, '小辣椒', '小辣椒', 100, 0, 1),
(142, '踏浪海滩', '踏浪海滩', 100, 0, 0),
(143, '糖果季', '糖果季', 100, 0, 0),
(144, '小清新', '小清新', 100, 0, 24),
(145, '布洛克', '布洛克', 100, 0, 4),
(146, 'Brogue', 'Brogue', 100, 0, 0),
(147, '旅行箱', '旅行箱', 100, 0, 11),
(148, '手提包', '手提包', 100, 1, 500),
(149, '斜挎包', '斜挎包', 100, 1, 541),
(150, '双肩包', '双肩包', 100, 1, 186),
(151, '手拿包', '手拿包', 100, 1, 220),
(152, '相机包', '相机包', 100, 1, 104),
(153, '卡包', '卡包', 100, 1, 150),
(154, '零钱包', '零钱包', 100, 1, 294),
(155, '托特包', '托特包', 100, 0, 0),
(156, '信封包', '信封包', 100, 0, 25),
(157, '邮差包', '邮差包', 100, 1, 110),
(158, '草编包', '草编包', 100, 0, 25),
(159, '链条包', '链条包', 100, 1, 171),
(160, '公文包', '公文包', 100, 1, 120),
(161, '环保袋', '环保袋', 100, 0, 40),
(162, '机车包', '机车包', 100, 0, 44),
(163, '水桶包', '水桶包', 100, 0, 52),
(164, '帆布包', '帆布包', 100, 1, 126),
(165, '通勤', '通勤', 100, 0, 3),
(166, '牛仔', '牛仔', 100, 1, 396),
(167, '漆皮', '漆皮', 100, 1, 160),
(168, '格纹', '格纹', 100, 0, 28),
(169, '菱格', '菱格', 100, 0, 35),
(170, '流苏', '流苏', 100, 1, 398),
(171, '铆钉', '铆钉', 100, 1, 295),
(172, '鳄鱼纹', '鳄鱼纹', 100, 0, 42),
(173, '创意包包', '创意包包', 100, 0, 2),
(174, '鸵鸟纹', '鸵鸟纹', 100, 0, 19),
(175, '购物袋', '购物袋', 100, 0, 14),
(176, '大牌同款', '大牌同款', 100, 0, 7),
(177, '迷你包包', '迷你包包', 100, 0, 0),
(178, '手机袋', '手机袋', 100, 0, 33),
(179, 'IT', 'IT', 100, 0, 0),
(180, 'Bag', 'Bag', 100, 0, 0),
(181, '鸭舌帽', '鸭舌帽', 100, 0, 24),
(182, '发饰', '发饰', 100, 0, 20),
(183, '丝巾', '丝巾', 100, 0, 84),
(184, '镜框', '镜框', 100, 0, 21),
(185, '项链', '项链', 100, 1, 1343),
(186, '耳钉', '耳钉', 100, 1, 537),
(187, '胸针', '胸针', 100, 1, 124),
(188, '腰带', '腰带', 100, 1, 183),
(189, '手链', '手链', 100, 1, 578),
(190, '发带', '发带', 100, 0, 15),
(191, '手表', '手表', 100, 1, 387),
(192, '手镯 戒指', '手镯 戒指', 100, 0, 0),
(193, '吊坠', '吊坠', 100, 1, 244),
(194, '草帽', '草帽', 100, 0, 4),
(195, '墨镜', '墨镜', 100, 1, 126),
(196, '耳环', '耳环', 100, 1, 334),
(197, '蓝色幻想', '蓝色幻想', 100, 0, 1),
(198, 'Zakka', 'Zakka', 100, 1, 131),
(199, '手作', '手作', 100, 0, 20),
(200, '海洋', '海洋', 100, 0, 11),
(201, '卖萌', '卖萌', 100, 0, 25),
(202, 'ROCK', 'ROCK', 100, 0, 2),
(203, 'SWATCH', 'SWATCH', 100, 0, 2),
(204, '施华洛世奇', '施华洛世奇', 100, 1, 141),
(205, '奈良美智', '奈良美智', 100, 0, 0),
(206, '羽毛', '羽毛', 100, 0, 91),
(207, '陶饰', '陶饰', 100, 0, 4),
(208, '水晶', '水晶', 100, 1, 683),
(209, '珍珠', '珍珠', 100, 1, 614),
(210, '心心相印', '心心相印', 100, 0, 3),
(211, '编织', '编织', 100, 1, 283),
(212, '玫瑰金', '玫瑰金', 100, 0, 76),
(213, '天使之翼', '天使之翼', 100, 0, 22),
(214, '清洁', '清洁', 100, 1, 267),
(215, '爽肤水', '爽肤水', 100, 1, 183),
(216, '喷雾', '喷雾', 100, 1, 355),
(217, '精华素', '精华素', 100, 0, 12),
(218, '去角质', '去角质', 100, 0, 12),
(219, '唇膏', '唇膏', 100, 1, 349),
(220, '面膜', '面膜', 100, 1, 1343),
(221, '乳霜', '乳霜', 100, 0, 48),
(222, '眼霜', '眼霜', 100, 1, 191),
(223, '眼唇膜', '眼唇膜', 100, 0, 0),
(224, '防晒', '防晒', 100, 1, 594),
(225, '隔离', '隔离', 100, 1, 121),
(226, '保湿', '保湿', 100, 1, 1669),
(227, '美白', '美白', 100, 1, 1340),
(228, '祛痘', '祛痘', 100, 1, 323),
(229, '控油', '控油', 100, 0, 22),
(230, '美甲', '美甲', 100, 1, 601),
(231, '香水', '香水', 100, 1, 707),
(232, '唇彩', '唇彩', 100, 1, 287),
(233, '腮红', '腮红', 100, 1, 256),
(234, '睫毛膏', '睫毛膏', 100, 1, 211),
(235, '眼影', '眼影', 100, 1, 376),
(236, '眼线', '眼线', 100, 0, 1),
(237, 'BB霜', 'BB霜', 100, 0, 37),
(238, '蜜粉', '蜜粉', 100, 0, 93),
(239, '粉底', '粉底', 100, 0, 93),
(240, '化妆刷', '化妆刷', 100, 1, 100),
(241, 'MAC', 'MAC', 100, 0, 84),
(242, '资生堂', '资生堂', 100, 1, 219),
(243, '嘉娜宝', '嘉娜宝', 100, 0, 98),
(244, 'KOSE', 'KOSE', 100, 0, 0),
(245, '贝玲妃', '贝玲妃', 100, 1, 103),
(246, '水宝宝', '水宝宝', 100, 0, 7),
(247, '倩碧', '倩碧', 100, 0, 79),
(248, '露得清', '露得清', 100, 0, 54),
(249, 'Kiehl''s', 'Kiehl''s', 100, 0, 1),
(250, '爱丽小屋', '爱丽小屋', 100, 0, 16),
(251, '雅漾', '雅漾', 100, 0, 68),
(252, '卸妆', '卸妆', 100, 1, 136),
(253, '手工皂', '手工皂', 100, 1, 343),
(254, '毛孔', '毛孔', 100, 0, 3),
(255, '药妆', '药妆', 100, 0, 5),
(256, '抱枕', '抱枕', 100, 1, 515),
(257, '玩偶', '玩偶', 100, 1, 166),
(258, '灯饰', '灯饰', 100, 0, 12),
(259, '摆件', '摆件', 100, 1, 256),
(260, '厨具', '厨具', 100, 0, 12),
(261, '餐具', '餐具', 100, 1, 232),
(262, '伞', '伞', 100, 0, 5),
(263, '闹钟', '闹钟', 100, 0, 6),
(264, '马克杯', '马克杯', 100, 1, 258),
(265, '杯具', '杯具', 100, 0, 13),
(266, '储蓄罐', '储蓄罐', 100, 0, 89),
(267, '铁盒', '铁盒', 100, 1, 236),
(268, '密封罐', '密封罐', 100, 0, 31),
(269, '保温杯', '保温杯', 100, 0, 12),
(270, '玻璃器皿', '玻璃器皿', 100, 0, 2),
(271, '创意礼品', '创意礼品', 100, 0, 8),
(272, '笔', '笔', 100, 0, 6),
(273, '笔记本', '笔记本', 100, 1, 314),
(274, '相册', '相册', 100, 1, 162),
(275, '明信片', '明信片', 100, 1, 171),
(276, '笔袋', '笔袋', 100, 1, 148),
(277, '钥匙扣', '钥匙扣', 100, 1, 181),
(278, '笔筒', '笔筒', 100, 0, 5),
(279, '贴纸', '贴纸&胶带', 100, 1, 305),
(280, '胶带', '胶带', 100, 0, 80),
(281, '纸巾盒', '纸巾盒', 100, 0, 70),
(282, '橱柜', '橱柜', 100, 0, 0),
(283, '收纳箱', '收纳箱', 100, 0, 9),
(284, '眼镜盒', '眼镜盒', 100, 0, 0),
(285, '首饰盒', '首饰盒', 100, 1, 162),
(286, '保护壳', '保护壳', 100, 1, 163),
(287, '相机', '相机', 100, 1, 262),
(288, '拍立得', '拍立得', 100, 0, 47),
(289, '電話', '電話', 100, 0, 0),
(290, 'LOMO', 'LOMO', 100, 1, 108),
(291, '耳机', '耳机', 100, 1, 134),
(292, '手机链', '手机链', 100, 1, 489),
(293, '长袖T恤', '长袖T恤', 100, 0, 0),
(294, '针织衫', '针织衫', 100, 0, 6),
(295, '毛衣', '毛衣', 100, 0, 4),
(296, '风衣', '风衣', 100, 0, 1),
(297, '短外套', '短外套', 100, 0, 0),
(298, '卫衣', '卫衣', 100, 0, 0),
(299, '西装', '西装', 100, 0, 2),
(300, '马夹', '马夹', 100, 0, 1),
(301, '皮衣', '皮衣', 100, 0, 0),
(302, '机车夹克', '机车夹克', 100, 0, 0),
(303, '背心裙', '背心裙', 100, 0, 0),
(304, '花苞裙', '花苞裙', 100, 0, 0),
(305, '吊带衫', '吊带衫', 100, 0, 0),
(306, '吊带裙', '吊带裙', 100, 0, 0),
(307, '短袖T恤', '短袖T恤', 100, 0, 0),
(308, '中老年服装', '中老年服装', 100, 0, 0),
(309, '婚纱', '婚纱', 100, 0, 0),
(310, '礼服', '礼服', 100, 0, 0),
(311, '旗袍', '旗袍', 100, 0, 0),
(312, '职业套装', '职业套装', 100, 0, 0),
(313, '工作制服', '工作制服', 100, 0, 0),
(314, '校服', '校服', 100, 0, 0),
(315, '唐装', '唐装', 100, 0, 0),
(316, '民族服装', '民族服装', 100, 0, 0),
(317, '舞台服装', '舞台服装', 100, 0, 0),
(318, '休闲套装', '休闲套装', 100, 0, 0),
(319, '孕妇装', '孕妇装', 100, 0, 0),
(320, '秋冬装', '秋冬装', 100, 0, 0),
(321, '蕾丝T', '蕾丝T', 100, 0, 0),
(322, '海魂衫', '海魂衫', 100, 0, 0),
(323, '小西装', '小西装', 100, 0, 0),
(324, '小披肩', '小披肩', 100, 0, 0),
(325, '加长T', '加长T', 100, 0, 0),
(326, '正装裙', '正装裙', 100, 0, 0),
(327, '雪纺裙', '雪纺裙', 99, 0, 1),
(328, 'POLO衫', 'POLO衫', 100, 0, 0),
(329, '长袖衬衫', '长袖衬衫', 100, 0, 0),
(330, '长袖POLO衫', '长袖POLO衫', 100, 0, 0),
(331, '套头卫衣', '套头卫衣', 100, 0, 0),
(332, '套衫毛衣', '套衫毛衣', 100, 0, 0),
(333, '开衫毛衣', '开衫毛衣', 100, 0, 0),
(334, '羊绒毛衣', '羊绒毛衣', 100, 0, 0),
(335, '开衫卫衣', '开衫卫衣', 100, 0, 0),
(336, '夹克', '夹克', 100, 0, 3),
(337, '立领夹克', '立领夹克', 100, 0, 1),
(338, '休闲西服', '休闲西服', 100, 0, 0),
(339, '真皮皮衣', '真皮皮衣', 100, 0, 0),
(340, '仿皮皮衣', '仿皮皮衣', 100, 0, 0),
(341, '毛呢大衣', '毛呢大衣', 100, 0, 0),
(342, '中长棉衣', '中长棉衣', 100, 0, 0),
(343, '短款棉衣', '短款棉衣', 100, 0, 0),
(344, '短款羽绒服', '短款羽绒服', 100, 0, 0),
(345, '中长羽绒服', '中长羽绒服', 100, 0, 0),
(346, '短袖POLO衫', '短袖POLO衫', 100, 0, 0),
(347, '短袖衬衫', '短袖衬衫', 100, 0, 0),
(348, '西服套装', '西服套装', 100, 0, 0),
(349, '西裤', '西裤', 100, 0, 0),
(350, '大码专区', '大码专区', 100, 0, 0),
(351, '西服正装', '西服正装', 100, 0, 0),
(352, '工装制服', '工装制服', 100, 0, 0),
(353, '内衣', '内衣', 100, 0, 0),
(354, '休闲长裤', '休闲长裤', 100, 0, 0),
(355, '打底裤', '打底裤', 100, 0, 7),
(356, '中裤', '中裤', 100, 0, 0),
(357, '灯笼裤', '灯笼裤', 100, 0, 0),
(358, '微喇裤', '微喇裤', 100, 0, 0),
(359, '小脚裤', '小脚裤', 100, 0, 1),
(360, '工装裤', '工装裤', 100, 0, 0),
(361, '连身裤', '连身裤', 100, 0, 0),
(362, '牛仔裤', '牛仔裤', 100, 0, 1),
(363, '热裤', '热裤', 100, 0, 0),
(364, '靴裤', '靴裤', 100, 0, 0),
(365, '牛仔短裤', '牛仔短裤', 100, 0, 0),
(366, '休闲短裤', '休闲短裤', 100, 0, 0),
(367, '长裤', '长裤', 100, 0, 1),
(368, '牛仔长裤', '牛仔长裤', 100, 0, 0),
(369, '大PP裤', '大PP裤', 100, 0, 0),
(370, '皮裤', '皮裤', 100, 0, 0),
(371, '凉拖', '凉拖', 100, 0, 0),
(372, '鱼嘴鞋', '鱼嘴鞋', 100, 0, 0),
(373, '高跟鞋', '高跟鞋', 100, 0, 0),
(374, '厚底鞋', '厚底鞋', 100, 0, 0),
(375, '内增高鞋', '内增高鞋', 100, 0, 0),
(376, '高帮鞋', '高帮鞋', 100, 0, 0),
(377, '休闲鞋', '休闲鞋', 100, 0, 0),
(378, '休闲皮鞋', '休闲皮鞋', 100, 0, 0),
(379, '正装皮鞋', '正装皮鞋', 100, 0, 0),
(380, '增高鞋', '增高鞋', 100, 0, 0),
(381, '工装靴', '工装靴', 100, 0, 0),
(382, '牛仔靴', '牛仔靴', 100, 0, 0),
(383, '坡跟单鞋', '坡跟单鞋', 100, 0, 0),
(384, '短靴', '短靴', 100, 0, 0),
(385, '中筒靴', '中筒靴', 100, 0, 0),
(386, '雪地靴', '雪地靴', 100, 0, 0),
(387, '皮鞋', '皮鞋', 100, 0, 0),
(388, '女包', '女包', 100, 0, 2),
(389, '真皮包', '真皮包', 100, 0, 0),
(390, 'PU女包', 'PU女包', 100, 0, 0),
(391, '流苏包', '流苏包', 100, 0, 0),
(392, '铆钉包', '铆钉包', 100, 0, 0),
(393, '蝴蝶结包', '蝴蝶结包', 100, 0, 0),
(394, '奢华包', '奢华包', 100, 0, 0),
(395, '品质包', '品质包', 100, 0, 0),
(396, '单肩', '单肩', 100, 0, 0),
(397, '双肩', '双肩', 100, 0, 0),
(398, '手提', '手提', 100, 0, 1),
(399, '斜挎', '斜挎', 100, 0, 0),
(400, '单肩斜跨', '单肩斜跨', 100, 0, 0),
(401, '腰包', '腰包', 100, 0, 0),
(402, '钥匙包', '钥匙包', 100, 0, 0),
(403, '男包', '男包', 100, 0, 0),
(404, '胸包', '胸包', 100, 0, 0),
(405, '编织包', '编织包', 100, 0, 0),
(406, '格纹包', '格纹包', 100, 0, 0),
(407, '豹纹包', '豹纹包', 100, 0, 0),
(408, '复古包', '复古包', 100, 0, 0),
(409, '拉杆箱', '拉杆箱', 100, 0, 0),
(410, '登机箱', '登机箱', 100, 0, 0),
(411, '托运箱', '托运箱', 100, 0, 0),
(412, '旅行包', '旅行包', 100, 0, 0),
(413, '运动背包', '运动背包', 100, 0, 0),
(414, '帆布背包', '帆布背包', 100, 0, 0),
(415, '单肩背包', '单肩背包', 100, 0, 0),
(416, '休闲钱包', '休闲钱包', 100, 0, 0),
(417, '帆布腰包', '帆布腰包', 100, 0, 0),
(418, '女士配件', '女士配件', 100, 0, 0),
(419, '宽腰带', '宽腰带', 100, 0, 0),
(420, '腰封', '腰封', 100, 0, 0),
(421, '腰链', '腰链', 100, 0, 0),
(422, '棒球帽', '棒球帽', 100, 0, 0),
(423, '贝雷帽', '贝雷帽', 100, 0, 0),
(424, '遮阳帽', '遮阳帽', 100, 0, 0),
(425, '围巾', '围巾', 100, 0, 1),
(426, '头巾', '头巾', 100, 0, 1),
(427, '手帕', '手帕', 100, 0, 0),
(428, '背带', '背带', 100, 0, 0),
(429, '运动颈环', '运动颈环', 100, 0, 0),
(430, '面料', '面料', 100, 0, 0),
(431, '服装配件', '服装配件', 100, 0, 0),
(432, '婚纱配件', '婚纱配件', 100, 0, 0),
(433, '男士配件', '男士配件', 100, 0, 0),
(434, '皮带', '皮带', 100, 0, 0),
(435, '真皮', '真皮', 100, 0, 3),
(436, '针扣', '针扣', 100, 0, 0),
(437, '自动扣', '自动扣', 100, 0, 0),
(438, '平滑扣', '平滑扣', 100, 0, 0),
(439, '双环扣', '双环扣', 100, 0, 0),
(440, '领带', '领带', 100, 0, 0),
(441, '领带夹', '领带夹', 100, 0, 0),
(442, '领结', '领结', 100, 0, 0),
(443, '袖扣', '袖扣', 100, 0, 0),
(444, '大沿帽', '大沿帽', 100, 0, 0),
(445, '防晒手套', '防晒手套', 100, 0, 0),
(446, '空调披肩', '空调披肩', 100, 0, 0),
(447, '项坠', '项坠', 100, 0, 0),
(448, '耳饰', '耳饰', 100, 0, 0),
(449, '手镯', '手镯', 100, 0, 0),
(450, '脚链', '脚链', 100, 0, 0),
(451, '戒指', '戒指', 100, 0, 0),
(452, '指环', '指环', 100, 0, 0),
(453, '眼镜', '眼镜', 100, 0, 0),
(454, '烟具军刀', '烟具军刀', 100, 0, 0),
(455, '饰品', '饰品', 100, 0, 0),
(456, '展示架', '展示架', 100, 0, 0),
(457, '首饰', '首饰', 100, 0, 0),
(458, '银饰', '银饰', 100, 0, 0),
(459, '太阳镜', '太阳镜', 100, 0, 3),
(460, '镜架', '镜架', 100, 0, 0),
(461, '镜片', '镜片', 100, 0, 0),
(462, '军刀', '军刀', 100, 0, 0),
(463, '打火机', '打火机', 100, 0, 1),
(464, 'ZIPPO', 'ZIPPO', 100, 0, 1),
(465, '芝宝', '芝宝', 100, 0, 0),
(466, '酒具', '酒具', 100, 0, 0),
(467, '烟具', '烟具', 100, 0, 0),
(468, '烟斗', '烟斗', 100, 0, 0),
(469, '烟嘴', '烟嘴', 100, 0, 0),
(470, '瑞士军刀', '瑞士军刀', 100, 0, 0),
(471, '对戒', '对戒', 100, 0, 0),
(472, '裸钻', '裸钻', 100, 0, 0),
(473, '挂饰', '挂饰', 100, 0, 0),
(474, '发簪', '发簪', 100, 0, 0),
(475, '玉佩', '玉佩', 100, 0, 0),
(476, '平安扣', '平安扣', 100, 0, 0),
(477, '女表', '女表', 100, 0, 0),
(478, '男表', '男表', 100, 0, 0),
(479, '中性表', '中性表', 100, 0, 0),
(480, '情侣表', '情侣表', 100, 0, 0),
(481, '儿童表', '儿童表', 100, 0, 0),
(482, '怀表', '怀表', 100, 0, 0),
(483, '机械表', '机械表', 100, 0, 0),
(484, '电子表', '电子表', 100, 0, 0),
(485, '时装表', '时装表', 100, 0, 0),
(486, '自动机械表', '自动机械表', 100, 0, 0),
(487, '光能表', '光能表', 100, 0, 0),
(488, '人工动能表', '人工动能表', 100, 0, 0),
(489, '石英表', '石英表', 100, 0, 0),
(490, '对表', '对表', 100, 0, 0),
(491, '护肤', '护肤', 100, 0, 0),
(492, '洁面', '洁面', 100, 0, 0),
(493, '化妆水', '化妆水', 100, 0, 0),
(494, '精华液', '精华液', 100, 0, 0),
(495, '眼部护理', '眼部护理', 100, 0, 0),
(496, '乳液', '乳液', 100, 0, 0),
(497, '面霜', '面霜', 100, 0, 0),
(498, '磨砂膏', '磨砂膏', 100, 0, 0),
(499, '去角质膏', '去角质膏', 100, 0, 0),
(500, '防晒霜', '防晒霜', 100, 0, 0),
(501, '彩妆', '彩妆', 100, 0, 0),
(502, '隔离霜', '隔离霜', 100, 0, 0),
(503, '遮瑕膏', '遮瑕膏', 100, 0, 0),
(504, '粉饼', '粉饼', 100, 0, 0),
(505, '胭脂', '胭脂', 100, 0, 0),
(506, '散粉', '散粉', 100, 0, 0),
(507, '修颜', '修颜', 100, 0, 0),
(508, '唇蜜', '唇蜜', 100, 0, 0),
(509, '口红', '口红', 100, 0, 1),
(510, '指甲油', '指甲油', 100, 0, 0),
(511, '花香调', '花香调', 100, 0, 0),
(512, '花果香', '花果香', 100, 0, 0),
(513, '树木香', '树木香', 100, 0, 0),
(514, '东方香', '东方香', 100, 0, 0),
(515, '海洋香', '海洋香', 100, 0, 0),
(516, '森林香', '森林香', 100, 0, 0),
(517, '混合香', '混合香', 100, 0, 0),
(518, '琥珀香', '琥珀香', 100, 0, 0),
(519, '美容', '美容', 100, 0, 0),
(520, '化妆', '化妆', 100, 0, 0),
(521, '假睫毛', '假睫毛', 100, 0, 0),
(522, '化妆棉', '化妆棉', 100, 0, 0),
(523, '化妆包', '化妆包', 100, 0, 0),
(524, '身体护理', '身体护理', 100, 0, 1),
(525, '假发', '假发', 100, 0, 0),
(526, '身体防晒', '身体防晒', 100, 0, 0),
(527, '身体乳液', '身体乳液', 100, 0, 0),
(528, '脱毛膏', '脱毛膏', 100, 0, 0),
(529, '手部保养', '手部保养', 100, 0, 0),
(530, '胸部护理', '胸部护理', 100, 0, 0),
(531, '瘦身霜', '瘦身霜', 100, 0, 0),
(532, '磨砂', '磨砂', 100, 0, 0),
(533, '洗发', '洗发', 100, 0, 0),
(534, '护发', '护发', 100, 0, 0),
(535, '染烫', '染烫', 100, 0, 0),
(536, '造型', '造型', 100, 0, 0),
(537, '剃须', '剃须', 100, 0, 0),
(538, '须后', '须后', 100, 0, 0),
(539, '沐浴', '沐浴', 100, 0, 0),
(540, '男士彩妆', '男士彩妆', 100, 0, 0),
(541, '护理套装', '护理套装', 100, 0, 0),
(542, '沙发', '沙发', 100, 0, 0),
(543, '电视柜', '电视柜', 100, 0, 0),
(544, '衣柜', '衣柜', 100, 0, 0),
(545, '书柜', '书柜', 100, 0, 0),
(546, '实木床', '实木床', 100, 0, 0),
(547, '皮艺床', '皮艺床', 100, 0, 0),
(548, '高低床', '高低床', 100, 0, 0),
(549, '子母床', '子母床', 100, 0, 0),
(550, '儿童床', '儿童床', 100, 0, 0),
(551, '电脑桌', '电脑桌', 100, 0, 0),
(552, '床垫', '床垫', 100, 0, 0),
(553, '茶几', '茶几', 100, 0, 0),
(554, '家具', '家具', 100, 0, 0),
(555, '餐桌', '餐桌', 100, 0, 0),
(556, '餐椅', '餐椅', 100, 0, 0),
(557, '书桌', '书桌', 100, 0, 0),
(558, '鞋柜', '鞋柜', 100, 0, 0),
(559, '床头柜', '床头柜', 100, 0, 0),
(560, '折叠床', '折叠床', 100, 0, 0),
(561, '午休床', '午休床', 100, 0, 0),
(562, '布艺床', '布艺床', 100, 0, 0),
(563, '搁板', '搁板', 100, 0, 0),
(564, '置物架', '置物架', 100, 0, 0),
(565, '桌椅', '桌椅', 100, 0, 0),
(566, '换鞋凳', '换鞋凳', 100, 0, 0),
(567, '躺椅', '躺椅', 100, 0, 0),
(568, '梳妆台', '梳妆台', 100, 0, 0),
(569, '办公椅', '办公椅', 100, 0, 0),
(570, '货架', '货架', 100, 0, 0),
(571, '展柜', '展柜', 100, 0, 0),
(572, '职员椅', '职员椅', 100, 0, 0),
(573, '电脑椅', '电脑椅', 100, 0, 0),
(574, '办公桌', '办公桌', 100, 0, 0),
(575, '文件柜', '文件柜', 100, 0, 0),
(576, '陈列柜', '陈列柜', 100, 0, 0),
(577, '大班台', '大班台', 100, 0, 0),
(578, '主管台', '主管台', 100, 0, 0),
(579, '布艺', '布艺', 100, 0, 0),
(580, '软饰', '软饰', 100, 0, 0),
(581, '地毯', '地毯', 100, 0, 1),
(582, '地垫', '地垫', 100, 0, 1),
(583, '壁毯', '壁毯', 100, 0, 0),
(584, '挂毯', '挂毯', 100, 0, 0),
(585, '十字绣', '十字绣', 100, 0, 0),
(586, '刺绣', '刺绣', 100, 0, 0),
(587, '布套', '布套', 100, 0, 0),
(588, '桌布', '桌布', 100, 0, 0),
(589, '桌旗', '桌旗', 100, 0, 0),
(590, '靠垫', '靠垫', 100, 0, 0),
(591, '抱枕套', '抱枕套', 100, 0, 0),
(592, '盖巾', '盖巾', 100, 0, 0),
(593, '墙面软包', '墙面软包', 100, 0, 0),
(594, '窗帘', '窗帘', 100, 0, 0),
(595, '卷帘', '卷帘', 100, 0, 0),
(596, '百叶帘', '百叶帘', 100, 0, 0),
(597, '线帘', '线帘', 100, 0, 0),
(598, '门帘', '门帘', 100, 0, 0),
(599, '纱窗', '纱窗', 100, 0, 0),
(600, '浴帘', '浴帘', 100, 0, 0),
(601, '窗帘杆', '窗帘杆', 100, 0, 0),
(602, '画框', '画框', 100, 0, 0),
(603, '无框画', '无框画', 100, 0, 0),
(604, '有框画', '有框画', 100, 0, 0),
(605, '墙贴', '墙贴', 100, 0, 0),
(606, '雕刻工艺', '雕刻工艺', 100, 0, 0),
(607, '花瓶', '花瓶', 100, 0, 0),
(608, '花器', '花器', 100, 0, 0),
(609, '仿真花卉', '仿真花卉', 100, 0, 0),
(610, '蜡烛', '蜡烛', 100, 0, 0),
(611, '烛台', '烛台', 100, 0, 0),
(612, '工艺船', '工艺船', 100, 0, 0),
(613, '壁饰', '壁饰', 100, 0, 0),
(614, '竹碳包', '竹碳包', 100, 0, 0),
(615, '风筝', '风筝', 100, 0, 0),
(616, '中国结', '中国结', 100, 0, 0),
(617, '脸谱', '脸谱', 100, 0, 0),
(618, '雨伞', '雨伞', 100, 0, 0),
(619, '雨披', '雨披', 100, 0, 0),
(620, '烟灰缸', '烟灰缸', 100, 0, 0),
(621, '音乐盒', '音乐盒', 100, 0, 0),
(622, '招财猫', '招财猫', 100, 0, 0),
(623, '阳光罐', '阳光罐', 100, 0, 0),
(624, '幸运星', '幸运星', 100, 0, 0),
(625, '幸运瓶', '幸运瓶', 100, 0, 0),
(626, '扇', '扇', 100, 0, 0),
(627, '体重秤', '体重秤', 100, 0, 0),
(628, '防蚊贴', '防蚊贴', 100, 0, 0),
(629, '手环', '手环', 100, 0, 0),
(630, '电蚊香', '电蚊香', 100, 0, 0),
(631, '灭蚊灯', '灭蚊灯', 100, 0, 0),
(632, '灭鼠剂', '灭鼠剂', 100, 0, 0),
(633, '杀虫剂', '杀虫剂', 100, 0, 0),
(634, '保健枕', '保健枕', 100, 0, 0),
(635, '旅行枕', '旅行枕', 100, 0, 0),
(636, '枕头', '枕头', 100, 0, 1),
(637, '枕芯', '枕芯', 100, 0, 0),
(638, '蚕丝被', '蚕丝被', 100, 0, 0),
(639, '羽绒被', '羽绒被', 100, 0, 0),
(640, '秋冬被', '秋冬被', 100, 0, 0),
(641, '棉被', '棉被', 100, 0, 0),
(642, '羊毛被', '羊毛被', 100, 0, 0),
(643, '毛毯', '毛毯', 100, 0, 0),
(644, '绒毯', '绒毯', 100, 0, 0),
(645, '床褥', '床褥', 100, 0, 0),
(646, '床单', '床单', 100, 0, 0),
(647, '床笠', '床笠', 100, 0, 0),
(648, '被套', '被套', 100, 0, 0),
(649, '被罩', '被罩', 100, 0, 0),
(650, '枕套', '枕套', 100, 0, 0),
(651, '枕巾', '枕巾', 100, 0, 0),
(652, '沙发垫', '沙发垫', 100, 0, 0),
(653, '坐垫', '坐垫', 100, 0, 0),
(654, '棉拖鞋', '棉拖鞋', 100, 0, 0),
(655, '挂钟', '挂钟', 100, 0, 0),
(656, '梳妆镜', '梳妆镜', 100, 0, 0),
(657, '厨房', '厨房', 100, 0, 0),
(658, '保鲜盒', '保鲜盒', 100, 0, 0),
(659, '水壶', '水壶', 100, 0, 0),
(660, '杯具套装', '杯具套装', 100, 0, 0),
(661, '玻璃杯', '玻璃杯', 100, 0, 0),
(662, '碗', '碗', 100, 0, 0),
(663, '碟', '碟', 100, 0, 0),
(664, '盆', '盆', 100, 0, 0),
(665, '盘', '盘', 100, 0, 0),
(666, '筷子', '筷子', 100, 0, 0),
(667, '煎锅', '煎锅', 100, 0, 0),
(668, '平底锅', '平底锅', 100, 0, 0),
(669, '压力锅', '压力锅', 100, 0, 0),
(670, '烹饪', '烹饪', 100, 0, 0),
(671, '勺铲', '勺铲', 100, 0, 0),
(672, '燃气灶', '燃气灶', 100, 0, 0),
(673, '咖啡杯', '咖啡杯', 100, 0, 0),
(674, '酒杯', '酒杯', 100, 0, 0),
(675, '飘逸杯', '飘逸杯', 100, 0, 0),
(676, '茶具', '茶具', 100, 0, 0),
(677, '杯子', '杯子', 100, 0, 0),
(678, '壶', '壶', 100, 0, 0),
(679, '情侣杯', '情侣杯', 100, 0, 0),
(680, '隔热杯', '隔热杯', 100, 0, 0),
(681, '防漏杯', '防漏杯', 100, 0, 0),
(682, '定制杯', '定制杯', 100, 0, 0),
(683, '咖啡器具', '咖啡器具', 100, 0, 0),
(684, '酒壶', '酒壶', 100, 0, 0),
(685, '中西餐具', '中西餐具', 100, 0, 0),
(686, '餐桌小物', '餐桌小物', 100, 0, 0),
(687, '瓷器', '瓷器', 100, 0, 0),
(688, '微波用品', '微波用品', 100, 0, 0),
(689, '饭盒', '饭盒', 100, 0, 0),
(690, '挂钩', '挂钩', 100, 0, 0),
(691, '毛巾', '毛巾', 100, 0, 0),
(692, '浴巾', '浴巾', 100, 0, 0),
(693, '毛巾挂', '毛巾挂', 100, 0, 0),
(694, '毛巾架', '毛巾架', 100, 0, 0),
(695, '沐浴品', '沐浴品', 100, 0, 0),
(696, '沐浴桶', '沐浴桶', 100, 0, 0),
(697, '足浴盆', '足浴盆', 100, 0, 0),
(698, '浴室角架', '浴室角架', 100, 0, 0),
(699, '浴室用品套件', '浴室用品套件', 100, 0, 0),
(700, '浴球', '浴球', 100, 0, 0),
(701, '浴镜', '浴镜', 100, 0, 0),
(702, '牙膏', '牙膏', 100, 0, 0),
(703, '牙膏器', '牙膏器', 100, 0, 0),
(704, '牙刷', '牙刷', 100, 0, 0),
(705, '牙刷架', '牙刷架', 100, 0, 0),
(706, '牙刷座', '牙刷座', 100, 0, 0),
(707, '洗发水', '洗发水', 100, 0, 1),
(708, '足部护理', '足部护理', 100, 0, 0),
(709, '卫生巾', '卫生巾', 100, 0, 0),
(710, '卷筒纸', '卷筒纸', 100, 0, 0),
(711, '收纳', '收纳', 100, 0, 0),
(712, '压缩袋', '压缩袋', 100, 0, 0),
(713, '压缩泵', '压缩泵', 100, 0, 0),
(714, '挂衣架', '挂衣架', 100, 0, 0),
(715, '三角衣架', '三角衣架', 100, 0, 0),
(716, '拖把', '拖把', 100, 0, 0),
(717, '置地', '置地', 100, 0, 0),
(718, '洗衣液', '洗衣液', 100, 0, 0),
(719, '裤架', '裤架', 100, 0, 0),
(720, '收纳盒', '收纳盒', 100, 0, 0),
(721, '纸巾架', '纸巾架', 100, 0, 0),
(722, '卡套', '卡套', 100, 0, 0),
(723, '手机座', '手机座', 100, 0, 0),
(724, '遥控器收纳', '遥控器收纳', 100, 0, 0),
(725, '卫生棉袋', '卫生棉袋', 100, 0, 0),
(726, '药盒', '药盒', 100, 0, 0),
(727, '医药箱', '医药箱', 100, 0, 0),
(728, 'CD盒', 'CD盒', 100, 0, 0),
(729, 'CD架', 'CD架', 100, 0, 0),
(730, '鞋盒', '鞋盒', 100, 0, 0),
(731, '鞋收纳', '鞋收纳', 100, 0, 0),
(732, '电线收纳', '电线收纳', 100, 0, 0),
(733, '擦地拖鞋', '擦地拖鞋', 100, 0, 0),
(734, '桌面除尘扫', '桌面除尘扫', 100, 0, 0),
(735, '扫把簸箕', '扫把簸箕', 100, 0, 0),
(736, '垃圾桶', '垃圾桶', 100, 0, 0),
(737, '垃圾袋', '垃圾袋', 100, 0, 0),
(738, '除尘掸', '除尘掸', 100, 0, 0),
(739, '地板护理', '地板护理', 100, 0, 0),
(740, '玻璃清洁器', '玻璃清洁器', 100, 0, 0),
(741, '护洗袋', '护洗袋', 100, 0, 0),
(742, '洗衣粉', '洗衣粉', 100, 0, 0),
(743, '洗衣皂', '洗衣皂', 100, 0, 0),
(744, '甲醛清除剂', '甲醛清除剂', 100, 0, 0),
(745, '竹炭包', '竹炭包', 100, 0, 0),
(746, '马桶座圈', '马桶座圈', 100, 0, 0),
(747, '洁厕剂', '洁厕剂', 100, 0, 0),
(748, '衬衣', '衬衣', 100, 0, 1),
(749, '开衫', '开衫', 100, 0, 1),
(750, 'leggings', 'leggings', 100, 0, 0),
(751, 'one-piece', 'one-piece', 100, 0, 0),
(752, '秋日', '秋日', 100, 0, 0),
(753, '甜美', '甜美', 100, 0, 1),
(754, '混搭', '混搭', 100, 0, 0),
(755, '广东', '广东', 100, 0, 0),
(756, '浙江', '浙江', 100, 0, 0),
(757, '北京', '北京', 100, 0, 0),
(758, '上海', '上海', 100, 0, 0),
(759, '江苏', '江苏', 100, 0, 0),
(760, '四川', '四川', 100, 0, 0),
(761, '湖北', '湖北', 100, 0, 0),
(762, '沈阳', '沈阳', 100, 0, 0),
(763, '亚洲', '亚洲', 100, 0, 0),
(764, '欧洲', '欧洲', 100, 0, 0),
(765, '北美', '北美', 100, 0, 0),
(766, '澳洲', '澳洲', 100, 0, 0),
(767, '逛街', '逛街', 100, 0, 0),
(768, '居家', '居家', 100, 0, 0),
(769, '上学', '上学', 100, 0, 0),
(770, '户外', '户外', 100, 0, 0),
(771, '约会', '约会', 100, 0, 0),
(772, 'office', 'office', 100, 0, 0),
(773, '美食', '美食', 100, 0, 0),
(774, '美妆', '美妆', 100, 0, 0),
(775, '家居', '家居', 100, 0, 0),
(776, '配饰', '配饰', 100, 0, 1),
(777, '鞋子', '鞋子', 100, 0, 0),
(778, '包包', '包包', 100, 0, 1),
(779, '衣服', '衣服', 100, 0, 0),
(780, 'LV', 'LV', 100, 0, 0),
(781, 'Gucci', 'Gucci', 100, 0, 0),
(782, 'Dior', 'Dior', 100, 0, 0),
(783, 'Chanel', 'Chanel', 100, 0, 0),
(784, 'cartier', 'cartier', 100, 0, 0),
(785, '手机套', '手机套', 100, 0, 0),
(786, 'iphone', 'iphone', 100, 0, 0),
(787, 'Hello', 'Hello', 100, 0, 0),
(788, 'Kitty', 'Kitty', 100, 0, 0),
(789, 'DIY', 'DIY', 100, 0, 0),
(790, '小物', '小物', 100, 0, 0),
(791, '挂件', '挂件', 100, 0, 0),
(792, '萌物', '萌物', 100, 0, 0),
(793, '深圳', '深圳', 100, 0, 0),
(794, '香港', '香港', 100, 0, 0),
(795, '重庆', '重庆', 100, 0, 0),
(796, '湖南', '湖南', 100, 0, 0),
(797, '新加坡', '新加坡', 100, 0, 0),
(798, '加拿大', '加拿大', 100, 0, 0),
(799, '美国', '美国', 100, 0, 0),
(800, '亮色', '亮色', 100, 0, 0),
(801, '格子', '格子', 100, 0, 1),
(802, '短裙', '短裙', 100, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_image_servers`
--

CREATE TABLE IF NOT EXISTS `fanwe_image_servers` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `upload_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `upload_count` (`upload_count`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_image_servers`
--

INSERT INTO `fanwe_image_servers` (`id`, `code`, `url`, `status`, `upload_count`) VALUES
(1, 'bupt', 'http://m23linzhe.web-140.com', 1, 9);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_ip_banned`
--

CREATE TABLE IF NOT EXISTS `fanwe_ip_banned` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `ip1` smallint(3) NOT NULL DEFAULT '0',
  `ip2` smallint(3) NOT NULL DEFAULT '0',
  `ip3` smallint(3) NOT NULL DEFAULT '0',
  `ip4` smallint(3) NOT NULL DEFAULT '0',
  `admin` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_login_module`
--

CREATE TABLE IF NOT EXISTS `fanwe_login_module` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(120) NOT NULL DEFAULT '',
  `short_name` varchar(60) NOT NULL DEFAULT '',
  `app_key` varchar(255) NOT NULL DEFAULT '',
  `app_secret` varchar(255) NOT NULL DEFAULT '',
  `is_syn` tinyint(1) NOT NULL DEFAULT '0',
  `sort` smallint(5) NOT NULL DEFAULT '10',
  `desc` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_login_module`
--

INSERT INTO `fanwe_login_module` (`id`, `code`, `name`, `short_name`, `app_key`, `app_secret`, `is_syn`, `sort`, `desc`, `status`) VALUES
(1, 'tqq', '腾讯微博', '腾讯', '801102190', 'f5a90f622706034a835fed5b8e7e3ccf', 1, 10, '申请地址：http://open.t.qq.com/websites/applykey', 1),
(2, 'sina', '新浪微博', '新浪', '3014549955', '45a7fe2f8684771b39321fa8e4577c1f', 1, 10, '申请地址：http://open.weibo.com/webmaster/add', 1),
(3, 'qq', 'QQ登录', 'QQ', '100247974', '892435b449369579c3bfc19b08530225', 0, 10, '申请地址：http://connect.opensns.qq.com/', 1),
(4, 'taobao', '淘宝登录', '淘宝', '12402963', '40a8660aa21bb3eabf377b6e21d7fd96', 0, 10, '申请地址：http://open.taobao.com', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_magazine`
--

CREATE TABLE IF NOT EXISTS `fanwe_magazine` (
  `tid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(6) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `content` text,
  `is_top` tinyint(1) DEFAULT '0',
  `is_best` tinyint(1) DEFAULT '0',
  `is_event` tinyint(1) NOT NULL DEFAULT '0',
  `sort` smallint(5) DEFAULT '100',
  `status` tinyint(1) DEFAULT '1',
  `post_count` smallint(6) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `click_count` int(11) NOT NULL DEFAULT '0',
  `lastpost` int(11) NOT NULL DEFAULT '0',
  `lastposter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `fid` (`fid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `fanwe_magazine`
--

INSERT INTO `fanwe_magazine` (`tid`, `fid`, `uid`, `title`, `description`, `content`, `is_top`, `is_best`, `is_event`, `sort`, `status`, `post_count`, `create_time`, `click_count`, `lastpost`, `lastposter`) VALUES
(1, 1, 1, '人人都爱小胖妞', '据说科学家做了这样一个实验并得到证实：如果一个人每天站在镜子前，冲自己微笑，告诉自己“我很美”，那么他真的越来越美——心理暗示的力量如此强大。一个女人，有了自信便有了美。有了自信便会感觉到，爱情在自己生命中的地位也没那么重要，有很多事情可以享受，爱情也许很卑微。胖妞们记住，你们也很美丽', '<p>\r\n	据说科学家做了这样一个实验并得到证实：如果一个人每天站在镜子前，冲自己微笑，告诉自己&ldquo;我很美&rdquo;，那么他真的越来越美&mdash;&mdash;心理暗示的力量如此强大。一个女人，有了自信便有了美。有了自信便会感觉到，爱情在自己生命中的地位也没那么重要，有很多事情可以享受，爱情也许很卑微。胖妞们记住，你们也很美丽</p>\r\n', 1, 1, 0, 100, 1, 0, 1332701606, 0, 0, 0),
(2, 5, 1, '当香水穿上时装', '女人始终是视觉动物，选择香水时，瓶身设计往往会第一时间左右喜恶。并不是衷于形式之美，而是基于直觉而活的女人实在不能理性分解出一瓶香中的几十种成分。一见钟情的那支香水瓶，也许刚好是自我性格的完美映射，比如风情万种的女人不会倾心于“幼稚”的卡通娃娃香水瓶，甜美姑娘不会爱上暗黑系骷髅。当香水穿上时装，它会与女人碰撞出怎样的邂逅？', '<div class="main">\r\n	<div class="text" style="font-size:14px;">\r\n		<img src="http://upload.linkchic.com/e9/ff/e9fff40a617aebff58de8dbb1ebcea49.jpg" /></div>\r\n	<div id="looks">\r\n		<div class="lookstext">\r\n			<p>\r\n				女人始终是视觉动物，选择香水时，瓶身设计往往会第一时间左右喜恶。并不是衷于形式之美，而是基于直觉而活的女人实在不能理性分解出一瓶香中的几十种成分。一见钟情的那支香水瓶，也许刚好是自我性格的完美映射，比如风情万种的女人不会倾心于&ldquo;幼稚&rdquo;的卡通娃娃香水瓶，甜美姑娘不会爱上暗黑系骷髅。当香水穿上时装，它会与女人碰撞出怎样的邂逅？</p>\r\n			<p style="padding:10px 15px 20px 0; text-align:right;">\r\n				<b>编辑：</b>LULU<span style="padding:0 15px 0 15px;"><b>设计：</b>爱の鱼</span> <b>制作：</b>文玲</p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:370px;left:245px;margin-top:120px;">\r\n				女人因为曲线而妩媚。香水瓶也不例外，最诱人的味道一定藏匿于曲线摇曳的瓶子中，就像今年春天的连衣裙， 50年代的玲珑腰线悄然回归，带我们重新回味女人最性感的一面。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/meizhuang/xsmz1.jpg" usemap="#Map" /><map id="Map" name="Map"><area coords="175,462,382,633" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOQuJ4S65Qo7225QXG14W%2Fu%2B3caqvGYDb6IfoI7nexZ2BOcgFcGGTvK%2BzQDxjzNSFxDDGKg8YqdbI3%2BD2X4R6kQLg4IASYaCXhKtuE0YUJg&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Versace 香遇浮华传奇 30ML" /> <area coords="645,374,764,631" href="http://item.taobao.com/item.htm?id=1852846603&amp;" shape="rect" target="_blank" title="Elizabeth Arden挑逗 50ml" /> <area coords="781,373,925,590" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZTldsYjA6TOsN1dzV9m4wh1l8Of7mO1yFeCiSaJf%2B5BhWSuhXMgwFWEJBh4V3qIsj8nf3lKexn5V011s0MRnFAbqBLwFJBG8CQCfOV3m8A%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="BOSS 深红诱惑 30ML" /> <area coords="435,248,570,463" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA%2BqdGM3nAfU4AoW8OSVU9BEfQV%2FEGa3m%2FVUgriGmW%2Fe%2BgWRpeG4pdVoa0IrdVSwskP7M0JZuYOgx9KWB5xD7yVwql6SDRiA24V%2Bv4Dlyg%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Lancome  感官催眠 50ML" /> <area coords="201,236,395,415" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbjYfYq2cNkXIF9oPXZRiGhrg4uHdID8hkl9DRBIWA6bU1eJSyX0IVUzHGCrRcLGzSko7MgTA83m8bznTlhdfw4BPgT4w6nVxWG9k9PGw3A%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="BVLGAR 夜茉莉30ml" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:380px;left:245px;margin-top:90px;">\r\n				优雅的LADY往往会折服于珠宝感设计的奢华香水瓶，夺目的瓶身凸显出高贵的气质和不俗的品味。同样奢华十足的Dolce&amp;Gabbana春夏系列，以宝石缀满黑色裙身，华丽同时迸发神秘。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/meizhuang/xsmz1-02.jpg" usemap="#Map2" /><map id="Map2" name="Map2"><area coords="685,441,870,619" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTaWXvpVeXfB7nDSxTfCHz3SwI9GJYadL3dppb3SWsQzQXgq33Fp5xwrup%2BpsewUD2KXKlOXcNdl6Qnx3tcS3hSZsAX6k3d0C0ZiYw28YJQQ%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Versace  黑水晶之魅 50ML" /> <area coords="200,241,317,505" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZTvXPjOvmHCbwItSvA5chzh%2FZWNaXiDKAxF0JMsnwSmG6raY4IzdyMNU1UuxBOe8%2FklHxmX4cI5QY4Wdte8imlAd8JrZV%2BiZ%2F68Q%2BVsG6g%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="GIVENCHY魅幻天使永恒星钻 50ml" /> <area coords="766,266,933,424" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTa0NqbRznDMaylcn0ZpO3lpZkIhRh%2F2AU1EW9%2BA5f5816wASPyYCud36zbQeakLnQncl7G7UQD1Uud0tExJ7mEGXPtMXcimwWGSjG%2FNLD&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Bvlgari 白水晶 65ML" /> <area coords="458,401,603,628" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA5k1Je4Cw01F0ydCF06VV%2FDntuw4o4ML8fLR00XV65LeXS9uphbQNX9TqRwOuZnSh%2BSi%2B8WQ62Lx2WWSfcpMkzA6%2BYwXMiZTfIj9Oj2MI%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Dior 真我 50ml" /> <area coords="321,213,494,379" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZPhfTkfi5BjuLOxeZHIArL4q%2BwQCjw0r3DGPeDZYXKnXvZt0ZHXbLaGcHgcpyFDbqVLk0vF3YaGXqV3abYSVS9JiVs5fap9Z9ynhQWwCsw%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Paco Rabanne  百万女人 5ML" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:440px;left:245px;margin-top:85px;">\r\n				甜美绝对是春天的主流趋势，而LV2012春夏秀场更是将奶油色和花朵元素通通囊括，T台上的白色镂空花朵裙，有没有让你想起MARC JACOBS的小雏菊？无论是香水还是服装，都捕捉到了年轻女孩儿开朗的一面。</p>\r\n			<p style="padding-bottom:10px">\r\n				<img src="http://www.linkchic.com/zhuanti/meizhuang/xsmz1-03.jpg" usemap="#Map3" /><map id="Map3" name="Map3"><area coords="696,286,809,525" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA4%2BEfsDaCLTwHcLoDK2k0y9ECUebs2K65hRMgDdoNo593P2qYRDk%2FBuK%2FNke4rA%2Fg%2Bq1cYLSdqqVdVAokazDSa%2FgI%2BMFq7TAF6dKJEHFI%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Marc Jacobs 粉色小雏菊 125ML" /> <area coords="815,112,933,363" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKhl2FySA0w79l6zE6X9UoTrVkc5Vb%2FAPauDgGWcQCivjnZdqIsJTqjOFEqGUoPcd3X%2FXPjGPnnVrVbR6RaFMxOrIOiUA9NpFM1EL89dOM%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="MOSCHINO 爱嬉戏 30ml" /> <area coords="388,429,585,581" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKlOMf0GKrhvfO2Ee5WEVYKU%2BfKYTFqe7qHLu8zsMRweNAFo598mHaJmYBk1yKcVnKct%2B%2BWcWla97NqIm6QVH2m8RQ75GlBJmKTrQbc2xc%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="KENZO 永恒爱恋 100ml" /> <area coords="288,169,509,394" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQwa16DQWmxvabReKywPdim8%2BCEq8NtoZVg8l%2F81DJeVZD6bo%2BJ1jsu2AyHKcOpzByj9EKEo6jSdz9cBw2DSMZed2a%2Buy68hgsL8gpGww%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Marc Jacobs 小雏菊 50ML" /> <area coords="201,399,335,628" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIbg0f2zVPI0TEN9TW9sp4%2FwT7KwJvHbv%2BWNFIrLwTq7fbH6EM0lzdAJ75L5pcV0AS63gPk0owgahz%2FRHsmN5rCiyvl2b3YUu2wk5jpRWVY%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="Estee Lauder欢沁花雨女士香水30ML" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:360px;left:270px;margin-top:80px;">\r\n				有着一颗童心的姑娘热爱的香水瓶就像儿时的玩具一样童趣十足，天真俏皮。而Tsumori Chisato 2012春夏秀场正像为我们筑起一座童话无忧岛，让我们永远不会老。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/meizhuang/xsmz1-04.jpg" usemap="#Map4" /><map id="Map4" name="Map4"><area coords="652,435,829,601" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZPBYWEqXV5DldFiabIJsBKSsrldHSyL7GAFZ64PzJmcaDspFPYIcb8J94%2BjIIBh3TFBvS3qPuHWUx6Yl2nUHRquGznugZW34jHqibr6LqgQ%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="亲亲桃丝熊女士香水30ML" /> <area coords="323,164,506,349" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA%2FOvpwBMWlFBb55B9q38ICequpGufIgyQ17hT98rDaWT%2BsYote%2FrlxbGdZND15Y23wpNd6GKCNVvjDGp6bHfU9ekAtguNn9ZZdOtn6GtI%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="ANNA SUI 逐梦翎雀 50ML" /> <area coords="209,355,347,575" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZP2bD49x%2BDX1nELVMHVE02TT6mBwjkGeXplI92v0578Hb9WtxeI2hT6plQo%2BSX71bONe9oh%2BMLwC1NF84VzFarIxqdEQ6INWYhiU%2Fq2BEB0%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="MOSCHINO 爱情趣 25ML" /> <area coords="450,356,624,496" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZPu0IrGdO%2BGxonuh6s2KZYjVynDS8q5bSk8ECqkdNtprrcMjA2EX10%2F5YWk8gC3wAugp77rT2Hh4amETzkRgR%2B%2FbaPpeirB0vssFltHXhQ%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Kitty魔法香膏" /> <area coords="742,206,942,406" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA%2FMX7YMBsqgTz5VqsDsoJPc2xDIywvr9mCP9iyXx6281EEKhNb9f7P3r%2BP9xCN73%2BqZfZxxdaX1F%2BH%2FbTsoCo1prCxi33%2Bl3SYz79z50Y%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Nanette Lepore 公主娜娜淡香精50ml" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:360px;left:267px;margin-top:140px;">\r\n				蓝色是海的颜色，代表无尽的宽广和自由。随着今年海洋风的兴起，独具海洋和自然气息的香水定会再次盛行。喜欢蓝色及海洋香氛的女人，会有一颗酷爱自然和自由的心。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/meizhuang/xsmz2.jpg" usemap="#Map5" /><map id="Map5" name="Map5"><area coords="303,228,493,404" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTb0CogZ%2FgxIm07cuHppzMpsQNjhpC29JFperBXC8bYX5xISKxEajTwykbH7r6TeMuLGgJzIAPE4TUiO%2BI8XxGpFq8jQAnhnaERAW5y06wjQ%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Ferragamo 海洋童话祈福 30ML" /> <area coords="504,369,623,534" href="http://item.taobao.com/item.htm?id=5190576036" shape="rect" target="_blank" title="D&amp;G 逸蓝 25ml" /> <area coords="630,488,819,629" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZPkMCpFfYffQ1n1MM8s3J6GF3z%2FvbABKjxxTTVofUvECNhv6H8INbD%2B1IoRWQR%2FTK4sFPxmhiDv8wT2%2BylPfqeqMZJo1TVpS%2F4NofdXWLQ%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Lolita 海洋之心 80ML" /> <area coords="216,419,379,628" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZT6e9%2BxbN1ExGhtEgW0FQ1UGmqG3B1a6Qmb7ZQPOe%2Bc0eDoG4u%2F%2FhISGxlYO%2Boxtp4kMdzC5NVERAQXKJ4dOxFxm1t3UeNkfhznd11c5%2B%2Bs%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Davidof  冷水 100ML" /> <area coords="835,290,944,556" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKgeCcoocDF2Iar1cYKu%2BmheETBN89IV4FkQDAFQdzYJg5ECPe9MXbk2%2BYSkKT%2BBlYDVv40bqOm%2BNJ8Wzm7DftBIZYC3ck5OR4HIxoC6xw%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Issey Miyake 夏日珊瑚限量版 100ML" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:400px;left:240px;margin-top:100px;">\r\n				独具现代气息和独立意识的女人，都会喜欢简洁却富于质感的香水瓶。像Emporio Armani 的秀场女郎，极简的廓形外套和线条装饰凸显出都市女性的干练。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/meizhuang/xsmz2-02.jpg" usemap="#Map6" /><map id="Map6" name="Map6"><area coords="768,314,923,530" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKlP4hKDSt1OKX7qm5r%2FEn6Cyyh3hTLdVG27l6GB%2BJV5nI%2BOKabh6%2FyUPbo7J4Hb5phAMcY7p%2FCG083YWnAdOlqEVKUiXn%2FuWMscF8CKSQ%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="BURBERRY 风格女士香精50ML" /> <area coords="476,219,629,471" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA7Crr8cLPKUTjB9wWUCro1jG9PklDxXjQ%2BXtw2PV7Q11uUBjopwuaLDe1pddPwsJZO9lpCP%2FJ7KxzC8xAcHiUMaN8vyegWlviqFczP1GI%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="Elizabeth Arden第五大道之夜 75ML" /> <area coords="266,181,451,342" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWXFFCAD80C3R%2F3yZPEaEtOjLfPvLshWWMmlZBm0CRFMtK7%2FLFluOiIKhPvLWYyW8hH7qnYw0xFOFm5dQ52r6iEd%2BT9UqWN7OZHdr0rt4Y%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="PRADA  琥珀美人 50ML" /> <area coords="317,381,439,623" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZP7ZMWCk3G3FB228ToqxzSkpxanXbdSqv8wlss8KPIkwaZGSF3VhqWuWQ8aVniCJBMRUUUgtyc4UvXzj5hSFQ1qE3kuI1VsJ0OI9z2fjWw%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps&amp;" shape="rect" target="_blank" title="GUCCI E 嫉妒 100ML" /> <area coords="183,358,297,569" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA4%2BtTrojc8Dh%2B5XfxtMEdJ%2FscjV358pkT%2Fs8x0WheU%2BoIFcUYaUB12WqRak%2FuLWcRIJ5iV%2BhPQ4v2u8KU%2FMtvfqlUZRr39032jH%2BSTxiJq&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="Chanel NO.5 50ml" /></map></p>\r\n		</div>\r\n		<div class="looksimg" style="padding:10px 0 10px 0;">\r\n			&nbsp;</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', 1, 1, 0, 100, 1, 0, 1332781606, 0, 0, 0),
(10, 1, 1, '早春风格', '忙于添置春装的姑娘们是否常常被所谓最新流行趋势、本季至IN搭配法则所牵绊，不知选什么才足够时髦？\r\nYves Saint Lauret曾说真正的时尚在于不被操控的凌驾。如果做不到凌驾我们至少要HOLD住自己的STYLE。下面LC根据12星座个性特征，结合流行元素，为新浪微电影推荐最热春装单品。我深信，流行易逝，自我风格永存！', '<div class="main">\r\n	<div class="text" style="font-size:14px;">\r\n		<img src="http://upload.linkchic.com/12/24/1224af48e3e4b399016f03ba0bb8dd8d.jpg" /></div>\r\n	<style type="text/css">\r\nimg{border:0px;display:block}\r\n#looks{width:950px;overflow:hidden;}\r\n.looksimg{width:950px;float:left;position:relative;}\r\n.lookstext{width:930px;float:left;padding:0 10px 0 10px;font-size:16px;line-height:20px;}\r\n.looks1{float:left;position:absolute;font-size:14px;line-height:18px;}	</style>\r\n	<div id="looks">\r\n		<div class="lookstext">\r\n			<p>\r\n				忙于添置春装的姑娘们是否常常被所谓最新流行趋势、本季至IN搭配法则所牵绊，不知选什么才足够时髦？<br />\r\n				Yves Saint Lauret曾说真正的时尚在于不被操控的凌驾。如果做不到凌驾我们至少要HOLD住自己的STYLE。下面LC根据12星座个性特征，结合流行元素，为新浪微电影推荐最热春装单品。我深信，流行易逝，自我风格永存！</p>\r\n			<p style="padding:10px 15px 20px 0; text-align:right;">\r\n				<b>编辑：</b>LULU<span style="padding:0 15px 0 15px;"><b>设计：</b>杉杉/Panda晶/小z</span> <b>制作：</b>文玲</p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:270px;left:25px;margin-top:130px;">\r\n				充满奇思异想的水瓶，能够迅速接受新鲜事物，怪异的举止让别人根本猜不透他们的心思，瓶子需要自由空间发挥想象力，所以独特有设计感的衣服最适合！</p>\r\n			<p class="looks1" style="width:130px;left:170px;margin-top:240px;">\r\n				<b>ALEX大叔小档案</b><br />\r\n				师承台湾命理大师子辰老师，研习古典占星，现代占星等命理知识。新浪专栏作者，并与多家网媒纸媒合作，内地人气星座专家。</p>\r\n			<p class="looks1" style="width:280px;left:15px;margin-top:470px;">\r\n				如果你刚刚接触到新的工作，那么这个月对你来说有绝佳的机会被人赏识甚至重用，同时你的财务问题开始缓解，如果你之前存在借贷或者是债务问题，需要在中旬之前解决。<br />\r\n				感情运来说，有伴的水瓶座，你们之间更多的问题来自于双方的家庭。单身的水瓶座，事业运好的情况下请把心思放在事业上为好。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy1.jpg" usemap="#Map" /><map id="Map" name="Map"><area coords="687,294,928,463" href="http://www.linkchic.com/item/89444.html" shape="rect" target="_blank" title="复古箱型包" /> <area coords="731,6,925,274" href="http://www.linkchic.com/item/97831.html" shape="rect" target="_blank" title="闪电印花背心" /> <area coords="334,240,501,500" href="http://www.linkchic.com/item/97832.html" shape="rect" target="_blank" title="条纹半身裙" /> <area coords="546,11,709,155" href="http://www.linkchic.com/item/97828.html" shape="rect" target="_blank" title="环形设计手镯" /> <area coords="331,8,532,212" href="http://www.linkchic.com/item/91710.html" shape="rect" target="_blank" title="蝴蝶结黑色平底鞋" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:270px;right:20px;margin-top:150px;">\r\n				敏感且多愁善感的鱼儿女人风情十足。极富女性特质设计的衣服很适合双鱼座，比如柔美的颜色，飘逸的雪纺材质可以恰到好处的体现双鱼女浪漫的气质。</p>\r\n			<p class="looks1" style="width:280px;right:20px;margin-top:495px;">\r\n				水逆让你对自我的认同产生怀疑，甚至失去信心，好在本月水星即将恢复顺行。因此你终于开始得到正确客观认识自己的机会。事业本月容易产生财务纠纷，甚至是自己的策划创意被人枪毙。<br />\r\n				感情运来说，有伴的双鱼座你们之间存在的某个谎言可能被对方发现。单身的双鱼座，中旬之后桃花运势转好，珍惜眼前出现的人。</p>\r\n			<p style="padding:20px 0 20px 0">\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy1-02.jpg" usemap="#Map2" /><map id="Map2" name="Map2"><area coords="419,287,645,475" href="http://www.linkchic.com/item/97836.html" shape="rect" target="_blank" title="漆皮蝴蝶结平底鞋" /> <area coords="430,13,617,265" href="http://www.linkchic.com/item/97838.html" shape="rect" target="_blank" title="拼色雪纺衬衫" /> <area coords="243,6,418,132" href="http://www.linkchic.com/item/97837.html" shape="rect" target="_blank" title="蝴蝶结平底鞋" /> <area coords="17,221,185,488" href="http://www.linkchic.com/item/97842.html" shape="rect" target="_blank" title="卡其色卷边西装裤" /> <area coords="7,18,213,207" href="http://www.linkchic.com/item/92309.html" shape="rect" target="_blank" title="黑色手拿信封包" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:270px;left:25px;margin-top:130px;">\r\n				白羊座经常会被贴上性格火爆的标签，其实白羊只是真情流露、为人坦白直爽。白羊不懂得伪装，更不喜欢哗众取宠，所以简单清爽的衣物占领着羊儿的衣橱。</p>\r\n			<p class="looks1" style="width:270px;left:25px;margin-top:470px;">\r\n				由于仍及处于水星逆行阶段，所以你现在仍旧不宜做出各种重大事宜的决定，特别是有关于财务方面的决定。事业上虽然有很多明确的想法想要去付诸实践，但是由于被人背后阻挠可能让你有些恼火。<br />\r\n				感情运来说，有伴者继续保持感情推进，不过可能会因为彼此的工作问题而产生口角分歧。单身者下旬容易有桃花出现，但是容易错过。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy1-03.jpg" usemap="#Map3" /><map id="Map3" name="Map3"><area coords="796,246,938,463" href="http://www.linkchic.com/item/94798.html" shape="rect" target="_blank" title="黑色桶形包" /> <area coords="653,270,794,459" href="http://www.linkchic.com/item/90852.html" shape="rect" target="_blank" title="坠饰项链" /> <area coords="325,218,519,513" href="http://www.linkchic.com/item/97849.html" shape="rect" target="_blank" title="红色皮裤" /> <area coords="724,13,944,242" href="http://www.linkchic.com/item/97848.html" shape="rect" target="_blank" title="拼色长袖T恤" /> <area coords="541,18,718,133" href="http://www.linkchic.com/item/97846.html" shape="rect" target="_blank" title="波浪纹平底鞋" /> <area coords="314,19,527,214" href="http://www.linkchic.com/item/97845.html" shape="rect" target="_blank" title="印花短裤" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:270px;right:25px;margin-top:150px;">\r\n				为人谨慎的金牛座性格看似温和，但其实内心中始终坚持着自己的立场和原则，个性独立，在团体中不失自主性的金牛女最爱大气的搭配LOOK。</p>\r\n			<p class="looks1" style="width:270px;right:25px;margin-top:490px;">\r\n				被迫去不愿做的事情的局面已经渐渐中止，你可以开展自己一直打算的东西了。同时，本月对你来说是很关键的一个月，不管是事业还是财务上，你都有很大的改变。本月消费会变大，注意你的钱包。<br />\r\n				感情运来说，有伴者你可能有诸多顾虑，甚至会影响到你的健康问题。单身者本月魅力依旧，但是也要多眼前人有分辨能力。</p>\r\n			<p style="padding:20px 0 20px 0">\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy1-04.jpg" usemap="#Map4" /><map id="Map4" name="Map4"><area coords="414,278,611,508" href="http://www.linkchic.com/item/94238.html" shape="rect" target="_blank" title="黑色铆钉单肩包" /> <area coords="15,221,213,469" href="http://www.linkchic.com/item/97851.html" shape="rect" target="_blank" title="不规则黑色半身裙" /> <area coords="419,18,641,249" href="http://www.linkchic.com/item/97850.html" shape="rect" target="_blank" title="白色织银色 下摆前短后长宽松毛衣" /> <area coords="233,6,405,123" href="http://www.linkchic.com/item/90162.html" shape="rect" target="_blank" title="Vera Wang朋克设计长款项链" /> <area coords="21,16,211,209" href="http://www.linkchic.com/item/93007.html" shape="rect" target="_blank" title="黑色绑带高跟鞋" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:280px;left:15px;margin-top:105px;">\r\n				双子聪明又爱整蛊，喜欢刺激和新鲜事物的双子座，只有独一无二，足够特别的衣服才能吸引他们的眼球。无论颜色或者剪裁，双子只要与众不同。</p>\r\n			<p class="looks1" style="width:280px;left:15px;margin-top:450px;">\r\n				你的主星水星处于逆行阶段，不过这个月就恢复顺行了，所以你终于摆脱了被人嫌弃和不被重视的情况。同时本月你需要处理好你的人际关系，有可能会产生合作的问题。<br />\r\n				感情运来说，有伴者你们之间存在的分歧可能会加大，部分双子座会出现分手的局面。单身者流连在各色人群中，想爱却不敢爱。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy2.jpg" usemap="#Map5" /><map id="Map5" name="Map5"><area coords="695,308,932,485" href="http://www.linkchic.com/item/91919.html" shape="rect" target="_blank" title="电话造型手提包" /> <area coords="731,6,935,299" href="http://www.linkchic.com/item/97853.html" shape="rect" target="_blank" title="复古印花衬衫裙" /> <area coords="307,276,501,490" href="http://www.linkchic.com/item/95938.html" shape="rect" target="_blank" title="异形高跟凉鞋" /> <area coords="521,6,708,165" href="http://www.linkchic.com/item/90259.html" shape="rect" target="_blank" title="Marni at H&amp;M 红黄彩色项链" /> <area coords="318,55,519,259" href="http://www.linkchic.com/item/90322.html" shape="rect" target="_blank" title="Marni at H&amp;M白色手镯" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:270px;right:20px;margin-top:125px;">\r\n				敏感的巨蟹自我保护意识很强，所以在保护自己的同时不经意间就伤害到了旁人，但其实善良的巨蟹即使在最难过的时候也会给你一个微笑。多愁善感的巨蟹女总是给人很淑女的印象。</p>\r\n			<p class="looks1" style="width:270px;right:20px;margin-top:475px;">\r\n				如果他人逼你做一些事情，请选择拒绝，这个月对巨蟹座来说要学会明哲保身，不要随便沾惹不必要的麻烦。同时你可能正准备出游，旅行，所以做好财务上的管理。<br />\r\n				感情运来说，有伴者的巨蟹座可能得到旧人的联系使得对方醋意大发，单身者本月容易邂逅新人或者认识新朋友。</p>\r\n			<p style="padding:20px 0 20px 0">\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy2-02.jpg" usemap="#Map6" /><map id="Map6" name="Map6"><area coords="395,338,621,526" href="http://www.linkchic.com/item/90936.html" shape="rect" target="_blank" title="蝴蝶结黑色单肩包" /> <area coords="416,171,622,321" href="http://www.linkchic.com/item/81314.html" shape="rect" target="_blank" title="Moschino轻云女士迷你香水" /> <area coords="287,5,512,151" href="http://www.linkchic.com/item/97860.html" shape="rect" target="_blank" title="条纹单肩包" /> <area coords="17,318,233,488" href="http://www.linkchic.com/item/97863.html" shape="rect" target="_blank" title="白色漆皮平底鞋" /> <area coords="7,18,210,302" href="http://www.linkchic.com/item/91476.html" shape="rect" target="_blank" title="公主风粉色连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:280px;left:15px;margin-top:105px;">\r\n				耀眼的狮子座像黎明的曙光，永远带着朝气。风度翩翩引人注意的狮子女会追求奢华的物质生活，所以她们对于华丽设计的衣服丝毫没有抵抗力。</p>\r\n			<p class="looks1" style="width:270px;left:25px;margin-top:445px;">\r\n				你可能游走在各种应酬之中，这个月对你来说主要是拓展人际关系，但是需要说的是，有些人可能对你产生不利的影响。也会因此而损财破费。<br />\r\n				感情运来说，有伴者的狮子座本月因对方而需要损失一部分财务，也会有一起出行的打算。单身的狮子座，上旬对你来说是不错的感情运势，但是中旬之后需要注意，容易遇人不淑。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy2-03.jpg" usemap="#Map7" /><map id="Map7" name="Map7"><area coords="694,308,936,505" href="http://www.linkchic.com/item/90621.html" shape="rect" target="_blank" title="复古菱格手提包" /> <area coords="330,191,495,519" href="http://www.linkchic.com/item/97870.html" shape="rect" target="_blank" title="黄色小脚裤" /> <area coords="724,22,947,298" href="http://www.linkchic.com/item/97865.html" shape="rect" target="_blank" title="黑色星星印花衬衫" /> <area coords="528,28,722,166" href="http://www.linkchic.com/item/91777.html" shape="rect" target="_blank" title="防紫外线平光镜架" /> <area coords="314,19,520,183" href="http://www.linkchic.com/item/95212.html " shape="rect" target="_blank" title="MARNI 黑宝石戒指" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:260px;right:25px;margin-top:140px;">\r\n				理智是处女座自我保护的一种方式，苛求完美的处女座其实是怕给旁人和自己带来麻烦。精良合体的剪裁、细致做工的衣服最能打动处女座。</p>\r\n			<p class="looks1" style="width:260px;right:25px;margin-top:475px;">\r\n				月初对你来说可能会有出行，出差的打算，同时自己也容易陷入一些纠纷，当然，这些纠纷很可能是自找的，怨不得他人。本月事业上进展顺利，只是反复拖延让你有些苦恼。<br />\r\n				感情运来说，有伴者可能会出现异地分隔的情况，同时自己的安全感下降，容易出现假想敌。单身者来说，桃花运一直处于很不错的状态，但是容易出现暧昧。</p>\r\n			<p style="padding:20px 0 20px 0">\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy2-04.jpg" usemap="#Map8" /><map id="Map8" name="Map8"><area coords="255,184,412,432" href="http://www.linkchic.com/item/97874.html" shape="rect" target="_blank" title="波点连体裤" /> <area coords="446,178,620,506" href="http://www.linkchic.com/item/96575.html" shape="rect" target="_blank" title="白色印花小脚裤" /> <area coords="32,245,236,519" href="http://www.linkchic.com/item/97873.html" shape="rect" target="_blank" title="白色毛毛衬衫" /> <area coords="342,3,572,173" href="http://www.linkchic.com/item/91742.html" shape="rect" target="_blank" title="红色蝴蝶结平底鞋" /> <area coords="7,7,218,239" href="http://www.linkchic.com/item/96574.html" shape="rect" target="_blank" title="白色印花西装" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:280px;left:18px;margin-top:115px;">\r\n				天枰座的心中永远放着一杆平衡的秤，天枰的守护星是维纳斯，所以对于美天枰有着自己唯美的见解。她们给人的感觉永远是温和，所以气质感的搭配LOOK会让天枰女更加优雅。</p>\r\n			<p class="looks1" style="width:280px;left:18px;margin-top:460px;">\r\n				如果你想给自己做一次自我检讨，那么这个月是很好的时机，特别是对你一直有些紊乱的人际关系，这个月也开始有明晰的改变。财运上会有重大支出的决定，需要反复斟酌。<br />\r\n				感情运来说，有伴的天秤座本月你们可能出现新的转折，这个转折好坏掺半。单身的天秤座，3月的新月开启了你的伴侣宫，所以未来一个月你需要把握好最佳时机，容易脱单。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy3.jpg" usemap="#Map9" /><map id="Map9" name="Map9"><area coords="676,324,917,493" href="http://www.linkchic.com/item/91658.html" shape="rect" target="_blank" title="黑白拼色信封包" /> <area coords="715,16,908,300" href="http://www.linkchic.com/item/97878.html" shape="rect" target="_blank" title="羽毛设计黑色连衣裙" /> <area coords="330,329,528,506" href="http://www.linkchic.com/item/97879.html" shape="rect" target="_blank" title="黑色亮片毛呢裙" /> <area coords="532,4,695,148" href="http://www.linkchic.com/item/92409.html" shape="rect" target="_blank" title="钳扣粗跟中跟鞋" /> <area coords="318,34,526,276" href="http://www.linkchic.com/item/97875.html" shape="rect" target="_blank" title="淑女风格子外套" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:270px;right:20px;margin-top:140px;">\r\n				掌控欲极强的天蝎就是有一种魔力，你明明知道珍爱生命远离天蝎，心里却抵挡不住天蝎酷酷的性感魅力。天蝎的性感点并不是忙于裸露，但却可以轻易捕获你的心。</p>\r\n			<p class="looks1" style="width:280px;right:18px;margin-top:480px;">\r\n				本月财运不错，特别是偏财奖金甚至是奖学金之类的结果能够收到。同时部分天蝎座本月会接受新的变化，如果你正打算跳槽离职，本月也容易找到下家。<br />\r\n				感情运来说，有伴的天蝎座对方的情绪反复无常让你有些无奈和恼火，所以需要理智对待。单身的天蝎座，你需要看清楚自己的状况才能做出正确的决定，如果出现欺骗隐瞒和暧昧，那么劝你尽早收手。</p>\r\n			<p style="padding:20px 0 20px 0">\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy3-02.jpg" usemap="#Map10" /><map id="Map10" name="Map10"><area coords="363,357,612,532" href="http://www.linkchic.com/item/92420.html" shape="rect" target="_blank" title="黑白拼接中跟鞋" /> <area coords="430,13,620,341" href="http://www.linkchic.com/item/97882.html" shape="rect" target="_blank" title="黑色打底皮裤" /> <area coords="234,27,409,153" href="http://www.linkchic.com/item/89933.html" shape="rect" target="_blank" title="柳丁麻花-真皮手链" /> <area coords="8,211,227,476" href="http://www.linkchic.com/item/97881.html" shape="rect" target="_blank" title="拼色不规则T恤" /> <area coords="7,18,213,207" href="http://www.linkchic.com/item/97880.html" shape="rect" target="_blank" title="宝格丽夜茉莉香水" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:260px;left:25px;margin-top:120px;">\r\n				射手座是天生的冒险家，热爱自由的她们乐观且信心满满，选择衣服的时候会尽可能的舒适，当然识大体的射手不会怠慢正式场合，但你总会发现正装之下她自己的小心思。</p>\r\n			<p class="looks1" style="width:260px;left:25px;margin-top:460px;">\r\n				4月是你算旧账的月份，也就是说各类旧事物被提到议事日程，可能见到旧人也可能处理旧有的财务关系和人际关系。但是这个月对你来说显得有些心不在焉，很多事情容易滞后拖沓。<br />\r\n				感情运来说，有伴的射手座，你们之间容易聚少离多甚至是出现分手的局面，单身的射手座，上旬有很好的感情运势，请好好把握。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy3-03.jpg" usemap="#Map11" /><map id="Map11" name="Map11"><area coords="741,281,941,489" href="http://www.linkchic.com/item/97887.html" shape="rect" target="_blank" title="拼色半身裙" /> <area coords="530,330,671,519" href="http://www.linkchic.com/item/91499.html" shape="rect" target="_blank" title="布洛克鞋" /> <area coords="324,302,514,513" href="http://www.linkchic.com/item/97886.html" shape="rect" target="_blank" title="粉色缎面短裙" /> <area coords="760,24,944,272" href="http://www.linkchic.com/item/97885.html" shape="rect" target="_blank" title="黑色不规则打底T恤" /> <area coords="520,28,693,249" href="http://www.linkchic.com/item/97884.html" shape="rect" target="_blank" title="白色雪纺衬衫" /> <area coords="296,24,515,283" href="http://www.linkchic.com/item/97883.html" shape="rect" target="_blank" title="黑色毛呢外套" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:260px;right:25px;margin-top:140px;">\r\n				占星学家认为魔羯座是最难以做性格分类的一个星座，因为它所包含的典型实在太广泛。严谨的摩羯座不会轻易倾心，微细节的用心设计单品才入的了摩羯的法眼。</p>\r\n			<p class="looks1" style="width:260px;right:25px;margin-top:480px;">\r\n				本月之前可能存在的分歧甚至是误解，这个月的上旬能够解决，如果你在事业上被小人排挤或者是被人误会，你需要站出来直接说明方可度过难关。<br />\r\n				感情运来说，有伴的摩羯座，你们之间的关系一直稳定，但是出于平淡，部分摩羯座感情温度容易下滑。单身的摩羯座，魅力上涨，但是很多时候却用在了工作上。</p>\r\n			<p style="padding:20px 0 20px 0">\r\n				<img src="http://www.linkchic.com/zhuanti/lc/wdy3-04.jpg" usemap="#Map12" /></p>\r\n		</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', 1, 1, 0, 100, 1, 0, 1333668616, 0, 0, 0);
INSERT INTO `fanwe_magazine` (`tid`, `fid`, `uid`, `title`, `description`, `content`, `is_top`, `is_best`, `is_event`, `sort`, `status`, `post_count`, `create_time`, `click_count`, `lastpost`, `lastposter`) VALUES
(6, 1, 1, '星座时尚搭配', '', '<div class="main">\r\n	<div class="text" style="font-size:14px;">\r\n		&nbsp;</div>\r\n	<!--~ include file="0308/header_sc.htm"~-->\r\n	<div class="toutu">\r\n		<img src="http://upload.linkchic.com/42/cd/42cd66bdf76801bf00db277ae068f85d.jpg" /></div>\r\n	<style type="text/css">\r\nimg{border:0px;display:block}\r\n#looks{width:950px;overflow:hidden;}\r\n.looksimg{width:950px;float:left;position:relative;}\r\n.lookstext{width:950px;float:left;font-size:16px;line-height:20px;}\r\n.looks1{float:left;position:absolute;font-size:14px;line-height:15px;}\r\n.size12{font-size:12px;}\r\n.looksimg li{float:left;}	</style>\r\n	<div id="looks">\r\n		<div class="lookstext">\r\n			<p>\r\n				摇逸流苏、蓬蓬裙摆、Disco迷你裙、优雅长裙、骷髅铆钉&hellip;&hellip;这些在今天看来最普通不过的元素，在过去却是将井然有序的服装规则重重击破的新创意。当今流行在反复的回归中进化着，我们在向复古年代致敬的同时汲取营养，创造更多的服装新风貌。</p>\r\n			<p style="padding:10px 15px 20px 0; text-align:right;">\r\n				<b>编辑：</b>小Ray<span style="padding:0 0 0 15px;"><b>选品：</b>李阿乐</span><span style="padding:0 15px 0 15px;"><b>设计：</b>小z</span> <b>制作：</b>想想</p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:400px;left:22px;margin-top:120px;font-size:14px;line-height:20px;">\r\n				作为浮躁的20年代代言人F.Scott Fitzgerald，在1925年出版了他的巅峰之作《了不起的盖茨比》。书中生动的描绘了20年代美国的社交形态：&ldquo;这是一个奇迹的时代，一个艺术的时代，一个挥金如土的时代，也是一个充满嘲讽的时代。&rdquo;</p>\r\n			<p class="looks1 size12" style="width:130px;left:652px;margin-top:220px;">\r\n				低腰直筒裙是20年代的典型风格单品，钟型帽或者复古头巾是与之搭配的绝佳选择。</p>\r\n			<p class="looks1 size12" style="width:110px;left:632px;margin-top:470px;">\r\n				流苏是20年代连衣裙装饰艺术的一个主要细节，各种样式的流苏出现在连衣裙的裙摆或肩部。</p>\r\n			<p class="looks1 size12" style="width:110px;left:252px;margin-top:485px;">\r\n				经典小说《了不起的盖茨比》</p>\r\n			<p>\r\n				<a name="top1"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_01.jpg" usemap="#Map" /></a><map id="Map" name="Map"><area coords="746,331,911,635" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWbQDtInRuBHOV%2BJqME62vEmjlTf4qJ4BczzrcCixQR1TZW4GiDUkK%2FGyR3MJqVLZ4JuEMd8OYwyQam%2BySWt%2FmWD%2FL28j2FpaqGsSXnQiGo&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="甜美无袖背心裙" /> <area coords="17,238,222,628" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKhnz%2F0%2B2rSOtbdzzh2IC5z5xs55m9Th5%2FgssUZTtny9Ma6ylkGhYefpru4mbNHEnA%2FBGBEcZOpwa%2Fvi8cvnL9ZYR5jCYBdmOvSVc47jnE%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="雪纺皱绣花七分袖连衣裙" /> <area coords="428,16,615,355" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWXEEihEsfLRHCYScgyOTS51rjuaSgb8vP4OQr6Xz7UR8RguzZq7PkzzAHzZn7FHJfe0SzZYW5yVtA4cIsd1PWtD3stq3ejQkb4gGbedG8%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="收腰假两件打底背心连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:260px;left:22px;margin-top:120px;">\r\n				2012春夏T台上，20年代风格又一次回归时尚中央，其代表元素被重新演绎，是秀场上的集体怀旧灵感。</p>\r\n			<p class="looks1" style="width:198px;left:465px;margin-top:500px;color:#FFFFFF; line-height:18px;">\r\n				秀场演绎：Frida Giannini为Gucci 2012春夏打造的黑色、金色与白色相间的低腰礼服裙，搭配烟熏妆和红唇，让人宛如回到《了不起的盖茨比》书中的那个&ldquo;爵士时代&rdquo; 。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_02.jpg" usemap="#Map2" /><map id="Map2" name="Map2"><area coords="717,325,883,630" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKm3QaODZY8nEi1mTZXo%2FtyBcsY1wUKpB3f98saxGqJkrLShuQGas07WvdRaYCXAe6Fr4djGOA4Dl2%2BNewjD831RThZPOSmxBp64Zwx938%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="OL通勤显瘦修身长袖连衣裙" /> <area coords="25,196,175,551" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWchI%2B47kYpqaZ0FLxsxgJmwUDrFyKaaBEv7EkdNp0apmEPAiD0u8GIzNSb1HzeHoS30PKPmm8JKfDuK3K3Ekk9p%2BqAbIYS55WOvtZ86hw%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="蝴蝶结连衣裙" /> <area coords="527,115,689,395" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWe30olB58xT9jnytTZeJ4Dm4Xn%2FnKSf1ClynMvgpvM%2FdA5BxaZMqSoH8HK%2FTT4ibLyKvkBYZFXTQnaQ5GVQbq5XpwsHJHgjLgZDTReA8o%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="学院风帅气又可爱百褶连衣裙" /> <area coords="200,285,378,628" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA5kbk7g7sf0y%2Fm9sB6apdkFozVp7Y%2Ft1r2SCAHmkB5hMbhaHisqVVxtdXxtMI77aZB6NUiNbBFzQ%2BhnmhLwTG1gkM6lzFYsfMpRuNYkA0%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="气质OL通勤时尚无袖连衣裙" /> <area coords="735,10,927,291" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOSJ4%2F%2B58ZHHwd74YdXnSjyvbRKL7W81FHN4eLkaXsG9LZYcLE%2FuJ%2FyerXFAr9cjVNXouHAoV8R1jN5TltbJSycl8vOUJgIiPi0GjUmmM0%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="亮丽拼接弹力连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:250px;left:20px;margin-top:120px;font-size:14px;">\r\n				第二次世界大战物资的匮乏使得衣服的用料减至最低限度，一切非必需的装饰也被除去。受战争的影响，军装风格的连衣裙颇受欢迎，简朴和实用成为这一时代连衣裙的主要风格样貌。</p>\r\n			<p class="looks1 size12" style="width:100px;left:622px;margin-top:80px;">\r\n				前襟装一排钮扣，小翻领，腰部束一根细皮带，窄裙裁制精良，是这一时代简朴连衣裙的主要样式。</p>\r\n			<p class="looks1 size12" style="width:130px;left:72px;margin-top:530px;">\r\n				受战争的影响服装的颜色也整体偏暗，黑色，白色，军绿色都是30－40年代的主流颜色。</p>\r\n			<p class="looks1 size12" style="width:90px;left:622px;margin-top:450px;">\r\n				由于物资匮乏，帽子无法定量配给，丝袜在这个时代也因节省用料而暂时消匿。</p>\r\n			<p>\r\n				<a name="top2"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_03.jpg" usemap="#Map3" /></a><map id="Map3" name="Map3"><area coords="711,302,908,631" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ2TEGaPs81vJK4oaPxKcvUouyuzL7FzsI4iQ%2B80Ttn8IGLadzz6rf5X19YZ2hJdnZHWZQea6iuXuc7pRs6%2FCVtVLqd8z028x5NQBxoCDo%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="大热丝绒修身长袖连衣裙" /> <area coords="259,88,395,631" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQy4%2BkAkz%2F3sXDc7Xs1OWOZnIq5y2XpOBJpatccIjZdLllKpMO9VVh9jiUlTsMQ5MPyMTGk1p%2F%2BDhJPugXFQ0h3xmZD6cEjboaqa6qubgM%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="透视淑女灯笼袖连衣裙" /> <area coords="412,16,622,354" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZPuyNLSuvXYJLbJA6fY20KUWkMkZt0kwN8l1RPC42IVKvB4%2Bomqcf87UrRze50QQJU0H5f52y6bTDCBPsgQiHjxjY3S9gPnaQgp90pogo0g%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="大摆褶肩章连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:260px;left:20px;margin-top:120px;">\r\n				2012年的军装风热度依然没有退减，有别于以往的是，将甜美的风格融入其中，形成新的混搭军装风潮。</p>\r\n			<p class="looks1" style="width:198px;left:457px;margin-top:523px;color:#FFFFFF;line-height:18px;">\r\n				Chanel 2012春夏秀场挂起一股甜美的冰淇凌色彩旋风，融入了简洁干练的扩形，甜美中透露着女人的一丝干练。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_04.jpg" usemap="#Map4" /><map id="Map4" name="Map4"><area coords="722,10,932,307" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWbSsx%2FCUqxhcDblpo3IVFkWExbxmMP%2FJb%2BCTLhpyuO6cUbyAXe2xDFtBbtGxrFasNNAUhb%2Ff0FTK1W3NQXCt3OUfhAmHMTdhvh8QAGQIv6&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="羊毛呢双排扣修身连衣裙洋装" /> <area coords="710,314,869,635" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOf%2BU6KyJ6%2FazlKM6loI4vyyKUO5%2F8H%2BMUZ0wSuqmyI%2B%2BszRxlpinwpyoLiEfZpLm9CCOGbgjGDszmUUDrl%2F%2BPYXBgzydX%2Fa6DA5LZB0LU%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="MIRROR FUN 2012新款春装 连衣裙" /> <area coords="13,197,186,540" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWe26gIBTVPn6IoSXNjYFkdhZejLFIIRAVAkDVmiGRzIW3WzNGr4PU2JiuYxKlF%2FWU4ug4g1mpm2%2FG1FNjPMErV2zz%2BvRyPHqBOSzzKAiV%2B&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="斗篷双排扣外套连衣裙" /> <area coords="209,299,376,630" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ3irdI9nJMH377odCn4ITW9KMw1dl8F0t60yZGS66o%2FE3Scuwq06FJ2pOOqn%2FTGYDkz8Ri4mZMRqbHqXQde8WIywKo2kxjisUi2GmE9H6r&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="收腰带双排扣连衣裙" /> <area coords="525,116,684,437" href="http://item.lp.taobao.com/item.htm?item_id=13784397751" shape="rect" target="_blank" title="淑女修身连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:260px;left:30px;margin-top:110px;line-height:18px">\r\n				Dior推出以&ldquo;花冠&rdquo;命名的服装系列震惊了这个时代，将高贵典雅的服装风格重新演绎，突出女性曼妙的身姿。Dior的新风貌带动了整个设计界，将高级时装业推到一个新的高度。</p>\r\n			<p class="looks1 size12" style="width:120px;left:612px;margin-top:70px;">\r\n				腰线拉高，蓬蓬下摆的连衣裙，不仅能让胸部看起来更丰满，也能让双腿显得更加修长。</p>\r\n			<p class="looks1 size12" style="width:160px;left:42px;margin-top:490px;">\r\n				50年代的连衣裙着重凸显时髦的女人味，让女人变的更加轻盈娇柔。</p>\r\n			<p class="looks1 size12" style="width:160px;left:510px;margin-top:555px;">\r\n				Dior先生认为裙子的最佳长度为离地20厘米，对于下身比较宽的女性，蓬蓬裙能够很好的修饰身形。</p>\r\n			<p>\r\n				<a name="top6"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_05.jpg" usemap="#Map5" /></a><map id="Map5" name="Map5"><area coords="707,256,932,624" href="http://item.taobao.com/item.htm?id=15485400523" shape="rect" target="_blank" title="春天连衣裙" /> <area coords="224,104,406,631" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKlPm3ez0vKJeXLTOo9PcqT0TXuQS%2BEbBtTwf%2FciS96Pc8bcHJcqHEO3pLsK2uACu3pR%2F2l4MjLwh1oG3NX9R3T6x13CEJBu%2BwnK6YxhRU%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="红蓝波点低胸夸张蓬蓬裙" /> <area coords="414,11,662,314" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWawhvkP3UmIe3idVmYySATrpxwUNpMjO9kZZxrY%2FxGkFIjl47fDru2sfJpTqdjFhGdCdOqUtY0nXpefZO2oiuVSihnAgjU%2FDICL8%2F%2FXbw%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="黑色蕾丝拼接红色雪纺连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:260px;left:20px;margin-top:115px;line-height:18px">\r\n				今天的蓬蓬裙与50年代最大的区别在于颜色上已不在拘泥于黑白。明亮的颜色赋予了连衣裙新的生命。</p>\r\n			<p class="looks1" style="width:140px;left:543px;margin-top:503px;color:#FFFFFF;line-height:18px;">\r\n				John Galliano 2012春夏复古的50年代蓬蓬裙，明亮的黄色让蓬蓬裙折射出全新的俏皮女人味。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_06.jpg" usemap="#Map6" /><map id="Map6" name="Map6"><area coords="722,341,917,628" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKlO5ZwoZ6Os6PMKhsRAfjhoLbqWefUgc9iNivNnqapo5yI2%2Bx1INxbmXEUXEW%2B77E7%2B7FoTSQMeucrlWNb%2B%2BINJ7MmDWRRPfD85MYeeVmt&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="优雅时尚拼接连衣裙" /> <area coords="763,8,932,322" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ1FoaHeIEzXna5nrpK9myZtp%2FjJ4M2GHW7SnYq9Gw3wTrl01Qqt7aot5NDEcvXr%2BpIHZ0YE9ucQXEOdjFZZwNZh%2Bwqrki0eSK03eLoeKM%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="性感萝莉撞色复古拼接网纱高腰蓬蓬连衣裙" /> <area coords="10,176,183,537" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA%2BrdPUO26PP3yq1Vz4CPiuyu8zEDr0HpdHvjubf29eieE%2BRfg6OqsxA89xY65S0qMCoAW6PGyHnu1ipa%2BNIoxVxFcCQN0k5wa9F6xnm0k%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="波点吊带裙" /> <area coords="198,284,388,619" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWYKdZwYiynOvY8EMT5iEvOxpfaE20pJMpXlq8NyWlz2cyjOXZp08j8aI0Q6ZdxGPjSR09x9cBXhDx1hKAGSpGfVI0JtPqr7%2BFg4PzhD3Q%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="镂空高腰背心裙连衣裙" /> <area coords="548,78,713,411" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWbSs3c%2Br2U6sPo0xCceAQuIt9TdDqrKAx5NfDXlHxeRCzSZCG3xsTbvj4DomdidF8MbBeE1Txb7yRhhuJ5IPzeG%2FpRDhzlPqNyB5X0O%2Fed&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="百褶卷翘波浪边背心连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:380px;left:25px;margin-top:110px;line-height:18px">\r\n				60年代服装的特征是冲破传统，媒体广告最醒目的词就是&ldquo;年轻&rdquo;。玛丽&middot;昆特设计的迷你裙由此应用而生，&ldquo;大胆的秀出你的腿&rdquo;成为这一时代最响亮的口号。</p>\r\n			<p class="looks1 size12" style="width:130px;left:642px;margin-top:160px;">\r\n				60年代连衣裙的&ldquo;年轻风暴&rdquo;结束了高级时装一统天下的局面，成衣开始变为服装的主角。</p>\r\n			<p class="looks1 size12" style="width:140px;left:232px;margin-top:455px;">\r\n				迷你裙的裸露是一种大胆的态度，不会让人联想到情色，只会让人感到无所妄为的青春态度。</p>\r\n			<p class="looks1 size12" style="width:110px;left:600px;margin-top:470px;">\r\n				迷你裙的出现体现了60年代人们对于个性和自我的渴望，让女人看起来更加自信。</p>\r\n			<p>\r\n				<a name="top3"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_07.jpg" usemap="#Map7" /></a><map id="Map7" name="Map7"><area coords="24,256,193,610" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWawhvkPSlMhqTiwWwduDKkP80c%2Bi463FNEokdGWTIigr%2B63Jy4k8wEJwAkMlqCq5mgc9YWCDHRDzg98rsgUzAdH0%2F1aDDaKYzkxy9%2Fzeti&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="蕾丝修身包臀无袖背心连衣裙" /> <area coords="433,11,642,345" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQwasXM2MxQh2uI%2FibJ5gKYdxkE51l0biF2OXwfxHD3yZFJKHt03f7HVe3TMLnqiGZf2H%2FFnOG0p6V0B7d5QDkM9o2KtzdntsPmZdXrLw%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="翻领短袖H型拉链连衣裙" /> <area coords="724,329,923,628" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQwYX1tZT0DhLwjhrJ%2FA2Rd4qsFeYuVQLWE9UC1zTuZAbMrP7P9nDqrtT2tBN6FLPamhDlyArYa%2BDr390CgexmFgVtWgOgCYaHfqJx5oAU%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="简约大气款直身裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:290px;left:20px;margin-top:115px;line-height:18px">\r\n				60年迷你裙个性鲜明的特征，与多种元素混合重组，成为众多设计师们的灵感来源。</p>\r\n			<p class="looks1" style="width:160px;left:485px;margin-top:535px;color:#FFFFFF;line-height:16px;">\r\n				Alexander Mcqueen2012春夏将碎花与迷你裙组合，演绎出甜美浪漫带有活力的花样迷你裙。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_08.jpg" usemap="#Map8" /><map id="Map8" name="Map8"><area coords="777,7,931,309" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWbSscNtmbzXMOr6P3n4S5%2F7%2FJtsyt4%2BHXj8QQePTiaLv47wuoVQTteNbQLT3uijTQFTlSP8OQbPF851wwGRZqwkIK%2FmGYpJAQne154Sl%2Fl&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="透视网纱露背连衣裙" /> <area coords="709,324,910,612" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWawAlr9lExFwKrDhNLOrpok%2Fhega4xbun7sSUH1GR2%2BVLsGQOWHoH5OynwS0giKgX7IK4Q8ADRXAxN%2Bgs9Gf5QR48ES6Es1ndQF5XlrxD8&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="娃娃领修身 韩版夏天连衣裙" /> <area coords="543,108,702,454" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWbSs3Y56XLlvun49OB1m%2FgBdTECgKfg9du99lu1wWAWp%2F3%2BW4afucgNFnVhaGQvXqYa8jaPwqFtntG9AjTkTsGwoexMFqXeoyhDVLRU4Q%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="收腰立体版型丝质连衣裙" /> <area coords="214,268,380,611" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA2wsfGBJEtMcl5E19FMfjN%2FE9MF9UoWOR8k2XBBnq9owcDlMrHQMtqqCm333Dx7aj9eMlkBWti19o6kM%2FFQweeZJwqTOpAhqje8kBMcBo%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="性感露背裙子" /> <area coords="19,190,182,563" href="http://item.lp.taobao.com/item.htm?id=15197080799" shape="rect" target="_blank" title="圆领欧美蕾丝雪纺珠片连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:380px;left:20px;margin-top:140px;line-height:18px">\r\n				70年代的欧洲，经济萧条导致人们开始排斥过于奢华的服装风格，服装出现了以街头为背景的&ldquo;朋克形象&rdquo;，独立，充分表现自我是这一时期的着装原则。</p>\r\n			<p class="looks1 size12" style="width:145px;left:605px;margin-top:100px;">\r\n				另类的朋克服饰颠覆了传统的着装模式，同时也为设计师们带来了创作灵感，他们将街头的朋克装扮引入时装界，成功的将叛逆文化转变为主流文化。</p>\r\n			<p class="looks1 size12" style="width:170px;left:20px;margin-top:530px;">\r\n				说起叛逆不得不提的就是英国朋克教母Vivienne Westwood，在70年代为了帮乐队男友做演出服而从事服装设计，她坚持性感和叛逆就是时髦的信条。</p>\r\n			<p class="looks1 size12" style="width:110px;left:600px;margin-top:490px;">\r\n				70年代的法国提出了&ldquo;无性别主义&rdquo;的口号，着装风格走向多元化，女人们也纷纷尝试铆钉，骷髅等朋克元素。</p>\r\n			<p>\r\n				<a name="top4"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_09.jpg" usemap="#Map9" /></a><map id="Map9" name="Map9"><area coords="717,303,907,644" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOeMvLYD15pEYO67K%2BE3G9p0Vi24QcdycxIbEDyyhe5XdtOWZkkyJjl4s8lUrZ2x6pjX6yClarKXZ8HiWZr4MMa5u8ZQ5UvD3bnIjMlpno%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="无袖铆钉包臀显瘦连衣裙" /> <area coords="195,210,398,572" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZP8FIXEQBhIRQF0FZX%2BGAm4qwQ4SErn%2BepVIS%2F4w7CrT9oaeBUsTRlP%2F2LRA72QlmM0%2FwbaqKU9%2B9mFAWTIJ3IH17K3LnwH7jRtqK9%2F2Yg%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="涂鸦印花骷髅长袖连衣" /> <area coords="412,21,606,366" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWZX9mPSkUZflLDXQDbn6Mpc1q44NCzgL2ro6D98wRw3GvvWAbn%2FqI4nla7awacRoEKiZo7z0dMQ7ZhfGJnqFFjWIi0E4iZKI0xIZkNSuQ%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="加棉皮革 宽肩铆钉设计 修身连身裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:290px;left:18px;margin-top:115px;line-height:18px">\r\n				朋克风的铆钉、骷髅元素如今在服装上被广泛运用，但已不仅仅局限于原始的街头朋克，通过与不同材质的面料和服装款式融合形成多元素的新朋克风。</p>\r\n			<p class="looks1" style="width:150px;left:525px;margin-top:510px;color:#FFFFFF;line-height:16px;">\r\n				Versace 2012春夏将大大小小的铆钉组合成图案，并在连衣裙上拼接雪纺面料，让朋克也变的柔美起来。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_10.jpg" usemap="#Map10" /><map id="Map10" name="Map10"><area coords="739,335,906,623" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOR8DzZ3o9M42RWk36jY%2BYtcXJjIxw4EuH%2FjAPeM771SWNZJWl1u0Gbz%2FEgVmwj59pPy7ej0UMGJ4m3OuDJStFwF19ypXrBmC%2F7slYR6J4%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="骷髅订钻吊带裙" /> <area coords="720,15,922,316" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOW19rO%2Bhfx1N4a%2BWxdIDvTH2frDIJpbL4X1aKybNuqxBRqrl1u%2F67GhuLILTWnQgfHaBmQb5L6E3EzP7jLrN7PGT075spsMJwCNuj5Q5w%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="泡泡袖针织性感包臀连衣裙" /> <area coords="24,217,217,533" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOf%2FbOkpQjMlbK8x4uN1NOggP0EFRlhUHyXttbzbiMwOrJXJ%2Be3R4fDWsth3Fmem8oAv%2FlcOAXnPq8TlAhUqMbPEFccLgrC%2Btor1A%2FiqHc%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="蕾丝长袖连衣裙" /> <area coords="235,322,408,626" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWXElUSX1CCsg1hhXtujYlPH5PTOWCFbUtwupZ9q29%2Fs2wzWQ%2FHpL56XL6u0YDJfLB7Q8IKgR44MayTMj4BY8hYvFwxfZxDaK7YGweLOzI%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="复古性感铆钉装饰木耳边露背包臀修身连衣裙" /> <area coords="563,131,715,459" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWWyeizVylivaVU4eV%2FXNm7E32elMYEhJALN1iBJiZTSz7SJtRMYegT8dDPr0onnD6blgwDHIE0Ab89lHSbY8a5YkWlioH%2BzqQ3zA0FU0yW&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="原创欧美范无袖铆钉雪纺裙连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:380px;left:32px;margin-top:120px;line-height:18px">\r\n				80年代是Disco绚丽的霓虹岁月，是一个鼓励人们追逐梦想的年代，服装的多元化发展步入新的高峰。当时人们的穿衣灵感大多来自于当时的流行偶像。</p>\r\n			<p class="looks1 size12" style="width:125px;left:625px;margin-top:130px;">\r\n				衣着大胆的麦当娜成为性感的&ldquo;坏女孩&rdquo;代名词，由此激发了设计师Jean Paul Gaultier的灵感，为她设计了那件举世闻名的锥形胸衣。</p>\r\n			<p class="looks1 size12" style="width:130px;left:40px;margin-top:240px;">\r\n				在1984年首届MTV音乐录影带大奖颁奖礼上，麦当娜身着暴露胸衣，带着她标志性的&ldquo;Boy Toy&rdquo;腰带登台演唱《<br />\r\n				宛若处女》。</p>\r\n			<p class="looks1 size12" style="width:180px;left:570px;margin-top:565px;">\r\n				迈克尔&middot;杰克逊作为街舞舞神，掀起了一股风靡全球的机械舞霹雳舞热潮，他的招牌性闪亮Disco外套也成为当时大家竞相模仿的对象。</p>\r\n			<p>\r\n				<a name="top5"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_11.jpg" usemap="#Map11" /></a><map id="Map11" name="Map11"><area coords="461,8,610,328" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ1Fx30V%2BFRIyBqnvDPrPHAWPoCuoB%2FjU1NBXgj6LoFiQ0ZZrxYj854QmelhRFEOWLEaXKKkvj4h8ympUlLoHCjydpUC%2F4GgWuNGtjlKHw%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="复古胸拼接修身背心裙" /> <area coords="31,231,172,591" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWe3To1eo7SuaTZEYBptWLRQ6eWX2mZ%2FrBz50OmxCiAFirnm9qrqItgmmTfVJq%2B5Xbeu5mFgllhQ%2FxuD8hAYLdR1ZTym%2B3X9JzVbtii9w%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="复古春秋新款纯色显瘦长袖套头百褶连衣裙" /> <area coords="731,269,895,635" href="http://item.taobao.com/item.htm?id=14549227634" shape="rect" target="_blank" title="无袖连衣裙" /> <area coords="265,190,431,602" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWe2T1iWFdCtKLdStoinxGgII%2B6Cd1yQuSHSMuDjTN9cCQbJVzocyGqalLmUPN43roDyx6JZiv6dGXE8Dd0egMoUBsBHlzrRLNjz%2Fkl6Wc%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="低胸长袖修身性感胸衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:270px;left:18px;margin-top:115px;line-height:18px">\r\n				80年代的服装风格充斥着浮夸艳俗的种种元素，如今，内衣外穿已不是&ldquo;坏女孩&rdquo;才有的穿衣风格，BlingBling也不只局限于Disco舞厅，但80年代的一切依然在被服装界所津津乐道。</p>\r\n			<p class="looks1" style="width:160px;left:498px;margin-top:510px;color:#FFFFFF;line-height:16px;">\r\n				Alexander Mcqueen2012春夏内衣外穿元素被广泛运用在连衣裙上，不管是甜美还是冷艳，都在诉说着那个经久不衰的经典风格。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_12.jpg" usemap="#Map12" /><map id="Map12" name="Map12"><area coords="706,334,882,623" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOf%2FbAjEmsRKkNEJtYv9DoeXFY01zGYqP47aGpE%2BeUIddm8Un%2BS%2BS9bguyC%2BnRr2SvEV7nRt8PfqPS%2B8Fwp4zHGl2UKgxqqZ6nHCkoqCN3Y&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="修身气质百搭连衣裙" /> <area coords="747,19,923,308" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOR%2F4aLKGRPwodooWZ0kdna1iYm7jWv9yseIwy2%2B6UgVKZsCL4A4JfIZLBj0b%2F2dkpblddCPTVQess30S82V9UDwvQbxtuyOSNO8BFjv1w%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="女装连衣裙" /> <area coords="564,101,691,450" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTZPBfjcoOl0oJp0rdVX%2FshVGmMUV0sfR9%2BZ%2FM%2BxRjnSHpwuB4gkWOg%2BkhYvgv7DzeU4dtBNTmLN0On8FR16SBkrtPR6twE%2FB9ZsJLdxO63w%3D%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="必备荧光撞色性感紧身抹胸裙" /> <area coords="24,226,180,575" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOW39yayF%2BK0pdTUB0FCQTnu9yMOIXeIABM4q26bI2NatnVcy6x8x9dVh6LILBr9kv26gvypU6PFjMFzyEjH1qvXWBckAytMXKXfdrKyxI%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="性感V领显瘦黑蕾丝连衣裙" /> <area coords="204,312,374,629" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKkXCrXnRSEHIsB512u45EDl%2BlL5GOD4%2BBFalkpcC22yUG4O%2Fy%2FP3TtyLYKUT6rf3ldxlitkvbblceVcATVO3Bt1qXUNE58mMi5G%2F1Yf5c%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="订珠闪亮亮片弹力短袖连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:380px;left:27px;margin-top:120px;line-height:18px">\r\n				90年代世界经济快速发展，生态坏境日益严重，提倡节俭和注重环保成为当时社会的潮流。简洁自然的优雅风格，成为当时最重要的流行元素。</p>\r\n			<p class="looks1 size12" style="width:125px;left:645px;margin-top:130px;">\r\n				90年代的时代偶像黛安娜王妃，她的着装风格对公众具有广泛的影响力。她优雅端庄、注重环保的着装品位在当时也是绝无仅有的。</p>\r\n			<p class="looks1 size12" style="width:150px;left:60px;margin-top:500px;">\r\n				90年代连衣裙面料颜色更趋于轻柔的材质和自然柔和的色调，带有怀旧的情结和田园风格。</p>\r\n			<p class="looks1 size12" style="width:110px;left:615px;margin-top:525px;">\r\n				黛安娜王妃简洁时髦的连衣裙造型，依旧能够表现出无法阻挡的女性魅力。</p>\r\n			<p>\r\n				<a name="top7"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_13.jpg" usemap="#Map13" /></a><map id="Map13" name="Map13"><area coords="471,3,611,363" href="http://item.taobao.com/item.htm?id=13900756279" shape="rect" target="_blank" title="百褶针织连衣裙" /> <area coords="705,262,861,621" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWXEE4d0F3vhHJlTaQTdPEAeu%2BTpmksuTVj6QQ8sOCgTRa%2F9dMle1zBJExwfC9GdyYgY1ezNPwkQz7EzOkCfhBpHlYJf0VfyyaidGheeEw%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="复古蝴蝶结通勤修身连衣裙" /> <area coords="254,225,408,610" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOePodGDJf22zU89%2BXHYrZr5yW39udtNHmsP5eZAt76p7VBLlpMGuSAw83uFlfLHuwNIFMWF35t%2FYP25QzToXAiY3Oo7u4RLSEJqzA0j9A%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="针织修身无袖连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<p class="looks1" style="width:250px;left:18px;margin-top:115px;line-height:18px">\r\n				九十年代的服装款型，被设计师加重细节设计，重登春夏秀场，质朴的色彩中添加一丝优雅，宽腰带代表了当今女性强势独立的个性。</p>\r\n			<p class="looks1" style="width:150px;left:490px;margin-top:500px;color:#FFFFFF;line-height:16px;">\r\n				简约的长袖连衣裙，质朴的色彩，设计师略显夸张的宽腰带设计，带给90年代连衣裙新的创意灵感。</p>\r\n			<p>\r\n				<img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_14.jpg" usemap="#Map14" /><map id="Map14" name="Map14"><area coords="769,9,927,315" href="http://item.taobao.com/item.htm?id=15728424481" shape="rect" target="_blank" title="经典小圆领连衣裙" /> <area coords="723,330,881,636" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ1EOsprVjS0addqHw0EkeP%2B8AEpaRC4ubgPSGnxr034c47LCvnUKdWOIXoB9l3LziZDtkPu9zcir%2Fj%2FvVcWDRsDdPoTYANaiBW4%2F%2FHCCY%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="条纹胸前小袋装饰连衣裙" /> <area coords="537,98,703,462" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWXH1aPGII731RkkWbFlphsm3KOnkvpj7Vh27Oh3cJNMw1RHbANJUJDLAoG1XXKOz8hB0OaW3MEfYDmNFvVc7z5yfMTJJ%2BfrY1tcEIig04%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="荷叶边韩版修身V领连衣裙" /> <area coords="27,222,163,596" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKlPUZElG%2Bm0w9EyHAlNL3R1Qm7yXRJN%2FGxhYmQ6pLgiQdMJlmGMS7VmQpwRuhsn3sp%2Ba9KJUlh3BZHSnTculJqFdHmwC09eldua7oDf9N%2B&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="女春装裙子" /> <area coords="214,288,347,633" href="http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWWy9ecWaYbab%2FuPQR1Sd2uwexnBQKfCs%2B7VZS%2Fe0EN131krzpjtOWhkA6QEOtEzYgjCd7RaK1mmMw74eTSWSqOmFfWcCmwre%2FjDRpMMIk%3D&amp;p=mm_30337579_0_0&amp;n=19&amp;u=linkchiccps" shape="rect" target="_blank" title="垫肩无袖连衣裙" /></map></p>\r\n		</div>\r\n		<div class="looksimg">\r\n			<ul>\r\n				<li style="width:190px;">\r\n					<a href="#top1"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_map.jpg" /></a></li>\r\n				<li style="width:245px;">\r\n					<a href="#top2"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_map1.jpg" /></a></li>\r\n				<li style="width:145px;">\r\n					<a href="#top3"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_map2.jpg" /></a></li>\r\n				<li style="width:185px;">\r\n					<a href="#top4"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_map3.jpg" /></a></li>\r\n				<li style="width:185px;">\r\n					<a href="#top5"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_map4.jpg" /></a></li>\r\n				<li style="width:280px;">\r\n					<a href="#top6"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_map5.jpg" /></a></li>\r\n				<li style="width:425px;font-size:14px;line-height:18px">\r\n					<p>\r\n						<img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_map6.jpg" /></p>\r\n					<p style="padding-right:20px;">\r\n						美的标准在不断发生着变化，流行也随之不断变化着。现代社会的流行已不再是过去单一的流行模式，而是愈演愈烈的朝着多元化的方向发展。过去的流行风格对于我们来说是最好的灵感，能够引导我们去创造出新的流行。流行不断的回归，被赋予新的元素变为新的流行，就这样周而复始，在回归中前行。</p>\r\n				</li>\r\n				<li style="width:245px;">\r\n					<a href="#top7"><img src="http://www.linkchic.com/zhuanti/nvzhuang/ndglyq_map7.jpg" /></a></li>\r\n			</ul>\r\n		</div>\r\n	</div>\r\n	<!-- div class="images"><img src="images/ysg_1.jpg" /></div -->\r\n	<div class="boots_one9">\r\n		<div class="boots_one9zt">\r\n			&nbsp;</div>\r\n	</div>\r\n	<!--<div class="zt"><iframe height="210" frameborder="0" width="950" scrolling="no" src="http://service.t.sina.com.cn/widget/relationship/bulkfollow.php?appkey=949636928&uids=1862486280,2205828291,1667006755,1644693712,1655250123,1708715983,1641487524,1658893964&color=ffffff,ffffff,CC0000,0022AA&showtitle=1&showinfo=1" ></iframe></div>\r\n	--></div>\r\n<p>\r\n	&nbsp;</p>\r\n', 1, 1, 0, 100, 1, 0, 1333661468, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_magazine_category`
--

CREATE TABLE IF NOT EXISTS `fanwe_magazine_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `img` varchar(255) NOT NULL DEFAULT '',
  `img_hover` varchar(255) NOT NULL DEFAULT '',
  `seo_title` varchar(255) NOT NULL DEFAULT '',
  `seo_keywords` text,
  `seo_desc` text,
  `sort` smallint(5) NOT NULL DEFAULT '10',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `fanwe_magazine_category`
--

INSERT INTO `fanwe_magazine_category` (`id`, `name`, `img`, `img_hover`, `seo_title`, `seo_keywords`, `seo_desc`, `sort`, `status`) VALUES
(1, '女士衣橱', './public/upload/images/201111/27/4ed1e6e200df4.png', './public/upload/images/201111/27/4ed1e7c940571.png', '淘宝女士衣橱', '女士衣橱，淘宝，女装', '淘宝女士衣橱', 100, 1),
(2, '男士衣商', './public/upload/images/201111/27/4ed1e6f2a68d5.png', './public/upload/images/201111/27/4ed1e7da120e5.png', '淘宝男士衣商', '淘宝，男士，时尚', '淘宝，男士，时尚', 100, 1),
(3, '包腔包调', './public/upload/images/201111/27/4ed1e700ade32.png', './public/upload/images/201111/27/4ed1e7e7800fe.png', '包腔包调', '包包，淘宝包包，淘宝，包腔包调', '包包，淘宝包包，淘宝，包腔包调', 100, 1),
(4, '鞋履攻略', './public/upload/images/201111/27/4ed1e709c63b5.png', './public/upload/images/201111/27/4ed1e7ee17598.png', '鞋履攻略', '女鞋，淘宝，女装', '女鞋，淘宝，女装', 100, 1),
(5, '护肤&彩妆', './public/upload/images/201111/27/4ed1e71912037.png', './public/upload/images/201111/27/4ed1e7f5e1d65.png', '护肤&彩妆', '淘宝，护肤，彩妆，时尚', '淘宝，护肤，彩妆，时尚', 100, 1),
(6, '其它', '', '', '淘宝其它', '淘宝，时尚', '淘宝，时尚', 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_manage_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_manage_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_id` int(11) NOT NULL DEFAULT '0',
  `module` varchar(60) NOT NULL DEFAULT '',
  `action` varchar(60) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_medal`
--

CREATE TABLE IF NOT EXISTS `fanwe_medal` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `image` varchar(255) DEFAULT '',
  `give_type` tinyint(1) DEFAULT '0',
  `expiration` smallint(6) DEFAULT '0',
  `conditions` varchar(60) NOT NULL DEFAULT '',
  `keywords` text,
  `confine` int(11) DEFAULT '0',
  `allow_group` text,
  `desc` text,
  `sort` smallint(5) DEFAULT '100',
  `status` tinyint(1) DEFAULT '1',
  `is_fix` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `status` (`status`),
  KEY `sort` (`sort`),
  KEY `image` (`image`),
  KEY `conditions` (`conditions`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_medal`
--

INSERT INTO `fanwe_medal` (`mid`, `name`, `image`, `give_type`, `expiration`, `conditions`, `keywords`, `confine`, `allow_group`, `desc`, `sort`, `status`, `is_fix`) VALUES
(1, '新人勋章', 'shequjumin.png', 0, 0, 'continue_login', '', 1, '', '分享你的第一个宝贝吧。', 100, 1, 0),
(2, '差价指南针', 'shequmingxing.png', 1, 0, '', '', 0, '', '哪里有差价，就指向哪里，让姐妹不多花一分的冤枉银子。\r\n你就是传说中独步江湖、人见人爱、花见花开的差价女王啦！', 100, 1, 0),
(3, '呼朋唤友', '18.png', 0, 0, 'referrals', '', 3, '', '成功邀请3个新蘑菇注册，就可拿到该勋章', 100, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_medal_apply`
--

CREATE TABLE IF NOT EXISTS `fanwe_medal_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `mid` smallint(6) NOT NULL,
  `reason` text,
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_2` (`uid`,`mid`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_nav`
--

CREATE TABLE IF NOT EXISTS `fanwe_nav` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cid` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(5) NOT NULL DEFAULT '100',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_fix` tinyint(1) NOT NULL DEFAULT '0',
  `target` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_nav_category`
--

CREATE TABLE IF NOT EXISTS `fanwe_nav_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `sort` smallint(5) NOT NULL DEFAULT '100',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_fix` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `fanwe_nav_category`
--

INSERT INTO `fanwe_nav_category` (`id`, `parent_id`, `name`, `sort`, `status`, `is_fix`) VALUES
(1, 0, '主导航', 100, 1, 1),
(2, 0, '底部导航', 100, 1, 1),
(3, 0, '固定链接', 100, 1, 1),
(4, 2, '网站', 100, 0, 0),
(5, 2, '团队', 100, 0, 0),
(6, 2, '帮助', 100, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_order`
--

CREATE TABLE IF NOT EXISTS `fanwe_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL,
  `data_name` varchar(255) NOT NULL DEFAULT '',
  `goods_status` tinyint(1) NOT NULL COMMENT '0:未发货;1:部分发货;2:全部发货;3:部分退货;4:全部退货'',',
  `data_num` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL COMMENT '订单状态\r\n0: 未确认\r\n1: 完成\r\n2: 作废',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `region_lv1` int(11) NOT NULL,
  `region_lv2` int(11) NOT NULL,
  `region_lv3` int(11) NOT NULL,
  `region_lv4` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_phone` varchar(255) NOT NULL,
  `fax_phone` varchar(255) NOT NULL,
  `fix_phone` varchar(255) NOT NULL,
  `alim` varchar(255) NOT NULL,
  `msn` varchar(255) NOT NULL,
  `qq` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `memo` varchar(255) NOT NULL,
  `adm_memo` varchar(255) NOT NULL,
  `order_score` int(11) NOT NULL,
  `rec_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `uid` (`uid`),
  KEY `rec_id` (`rec_id`),
  KEY `goods_status` (`goods_status`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_pub_schedule`
--

CREATE TABLE IF NOT EXISTS `fanwe_pub_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `pub_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_referrals`
--

CREATE TABLE IF NOT EXISTS `fanwe_referrals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `is_pay` tinyint(1) NOT NULL,
  `score` float(10,0) NOT NULL,
  `create_time` int(10) DEFAULT '0',
  `create_day` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `is_pay` (`is_pay`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_region`
--

CREATE TABLE IF NOT EXISTS `fanwe_region` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `sort` smallint(5) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=573 ;

--
-- 转存表中的数据 `fanwe_region`
--

INSERT INTO `fanwe_region` (`id`, `parent_id`, `name`, `sort`) VALUES
(1, 0, '北京', 100),
(2, 0, '上海', 100),
(3, 0, '重庆', 100),
(4, 0, '安徽', 100),
(5, 0, '福建', 100),
(6, 0, '甘肃', 100),
(7, 0, '广东', 100),
(8, 0, '广西', 100),
(9, 0, '贵州', 100),
(10, 0, '海南', 100),
(11, 0, '河北', 100),
(12, 0, '黑龙江', 100),
(13, 0, '河南', 100),
(14, 0, '香港', 100),
(15, 0, '湖北', 100),
(16, 0, '湖南', 100),
(17, 0, '江苏', 100),
(18, 0, '江西', 100),
(19, 0, '吉林', 100),
(20, 0, '辽宁', 100),
(21, 0, '澳门', 100),
(22, 0, '内蒙古', 100),
(23, 0, '宁夏', 100),
(24, 0, '青海', 100),
(25, 0, '山东', 100),
(26, 0, '山西', 100),
(27, 0, '陕西', 100),
(28, 0, '四川', 100),
(29, 0, '台湾', 100),
(30, 0, '天津', 100),
(31, 0, '新疆', 100),
(32, 0, '西藏', 100),
(33, 0, '云南', 100),
(34, 0, '浙江', 100),
(35, 0, '海外', 100),
(36, 1, '东城', 100),
(37, 1, '西城', 100),
(38, 1, '崇文', 100),
(39, 1, '宣武', 100),
(40, 1, '朝阳', 100),
(41, 1, '丰台', 100),
(42, 1, '石景山', 100),
(43, 1, '海淀', 100),
(44, 1, '门头沟', 100),
(45, 1, '房山', 100),
(46, 1, '通州', 100),
(47, 1, '顺义', 100),
(48, 1, '昌平', 100),
(49, 1, '大兴', 100),
(50, 1, '平谷', 100),
(51, 1, '怀柔', 100),
(52, 1, '密云', 100),
(53, 1, '延庆', 100),
(54, 2, '崇明', 100),
(55, 2, '黄浦', 100),
(56, 2, '卢湾', 100),
(57, 2, '徐汇', 100),
(58, 2, '长宁', 100),
(59, 2, '静安', 100),
(60, 2, '普陀', 100),
(61, 2, '闸北', 100),
(62, 2, '虹口', 100),
(63, 2, '杨浦', 100),
(64, 2, '闵行', 100),
(65, 2, '宝山', 100),
(66, 2, '嘉定', 100),
(67, 2, '浦东', 100),
(68, 2, '金山', 100),
(69, 2, '松江', 100),
(70, 2, '青浦', 100),
(71, 2, '南汇', 100),
(72, 2, '奉贤', 100),
(73, 3, '万州', 100),
(74, 3, '涪陵', 100),
(75, 3, '渝中', 100),
(76, 3, '大渡口', 100),
(77, 3, '江北', 100),
(78, 3, '沙坪坝', 100),
(79, 3, '九龙坡', 100),
(80, 3, '南岸', 100),
(81, 3, '北碚', 100),
(82, 3, '万盛', 100),
(83, 3, '双挢', 100),
(84, 3, '渝北', 100),
(85, 3, '巴南', 100),
(86, 3, '黔江', 100),
(87, 3, '长寿', 100),
(88, 3, '綦江', 100),
(89, 3, '潼南', 100),
(90, 3, '铜梁', 100),
(91, 3, '大足', 100),
(92, 3, '荣昌', 100),
(93, 3, '壁山', 100),
(94, 3, '梁平', 100),
(95, 3, '城口', 100),
(96, 3, '丰都', 100),
(97, 3, '垫江', 100),
(98, 3, '武隆', 100),
(99, 3, '忠县', 100),
(100, 3, '开县', 100),
(101, 3, '云阳', 100),
(102, 3, '奉节', 100),
(103, 3, '巫山', 100),
(104, 3, '巫溪', 100),
(105, 3, '石柱', 100),
(106, 3, '秀山', 100),
(107, 3, '酉阳', 100),
(108, 3, '彭水', 100),
(109, 3, '江津', 100),
(110, 3, '合川', 100),
(111, 3, '永川', 100),
(112, 3, '南川', 100),
(113, 4, '合肥', 100),
(114, 4, '安庆', 100),
(115, 4, '蚌埠', 100),
(116, 4, '亳州', 100),
(117, 4, '巢湖', 100),
(118, 4, '滁州', 100),
(119, 4, '阜阳', 100),
(120, 4, '贵池', 100),
(121, 4, '淮北', 100),
(122, 4, '淮化', 100),
(123, 4, '淮南', 100),
(124, 4, '黄山', 100),
(125, 4, '九华山', 100),
(126, 4, '六安', 100),
(127, 4, '马鞍山', 100),
(128, 4, '宿州', 100),
(129, 4, '铜陵', 100),
(130, 4, '屯溪', 100),
(131, 4, '芜湖', 100),
(132, 4, '宣城', 100),
(133, 5, '福州', 100),
(134, 5, '福安', 100),
(135, 5, '龙岩', 100),
(136, 5, '南平', 100),
(137, 5, '宁德', 100),
(138, 5, '莆田', 100),
(139, 5, '泉州', 100),
(140, 5, '三明', 100),
(141, 5, '邵武', 100),
(142, 5, '石狮', 100),
(143, 5, '永安', 100),
(144, 5, '武夷山', 100),
(145, 5, '厦门', 100),
(146, 5, '漳州', 100),
(147, 6, '兰州', 100),
(148, 6, '白银', 100),
(149, 6, '定西', 100),
(150, 6, '敦煌', 100),
(151, 6, '甘南', 100),
(152, 6, '金昌', 100),
(153, 6, '酒泉', 100),
(154, 6, '临夏', 100),
(155, 6, '平凉', 100),
(156, 6, '天水', 100),
(157, 6, '武都', 100),
(158, 6, '武威', 100),
(159, 6, '西峰', 100),
(160, 6, '张掖', 100),
(161, 7, '广州', 100),
(162, 7, '潮阳', 100),
(163, 7, '潮州', 100),
(164, 7, '澄海', 100),
(165, 7, '东莞', 100),
(166, 7, '佛山', 100),
(167, 7, '河源', 100),
(168, 7, '惠州', 100),
(169, 7, '江门', 100),
(170, 7, '揭阳', 100),
(171, 7, '开平', 100),
(172, 7, '茂名', 100),
(173, 7, '梅州', 100),
(174, 7, '清远', 100),
(175, 7, '汕头', 100),
(176, 7, '汕尾', 100),
(177, 7, '韶关', 100),
(178, 7, '深圳', 100),
(179, 7, '顺德', 100),
(180, 7, '阳江', 100),
(181, 7, '英德', 100),
(182, 7, '云浮', 100),
(183, 7, '增城', 100),
(184, 7, '湛江', 100),
(185, 7, '肇庆', 100),
(186, 7, '中山', 100),
(187, 7, '珠海', 100),
(188, 8, '南宁', 100),
(189, 8, '百色', 100),
(190, 8, '北海', 100),
(191, 8, '桂林', 100),
(192, 8, '防城港', 100),
(193, 8, '河池', 100),
(194, 8, '贺州', 100),
(195, 8, '柳州', 100),
(196, 8, '钦州', 100),
(197, 8, '梧州', 100),
(198, 8, '玉林', 100),
(199, 9, '贵阳', 100),
(200, 9, '安顺', 100),
(201, 9, '毕节', 100),
(202, 9, '都匀', 100),
(203, 9, '凯里', 100),
(204, 9, '六盘水', 100),
(205, 9, '铜仁', 100),
(206, 9, '兴义', 100),
(207, 9, '玉屏', 100),
(208, 9, '遵义', 100),
(209, 10, '海口', 100),
(210, 10, '儋县', 100),
(211, 10, '陵水', 100),
(212, 10, '琼海', 100),
(213, 10, '三亚', 100),
(214, 10, '通什', 100),
(215, 10, '万宁', 100),
(216, 11, '石家庄', 100),
(217, 11, '保定', 100),
(218, 11, '北戴河', 100),
(219, 11, '沧州', 100),
(220, 11, '承德', 100),
(221, 11, '丰润', 100),
(222, 11, '邯郸', 100),
(223, 11, '衡水', 100),
(224, 11, '廊坊', 100),
(225, 11, '南戴河', 100),
(226, 11, '秦皇岛', 100),
(227, 11, '唐山', 100),
(228, 11, '新城', 100),
(229, 11, '邢台', 100),
(230, 11, '张家口', 100),
(231, 12, '哈尔滨', 100),
(232, 12, '北安', 100),
(233, 12, '大庆', 100),
(234, 12, '大兴安岭', 100),
(235, 12, '鹤岗', 100),
(236, 12, '黑河', 100),
(237, 12, '佳木斯', 100),
(238, 12, '鸡西', 100),
(239, 12, '牡丹江', 100),
(240, 12, '齐齐哈尔', 100),
(241, 12, '七台河', 100),
(242, 12, '双鸭山', 100),
(243, 12, '绥化', 100),
(244, 12, '伊春', 100),
(245, 13, '郑州', 100),
(246, 13, '安阳', 100),
(247, 13, '鹤壁', 100),
(248, 13, '潢川', 100),
(249, 13, '焦作', 100),
(250, 13, '济源', 100),
(251, 13, '开封', 100),
(252, 13, '漯河', 100),
(253, 13, '洛阳', 100),
(254, 13, '南阳', 100),
(255, 13, '平顶山', 100),
(256, 13, '濮阳', 100),
(257, 13, '三门峡', 100),
(258, 13, '商丘', 100),
(259, 13, '新乡', 100),
(260, 13, '信阳', 100),
(261, 13, '许昌', 100),
(262, 13, '周口', 100),
(263, 13, '驻马店', 100),
(264, 14, '香港', 100),
(265, 14, '九龙', 100),
(266, 14, '新界', 100),
(267, 15, '武汉', 100),
(268, 15, '恩施', 100),
(269, 15, '鄂州', 100),
(270, 15, '黄冈', 100),
(271, 15, '黄石', 100),
(272, 15, '荆门', 100),
(273, 15, '荆州', 100),
(274, 15, '潜江', 100),
(275, 15, '十堰', 100),
(276, 15, '随州', 100),
(277, 15, '武穴', 100),
(278, 15, '仙桃', 100),
(279, 15, '咸宁', 100),
(280, 15, '襄阳', 100),
(281, 15, '襄樊', 100),
(282, 15, '孝感', 100),
(283, 15, '宜昌', 100),
(284, 16, '长沙', 100),
(285, 16, '常德', 100),
(286, 16, '郴州', 100),
(287, 16, '衡阳', 100),
(288, 16, '怀化', 100),
(289, 16, '吉首', 100),
(290, 16, '娄底', 100),
(291, 16, '邵阳', 100),
(292, 16, '湘潭', 100),
(293, 16, '益阳', 100),
(294, 16, '岳阳', 100),
(295, 16, '永州', 100),
(296, 16, '张家界', 100),
(297, 16, '株洲', 100),
(298, 17, '南京', 100),
(299, 17, '常熟', 100),
(300, 17, '常州', 100),
(301, 17, '海门', 100),
(302, 17, '淮安', 100),
(303, 17, '江都', 100),
(304, 17, '江阴', 100),
(305, 17, '昆山', 100),
(306, 17, '连云港', 100),
(307, 17, '南通', 100),
(308, 17, '启东', 100),
(309, 17, '沭阳', 100),
(310, 17, '宿迁', 100),
(311, 17, '苏州', 100),
(312, 17, '太仓', 100),
(313, 17, '泰州', 100),
(314, 17, '同里', 100),
(315, 17, '无锡', 100),
(316, 17, '徐州', 100),
(317, 17, '盐城', 100),
(318, 17, '扬州', 100),
(319, 17, '宜兴', 100),
(320, 17, '仪征', 100),
(321, 17, '张家港', 100),
(322, 17, '镇江', 100),
(323, 17, '周庄', 100),
(324, 18, '南昌', 100),
(325, 18, '抚州', 100),
(326, 18, '赣州', 100),
(327, 18, '吉安', 100),
(328, 18, '景德镇', 100),
(329, 18, '井冈山', 100),
(330, 18, '九江', 100),
(331, 18, '庐山', 100),
(332, 18, '萍乡', 100),
(333, 18, '上饶', 100),
(334, 18, '新余', 100),
(335, 18, '宜春', 100),
(336, 18, '鹰潭', 100),
(337, 19, '长春', 100),
(338, 19, '白城', 100),
(339, 19, '白山', 100),
(340, 19, '珲春', 100),
(341, 19, '辽源', 100),
(342, 19, '梅河', 100),
(343, 19, '吉林', 100),
(344, 19, '四平', 100),
(345, 19, '松原', 100),
(346, 19, '通化', 100),
(347, 19, '延吉', 100),
(348, 20, '沈阳', 100),
(349, 20, '鞍山', 100),
(350, 20, '本溪', 100),
(351, 20, '朝阳', 100),
(352, 20, '大连', 100),
(353, 20, '丹东', 100),
(354, 20, '抚顺', 100),
(355, 20, '阜新', 100),
(356, 20, '葫芦岛', 100),
(357, 20, '锦州', 100),
(358, 20, '辽阳', 100),
(359, 20, '盘锦', 100),
(360, 20, '铁岭', 100),
(361, 20, '营口', 100),
(362, 21, '澳门', 100),
(363, 22, '呼和浩特', 100),
(364, 22, '阿拉善盟', 100),
(365, 22, '包头', 100),
(366, 22, '赤峰', 100),
(367, 22, '东胜', 100),
(368, 22, '海拉尔', 100),
(369, 22, '集宁', 100),
(370, 22, '临河', 100),
(371, 22, '通辽', 100),
(372, 22, '乌海', 100),
(373, 22, '乌兰浩特', 100),
(374, 22, '锡林浩特', 100),
(375, 23, '银川', 100),
(376, 23, '固源', 100),
(377, 23, '石嘴山', 100),
(378, 23, '吴忠', 100),
(379, 24, '西宁', 100),
(380, 24, '德令哈', 100),
(381, 24, '格尔木', 100),
(382, 24, '共和', 100),
(383, 24, '海东', 100),
(384, 24, '海晏', 100),
(385, 24, '玛沁', 100),
(386, 24, '同仁', 100),
(387, 24, '玉树', 100),
(388, 25, '济南', 100),
(389, 25, '滨州', 100),
(390, 25, '兖州', 100),
(391, 25, '德州', 100),
(392, 25, '东营', 100),
(393, 25, '菏泽', 100),
(394, 25, '济宁', 100),
(395, 25, '莱芜', 100),
(396, 25, '聊城', 100),
(397, 25, '临沂', 100),
(398, 25, '蓬莱', 100),
(399, 25, '青岛', 100),
(400, 25, '曲阜', 100),
(401, 25, '日照', 100),
(402, 25, '泰安', 100),
(403, 25, '潍坊', 100),
(404, 25, '威海', 100),
(405, 25, '烟台', 100),
(406, 25, '枣庄', 100),
(407, 25, '淄博', 100),
(408, 26, '太原', 100),
(409, 26, '长治', 100),
(410, 26, '大同', 100),
(411, 26, '候马', 100),
(412, 26, '晋城', 100),
(413, 26, '离石', 100),
(414, 26, '临汾', 100),
(415, 26, '宁武', 100),
(416, 26, '朔州', 100),
(417, 26, '忻州', 100),
(418, 26, '阳泉', 100),
(419, 26, '榆次', 100),
(420, 26, '运城', 100),
(421, 27, '西安', 100),
(422, 27, '安康', 100),
(423, 27, '宝鸡', 100),
(424, 27, '汉中', 100),
(425, 27, '渭南', 100),
(426, 27, '商州', 100),
(427, 27, '绥德', 100),
(428, 27, '铜川', 100),
(429, 27, '咸阳', 100),
(430, 27, '延安', 100),
(431, 27, '榆林', 100),
(432, 28, '成都', 100),
(433, 28, '巴中', 100),
(434, 28, '达川', 100),
(435, 28, '德阳', 100),
(436, 28, '都江堰', 100),
(437, 28, '峨眉山', 100),
(438, 28, '涪陵', 100),
(439, 28, '广安', 100),
(440, 28, '广元', 100),
(441, 28, '九寨沟', 100),
(442, 28, '康定', 100),
(443, 28, '乐山', 100),
(444, 28, '泸州', 100),
(445, 28, '马尔康', 100),
(446, 28, '绵阳', 100),
(447, 28, '眉山', 100),
(448, 28, '南充', 100),
(449, 28, '内江', 100),
(450, 28, '攀枝花', 100),
(451, 28, '遂宁', 100),
(452, 28, '汶川', 100),
(453, 28, '西昌', 100),
(454, 28, '雅安', 100),
(455, 28, '宜宾', 100),
(456, 28, '自贡', 100),
(457, 28, '资阳', 100),
(458, 29, '台北', 100),
(459, 29, '基隆', 100),
(460, 29, '台南', 100),
(461, 29, '台中', 100),
(462, 29, '高雄', 100),
(463, 29, '屏东', 100),
(464, 29, '南投', 100),
(465, 29, '云林', 100),
(466, 29, '新竹', 100),
(467, 29, '彰化', 100),
(468, 29, '苗栗', 100),
(469, 29, '嘉义', 100),
(470, 29, '花莲', 100),
(471, 29, '桃园', 100),
(472, 29, '宜兰', 100),
(473, 29, '台东', 100),
(474, 29, '金门', 100),
(475, 29, '马祖', 100),
(476, 29, '澎湖', 100),
(477, 30, '天津', 100),
(478, 30, '和平', 100),
(479, 30, '东丽', 100),
(480, 30, '河东', 100),
(481, 30, '西青', 100),
(482, 30, '河西', 100),
(483, 30, '津南', 100),
(484, 30, '南开', 100),
(485, 30, '北辰', 100),
(486, 30, '河北', 100),
(487, 30, '武清', 100),
(488, 30, '红挢', 100),
(489, 30, '塘沽', 100),
(490, 30, '汉沽', 100),
(491, 30, '大港', 100),
(492, 30, '宁河', 100),
(493, 30, '静海', 100),
(494, 30, '宝坻', 100),
(495, 30, '蓟县', 100),
(496, 31, '乌鲁木齐', 100),
(497, 31, '阿克苏', 100),
(498, 31, '阿勒泰', 100),
(499, 31, '阿图什', 100),
(500, 31, '博乐', 100),
(501, 31, '昌吉', 100),
(502, 31, '东山', 100),
(503, 31, '哈密', 100),
(504, 31, '和田', 100),
(505, 31, '喀什', 100),
(506, 31, '克拉玛依', 100),
(507, 31, '库车', 100),
(508, 31, '库尔勒', 100),
(509, 31, '奎屯', 100),
(510, 31, '石河子', 100),
(511, 31, '塔城', 100),
(512, 31, '吐鲁番', 100),
(513, 31, '伊宁', 100),
(514, 32, '拉萨', 100),
(515, 32, '阿里', 100),
(516, 32, '昌都', 100),
(517, 32, '林芝', 100),
(518, 32, '那曲', 100),
(519, 32, '日喀则', 100),
(520, 32, '山南', 100),
(521, 33, '昆明', 100),
(522, 33, '大理', 100),
(523, 33, '保山', 100),
(524, 33, '楚雄', 100),
(525, 33, '东川', 100),
(526, 33, '个旧', 100),
(527, 33, '景洪', 100),
(528, 33, '开远', 100),
(529, 33, '临沧', 100),
(530, 33, '丽江', 100),
(531, 33, '六库', 100),
(532, 33, '潞西', 100),
(533, 33, '曲靖', 100),
(534, 33, '思茅', 100),
(535, 33, '文山', 100),
(536, 33, '西双版纳', 100),
(537, 33, '玉溪', 100),
(538, 33, '中甸', 100),
(539, 33, '昭通', 100),
(540, 34, '杭州', 100),
(541, 34, '安吉', 100),
(542, 34, '慈溪', 100),
(543, 34, '定海', 100),
(544, 34, '奉化', 100),
(545, 34, '海盐', 100),
(546, 34, '黄岩', 100),
(547, 34, '湖州', 100),
(548, 34, '嘉兴', 100),
(549, 34, '金华', 100),
(550, 34, '临安', 100),
(551, 34, '临海', 100),
(552, 34, '丽水', 100),
(553, 34, '宁波', 100),
(554, 34, '瓯海', 100),
(555, 34, '平湖', 100),
(556, 34, '千岛湖', 100),
(557, 34, '衢州', 100),
(558, 34, '江山', 100),
(559, 34, '瑞安', 100),
(560, 34, '绍兴', 100),
(561, 34, '嵊州', 100),
(562, 34, '台州', 100),
(563, 34, '温岭', 100),
(564, 34, '温州', 100),
(565, 34, '余姚', 100),
(566, 34, '舟山', 100),
(567, 35, '欧洲', 100),
(568, 35, '北美', 100),
(569, 35, '南美', 100),
(570, 35, '亚洲', 100),
(571, 35, '非洲', 100),
(572, 35, '大洋洲', 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role`
--

CREATE TABLE IF NOT EXISTS `fanwe_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_role`
--

INSERT INTO `fanwe_role` (`id`, `name`, `status`) VALUES
(1, '超级管理员', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_access`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `node_id` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_role_access`
--

INSERT INTO `fanwe_role_access` (`role_id`, `node_id`) VALUES
(1, 137),
(1, 132),
(1, 128),
(1, 123),
(1, 120),
(1, 115),
(1, 110),
(1, 105),
(1, 99),
(1, 96),
(1, 92),
(1, 88),
(1, 83),
(1, 79),
(1, 74),
(1, 69),
(1, 64),
(1, 59),
(1, 56),
(1, 51),
(1, 46),
(1, 41),
(1, 36),
(1, 33),
(1, 28),
(1, 23),
(1, 20),
(1, 17),
(1, 14),
(1, 10),
(1, 7),
(1, 4),
(1, 1),
(1, 142),
(1, 147),
(1, 151),
(1, 153),
(1, 158),
(1, 163),
(1, 168),
(1, 173),
(1, 178),
(1, 183),
(1, 186),
(1, 191),
(1, 195),
(1, 198),
(1, 202),
(1, 207),
(1, 211),
(1, 214),
(1, 219);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_nav`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `fanwe_role_nav`
--

INSERT INTO `fanwe_role_nav` (`id`, `name`, `status`, `sort`) VALUES
(2, '分享', 1, 1),
(3, '主题', 1, 2),
(4, '会员', 1, 5),
(5, '权限', 1, 6),
(6, '数据库', 1, 7),
(7, '系统', 1, 10),
(8, '前台', 1, 8),
(9, '无限衣橱', 1, 4),
(10, '杂志社', 1, 3),
(11, '潮流趋势', 1, 9);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_node`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_node` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `action` varchar(60) NOT NULL DEFAULT '',
  `action_name` varchar(60) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `module` varchar(60) NOT NULL DEFAULT '',
  `module_name` varchar(60) NOT NULL DEFAULT '',
  `nav_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '从属于哪个模块组, 为0时表示不属于菜单节点',
  `sort` smallint(5) NOT NULL DEFAULT '0',
  `auth_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '授权模式：1:模块授权(module) 2:操作授权(action) 0:节点授权(node)',
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=230 ;

--
-- 转存表中的数据 `fanwe_role_node`
--

INSERT INTO `fanwe_role_node` (`id`, `action`, `action_name`, `status`, `module`, `module_name`, `nav_id`, `sort`, `auth_type`, `is_show`) VALUES
(1, '', '', 1, 'SysConf', '系统管理', 7, 10, 1, 0),
(2, 'index', '系统设置', 1, 'SysConf', '系统管理', 7, 10, 0, 1),
(3, 'update', '更新设置', 1, 'SysConf', '系统管理', 7, 10, 0, 0),
(4, '', '', 1, 'SharegoodsModule', '商品接口管理', 7, 9, 1, 0),
(5, 'index', '接口列表', 1, 'SharegoodsModule', '商品接口管理', 7, 10, 0, 1),
(6, 'update', '更新接口', 1, 'SharegoodsModule', '商品接口管理', 7, 10, 0, 0),
(7, '', '', 1, 'LoginModule', '同步登陆管理', 7, 10, 1, 0),
(8, 'index', '模块列表', 1, 'LoginModule', '同步登陆管理', 7, 10, 0, 1),
(9, 'update', '更新模块', 1, 'LoginModule', '同步登陆管理', 7, 10, 0, 0),
(10, '', '', 1, 'ImageServers', '图片服务器管理', 7, 10, 1, 0),
(11, 'index', '服务器列表', 1, 'ImageServers', '图片服务器管理', 7, 10, 0, 1),
(12, 'add', '添加服务器', 1, 'ImageServers', '图片服务器管理', 7, 10, 0, 1),
(13, 'update', '更新服务器', 1, 'ImageServers', '图片服务器管理', 7, 10, 0, 0),
(14, '', '', 1, 'Cache', '缓存管理', 7, 10, 1, 0),
(15, 'system', '清除系统缓存', 1, 'Cache', '缓存管理', 7, 10, 0, 1),
(16, 'custom', '清除程序缓存', 1, 'Cache', '缓存管理', 7, 10, 0, 1),
(17, '', '', 1, 'TempFile', '临时文件管理', 7, 10, 1, 0),
(18, 'index', '临时文件列表', 1, 'TempFile', '临时文件管理', 7, 10, 0, 1),
(19, 'clear', '清除临时文件', 1, 'TempFile', '临时文件管理', 7, 10, 0, 0),
(20, '', '', 1, 'AdminLog', '操作日志管理', 7, 10, 1, 0),
(21, 'index', '操作日志列表', 1, 'AdminLog', '操作日志管理', 7, 10, 0, 1),
(22, 'remove', '删除操作日志', 1, 'AdminLog', '操作日志管理', 7, 10, 0, 0),
(23, '', '', 1, 'Region', '城市管理', 7, 10, 1, 0),
(24, 'index', '城市列表', 1, 'Region', '城市管理', 7, 10, 0, 1),
(25, 'add', '添加城市', 1, 'Region', '城市管理', 7, 10, 0, 1),
(26, 'update', '更新城市', 1, 'Region', '城市管理', 7, 10, 0, 0),
(27, 'remove', '删除城市', 1, 'Region', '城市管理', 7, 10, 0, 0),
(28, '', '', 1, 'DataBase', '数据库操作', 6, 10, 1, 0),
(29, 'index', '数据库备份', 1, 'DataBase', '数据库操作', 6, 10, 0, 1),
(30, 'dump', '备份操作', 1, 'DataBase', '数据库操作', 6, 10, 0, 0),
(31, 'delete', '删除操作', 1, 'DataBase', '数据库操作', 6, 10, 0, 0),
(32, 'restore', '恢复操作', 1, 'DataBase', '数据库操作', 6, 10, 0, 0),
(33, '', '', 1, 'Sql', 'SQL操作', 6, 10, 1, 0),
(34, 'index', 'SQL操作', 1, 'Sql', 'SQL操作', 6, 10, 0, 1),
(35, 'execute', '执行SQL', 1, 'Sql', 'SQL操作', 6, 10, 0, 0),
(36, '', '', 1, 'Admin', '管理员管理', 5, 10, 1, 0),
(37, 'index', '管理员列表', 1, 'Admin', '管理员管理', 5, 10, 0, 1),
(38, 'add', '添加管理员', 1, 'Admin', '管理员管理', 5, 10, 0, 1),
(39, 'update', '更新管理员', 1, 'Admin', '管理员管理', 5, 10, 0, 0),
(40, 'remove', '删除管理员', 1, 'Admin', '管理员管理', 5, 10, 0, 0),
(41, '', '', 1, 'Role', '权限组管理', 5, 10, 1, 0),
(42, 'index', '角色列表', 1, 'Role', '权限组管理', 5, 10, 0, 1),
(43, 'add', '添加角色', 1, 'Role', '权限组管理', 5, 10, 0, 1),
(44, 'update', '更新角色', 1, 'Role', '权限组管理', 5, 10, 0, 0),
(45, 'remove', '删除角色', 1, 'Role', '权限组管理', 5, 10, 0, 0),
(46, '', '', 1, 'RoleNode', '权限节点管理', 5, 10, 1, 0),
(47, 'index', '节点列表', 1, 'RoleNode', '权限节点管理', 5, 10, 0, 1),
(48, 'add', '添加节点', 1, 'RoleNode', '权限节点管理', 5, 10, 0, 1),
(49, 'update', '更新节点', 1, 'RoleNode', '权限节点管理', 5, 10, 0, 0),
(50, 'remove', '删除节点', 1, 'RoleNode', '权限节点管理', 5, 10, 0, 0),
(51, '', '', 1, 'RoleNav', '后台导航菜单管理', 5, 10, 1, 0),
(52, 'index', '菜单列表', 1, 'RoleNav', '后台导航菜单管理', 5, 10, 0, 1),
(53, 'add', '添加菜单', 1, 'RoleNav', '后台导航菜单管理', 5, 10, 0, 1),
(54, 'update', '更新菜单', 1, 'RoleNav', '后台导航菜单管理', 5, 10, 0, 0),
(55, 'remove', '删除菜单', 1, 'RoleNav', '后台导航菜单管理', 5, 10, 0, 0),
(56, '', '', 1, 'UserSetting', '会员配置管理', 4, 10, 1, 0),
(57, 'index', '设置配置', 1, 'UserSetting', '会员配置管理', 4, 10, 0, 1),
(58, 'update', '更新配置', 1, 'UserSetting', '会员配置管理', 4, 10, 0, 0),
(59, '', '', 1, 'User', '会员管理', 4, 10, 1, 0),
(60, 'index', '会员列表', 1, 'User', '会员管理', 4, 10, 0, 1),
(61, 'add', '添加会员', 1, 'User', '会员管理', 4, 10, 0, 1),
(62, 'update', '更新会员', 1, 'User', '会员管理', 4, 10, 0, 0),
(63, 'remove', '删除会员', 1, 'User', '会员管理', 4, 10, 0, 0),
(64, '', '', 1, 'UserDaren', '达人管理', 4, 10, 1, 0),
(65, 'index', '达人列表', 1, 'UserDaren', '达人管理', 4, 10, 0, 1),
(66, 'add', '添加达人', 1, 'UserDaren', '达人管理', 4, 10, 0, 1),
(67, 'update', '更新达人', 1, 'UserDaren', '达人管理', 4, 10, 0, 0),
(68, 'remove', '删除达人', 1, 'UserDaren', '达人管理', 4, 10, 0, 0),
(69, '', '', 1, 'UserGroup', '会员组管理', 4, 10, 1, 0),
(70, 'index', '会员组列表', 1, 'UserGroup', '会员组管理', 4, 10, 0, 1),
(71, 'add', '添加会员组', 1, 'UserGroup', '会员组管理', 4, 10, 0, 1),
(72, 'update', '更新会员组', 1, 'UserGroup', '会员组管理', 4, 10, 0, 0),
(73, 'remove', '删除会员组', 1, 'UserGroup', '会员组管理', 4, 10, 0, 0),
(74, '', '', 1, 'Forum', '论坛分类管理', 3, 10, 1, 0),
(75, 'index', '分类列表', 1, 'Forum', '论坛分类管理', 3, 10, 0, 1),
(76, 'add', '添加分类', 1, 'Forum', '论坛分类管理', 3, 10, 0, 1),
(77, 'update', '更新分类', 1, 'Forum', '论坛分类管理', 3, 10, 0, 0),
(78, 'remove', '删除分类', 1, 'Forum', '论坛分类管理', 3, 10, 0, 0),
(79, '', '', 1, 'ForumThread', '论坛主题管理', 3, 10, 1, 0),
(80, 'index', '主题列表', 1, 'ForumThread', '论坛主题管理', 3, 10, 0, 1),
(81, 'update', '更新主题', 1, 'ForumThread', '论坛主题管理', 3, 10, 0, 0),
(82, 'remove', '删除主题', 1, 'ForumThread', '论坛主题管理', 3, 10, 0, 0),
(83, '', '', 1, 'Ask', '问答分类管理', 3, 10, 1, 0),
(84, 'index', '分类列表', 1, 'Ask', '问答分类管理', 3, 10, 0, 1),
(85, 'add', '添加分类', 1, 'Ask', '问答分类管理', 3, 10, 0, 1),
(86, 'update', '更新分类', 1, 'Ask', '问答分类管理', 3, 10, 0, 0),
(87, 'remove', '删除分类', 1, 'Ask', '问答分类管理', 3, 10, 0, 0),
(88, '', '', 1, 'AskThread', '问答主题管理', 3, 10, 1, 0),
(89, 'index', '主题列表', 1, 'AskThread', '问答主题管理', 3, 10, 0, 1),
(90, 'update', '更新主题', 1, 'AskThread', '问答主题管理', 3, 10, 0, 0),
(91, 'remove', '删除主题', 1, 'AskThread', '问答主题管理', 3, 10, 0, 0),
(92, '', '', 1, 'Event', '话题管理', 3, 10, 1, 0),
(93, 'index', '话题列表', 1, 'Event', '话题管理', 3, 10, 0, 1),
(94, 'update', '更新话题', 1, 'Event', '话题管理', 3, 10, 0, 0),
(95, 'remove', '删除话题', 1, 'Event', '话题管理', 3, 10, 0, 0),
(96, '', '', 1, 'EventShare', '话题回复管理', 3, 10, 1, 0),
(97, 'index', '话题回复列表', 1, 'EventShare', '话题回复管理', 3, 10, 0, 0),
(98, 'remove', '删除话题回复', 1, 'EventShare', '话题回复管理', 3, 10, 0, 0),
(99, '', '', 1, 'Share', '分享管理', 2, 10, 1, 0),
(100, 'index', '分享列表', 1, 'Share', '分享管理', 2, 10, 0, 1),
(101, 'dapei', '搭配列表', 1, 'Share', '分享管理', 2, 10, 0, 1),
(102, 'look', '晒货列表', 1, 'Share', '分享管理', 2, 10, 0, 1),
(103, 'update', '更新分享', 1, 'Share', '分享管理', 2, 10, 0, 0),
(104, 'remove', '删除分享', 1, 'Share', '分享管理', 2, 10, 0, 0),
(105, '', '', 1, 'GoodsCategory', '分享分类管理', 2, 10, 1, 0),
(106, 'index', '分类列表', 1, 'GoodsCategory', '分享分类管理', 2, 10, 0, 1),
(107, 'add', '添加分类', 1, 'GoodsCategory', '分享分类管理', 2, 10, 0, 1),
(108, 'update', '更新分类', 1, 'GoodsCategory', '分享分类管理', 2, 10, 0, 0),
(109, 'remove', '删除分类', 1, 'GoodsCategory', '分享分类管理', 2, 10, 0, 0),
(110, '', '', 1, 'GoodsCategoryTags', '分享分类关联标签管理', 2, 10, 1, 0),
(111, 'index', '标签列表', 1, 'GoodsCategoryTags', '分享分类关联标签管理', 2, 10, 0, 0),
(112, 'setting', '设置标签', 1, 'GoodsCategoryTags', '分享分类关联标签管理', 2, 10, 0, 0),
(113, 'update', '更新分类', 1, 'GoodsCategoryTags', '分享分类关联标签管理', 2, 10, 0, 0),
(114, 'remove', '删除分类', 1, 'GoodsCategoryTags', '分享分类关联标签管理', 2, 10, 0, 0),
(115, '', '', 1, 'GoodsTags', '分享分类标签管理', 2, 10, 1, 0),
(116, 'index', '标签列表', 1, 'GoodsTags', '分享分类标签管理', 2, 10, 0, 1),
(117, 'add', '添加标签', 1, 'GoodsTags', '分享分类标签管理', 2, 10, 0, 1),
(118, 'update', '更新标签', 1, 'GoodsTags', '分享分类标签管理', 2, 10, 0, 0),
(119, 'remove', '删除标签', 1, 'GoodsTags', '分享分类标签管理', 2, 10, 0, 0),
(120, '', '', 1, 'StyleCategory', '搭配分类管理', 2, 10, 1, 0),
(121, 'index', '分类列表', 1, 'StyleCategory', '搭配分类管理', 2, 10, 0, 1),
(122, 'add', '添加分类', 1, 'StyleCategory', '搭配分类管理', 2, 10, 0, 1),
(123, '', '', 1, 'ShopCategory', '店铺分类管理', 2, 10, 1, 0),
(124, 'index', '分类列表', 1, 'ShopCategory', '店铺分类管理', 2, 10, 0, 1),
(125, 'add', '添加分类', 1, 'ShopCategory', '店铺分类管理', 2, 10, 0, 1),
(126, 'update', '更新分类', 1, 'ShopCategory', '店铺分类管理', 2, 10, 0, 0),
(127, 'remove', '删除分类', 1, 'ShopCategory', '店铺分类管理', 2, 10, 0, 0),
(128, '', '', 1, 'Shop', '店铺管理', 2, 10, 1, 0),
(129, 'index', '店铺列表', 1, 'Shop', '店铺管理', 2, 10, 0, 1),
(130, 'update', '更新店铺', 1, 'Shop', '店铺管理', 2, 10, 0, 0),
(131, 'remove', '删除店铺', 1, 'Shop', '店铺管理', 2, 10, 0, 0),
(132, '', '', 1, 'NavCategory', '前台菜单分类管理', 8, 10, 1, 0),
(133, 'index', '分类列表', 1, 'NavCategory', '前台菜单分类管理', 8, 10, 0, 1),
(134, 'add', '添加分类', 1, 'NavCategory', '前台菜单分类管理', 8, 10, 0, 1),
(135, 'update', '更新分类', 1, 'NavCategory', '前台菜单分类管理', 8, 10, 0, 0),
(136, 'remove', '删除分类', 1, 'NavCategory', '前台菜单分类管理', 8, 10, 0, 0),
(137, '', '', 1, 'Nav', '前台菜单管理', 8, 10, 1, 0),
(138, 'index', '菜单列表', 1, 'Nav', '前台菜单管理', 8, 10, 0, 1),
(139, 'add', '添加菜单', 1, 'Nav', '前台菜单管理', 8, 10, 0, 1),
(140, 'update', '更新菜单', 1, 'Nav', '前台菜单管理', 8, 10, 0, 0),
(141, 'remove', '删除菜单', 1, 'Nav', '前台菜单管理', 8, 10, 0, 0),
(142, '', '', 1, 'FriendLink', '友情链接管理', 8, 10, 1, 0),
(143, 'index', '链接列表', 1, 'FriendLink', '友情链接管理', 8, 10, 0, 1),
(144, 'add', '添加链接', 1, 'FriendLink', '友情链接管理', 8, 10, 0, 1),
(145, 'update', '更新链接', 1, 'FriendLink', '友情链接管理', 8, 10, 0, 0),
(146, 'remove', '删除链接', 1, 'FriendLink', '友情链接管理', 8, 10, 0, 0),
(147, '', '', 1, 'UserMsg', '会员信件管理', 4, 10, 1, 0),
(148, 'index', '会员信件列表', 1, 'UserMsg', '会员信件管理', 4, 10, 0, 1),
(149, 'groupSend', '发送系统信件', 1, 'UserMsg', '会员信件管理', 4, 10, 0, 1),
(150, 'groupList', '系统信件列表', 1, 'UserMsg', '会员信件管理', 4, 10, 0, 1),
(151, '', '', 1, 'Integrate', '会员整合', 4, 10, 1, 0),
(152, 'index', '会员整合', 1, 'Integrate', '会员整合', 4, 10, 0, 1),
(153, '', '', 1, 'Medal', '会员勋章', 4, 10, 1, 0),
(154, 'index', '勋章列表', 1, 'Medal', '会员勋章', 4, 10, 0, 1),
(155, 'add', '添加勋章', 1, 'Medal', '会员勋章', 4, 10, 0, 1),
(156, 'user', '勋章会员', 1, 'Medal', '会员勋章', 4, 10, 0, 1),
(157, 'check', '勋章审核', 1, 'Medal', '会员勋章', 4, 10, 0, 1),
(158, '', '', 1, 'WordType', '敏感词分类管理', 7, 10, 1, 0),
(159, 'index', '分类列表', 1, 'WordType', '敏感词分类管理', 7, 10, 0, 1),
(160, 'add', '添加分类', 1, 'WordType', '敏感词分类管理', 7, 10, 0, 1),
(161, 'update', '更新分类', 1, 'WordType', '敏感词分类管理', 7, 10, 0, 0),
(162, 'remove', '删除分类', 1, 'WordType', '敏感词分类管理', 7, 10, 0, 0),
(163, '', '', 1, 'Word', '敏感词管理', 7, 10, 1, 0),
(164, 'index', '敏感词列表', 1, 'Word', '敏感词管理', 7, 10, 0, 1),
(165, 'add', '添加敏感词', 1, 'Word', '敏感词管理', 7, 10, 0, 1),
(166, 'update', '更新敏感词', 1, 'Word', '敏感词管理', 7, 10, 0, 0),
(167, 'remove', '删除敏感词', 1, 'Word', '敏感词管理', 7, 10, 0, 0),
(168, '', '', 1, 'AdvPosition', '广告位管理', 8, 10, 1, 0),
(169, 'index', '广告位列表', 1, 'AdvPosition', '广告位管理', 8, 10, 0, 1),
(170, 'add', '添加广告位', 1, 'AdvPosition', '广告位管理', 8, 10, 0, 1),
(171, 'update', '更新广告位', 1, 'AdvPosition', '广告位管理', 8, 10, 0, 0),
(172, 'remove', '删除广告位', 1, 'AdvPosition', '广告位管理', 8, 10, 0, 0),
(173, '', '', 1, 'Adv', '广告管理', 8, 10, 1, 0),
(174, 'index', '广告列表', 1, 'Adv', '广告管理', 8, 10, 0, 1),
(175, 'add', '添加广告', 1, 'Adv', '广告管理', 8, 10, 0, 1),
(176, 'update', '更新广告', 1, 'Adv', '广告管理', 8, 10, 0, 0),
(177, 'remove', '删除广告', 1, 'Adv', '广告管理', 8, 10, 0, 0),
(178, '', '', 1, 'AdvLayout', '广告布局管理', 8, 10, 1, 0),
(179, 'index', '布局列表', 1, 'AdvLayout', '广告布局管理', 8, 10, 0, 1),
(180, 'add', '添加布局', 1, 'AdvLayout', '广告布局管理', 8, 10, 0, 1),
(181, 'update', '更新布局', 1, 'AdvLayout', '广告布局管理', 8, 10, 0, 0),
(182, 'remove', '删除布局', 1, 'AdvLayout', '广告布局管理', 8, 10, 0, 0),
(183, '', '', 1, 'SecondSetting', '二手设置管理', 9, 10, 1, 0),
(184, 'index', '二手设置', 1, 'SecondSetting', '二手设置管理', 9, 10, 0, 1),
(185, 'update', '更新设置', 1, 'SecondSetting', '二手设置管理', 9, 10, 0, 0),
(186, '', '', 1, 'Second', '二手分类管理', 9, 10, 1, 0),
(187, 'index', '分类列表', 1, 'Second', '二手分类管理', 9, 10, 0, 1),
(188, 'add', '添加分类', 1, 'Second', '二手分类管理', 9, 10, 0, 1),
(189, 'update', '更新分类', 1, 'Second', '二手分类管理', 9, 10, 0, 0),
(190, 'remove', '删除分类', 1, 'Second', '二手分类管理', 9, 10, 0, 0),
(191, '', '', 1, 'SecondGoods', '二手商品管理', 9, 10, 1, 0),
(192, 'index', '商品列表', 1, 'SecondGoods', '二手商品管理', 9, 10, 0, 1),
(193, 'update', '更新商品', 1, 'SecondGoods', '二手商品管理', 9, 10, 0, 0),
(194, 'remove', '删除商品', 1, 'SecondGoods', '二手商品管理', 9, 10, 0, 0),
(195, '', '', 1, 'UserScoreLog', '会员积分日志', 4, 10, 1, 0),
(196, 'index', '日志列表', 1, 'UserScoreLog', '会员积分日志', 4, 10, 0, 1),
(197, 'remove', '删除日志', 1, 'UserScoreLog', '会员积分日志', 4, 10, 0, 0),
(198, '', '', 1, 'Referrals', '会员邀请日志', 4, 10, 1, 0),
(199, 'index', '日志列表', 1, 'Referrals', '会员邀请日志', 4, 10, 0, 1),
(200, 'update', '更新日志', 1, 'Referrals', '会员邀请日志', 4, 10, 0, 0),
(201, 'remove', '删除日志', 1, 'Referrals', '会员邀请日志', 4, 10, 0, 0),
(202, '', '', 1, 'ExchangeGoods', '积分商品管理', 4, 10, 1, 0),
(203, 'index', '商品列表', 1, 'ExchangeGoods', '积分商品管理', 4, 10, 0, 1),
(204, 'add', '添加商品', 1, 'ExchangeGoods', '积分商品管理', 4, 10, 0, 1),
(205, 'update', '更新商品', 1, 'ExchangeGoods', '积分商品管理', 4, 10, 0, 0),
(206, 'remove', '删除商品', 1, 'ExchangeGoods', '积分商品管理', 4, 10, 0, 0),
(207, '', '', 1, 'Order', '积分订单管理', 4, 10, 1, 0),
(208, 'index', '订单列表', 1, 'Order', '积分订单管理', 4, 10, 0, 1),
(209, 'update', '更新订单', 1, 'Order', '积分订单管理', 4, 10, 0, 0),
(210, 'remove', '删除订单', 1, 'Order', '积分订单管理', 4, 10, 0, 0),
(211, '', '', 1, 'AlbumSetting', '杂志社配置管理', 10, 10, 1, 0),
(212, 'index', '设置配置', 1, 'AlbumSetting', '杂志社配置管理', 10, 10, 0, 1),
(213, 'update', '更新配置', 1, 'AlbumSetting', '杂志社配置管理', 10, 10, 0, 0),
(214, '', '', 1, 'AlbumCategory', '杂志社分类管理', 10, 10, 1, 0),
(215, 'index', '分类列表', 1, 'AlbumCategory', '杂志社分类管理', 10, 10, 0, 1),
(216, 'add', '添加分类', 1, 'AlbumCategory', '杂志社分类管理', 10, 10, 0, 1),
(217, 'update', '更新分类', 1, 'AlbumCategory', '杂志社分类管理', 10, 10, 0, 0),
(218, 'remove', '删除分类', 1, 'AlbumCategory', '杂志社分类管理', 10, 10, 0, 0),
(219, '', '', 1, 'Album', '杂志社管理', 10, 10, 1, 0),
(220, 'index', '杂志社列表', 1, 'Album', '杂志社管理', 10, 10, 0, 1),
(221, 'update', '更新杂志社', 1, 'Album', '杂志社管理', 10, 10, 0, 0),
(222, 'remove', '删除杂志社', 1, 'Album', '杂志社管理', 10, 10, 0, 0),
(223, 'index', '潮流趋势列表', 1, 'Magazine', '潮流趋势管理', 11, 10, 0, 1),
(224, '', '', 1, 'Magazine', '潮流趋势管理', 11, 10, 1, 1),
(225, 'index', '分类列表', 1, 'MagazineCategory', '潮流趋势分类管理', 11, 10, 0, 1),
(226, '', '', 1, 'MagazineCategory', '潮流趋势分类管理', 11, 10, 1, 1),
(227, 'add', '添加分类', 1, 'MagazineCategory', '潮流趋势分类管理', 11, 10, 0, 0),
(228, 'edit', '修改分类', 1, 'MagazineCategory', '潮流趋势分类管理', 11, 10, 0, 0),
(229, 'remove', '删除分类', 1, 'MagazineCategory', '潮流趋势分类管理', 11, 10, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_second`
--

CREATE TABLE IF NOT EXISTS `fanwe_second` (
  `sid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT '',
  `sort` smallint(5) DEFAULT '100',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `fanwe_second`
--

INSERT INTO `fanwe_second` (`sid`, `name`, `sort`, `status`) VALUES
(1, '上衣', 10, 1),
(2, '服装', 10, 1),
(3, '鞋帽', 10, 1),
(4, '配饰', 10, 1),
(5, '美容', 10, 1),
(6, '数码', 10, 1),
(7, '书籍音像', 10, 1),
(8, '其它', 10, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_second_goods`
--

CREATE TABLE IF NOT EXISTS `fanwe_second_goods` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` smallint(6) NOT NULL,
  `share_id` int(11) DEFAULT NULL,
  `alipay_gid` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `content` text,
  `city_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `transport_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valid_time` int(11) NOT NULL DEFAULT '0',
  `page` varchar(255) NOT NULL DEFAULT '',
  `num` smallint(6) NOT NULL DEFAULT '0',
  `sign` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`gid`),
  UNIQUE KEY `share_id` (`share_id`),
  KEY `sid` (`sid`),
  KEY `city_id` (`city_id`),
  KEY `uid` (`uid`),
  KEY `sid_city` (`sid`,`city_id`),
  KEY `alipay_gid` (`alipay_gid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_second_goods`
--

INSERT INTO `fanwe_second_goods` (`gid`, `sid`, `share_id`, `alipay_gid`, `name`, `content`, `city_id`, `uid`, `price`, `transport_fee`, `valid_time`, `page`, `num`, `sign`, `create_time`, `status`) VALUES
(1, 6, 18, '', '站内直接购买图中的商品', '站内直接购买图中的商品', 1, 1, '0.10', '0.00', 1334995200, '', 1, 'aef3310fe931defa850c9b5025ee77d0', 1332487759, 1),
(2, 8, 19, '', '星座时尚搭配', '星座时尚搭配', 1, 1, '1000.00', '0.00', 1334995200, '', 1, '4dc91df4c427b0e87dcf406d3abca7bf', 1332488616, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sessions`
--

CREATE TABLE IF NOT EXISTS `fanwe_sessions` (
  `sid` char(6) NOT NULL DEFAULT '',
  `ip1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` char(15) NOT NULL DEFAULT '',
  `gid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `share_id` int(11) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `sid` (`sid`),
  KEY `uid` (`uid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_sessions`
--

INSERT INTO `fanwe_sessions` (`sid`, `ip1`, `ip2`, `ip3`, `ip4`, `uid`, `user_name`, `gid`, `shop_id`, `share_id`, `last_activity`, `last_update`) VALUES
('DfOIIY', 203, 208, 60, 179, 0, '', 6, 0, 0, 1333836711, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_share`
--

CREATE TABLE IF NOT EXISTS `fanwe_share` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `user_name` varchar(60) DEFAULT '',
  `parent_id` int(11) DEFAULT '0',
  `rec_id` int(11) NOT NULL DEFAULT '0',
  `content` text,
  `collect_count` int(11) unsigned DEFAULT '0',
  `comment_count` int(11) unsigned DEFAULT '0',
  `relay_count` int(11) unsigned DEFAULT '0',
  `click_count` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `day_time` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` enum('default','ask','ershou','fav','comments','ask_post','bar','bar_post','album','album_item','album_best','album_rec','event','event_post') NOT NULL DEFAULT 'default' COMMENT 'default:默认(default时，parent_id指向本表， 即转发),bar:主题,ershou:二手,ask:问答,ask_post:问答回复,comments:评论,fav:喜欢,bar:论坛,bar_post:论坛回复',
  `share_data` enum('goods','photo','default','goods_photo') NOT NULL DEFAULT 'default',
  `base_id` int(11) NOT NULL COMMENT '原创主题的ID，本贴为原创，则base_id为0',
  `is_best` tinyint(1) DEFAULT '0',
  `is_rec_best` tinyint(1) NOT NULL DEFAULT '0',
  `collect_share` varchar(60) DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_index` tinyint(1) DEFAULT '0',
  `cache_data` text,
  `rec_uid` int(11) DEFAULT '0',
  `index_img` varchar(255) DEFAULT '',
  `sort` smallint(4) DEFAULT '100',
  `server_code` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`share_id`),
  KEY `uid` (`uid`),
  KEY `share_data` (`share_data`),
  KEY `status` (`status`),
  KEY `day_time` (`day_time`),
  KEY `collect_count` (`collect_count`),
  KEY `is_index` (`is_index`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- 转存表中的数据 `fanwe_share`
--

INSERT INTO `fanwe_share` (`share_id`, `uid`, `user_name`, `parent_id`, `rec_id`, `content`, `collect_count`, `comment_count`, `relay_count`, `click_count`, `create_time`, `day_time`, `title`, `type`, `share_data`, `base_id`, `is_best`, `is_rec_best`, `collect_share`, `status`, `is_index`, `cache_data`, `rec_uid`, `index_img`, `sort`, `server_code`) VALUES
(11, 2, '', 0, 0, 'sss', 0, 0, 0, 17, 1332306638, 1332230400, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"清仓";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"板鞋";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:12:"时尚潮流";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g12";a:11:{s:8:"share_id";s:2:"11";s:2:"id";s:2:"12";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/11/7db9f253237c21d4cf8b16985c71f9bb5l5p9R.jpg";s:4:"type";s:1:"g";s:4:"name";s:87:"七一二男鞋 日常休闲时尚潮流磨砂皮鞋 真皮商务单鞋板鞋清仓I006";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=13498517344";s:5:"price";s:6:"196.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"310";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt'),
(12, 1, '', 0, 0, '时尚镂空勾花绿毛衣，呈现出年轻化的设计，美丽而不失优雅，风格简约，超赞。', 0, 0, 0, 24, 1332382711, 1332316800, '', 'default', 'photo', 0, 1, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:9:"年轻化";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:12:"风格简约";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"美丽";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:12:"不失优雅";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:2:{s:3:"all";a:1:{s:2:"m1";a:10:{s:8:"share_id";s:2:"12";s:2:"id";s:1:"1";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/12/54e54865d0dd78931b6ebafe7bc6add4leQ3ur.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"460";s:10:"img_height";s:3:"685";}}s:5:"dapei";a:1:{i:0;s:2:"m1";}}}', 0, '', 100, 'bupt'),
(2, 1, '', 0, 0, '试试拍拍的', 0, 0, 0, 22, 1332012640, 1331971200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"手提";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"单肩包";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:9:"斜挎包";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"g3";a:11:{s:8:"share_id";s:1:"2";s:2:"id";s:1:"3";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/02/7fcc038864231bf33846b19802b411cfGqZi5D.jpg";s:4:"type";s:1:"g";s:4:"name";s:79:"2012春季新款时尚韩版李孝利手提单肩包斜挎包女包包多功能";s:3:"url";s:59:"http://auction1.paipai.com/234C8B630000000000233A5E071431C1";s:5:"price";s:5:"59.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"300";s:10:"img_height";s:3:"300";}}}}', 0, '', 100, 'bupt'),
(3, 1, '', 0, 0, 'ZIPPO限量正版打火机发售', 0, 0, 0, 25, 1332056519, 1331971200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"打火机";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:5:"ZIPPO";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"g4";a:11:{s:8:"share_id";s:1:"3";s:2:"id";s:1:"4";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/03/b98575d4bfc1257c386e15c33a6c40d3l2mkhO.jpg";s:4:"type";s:1:"g";s:4:"name";s:80:"ZIPPO限量正版打火机发售 原装日版正品 2012经典款清明上河图";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=13556489023";s:5:"price";s:6:"468.00";s:9:"taoke_url";s:181:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOTk%2BUIe2TbWfZN6RMf1yoDwfRrWr7DuSoo6OBtsCD2LSYLt0nnJXkuix7q8AUBIcQpIFHMLbqpC6b1jPjt1kk0BxeFQ8qccJ%2F5%2FmfiVQ%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"300";s:10:"img_height";s:3:"300";}}}}', 0, '', 100, 'bupt'),
(4, 1, '', 0, 0, '马克 夹克', 0, 0, 0, 15, 1332184789, 1332144000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:6:"马克";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"夹克";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"g5";a:11:{s:8:"share_id";s:1:"4";s:2:"id";s:1:"5";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/04/a4945d1148f954774590bb133104e195B77VJW.jpg";s:4:"type";s:1:"g";s:4:"name";s:82:"【品牌特卖】马克华菲正品男装拼接印花连帽夹克外套7113010702";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=13348564379";s:5:"price";s:6:"248.00";s:9:"taoke_url";s:169:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOVuM2bhjHMeowlMlBQyeDniTLDZeP1GEAJPlsnJquiFjE9FSmeYkBxZ93DOaQxk7HqC%2BFBlkiJsv2zSME15UtYjiFEmH2qRNO5ol5f&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1000";s:10:"img_height";s:4:"1000";}}}}', 0, '', 100, 'bupt'),
(5, 1, '', 0, 0, '化妆袋', 0, 0, 0, 16, 1332192158, 1332144000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:1:{i:0;a:2:{s:8:"tag_name";s:9:"化妆袋";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"g6";a:11:{s:8:"share_id";s:1:"5";s:2:"id";s:1:"6";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/05/9b0078b77cda92a7e5ecbfb159e5dc1aC7dpSW.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"[特]安安家 立体剪裁熊猫化妆包/化妆袋/笔袋 文具袋收纳包 L314";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=14122792933";s:5:"price";s:5:"14.80";s:9:"taoke_url";s:179:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0EVMu%2FntTcDcEPqDPECy%2FWDCEbqni%2Fwe7GeCdsmU4nzGgqx1Zikms1urc6ISP%2BvRYbj9%2F8s5X0%2FBoyyi8pdWBiRLgFUdlGM3i2fjU&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"450";s:10:"img_height";s:3:"450";}}}}', 0, '', 100, 'bupt'),
(6, 1, '', 0, 0, '保温杯 *3', 0, 0, 0, 18, 1332192263, 1332144000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"保温杯";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"安家";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"g7";a:11:{s:8:"share_id";s:1:"6";s:2:"id";s:1:"7";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/06/99634914d609a189076c3c7061557e3bcsXx49.jpg";s:4:"type";s:1:"g";s:4:"name";s:82:"[特]安安家 日韩居家 可爱 轻松熊 保温杯水杯办公杯车载杯H209";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=14950464798";s:5:"price";s:5:"29.80";s:9:"taoke_url";s:173:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ8QZw8nAsVYUWYwObf371Lfm%2Fh1Vj2iZdjzPT6pFHb0GKVh20clWpoRMvljQWZlMx2AqqmbJpTHBe69VMFCJ%2BXdQzcdNEzX8%2FItHm5&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(7, 1, '', 0, 0, '这个是一个', 0, 0, 0, 12, 1332192478, 1332144000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:9:"多功能";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"韩国";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"帆布";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"g8";a:11:{s:8:"share_id";s:1:"7";s:2:"id";s:1:"8";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/07/d277ef053f8d17b2e93c49d0066415dfkA80ge.jpg";s:4:"type";s:1:"g";s:4:"name";s:67:"韩国 金属小飞机多功能帆布多功能旅行 护照夹 H320";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=15888020664";s:5:"price";s:5:"28.80";s:9:"taoke_url";s:171:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWWx5e5VqPl5107Zf6RwqXfCb5%2BgbkBND1nmZ3w%2BEqPzYIaLa5dg81bZSfZjgWNzeufbDOAwQkWqRTaY1lk4B6L6tR1tOmKoNKFWUYo&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"310";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt'),
(8, 1, '', 0, 0, '1个安安家 可爱卡通兔子迷你小台灯/可充电LED台灯 创意家居 L108', 0, 0, 0, 15, 1332192555, 1332144000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:12:"创意家居";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"台灯";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"g9";a:11:{s:8:"share_id";s:1:"8";s:2:"id";s:1:"9";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/08/d2fe4a8daaf3f790c0924efa37a4be9fQVMWpC.jpg";s:4:"type";s:1:"g";s:4:"name";s:80:"安安家 可爱卡通兔子迷你小台灯/可充电LED台灯 创意家居 L108";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=10658397770";s:5:"price";s:5:"28.60";s:9:"taoke_url";s:175:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA4%2Firp54gKFnReQ40kcLZH1Hv9CdC%2FK6SEhgROZ1U%2F3dx69xWjeSOC69cF%2Fv6RPY5cVke2I6iqitaYoCNQuhuWZJC18UfaNFED6iN5&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(9, 1, '', 0, 0, '1个【多米乐】美式风格台灯 学习工作护眼灯饰 长臂折叠灯具 铁艺台灯', 0, 0, 0, 15, 1332192622, 1332144000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"护眼灯";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"台灯";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g10";a:11:{s:8:"share_id";s:1:"9";s:2:"id";s:2:"10";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/09/e792445c6d6a63c206f056d57a148d33m101u2.jpg";s:4:"type";s:1:"g";s:4:"name";s:86:"[多米乐]美式风格台灯 学习工作护眼灯饰 长臂折叠灯具 铁艺台灯";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=12905396889";s:5:"price";s:5:"34.50";s:9:"taoke_url";s:183:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKq8kz%2BWBHKCNA1utPL9c0nExQm8jlzoqExyWCpNB6k0ZXDE4T00Il7uH5Wfh3dxxYA6Eh2pRuPX4r%2BrhH5KRj8iR%2FFRNMrK%2BzBUO1bHQ%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"310";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt'),
(10, 1, '', 0, 0, '3个安安家 日韩居家 时尚 双层真空不锈钢杯保温杯水杯办公杯 C401', 0, 0, 0, 19, 1332192693, 1332144000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"保温杯";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"水杯";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g11";a:11:{s:8:"share_id";s:2:"10";s:2:"id";s:2:"11";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/10/8031224df4a0c3303f96b9d142e54e36GgkLgL.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"安安家 日韩居家 时尚 双层真空不锈钢杯保温杯水杯办公杯 C401";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=13438974650";s:5:"price";s:5:"18.50";s:9:"taoke_url";s:179:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOSJ4cX%2Bqan2G%2F5up0ukkD7sfo8juCvuClj20bQwo%2B5IT%2FwQSJ6A0r0oG887UVfraRED%2Fb%2FJiWfbL04Gg11RscGMWKiIek71m5Dn6dd&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1200";s:10:"img_height";s:4:"1200";}}}}', 0, '', 100, 'bupt'),
(13, 1, '', 0, 1, '美丽而不失优雅', 1, 0, 0, 7, 1332382741, 1332316800, '美丽而不失优雅', 'album', 'default', 0, 0, 0, '', 1, 0, 'a:4:{s:4:"tags";N;s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:0:{}}', 0, '', 100, 'bupt'),
(14, 1, '', 0, 1, '今年还是很流行蓬蓬裙噢~ 长的，短的，前短后长的~ 快点休息啦亲们 好梦！', 0, 0, 0, 16, 1332384623, 1332316800, '美丽而不失优雅', 'album_item', 'photo', 0, 1, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"蓬蓬裙";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"流行";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:2:{s:3:"all";a:1:{s:2:"m2";a:10:{s:8:"share_id";s:2:"14";s:2:"id";s:1:"2";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/14/aa0cc1479c8d96287fddbbba3ff5fa01L9kdnD.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"600";s:10:"img_height";s:3:"616";}}s:5:"dapei";a:1:{i:0;s:2:"m2";}}}', 0, './public/upload/images/201203/31/4f767bc0f3e92.jpg', 100, 'bupt'),
(15, 1, '', 0, 0, '包包 女包 复古', 1, 0, 0, 16, 1332458546, 1332403200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"包包";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"女包";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"复古";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:1:{i:3;s:1:"3";}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g13";a:11:{s:8:"share_id";s:2:"15";s:2:"id";s:2:"13";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/15/109f6990a21f9edff3a67a9971f26c79CdMddd.jpg";s:4:"type";s:1:"g";s:4:"name";s:88:"专柜正品2012新款包包女包欧美复古单肩手提包配真皮女士包潮包邮";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=14279783488";s:5:"price";s:6:"378.00";s:9:"taoke_url";s:183:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ3jqLMScKhEOovq3ZKd78SMKjAC3PwdRqG04I9uQ93%2BfNsLJaiASDazROPLWpWxYGkg3b56L2Xz%2BgaE1vRtNg%2BCFZPNbY70OmRm%2FVJIw%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(16, 1, '', 0, 0, 'The Face Shop 花语净泽水乳套装混合性 爽肤水+乳液 清爽补水', 1, 0, 0, 15, 1332458853, 1332403200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:6:"套装";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"爽肤水";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"补水";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:9:"混合性";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:1:{i:3;s:1:"3";}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g14";a:11:{s:8:"share_id";s:2:"16";s:2:"id";s:2:"14";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/16/b2cbe4fb3973c80cbc78abe821c93b38QhXGNt.jpg";s:4:"type";s:1:"g";s:4:"name";s:77:"The Face Shop 花语净泽水乳套装混合性 爽肤水+乳液 清爽补水";s:3:"url";s:46:"http://item.taobao.com/item.htm?id=14215215312";s:5:"price";s:5:"95.00";s:9:"taoke_url";s:179:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ3iNbrxXNPBHuKAMbQVQC0GRjGPb6XSg3hbO3Tpkb1z0iSl%2BnVbAOsNhyIWiZYdAbE49pipWQxYpILCIO833d%2BeQWIPJ88XaDLsC4Fcw%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(18, 1, '', 0, 1, '站内直接购买图中的商品', 0, 0, 0, 17, 1332487759, 1332403200, '站内直接购买图中的商品', 'ershou', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"m3";a:10:{s:8:"share_id";s:2:"18";s:2:"id";s:1:"3";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/18/b79e98e958f21f1b048cfd3e72e733c1ShQCSX.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"640";s:10:"img_height";s:3:"640";}}}}', 0, '', 100, 'bupt'),
(19, 1, '', 0, 2, '星座时尚搭配', 0, 0, 0, 11, 1332488616, 1332403200, '星座时尚搭配', 'ershou', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"m4";a:10:{s:8:"share_id";s:2:"19";s:2:"id";s:1:"4";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/19/6db05e0c2ce830a59a9c265cdac00d894ZbJB0.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"640";s:10:"img_height";s:3:"640";}}}}', 0, '', 100, 'bupt'),
(20, 3, '', 17, 0, '我喜欢这个，谢谢你的分享[爱心]//@m23linzhe:佳能（Canon） EOS 600D 单反套机（EF-S 18-55mm f/3.5-5.6 IS II 镜头）', 0, 0, 0, 6, 1332489577, 1332403200, '', 'fav', 'default', 17, 0, 0, '', 1, 0, 'a:4:{s:4:"tags";N;s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:0:{}}', 0, '', 100, 'bupt'),
(21, 3, '', 16, 0, '我喜欢这个，谢谢你的分享[爱心]//@m23linzhe:The Face Shop 花语净泽水乳套装混合性 爽肤水+乳液 清爽补水', 0, 0, 0, 2, 1332489584, 1332403200, '', 'fav', 'default', 16, 0, 0, '', 1, 0, 'a:4:{s:4:"tags";N;s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:0:{}}', 0, '', 100, 'bupt'),
(22, 3, '', 15, 0, '我喜欢这个，谢谢你的分享[爱心]//@m23linzhe:包包 女包 复古', 0, 0, 0, 2, 1332489587, 1332403200, '', 'fav', 'default', 15, 0, 0, '', 1, 0, 'a:4:{s:4:"tags";N;s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:0:{}}', 0, '', 100, 'bupt'),
(23, 1, '', 0, 0, '杜尚演绎2012新款春装男装夹克纯棉修身精品外套男士休闲上衣', 0, 0, 0, 10, 1332573394, 1332489600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:6:"夹克";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"男装";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"修身";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g16";a:11:{s:8:"share_id";s:2:"23";s:2:"id";s:2:"16";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/23/be90fa557c466ad31a046eae45d654c9d6tKOk.jpg";s:4:"type";s:1:"g";s:4:"name";s:82:"杜尚演绎2012新款春装男装夹克纯棉修身精品外套男士休闲上衣";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=13769186168&spm=2014.12513803.0.0";s:5:"price";s:6:"396.00";s:9:"taoke_url";s:183:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOR%2FphavLuICA73jUhpYSPC4omNZKey3nMaLB1Fb5z3kLR1Z2%2BHzFwPlMmbFSFLEYXcHGdqKl%2FUiJEeL487YotZ4grGz1WvR5soAo%2BbGg%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"500";s:10:"img_height";s:3:"500";}}}}', 0, '', 100, 'bupt'),
(24, 1, '', 0, 0, '2012春装新款男士精品男装加厚立领夹克男款修身时尚休闲外套潮', 0, 0, 0, 9, 1332573461, 1332489600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"男款";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:12:"立领夹克";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g17";a:11:{s:8:"share_id";s:2:"24";s:2:"id";s:2:"17";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/24/bca9262c399fee49f29f491aa8b11d537v6eIN.jpg";s:4:"type";s:1:"g";s:4:"name";s:85:"2012春装新款男士精品男装加厚立领夹克男款修身时尚休闲外套潮";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=12957345861&spm=2014.12513803.0.0";s:5:"price";s:6:"258.00";s:9:"taoke_url";s:179:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKq9wGbiI1RRZrTzBYKQeiBb1JDTJ5DVzkI%2F0Il60XGcT2857dQzzO%2B2DxlmQ5eUQea17dDGltVdyQOMaOG7Egz1zKXsZSXwPWs5Xmkew%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"500";s:10:"img_height";s:3:"500";}}}}', 0, '', 100, 'bupt'),
(25, 1, '', 0, 0, '2012春装新款男士韩版修身羊毛呢夹克休闲精品潮男装时尚上衣外套', 0, 0, 0, 10, 1332573551, 1332489600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"毛呢";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"夹克";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g18";a:11:{s:8:"share_id";s:2:"25";s:2:"id";s:2:"18";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/25/38809318e2f1e46355ca4a7192bff732Cz6L2b.jpg";s:4:"type";s:1:"g";s:4:"name";s:88:"2012春装新款男士韩版修身羊毛呢夹克休闲精品潮男装时尚上衣外套";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=12987522521&spm=2014.12513803.0.0";s:5:"price";s:6:"396.00";s:9:"taoke_url";s:183:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKq%2BjaS93h6YS%2BTThAs2h0QoK3%2B2NdFy0tyzGQYWA9V9UgykvtghCMP5N8zhZJ8c9%2FMaivkhXUJuxpBcmfvYRHTTrypPUOFbtUKGa4Izg%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"500";s:10:"img_height";s:3:"500";}}}}', 0, '', 100, 'bupt'),
(26, 1, '', 0, 0, '特价限量400件顶慕2011新款女装两件套长袖条纹T+背心连帽马甲', 0, 0, 0, 14, 1332577151, 1332576000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:6:"背心";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"女装";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"连帽";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"马甲";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g19";a:11:{s:8:"share_id";s:2:"26";s:2:"id";s:2:"19";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/26/36609553435f81fc53e94d5fa75203c1gzio0h.jpg";s:4:"type";s:1:"g";s:4:"name";s:81:"特价限量400件顶慕2011新款女装两件套长袖条纹T+背心连帽马甲";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=12904180283&spm=2014.12513803.0.0";s:5:"price";s:5:"60.00";s:9:"taoke_url";s:181:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKq8k3wRjhpUisDVzZtIzbh%2FdQE2Rta0gmUk0loQlaUA00FEhBna%2BC2A8Aivu3CuGq3m0e4OFZ7Tf6JTfua0ttb3Y4AAv%2FsuDLKUUc6lw%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1000";s:10:"img_height";s:4:"1000";}}}}', 0, '', 100, 'bupt'),
(27, 1, '', 0, 0, '顶慕2012新款春装修身荷叶边ol通勤泡泡袖蛋糕裙层层连衣裙女', 0, 0, 0, 12, 1332577255, 1332576000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:9:"连衣裙";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"荷叶";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:4:"2012";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g20";a:11:{s:8:"share_id";s:2:"27";s:2:"id";s:2:"20";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/27/4070cf0a2b3bebef30a902ad421ad333QAhQ32.jpg";s:4:"type";s:1:"g";s:4:"name";s:81:"顶慕2012新款春装修身荷叶边ol通勤泡泡袖蛋糕裙层层连衣裙女";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14167811081&spm=2014.12513803.0.0";s:5:"price";s:6:"256.00";s:9:"taoke_url";s:179:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0Fdm%2F0n3bovEWAeLQH5KVXBocPqGwGZanQNUrKtDU86r1YPOUh0u7aKRydXBiOz9bcGg0yTXJqYCu0dQtkEPR%2B0DgNWawzAt52zlesA%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1000";s:10:"img_height";s:4:"1000";}}}}', 0, '', 100, 'bupt'),
(28, 1, '', 0, 0, '顶慕日系韩版仿呢料中长呢大衣甜美冬装大衣修身带帽外套4折包邮', 0, 0, 0, 11, 1332577357, 1332576000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"带帽";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"呢料";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"包邮";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g21";a:11:{s:8:"share_id";s:2:"28";s:2:"id";s:2:"21";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/28/97bad4ce043a5ce6ac37957eb60cc4f7xD4LCv.jpg";s:4:"type";s:1:"g";s:4:"name";s:88:"顶慕日系韩版仿呢料中长呢大衣甜美冬装大衣修身带帽外套4折包邮";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14099316957&spm=2014.12513803.0.0";s:5:"price";s:6:"364.00";s:9:"taoke_url";s:181:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ1HzY23JBdu0JbPZuSho%2BYtU9%2B8ox0l6YmlxBy%2FgIcHlPfKgrpIJTIFqtiLZLSHoLlncr7jcD217igFpIMpzLl1YTjJjmShZAVwnFOHw%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1000";s:10:"img_height";s:4:"1000";}}}}', 0, '', 100, 'bupt'),
(29, 1, '', 0, 1, '黑色的雪花裤子一年四季都很通用，那就要看怎么去搭配了！搭配经典的格子衬衫，那就是完美的春装组合，再配上蝴蝶结装饰的单鞋就可以了。', 0, 0, 0, 10, 1332578162, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:12:"雪花裤子";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"蝴蝶结";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:12:"格子衬衫";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:12:"春装组合";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"m5";a:10:{s:8:"share_id";s:2:"29";s:2:"id";s:1:"5";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/29/41a6d07185e065629abad674d46a2975urnbpX.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"441";s:10:"img_height";s:3:"659";}}}}', 0, '', 100, 'bupt'),
(30, 1, '', 0, 1, '正红色立体睫毛T恤，挺有意思的一款t恤，前短后长的设计。还有一个小燕尾。非常的个性气质呢，随意的搭配就非常好看啦。', 0, 0, 0, 10, 1332578267, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:1:{i:0;a:2:{s:8:"tag_name";s:9:"小燕尾";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"m6";a:10:{s:8:"share_id";s:2:"30";s:2:"id";s:1:"6";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/30/00eb0b20308165bf5ae574fe8c6d7904s4KZD7.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"460";s:10:"img_height";s:3:"565";}}}}', 0, '', 100, 'bupt'),
(31, 1, '', 0, 1, '简约的圆领T恤，是白搭的绝佳。抽象图案的融入，增添几分俏皮的色彩，下摆不规则的设计，更完美的拉长腿部线条。搭配牛仔裤出门，简约不失风尚，茫茫人海中，总能发现不一样的你！', 0, 0, 0, 13, 1332578322, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:10:"圆领T恤";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"简约";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"m7";a:10:{s:8:"share_id";s:2:"31";s:2:"id";s:1:"7";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/31/a30b296cc4906d0aea5e47664212f912PJMW97.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"418";s:10:"img_height";s:3:"540";}}}}', 0, '', 100, 'bupt'),
(32, 1, '', 0, 1, '今年有那么度美丽的颜色，西瓜红作为今年流行挚爱，温暖的浓郁的热情的颜色，吊带设计，胸部特别的荷叶边装饰，松紧腰，下摆百褶的中长设计，是一件就够美的那种，上班外面可以搭配开衫小西服，出游度假一件都够美，搭配特别的开衫也是上乘之选。', 1, 1, 2, 12, 1332578398, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"西瓜红";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"吊带";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:1:{i:3;s:1:"3";}s:8:"comments";a:1:{i:0;s:1:"1";}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"m8";a:10:{s:8:"share_id";s:2:"32";s:2:"id";s:1:"8";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/32/a85552bfa583157bd9e06f960a70efd294xO4H.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"438";s:10:"img_height";s:3:"655";}}}}', 0, '', 100, 'bupt'),
(33, 1, '', 0, 1, '清爽半透的罩衫，搭配糖果色系的裤子裙子，流露出洋气的质感。一款高帮的楔跟凉鞋，花季少女立即洋溢一派纯纯的学院风。', 0, 0, 0, 13, 1332578448, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:6:"罩衫";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"学院风";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:2:"m9";a:10:{s:8:"share_id";s:2:"33";s:2:"id";s:1:"9";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/33/78ca250512e5cf48224dab306449ef0botqtqv.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"460";s:10:"img_height";s:3:"507";}}}}', 0, '', 100, 'bupt'),
(34, 1, '', 0, 1, '黑白配是非常经典的简约组合，黑色修身牛仔裤越显优雅，而白色的衬衫可以凸显美人知性，白色的鱼嘴高跟鞋更加拉长腿部曲线。', 0, 0, 0, 18, 1332578503, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:9:"黑白配";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:12:"简约组合";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:15:"修身牛仔裤";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:15:"鱼嘴高跟鞋";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m10";a:10:{s:8:"share_id";s:2:"34";s:2:"id";s:2:"10";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/34/7a76b7cd6c9ee3f6d6c66844e7540fbdbb7z5s.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"394";s:10:"img_height";s:3:"548";}}}}', 0, '', 100, 'bupt'),
(35, 1, '', 0, 1, '长袖雪纺碎花连衣裙，高腰的板型充分强调你纤细的腰部曲线，略微宽松的裙摆可以让小腹上的赘肉轻松隐藏起来。方形领口更修饰脸型，显瘦效果很好，细密的风琴褶灵动细腻。', 0, 0, 0, 16, 1332578564, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:12:"雪纺碎花";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"连衣裙";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:12:"方形领口";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m11";a:10:{s:8:"share_id";s:2:"35";s:2:"id";s:2:"11";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/35/67b2ff69383527f70807e1159db26f79f8Jno5.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"350";s:10:"img_height";s:3:"450";}}}}', 0, '', 100, 'bupt'),
(36, 1, '', 0, 1, '生命中最美好的都是看不见的，这就是为什么我们会在接吻，哭泣，许愿的时候闭上眼睛。今天主页菌早早的休息了呦~ 先跟大家说晚安了~ 好梦~', 0, 0, 0, 13, 1332578712, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m12";a:10:{s:8:"share_id";s:2:"36";s:2:"id";s:2:"12";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/36/d556e88059c2bc79afbaebc1f5b69edckHc2rA.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"596";s:10:"img_height";s:3:"900";}}}}', 0, '', 100, 'bupt'),
(37, 1, '', 0, 1, '一只可爱的小狗噢~ 是比熊~ 各位晚安 做个好梦！', 0, 0, 0, 13, 1332578741, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m13";a:10:{s:8:"share_id";s:2:"37";s:2:"id";s:2:"13";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/37/31cb9267e4a38130c1a155b190740072FNdnm0.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"600";s:10:"img_height";s:3:"860";}}}}', 0, '', 100, 'bupt'),
(38, 1, '', 0, 1, '给大家介绍一个小妖精呦~ Ebba Zingmark ~ 亲们早点休息呐~ 晚安(吻)', 0, 0, 0, 10, 1332578775, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m14";a:10:{s:8:"share_id";s:2:"38";s:2:"id";s:2:"14";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/38/74222a4714cde54c497fdca4a0d7099cwFwFEc.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"720";s:10:"img_height";s:3:"662";}}}}', 0, '', 100, 'bupt'),
(39, 1, '', 0, 1, '想必大家都知道颜色搭配基本原则，从头到脚颜色最好不要超过三种。墨镜也是一件增强自信的饰物噢！有强大的自信才能有强大的气场！亲们好梦呦~~', 0, 0, 0, 16, 1332578814, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:6:"自信";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"墨镜";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m15";a:10:{s:8:"share_id";s:2:"39";s:2:"id";s:2:"15";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/39/3d054aa638de584e7ed9201657267171LM58v8.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"600";s:10:"img_height";s:3:"813";}}}}', 0, '', 100, 'bupt'),
(40, 1, '', 0, 1, '这是今年流行的冰沙色噢~ 春天这么穿回头率一定很高吧~ 周末不要玩太晚噢亲们~晚安好梦！', 0, 0, 0, 13, 1332578881, 1332576000, '美丽而不失优雅', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:1:{i:0;a:2:{s:8:"tag_name";s:9:"冰沙色";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m16";a:10:{s:8:"share_id";s:2:"40";s:2:"id";s:2:"16";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/40/75e762fc9073ac45668237ce2b25c11cO5kIaV.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"367";s:10:"img_height";s:3:"550";}}}}', 0, '', 100, 'bupt'),
(41, 1, '', 0, 2, '', 0, 0, 0, 1, 1332579122, 1332576000, '流行时尚', 'album', 'default', 0, 0, 0, '', 1, 0, 'a:4:{s:4:"tags";N;s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:0:{}}', 0, '', 100, 'bupt'),
(42, 1, '', 0, 2, '加入星座秀《流行时尚》', 0, 0, 0, 13, 1332579140, 1332576000, '流行时尚', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m17";a:10:{s:8:"share_id";s:2:"42";s:2:"id";s:2:"17";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/40/75e762fc9073ac45668237ce2b25c11cO5kIaV.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"367";s:10:"img_height";s:3:"550";}}}}', 1, '', 100, 'bupt'),
(43, 1, '', 0, 2, '加入星座秀《流行时尚》', 0, 0, 0, 8, 1332579151, 1332576000, '流行时尚', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m18";a:10:{s:8:"share_id";s:2:"43";s:2:"id";s:2:"18";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/39/3d054aa638de584e7ed9201657267171LM58v8.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"600";s:10:"img_height";s:3:"813";}}}}', 1, '', 100, 'bupt'),
(44, 1, '', 0, 2, '加入星座秀《流行时尚》', 0, 0, 0, 6, 1332579156, 1332576000, '流行时尚', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m19";a:10:{s:8:"share_id";s:2:"44";s:2:"id";s:2:"19";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/38/74222a4714cde54c497fdca4a0d7099cwFwFEc.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"720";s:10:"img_height";s:3:"662";}}}}', 1, '', 100, 'bupt'),
(45, 1, '', 0, 2, '加入星座秀《流行时尚》', 0, 0, 0, 7, 1332579164, 1332576000, '流行时尚', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m20";a:10:{s:8:"share_id";s:2:"45";s:2:"id";s:2:"20";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/35/67b2ff69383527f70807e1159db26f79f8Jno5.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"350";s:10:"img_height";s:3:"450";}}}}', 1, '', 100, 'bupt'),
(46, 1, '', 0, 2, '加入星座秀《流行时尚》', 0, 0, 0, 6, 1332579171, 1332576000, '流行时尚', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m21";a:10:{s:8:"share_id";s:2:"46";s:2:"id";s:2:"21";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/33/78ca250512e5cf48224dab306449ef0botqtqv.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"460";s:10:"img_height";s:3:"507";}}}}', 1, '', 100, 'bupt'),
(47, 1, '', 0, 2, '加入星座秀《流行时尚》', 0, 0, 0, 7, 1332579176, 1332576000, '流行时尚', 'album_item', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m22";a:10:{s:8:"share_id";s:2:"47";s:2:"id";s:2:"22";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/32/a85552bfa583157bd9e06f960a70efd294xO4H.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"438";s:10:"img_height";s:3:"655";}}}}', 1, '', 100, 'bupt'),
(48, 1, '', 0, 0, '包邮 春装 韩版高腰半身裙 半身短裙 西装裙 黑色短裙 裙子', 0, 0, 0, 18, 1332650938, 1332576000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"裙子";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"短裙";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:9:"半身裙";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g22";a:11:{s:8:"share_id";s:2:"48";s:2:"id";s:2:"22";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/48/5c3b890aef855cdf078fcb96e1b9245386SGqQ.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"包邮 春装 韩版高腰半身裙  半身短裙 西装裙   黑色短裙 裙子  ";s:3:"url";s:59:"http://auction1.paipai.com/79206D070000000000793B600811D795";s:5:"price";s:5:"55.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"310";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt'),
(49, 1, '', 0, 0, '1659-2012女装新款韩版热卖时尚蝴蝶结亮片百褶裙 半身裙', 0, 0, 0, 14, 1332651025, 1332576000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"韩版";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"半身裙";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:9:"百褶裙";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g23";a:11:{s:8:"share_id";s:2:"49";s:2:"id";s:2:"23";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/49/090fd2c19de1e2c861294a9d83430904amT1SE.jpg";s:4:"type";s:1:"g";s:4:"name";s:73:"1659-2012女装新款韩版热卖时尚蝴蝶结亮片百褶裙 半身裙";s:3:"url";s:59:"http://auction1.paipai.com/5C123212000000000401000001164E0F";s:5:"price";s:5:"39.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"300";s:10:"img_height";s:3:"300";}}}}', 0, '', 100, 'bupt'),
(50, 1, '', 0, 0, '2012春夏 女装衬衫百搭修身 中袖衬衣 荷叶边雪纺衫 送打底抹胸', 0, 0, 0, 19, 1332656993, 1332576000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"春夏";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"雪纺衫";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"女装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g24";a:11:{s:8:"share_id";s:2:"50";s:2:"id";s:2:"24";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/50/6bf49162a6a7c60bd48a4e20f9ec83088MSELl.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"2012春夏 女装衬衫百搭修身 中袖衬衣 荷叶边雪纺衫 送打底抹胸";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=13950406027&spm=2014.12513803.0.0";s:5:"price";s:6:"126.00";s:9:"taoke_url";s:191:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOf%2F7oCi5RWQLck2ERJUNQsrluGJl6KZsxqeMhXF%2FyCu%2BfyIFt6C6D%2BCkKlzs2%2FkHqWHz%2FVeaefUWV21yE%2Fa39AWVdcSIQP%2Fzc8NuyzUQ%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"900";s:10:"img_height";s:3:"900";}}}}', 0, '', 100, 'bupt'),
(51, 1, '', 0, 0, '2012春装新品韩版舒适休闲百搭格子格纹衬衣衬衫女长袖英伦学院风', 0, 0, 0, 10, 1332659560, 1332576000, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"学院";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"休闲";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"格子";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g25";a:11:{s:8:"share_id";s:2:"51";s:2:"id";s:2:"25";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/51/f23f63c1a84d715d68487e713b27969di8r6xZ.jpg";s:4:"type";s:1:"g";s:4:"name";s:88:"2012春装新品韩版舒适休闲百搭格子格纹衬衣衬衫女长袖英伦学院风";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=13962798940&spm=2014.12513803.0.0";s:5:"price";s:5:"96.00";s:9:"taoke_url";s:189:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOf%2FMhGXM%2Fg%2BlxPCEhD6T2ohDbqUdXjL0yeaB87xU6LgDdiXi%2BB19%2BLfN6HrIhaNAUbAOWxGYlaUnRim7NacG9yjz%2BKEDCO2Pb%2F2mLrwQ%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"900";s:10:"img_height";s:3:"899";}}}}', 0, '', 100, 'bupt'),
(52, 1, '', 0, 1, '据说科学家做了这样一个实验并得到证实：如果一个人每天站在镜子前，冲自己微笑，告诉自己“我很美”，那么他真的越来越美——心理暗示的力量如此强大。一个女人，有了自信便有了美。有了自信便会感觉到，爱情在自己生命中的地位也没那么重要，有很多事情可以享受，爱情也许很卑微。胖妞们记住，你们也很美丽', 0, 0, 0, 19, 1332701606, 1332662400, '人人都爱小胖妞', 'bar', 'photo', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"m23";a:10:{s:8:"share_id";s:2:"52";s:2:"id";s:2:"23";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/52/6c984899279ead19756f631fc436a379yFlOVL.jpg";s:4:"type";s:1:"m";s:4:"name";s:0:"";s:3:"url";s:0:"";s:5:"price";s:1:"0";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"306";s:10:"img_height";s:3:"435";}}}}', 0, '', 100, 'bupt'),
(53, 1, '', 0, 0, '娇韵诗 抚纹身体霜200ml 产后恢复 祛妊娠纹肥胖纹 代购现货正品', 0, 0, 0, 15, 1332817629, 1332748800, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:9:"娇韵诗";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"代购";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"正品";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g26";a:11:{s:8:"share_id";s:2:"53";s:2:"id";s:2:"26";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/53/573dc13449b8fe700836600d56339415L1w3Vt.jpg";s:4:"type";s:1:"g";s:4:"name";s:84:"娇韵诗 抚纹身体霜200ml 产后恢复 祛妊娠纹肥胖纹 代购现货正品";s:3:"url";s:67:"http://item.taobao.com/item.htm?id=6994390010&spm=2014.12513803.0.0";s:5:"price";s:6:"255.00";s:9:"taoke_url";s:169:"http://s.click.taobao.com/t_8?e=7HZ6jHSTa09dDWz5bplfGvNHVZ8BZnamvpCtWw9k4wPBj%2B1Nj9VaZVXefD1Nc5ZKMffwKlDMWQWsck4hWLBHz1IhNVVTDaquKOm76xdxU9uje7pZ&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"750";s:10:"img_height";s:3:"750";}}}}', 0, '', 100, 'bupt'),
(55, 1, '', 0, 0, '【金冠】Clarins娇韵诗HD第五代红魔晶完全纤体精华霜/瘦身 200ml', 0, 0, 0, 19, 1332817806, 1332748800, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:9:"娇韵诗";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"金冠";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:7:"Clarins";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g28";a:11:{s:8:"share_id";s:2:"55";s:2:"id";s:2:"28";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/55/b3117385d9bc0f0b4bb98d36cc5f9e4bHbyN0a.jpg";s:4:"type";s:1:"g";s:4:"name";s:82:"【金冠】Clarins娇韵诗HD第五代红魔晶完全纤体精华霜/瘦身 200ml";s:3:"url";s:67:"http://item.taobao.com/item.htm?id=2883772582&spm=2014.12513803.0.0";s:5:"price";s:6:"230.00";s:9:"taoke_url";s:175:"http://s.click.taobao.com/t_8?e=7HZ6jHSTb06zPIKdHvAN9vyTFsrUrqo0Xx4NYNLZDyMoiKiI0jO6CFlE4tq%2FocvzqeDKZpP8TeZxpTPMPe%2Fnp%2FXT2ltmBIxlq0hn0u3FdNR1qEk%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(56, 3, '', 32, 1, '我喜欢这个，谢谢你的分享[爱心]//@test1:今年有那么度美丽的颜色，西瓜红作为今年流行挚爱，温暖的浓郁的热情的颜色，吊带设计，胸部特别的荷叶边装饰，松紧腰，下摆百褶的中长设计，是一件就够美的那种，上班外面可以搭配开衫小西服，出游度假一件都够美，搭配特别的开衫也是上乘之选。', 0, 0, 0, 0, 1332818534, 1332748800, '', 'fav', 'default', 32, 0, 0, '', 1, 0, 'a:4:{s:4:"tags";N;s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:0:{}}', 0, '', 100, 'bupt'),
(57, 3, '', 32, 1, '[奶瓶]', 0, 1, 1, 2, 1332818562, 1332748800, '美丽而不失优雅', 'default', 'default', 32, 0, 0, '', 1, 0, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:1:{i:0;s:1:"2";}s:4:"imgs";a:0:{}}', 0, '', 100, 'bupt'),
(58, 3, '', 57, 1, '这个在哪里可以买到呢？//@test2:[奶瓶]', 0, 0, 0, 2, 1332820871, 1332748800, '美丽而不失优雅', 'default', 'default', 32, 0, 0, '', 1, 0, 'a:4:{s:4:"tags";N;s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:0:{}}', 0, '', 100, 'bupt'),
(59, 3, '', 0, 0, 'A2805 芥末花开 2012春装新款韩版宽松中长款长袖圆领雪纺连衣裙', 0, 0, 0, 7, 1332903655, 1332835200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:9:"连衣裙";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"雪纺";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g29";a:11:{s:8:"share_id";s:2:"59";s:2:"id";s:2:"29";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/59/779baa04234eee3c9d3b7dacb39fb014f4mVv9.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"A2805 芥末花开 2012春装新款韩版宽松中长款长袖圆领雪纺连衣裙";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14173541030&spm=2014.12513803.0.0";s:5:"price";s:6:"129.00";s:9:"taoke_url";s:169:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0FFnv4kPaI%2FgaslGOmiSD778BWHDMsAbaZX4OHAZRWDLJIPoSARLAbgA5wANlRMtDBBkzyWmQnewbnMAz4UWKNVfxKchvUyjyRvw8&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt');
INSERT INTO `fanwe_share` (`share_id`, `uid`, `user_name`, `parent_id`, `rec_id`, `content`, `collect_count`, `comment_count`, `relay_count`, `click_count`, `create_time`, `day_time`, `title`, `type`, `share_data`, `base_id`, `is_best`, `is_rec_best`, `collect_share`, `status`, `is_index`, `cache_data`, `rec_uid`, `index_img`, `sort`, `server_code`) VALUES
(60, 3, '', 0, 0, 'A2799 芥末花开 2012春装新款复古赫本气质立体裁剪修身连衣裙', 0, 0, 0, 6, 1332903701, 1332835200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:9:"连衣裙";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"复古";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g30";a:11:{s:8:"share_id";s:2:"60";s:2:"id";s:2:"30";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/60/a43bb069c593bebd2ae2b4ff4caa5f4d01vd9V.jpg";s:4:"type";s:1:"g";s:4:"name";s:80:"A2799 芥末花开 2012春装新款复古赫本气质立体裁剪修身连衣裙";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14173325043&spm=2014.12513803.0.0";s:5:"price";s:5:"98.00";s:9:"taoke_url";s:173:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0FFnpJv9qe%2Bsenr2RlMgCx9vfeQmNhxGjonhZrFX4qCrF%2F%2BYHKOeVOfa0EDs5lExuMEvmMrqxdzmGJMAooUriKALgfrqEOWGejFgH&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(61, 3, '', 0, 0, 'A2800 芥末花开 2012春新款复古PU拼接英伦翻领双排扣西服女外套', 0, 0, 0, 8, 1332903759, 1332835200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"英伦";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"复古";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"西服";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g31";a:11:{s:8:"share_id";s:2:"61";s:2:"id";s:2:"31";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/61/02413e973c474f6df142d1b1df3a9470a44sN4.jpg";s:4:"type";s:1:"g";s:4:"name";s:82:"A2800 芥末花开 2012春新款复古PU拼接英伦翻领双排扣西服女外套";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14172178481&spm=2014.12513803.0.0";s:5:"price";s:6:"125.00";s:9:"taoke_url";s:173:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0FFiwEVAS8Rsc1yugJoWi%2BJ%2BJSLleuqiJWglpBvqjiZljKZv6AF6GOZGckdVzeAXPrupKN2gqfDOUtTBjFODEBSfHchHApFG1u%2Fth&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(62, 3, '', 0, 0, 'A2806 芥末花开 2012春装新款韩版百搭修身针织衫亮线开衫外套女', 0, 0, 0, 7, 1332903799, 1332835200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:9:"针织衫";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"开衫";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g32";a:11:{s:8:"share_id";s:2:"62";s:2:"id";s:2:"32";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/62/5212177c36783ca9fb58d49edc50fba5ATHsaT.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"A2806 芥末花开 2012春装新款韩版百搭修身针织衫亮线开衫外套女";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=16275708548&spm=2014.12513803.0.0";s:5:"price";s:6:"129.00";s:9:"taoke_url";s:173:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIbg02246zQ9usezIfWoi%2B7TtrashcJv0kS1qnsxxYZGvDU3HvmJjFKKXfBWEm1kY4E%2B7HB80%2BYQJQ2VT9Yg6fIUQyOq3f5XEaC7q9wA&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(63, 3, '', 0, 0, 'A2804 芥末花开 2012春季新款大小蝴蝶结波点宽松甜美雪纺衫', 0, 0, 0, 14, 1332903911, 1332835200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:6:"春季";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"雪纺衫";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g33";a:11:{s:8:"share_id";s:2:"63";s:2:"id";s:2:"33";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/63/d90aa8ace24e63fde17a368d40cba40dl481Gl.jpg";s:4:"type";s:1:"g";s:4:"name";s:77:"A2804 芥末花开 2012春季新款大小蝴蝶结波点宽松甜美雪纺衫";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14173545054&spm=2014.12513803.0.0";s:5:"price";s:5:"75.00";s:9:"taoke_url";s:171:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0FFnv4kenSnQ21c6%2BfoRjgMb%2FAozbrFefhIlvyKDsy6JQPZmOetmf9u3k9YdQKxNzRFlH7wKhLju2AsjuAoQvrzX0VaDTjqFC03Da&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(64, 3, '', 0, 0, 'A2763 芥末花开 2012春装新款韩版宽松长袖翻领轻盈纯棉百搭衬衫', 0, 0, 0, 9, 1332904039, 1332835200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"衬衫";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"翻领";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g34";a:11:{s:8:"share_id";s:2:"64";s:2:"id";s:2:"34";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/64/9d6ebd6981dcc586d32d83e0494c4993owVAuI.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"A2763 芥末花开 2012春装新款韩版宽松长袖翻领轻盈纯棉百搭衬衫";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14313411425&spm=2014.12513803.0.0";s:5:"price";s:5:"68.00";s:9:"taoke_url";s:175:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ2TEGXEjudQIxqydJHPP0s%2Fq%2BmpukDnHU%2Fj0i6OZn6bSRpEwQwU0VzBGC%2B4wBpNLWuqwIHx6XCUvQZMhR7kWEVqOcODv7bEY4Ow7yo&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(65, 3, '', 0, 0, 'A2803 芥末花开 2012春装新款女糖果色舒适修身单排扣西装小外套', 0, 0, 0, 9, 1332904118, 1332835200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"西装";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"外套";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g35";a:11:{s:8:"share_id";s:2:"65";s:2:"id";s:2:"35";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/65/875bcb277f438da58405520e7a92c773gxt4WF.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"A2803 芥末花开 2012春装新款女糖果色舒适修身单排扣西装小外套";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=16275500998&spm=2014.12513803.0.0";s:5:"price";s:6:"139.00";s:9:"taoke_url";s:175:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIbg02260TjLyu1E3Rh3Q%2B636USQarxWyxzY3Ykig7C81rpeEww0OWygBBXJG3AybI9LeJuhQtbFQWM%2FkWAefyprnFDb%2B4nGrTe%2F3gT0&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(66, 1, '', 0, 0, '限时限量!春装新品特价包邮仿牛仔弹力显瘦小脚打底裤女有加大码', 0, 0, 0, 5, 1333000816, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:9:"打底裤";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"牛仔";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g36";a:11:{s:8:"share_id";s:2:"66";s:2:"id";s:2:"36";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/66/c4b4535284e69d65f1d621b035fb0344Ce6X8D.jpg";s:4:"type";s:1:"g";s:4:"name";s:88:"限时限量!春装新品特价包邮仿牛仔弹力显瘦小脚打底裤女有加大码";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=16211276071&spm=2014.12513803.0.0";s:5:"price";s:6:"138.00";s:9:"taoke_url";s:181:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIbg1T%2Bncv9nF6uJoPk4xaJBL9qGUb27aJv5G%2BeFIKnS9o4noeC5DcJ0UveCljdg0NIm3A3KJqz8jzaNJPDYH%2FZVevNwKI6KsDxINfZ0fQ%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(67, 1, '', 0, 0, '新品 买4送1包邮 天鹅绒 超弹显瘦 踩脚 连裤 丝袜打底裤 女', 0, 0, 0, 5, 1333000864, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"天鹅绒";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"打底裤";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g37";a:11:{s:8:"share_id";s:2:"67";s:2:"id";s:2:"37";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/67/a8f2a98f0ce1391be820ff4dd891da5b4z4N9O.jpg";s:4:"type";s:1:"g";s:4:"name";s:78:"新品 买4送1包邮 天鹅绒 超弹显瘦 踩脚 连裤 丝袜打底裤 女";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14184042709&spm=2014.12513803.0.0";s:5:"price";s:5:"28.00";s:9:"taoke_url";s:179:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0Gwzt4RxF4Cy1rxpqP88IDKiNcYpYt0Rp44nQRL27NweuNTV321NpbMXq%2By1yioVGI1FalDUk2HDrsxDyc0TmAq6JOrKEDjNLN6%2BKWA%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(68, 1, '', 0, 0, '淘金币 2012春装新款小脚裤打底裤女式韩版显瘦小脚裤铅笔裤', 0, 0, 0, 4, 1333000951, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:9:"小脚裤";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"铅笔裤";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:9:"打底裤";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g38";a:11:{s:8:"share_id";s:2:"68";s:2:"id";s:2:"38";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/68/52e47666de968e1a0a63193db3ccd69eGWCX8v.jpg";s:4:"type";s:1:"g";s:4:"name";s:80:"淘金币 2012春装新款小脚裤打底裤女式韩版显瘦小脚裤铅笔裤";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=13747367032&spm=2014.12513803.0.0";s:5:"price";s:5:"98.00";s:9:"taoke_url";s:177:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOR%2FJAKKKHl1z7uCp%2BR9bMkguUS14rmu%2FyTYsTa5l%2FbQItvMNcw%2BRmK8UBNsxHlDnm4FuOYppYy8U5yfJ8UJkGsTbObFpvbmdvqSFXb&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(69, 1, '', 0, 0, '特价铅笔裤新款春装 糖果色打底裤 女装韩版 小脚裤子大码长裤', 0, 0, 0, 4, 1333001088, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:9:"打底裤";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"长裤";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:9:"铅笔裤";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g39";a:11:{s:8:"share_id";s:2:"69";s:2:"id";s:2:"39";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/69/39e12ef506ba2a96474d9b7faf519066y8XA0a.jpg";s:4:"type";s:1:"g";s:4:"name";s:84:"特价铅笔裤新款春装 糖果色打底裤 女装韩版 小脚裤子大码长裤";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14144510660&spm=2014.12513803.0.0";s:5:"price";s:6:"147.50";s:9:"taoke_url";s:183:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0F%2BjBnu2XDrT65muQ70E7KDY9kyPFPfE%2BzVIiEkbm9EPmKLRPdVThXQuiZrPIOCymp0CGeY888d%2FLy8dlB7oORXfb%2B4jcfyS4AYYXOw%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(70, 1, '', 0, 0, '糖果色彩色打底裤 百搭松紧腰弹性 水洗棉打底裤小脚雪花裤 薄款', 0, 0, 0, 4, 1333001154, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:9:"打底裤";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"水洗";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"小脚";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g40";a:11:{s:8:"share_id";s:2:"70";s:2:"id";s:2:"40";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/70/316a328d002cb8c5d0f4178516209f08KYSBGz.jpg";s:4:"type";s:1:"g";s:4:"name";s:87:"糖果色彩色打底裤 百搭松紧腰弹性 水洗棉打底裤小脚雪花裤 薄款";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14182362570&spm=2014.12513803.0.0";s:5:"price";s:5:"59.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"750";s:10:"img_height";s:3:"750";}}}}', 0, '', 100, 'bupt'),
(71, 1, '', 0, 0, '2012蜜桃家春夏新品韩国网纱蓬蓬裙假两件打底裤裙裤薄款包邮', 0, 0, 0, 4, 1333001361, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:9:"打底裤";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"春夏";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"裙裤";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g41";a:11:{s:8:"share_id";s:2:"71";s:2:"id";s:2:"41";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/71/118d9e1ffd40d64d087ac433eb899dd91VB6jI.jpg";s:4:"type";s:1:"g";s:4:"name";s:82:"2012蜜桃家春夏新品韩国网纱蓬蓬裙假两件打底裤裙裤薄款包邮";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=16259076006&spm=2014.12513803.0.0";s:5:"price";s:5:"78.00";s:9:"taoke_url";s:179:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIbg0fLIezF7MUcyBYDcp5d%2Folwo%2BHIh6Hz4MMsGfVcV0pC%2ByoD1ugbIA05CgwCgy514TtzM8JzxvhbfmAk%2Bu8vnmrTkeIb%2Bs%2B6I7RDu&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"778";s:10:"img_height";s:3:"778";}}}}', 0, '', 100, 'bupt'),
(72, 4, '', 0, 0, '秒杀价 2012新款韩国热卖百搭甜美脚腕绕带粗跟单鞋OL', 0, 0, 0, 7, 1333005766, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:6:"甜美";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"韩国";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g42";a:11:{s:8:"share_id";s:2:"72";s:2:"id";s:2:"42";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/72/8c84f3f9799aba0c2710d9155814c7670vj9Vb.jpg";s:4:"type";s:1:"g";s:4:"name";s:70:"秒杀价 2012新款韩国热卖百搭甜美脚腕绕带粗跟单鞋OL";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14776951420&spm=2014.12513803.0.0";s:5:"price";s:5:"47.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"405";s:10:"img_height";s:3:"404";}}}}', 0, '', 100, 'bupt'),
(73, 4, '', 0, 0, 'NIKE 耐克 男子经典板鞋 315122 414 40.5', 0, 0, 0, 5, 1333005897, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:4:"NIKE";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"经典";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"板鞋";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"耐克";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g43";a:11:{s:8:"share_id";s:2:"73";s:2:"id";s:2:"43";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/73/d9efece128e7489536a38e1774b97ffdx98jm0.jpg";s:4:"type";s:1:"g";s:4:"name";s:47:"NIKE 耐克 男子经典板鞋 315122 414  40.5";s:3:"url";s:45:"http://www.360buy.com/product/1002887832.html";s:5:"price";s:6:"538.00";s:9:"taoke_url";s:105:"http://click.union.360buy.com/JdClick/?unionId=14475&t=4&to=http://www.360buy.com/product/1002887832.html";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(74, 4, '', 0, 0, '休闲时尚修身的一款风衣，百搭经典而帅气，这款风衣版型利落修身，配以精致大气的领型设计，极具大牌气质。简约而有设计风格的风衣，裁剪线条明朗。翻领设计，视觉效果非常棒。腰间腰带可系成优雅的蝴蝶结，显得更时尚大气，使腰部显得更加纤细。', 0, 0, 0, 7, 1333006417, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:4:"OZZO";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"翻领";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"中长";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g44";a:11:{s:8:"share_id";s:2:"74";s:2:"id";s:2:"44";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/74/2697bd2516fd46dc07ac49b326e7c61bHz9MK1.jpg";s:4:"type";s:1:"g";s:4:"name";s:68:"OZZO欧尼迩2011秋装新品双排扣大翻领中长款外套113004";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=12816054034&spm=2014.12513803.0.0";s:5:"price";s:6:"399.00";s:9:"taoke_url";s:181:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKrNzLTkF4wriIYSygjMYMinuqgPniMacGbkpvF2OkzS5d231S%2FusJrRjkePfo1zK%2FQ3TVSSIAvWuf3F204cgMlCQ9MXVGS3o0O3gf%2FoQ%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(75, 4, '', 0, 0, '【6折】裂帛毛线帽子绣花盘扣斜襟风衣外套小房15110025#', 0, 0, 0, 4, 1333006572, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"盘扣";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"帽子";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"风衣";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g45";a:11:{s:8:"share_id";s:2:"75";s:2:"id";s:2:"45";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/75/74ad68cd9aafdc37ba444b0773f8cd41Th8RoO.jpg";s:4:"type";s:1:"g";s:4:"name";s:73:"【6折】裂帛毛线帽子绣花盘扣斜襟风衣外套小房15110025#";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=13050493578&spm=2014.12513803.0.0";s:5:"price";s:6:"298.00";s:9:"taoke_url";s:181:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOW0pPBgCfX7I7ZAPbe1%2BO2PxGZD3wspMzokSHtaPl%2BecdPomUmYTRESuRkpCSkWd17hdIiIhDaUHlIlpZ1Nx6XsmX8MsHRB3Eruw%2Fkqg%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(76, 4, '', 0, 0, 'Mr.ing 新品真皮正品潘多拉3代时尚潮流男式鞋 春夏单鞋F1325^@^', 0, 0, 0, 4, 1333006634, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:12:"时尚潮流";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"男式";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"真皮";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:9:"潘多拉";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g46";a:11:{s:8:"share_id";s:2:"76";s:2:"id";s:2:"46";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/76/bb1416453b733b4eb7e9df6e0bfa0660YUcEyC.jpg";s:4:"type";s:1:"g";s:4:"name";s:80:"Mr.ing 新品真皮正品潘多拉3代时尚潮流男式鞋 春夏单鞋F1325^@^";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14775671016&spm=2014.12513803.0.0";s:5:"price";s:6:"109.00";s:9:"taoke_url";s:179:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQy7Sy%2Fq0K3Zfo0q3M7scbJLEWG2SrDlQG63rjkzJ2p%2BedY6CKGwYSHwBKeqsFDMnGCFRkYvTptPhHoKfABkzKJl5BoQ0r0V61F8ELavQ%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1200";s:10:"img_height";s:4:"1200";}}}}', 0, '', 100, 'bupt'),
(77, 4, '', 0, 0, '安步当马日常休闲鞋子单鞋真皮英伦潮流商务男士皮鞋流行男鞋903', 0, 0, 0, 5, 1333006687, 1332921600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:6:"英伦";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"真皮";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"男士";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"潮流";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g47";a:11:{s:8:"share_id";s:2:"77";s:2:"id";s:2:"47";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/77/bac6058bcf61a9ab05a3ee4773e1ea3aoAa41Q.jpg";s:4:"type";s:1:"g";s:4:"name";s:87:"安步当马日常休闲鞋子单鞋真皮英伦潮流商务男士皮鞋流行男鞋903";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=15715476445&spm=2014.12513803.0.0";s:5:"price";s:6:"240.00";s:9:"taoke_url";s:183:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWZXoBD6Lv5gxFS6mziIYr%2Fk%2BD9D6yi76Pzk9lKQ8jpAsZjI2AmGcGIyfTHANvIail9EVwxer4PL4%2FfwSie%2BIQkwkoG11ChufRyzwKXLw%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1500";s:10:"img_height";s:4:"1500";}}}}', 0, '', 100, 'bupt'),
(78, 4, '', 0, 0, '货到付款包邮2012新品春装裙子韩版修身职业连衣裙', 0, 0, 0, 9, 1333169676, 1333094400, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"连衣裙";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"职业";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g48";a:11:{s:8:"share_id";s:2:"78";s:2:"id";s:2:"48";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/78/ee7ef9e708c27e68477e8ac217ec8c7cpZOCcp.jpg";s:4:"type";s:1:"g";s:4:"name";s:72:"货到付款包邮2012新品春装裙子韩版修身职业连衣裙     ";s:3:"url";s:59:"http://auction1.paipai.com/F7E9C63A00000000040100000B8FA8FA";s:5:"price";s:6:"118.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1000";s:10:"img_height";s:4:"1000";}}}}', 0, '', 100, 'bupt'),
(80, 4, '', 0, 0, '101010 CONVERSE/匡威 中性高帮帆布鞋 专柜正品', 0, 0, 0, 7, 1333170185, 1333094400, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:9:"帆布鞋";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"高帮";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"匡威";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:8:"CONVERSE";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g50";a:11:{s:8:"share_id";s:2:"80";s:2:"id";s:2:"50";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/80/78b22d9e2330eaddd9e8c537208549e7y99AVg.jpg";s:4:"type";s:1:"g";s:4:"name";s:58:"101010  CONVERSE/匡威 中性高帮帆布鞋 专柜正品";s:3:"url";s:67:"http://item.taobao.com/item.htm?id=3189610645&spm=2014.12513803.0.0";s:5:"price";s:6:"209.00";s:9:"taoke_url";s:181:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbjGXAVfCKHHbhE%2FJifUJ3np%2FWTM6TtxGjXVo8JCG9JFkz%2B7wVmohMM9pWshozZkW%2B%2BTcvnnic4%2FEIPbsz9WBk2cbCfR6pxVM200hZqc%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"310";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt'),
(81, 4, '', 0, 0, 'adidas 阿迪达斯 三叶草 NIZZA HI 蓝橙帆布 V23023', 0, 0, 0, 7, 1333170236, 1333094400, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:6:"帆布";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"三叶草";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:12:"阿迪达斯";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"adidas";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g51";a:11:{s:8:"share_id";s:2:"81";s:2:"id";s:2:"51";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/81/d746c0600dc384acad544841d7869d98LprIsJ.jpg";s:4:"type";s:1:"g";s:4:"name";s:58:"adidas 阿迪达斯 三叶草 NIZZA HI 蓝橙帆布 V23023";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14331351161&spm=2014.12513803.0.0";s:5:"price";s:6:"478.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"600";s:10:"img_height";s:3:"600";}}}}', 0, '', 100, 'bupt'),
(82, 4, '', 0, 0, '品牌特卖正品adidas阿迪达斯12新款男子跑步鞋男鞋运动鞋V21934', 0, 0, 0, 5, 1333170307, 1333094400, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";s:0:"";s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g52";a:11:{s:8:"share_id";s:2:"82";s:2:"id";s:2:"52";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/82/e31e579f3938c14bfa0496ea77192b13gHQ2sO.jpg";s:4:"type";s:1:"g";s:4:"name";s:80:"品牌特卖正品adidas阿迪达斯12新款男子跑步鞋男鞋运动鞋V21934";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14950588697&spm=2014.12513803.0.0";s:5:"price";s:6:"360.00";s:9:"taoke_url";s:185:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ8QZw9NvnJx2cXVwFh%2B92sQWPsrSj8e1lbQFrgJFDIP2VryjyUBXNhcl0y8O%2F6g%2Bp8COB0WwpNgTC81c54YDy%2F8c4D24VoS9Id1KK%2BWQ%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1500";s:10:"img_height";s:4:"1500";}}}}', 0, '', 100, 'bupt'),
(85, 4, '', 0, 0, '韩都衣舍●韩国2012春装新款韩版女装V领七分袖连衣裙HN1030娋', 0, 0, 0, 5, 1333209898, 1333180800, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"春装";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"连衣裙";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:12:"韩都衣舍";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g55";a:11:{s:8:"share_id";s:2:"85";s:2:"id";s:2:"55";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/85/d8b03fa76d956eb529e6e84da327173a1qqq76.jpg";s:4:"type";s:1:"g";s:4:"name";s:80:"韩都衣舍●韩国2012春装新款韩版女装V领七分袖连衣裙HN1030娋";s:3:"url";s:67:"http://item.taobao.com/item.htm?id=9671227545&spm=2014.12513803.0.0";s:5:"price";s:6:"128.00";s:9:"taoke_url";s:173:"http://s.click.taobao.com/t_8?e=7HZ6jHSTZP8FIXPSFlNy25%2FtR%2F55uKJ1dBzUoHcod6mJsdyvPK7b2IyTIytQ%2F1QiJVtyfuKG54k1BUO1G2Cl3AIgkdUT2hsgfkfDlpy9r29UtGpH&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(84, 4, '', 0, 0, '【一淘专享立减】韩都衣舍韩夏新女装V领条纹短袖大码T恤9A35喆莨', 0, 0, 0, 6, 1333209828, 1333180800, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"韩都衣";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"女装";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g54";a:11:{s:8:"share_id";s:2:"84";s:2:"id";s:2:"54";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/84/f73acb9d1a8b943bb47b26d7f69ea4d8fvVH22.jpg";s:4:"type";s:1:"g";s:4:"name";s:87:"【一淘专享立减】韩都衣舍韩夏新女装V领条纹短袖大码T恤9A35喆莨";s:3:"url";s:67:"http://item.taobao.com/item.htm?id=6115422767&spm=2014.12513803.0.0";s:5:"price";s:6:"139.00";s:9:"taoke_url";s:171:"http://s.click.taobao.com/t_8?e=7HZ6jHSTa0eYRz2Kf%2FD2veJQfKlgYOWGZqokaos4tpKLt3Pn8hkb3wCppfAr89%2FMNGxeqzsQ9VtkM04BxEHt0VugEw0ArCklpaTsJ23Jn7emQlxj&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(86, 4, '', 0, 0, '淘淘小屋 ——春暖待花 开韩版双层镂空无袖蕾丝T恤', 0, 0, 0, 5, 1333303278, 1333267200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:12:"淘淘小屋";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"韩版";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:15:"春暖待花开";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g56";a:11:{s:8:"share_id";s:2:"86";s:2:"id";s:2:"56";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/86/69119e311a0cb3c200f64f2565cb3dc24mcm4Y.jpg";s:4:"type";s:1:"g";s:4:"name";s:38:"A313韩版双层镂空无袖蕾丝T恤";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=16552088159&spm=2014.12513803.0.0";s:5:"price";s:5:"89.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"310";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt'),
(87, 1, '', 0, 0, '春秋季韩国女款 巴黎纱长款丝巾圆点水玉点围巾 360度的完美q180', 0, 0, 0, 4, 1333565531, 1333526400, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"丝巾";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"围巾";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"韩国";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g57";a:11:{s:8:"share_id";s:2:"87";s:2:"id";s:2:"57";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/87/1cb935b4ccc6be608645fa6c4daead82eEe1Jd.jpg";s:4:"type";s:1:"g";s:4:"name";s:84:"春秋季韩国女款 巴黎纱长款丝巾圆点水玉点围巾 360度的完美q180";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14945099091&spm=2014.12513803.0.0";s:5:"price";s:5:"49.00";s:9:"taoke_url";s:177:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ8QNiGwFBqRdLFelKFrnEE7JcxbTJyeY%2BAQg%2FajGPEj7RSEauyUIJeF5lyPX0PoYoOEe63GcOChYwJOdtR%2BwSPRdxVpXcYl8be4A%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(88, 1, '', 0, 0, '兰诗雨 围巾丝巾2012新款日韩国春夏秋真丝超长女士披肩LSY420062', 0, 0, 0, 3, 1333565761, 1333526400, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:6:"丝巾";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"韩国";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g58";a:11:{s:8:"share_id";s:2:"88";s:2:"id";s:2:"58";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/88/617addaf10c5a1d686c7bedf102742felQLeBe.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"兰诗雨 围巾丝巾2012新款日韩国春夏秋真丝超长女士披肩LSY420062";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14084441430&spm=2014.12513803.0.0";s:5:"price";s:6:"119.00";s:9:"taoke_url";s:179:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ1Hgc%2BMkDirwUT%2BzWOw3Qi83SnpKLVQoensCs80zxfoC0Eu4VqgzL7MbVOGBZ482AC2JifNCP81r7NoiYxFO78a6uW2nZO57NZ7ToOsw%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(89, 1, '', 0, 0, '2012夏季新款 蝴蝶结豹纹印花超长真丝大丝巾女 正品桑蚕丝603008', 0, 0, 0, 1, 1333609638, 1333526400, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:6:{i:0;a:2:{s:8:"tag_name";s:6:"超长";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"印花";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"夏季";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"真丝";s:8:"is_admin";s:1:"0";}i:4;a:2:{s:8:"tag_name";s:9:"蝴蝶结";s:8:"is_admin";s:1:"0";}i:5;a:2:{s:8:"tag_name";s:9:"桑蚕丝";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g59";a:11:{s:8:"share_id";s:2:"89";s:2:"id";s:2:"59";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/89/85ff8261d54c620f6bd438f661e29cd9V0QMqT.jpg";s:4:"type";s:1:"g";s:4:"name";s:84:"2012夏季新款 蝴蝶结豹纹印花超长真丝大丝巾女 正品桑蚕丝603008";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14188173931&spm=2014.12513803.0.0";s:5:"price";s:6:"118.00";s:9:"taoke_url";s:173:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0GwAwrWpxaPU30GaQETrYHiTrKsj4Syjn80QAC0SLIl93vBTXGDLLYrLrajG%2BQxp%2Fb3BKxvfyqFROsiwOOJrNmc4jU2XdWlRj%2FBcW&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(90, 1, '', 0, 0, '茗琳正品采用施华洛世奇元素天使泪 水晶项链 女 短款 锁骨 韩国', 0, 0, 0, 2, 1333641219, 1333612800, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:6:"水晶";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"锁骨";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"韩国";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"短款";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g60";a:11:{s:8:"share_id";s:2:"90";s:2:"id";s:2:"60";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/90/2de94b4681d094a11b3fd074faf94238Ju8388.jpg";s:4:"type";s:1:"g";s:4:"name";s:86:"茗琳正品采用施华洛世奇元素天使泪 水晶项链 女 短款 锁骨 韩国";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=12506056193&spm=2014.12513803.0.0";s:5:"price";s:6:"151.20";s:9:"taoke_url";s:183:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKm1Xw3iR%2BBizSpbTYw%2B4HUJFarj3z%2FUF63JCrZC7BuaJe3st%2BJNMen3eQJQJExY3GLf7ZnwZzR1NIjKsqjxeaL8OjK1PwsVKneT9mZYg%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"500";s:10:"img_height";s:3:"500";}}}}', 0, '', 100, 'bupt'),
(109, 4, '', 0, 0, '夏季雪纺连衣裙，小清新！', 0, 0, 0, 0, 1333835834, 1333785600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"连衣裙";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"夏季";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g78";a:11:{s:8:"share_id";s:3:"109";s:2:"id";s:2:"78";s:3:"img";s:84:"./bupt/public/upload/share/000/000/001/09/f5d2d3354a003e001ad7b4189d8f83415CGZ2z.jpg";s:4:"type";s:1:"g";s:4:"name";s:77:"欧美粉色翻领背心 小衫 夏季雪纺连衣裙 背心裙 裙子 新款";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=15665136817&spm=2014.12513803.0.0";s:5:"price";s:5:"45.00";s:9:"taoke_url";s:177:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWYK8%2F3IMXPvaidO7cPnhMFxivWuTt5WvCiCrYRwS3IPmowu0Z479FxH2URD3hd7OpGRP7jzVNyj7%2F%2Br1OpwxGHUxHtjjtLOPV%2BEu%2Bu&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"500";s:10:"img_height";s:3:"750";}}}}', 0, '', 100, 'bupt'),
(92, 4, '', 0, 0, '[满千包邮]英伦老上海风格 灯具 客厅卧室 实木 可调光落地灯018', 0, 0, 0, 1, 1333642327, 1333612800, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"落地灯";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"实木";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g62";a:11:{s:8:"share_id";s:2:"92";s:2:"id";s:2:"62";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/92/18b6aed82ad12b6e04c204f5fd4786b160HhY0.jpg";s:4:"type";s:1:"g";s:4:"name";s:84:"[满千包邮]英伦老上海风格 灯具 客厅卧室 实木 可调光落地灯018";s:3:"url";s:67:"http://item.taobao.com/item.htm?id=1005771360&spm=2014.12513803.0.0";s:5:"price";s:6:"260.00";s:9:"taoke_url";s:183:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA%2BrdzoMVCS1%2FwQ2EjOG%2FCR%2Fdw6GuOmoCny5%2BY1cqYT86hgS60142BYuGvDnm4aWmPpaPNJqe4XxK2ONu%2F9NwjxJDn2lOpa9VWA%2BzA%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"310";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt'),
(93, 4, '', 0, 0, '艾唯莎2012新款正品时尚百搭女士太阳镜太阳眼镜超大框墨镜明星款', 0, 0, 0, 2, 1333751844, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:12:"太阳眼镜";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"女士";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:9:"艾唯莎";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g63";a:11:{s:8:"share_id";s:2:"93";s:2:"id";s:2:"63";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/93/d02b2f16a9a84edd9f72ce80600de73802R20U.jpg";s:4:"type";s:1:"g";s:4:"name";s:88:"艾唯莎2012新款正品时尚百搭女士太阳镜太阳眼镜超大框墨镜明星款";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=13665226641&spm=2014.12513803.0.0";s:5:"price";s:6:"168.00";s:9:"taoke_url";s:185:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOQuTQ%2BsT3PnR9or3VOpLijGHweL%2FIbQGNpvTCuGnbxJshphCFAIvA45MSjoFjr0vTSLa%2F%2BIlx1QuTpidHswWV%2BVDquxwp8b1h96EQ0Tg%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"304";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt'),
(94, 4, '', 0, 0, '淘金币 帕莎太阳镜 正品女12新款T6859明星款 墨镜 时尚太阳镜', 0, 0, 0, 2, 1333751946, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"太阳镜";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"时尚";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g64";a:11:{s:8:"share_id";s:2:"94";s:2:"id";s:2:"64";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/94/bb6369988a02573d8840006b78742fe7049z44.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"淘金币 帕莎太阳镜 正品女12新款T6859明星款 墨镜 时尚太阳镜...";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14343375989&spm=2014.12513803.0.0";s:5:"price";s:6:"225.80";s:9:"taoke_url";s:189:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ2SXbIxEwGaORVgbKwTXGFy0t%2FnYc92fQjRJ%2Bu9cpMljJAmLMtg9zFeec4ExNCcsB%2FH3%2FdXoCMqe8Rl%2FntlQv%2F4I5h8Q7%2BDYD8WEiuxw%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"700";s:10:"img_height";s:3:"700";}}}}', 0, '', 100, 'bupt'),
(95, 4, '', 0, 0, '明星同款板材偏光百搭时尚超大框 太阳眼镜 墨镜 蛤蟆镜 太阳镜女', 0, 0, 0, 2, 1333752257, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:9:"蛤蟆镜";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"偏光";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:9:"太阳镜";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"明星";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g65";a:11:{s:8:"share_id";s:2:"95";s:2:"id";s:2:"65";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/95/ee24e00d757dc39ff16c4a95e250063eCA8Zqg.jpg";s:4:"type";s:1:"g";s:4:"name";s:88:"明星同款板材偏光百搭时尚超大框 太阳眼镜 墨镜 蛤蟆镜 太阳镜女";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=13874025846&spm=2014.12513803.0.0";s:5:"price";s:6:"108.00";s:9:"taoke_url";s:177:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOePU4hOco4mXSc0ccBBECXo%2FAbtAijSrZwY1x8QUzXRhQK600567I3g9E8rPGskoIA7Zw0hpXZEzOIeSKPU52U5f1x1rrNqijwxYfQMg%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"405";s:10:"img_height";s:3:"405";}}}}', 0, '', 100, 'bupt'),
(96, 4, '', 0, 0, '2012男女士黑超墨镜欧美时尚复古蛤蟆镜明星款潮人眼镜正品太阳镜', 0, 0, 0, 2, 1333752323, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:6:{i:0;a:2:{s:8:"tag_name";s:9:"蛤蟆镜";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"太阳镜";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"女士";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"欧美";s:8:"is_admin";s:1:"0";}i:4;a:2:{s:8:"tag_name";s:6:"明星";s:8:"is_admin";s:1:"0";}i:5;a:2:{s:8:"tag_name";s:6:"时尚";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g66";a:11:{s:8:"share_id";s:2:"96";s:2:"id";s:2:"66";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/96/b0889c59530cd8f541174b6465cbea87Ov432j.jpg";s:4:"type";s:1:"g";s:4:"name";s:88:"2012男女士黑超墨镜欧美时尚复古蛤蟆镜明星款潮人眼镜正品太阳镜";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=16523120315&spm=2014.12513803.0.0";s:5:"price";s:5:"38.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"310";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt'),
(97, 4, '', 0, 0, '达思龙正品太阳镜 女士时尚复古墨镜 太阳眼镜 蛤蟆镜 新品限售', 0, 0, 0, 2, 1333752475, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:12:"太阳眼镜";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"女士";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"时尚";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g67";a:11:{s:8:"share_id";s:2:"97";s:2:"id";s:2:"67";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/97/edcc3d04865bc5c461d9610c2ae7d506xwfeA3.jpg";s:4:"type";s:1:"g";s:4:"name";s:85:"达思龙正品太阳镜 女士时尚复古墨镜 太阳眼镜 蛤蟆镜 新品限售";s:3:"url";s:67:"http://item.taobao.com/item.htm?id=9214953589&spm=2014.12513803.0.0";s:5:"price";s:5:"89.00";s:9:"taoke_url";s:173:"http://s.click.taobao.com/t_8?e=7HZ6jHSTZPu2O7EY9c3lqc8yL52tWCsEOlfsN5YoJvtxRWX%2BbkNySxgz%2F84eC0EKhzY2KoY4jOQC0IwV6tUQJJfAhqH%2FPWVRBlXVXtvLag4EjEWx&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"750";s:10:"img_height";s:3:"750";}}}}', 0, '', 100, 'bupt'),
(98, 4, '', 0, 0, '2012新款时尚方框太阳镜 女士 经典百搭大框太阳眼镜 墨镜 偏光镜', 0, 0, 0, 2, 1333752732, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:9:"偏光镜";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:12:"太阳眼镜";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"女士";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"时尚";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g68";a:11:{s:8:"share_id";s:2:"98";s:2:"id";s:2:"68";s:3:"img";s:84:"./bupt/public/upload/share/000/000/000/98/89d7412ced5f7d33c04065030fa2216bYxmoTT.jpg";s:4:"type";s:1:"g";s:4:"name";s:86:"2012新款时尚方框太阳镜 女士 经典百搭大框太阳眼镜 墨镜 偏光镜";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14344624200&spm=2014.12513803.0.0";s:5:"price";s:6:"218.00";s:9:"taoke_url";s:183:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ2SXFDfO9fNUsJzpXjozN5c8dMt4qAjNevSkoUoc5PxYy9vaG%2BEFmNxRRsBry54FXicnTKmU%2FPh%2FUCV5HUVrPi2zNx3%2FXv3L1MJXyu3Q%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"310";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt'),
(100, 4, '', 0, 0, '很有气质的一款，几何图案加上母贝石交错。尤其搭配一些纯色系的衣服 很有味道哦。', 0, 0, 0, 3, 1333777926, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"项链";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"气质";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:4:"mika";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g69";a:11:{s:8:"share_id";s:3:"100";s:2:"id";s:2:"69";s:3:"img";s:84:"./bupt/public/upload/share/000/000/001/00/bcb0047b5531140053f7de78b7f6305eXHw2k9.jpg";s:4:"type";s:1:"g";s:4:"name";s:55:"mr.mika米米家 特 气质几何母贝项链 不包邮";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=16242944591&spm=2014.12513803.0.0";s:5:"price";s:5:"29.00";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"500";s:10:"img_height";s:3:"750";}}}}', 0, '', 100, 'bupt'),
(101, 1, '', 0, 0, '2012新款 qlady特价包邮饰品时尚女款配饰镂空心形粉/紫水晶手链', 0, 0, 0, 3, 1333781529, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:9:"紫水晶";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"手链";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"配饰";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g70";a:11:{s:8:"share_id";s:3:"101";s:2:"id";s:2:"70";s:3:"img";s:84:"./bupt/public/upload/share/000/000/001/01/83a8f7a4eae6d46b9531cc24f8aa4d9b66E02B.jpg";s:4:"type";s:1:"g";s:4:"name";s:83:"2012新款 qlady特价包邮饰品时尚女款配饰镂空心形粉/紫水晶手链";s:3:"url";s:67:"http://item.taobao.com/item.htm?id=8439299228&spm=2014.12513803.0.0";s:5:"price";s:5:"68.00";s:9:"taoke_url";s:173:"http://s.click.taobao.com/t_8?e=7HZ6jHSTZTvcR5AZOBqJ4AuSr6CjI6rn1MjaLdk34BgEco4drNH2dqGEWDrhlvHIpZmRb%2BMvNatIyIpJHYsm1j%2FDFw6o6THUI6LP8tDjtihyig%2Ff&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"400";s:10:"img_height";s:3:"400";}}}}', 0, '', 100, 'bupt'),
(102, 1, '', 0, 0, '亮粉超高跟，闪光性感的诱惑和距离，不容忽视的华丽，不易攀登的艺术感超高跟。精致花朵缀饰，每一处细节都是完美雕琢', 0, 0, 0, 5, 1333781660, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"华丽";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"奢华";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:4:"Tata";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g71";a:11:{s:8:"share_id";s:3:"102";s:2:"id";s:2:"71";s:3:"img";s:84:"./bupt/public/upload/share/000/000/001/02/ad9eafc9e63aea9f4282bff2c312b78e3gzI3f.jpg";s:4:"type";s:1:"g";s:4:"name";s:77:"Tata/他她 2012春季 奢华明星华丽款 亮片布 高跟女单鞋 2GJ53D";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14228143245&spm=2014.12513803.0.0";s:5:"price";s:6:"468.00";s:9:"taoke_url";s:185:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ3iw0i3QJXfwNRRE8juUsOrgxkDzJ9d%2F%2FhVG9dtgKU%2FqzelZaiTdIXUNxpgsR1UYV6nv%2FqG3WVp8lDVXwTg0fIMooGhrIfEskH%2Fmmhpg%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"800";s:10:"img_height";s:3:"800";}}}}', 0, '', 100, 'bupt'),
(103, 1, '', 0, 0, '四叶草玫瑰金项链，让四叶草带给你好运吧', 0, 0, 0, 4, 1333781850, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:9:"幸运草";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"项链";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g72";a:11:{s:8:"share_id";s:3:"103";s:2:"id";s:2:"72";s:3:"img";s:84:"./bupt/public/upload/share/000/000/001/03/43a2cf718c60d46f00446fbab10c61d1lcCKS2.jpg";s:4:"type";s:1:"g";s:4:"name";s:89:"最高品质梵克雅宝 经典幸运草项链 质感天然贝壳四叶草玫瑰金项链";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=14258786191&spm=2014.12513803.0.0";s:5:"price";s:5:"75.00";s:9:"taoke_url";s:181:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ3jOntz%2B5Q4wissnPIOANZupWyNzQz%2BZ41muAFHnr8kfd9GhWLvNERiQQ1w23OxK%2BlMV7Ef9vKe1Vg5bYoCyYVxnceO8m6P5NDZ2Y7Uw%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"460";s:10:"img_height";s:3:"650";}}}}', 0, '', 100, 'bupt'),
(104, 1, '', 0, 0, '体贴的呵护配方，富含丰富水分充分滋润双唇。让你的唇喜感丰盈，不经意间的撅嘴也会散发无限魅力。', 0, 0, 0, 7, 1333781993, 1333699200, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:2:{i:0;a:2:{s:8:"tag_name";s:6:"口红";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"唇膏";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g73";a:11:{s:8:"share_id";s:3:"104";s:2:"id";s:2:"73";s:3:"img";s:84:"./bupt/public/upload/share/000/000/001/04/74d84be4fca305990489b1bce4629f1d9dGD8G.jpg";s:4:"type";s:1:"g";s:4:"name";s:65:"2012春夏彩妆 纯洁之光 素野水润口红3.8G珊瑚/裸色";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=13886146635&spm=2014.12513803.0.0";s:5:"price";s:5:"68.00";s:9:"taoke_url";s:177:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOeMv0411KoY6HYkA3itO3UES%2FbRP0CExLem1lrTExTZpF7UKvqSrjKXKnQwQy8FFQRB8ABN7SUzXY47wdDArxzxbZYtUFb7WfFdZb99g%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1200";s:10:"img_height";s:4:"1200";}}}}', 0, '', 100, 'bupt');
INSERT INTO `fanwe_share` (`share_id`, `uid`, `user_name`, `parent_id`, `rec_id`, `content`, `collect_count`, `comment_count`, `relay_count`, `click_count`, `create_time`, `day_time`, `title`, `type`, `share_data`, `base_id`, `is_best`, `is_rec_best`, `collect_share`, `status`, `is_index`, `cache_data`, `rec_uid`, `index_img`, `sort`, `server_code`) VALUES
(108, 4, '', 0, 0, '棉布餐垫吸水性强、便于清洗，保护和装饰餐桌再好不过一块耐人寻味的餐垫，和精致的餐具搭配使用，本身就是一种生活品质的表现吧', 0, 0, 0, 2, 1333833055, 1333785600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:4:{i:0;a:2:{s:8:"tag_name";s:6:"碎花";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:12:"精致生活";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"桌垫";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"餐垫";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g77";a:11:{s:8:"share_id";s:3:"108";s:2:"id";s:2:"77";s:3:"img";s:84:"./bupt/public/upload/share/000/000/001/08/350512550a45edb4ca86447a268eec88aeEmAl.jpg";s:4:"type";s:1:"g";s:4:"name";s:65:"纯棉和风。蓝色樱花 碎花棉布餐垫桌垫 精致生活";s:3:"url";s:67:"http://item.taobao.com/item.htm?id=9440697534&spm=2014.12513803.0.0";s:5:"price";s:5:"18.50";s:9:"taoke_url";s:0:"";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"571";s:10:"img_height";s:3:"426";}}}}', 0, '', 100, 'bupt'),
(106, 4, '', 0, 0, '颜色和想象中的一样好， 抱着也很舒服，非常可爱的样子，虽然是送给朋友的礼物，我发现深深地爱上这宝贝了，还给我了个小礼物，哈哈，谢谢啦，这两天我会在光顾你们店的哦， 唯一有点不好，有的线头没处理好，不过没有什么影响。', 0, 0, 0, 1, 1333831842, 1333785600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:6:{i:0;a:2:{s:8:"tag_name";s:6:"卡拉";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:9:"布娃娃";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:9:"大鼻子";s:8:"is_admin";s:1:"0";}i:3;a:2:{s:8:"tag_name";s:6:"娃娃";s:8:"is_admin";s:1:"0";}i:4;a:2:{s:8:"tag_name";s:12:"毛绒玩具";s:8:"is_admin";s:1:"0";}i:5;a:2:{s:8:"tag_name";s:6:"泰迪";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g75";a:11:{s:8:"share_id";s:3:"106";s:2:"id";s:2:"75";s:3:"img";s:84:"./bupt/public/upload/share/000/000/001/06/4259861c1c425f099f7d24db911f7c954yz22P.jpg";s:4:"type";s:1:"g";s:4:"name";s:86:"卡拉梦 大鼻子熊布娃娃 泰迪熊公仔 毛绒玩具 娃娃 生日礼物女生";s:3:"url";s:67:"http://item.taobao.com/item.htm?id=9405963384&spm=2014.12513803.0.0";s:5:"price";s:5:"88.00";s:9:"taoke_url";s:179:"http://s.click.taobao.com/t_8?e=7HZ6jHSTZP2dfY6c%2FiXew4%2FyAE5Ew0l%2FWCi4GvMWlNebaEKOH2oIAvIoetE6Lkk60fnHu%2Fo0zB%2FvwJoEt6fEjpqWGZ2LOK86ogqLM%2BF5GHZQTJYA&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:4:"1000";s:10:"img_height";s:4:"1000";}}}}', 0, '', 100, 'bupt'),
(107, 4, '', 0, 0, '双人熊哥靠枕，有2个尺寸可以选择，满足您的不同需要，也不用担心弄脏了怎么办，枕套后的拉链是可以拆洗的哦~~', 0, 0, 0, 2, 1333831949, 1333785600, '', 'default', 'goods', 0, 0, 0, '', 1, 1, 'a:4:{s:4:"tags";a:1:{s:4:"user";a:3:{i:0;a:2:{s:8:"tag_name";s:6:"抱枕";s:8:"is_admin";s:1:"0";}i:1;a:2:{s:8:"tag_name";s:6:"双人";s:8:"is_admin";s:1:"0";}i:2;a:2:{s:8:"tag_name";s:6:"枕头";s:8:"is_admin";s:1:"0";}}}s:8:"collects";a:0:{}s:8:"comments";a:0:{}s:4:"imgs";a:1:{s:3:"all";a:1:{s:3:"g76";a:11:{s:8:"share_id";s:3:"107";s:2:"id";s:2:"76";s:3:"img";s:84:"./bupt/public/upload/share/000/000/001/07/685b47d4e7769ececac14473a73b4387uY5uYi.jpg";s:4:"type";s:1:"g";s:4:"name";s:89:"松松可爱卡通枕头 双人单人枕头情侣抱枕 生日礼物女生江浙沪包邮";s:3:"url";s:68:"http://item.taobao.com/item.htm?id=13423879918&spm=2014.12513803.0.0";s:5:"price";s:5:"54.00";s:9:"taoke_url";s:177:"http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOSJln51eiRfxI25xIEL6QwjKjJFVsYJ7eqSmt%2FZR32G5Yl08lwsYDWYwt9CboLJm919d1ZVCwz3NbYaIb2bUVMSH4jUHoErPyhSRypxA%3D%3D&p=mm_18381334_0_0&n=19";s:11:"server_code";s:4:"bupt";s:9:"img_width";s:3:"310";s:10:"img_height";s:3:"310";}}}}', 0, '', 100, 'bupt');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sharegoods_module`
--

CREATE TABLE IF NOT EXISTS `fanwe_sharegoods_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT '',
  `content` text,
  `api_data` text,
  `sort` smallint(5) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_sharegoods_module`
--

INSERT INTO `fanwe_sharegoods_module` (`id`, `class`, `domain`, `status`, `name`, `url`, `icon`, `logo`, `content`, `api_data`, `sort`) VALUES
(1, 'taobao', 'http://item.taobao.com,http://detail.tmall.com', 1, '淘宝', 'http://www.taobao.com', './public/upload/business/taobao.gif', '', '淘宝应用用于获取淘宝商品、店铺信息，可到 http://open.taobao.com/ 点击 申请成为合作伙伴 ', 'a:3:{s:7:"app_key";s:8:"12513803";s:10:"app_secret";s:32:"dea8fda425660b9311af46cd3bd16fc6";s:6:"tk_pid";s:8:"18381334";}', 100),
(2, 'paipai', 'http://auction1.paipai.com', 1, '拍拍', 'http://www.paipai.com', './public/upload/business/paipai.gif', '', '拍拍应用用于获取拍拍商品、店铺信息，可到 http://pop.paipai.com/ 点击 申请成为合作伙伴 ', 'a:4:{s:3:"uin";s:9:"398024808";s:4:"spid";s:32:"29230000ea035854654ff7dc3bdfa683";s:5:"token";s:32:"6860b9170f275854654fbdb4b5de454b";s:6:"seckey";s:32:"la3tnprx9kar122ppsovvdap197j8bkz";}', 100),
(3, 'dangdang', 'http://product.dangdang.com', 1, '当当', 'http://www.dangdang.com/', './public/upload/business/dangdang.png', '', '使用正则式获取商品信息，如果因当当页面结构调整无法获取，请先禁用此商品采集模块，提交问题给我们进行处理，也可自行修改core\\class\\sharegoods\\dangdang_sharegoods.class.php文件中的正则规则', 'a:1:{s:4:"from";s:8:"P-291469";}', 100),
(4, 'vancl', 'http://item.vancl.com,http://www.vjia.com', 1, '凡客', 'http://www.vancl.com/', './public/upload/business/vancl.png', '', '使用正则式获取商品信息，如果因凡客页面结构调整无法获取，请先禁用此商品采集模块，提交问题给我们进行处理，也可自行修改core\\class\\sharegoods\\vancl_sharegoods.class.php文件中的正则规则', 'a:1:{s:6:"Source";s:9:"m23linzhe";}', 100),
(5, 'jdbuy', 'http://www.360buy.com', 1, '京东', 'http://www.360buy.com/', './public/upload/business/360buy.png', '', '使用正则式获取商品信息，如果因京东页面结构调整无法获取，请先禁用此商品采集模块，提交问题给我们进行处理，也可自行修改core\\class\\sharegoods\\jdbuy_sharegoods.class.php文件中的正则规则，现只支持 http://www.360buy.com/product/***.html格式的商品', 'a:1:{s:7:"unionId";s:5:"14475";}', 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_share_category`
--

CREATE TABLE IF NOT EXISTS `fanwe_share_category` (
  `share_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  KEY `share_id` (`share_id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_share_category`
--

INSERT INTO `fanwe_share_category` (`share_id`, `cate_id`) VALUES
(11, 4),
(2, 5),
(3, 6),
(4, 2),
(5, 7),
(6, 8),
(7, 5),
(8, 8),
(9, 8),
(10, 8),
(12, 30),
(14, 2),
(15, 5),
(16, 32),
(109, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(31, 2),
(32, 2),
(33, 16),
(34, 4),
(35, 2),
(51, 2),
(48, 3),
(49, 3),
(50, 2),
(53, 7),
(55, 7),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 2),
(72, 4),
(73, 4),
(74, 2),
(75, 2),
(76, 4),
(77, 4),
(78, 2),
(80, 4),
(81, 4),
(82, 4),
(85, 2),
(84, 2),
(86, 2),
(87, 6),
(88, 6),
(89, 6),
(90, 29),
(108, 30),
(92, 8),
(93, 6),
(94, 6),
(95, 6),
(96, 6),
(97, 6),
(98, 6),
(100, 6),
(101, 6),
(102, 24),
(103, 29),
(104, 7),
(102, 4),
(106, 36),
(107, 8);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_share_comment`
--

CREATE TABLE IF NOT EXISTS `fanwe_share_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `content` text,
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `share_id` (`share_id`),
  KEY `uid` (`uid`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_share_comment`
--

INSERT INTO `fanwe_share_comment` (`comment_id`, `share_id`, `uid`, `parent_id`, `content`, `create_time`) VALUES
(1, 32, 3, 0, '[奶瓶]', 1332818562),
(2, 57, 3, 0, '这个在哪里可以买到呢？', 1332820871);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_share_goods`
--

CREATE TABLE IF NOT EXISTS `fanwe_share_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `share_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `img` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `price` decimal(10,2) DEFAULT '0.00',
  `cate_id` int(11) NOT NULL DEFAULT '0',
  `taoke_url` varchar(255) DEFAULT '',
  `sort` smallint(5) DEFAULT '10',
  `goods_key` varchar(60) NOT NULL,
  `base_id` int(11) NOT NULL DEFAULT '0',
  `base_share` int(11) NOT NULL DEFAULT '0',
  `img_width` smallint(5) DEFAULT '0',
  `img_height` smallint(5) DEFAULT '0',
  `server_code` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`goods_id`),
  KEY `uid` (`uid`),
  KEY `share_id` (`share_id`),
  KEY `shop_id` (`shop_id`),
  KEY `uid_2` (`uid`,`goods_key`),
  KEY `base_id` (`base_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- 转存表中的数据 `fanwe_share_goods`
--

INSERT INTO `fanwe_share_goods` (`goods_id`, `uid`, `share_id`, `shop_id`, `img`, `name`, `url`, `price`, `cate_id`, `taoke_url`, `sort`, `goods_key`, `base_id`, `base_share`, `img_width`, `img_height`, `server_code`) VALUES
(12, 2, 11, 8, './bupt/public/upload/share/000/000/000/11/7db9f253237c21d4cf8b16985c71f9bb5l5p9R.jpg', '七一二男鞋 日常休闲时尚潮流磨砂皮鞋 真皮商务单鞋板鞋清仓I006', 'http://item.taobao.com/item.htm?id=13498517344', '196.00', 0, '', 1, 'taobao_13498517344', 0, 0, 310, 310, 'bupt'),
(13, 1, 15, 9, './bupt/public/upload/share/000/000/000/15/109f6990a21f9edff3a67a9971f26c79CdMddd.jpg', '专柜正品2012新款包包女包欧美复古单肩手提包配真皮女士包潮包邮', 'http://item.taobao.com/item.htm?id=14279783488', '378.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ3jqLMScKhEOovq3ZKd78SMKjAC3PwdRqG04I9uQ93%2BfNsLJaiASDazROPLWpWxYGkg3b56L2Xz%2BgaE1vRtNg%2BCFZPNbY70OmRm%2FVJIw%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14279783488', 0, 0, 800, 800, 'bupt'),
(3, 1, 2, 3, './bupt/public/upload/share/000/000/000/02/7fcc038864231bf33846b19802b411cfGqZi5D.jpg', '2012春季新款时尚韩版李孝利手提单肩包斜挎包女包包多功能', 'http://auction1.paipai.com/234C8B630000000000233A5E071431C1', '59.00', 0, '', 1, 'paipai_234C8B630000000000233A5E071431C1', 0, 0, 300, 300, 'bupt'),
(4, 1, 3, 4, './bupt/public/upload/share/000/000/000/03/b98575d4bfc1257c386e15c33a6c40d3l2mkhO.jpg', 'ZIPPO限量正版打火机发售 原装日版正品 2012经典款清明上河图', 'http://item.taobao.com/item.htm?id=13556489023', '468.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOTk%2BUIe2TbWfZN6RMf1yoDwfRrWr7DuSoo6OBtsCD2LSYLt0nnJXkuix7q8AUBIcQpIFHMLbqpC6b1jPjt1kk0BxeFQ8qccJ%2F5%2FmfiVQ%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_13556489023', 0, 0, 300, 300, 'bupt'),
(5, 1, 4, 5, './bupt/public/upload/share/000/000/000/04/a4945d1148f954774590bb133104e195B77VJW.jpg', '【品牌特卖】马克华菲正品男装拼接印花连帽夹克外套7113010702', 'http://item.taobao.com/item.htm?id=13348564379', '248.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOVuM2bhjHMeowlMlBQyeDniTLDZeP1GEAJPlsnJquiFjE9FSmeYkBxZ93DOaQxk7HqC%2BFBlkiJsv2zSME15UtYjiFEmH2qRNO5ol5f&p=mm_18381334_0_0&n=19', 1, 'taobao_13348564379', 0, 0, 1000, 1000, 'bupt'),
(6, 1, 5, 6, './bupt/public/upload/share/000/000/000/05/9b0078b77cda92a7e5ecbfb159e5dc1aC7dpSW.jpg', '[特]安安家 立体剪裁熊猫化妆包/化妆袋/笔袋 文具袋收纳包 L314', 'http://item.taobao.com/item.htm?id=14122792933', '14.80', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0EVMu%2FntTcDcEPqDPECy%2FWDCEbqni%2Fwe7GeCdsmU4nzGgqx1Zikms1urc6ISP%2BvRYbj9%2F8s5X0%2FBoyyi8pdWBiRLgFUdlGM3i2fjU&p=mm_18381334_0_0&n=19', 1, 'taobao_14122792933', 0, 0, 450, 450, 'bupt'),
(7, 1, 6, 6, './bupt/public/upload/share/000/000/000/06/99634914d609a189076c3c7061557e3bcsXx49.jpg', '[特]安安家 日韩居家 可爱 轻松熊 保温杯水杯办公杯车载杯H209', 'http://item.taobao.com/item.htm?id=14950464798', '29.80', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ8QZw8nAsVYUWYwObf371Lfm%2Fh1Vj2iZdjzPT6pFHb0GKVh20clWpoRMvljQWZlMx2AqqmbJpTHBe69VMFCJ%2BXdQzcdNEzX8%2FItHm5&p=mm_18381334_0_0&n=19', 1, 'taobao_14950464798', 0, 0, 800, 800, 'bupt'),
(8, 1, 7, 6, './bupt/public/upload/share/000/000/000/07/d277ef053f8d17b2e93c49d0066415dfkA80ge.jpg', '韩国 金属小飞机多功能帆布多功能旅行 护照夹 H320', 'http://item.taobao.com/item.htm?id=15888020664', '28.80', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWWx5e5VqPl5107Zf6RwqXfCb5%2BgbkBND1nmZ3w%2BEqPzYIaLa5dg81bZSfZjgWNzeufbDOAwQkWqRTaY1lk4B6L6tR1tOmKoNKFWUYo&p=mm_18381334_0_0&n=19', 1, 'taobao_15888020664', 0, 0, 310, 310, 'bupt'),
(9, 1, 8, 6, './bupt/public/upload/share/000/000/000/08/d2fe4a8daaf3f790c0924efa37a4be9fQVMWpC.jpg', '安安家 可爱卡通兔子迷你小台灯/可充电LED台灯 创意家居 L108', 'http://item.taobao.com/item.htm?id=10658397770', '28.60', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA4%2Firp54gKFnReQ40kcLZH1Hv9CdC%2FK6SEhgROZ1U%2F3dx69xWjeSOC69cF%2Fv6RPY5cVke2I6iqitaYoCNQuhuWZJC18UfaNFED6iN5&p=mm_18381334_0_0&n=19', 1, 'taobao_10658397770', 0, 0, 800, 800, 'bupt'),
(10, 1, 9, 7, './bupt/public/upload/share/000/000/000/09/e792445c6d6a63c206f056d57a148d33m101u2.jpg', '[多米乐]美式风格台灯 学习工作护眼灯饰 长臂折叠灯具 铁艺台灯', 'http://item.taobao.com/item.htm?id=12905396889', '34.50', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKq8kz%2BWBHKCNA1utPL9c0nExQm8jlzoqExyWCpNB6k0ZXDE4T00Il7uH5Wfh3dxxYA6Eh2pRuPX4r%2BrhH5KRj8iR%2FFRNMrK%2BzBUO1bHQ%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_12905396889', 0, 0, 310, 310, 'bupt'),
(11, 1, 10, 6, './bupt/public/upload/share/000/000/000/10/8031224df4a0c3303f96b9d142e54e36GgkLgL.jpg', '安安家 日韩居家 时尚 双层真空不锈钢杯保温杯水杯办公杯 C401', 'http://item.taobao.com/item.htm?id=13438974650', '18.50', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOSJ4cX%2Bqan2G%2F5up0ukkD7sfo8juCvuClj20bQwo%2B5IT%2FwQSJ6A0r0oG887UVfraRED%2Fb%2FJiWfbL04Gg11RscGMWKiIek71m5Dn6dd&p=mm_18381334_0_0&n=19', 1, 'taobao_13438974650', 0, 0, 1200, 1200, 'bupt'),
(14, 1, 16, 10, './bupt/public/upload/share/000/000/000/16/b2cbe4fb3973c80cbc78abe821c93b38QhXGNt.jpg', 'The Face Shop 花语净泽水乳套装混合性 爽肤水+乳液 清爽补水', 'http://item.taobao.com/item.htm?id=14215215312', '95.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ3iNbrxXNPBHuKAMbQVQC0GRjGPb6XSg3hbO3Tpkb1z0iSl%2BnVbAOsNhyIWiZYdAbE49pipWQxYpILCIO833d%2BeQWIPJ88XaDLsC4Fcw%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14215215312', 0, 0, 800, 800, 'bupt'),
(16, 1, 23, 11, './bupt/public/upload/share/000/000/000/23/be90fa557c466ad31a046eae45d654c9d6tKOk.jpg', '杜尚演绎2012新款春装男装夹克纯棉修身精品外套男士休闲上衣', 'http://item.taobao.com/item.htm?id=13769186168&spm=2014.12513803.0.0', '396.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOR%2FphavLuICA73jUhpYSPC4omNZKey3nMaLB1Fb5z3kLR1Z2%2BHzFwPlMmbFSFLEYXcHGdqKl%2FUiJEeL487YotZ4grGz1WvR5soAo%2BbGg%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_13769186168', 0, 0, 500, 500, 'bupt'),
(17, 1, 24, 0, './bupt/public/upload/share/000/000/000/24/bca9262c399fee49f29f491aa8b11d537v6eIN.jpg', '2012春装新款男士精品男装加厚立领夹克男款修身时尚休闲外套潮', 'http://item.taobao.com/item.htm?id=12957345861&spm=2014.12513803.0.0', '258.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKq9wGbiI1RRZrTzBYKQeiBb1JDTJ5DVzkI%2F0Il60XGcT2857dQzzO%2B2DxlmQ5eUQea17dDGltVdyQOMaOG7Egz1zKXsZSXwPWs5Xmkew%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_12957345861', 0, 0, 500, 500, 'bupt'),
(18, 1, 25, 0, './bupt/public/upload/share/000/000/000/25/38809318e2f1e46355ca4a7192bff732Cz6L2b.jpg', '2012春装新款男士韩版修身羊毛呢夹克休闲精品潮男装时尚上衣外套', 'http://item.taobao.com/item.htm?id=12987522521&spm=2014.12513803.0.0', '396.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKq%2BjaS93h6YS%2BTThAs2h0QoK3%2B2NdFy0tyzGQYWA9V9UgykvtghCMP5N8zhZJ8c9%2FMaivkhXUJuxpBcmfvYRHTTrypPUOFbtUKGa4Izg%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_12987522521', 0, 0, 500, 500, 'bupt'),
(19, 1, 26, 12, './bupt/public/upload/share/000/000/000/26/36609553435f81fc53e94d5fa75203c1gzio0h.jpg', '特价限量400件顶慕2011新款女装两件套长袖条纹T+背心连帽马甲', 'http://item.taobao.com/item.htm?id=12904180283&spm=2014.12513803.0.0', '60.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKq8k3wRjhpUisDVzZtIzbh%2FdQE2Rta0gmUk0loQlaUA00FEhBna%2BC2A8Aivu3CuGq3m0e4OFZ7Tf6JTfua0ttb3Y4AAv%2FsuDLKUUc6lw%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_12904180283', 0, 0, 1000, 1000, 'bupt'),
(20, 1, 27, 0, './bupt/public/upload/share/000/000/000/27/4070cf0a2b3bebef30a902ad421ad333QAhQ32.jpg', '顶慕2012新款春装修身荷叶边ol通勤泡泡袖蛋糕裙层层连衣裙女', 'http://item.taobao.com/item.htm?id=14167811081&spm=2014.12513803.0.0', '256.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0Fdm%2F0n3bovEWAeLQH5KVXBocPqGwGZanQNUrKtDU86r1YPOUh0u7aKRydXBiOz9bcGg0yTXJqYCu0dQtkEPR%2B0DgNWawzAt52zlesA%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14167811081', 0, 0, 1000, 1000, 'bupt'),
(21, 1, 28, 0, './bupt/public/upload/share/000/000/000/28/97bad4ce043a5ce6ac37957eb60cc4f7xD4LCv.jpg', '顶慕日系韩版仿呢料中长呢大衣甜美冬装大衣修身带帽外套4折包邮', 'http://item.taobao.com/item.htm?id=14099316957&spm=2014.12513803.0.0', '364.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ1HzY23JBdu0JbPZuSho%2BYtU9%2B8ox0l6YmlxBy%2FgIcHlPfKgrpIJTIFqtiLZLSHoLlncr7jcD217igFpIMpzLl1YTjJjmShZAVwnFOHw%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14099316957', 0, 0, 1000, 1000, 'bupt'),
(22, 1, 48, 13, './bupt/public/upload/share/000/000/000/48/5c3b890aef855cdf078fcb96e1b9245386SGqQ.jpg', '包邮 春装 韩版高腰半身裙  半身短裙 西装裙   黑色短裙 裙子  ', 'http://auction1.paipai.com/79206D070000000000793B600811D795', '55.00', 0, '', 1, 'paipai_79206D070000000000793B600811D795', 0, 0, 310, 310, 'bupt'),
(23, 1, 49, 14, './bupt/public/upload/share/000/000/000/49/090fd2c19de1e2c861294a9d83430904amT1SE.jpg', '1659-2012女装新款韩版热卖时尚蝴蝶结亮片百褶裙 半身裙', 'http://auction1.paipai.com/5C123212000000000401000001164E0F', '39.00', 0, '', 1, 'paipai_5C123212000000000401000001164E0F', 0, 0, 300, 300, 'bupt'),
(24, 1, 50, 15, './bupt/public/upload/share/000/000/000/50/6bf49162a6a7c60bd48a4e20f9ec83088MSELl.jpg', '2012春夏 女装衬衫百搭修身 中袖衬衣 荷叶边雪纺衫 送打底抹胸', 'http://item.taobao.com/item.htm?id=13950406027&spm=2014.12513803.0.0', '126.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOf%2F7oCi5RWQLck2ERJUNQsrluGJl6KZsxqeMhXF%2FyCu%2BfyIFt6C6D%2BCkKlzs2%2FkHqWHz%2FVeaefUWV21yE%2Fa39AWVdcSIQP%2Fzc8NuyzUQ%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_13950406027', 0, 0, 900, 900, 'bupt'),
(25, 1, 51, 0, './bupt/public/upload/share/000/000/000/51/f23f63c1a84d715d68487e713b27969di8r6xZ.jpg', '2012春装新品韩版舒适休闲百搭格子格纹衬衣衬衫女长袖英伦学院风', 'http://item.taobao.com/item.htm?id=13962798940&spm=2014.12513803.0.0', '96.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOf%2FMhGXM%2Fg%2BlxPCEhD6T2ohDbqUdXjL0yeaB87xU6LgDdiXi%2BB19%2BLfN6HrIhaNAUbAOWxGYlaUnRim7NacG9yjz%2BKEDCO2Pb%2F2mLrwQ%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_13962798940', 0, 0, 900, 899, 'bupt'),
(26, 1, 53, 16, './bupt/public/upload/share/000/000/000/53/573dc13449b8fe700836600d56339415L1w3Vt.jpg', '娇韵诗 抚纹身体霜200ml 产后恢复 祛妊娠纹肥胖纹 代购现货正品', 'http://item.taobao.com/item.htm?id=6994390010&spm=2014.12513803.0.0', '255.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTa09dDWz5bplfGvNHVZ8BZnamvpCtWw9k4wPBj%2B1Nj9VaZVXefD1Nc5ZKMffwKlDMWQWsck4hWLBHz1IhNVVTDaquKOm76xdxU9uje7pZ&p=mm_18381334_0_0&n=19', 1, 'taobao_6994390010', 0, 0, 750, 750, 'bupt'),
(28, 1, 55, 17, './bupt/public/upload/share/000/000/000/55/b3117385d9bc0f0b4bb98d36cc5f9e4bHbyN0a.jpg', '【金冠】Clarins娇韵诗HD第五代红魔晶完全纤体精华霜/瘦身 200ml', 'http://item.taobao.com/item.htm?id=2883772582&spm=2014.12513803.0.0', '230.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTb06zPIKdHvAN9vyTFsrUrqo0Xx4NYNLZDyMoiKiI0jO6CFlE4tq%2FocvzqeDKZpP8TeZxpTPMPe%2Fnp%2FXT2ltmBIxlq0hn0u3FdNR1qEk%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_2883772582', 0, 0, 800, 800, 'bupt'),
(29, 3, 59, 18, './bupt/public/upload/share/000/000/000/59/779baa04234eee3c9d3b7dacb39fb014f4mVv9.jpg', 'A2805 芥末花开 2012春装新款韩版宽松中长款长袖圆领雪纺连衣裙', 'http://item.taobao.com/item.htm?id=14173541030&spm=2014.12513803.0.0', '129.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0FFnv4kPaI%2FgaslGOmiSD778BWHDMsAbaZX4OHAZRWDLJIPoSARLAbgA5wANlRMtDBBkzyWmQnewbnMAz4UWKNVfxKchvUyjyRvw8&p=mm_18381334_0_0&n=19', 1, 'taobao_14173541030', 0, 0, 800, 800, 'bupt'),
(30, 3, 60, 0, './bupt/public/upload/share/000/000/000/60/a43bb069c593bebd2ae2b4ff4caa5f4d01vd9V.jpg', 'A2799 芥末花开 2012春装新款复古赫本气质立体裁剪修身连衣裙', 'http://item.taobao.com/item.htm?id=14173325043&spm=2014.12513803.0.0', '98.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0FFnpJv9qe%2Bsenr2RlMgCx9vfeQmNhxGjonhZrFX4qCrF%2F%2BYHKOeVOfa0EDs5lExuMEvmMrqxdzmGJMAooUriKALgfrqEOWGejFgH&p=mm_18381334_0_0&n=19', 1, 'taobao_14173325043', 0, 0, 800, 800, 'bupt'),
(31, 3, 61, 0, './bupt/public/upload/share/000/000/000/61/02413e973c474f6df142d1b1df3a9470a44sN4.jpg', 'A2800 芥末花开 2012春新款复古PU拼接英伦翻领双排扣西服女外套', 'http://item.taobao.com/item.htm?id=14172178481&spm=2014.12513803.0.0', '125.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0FFiwEVAS8Rsc1yugJoWi%2BJ%2BJSLleuqiJWglpBvqjiZljKZv6AF6GOZGckdVzeAXPrupKN2gqfDOUtTBjFODEBSfHchHApFG1u%2Fth&p=mm_18381334_0_0&n=19', 1, 'taobao_14172178481', 0, 0, 800, 800, 'bupt'),
(32, 3, 62, 0, './bupt/public/upload/share/000/000/000/62/5212177c36783ca9fb58d49edc50fba5ATHsaT.jpg', 'A2806 芥末花开 2012春装新款韩版百搭修身针织衫亮线开衫外套女', 'http://item.taobao.com/item.htm?id=16275708548&spm=2014.12513803.0.0', '129.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIbg02246zQ9usezIfWoi%2B7TtrashcJv0kS1qnsxxYZGvDU3HvmJjFKKXfBWEm1kY4E%2B7HB80%2BYQJQ2VT9Yg6fIUQyOq3f5XEaC7q9wA&p=mm_18381334_0_0&n=19', 1, 'taobao_16275708548', 0, 0, 800, 800, 'bupt'),
(33, 3, 63, 0, './bupt/public/upload/share/000/000/000/63/d90aa8ace24e63fde17a368d40cba40dl481Gl.jpg', 'A2804 芥末花开 2012春季新款大小蝴蝶结波点宽松甜美雪纺衫', 'http://item.taobao.com/item.htm?id=14173545054&spm=2014.12513803.0.0', '75.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0FFnv4kenSnQ21c6%2BfoRjgMb%2FAozbrFefhIlvyKDsy6JQPZmOetmf9u3k9YdQKxNzRFlH7wKhLju2AsjuAoQvrzX0VaDTjqFC03Da&p=mm_18381334_0_0&n=19', 1, 'taobao_14173545054', 0, 0, 800, 800, 'bupt'),
(34, 3, 64, 0, './bupt/public/upload/share/000/000/000/64/9d6ebd6981dcc586d32d83e0494c4993owVAuI.jpg', 'A2763 芥末花开 2012春装新款韩版宽松长袖翻领轻盈纯棉百搭衬衫', 'http://item.taobao.com/item.htm?id=14313411425&spm=2014.12513803.0.0', '68.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ2TEGXEjudQIxqydJHPP0s%2Fq%2BmpukDnHU%2Fj0i6OZn6bSRpEwQwU0VzBGC%2B4wBpNLWuqwIHx6XCUvQZMhR7kWEVqOcODv7bEY4Ow7yo&p=mm_18381334_0_0&n=19', 1, 'taobao_14313411425', 0, 0, 800, 800, 'bupt'),
(35, 3, 65, 0, './bupt/public/upload/share/000/000/000/65/875bcb277f438da58405520e7a92c773gxt4WF.jpg', 'A2803 芥末花开 2012春装新款女糖果色舒适修身单排扣西装小外套', 'http://item.taobao.com/item.htm?id=16275500998&spm=2014.12513803.0.0', '139.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIbg02260TjLyu1E3Rh3Q%2B636USQarxWyxzY3Ykig7C81rpeEww0OWygBBXJG3AybI9LeJuhQtbFQWM%2FkWAefyprnFDb%2B4nGrTe%2F3gT0&p=mm_18381334_0_0&n=19', 1, 'taobao_16275500998', 0, 0, 800, 800, 'bupt'),
(36, 1, 66, 19, './bupt/public/upload/share/000/000/000/66/c4b4535284e69d65f1d621b035fb0344Ce6X8D.jpg', '限时限量!春装新品特价包邮仿牛仔弹力显瘦小脚打底裤女有加大码', 'http://item.taobao.com/item.htm?id=16211276071&spm=2014.12513803.0.0', '138.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIbg1T%2Bncv9nF6uJoPk4xaJBL9qGUb27aJv5G%2BeFIKnS9o4noeC5DcJ0UveCljdg0NIm3A3KJqz8jzaNJPDYH%2FZVevNwKI6KsDxINfZ0fQ%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_16211276071', 0, 0, 800, 800, 'bupt'),
(37, 1, 67, 20, './bupt/public/upload/share/000/000/000/67/a8f2a98f0ce1391be820ff4dd891da5b4z4N9O.jpg', '新品 买4送1包邮 天鹅绒 超弹显瘦 踩脚 连裤 丝袜打底裤 女', 'http://item.taobao.com/item.htm?id=14184042709&spm=2014.12513803.0.0', '28.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0Gwzt4RxF4Cy1rxpqP88IDKiNcYpYt0Rp44nQRL27NweuNTV321NpbMXq%2By1yioVGI1FalDUk2HDrsxDyc0TmAq6JOrKEDjNLN6%2BKWA%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14184042709', 0, 0, 800, 800, 'bupt'),
(38, 1, 68, 21, './bupt/public/upload/share/000/000/000/68/52e47666de968e1a0a63193db3ccd69eGWCX8v.jpg', '淘金币 2012春装新款小脚裤打底裤女式韩版显瘦小脚裤铅笔裤', 'http://item.taobao.com/item.htm?id=13747367032&spm=2014.12513803.0.0', '98.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOR%2FJAKKKHl1z7uCp%2BR9bMkguUS14rmu%2FyTYsTa5l%2FbQItvMNcw%2BRmK8UBNsxHlDnm4FuOYppYy8U5yfJ8UJkGsTbObFpvbmdvqSFXb&p=mm_18381334_0_0&n=19', 1, 'taobao_13747367032', 0, 0, 800, 800, 'bupt'),
(39, 1, 69, 22, './bupt/public/upload/share/000/000/000/69/39e12ef506ba2a96474d9b7faf519066y8XA0a.jpg', '特价铅笔裤新款春装 糖果色打底裤 女装韩版 小脚裤子大码长裤', 'http://item.taobao.com/item.htm?id=14144510660&spm=2014.12513803.0.0', '147.50', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0F%2BjBnu2XDrT65muQ70E7KDY9kyPFPfE%2BzVIiEkbm9EPmKLRPdVThXQuiZrPIOCymp0CGeY888d%2FLy8dlB7oORXfb%2B4jcfyS4AYYXOw%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14144510660', 0, 0, 800, 800, 'bupt'),
(40, 1, 70, 23, './bupt/public/upload/share/000/000/000/70/316a328d002cb8c5d0f4178516209f08KYSBGz.jpg', '糖果色彩色打底裤 百搭松紧腰弹性 水洗棉打底裤小脚雪花裤 薄款', 'http://item.taobao.com/item.htm?id=14182362570&spm=2014.12513803.0.0', '59.00', 0, '', 1, 'taobao_14182362570', 0, 0, 750, 750, 'bupt'),
(41, 1, 71, 24, './bupt/public/upload/share/000/000/000/71/118d9e1ffd40d64d087ac433eb899dd91VB6jI.jpg', '2012蜜桃家春夏新品韩国网纱蓬蓬裙假两件打底裤裙裤薄款包邮', 'http://item.taobao.com/item.htm?id=16259076006&spm=2014.12513803.0.0', '78.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIbg0fLIezF7MUcyBYDcp5d%2Folwo%2BHIh6Hz4MMsGfVcV0pC%2ByoD1ugbIA05CgwCgy514TtzM8JzxvhbfmAk%2Bu8vnmrTkeIb%2Bs%2B6I7RDu&p=mm_18381334_0_0&n=19', 1, 'taobao_16259076006', 0, 0, 778, 778, 'bupt'),
(42, 4, 72, 25, './bupt/public/upload/share/000/000/000/72/8c84f3f9799aba0c2710d9155814c7670vj9Vb.jpg', '秒杀价 2012新款韩国热卖百搭甜美脚腕绕带粗跟单鞋OL', 'http://item.taobao.com/item.htm?id=14776951420&spm=2014.12513803.0.0', '47.00', 0, '', 1, 'taobao_14776951420', 0, 0, 405, 404, 'bupt'),
(43, 4, 73, 0, './bupt/public/upload/share/000/000/000/73/d9efece128e7489536a38e1774b97ffdx98jm0.jpg', 'NIKE 耐克 男子经典板鞋 315122 414  40.5', 'http://www.360buy.com/product/1002887832.html', '538.00', 0, 'http://click.union.360buy.com/JdClick/?unionId=14475&t=4&to=http://www.360buy.com/product/1002887832.html', 1, '360buy_1002887832', 0, 0, 800, 800, 'bupt'),
(44, 4, 74, 26, './bupt/public/upload/share/000/000/000/74/2697bd2516fd46dc07ac49b326e7c61bHz9MK1.jpg', 'OZZO欧尼迩2011秋装新品双排扣大翻领中长款外套113004', 'http://item.taobao.com/item.htm?id=12816054034&spm=2014.12513803.0.0', '399.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKrNzLTkF4wriIYSygjMYMinuqgPniMacGbkpvF2OkzS5d231S%2FusJrRjkePfo1zK%2FQ3TVSSIAvWuf3F204cgMlCQ9MXVGS3o0O3gf%2FoQ%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_12816054034', 0, 0, 800, 800, 'bupt'),
(45, 4, 75, 27, './bupt/public/upload/share/000/000/000/75/74ad68cd9aafdc37ba444b0773f8cd41Th8RoO.jpg', '【6折】裂帛毛线帽子绣花盘扣斜襟风衣外套小房15110025#', 'http://item.taobao.com/item.htm?id=13050493578&spm=2014.12513803.0.0', '298.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOW0pPBgCfX7I7ZAPbe1%2BO2PxGZD3wspMzokSHtaPl%2BecdPomUmYTRESuRkpCSkWd17hdIiIhDaUHlIlpZ1Nx6XsmX8MsHRB3Eruw%2Fkqg%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_13050493578', 0, 0, 800, 800, 'bupt'),
(46, 4, 76, 28, './bupt/public/upload/share/000/000/000/76/bb1416453b733b4eb7e9df6e0bfa0660YUcEyC.jpg', 'Mr.ing 新品真皮正品潘多拉3代时尚潮流男式鞋 春夏单鞋F1325^@^', 'http://item.taobao.com/item.htm?id=14775671016&spm=2014.12513803.0.0', '109.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQy7Sy%2Fq0K3Zfo0q3M7scbJLEWG2SrDlQG63rjkzJ2p%2BedY6CKGwYSHwBKeqsFDMnGCFRkYvTptPhHoKfABkzKJl5BoQ0r0V61F8ELavQ%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14775671016', 0, 0, 1200, 1200, 'bupt'),
(47, 4, 77, 29, './bupt/public/upload/share/000/000/000/77/bac6058bcf61a9ab05a3ee4773e1ea3aoAa41Q.jpg', '安步当马日常休闲鞋子单鞋真皮英伦潮流商务男士皮鞋流行男鞋903', 'http://item.taobao.com/item.htm?id=15715476445&spm=2014.12513803.0.0', '240.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWZXoBD6Lv5gxFS6mziIYr%2Fk%2BD9D6yi76Pzk9lKQ8jpAsZjI2AmGcGIyfTHANvIail9EVwxer4PL4%2FfwSie%2BIQkwkoG11ChufRyzwKXLw%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_15715476445', 0, 0, 1500, 1500, 'bupt'),
(48, 4, 78, 30, './bupt/public/upload/share/000/000/000/78/ee7ef9e708c27e68477e8ac217ec8c7cpZOCcp.jpg', '货到付款包邮2012新品春装裙子韩版修身职业连衣裙     ', 'http://auction1.paipai.com/F7E9C63A00000000040100000B8FA8FA', '118.00', 0, '', 1, 'paipai_F7E9C63A00000000040100000B8FA8FA', 0, 0, 1000, 1000, 'bupt'),
(50, 4, 80, 32, './bupt/public/upload/share/000/000/000/80/78b22d9e2330eaddd9e8c537208549e7y99AVg.jpg', '101010  CONVERSE/匡威 中性高帮帆布鞋 专柜正品', 'http://item.taobao.com/item.htm?id=3189610645&spm=2014.12513803.0.0', '209.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbjGXAVfCKHHbhE%2FJifUJ3np%2FWTM6TtxGjXVo8JCG9JFkz%2B7wVmohMM9pWshozZkW%2B%2BTcvnnic4%2FEIPbsz9WBk2cbCfR6pxVM200hZqc%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_3189610645', 0, 0, 310, 310, 'bupt'),
(51, 4, 81, 33, './bupt/public/upload/share/000/000/000/81/d746c0600dc384acad544841d7869d98LprIsJ.jpg', 'adidas 阿迪达斯 三叶草 NIZZA HI 蓝橙帆布 V23023', 'http://item.taobao.com/item.htm?id=14331351161&spm=2014.12513803.0.0', '478.00', 0, '', 1, 'taobao_14331351161', 0, 0, 600, 600, 'bupt'),
(52, 4, 82, 34, './bupt/public/upload/share/000/000/000/82/e31e579f3938c14bfa0496ea77192b13gHQ2sO.jpg', '品牌特卖正品adidas阿迪达斯12新款男子跑步鞋男鞋运动鞋V21934', 'http://item.taobao.com/item.htm?id=14950588697&spm=2014.12513803.0.0', '360.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ8QZw9NvnJx2cXVwFh%2B92sQWPsrSj8e1lbQFrgJFDIP2VryjyUBXNhcl0y8O%2F6g%2Bp8COB0WwpNgTC81c54YDy%2F8c4D24VoS9Id1KK%2BWQ%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14950588697', 0, 0, 1500, 1500, 'bupt'),
(55, 4, 85, 0, './bupt/public/upload/share/000/000/000/85/d8b03fa76d956eb529e6e84da327173a1qqq76.jpg', '韩都衣舍●韩国2012春装新款韩版女装V领七分袖连衣裙HN1030娋', 'http://item.taobao.com/item.htm?id=9671227545&spm=2014.12513803.0.0', '128.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTZP8FIXPSFlNy25%2FtR%2F55uKJ1dBzUoHcod6mJsdyvPK7b2IyTIytQ%2F1QiJVtyfuKG54k1BUO1G2Cl3AIgkdUT2hsgfkfDlpy9r29UtGpH&p=mm_18381334_0_0&n=19', 1, 'taobao_9671227545', 0, 0, 800, 800, 'bupt'),
(54, 4, 84, 36, './bupt/public/upload/share/000/000/000/84/f73acb9d1a8b943bb47b26d7f69ea4d8fvVH22.jpg', '【一淘专享立减】韩都衣舍韩夏新女装V领条纹短袖大码T恤9A35喆莨', 'http://item.taobao.com/item.htm?id=6115422767&spm=2014.12513803.0.0', '139.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTa0eYRz2Kf%2FD2veJQfKlgYOWGZqokaos4tpKLt3Pn8hkb3wCppfAr89%2FMNGxeqzsQ9VtkM04BxEHt0VugEw0ArCklpaTsJ23Jn7emQlxj&p=mm_18381334_0_0&n=19', 1, 'taobao_6115422767', 0, 0, 800, 800, 'bupt'),
(56, 4, 86, 37, './bupt/public/upload/share/000/000/000/86/69119e311a0cb3c200f64f2565cb3dc24mcm4Y.jpg', 'A313韩版双层镂空无袖蕾丝T恤', 'http://item.taobao.com/item.htm?id=16552088159&spm=2014.12513803.0.0', '89.00', 0, '', 1, 'taobao_16552088159', 0, 0, 310, 310, 'bupt'),
(57, 1, 87, 38, './bupt/public/upload/share/000/000/000/87/1cb935b4ccc6be608645fa6c4daead82eEe1Jd.jpg', '春秋季韩国女款 巴黎纱长款丝巾圆点水玉点围巾 360度的完美q180', 'http://item.taobao.com/item.htm?id=14945099091&spm=2014.12513803.0.0', '49.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ8QNiGwFBqRdLFelKFrnEE7JcxbTJyeY%2BAQg%2FajGPEj7RSEauyUIJeF5lyPX0PoYoOEe63GcOChYwJOdtR%2BwSPRdxVpXcYl8be4A%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14945099091', 0, 0, 800, 800, 'bupt'),
(58, 1, 88, 39, './bupt/public/upload/share/000/000/000/88/617addaf10c5a1d686c7bedf102742felQLeBe.jpg', '兰诗雨 围巾丝巾2012新款日韩国春夏秋真丝超长女士披肩LSY420062', 'http://item.taobao.com/item.htm?id=14084441430&spm=2014.12513803.0.0', '119.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ1Hgc%2BMkDirwUT%2BzWOw3Qi83SnpKLVQoensCs80zxfoC0Eu4VqgzL7MbVOGBZ482AC2JifNCP81r7NoiYxFO78a6uW2nZO57NZ7ToOsw%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14084441430', 0, 0, 800, 800, 'bupt'),
(59, 1, 89, 40, './bupt/public/upload/share/000/000/000/89/85ff8261d54c620f6bd438f661e29cd9V0QMqT.jpg', '2012夏季新款 蝴蝶结豹纹印花超长真丝大丝巾女 正品桑蚕丝603008', 'http://item.taobao.com/item.htm?id=14188173931&spm=2014.12513803.0.0', '118.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ0GwAwrWpxaPU30GaQETrYHiTrKsj4Syjn80QAC0SLIl93vBTXGDLLYrLrajG%2BQxp%2Fb3BKxvfyqFROsiwOOJrNmc4jU2XdWlRj%2FBcW&p=mm_18381334_0_0&n=19', 1, 'taobao_14188173931', 0, 0, 800, 800, 'bupt'),
(60, 1, 90, 41, './bupt/public/upload/share/000/000/000/90/2de94b4681d094a11b3fd074faf94238Ju8388.jpg', '茗琳正品采用施华洛世奇元素天使泪 水晶项链 女 短款 锁骨 韩国', 'http://item.taobao.com/item.htm?id=12506056193&spm=2014.12513803.0.0', '151.20', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIKm1Xw3iR%2BBizSpbTYw%2B4HUJFarj3z%2FUF63JCrZC7BuaJe3st%2BJNMen3eQJQJExY3GLf7ZnwZzR1NIjKsqjxeaL8OjK1PwsVKneT9mZYg%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_12506056193', 0, 0, 500, 500, 'bupt'),
(78, 4, 109, 58, './bupt/public/upload/share/000/000/001/09/f5d2d3354a003e001ad7b4189d8f83415CGZ2z.jpg', '欧美粉色翻领背心 小衫 夏季雪纺连衣裙 背心裙 裙子 新款', 'http://item.taobao.com/item.htm?id=15665136817&spm=2014.12513803.0.0', '45.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIWYK8%2F3IMXPvaidO7cPnhMFxivWuTt5WvCiCrYRwS3IPmowu0Z479FxH2URD3hd7OpGRP7jzVNyj7%2F%2Br1OpwxGHUxHtjjtLOPV%2BEu%2Bu&p=mm_18381334_0_0&n=19', 1, 'taobao_15665136817', 0, 0, 500, 750, 'bupt'),
(62, 4, 92, 43, './bupt/public/upload/share/000/000/000/92/18b6aed82ad12b6e04c204f5fd4786b160HhY0.jpg', '[满千包邮]英伦老上海风格 灯具 客厅卧室 实木 可调光落地灯018', 'http://item.taobao.com/item.htm?id=1005771360&spm=2014.12513803.0.0', '260.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIA%2BrdzoMVCS1%2FwQ2EjOG%2FCR%2Fdw6GuOmoCny5%2BY1cqYT86hgS60142BYuGvDnm4aWmPpaPNJqe4XxK2ONu%2F9NwjxJDn2lOpa9VWA%2BzA%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_1005771360', 0, 0, 310, 310, 'bupt'),
(63, 4, 93, 44, './bupt/public/upload/share/000/000/000/93/d02b2f16a9a84edd9f72ce80600de73802R20U.jpg', '艾唯莎2012新款正品时尚百搭女士太阳镜太阳眼镜超大框墨镜明星款', 'http://item.taobao.com/item.htm?id=13665226641&spm=2014.12513803.0.0', '168.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOQuTQ%2BsT3PnR9or3VOpLijGHweL%2FIbQGNpvTCuGnbxJshphCFAIvA45MSjoFjr0vTSLa%2F%2BIlx1QuTpidHswWV%2BVDquxwp8b1h96EQ0Tg%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_13665226641', 0, 0, 304, 310, 'bupt'),
(64, 4, 94, 45, './bupt/public/upload/share/000/000/000/94/bb6369988a02573d8840006b78742fe7049z44.jpg', '淘金币 帕莎太阳镜 正品女12新款T6859明星款 墨镜 时尚太阳镜...', 'http://item.taobao.com/item.htm?id=14343375989&spm=2014.12513803.0.0', '225.80', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ2SXbIxEwGaORVgbKwTXGFy0t%2FnYc92fQjRJ%2Bu9cpMljJAmLMtg9zFeec4ExNCcsB%2FH3%2FdXoCMqe8Rl%2FntlQv%2F4I5h8Q7%2BDYD8WEiuxw%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14343375989', 0, 0, 700, 700, 'bupt'),
(65, 4, 95, 46, './bupt/public/upload/share/000/000/000/95/ee24e00d757dc39ff16c4a95e250063eCA8Zqg.jpg', '明星同款板材偏光百搭时尚超大框 太阳眼镜 墨镜 蛤蟆镜 太阳镜女', 'http://item.taobao.com/item.htm?id=13874025846&spm=2014.12513803.0.0', '108.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOePU4hOco4mXSc0ccBBECXo%2FAbtAijSrZwY1x8QUzXRhQK600567I3g9E8rPGskoIA7Zw0hpXZEzOIeSKPU52U5f1x1rrNqijwxYfQMg%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_13874025846', 0, 0, 405, 405, 'bupt'),
(66, 4, 96, 47, './bupt/public/upload/share/000/000/000/96/b0889c59530cd8f541174b6465cbea87Ov432j.jpg', '2012男女士黑超墨镜欧美时尚复古蛤蟆镜明星款潮人眼镜正品太阳镜', 'http://item.taobao.com/item.htm?id=16523120315&spm=2014.12513803.0.0', '38.00', 0, '', 1, 'taobao_16523120315', 0, 0, 310, 310, 'bupt'),
(67, 4, 97, 48, './bupt/public/upload/share/000/000/000/97/edcc3d04865bc5c461d9610c2ae7d506xwfeA3.jpg', '达思龙正品太阳镜 女士时尚复古墨镜 太阳眼镜 蛤蟆镜 新品限售', 'http://item.taobao.com/item.htm?id=9214953589&spm=2014.12513803.0.0', '89.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTZPu2O7EY9c3lqc8yL52tWCsEOlfsN5YoJvtxRWX%2BbkNySxgz%2F84eC0EKhzY2KoY4jOQC0IwV6tUQJJfAhqH%2FPWVRBlXVXtvLag4EjEWx&p=mm_18381334_0_0&n=19', 1, 'taobao_9214953589', 0, 0, 750, 750, 'bupt'),
(68, 4, 98, 49, './bupt/public/upload/share/000/000/000/98/89d7412ced5f7d33c04065030fa2216bYxmoTT.jpg', '2012新款时尚方框太阳镜 女士 经典百搭大框太阳眼镜 墨镜 偏光镜', 'http://item.taobao.com/item.htm?id=14344624200&spm=2014.12513803.0.0', '218.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ2SXFDfO9fNUsJzpXjozN5c8dMt4qAjNevSkoUoc5PxYy9vaG%2BEFmNxRRsBry54FXicnTKmU%2FPh%2FUCV5HUVrPi2zNx3%2FXv3L1MJXyu3Q%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14344624200', 0, 0, 310, 310, 'bupt'),
(69, 4, 100, 0, './bupt/public/upload/share/000/000/001/00/bcb0047b5531140053f7de78b7f6305eXHw2k9.jpg', 'mr.mika米米家 特 气质几何母贝项链 不包邮', 'http://item.taobao.com/item.htm?id=16242944591&spm=2014.12513803.0.0', '29.00', 0, '', 1, 'taobao_16242944591', 0, 0, 500, 750, 'bupt'),
(70, 1, 101, 51, './bupt/public/upload/share/000/000/001/01/83a8f7a4eae6d46b9531cc24f8aa4d9b66E02B.jpg', '2012新款 qlady特价包邮饰品时尚女款配饰镂空心形粉/紫水晶手链', 'http://item.taobao.com/item.htm?id=8439299228&spm=2014.12513803.0.0', '68.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTZTvcR5AZOBqJ4AuSr6CjI6rn1MjaLdk34BgEco4drNH2dqGEWDrhlvHIpZmRb%2BMvNatIyIpJHYsm1j%2FDFw6o6THUI6LP8tDjtihyig%2Ff&p=mm_18381334_0_0&n=19', 1, 'taobao_8439299228', 0, 0, 400, 400, 'bupt'),
(71, 1, 102, 52, './bupt/public/upload/share/000/000/001/02/ad9eafc9e63aea9f4282bff2c312b78e3gzI3f.jpg', 'Tata/他她 2012春季 奢华明星华丽款 亮片布 高跟女单鞋 2GJ53D', 'http://item.taobao.com/item.htm?id=14228143245&spm=2014.12513803.0.0', '468.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ3iw0i3QJXfwNRRE8juUsOrgxkDzJ9d%2F%2FhVG9dtgKU%2FqzelZaiTdIXUNxpgsR1UYV6nv%2FqG3WVp8lDVXwTg0fIMooGhrIfEskH%2Fmmhpg%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14228143245', 0, 0, 800, 800, 'bupt'),
(72, 1, 103, 53, './bupt/public/upload/share/000/000/001/03/43a2cf718c60d46f00446fbab10c61d1lcCKS2.jpg', '最高品质梵克雅宝 经典幸运草项链 质感天然贝壳四叶草玫瑰金项链', 'http://item.taobao.com/item.htm?id=14258786191&spm=2014.12513803.0.0', '75.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIQ3jOntz%2B5Q4wissnPIOANZupWyNzQz%2BZ41muAFHnr8kfd9GhWLvNERiQQ1w23OxK%2BlMV7Ef9vKe1Vg5bYoCyYVxnceO8m6P5NDZ2Y7Uw%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_14258786191', 0, 0, 460, 650, 'bupt'),
(73, 1, 104, 54, './bupt/public/upload/share/000/000/001/04/74d84be4fca305990489b1bce4629f1d9dGD8G.jpg', '2012春夏彩妆 纯洁之光 素野水润口红3.8G珊瑚/裸色', 'http://item.taobao.com/item.htm?id=13886146635&spm=2014.12513803.0.0', '68.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOeMv0411KoY6HYkA3itO3UES%2FbRP0CExLem1lrTExTZpF7UKvqSrjKXKnQwQy8FFQRB8ABN7SUzXY47wdDArxzxbZYtUFb7WfFdZb99g%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_13886146635', 0, 0, 1200, 1200, 'bupt'),
(77, 4, 108, 57, './bupt/public/upload/share/000/000/001/08/350512550a45edb4ca86447a268eec88aeEmAl.jpg', '纯棉和风。蓝色樱花 碎花棉布餐垫桌垫 精致生活', 'http://item.taobao.com/item.htm?id=9440697534&spm=2014.12513803.0.0', '18.50', 0, '', 1, 'taobao_9440697534', 0, 0, 571, 426, 'bupt'),
(75, 4, 106, 56, './bupt/public/upload/share/000/000/001/06/4259861c1c425f099f7d24db911f7c954yz22P.jpg', '卡拉梦 大鼻子熊布娃娃 泰迪熊公仔 毛绒玩具 娃娃 生日礼物女生', 'http://item.taobao.com/item.htm?id=9405963384&spm=2014.12513803.0.0', '88.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTZP2dfY6c%2FiXew4%2FyAE5Ew0l%2FWCi4GvMWlNebaEKOH2oIAvIoetE6Lkk60fnHu%2Fo0zB%2FvwJoEt6fEjpqWGZ2LOK86ogqLM%2BF5GHZQTJYA&p=mm_18381334_0_0&n=19', 1, 'taobao_9405963384', 0, 0, 1000, 1000, 'bupt'),
(76, 4, 107, 0, './bupt/public/upload/share/000/000/001/07/685b47d4e7769ececac14473a73b4387uY5uYi.jpg', '松松可爱卡通枕头 双人单人枕头情侣抱枕 生日礼物女生江浙沪包邮', 'http://item.taobao.com/item.htm?id=13423879918&spm=2014.12513803.0.0', '54.00', 0, 'http://s.click.taobao.com/t_8?e=7HZ6jHSTbIOSJln51eiRfxI25xIEL6QwjKjJFVsYJ7eqSmt%2FZR32G5Yl08lwsYDWYwt9CboLJm919d1ZVCwz3NbYaIb2bUVMSH4jUHoErPyhSRypxA%3D%3D&p=mm_18381334_0_0&n=19', 1, 'taobao_13423879918', 0, 0, 310, 310, 'bupt');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_share_image_sizes`
--

CREATE TABLE IF NOT EXISTS `fanwe_share_image_sizes` (
  `id` varchar(60) NOT NULL DEFAULT '',
  `width` smallint(5) DEFAULT '0',
  `height` smallint(5) DEFAULT '0',
  `is_cut` tinyint(1) DEFAULT '0',
  `is_water` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_share_image_sizes`
--

INSERT INTO `fanwe_share_image_sizes` (`id`, `width`, `height`, `is_cut`, `is_water`, `status`) VALUES
('image_1', 100, 100, 1, 0, 1),
('image_2', 200, 999, 0, 0, 1),
('image_3', 468, 468, 0, 1, 1),
('image_4', 160, 160, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_share_match`
--

CREATE TABLE IF NOT EXISTS `fanwe_share_match` (
  `share_id` int(11) NOT NULL,
  `content_match` text NOT NULL,
  PRIMARY KEY (`share_id`),
  FULLTEXT KEY `content_match` (`content_match`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_share_match`
--

INSERT INTO `fanwe_share_match` (`share_id`, `content_match`) VALUES
(11, 'ux115 ux20234 ux20037 ux25420 ux26578 ux19971 ux19968 ux20108 ux30007 ux38795 ux26085 ux24120 ux20241 ux38386 ux26102 ux23578 ux28526 ux27969 ux30952 ux30722 ux30382 ux30495 ux21830 ux21153 ux21333 ux26495 ux28165 ux20179 ux73 ux48 ux54'),
(12, 'ux26102 ux23578 ux38210 ux31354 ux21246 ux33457 ux32511 ux27611 ux34915 ux65292 ux21576 ux29616 ux20986 ux24180 ux36731 ux21270 ux30340 ux35774 ux35745 ux32654 ux20029 ux32780 ux19981 ux22833 ux20248 ux38597 ux39118 ux26684 ux31616 ux32422 ux36229 ux36190 ux12290'),
(2, 'ux35797 ux25293 ux30340 ux33457 ux24515 ux23567 ux38138 ux40 ux37325 ux30917 ux22238 ux39304 ux44 ux20840 ux39302 ux20813 ux37038 ux36153 ux33 ux41 ux50 ux48 ux49 ux26149 ux23395 ux26032 ux27454 ux26102 ux23578 ux38889 ux29256 ux26446 ux23389 ux21033 ux25163 ux25552 ux21333 ux32937 ux21253 ux26012 ux25358 ux22899 ux22810 ux21151 ux33021'),
(3, 'ux90 ux73 ux80 ux79 ux38480 ux37327 ux27491 ux29256 ux25171 ux28779 ux26426 ux21457 ux21806 ux22478 ux28459 ux25143 ux22806 ux19987 ux33829 ux24215 ux21407 ux35013 ux26085 ux21697 ux50 ux48 ux49 ux32463 ux20856 ux27454 ux28165 ux26126 ux19978 ux27827 ux22270'),
(4, 'ux39532 ux20811 ux22841 ux21326 ux33778 ux23448 ux26041 ux26071 ux33328 ux24215 ux12304 ux21697 ux29260 ux29305 ux21334 ux12305 ux27491 ux30007 ux35013 ux25340 ux25509 ux21360 ux33457 ux36830 ux24125 ux22806 ux22871 ux55 ux49 ux51 ux48 ux50'),
(5, 'ux21270 ux22918 ux34955 ux97 ux110 ux103 ux111 ux26071 ux33328 ux24215 ux91 ux29305 ux93 ux23433 ux23478 ux31435 ux20307 ux21098 ux35009 ux29066 ux29483 ux21253 ux47 ux31508 ux25991 ux20855 ux25910 ux32435 ux76 ux51 ux49 ux52'),
(6, 'ux20445 ux28201 ux26479 ux42 ux51 ux91 ux29305 ux93 ux23433 ux23478 ux26085 ux38889 ux23621 ux21487 ux29233 ux36731 ux26494 ux29066 ux27700 ux21150 ux20844 ux36710 ux36733 ux72 ux50 ux48 ux57'),
(7, 'ux36825 ux20010 ux26159 ux19968 ux38889 ux22269 ux37329 ux23646 ux23567 ux39134 ux26426 ux22810 ux21151 ux33021 ux24070 ux24067 ux26053 ux34892 ux25252 ux29031 ux22841 ux72 ux51 ux50 ux48'),
(8, 'ux49 ux20010 ux23433 ux23478 ux21487 ux29233 ux21345 ux36890 ux20820 ux23376 ux36855 ux20320 ux23567 ux21488 ux28783 ux47 ux20805 ux30005 ux76 ux69 ux68 ux21019 ux24847 ux23621 ux48 ux56'),
(9, 'ux49 ux20010 ux12304 ux22810 ux31859 ux20048 ux12305 ux32654 ux24335 ux39118 ux26684 ux21488 ux28783 ux23398 ux20064 ux24037 ux20316 ux25252 ux30524 ux39280 ux38271 ux33218 ux25240 ux21472 ux20855 ux38081 ux33402 ux23478 ux23621 ux26071 ux33328 ux24215 ux91 ux93'),
(10, 'ux51 ux20010 ux23433 ux23478 ux26085 ux38889 ux23621 ux26102 ux23578 ux21452 ux23618 ux30495 ux31354 ux19981 ux38152 ux38050 ux26479 ux20445 ux28201 ux27700 ux21150 ux20844 ux67 ux52 ux48 ux49'),
(14, 'ux20170 ux24180 ux36824 ux26159 ux24456 ux27969 ux34892 ux34028 ux35033 ux22114 ux126 ux38271 ux30340 ux65292 ux30701 ux21069 ux21518 ux24555 ux28857 ux20241 ux24687 ux21862 ux20146 ux20204 ux22909 ux26790 ux65281 ux32654 ux20029 ux32780 ux19981 ux22833 ux20248 ux38597'),
(15, 'ux21253 ux22899 ux22797 ux21476 ux31482 ux24433 ux21548 ux39118 ux19987 ux26588 ux27491 ux21697 ux50 ux48 ux49 ux26032 ux27454 ux27431 ux32654 ux21333 ux32937 ux25163 ux25552 ux37197 ux30495 ux30382 ux22763 ux28526 ux37038'),
(16, 'ux84 ux104 ux101 ux70 ux97 ux99 ux83 ux111 ux112 ux33457 ux35821 ux20928 ux27901 ux27700 ux20083 ux22871 ux35013 ux28151 ux21512 ux24615 ux29245 ux32932 ux43 ux28082 ux28165 ux34917'),
(18, 'ux31449 ux20869 ux30452 ux25509 ux36141 ux20080 ux22270 ux20013 ux30340 ux21830 ux21697'),
(19, 'ux26143 ux24231 ux26102 ux23578 ux25645 ux37197'),
(23, 'ux26460 ux23578 ux28436 ux32462 ux50 ux48 ux49 ux26032 ux27454 ux26149 ux35013 ux30007 ux22841 ux20811 ux32431 ux26825 ux20462 ux36523 ux31934 ux21697 ux22806 ux22871 ux22763 ux20241 ux38386 ux19978 ux34915 ux26071 ux33328 ux24215'),
(24, 'ux50 ux48 ux49 ux26149 ux35013 ux26032 ux27454 ux30007 ux22763 ux31934 ux21697 ux21152 ux21402 ux31435 ux39046 ux22841 ux20811 ux20462 ux36523 ux26102 ux23578 ux20241 ux38386 ux22806 ux22871 ux28526'),
(25, 'ux50 ux48 ux49 ux26149 ux35013 ux26032 ux27454 ux30007 ux22763 ux38889 ux29256 ux20462 ux36523 ux32650 ux27611 ux21602 ux22841 ux20811 ux20241 ux38386 ux31934 ux21697 ux28526 ux26102 ux23578 ux19978 ux34915 ux22806 ux22871'),
(26, 'ux29305 ux20215 ux38480 ux37327 ux52 ux48 ux20214 ux39030 ux24917 ux50 ux49 ux26032 ux27454 ux22899 ux35013 ux20004 ux22871 ux38271 ux34966 ux26465 ux32441 ux84 ux43 ux32972 ux24515 ux36830 ux24125 ux39532 ux30002 ux26381 ux39280 ux26071 ux33328 ux24215'),
(27, 'ux39030 ux24917 ux50 ux48 ux49 ux26032 ux27454 ux26149 ux35013 ux20462 ux36523 ux33655 ux21494 ux36793 ux111 ux108 ux36890 ux21220 ux27873 ux34966 ux34507 ux31957 ux35033 ux23618 ux36830 ux34915 ux22899'),
(28, 'ux39030 ux24917 ux26085 ux31995 ux38889 ux29256 ux20223 ux21602 ux26009 ux20013 ux38271 ux22823 ux34915 ux29980 ux32654 ux20908 ux35013 ux20462 ux36523 ux24102 ux24125 ux22806 ux22871 ux52 ux25240 ux21253 ux37038'),
(29, 'ux40657 ux33394 ux30340 ux38634 ux33457 ux35044 ux23376 ux19968 ux24180 ux22235 ux23395 ux37117 ux24456 ux36890 ux29992 ux65292 ux37027 ux23601 ux35201 ux30475 ux24590 ux20040 ux21435 ux25645 ux37197 ux20102 ux65281 ux32463 ux20856 ux26684 ux34924 ux34923 ux26159 ux23436 ux32654 ux26149 ux35013 ux32452 ux21512 ux20877 ux19978 ux34676 ux34678 ux32467 ux39280 ux21333 ux38795 ux21487 ux20197 ux12290'),
(30, 'ux27491 ux32418 ux33394 ux31435 ux20307 ux30571 ux27611 ux84 ux24676 ux65292 ux25402 ux26377 ux24847 ux24605 ux30340 ux19968 ux27454 ux116 ux21069 ux30701 ux21518 ux38271 ux35774 ux35745 ux12290 ux36824 ux20010 ux23567 ux29141 ux23614 ux38750 ux24120 ux24615 ux27668 ux36136 ux21602 ux38543 ux25645 ux37197 ux23601 ux22909 ux30475 ux21862'),
(31, 'ux31616 ux32422 ux30340 ux22278 ux39046 ux84 ux24676 ux65292 ux26159 ux30333 ux25645 ux32477 ux20339 ux12290 ux25277 ux35937 ux22270 ux26696 ux34701 ux20837 ux22686 ux28155 ux20960 ux20998 ux20431 ux30382 ux33394 ux24425 ux19979 ux25670 ux19981 ux35268 ux21017 ux35774 ux35745 ux26356 ux23436 ux32654 ux25289 ux38271 ux33151 ux37096 ux32447 ux26465 ux37197 ux29275 ux20180 ux35044 ux20986 ux38376 ux22833 ux39118 ux23578 ux33579 ux20154 ux28023 ux20013 ux24635 ux33021 ux21457 ux29616 ux19968 ux26679 ux20320 ux65281'),
(32, 'ux20170 ux24180 ux26377 ux37027 ux20040 ux24230 ux32654 ux20029 ux30340 ux39068 ux33394 ux65292 ux35199 ux29916 ux32418 ux20316 ux20026 ux27969 ux34892 ux25370 ux29233 ux28201 ux26262 ux27987 ux37057 ux28909 ux24773 ux21514 ux24102 ux35774 ux35745 ux33016 ux37096 ux29305 ux21035 ux33655 ux21494 ux36793 ux35013 ux39280 ux26494 ux32039 ux33136 ux19979 ux25670 ux30334 ux35126 ux20013 ux38271 ux26159 ux19968 ux20214 ux23601 ux22815 ux31181 ux19978 ux29677 ux22806 ux38754 ux21487 ux20197 ux25645 ux37197 ux24320 ux34923 ux23567 ux26381 ux20986 ux28216 ux20551 ux37117 ux20063 ux20056 ux20043 ux36873 ux12290'),
(33, 'ux28165 ux29245 ux21322 ux36879 ux30340 ux32617 ux34923 ux65292 ux25645 ux37197 ux31958 ux26524 ux33394 ux31995 ux35044 ux23376 ux35033 ux27969 ux38706 ux20986 ux27915 ux27668 ux36136 ux24863 ux12290 ux19968 ux27454 ux39640 ux24110 ux26964 ux36319 ux20937 ux38795 ux33457 ux23395 ux23569 ux22899 ux31435 ux21363 ux28322 ux27966 ux32431 ux23398 ux38498 ux39118'),
(34, 'ux40657 ux30333 ux37197 ux26159 ux38750 ux24120 ux32463 ux20856 ux30340 ux31616 ux32422 ux32452 ux21512 ux65292 ux33394 ux20462 ux36523 ux29275 ux20180 ux35044 ux36234 ux26174 ux20248 ux38597 ux32780 ux34924 ux34923 ux21487 ux20197 ux20984 ux32654 ux20154 ux30693 ux24615 ux40060 ux22068 ux39640 ux36319 ux38795 ux26356 ux21152 ux25289 ux38271 ux33151 ux37096 ux26354 ux32447 ux12290'),
(35, 'ux38271 ux34966 ux38634 ux32442 ux30862 ux33457 ux36830 ux34915 ux35033 ux65292 ux39640 ux33136 ux30340 ux26495 ux22411 ux20805 ux20998 ux24378 ux35843 ux20320 ux32420 ux32454 ux37096 ux26354 ux32447 ux30053 ux24494 ux23485 ux26494 ux25670 ux21487 ux20197 ux35753 ux23567 ux33145 ux19978 ux36184 ux32905 ux36731 ux38544 ux34255 ux36215 ux26469 ux12290 ux26041 ux24418 ux39046 ux21475 ux26356 ux20462 ux39280 ux33080 ux26174 ux30246 ux25928 ux26524 ux24456 ux22909 ux23494 ux39118 ux29748 ux35126 ux28789 ux21160 ux33147'),
(36, 'ux29983 ux21629 ux20013 ux26368 ux32654 ux22909 ux30340 ux37117 ux26159 ux30475 ux19981 ux35265 ux65292 ux36825 ux23601 ux20026 ux20160 ux20040 ux25105 ux20204 ux20250 ux22312 ux25509 ux21563 ux21741 ux27875 ux35768 ux24895 ux26102 ux20505 ux38381 ux19978 ux30524 ux30555 ux12290 ux20170 ux22825 ux20027 ux39029 ux33740 ux26089 ux20241 ux24687 ux20102 ux21606 ux126 ux20808 ux36319 ux22823 ux23478 ux35828 ux26202 ux23433 ux26790'),
(37, 'ux19968 ux21482 ux21487 ux29233 ux30340 ux23567 ux29399 ux22114 ux126 ux26159 ux27604 ux29066 ux21508 ux20301 ux26202 ux23433 ux20570 ux20010 ux22909 ux26790 ux65281'),
(38, 'ux32473 ux22823 ux23478 ux20171 ux32461 ux19968 ux20010 ux23567 ux22934 ux31934 ux21606 ux126 ux69 ux98 ux97 ux90 ux105 ux110 ux103 ux109 ux114 ux107 ux20146 ux20204 ux26089 ux28857 ux20241 ux24687 ux21584 ux26202 ux23433 ux40 ux21563 ux41'),
(39, 'ux24819 ux24517 ux22823 ux23478 ux37117 ux30693 ux36947 ux39068 ux33394 ux25645 ux37197 ux22522 ux26412 ux21407 ux21017 ux65292 ux20174 ux22836 ux21040 ux33050 ux26368 ux22909 ux19981 ux35201 ux36229 ux36807 ux19977 ux31181 ux12290 ux22696 ux38236 ux20063 ux26159 ux19968 ux20214 ux22686 ux24378 ux33258 ux20449 ux30340 ux39280 ux29289 ux22114 ux65281 ux26377 ux25165 ux33021 ux27668 ux22330 ux20146 ux20204 ux26790 ux21606 ux126 ux32654 ux20029 ux32780 ux22833 ux20248 ux38597'),
(40, 'ux36825 ux26159 ux20170 ux24180 ux27969 ux34892 ux30340 ux20912 ux27801 ux33394 ux22114 ux126 ux26149 ux22825 ux20040 ux31359 ux22238 ux22836 ux29575 ux19968 ux23450 ux24456 ux39640 ux21543 ux21608 ux26411 ux19981 ux35201 ux29609 ux22826 ux26202 ux20146 ux20204 ux23433 ux22909 ux26790 ux65281'),
(42, 'ux21152 ux20837 ux26143 ux24231 ux31168 ux12298 ux27969 ux34892 ux26102 ux23578 ux12299'),
(43, 'ux21152 ux20837 ux26143 ux24231 ux31168 ux12298 ux27969 ux34892 ux26102 ux23578 ux12299'),
(44, 'ux21152 ux20837 ux26143 ux24231 ux31168 ux12298 ux27969 ux34892 ux26102 ux23578 ux12299'),
(45, 'ux21152 ux20837 ux26143 ux24231 ux31168 ux12298 ux27969 ux34892 ux26102 ux23578 ux12299'),
(46, 'ux21152 ux20837 ux26143 ux24231 ux31168 ux12298 ux27969 ux34892 ux26102 ux23578 ux12299'),
(47, 'ux21152 ux20837 ux26143 ux24231 ux31168 ux12298 ux27969 ux34892 ux26102 ux23578 ux12299'),
(48, 'ux21253 ux37038 ux26149 ux35013 ux38889 ux29256 ux39640 ux33136 ux21322 ux36523 ux35033 ux30701 ux35199 ux40657 ux33394 ux23376'),
(49, 'ux49 ux54 ux53 ux57 ux45 ux50 ux48 ux22899 ux35013 ux26032 ux27454 ux38889 ux29256 ux28909 ux21334 ux26102 ux23578 ux34676 ux34678 ux32467 ux20142 ux29255 ux30334 ux35126 ux35033 ux21322 ux36523'),
(50, 'ux50 ux48 ux49 ux26149 ux22799 ux22899 ux35013 ux34924 ux34923 ux30334 ux25645 ux20462 ux36523 ux20013 ux34966 ux34915 ux33655 ux21494 ux36793 ux38634 ux32442 ux36865 ux25171 ux24213 ux25273 ux33016 ux19977 ux28857 ux27700 ux30952 ux22346'),
(51, 'ux50 ux48 ux49 ux26149 ux35013 ux26032 ux21697 ux38889 ux29256 ux33298 ux36866 ux20241 ux38386 ux30334 ux25645 ux26684 ux23376 ux32441 ux34924 ux34915 ux34923 ux22899 ux38271 ux34966 ux33521 ux20262 ux23398 ux38498 ux39118'),
(52, 'ux25454 ux35828 ux31185 ux23398 ux23478 ux20570 ux20102 ux36825 ux26679 ux19968 ux20010 ux23454 ux39564 ux24182 ux24471 ux21040 ux35777 ux65306 ux22914 ux26524 ux20154 ux27599 ux22825 ux31449 ux22312 ux38236 ux23376 ux21069 ux65292 ux20914 ux33258 ux24049 ux24494 ux31505 ux21578 ux35785 ux8220 ux25105 ux24456 ux32654 ux8221 ux37027 ux20040 ux20182 ux30495 ux30340 ux36234 ux26469 ux8212 ux24515 ux29702 ux26263 ux31034 ux21147 ux37327 ux27492 ux24378 ux22823 ux12290 ux22899 ux26377 ux20449 ux20415 ux20250 ux24863 ux35273 ux29233 ux24773 ux29983 ux21629 ux20013 ux22320 ux20301 ux20063 ux27809 ux37325 ux35201 ux22810 ux20107 ux21487 ux20197 ux20139 ux21463 ux35768 ux21329 ux32982 ux22942 ux20204 ux35760 ux20303 ux20320 ux20029 ux37117 ux23567'),
(53, 'ux23047 ux38901 ux35799 ux25242 ux32441 ux36523 ux20307 ux38684 ux50 ux48 ux109 ux108 ux20135 ux21518 ux24674 ux22797 ux31067 ux22922 ux23072 ux32933 ux32982 ux20195 ux36141 ux29616 ux36135 ux27491 ux21697 ux26592 ux27308 ux32511 ux33590 ux21270 ux22918'),
(55, 'ux12304 ux37329 ux20896 ux12305 ux67 ux108 ux97 ux114 ux105 ux110 ux115 ux23047 ux38901 ux35799 ux72 ux68 ux31532 ux20116 ux20195 ux32418 ux39764 ux26230 ux23436 ux20840 ux32420 ux20307 ux31934 ux21326 ux38684 ux47 ux30246 ux36523 ux50 ux48 ux109 ux121 ux101 ux117'),
(59, 'ux65 ux50 ux56 ux48 ux53 ux33445 ux26411 ux33457 ux24320 ux49 ux26149 ux35013 ux26032 ux27454 ux38889 ux29256 ux23485 ux26494 ux20013 ux38271 ux34966 ux22278 ux39046 ux38634 ux32442 ux36830 ux34915 ux35033 ux55 ux116 ux105 ux97 ux110 ux106 ux103'),
(60, 'ux65 ux50 ux55 ux57 ux33445 ux26411 ux33457 ux24320 ux48 ux49 ux26149 ux35013 ux26032 ux27454 ux22797 ux21476 ux36203 ux26412 ux27668 ux36136 ux31435 ux20307 ux35009 ux21098 ux20462 ux36523 ux36830 ux34915 ux35033'),
(61, 'ux65 ux50 ux56 ux48 ux33445 ux26411 ux33457 ux24320 ux49 ux26149 ux26032 ux27454 ux22797 ux21476 ux80 ux85 ux25340 ux25509 ux33521 ux20262 ux32763 ux39046 ux21452 ux25490 ux25187 ux35199 ux26381 ux22899 ux22806 ux22871'),
(62, 'ux65 ux50 ux56 ux48 ux54 ux33445 ux26411 ux33457 ux24320 ux49 ux26149 ux35013 ux26032 ux27454 ux38889 ux29256 ux30334 ux25645 ux20462 ux36523 ux38024 ux32455 ux34923 ux20142 ux32447 ux22806 ux22871 ux22899'),
(63, 'ux65 ux50 ux56 ux48 ux52 ux33445 ux26411 ux33457 ux24320 ux49 ux26149 ux23395 ux26032 ux27454 ux22823 ux23567 ux34676 ux34678 ux32467 ux27874 ux28857 ux23485 ux26494 ux29980 ux32654 ux38634 ux32442 ux34923'),
(64, 'ux65 ux50 ux55 ux54 ux51 ux33445 ux26411 ux33457 ux24320 ux48 ux49 ux26149 ux35013 ux26032 ux27454 ux38889 ux29256 ux23485 ux26494 ux38271 ux34966 ux32763 ux39046 ux36731 ux30408 ux32431 ux26825 ux30334 ux25645 ux34924 ux34923'),
(65, 'ux65 ux50 ux56 ux48 ux51 ux33445 ux26411 ux33457 ux24320 ux49 ux26149 ux35013 ux26032 ux27454 ux22899 ux31958 ux26524 ux33394 ux33298 ux36866 ux20462 ux36523 ux21333 ux25490 ux25187 ux35199 ux23567 ux22806 ux22871'),
(66, 'ux38480 ux26102 ux37327 ux33 ux26149 ux35013 ux26032 ux21697 ux29305 ux20215 ux21253 ux37038 ux20223 ux29275 ux20180 ux24377 ux21147 ux26174 ux30246 ux23567 ux33050 ux25171 ux24213 ux35044 ux22899 ux26377 ux21152 ux22823 ux30721 ux21271 ux20140 ux36335 ux20998 ux24215'),
(67, 'ux26032 ux21697 ux20080 ux52 ux36865 ux49 ux21253 ux37038 ux22825 ux40517 ux32466 ux36229 ux24377 ux26174 ux30246 ux36393 ux33050 ux36830 ux35044 ux19997 ux34972 ux25171 ux24213 ux22899 ux24420 ux19978 ux28023 ux21830 ux22478'),
(68, 'ux28120 ux37329 ux24065 ux50 ux48 ux49 ux26149 ux35013 ux26032 ux27454 ux23567 ux33050 ux35044 ux25171 ux24213 ux22899 ux24335 ux38889 ux29256 ux26174 ux30246 ux38085 ux31508 ux121 ux105 ux110 ux98 ux97 ux103 ux106 ux101'),
(69, 'ux29305 ux20215 ux38085 ux31508 ux35044 ux26032 ux27454 ux26149 ux35013 ux31958 ux26524 ux33394 ux25171 ux24213 ux22899 ux38889 ux29256 ux23567 ux33050 ux23376 ux22823 ux30721 ux38271 ux20381 ux53 ux54'),
(70, 'ux31958 ux26524 ux33394 ux24425 ux25171 ux24213 ux35044 ux30334 ux25645 ux26494 ux32039 ux33136 ux24377 ux24615 ux27700 ux27927 ux26825 ux23567 ux33050 ux38634 ux33457 ux34180 ux27454 ux109 ux97 ux103 ux105 ux99 ux95 ux108 ux121 ux110'),
(71, 'ux50 ux48 ux49 ux34588 ux26691 ux23478 ux26149 ux22799 ux26032 ux21697 ux38889 ux22269 ux32593 ux32433 ux34028 ux35033 ux20551 ux20004 ux20214 ux25171 ux24213 ux35044 ux34180 ux27454 ux21253 ux37038 ux103 ux97 ux114 ux117 ux110 ux101'),
(72, 'ux31186 ux26432 ux20215 ux50 ux48 ux49 ux26032 ux27454 ux38889 ux22269 ux28909 ux21334 ux30334 ux25645 ux29980 ux32654 ux33050 ux33109 ux32469 ux24102 ux31895 ux36319 ux21333 ux38795 ux79 ux76 ux99 ux97 ux110 ux56 ux121'),
(73, 'ux78 ux73 ux75 ux69 ux32784 ux20811 ux30007 ux23376 ux32463 ux20856 ux26495 ux38795 ux51 ux49 ux53 ux50 ux52 ux48 ux46'),
(74, 'ux20241 ux38386 ux26102 ux23578 ux20462 ux36523 ux30340 ux19968 ux27454 ux39118 ux34915 ux65292 ux30334 ux25645 ux32463 ux20856 ux32780 ux24069 ux27668 ux36825 ux29256 ux22411 ux21033 ux33853 ux37197 ux20197 ux31934 ux33268 ux22823 ux39046 ux35774 ux35745 ux26497 ux20855 ux29260 ux36136 ux12290 ux31616 ux32422 ux26377 ux26684 ux35009 ux21098 ux32447 ux26465 ux26126 ux26391 ux32763 ux35270 ux35273 ux25928 ux26524 ux38750 ux24120 ux26834 ux33136 ux38388 ux24102 ux21487 ux31995 ux25104 ux20248 ux38597 ux34676 ux34678 ux32467 ux26174 ux24471 ux26356 ux20351 ux37096 ux21152 ux32420 ux32454 ux111 ux122 ux26071 ux33328 ux24215 ux79 ux90 ux27431 ux23612 ux36841 ux50 ux48 ux49 ux31179 ux35013 ux26032 ux21697 ux21452 ux25490 ux25187 ux20013 ux38271 ux22806 ux22871 ux51 ux52'),
(75, 'ux12304 ux54 ux25240 ux12305 ux35010 ux24091 ux27611 ux32447 ux24125 ux23376 ux32483 ux33457 ux30424 ux25187 ux26012 ux35167 ux39118 ux34915 ux22806 ux22871 ux23567 ux25151 ux49 ux53 ux48 ux50 ux35 ux26381 ux39280 ux26071 ux33328 ux24215'),
(76, 'ux77 ux114 ux46 ux105 ux110 ux103 ux26032 ux21697 ux30495 ux30382 ux27491 ux28504 ux22810 ux25289 ux51 ux20195 ux26102 ux23578 ux28526 ux27969 ux30007 ux24335 ux38795 ux26149 ux22799 ux21333 ux70 ux49 ux50 ux53 ux94 ux64'),
(77, 'ux23433 ux27493 ux24403 ux39532 ux26085 ux24120 ux20241 ux38386 ux38795 ux23376 ux21333 ux30495 ux30382 ux33521 ux20262 ux28526 ux27969 ux21830 ux21153 ux30007 ux22763 ux34892 ux57 ux48 ux51 ux27849 ux24030 ux19987 ux21334 ux24215'),
(78, 'ux36135 ux21040 ux20184 ux27454 ux21253 ux37038 ux50 ux48 ux49 ux26032 ux21697 ux26149 ux35013 ux35033 ux23376 ux38889 ux29256 ux20462 ux36523 ux32844 ux19994 ux36830 ux34915 ux37117 ux24066 ux20029 ux20154 ux65374 ux22899 ux19987 ux33829 ux24215'),
(80, 'ux49 ux48 ux67 ux79 ux78 ux86 ux69 ux82 ux83 ux47 ux21281 ux23041 ux20013 ux24615 ux39640 ux24110 ux24070 ux24067 ux38795 ux19987 ux26588 ux27491 ux21697 ux21517 ux20896 ux36816 ux21160 ux29260 ux33829 ux24215'),
(81, 'ux97 ux100 ux105 ux115 ux38463 ux36842 ux36798 ux26031 ux19977 ux21494 ux33609 ux78 ux73 ux90 ux65 ux72 ux34013 ux27225 ux24070 ux24067 ux86 ux50 ux51 ux48'),
(86, 'ux28120 ux23567 ux23627 ux8212 ux26149 ux26262 ux24453 ux33457 ux24320 ux38889 ux29256 ux21452 ux23618 ux38210 ux31354 ux26080 ux34966 ux34174 ux19997 ux84 ux24676 ux99 ux97 ux114 ux117 ux115 ux95 ux116 ux111 ux112 ux65 ux51 ux49'),
(82, 'ux21697 ux29260 ux29305 ux21334 ux27491 ux97 ux100 ux105 ux115 ux38463 ux36842 ux36798 ux26031 ux49 ux50 ux26032 ux27454 ux30007 ux23376 ux36305 ux27493 ux38795 ux36816 ux21160 ux86 ux57 ux51 ux52'),
(85, 'ux38889 ux37117 ux34915 ux33293 ux9679 ux22269 ux50 ux48 ux49 ux26149 ux35013 ux26032 ux27454 ux29256 ux22899 ux86 ux39046 ux19971 ux20998 ux34966 ux36830 ux35033 ux72 ux78 ux51 ux23051'),
(84, 'ux12304 ux19968 ux28120 ux19987 ux20139 ux31435 ux20943 ux12305 ux38889 ux37117 ux34915 ux33293 ux22799 ux26032 ux22899 ux35013 ux86 ux39046 ux26465 ux32441 ux30701 ux34966 ux22823 ux30721 ux84 ux24676 ux57 ux65 ux51 ux53 ux21894 ux33704 ux26071 ux33328 ux24215'),
(87, 'ux26149 ux31179 ux23395 ux38889 ux22269 ux22899 ux27454 ux24052 ux40654 ux32433 ux38271 ux19997 ux24062 ux22278 ux28857 ux27700 ux29577 ux22260 ux51 ux54 ux48 ux24230 ux30340 ux23436 ux32654 ux113 ux49 ux56 ux29790 ux36125 ux23572'),
(88, 'ux20848 ux35799 ux38632 ux22260 ux24062 ux19997 ux50 ux48 ux49 ux26032 ux27454 ux26085 ux38889 ux22269 ux26149 ux22799 ux31179 ux30495 ux36229 ux38271 ux22899 ux22763 ux25259 ux32937 ux76 ux83 ux89 ux52 ux54 ux35874 ux23569 ux24433 ux107 ux122'),
(89, 'ux50 ux48 ux49 ux22799 ux23395 ux26032 ux27454 ux34676 ux34678 ux32467 ux35961 ux32441 ux21360 ux33457 ux36229 ux38271 ux30495 ux19997 ux22823 ux24062 ux22899 ux27491 ux21697 ux26705 ux34453 ux54 ux51 ux56'),
(90, 'ux33559 ux29747 ux27491 ux21697 ux37319 ux29992 ux26045 ux21326 ux27931 ux19990 ux22855 ux20803 ux32032 ux22825 ux20351 ux27882 ux27700 ux26230 ux39033 ux38142 ux22899 ux30701 ux27454 ux38145 ux39592 ux38889 ux22269'),
(108, 'ux26825 ux24067 ux39184 ux22443 ux21560 ux27700 ux24615 ux24378 ux12289 ux20415 ux20110 ux28165 ux27927 ux65292 ux20445 ux25252 ux21644 ux35013 ux39280 ux26700 ux20877 ux22909 ux19981 ux36807 ux19968 ux22359 ux32784 ux20154 ux23547 ux21619 ux30340 ux31934 ux33268 ux20855 ux25645 ux37197 ux20351 ux29992 ux26412 ux36523 ux23601 ux26159 ux31181 ux29983 ux27963 ux21697 ux36136 ux34920 ux29616 ux21543 ux108 ux49 ux57 ux56 ux55 ux52 ux48 ux32431 ux39118 ux12290 ux34013 ux33394 ux27185 ux33457 ux30862'),
(92, 'ux33521 ux20262 ux32769 ux19978 ux28023 ux39118 ux26684 ux28783 ux20855 ux23458 ux21381 ux21351 ux23460 ux23454 ux26408 ux21487 ux35843 ux20809 ux33853 ux22320 ux48 ux49 ux56 ux99 ux104 ux101 ux114 ux121 ux51 ux91 ux28385 ux21315 ux21253 ux37038 ux93'),
(93, 'ux33406 ux21807 ux33678 ux50 ux48 ux49 ux26032 ux27454 ux27491 ux21697 ux26102 ux23578 ux30334 ux25645 ux22899 ux22763 ux22826 ux38451 ux38236 ux30524 ux36229 ux22823 ux26694 ux22696 ux26126 ux26143 ux26071 ux33328 ux24215'),
(94, 'ux28120 ux37329 ux24065 ux24085 ux33678 ux22826 ux38451 ux38236 ux27491 ux21697 ux22899 ux49 ux50 ux26032 ux27454 ux84 ux54 ux56 ux53 ux57 ux26126 ux26143 ux22696 ux26102 ux23578 ux27792 ux20809 ux25143 ux22806 ux19987 ux33829 ux24215 ux46'),
(95, 'ux26126 ux26143 ux21516 ux27454 ux26495 ux26448 ux20559 ux20809 ux30334 ux25645 ux26102 ux23578 ux36229 ux22823 ux26694 ux22826 ux38451 ux30524 ux38236 ux22696 ux34532 ux34758 ux22899 ux28023 ux23777 ux24037 ux20316 ux23460'),
(96, 'ux50 ux48 ux49 ux30007 ux22899 ux22763 ux40657 ux36229 ux22696 ux38236 ux27431 ux32654 ux26102 ux23578 ux22797 ux21476 ux34532 ux34758 ux26126 ux26143 ux27454 ux28526 ux20154 ux30524 ux27491 ux21697 ux22826 ux38451 ux20446 ux23567 ux24179 ux52'),
(97, 'ux36798 ux24605 ux40857 ux27491 ux21697 ux22826 ux38451 ux38236 ux22899 ux22763 ux26102 ux23578 ux22797 ux21476 ux22696 ux30524 ux34532 ux34758 ux26032 ux38480 ux21806 ux25991 ux32724 ux25143 ux22806 ux19987 ux33829 ux24215'),
(98, 'ux50 ux48 ux49 ux26032 ux27454 ux26102 ux23578 ux26041 ux26694 ux22826 ux38451 ux38236 ux22899 ux22763 ux32463 ux20856 ux30334 ux25645 ux22823 ux30524 ux22696 ux20559 ux20809 ux101 ux24230 ux95 ux31354 ux38388'),
(100, 'ux24456 ux26377 ux27668 ux36136 ux30340 ux19968 ux27454 ux65292 ux20960 ux20309 ux22270 ux26696 ux21152 ux19978 ux27597 ux36125 ux30707 ux20132 ux38169 ux12290 ux23588 ux20854 ux25645 ux37197 ux20123 ux32431 ux33394 ux31995 ux34915 ux26381 ux21619 ux36947 ux21734 ux109 ux114 ux46 ux105 ux107 ux97 ux31859 ux23478 ux29305 ux39033 ux38142 ux19981 ux21253 ux37038'),
(101, 'ux50 ux48 ux49 ux26032 ux27454 ux113 ux108 ux97 ux100 ux121 ux29305 ux20215 ux21253 ux37038 ux39280 ux21697 ux26102 ux23578 ux22899 ux37197 ux38210 ux31354 ux24515 ux24418 ux31881 ux47 ux32043 ux27700 ux26230 ux25163 ux38142 ux26071 ux33328 ux24215'),
(102, 'ux20142 ux31881 ux36229 ux39640 ux36319 ux65292 ux38378 ux20809 ux24615 ux24863 ux30340 ux35825 ux24785 ux21644 ux36317 ux31163 ux19981 ux23481 ux24573 ux35270 ux21326 ux20029 ux26131 ux25856 ux30331 ux33402 ux26415 ux12290 ux31934 ux33268 ux33457 ux26421 ux32512 ux39280 ux27599 ux19968 ux22788 ux32454 ux33410 ux37117 ux26159 ux23436 ux32654 ux38613 ux29730 ux22882 ux84 ux97 ux116 ux47 ux20182 ux22905 ux50 ux48 ux49 ux26149 ux23395 ux26126 ux26143 ux27454 ux29255 ux24067 ux22899 ux21333 ux38795 ux71 ux74 ux53 ux51 ux68'),
(103, 'ux22235 ux21494 ux33609 ux29611 ux29808 ux37329 ux39033 ux38142 ux65292 ux35753 ux24102 ux32473 ux20320 ux22909 ux36816 ux21543 ux24184 ux26368 ux39640 ux21697 ux36136 ux26805 ux20811 ux38597 ux23453 ux32463 ux20856 ux24863 ux22825 ux28982 ux36125 ux22771'),
(104, 'ux20307 ux36148 ux30340 ux21621 ux25252 ux37197 ux26041 ux65292 ux23500 ux21547 ux20016 ux27700 ux20998 ux20805 ux28363 ux28070 ux21452 ux21767 ux12290 ux35753 ux20320 ux21916 ux24863 ux30408 ux19981 ux32463 ux24847 ux38388 ux25733 ux22068 ux20063 ux20250 ux25955 ux21457 ux26080 ux38480 ux39749 ux21147 ux32032 ux37326 ux23448 ux26071 ux33328 ux24215 ux50 ux48 ux49 ux26149 ux22799 ux24425 ux22918 ux32431 ux27905 ux20043 ux20809 ux21475 ux32418 ux51 ux46 ux56 ux71 ux29642 ux29786 ux47 ux35064 ux33394 ux33167'),
(109, 'ux22799 ux23395 ux38634 ux32442 ux36830 ux34915 ux35033 ux65292 ux23567 ux28165 ux26032 ux65281 ux37070 ux27784 ux21073 ux27431 ux32654 ux31881 ux33394 ux32763 ux39046 ux32972 ux24515 ux34923 ux23376 ux27454'),
(106, 'ux39068 ux33394 ux21644 ux24819 ux35937 ux20013 ux30340 ux19968 ux26679 ux22909 ux65292 ux25265 ux30528 ux20063 ux24456 ux33298 ux26381 ux38750 ux24120 ux21487 ux29233 ux23376 ux34429 ux28982 ux26159 ux36865 ux32473 ux26379 ux21451 ux31036 ux29289 ux25105 ux21457 ux29616 ux28145 ux22320 ux19978 ux36825 ux23453 ux36125 ux20102 ux36824 ux20010 ux23567 ux21704 ux35874 ux21862 ux20004 ux22825 ux20250 ux22312 ux20809 ux39038 ux20320 ux20204 ux24215 ux21734 ux21807 ux26377 ux28857 ux19981 ux32447 ux22836 ux27809 ux22788 ux29702 ux36807 ux20160 ux20040 ux24433 ux21709 ux12290 ux21345 ux25289 ux24067 ux23043 ux22823 ux40763 ux27611 ux32466 ux29609 ux20855 ux27888 ux36842 ux26790 ux29066 ux20844 ux20180 ux29983 ux26085 ux22899'),
(107, 'ux21452 ux20154 ux29066 ux21733 ux38752 ux26517 ux65292 ux26377 ux50 ux20010 ux23610 ux23544 ux21487 ux20197 ux36873 ux25321 ux28385 ux36275 ux24744 ux30340 ux19981 ux21516 ux38656 ux35201 ux20063 ux29992 ux25285 ux24515 ux24324 ux33039 ux20102 ux24590 ux20040 ux21150 ux22871 ux21518 ux25289 ux38142 ux26159 ux25286 ux27927 ux21734 ux126 ux26494 ux29233 ux21345 ux36890 ux22836 ux21333 ux24773 ux20387 ux25265 ux29983 ux26085 ux31036 ux29289 ux22899 ux27743 ux27993 ux27818 ux21253 ux37038');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_share_photo`
--

CREATE TABLE IF NOT EXISTS `fanwe_share_photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `share_id` int(11) NOT NULL,
  `type` enum('default','dapei','look') NOT NULL DEFAULT 'default',
  `img` varchar(255) DEFAULT '',
  `sort` smallint(5) DEFAULT '10',
  `base_id` int(11) NOT NULL DEFAULT '0',
  `base_share` int(11) NOT NULL DEFAULT '0',
  `img_width` smallint(5) DEFAULT '0',
  `img_height` smallint(5) DEFAULT '0',
  `server_code` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `uid` (`uid`),
  KEY `share_id` (`share_id`),
  KEY `type` (`type`),
  KEY `base_id` (`base_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `fanwe_share_photo`
--

INSERT INTO `fanwe_share_photo` (`photo_id`, `uid`, `share_id`, `type`, `img`, `sort`, `base_id`, `base_share`, `img_width`, `img_height`, `server_code`) VALUES
(1, 1, 12, 'dapei', './bupt/public/upload/share/000/000/000/12/54e54865d0dd78931b6ebafe7bc6add4leQ3ur.jpg', 1, 0, 0, 460, 685, 'bupt'),
(2, 1, 14, 'dapei', './bupt/public/upload/share/000/000/000/14/aa0cc1479c8d96287fddbbba3ff5fa01L9kdnD.jpg', 1, 0, 0, 600, 616, 'bupt'),
(3, 1, 18, 'default', './bupt/public/upload/share/000/000/000/18/b79e98e958f21f1b048cfd3e72e733c1ShQCSX.jpg', 0, 0, 0, 640, 640, 'bupt'),
(4, 1, 19, 'default', './bupt/public/upload/share/000/000/000/19/6db05e0c2ce830a59a9c265cdac00d894ZbJB0.jpg', 0, 0, 0, 640, 640, 'bupt'),
(5, 1, 29, 'default', './bupt/public/upload/share/000/000/000/29/41a6d07185e065629abad674d46a2975urnbpX.jpg', 1, 0, 0, 441, 659, 'bupt'),
(6, 1, 30, 'default', './bupt/public/upload/share/000/000/000/30/00eb0b20308165bf5ae574fe8c6d7904s4KZD7.jpg', 1, 0, 0, 460, 565, 'bupt'),
(7, 1, 31, 'default', './bupt/public/upload/share/000/000/000/31/a30b296cc4906d0aea5e47664212f912PJMW97.jpg', 1, 0, 0, 418, 540, 'bupt'),
(8, 1, 32, 'default', './bupt/public/upload/share/000/000/000/32/a85552bfa583157bd9e06f960a70efd294xO4H.jpg', 1, 0, 0, 438, 655, 'bupt'),
(9, 1, 33, 'default', './bupt/public/upload/share/000/000/000/33/78ca250512e5cf48224dab306449ef0botqtqv.jpg', 1, 0, 0, 460, 507, 'bupt'),
(10, 1, 34, 'default', './bupt/public/upload/share/000/000/000/34/7a76b7cd6c9ee3f6d6c66844e7540fbdbb7z5s.jpg', 1, 0, 0, 394, 548, 'bupt'),
(11, 1, 35, 'default', './bupt/public/upload/share/000/000/000/35/67b2ff69383527f70807e1159db26f79f8Jno5.jpg', 1, 0, 0, 350, 450, 'bupt'),
(12, 1, 36, 'default', './bupt/public/upload/share/000/000/000/36/d556e88059c2bc79afbaebc1f5b69edckHc2rA.jpg', 1, 0, 0, 596, 900, 'bupt'),
(13, 1, 37, 'default', './bupt/public/upload/share/000/000/000/37/31cb9267e4a38130c1a155b190740072FNdnm0.jpg', 1, 0, 0, 600, 860, 'bupt'),
(14, 1, 38, 'default', './bupt/public/upload/share/000/000/000/38/74222a4714cde54c497fdca4a0d7099cwFwFEc.jpg', 1, 0, 0, 720, 662, 'bupt'),
(15, 1, 39, 'default', './bupt/public/upload/share/000/000/000/39/3d054aa638de584e7ed9201657267171LM58v8.jpg', 1, 0, 0, 600, 813, 'bupt'),
(16, 1, 40, 'default', './bupt/public/upload/share/000/000/000/40/75e762fc9073ac45668237ce2b25c11cO5kIaV.jpg', 1, 0, 0, 367, 550, 'bupt'),
(17, 1, 42, 'default', './bupt/public/upload/share/000/000/000/40/75e762fc9073ac45668237ce2b25c11cO5kIaV.jpg', 1, 16, 40, 367, 550, 'bupt'),
(18, 1, 43, 'default', './bupt/public/upload/share/000/000/000/39/3d054aa638de584e7ed9201657267171LM58v8.jpg', 1, 15, 39, 600, 813, 'bupt'),
(19, 1, 44, 'default', './bupt/public/upload/share/000/000/000/38/74222a4714cde54c497fdca4a0d7099cwFwFEc.jpg', 1, 14, 38, 720, 662, 'bupt'),
(20, 1, 45, 'default', './bupt/public/upload/share/000/000/000/35/67b2ff69383527f70807e1159db26f79f8Jno5.jpg', 1, 11, 35, 350, 450, 'bupt'),
(21, 1, 46, 'default', './bupt/public/upload/share/000/000/000/33/78ca250512e5cf48224dab306449ef0botqtqv.jpg', 1, 9, 33, 460, 507, 'bupt'),
(22, 1, 47, 'default', './bupt/public/upload/share/000/000/000/32/a85552bfa583157bd9e06f960a70efd294xO4H.jpg', 1, 8, 32, 438, 655, 'bupt'),
(23, 1, 52, 'default', './bupt/public/upload/share/000/000/000/52/6c984899279ead19756f631fc436a379yFlOVL.jpg', 1, 0, 0, 306, 435, 'bupt');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_share_rec`
--

CREATE TABLE IF NOT EXISTS `fanwe_share_rec` (
  `share_id` int(11) NOT NULL,
  `rec_count` int(11) NOT NULL DEFAULT '0',
  `server_code` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`share_id`),
  KEY `rec_count` (`rec_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_share_rec`
--

INSERT INTO `fanwe_share_rec` (`share_id`, `rec_count`, `server_code`) VALUES
(40, 1, 'bupt'),
(39, 1, 'bupt'),
(38, 1, 'bupt'),
(35, 1, 'bupt'),
(33, 1, 'bupt'),
(32, 1, 'bupt');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_share_tags`
--

CREATE TABLE IF NOT EXISTS `fanwe_share_tags` (
  `share_id` int(11) NOT NULL,
  `tag_name` varchar(100) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  KEY `share_id` (`share_id`),
  KEY `tag_name` (`tag_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_share_tags`
--

INSERT INTO `fanwe_share_tags` (`share_id`, `tag_name`, `is_admin`) VALUES
(11, '清仓', 0),
(11, '板鞋', 0),
(2, '手提', 0),
(2, '单肩包', 0),
(2, '斜挎包', 0),
(3, '打火机', 0),
(3, 'ZIPPO', 0),
(4, '马克', 0),
(4, '夹克', 0),
(5, '化妆袋', 0),
(6, '保温杯', 0),
(6, '安家', 0),
(7, '多功能', 0),
(7, '韩国', 0),
(7, '帆布', 0),
(8, '创意家居', 0),
(8, '台灯', 0),
(9, '护眼灯', 0),
(9, '台灯', 0),
(10, '保温杯', 0),
(10, '水杯', 0),
(11, '时尚潮流', 0),
(12, '年轻化', 0),
(12, '风格简约', 0),
(12, '美丽', 0),
(12, '不失优雅', 0),
(14, '蓬蓬裙', 0),
(14, '流行', 0),
(15, '包包', 0),
(15, '女包', 0),
(15, '复古', 0),
(16, '套装', 0),
(16, '爽肤水', 0),
(16, '补水', 0),
(16, '混合性', 0),
(109, '连衣裙', 0),
(108, '碎花', 0),
(23, '夹克', 0),
(23, '男装', 0),
(23, '修身', 0),
(23, '春装', 0),
(24, '男款', 0),
(24, '立领夹克', 0),
(24, '春装', 0),
(25, '毛呢', 0),
(25, '夹克', 0),
(25, '春装', 0),
(26, '背心', 0),
(26, '女装', 0),
(26, '连帽', 0),
(26, '马甲', 0),
(27, '连衣裙', 0),
(27, '荷叶', 0),
(27, '2012', 0),
(27, '春装', 0),
(28, '带帽', 0),
(28, '呢料', 0),
(28, '包邮', 0),
(29, '雪花裤子', 0),
(29, '蝴蝶结', 0),
(29, '格子衬衫', 0),
(29, '春装组合', 0),
(30, '小燕尾', 0),
(31, '圆领T恤', 0),
(31, '简约', 0),
(32, '西瓜红', 0),
(32, '吊带', 0),
(33, '罩衫', 0),
(33, '学院风', 0),
(34, '黑白配', 0),
(34, '简约组合', 0),
(34, '修身牛仔裤', 0),
(34, '鱼嘴高跟鞋', 0),
(35, '雪纺碎花', 0),
(35, '连衣裙', 0),
(35, '方形领口', 0),
(39, '自信', 0),
(39, '墨镜', 0),
(40, '冰沙色', 0),
(48, '裙子', 0),
(48, '短裙', 0),
(48, '半身裙', 0),
(49, '韩版', 0),
(49, '半身裙', 0),
(49, '百褶裙', 0),
(50, '春夏', 0),
(50, '雪纺衫', 0),
(50, '女装', 0),
(51, '学院', 0),
(51, '休闲', 0),
(51, '格子', 0),
(53, '娇韵诗', 0),
(53, '代购', 0),
(53, '正品', 0),
(55, '娇韵诗', 0),
(55, '金冠', 0),
(55, 'Clarins', 0),
(59, '连衣裙', 0),
(59, '雪纺', 0),
(59, '春装', 0),
(60, '连衣裙', 0),
(60, '复古', 0),
(60, '春装', 0),
(61, '英伦', 0),
(61, '复古', 0),
(61, '西服', 0),
(62, '针织衫', 0),
(62, '春装', 0),
(62, '开衫', 0),
(63, '春季', 0),
(63, '雪纺衫', 0),
(64, '衬衫', 0),
(64, '春装', 0),
(64, '翻领', 0),
(65, '西装', 0),
(65, '外套', 0),
(65, '春装', 0),
(66, '打底裤', 0),
(66, '春装', 0),
(66, '牛仔', 0),
(67, '天鹅绒', 0),
(67, '打底裤', 0),
(68, '小脚裤', 0),
(68, '铅笔裤', 0),
(68, '打底裤', 0),
(68, '春装', 0),
(69, '打底裤', 0),
(69, '长裤', 0),
(69, '铅笔裤', 0),
(69, '春装', 0),
(70, '打底裤', 0),
(70, '水洗', 0),
(70, '小脚', 0),
(71, '打底裤', 0),
(71, '春夏', 0),
(71, '裙裤', 0),
(72, '甜美', 0),
(72, '韩国', 0),
(73, 'NIKE', 0),
(73, '经典', 0),
(73, '板鞋', 0),
(73, '耐克', 0),
(74, 'OZZO', 0),
(74, '翻领', 0),
(74, '中长', 0),
(75, '盘扣', 0),
(75, '帽子', 0),
(75, '风衣', 0),
(76, '时尚潮流', 0),
(76, '男式', 0),
(76, '真皮', 0),
(76, '潘多拉', 0),
(77, '英伦', 0),
(77, '真皮', 0),
(77, '男士', 0),
(77, '潮流', 0),
(78, '连衣裙', 0),
(78, '职业', 0),
(80, '帆布鞋', 0),
(80, '高帮', 0),
(80, '匡威', 0),
(80, 'CONVERSE', 0),
(81, '帆布', 0),
(81, '三叶草', 0),
(81, '阿迪达斯', 0),
(81, 'adidas', 0),
(85, '春装', 0),
(85, '连衣裙', 0),
(85, '韩都衣舍', 0),
(84, '韩都衣', 0),
(84, '女装', 0),
(86, '淘淘小屋', 0),
(86, '韩版', 0),
(86, '春暖待花开', 0),
(87, '丝巾', 0),
(87, '围巾', 0),
(87, '韩国', 0),
(88, '丝巾', 0),
(88, '韩国', 0),
(89, '超长', 0),
(89, '印花', 0),
(89, '夏季', 0),
(89, '真丝', 0),
(89, '蝴蝶结', 0),
(89, '桑蚕丝', 0),
(90, '水晶', 0),
(90, '锁骨', 0),
(90, '韩国', 0),
(90, '短款', 0),
(108, '精致生活', 0),
(108, '桌垫', 0),
(108, '餐垫', 0),
(92, '落地灯', 0),
(92, '实木', 0),
(93, '太阳眼镜', 0),
(93, '女士', 0),
(93, '艾唯莎', 0),
(94, '太阳镜', 0),
(94, '时尚', 0),
(95, '蛤蟆镜', 0),
(95, '偏光', 0),
(95, '太阳镜', 0),
(95, '明星', 0),
(96, '蛤蟆镜', 0),
(96, '太阳镜', 0),
(96, '女士', 0),
(96, '欧美', 0),
(96, '明星', 0),
(96, '时尚', 0),
(97, '太阳眼镜', 0),
(97, '女士', 0),
(97, '时尚', 0),
(98, '偏光镜', 0),
(98, '太阳眼镜', 0),
(98, '女士', 0),
(98, '时尚', 0),
(100, '项链', 0),
(100, '气质', 0),
(100, 'mika', 0),
(101, '紫水晶', 0),
(101, '手链', 0),
(101, '配饰', 0),
(102, '华丽', 0),
(102, '奢华', 0),
(102, 'Tata', 0),
(103, '幸运草', 0),
(103, '项链', 0),
(104, '口红', 0),
(104, '唇膏', 0),
(109, '夏季', 0),
(106, '卡拉', 0),
(106, '布娃娃', 0),
(106, '大鼻子', 0),
(106, '娃娃', 0),
(106, '毛绒玩具', 0),
(107, '抱枕', 0),
(107, '双人', 0),
(107, '枕头', 0),
(106, '泰迪', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_shop`
--

CREATE TABLE IF NOT EXISTS `fanwe_shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(6) NOT NULL DEFAULT '0',
  `shop_name` varchar(255) DEFAULT '',
  `shop_logo` varchar(255) DEFAULT '',
  `shop_url` varchar(255) DEFAULT '',
  `recommend_count` int(11) DEFAULT '0',
  `taoke_url` varchar(255) DEFAULT '',
  `data` text,
  `sort` smallint(5) NOT NULL DEFAULT '100',
  `server_code` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`shop_id`),
  KEY `cate_id` (`cate_id`),
  KEY `recommend_count` (`recommend_count`),
  KEY `sort` (`sort`),
  KEY `shop_url` (`shop_url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- 转存表中的数据 `fanwe_shop`
--

INSERT INTO `fanwe_shop` (`shop_id`, `cate_id`, `shop_name`, `shop_logo`, `shop_url`, `recommend_count`, `taoke_url`, `data`, `sort`, `server_code`) VALUES
(17, 0, 'iyenaiyun', './bupt/public/upload/shop/2012/03/27/f55a76258e1141d18d2363a466a844bdxE07iE.jpg', 'http://shop33387092.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzdscqvRccYLLyD%2B2Fkc5PU0S9OqvFy%2B9wLVnSJdNMzA4KbcuyE23A%2FE47ARcBpewRk0II5Rcn1x3XPEYuOi3w%2Bg%3D%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:9:"娇韵诗";i:1;s:6:"金冠";i:2;s:7:"Clarins";}s:5:"goods";a:1:{i:0;s:2:"28";}}', 100, 'bupt'),
(16, 0, '柠檬绿茶化妆品', './bupt/public/upload/shop/2012/03/27/55957555a884d25d68915472ce3b4b5a84v051.jpg', 'http://shop58157442.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzdsuvD3FjJDu6W2KT3wOjb4Z1WUfJ42k6h%2FwVnhmK%2F3xj8t9rG7%2FklvLZKWcmZoAydpfjcl%2Bc%2Fdx%2Bgg0uSbBpOps%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:9:"娇韵诗";i:1;s:6:"代购";i:2;s:6:"正品";}s:5:"goods";a:1:{i:0;s:2:"26";}}', 100, 'bupt'),
(3, 0, '花心小铺(重磅回馈,全馆免邮费!)', '', 'http://shop.paipai.com/1670073379', 1, '', 'a:2:{s:4:"tags";a:3:{i:0;s:6:"手提";i:1;s:9:"单肩包";i:2;s:9:"斜挎包";}s:5:"goods";a:1:{i:0;s:1:"3";}}', 100, 'bupt'),
(4, 0, '城漫户外专营店', './bupt/public/upload/shop/2012/03/18/e527ec52ebbe6db07ae344868c0c0e5f67ZJhz.jpg', 'http://shop61838473.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcBsjS%2F6D%2FLJNAXihvk%2BXsiehG%2Bo%2BZeIScIupPRejzN%2FY8griRxQGzhFJkxsqluwDsuLLMafniNJClckIghCdEA4%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:9:"打火机";i:1;s:5:"ZIPPO";}s:5:"goods";a:1:{i:0;s:1:"4";}}', 100, 'bupt'),
(5, 0, '马克华菲官方旗舰店', './bupt/public/upload/shop/2012/03/20/56deda6a99b146941c790abb72d5f87f3Lnpn2.jpg', 'http://shop57300080.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzffMyY9e%2BPMT2RlhU9fiE1%2F1RG4792zuEw1UWu2msnNbrAy%2BQg1mNFTDQXAjg34L0P6dBX9R4%2Fk3BxAEiCTPfpw%3D%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:6:"马克";i:1;s:6:"夹克";}s:5:"goods";a:1:{i:0;s:1:"5";}}', 100, 'bupt'),
(6, 0, 'angoo旗舰店', './bupt/public/upload/shop/2012/03/20/713cff24afa06d87270bc5172bae803fqz6i1I.jpg', 'http://shop34345292.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcdtEthR4X2WVDGmJT2Lj4MvHz2CS%2BPCKpygWd8OzZS8jneG06D58RCh7j9h%2BpbQwmXOm2nCAQSU7L886YT5ZEg%3D%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:9:{i:0;s:9:"保温杯";i:1;s:6:"水杯";i:2;s:6:"韩国";i:3;s:9:"化妆袋";i:4;s:6:"帆布";i:5;s:12:"创意家居";i:6;s:6:"安家";i:7;s:6:"台灯";i:8;s:9:"多功能";}s:5:"goods";a:5:{i:0;s:2:"11";i:1;s:1:"9";i:2;s:1:"8";i:3;s:1:"7";i:4;s:1:"6";}}', 100, 'bupt'),
(7, 0, '多米乐家居旗舰店', '', 'http://shop68365757.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzc4IBU%2BWMpTeSX7022SZLqPVPtRlvAJEyMe8a3OWt5OTwrpbgY5EFwgGJOxnkNjmk4sO80tkxsPq66LFfM1yk86s%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:9:"护眼灯";i:1;s:6:"台灯";}s:5:"goods";a:1:{i:0;s:2:"10";}}', 100, 'bupt'),
(8, 0, '伊久捌柒', './bupt/public/upload/shop/2012/03/21/6a5fa5446b44297f86d7b3bcba4453dd4tyX4N.jpg', 'http://shop68680446.taobao.com', 1, '', 'a:2:{s:4:"tags";a:3:{i:0;s:6:"清仓";i:1;s:6:"板鞋";i:2;s:12:"时尚潮流";}s:5:"goods";a:1:{i:0;s:2:"12";}}', 100, 'bupt'),
(9, 0, '竺影听风', './bupt/public/upload/shop/2012/03/23/dd2557b0e1205fa544027319ad2a5cf3YbZPeF.jpg', 'http://shop59321525.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzdslHX%2BUAFJW2exDHCkjt24u9Nj8EYsh%2Bagr4aMcYlsoTHgww1dPghnV4mxBlqYwB8%2Fv65Ag854vEClqLu2BZots%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:6:"包包";i:1;s:6:"女包";i:2;s:6:"复古";}s:5:"goods";a:1:{i:0;s:2:"13";}}', 100, 'bupt'),
(10, 0, 'thefaceshop官方店', './bupt/public/upload/shop/2012/03/23/e478e1300dff0a9b7c3339674c5dd206DgV21Q.jpg', 'http://shop61963638.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcBqVjJNL73q4ebjCsnI9zbxFNds5v69RlZsO9ze2q7v3rYt7svkUsfpyp2X17ZiJdMkpA2q%2FVL5sog8yDgqkH68%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:6:"套装";i:1;s:9:"爽肤水";i:2;s:6:"补水";i:3;s:9:"混合性";}s:5:"goods";a:1:{i:0;s:2:"14";}}', 100, 'bupt'),
(11, 0, '杜尚演绎旗舰店', '', 'http://shop69185013.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzc4HI0X7Hq89ZF9IJ2fIQUNSMmfRXLEnoApIqWeIGnwdUHNmjvIqqo5sWn69Reewe8NJUQC5GORVhHkGzMqUxPlA%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:6:"夹克";i:1;s:6:"男装";i:2;s:6:"修身";i:3;s:6:"春装";}s:5:"goods";a:1:{i:0;s:2:"16";}}', 100, 'bupt'),
(12, 0, '顶慕服饰旗舰店', '', 'http://shop68350399.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzc4IBX3%2Bv8r39Jd7OgBl%2F7yhhmZzlXpLqG2oTzSH4xJ6i67kqSkikedXFfte3dUFhItTIm0zVddF7q8%2Fn%2F6WC0L8%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:6:"背心";i:1;s:6:"女装";i:2;s:6:"连帽";i:3;s:6:"马甲";}s:5:"goods";a:1:{i:0;s:2:"19";}}', 100, 'bupt'),
(13, 0, '佰利丝', '', 'http://shop.paipai.com/124592249', 1, '', 'a:2:{s:4:"tags";a:3:{i:0;s:6:"裙子";i:1;s:6:"短裙";i:2;s:9:"半身裙";}s:5:"goods";a:1:{i:0;s:2:"22";}}', 100, 'bupt'),
(14, 0, '靓衣秀时尚女装', '', 'http://shop.paipai.com/305271388', 1, '', 'a:2:{s:4:"tags";a:3:{i:0;s:6:"韩版";i:1;s:9:"半身裙";i:2;s:9:"百褶裙";}s:5:"goods";a:1:{i:0;s:2:"23";}}', 100, 'bupt'),
(15, 0, '三点水磨坊', './bupt/public/upload/shop/2012/03/25/970adf08ece1452d7ecbbdc2adda9569xkZuty.jpg', 'http://shop58132934.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzdZ1ZcK0CdZ%2Fmvf2KM5XLP6ttc2AiDGnvuvqkqAZX1de05m3X37k3rZ5a3xuIgNlAR9jYLpeoZaIlC%2BgTNKCeQTc%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:6:"春夏";i:1;s:9:"雪纺衫";i:2;s:6:"女装";}s:5:"goods";a:1:{i:0;s:2:"24";}}', 100, 'bupt'),
(18, 0, '87tianjing', './bupt/public/upload/shop/2012/03/28/ce5bb0cc83088e26c699090a1797878c8s9NFE.jpg', 'http://shop58532515.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcBExE2QeyHDL6RlRaTGS8CaWblFmbeu5t0JR%2BadpFGrTgI3Pf6KIMdCtmZLZx7K0pzfQPKOlJu22l5mgBBgi0Q%3D%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:9:"连衣裙";i:1;s:6:"雪纺";i:2;s:6:"春装";}s:5:"goods";a:1:{i:0;s:2:"29";}}', 100, 'bupt'),
(19, 0, '北京路分店', '', 'http://shop62056554.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcBqZ%2Brltc1GQle6kgfwKaTk6ChIxMlM0WzMwmt4T7uneOQwZUk7VWx8%2Bx5tRL9UtY36pvGTX2%2FTfJ726hNr%2BAQw%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:9:"打底裤";i:1;s:6:"春装";i:2;s:6:"牛仔";}s:5:"goods";a:1:{i:0;s:2:"36";}}', 100, 'bupt'),
(20, 0, '彤彤上海商城', '', 'http://shop60774701.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzd%2BqZKQEXISTylTElrEsLzyJvgu2hJkK%2B14nciOTT6EwVl8sOi1%2BTDSQdKAO3ws41EVfU9tCbx1Jn5MZnAIr%2Btsg%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:9:"天鹅绒";i:1;s:9:"打底裤";}s:5:"goods";a:1:{i:0;s:2:"37";}}', 100, 'bupt'),
(21, 0, 'yinbangjie', './bupt/public/upload/shop/2012/03/29/22cfb33e978610b034a6a03e9c63534aCQkguK.jpg', 'http://shop33262898.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzdsuvAODCzR3IVxIDvmd9y6qa6EqdMVltxiopBS6eE%2B5XWe0KAsDMrtnXycSCd5QGlPddlPS%2F9hT0BXKQAHEMIg%3D%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:9:"小脚裤";i:1;s:9:"铅笔裤";i:2;s:9:"打底裤";i:3;s:6:"春装";}s:5:"goods";a:1:{i:0;s:2:"38";}}', 100, 'bupt'),
(22, 0, '依5依6', './bupt/public/upload/shop/2012/03/29/167e07e19eafb74b67d7777cd7f5da35ktkKRc.jpg', 'http://shop64541817.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcg3F6FJynAQv7oy%2FO6nHL%2Fn13mYZStXUl9bmGoxKnQRFPrj6zCwCkCou%2BInkfIWEpa%2Fs1btn0DA%2FJM34gGG%2Fw4U%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:9:"打底裤";i:1;s:6:"长裤";i:2;s:9:"铅笔裤";i:3;s:6:"春装";}s:5:"goods";a:1:{i:0;s:2:"39";}}', 100, 'bupt'),
(23, 0, 'magic_liyan', '', 'http://shop59703295.taobao.com', 1, '', 'a:2:{s:4:"tags";a:3:{i:0;s:9:"打底裤";i:1;s:6:"水洗";i:2;s:6:"小脚";}s:5:"goods";a:1:{i:0;s:2:"40";}}', 100, 'bupt'),
(24, 0, 'gagagrunge', './bupt/public/upload/shop/2012/03/29/42d7020ac37a06625f3d5deba2e083c4F6mgEc.jpg', 'http://shop34624696.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzds58Kt3HkQYt0j6P8u8hps6H9GhE2jTQAx95POsEAX3fIfFIKpIvrz1hP58CZQw2HjmBTjuqMBsENe5s01Qycg%3D%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:9:"打底裤";i:1;s:6:"春夏";i:2;s:6:"裙裤";}s:5:"goods";a:1:{i:0;s:2:"41";}}', 100, 'bupt'),
(25, 0, 'can8y', '', 'http://shop60417792.taobao.com', 1, '', 'a:2:{s:4:"tags";a:2:{i:0;s:6:"甜美";i:1;s:6:"韩国";}s:5:"goods";a:1:{i:0;s:2:"42";}}', 100, 'bupt'),
(26, 0, 'ozzo旗舰店', '', 'http://shop63321457.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcdp8KQMVnhD9g%2FYy5UKpiVxLZqqR6T6W99JhtPdaLppwo8fw4Mg5CKwwBE5%2FAoDnArTzk%2BrMWKTmq7wseUeCEo0%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:4:"OZZO";i:1;s:6:"翻领";i:2;s:6:"中长";}s:5:"goods";a:1:{i:0;s:2:"44";}}', 100, 'bupt'),
(27, 0, '裂帛服饰旗舰店', '', 'http://shop58014452.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzds2TP5L9xWtWHuo0VVsVIBXXvdzzAd9R0fcfaoH6tE8xNSN%2Fl9tUnkTXHOFViuXqxIfF1jaZ8vl3g%2Fs7pAhdyFg%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:6:"盘扣";i:1;s:6:"帽子";i:2;s:6:"风衣";}s:5:"goods";a:1:{i:0;s:2:"45";}}', 100, 'bupt'),
(28, 0, 'mring官方旗舰店', './bupt/public/upload/shop/2012/03/29/a15bfc2884da903189a2ebc439b937da9v9439.jpg', 'http://shop65883828.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcgNe2NCPetKPtD0hDa8RtKqcxPx5uJjwMLuzFnd463qPVUcTjKLwHYw%2FFKUpHQa8BVK%2Fkvwt3tPDkjZo6sM02Xk%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:12:"时尚潮流";i:1;s:6:"男式";i:2;s:6:"真皮";i:3;s:9:"潘多拉";}s:5:"goods";a:1:{i:0;s:2:"46";}}', 100, 'bupt'),
(29, 0, '安步当马泉州专卖店', '', 'http://shop62050857.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcB3D2RwlQgx7nOxaR7Yfni1D5ZXqSgBBtqa3uIUPkGM8lmIIf5bRlTMgEdz0zNeTh6OT8LGMiV3NwHY1bEi42Zs%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:6:"英伦";i:1;s:6:"真皮";i:2;s:6:"男士";i:3;s:6:"潮流";}s:5:"goods";a:1:{i:0;s:2:"47";}}', 100, 'bupt'),
(30, 0, '都市丽人～韩版女装专营店', '', 'http://shop.paipai.com/986114551', 1, '', 'a:2:{s:4:"tags";a:2:{i:0;s:9:"连衣裙";i:1;s:6:"职业";}s:5:"goods";a:1:{i:0;s:2:"48";}}', 100, 'bupt'),
(31, 0, '亦枫时尚女装', '', 'http://shop.paipai.com/847694135', 0, '', 'a:2:{s:4:"tags";a:0:{}s:5:"goods";a:0:{}}', 100, 'bupt'),
(32, 0, '名冠运动品牌专营店', '', 'http://shop57299926.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzffMxPNBiEw7KtGc9X0AO%2Bj758l9WPcDcgO2QCgkZd82jwL1bQvYCu18rNzvWAMHL38WHEDekT1GpKUpwvmD5yA%3D%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:9:"帆布鞋";i:1;s:6:"高帮";i:2;s:6:"匡威";i:3;s:8:"CONVERSE";}s:5:"goods";a:1:{i:0;s:2:"50";}}', 100, 'bupt'),
(33, 0, 'myc潮流运动专营店', './bupt/public/upload/shop/2012/03/31/e333e8ec31ba7317420bfdfa06751cbd2jxg2j.jpg', 'http://shop57300839.taobao.com', 1, '', 'a:2:{s:4:"tags";a:4:{i:0;s:6:"帆布";i:1;s:9:"三叶草";i:2;s:12:"阿迪达斯";i:3;s:6:"adidas";}s:5:"goods";a:1:{i:0;s:2:"51";}}', 100, 'bupt'),
(34, 0, 'top运动名品专营店', './bupt/public/upload/shop/2012/03/31/9c80152af524eba47be233add455cf37AAPap1.jpg', 'http://shop57301866.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzdZIm6XPDhK25K8AYRiOiARR61sxU6by8%2BfzxUlgjFi%2FAmaR%2Fs5dIAKL0WaavN1LLOcs91Hb%2Fn4G7eYsE0MRBbo8%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:0:{}s:5:"goods";a:1:{i:0;s:2:"52";}}', 100, 'bupt'),
(35, 0, '美美淘店铺', './bupt/public/upload/shop/2012/04/01/24c5a0d80fb7864f40c07ddc1884433f4IN991.jpg', 'http://shop70375150.taobao.com', 0, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzfPH68go0R7ii6Vo3Hzykpsk%2FL3bzRlHfsugThVy0cWRB9tluxKEwQTpABObelYCuZsSkjxVsAm%2BjO7ELAH2pHaQ%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:0:{}s:5:"goods";a:0:{}}', 100, 'bupt'),
(37, 0, 'carus_top', '', 'http://shop62677278.taobao.com', 1, '', 'a:2:{s:4:"tags";a:3:{i:0;s:12:"淘淘小屋";i:1;s:6:"韩版";i:2;s:15:"春暖待花开";}s:5:"goods";a:1:{i:0;s:2:"56";}}', 100, 'bupt'),
(36, 0, '韩都衣舍旗舰店', './bupt/public/upload/shop/2012/04/01/0a022106bb52eb463f7b44b3c925283bVyydYA.jpg', 'http://shop58501945.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzdslMRXvXtSOvt%2BQVgfU%2Bj6N30sbQkmXChid%2B%2B4i11x836Ca4XWy%2BcdLiRPYBSpgyk%2FACvH4lziHoO2mwue4rkT4%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:9:"韩都衣";i:1;s:6:"女装";}s:5:"goods";a:1:{i:0;s:2:"54";}}', 100, 'bupt'),
(38, 0, '美瑞贝尔', '', 'http://shop758128.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzc4P46qYsCU09F3eUmy%2BEZL9MKI5qGXQUNERvWp%2BOvRzaTvgWKE6BGvtWMqW2W6jyV6ggXZYGJ2KNY3oZZMM%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:6:"丝巾";i:1;s:6:"围巾";i:2;s:6:"韩国";}s:5:"goods";a:1:{i:0;s:2:"57";}}', 100, 'bupt'),
(39, 0, '谢少影kkz', '', 'http://shop36067682.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzdZRIu%2BMPpoxf3jgb8IfUybWF9dJAxrwrZq7acZlkLLUySvcX7ugkr8AN3QToehQYHmyp3jeqJ3nqiA%2FbC03v9gI%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:6:"丝巾";i:1;s:6:"韩国";}s:5:"goods";a:1:{i:0;s:2:"58";}}', 100, 'bupt'),
(40, 0, 'liutianrui', '', 'http://shop33638551.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzdZdFprpQkewmz%2BZm6hNkAO1xqCwrOwwQrUqTUXmft4lWbz03knDYSu7fxOLEXoGOrDFPTf9OB2cr%2FXf2uBNsAQ%3D%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:6:{i:0;s:9:"蝴蝶结";i:1;s:6:"超长";i:2;s:9:"桑蚕丝";i:3;s:6:"印花";i:4;s:6:"夏季";i:5;s:6:"真丝";}s:5:"goods";a:1:{i:0;s:2:"59";}}', 100, 'bupt'),
(41, 0, '胡建熠', './bupt/public/upload/shop/2012/04/06/30f506beca956c66629a97b87b83334embmdy7.jpg', 'http://shop64170927.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzd%2BTuL4eYC%2FJW4bu1IuUsdoUFHXhYUr8P5DbgTjHTgichUwGz2QU3ks6jxN0Gd6%2B76JYIkkVaN37LVHZYTf%2Fhl%2BM%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:6:"水晶";i:1;s:6:"锁骨";i:2;s:6:"韩国";i:3;s:6:"短款";}s:5:"goods";a:1:{i:0;s:2:"60";}}', 100, 'bupt'),
(42, 0, '麦灯灯家居专营店', '', 'http://shop64353796.taobao.com', 0, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcg5TzhONq7IcknEqrqibVbVcsO5uzTvBJ5fzfGW9LEpTHd2rNNoHDnYHSUYB7rsVwhieKLvadQHfl0up7jYQdHk%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:0:{}s:5:"goods";a:0:{}}', 100, 'bupt'),
(43, 0, 'cherryche301', '', 'http://shop35149266.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzc4Pw5oMIxv5MvwGWRTHUbR6s8XyPaltUHdT%2FjAdHInZlv%2FTitEG3gbk6RKB83rb0hGo77AlSuEhMBplH4pEWSA%3D%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:9:"落地灯";i:1;s:6:"实木";}s:5:"goods";a:1:{i:0;s:2:"62";}}', 100, 'bupt'),
(44, 0, '艾唯莎旗舰店', './bupt/public/upload/shop/2012/04/07/7a1f633d40860679b2eb015889f7f28drPZ64m.jpg', 'http://shop69873417.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzfPN1YjSc3JsZF%2BXAYrb%2FdMzTmml7pcwMzpmReGX42JVQDnNK3z2rINm8km7WUAGTRCUjmC8C6wmg0YPRV2Uxb4w%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:12:"太阳眼镜";i:1;s:6:"女士";i:2;s:9:"艾唯莎";}s:5:"goods";a:1:{i:0;s:2:"63";}}', 100, 'bupt'),
(45, 0, '沐光户外专营店', '', 'http://shop67530947.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzc4TIuSYDH7tGXj%2Ffcrgqz26mUJZVnvZPq7l7AQ%2FDd77Hw4vUsQHvgDY8BgPBIntrBwzxTvORXCsvzTiGxPeOk90%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:9:"太阳镜";i:1;s:6:"时尚";}s:5:"goods";a:1:{i:0;s:2:"64";}}', 100, 'bupt'),
(46, 0, '海峡工作室', './bupt/public/upload/shop/2012/04/07/57259e3f0fb2298638bee77ce63a50bd7e0Qk6.jpg', 'http://shop63728758.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzd%2BqfawVshnWhSdnbXZfX8YE%2B4YHsvb4GVXdeBHNL5tYN00sL%2FptKiCbqrIqxwfKA6q09wTLaE8zn1JuzV4X6oq8%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:9:"蛤蟆镜";i:1;s:6:"偏光";i:2;s:9:"太阳镜";i:3;s:6:"明星";}s:5:"goods";a:1:{i:0;s:2:"65";}}', 100, 'bupt'),
(47, 0, '俞小平2420', '', 'http://shop62739045.taobao.com', 1, '', 'a:2:{s:4:"tags";a:6:{i:0;s:6:"明星";i:1;s:9:"蛤蟆镜";i:2;s:6:"时尚";i:3;s:9:"太阳镜";i:4;s:6:"女士";i:5;s:6:"欧美";}s:5:"goods";a:1:{i:0;s:2:"66";}}', 100, 'bupt'),
(48, 0, '文翔户外专营店', '', 'http://shop60174190.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzd%2BdLnnlOOil1Gcd%2F8lUvXfPxWaSaITOA0txNxCD5aqCLSM9PXY%2B2tLM0Bt8kICJwRt6pyAZt69ySSuz85qi%2FAXA%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:12:"太阳眼镜";i:1;s:6:"女士";i:2;s:6:"时尚";}s:5:"goods";a:1:{i:0;s:2:"67";}}', 100, 'bupt'),
(49, 0, 'e度_空间', '', 'http://shop60405786.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzdshjZnERoM54BR2ly6UABx7yCFpkihpAxy7VI8VoxnVpuDa0gTuS1l6QL1dLfEkVKuIsseQDfYqDt7iTeCjSZz4%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:4:{i:0;s:9:"偏光镜";i:1;s:12:"太阳眼镜";i:2;s:6:"女士";i:3;s:6:"时尚";}s:5:"goods";a:1:{i:0;s:2:"68";}}', 100, 'bupt'),
(50, 0, '米米爱王菲', '', 'http://shop58097501.taobao.com', 0, '', 'a:2:{s:4:"tags";a:0:{}s:5:"goods";a:0:{}}', 100, 'bupt'),
(51, 0, 'qlady旗舰店', '', 'http://shop63410949.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcgt7pdci%2BKB4uqhUsHcCm4F%2FkMP%2BVY7fhceYlL%2B9gUPEjgU%2BJYT%2Bq2UHk9l8kWx9IQtmlg3JlUVbnT9MHqeYZFI%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:9:"紫水晶";i:1;s:6:"手链";i:2;s:6:"配饰";}s:5:"goods";a:1:{i:0;s:2:"70";}}', 100, 'bupt'),
(52, 0, '他她官方旗舰店', '', 'http://shop60014227.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzd%2BdP5BSokTbzUDND72fwgenhyXw%2FmKQxmY8QBU1aS9ufCRMQzPQX%2Fifr3h4erA8wjs8Hu%2FwV81I320wPyuvbRIo%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:3:{i:0;s:6:"华丽";i:1;s:6:"奢华";i:2;s:4:"Tata";}s:5:"goods";a:1:{i:0;s:2:"71";}}', 100, 'bupt'),
(53, 0, '小宇宙u_b', '', 'http://shop60969474.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzd%2BqYN6YOQmE3A%2F1DCJ7FeOXL%2BtgClH3uUNsJMAKC8gap9TvD%2FqdjGEr%2BmUOONB4mQVGagWSdtCuHoLBvIhq%2FKMM%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:9:"幸运草";i:1;s:6:"项链";}s:5:"goods";a:1:{i:0;s:2:"72";}}', 100, 'bupt'),
(54, 0, '素野官方旗舰店', '', 'http://shop68033612.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzc4UE0NnCKBh5MeJwRDan8D0jtcAn7TTCuJ4KUIYBH0LvRToyIJsE2ctrvHrctmQeUnTUDsJWKlYsZioTR0dV5a0%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:6:"口红";i:1;s:6:"唇膏";}s:5:"goods";a:1:{i:0;s:2:"73";}}', 100, 'bupt'),
(57, 0, 'll19878140', './bupt/public/upload/shop/2012/04/08/1ad284d6c5c3b0fa94bb0c3853a09ba3Tf54Ry.jpg', 'http://shop59685730.taobao.com', 1, '', 'a:2:{s:4:"tags";a:4:{i:0;s:6:"碎花";i:1;s:12:"精致生活";i:2;s:6:"桌垫";i:3;s:6:"餐垫";}s:5:"goods";a:1:{i:0;s:2:"77";}}', 100, 'bupt'),
(55, 0, '朱大王07', './bupt/public/upload/shop/2012/04/08/5a4833ce0a203e0528595808044bdc1f8tRGRv.jpg', 'http://shop34896806.taobao.com', 0, '', 'a:2:{s:4:"tags";a:0:{}s:5:"goods";a:0:{}}', 100, 'bupt'),
(56, 0, '卡拉梦旗舰店', './bupt/public/upload/shop/2012/04/08/773aa37ea7b779d7dac3c911f766cf9dlwrlRA.jpg', 'http://shop64976488.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcgyf9YZhhdzthMFtd4QHXhST9GzcfxRlzvNKHyCnzU5OQqsddbcxaYd7%2FdxpChTn%2B6ErrREWqBQp2pgBm%2F61MjU%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:6:{i:0;s:9:"大鼻子";i:1;s:9:"布娃娃";i:2;s:6:"卡拉";i:3;s:12:"毛绒玩具";i:4;s:6:"泰迪";i:5;s:6:"娃娃";}s:5:"goods";a:1:{i:0;s:2:"75";}}', 100, 'bupt'),
(58, 0, '郎沈剑', './bupt/public/upload/shop/2012/04/08/4dcf25d78669e2d8eb05b485051373fcoURkZt.jpg', 'http://shop33981650.taobao.com', 1, 'http://s.click.taobao.com/t_8?e=7HZ5x%2BOzcBE6FoRmYjOkSfOAIfrtSh1jYyAolFddtGoUmz8xsNy2jtOaEgXSBcWFTxQzNRe3eU4SpJwCkB6n%2FYKErWFd4Q%3D%3D&p=mm_18381334_0_0&n=19', 'a:2:{s:4:"tags";a:2:{i:0;s:6:"夏季";i:1;s:9:"连衣裙";}s:5:"goods";a:1:{i:0;s:2:"78";}}', 100, 'bupt');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_shop_category`
--

CREATE TABLE IF NOT EXISTS `fanwe_shop_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) DEFAULT NULL,
  `name` varchar(100) DEFAULT '',
  `sort` smallint(5) DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `fanwe_shop_category`
--

INSERT INTO `fanwe_shop_category` (`id`, `parent_id`, `name`, `sort`) VALUES
(1, 0, '风格', 100),
(2, 0, '看点', 100),
(3, 1, '日韩杂志款', 100),
(4, 1, '小清新混搭', 100),
(5, 1, '欧美高街', 100),
(6, 1, '休闲混搭', 100),
(7, 2, '外贸原单', 100),
(8, 2, '潮流女鞋', 100),
(9, 2, '流行饰品', 100),
(10, 2, '包包手袋', 100),
(11, 2, '手套配件', 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_style_category`
--

CREATE TABLE IF NOT EXISTS `fanwe_style_category` (
  `cate_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) DEFAULT '0',
  `cate_name` varchar(80) DEFAULT '',
  `short_name` varchar(60) NOT NULL DEFAULT '',
  `desc` varchar(255) DEFAULT '',
  `sort` smallint(6) NOT NULL DEFAULT '100',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_fix` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `fanwe_style_category`
--

INSERT INTO `fanwe_style_category` (`cate_id`, `parent_id`, `cate_name`, `short_name`, `desc`, `sort`, `status`, `is_fix`) VALUES
(1, 0, '搭配秀', 'show time！', '', 100, 1, 1),
(2, 0, '晒　货', '晾晾"烧瓶"战利', '', 100, 1, 1),
(3, 0, '精选搭配', '每日更新网友时尚搭配', '', 100, 1, 1),
(4, 1, '热力单品', '热力单品', '', 100, 1, 0),
(5, 1, '摩登风潮', '摩登风潮', '', 100, 1, 0),
(6, 1, '根据地', '根据地', '', 100, 1, 0),
(7, 1, 'The Moment', 'The Moment', '', 100, 1, 0),
(8, 2, '任意门', '任意门', '', 100, 1, 0),
(9, 2, '"耍"大牌', '"耍"大牌', '', 100, 1, 0),
(10, 2, '数码控', '数码控', '', 100, 1, 0),
(11, 2, '隔壁女生的百宝箱', '隔壁女生的百宝箱', '', 100, 1, 0),
(12, 3, 'Style', 'Style', '', 100, 1, 0),
(13, 3, 'Area', 'Area', '', 100, 1, 0),
(14, 3, 'Element', 'Element', '', 100, 1, 0),
(15, 3, 'Item', 'Item', '', 100, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_style_category_tags`
--

CREATE TABLE IF NOT EXISTS `fanwe_style_category_tags` (
  `cate_id` smallint(6) NOT NULL,
  `tag_id` smallint(6) NOT NULL,
  `sort` smallint(5) NOT NULL DEFAULT '100',
  KEY `cate_id` (`cate_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_style_category_tags`
--

INSERT INTO `fanwe_style_category_tags` (`cate_id`, `tag_id`, `sort`) VALUES
(4, 749, 100),
(4, 294, 100),
(4, 750, 100),
(4, 295, 100),
(4, 16, 100),
(4, 323, 100),
(4, 408, 100),
(4, 22, 100),
(4, 296, 100),
(4, 298, 100),
(4, 18, 100),
(4, 751, 100),
(4, 425, 100),
(4, 384, 100),
(4, 362, 100),
(4, 23, 100),
(4, 98, 100),
(4, 151, 100),
(5, 752, 100),
(5, 8, 100),
(5, 753, 100),
(5, 2, 100),
(5, 1, 100),
(5, 60, 100),
(5, 5, 100),
(5, 754, 100),
(5, 36, 100),
(5, 32, 100),
(5, 6, 100),
(5, 7, 100),
(6, 755, 100),
(6, 756, 100),
(6, 757, 100),
(6, 758, 100),
(6, 759, 100),
(6, 760, 100),
(6, 761, 100),
(6, 762, 100),
(6, 763, 100),
(6, 764, 100),
(6, 765, 100),
(6, 766, 100),
(7, 767, 100),
(7, 768, 100),
(7, 4, 100),
(7, 769, 100),
(7, 770, 100),
(7, 771, 100),
(7, 772, 100),
(8, 773, 100),
(8, 774, 100),
(8, 775, 100),
(8, 776, 100),
(8, 777, 100),
(8, 778, 100),
(8, 779, 100),
(9, 191, 100),
(9, 231, 100),
(9, 780, 100),
(9, 781, 100),
(9, 782, 100),
(9, 783, 100),
(9, 784, 100),
(10, 785, 100),
(10, 287, 100),
(10, 786, 100),
(11, 510, 100),
(11, 61, 100),
(11, 46, 100),
(11, 787, 100),
(11, 788, 100),
(11, 265, 100),
(11, 789, 100),
(11, 790, 100),
(11, 791, 100),
(11, 792, 100),
(12, 1, 100),
(12, 8, 100),
(12, 6, 100),
(12, 2, 100),
(12, 7, 100),
(12, 71, 100),
(12, 5, 100),
(12, 72, 100),
(12, 69, 100),
(12, 753, 100),
(13, 757, 100),
(13, 758, 100),
(13, 755, 100),
(13, 793, 100),
(13, 794, 100),
(13, 756, 100),
(13, 759, 100),
(13, 760, 100),
(13, 795, 100),
(13, 761, 100),
(13, 796, 100),
(13, 797, 100),
(13, 798, 100),
(13, 766, 100),
(13, 799, 100),
(14, 36, 100),
(14, 32, 100),
(14, 166, 100),
(14, 800, 100),
(14, 65, 100),
(14, 801, 100),
(14, 64, 100),
(14, 102, 100),
(14, 85, 100),
(15, 749, 100),
(15, 59, 100),
(15, 408, 100),
(15, 23, 100),
(15, 299, 100),
(15, 16, 100),
(15, 802, 100),
(15, 14, 100),
(15, 24, 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sys_conf`
--

CREATE TABLE IF NOT EXISTS `fanwe_sys_conf` (
  `name` varchar(80) NOT NULL DEFAULT '',
  `val` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `list_type` tinyint(1) NOT NULL COMMENT '0:手动输入 1:单选 2:下拉 3:文本域 4:图像',
  `val_arr` varchar(255) NOT NULL COMMENT '可选的值的集合。序列化存放',
  `group_id` tinyint(2) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `is_js` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_sys_conf`
--

INSERT INTO `fanwe_sys_conf` (`name`, `val`, `status`, `sort`, `list_type`, `val_arr`, `group_id`, `is_show`, `is_js`) VALUES
('SITE_NAME', '时尚搭配', 1, 1, 0, '', 1, 1, 0),
('SITE_TITLE', '时尚搭配购物分享', 1, 2, 0, '', 1, 1, 0),
('SITE_KEYWORDS', '时尚搭配,搭配购物,购物分享,时尚搭配购物分享,淘宝,淘宝网购物,网上购物,网购', 1, 12, 3, '', 1, 1, 0),
('SITE_DESCRIPTION', '想低价可靠地在网上购买最新最时尚最潮流的衣服，鞋子，包包等正品吗？想知道东西质量怎么样？想知道潮人是怎么搭配的吗？翻东西社会化电商导购社区，和网购达人一起快速发现最靠谱的正品淘宝网店并分享购物经验。星座时尚搭配购物分享是一个纯买家社区，百万网友一起淘宝网购物，挖掘好店、分享网购，您可以获得最可靠的店铺排行和淘宝网购物分享。', 1, 13, 3, '', 1, 1, 0),
('SITE_TMPL', 'pink2', 1, 6, 2, '', 1, 1, 0),
('SYS_ADMIN', 'admin', 1, 7, 0, '', 1, 1, 0),
('SITE_LOGO', './logo.gif', 1, 3, 4, '', 1, 1, 0),
('FOOTER_HTML', '<p>\r\n	版权所有&copy; cheerfly.com 时尚搭配</p>\r\n<script type="text/javascript">\r\nvar _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");\r\ndocument.write(unescape("%3Cscript src=''" + _bdhmProtocol + "hm.baidu.com/h.js%3F3b7521fde8818cdd765c8580636a22dc'' type=''text/javascript''%3E%3C/script%3E"));\r\n</script>', 1, 14, 5, '星座时尚搭配购物分享系统 系统版本：v2.1版权所有© 星座时尚搭配', 1, 1, 0),
('SECOND_ARTICLES', '    当您点击“我接受以上条款，确定”，即表示您已经充分了解并同意接受以下条款（而无论您是否已经注册为会员）：\r\n    1. 二手闲置交易信息发布公告板（即本页，下称本服务）是为网友提供的一项公益性质信息服务，我们不参与任何交易过程，也不对任何交易信息的真实性负责；\r\n    2. 本服务仅供网友发布二手闲置交易信息，不允许发布任何批量贩卖、代购等信息。不欢迎专业卖家和电商在此发布信息。\r\n    3. 发布交易信息请遵守国家及当地的法律、法规，不发布任何有可能影响网站平台安全的信息（包括但不限于武器、毒品、淫秽等信息）。我们保留无理由随时删除任何交易信息的权利。\r\n    4. 交易双方在交易前请充分沟通，交易过程请尽可能选择“支付宝担保交易”服务或同城见面交易。网站不对任何交易后果（包括担不限于财物损失）负责，也不承担任何连带责任，所有交易后果由交易双方独自承担。', 1, 0, 0, '', 7, 0, 0),
('EXPIRED_TIME', '3600', 1, 8, 0, '', 1, 1, 0),
('SYS_VERSION', '2.11', 1, 10, 0, '', 1, 0, 0),
('TIME_ZONE', '8', 1, 9, 0, '', 1, 1, 0),
('DEFAULT_LANG', 'zh-cn', 1, 10, 2, '', 1, 1, 0),
('APP_LOG', '1', 1, 11, 2, '0,1', 1, 1, 0),
('FOOT_LOGO', './foot_logo.gif', 1, 4, 4, '', 1, 1, 0),
('LINK_LOGO', './link_logo.gif', 1, 5, 4, '', 1, 1, 0),
('BG_COLOR', '#ffffff', 1, 10, 0, '', 2, 1, 0),
('MAX_UPLOAD', '2048', 1, 10, 0, '', 2, 1, 0),
('ALLOW_UPLOAD_EXTS', 'jpg,gif,png,jpeg', 1, 10, 0, '', 2, 1, 0),
('WATER_MARK', '1', 1, 10, 1, '0,1', 2, 1, 0),
('BIG_WIDTH', '500', 1, 10, 0, '', 2, 1, 0),
('BIG_HEIGHT', '0', 1, 10, 0, '', 2, 1, 0),
('SMALL_WIDTH', '200', 1, 10, 0, '', 2, 1, 0),
('SMALL_HEIGHT', '0', 1, 10, 0, '', 2, 1, 0),
('WATER_IMAGE', '', 1, 10, 4, '', 2, 1, 0),
('WATER_POSITION', '5', 1, 10, 2, '1,2,3,4,5', 2, 1, 0),
('WATER_ALPHA', '50', 1, 10, 0, '', 2, 1, 0),
('AUTO_GEN_IMAGE', '0', 1, 10, 2, '0,1', 2, 1, 0),
('URL_MODEL', '1', 1, 10, 2, '0,1', 1, 1, 0),
('SECOND_TAOBAO_SIGN', '5ztd0d1dx8lq0mf0gz5lrqj1n2pxv0p9', 1, 0, 0, '', 7, 0, 0),
('SECOND_TAOBAO_FORUMID', '2088102007672902', 1, 0, 0, '', 7, 0, 0),
('SITE_SERVICE_EMAIL', 'service@cheerfly.com', 1, 9, 0, '', 1, 1, 0),
('SHARE_GOODS_COUNT', '3', 1, 10, 0, '', 3, 1, 1),
('SHARE_PIC_COUNT', '3', 1, 10, 0, '', 3, 1, 1),
('SHARE_TAG_COUNT', '10', 1, 10, 0, '', 3, 1, 1),
('SMTP_SERVER', '', 1, 10, 0, '', 5, 1, 0),
('SMTP_PORT', '25', 1, 10, 0, '', 5, 1, 0),
('SMTP_ACCOUNT', '', 1, 10, 0, '', 5, 1, 0),
('SMTP_PASSWORD', '', 1, 10, 0, '', 5, 1, 0),
('SMTP_IS_SSL', '0', 1, 10, 1, '0,1', 5, 1, 0),
('SMTP_AUTH', '1', 1, 10, 1, '0,1', 5, 1, 0),
('INTEGRATE_CODE', 'fanwe', 1, 0, 0, '', 0, 0, 0),
('INTEGRATE_CONFIG', 'a:14:{s:5:"uc_id";s:1:"2";s:6:"uc_key";s:64:"d1Pft6mdz5Wdq6fcS6G536P5B9P0mb86o9i7q8Bfw6p6mdS9t3nfz768f2ves0F8";s:6:"uc_url";s:30:"http://localhost/bbs/uc_server";s:5:"uc_ip";s:0:"";s:10:"uc_connect";s:4:"post";s:10:"uc_charset";s:5:"utf-8";s:7:"db_host";s:9:"localhost";s:7:"db_user";s:4:"root";s:7:"db_name";s:6:"discuz";s:7:"db_pass";s:0:"";s:6:"db_pre";s:7:"cdb_uc_";s:10:"db_charset";s:4:"utf8";s:13:"cookie_domain";s:0:"";s:11:"cookie_path";s:1:"/";}', 1, 0, 0, '', 0, 0, 0),
('INTEGRATE_FIELD_ID', 'uid', 1, 0, 0, '', 0, 0, 0),
('USER_IS_MEDAL', '1', 1, 10, 2, '0,1', 6, 0, 0),
('USER_AGREEMENT', '<p>\r\n	&nbsp;</p>\r\n<h4 class="f14 c" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; text-align: center; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	cheerfly（cheerfly.com）服务条款</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	cheerfly通过互联网服务为您和您的朋友提供一种全新的在线社交方式，您只有完全同意下列所有服务条款并完成注册程序，才能成为cheerfly的用户并使用相应服务。您在使用cheerfly提供的各项服务之前，应仔细阅读本用户协议。 您在注册程序过程中点击&ldquo;同意条款，立即注册&rdquo;按钮即表示您与cheerfly达成协议，完全接受本服务条款项下的全部条款。您一旦使用cheerfly的服务，即视为您已了解并完全同意本服务条款各项内容，包括cheerfly对服务条款随时做的任何修改。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	一．服务内容</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	cheerfly的具体服务内容由cheerfly根据实际情况提供，例如微博客服务、照片上传功能、在线交流、逛逛软件等。美丽说保留变更、中断或终止部分网络服务的权利。cheerfly保留根据实际情况随时调整cheerfly平台提供的服务种类、形式。cheerfly不承担因业务调整给用户造成的损失。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	二．内容使用</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	我们鼓励用户充分利用cheerfly平台自由地张贴和共享他们自己的信息。您可以自由张贴从cheerfly个人主页或其他网站复制的图片等内容，但这些内容必须位于公共领域内，或者您拥有这些内容的使用权。用户对经由cheerfly平台上载、张贴或传送的内容承担全部责任。未经版权人许可，用户不得在cheerfly平台上张贴任何受版权保护的内容。用户对于其创作并在cheerfly上发布的合法内容依法享有著作权及其相关权利。</p>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	对于用户通过cheerfly上传到cheerfly网站上的任何内容，用户授予cheerfly在全世界范围内具有免费的、永久的、不可撤销的、非独家的许可以及再许可的权利，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知的或以后开发的其他任何形式的作品、媒体或技术中。任何其他用户或网站需要转载该作品的，必须征得原文作者授权。cheerfly制作、发布、传播的信息内容的版权归cheerfly所有，非经cheerfly许可，任何用户或者第三方不得复制、修改或者转载该内容，或者将其用于任何商业目的。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	三． 知识产权</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	本网站的整体内容版权属于北京cheerfly科技有限公司所有。本网站（www.cheerfly.com）所有的产品、技术与所有程序均属于cheerfly知识产权，在此并未授权。cheerfly为我们的商标。</p>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	本网站所有设计图样以及其他图样、产品及服务名称，均为北京cheerfly科技有限公司及/或其关联公司所享有的商标、标识。任何人不得使用、复制或用作其他用途。</p>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	我们对美丽说网站专有内容、原创内容和其他通过授权取得的独占或者独家内容享有完全知识产权。未经我们许可，任何单位和个人不得私自复制、传播、展示、镜像、上载、下载、使用，或者从事任何其他侵犯我们知识产权的行为。否则，我们将追究相关法律责任。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	四．注册信息</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	美丽说为用户提供对个人注册信息的绝对的控制权，用户可以通过&ldquo;修改个人信息&rdquo;查看或修改个人信息。用户自愿注册个人信息，用户在注册时提供的所有信息，都是基于自愿，用户有权在任何时候拒绝提供这些信息。</p>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	用户在申请使用美丽说服务时，必须提供真实的个人资料，并不断更新注册资料。如果因注册信息不真实而引起的问题及其后果，美丽说不承担任何责任。</p>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	用户不得将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知美丽说。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，美丽说不承担任何责任。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	五．隐私保护</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	保护用户隐私是美丽说的重点原则，美丽说通过技术手段、提供隐私保护服务功能、强化内部管理等办法充分保护用户的个人资料安全。 美丽说保证不对外公开或向第三方提供用户注册的个人资料，及用户在使用服务时存储的非公开内容， 但下列情况除外：</p>\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	◇ 事先获得用户的明确授权；</p>\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	◇ 根据有关的法律法规要求；</p>\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	◇ 按照相关司法机构或政府主管部门的要求；</p>\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	◇ 只有透露你的个人资料，才能提供你所要求的产品和服务</p>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	当用户访问美丽说的时候，我们可能会保存会员的用户登录状态并且为用户分配一个或多个&ldquo;Cookies&rdquo;（一个很小的文本文件），例如：当会员访问一个需要会员登录才可以提供的信息或服务，当会员登录时，我们会把该会员的登录名和密码加密存储在用会员计算机的Cookie文件中，由于是不可逆转的加密存储，其他人即使可以使用该会员的计算机，也无法识别出会员的用户名和密码。会员并不需要额外做任何工作，所有的收集和保存都由系统自动完成。Cookie文件将永久的保存在您的计算机硬盘上，除非您使用浏览器或操作系统软件手工将其删除。您也可以选择&ldquo;不使用Cookie&rdquo;或&ldquo;在使用Cookie是事先通知我&rdquo;的选项禁止Cookie的产生，但是您将为此无法使用一些美丽说的查询和服务。</p>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	我们选择有信誉的第三方公司或网站作为我们的合作伙伴为用户提供信息和服务。尽管我们只选择有信誉的公司或网站作为我们的合作伙伴，但是每个合作伙伴都会有与美丽说不同的隐私保护政策，一旦您通过点击进入了合作伙伴的网站，美丽说隐私保护原则将不再生效，我们建议您查看该合作伙伴网站的隐私条款，并了解该合作伙伴对于收集、使用、泄露您的个人信息的规定。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	六．社区准则</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	用户在使用美丽说服务过程中，必须遵循国家的相关法律法规，不得利用美丽说平台，发布危害国家安全、色情、暴力等非法内容；不得利用美丽说平台发布含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、或其它道德上令人反感的内容。 用户使用本服务的行为若有任何违反国家法律法规或侵犯任何第三方的合法权益的情形时，美丽说有权直接删除该等违反规定之内容。 除非与美丽说单独签订合同，否则不得将社区用于商业目的；美丽说仅供个人使用。 不可以通过自动方式创建账户，也不可以对账户使用自动系统执行操作。 用户影响系统总体稳定性或完整性的操作可能会被暂停或终止，直到问题得到解决。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	七．免责声明</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	互联网是一个开放平台，用户将照片等个人资料上传到互联网上，有可能会被其他组织或个人复制、转载、擅改或做其它非法用途，用户必须充分意识此类风险的存在。用户明确同意其使用美丽说服务所存在的风险将完全由其自己承担；因其使用美丽说服务而产生的一切后果也由其自己承担，我们对用户不承担任何责任。我们不保证服务一定能满足用户的要求，也不保证服务不会中断，对服务的及时性、安全性、准确性也都不作保证。对于因不可抗力或美丽说无法控制的原因造成的网络服务中断或其他缺陷，美丽说不承担任何 责任。我们不对用户所发布信息的删除或储存失败承担责任。我们有权判断用户的行为是否符合本网站使用协议条款之规定，如果我们认为用户违背了协议条款的规定，我们有终止向其提供网站服务的权利 。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	八．服务变更、中断或终止</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	如因系统维护或升级的需要而需暂停网络服务、服务功能的调整，美丽说将尽可能事先在网站上进行通告。 如发生下列任何一种情形，美丽说有权单方面中断或终止向用户提供服务而无需通知用户：</p>\r\n<p style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	◇ 用户提供的个人资料不真实；<br />\r\n	◇ 用户违反本服务条款中规定的使用规则；<br />\r\n	◇ 未经美丽说同意，将美丽说平台用于商业目的。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	九．服务条款的完善和修改</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	美丽说会有权根据互联网的发展和中华人民共和国有关法律、法规的变化，不时地完善和修改美丽说服务条款。美丽说保留随时修改服务条款的权利，用户在使用美丽说平台服务时，有必要对最新的美丽说服务条款进行仔细阅读和重新确认，当发生有关争议时，请以最新的服务条款为准。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	十．青少年用户特别提示</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	青少年用户必须遵守全国青少年网络文明公约：要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	十一．特别约定</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	用户使用本服务的行为若有任何违反国家法律法规或侵犯任何第三方的合法权益的情形时，美丽说有权直接删除该等违反规定之信息，并可以暂停或终止向该用户提供服务。 若用户利用本服务从事任何违法或侵权行为，由用户自行承担全部责任，因此给美丽说或任何第三方造成任何损失，用户应负责全额赔偿。</p>\r\n<h4 class="f14 mt14" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14px; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	十二．其他</h4>\r\n<p class="mt14 pt" style="margin-top: 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: Arial; line-height: 25px; ">\r\n	本用户条款的订立、执行和解释及争议的解决均应适用中华人民共和国法律。 如用户就本协议内容或其执行发生任何争议，用户应尽量与我们友好协商解决；协商不成时，任何一方均可向美丽说所在地的人民法院提起诉讼。我们未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。如本用户条款中的任何条款无论因何种原因完全或部分无效或不具有执行力，本用户条款的其余条款仍应有效并且有约束力。</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 1, 16, 5, '', 6, 0, 0),
('SECOND_STATUS', '0', 1, 0, 0, '', 7, 0, 0),
('ALBUM_DEFAULT_TAGS', 'a:10:{i:0;s:6:"时尚";i:1;s:6:"购物";i:2;s:6:"品牌";i:3;s:6:"美容";i:4;s:6:"生活";i:5;s:6:"街拍";i:6;s:6:"秀场";i:7;s:6:"明星";i:8;s:9:"搭配秀";i:9;s:6:"晒货";}', 0, 0, 0, '', 8, 0, 0),
('ALBUM_TAG_COUNT', '4', 0, 0, 0, '', 8, 0, 0),
('TODAY_MAX_SCORE', '100', 1, 0, 0, '', 6, 0, 0),
('USER_REGISTER_SCORE', '10', 1, 0, 0, '', 6, 0, 0),
('USER_AVATAR_SCORE', '10', 1, 10, 0, '', 6, 0, 0),
('USER_LOGIN_SCORE', '1', 1, 0, 0, '', 6, 0, 0),
('USER_REFERRAL_SCORE', '10', 1, 0, 0, '', 6, 0, 0),
('CLEAR_REFERRAL_SCORE', '-20', 1, 0, 0, '', 6, 0, 0),
('SHARE_DEFAULT_SCORE', '1', 1, 0, 0, '', 6, 0, 0),
('SHARE_IMAGE_SCORE', '5', 1, 0, 0, '', 6, 0, 0),
('DELETE_SHARE_IMAGE_SCORE', '-20', 1, 0, 0, '', 6, 0, 0),
('DELETE_SHARE_DEFAULT_SCORE', '-10', 1, 0, 0, '', 6, 0, 0),
('USER_SORE_RULE', '<h1>\r\n	会员加减分规则</h1>\r\n<p>\r\n	1、会员注册＋10分；</p>\r\n<p>\r\n	2、每日登陆＋1分；</p>\r\n<p>\r\n	3、上传头像＋10分；</p>\r\n<p>\r\n	4、会员成功邀请＋10分；</p>\r\n<p>\r\n	5、删除取消会员邀请－20分；</p>\r\n<p>\r\n	6、发布普通(无图)分享＋1分；</p>\r\n<p>\r\n	7、发布有图分享＋5分；</p>\r\n<p>\r\n	8、管理员删除普通分享－10分；</p>\r\n<p>\r\n	9、管理员删除有图分享－20分；</p>\r\n', 1, 16, 5, '', 6, 0, 0),
('REGRESULT_TO_BIND', '0', 1, 8, 2, '0,1', 1, 1, 0),
('BIND_PUSH_WEIBO', '1', 1, 8, 2, '0,1', 1, 1, 0),
('BOOK_PHOTO_GOODS', '0', 1, 8, 2, '0,1,2', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sys_msg`
--

CREATE TABLE IF NOT EXISTS `fanwe_sys_msg` (
  `mid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mid`),
  KEY `end_time` (`end_time`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sys_msg_member`
--

CREATE TABLE IF NOT EXISTS `fanwe_sys_msg_member` (
  `mid` mediumint(8) NOT NULL,
  `uid` int(11) NOT NULL,
  `dateline` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sys_msg_user_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_sys_msg_user_group` (
  `mid` mediumint(8) NOT NULL,
  `gid` smallint(6) NOT NULL,
  KEY `mid` (`mid`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sys_msg_user_no`
--

CREATE TABLE IF NOT EXISTS `fanwe_sys_msg_user_no` (
  `mid` mediumint(8) NOT NULL,
  `uid` int(11) NOT NULL,
  KEY `mid` (`mid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sys_msg_user_yes`
--

CREATE TABLE IF NOT EXISTS `fanwe_sys_msg_user_yes` (
  `mid` mediumint(8) NOT NULL,
  `uid` int(11) NOT NULL,
  KEY `mid` (`mid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sys_notice`
--

CREATE TABLE IF NOT EXISTS `fanwe_sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`status`),
  KEY `uid_2` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_sys_notice`
--

INSERT INTO `fanwe_sys_notice` (`id`, `uid`, `title`, `content`, `create_time`, `status`) VALUES
(5, 5, '恭喜您获得新勋章', '恭喜您获得了 <a href="/medal/u/uid/5" target="_blank">新人勋章</a> 勋章&nbsp;颁发原因：你的 连续登录天数 达到勋章设定值 1', 1333566893, 0),
(2, 2, '恭喜您获得新勋章', '恭喜您获得了 <a href="/medal.php?action=u&uid=2" target="_blank">新人勋章</a> 勋章&nbsp;颁发原因：你的 连续登录天数 达到勋章设定值 1', 1332185146, 0),
(4, 4, '恭喜您获得新勋章', '恭喜您获得了 <a href="/medal/u/uid/4" target="_blank">新人勋章</a> 勋章&nbsp;颁发原因：你的 连续登录天数 达到勋章设定值 1', 1333303093, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user`
--

CREATE TABLE IF NOT EXISTS `fanwe_user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gid` smallint(6) NOT NULL,
  `email` varchar(60) DEFAULT '',
  `user_name` varchar(60) DEFAULT '',
  `user_name_match` text,
  `password` char(32) DEFAULT '',
  `credits` int(11) DEFAULT '0',
  `reg_time` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `email_status` tinyint(1) DEFAULT '0',
  `avatar_status` tinyint(1) DEFAULT '0',
  `is_daren` tinyint(1) DEFAULT '0',
  `ucenter_id` int(11) DEFAULT '0',
  `invite_id` int(11) NOT NULL DEFAULT '0',
  `is_buyer` tinyint(1) NOT NULL DEFAULT '0',
  `buyer_level` smallint(2) NOT NULL DEFAULT '0',
  `seller_level` smallint(2) NOT NULL DEFAULT '0',
  `server_code` varchar(60) DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `gid` (`gid`),
  KEY `email` (`email`) USING BTREE,
  KEY `invite_id` (`invite_id`),
  KEY `credits` (`credits`),
  KEY `status` (`status`),
  FULLTEXT KEY `user_name_match` (`user_name_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_user`
--

INSERT INTO `fanwe_user` (`uid`, `gid`, `email`, `user_name`, `user_name_match`, `password`, `credits`, `reg_time`, `status`, `email_status`, `avatar_status`, `is_daren`, `ucenter_id`, `invite_id`, `is_buyer`, `buyer_level`, `seller_level`, `server_code`) VALUES
(1, 7, 'm23linzhe@gmail.com', '春暖待花开', 'ux36865 ux31036 ux22825 ux20351', 'e10adc3949ba59abbe56e057f20f883e', 266, 1332009985, 1, 0, 1, 0, 0, 0, 1, 3, 0, 'bupt'),
(2, 7, 'cheernight@126.com', 'cheernight1', 'ux99 ux104 ux101 ux114 ux110 ux105 ux103 ux116 ux49', 'de909e5b66c88339f538f770b515249b', 29, 1332185146, 1, 0, 1, 0, 0, 0, 1, 2, 0, 'bupt'),
(3, 7, 'm23linzhe@163.com', '樱桃小丸子', 'ux108 ux105 ux110 ux122 ux104 ux101', 'e10adc3949ba59abbe56e057f20f883e', 35, 1332489555, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4, 7, 'test3@test.com', 'test3', 'ux116 ux101 ux115 ux51', 'e10adc3949ba59abbe56e057f20f883e', 136, 1333005691, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(5, 7, 'frankcheer@126.com', '风尚杂志社', 'ux39118 ux23578 ux26434 ux24535 ux31038', 'de909e5b66c88339f538f770b515249b', 21, 1333566892, 1, 0, 1, 0, 0, 0, 0, 0, 0, 'bupt');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_attention`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_attention` (
  `uid` int(11) NOT NULL,
  `user_name` char(15) DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL,
  `share_id` int(11) DEFAULT NULL,
  `type` enum('bar','ershou','ask','default') DEFAULT 'default' COMMENT 'default:默认,bar:主题,ershou:二手,ask:问答',
  `create_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_authority`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_authority` (
  `uid` int(11) NOT NULL,
  `module` varchar(60) NOT NULL DEFAULT '',
  `action` varchar(60) NOT NULL DEFAULT '',
  `sort` smallint(3) DEFAULT '0',
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_bind`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_bind` (
  `uid` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `keyid` varchar(100) NOT NULL,
  `info` text,
  `sync` text,
  `refresh_time` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `uid_type` (`uid`,`type`),
  KEY `uid` (`uid`),
  KEY `refresh_time` (`refresh_time`),
  KEY `type_keyid` (`type`,`keyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_bind`
--

INSERT INTO `fanwe_user_bind` (`uid`, `type`, `keyid`, `info`, `sync`, `refresh_time`) VALUES
(1, 'taobao', '127961345', 'a:3:{s:11:"session_key";s:56:"61009294e0edb8ef48832519eb16540b912f6154a600506127961345";s:13:"refresh_token";s:56:"6102429e40fd9a44ba7176cd166a97555783315ddc5a926127961345";s:4:"user";a:14:{s:14:"alipay_account";s:19:"m23linzhe@gmail.com";s:11:"alipay_bind";s:4:"bind";s:9:"alipay_no";s:20:"20881020076729020156";s:6:"avatar";s:59:"http://img.taobaocdn.com/sns_logo/i6/T1S2XJXdXvXXb1upjX.jpg";s:12:"buyer_credit";a:4:{s:8:"good_num";s:2:"68";s:5:"level";s:1:"3";s:5:"score";s:2:"67";s:9:"total_num";s:2:"69";}s:19:"consumer_protection";s:4:"true";s:5:"email";s:19:"m23linzhe@gmail.com";s:8:"location";a:0:{}s:4:"nick";s:9:"carus_top";s:13:"seller_credit";a:4:{s:8:"good_num";s:1:"0";s:5:"level";s:1:"0";s:5:"score";s:1:"0";s:9:"total_num";s:1:"0";}s:6:"status";s:6:"normal";s:4:"type";s:1:"C";s:3:"uid";s:32:"34d55cdc531c990d3c06468bb1cfbc03";s:7:"user_id";s:9:"127961345";}}', '', 1333221274),
(1, 'sina', '2001087740', 'a:3:{s:11:"oauth_token";s:32:"d319bf620b7c454ea6df0b6c4c342f7e";s:18:"oauth_token_secret";s:32:"7aa1294c58f0005fc5d2dcd385fcda44";s:4:"user";a:21:{s:2:"id";i:2001087740;s:11:"screen_name";s:12:"我是林哲";s:4:"name";s:12:"我是林哲";s:8:"province";s:2:"11";s:4:"city";s:1:"8";s:8:"location";s:16:"北京 海淀区";s:11:"description";s:0:"";s:3:"url";s:0:"";s:17:"profile_image_url";s:39:"http://tp1.sinaimg.cn/2001087740/50/0/1";s:6:"domain";s:0:"";s:6:"gender";s:1:"m";s:15:"followers_count";i:12;s:13:"friends_count";i:40;s:14:"statuses_count";i:12;s:16:"favourites_count";i:1;s:10:"created_at";s:30:"Sun Mar 13 00:00:00 +0800 2011";s:9:"following";b:0;s:17:"allow_all_act_msg";b:0;s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:6:"status";a:14:{s:10:"created_at";s:30:"Tue Mar 20 11:17:45 +0800 2012";s:2:"id";d:3425613916642652;s:4:"text";s:33:"马克 夹克 http://t.cn/zOJIA9E";s:6:"source";s:72:"<a href="http://www.cheerfly.com/" rel="nofollow">星座时尚搭配</a>";s:9:"favorited";b:0;s:9:"truncated";b:0;s:21:"in_reply_to_status_id";s:0:"";s:19:"in_reply_to_user_id";s:0:"";s:23:"in_reply_to_screen_name";s:0:"";s:13:"thumbnail_pic";s:58:"http://ww2.sinaimg.cn/thumbnail/77462cfcjw1dr63fnltuaj.jpg";s:11:"bmiddle_pic";s:56:"http://ww2.sinaimg.cn/bmiddle/77462cfcjw1dr63fnltuaj.jpg";s:12:"original_pic";s:54:"http://ww2.sinaimg.cn/large/77462cfcjw1dr63fnltuaj.jpg";s:3:"geo";N;s:3:"mid";s:16:"3425613916642652";}}}', 'a:3:{s:5:"weibo";i:0;s:5:"topic";i:0;s:5:"medal";i:1;}', 0),
(2, 'taobao', '378900206', 'a:3:{s:11:"session_key";s:56:"6100c03c2f9187b2f65ce40e9910a620a24b9c1f97e8e4d378900206";s:13:"refresh_token";s:56:"610250363b6187fd49f2ebb08be2a7719653dbde49b6efe378900206";s:4:"user";a:14:{s:14:"alipay_account";s:18:"cheernight@126.com";s:11:"alipay_bind";s:4:"bind";s:9:"alipay_no";s:20:"20883021591371820156";s:6:"avatar";s:52:"http://a.tbcdn.cn/app/sns/img/default/avatar-120.png";s:12:"buyer_credit";a:4:{s:8:"good_num";s:2:"34";s:5:"level";s:1:"2";s:5:"score";s:2:"34";s:9:"total_num";s:2:"34";}s:19:"consumer_protection";s:5:"false";s:5:"email";s:18:"cheernight@126.com";s:8:"location";a:0:{}s:4:"nick";s:11:"cheernight1";s:13:"seller_credit";a:4:{s:8:"good_num";s:1:"0";s:5:"level";s:1:"0";s:5:"score";s:1:"0";s:9:"total_num";s:1:"0";}s:6:"status";s:6:"normal";s:4:"type";s:1:"C";s:3:"uid";s:32:"695bec3ef3a26e117a552a71b65d6f41";s:7:"user_id";s:9:"378900206";}}', '', 1332271546),
(1, 'tqq', 'm23linzhe', 'a:3:{s:12:"access_token";s:32:"717baf327f0641c1b7ec3a08e46afdc7";s:18:"oauth_token_secret";s:32:"5f9e3a3b8733bd345d1cd79a43458d91";s:4:"user";a:23:{s:9:"birth_day";i:1;s:11:"birth_month";i:1;s:10:"birth_year";i:2005;s:9:"city_code";s:1:"8";s:12:"country_code";s:1:"1";s:3:"edu";a:1:{i:0;a:5:{s:12:"departmentid";i:20829;s:2:"id";i:24037;s:5:"level";i:5;s:8:"schoolid";i:11800;s:4:"year";i:2010;}}s:5:"email";s:16:"398024808@qq.com";s:7:"fansnum";i:39;s:4:"head";s:50:"http://app.qlogo.cn/mbloghead/00eea11d87239e86fea6";s:7:"idolnum";i:0;s:12:"introduction";s:0:"";s:5:"isent";i:0;s:10:"isrealname";i:0;s:5:"isvip";i:0;s:8:"location";s:6:"海淀";s:4:"name";s:9:"m23linzhe";s:4:"nick";s:6:"林哲";s:6:"openid";s:32:"F6DED08030EEFF2112501F58DE4E82B3";s:13:"province_code";s:2:"11";s:3:"sex";i:1;s:3:"tag";N;s:8:"tweetnum";i:1;s:10:"verifyinfo";s:0:"";}}', 'a:3:{s:5:"weibo";i:0;s:5:"topic";i:0;s:5:"medal";i:1;}', 0),
(5, 'sina', '2585851577', 'a:3:{s:11:"oauth_token";s:32:"b1dbb7151a5cceac23febd6f69bcf923";s:18:"oauth_token_secret";s:32:"0734f79806db0fc963bf349aa1a62fa3";s:4:"user";a:21:{s:2:"id";d:2585851577;s:11:"screen_name";s:15:"风尚杂志社";s:4:"name";s:15:"风尚杂志社";s:8:"province";s:2:"11";s:4:"city";s:4:"1000";s:8:"location";s:6:"北京";s:11:"description";s:82:"时尚圈是个方形的圆~有棱有角方能存在，我却是一个三角形...";s:3:"url";s:0:"";s:17:"profile_image_url";s:48:"http://tp2.sinaimg.cn/2585851577/50/5621582408/0";s:6:"domain";s:0:"";s:6:"gender";s:1:"f";s:15:"followers_count";i:1428;s:13:"friends_count";i:928;s:14:"statuses_count";i:1648;s:16:"favourites_count";i:0;s:10:"created_at";s:30:"Sun Jan 15 00:00:00 +0800 2012";s:9:"following";b:0;s:17:"allow_all_act_msg";b:0;s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:6:"status";a:15:{s:10:"created_at";s:30:"Tue Apr 03 09:18:52 +0800 2012";s:2:"id";d:3430657427231120;s:4:"text";s:224:"春天怎么少的掉糖果色呢？salvatore ferragamo的饱和撞色搭配让人过目难忘；JIT SANDER的明快绿搭配奶油蓝色发带冲突，却格外抓睛。要在人群中脱颖而出，糖果色必不可少。";s:6:"source";s:61:"<a href="http://q.weibo.com/" rel="nofollow">新浪微群</a>";s:9:"favorited";b:0;s:9:"truncated";b:0;s:21:"in_reply_to_status_id";s:0:"";s:19:"in_reply_to_user_id";s:0:"";s:23:"in_reply_to_screen_name";s:0:"";s:13:"thumbnail_pic";s:58:"http://ww1.sinaimg.cn/thumbnail/9a20f6b9jw1drm6nzb2ksj.jpg";s:11:"bmiddle_pic";s:56:"http://ww1.sinaimg.cn/bmiddle/9a20f6b9jw1drm6nzb2ksj.jpg";s:12:"original_pic";s:54:"http://ww1.sinaimg.cn/large/9a20f6b9jw1drm6nzb2ksj.jpg";s:3:"geo";N;s:3:"mid";s:16:"3430657427231120";s:11:"annotations";a:1:{i:0;a:7:{s:2:"id";s:6:"109833";s:5:"appid";i:49;s:4:"name";s:15:"欧美时尚控";s:5:"title";s:15:"欧美时尚控";s:3:"url";s:44:"http://q.weibo.com/109833?source=weibosource";s:4:"skey";s:0:"";s:9:"server_ip";s:12:"10.75.15.198";}}}}}', 'a:3:{s:5:"weibo";i:1;s:5:"topic";i:1;s:5:"medal";i:1;}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_category`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_category` (
  `id` smallint(6) NOT NULL,
  `name` varchar(100) DEFAULT '',
  `cate_desc` text,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_category`
--

INSERT INTO `fanwe_user_category` (`id`, `name`, `cate_desc`, `status`) VALUES
(1, '技能', '告诉大家自己最擅长的美丽技能吧！', 1),
(2, '小情结', '自己的那些美丽小情结！', 1),
(3, '爱什么范', '大声告诉全世界，你爱什么范儿？', 1),
(4, '时尚从业', '我是时尚从业者！', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_category_tags`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_category_tags` (
  `tag_id` smallint(6) NOT NULL,
  `cate_id` smallint(6) NOT NULL,
  KEY `tag_id` (`tag_id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_category_tags`
--

INSERT INTO `fanwe_user_category_tags` (`tag_id`, `cate_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 4),
(66, 4),
(67, 4),
(68, 4),
(69, 4),
(70, 4),
(71, 4),
(72, 4);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_collect`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_collect` (
  `uid` int(11) NOT NULL,
  `c_uid` int(11) DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL,
  `share_id` int(11) DEFAULT '0',
  `type` tinyint(4) DEFAULT '0' COMMENT '0:普通 1:论坛 2:问答 3:二手',
  `create_time` int(11) DEFAULT '0',
  KEY `uid` (`uid`),
  KEY `c_uid` (`c_uid`),
  KEY `rec_id` (`rec_id`),
  KEY `share_id` (`share_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_collect`
--

INSERT INTO `fanwe_user_collect` (`uid`, `c_uid`, `rec_id`, `share_id`, `type`, `create_time`) VALUES
(1, 3, 0, 16, 0, 1332489584),
(1, 3, 0, 15, 0, 1332489587),
(1, 3, 0, 32, 0, 1332818534);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_consignee`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_consignee` (
  `uid` int(11) NOT NULL,
  `region_lv1` int(11) NOT NULL DEFAULT '0',
  `region_lv2` int(11) NOT NULL DEFAULT '0',
  `region_lv3` int(11) NOT NULL DEFAULT '0',
  `region_lv4` int(11) NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `mobile_phone` varchar(255) NOT NULL DEFAULT '',
  `fix_phone` varchar(255) NOT NULL DEFAULT '',
  `consignee` varchar(255) NOT NULL DEFAULT '',
  `zip` varchar(255) NOT NULL DEFAULT '',
  `qq` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `fax_phone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_count`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_count` (
  `uid` int(11) NOT NULL,
  `follows` int(11) unsigned DEFAULT '0',
  `fans` int(11) unsigned DEFAULT '0',
  `collects` int(11) unsigned DEFAULT '0',
  `favs` int(11) unsigned DEFAULT '0',
  `threads` int(11) unsigned DEFAULT '0',
  `photos` int(11) unsigned DEFAULT '0',
  `goods` int(11) unsigned DEFAULT '0',
  `ask` int(11) unsigned DEFAULT '0',
  `ask_posts` int(11) unsigned DEFAULT '0',
  `ask_best_posts` int(11) unsigned DEFAULT '0',
  `shares` int(11) unsigned DEFAULT '0',
  `forums` int(11) unsigned DEFAULT '0',
  `forum_posts` int(11) unsigned DEFAULT '0',
  `seconds` int(11) unsigned DEFAULT '0',
  `albums` int(11) unsigned DEFAULT '0',
  `referrals` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_count`
--

INSERT INTO `fanwe_user_count` (`uid`, `follows`, `fans`, `collects`, `favs`, `threads`, `photos`, `goods`, `ask`, `ask_posts`, `ask_best_posts`, `shares`, `forums`, `forum_posts`, `seconds`, `albums`, `referrals`) VALUES
(1, 0, 1, 3, 0, 1, 23, 37, 0, 0, 0, 62, 1, 0, 2, 2, 0),
(2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0),
(3, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 13, 0, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 25, 0, 0, 0, 0, 0),
(5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_daren`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_daren` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cid` smallint(6) DEFAULT '0',
  `img` varchar(255) NOT NULL DEFAULT '',
  `gift_name` varchar(255) DEFAULT '',
  `gift_url` varchar(255) DEFAULT '',
  `sponsor_name` varchar(255) DEFAULT '',
  `sponsor_url` varchar(255) DEFAULT '',
  `is_best` tinyint(1) DEFAULT '0',
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  `index_img` varchar(255) NOT NULL DEFAULT '',
  `day_time` int(11) DEFAULT '0',
  `reason` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `is_index` (`is_index`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_follow`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_follow` (
  `f_uid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  KEY `uid` (`uid`),
  KEY `f_uid` (`f_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_follow`
--

INSERT INTO `fanwe_user_follow` (`f_uid`, `uid`, `create_time`) VALUES
(3, 1, 1332818575);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_group` (
  `gid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT '',
  `type` enum('system','user') DEFAULT NULL,
  `stars` tinyint(1) DEFAULT '0',
  `color` varchar(8) DEFAULT '',
  `icon` varchar(255) DEFAULT '',
  `credits_higher` int(11) DEFAULT '0',
  `credits_lower` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_user_group`
--

INSERT INTO `fanwe_user_group` (`gid`, `name`, `type`, `stars`, `color`, `icon`, `credits_higher`, `credits_lower`, `status`) VALUES
(6, '游客', 'system', 0, '', '', 0, 0, 1),
(7, '普通会员', 'system', 0, '', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_group_authority`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_group_authority` (
  `gid` int(11) NOT NULL,
  `module` varchar(60) NOT NULL DEFAULT '',
  `action` varchar(60) NOT NULL DEFAULT '',
  KEY `uid` (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_medal`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `deadline` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_2` (`uid`,`mid`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  KEY `deadline` (`deadline`),
  KEY `type` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_user_medal`
--

INSERT INTO `fanwe_user_medal` (`id`, `uid`, `mid`, `type`, `create_time`, `deadline`) VALUES
(1, 1, 1, 0, 1332009985, 0),
(2, 2, 1, 0, 1332185146, 0),
(3, 3, 1, 0, 1332903554, 0),
(4, 4, 1, 0, 1333303093, 0),
(5, 5, 1, 0, 1333566893, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_me_tags`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_me_tags` (
  `uid` int(11) NOT NULL,
  `tag_name` varchar(100) DEFAULT NULL,
  `tag_name_match` text,
  KEY `uid` (`uid`),
  KEY `tag_name` (`tag_name`),
  FULLTEXT KEY `tag_name_match` (`tag_name_match`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL COMMENT 'author_id为0时为系统消息',
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`mid`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_0`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_0` (
  `miid` int(11) unsigned NOT NULL DEFAULT '0',
  `mlid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`,`status`,`dateline`),
  KEY `dateline` (`mlid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_1`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_1` (
  `miid` int(11) unsigned NOT NULL DEFAULT '0',
  `mlid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`,`status`,`dateline`),
  KEY `dateline` (`mlid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_2`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_2` (
  `miid` int(11) unsigned NOT NULL DEFAULT '0',
  `mlid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`,`status`,`dateline`),
  KEY `dateline` (`mlid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_3`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_3` (
  `miid` int(11) unsigned NOT NULL DEFAULT '0',
  `mlid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`,`status`,`dateline`),
  KEY `dateline` (`mlid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_4`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_4` (
  `miid` int(11) unsigned NOT NULL DEFAULT '0',
  `mlid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`,`status`,`dateline`),
  KEY `dateline` (`mlid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_5`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_5` (
  `miid` int(11) unsigned NOT NULL DEFAULT '0',
  `mlid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`,`status`,`dateline`),
  KEY `dateline` (`mlid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_6`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_6` (
  `miid` int(11) unsigned NOT NULL DEFAULT '0',
  `mlid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`,`status`,`dateline`),
  KEY `dateline` (`mlid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_7`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_7` (
  `miid` int(11) unsigned NOT NULL DEFAULT '0',
  `mlid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`,`status`,`dateline`),
  KEY `dateline` (`mlid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_8`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_8` (
  `miid` int(11) unsigned NOT NULL DEFAULT '0',
  `mlid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`,`status`,`dateline`),
  KEY `dateline` (`mlid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_9`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_9` (
  `miid` int(11) unsigned NOT NULL DEFAULT '0',
  `mlid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`,`status`,`dateline`),
  KEY `dateline` (`mlid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_index`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_index` (
  `miid` int(11) NOT NULL AUTO_INCREMENT,
  `mlid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_list` (
  `mlid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL,
  `members` smallint(5) NOT NULL DEFAULT '0',
  `min_max` varchar(23) NOT NULL,
  `dateline` int(11) NOT NULL DEFAULT '0',
  `msg_config` text NOT NULL,
  PRIMARY KEY (`mlid`),
  KEY `type` (`type`),
  KEY `min_max` (`min_max`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_member`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_member` (
  `mlid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL,
  `last_update` int(11) NOT NULL DEFAULT '0',
  `last_dateline` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`,`uid`),
  KEY `is_new` (`is_new`),
  KEY `last_update` (`uid`,`last_update`),
  KEY `last_dateline` (`uid`,`last_dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_msg_rel`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_msg_rel` (
  `mid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_notice`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_notice` (
  `uid` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:关注，2:喜欢，3:评论，4:提到，5:信件',
  `num` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_notice`
--

INSERT INTO `fanwe_user_notice` (`uid`, `type`, `num`, `create_time`) VALUES
(2, 5, 1, 1332185146),
(1, 2, 0, 1332818534),
(1, 3, 0, 1332818562),
(3, 3, 0, 1332820871),
(3, 4, 0, 1332820871),
(5, 5, 1, 1333566893);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_profile`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_profile` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nick_name` varchar(60) DEFAULT '',
  `gender` tinyint(1) DEFAULT '0',
  `birth_year` smallint(6) DEFAULT '0',
  `birth_month` smallint(6) DEFAULT '0',
  `birth_day` smallint(4) DEFAULT '0',
  `reside_province` int(11) DEFAULT '0',
  `reside_city` int(11) DEFAULT '0',
  `school` varchar(100) DEFAULT '',
  `workplace` varchar(100) DEFAULT '',
  `occupation` smallint(6) DEFAULT '0',
  `weibo` varchar(255) DEFAULT '',
  `hobby` varchar(255) DEFAULT '',
  `introduce` text,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_profile`
--

INSERT INTO `fanwe_user_profile` (`uid`, `nick_name`, `gender`, `birth_year`, `birth_month`, `birth_day`, `reside_province`, `reside_city`, `school`, `workplace`, `occupation`, `weibo`, `hobby`, `introduce`) VALUES
(1, '', 1, 0, 0, 0, 1, 43, '', '', 0, '', '', '随便写点什么，让大家了解你吧。'),
(2, '', 0, 0, 0, 0, 0, 0, '', '', 0, '', '', ''),
(3, '', 0, 0, 0, 0, 0, 0, '', '', 0, '', '', ''),
(4, '', 0, 0, 0, 0, 0, 0, '', '', 0, '', '', ''),
(5, '', 0, 0, 0, 0, 0, 0, '', '', 0, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_score_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `create_day` int(11) NOT NULL DEFAULT '0',
  `content` text,
  `rec_id` int(11) NOT NULL,
  `rec_module` varchar(255) NOT NULL,
  `rec_action` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `create_day` (`create_day`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

--
-- 转存表中的数据 `fanwe_user_score_log`
--

INSERT INTO `fanwe_user_score_log` (`id`, `uid`, `score`, `create_time`, `create_day`, `content`, `rec_id`, `rec_module`, `rec_action`) VALUES
(1, 1, 10, 1332009985, 1331971200, '注册会员', 1, 'user', 'register'),
(2, 1, 1, 1332009985, 1331971200, '会员登陆', 1, 'user', 'login'),
(3, 1, 5, 1332011239, 1331971200, '发表有图分享　试试两个一起发的', 1, 'share', 'image'),
(4, 1, 5, 1332012640, 1331971200, '发表有图分享　试试拍拍的', 2, 'share', 'image'),
(5, 1, 10, 1332051688, 1331971200, '上传头像', 1, 'user', 'avatar'),
(6, 1, 5, 1332056519, 1331971200, '发表有图分享　ZIPPO限量正版打火机发售', 3, 'share', 'image'),
(7, 1, 1, 1332096362, 1332057600, '会员登陆', 1, 'user', 'login'),
(8, 1, 1, 1332184669, 1332144000, '会员登陆', 1, 'user', 'login'),
(9, 1, 5, 1332184789, 1332144000, '发表有图分享　马克 夹克', 4, 'share', 'image'),
(10, 2, 10, 1332185146, 1332144000, '注册会员', 2, 'user', 'register'),
(11, 2, 10, 1332185146, 1332144000, '上传头像', 2, 'user', 'avatar'),
(12, 2, 1, 1332185146, 1332144000, '会员登陆', 2, 'user', 'login'),
(13, 1, 5, 1332192158, 1332144000, '发表有图分享　化妆袋', 5, 'share', 'image'),
(14, 1, 5, 1332192263, 1332144000, '发表有图分享　保温杯 *3', 6, 'share', 'image'),
(15, 1, 5, 1332192478, 1332144000, '发表有图分享　这个是一个', 7, 'share', 'image'),
(16, 1, 5, 1332192555, 1332144000, '发表有图分享　1个安安家 可爱卡通兔子迷你小台灯/可充电LED台灯 创意家居 L108', 8, 'share', 'image'),
(17, 1, 5, 1332192622, 1332144000, '发表有图分享　1个【多米乐】美式风格台灯 学习工作护眼灯饰 长臂折叠灯具 铁艺台灯', 9, 'share', 'image'),
(18, 1, 5, 1332192693, 1332144000, '发表有图分享　3个安安家 日韩居家 时尚 双层真空不锈钢杯保温杯水杯办公杯 C401', 10, 'share', 'image'),
(19, 1, -20, 1332229096, 1332144000, '删除有图主题　试试两个一起发的', 1, 'delete_share', 'image'),
(20, 1, 1, 1332265511, 1332230400, '会员登陆', 1, 'user', 'login'),
(21, 2, 1, 1332306570, 1332230400, '会员登陆', 2, 'user', 'login'),
(22, 2, 5, 1332306638, 1332230400, '发表有图分享　sss', 11, 'share', 'image'),
(23, 1, 1, 1332349689, 1332316800, '会员登陆', 1, 'user', 'login'),
(24, 1, 5, 1332382711, 1332316800, '发表有图分享　时尚镂空勾花绿毛衣，呈现出年轻化的设计，美丽而不失优雅，风格简约，超赞。', 12, 'share', 'image'),
(25, 1, 1, 1332382741, 1332316800, '发表普通分享　美丽而不失优雅', 13, 'share', 'default'),
(26, 1, 5, 1332384623, 1332316800, '发表有图分享　今年还是很流行蓬蓬裙噢~ 长的，短的，前短后长的~ 快点休息啦亲们 好梦！', 14, 'share', 'image'),
(27, 1, 1, 1332458457, 1332403200, '会员登陆', 1, 'user', 'login'),
(28, 1, 5, 1332458546, 1332403200, '发表有图分享　包包 女包 复古', 15, 'share', 'image'),
(29, 1, 5, 1332458853, 1332403200, '发表有图分享　The Face Shop 花语净泽水乳套装混合性 爽肤水+乳液 清爽补水', 16, 'share', 'image'),
(30, 1, 5, 1332473078, 1332403200, '发表有图分享　佳能（Canon） EOS 600D 单反套机（EF-S 18-55mm f/3.5-5.6 IS II 镜头）', 17, 'share', 'image'),
(31, 1, 5, 1332487759, 1332403200, '发表有图分享　站内直接购买图中的商品', 18, 'share', 'image'),
(32, 1, 5, 1332488616, 1332403200, '发表有图分享　星座时尚搭配', 19, 'share', 'image'),
(33, 3, 10, 1332489555, 1332403200, '注册会员', 3, 'user', 'register'),
(34, 3, 1, 1332489740, 1332489600, '会员登陆', 3, 'user', 'login'),
(35, 1, 5, 1332573394, 1332489600, '发表有图分享　杜尚演绎2012新款春装男装夹克纯棉修身精品外套男士休闲上衣', 23, 'share', 'image'),
(36, 1, 5, 1332573461, 1332489600, '发表有图分享　2012春装新款男士精品男装加厚立领夹克男款修身时尚休闲外套潮', 24, 'share', 'image'),
(37, 1, 5, 1332573551, 1332489600, '发表有图分享　2012春装新款男士韩版修身羊毛呢夹克休闲精品潮男装时尚上衣外套', 25, 'share', 'image'),
(38, 1, 5, 1332577151, 1332576000, '发表有图分享　特价限量400件顶慕2011新款女装两件套长袖条纹T+背心连帽马甲', 26, 'share', 'image'),
(39, 1, 5, 1332577255, 1332576000, '发表有图分享　顶慕2012新款春装修身荷叶边ol通勤泡泡袖蛋糕裙层层连衣裙女', 27, 'share', 'image'),
(40, 1, 5, 1332577357, 1332576000, '发表有图分享　顶慕日系韩版仿呢料中长呢大衣甜美冬装大衣修身带帽外套4折包邮', 28, 'share', 'image'),
(41, 1, 5, 1332578162, 1332576000, '发表有图分享　黑色的雪花裤子一年四季都很通用，那就要看怎么去搭配了！搭配经典的格子衬衫，那就是完美的春装组合，再配上蝴蝶结装饰的单鞋就可以了。', 29, 'share', 'image'),
(42, 1, 5, 1332578267, 1332576000, '发表有图分享　正红色立体睫毛T恤，挺有意思的一款t恤，前短后长的设计。还有一个小燕尾。非常的个性气质呢，随意的搭配就非常好看啦。', 30, 'share', 'image'),
(43, 1, 5, 1332578322, 1332576000, '发表有图分享　简约的圆领T恤，是白搭的绝佳。抽象图案的融入，增添几分俏皮的色彩，下摆不规则的设计，更完美的拉长腿部线条。搭配牛仔裤出门，简约不失风尚，茫茫人海中，总能发现不一样的你！', 31, 'share', 'image'),
(44, 1, 5, 1332578398, 1332576000, '发表有图分享　今年有那么度美丽的颜色，西瓜红作为今年流行挚爱，温暖的浓郁的热情的颜色，吊带设计，胸部特别的荷叶边装饰，松紧腰，下摆百褶的中长设计，是一件就够美的那种，上班外面可以搭配开衫小西服，出游度假一件都够美，搭配特别的开衫也是上乘之选。', 32, 'share', 'image'),
(45, 1, 5, 1332578448, 1332576000, '发表有图分享　清爽半透的罩衫，搭配糖果色系的裤子裙子，流露出洋气的质感。一款高帮的楔跟凉鞋，花季少女立即洋溢一派纯纯的学院风。', 33, 'share', 'image'),
(46, 1, 5, 1332578503, 1332576000, '发表有图分享　黑白配是非常经典的简约组合，黑色修身牛仔裤越显优雅，而白色的衬衫可以凸显美人知性，白色的鱼嘴高跟鞋更加拉长腿部曲线。', 34, 'share', 'image'),
(47, 1, 5, 1332578564, 1332576000, '发表有图分享　长袖雪纺碎花连衣裙，高腰的板型充分强调你纤细的腰部曲线，略微宽松的裙摆可以让小腹上的赘肉轻松隐藏起来。方形领口更修饰脸型，显瘦效果很好，细密的风琴褶灵动细腻。', 35, 'share', 'image'),
(48, 1, 5, 1332578712, 1332576000, '发表有图分享　生命中最美好的都是看不见的，这就是为什么我们会在接吻，哭泣，许愿的时候闭上眼睛。今天主页菌早早的休息了呦~ 先跟大家说晚安了~ 好梦~', 36, 'share', 'image'),
(49, 1, 5, 1332578741, 1332576000, '发表有图分享　一只可爱的小狗噢~ 是比熊~ 各位晚安 做个好梦！', 37, 'share', 'image'),
(50, 1, 5, 1332578775, 1332576000, '发表有图分享　给大家介绍一个小妖精呦~ Ebba Zingmark ~ 亲们早点休息呐~ 晚安(吻)', 38, 'share', 'image'),
(51, 1, 5, 1332578814, 1332576000, '发表有图分享　想必大家都知道颜色搭配基本原则，从头到脚颜色最好不要超过三种。墨镜也是一件增强自信的饰物噢！有强大的自信才能有强大的气场！亲们好梦呦~~', 39, 'share', 'image'),
(52, 1, 5, 1332578881, 1332576000, '发表有图分享　这是今年流行的冰沙色噢~ 春天这么穿回头率一定很高吧~ 周末不要玩太晚噢亲们~晚安好梦！', 40, 'share', 'image'),
(53, 1, 1, 1332579122, 1332576000, '发表普通分享', 41, 'share', 'default'),
(54, 1, 1, 1332579140, 1332576000, '发表普通分享　加入星座秀《流行时尚》', 42, 'share', 'default'),
(55, 1, 1, 1332579151, 1332576000, '发表普通分享　加入星座秀《流行时尚》', 43, 'share', 'default'),
(56, 1, 1, 1332579156, 1332576000, '发表普通分享　加入星座秀《流行时尚》', 44, 'share', 'default'),
(57, 1, 1, 1332579164, 1332576000, '发表普通分享　加入星座秀《流行时尚》', 45, 'share', 'default'),
(58, 1, 1, 1332579171, 1332576000, '发表普通分享　加入星座秀《流行时尚》', 46, 'share', 'default'),
(59, 1, 1, 1332579176, 1332576000, '发表普通分享　加入星座秀《流行时尚》', 47, 'share', 'default'),
(60, 2, 1, 1332633392, 1332576000, '会员登陆', 2, 'user', 'login'),
(61, 1, 5, 1332650938, 1332576000, '发表有图分享　包邮 春装 韩版高腰半身裙 半身短裙 西装裙 黑色短裙 裙子', 48, 'share', 'image'),
(62, 1, 5, 1332651025, 1332576000, '发表有图分享　1659-2012女装新款韩版热卖时尚蝴蝶结亮片百褶裙 半身裙', 49, 'share', 'image'),
(63, 1, 5, 1332656993, 1332576000, '发表有图分享　2012春夏 女装衬衫百搭修身 中袖衬衣 荷叶边雪纺衫 送打底抹胸', 50, 'share', 'image'),
(64, 1, 5, 1332659560, 1332576000, '发表有图分享　2012春装新品韩版舒适休闲百搭格子格纹衬衣衬衫女长袖英伦学院风', 51, 'share', 'image'),
(65, 1, 1, 1332701394, 1332662400, '会员登陆', 1, 'user', 'login'),
(66, 1, 5, 1332701606, 1332662400, '发表有图分享　据说科学家做了这样一个实验并得到证实：如果一个人每天站在镜子前，冲自己微笑，告诉自己“我很美”，那么他真的越来越美——心理暗示的力量如此强大。一个女人，有了自信便有了美。有了自信便会感觉到，爱情在自己生命中的地位也没那么重要，有很多事情可以享受，爱情也许很卑微。胖妞们记住，你们也很美丽', 52, 'share', 'image'),
(67, 1, 1, 1332783889, 1332748800, '会员登陆', 1, 'user', 'login'),
(68, 1, 5, 1332817629, 1332748800, '发表有图分享　娇韵诗 抚纹身体霜200ml 产后恢复 祛妊娠纹肥胖纹 代购现货正品', 53, 'share', 'image'),
(69, 1, 5, 1332817672, 1332748800, '发表有图分享　11新款代购 娇韵诗调和身体护理油100ml 防妊娠纹紧致 预定', 54, 'share', 'image'),
(70, 1, 5, 1332817806, 1332748800, '发表有图分享　【金冠】Clarins娇韵诗HD第五代红魔晶完全纤体精华霜/瘦身 200ml', 55, 'share', 'image'),
(71, 3, 1, 1332818562, 1332748800, '发表普通分享　[奶瓶]', 57, 'share', 'default'),
(72, 3, 1, 1332820871, 1332748800, '发表普通分享　这个在哪里可以买到呢？//@test2:[奶瓶]', 58, 'share', 'default'),
(73, 3, 1, 1332903554, 1332835200, '会员登陆', 3, 'user', 'login'),
(74, 3, 5, 1332903655, 1332835200, '发表有图分享　A2805 芥末花开 2012春装新款韩版宽松中长款长袖圆领雪纺连衣裙', 59, 'share', 'image'),
(75, 3, 5, 1332903701, 1332835200, '发表有图分享　A2799 芥末花开 2012春装新款复古赫本气质立体裁剪修身连衣裙', 60, 'share', 'image'),
(76, 3, 5, 1332903759, 1332835200, '发表有图分享　A2800 芥末花开 2012春新款复古PU拼接英伦翻领双排扣西服女外套', 61, 'share', 'image'),
(77, 3, 5, 1332903799, 1332835200, '发表有图分享　A2806 芥末花开 2012春装新款韩版百搭修身针织衫亮线开衫外套女', 62, 'share', 'image'),
(78, 3, 5, 1332903911, 1332835200, '发表有图分享　A2804 芥末花开 2012春季新款大小蝴蝶结波点宽松甜美雪纺衫', 63, 'share', 'image'),
(79, 3, 5, 1332904039, 1332835200, '发表有图分享　A2763 芥末花开 2012春装新款韩版宽松长袖翻领轻盈纯棉百搭衬衫', 64, 'share', 'image'),
(80, 3, 5, 1332904118, 1332835200, '发表有图分享　A2803 芥末花开 2012春装新款女糖果色舒适修身单排扣西装小外套', 65, 'share', 'image'),
(81, 3, 1, 1332957410, 1332921600, '会员登陆', 3, 'user', 'login'),
(82, 1, 5, 1333000816, 1332921600, '发表有图分享　限时限量!春装新品特价包邮仿牛仔弹力显瘦小脚打底裤女有加大码', 66, 'share', 'image'),
(83, 1, 5, 1333000864, 1332921600, '发表有图分享　新品 买4送1包邮 天鹅绒 超弹显瘦 踩脚 连裤 丝袜打底裤 女', 67, 'share', 'image'),
(84, 1, 5, 1333000951, 1332921600, '发表有图分享　淘金币 2012春装新款小脚裤打底裤女式韩版显瘦小脚裤铅笔裤', 68, 'share', 'image'),
(85, 1, 5, 1333001088, 1332921600, '发表有图分享　特价铅笔裤新款春装 糖果色打底裤 女装韩版 小脚裤子大码长裤', 69, 'share', 'image'),
(86, 1, 5, 1333001154, 1332921600, '发表有图分享　糖果色彩色打底裤 百搭松紧腰弹性 水洗棉打底裤小脚雪花裤 薄款', 70, 'share', 'image'),
(87, 1, 5, 1333001361, 1332921600, '发表有图分享　2012蜜桃家春夏新品韩国网纱蓬蓬裙假两件打底裤裙裤薄款包邮', 71, 'share', 'image'),
(88, 4, 10, 1333005691, 1332921600, '注册会员', 4, 'user', 'register'),
(89, 4, 5, 1333005766, 1332921600, '发表有图分享　秒杀价 2012新款韩国热卖百搭甜美脚腕绕带粗跟单鞋OL', 72, 'share', 'image'),
(90, 4, 5, 1333005897, 1332921600, '发表有图分享　NIKE 耐克 男子经典板鞋 315122 414 40.5', 73, 'share', 'image'),
(91, 4, 5, 1333006417, 1332921600, '发表有图分享　休闲时尚修身的一款风衣，百搭经典而帅气，这款风衣版型利落修身，配以精致大气的领型设计，极具大牌气质。简约而有设计风格的风衣，裁剪线条明朗。翻领设计，视觉效果非常棒。腰间腰带可系成优雅的蝴蝶结，显得更时尚大气，使腰部显得更加纤细。', 74, 'share', 'image'),
(92, 4, 5, 1333006572, 1332921600, '发表有图分享　【6折】裂帛毛线帽子绣花盘扣斜襟风衣外套小房15110025#', 75, 'share', 'image'),
(93, 4, 5, 1333006634, 1332921600, '发表有图分享　Mr.ing 新品真皮正品潘多拉3代时尚潮流男式鞋 春夏单鞋F1325^@^', 76, 'share', 'image'),
(94, 4, 5, 1333006687, 1332921600, '发表有图分享　安步当马日常休闲鞋子单鞋真皮英伦潮流商务男士皮鞋流行男鞋903', 77, 'share', 'image'),
(95, 1, 1, 1333134874, 1333094400, '会员登陆', 1, 'user', 'login'),
(96, 4, 5, 1333169676, 1333094400, '发表有图分享　货到付款包邮2012新品春装裙子韩版修身职业连衣裙', 78, 'share', 'image'),
(97, 4, 5, 1333170058, 1333094400, '发表有图分享　【拍拍彩钻节】2012春夏季新款韩版女装修身连衣裙', 79, 'share', 'image'),
(98, 4, 5, 1333170185, 1333094400, '发表有图分享　101010 CONVERSE/匡威 中性高帮帆布鞋 专柜正品', 80, 'share', 'image'),
(99, 4, 5, 1333170236, 1333094400, '发表有图分享　adidas 阿迪达斯 三叶草 NIZZA HI 蓝橙帆布 V23023', 81, 'share', 'image'),
(100, 4, 5, 1333170307, 1333094400, '发表有图分享　品牌特卖正品adidas阿迪达斯12新款男子跑步鞋男鞋运动鞋V21934', 82, 'share', 'image'),
(101, 4, 1, 1333180985, 1333180800, '会员登陆', 4, 'user', 'login'),
(102, 4, 5, 1333209699, 1333180800, '发表有图分享　韩都衣舍●现货●韩国2012春装新款韩版铅笔小脚牛仔裤GS1915緈', 83, 'share', 'image'),
(103, 4, 5, 1333209828, 1333180800, '发表有图分享　【一淘专享立减】韩都衣舍韩夏新女装V领条纹短袖大码T恤9A35喆莨', 84, 'share', 'image'),
(104, 4, 5, 1333209898, 1333180800, '发表有图分享　韩都衣舍●韩国2012春装新款韩版女装V领七分袖连衣裙HN1030娋', 85, 'share', 'image'),
(105, 4, 1, 1333303093, 1333267200, '会员登陆', 4, 'user', 'login'),
(106, 4, 5, 1333303278, 1333267200, '发表有图分享　淘淘小屋 ——春暖待花 开韩版双层镂空无袖蕾丝T恤', 86, 'share', 'image'),
(107, 4, 1, 1333392797, 1333353600, '会员登陆', 4, 'user', 'login'),
(108, 2, 1, 1333408713, 1333353600, '会员登陆', 2, 'user', 'login'),
(109, 1, 1, 1333523555, 1333440000, '会员登陆', 1, 'user', 'login'),
(110, 1, 1, 1333556228, 1333526400, '会员登陆', 1, 'user', 'login'),
(111, 1, 5, 1333565531, 1333526400, '发表有图分享　春秋季韩国女款 巴黎纱长款丝巾圆点水玉点围巾 360度的完美q180', 87, 'share', 'image'),
(112, 1, 5, 1333565761, 1333526400, '发表有图分享　兰诗雨 围巾丝巾2012新款日韩国春夏秋真丝超长女士披肩LSY420062', 88, 'share', 'image'),
(113, 5, 10, 1333566892, 1333526400, '注册会员', 5, 'user', 'register'),
(114, 5, 10, 1333566892, 1333526400, '上传头像', 5, 'user', 'avatar'),
(115, 5, 1, 1333566893, 1333526400, '会员登陆', 5, 'user', 'login'),
(116, 1, 5, 1333609638, 1333526400, '发表有图分享　2012夏季新款 蝴蝶结豹纹印花超长真丝大丝巾女 正品桑蚕丝603008', 89, 'share', 'image'),
(117, 1, 1, 1333641111, 1333612800, '会员登陆', 1, 'user', 'login'),
(118, 1, 5, 1333641219, 1333612800, '发表有图分享　茗琳正品采用施华洛世奇元素天使泪 水晶项链 女 短款 锁骨 韩国', 90, 'share', 'image'),
(119, 4, 5, 1333642190, 1333612800, '发表有图分享　东联现代简约落地灯卧室时尚灯具客厅宜家意大利钓鱼灯饰2103-20', 91, 'share', 'image'),
(120, 4, 5, 1333642327, 1333612800, '发表有图分享　[满千包邮]英伦老上海风格 灯具 客厅卧室 实木 可调光落地灯018', 92, 'share', 'image'),
(121, 4, 1, 1333751762, 1333699200, '会员登陆', 4, 'user', 'login'),
(122, 4, 5, 1333751844, 1333699200, '发表有图分享　艾唯莎2012新款正品时尚百搭女士太阳镜太阳眼镜超大框墨镜明星款', 93, 'share', 'image'),
(123, 4, 5, 1333751946, 1333699200, '发表有图分享　淘金币 帕莎太阳镜 正品女12新款T6859明星款 墨镜 时尚太阳镜', 94, 'share', 'image'),
(124, 4, 5, 1333752257, 1333699200, '发表有图分享　明星同款板材偏光百搭时尚超大框 太阳眼镜 墨镜 蛤蟆镜 太阳镜女', 95, 'share', 'image'),
(125, 4, 5, 1333752323, 1333699200, '发表有图分享　2012男女士黑超墨镜欧美时尚复古蛤蟆镜明星款潮人眼镜正品太阳镜', 96, 'share', 'image'),
(126, 4, 5, 1333752475, 1333699200, '发表有图分享　达思龙正品太阳镜 女士时尚复古墨镜 太阳眼镜 蛤蟆镜 新品限售', 97, 'share', 'image'),
(127, 4, 5, 1333752732, 1333699200, '发表有图分享　2012新款时尚方框太阳镜 女士 经典百搭大框太阳眼镜 墨镜 偏光镜', 98, 'share', 'image'),
(128, 4, 1, 1333777876, 1333699200, '发表普通分享　很有气质的一款，几何图案加上母贝石交错。尤其搭配一些纯色系的衣服 很有味道哦。', 99, 'share', 'default'),
(129, 4, 5, 1333777926, 1333699200, '发表有图分享　很有气质的一款，几何图案加上母贝石交错。尤其搭配一些纯色系的衣服 很有味道哦。', 100, 'share', 'image'),
(130, 1, 1, 1333781327, 1333699200, '会员登陆', 1, 'user', 'login'),
(131, 1, 5, 1333781529, 1333699200, '发表有图分享　2012新款 qlady特价包邮饰品时尚女款配饰镂空心形粉/紫水晶手链', 101, 'share', 'image'),
(132, 1, 5, 1333781660, 1333699200, '发表有图分享　亮粉超高跟，闪光性感的诱惑和距离，不容忽视的华丽，不易攀登的艺术感超高跟。精致花朵缀饰，每一处细节都是完美雕琢', 102, 'share', 'image'),
(133, 1, 5, 1333781850, 1333699200, '发表有图分享　四叶草玫瑰金项链，让四叶草带给你好运吧', 103, 'share', 'image'),
(134, 1, 5, 1333781993, 1333699200, '发表有图分享　体贴的呵护配方，富含丰富水分充分滋润双唇。让你的唇喜感丰盈，不经意间的撅嘴也会散发无限魅力。', 104, 'share', 'image'),
(135, 4, 1, 1333785999, 1333785600, '会员登陆', 4, 'user', 'login'),
(136, 3, 5, 1333823926, 1333785600, '发表有图分享　这款香水专为女性设计。热情的水果香和花香融为一体，让人振奋。它含有柑橘，粉红葡萄柚，主调是橙花，鸡蛋花和兰花，而它的基调却是麝香，檀香和焦糖布丁。', 105, 'share', 'image'),
(137, 4, 5, 1333831842, 1333785600, '发表有图分享　颜色和想象中的一样好， 抱着也很舒服，非常可爱的样子，虽然是送给朋友的礼物，我发现深深地爱上这宝贝了，还给我了个小礼物，哈哈，谢谢啦，这两天我会在光顾你们店的哦， 唯一有点不好，有的线头没处理好，不过没有什么影响。', 106, 'share', 'image'),
(138, 4, 5, 1333831949, 1333785600, '发表有图分享　双人熊哥靠枕，有2个尺寸可以选择，满足您的不同需要，也不用担心弄脏了怎么办，枕套后的拉链是可以拆洗的哦~~', 107, 'share', 'image'),
(139, 1, -20, 1333832696, 1333785600, '删除有图主题　11新款代购 娇韵诗调和身体护理油100ml 防妊娠纹紧致 预定', 54, 'delete_share', 'image'),
(140, 3, -20, 1333832748, 1333785600, '删除有图主题　这款香水专为女性设计。热情的水果香和花香融为一体，让人振奋。它含有柑橘，粉红葡萄柚，主调是橙花，鸡蛋花和兰花，而它的基调却是麝香，檀香和焦糖布丁。', 105, 'delete_share', 'image'),
(141, 1, -20, 1333832844, 1333785600, '删除有图主题　佳能（Canon） EOS 600D 单反套机（EF-S 18-55mm f/3.5-5.6 IS II 镜头）', 17, 'delete_share', 'image'),
(142, 4, -20, 1333832861, 1333785600, '删除有图主题　东联现代简约落地灯卧室时尚灯具客厅宜家意大利钓鱼灯饰2103-20', 91, 'delete_share', 'image'),
(143, 4, 5, 1333833055, 1333785600, '发表有图分享　棉布餐垫吸水性强、便于清洗，保护和装饰餐桌再好不过一块耐人寻味的餐垫，和精致的餐具搭配使用，本身就是一种生活品质的表现吧', 108, 'share', 'image'),
(144, 4, 5, 1333835834, 1333785600, '发表有图分享　夏季雪纺连衣裙，小清新！', 109, 'share', 'image');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_statistics`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_statistics` (
  `uid` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `last_time` int(11) DEFAULT '0',
  UNIQUE KEY `uid` (`uid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_statistics`
--

INSERT INTO `fanwe_user_statistics` (`uid`, `type`, `num`, `last_time`) VALUES
(1, 7, 21, 1333699200),
(1, 1, 7, 1333699200),
(1, 2, 1, 1333699200),
(1, 3, 1, 1333699200),
(2, 7, 1, 1333353600),
(2, 1, 1, 1333353600),
(2, 2, 1, 1333353600),
(2, 3, 1, 1333353600),
(1, 4, 1, 1333699200),
(3, 7, 5, 1333785600),
(3, 2, 1, 1333785600),
(3, 1, 2, 1332921600),
(1, 5, 1, 1333699200),
(3, 3, 1, 1333785600),
(4, 7, 21, 1333785600),
(4, 2, 1, 1333785600),
(4, 3, 1, 1333785600),
(4, 1, 2, 1333785600),
(5, 7, 21, 1333526400),
(5, 1, 1, 1333526400);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_status`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_status` (
  `uid` int(11) NOT NULL,
  `reg_ip` char(15) DEFAULT '',
  `last_ip` char(15) DEFAULT '',
  `last_time` int(11) DEFAULT '0',
  `last_activity` int(11) DEFAULT '0',
  `active_hash` varchar(255) DEFAULT '',
  `reset_hash` varchar(255) DEFAULT '',
  `edit_name_count` smallint(5) DEFAULT '0',
  `black_users` text,
  `medals` text,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_status`
--

INSERT INTO `fanwe_user_status` (`uid`, `reg_ip`, `last_ip`, `last_time`, `last_activity`, `active_hash`, `reset_hash`, `edit_name_count`, `black_users`, `medals`) VALUES
(1, '127.0.0.1', '127.0.0.1', 1332009985, 1332009985, '', '', 1, '', '1'),
(2, '118.26.196.188', '118.26.196.188', 1332185146, 1332185146, '', '', 0, '', '1'),
(3, '59.64.255.241', '59.64.255.241', 1332489555, 1332489555, '', '', 0, '', '1'),
(4, '59.64.255.241', '59.64.255.241', 1333005691, 1333005691, '', '', 0, '', '1'),
(5, '123.116.132.236', '123.116.132.236', 1333566892, 1333566892, '', '', 0, '', '1');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_tags`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_tags` (
  `tag_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) DEFAULT '',
  `sort` smallint(5) DEFAULT '100',
  PRIMARY KEY (`tag_id`),
  KEY `tag_name` (`tag_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- 转存表中的数据 `fanwe_user_tags`
--

INSERT INTO `fanwe_user_tags` (`tag_id`, `tag_name`, `sort`) VALUES
(1, '擅长找白菜', 100),
(2, '擅长找白菜', 100),
(3, '擅长搭配', 100),
(4, '擅长找差价', 100),
(5, '擅长找同款', 100),
(6, '擅长找原单', 100),
(7, '擅长组团', 100),
(8, '擅长找好店', 100),
(9, '擅长分享团购', 100),
(10, '擅长护肤', 100),
(11, '擅长彩妆', 100),
(12, '擅长美白', 100),
(13, '擅长护发', 100),
(14, '擅长减重', 100),
(15, '擅长淘包包', 100),
(16, '擅长淘配饰', 100),
(17, '擅长淘鞋子', 100),
(18, '格子控', 100),
(19, '细节控', 100),
(20, '豹纹控', 100),
(21, '黑色控', 100),
(22, '丝袜控', 100),
(23, '色彩控', 100),
(24, '条纹控', 100),
(25, '波点控', 100),
(26, '白菜控', 100),
(27, '蓝色控', 100),
(28, '衬衫控', 100),
(29, '蕾丝控', 100),
(30, '原单控', 100),
(31, '美瞳控', 100),
(32, '蝴蝶结控', 100),
(33, '粉色控', 100),
(34, '鞋子控', 100),
(35, '牛仔控', 100),
(36, '碎花控', 100),
(37, '平底鞋控', 100),
(38, '高跟鞋控', 100),
(39, '真丝控', 100),
(40, '护肤控', 100),
(41, '饰品控', 100),
(42, '面膜控', 100),
(43, '棉麻控', 100),
(44, '学院风格', 100),
(45, '欧美风格', 100),
(46, '混搭风格', 100),
(47, '甜美风格', 100),
(48, '清新风格', 100),
(49, '英伦风格', 100),
(50, 'vintage复古风格', 100),
(51, 'BF风格', 100),
(52, '极简风格', 100),
(53, '中性风格', 100),
(54, '朋克风格', 100),
(55, '摇滚风格', 100),
(56, '森女风格', 100),
(57, '洛丽塔风格', 100),
(58, '公主风格', 100),
(59, '名媛风格', 100),
(60, '波西米亚风格', 100),
(61, '民族风格', 100),
(62, '休闲风格', 100),
(63, '御姐风格', 100),
(64, '性感风格', 100),
(65, '模特', 100),
(66, '造型师', 100),
(67, '品牌工作人员', 100),
(68, '美容编辑', 100),
(69, '时尚编辑', 100),
(70, '时尚媒体', 100),
(71, '时装买手', 100),
(72, '我在其它网站是达人', 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_word`
--

CREATE TABLE IF NOT EXISTS `fanwe_word` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cid` smallint(6) NOT NULL DEFAULT '0',
  `word` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(2) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `cid` (`cid`),
  KEY `word` (`word`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `fanwe_word`
--

INSERT INTO `fanwe_word` (`id`, `cid`, `word`, `replacement`, `type`, `status`) VALUES
(1, 1, '法轮', '', 1, 1),
(2, 1, 'fa轮', '', 1, 1),
(3, 1, '9评', '', 1, 1),
(4, 1, '九凭', '', 1, 1),
(5, 1, 'LHZ', '', 1, 1),
(6, 1, '自焚', '', 1, 1),
(7, 1, '藏字石', '', 1, 1),
(8, 1, '李洪X', '', 1, 1),
(9, 1, '9ping', '', 1, 1),
(10, 1, '九ping', '', 1, 1),
(11, 1, '自fen', '', 1, 1),
(12, 1, '法X功', '', 1, 1),
(13, 1, '轮子功', '', 1, 1),
(14, 2, '美女上门', '***', 2, 1),
(15, 2, '上网文凭', '***', 2, 1),
(16, 2, '赌博机', '***', 2, 1),
(17, 2, '卖血', '***', 2, 1),
(18, 2, '出售肾', '***', 2, 1),
(19, 2, '出售器官', '***', 2, 1),
(20, 2, '眼角膜', '***', 2, 1),
(21, 2, '求肾', '***', 2, 1),
(22, 2, '换肾', '***', 2, 1),
(23, 2, '有偿肾', '***', 2, 1),
(24, 2, '预测答案', '***', 2, 1),
(25, 2, '考前预测', '***', 2, 1),
(26, 2, '押题', '***', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_word_type`
--

CREATE TABLE IF NOT EXISTS `fanwe_word_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_word_type`
--

INSERT INTO `fanwe_word_type` (`id`, `name`, `status`) VALUES
(1, '政治', 1),
(2, '社会', 1);

-- --------------------------------------------------------

--
-- 表的结构 `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_approved` (`comment_approved`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `wp_links`
--

INSERT INTO `wp_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_visible`, `link_owner`, `link_rating`, `link_updated`, `link_rel`, `link_notes`, `link_rss`) VALUES
(1, 'http://codex.wordpress.org/', 'Documentation', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', ''),
(2, 'http://wordpress.org/news/', 'WordPress Blog', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', 'http://wordpress.org/news/feed/'),
(3, 'http://wordpress.org/extend/ideas/', 'Suggest Ideas', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', ''),
(4, 'http://wordpress.org/support/', 'Support Forum', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', ''),
(5, 'http://wordpress.org/extend/plugins/', 'Plugins', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', ''),
(6, 'http://wordpress.org/extend/themes/', 'Themes', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', ''),
(7, 'http://planet.wordpress.org/', 'WordPress Planet', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=688 ;

--
-- 转存表中的数据 `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `blog_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 0, 'siteurl', 'http://blog.kuhkuh.com', 'yes'),
(2, 0, 'blogname', '陈少峰个人博客', 'yes'),
(3, 0, 'blogdescription', '文化管理哲学家', 'yes'),
(4, 0, 'users_can_register', '1', 'yes'),
(5, 0, 'admin_email', 'm23linzhe@gmail.com', 'yes'),
(6, 0, 'start_of_week', '1', 'yes'),
(7, 0, 'use_balanceTags', '0', 'yes'),
(8, 0, 'use_smilies', '1', 'yes'),
(9, 0, 'require_name_email', '1', 'yes'),
(10, 0, 'comments_notify', '1', 'yes'),
(11, 0, 'posts_per_rss', '10', 'yes'),
(12, 0, 'rss_use_excerpt', '0', 'yes'),
(13, 0, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 0, 'mailserver_login', 'login@example.com', 'yes'),
(15, 0, 'mailserver_pass', 'password', 'yes'),
(16, 0, 'mailserver_port', '110', 'yes'),
(17, 0, 'default_category', '1', 'yes'),
(18, 0, 'default_comment_status', 'open', 'yes'),
(19, 0, 'default_ping_status', 'open', 'yes'),
(20, 0, 'default_pingback_flag', '1', 'yes'),
(21, 0, 'default_post_edit_rows', '20', 'yes'),
(22, 0, 'posts_per_page', '10', 'yes'),
(23, 0, 'date_format', 'Y 年 n 月 j 日', 'yes'),
(24, 0, 'time_format', 'a g:i', 'yes'),
(25, 0, 'links_updated_date_format', 'Y 年 n 月 j 日a g:i', 'yes'),
(26, 0, 'links_recently_updated_prepend', '<em>', 'yes'),
(27, 0, 'links_recently_updated_append', '</em>', 'yes'),
(28, 0, 'links_recently_updated_time', '120', 'yes'),
(29, 0, 'comment_moderation', '', 'yes'),
(30, 0, 'moderation_notify', '1', 'yes'),
(31, 0, 'permalink_structure', '', 'yes'),
(32, 0, 'gzipcompression', '0', 'yes'),
(33, 0, 'hack_file', '0', 'yes'),
(34, 0, 'blog_charset', 'UTF-8', 'yes'),
(35, 0, 'moderation_keys', '', 'no'),
(36, 0, 'active_plugins', 'a:1:{i:0;s:41:"wordpress-importer/wordpress-importer.php";}', 'yes'),
(37, 0, 'home', 'http://blog.kuhkuh.com', 'yes'),
(38, 0, 'category_base', '', 'yes'),
(39, 0, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(40, 0, 'advanced_edit', '0', 'yes'),
(41, 0, 'comment_max_links', '2', 'yes'),
(42, 0, 'gmt_offset', '0', 'yes'),
(43, 0, 'default_email_category', '1', 'yes'),
(44, 0, 'recently_edited', 'a:5:{i:0;s:78:"/home/blogchentbfljo8gqcrhyern/wwwroot/wp-content/themes/calotropis/footer.php";i:2;s:77:"/home/blogchentbfljo8gqcrhyern/wwwroot/wp-content/themes/calotropis/style.css";i:3;s:83:"/home/blogchentbfljo8gqcrhyern/wwwroot/wp-content/themes/calotropis/includes/bg.php";i:4;s:77:"/home/blogchentbfljo8gqcrhyern/wwwroot/wp-content/themes/calotropis/index.php";i:5;s:87:"/home/blogchentbfljo8gqcrhyern/wwwroot/wp-content/themes/calotropis/includes/header.php";}', 'no'),
(45, 0, 'template', 'calotropis', 'yes'),
(46, 0, 'stylesheet', 'calotropis', 'yes'),
(47, 0, 'comment_whitelist', '1', 'yes'),
(48, 0, 'blacklist_keys', '', 'no'),
(49, 0, 'comment_registration', '1', 'yes'),
(50, 0, 'rss_language', 'en', 'yes'),
(51, 0, 'html_type', 'text/html', 'yes'),
(52, 0, 'use_trackback', '0', 'yes'),
(53, 0, 'default_role', 'subscriber', 'yes'),
(54, 0, 'db_version', '18226', 'yes'),
(55, 0, 'uploads_use_yearmonth_folders', '1', 'yes'),
(56, 0, 'upload_path', '', 'yes'),
(57, 0, 'blog_public', '1', 'yes'),
(58, 0, 'default_link_category', '2', 'yes'),
(59, 0, 'show_on_front', 'posts', 'yes'),
(60, 0, 'tag_base', '', 'yes'),
(61, 0, 'show_avatars', '1', 'yes'),
(62, 0, 'avatar_rating', 'G', 'yes'),
(63, 0, 'upload_url_path', '', 'yes'),
(64, 0, 'thumbnail_size_w', '150', 'yes'),
(65, 0, 'thumbnail_size_h', '150', 'yes'),
(66, 0, 'thumbnail_crop', '1', 'yes'),
(67, 0, 'medium_size_w', '300', 'yes'),
(68, 0, 'medium_size_h', '300', 'yes'),
(69, 0, 'avatar_default', 'mystery', 'yes'),
(70, 0, 'enable_app', '0', 'yes'),
(71, 0, 'enable_xmlrpc', '0', 'yes'),
(72, 0, 'large_size_w', '1024', 'yes'),
(73, 0, 'large_size_h', '1024', 'yes'),
(74, 0, 'image_default_link_type', 'file', 'yes'),
(75, 0, 'image_default_size', '', 'yes'),
(76, 0, 'image_default_align', '', 'yes'),
(77, 0, 'close_comments_for_old_posts', '', 'yes'),
(78, 0, 'close_comments_days_old', '14', 'yes'),
(79, 0, 'thread_comments', '1', 'yes'),
(80, 0, 'thread_comments_depth', '5', 'yes'),
(81, 0, 'page_comments', '', 'yes'),
(82, 0, 'comments_per_page', '50', 'yes'),
(83, 0, 'default_comments_page', 'newest', 'yes'),
(84, 0, 'comment_order', 'asc', 'yes'),
(85, 0, 'sticky_posts', 'a:0:{}', 'yes'),
(86, 0, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(87, 0, 'widget_text', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(88, 0, 'widget_rss', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(89, 0, 'timezone_string', '', 'yes'),
(90, 0, 'embed_autourls', '1', 'yes'),
(91, 0, 'embed_size_w', '', 'yes'),
(92, 0, 'embed_size_h', '600', 'yes'),
(93, 0, 'page_for_posts', '0', 'yes'),
(94, 0, 'page_on_front', '0', 'yes'),
(95, 0, 'default_post_format', '0', 'yes'),
(96, 0, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(97, 0, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 0, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 0, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 0, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 0, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 0, 'sidebars_widgets', 'a:2:{s:19:"wp_inactive_widgets";a:14:{i:0;s:20:"itx_tabbed_sidebar-2";i:1;s:7:"pages-2";i:2;s:10:"calendar-2";i:3;s:7:"links-2";i:4;s:6:"text-2";i:5;s:5:"rss-2";i:6;s:11:"tag_cloud-2";i:7;s:10:"nav_menu-2";i:8;s:8:"search-2";i:9;s:14:"recent-posts-2";i:10;s:17:"recent-comments-2";i:11;s:10:"archives-2";i:12;s:12:"categories-2";i:13;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(103, 0, 'cron', 'a:3:{i:1332959571;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1333002785;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(104, 0, '_transient_doing_cron', '1332983800', 'yes'),
(105, 0, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:2:{i:0;O:8:"stdClass":9:{s:8:"response";s:7:"upgrade";s:8:"download";s:49:"http://cn.wordpress.org/wordpress-3.3.1-zh_CN.zip";s:6:"locale";s:5:"zh_CN";s:8:"packages";O:8:"stdClass":4:{s:4:"full";s:49:"http://cn.wordpress.org/wordpress-3.3.1-zh_CN.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;}s:7:"current";s:5:"3.3.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.2";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":9:{s:8:"response";s:7:"upgrade";s:8:"download";s:40:"http://wordpress.org/wordpress-3.3.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":4:{s:4:"full";s:40:"http://wordpress.org/wordpress-3.3.1.zip";s:10:"no_content";s:51:"http://wordpress.org/wordpress-3.3.1-no-content.zip";s:11:"new_bundled";s:52:"http://wordpress.org/wordpress-3.3.1-new-bundled.zip";s:7:"partial";b:0;}s:7:"current";s:5:"3.3.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.2";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1332946428;s:15:"version_checked";s:5:"3.2.1";}', 'yes'),
(149, 0, '_site_transient_update_plugins', 'O:8:"stdClass":3:{s:12:"last_checked";i:1332946428;s:7:"checked";a:3:{s:19:"akismet/akismet.php";s:5:"2.5.3";s:9:"hello.php";s:3:"1.6";s:41:"wordpress-importer/wordpress-importer.php";s:3:"0.5";}s:8:"response";a:2:{s:19:"akismet/akismet.php";O:8:"stdClass":5:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:11:"new_version";s:5:"2.5.5";s:3:"url";s:44:"http://wordpress.org/extend/plugins/akismet/";s:7:"package";s:55:"http://downloads.wordpress.org/plugin/akismet.2.5.5.zip";}s:41:"wordpress-importer/wordpress-importer.php";O:8:"stdClass":6:{s:2:"id";s:5:"14975";s:4:"slug";s:18:"wordpress-importer";s:11:"new_version";s:3:"0.6";s:14:"upgrade_notice";s:39:"Support for exports from WordPress 3.4.";s:3:"url";s:55:"http://wordpress.org/extend/plugins/wordpress-importer/";s:7:"package";s:64:"http://downloads.wordpress.org/plugin/wordpress-importer.0.6.zip";}}}', 'yes'),
(107, 0, 'widget_pages', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(108, 0, 'widget_calendar', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(109, 0, 'widget_links', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(110, 0, 'widget_tag_cloud', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(111, 0, 'widget_nav_menu', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(112, 0, 'widget_widget_twentyeleven_ephemera', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(116, 0, 'zh_cn_language_pack_enable_backend_style_modifications', '1', 'yes'),
(686, 0, '_site_transient_timeout_theme_roots', '1332953629', 'yes'),
(687, 0, '_site_transient_theme_roots', 'a:3:{s:10:"calotropis";s:7:"/themes";s:12:"twentyeleven";s:7:"/themes";s:9:"twentyten";s:7:"/themes";}', 'yes'),
(115, 0, '_site_transient_update_themes', 'O:8:"stdClass":3:{s:12:"last_checked";i:1332946431;s:7:"checked";a:3:{s:10:"calotropis";s:5:"1.5.2";s:12:"twentyeleven";s:3:"1.2";s:9:"twentyten";s:3:"1.2";}s:8:"response";a:2:{s:12:"twentyeleven";a:3:{s:11:"new_version";s:3:"1.3";s:3:"url";s:47:"http://wordpress.org/extend/themes/twentyeleven";s:7:"package";s:64:"http://wordpress.org/extend/themes/download/twentyeleven.1.3.zip";}s:9:"twentyten";a:3:{s:11:"new_version";s:3:"1.3";s:3:"url";s:44:"http://wordpress.org/extend/themes/twentyten";s:7:"package";s:61:"http://wordpress.org/extend/themes/download/twentyten.1.3.zip";}}}', 'yes'),
(117, 0, 'zh_cn_language_pack_enable_chinese_fake_oembed', '1', 'yes'),
(118, 0, '_site_transient_timeout_browser_b7d3d99a3c38ba38bc4a978e2828d6e8', '1320215582', 'yes'),
(119, 0, '_site_transient_browser_b7d3d99a3c38ba38bc4a978e2828d6e8', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"14.0.835.202";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"13";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(120, 0, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:22:"http://blog.kuhkuh.com";s:4:"link";s:98:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://blog.kuhkuh.com/";s:3:"url";s:136:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://blogchen.gotoip1.com/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:24:"http://cn.wordpress.org/";s:3:"url";s:29:"http://cn.wordpress.org/feed/";s:5:"title";s:22:"WordPress China 博客";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:23:"其它 WordPress 新闻";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(173, 0, 'current_theme', 'Calotropis', 'yes'),
(122, 0, 'can_compress_scripts', '0', 'yes'),
(199, 0, '_transient_timeout_feed_mod_3de02e4d02f53c9aecf0db46b39b4500', '1319729699', 'no'),
(200, 0, '_transient_feed_mod_3de02e4d02f53c9aecf0db46b39b4500', '1319686499', 'no'),
(201, 0, '_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f', '1319729699', 'no'),
(202, 0, '_transient_dash_20494a3d90a6669585674ed0eb8dcd8f', '<p>这个控制板小工具会查询 <a href="http://blogsearch.google.com/">Google 博客搜索</a>。当有其它博客链接到您的站点时，它们会显示在这里。目前还未找到引入的的链接，但您不用急。</p>\n', 'no'),
(203, 0, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1319729705', 'no'),
(204, 0, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>RSS 错误</strong>：WP HTTP Error: Operation timed out after 10 seconds with 11584 bytes received</p></div>', 'no'),
(209, 0, '_transient_timeout_feed_mod_57bc725ad6568758915363af670fd8bc', '1319729718', 'no'),
(210, 0, '_transient_feed_mod_57bc725ad6568758915363af670fd8bc', '1319686518', 'no'),
(197, 0, '_transient_timeout_feed_3de02e4d02f53c9aecf0db46b39b4500', '1319729699', 'no'),
(198, 0, '_transient_feed_3de02e4d02f53c9aecf0db46b39b4500', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:4:"\n  \n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:33:"\n    \n    \n    \n    \n    \n    \n  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:55:"link:http://blogchen.gotoip1.com/ - Google 網誌搜尋";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:94:"http://www.google.com.hk/search?ie=utf-8&q=link:http://blogchen.gotoip1.com/&tbm=blg&tbs=sbd:1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:85:"找不到和您的查詢「<b>link:http://blogchen.gotoip1.com/</b>」相符的資料";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://a9.com/-/spec/opensearch/1.1/";a:3:{s:12:"totalResults";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:10:"startIndex";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:12:"itemsPerPage";a:1:{i:0;a:5:{s:4:"data";s:2:"10";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:8:{s:12:"content-type";s:22:"text/xml; charset=Big5";s:4:"date";s:29:"Thu, 27 Oct 2011 03:35:18 GMT";s:7:"expires";s:2:"-1";s:13:"cache-control";s:18:"private, max-age=0";s:10:"set-cookie";a:2:{i:0;s:151:"PREF=ID=5524aed3fa5d284b:FF=0:NW=1:TM=1319686518:LM=1319686518:S=aWM59QtHoeG8_OUB; expires=Sat, 26-Oct-2013 03:35:18 GMT; path=/; domain=.google.com.hk";i:1;s:215:"NID=52=VY-xFqH1RFM-k3SHNYhND1k1Gawwxq9C4IkaqqONmCiJLZ87Rbw7QLc8N0-9pi7GsyfYUCxegC9eiEwzO-uu3RALfYqk28AMKO-0cnRgKRFwXGnPX-fGeX1wFFqAZwdx; expires=Fri, 27-Apr-2012 03:35:18 GMT; path=/; domain=.google.com.hk; HttpOnly";}s:6:"server";s:3:"gws";s:16:"x-xss-protection";s:13:"1; mode=block";s:15:"x-frame-options";s:10:"SAMEORIGIN";}s:5:"build";s:14:"20090627192103";}', 'no'),
(207, 0, '_transient_timeout_feed_57bc725ad6568758915363af670fd8bc', '1319729718', 'no'),
(208, 0, '_transient_feed_57bc725ad6568758915363af670fd8bc', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress Plugins » View: Newest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:47:"http://wordpress.org/extend/plugins/browse/new/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress Plugins » View: Newest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Oct 2011 03:30:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"idealien on "Idealien Rideshare"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.org/extend/plugins/idealien-rideshare/#post-31532";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2011 17:24:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31532@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:123:"A custom post type for you &#38; your community to get to where you want to go using less gas and having more fun together.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"idealien";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"larsstorm on "SEO404"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/extend/plugins/seo404/#post-31519";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2011 10:02:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31519@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:90:"SEO404 redirects to the Blog front page with a 301. No more 404 errors on Google/Bing/etc.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"larsstorm";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"shazdeh on "Make it Yours"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"http://wordpress.org/extend/plugins/make-it-yours/#post-31528";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2011 14:57:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31528@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:89:"Gives you two panels to insert custom CSS and PHP codes, so you can customize your theme.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"shazdeh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"Matt Wiebe on "HTML Editor Type"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/extend/plugins/html-editor-type/#post-31533";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2011 17:37:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31533@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:77:"Uses the lovely M+ 2m font in the HTML post editor for more beautiful typing.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Matt Wiebe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"CJ_Jackson on "MediaEmbedder"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"http://wordpress.org/extend/plugins/mediaembedder/#post-31534";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2011 17:42:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31534@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:113:"Multimedia Embedder that relies on template, unlike oEmbed, therefore allowing\nusers full control over html code.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"CJ_Jackson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:55:"Build A Thriving Practice on "Coaching Scorecard Maker"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"http://wordpress.org/extend/plugins/coaching-scorecard-maker/#post-31029";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 11 Oct 2011 16:15:13 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31029@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Coaching Scorecard Maker is a simple tool to create interactive scorecards, quizzes and assessments with customized analysis based on user input.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:25:"Build A Thriving Practice";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"cllaudiu on "PadiAct"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/extend/plugins/padiact/#post-31508";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 25 Oct 2011 19:50:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31508@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:58:"Enables PadiAct to be used on your Wordpress installation.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"cllaudiu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"Otto on "Rainbowify"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://wordpress.org/extend/plugins/rainbowify/#post-31504";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 25 Oct 2011 17:25:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31504@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:34:"The admin bar needs more rainbows.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Otto";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:43:"nostop8 on "Google AJAX Currency Convertor"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"http://wordpress.org/extend/plugins/google-ajax-currency-convertor/#post-31223";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 18 Oct 2011 08:23:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31223@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:79:"Currency Convertor that uses Google Calculator and update the results with AJAX";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"nostop8";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"mcshell on "WP Comment Access"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://wordpress.org/extend/plugins/wp-comment-access/#post-31517";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2011 08:32:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31517@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:142:"This plugin is used to specify the IP written comments, to reduce comment spam issues, can be used for SEO, managing multiple sites.By TCreate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"mcshell";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Abel S on "Events Planner"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wordpress.org/extend/plugins/events-planner/#post-30727";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 01 Oct 2011 00:58:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"30727@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:96:"Events Planner: A powerful next generation event management plugin, built with custom post types";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"Abel S";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"robinruet on "HQ Sand Box"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/extend/plugins/hq-sand-box/#post-31514";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2011 01:19:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31514@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:129:"It allows developer to develop a theme without changing the live theme in a same WordPress installation and without any multiblog";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"robinruet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:52:"userreport on "Demographic data in Google Analytics"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"http://wordpress.org/extend/plugins/demographic-data-in-google-analytics/#post-31520";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2011 10:08:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31520@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"A Plugin to add UserReport Analytics code on your pages, thus enabling the ability to transfer user data to Google Analytics. You simply enter your Us";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"userreport";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"fernandobt on "RubyConf Uruguay Ribbon"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wordpress.org/extend/plugins/rubyconf-uruguay-ribbon/#post-31510";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 25 Oct 2011 21:01:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31510@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:43:"Add a RubyConf Uruguay ribbon to your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"fernandobt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"GeekPress on "Color Admin Posts"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://wordpress.org/extend/plugins/color-admin-posts/#post-31513";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 26 Oct 2011 01:06:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"31513@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:136:"Change the background colors of the post/page within the admin based on the current status : Draft, Pending, Published, Future, Private.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"GeekPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:48:"http://wordpress.org/extend/plugins/rss/view/new";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Thu, 27 Oct 2011 03:35:32 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:19:"2011-10-26 17:24:05";s:14:"content-length";s:4:"7749";s:4:"x-nc";s:11:"HIT luv 139";}s:5:"build";s:14:"20090627192103";}', 'no'),
(205, 0, '_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0', '1319729712', 'no'),
(206, 0, '_transient_dash_aa95765b5cc111c56d5993d476b1c2f0', '<div class="rss-widget"><p><strong>RSS 错误</strong>：WP HTTP Error: Operation timed out after 10 seconds with 36200 out of 125860 bytes received</p></div>', 'no'),
(211, 0, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1319729721', 'no'),
(212, 0, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '<h4>最新插件</h4>\n<h5><a href=''http://wordpress.org/extend/plugins/idealien-rideshare/''>Idealien Rideshare</a></h5>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=idealien-rideshare&amp;_wpnonce=e5e81ddb8f&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Idealien Rideshare''>安装</a>)</span>\n<p>A custom post type for you &amp; your community to get to where you want to go using less gas and having more fun together.</p>\n', 'no'),
(145, 0, '_transient_timeout_plugin_slugs', '1319727953', 'no'),
(146, 0, '_transient_plugin_slugs', 'a:3:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";i:2;s:41:"wordpress-importer/wordpress-importer.php";}', 'no'),
(166, 0, 'category_children', 'a:3:{i:1;a:4:{i:0;i:5;i:1;i:10;i:2;i:11;i:3;i:14;}i:4;a:2:{i:0;i:9;i:1;i:15;}i:6;a:2:{i:0;i:12;i:1;i:13;}}', 'yes'),
(153, 0, 'theme_mods_twentyeleven', 'a:1:{s:18:"nav_menu_locations";a:1:{s:7:"primary";i:17;}}', 'yes'),
(154, 0, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(171, 0, '_site_transient_timeout_wporg_theme_feature_list', '1319652203', 'yes'),
(172, 0, '_site_transient_wporg_theme_feature_list', 'a:5:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:7:"Columns";a:6:{i:0;s:10:"one-column";i:1;s:11:"two-columns";i:2;s:13:"three-columns";i:3;s:12:"four-columns";i:4;s:12:"left-sidebar";i:5;s:13:"right-sidebar";}s:5:"Width";a:2:{i:0;s:11:"fixed-width";i:1;s:14:"flexible-width";}s:8:"Features";a:18:{i:0;s:8:"blavatar";i:1;s:10:"buddypress";i:2;s:17:"custom-background";i:3;s:13:"custom-colors";i:4;s:13:"custom-header";i:5;s:11:"custom-menu";i:6;s:12:"editor-style";i:7;s:21:"featured-image-header";i:8;s:15:"featured-images";i:9;s:20:"front-page-post-form";i:10;s:19:"full-width-template";i:11;s:12:"microformats";i:12;s:12:"post-formats";i:13;s:20:"rtl-language-support";i:14;s:11:"sticky-post";i:15;s:13:"theme-options";i:16;s:17:"threaded-comments";i:17;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes'),
(174, 0, 'theme_mods_calotropis', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:17;}s:12:"header_image";s:20:"random-default-image";}', 'yes'),
(175, 0, 'calotropis_default_style', 'apricot', 'yes'),
(176, 0, 'widget_itx_tabbed_sidebar', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(179, 0, 'calotropis_layout', 'a:11:{s:6:"column";s:2:"21";s:9:"min_width";s:3:"800";s:9:"max_width";s:4:"1600";s:8:"wrapping";s:5:"fixed";s:4:"wrap";s:4:"1000";s:7:"sidebar";s:3:"300";s:11:"sidebarunit";s:2:"px";s:5:"style";s:3:"sky";s:8:"innertop";s:1:"2";s:11:"innerbottom";s:1:"2";s:6:"footer";s:1:"4";}', 'yes'),
(180, 0, 'calotropis_front', 'a:16:{s:4:"type";s:11:"traditional";s:12:"archive_type";s:7:"excerpt";s:6:"column";s:1:"3";s:11:"featuredlim";s:2:"50";s:10:"excerptlim";s:2:"20";s:12:"excerpt_more";s:16:"...Read the Rest";s:4:"meta";a:2:{s:12:"commentcount";s:12:"commentcount";s:4:"left";s:8:"category";}s:9:"post_meta";a:6:{s:12:"commentcount";s:1:"1";s:4:"date";s:1:"1";s:6:"author";s:1:"0";s:10:"categories";s:1:"1";s:4:"tags";s:1:"1";s:11:"author_info";s:1:"0";}s:9:"featuredx";s:3:"450";s:9:"featuredy";s:3:"300";s:6:"thumbx";s:3:"150";s:6:"thumby";s:3:"100";s:5:"catch";s:1:"1";s:3:"not";s:1:"1";s:7:"fnotimg";s:0:"";s:6:"notimg";s:0:"";}', 'yes'),
(181, 0, 'calotropis_header', 'a:16:{s:5:"image";s:0:"";s:9:"bg_height";s:3:"200";s:9:"head_type";s:1:"0";s:4:"logo";s:73:"http://blog.kuhkuh.com/wp-content/themes/calotropis/images/calotropis.jpg";s:6:"repeat";s:9:"no-repeat";s:7:"h_align";s:6:"center";s:7:"v_align";s:3:"top";s:5:"scope";s:1:"1";s:10:"text_align";s:4:"left";s:6:"height";s:0:"";s:9:"font_size";s:5:"3.5em";s:14:"span_font_size";s:5:"1.8em";s:7:"bgcolor";s:7:"#000044";s:5:"color";s:7:"#ffffff";s:11:"hover_color";s:7:"#ddeeee";s:10:"span_color";s:7:"#eeffff";}', 'yes'),
(182, 0, 'calotropis_bg', 'a:7:{s:5:"image";s:0:"";s:10:"attachment";s:6:"scroll";s:6:"repeat";s:9:"no-repeat";s:7:"h_align";s:6:"center";s:7:"v_align";s:3:"top";s:7:"bgcolor";s:0:"";s:6:"resize";s:3:"100";}', 'yes'),
(183, 0, 'calotropis_menu', 'a:8:{s:7:"wp_menu";s:1:"1";s:4:"home";s:4:"Home";s:4:"show";s:3:"cat";s:5:"depth";s:1:"0";s:10:"cat_sortby";s:4:"name";s:9:"cat_order";s:3:"ASC";s:11:"page_sortby";s:10:"post_title";s:10:"page_order";s:3:"ASC";}', 'yes'),
(184, 0, 'calotropis_links', 'a:5:{s:3:"rss";s:33:"http://blog.kuhkuh.com/?feed=rss2";s:4:"crss";s:42:"http://blog.kuhkuh.com/?feed=comments-rss2";s:7:"twitter";s:0:"";s:8:"facebook";s:0:"";s:5:"plurk";s:0:"";}', 'yes'),
(185, 0, 'calotropis_single', 'a:2:{s:9:"post_meta";a:6:{s:12:"commentcount";s:1:"1";s:4:"date";s:1:"1";s:6:"author";s:12:"author_posts";s:10:"categories";s:1:"1";s:4:"tags";s:1:"1";s:11:"author_info";s:1:"0";}s:9:"page_meta";a:3:{s:12:"commentcount";s:1:"1";s:6:"author";s:12:"author_posts";s:11:"author_info";s:1:"0";}}', 'yes'),
(186, 0, 'calotropis_css', 'a:1:{s:6:"insert";s:0:"";}', 'yes'),
(187, 0, 'calotropis_misc', 'a:1:{s:7:"favicon";s:70:"http://blog.kuhkuh.com/wp-content/themes/calotropis/images/favicon.ico";}', 'yes'),
(188, 0, 'calotropis_reset', '', 'yes'),
(189, 0, '_transient_random_seed', 'e92af72c3fc32b816976597cb2cbddc6', 'yes'),
(190, 0, 'recently_activated', 'a:0:{}', 'yes'),
(191, 0, '_transient_timeout_settings_errors', '1319642645', 'no'),
(192, 0, '_transient_settings_errors', 'a:1:{i:0;a:4:{s:7:"setting";s:7:"general";s:4:"code";s:16:"settings_updated";s:7:"message";s:18:"设置已保存。";s:4:"type";s:7:"updated";}}', 'no');

-- --------------------------------------------------------

--
-- 表的结构 `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=393 ;

--
-- 转存表中的数据 `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(383, 82, '_menu_item_url', 'http://blog.kuhkuh.com'),
(382, 82, '_menu_item_xfn', ''),
(381, 82, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(380, 82, '_menu_item_target', ''),
(379, 82, '_menu_item_object', 'custom'),
(378, 82, '_menu_item_object_id', '82'),
(377, 82, '_menu_item_menu_item_parent', '0'),
(376, 82, '_menu_item_type', 'custom'),
(375, 80, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:4:"1920";s:6:"height";s:4:"2560";s:14:"hwstring_small";s:22:"height=''96'' width=''72''";s:4:"file";s:20:"2011/10/P1070019.jpg";s:5:"sizes";a:6:{s:9:"thumbnail";a:3:{s:4:"file";s:20:"P1070019-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}s:6:"medium";a:3:{s:4:"file";s:20:"P1070019-225x300.jpg";s:5:"width";s:3:"225";s:6:"height";s:3:"300";}s:5:"large";a:3:{s:4:"file";s:21:"P1070019-768x1024.jpg";s:5:"width";s:3:"768";s:6:"height";s:4:"1024";}s:14:"post-thumbnail";a:3:{s:4:"file";s:21:"P1070019-1000x288.jpg";s:5:"width";s:4:"1000";s:6:"height";s:3:"288";}s:13:"large-feature";a:3:{s:4:"file";s:21:"P1070019-1000x288.jpg";s:5:"width";s:4:"1000";s:6:"height";s:3:"288";}s:13:"small-feature";a:3:{s:4:"file";s:20:"P1070019-225x300.jpg";s:5:"width";s:3:"225";s:6:"height";s:3:"300";}}s:10:"image_meta";a:10:{s:8:"aperture";s:3:"2.8";s:6:"credit";s:0:"";s:6:"camera";s:7:"DMC-FX8";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1307357777";s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"5.8";s:3:"iso";s:2:"80";s:13:"shutter_speed";s:5:"0.004";s:5:"title";s:0:"";}}'),
(374, 80, '_wp_attached_file', '2011/10/P1070019.jpg'),
(370, 78, '_edit_last', '1'),
(371, 78, '_edit_lock', '1319616701:1'),
(363, 74, '_edit_lock', '1319679991:1'),
(367, 76, '_edit_lock', '1319679928:1'),
(359, 71, '_wp_attachment_metadata', 'a:6:{s:5:"width";s:3:"185";s:6:"height";s:3:"250";s:14:"hwstring_small";s:22:"height=''96'' width=''71''";s:4:"file";s:25:"2011/10/clip_image002.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:3:{s:4:"file";s:25:"clip_image002-150x150.jpg";s:5:"width";s:3:"150";s:6:"height";s:3:"150";}}s:10:"image_meta";a:10:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";}}'),
(358, 71, '_wp_attached_file', '2011/10/clip_image002.jpg'),
(357, 70, '_edit_lock', '1319614970:1'),
(356, 70, '_edit_last', '1'),
(362, 74, '_edit_last', '1'),
(348, 66, '_edit_last', '1'),
(349, 66, '_edit_lock', '1319614724:1'),
(334, 57, '_menu_item_url', ''),
(333, 57, '_menu_item_xfn', ''),
(332, 57, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(331, 57, '_menu_item_target', ''),
(330, 57, '_menu_item_object', 'category'),
(329, 57, '_menu_item_object_id', '1'),
(328, 57, '_menu_item_menu_item_parent', '0'),
(327, 57, '_menu_item_type', 'taxonomy'),
(366, 76, '_edit_last', '1'),
(325, 56, '_menu_item_url', ''),
(324, 56, '_menu_item_xfn', ''),
(323, 56, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(322, 56, '_menu_item_target', ''),
(321, 56, '_menu_item_object', 'page'),
(320, 56, '_menu_item_object_id', '22'),
(119, 22, '_wp_page_template', 'default'),
(310, 55, '_menu_item_menu_item_parent', '0'),
(309, 55, '_menu_item_type', 'taxonomy'),
(308, 54, '_menu_item_orphaned', '1319613254'),
(307, 54, '_menu_item_url', ''),
(306, 54, '_menu_item_xfn', ''),
(128, 24, '_menu_item_type', 'taxonomy'),
(129, 24, '_menu_item_menu_item_parent', '0'),
(130, 24, '_menu_item_object_id', '4'),
(131, 24, '_menu_item_object', 'category'),
(132, 24, '_menu_item_target', ''),
(133, 24, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(134, 24, '_menu_item_xfn', ''),
(135, 24, '_menu_item_url', ''),
(136, 25, '_menu_item_type', 'taxonomy'),
(137, 25, '_menu_item_menu_item_parent', '0'),
(138, 25, '_menu_item_object_id', '6'),
(139, 25, '_menu_item_object', 'category'),
(140, 25, '_menu_item_target', ''),
(141, 25, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(142, 25, '_menu_item_xfn', ''),
(143, 25, '_menu_item_url', ''),
(318, 56, '_menu_item_type', 'post_type'),
(319, 56, '_menu_item_menu_item_parent', '0'),
(316, 55, '_menu_item_url', ''),
(315, 55, '_menu_item_xfn', ''),
(314, 55, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(313, 55, '_menu_item_target', ''),
(152, 27, '_menu_item_type', 'taxonomy'),
(153, 27, '_menu_item_menu_item_parent', '55'),
(154, 27, '_menu_item_object_id', '14'),
(155, 27, '_menu_item_object', 'category'),
(156, 27, '_menu_item_target', ''),
(157, 27, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(158, 27, '_menu_item_xfn', ''),
(159, 27, '_menu_item_url', ''),
(160, 28, '_menu_item_type', 'taxonomy'),
(161, 28, '_menu_item_menu_item_parent', '55'),
(162, 28, '_menu_item_object_id', '5'),
(163, 28, '_menu_item_object', 'category'),
(164, 28, '_menu_item_target', ''),
(165, 28, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(166, 28, '_menu_item_xfn', ''),
(167, 28, '_menu_item_url', ''),
(168, 29, '_menu_item_type', 'taxonomy'),
(169, 29, '_menu_item_menu_item_parent', '55'),
(170, 29, '_menu_item_object_id', '10'),
(171, 29, '_menu_item_object', 'category'),
(172, 29, '_menu_item_target', ''),
(173, 29, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(174, 29, '_menu_item_xfn', ''),
(175, 29, '_menu_item_url', ''),
(176, 30, '_menu_item_type', 'taxonomy'),
(177, 30, '_menu_item_menu_item_parent', '55'),
(178, 30, '_menu_item_object_id', '11'),
(179, 30, '_menu_item_object', 'category'),
(180, 30, '_menu_item_target', ''),
(181, 30, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(182, 30, '_menu_item_xfn', ''),
(183, 30, '_menu_item_url', ''),
(184, 31, '_menu_item_type', 'taxonomy'),
(185, 31, '_menu_item_menu_item_parent', '24'),
(186, 31, '_menu_item_object_id', '15'),
(187, 31, '_menu_item_object', 'category'),
(188, 31, '_menu_item_target', ''),
(189, 31, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(190, 31, '_menu_item_xfn', ''),
(191, 31, '_menu_item_url', ''),
(192, 32, '_menu_item_type', 'taxonomy'),
(193, 32, '_menu_item_menu_item_parent', '24'),
(194, 32, '_menu_item_object_id', '9'),
(195, 32, '_menu_item_object', 'category'),
(196, 32, '_menu_item_target', ''),
(197, 32, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(198, 32, '_menu_item_xfn', ''),
(199, 32, '_menu_item_url', ''),
(200, 33, '_menu_item_type', 'taxonomy'),
(201, 33, '_menu_item_menu_item_parent', '25'),
(202, 33, '_menu_item_object_id', '13'),
(203, 33, '_menu_item_object', 'category'),
(204, 33, '_menu_item_target', ''),
(205, 33, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(206, 33, '_menu_item_xfn', ''),
(207, 33, '_menu_item_url', ''),
(208, 34, '_menu_item_type', 'taxonomy'),
(209, 34, '_menu_item_menu_item_parent', '25'),
(210, 34, '_menu_item_object_id', '12'),
(211, 34, '_menu_item_object', 'category'),
(212, 34, '_menu_item_target', ''),
(213, 34, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(214, 34, '_menu_item_xfn', ''),
(215, 34, '_menu_item_url', ''),
(312, 55, '_menu_item_object', 'category'),
(311, 55, '_menu_item_object_id', '1'),
(297, 51, '_edit_lock', '1319612849:1'),
(296, 51, '_edit_last', '1'),
(286, 22, '_edit_last', '1'),
(285, 22, '_edit_lock', '1319616940:1'),
(344, 63, '_edit_last', '1'),
(345, 63, '_edit_lock', '1319680098:1'),
(340, 60, '_edit_last', '1'),
(341, 60, '_edit_lock', '1319613866:1'),
(337, 58, '_edit_lock', '1319613661:1'),
(336, 58, '_edit_last', '1'),
(305, 54, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(304, 54, '_menu_item_target', ''),
(303, 54, '_menu_item_object', 'page'),
(302, 54, '_menu_item_object_id', '22'),
(301, 54, '_menu_item_menu_item_parent', '0'),
(300, 54, '_menu_item_type', 'post_type'),
(248, 39, '_menu_item_type', 'taxonomy'),
(249, 39, '_menu_item_menu_item_parent', '0'),
(250, 39, '_menu_item_object_id', '4'),
(251, 39, '_menu_item_object', 'category'),
(252, 39, '_menu_item_target', ''),
(253, 39, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(254, 39, '_menu_item_xfn', ''),
(255, 39, '_menu_item_url', ''),
(256, 40, '_menu_item_type', 'taxonomy'),
(257, 40, '_menu_item_menu_item_parent', '0'),
(258, 40, '_menu_item_object_id', '6'),
(259, 40, '_menu_item_object', 'category'),
(260, 40, '_menu_item_target', ''),
(261, 40, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(262, 40, '_menu_item_xfn', ''),
(263, 40, '_menu_item_url', ''),
(276, 45, '_menu_item_type', 'post_type'),
(277, 45, '_menu_item_menu_item_parent', '0'),
(278, 45, '_menu_item_object_id', '22'),
(279, 45, '_menu_item_object', 'page'),
(280, 45, '_menu_item_target', ''),
(281, 45, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(282, 45, '_menu_item_xfn', ''),
(283, 45, '_menu_item_url', '');

-- --------------------------------------------------------

--
-- 表的结构 `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` text NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- 转存表中的数据 `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(3, 1, '2011-10-26 06:33:02', '0000-00-00 00:00:00', '', '自动草稿', '', 'auto-draft', 'open', 'open', '', '', '', '', '2011-10-26 06:33:02', '0000-00-00 00:00:00', '', 0, 'http://blogchen.gotoip1.com/?p=3', 0, 'post', '', 0),
(47, 1, '2011-10-26 08:16:48', '2011-10-26 08:16:48', '<a href="http://blogchen.gotoip1.com/wp-content/uploads/2011/10/P1070019.jpg"><img class="alignnone size-medium wp-image-80" title="P1070019" src="http://blogchen.gotoip1.com/wp-content/uploads/2011/10/P1070019-225x300.jpg" alt="" width="225" height="300" /></a>这是示范页面。', '智者会客厅', '', 'inherit', 'open', 'open', '', '22-autosave', '', '', '2011-10-26 08:16:48', '2011-10-26 08:16:48', '', 22, 'http://blogchen.gotoip1.com/?p=47', 0, 'revision', '', 0),
(82, 1, '2011-10-26 15:13:56', '2011-10-26 15:13:56', '', '首页', '', 'publish', 'open', 'open', '', '%e9%a6%96%e9%a1%b5', '', '', '2011-10-26 15:13:56', '2011-10-26 15:13:56', '', 0, 'http://blog.kuhkuh.com/?p=82', 1, 'nav_menu_item', '', 0),
(22, 1, '2011-10-23 08:04:18', '2011-10-23 08:04:18', '<a href="http://blogchen.gotoip1.com/wp-content/uploads/2011/10/P1070019.jpg"><img class="alignnone size-medium wp-image-80" title="P1070019" src="http://blogchen.gotoip1.com/wp-content/uploads/2011/10/P1070019-225x300.jpg" alt="" width="225" height="300" /></a>这是示范页面。', '智者会客厅', '', 'publish', 'open', 'open', '', 'sample-page-3', '', '', '2011-10-26 08:15:39', '2011-10-26 08:15:39', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 0),
(83, 1, '2011-10-27 01:46:15', '2011-10-27 01:46:15', '<p style="text-align: right;"><strong>——读《文化产业商业模式》</strong></p>\n<p style="text-align: right;">                                 夏宝君</p>\n在文化产业研究领域，向来存在两种偏向，一种侧重“文化”二字，深挖文化产业中的文化意蕴，内容涉及文化政策、文化体制、文化消费、文化“软实力”、文化产业“走出去”战略等研究，这些研究倾向于宏观文化研究，将文化产业与文明发展、社会进步的历程挂钩；另一种则侧重“产业”二字，将文化产业置于大产业环境中，彰显其经济属性，其中包括文化市场、文化产业竞争力、文化产业区域发展、文化产业集群、文化产业结构、文化企业管理、文化产业可持续发展等等，这些研究则倾向于具体的产业发展策略，在经济发展的视域讨论文化产业这一经济现象。\n\n陈少峰先生的《文化产业商业模式》显然属于后一种研究偏向。\n\n本书以研究文化对经济和产业发展的驱动作用为基础，以文化企业为研究参照，以文化产业的商业模式为核心内容，着重分析了文化市场和文化产品的特性，并在大量的文化产业案例中抽离出60种通用商业模式，且系统分析了文化产业主要行业的商业模式选择问题，为文化产业的经营管理提供了全面和深入的策略建议，这在文化产业的研究中，尚属首次。\n\n&nbsp;\n\n<strong> </strong><strong>文化产业的商业气质</strong>\n\n&nbsp;\n\n早在19世纪，马克思在《1844年经济学——哲学手稿》中就指出：“宗教、家庭、国家、法、道德、科学、艺术等等，都不过是生产的一些特殊的方式，并且受生产的普遍规律的支配。”[1]在《德意志意识形态》一书中，马克思和恩格斯又将一般生产区分为“物质生产”和“精神生产”两大领域。文化产业作为生产的一种特殊形态，是一种精神生产。文化产品不仅具有一般产品的基本属性，而且具有自身的特殊属性。\n\n文化产品是一种特殊的商品形态，它具有双重属性，即商品属性和意识形态性。2003年6月，中央召开文化体制改革试点工作会议，会议明确提出，既要注重文化产品的意识形态属性，又要注重文化产品的产业属性。而实际上，我国的文化产品往往强调其意识形态属性，这种意识形态属性又过多地表现于社会教化功能，即通过文化政策、文化产业发展实现对社会的精神引导功能，对文化产业的经济属性，我们仍旧处于转变观念、推行改革的转型期。\n\n《文化产业商业模式》中明确提出从文化创意的经济价值角度研究文化产业的经营管理，这一立足点就意味着本书将打破以往对文化产业的商业属性遮遮掩掩、半推半就的研究境况，转而将文化产业推大胆、彻底地推上经济领域和市场范畴。\n\n这种大胆之举并非作者的主观臆想，而是其对文化与经济、文化产业和产品与市场的互动进行深入、透彻的研究之后所做的理论升华。在很长一段时间内，我们仅仅把文化作为经济发展的附属品，文化往往只承担其精神价值和意识形态引导功能，这种状况导致“文化失去了应有的经济价值和精神价值的双重地位”[2]。书中提出，在文化产业快速发展和成熟的时期，其实文化本身就可以“唱好戏”，文化也可以为经济搭建更大的舞台。因为目前的商品竞争已然充斥了更多文化因素的成分，文化内涵和品位的提升能带来更大的附加价值和经济效益，因此，文化和经济之间的互动关系日益紧密且微妙。\n\n文化产业自出现之始即有商业特质，只是这一特质被人为地包裹和埋没，当商品市场不再是以纯粹的经济价值取胜，转向高附加价值的较量，这种商业特质开始逐步溶解，并融入市场竞争的主体环节。\n\n当然，正如书中所说，从经济学的角度研究文化产业，并非忽视文化的价值，而是要“利用文化元素来发挥其作为精神产品和提升物质产品价值的作用”。由于文化经济中的价值实现具有特殊性，而这种特殊性比其他产业更多地依赖于文化形态、意识形态的制约，以及产品和服务的创新，因此，文化产业的经营管理，已经不仅是单纯意义上的企业、行业经营管理，而是在一定文化环境、文化政策、文化形态制约下的管理行为。\n\n&nbsp;\n\n<strong>作为市场主体的自我认知</strong>\n\n<strong>    </strong>\n\n严格来讲，在过去的很长时间，我们的文化产业起主体作用的是“文化事业”，文化政策侧重文化事业的发展，文化事业占有主要的文化资金和资源，这种占有是具有垄断性的，文化事业单位的管理也偏于行政化，并非纯粹的市场行为。\n\n当市场经济的大潮涌向文化产业，行政化严重的文化事业大多走向改制之路。许多传统的文化行业如出版业、艺术产业、演艺行业等逐渐放开一些窗口睁眼看市场，而这些小窗口并未阻止文化产业喷薄而出的市场热情，这种热情点燃了整个文化市场，不论是新闻出版、广播影视还是互联网、旅游休闲、娱乐产业，抑或是博物馆、公共文化服务机构，都纷纷呈现出挣脱旧有体制的热望和作为市场主体的独立性。\n\n把文化产业真正推向市场，对文化产业和文化企业来说，是引燃了长久以来的市场探寻之期待，文化产业作为市场主体，必将剥离条块分割的资源切割状态和限制多于鼓励的管理体制，或大或小、或强或弱的文化企业一起涌入海阔天空的文化市场。虽然力量不均，但在这一市场上，不同文化企业所具有的争取市场主体地位的权利是平等的——这可以看作它们对于自己角色的觉醒。\n\n作为市场主体的自我认知不仅包括自我角色认知，还包括自我使命的认知。\n\n1995年，台湾文化建设委员会提出了“文化产业化、产业文化化”之构想，并于此后贯彻这一构想，于2002年正式将文化创意产业列入《挑战2008：台湾发展重点计划》中的一项，旨在结合人文与经济产业创造高附加价值的效益，以增加就业人数并提升民众生活水平。\n\n本书中，作者再次提出了文化产业发展的双重路向，即文化产业化（文化经济）和产业文化化，并进而指出，文化产业化仅仅是包含某些部分的文化产业化，而不是全面的文化产业化，而产业文化话几乎是全方位的。这就意味着，未来我们的经济发展和企业发展，可以借力文化产业，在经济领域实现产业文化化。\n\n实现产业文化化，首要的是意识到文化产业发展中的文化因素起着至关重要的作用，这不仅包括文化市场、文化产品与技术创新、文化产品销售渠道、文化产品传播平台等一系列环节，还包括文化企业和文化产品的品牌、可持续发展等战略。从起始点到终端，文化产业发展的各个环节都离不开文化所创造的价值。\n\n作者多次提到，“合理的企业经营理念是促进企业价值得以实现，即企业的整体价值最大化”[3]。整理价值最大化意味着做企业不是看当下，看某个项目是否赚钱，而是看企业的长线发展，看企业的整体资源所带来的整体价值，这种整体价值更多来源于企业创造的无形价值。文化企业的价值在很大程度上体现于其无形资产，如人力资源、文化因素等，在追求整体价值的过程中，也应当充分考虑人力资源、产品创新、文化附加价值的提升等策略，用文化的力量实现文化企业的可持续发展。\n\n因此，正如书中所说，文化产业具有双重价值：一方面，文化产业自身的发展是经济活动的重要组成部分，另一方面，文化产业通过与其他产业之间的关联互动，可以推动其他产业的发展。\n\n文化产业的自我认知，其实是对文化市场日益规范化的侧面反映，同时也是文化产业自行定位、自谋发展的开始——为了即将到来的文化苦旅，当然，也许一路欢歌。\n\n&nbsp;\n\n<strong>商业模式与价值创造</strong>\n\n&nbsp;\n\n彼得·德鲁克说过，21世纪企业之间的竞争已经不是产品与价格的竞争，甚至不是服务之间的竞争，而是“商业模式”之间的竞争。今天，中国的企业除了技术进步所带来的成本下降之外，劳动力、土地、环境保护、知识产权、外围技术研发等成本都一路攀升，在经济转型升级的关头，商业模式的重要性凸显。\n\n在其后的论证中，作者重点阐述了文化产业商业模式的类型，分别阐明文化产业的内容、产品、品牌以及产业链与商业模式的关系，并从大量的案例中抽离出60种通用的商业模式。事实上，本书所有的铺垫，包括对文化产业特性的解读、对文化与经济互动关系的阐释以及对企业经营管理理念的传达，都是为了让读者对文化产业的商业模式做一个基础知识的补充，在此基础上探讨文化产业的商业模式，才不至于一头雾水和感觉突兀。\n\n按照作者的观点，商业模式简单讲就是盈利模式，商业模式在广义上涵盖了“将企业的核心竞争力即内在性优势和外部性优势转化为盈利方法的要素”。谈到商业模式，不能不谈到实现商业模式的群体。过去，我们常常认为，从事文化产业的都是所谓的“文化人”，当文化与经济、与市场、与商业并未如此水乳交融的时候，我们姑且将文化产业置于真正的企业竞争之外。而如今，文化产业再也不是“文化人”自娱自乐的游戏，而是生灭关乎市场的实体。于是，艺术家、企业家、投资家纷纷涉足其中，在这些群体中，应尽量避免权责不清，还应各取优势，可以共同参与文化企业的经营管理，但说到底，文化企业还是企业，首先要遵从市场规律和企业经营管理规律，明确了这一点，不同群体的责任分工也了然于心。\n\n无疑，企业的核心竞争力是实现盈利模式的源泉，核心竞争力分为内部优势和外部优势，这些优势经由商业模式来体现。同样的，具有竞争力的商业模式应当可以促进企业整体价值的提升。而这种整体价值的汇总包括了很多环节。\n\n文化产业俗称“内容产业”，内容在整个产业链中的地位可见一斑。内容的创新实际上就是一种象征体系的创新，“一类是讲故事，一类是活动，一类是形象性的知识产权，一类是附载在明星身上的品牌魅力”[4]。不管是哪种内容创新，都是为了抓住一闪而过的创意点子，并将这个点子实施，创意的好坏，只能通过市场去检验。\n\n创意落实到实体上，就是文化产品。在这个层面，我们必须牢牢记住文化产品的双重属性，既要承担文化产品的文化教化功能，又要保证文化产业的经济效益。书中指出，文化产品需要双重的产品质量标准，即作为商品形态的一般质量标准和作为精神文化属性的最低标准。当然，不论为了满足哪个属性，其受众都是文化产品的消费者，如何围绕消费者的需求、消费观念、生活方式和消费习惯的变动来寻求创新，是文化产品的立足点。\n\n好的产品和理念不一定能带来真正的企业价值，实现这一转换的重要环节就是品牌的传播。既然作为商品，文化产品就难逃品牌管理的影响力。目前，我们的许多文化产品在核心技术、创意、质量等方面已经达到先进水平，但迟迟难以跻身文化产业高端市场的重要原因就是对品牌管理的缺失和品牌传播不力。品牌本身就是商业模式中最具附加价值的部分，加之文化产业中的无形因素比重较大，这种无形资产的力量是其他产业不可比拟的，更应该为文化产业所用，助力文化产业的可持续发展。\n\n至此，作者终于引出商业模式的基本类型，书中将其分为六大组，共60种类型。六大组分别是行业化的商业模式、基础型的商业模式、内在能力型的商业模式、提升型的商业模式、资源整合型的商业模和与资本运作结合的商业模式。作者通过大量的案例分析，试图为读者展开一幅商业模式的巨大画卷，在这画卷中，有成熟坚韧的理论枝桠，也有鲜活灵动的案例论证。不仅如此，书中还针对主要的文化产业如文化旅游、演艺产业、体育产业、数字内容产业、动漫产业、全媒体产业等进行了分级阐述，将行业发展的一般规律进行梳理，给出了一个多维立体的商业模式发展模型。\n<p style="text-align: left;">由此，文化产业发展的商业模式终于有迹可循。诚然，我们敬佩作者在理论和实践之间的孜孜以求，我们更期待这些商业模式真正为我国的文化产业带来更多的文化价值和商业价值，甚至在这个轨道上，更多更好的商业模式被开发、验证和载入史册。</p>\n\n<div><br clear="all" />\n\n<hr align="left" size="1" width="33%" />\n\n<div>\n\n[1] 马克思：《1844年经济学——哲学手稿》，第78页。\n\n</div>\n<div>\n\n[2] 陈少峰、张立波：《文化产业商业模式》，第4页。\n\n</div>\n<div>\n\n[3] 陈少峰、张立波：《文化产业商业模式》，第53页。\n\n</div>\n<div>\n\n[4] 陈少峰、张立波：《文化产业商业模式》，第106页。\n\n</div>\n</div>', '作为市场主体的自我调适', '', 'inherit', 'open', 'open', '', '76-autosave', '', '', '2011-10-27 01:46:15', '2011-10-27 01:46:15', '', 76, 'http://blog.kuhkuh.com/?p=83', 0, 'revision', '', 0),
(24, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '24', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 0, 'http://blogchen.gotoip1.com/?p=24', 7, 'nav_menu_item', '', 0),
(25, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '25', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 0, 'http://blogchen.gotoip1.com/?p=25', 10, 'nav_menu_item', '', 0),
(27, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '27', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 1, 'http://blogchen.gotoip1.com/?p=27', 3, 'nav_menu_item', '', 0),
(28, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '28', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 1, 'http://blogchen.gotoip1.com/?p=28', 6, 'nav_menu_item', '', 0),
(29, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '29', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 1, 'http://blogchen.gotoip1.com/?p=29', 4, 'nav_menu_item', '', 0),
(30, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '30', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 1, 'http://blogchen.gotoip1.com/?p=30', 5, 'nav_menu_item', '', 0),
(31, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '31', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 4, 'http://blogchen.gotoip1.com/?p=31', 8, 'nav_menu_item', '', 0),
(32, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '32', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 4, 'http://blogchen.gotoip1.com/?p=32', 9, 'nav_menu_item', '', 0),
(33, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '33', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 6, 'http://blogchen.gotoip1.com/?p=33', 11, 'nav_menu_item', '', 0),
(34, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '34', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 6, 'http://blogchen.gotoip1.com/?p=34', 12, 'nav_menu_item', '', 0),
(46, 1, '2011-10-23 08:04:18', '2011-10-23 08:04:18', '这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如：\n\n<blockquote>欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的博客。我住在天朝的帝都，有条叫做 Jack 的狗。</blockquote>\n\n... 或这个：\n\n<blockquote>XYZ Doohickey 公司成立于 1971 年，自从建立以来，我们一直向社会贡献着优秀 doohickies。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。</blockquote>\n\n而您，作为一个 WordPress 用户，我们建议您访问<a href="http://localhost/wordpress/wp-admin/">控制版</a>，删除本页面，然后添加您自己的页面。祝您使用愉快！', '示例页面', '', 'inherit', 'open', 'open', '', '22-revision', '', '', '2011-10-23 08:04:18', '2011-10-23 08:04:18', '', 22, 'http://blogchen.gotoip1.com/?p=46', 0, 'revision', '', 0),
(58, 1, '2011-10-26 07:20:55', '2011-10-26 07:20:55', '<a href="http://www.ce.cn/culture/whcyk/gundong/201110/21/t20111021_22779679.shtml">中国经济网北京讯</a>(记者杜平)  我国的文化产业在近几年的发展中已经呈现出丰富性的局面，要推动我国文化产业的大发展，实现文化产品“走出去”，推动文化内容产业的发展就显得尤为重要。 日前，北京大学文化产业研究院副院长陈少峰在“中国文化产业30人高端峰会”上指出，发展文化内容产业不仅要满足意识形态需要，还要满足老百姓以及国际竞 争力的需要等。\r\n\r\n具体来看，一、内容要丰富质量要保证，这两者要有效结合。二、要兼顾不同的受众和消费层次，包括精英因素 和大众因素，以及怎么样满足青少年的要求。三、不仅要满足人们的娱乐，还要照顾到意识形态和市场化的要求。四、在国内和国际市场上要有一定的竞争力，帮助 中国的文化产品走出去。五、要解决传统市场的问题，内容要创新，完全创新的东西也是很难被市场接受的。六、内容传播的载体和内容之间的关联度要高。传播和 内容生产的分离，对中小文化企业来说很难制作出具有国际竞争力的产品。\r\n然而，就当前我国文化内容产业的形势来看，目前存 在着两个问题：一方面是内容上重数量而轻质量的局面尚未从根本上得到改善，缺乏具有市场竞争力的精品，尤其缺乏具有国际竞争力的内容文化产品。另一方面则 是中小企业是内容提供的主体，而他们缺乏平台推广资源，没有较好的利润赢利点，人才也比较匮乏，难以满足打造产业链的要求。\r\n\r\n陈 少峰指出，文化内容产业不仅是繁荣我国文化产业的核心要素，而且能使我们在国际上具有一定的“话语权”。文化内容产业的发展，能促进文化产业的良性健康发 展。要推动文化内容产业的发展，需要政府和中小文化企业的共同努力。从政府层面来讲，首先要明确“鼓励谁、支持谁、创造什么样的内容”。具体来说，就是要 引导或者要求国有传媒与平台企业制作精品内容；通过择优奖励的方式鼓励平台企业制作内容，如鼓励视频网站制作独家的内容。从中小企业的层面来说，中小企业 要转变模式，以商业模式特别是以可复制性的商业模式来实现内容更大规模的盈利。', '发展文化内容产业能增强国际话语权', '', 'publish', 'open', 'open', '', '%e5%8f%91%e5%b1%95%e6%96%87%e5%8c%96%e5%86%85%e5%ae%b9%e4%ba%a7%e4%b8%9a%e8%83%bd%e5%a2%9e%e5%bc%ba%e5%9b%bd%e9%99%85%e8%af%9d%e8%af%ad%e6%9d%83', '', '', '2011-10-26 07:20:55', '2011-10-26 07:20:55', '', 0, 'http://blogchen.gotoip1.com/?p=58', 0, 'post', '', 0),
(54, 1, '2011-10-26 07:14:14', '0000-00-00 00:00:00', '这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如：\r\n欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的博客。我住在天朝的帝都，有条叫做 Jack 的狗。\r\n&#8230; 或这个：\r\nXYZ Doohickey 公司成立于 1971 年，自从建立以来，我们一直向社会贡献着优秀 doohickies。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。\r\n而您，作为一个 WordPress 用户，我们建议您访问控制版，删除本页面，然后添加您自己的页面。祝您使用愉快！', '', '', 'draft', 'open', 'open', '', '', '', '', '2011-10-26 07:14:14', '0000-00-00 00:00:00', '', 0, 'http://blogchen.gotoip1.com/?p=54', 1, 'nav_menu_item', '', 0),
(39, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '39', '', '', '2011-10-26 07:15:54', '2011-10-26 07:15:54', '', 0, 'http://blogchen.gotoip1.com/?p=39', 2, 'nav_menu_item', '', 0),
(40, 1, '2011-10-26 06:38:40', '2011-10-26 06:38:40', ' ', '', '', 'publish', 'open', 'open', '', '40', '', '', '2011-10-26 07:15:54', '2011-10-26 07:15:54', '', 0, 'http://blogchen.gotoip1.com/?p=40', 3, 'nav_menu_item', '', 0),
(45, 1, '2011-10-26 06:41:55', '2011-10-26 06:41:55', '这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如：\r\n\r\n欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的博客。我住在天朝的帝都，有条叫做 Jack 的狗。\r\n\r\n… 或这个：\r\n\r\nXYZ Doohickey 公司成立于 1971 年，自从建立以来，我们一直向社会贡献着优秀 doohickies。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。\r\n\r\n而您，作为一个 WordPress 用户，我们建议您访问控制版，删除本页面，然后添加您自己的页面。祝您使用愉快！', '', '', 'publish', 'open', 'open', '', '45', '', '', '2011-10-26 15:13:57', '2011-10-26 15:13:57', '', 0, 'http://blogchen.gotoip1.com/?p=45', 13, 'nav_menu_item', '', 0),
(51, 1, '2011-10-26 07:07:26', '2011-10-26 07:07:26', '<strong><a href="http://news.chengdu.cn/content/2011-10/22/content_792291.htm?node=1760" target="_blank">成都全搜索新闻网</a>（记者 </strong><strong>覃霞）10</strong><strong>月22</strong><strong>日报道</strong>成都东区音乐公园是在原老红光电子管厂的厂址上建起来的， 它的主题是以音乐为主，这个公园对成都市的文化创意产业有什么样的作用呢？为什么要建成都东区音乐公园？今（22）日下午，北京大学文化产业研究院副院 长、文化部国家文化产业创新与发展研究基地副主任陈少峰在《金沙讲坛》上指出，他有信心，三年后，成都东区音乐公园将寸土寸金。\r\n\r\n<strong>    </strong><strong>关于文化产业：国外内容为王 </strong><strong>国内平台为王</strong>\r\n\r\n在成都锦里和宽窄巷子倾力打造之后，上个月29号，成都东区音乐公园开园了。陈少峰参加过东区音乐公园的前期调研工作，今天下午，他在给大家答疑之前，首先分析了目前国内外的“文化产业”。\r\n\r\n陈少峰认为，现在大家提到的“文化产业”，大都是“无中生有”出来的文化，如“阿凡达”，此处的“无中生有”指的是后期的创作，并最终形成一种文化。\r\n\r\n从目前文化产业的发展来看，国外是以“内容为王”。他举了一个例子：迈克·杰克逊去世前，留下了5亿欠款和4个孩子，按照中国人的逻辑，4 个孩子成了孤儿，还背了一屁股债。可是杰克逊去世后，他第一年的版税收入就有3亿多，而且这版税还要继续收几十年。这是因为国外的文化环境看重的是文化内 容本身。\r\n\r\n“《功夫熊猫》里一只虚拟的熊猫，经外国人的手，就成了香饽饽，而我们有的仅仅停留在熊猫本身。”陈少峰有些遗憾，他说，与国外不同，中国 的文化产业是以“平台”为主，这也是中国文化产业发展遇到的一个主要问题，“做平台的有钱，但是他不负责内容；做内容的没钱，出不来大制作。”\r\n\r\n<strong>    </strong><strong>关于东区音乐公园：“</strong><strong>旅游”</strong><strong>不是目的 </strong><strong>但却是必然结果</strong>\r\n\r\n诚然，成都人喜欢“旅游”，但陈少峰不赞同大家走马观花、一天好几个景点的旅游方式，他甚至给大家开起了玩笑，“人生的终点不外乎在八宝山，跑那么快，难道是去抢位子？”\r\n\r\n陈少峰说，成都不仅是一座休闲城市，还是一座娱乐城市。但在他看来，很多外地人来成都，却融入不了成都的麻将大军，这时，大家应该思考一个问题：成都这座城，给外地人提供了什么？\r\n\r\n现场有观众提出，担心东区音乐公园的文化气息会被商业气息掩盖，前往的游人都是为了旅游而来此。陈少峰说，东区音乐公园是希望给大家带来一次“文化旅游”，不是传统的“用眼睛看”，而是一次体验音乐的过程，不过现在公园还在陆续建设中，各个场馆还没有完全呈现。\r\n\r\n“一半成都人，一半外地人，这是成都东区音乐公园的理想状态。”陈少峰透露，为了留住游客，公园方面也有设置“巴蜀音乐馆”的设想，通过打 造这个经营音乐的产业平台，给大家呈现国外的音乐，也推广国内的音乐。“‘旅游’不是东区音乐公园设置的最初目的，不过，它必将成为最终的结果，三年后， 东区音乐公园将成为寸土寸金的文化产地，值得期待。”', '东区音乐公园3年后是寸土寸金', '', 'publish', 'open', 'open', '', '%e4%b8%9c%e5%8c%ba%e9%9f%b3%e4%b9%90%e5%85%ac%e5%9b%ad3%e5%b9%b4%e5%90%8e%e6%98%af%e5%af%b8%e5%9c%9f%e5%af%b8%e9%87%91', '', '', '2011-10-26 07:07:26', '2011-10-26 07:07:26', '', 0, 'http://blogchen.gotoip1.com/?p=51', 0, 'post', '', 0),
(52, 1, '2011-10-26 07:06:48', '2011-10-26 07:06:48', '<strong>成都全搜索新闻网（记者 </strong><strong>覃霞）10</strong><strong>月22</strong><strong>日报道</strong>成都东区音乐公园是在原老红光电子管厂的厂址上建起来的， 它的主题是以音乐为主，这个公园对成都市的文化创意产业有什么样的作用呢？为什么要建成都东区音乐公园？今（22）日下午，北京大学文化产业研究院副院 长、文化部国家文化产业创新与发展研究基地副主任陈少峰在《金沙讲坛》上指出，他有信心，三年后，成都东区音乐公园将寸土寸金。\n\n<strong>    </strong><strong>关于文化产业：国外内容为王 </strong><strong>国内平台为王</strong>\n\n在成都锦里和宽窄巷子倾力打造之后，上个月29号，成都东区音乐公园开园了。陈少峰参加过东区音乐公园的前期调研工作，今天下午，他在给大家答疑之前，首先分析了目前国内外的“文化产业”。\n\n陈少峰认为，现在大家提到的“文化产业”，大都是“无中生有”出来的文化，如“阿凡达”，此处的“无中生有”指的是后期的创作，并最终形成一种文化。\n\n从目前文化产业的发展来看，国外是以“内容为王”。他举了一个例子：迈克·杰克逊去世前，留下了5亿欠款和4个孩子，按照中国人的逻辑，4 个孩子成了孤儿，还背了一屁股债。可是杰克逊去世后，他第一年的版税收入就有3亿多，而且这版税还要继续收几十年。这是因为国外的文化环境看重的是文化内 容本身。\n\n“《功夫熊猫》里一只虚拟的熊猫，经外国人的手，就成了香饽饽，而我们有的仅仅停留在熊猫本身。”陈少峰有些遗憾，他说，与国外不同，中国 的文化产业是以“平台”为主，这也是中国文化产业发展遇到的一个主要问题，“做平台的有钱，但是他不负责内容；做内容的没钱，出不来大制作。”\n\n<strong>    </strong><strong>关于东区音乐公园：“</strong><strong>旅游”</strong><strong>不是目的 </strong><strong>但却是必然结果</strong>\n\n诚然，成都人喜欢“旅游”，但陈少峰不赞同大家走马观花、一天好几个景点的旅游方式，他甚至给大家开起了玩笑，“人生的终点不外乎在八宝山，跑那么快，难道是去抢位子？”\n\n陈少峰说，成都不仅是一座休闲城市，还是一座娱乐城市。但在他看来，很多外地人来成都，却融入不了成都的麻将大军，这时，大家应该思考一个问题：成都这座城，给外地人提供了什么？\n\n现场有观众提出，担心东区音乐公园的文化气息会被商业气息掩盖，前往的游人都是为了旅游而来此。陈少峰说，东区音乐公园是希望给大家带来一次“文化旅游”，不是传统的“用眼睛看”，而是一次体验音乐的过程，不过现在公园还在陆续建设中，各个场馆还没有完全呈现。\n\n“一半成都人，一半外地人，这是成都东区音乐公园的理想状态。”陈少峰透露，为了留住游客，公园方面也有设置“巴蜀音乐馆”的设想，通过打 造这个经营音乐的产业平台，给大家呈现国外的音乐，也推广国内的音乐。“‘旅游’不是东区音乐公园设置的最初目的，不过，它必将成为最终的结果，三年后， 东区音乐公园将成为寸土寸金的文化产地，值得期待。”', '东区音乐公园3年后是寸土寸金', '', 'inherit', 'open', 'open', '', '51-revision', '', '', '2011-10-26 07:06:48', '2011-10-26 07:06:48', '', 51, 'http://blogchen.gotoip1.com/?p=52', 0, 'revision', '', 0),
(53, 1, '2011-10-26 07:08:31', '2011-10-26 07:08:31', '<strong><a href="http://news.chengdu.cn/content/2011-10/22/content_792291.htm?node=1760" target="_blank">成都全搜索新闻网</a>（记者 </strong><strong>覃霞）10</strong><strong>月22</strong><strong>日报道</strong>成都东区音乐公园是在原老红光电子管厂的厂址上建起来的， 它的主题是以音乐为主，这个公园对成都市的文化创意产业有什么样的作用呢？为什么要建成都东区音乐公园？今（22）日下午，北京大学文化产业研究院副院 长、文化部国家文化产业创新与发展研究基地副主任陈少峰在《金沙讲坛》上指出，他有信心，三年后，成都东区音乐公园将寸土寸金。\n\n<strong>    </strong><strong>关于文化产业：国外内容为王 </strong><strong>国内平台为王</strong>\n\n在成都锦里和宽窄巷子倾力打造之后，上个月29号，成都东区音乐公园开园了。陈少峰参加过东区音乐公园的前期调研工作，今天下午，他在给大家答疑之前，首先分析了目前国内外的“文化产业”。\n\n陈少峰认为，现在大家提到的“文化产业”，大都是“无中生有”出来的文化，如“阿凡达”，此处的“无中生有”指的是后期的创作，并最终形成一种文化。\n\n从目前文化产业的发展来看，国外是以“内容为王”。他举了一个例子：迈克·杰克逊去世前，留下了5亿欠款和4个孩子，按照中国人的逻辑，4 个孩子成了孤儿，还背了一屁股债。可是杰克逊去世后，他第一年的版税收入就有3亿多，而且这版税还要继续收几十年。这是因为国外的文化环境看重的是文化内 容本身。\n\n“《功夫熊猫》里一只虚拟的熊猫，经外国人的手，就成了香饽饽，而我们有的仅仅停留在熊猫本身。”陈少峰有些遗憾，他说，与国外不同，中国 的文化产业是以“平台”为主，这也是中国文化产业发展遇到的一个主要问题，“做平台的有钱，但是他不负责内容；做内容的没钱，出不来大制作。”\n\n<strong>    </strong><strong>关于东区音乐公园：“</strong><strong>旅游”</strong><strong>不是目的 </strong><strong>但却是必然结果</strong>\n\n诚然，成都人喜欢“旅游”，但陈少峰不赞同大家走马观花、一天好几个景点的旅游方式，他甚至给大家开起了玩笑，“人生的终点不外乎在八宝山，跑那么快，难道是去抢位子？”\n\n陈少峰说，成都不仅是一座休闲城市，还是一座娱乐城市。但在他看来，很多外地人来成都，却融入不了成都的麻将大军，这时，大家应该思考一个问题：成都这座城，给外地人提供了什么？\n\n现场有观众提出，担心东区音乐公园的文化气息会被商业气息掩盖，前往的游人都是为了旅游而来此。陈少峰说，东区音乐公园是希望给大家带来一次“文化旅游”，不是传统的“用眼睛看”，而是一次体验音乐的过程，不过现在公园还在陆续建设中，各个场馆还没有完全呈现。\n\n“一半成都人，一半外地人，这是成都东区音乐公园的理想状态。”陈少峰透露，为了留住游客，公园方面也有设置“巴蜀音乐馆”的设想，通过打 造这个经营音乐的产业平台，给大家呈现国外的音乐，也推广国内的音乐。“‘旅游’不是东区音乐公园设置的最初目的，不过，它必将成为最终的结果，三年后， 东区音乐公园将成为寸土寸金的文化产地，值得期待。”', '东区音乐公园3年后是寸土寸金', '', 'inherit', 'open', 'open', '', '51-autosave', '', '', '2011-10-26 07:08:31', '2011-10-26 07:08:31', '', 51, 'http://blogchen.gotoip1.com/?p=53', 0, 'revision', '', 0),
(55, 1, '2011-10-26 07:15:25', '2011-10-26 07:15:25', ' ', '', '', 'publish', 'open', 'open', '', '55', '', '', '2011-10-26 15:13:56', '2011-10-26 15:13:56', '', 0, 'http://blogchen.gotoip1.com/?p=55', 2, 'nav_menu_item', '', 0),
(56, 1, '2011-10-26 07:15:54', '2011-10-26 07:15:54', '这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如：\r\n欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的博客。我住在天朝的帝都，有条叫做 Jack 的狗。\r\n… 或这个：\r\nXYZ Doohickey 公司成立于 1971 年，自从建立以来，我们一直向社会贡献着优秀 doohickies。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。\r\n而您，作为一个 WordPress 用户，我们建议您访问控制版，删除本页面，然后添加您自己的页面。祝您使用愉快！', '', '', 'publish', 'open', 'open', '', '56', '', '', '2011-10-26 07:15:54', '2011-10-26 07:15:54', '', 0, 'http://blogchen.gotoip1.com/?p=56', 4, 'nav_menu_item', '', 0),
(57, 1, '2011-10-26 07:15:54', '2011-10-26 07:15:54', ' ', '', '', 'publish', 'open', 'open', '', '57', '', '', '2011-10-26 07:15:54', '2011-10-26 07:15:54', '', 0, 'http://blogchen.gotoip1.com/?p=57', 1, 'nav_menu_item', '', 0),
(59, 1, '2011-10-26 07:20:31', '2011-10-26 07:20:31', '<a href="http://www.ce.cn/culture/whcyk/gundong/201110/21/t20111021_22779679.shtml">中国经济网北京讯</a>(记者杜平)  我国的文化产业在近几年的发展中已经呈现出丰富性的局面，要推动我国文化产业的大发展，实现文化产品“走出去”，推动文化内容产业的发展就显得尤为重要。 日前，北京大学文化产业研究院副院长陈少峰在“中国文化产业30人高端峰会”上指出，发展文化内容产业不仅要满足意识形态需要，还要满足老百姓以及国际竞 争力的需要等。\n\n具体来看，一、内容要丰富质量要保证，这两者要有效结合。二、要兼顾不同的受众和消费层次，包括精英因素 和大众因素，以及怎么样满足青少年的要求。三、不仅要满足人们的娱乐，还要照顾到意识形态和市场化的要求。四、在国内和国际市场上要有一定的竞争力，帮助 中国的文化产品走出去。五、要解决传统市场的问题，内容要创新，完全创新的东西也是很难被市场接受的。六、内容传播的载体和内容之间的关联度要高。传播和 内容生产的分离，对中小文化企业来说很难制作出具有国际竞争力的产品。\n然而，就当前我国文化内容产业的形势来看，目前存 在着两个问题：一方面是内容上重数量而轻质量的局面尚未从根本上得到改善，缺乏具有市场竞争力的精品，尤其缺乏具有国际竞争力的内容文化产品。另一方面则 是中小企业是内容提供的主体，而他们缺乏平台推广资源，没有较好的利润赢利点，人才也比较匮乏，难以满足打造产业链的要求。\n\n陈 少峰指出，文化内容产业不仅是繁荣我国文化产业的核心要素，而且能使我们在国际上具有一定的“话语权”。文化内容产业的发展，能促进文化产业的良性健康发 展。要推动文化内容产业的发展，需要政府和中小文化企业的共同努力。从政府层面来讲，首先要明确“鼓励谁、支持谁、创造什么样的内容”。具体来说，就是要 引导或者要求国有传媒与平台企业制作精品内容；通过择优奖励的方式鼓励平台企业制作内容，如鼓励视频网站制作独家的内容。从中小企业的层面来说，中小企业 要转变模式，以商业模式特别是以可复制性的商业模式来实现内容更大规模的盈利。', '发展文化内容产业能增强国际话语权', '', 'inherit', 'open', 'open', '', '58-revision', '', '', '2011-10-26 07:20:31', '2011-10-26 07:20:31', '', 58, 'http://blogchen.gotoip1.com/?p=59', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(60, 1, '2011-10-26 07:24:24', '2011-10-26 07:24:24', '<strong><a href="http://culture.people.com.cn/h/2011/1021/c226948-2912244509.html">飞向世界的中华艺术之翼系列谈(之一)</a></strong>\r\n\r\n<strong>开篇的话</strong>\r\n\r\n“发展面向现代化、面向世界、面向未来的，民族的科学的大众的社会主义文化，培养高度的文化自觉与文化自信，提高全民族文明素质，增强国家文化软实力，弘扬中 华文化，努力建设社会主义文化强国。”党的十七届六中全会为中国文化建设描绘了宏伟蓝图。有识之士指出，中国文化软实力建设的自信，最重要的应体现为对中 国文化根的尊重与扬弃、对中国文化魂的坚守和创新、对外国文化的包容和借鉴。当代中国文化创造，在理论层面和实际的艺术生产中，对于中国文化根的寻找与重 新利用，以及对待中西文化结合的态度，已经不同于上世纪诸多文化寻根之旅，而有了更多自信、坦然与从容。近年来在文艺生产中越吹越烈的“中国风”就是一个 显证。但是，所有表面热闹的风向并不就表明达到真正的文化自觉与自信，尚需许多沉潜的思索与行动。\r\n\r\n在我们可以知悉的文化艺术生产事实中，中国风并不是一个已经确定边界的指称，它产生和生长于民族文化碰撞的语境之下。在文化艺术全球化日益加剧的今天，中国 文化艺术产品面临自认与自立两大挑战，一切以彰显中国特色、突出民族风格为旨归的文化艺术加工都可纳入中国风的范畴。新世纪之初，文学、电影、音乐等各个 艺术门类不约而同地向古典回归、向民间乡里寻觅创作之灵、文化之根，这阵风的吹来，或因庄周的蝴蝶之翼，或因杨妃的霓裳羽衣，或为一把纸伞、一颗红豆、一 盏雨过天青瓷、一段牧笛吹奏的久远旋律，但这是否已经是中国风的全部，是否还有别样的缘由？针对文化艺术生产者对中国风自我指认的误区，他者接受的误读， 甚至为广泛传播而牺牲精髓、炮制表象等问题，我们策划了中国艺术与中国风系列访谈，庶几能对中国风的大致轮廓与内里有更清晰的辨认，然而，这次探究的重点 并不在于定义与设限，而恰恰在于拓展中国风的边界、开阔视野，以期更加深入、整体的把握对中国文化艺术产品的创造与传播产生积极影响。\r\n\r\n<strong>中国文化产业需要什么样的中国风</strong>\r\n\r\n<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E9%99%88%E5%B0%91%E5%B3%B0">陈少峰</a></span>(北京大学文化产业研究院副院长) 怡梦(本报记者)\r\n\r\n我们的文化产业水平高，中国元素的影响力才能充分体现，反之，想以中国元素去带动<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%8F%91%E5%B1%95">文化产业发展</a></span>很难成功。有市场竞争力的作品随便融入什么元素人们都看得津津有味。\r\n\r\n<strong>文化产业对中国元素有什么影响</strong>\r\n\r\n怡梦：据我所知，大陆艺术家对中国传统元素的集中、大规模运用是在2008年奥运会开幕式上。此前，方文山、周杰伦的流行歌曲，张艺谋、陈凯歌的大片等艺术作品都对中国传统、民族风格有过或深或浅的表述，人们称这类艺术作品为中国风作品，中国风兴起的原因是什么？\r\n\r\n陈少峰：从文化软实力的角度来说，国家鼓励能够代表中国文化的艺术作品，而不是一味模仿其他民族的艺术风格；从文化产业的角度来说，不单纯考虑产业如何推 广，更要考虑中国文化特色如何延续。这种政策上的导向会传递给很多从事文化艺术和文化产业的人。另外，中国传统文化艺术具有传承的价值，比如《青花瓷》中 的瓷文化，在传承中有创新，把握中国人对传统文化的理解、感受方式，融入传统艺术的表达方式，探索如何融合传统与现代。这种探索还受到“韩流”、“日风” 等其他民族独特风格的触动，譬如在韩国的文化商品输出中，政府起着很重要的推动作用，令韩国文化既能与产业结合，又能对世界产生影响，韩国政府对文化产业 的扶持对我们有启发。\r\n\r\n中国特色依存于民族传统，能体现中华文明源流的艺术作品更有价值，我倾向于称所谓的“中国风”为“华流”，因为我们有华文、华人，汉语为基础的文化艺术以 “华”来表达更贴切，“华流”比“中国风”的意识形态色彩淡，文化味道浓。全世界华人创作的艺术作品，虽然有各种方向上的尝试，但都以中国传统文化为根 基，特色分明，易于形成品牌化的影响力。但目前来看，这种艺术风格的特色还不够鲜明，很多人依赖传统元素，传承、借鉴与创新还没有融会贯通，我们的发展空 间还很大。\r\n\r\n港台、海外华人的作品也围绕着中国传统艺术的轨道，只不过他们为了和西方对接，要引入现代元素，形成宽广的视角，在当代各国文化之间取长补短。如台湾的云门 舞集以现代舞蹈表达汉字书法，这种创新更具有艺术性，既融入传统文化神韵，又对国外的戏剧理念有所借鉴，在各种艺术门类的融合中力图突破传统样式。中国戏 曲等传统样式更适合传统的生活方式，以前生活节奏慢，而当代以青少年为主的消费人群对灵动的、富于现代感的艺术作品感兴趣。\r\n\r\n怡梦：中国风的命名似乎最早出现在方文山作词、周杰伦演唱的《菊花台》《千里之外》《青花瓷》等歌曲中，那么中国风是从港台吹向大陆的吗？\r\n\r\n陈少峰：大陆艺术工作者注重发掘传统元素，这种文化认同为华人所共有，并不一定是受港台影响，但是港台的表现形式对我们有重要启发。在<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E5%85%A8%E7%90%83%E5%8C%96">文化全球化</a></span>的 潮流中，竞争越来越激烈，我们实行对外开放，如果没有特色很难表现民族的力量。而港台是较早接触全球化的前沿阵地，已有很多探索，市场经验比较丰富。在文 化商品中融入传统元素并非易事，《兔侠传奇》里塞满中国元素，但表现力和《功夫熊猫》相比还差得很远。从《花木兰》到《功夫熊猫》，这种中西文化的碰撞可 以启发我们开拓创新视角。动漫、影视制作者应该虚心，不必觉得中国元素被别人抢走了，如果他们能把中国元素表现得原汁原味，相当于和我们同台竞技。我们应 该反思，为什么在中国文化熏陶下生长，作品中对传统元素的运用和阐释还不如别人。目前，动漫、影视工作者的文化修养很多停留在元素表层，没有深入发掘其中 的理念、精神、神韵。中国传统文化中的典故、传说对人性的把握可以超越任何国家和时代而为人们所理解，我们不应仅仅展示中国元素，而是以对元素的再创造参 与竞争，以德服人，在竞争中成长。所以我不太赞成禁播外国动漫，这是缺乏进取精神的地方保护主义，这样的评价机制、竞争机制就成了矮子里拔将军，制作者也 接触不到有启发的作品，地方保护不是长久之计。\r\n\r\n怡梦：中国元素对文化产业的发展有什么价值和意义？\r\n\r\n陈 少峰：这个问题应该倒过来问——中国文化产业对中国元素会有什么影响？我们的文化产业水平高，中国元素的影响力才能充分体现，反之，想以中国元素去带动文 化产业发展很难成功。有市场竞争力的作品随便融入什么元素人们都看得津津有味。中国元素会给文化产业锦上添花，会令文化产业产出精品，但我认为这是第二 步，顺序不能颠倒。\r\n\r\n这些年我们对传统文化的继承和弘扬，在走向世界的层面没有取得太大进展，仍停留在形式上，没有把内容、形式、底蕴和大众融为一体。\r\n\r\n<strong>当前艺术生产对中国元素使用是否恰当</strong>\r\n\r\n怡梦：有人认为美国电影无论引入什么元素，都是在输出美利坚民族的意识形态、价值观，您有何评价？\r\n\r\n陈 少峰：艺术家创作的文化艺术作品，只要能构成一个国家的软实力，政府当然会给予支持，这种支持不仅是意识形态上的，还包括知识产权等很多方面。换句话说， 成功的作品体现了一国的文化艺术影响力，但这不是国家意志，而是综合实力。作品融入的是创作者的艺术理念和文化理解，这不是国家意志能支配的。美国电影中 的爱国主义、英雄主义，其他民族也需要，但美国电影肯定融入了美国的个性。假如我们一味模仿，不能形成自己的风格与竞争力，全世界的文化艺术会出现一面倒 的局面，造成<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E5%A4%B1%E8%A1%A1">文化失衡</a></span>、 引起国家文化安全危机，这不是政府能解决的，所以要搞文化产业。在大方向上是为打造国家软实力、继承发扬民族传统，具体的作品只要能形成正面影响力，都是 有价值的。目前我们的作品还未占领别人的市场，不能责怪别人输出意识形态，市场竞争是实力的较量，实力弱的一方无话可说。在全球范围发展文化产业，真正的 竞争力来自企业，不是政府埋单就能做出好作品。艺术家可以独立探索，但在文化艺术的传播中，只有企业竞争力与艺术家创造力的结合，才会有力量。\r\n\r\n怡梦：国内外作品对中国元素的运用、阐释有误区吗？\r\n\r\n陈 少峰：外国作品使用中国元素是基于某种元素激发了他的创作灵感。一个人如果见多识广，就不会在乎文化出身，哪一种文化的提炼与表达能吸引人，他都会去发 掘，因为他不是在宣扬爱国主义，而是在生产大众文化产品，为的是吸引全球的受众。但如果只是生硬的拼接、移植，没有人会看，所以不管哪种文化元素，在提炼 过程中都会融入人性的因素，以适应人们在生活中对艺术的感知方式。譬如<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E7%BA%A2%E9%85%92%E6%96%87%E5%8C%96">红酒文化</a></span>， 在形式上不是中华民族的传统元素，但是在人性的共鸣上，我们佩服品酒的高超技艺，欣赏法国人不是简单地把喝酒作为饮食的一部分，而是从中体验到更精致的艺 术升华。元素通过什么故事来呈现非常重要，成功的作品主题似曾相识，但表现形式丰富多样。元素的表达要基于人类共同的价值观与人性的共同基础，比如“侠” 文化，这是中国的，同时又能为其他民族所理解，所以在这个时代仍有共鸣。\r\n\r\n所 谓文化艺术作品，既是文化的，也是艺术的；文化要面向大众，艺术要表达创作者的理念。两者糅合在一起应不露痕迹，元素的简单堆砌是毫无价值的。比如《花木 兰》，创作者看重的是这个故事经过改造能吸引人，它是中国故事，当然要以中国元素作为表现形式，否则就不像“花木兰”。这部作品还使用了美国的方法提炼、 改造和创新。\r\n\r\n<strong>怡梦：目前我们有对中国元素使用恰当的作品吗？</strong>\r\n\r\n陈 少峰：艺术工作者有两种：继承性的几乎是照搬传统，葆有传统元素的原汁原味，但在今天这种纯乎传统的表述方式几乎没有市场了；另一种，知道融传统于现代， 但不知道怎样融合才能恰到好处。让卡通人物身上背着京剧里的刀枪把子，这毫无意义。不是说某句话、某个动作蕴含中国味才更出彩，所以中国元素在精不在多， 关键还是要形成自己的风格。我们往往以为融入中国元素就具有了中国风格，其实元素和风格还有很大差距。一方面我们对艺术作品创作规律的理解不透彻，对元素 生吞活剥，不能做到羚羊挂角无迹可寻，缺乏能为全球受众所认同的角度；另一方面我们市场经验不足，对元素生硬拼接，不能形成在国际上有影响力的品牌优势。 中国讲究自然神韵，艺术家需要研究<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E4%B8%AD%E5%9B%BD%E4%BC%A0%E7%BB%9F%E8%89%BA%E6%9C%AF">中国传统艺术</a></span>、哲学，获得更深的理解，把中国文化变成身体素质的一部分，而不是像旁观者一样把元素堆砌到作品中。\r\n\r\n另外，迷恋自身<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E5%85%83%E7%B4%A0">文化元素</a></span>的 表达也不是好事。如果美国创作者是这样，就没有《功夫熊猫》。先考虑创作一个好的作品，在此基础之上融入文化元素才是比较恰当的。对自身文化正面、教条的 呈现往往娱乐性不强，真正吸引人的事物其实是有缺陷的，不是完美无瑕的。好看的故事都有戏剧冲突，人性也是在戏剧冲突之中才能展现出来。娱乐片满足的是人 们的好奇心和生活中体验不到的诉求。现在很多文化艺术工作者像是搞学术，正统、刻板，缺乏想象力和对人性各个侧面的理解。\r\n\r\n想 融入中国元素，先要“放弃”中国元素，讲好故事。如果故事不好，又要表达很多概念，又要融入很多元素，这是双重削弱作品的吸引力。中国古代有很多好故事， 比如“人鬼情未了”就是中国人发明的，美国人拍出了《人鬼情未了》，说明这个主题人们都会有所共鸣。但我们今天再讲唐玄宗与杨贵妃的“人鬼情未了”就很不 合时宜，因为这是一个套路，里边没有可供回忆的爱情细节，帝王的生活也不能代表普通人，就像《满城尽带黄金甲》里，只有一帧一帧金碧辉煌的画面，连中国人 自己都不爱看。有的创作者以为外国人喜欢看中国古代宫廷生活，其实外国人欣赏某一种元素，首先看的是它的表现力，看其中有没有引人入胜之处。\r\n\r\n当 然，也不是说现在就不能讲古代故事。比如“穿越剧”，娱乐性强，把古今中外各种元素组合在一起，找到一种戏剧冲突的新方式，我鼓励这种创作思路。只表现历 史的电视剧一定会索然无味，一定要打碎历史重新组合，电视剧里可以这样，因为这遵循的是国人自己的观赏趣味。但这种创作思路放到电影中就很难实现价值，因 为电影是“走出去”的途径，电影、电视这两种形式在表现传统文化方面是截然不同的。\r\n\r\n怡梦：中国风作品的目标是向外的还是向内的？\r\n\r\n陈 少峰：我们的目标是全球市场。在理念上，中国人都支持中国风作品，但国内市场是不是就把握住了？《功夫熊猫》在中国获得好几亿元的票房收入，我们自己的作 品最多只有几千万元。在消费层面，支持不等于埋单。所以第一个问题不是中国文化应该融入多少，而是作品有没有生命力，第二个问题才是作品能否恰到好处地融 入中国元素，让中国文化随着市场竞争力的提升产生全球化的影响力。第一个问题没有解决好，就纠结第二个问题，对作品本身都不具备把握能力，再融入中国元素 更让受众困惑，这是目前的瓶颈。我提倡多研究怎么应对市场，不是研究怎么营销，而是探索如何根据市场需求来创作。譬如表达“正义”这个主题，先探讨人类共 同的正义，再介绍中国如何看待正义，如果对“正义”这个基本概念都未能达成共识，就想把中国的“正义”灌输给别人，别人不会明白，也不会信服。\r\n\r\n中国讲究自然神韵，艺术家需要研究中国传统艺术、哲学，获得更深的理解，把中国文化变成身体素质的一部分，而不是像旁观者一样把元素堆砌到作品中。\r\n\r\n<strong>海外“</strong><strong>中国风”</strong><strong>吹来了什么</strong>\r\n\r\n怡梦：港台的中国风作品何处值得大陆借鉴？\r\n\r\n陈少峰：台湾对传统文化的理解较深，表现力比大陆好。香港对市场的把握能力较强，虽然香港电影也有媚俗的作品，但是制作者大多善于把握大众心理、流行趋势。 大陆有自身的优势，人才济济、市场广阔、政府支持力度大，但也存在问题，企业、艺术家比较急功近利，我们太习惯于“快速发展”的思维方式，缺少反思精神。\r\n\r\n这 些年我们对传统文化的继承和弘扬，在走向世界的层面没有取得太大进展，仍停留在形式上，没有把内容、形式、底蕴和大众融为一体。很多有名的艺术家在尝试， 但并未突破，新人找不到机会，企业是后来介入的，还没有经验。这样一来，市场大就未必是好事，因为随便粗制滥造的作品也能获得利润，竞争压力并不大，这不 是有利于“走出去”的创作环境。\r\n\r\n举 例来说，民风民俗、古代传说都是中国元素。张艺谋在形式上有很多探索，但止于形式；陈凯歌在内容上有很多尝试，但止于内容。都缺乏对文化的深度理解和与市 场走向的结合，也缺乏对国际文化产业成功案例的研究，更缺乏对制作本身所需要素的了解。先不要想如何才是“中国的”作品，因为我们制作出来的“好作品”一 定是“中国的”，我们骨子里就是中国式的思维。但很多艺术家概念先行，这是能力不足的表现。\r\n\r\n怡梦：国外作品对中国的表述，以及他们对本民族风格的描绘，有何值得我们借鉴之处？\r\n\r\n陈少峰：《功夫熊猫》的创造力值得我们学习。它首先是一个谁都喜欢看的故事，创作者第一考虑的是故事情节怎么发展，动作怎么表现，必须先让人喜欢，而不是先 考虑引用什么元素。故事里融入了中国的太极文化，在全世界有八千万人在练太极拳，创作者提炼了太极的哲学理念，在故事情节中呈现得非常圆融。\r\n\r\n《千与千寻》的想象力也值得我们学习。宫崎骏对日本文化的表现非常精当。千与千寻的服饰，场景中的建筑，画面的色彩都充分体现日本风格。他对日本传说进行了再 创造，比如千与千寻的父母因贪吃而变成猪，比如无脸人等。他对神、怪的表现很灵活，作品里有像八爪鱼一样的怪物，因为日本是以鱼为主要食品的国家。但宫崎 骏也不是刻意地去附会日本味，而是他对自身的文化根基有非常深的认同感。日本人很善于学习其他民族的优点，但他们骨子里是很排外的，而且好胜，有竞争心。 他们主要借鉴国外的表达方式和理念，而文化元素和艺术风格是自身固有的。我们的文化产业工作者知识和技术的积累比较丰富，但对传统文化积淀比较浅，表达 力、想象力都受到基础薄弱的限制。\r\n\r\n<strong>采访手记</strong>\r\n\r\n探 寻世界各民族文化艺术交融的轨迹，往往不免心存后殖民主义的芥蒂。笔者在设置问题时已潜在地认为，民族文化的“走出去”必须是“毫发无伤”的，任何考虑他 民族审美取向、顾及他者思维方式而做出的装扮都无疑是对民族文化的一种降格。但陈少峰在接受这次访谈时持有的世界文化视野及人类艺术关怀令笔者服膺。文化 产业立场积极有效地避免了过度的民族自我保护意识、狭隘的民族偏见等干扰，站在纯粹的文化与艺术视野下观望“民族”与“世界”的离合。访谈中阐发的核心理 念是：文化有国籍，艺术无国界。发展文化产业即是以无国界的艺术彰显文化的国籍。理想状态下的全球市场不应预设任何人为的关卡，民族文化自我身份的确认， 需要的并非一纸国籍证书，而是以一种独一无二的姿态置身于琳琅满目的各民族艺术产品之林，令本民族文化与他者的分野不言自明。所谓的国籍证书，只能由今天 的中国自己打造，存在于赞誉与荣耀之中的传统和经典，并非一笔即取即用的遗产，祖先留下的只是素材与灵感。', '中国文化产业需要什么样的中国风', '', 'publish', 'open', 'open', '', '%e4%b8%ad%e5%9b%bd%e6%96%87%e5%8c%96%e4%ba%a7%e4%b8%9a%e9%9c%80%e8%a6%81%e4%bb%80%e4%b9%88%e6%a0%b7%e7%9a%84%e4%b8%ad%e5%9b%bd%e9%a3%8e', '', '', '2011-10-26 07:24:24', '2011-10-26 07:24:24', '', 0, 'http://blogchen.gotoip1.com/?p=60', 0, 'post', '', 0),
(61, 1, '2011-10-26 07:23:37', '2011-10-26 07:23:37', '<strong><a href="http://culture.people.com.cn/h/2011/1021/c226948-2912244509.html">飞向世界的中华艺术之翼系列谈(之一)</a></strong>\n\n<strong>开篇的话</strong>\n\n“发 展面向现代化、面向世界、面向未来的，民族的科学的大众的社会主义文化，培养高度的文化自觉与文化自信，提高全民族文明素质，增强国家文化软实力，弘扬中 华文化，努力建设社会主义文化强国。”党的十七届六中全会为中国文化建设描绘了宏伟蓝图。有识之士指出，中国文化软实力建设的自信，最重要的应体现为对中 国文化根的尊重与扬弃、对中国文化魂的坚守和创新、对外国文化的包容和借鉴。当代中国文化创造，在理论层面和实际的艺术生产中，对于中国文化根的寻找与重 新利用，以及对待中西文化结合的态度，已经不同于上世纪诸多文化寻根之旅，而有了更多自信、坦然与从容。近年来在文艺生产中越吹越烈的“中国风”就是一个 显证。但是，所有表面热闹的风向并不就表明达到真正的文化自觉与自信，尚需许多沉潜的思索与行动。\n\n在 我们可以知悉的文化艺术生产事实中，中国风并不是一个已经确定边界的指称，它产生和生长于民族文化碰撞的语境之下。在文化艺术全球化日益加剧的今天，中国 文化艺术产品面临自认与自立两大挑战，一切以彰显中国特色、突出民族风格为旨归的文化艺术加工都可纳入中国风的范畴。新世纪之初，文学、电影、音乐等各个 艺术门类不约而同地向古典回归、向民间乡里寻觅创作之灵、文化之根，这阵风的吹来，或因庄周的蝴蝶之翼，或因杨妃的霓裳羽衣，或为一把纸伞、一颗红豆、一 盏雨过天青瓷、一段牧笛吹奏的久远旋律，但这是否已经是中国风的全部，是否还有别样的缘由？针对文化艺术生产者对中国风自我指认的误区，他者接受的误读， 甚至为广泛传播而牺牲精髓、炮制表象等问题，我们策划了中国艺术与中国风系列访谈，庶几能对中国风的大致轮廓与内里有更清晰的辨认，然而，这次探究的重点 并不在于定义与设限，而恰恰在于拓展中国风的边界、开阔视野，以期更加深入、整体的把握对中国文化艺术产品的创造与传播产生积极影响。\n\n<strong>中国文化产业需要什么样的中国风</strong>\n\n<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E9%99%88%E5%B0%91%E5%B3%B0">陈少峰</a></span>(北京大学文化产业研究院副院长) 怡梦(本报记者)\n\n我们的文化产业水平高，中国元素的影响力才能充分体现，反之，想以中国元素去带动<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%8F%91%E5%B1%95">文化产业发展</a></span>很难成功。有市场竞争力的作品随便融入什么元素人们都看得津津有味。\n\n<strong>文化产业对中国元素有什么影响</strong>\n\n怡梦：据我所知，大陆艺术家对中国传统元素的集中、大规模运用是在2008年奥运会开幕式上。此前，方文山、周杰伦的流行歌曲，张艺谋、陈凯歌的大片等艺术作品都对中国传统、民族风格有过或深或浅的表述，人们称这类艺术作品为中国风作品，中国风兴起的原因是什么？\n\n陈 少峰：从文化软实力的角度来说，国家鼓励能够代表中国文化的艺术作品，而不是一味模仿其他民族的艺术风格；从文化产业的角度来说，不单纯考虑产业如何推 广，更要考虑中国文化特色如何延续。这种政策上的导向会传递给很多从事文化艺术和文化产业的人。另外，中国传统文化艺术具有传承的价值，比如《青花瓷》中 的瓷文化，在传承中有创新，把握中国人对传统文化的理解、感受方式，融入传统艺术的表达方式，探索如何融合传统与现代。这种探索还受到“韩流”、“日风” 等其他民族独特风格的触动，譬如在韩国的文化商品输出中，政府起着很重要的推动作用，令韩国文化既能与产业结合，又能对世界产生影响，韩国政府对文化产业 的扶持对我们有启发。\n\n中 国特色依存于民族传统，能体现中华文明源流的艺术作品更有价值，我倾向于称所谓的“中国风”为“华流”，因为我们有华文、华人，汉语为基础的文化艺术以 “华”来表达更贴切，“华流”比“中国风”的意识形态色彩淡，文化味道浓。全世界华人创作的艺术作品，虽然有各种方向上的尝试，但都以中国传统文化为根 基，特色分明，易于形成品牌化的影响力。但目前来看，这种艺术风格的特色还不够鲜明，很多人依赖传统元素，传承、借鉴与创新还没有融会贯通，我们的发展空 间还很大。\n\n港 台、海外华人的作品也围绕着中国传统艺术的轨道，只不过他们为了和西方对接，要引入现代元素，形成宽广的视角，在当代各国文化之间取长补短。如台湾的云门 舞集以现代舞蹈表达汉字书法，这种创新更具有艺术性，既融入传统文化神韵，又对国外的戏剧理念有所借鉴，在各种艺术门类的融合中力图突破传统样式。中国戏 曲等传统样式更适合传统的生活方式，以前生活节奏慢，而当代以青少年为主的消费人群对灵动的、富于现代感的艺术作品感兴趣。\n\n怡梦：中国风的命名似乎最早出现在方文山作词、周杰伦演唱的《菊花台》《千里之外》《青花瓷》等歌曲中，那么中国风是从港台吹向大陆的吗？\n\n陈少峰：大陆艺术工作者注重发掘传统元素，这种文化认同为华人所共有，并不一定是受港台影响，但是港台的表现形式对我们有重要启发。在<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E5%85%A8%E7%90%83%E5%8C%96">文化全球化</a></span>的 潮流中，竞争越来越激烈，我们实行对外开放，如果没有特色很难表现民族的力量。而港台是较早接触全球化的前沿阵地，已有很多探索，市场经验比较丰富。在文 化商品中融入传统元素并非易事，《兔侠传奇》里塞满中国元素，但表现力和《功夫熊猫》相比还差得很远。从《花木兰》到《功夫熊猫》，这种中西文化的碰撞可 以启发我们开拓创新视角。动漫、影视制作者应该虚心，不必觉得中国元素被别人抢走了，如果他们能把中国元素表现得原汁原味，相当于和我们同台竞技。我们应 该反思，为什么在中国文化熏陶下生长，作品中对传统元素的运用和阐释还不如别人。目前，动漫、影视工作者的文化修养很多停留在元素表层，没有深入发掘其中 的理念、精神、神韵。中国传统文化中的典故、传说对人性的把握可以超越任何国家和时代而为人们所理解，我们不应仅仅展示中国元素，而是以对元素的再创造参 与竞争，以德服人，在竞争中成长。所以我不太赞成禁播外国动漫，这是缺乏进取精神的地方保护主义，这样的评价机制、竞争机制就成了矮子里拔将军，制作者也 接触不到有启发的作品，地方保护不是长久之计。\n\n怡梦：中国元素对文化产业的发展有什么价值和意义？\n\n陈 少峰：这个问题应该倒过来问——中国文化产业对中国元素会有什么影响？我们的文化产业水平高，中国元素的影响力才能充分体现，反之，想以中国元素去带动文 化产业发展很难成功。有市场竞争力的作品随便融入什么元素人们都看得津津有味。中国元素会给文化产业锦上添花，会令文化产业产出精品，但我认为这是第二 步，顺序不能颠倒。\n\n这些年我们对传统文化的继承和弘扬，在走向世界的层面没有取得太大进展，仍停留在形式上，没有把内容、形式、底蕴和大众融为一体。\n\n<strong>当前艺术生产对中国元素使用是否恰当</strong>\n\n怡梦：有人认为美国电影无论引入什么元素，都是在输出美利坚民族的意识形态、价值观，您有何评价？\n\n陈 少峰：艺术家创作的文化艺术作品，只要能构成一个国家的软实力，政府当然会给予支持，这种支持不仅是意识形态上的，还包括知识产权等很多方面。换句话说， 成功的作品体现了一国的文化艺术影响力，但这不是国家意志，而是综合实力。作品融入的是创作者的艺术理念和文化理解，这不是国家意志能支配的。美国电影中 的爱国主义、英雄主义，其他民族也需要，但美国电影肯定融入了美国的个性。假如我们一味模仿，不能形成自己的风格与竞争力，全世界的文化艺术会出现一面倒 的局面，造成<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E5%A4%B1%E8%A1%A1">文化失衡</a></span>、 引起国家文化安全危机，这不是政府能解决的，所以要搞文化产业。在大方向上是为打造国家软实力、继承发扬民族传统，具体的作品只要能形成正面影响力，都是 有价值的。目前我们的作品还未占领别人的市场，不能责怪别人输出意识形态，市场竞争是实力的较量，实力弱的一方无话可说。在全球范围发展文化产业，真正的 竞争力来自企业，不是政府埋单就能做出好作品。艺术家可以独立探索，但在文化艺术的传播中，只有企业竞争力与艺术家创造力的结合，才会有力量。\n\n怡梦：国内外作品对中国元素的运用、阐释有误区吗？\n\n陈 少峰：外国作品使用中国元素是基于某种元素激发了他的创作灵感。一个人如果见多识广，就不会在乎文化出身，哪一种文化的提炼与表达能吸引人，他都会去发 掘，因为他不是在宣扬爱国主义，而是在生产大众文化产品，为的是吸引全球的受众。但如果只是生硬的拼接、移植，没有人会看，所以不管哪种文化元素，在提炼 过程中都会融入人性的因素，以适应人们在生活中对艺术的感知方式。譬如<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E7%BA%A2%E9%85%92%E6%96%87%E5%8C%96">红酒文化</a></span>， 在形式上不是中华民族的传统元素，但是在人性的共鸣上，我们佩服品酒的高超技艺，欣赏法国人不是简单地把喝酒作为饮食的一部分，而是从中体验到更精致的艺 术升华。元素通过什么故事来呈现非常重要，成功的作品主题似曾相识，但表现形式丰富多样。元素的表达要基于人类共同的价值观与人性的共同基础，比如“侠” 文化，这是中国的，同时又能为其他民族所理解，所以在这个时代仍有共鸣。\n\n所 谓文化艺术作品，既是文化的，也是艺术的；文化要面向大众，艺术要表达创作者的理念。两者糅合在一起应不露痕迹，元素的简单堆砌是毫无价值的。比如《花木 兰》，创作者看重的是这个故事经过改造能吸引人，它是中国故事，当然要以中国元素作为表现形式，否则就不像“花木兰”。这部作品还使用了美国的方法提炼、 改造和创新。\n\n<strong>怡梦：目前我们有对中国元素使用恰当的作品吗？</strong>\n\n陈 少峰：艺术工作者有两种：继承性的几乎是照搬传统，葆有传统元素的原汁原味，但在今天这种纯乎传统的表述方式几乎没有市场了；另一种，知道融传统于现代， 但不知道怎样融合才能恰到好处。让卡通人物身上背着京剧里的刀枪把子，这毫无意义。不是说某句话、某个动作蕴含中国味才更出彩，所以中国元素在精不在多， 关键还是要形成自己的风格。我们往往以为融入中国元素就具有了中国风格，其实元素和风格还有很大差距。一方面我们对艺术作品创作规律的理解不透彻，对元素 生吞活剥，不能做到羚羊挂角无迹可寻，缺乏能为全球受众所认同的角度；另一方面我们市场经验不足，对元素生硬拼接，不能形成在国际上有影响力的品牌优势。 中国讲究自然神韵，艺术家需要研究<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E4%B8%AD%E5%9B%BD%E4%BC%A0%E7%BB%9F%E8%89%BA%E6%9C%AF">中国传统艺术</a></span>、哲学，获得更深的理解，把中国文化变成身体素质的一部分，而不是像旁观者一样把元素堆砌到作品中。\n\n另外，迷恋自身<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E5%85%83%E7%B4%A0">文化元素</a></span>的 表达也不是好事。如果美国创作者是这样，就没有《功夫熊猫》。先考虑创作一个好的作品，在此基础之上融入文化元素才是比较恰当的。对自身文化正面、教条的 呈现往往娱乐性不强，真正吸引人的事物其实是有缺陷的，不是完美无瑕的。好看的故事都有戏剧冲突，人性也是在戏剧冲突之中才能展现出来。娱乐片满足的是人 们的好奇心和生活中体验不到的诉求。现在很多文化艺术工作者像是搞学术，正统、刻板，缺乏想象力和对人性各个侧面的理解。\n\n想 融入中国元素，先要“放弃”中国元素，讲好故事。如果故事不好，又要表达很多概念，又要融入很多元素，这是双重削弱作品的吸引力。中国古代有很多好故事， 比如“人鬼情未了”就是中国人发明的，美国人拍出了《人鬼情未了》，说明这个主题人们都会有所共鸣。但我们今天再讲唐玄宗与杨贵妃的“人鬼情未了”就很不 合时宜，因为这是一个套路，里边没有可供回忆的爱情细节，帝王的生活也不能代表普通人，就像《满城尽带黄金甲》里，只有一帧一帧金碧辉煌的画面，连中国人 自己都不爱看。有的创作者以为外国人喜欢看中国古代宫廷生活，其实外国人欣赏某一种元素，首先看的是它的表现力，看其中有没有引人入胜之处。\n\n当 然，也不是说现在就不能讲古代故事。比如“穿越剧”，娱乐性强，把古今中外各种元素组合在一起，找到一种戏剧冲突的新方式，我鼓励这种创作思路。只表现历 史的电视剧一定会索然无味，一定要打碎历史重新组合，电视剧里可以这样，因为这遵循的是国人自己的观赏趣味。但这种创作思路放到电影中就很难实现价值，因 为电影是“走出去”的途径，电影、电视这两种形式在表现传统文化方面是截然不同的。\n\n怡梦：中国风作品的目标是向外的还是向内的？\n\n陈 少峰：我们的目标是全球市场。在理念上，中国人都支持中国风作品，但国内市场是不是就把握住了？《功夫熊猫》在中国获得好几亿元的票房收入，我们自己的作 品最多只有几千万元。在消费层面，支持不等于埋单。所以第一个问题不是中国文化应该融入多少，而是作品有没有生命力，第二个问题才是作品能否恰到好处地融 入中国元素，让中国文化随着市场竞争力的提升产生全球化的影响力。第一个问题没有解决好，就纠结第二个问题，对作品本身都不具备把握能力，再融入中国元素 更让受众困惑，这是目前的瓶颈。我提倡多研究怎么应对市场，不是研究怎么营销，而是探索如何根据市场需求来创作。譬如表达“正义”这个主题，先探讨人类共 同的正义，再介绍中国如何看待正义，如果对“正义”这个基本概念都未能达成共识，就想把中国的“正义”灌输给别人，别人不会明白，也不会信服。\n\n中国讲究自然神韵，艺术家需要研究中国传统艺术、哲学，获得更深的理解，把中国文化变成身体素质的一部分，而不是像旁观者一样把元素堆砌到作品中。\n\n<strong>海外“</strong><strong>中国风”</strong><strong>吹来了什么</strong>\n\n怡梦：港台的中国风作品何处值得大陆借鉴？\n\n陈少峰：台湾对传统文化的理解较深，表现力比大陆好。香港对市场的把握能力较强，虽然香港电影也有媚俗的作品，但是制作者大多善于把握大众心理、流行趋势。 大陆有自身的优势，人才济济、市场广阔、政府支持力度大，但也存在问题，企业、艺术家比较急功近利，我们太习惯于“快速发展”的思维方式，缺少反思精神。\n\n这 些年我们对传统文化的继承和弘扬，在走向世界的层面没有取得太大进展，仍停留在形式上，没有把内容、形式、底蕴和大众融为一体。很多有名的艺术家在尝试， 但并未突破，新人找不到机会，企业是后来介入的，还没有经验。这样一来，市场大就未必是好事，因为随便粗制滥造的作品也能获得利润，竞争压力并不大，这不 是有利于“走出去”的创作环境。\n\n举 例来说，民风民俗、古代传说都是中国元素。张艺谋在形式上有很多探索，但止于形式；陈凯歌在内容上有很多尝试，但止于内容。都缺乏对文化的深度理解和与市 场走向的结合，也缺乏对国际文化产业成功案例的研究，更缺乏对制作本身所需要素的了解。先不要想如何才是“中国的”作品，因为我们制作出来的“好作品”一 定是“中国的”，我们骨子里就是中国式的思维。但很多艺术家概念先行，这是能力不足的表现。\n\n怡梦：国外作品对中国的表述，以及他们对本民族风格的描绘，有何值得我们借鉴之处？\n\n陈少峰：《功夫熊猫》的创造力值得我们学习。它首先是一个谁都喜欢看的故事，创作者第一考虑的是故事情节怎么发展，动作怎么表现，必须先让人喜欢，而不是先 考虑引用什么元素。故事里融入了中国的太极文化，在全世界有八千万人在练太极拳，创作者提炼了太极的哲学理念，在故事情节中呈现得非常圆融。\n\n《千与千寻》的想象力也值得我们学习。宫崎骏对日本文化的表现非常精当。千与千寻的服饰，场景中的建筑，画面的色彩都充分体现日本风格。他对日本传说进行了再 创造，比如千与千寻的父母因贪吃而变成猪，比如无脸人等。他对神、怪的表现很灵活，作品里有像八爪鱼一样的怪物，因为日本是以鱼为主要食品的国家。但宫崎 骏也不是刻意地去附会日本味，而是他对自身的文化根基有非常深的认同感。日本人很善于学习其他民族的优点，但他们骨子里是很排外的，而且好胜，有竞争心。 他们主要借鉴国外的表达方式和理念，而文化元素和艺术风格是自身固有的。我们的文化产业工作者知识和技术的积累比较丰富，但对传统文化积淀比较浅，表达 力、想象力都受到基础薄弱的限制。\n\n<strong>采访手记</strong>\n\n探 寻世界各民族文化艺术交融的轨迹，往往不免心存后殖民主义的芥蒂。笔者在设置问题时已潜在地认为，民族文化的“走出去”必须是“毫发无伤”的，任何考虑他 民族审美取向、顾及他者思维方式而做出的装扮都无疑是对民族文化的一种降格。但陈少峰在接受这次访谈时持有的世界文化视野及人类艺术关怀令笔者服膺。文化 产业立场积极有效地避免了过度的民族自我保护意识、狭隘的民族偏见等干扰，站在纯粹的文化与艺术视野下观望“民族”与“世界”的离合。访谈中阐发的核心理 念是：文化有国籍，艺术无国界。发展文化产业即是以无国界的艺术彰显文化的国籍。理想状态下的全球市场不应预设任何人为的关卡，民族文化自我身份的确认， 需要的并非一纸国籍证书，而是以一种独一无二的姿态置身于琳琅满目的各民族艺术产品之林，令本民族文化与他者的分野不言自明。所谓的国籍证书，只能由今天 的中国自己打造，存在于赞誉与荣耀之中的传统和经典，并非一笔即取即用的遗产，祖先留下的只是素材与灵感。', '中国文化产业需要什么样的中国风', '', 'inherit', 'open', 'open', '', '60-revision', '', '', '2011-10-26 07:23:37', '2011-10-26 07:23:37', '', 60, 'http://blogchen.gotoip1.com/?p=61', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(62, 1, '2011-10-26 07:25:28', '2011-10-26 07:25:28', '<strong><a href="http://culture.people.com.cn/h/2011/1021/c226948-2912244509.html">飞向世界的中华艺术之翼系列谈(之一)</a></strong>\n\n<strong>开篇的话</strong>\n\n“发展面向现代化、面向世界、面向未来的，民族的科学的大众的社会主义文化，培养高度的文化自觉与文化自信，提高全民族文明素质，增强国家文化软实力，弘扬中 华文化，努力建设社会主义文化强国。”党的十七届六中全会为中国文化建设描绘了宏伟蓝图。有识之士指出，中国文化软实力建设的自信，最重要的应体现为对中 国文化根的尊重与扬弃、对中国文化魂的坚守和创新、对外国文化的包容和借鉴。当代中国文化创造，在理论层面和实际的艺术生产中，对于中国文化根的寻找与重 新利用，以及对待中西文化结合的态度，已经不同于上世纪诸多文化寻根之旅，而有了更多自信、坦然与从容。近年来在文艺生产中越吹越烈的“中国风”就是一个 显证。但是，所有表面热闹的风向并不就表明达到真正的文化自觉与自信，尚需许多沉潜的思索与行动。\n\n在我们可以知悉的文化艺术生产事实中，中国风并不是一个已经确定边界的指称，它产生和生长于民族文化碰撞的语境之下。在文化艺术全球化日益加剧的今天，中国 文化艺术产品面临自认与自立两大挑战，一切以彰显中国特色、突出民族风格为旨归的文化艺术加工都可纳入中国风的范畴。新世纪之初，文学、电影、音乐等各个 艺术门类不约而同地向古典回归、向民间乡里寻觅创作之灵、文化之根，这阵风的吹来，或因庄周的蝴蝶之翼，或因杨妃的霓裳羽衣，或为一把纸伞、一颗红豆、一 盏雨过天青瓷、一段牧笛吹奏的久远旋律，但这是否已经是中国风的全部，是否还有别样的缘由？针对文化艺术生产者对中国风自我指认的误区，他者接受的误读， 甚至为广泛传播而牺牲精髓、炮制表象等问题，我们策划了中国艺术与中国风系列访谈，庶几能对中国风的大致轮廓与内里有更清晰的辨认，然而，这次探究的重点 并不在于定义与设限，而恰恰在于拓展中国风的边界、开阔视野，以期更加深入、整体的把握对中国文化艺术产品的创造与传播产生积极影响。\n\n<strong>中国文化产业需要什么样的中国风</strong>\n\n<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E9%99%88%E5%B0%91%E5%B3%B0">陈少峰</a></span>(北京大学文化产业研究院副院长) 怡梦(本报记者)\n\n我们的文化产业水平高，中国元素的影响力才能充分体现，反之，想以中国元素去带动<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%8F%91%E5%B1%95">文化产业发展</a></span>很难成功。有市场竞争力的作品随便融入什么元素人们都看得津津有味。\n\n<strong>文化产业对中国元素有什么影响</strong>\n\n怡梦：据我所知，大陆艺术家对中国传统元素的集中、大规模运用是在2008年奥运会开幕式上。此前，方文山、周杰伦的流行歌曲，张艺谋、陈凯歌的大片等艺术作品都对中国传统、民族风格有过或深或浅的表述，人们称这类艺术作品为中国风作品，中国风兴起的原因是什么？\n\n陈少峰：从文化软实力的角度来说，国家鼓励能够代表中国文化的艺术作品，而不是一味模仿其他民族的艺术风格；从文化产业的角度来说，不单纯考虑产业如何推 广，更要考虑中国文化特色如何延续。这种政策上的导向会传递给很多从事文化艺术和文化产业的人。另外，中国传统文化艺术具有传承的价值，比如《青花瓷》中 的瓷文化，在传承中有创新，把握中国人对传统文化的理解、感受方式，融入传统艺术的表达方式，探索如何融合传统与现代。这种探索还受到“韩流”、“日风” 等其他民族独特风格的触动，譬如在韩国的文化商品输出中，政府起着很重要的推动作用，令韩国文化既能与产业结合，又能对世界产生影响，韩国政府对文化产业 的扶持对我们有启发。\n\n中国特色依存于民族传统，能体现中华文明源流的艺术作品更有价值，我倾向于称所谓的“中国风”为“华流”，因为我们有华文、华人，汉语为基础的文化艺术以 “华”来表达更贴切，“华流”比“中国风”的意识形态色彩淡，文化味道浓。全世界华人创作的艺术作品，虽然有各种方向上的尝试，但都以中国传统文化为根 基，特色分明，易于形成品牌化的影响力。但目前来看，这种艺术风格的特色还不够鲜明，很多人依赖传统元素，传承、借鉴与创新还没有融会贯通，我们的发展空 间还很大。\n\n港台、海外华人的作品也围绕着中国传统艺术的轨道，只不过他们为了和西方对接，要引入现代元素，形成宽广的视角，在当代各国文化之间取长补短。如台湾的云门 舞集以现代舞蹈表达汉字书法，这种创新更具有艺术性，既融入传统文化神韵，又对国外的戏剧理念有所借鉴，在各种艺术门类的融合中力图突破传统样式。中国戏 曲等传统样式更适合传统的生活方式，以前生活节奏慢，而当代以青少年为主的消费人群对灵动的、富于现代感的艺术作品感兴趣。\n\n怡梦：中国风的命名似乎最早出现在方文山作词、周杰伦演唱的《菊花台》《千里之外》《青花瓷》等歌曲中，那么中国风是从港台吹向大陆的吗？\n\n陈少峰：大陆艺术工作者注重发掘传统元素，这种文化认同为华人所共有，并不一定是受港台影响，但是港台的表现形式对我们有重要启发。在<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E5%85%A8%E7%90%83%E5%8C%96">文化全球化</a></span>的 潮流中，竞争越来越激烈，我们实行对外开放，如果没有特色很难表现民族的力量。而港台是较早接触全球化的前沿阵地，已有很多探索，市场经验比较丰富。在文 化商品中融入传统元素并非易事，《兔侠传奇》里塞满中国元素，但表现力和《功夫熊猫》相比还差得很远。从《花木兰》到《功夫熊猫》，这种中西文化的碰撞可 以启发我们开拓创新视角。动漫、影视制作者应该虚心，不必觉得中国元素被别人抢走了，如果他们能把中国元素表现得原汁原味，相当于和我们同台竞技。我们应 该反思，为什么在中国文化熏陶下生长，作品中对传统元素的运用和阐释还不如别人。目前，动漫、影视工作者的文化修养很多停留在元素表层，没有深入发掘其中 的理念、精神、神韵。中国传统文化中的典故、传说对人性的把握可以超越任何国家和时代而为人们所理解，我们不应仅仅展示中国元素，而是以对元素的再创造参 与竞争，以德服人，在竞争中成长。所以我不太赞成禁播外国动漫，这是缺乏进取精神的地方保护主义，这样的评价机制、竞争机制就成了矮子里拔将军，制作者也 接触不到有启发的作品，地方保护不是长久之计。\n\n怡梦：中国元素对文化产业的发展有什么价值和意义？\n\n陈 少峰：这个问题应该倒过来问——中国文化产业对中国元素会有什么影响？我们的文化产业水平高，中国元素的影响力才能充分体现，反之，想以中国元素去带动文 化产业发展很难成功。有市场竞争力的作品随便融入什么元素人们都看得津津有味。中国元素会给文化产业锦上添花，会令文化产业产出精品，但我认为这是第二 步，顺序不能颠倒。\n\n这些年我们对传统文化的继承和弘扬，在走向世界的层面没有取得太大进展，仍停留在形式上，没有把内容、形式、底蕴和大众融为一体。\n\n<strong>当前艺术生产对中国元素使用是否恰当</strong>\n\n怡梦：有人认为美国电影无论引入什么元素，都是在输出美利坚民族的意识形态、价值观，您有何评价？\n\n陈 少峰：艺术家创作的文化艺术作品，只要能构成一个国家的软实力，政府当然会给予支持，这种支持不仅是意识形态上的，还包括知识产权等很多方面。换句话说， 成功的作品体现了一国的文化艺术影响力，但这不是国家意志，而是综合实力。作品融入的是创作者的艺术理念和文化理解，这不是国家意志能支配的。美国电影中 的爱国主义、英雄主义，其他民族也需要，但美国电影肯定融入了美国的个性。假如我们一味模仿，不能形成自己的风格与竞争力，全世界的文化艺术会出现一面倒 的局面，造成<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E5%A4%B1%E8%A1%A1">文化失衡</a></span>、 引起国家文化安全危机，这不是政府能解决的，所以要搞文化产业。在大方向上是为打造国家软实力、继承发扬民族传统，具体的作品只要能形成正面影响力，都是 有价值的。目前我们的作品还未占领别人的市场，不能责怪别人输出意识形态，市场竞争是实力的较量，实力弱的一方无话可说。在全球范围发展文化产业，真正的 竞争力来自企业，不是政府埋单就能做出好作品。艺术家可以独立探索，但在文化艺术的传播中，只有企业竞争力与艺术家创造力的结合，才会有力量。\n\n怡梦：国内外作品对中国元素的运用、阐释有误区吗？\n\n陈 少峰：外国作品使用中国元素是基于某种元素激发了他的创作灵感。一个人如果见多识广，就不会在乎文化出身，哪一种文化的提炼与表达能吸引人，他都会去发 掘，因为他不是在宣扬爱国主义，而是在生产大众文化产品，为的是吸引全球的受众。但如果只是生硬的拼接、移植，没有人会看，所以不管哪种文化元素，在提炼 过程中都会融入人性的因素，以适应人们在生活中对艺术的感知方式。譬如<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E7%BA%A2%E9%85%92%E6%96%87%E5%8C%96">红酒文化</a></span>， 在形式上不是中华民族的传统元素，但是在人性的共鸣上，我们佩服品酒的高超技艺，欣赏法国人不是简单地把喝酒作为饮食的一部分，而是从中体验到更精致的艺 术升华。元素通过什么故事来呈现非常重要，成功的作品主题似曾相识，但表现形式丰富多样。元素的表达要基于人类共同的价值观与人性的共同基础，比如“侠” 文化，这是中国的，同时又能为其他民族所理解，所以在这个时代仍有共鸣。\n\n所 谓文化艺术作品，既是文化的，也是艺术的；文化要面向大众，艺术要表达创作者的理念。两者糅合在一起应不露痕迹，元素的简单堆砌是毫无价值的。比如《花木 兰》，创作者看重的是这个故事经过改造能吸引人，它是中国故事，当然要以中国元素作为表现形式，否则就不像“花木兰”。这部作品还使用了美国的方法提炼、 改造和创新。\n\n<strong>怡梦：目前我们有对中国元素使用恰当的作品吗？</strong>\n\n陈 少峰：艺术工作者有两种：继承性的几乎是照搬传统，葆有传统元素的原汁原味，但在今天这种纯乎传统的表述方式几乎没有市场了；另一种，知道融传统于现代， 但不知道怎样融合才能恰到好处。让卡通人物身上背着京剧里的刀枪把子，这毫无意义。不是说某句话、某个动作蕴含中国味才更出彩，所以中国元素在精不在多， 关键还是要形成自己的风格。我们往往以为融入中国元素就具有了中国风格，其实元素和风格还有很大差距。一方面我们对艺术作品创作规律的理解不透彻，对元素 生吞活剥，不能做到羚羊挂角无迹可寻，缺乏能为全球受众所认同的角度；另一方面我们市场经验不足，对元素生硬拼接，不能形成在国际上有影响力的品牌优势。 中国讲究自然神韵，艺术家需要研究<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E4%B8%AD%E5%9B%BD%E4%BC%A0%E7%BB%9F%E8%89%BA%E6%9C%AF">中国传统艺术</a></span>、哲学，获得更深的理解，把中国文化变成身体素质的一部分，而不是像旁观者一样把元素堆砌到作品中。\n\n另外，迷恋自身<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E5%85%83%E7%B4%A0">文化元素</a></span>的 表达也不是好事。如果美国创作者是这样，就没有《功夫熊猫》。先考虑创作一个好的作品，在此基础之上融入文化元素才是比较恰当的。对自身文化正面、教条的 呈现往往娱乐性不强，真正吸引人的事物其实是有缺陷的，不是完美无瑕的。好看的故事都有戏剧冲突，人性也是在戏剧冲突之中才能展现出来。娱乐片满足的是人 们的好奇心和生活中体验不到的诉求。现在很多文化艺术工作者像是搞学术，正统、刻板，缺乏想象力和对人性各个侧面的理解。\n\n想 融入中国元素，先要“放弃”中国元素，讲好故事。如果故事不好，又要表达很多概念，又要融入很多元素，这是双重削弱作品的吸引力。中国古代有很多好故事， 比如“人鬼情未了”就是中国人发明的，美国人拍出了《人鬼情未了》，说明这个主题人们都会有所共鸣。但我们今天再讲唐玄宗与杨贵妃的“人鬼情未了”就很不 合时宜，因为这是一个套路，里边没有可供回忆的爱情细节，帝王的生活也不能代表普通人，就像《满城尽带黄金甲》里，只有一帧一帧金碧辉煌的画面，连中国人 自己都不爱看。有的创作者以为外国人喜欢看中国古代宫廷生活，其实外国人欣赏某一种元素，首先看的是它的表现力，看其中有没有引人入胜之处。\n\n当 然，也不是说现在就不能讲古代故事。比如“穿越剧”，娱乐性强，把古今中外各种元素组合在一起，找到一种戏剧冲突的新方式，我鼓励这种创作思路。只表现历 史的电视剧一定会索然无味，一定要打碎历史重新组合，电视剧里可以这样，因为这遵循的是国人自己的观赏趣味。但这种创作思路放到电影中就很难实现价值，因 为电影是“走出去”的途径，电影、电视这两种形式在表现传统文化方面是截然不同的。\n\n怡梦：中国风作品的目标是向外的还是向内的？\n\n陈 少峰：我们的目标是全球市场。在理念上，中国人都支持中国风作品，但国内市场是不是就把握住了？《功夫熊猫》在中国获得好几亿元的票房收入，我们自己的作 品最多只有几千万元。在消费层面，支持不等于埋单。所以第一个问题不是中国文化应该融入多少，而是作品有没有生命力，第二个问题才是作品能否恰到好处地融 入中国元素，让中国文化随着市场竞争力的提升产生全球化的影响力。第一个问题没有解决好，就纠结第二个问题，对作品本身都不具备把握能力，再融入中国元素 更让受众困惑，这是目前的瓶颈。我提倡多研究怎么应对市场，不是研究怎么营销，而是探索如何根据市场需求来创作。譬如表达“正义”这个主题，先探讨人类共 同的正义，再介绍中国如何看待正义，如果对“正义”这个基本概念都未能达成共识，就想把中国的“正义”灌输给别人，别人不会明白，也不会信服。\n\n中国讲究自然神韵，艺术家需要研究中国传统艺术、哲学，获得更深的理解，把中国文化变成身体素质的一部分，而不是像旁观者一样把元素堆砌到作品中。\n\n<strong>海外“</strong><strong>中国风”</strong><strong>吹来了什么</strong>\n\n怡梦：港台的中国风作品何处值得大陆借鉴？\n\n陈少峰：台湾对传统文化的理解较深，表现力比大陆好。香港对市场的把握能力较强，虽然香港电影也有媚俗的作品，但是制作者大多善于把握大众心理、流行趋势。 大陆有自身的优势，人才济济、市场广阔、政府支持力度大，但也存在问题，企业、艺术家比较急功近利，我们太习惯于“快速发展”的思维方式，缺少反思精神。\n\n这 些年我们对传统文化的继承和弘扬，在走向世界的层面没有取得太大进展，仍停留在形式上，没有把内容、形式、底蕴和大众融为一体。很多有名的艺术家在尝试， 但并未突破，新人找不到机会，企业是后来介入的，还没有经验。这样一来，市场大就未必是好事，因为随便粗制滥造的作品也能获得利润，竞争压力并不大，这不 是有利于“走出去”的创作环境。\n\n举 例来说，民风民俗、古代传说都是中国元素。张艺谋在形式上有很多探索，但止于形式；陈凯歌在内容上有很多尝试，但止于内容。都缺乏对文化的深度理解和与市 场走向的结合，也缺乏对国际文化产业成功案例的研究，更缺乏对制作本身所需要素的了解。先不要想如何才是“中国的”作品，因为我们制作出来的“好作品”一 定是“中国的”，我们骨子里就是中国式的思维。但很多艺术家概念先行，这是能力不足的表现。\n\n怡梦：国外作品对中国的表述，以及他们对本民族风格的描绘，有何值得我们借鉴之处？\n\n陈少峰：《功夫熊猫》的创造力值得我们学习。它首先是一个谁都喜欢看的故事，创作者第一考虑的是故事情节怎么发展，动作怎么表现，必须先让人喜欢，而不是先 考虑引用什么元素。故事里融入了中国的太极文化，在全世界有八千万人在练太极拳，创作者提炼了太极的哲学理念，在故事情节中呈现得非常圆融。\n\n《千与千寻》的想象力也值得我们学习。宫崎骏对日本文化的表现非常精当。千与千寻的服饰，场景中的建筑，画面的色彩都充分体现日本风格。他对日本传说进行了再 创造，比如千与千寻的父母因贪吃而变成猪，比如无脸人等。他对神、怪的表现很灵活，作品里有像八爪鱼一样的怪物，因为日本是以鱼为主要食品的国家。但宫崎 骏也不是刻意地去附会日本味，而是他对自身的文化根基有非常深的认同感。日本人很善于学习其他民族的优点，但他们骨子里是很排外的，而且好胜，有竞争心。 他们主要借鉴国外的表达方式和理念，而文化元素和艺术风格是自身固有的。我们的文化产业工作者知识和技术的积累比较丰富，但对传统文化积淀比较浅，表达 力、想象力都受到基础薄弱的限制。\n\n<strong>采访手记</strong>\n\n探 寻世界各民族文化艺术交融的轨迹，往往不免心存后殖民主义的芥蒂。笔者在设置问题时已潜在地认为，民族文化的“走出去”必须是“毫发无伤”的，任何考虑他 民族审美取向、顾及他者思维方式而做出的装扮都无疑是对民族文化的一种降格。但陈少峰在接受这次访谈时持有的世界文化视野及人类艺术关怀令笔者服膺。文化 产业立场积极有效地避免了过度的民族自我保护意识、狭隘的民族偏见等干扰，站在纯粹的文化与艺术视野下观望“民族”与“世界”的离合。访谈中阐发的核心理 念是：文化有国籍，艺术无国界。发展文化产业即是以无国界的艺术彰显文化的国籍。理想状态下的全球市场不应预设任何人为的关卡，民族文化自我身份的确认， 需要的并非一纸国籍证书，而是以一种独一无二的姿态置身于琳琅满目的各民族艺术产品之林，令本民族文化与他者的分野不言自明。所谓的国籍证书，只能由今天 的中国自己打造，存在于赞誉与荣耀之中的传统和经典，并非一笔即取即用的遗产，祖先留下的只是素材与灵感。', '中国文化产业需要什么样的中国风', '', 'inherit', 'open', 'open', '', '60-autosave', '', '', '2011-10-26 07:25:28', '2011-10-26 07:25:28', '', 60, 'http://blogchen.gotoip1.com/?p=62', 0, 'revision', '', 0),
(63, 1, '2011-10-26 07:27:09', '2011-10-26 07:27:09', '<a href="http://culture.people.com.cn/h/2011/1018/c226948-1166470413.html?navigation=1">中新社北京10月18日电 题</a>：专家解读六中全会公报关键词 前所未有重视<span style="text-decoration: underline;">文化创新</span>创造\r\n\r\n中新社记者 张蔚然 周兆军\r\n\r\n中共十七届六中全会于2011年10月15日至18日在北京举行，全会审议通过了《中共中央关于深化<span style="text-decoration: underline;">文化体制改革</span>、推动社会主义文化大发展大繁荣若干重大问题的决定》。此间专家分析，这是指导中国文化改革发展，开创中国特色社会文化建设新局面，建设社会主义文化强国的纲领性文件，提出建设文化强国长远战略是公报最大亮点，同时字里行间体现出对文化创新创造的前所未有的重视。\r\n\r\n分析人士认为，这是继中共十六大明确提出“积极发展文化事业和文化产业”的战略决策，2005年底出台《中共中央、国务院关于深化文化体制改革的若干意见》，“十二五”规划纲要从加快推进公益性文化事业单位改革、深入推进经营性文化单位<span style="text-decoration: underline;">转企改制</span>、加快推进文化管理体制改革等方面对文化体制改革作出全面部署以来，中共对文化体制改革所做的又一次国家层面重要战略部署，标志着中共对文化建设的认识达到了新的高度，高层在文化理论创新与实践方面正逐渐走向成熟。\r\n\r\n北京大学文化产业研究院副院长陈少峰表示，建设社会主义文化强国的相关表述是<span style="text-decoration: underline;">公报</span>最 大亮点，将国家重大战略推向新的高度，并细化了部署。三十多年来，中国通过改革开放实现了经济飞速发展，综合国力显著提高，但文化发展现状与经济社会发 展、中国国际影响力却不相称，全会做出的部署意味着中国强化了文化在国际竞争中重要性的自我意识，理清了以经济强国推动成为文化强国、经济与文化发展并重 的思路。\r\n\r\n中国文联原副主席仲呈祥认为，从公报内容分析，文化对社会政治经济提供思想支撑的重要性越来越突出。建设社会主义文化强国有赖于全面提升民族素质、塑造高尚人格，就文艺创作来讲，不应过度追求经济效益，而应创造更多反映真善美的文艺作品。\r\n\r\n公报对文化创造、文化创新的强调非常突出，文化创造有关表述在文中出现7次，包括不断以思想文化新觉醒、理论创造新成果、文化建设新成就推动党和人民事业向 前发展，文化越来越成为民族凝聚力和创造力的重要源泉，不断开创全民族文化创造活力持续迸发的新局面，要发挥人民群众文化创造积极性，在全社会营造鼓励文 化创造的良好氛围，让蕴藏于人民中的文化创造活力得到充分发挥，在坚持和发展中国特色社会主义的伟大实践中进行文化创造等。\r\n\r\n有关文化创新的表述在公报中出现5次，包括推进文化科技创新，文化是最需要创新的领域，<span style="text-decoration: underline;">创新文化</span>走出去模式，创新文化管理体制，加快培养造就德才兼备、锐意创新、结构合理、规模宏大的文化人才队伍等。\r\n\r\n陈少峰分析，公报对文化创新与创造前所未有的重视，说明在“文化在综合国力竞争中的地位和作用更加凸显，增强国家文化软实力、中华文化国际影响力要求更加紧 迫”的国际形势下，中共高层认识到释放普通民众文化创造力的重要性，文化的供给不应局限于行政部门与文化事业单位，而应该通过创新与创造进一步解放<span style="text-decoration: underline;">文化生产力</span>，重视文化资源的深度发掘，使当前的文化市场产品更丰富、更具竞争力，这有利于中国文化“走出去”。公报突出对人力资源的重视，强调文化发展要“牢固树立人才是第一资源思想”，这与追求文化创新创造的思路相互印证，相互推进。\r\n\r\n陈少峰注意到，与以往相比，公报关于文化领域相关理念的表述更准确，指向更明确。如提出“社会主义核心价值体系是兴国之魂，是社会主义先进文化的精髓。”相 关概念虽不是第一次出现，但表达更准确。又如公报提出“要构建现代文化产业体系，形成公有制为主体、多种所有制共同发展的文化产业格局”，这意味着今后的<span style="text-decoration: underline;">文化产业发展</span>将更加重视市场和企业发挥作用，机制更加灵活。(完)\r\n\r\n&nbsp;', '专家解读六中全会公报关键词 重视文化创新创造', '', 'publish', 'open', 'open', '', '%e4%b8%93%e5%ae%b6%e8%a7%a3%e8%af%bb%e5%85%ad%e4%b8%ad%e5%85%a8%e4%bc%9a%e5%85%ac%e6%8a%a5%e5%85%b3%e9%94%ae%e8%af%8d-%e9%87%8d%e8%a7%86%e6%96%87%e5%8c%96%e5%88%9b%e6%96%b0%e5%88%9b%e9%80%a0', '', '', '2011-10-27 01:48:18', '2011-10-27 01:48:18', '', 0, 'http://blogchen.gotoip1.com/?p=63', 0, 'post', '', 0),
(64, 1, '2011-10-26 07:26:33', '2011-10-26 07:26:33', '中新社北京10月18日电 题：<a href="http://culture.people.com.cn/h/2011/1018/c226948-1166470413.html?navigation=1">专家解读六中全会公报关键词 前所未有重视<span style="text-decoration: underline;">文化创新</span>创造</a>\n\n中新社记者 张蔚然 周兆军\n\n中共十七届六中全会于2011年10月15日至18日在北京举行，全会审议通过了《中共中央关于深化<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E4%BD%93%E5%88%B6%E6%94%B9%E9%9D%A9">文化体制改革</a></span>、推动社会主义文化大发展大繁荣若干重大问题的决定》。此间专家分析，这是指导中国文化改革发展，开创中国特色社会文化建设新局面，建设社会主义文化强国的纲领性文件，提出建设文化强国长远战略是公报最大亮点，同时字里行间体现出对文化创新创造的前所未有的重视。\n\n分析人士认为，这是继中共十六大明确提出“积极发展文化事业和文化产业”的战略决策，2005年底出台《中共中央、国务院关于深化文化体制改革的若干意见》，“十二五”规划纲要从加快推进公益性文化事业单位改革、深入推进经营性文化单位<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E8%BD%AC%E4%BC%81%E6%94%B9%E5%88%B6">转企改制</a></span>、加快推进文化管理体制改革等方面对文化体制改革作出全面部署以来，中共对文化体制改革所做的又一次国家层面重要战略部署，标志着中共对文化建设的认识达到了新的高度，高层在文化理论创新与实践方面正逐渐走向成熟。\n\n北京大学文化产业研究院副院长陈少峰表示，建设社会主义文化强国的相关表述是<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E5%85%AC%E6%8A%A5">公报</a></span>最 大亮点，将国家重大战略推向新的高度，并细化了部署。三十多年来，中国通过改革开放实现了经济飞速发展，综合国力显著提高，但文化发展现状与经济社会发 展、中国国际影响力却不相称，全会做出的部署意味着中国强化了文化在国际竞争中重要性的自我意识，理清了以经济强国推动成为文化强国、经济与文化发展并重 的思路。\n\n中国文联原副主席仲呈祥认为，从公报内容分析，文化对社会政治经济提供思想支撑的重要性越来越突出。建设社会主义文化强国有赖于全面提升民族素质、塑造高尚人格，就文艺创作来讲，不应过度追求经济效益，而应创造更多反映真善美的文艺作品。\n\n公 报对文化创造、文化创新的强调非常突出，文化创造有关表述在文中出现7次，包括不断以思想文化新觉醒、理论创造新成果、文化建设新成就推动党和人民事业向 前发展，文化越来越成为民族凝聚力和创造力的重要源泉，不断开创全民族文化创造活力持续迸发的新局面，要发挥人民群众文化创造积极性，在全社会营造鼓励文 化创造的良好氛围，让蕴藏于人民中的文化创造活力得到充分发挥，在坚持和发展中国特色社会主义的伟大实践中进行文化创造等。\n\n有关文化创新的表述在公报中出现5次，包括推进文化科技创新，文化是最需要创新的领域，<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E5%88%9B%E6%96%B0%E6%96%87%E5%8C%96">创新文化</a></span>走出去模式，创新文化管理体制，加快培养造就德才兼备、锐意创新、结构合理、规模宏大的文化人才队伍等。\n\n陈 少峰分析，公报对文化创新与创造前所未有的重视，说明在“文化在综合国力竞争中的地位和作用更加凸显，增强国家文化软实力、中华文化国际影响力要求更加紧 迫”的国际形势下，中共高层认识到释放普通民众文化创造力的重要性，文化的供给不应局限于行政部门与文化事业单位，而应该通过创新与创造进一步解放<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E7%94%9F%E4%BA%A7%E5%8A%9B">文化生产力</a></span>，重视文化资源的深度发掘，使当前的文化市场产品更丰富、更具竞争力，这有利于中国文化“走出去”。公报突出对人力资源的重视，强调文化发展要“牢固树立人才是第一资源思想”，这与追求文化创新创造的思路相互印证，相互推进。\n\n陈 少峰注意到，与以往相比，公报关于文化领域相关理念的表述更准确，指向更明确。如提出“社会主义核心价值体系是兴国之魂，是社会主义先进文化的精髓。”相 关概念虽不是第一次出现，但表达更准确。又如公报提出“要构建现代文化产业体系，形成公有制为主体、多种所有制共同发展的文化产业格局”，这意味着今后的<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%8F%91%E5%B1%95">文化产业发展</a></span>将更加重视市场和企业发挥作用，机制更加灵活。(完)\n\n&nbsp;', '专家解读六中全会公报关键词 重视文化创新创造', '', 'inherit', 'open', 'open', '', '63-revision', '', '', '2011-10-26 07:26:33', '2011-10-26 07:26:33', '', 63, 'http://blogchen.gotoip1.com/?p=64', 0, 'revision', '', 0),
(87, 1, '2011-10-27 01:47:30', '2011-10-27 01:47:30', '中新社北京10月18日电 题：<a href="http://culture.people.com.cn/h/2011/1018/c226948-1166470413.html?navigation=1">专家解读六中全会公报关键词 前所未有重视<span style="text-decoration: underline;">文化创新</span>创造</a>\r\n\r\n中新社记者 张蔚然 周兆军\r\n\r\n中共十七届六中全会于2011年10月15日至18日在北京举行，全会审议通过了《中共中央关于深化<span style="text-decoration: underline;">文化体制改革</span>、推动社会主义文化大发展大繁荣若干重大问题的决定》。此间专家分析，这是指导中国文化改革发展，开创中国特色社会文化建设新局面，建设社会主义文化强国的纲领性文件，提出建设文化强国长远战略是公报最大亮点，同时字里行间体现出对文化创新创造的前所未有的重视。\r\n\r\n分析人士认为，这是继中共十六大明确提出“积极发展文化事业和文化产业”的战略决策，2005年底出台《中共中央、国务院关于深化文化体制改革的若干意见》，“十二五”规划纲要从加快推进公益性文化事业单位改革、深入推进经营性文化单位<span style="text-decoration: underline;">转企改制</span>、加快推进文化管理体制改革等方面对文化体制改革作出全面部署以来，中共对文化体制改革所做的又一次国家层面重要战略部署，标志着中共对文化建设的认识达到了新的高度，高层在文化理论创新与实践方面正逐渐走向成熟。\r\n\r\n北京大学文化产业研究院副院长陈少峰表示，建设社会主义文化强国的相关表述是<span style="text-decoration: underline;">公报</span>最 大亮点，将国家重大战略推向新的高度，并细化了部署。三十多年来，中国通过改革开放实现了经济飞速发展，综合国力显著提高，但文化发展现状与经济社会发 展、中国国际影响力却不相称，全会做出的部署意味着中国强化了文化在国际竞争中重要性的自我意识，理清了以经济强国推动成为文化强国、经济与文化发展并重 的思路。\r\n\r\n中国文联原副主席仲呈祥认为，从公报内容分析，文化对社会政治经济提供思想支撑的重要性越来越突出。建设社会主义文化强国有赖于全面提升民族素质、塑造高尚人格，就文艺创作来讲，不应过度追求经济效益，而应创造更多反映真善美的文艺作品。\r\n\r\n公报对文化创造、文化创新的强调非常突出，文化创造有关表述在文中出现7次，包括不断以思想文化新觉醒、理论创造新成果、文化建设新成就推动党和人民事业向 前发展，文化越来越成为民族凝聚力和创造力的重要源泉，不断开创全民族文化创造活力持续迸发的新局面，要发挥人民群众文化创造积极性，在全社会营造鼓励文 化创造的良好氛围，让蕴藏于人民中的文化创造活力得到充分发挥，在坚持和发展中国特色社会主义的伟大实践中进行文化创造等。\r\n\r\n有关文化创新的表述在公报中出现5次，包括推进文化科技创新，文化是最需要创新的领域，<span style="text-decoration: underline;">创新文化</span>走出去模式，创新文化管理体制，加快培养造就德才兼备、锐意创新、结构合理、规模宏大的文化人才队伍等。\r\n\r\n陈少峰分析，公报对文化创新与创造前所未有的重视，说明在“文化在综合国力竞争中的地位和作用更加凸显，增强国家文化软实力、中华文化国际影响力要求更加紧 迫”的国际形势下，中共高层认识到释放普通民众文化创造力的重要性，文化的供给不应局限于行政部门与文化事业单位，而应该通过创新与创造进一步解放<span style="text-decoration: underline;">文化生产力</span>，重视文化资源的深度发掘，使当前的文化市场产品更丰富、更具竞争力，这有利于中国文化“走出去”。公报突出对人力资源的重视，强调文化发展要“牢固树立人才是第一资源思想”，这与追求文化创新创造的思路相互印证，相互推进。\r\n\r\n陈少峰注意到，与以往相比，公报关于文化领域相关理念的表述更准确，指向更明确。如提出“社会主义核心价值体系是兴国之魂，是社会主义先进文化的精髓。”相 关概念虽不是第一次出现，但表达更准确。又如公报提出“要构建现代文化产业体系，形成公有制为主体、多种所有制共同发展的文化产业格局”，这意味着今后的<span style="text-decoration: underline;">文化产业发展</span>将更加重视市场和企业发挥作用，机制更加灵活。(完)\r\n\r\n&nbsp;', '专家解读六中全会公报关键词 重视文化创新创造', '', 'inherit', 'open', 'open', '', '63-revision-3', '', '', '2011-10-27 01:47:30', '2011-10-27 01:47:30', '', 63, 'http://blog.kuhkuh.com/?p=87', 0, 'revision', '', 0),
(65, 1, '2011-10-26 07:28:13', '2011-10-26 07:28:13', '中新社北京10月18日电 题：<a href="http://culture.people.com.cn/h/2011/1018/c226948-1166470413.html?navigation=1">专家解读六中全会公报关键词 前所未有重视<span style="text-decoration: underline;">文化创新</span>创造</a>\n\n中新社记者 张蔚然 周兆军\n\n中共十七届六中全会于2011年10月15日至18日在北京举行，全会审议通过了《中共中央关于深化<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E4%BD%93%E5%88%B6%E6%94%B9%E9%9D%A9">文化体制改革</a></span>、推动社会主义文化大发展大繁荣若干重大问题的决定》。此间专家分析，这是指导中国文化改革发展，开创中国特色社会文化建设新局面，建设社会主义文化强国的纲领性文件，提出建设文化强国长远战略是公报最大亮点，同时字里行间体现出对文化创新创造的前所未有的重视。\n\n分析人士认为，这是继中共十六大明确提出“积极发展文化事业和文化产业”的战略决策，2005年底出台《中共中央、国务院关于深化文化体制改革的若干意见》，“十二五”规划纲要从加快推进公益性文化事业单位改革、深入推进经营性文化单位<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E8%BD%AC%E4%BC%81%E6%94%B9%E5%88%B6">转企改制</a></span>、加快推进文化管理体制改革等方面对文化体制改革作出全面部署以来，中共对文化体制改革所做的又一次国家层面重要战略部署，标志着中共对文化建设的认识达到了新的高度，高层在文化理论创新与实践方面正逐渐走向成熟。\n\n北京大学文化产业研究院副院长陈少峰表示，建设社会主义文化强国的相关表述是<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E5%85%AC%E6%8A%A5">公报</a></span>最 大亮点，将国家重大战略推向新的高度，并细化了部署。三十多年来，中国通过改革开放实现了经济飞速发展，综合国力显著提高，但文化发展现状与经济社会发 展、中国国际影响力却不相称，全会做出的部署意味着中国强化了文化在国际竞争中重要性的自我意识，理清了以经济强国推动成为文化强国、经济与文化发展并重 的思路。\n\n中国文联原副主席仲呈祥认为，从公报内容分析，文化对社会政治经济提供思想支撑的重要性越来越突出。建设社会主义文化强国有赖于全面提升民族素质、塑造高尚人格，就文艺创作来讲，不应过度追求经济效益，而应创造更多反映真善美的文艺作品。\n\n公报对文化创造、文化创新的强调非常突出，文化创造有关表述在文中出现7次，包括不断以思想文化新觉醒、理论创造新成果、文化建设新成就推动党和人民事业向 前发展，文化越来越成为民族凝聚力和创造力的重要源泉，不断开创全民族文化创造活力持续迸发的新局面，要发挥人民群众文化创造积极性，在全社会营造鼓励文 化创造的良好氛围，让蕴藏于人民中的文化创造活力得到充分发挥，在坚持和发展中国特色社会主义的伟大实践中进行文化创造等。\n\n有关文化创新的表述在公报中出现5次，包括推进文化科技创新，文化是最需要创新的领域，<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E5%88%9B%E6%96%B0%E6%96%87%E5%8C%96">创新文化</a></span>走出去模式，创新文化管理体制，加快培养造就德才兼备、锐意创新、结构合理、规模宏大的文化人才队伍等。\n\n陈少峰分析，公报对文化创新与创造前所未有的重视，说明在“文化在综合国力竞争中的地位和作用更加凸显，增强国家文化软实力、中华文化国际影响力要求更加紧 迫”的国际形势下，中共高层认识到释放普通民众文化创造力的重要性，文化的供给不应局限于行政部门与文化事业单位，而应该通过创新与创造进一步解放<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E7%94%9F%E4%BA%A7%E5%8A%9B">文化生产力</a></span>，重视文化资源的深度发掘，使当前的文化市场产品更丰富、更具竞争力，这有利于中国文化“走出去”。公报突出对人力资源的重视，强调文化发展要“牢固树立人才是第一资源思想”，这与追求文化创新创造的思路相互印证，相互推进。\n\n陈少峰注意到，与以往相比，公报关于文化领域相关理念的表述更准确，指向更明确。如提出“社会主义核心价值体系是兴国之魂，是社会主义先进文化的精髓。”相 关概念虽不是第一次出现，但表达更准确。又如公报提出“要构建现代文化产业体系，形成公有制为主体、多种所有制共同发展的文化产业格局”，这意味着今后的<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%8F%91%E5%B1%95">文化产业发展</a></span>将更加重视市场和企业发挥作用，机制更加灵活。(完)\n\n&nbsp;', '专家解读六中全会公报关键词 重视文化创新创造', '', 'inherit', 'open', 'open', '', '63-autosave', '', '', '2011-10-26 07:28:13', '2011-10-26 07:28:13', '', 63, 'http://blogchen.gotoip1.com/?p=65', 0, 'revision', '', 0),
(66, 1, '2011-10-26 07:37:31', '2011-10-26 07:37:31', '由国内文化产业著名专家陈少峰、张立波著的《文化产业商业模式》一书近日由北京大学出版社出版，该书作为北京大学文化产业的基础教材，是北京大学十多年来致力于推动发展中国文化产业产学研结合的集大成之作。\r\n\r\n从政府管理模式到园区建设模式，从城市文化产业发展模式到文化走出去模式，从文化产品开发模式到文化品牌塑造模式，从企业核心竞争力到产业变动的趋势与商机，从文化产业通盘分析到各个细分行业的具体商业模式，《文化产业商业模式》一书都给予了深入系统的回答。\r\n\r\n该书以研究文化如何驱动经济和产业发展为基础，以探讨文化产业商业模式为核心，着重分析了文化及文化市场的特性、产品特性、顾客特点、塑造文化品牌的方法，以及企业家在经营管理中如何选择和改进商业模式等内容。特别是作者总结和提炼了60种文化产业领域内通用的商业模式，系统地提出了文化产业主要行业领域的发展趋势及商业模式选择问题，是国内文化产业理论创新的重大成果。\r\n\r\n在国家大力推动发展文化产业的宏观背景下，文化产业如何发展？有无路径可寻？有何经验借鉴？企业商业模式如何设计与执行？等等问题，是众多有志于从事文化产业的人士遇到的普遍难题。\r\n\r\n众所周知，文化产业涵盖范围之广、跨学科研究难度之大，没有深厚系统的理论基础和广泛的实践基础，是很容易纸上谈兵的。而国内文化产业现有著作多见于文化及文化产业一般意义上的概论、概说，甚至有些著作并无系统清晰的文化产业本质把握，更谈不上理论创新。\r\n\r\n作为国内文化产业发展的推动者陈少峰、张立波教授根据多年文化产业研究及企业经营管理咨询经验的基础之上，创新文化及文化产业理论，结合文化产业实践案例，对中国文化产业商业模式做了通盘的梳理，该书可以说是国内首屈一指的文化产业精品教材。同时，两位专家多年来也长期致力于跨学科研究，对于哲学、工商管理、文化及文化产业均有重大研究成果，这也是两位专家及其著作得以接地气的基础。\r\n\r\n《文化产业商业模式》一书是续陈少峰《文化产业读本》之后，文化产业又一代表著作，是了解国内文化产业特性及如何运作文化产业的必备书籍。当然，读者可再结合《中国文化产业十年》（陈少峰、朱嘉著）一书，对当前中国文化产业发展进行横纵系统把握，可以预期其文化产业理论水平的质变飞跃。\r\n\r\n<strong>\r\n</strong>', '《文化产业商业模式》书评--朱嘉', '', 'publish', 'open', 'open', '', '%e3%80%8a%e6%96%87%e5%8c%96%e4%ba%a7%e4%b8%9a%e5%95%86%e4%b8%9a%e6%a8%a1%e5%bc%8f%e3%80%8b%e4%b9%a6%e8%af%84-%e6%9c%b1%e5%98%89', '', '', '2011-10-26 07:38:44', '2011-10-26 07:38:44', '', 0, 'http://blogchen.gotoip1.com/?p=66', 0, 'post', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(67, 1, '2011-10-26 07:37:15', '2011-10-26 07:37:15', '由国内文化产业著名专家陈少峰、张立波著的《文化产业商业模式》一书近日由北京大学出版社出版，该书作为北京大学文化产业的基础教材，是北京大学十多年来致力于推动发展中国文化产业产学研结合的集大成之作。\n\n从政府管理模式到园区建设模式，从城市文化产业发展模式到文化走出去模式，从文化产品开发模式到文化品牌塑造模式，从企业核心竞争力到产业变动的趋势与商机，从文化产业通盘分析到各个细分行业的具体商业模式，《文化产业商业模式》一书都给予了深入系统的回答。\n\n该书以研究文化如何驱动经济和产业发展为基础，以探讨文化产业商业模式为核心，着重分析了文化及文化市场的特性、产品特性、顾客特点、塑造文化品牌的方法，以及企业家在经营管理中如何选择和改进商业模式等内容。特别是作者总结和提炼了60种文化产业领域内通用的商业模式，系统地提出了文化产业主要行业领域的发展趋势及商业模式选择问题，是国内文化产业理论创新的重大成果。\n\n在国家大力推动发展文化产业的宏观背景下，文化产业如何发展？有无路径可寻？有何经验借鉴？企业商业模式如何设计与执行？等等问题，是众多有志于从事文化产业的人士遇到的普遍难题。\n\n众所周知，文化产业涵盖范围之广、跨学科研究难度之大，没有深厚系统的理论基础和广泛的实践基础，是很容易纸上谈兵的。而国内文化产业现有著作多见于文化及文化产业一般意义上的概论、概说，甚至有些著作并无系统清晰的文化产业本质把握，更谈不上理论创新。\n\n作为国内文化产业发展的推动者陈少峰、张立波教授根据多年文化产业研究及企业经营管理咨询经验的基础之上，创新文化及文化产业理论，结合文化产业实践案例，对中国文化产业商业模式做了通盘的梳理，该书可以说是国内首屈一指的文化产业精品教材。同时，两位专家多年来也长期致力于跨学科研究，对于哲学、工商管理、文化及文化产业均有重大研究成果，这也是两位专家及其著作得以接地气的基础。\n\n《文化产业商业模式》一书是续陈少峰《文化产业读本》之后，文化产业又一代表著作，是了解国内文化产业特性及如何运作文化产业的必备书籍。当然，读者可再结合《中国文化产业十年》（陈少峰、朱嘉著）一书，对当前中国文化产业发展进行横纵系统把握，可以预期其文化产业理论水平的质变飞跃。\n\n<strong>\n</strong>', '《文化产业商业模式》书评--朱嘉', '', 'inherit', 'open', 'open', '', '66-revision', '', '', '2011-10-26 07:37:15', '2011-10-26 07:37:15', '', 66, 'http://blogchen.gotoip1.com/?p=67', 0, 'revision', '', 0),
(68, 1, '2011-10-26 07:37:31', '2011-10-26 07:37:31', '由国内文化产业著名专家陈少峰、张立波著的《文化产业商业模式》一书近日由北京大学出版社出版，该书作为北京大学文化产业的基础教材，是北京大学十多年来致力于推动发展中国文化产业产学研结合的集大成之作。\r\n\r\n从政府管理模式到园区建设模式，从城市文化产业发展模式到文化走出去模式，从文化产品开发模式到文化品牌塑造模式，从企业核心竞争力到产业变动的趋势与商机，从文化产业通盘分析到各个细分行业的具体商业模式，《文化产业商业模式》一书都给予了深入系统的回答。\r\n\r\n该书以研究文化如何驱动经济和产业发展为基础，以探讨文化产业商业模式为核心，着重分析了文化及文化市场的特性、产品特性、顾客特点、塑造文化品牌的方法，以及企业家在经营管理中如何选择和改进商业模式等内容。特别是作者总结和提炼了60种文化产业领域内通用的商业模式，系统地提出了文化产业主要行业领域的发展趋势及商业模式选择问题，是国内文化产业理论创新的重大成果。\r\n\r\n在国家大力推动发展文化产业的宏观背景下，文化产业如何发展？有无路径可寻？有何经验借鉴？企业商业模式如何设计与执行？等等问题，是众多有志于从事文化产业的人士遇到的普遍难题。\r\n\r\n众所周知，文化产业涵盖范围之广、跨学科研究难度之大，没有深厚系统的理论基础和广泛的实践基础，是很容易纸上谈兵的。而国内文化产业现有著作多见于文化及文化产业一般意义上的概论、概说，甚至有些著作并无系统清晰的文化产业本质把握，更谈不上理论创新。\r\n\r\n作为国内文化产业发展的推动者陈少峰、张立波教授根据多年文化产业研究及企业经营管理咨询经验的基础之上，创新文化及文化产业理论，结合文化产业实践案例，对中国文化产业商业模式做了通盘的梳理，该书可以说是国内首屈一指的文化产业精品教材。同时，两位专家多年来也长期致力于跨学科研究，对于哲学、工商管理、文化及文化产业均有重大研究成果，这也是两位专家及其著作得以接地气的基础。\r\n\r\n《文化产业商业模式》一书是续陈少峰《文化产业读本》之后，文化产业又一代表著作，是了解国内文化产业特性及如何运作文化产业的必备书籍。当然，读者可再结合《中国文化产业十年》（陈少峰、朱嘉著）一书，对当前中国文化产业发展进行横纵系统把握，可以预期其文化产业理论水平的质变飞跃。\r\n\r\n<strong>\r\n</strong>', '《文化产业商业模式》书评--朱嘉', '', 'inherit', 'open', 'open', '', '66-revision-2', '', '', '2011-10-26 07:37:31', '2011-10-26 07:37:31', '', 66, 'http://blogchen.gotoip1.com/?p=68', 0, 'revision', '', 0),
(69, 1, '2011-10-26 07:37:54', '2011-10-26 07:37:54', '由国内文化产业著名专家陈少峰、张立波著的《文化产业商业模式》一书近日由北京大学出版社出版，该书作为北京大学文化产业的基础教材，是北京大学十多年来致力于推动发展中国文化产业产学研结合的集大成之作。\r\n\r\n从政府管理模式到园区建设模式，从城市文化产业发展模式到文化走出去模式，从文化产品开发模式到文化品牌塑造模式，从企业核心竞争力到产业变动的趋势与商机，从文化产业通盘分析到各个细分行业的具体商业模式，《文化产业商业模式》一书都给予了深入系统的回答。\r\n\r\n该书以研究文化如何驱动经济和产业发展为基础，以探讨文化产业商业模式为核心，着重分析了文化及文化市场的特性、产品特性、顾客特点、塑造文化品牌的方法，以及企业家在经营管理中如何选择和改进商业模式等内容。特别是作者总结和提炼了60种文化产业领域内通用的商业模式，系统地提出了文化产业主要行业领域的发展趋势及商业模式选择问题，是国内文化产业理论创新的重大成果。\r\n\r\n在国家大力推动发展文化产业的宏观背景下，文化产业如何发展？有无路径可寻？有何经验借鉴？企业商业模式如何设计与执行？等等问题，是众多有志于从事文化产业的人士遇到的普遍难题。\r\n\r\n众所周知，文化产业涵盖范围之广、跨学科研究难度之大，没有深厚系统的理论基础和广泛的实践基础，是很容易纸上谈兵的。而国内文化产业现有著作多见于文化及文化产业一般意义上的概论、概说，甚至有些著作并无系统清晰的文化产业本质把握，更谈不上理论创新。\r\n\r\n作为国内文化产业发展的推动者陈少峰、张立波教授根据多年文化产业研究及企业经营管理咨询经验的基础之上，创新文化及文化产业理论，结合文化产业实践案例，对中国文化产业商业模式做了通盘的梳理，该书可以说是国内首屈一指的文化产业精品教材。同时，两位专家多年来也长期致力于跨学科研究，对于哲学、工商管理、文化及文化产业均有重大研究成果，这也是两位专家及其著作得以接地气的基础。\r\n\r\n《文化产业商业模式》一书是续陈少峰《文化产业读本》之后，文化产业又一代表著作，是了解国内文化产业特性及如何运作文化产业的必备书籍。当然，读者可再结合《中国文化产业十年》（陈少峰、朱嘉著）一书，对当前中国文化产业发展进行横纵系统把握，可以预期其文化产业理论水平的质变飞跃。\r\n\r\n<strong>\r\n</strong>', '《文化产业商业模式》书评--朱嘉', '', 'inherit', 'open', 'open', '', '66-revision-3', '', '', '2011-10-26 07:37:54', '2011-10-26 07:37:54', '', 66, 'http://blogchen.gotoip1.com/?p=69', 0, 'revision', '', 0),
(70, 1, '2011-10-26 07:42:49', '2011-10-26 07:42:49', '<strong><a href="http://blogchen.gotoip1.com/wp-content/uploads/2011/10/clip_image002.jpg"><img class="size-full wp-image-71 aligncenter" title="clip_image002" src="http://blogchen.gotoip1.com/wp-content/uploads/2011/10/clip_image002.jpg" alt="" width="185" height="250" /></a></strong>\r\n\r\n<strong>书讯</strong>：在中央即将召开文化体制改革会议之际，由北京大学文化产业研究院副院长陈少峰教授与张立波博士合著的《文化产业 商业模式》已由北京大学出版社出版， 该书是研究文化企业、文化产业前沿问题与商业模式领域的代表性专著，也是作者在该领域最前沿的理论与实践成果的总结。尤其书中对60种商业模式和各个文化 产业行业商业模式的分析与提炼，令人耳目一新。', '《文化产业商业模式》书讯', '', 'publish', 'open', 'open', '', '%e3%80%8a%e6%96%87%e5%8c%96%e4%ba%a7%e4%b8%9a%e5%95%86%e4%b8%9a%e6%a8%a1%e5%bc%8f%e3%80%8b%e4%b9%a6%e8%ae%af', '', '', '2011-10-26 07:42:49', '2011-10-26 07:42:49', '', 0, 'http://blogchen.gotoip1.com/?p=70', 0, 'post', '', 0),
(71, 1, '2011-10-26 07:41:50', '2011-10-26 07:41:50', '', 'clip_image002', '', 'inherit', 'open', 'open', '', 'clip_image002', '', '', '2011-10-26 07:41:50', '2011-10-26 07:41:50', '', 70, 'http://blogchen.gotoip1.com/wp-content/uploads/2011/10/clip_image002.jpg', 0, 'attachment', 'image/jpeg', 0),
(72, 1, '2011-10-26 07:42:42', '2011-10-26 07:42:42', '<strong><a href="http://blogchen.gotoip1.com/wp-content/uploads/2011/10/clip_image002.jpg"><img class="size-full wp-image-71 aligncenter" title="clip_image002" src="http://blogchen.gotoip1.com/wp-content/uploads/2011/10/clip_image002.jpg" alt="" width="185" height="250" /></a></strong>\n\n<strong>书讯</strong>：在中央即将召开文化体制改革会议之际，由北京大学文化产业研究院副院长陈少峰教授与张立波博士合著的《文化产业 商业模式》已由北京大学出版社出版， 该书是研究文化企业、文化产业前沿问题与商业模式领域的代表性专著，也是作者在该领域最前沿的理论与实践成果的总结。尤其书中对60种商业模式和各个文化 产业行业商业模式的分析与提炼，令人耳目一新。', '《文化产业商业模式》书讯', '', 'inherit', 'open', 'open', '', '70-revision', '', '', '2011-10-26 07:42:42', '2011-10-26 07:42:42', '', 70, 'http://blogchen.gotoip1.com/?p=72', 0, 'revision', '', 0),
(73, 1, '2011-10-26 07:43:52', '2011-10-26 07:43:52', '<strong><a href="http://blogchen.gotoip1.com/wp-content/uploads/2011/10/clip_image002.jpg"><img class="size-full wp-image-71 aligncenter" title="clip_image002" src="http://blogchen.gotoip1.com/wp-content/uploads/2011/10/clip_image002.jpg" alt="" width="185" height="250" /></a></strong>\n\n<strong>书讯</strong>：在中央即将召开文化体制改革会议之际，由北京大学文化产业研究院副院长陈少峰教授与张立波博士合著的《文化产业 商业模式》已由北京大学出版社出版， 该书是研究文化企业、文化产业前沿问题与商业模式领域的代表性专著，也是作者在该领域最前沿的理论与实践成果的总结。尤其书中对60种商业模式和各个文化 产业行业商业模式的分析与提炼，令人耳目一新。', '《文化产业商业模式》书讯', '', 'inherit', 'open', 'open', '', '70-autosave', '', '', '2011-10-26 07:43:52', '2011-10-26 07:43:52', '', 70, 'http://blogchen.gotoip1.com/?p=73', 0, 'revision', '', 0),
(74, 1, '2011-10-26 07:46:47', '2011-10-26 07:46:47', '<p style="text-align: right;" align="center">——读《文化产业商业模式》  陈晓燕</p>\r\n<p align="center">（北京大学哲学系2009级博士生）</p>\r\n2010年10月，中共十七届五中全会通过的《中共中央关于制定国民经济和社会发展第十二个五年规划的建议》明确提出，要“推动文化产业成为国民经济支柱性产业”，这意味着我国文化产业的发展将进入一个全速发展的新阶段。打造一个文化产业强国无疑是我国今后十年甚至更长时间内的首要任务。而成为文化产业强国需要我国在文化产业的发展方面有着切实可行的发展模式和战略思考。而一个国家只有在文化上的成熟，才能保证其经济潜能的持续开发和附加价值的持续提升。\r\n\r\n《文化产业商业模式》一书是陈少峰教授继《文化产业战略与商业模式》、《文化产业读本》等专著之后的又一本应时之作。作者站在一个十分前沿的视角针对文化产业的可持续发展提出了文化企业应按自身的特性和需求提炼出合适本企业发展的商业模式的观点。书中将商业模式定义为营利性机构在经营管理中所采取的一种具体的交易结构和盈利方法，该方法是保障企业经营管理合乎可持续发展要求的重要标志。[1]进一步，通过对于文化企业盈利方法的规律和成功经验及失败教训的总结，促使文化企业经营管理者和策划人士意识到并且将商业直觉和盈利方法有效结合起来，从而能够按照策划和规划的目标实现企业整体价值的最大化和整体价值的可持续提升。文中共提出60种适合不同文化企业发展的具体商业模式，并佐以国内外知名企业的经典案例加以分析，资料充分，数据翔实，有助于读者对阅读本书的理解。\r\n\r\n<strong>商业模式的创新</strong><strong></strong>\r\n\r\n对于文化产业而言，商业模式是决定其发展战略成败的核心要素。切实可行的商业模式是企业核心竞争力的主要源泉，这意味着文化产业发展的好坏与商业模式的选择有着密切的关系。在文化产业发展中，对于商业模式的发现、选择、改进和优化是其成败的关键。商业模式的重要性不言而喻。\r\n\r\n这些年来，我国的文化产业所取得的成果有目共睹，在接下来的规划中，便需要我们从数量的增加和质量的提升两方面来重视其发展，从而保证文化产业发展的可持续性。而就一个文化企业而言，其所要进行的项目越大，则难度也越大，因此，如何确立一个可行的商业模式便是其不可或缺的选择。只有在正确的商业模式指导下，细节才能决定成败。而作为以参与性和体验下为主的新兴产业，创新是文化产业的灵魂。因此，在找到适合自身发展的商业模式的基础上，文化企业还应时时保持其商业模式的创新。文化产业商业模式创新有两种形式，第一种在于创业伊始选择一种新的创业形态；第二种即对于既有模式的微调。\r\n\r\n显然，此书对于商业模式的创新也有着密切的关注，这是因为文化企业的商业模式创新是一个企业的生命力所在，即使是成熟可行的商业模式，也必须思考如何自我淘汰、自我否定、自我更新。[2]而好的商业模式，不仅要代表当下，更要具有前瞻性和引领性。作为文化产业的翘楚，苹果公司的市值超过3800亿美元，相当于奥地利、南非、阿根廷等国的GDP(国内生产总值)，这无疑与其顺应时代要求而时时做出新变化商业模式有着密不可分的关系。以其iphone为例，从2007年第一代iphone上市以来，苹果公司以平均每年一代的速度进行着更新，今年十月，苹果公司又在美国推出iphone4S，各国的“果粉”们（苹果手机爱好者）亦纷纷在网上进行订购。这意味着一款成功的文化产品，不仅能够顺应时代要求，更要引领时尚的潮流。\r\n\r\n<strong>发展战略与商业模式</strong><strong></strong>\r\n\r\n首先，发展战略的目标选择。书中多次提到，商业模式必须是可持续发展的，这意味着在战略目标选择上不仅要考虑到经济指标，而且必须包含战略定位、产业结构调整、品牌建设等相对抽象的目标，同时，须对这些目标进行清晰的描述和界定，以保障战略指导的有效性。此外，不同城市由于资源和文化形态方面的差异，其文化产业发展模式也需因地制宜，既充分利用自身资源，又能体现地方特色。\r\n\r\n其次，内容的价值选择。文化产业又被人们称为内容产业，这意味着内容在文化产业中的重要性。好的内容不仅意味着能够给企业带来盈利，更意味着其是积极向上的，与主流价值相一致的。在推动文化产业发展的过程中，我们所预期的社会效益和经济效益是同步的，从某种意义上来讲，经济效益是文化产业发展好坏的一个核心标志。但是文化产业的内容发展的底线在于要符合社会核心价值，任何文化产品都不能与社会核心价值相违背甚至产生抵触。如好莱坞的大片，其主题永远是与和平、正义、亲情、爱情、友情等元素相关。其电影情节扣人心弦，宣传主题亦积极向上，无怪乎好莱坞的电影产业始终引领者国际电影市场的发展。\r\n\r\n再次，文化产业的资源选择。实现文化产业强国的目标不可或缺的一部分在于文化产品的出口，这更要求文化企业能够有着放眼世界的眼光来制造出具有普适性的文化产品，而不应固步自封，死守着“文化底蕴深厚”六个字做文章。用陈少峰教授的话而言，即“文化底蕴深厚的地方不一定适合开发文化产业。”文化产业在很多国家和地区被称为文化创意产业，这意味着创意在文化产业中的重要性。因此，依托历史文化资源打造文化产业向依托人力资源创造价值的转变不可逆转。这其中包括人才储备、素质提升和政府投入的转型。这里的人才不仅仅指打造文化产品的人才，还包括具有商业能力的人才。书中直接指出，改变重视文化艺术而轻视产业经营的观念或意识是解决经营管理人才培养问题的基本环节。[3]\r\n\r\n本书的写作不仅极大地缓解了当前国内文化产业管理的理论发展和实践经验匮乏与文化产业经济迅猛发展对理论和实践的需求之间的矛盾，更是我国在实现以高度的文化自觉文化自信来推动文化改革发展，构建文化产业强国的锦上添花之作。\r\n<div><br clear="all" />\r\n\r\n<hr align="left" size="1" width="33%" />\r\n\r\n<div>\r\n\r\n[1] 陈少峰，张立波《文化产业商业模式》，第四页。北京：北京大学出版社2011版\r\n\r\n</div>\r\n<div>\r\n\r\n[2]陈少峰，张立波《文化产业商业模式》，第一百六十九页。北京：北京大学出版社2011版\r\n\r\n[3]陈少峰，张立波《文化产业商业模式》，第四页。北京：北京大学出版社2011版\r\n\r\n</div>\r\n<div>\r\n\r\n&nbsp;\r\n\r\n</div>\r\n</div>', '文化产业强国的战略思考', '', 'publish', 'open', 'open', '', '%e6%96%87%e5%8c%96%e4%ba%a7%e4%b8%9a%e5%bc%ba%e5%9b%bd%e7%9a%84%e6%88%98%e7%95%a5%e6%80%9d%e8%80%83', '', '', '2011-10-27 01:46:29', '2011-10-27 01:46:29', '', 0, 'http://blogchen.gotoip1.com/?p=74', 0, 'post', '', 0),
(75, 1, '2011-10-26 07:46:13', '2011-10-26 07:46:13', '<p style="text-align: right;" align="center">——读《文化产业商业模式》  陈晓燕</p>\n<p align="center">（北京大学哲学系2009级博士生）</p>\n2010年10月，中共十七届五中全会通过的《中共中央关于制定国民经济和社会发展第十二个五年规划的建议》明确提出，要“推动文化产业成为国民经济支柱性产业”，这意味着我国文化产业的发展将进入一个全速发展的新阶段。打造一个文化产业强国无疑是我国今后十年甚至更长时间内的首要任务。而成为文化产业强国需要我国在文化产业的发展方面有着切实可行的发展模式和战略思考。而一个国家只有在文化上的成熟，才能保证其经济潜能的持续开发和附加价值的持续提升。\n\n《文化产业商业模式》一书是陈少峰教授继《文化产业战略与商业模式》、《文化产业读本》等专著之后的又一本应时之作。作者站在一个十分前沿的视角针对文化产业的可持续发展提出了文化企业应按自身的特性和需求提炼出合适本企业发展的商业模式的观点。书中将商业模式定义为营利性机构在经营管理中所采取的一种具体的交易结构和盈利方法，该方法是保障企业经营管理合乎可持续发展要求的重要标志。<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftn1">[1]</a>进一步，通过对于文化企业盈利方法的规律和成功经验及失败教训的总结，促使文化企业经营管理者和策划人士意识到并且将商业直觉和盈利方法有效结合起来，从而能够按照策划和规划的目标实现企业整体价值的最大化和整体价值的可持续提升。文中共提出60种适合不同文化企业发展的具体商业模式，并佐以国内外知名企业的经典案例加以分析，资料充分，数据翔实，有助于读者对阅读本书的理解。\n\n<strong>商业模式的创新</strong><strong></strong>\n\n对于文化产业而言，商业模式是决定其发展战略成败的核心要素。切实可行的商业模式是企业核心竞争力的主要源泉，这意味着文化产业发展的好坏与商业模式的选择有着密切的关系。在文化产业发展中，对于商业模式的发现、选择、改进和优化是其成败的关键。商业模式的重要性不言而喻。\n\n这些年来，我国的文化产业所取得的成果有目共睹，在接下来的规划中，便需要我们从数量的增加和质量的提升两方面来重视其发展，从而保证文化产业发展的可持续性。而就一个文化企业而言，其所要进行的项目越大，则难度也越大，因此，如何确立一个可行的商业模式便是其不可或缺的选择。只有在正确的商业模式指导下，细节才能决定成败。而作为以参与性和体验下为主的新兴产业，创新是文化产业的灵魂。因此，在找到适合自身发展的商业模式的基础上，文化企业还应时时保持其商业模式的创新。文化产业商业模式创新有两种形式，第一种在于创业伊始选择一种新的创业形态；第二种即对于既有模式的微调。\n\n显然，此书对于商业模式的创新也有着密切的关注，这是因为文化企业的商业模式创新是一个企业的生命力所在，即使是成熟可行的商业模式，也必须思考如何自我淘汰、自我否定、自我更新。<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftn2">[2]</a>而好的商业模式，不仅要代表当下，更要具有前瞻性和引领性。作为文化产业的翘楚，苹果公司的市值超过3800亿美元，相当于奥地利、南非、阿根廷等国的GDP(国内生产总值)，这无疑与其顺应时代要求而时时做出新变化商业模式有着密不可分的关系。以其iphone为例，从2007年第一代iphone上市以来，苹果公司以平均每年一代的速度进行着更新，今年十月，苹果公司又在美国推出iphone4S，各国的“果粉”们（苹果手机爱好者）亦纷纷在网上进行订购。这意味着一款成功的文化产品，不仅能够顺应时代要求，更要引领时尚的潮流。\n\n<strong>发展战略与商业模式</strong><strong></strong>\n\n首先，发展战略的目标选择。书中多次提到，商业模式必须是可持续发展的，这意味着在战略目标选择上不仅要考虑到经济指标，而且必须包含战略定位、产业结构调整、品牌建设等相对抽象的目标，同时，须对这些目标进行清晰的描述和界定，以保障战略指导的有效性。此外，不同城市由于资源和文化形态方面的差异，其文化产业发展模式也需因地制宜，既充分利用自身资源，又能体现地方特色。\n\n其次，内容的价值选择。文化产业又被人们称为内容产业，这意味着内容在文化产业中的重要性。好的内容不仅意味着能够给企业带来盈利，更意味着其是积极向上的，与主流价值相一致的。在推动文化产业发展的过程中，我们所预期的社会效益和经济效益是同步的，从某种意义上来讲，经济效益是文化产业发展好坏的一个核心标志。但是文化产业的内容发展的底线在于要符合社会核心价值，任何文化产品都不能与社会核心价值相违背甚至产生抵触。如好莱坞的大片，其主题永远是与和平、正义、亲情、爱情、友情等元素相关。其电影情节扣人心弦，宣传主题亦积极向上，无怪乎好莱坞的电影产业始终引领者国际电影市场的发展。\n\n再次，文化产业的资源选择。实现文化产业强国的目标不可或缺的一部分在于文化产品的出口，这更要求文化企业能够有着放眼世界的眼光来制造出具有普适性的文化产品，而不应固步自封，死守着“文化底蕴深厚”六个字做文章。用陈少峰教授的话而言，即“文化底蕴深厚的地方不一定适合开发文化产业。”文化产业在很多国家和地区被称为文化创意产业，这意味着创意在文化产业中的重要性。因此，依托历史文化资源打造文化产业向依托人力资源创造价值的转变不可逆转。这其中包括人才储备、素质提升和政府投入的转型。这里的人才不仅仅指打造文化产品的人才，还包括具有商业能力的人才。书中直接指出，改变重视文化艺术而轻视产业经营的观念或意识是解决经营管理人才培养问题的基本环节。<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftn3">[3]</a>\n\n本书的写作不仅极大地缓解了当前国内文化产业管理的理论发展和实践经验匮乏与文化产业经济迅猛发展对理论和实践的需求之间的矛盾，更是我国在实现以高度的文化自觉文化自信来推动文化改革发展，构建文化产业强国的锦上添花之作。\n<div><br clear="all" />\n\n<hr align="left" size="1" width="33%" />\n\n<div>\n\n<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftnref1">[1]</a> 陈少峰，张立波《文化产业商业模式》，第四页。北京：北京大学出版社2011版\n\n</div>\n<div>\n\n<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftnref2">[2]</a>陈少峰，张立波《文化产业商业模式》，第一百六十九页。北京：北京大学出版社2011版\n\n&nbsp;\n\n</div>\n<div>\n\n<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftnref3">[3]</a>陈少峰，张立波《文化产业商业模式》，第四页。北京：北京大学出版社2011版\n\n&nbsp;\n\n</div>\n</div>', '文化产业强国的战略思考', '', 'inherit', 'open', 'open', '', '74-revision', '', '', '2011-10-26 07:46:13', '2011-10-26 07:46:13', '', 74, 'http://blogchen.gotoip1.com/?p=75', 0, 'revision', '', 0),
(86, 1, '2011-10-26 07:27:09', '2011-10-26 07:27:09', '中新社北京10月18日电 题：<a href="http://culture.people.com.cn/h/2011/1018/c226948-1166470413.html?navigation=1">专家解读六中全会公报关键词 前所未有重视<span style="text-decoration: underline;">文化创新</span>创造</a>\r\n\r\n中新社记者 张蔚然 周兆军\r\n\r\n中共十七届六中全会于2011年10月15日至18日在北京举行，全会审议通过了《中共中央关于深化<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E4%BD%93%E5%88%B6%E6%94%B9%E9%9D%A9">文化体制改革</a></span>、推动社会主义文化大发展大繁荣若干重大问题的决定》。此间专家分析，这是指导中国文化改革发展，开创中国特色社会文化建设新局面，建设社会主义文化强国的纲领性文件，提出建设文化强国长远战略是公报最大亮点，同时字里行间体现出对文化创新创造的前所未有的重视。\r\n\r\n分析人士认为，这是继中共十六大明确提出“积极发展文化事业和文化产业”的战略决策，2005年底出台《中共中央、国务院关于深化文化体制改革的若干意见》，“十二五”规划纲要从加快推进公益性文化事业单位改革、深入推进经营性文化单位<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E8%BD%AC%E4%BC%81%E6%94%B9%E5%88%B6">转企改制</a></span>、加快推进文化管理体制改革等方面对文化体制改革作出全面部署以来，中共对文化体制改革所做的又一次国家层面重要战略部署，标志着中共对文化建设的认识达到了新的高度，高层在文化理论创新与实践方面正逐渐走向成熟。\r\n\r\n北京大学文化产业研究院副院长陈少峰表示，建设社会主义文化强国的相关表述是<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E5%85%AC%E6%8A%A5">公报</a></span>最 大亮点，将国家重大战略推向新的高度，并细化了部署。三十多年来，中国通过改革开放实现了经济飞速发展，综合国力显著提高，但文化发展现状与经济社会发 展、中国国际影响力却不相称，全会做出的部署意味着中国强化了文化在国际竞争中重要性的自我意识，理清了以经济强国推动成为文化强国、经济与文化发展并重 的思路。\r\n\r\n中国文联原副主席仲呈祥认为，从公报内容分析，文化对社会政治经济提供思想支撑的重要性越来越突出。建设社会主义文化强国有赖于全面提升民族素质、塑造高尚人格，就文艺创作来讲，不应过度追求经济效益，而应创造更多反映真善美的文艺作品。\r\n\r\n公报对文化创造、文化创新的强调非常突出，文化创造有关表述在文中出现7次，包括不断以思想文化新觉醒、理论创造新成果、文化建设新成就推动党和人民事业向 前发展，文化越来越成为民族凝聚力和创造力的重要源泉，不断开创全民族文化创造活力持续迸发的新局面，要发挥人民群众文化创造积极性，在全社会营造鼓励文 化创造的良好氛围，让蕴藏于人民中的文化创造活力得到充分发挥，在坚持和发展中国特色社会主义的伟大实践中进行文化创造等。\r\n\r\n有关文化创新的表述在公报中出现5次，包括推进文化科技创新，文化是最需要创新的领域，<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E5%88%9B%E6%96%B0%E6%96%87%E5%8C%96">创新文化</a></span>走出去模式，创新文化管理体制，加快培养造就德才兼备、锐意创新、结构合理、规模宏大的文化人才队伍等。\r\n\r\n陈少峰分析，公报对文化创新与创造前所未有的重视，说明在“文化在综合国力竞争中的地位和作用更加凸显，增强国家文化软实力、中华文化国际影响力要求更加紧 迫”的国际形势下，中共高层认识到释放普通民众文化创造力的重要性，文化的供给不应局限于行政部门与文化事业单位，而应该通过创新与创造进一步解放<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E7%94%9F%E4%BA%A7%E5%8A%9B">文化生产力</a></span>，重视文化资源的深度发掘，使当前的文化市场产品更丰富、更具竞争力，这有利于中国文化“走出去”。公报突出对人力资源的重视，强调文化发展要“牢固树立人才是第一资源思想”，这与追求文化创新创造的思路相互印证，相互推进。\r\n\r\n陈少峰注意到，与以往相比，公报关于文化领域相关理念的表述更准确，指向更明确。如提出“社会主义核心价值体系是兴国之魂，是社会主义先进文化的精髓。”相 关概念虽不是第一次出现，但表达更准确。又如公报提出“要构建现代文化产业体系，形成公有制为主体、多种所有制共同发展的文化产业格局”，这意味着今后的<span style="text-decoration: underline;"><a href="http://search.people.com.cn/rmw/GB/rmwsearch/gj_search_lj.jsp?keyword=%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%8F%91%E5%B1%95">文化产业发展</a></span>将更加重视市场和企业发挥作用，机制更加灵活。(完)\r\n\r\n&nbsp;', '专家解读六中全会公报关键词 重视文化创新创造', '', 'inherit', 'open', 'open', '', '63-revision-2', '', '', '2011-10-26 07:27:09', '2011-10-26 07:27:09', '', 63, 'http://blog.kuhkuh.com/?p=86', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(76, 1, '2011-10-26 07:48:51', '2011-10-26 07:48:51', '<p style="text-align: right;"><strong>——读《文化产业商业模式》</strong></p>\r\n<p style="text-align: right;">                                 夏宝君</p>\r\n在文化产业研究领域，向来存在两种偏向，一种侧重“文化”二字，深挖文化产业中的文化意蕴，内容涉及文化政策、文化体制、文化消费、文化“软实力”、文化产业“走出去”战略等研究，这些研究倾向于宏观文化研究，将文化产业与文明发展、社会进步的历程挂钩；另一种则侧重“产业”二字，将文化产业置于大产业环境中，彰显其经济属性，其中包括文化市场、文化产业竞争力、文化产业区域发展、文化产业集群、文化产业结构、文化企业管理、文化产业可持续发展等等，这些研究则倾向于具体的产业发展策略，在经济发展的视域讨论文化产业这一经济现象。\r\n\r\n陈少峰先生的《文化产业商业模式》显然属于后一种研究偏向。\r\n\r\n本书以研究文化对经济和产业发展的驱动作用为基础，以文化企业为研究参照，以文化产业的商业模式为核心内容，着重分析了文化市场和文化产品的特性，并在大量的文化产业案例中抽离出60种通用商业模式，且系统分析了文化产业主要行业的商业模式选择问题，为文化产业的经营管理提供了全面和深入的策略建议，这在文化产业的研究中，尚属首次。\r\n\r\n&nbsp;\r\n\r\n<strong> </strong><strong>文化产业的商业气质</strong>\r\n\r\n&nbsp;\r\n\r\n早在19世纪，马克思在《1844年经济学——哲学手稿》中就指出：“宗教、家庭、国家、法、道德、科学、艺术等等，都不过是生产的一些特殊的方式，并且受生产的普遍规律的支配。”[1]在《德意志意识形态》一书中，马克思和恩格斯又将一般生产区分为“物质生产”和“精神生产”两大领域。文化产业作为生产的一种特殊形态，是一种精神生产。文化产品不仅具有一般产品的基本属性，而且具有自身的特殊属性。\r\n\r\n文化产品是一种特殊的商品形态，它具有双重属性，即商品属性和意识形态性。2003年6月，中央召开文化体制改革试点工作会议，会议明确提出，既要注重文化产品的意识形态属性，又要注重文化产品的产业属性。而实际上，我国的文化产品往往强调其意识形态属性，这种意识形态属性又过多地表现于社会教化功能，即通过文化政策、文化产业发展实现对社会的精神引导功能，对文化产业的经济属性，我们仍旧处于转变观念、推行改革的转型期。\r\n\r\n《文化产业商业模式》中明确提出从文化创意的经济价值角度研究文化产业的经营管理，这一立足点就意味着本书将打破以往对文化产业的商业属性遮遮掩掩、半推半就的研究境况，转而将文化产业推大胆、彻底地推上经济领域和市场范畴。\r\n\r\n这种大胆之举并非作者的主观臆想，而是其对文化与经济、文化产业和产品与市场的互动进行深入、透彻的研究之后所做的理论升华。在很长一段时间内，我们仅仅把文化作为经济发展的附属品，文化往往只承担其精神价值和意识形态引导功能，这种状况导致“文化失去了应有的经济价值和精神价值的双重地位”[2]。书中提出，在文化产业快速发展和成熟的时期，其实文化本身就可以“唱好戏”，文化也可以为经济搭建更大的舞台。因为目前的商品竞争已然充斥了更多文化因素的成分，文化内涵和品位的提升能带来更大的附加价值和经济效益，因此，文化和经济之间的互动关系日益紧密且微妙。\r\n\r\n文化产业自出现之始即有商业特质，只是这一特质被人为地包裹和埋没，当商品市场不再是以纯粹的经济价值取胜，转向高附加价值的较量，这种商业特质开始逐步溶解，并融入市场竞争的主体环节。\r\n\r\n当然，正如书中所说，从经济学的角度研究文化产业，并非忽视文化的价值，而是要“利用文化元素来发挥其作为精神产品和提升物质产品价值的作用”。由于文化经济中的价值实现具有特殊性，而这种特殊性比其他产业更多地依赖于文化形态、意识形态的制约，以及产品和服务的创新，因此，文化产业的经营管理，已经不仅是单纯意义上的企业、行业经营管理，而是在一定文化环境、文化政策、文化形态制约下的管理行为。\r\n\r\n&nbsp;\r\n\r\n<strong>作为市场主体的自我认知</strong>\r\n\r\n<strong>    </strong>\r\n\r\n严格来讲，在过去的很长时间，我们的文化产业起主体作用的是“文化事业”，文化政策侧重文化事业的发展，文化事业占有主要的文化资金和资源，这种占有是具有垄断性的，文化事业单位的管理也偏于行政化，并非纯粹的市场行为。\r\n\r\n当市场经济的大潮涌向文化产业，行政化严重的文化事业大多走向改制之路。许多传统的文化行业如出版业、艺术产业、演艺行业等逐渐放开一些窗口睁眼看市场，而这些小窗口并未阻止文化产业喷薄而出的市场热情，这种热情点燃了整个文化市场，不论是新闻出版、广播影视还是互联网、旅游休闲、娱乐产业，抑或是博物馆、公共文化服务机构，都纷纷呈现出挣脱旧有体制的热望和作为市场主体的独立性。\r\n\r\n把文化产业真正推向市场，对文化产业和文化企业来说，是引燃了长久以来的市场探寻之期待，文化产业作为市场主体，必将剥离条块分割的资源切割状态和限制多于鼓励的管理体制，或大或小、或强或弱的文化企业一起涌入海阔天空的文化市场。虽然力量不均，但在这一市场上，不同文化企业所具有的争取市场主体地位的权利是平等的——这可以看作它们对于自己角色的觉醒。\r\n\r\n作为市场主体的自我认知不仅包括自我角色认知，还包括自我使命的认知。\r\n\r\n1995年，台湾文化建设委员会提出了“文化产业化、产业文化化”之构想，并于此后贯彻这一构想，于2002年正式将文化创意产业列入《挑战2008：台湾发展重点计划》中的一项，旨在结合人文与经济产业创造高附加价值的效益，以增加就业人数并提升民众生活水平。\r\n\r\n本书中，作者再次提出了文化产业发展的双重路向，即文化产业化（文化经济）和产业文化化，并进而指出，文化产业化仅仅是包含某些部分的文化产业化，而不是全面的文化产业化，而产业文化话几乎是全方位的。这就意味着，未来我们的经济发展和企业发展，可以借力文化产业，在经济领域实现产业文化化。\r\n\r\n实现产业文化化，首要的是意识到文化产业发展中的文化因素起着至关重要的作用，这不仅包括文化市场、文化产品与技术创新、文化产品销售渠道、文化产品传播平台等一系列环节，还包括文化企业和文化产品的品牌、可持续发展等战略。从起始点到终端，文化产业发展的各个环节都离不开文化所创造的价值。\r\n\r\n作者多次提到，“合理的企业经营理念是促进企业价值得以实现，即企业的整体价值最大化”[3]。整理价值最大化意味着做企业不是看当下，看某个项目是否赚钱，而是看企业的长线发展，看企业的整体资源所带来的整体价值，这种整体价值更多来源于企业创造的无形价值。文化企业的价值在很大程度上体现于其无形资产，如人力资源、文化因素等，在追求整体价值的过程中，也应当充分考虑人力资源、产品创新、文化附加价值的提升等策略，用文化的力量实现文化企业的可持续发展。\r\n\r\n因此，正如书中所说，文化产业具有双重价值：一方面，文化产业自身的发展是经济活动的重要组成部分，另一方面，文化产业通过与其他产业之间的关联互动，可以推动其他产业的发展。\r\n\r\n文化产业的自我认知，其实是对文化市场日益规范化的侧面反映，同时也是文化产业自行定位、自谋发展的开始——为了即将到来的文化苦旅，当然，也许一路欢歌。\r\n\r\n&nbsp;\r\n\r\n<strong>商业模式与价值创造</strong>\r\n\r\n&nbsp;\r\n\r\n彼得·德鲁克说过，21世纪企业之间的竞争已经不是产品与价格的竞争，甚至不是服务之间的竞争，而是“商业模式”之间的竞争。今天，中国的企业除了技术进步所带来的成本下降之外，劳动力、土地、环境保护、知识产权、外围技术研发等成本都一路攀升，在经济转型升级的关头，商业模式的重要性凸显。\r\n\r\n在其后的论证中，作者重点阐述了文化产业商业模式的类型，分别阐明文化产业的内容、产品、品牌以及产业链与商业模式的关系，并从大量的案例中抽离出60种通用的商业模式。事实上，本书所有的铺垫，包括对文化产业特性的解读、对文化与经济互动关系的阐释以及对企业经营管理理念的传达，都是为了让读者对文化产业的商业模式做一个基础知识的补充，在此基础上探讨文化产业的商业模式，才不至于一头雾水和感觉突兀。\r\n\r\n按照作者的观点，商业模式简单讲就是盈利模式，商业模式在广义上涵盖了“将企业的核心竞争力即内在性优势和外部性优势转化为盈利方法的要素”。谈到商业模式，不能不谈到实现商业模式的群体。过去，我们常常认为，从事文化产业的都是所谓的“文化人”，当文化与经济、与市场、与商业并未如此水乳交融的时候，我们姑且将文化产业置于真正的企业竞争之外。而如今，文化产业再也不是“文化人”自娱自乐的游戏，而是生灭关乎市场的实体。于是，艺术家、企业家、投资家纷纷涉足其中，在这些群体中，应尽量避免权责不清，还应各取优势，可以共同参与文化企业的经营管理，但说到底，文化企业还是企业，首先要遵从市场规律和企业经营管理规律，明确了这一点，不同群体的责任分工也了然于心。\r\n\r\n无疑，企业的核心竞争力是实现盈利模式的源泉，核心竞争力分为内部优势和外部优势，这些优势经由商业模式来体现。同样的，具有竞争力的商业模式应当可以促进企业整体价值的提升。而这种整体价值的汇总包括了很多环节。\r\n\r\n文化产业俗称“内容产业”，内容在整个产业链中的地位可见一斑。内容的创新实际上就是一种象征体系的创新，“一类是讲故事，一类是活动，一类是形象性的知识产权，一类是附载在明星身上的品牌魅力”[4]。不管是哪种内容创新，都是为了抓住一闪而过的创意点子，并将这个点子实施，创意的好坏，只能通过市场去检验。\r\n\r\n创意落实到实体上，就是文化产品。在这个层面，我们必须牢牢记住文化产品的双重属性，既要承担文化产品的文化教化功能，又要保证文化产业的经济效益。书中指出，文化产品需要双重的产品质量标准，即作为商品形态的一般质量标准和作为精神文化属性的最低标准。当然，不论为了满足哪个属性，其受众都是文化产品的消费者，如何围绕消费者的需求、消费观念、生活方式和消费习惯的变动来寻求创新，是文化产品的立足点。\r\n\r\n好的产品和理念不一定能带来真正的企业价值，实现这一转换的重要环节就是品牌的传播。既然作为商品，文化产品就难逃品牌管理的影响力。目前，我们的许多文化产品在核心技术、创意、质量等方面已经达到先进水平，但迟迟难以跻身文化产业高端市场的重要原因就是对品牌管理的缺失和品牌传播不力。品牌本身就是商业模式中最具附加价值的部分，加之文化产业中的无形因素比重较大，这种无形资产的力量是其他产业不可比拟的，更应该为文化产业所用，助力文化产业的可持续发展。\r\n\r\n至此，作者终于引出商业模式的基本类型，书中将其分为六大组，共60种类型。六大组分别是行业化的商业模式、基础型的商业模式、内在能力型的商业模式、提升型的商业模式、资源整合型的商业模和与资本运作结合的商业模式。作者通过大量的案例分析，试图为读者展开一幅商业模式的巨大画卷，在这画卷中，有成熟坚韧的理论枝桠，也有鲜活灵动的案例论证。不仅如此，书中还针对主要的文化产业如文化旅游、演艺产业、体育产业、数字内容产业、动漫产业、全媒体产业等进行了分级阐述，将行业发展的一般规律进行梳理，给出了一个多维立体的商业模式发展模型。\r\n<p style="text-align: left;">由此，文化产业发展的商业模式终于有迹可循。诚然，我们敬佩作者在理论和实践之间的孜孜以求，我们更期待这些商业模式真正为我国的文化产业带来更多的文化价值和商业价值，甚至在这个轨道上，更多更好的商业模式被开发、验证和载入史册。</p>\r\n\r\n<div><br clear="all" />\r\n\r\n<hr align="left" size="1" width="33%" />\r\n\r\n<div>\r\n\r\n[1] 马克思：《1844年经济学——哲学手稿》，第78页。\r\n\r\n</div>\r\n<div>\r\n\r\n[2] 陈少峰、张立波：《文化产业商业模式》，第4页。\r\n\r\n</div>\r\n<div>\r\n\r\n[3] 陈少峰、张立波：《文化产业商业模式》，第53页。\r\n\r\n</div>\r\n<div>\r\n\r\n[4] 陈少峰、张立波：《文化产业商业模式》，第106页。\r\n\r\n</div>\r\n</div>', '作为市场主体的自我调适', '', 'publish', 'open', 'open', '', '%e4%bd%9c%e4%b8%ba%e5%b8%82%e5%9c%ba%e4%b8%bb%e4%bd%93%e7%9a%84%e8%87%aa%e6%88%91%e8%b0%83%e9%80%82', '', '', '2011-10-27 01:45:13', '2011-10-27 01:45:13', '', 0, 'http://blogchen.gotoip1.com/?p=76', 0, 'post', '', 0),
(77, 1, '2011-10-26 07:47:56', '2011-10-26 07:47:56', '', '作为市场主体的自我调适', '', 'inherit', 'open', 'open', '', '76-revision', '', '', '2011-10-26 07:47:56', '2011-10-26 07:47:56', '', 76, 'http://blogchen.gotoip1.com/?p=77', 0, 'revision', '', 0),
(85, 1, '2011-10-26 07:46:47', '2011-10-26 07:46:47', '<p style="text-align: right;" align="center">——读《文化产业商业模式》  陈晓燕</p>\r\n<p align="center">（北京大学哲学系2009级博士生）</p>\r\n2010年10月，中共十七届五中全会通过的《中共中央关于制定国民经济和社会发展第十二个五年规划的建议》明确提出，要“推动文化产业成为国民经济支柱性产业”，这意味着我国文化产业的发展将进入一个全速发展的新阶段。打造一个文化产业强国无疑是我国今后十年甚至更长时间内的首要任务。而成为文化产业强国需要我国在文化产业的发展方面有着切实可行的发展模式和战略思考。而一个国家只有在文化上的成熟，才能保证其经济潜能的持续开发和附加价值的持续提升。\r\n\r\n《文化产业商业模式》一书是陈少峰教授继《文化产业战略与商业模式》、《文化产业读本》等专著之后的又一本应时之作。作者站在一个十分前沿的视角针对文化产业的可持续发展提出了文化企业应按自身的特性和需求提炼出合适本企业发展的商业模式的观点。书中将商业模式定义为营利性机构在经营管理中所采取的一种具体的交易结构和盈利方法，该方法是保障企业经营管理合乎可持续发展要求的重要标志。<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftn1">[1]</a>进一步，通过对于文化企业盈利方法的规律和成功经验及失败教训的总结，促使文化企业经营管理者和策划人士意识到并且将商业直觉和盈利方法有效结合起来，从而能够按照策划和规划的目标实现企业整体价值的最大化和整体价值的可持续提升。文中共提出60种适合不同文化企业发展的具体商业模式，并佐以国内外知名企业的经典案例加以分析，资料充分，数据翔实，有助于读者对阅读本书的理解。\r\n\r\n<strong>商业模式的创新</strong><strong></strong>\r\n\r\n对于文化产业而言，商业模式是决定其发展战略成败的核心要素。切实可行的商业模式是企业核心竞争力的主要源泉，这意味着文化产业发展的好坏与商业模式的选择有着密切的关系。在文化产业发展中，对于商业模式的发现、选择、改进和优化是其成败的关键。商业模式的重要性不言而喻。\r\n\r\n这些年来，我国的文化产业所取得的成果有目共睹，在接下来的规划中，便需要我们从数量的增加和质量的提升两方面来重视其发展，从而保证文化产业发展的可持续性。而就一个文化企业而言，其所要进行的项目越大，则难度也越大，因此，如何确立一个可行的商业模式便是其不可或缺的选择。只有在正确的商业模式指导下，细节才能决定成败。而作为以参与性和体验下为主的新兴产业，创新是文化产业的灵魂。因此，在找到适合自身发展的商业模式的基础上，文化企业还应时时保持其商业模式的创新。文化产业商业模式创新有两种形式，第一种在于创业伊始选择一种新的创业形态；第二种即对于既有模式的微调。\r\n\r\n显然，此书对于商业模式的创新也有着密切的关注，这是因为文化企业的商业模式创新是一个企业的生命力所在，即使是成熟可行的商业模式，也必须思考如何自我淘汰、自我否定、自我更新。<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftn2">[2]</a>而好的商业模式，不仅要代表当下，更要具有前瞻性和引领性。作为文化产业的翘楚，苹果公司的市值超过3800亿美元，相当于奥地利、南非、阿根廷等国的GDP(国内生产总值)，这无疑与其顺应时代要求而时时做出新变化商业模式有着密不可分的关系。以其iphone为例，从2007年第一代iphone上市以来，苹果公司以平均每年一代的速度进行着更新，今年十月，苹果公司又在美国推出iphone4S，各国的“果粉”们（苹果手机爱好者）亦纷纷在网上进行订购。这意味着一款成功的文化产品，不仅能够顺应时代要求，更要引领时尚的潮流。\r\n\r\n<strong>发展战略与商业模式</strong><strong></strong>\r\n\r\n首先，发展战略的目标选择。书中多次提到，商业模式必须是可持续发展的，这意味着在战略目标选择上不仅要考虑到经济指标，而且必须包含战略定位、产业结构调整、品牌建设等相对抽象的目标，同时，须对这些目标进行清晰的描述和界定，以保障战略指导的有效性。此外，不同城市由于资源和文化形态方面的差异，其文化产业发展模式也需因地制宜，既充分利用自身资源，又能体现地方特色。\r\n\r\n其次，内容的价值选择。文化产业又被人们称为内容产业，这意味着内容在文化产业中的重要性。好的内容不仅意味着能够给企业带来盈利，更意味着其是积极向上的，与主流价值相一致的。在推动文化产业发展的过程中，我们所预期的社会效益和经济效益是同步的，从某种意义上来讲，经济效益是文化产业发展好坏的一个核心标志。但是文化产业的内容发展的底线在于要符合社会核心价值，任何文化产品都不能与社会核心价值相违背甚至产生抵触。如好莱坞的大片，其主题永远是与和平、正义、亲情、爱情、友情等元素相关。其电影情节扣人心弦，宣传主题亦积极向上，无怪乎好莱坞的电影产业始终引领者国际电影市场的发展。\r\n\r\n再次，文化产业的资源选择。实现文化产业强国的目标不可或缺的一部分在于文化产品的出口，这更要求文化企业能够有着放眼世界的眼光来制造出具有普适性的文化产品，而不应固步自封，死守着“文化底蕴深厚”六个字做文章。用陈少峰教授的话而言，即“文化底蕴深厚的地方不一定适合开发文化产业。”文化产业在很多国家和地区被称为文化创意产业，这意味着创意在文化产业中的重要性。因此，依托历史文化资源打造文化产业向依托人力资源创造价值的转变不可逆转。这其中包括人才储备、素质提升和政府投入的转型。这里的人才不仅仅指打造文化产品的人才，还包括具有商业能力的人才。书中直接指出，改变重视文化艺术而轻视产业经营的观念或意识是解决经营管理人才培养问题的基本环节。<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftn3">[3]</a>\r\n\r\n本书的写作不仅极大地缓解了当前国内文化产业管理的理论发展和实践经验匮乏与文化产业经济迅猛发展对理论和实践的需求之间的矛盾，更是我国在实现以高度的文化自觉文化自信来推动文化改革发展，构建文化产业强国的锦上添花之作。\r\n<div><br clear="all" />\r\n\r\n<hr align="left" size="1" width="33%" />\r\n\r\n<div>\r\n\r\n<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftnref1">[1]</a> 陈少峰，张立波《文化产业商业模式》，第四页。北京：北京大学出版社2011版\r\n\r\n</div>\r\n<div>\r\n\r\n<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftnref2">[2]</a>陈少峰，张立波《文化产业商业模式》，第一百六十九页。北京：北京大学出版社2011版\r\n\r\n<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E6%96%87%E5%8C%96%E4%BA%A7%E4%B8%9A%E5%BC%BA%E5%9B%BD%E7%9A%84%E6%88%98%E7%95%A5%E6%80%9D%E8%80%83.doc#_ftnref3">[3]</a>陈少峰，张立波《文化产业商业模式》，第四页。北京：北京大学出版社2011版\r\n\r\n</div>\r\n<div>\r\n\r\n&nbsp;\r\n\r\n</div>\r\n</div>', '文化产业强国的战略思考', '', 'inherit', 'open', 'open', '', '74-revision-2', '', '', '2011-10-26 07:46:47', '2011-10-26 07:46:47', '', 74, 'http://blog.kuhkuh.com/?p=85', 0, 'revision', '', 0),
(78, 1, '2011-10-26 08:11:40', '2011-10-26 08:11:40', '我们知道现在中国陷入了诚信危机, 用什么样的例子来描述比较恰当呢?就用送礼这个例子。据说有一对年轻人在举行婚礼的时候, 有很多人去送礼, 很多都是送现金, 于是他们就在前台设了一个验钞机, 验证是否有假钞。也就是说现在连送礼都已经开始验钞了, 这就是目前中国信用危机最典型的一个象征。\r\n\r\n另一个故事是上个世纪 80 年代的一个小说, 像一首歌里唱的叫作千年等一回。那时候发生了很多故事, 其中有一个故事讲的是丈夫在文革中被打成右派关在狱中。他的妻子每年都等着他, 并且每年为他做了一双鞋子。三十年后, 等到丈夫回家的时候, 发现床下整整齐齐放着30双新鞋。这也是诚信的一个很动人的故事。\r\n\r\n当然, 要保持诚信, 需要付出代价。最近有一个故事是说有一个女同志, 她妹妹生了重病, 而她却没钱给妹妹看病,于是她就公开向社会说, 如果谁能借给她两万块钱, 她就嫁给谁, 当然是指男士。结果就有一位男士借给她两万块钱。两年过去了, 好消息和坏消息都来了。好消息是她妹妹的病情有明显的好转, 坏消息就是那位男子开始催她结婚了。在这种情况下, 这位女同志该怎么办? 当然, 这位男士还是比较通情达理的, 说要么你和我结婚, 要么你把钱还给我。对于这位女子来说, 要是结婚的话, 这位男子是一个陌生人, 颇为踌躇, 要是还钱的话, 她又没钱。这是现实生活中一个未完成的故事。\r\n\r\n古代讲诚信的时候, 一开始诚和信是分开谈的。诚表示一种更根本的东西,信表示对人的一种态度。关于诚, 在《中庸》当中就有“诚者, 天之道”, 天之道就是诚; 人之道, 当然也是诚, 叫做“诚之者, 人之道”。所以说, 诚是更本质的东西。信就是我们讲的“与朋友交言而有信”, 或者说“人无信不立”。诚与信的关系就是前者决定后者, 只有诚, 才会有信, 所以我们今天讲的就是诚而有信。传统的伦理学中的诚信与我们今天的信用是有比较大的区别。\r\n\r\n传统的诚信就是表示一种自律的道德, 而今天的信用表示的是一种利益的关系。比如说信用贷款, 这其实就是一种利益关系; 而只有这种利益建立在自律的基础上, 它才会真正自主地去完成。这就是传统的一般的解释。传统的诚信其实是一个完整的体系, 我们称它言行一致。它要求表现在动机上和态度上要有诚, 表现在行为上叫做有信, 表现在语言上就是反对各种巧言佞色和虚伪的东西,甚至通过你的眼睛就可以看出你是不是有诚信。另外与人交往还要经过长期的检验, 也就是“言行一致, 长期考核”。一个人是否有信, 要经过很长的时间才能看出来。\r\n\r\n在传统文化中, 讲诚信的有儒家和法家。我们知道, 儒家和法家在价值观上有很大的区别。法家主张依法治国, 儒家主张以德治国。但是他们在信的方面上都是一样的。有人问孔子, 要是你来治国的话,你会怎么做。孔子说“:要足食, 足兵, 民信之矣。”就是说首先要让老百姓有温饱, 其次要富国强兵, 再其次就要让老百姓信任你。这是从治国的程序上来说的。于是又有人问孔子, 假如让你从这三项中选择一个, 你会选哪一个。孔子说“:我选信。因为民无信不立。”而法家认为, 要富国强兵,首先要立信。法家关于立信的每一个故事都是非常绝对的。为了做到立信, 它不惜一切代价, 因为法家认识到, 如果没有信的话, 其他的东西根本就无法执行。这就是儒家与法家的一个共同之处。我们讲的诚信总结起来就有这样一个内容, 诚实和忠诚。\r\n\r\n诚信是一种信用机制, 诚信在道德上的一个很高的要求是一种自律的道德, 但是在现实社会上它就转变为一种信用机制, 所以我们的社会就是靠人与人之间的信用建立起来的。当我们坐公共汽车的时候, 我们相信这个司机会很认真地开车;我们去看医生的时候, 我们相信医生会尽职尽责为我们看病。所以说人与人之间很多的无形的东西就是通过信用建立起来的,我们不会为此担心。当我们要建立某种关系的时候, 我们也不会把它定为一种文字上的契约。但事实上, 这个信用是存在的。所以我们可以在一般的意义上去信任某一个人。但是, 现在的问题是, 人与人之间的信用已经不可靠了, 人与人之间牢固的纽带已经松了。我们要为这种不守信用付出代价, 那么这个代价是什么呢?是所有人的代价。在任何情况下, 都可能会出现道德风险和道德风险的转嫁。什么样的道德风险呢?就是你的行为在道德上不可靠, 这就是道德风险。而道德风险的最大的一个特点就是, 风险是会转嫁的。就是说当事者他不承担道德责任, 而是把道德责任转嫁给别人。在 1997 年亚洲金融危机的时候“道德风险”这个词使用的频率非常高, 韩国人整天把它挂在嘴上。因为当时韩国很多大的财团向国外贷款, 结果经营得不好,最后留给国家一个烂摊子。结果韩国变成了国际货币基金组织监督的一个对象。道德风险的一个最大的问题就是在你所委托的关系当中出现了一个风险, 而这个风险应该是由当事人承担责任的, 但是他承担不了这个责任, 或是他的道德水平太低, 或者是他存心把道德风险转嫁给其他的人。所以说道德风险是信用危机中最大的一个风险, 而道德风险是无处不在的。这就是我们讲的一种道德风险。举一个例子。有一位国外的老板, 到中国一个企业里面, 发现有几个员工整天叽叽喳喳地花好多时间去谈什么事情。他很奇怪, 就派翻译去问他们在讲什么。那个翻译去了两个小时, 回来后告诉老板一句话: 没什么。也就是说在这其中信用一层一层地损耗, 最后就消失了。这是我们讲的一种信用风险。另外一种风险是什么呢?是隐瞒与欺诈的风险。就是说, 因为没有信用, 所以你不了解真实的情况, 不了解真实的情况你就要付出更大的代价。\r\n\r\n比如说现在我们去医院的时候, 在一些医院, 无论大病小病, 医生看都不看就让你做 CT, 让你尽可能地花钱, 而且不让\r\n你知道, 这些钱该不该花。医生只是告诉你, 你有这种那种病的可能, 然后给你开一大堆的药。当然更糟糕的是, 医生不为你认真地诊断。出来了, 什么也没有。所以说, 你在得不到正确的信息的情况下, 你必须付出更大的代价。\r\n\r\n从经济角度来讲, 人与他人的伙伴关系之间既是竞争也是合作的关系, 但是只有良性的竞争才会有合作, 而要长期进行下去, 无论是竞争还是合作, 就必须守信用。比如说我们与顾客之间的关系。在码头上或是车站附近的店里面, 其产品与其\r\n他地方相比一般要不可靠一些。因为人员是流动的, 他跟你之间的关系很有可能是一次性的买卖。但是如果你是在你家旁边的小店买东西, 这个店提供的产品的质量一定要比你在外面某个车站、码头的店里的商品要好。因为从长期的合作关系来讲, 只有建立一种诚信关系, 对买卖双方来说才是有利的。守信用从长期来讲是有利的, 从短期来讲, 可能是不利的。非常简单, 我通过骗你一次, 我马上就可以得到一个好处。但是你只能骗一次, 骗两次, 因为世界上很少有人被你骗了两次三次他还不觉悟。所以从经济学的角度看, 也就是从合作与利益的角度看, 要想取得长期的利益, 只有建立诚信。从信用与职业道德来看, 我们今天讲知识经济, 那么知识经济是什么呢? 我们在确定要给一位员工发多少工资时, 既要考虑员工的能力也要考虑员工的道德。总的来讲, 你工资的高低取决于你是不是可以替代的。你的不可替代性程度越高, 你的价值就越高, 那你获得的工资也就越高。假如你是谁都可以替代的话, 那么你肯定是工资很低的。所以扫地的人的工资一般很低, 因为人只要有手就会扫地。他的可替代性很大。知识经济的本质是人力资源, 而人力资源的本质就体现了人力资\r\n源的复杂性。因为越是有价值的人力资源, 就越不容易管理。我们判断一个人是不是有价值的人力资源, 不仅看他是不是\r\n有才, 还要看他是不是愿意在与你合作的过程中把他的才能贡献出来。\r\n\r\n比如说现在搞策划的人工资一般比较高。因为方案在他脑子里, 你不好管理它。他有可能在一个小时之中就把策划方案搞出来了, 但是他却告诉你三天之后他才能把方案想好。于是, 他就利用将近三天的时间去做他自己的事情。从中我们可以发现, 越是体现知识经济, 就越是需要人的能力, 尤其是自主发挥的能力。所以知识经济要建立在职业化的基础上, 就是说, 在这段时间内, 只有他坦诚地为你服务, 他的贡献才和他的这种能力相符。他可以在一小时之内策划出一个方案, 但是如果他不动脑筋, 他三天也想不出一个方案来, 而你却拿他没有一点办法。所以,“知识经济”实际上是有偏颇的说法。人力资源的发挥并不仅仅靠才智, 而是要靠我们日常说的德才兼备。当然这种德不是要你大公无私, 而是要你比较职业化, 要值得信任, 能够坦诚自主地发挥你的才智,这个时候才是真正形成了知识经济的基础。所以说, 市场经济是需要诚信的。\r\n\r\n从人力资源的角度上来讲, 中国人是聪明还是笨? 中国人一开始的时候很聪明, 后来就比较笨。所以有一句格言说: 当你做事情的时候, 你不要问是怎么开始的, 而要问会怎样结束, 这是最重要的。如果不能保障一个好的结果的话, 你就是笨\r\n的。人力资源上讲的管理上的最高境界是无为而治, 怎么才能无为而治? 就是要让员工职业化, 并且有团队合作精神。企业的管理要平衡长期和短期的利益, 所以说什么是小聪明呢? 就是只顾短期的小利益; 什么是智慧呢? 就是有累积地实现你的目标的方法, 有正确的价值观, 这才是智慧。你不能今天占了一个小便宜, 明天就跌了一跤。然后你爬起来又占了一个小便宜, 后天你又摔了一跤, 这样循环, 几天以后你还是一穷二白。所以智慧是一种累积性的聪明的聚合, 你每一个小聪明都能为明天的大的进步作出积累。我们把智慧拿来是要用来鉴别诚信, 而不是代替诚信。因为你被骗也是一种很麻烦的事情。最近又有一个故事, 一位母亲患了癌症, 心情非常沮丧。而她的小孩见妈妈晚上常常落泪, 以为妈妈得了重病, 心理很不踏实, 学习也就不上心, 因为他担心妈妈会出什么事。于是这位母亲就去找医生, 让医生帮她做一件事情, 就是做一个假的诊断并且告诉孩子, 自己没有病。第二天医生就开了一个会, 讨论决定开一个假的证明。孩子也参加了, 一见没什么事,也就放心了, 学习也就上去了。半年以后妈妈不幸去世了。作为医生, 当他诊断出病人患有绝症的时候, 他一定会想要不要告诉这个病人。作为患者当然有知情权,但是我们知道, 好多患有绝症的病人是被自己的病吓死的。有很多患者, 并不是因为他的病严重到很快就死亡的程度, 而是因为他们失去了斗志, 失去了生命的力量。所以在有些情况下, 要不要告诉病人真实的情况, 作为医生, 是有很大的斟酌的余地的。\r\n\r\n信用是一个社会的系统, 要由社会来管理。在一定要用信用来维护的地方, 就一定要用法律来维护, 要政府来管理。管理有两种方式, 激励与惩罚。我们知道前几年上市公司发生了一些虚假财务报表的危机。因为在股市上有一些发布假信息的人, 他们通过不诚实的手段获得了好处, 并且没有受到惩罚, 自然其他公司就要跟着学, 然后就滚雪球般地扩展开了。所以对不诚实的行为必须加以惩罚, 否则没有人会自觉地建立自己的信用。那么,怎样依靠激励与惩罚来进行管理呢?首先单位是要有责任的。比如说银行, 应该相互之间建立一种信用信息交流关系, 杜绝欺诈, 不向没有信用的企业和个人贷款;\r\n同时, 他们应该注意提醒信用消费的顾客信用期限和惩罚措施; 等等。\r\n\r\n总之, 无论是政府还是其他发生信用关系的机构, 必须坚决惩罚没有信用的行为。因果报应是一种迷信一点的说法, 但是, 它是我们中国传统文化中的一种根深蒂固的东西。什么样的因果报应呢? 就是做善事的时候有好报, 做恶事的时候有恶报。当然这是一种很传统的讲法, 没有科学根据。现在很多农村人还相信一个风俗, 就是坏人终究会被雷劈死的, 劈死也就是横死。横死就是做了坏事所遭到的恶报。一个故事说, 有一个村子里的坏人被雷劈死了, 大家就非常高兴, 说: 你看, 坏人终究要被雷劈死的。但是没过几天, 村里一位大家公认的好人也被雷劈死了, 这下又如何解释呢?村民又说了, 原来我们一直没有发现, 他才是一个包藏祸心的大恶人, 隐瞒我们这么久, 终于被雷劈死了。这个就是说在信用这个链条上, 有类似因果报应的东西, 只不过有时是道德风险的转嫁———他的报应(惩罚)是报到别人的身上去了, 这是一个与信用联系十分紧密的特点。就是某些人做了失信用的事,其他人是会遭到报应的。为什么现在人与人之间的信用都这么低, 为什么我们不敢去轻易相信别人?就是因为有人做了不讲信用的事。在助学贷款的事情上, 前面同学做的结果, 已经对我们需要贷款的后来的同学们造成了一定的不良影响。反过来讲, 我们现在正在申请贷款的同学, 是不是也要为未来的同学们承担一定的责任?特别是要考虑今后你会不会把这恶报传下去, 成为接力棒?我希望不要如此。其实中国那些贫穷的人能够走出恶性循环的唯一办法就是依靠外部的支援来改变现状。假如你把这个方法给扼杀了, 把恶报传下去了, 这些贫困的人就会陷于绝境!你已经感觉到了前面的人所带来的影响,那么你们就不要把这些不良影响一棒一棒地传下去。在信用的问题上, 因果报应是无穷延伸的, 首先它是社会的, 其次它是传递的, 再其次它是道德风险转嫁的一种不道德的结果。', '诚信与智慧', '', 'publish', 'open', 'open', '', '%e8%af%9a%e4%bf%a1%e4%b8%8e%e6%99%ba%e6%85%a7', '', '', '2011-10-26 08:11:40', '2011-10-26 08:11:40', '', 0, 'http://blogchen.gotoip1.com/?p=78', 0, 'post', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(79, 1, '2011-10-26 08:10:53', '2011-10-26 08:10:53', '我们知道现在中国陷入了诚信危机, 用什么样的例子来描述比较恰当呢?就用送礼这个例子。据说有一对年轻人在举行婚礼的时候, 有很多人去送礼, 很多都是送现金, 于是他们就在前台设了一个验钞机, 验证是否有假钞。也就是说现在连送礼都已经开始验钞了, 这就是目前中国信用危机最典型的一个象征。\n\n另一个故事是上个世纪 80 年代的一个小说, 像一首歌里唱的叫作千年等一回。那时候发生了很多故事, 其中有一个故事讲的是丈夫在文革中被打成右派关在狱中。他的妻子每年都等着他, 并且每年为他做了一双鞋子。三十年后, 等到丈夫回家的时候, 发现床下整整齐齐放着30双新鞋。这也是诚信的一个很动人的故事。\n\n当然, 要保持诚信, 需要付出代价。最近有一个故事是说有一个女同志, 她妹妹生了重病, 而她却没钱给妹妹看病,于是她就公开向社会说, 如果谁能借给她两万块钱, 她就嫁给谁, 当然是指男士。结果就有一位男士借给她两万块钱。两年过去了, 好消息和坏消息都来了。好消息是她妹妹的病情有明显的好转, 坏消息就是那位男子开始催她结婚了。在这种情况下, 这位女同志该怎么办? 当然, 这位男士还是比较通情达理的, 说要么你和我结婚, 要么你把钱还给我。对于这位女子来说, 要是结婚的话, 这位男子是一个陌生人, 颇为踌躇, 要是还钱的话, 她又没钱。这是现实生活中一个未完成的故事。\n\n古代讲诚信的时候, 一开始诚和信是分开谈的。诚表示一种更根本的东西,信表示对人的一种态度。关于诚, 在《中庸》当中就有“诚者, 天之道”, 天之道就是诚; 人之道, 当然也是诚, 叫做“诚之者, 人之道”。所以说, 诚是更本质的东西。信就是我们讲的“与朋友交言而有信”, 或者说“人无信不立”。诚与信的关系就是前者决定后者, 只有诚, 才会有信, 所以我们今天讲的就是诚而有信。传统的伦理学中的诚信与我们今天的信用是有比较大的区别。\n\n传统的诚信就是表示一种自律的道德, 而今天的信用表示的是一种利益的关系。比如说信用贷款, 这其实就是一种利益关系; 而只有这种利益建立在自律的基础上, 它才会真正自主地去完成。这就是传统的一般的解释。传统的诚信其实是一个完整的体系, 我们称它言行一致。它要求表现在动机上和态度上要有诚, 表现在行为上叫做有信, 表现在语言上就是反对各种巧言佞色和虚伪的东西,甚至通过你的眼睛就可以看出你是不是有诚信。另外与人交往还要经过长期的检验, 也就是“言行一致, 长期考核”。一个人是否有信, 要经过很长的时间才能看出来。\n\n在传统文化中, 讲诚信的有儒家和法家。我们知道, 儒家和法家在价值观上有很大的区别。法家主张依法治国, 儒家主张以德治国。但是他们在信的方面上都是一样的。有人问孔子, 要是你来治国的话,你会怎么做。孔子说“:要足食, 足兵, 民信之矣。”就是说首先要让老百姓有温饱, 其次要富国强兵, 再其次就要让老百姓信任你。这是从治国的程序上来说的。于是又有人问孔子, 假如让你从这三项中选择一个, 你会选哪一个。孔子说“:我选信。因为民无信不立。”而法家认为, 要富国强兵,首先要立信。法家关于立信的每一个故事都是非常绝对的。为了做到立信, 它不惜一切代价, 因为法家认识到, 如果没有信的话, 其他的东西根本就无法执行。这就是儒家与法家的一个共同之处。我们讲的诚信总结起来就有这样一个内容, 诚实和忠诚。\n\n诚信是一种信用机制, 诚信在道德上的一个很高的要求是一种自律的道德, 但是在现实社会上它就转变为一种信用机制, 所以我们的社会就是靠人与人之间的信用建立起来的。当我们坐公共汽车的时候, 我们相信这个司机会很认真地开车;我们去看医生的时候, 我们相信医生会尽职尽责为我们看病。所以说人与人之间很多的无形的东西就是通过信用建立起来的,我们不会为此担心。当我们要建立某种关系的时候, 我们也不会把它定为一种文字上的契约。但事实上, 这个信用是存在的。所以我们可以在一般的意义上去信任某一个人。但是, 现在的问题是, 人与人之间的信用已经不可靠了, 人与人之间牢固的纽带已经松了。我们要为这种不守信用付出代价, 那么这个代价是什么呢?是所有人的代价。在任何情况下, 都可能会出现道德风险和道德风险的转嫁。什么样的道德风险呢?就是你的行为在道德上不可靠, 这就是道德风险。而道德风险的最大的一个特点就是, 风险是会转嫁的。就是说当事者他不承担道德责任, 而是把道德责任转嫁给别人。在 1997 年亚洲金融危机的时候“道德风险”这个词使用的频率非常高, 韩国人整天把它挂在嘴上。因为当时韩国很多大的财团向国外贷款, 结果经营得不好,最后留给国家一个烂摊子。结果韩国变成了国际货币基金组织监督的一个对象。道德风险的一个最大的问题就是在你所委托的关系当中出现了一个风险, 而这个风险应该是由当事人承担责任的, 但是他承担不了这个责任, 或是他的道德水平太低, 或者是他存心把道德风险转嫁给其他的人。所以说道德风险是信用危机中最大的一个风险, 而道德风险是无处不在的。这就是我们讲的一种道德风险。举一个例子。有一位国外的老板, 到中国一个企业里面, 发现有几个员工整天叽叽喳喳地花好多时间去谈什么事情。他很奇怪, 就派翻译去问他们在讲什么。那个翻译去了两个小时, 回来后告诉老板一句话: 没什么。也就是说在这其中信用一层一层地损耗, 最后就消失了。这是我们讲的一种信用风险。另外一种风险是什么呢?是隐瞒与欺诈的风险。就是说, 因为没有信用, 所以你不了解真实的情况, 不了解真实的情况你就要付出更大的代价。\n\n比如说现在我们去医院的时候, 在一些医院, 无论大病小病, 医生看都不看就让你做 CT, 让你尽可能地花钱, 而且不让\n你知道, 这些钱该不该花。医生只是告诉你, 你有这种那种病的可能, 然后给你开一大堆的药。当然更糟糕的是, 医生不为你认真地诊断。出来了, 什么也没有。所以说, 你在得不到正确的信息的情况下, 你必须付出更大的代价。\n\n从经济角度来讲, 人与他人的伙伴关系之间既是竞争也是合作的关系, 但是只有良性的竞争才会有合作, 而要长期进行下去, 无论是竞争还是合作, 就必须守信用。比如说我们与顾客之间的关系。在码头上或是车站附近的店里面, 其产品与其\n他地方相比一般要不可靠一些。因为人员是流动的, 他跟你之间的关系很有可能是一次性的买卖。但是如果你是在你家旁边的小店买东西, 这个店提供的产品的质量一定要比你在外面某个车站、码头的店里的商品要好。因为从长期的合作关系来讲, 只有建立一种诚信关系, 对买卖双方来说才是有利的。守信用从长期来讲是有利的, 从短期来讲, 可能是不利的。非常简单, 我通过骗你一次, 我马上就可以得到一个好处。但是你只能骗一次, 骗两次, 因为世界上很少有人被你骗了两次三次他还不觉悟。所以从经济学的角度看, 也就是从合作与利益的角度看, 要想取得长期的利益, 只有建立诚信。从信用与职业道德来看, 我们今天讲知识经济, 那么知识经济是什么呢? 我们在确定要给一位员工发多少工资时, 既要考虑员工的能力也要考虑员工的道德。总的来讲, 你工资的高低取决于你是不是可以替代的。你的不可替代性程度越高, 你的价值就越高, 那你获得的工资也就越高。假如你是谁都可以替代的话, 那么你肯定是工资很低的。所以扫地的人的工资一般很低, 因为人只要有手就会扫地。他的可替代性很大。知识经济的本质是人力资源, 而人力资源的本质就体现了人力资\n源的复杂性。因为越是有价值的人力资源, 就越不容易管理。我们判断一个人是不是有价值的人力资源, 不仅看他是不是\n有才, 还要看他是不是愿意在与你合作的过程中把他的才能贡献出来。\n\n比如说现在搞策划的人工资一般比较高。因为方案在他脑子里, 你不好管理它。他有可能在一个小时之中就把策划方案搞出来了, 但是他却告诉你三天之后他才能把方案想好。于是, 他就利用将近三天的时间去做他自己的事情。从中我们可以发现, 越是体现知识经济, 就越是需要人的能力, 尤其是自主发挥的能力。所以知识经济要建立在职业化的基础上, 就是说, 在这段时间内, 只有他坦诚地为你服务, 他的贡献才和他的这种能力相符。他可以在一小时之内策划出一个方案, 但是如果他不动脑筋, 他三天也想不出一个方案来, 而你却拿他没有一点办法。所以,“知识经济”实际上是有偏颇的说法。人力资源的发挥并不仅仅靠才智, 而是要靠我们日常说的德才兼备。当然这种德不是要你大公无私, 而是要你比较职业化, 要值得信任, 能够坦诚自主地发挥你的才智,这个时候才是真正形成了知识经济的基础。所以说, 市场经济是需要诚信的。\n\n从人力资源的角度上来讲, 中国人是聪明还是笨? 中国人一开始的时候很聪明, 后来就比较笨。所以有一句格言说: 当你做事情的时候, 你不要问是怎么开始的, 而要问会怎样结束, 这是最重要的。如果不能保障一个好的结果的话, 你就是笨\n的。人力资源上讲的管理上的最高境界是无为而治, 怎么才能无为而治? 就是要让员工职业化, 并且有团队合作精神。企业的管理要平衡长期和短期的利益, 所以说什么是小聪明呢? 就是只顾短期的小利益; 什么是智慧呢? 就是有累积地实现你的目标的方法, 有正确的价值观, 这才是智慧。你不能今天占了一个小便宜, 明天就跌了一跤。然后你爬起来又占了一个小便宜, 后天你又摔了一跤, 这样循环, 几天以后你还是一穷二白。所以智慧是一种累积性的聪明的聚合, 你每一个小聪明都能为明天的大的进步作出积累。我们把智慧拿来是要用来鉴别诚信, 而不是代替诚信。因为你被骗也是一种很麻烦的事情。最近又有一个故事, 一位母亲患了癌症, 心情非常沮丧。而她的小孩见妈妈晚上常常落泪, 以为妈妈得了重病, 心理很不踏实, 学习也就不上心, 因为他担心妈妈会出什么事。于是这位母亲就去找医生, 让医生帮她做一件事情, 就是做一个假的诊断并且告诉孩子, 自己没有病。第二天医生就开了一个会, 讨论决定开一个假的证明。孩子也参加了, 一见没什么事,也就放心了, 学习也就上去了。半年以后妈妈不幸去世了。作为医生, 当他诊断出病人患有绝症的时候, 他一定会想要不要告诉这个病人。作为患者当然有知情权,但是我们知道, 好多患有绝症的病人是被自己的病吓死的。有很多患者, 并不是因为他的病严重到很快就死亡的程度, 而是因为他们失去了斗志, 失去了生命的力量。所以在有些情况下, 要不要告诉病人真实的情况, 作为医生, 是有很大的斟酌的余地的。\n\n信用是一个社会的系统, 要由社会来管理。在一定要用信用来维护的地方, 就一定要用法律来维护, 要政府来管理。管理有两种方式, 激励与惩罚。我们知道前几年上市公司发生了一些虚假财务报表的危机。因为在股市上有一些发布假信息的人, 他们通过不诚实的手段获得了好处, 并且没有受到惩罚, 自然其他公司就要跟着学, 然后就滚雪球般地扩展开了。所以对不诚实的行为必须加以惩罚, 否则没有人会自觉地建立自己的信用。那么,怎样依靠激励与惩罚来进行管理呢?首先单位是要有责任的。比如说银行, 应该相互之间建立一种信用信息交流关系, 杜绝欺诈, 不向没有信用的企业和个人贷款;\n同时, 他们应该注意提醒信用消费的顾客信用期限和惩罚措施; 等等。\n\n总之, 无论是政府还是其他发生信用关系的机构, 必须坚决惩罚没有信用的行为。因果报应是一种迷信一点的说法, 但是, 它是我们中国传统文化中的一种根深蒂固的东西。什么样的因果报应呢? 就是做善事的时候有好报, 做恶事的时候有恶报。当然这是一种很传统的讲法, 没有科学根据。现在很多农村人还相信一个风俗, 就是坏人终究会被雷劈死的, 劈死也就是横死。横死就是做了坏事所遭到的恶报。一个故事说, 有一个村子里的坏人被雷劈死了, 大家就非常高兴, 说: 你看, 坏人终究要被雷劈死的。但是没过几天, 村里一位大家公认的好人也被雷劈死了, 这下又如何解释呢?村民又说了, 原来我们一直没有发现, 他才是一个包藏祸心的大恶人, 隐瞒我们这么久, 终于被雷劈死了。这个就是说在信用这个链条上, 有类似因果报应的东西, 只不过有时是道德风险的转嫁———他的报应(惩罚)是报到别人的身上去了, 这是一个与信用联系十分紧密的特点。就是某些人做了失信用的事,其他人是会遭到报应的。为什么现在人与人之间的信用都这么低, 为什么我们不敢去轻易相信别人?就是因为有人做了不讲信用的事。在助学贷款的事情上, 前面同学做的结果, 已经对我们需要贷款的后来的同学们造成了一定的不良影响。反过来讲, 我们现在正在申请贷款的同学, 是不是也要为未来的同学们承担一定的责任?特别是要考虑今后你会不会把这恶报传下去, 成为接力棒?我希望不要如此。其实中国那些贫穷的人能够走出恶性循环的唯一办法就是依靠外部的支援来改变现状。假如你把这个方法给扼杀了, 把恶报传下去了, 这些贫困的人就会陷于绝境!你已经感觉到了前面的人所带来的影响,那么你们就不要把这些不良影响一棒一棒地传下去。在信用的问题上, 因果报应是无穷延伸的, 首先它是社会的, 其次它是传递的, 再其次它是道德风险转嫁的一种不道德的结果。', '诚信与智慧', '', 'inherit', 'open', 'open', '', '78-revision', '', '', '2011-10-26 08:10:53', '2011-10-26 08:10:53', '', 78, 'http://blogchen.gotoip1.com/?p=79', 0, 'revision', '', 0),
(80, 1, '2011-10-26 08:14:05', '2011-10-26 08:14:05', '', 'P1070019', '', 'inherit', 'open', 'open', '', 'p1070019', '', '', '2011-10-26 08:14:05', '2011-10-26 08:14:05', '', 22, 'http://blogchen.gotoip1.com/wp-content/uploads/2011/10/P1070019.jpg', 0, 'attachment', 'image/jpeg', 0),
(81, 1, '2011-10-26 06:43:09', '2011-10-26 06:43:09', '这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如：\r\n<blockquote>欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的博客。我住在天朝的帝都，有条叫做 Jack 的狗。</blockquote>\r\n... 或这个：\r\n<blockquote>XYZ Doohickey 公司成立于 1971 年，自从建立以来，我们一直向社会贡献着优秀 doohickies。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。</blockquote>\r\n而您，作为一个 WordPress 用户，我们建议您访问<a href="http://localhost/wordpress/wp-admin/">控制版</a>，删除本页面，然后添加您自己的页面。祝您使用愉快！', '智者会客厅', '', 'inherit', 'open', 'open', '', '22-revision-2', '', '', '2011-10-26 06:43:09', '2011-10-26 06:43:09', '', 22, 'http://blogchen.gotoip1.com/?p=81', 0, 'revision', '', 0),
(84, 1, '2011-10-26 07:48:51', '2011-10-26 07:48:51', '<p style="text-align: right;"><strong>——读《文化产业商业模式》</strong></p>\r\n<p style="text-align: right;">                                 夏宝君</p>\r\n在文化产业研究领域，向来存在两种偏向，一种侧重“文化”二字，深挖文化产业中的文化意蕴，内容涉及文化政策、文化体制、文化消费、文化“软实力”、文化产业“走出去”战略等研究，这些研究倾向于宏观文化研究，将文化产业与文明发展、社会进步的历程挂钩；另一种则侧重“产业”二字，将文化产业置于大产业环境中，彰显其经济属性，其中包括文化市场、文化产业竞争力、文化产业区域发展、文化产业集群、文化产业结构、文化企业管理、文化产业可持续发展等等，这些研究则倾向于具体的产业发展策略，在经济发展的视域讨论文化产业这一经济现象。\r\n\r\n陈少峰先生的《文化产业商业模式》显然属于后一种研究偏向。\r\n\r\n本书以研究文化对经济和产业发展的驱动作用为基础，以文化企业为研究参照，以文化产业的商业模式为核心内容，着重分析了文化市场和文化产品的特性，并在大量的文化产业案例中抽离出60种通用商业模式，且系统分析了文化产业主要行业的商业模式选择问题，为文化产业的经营管理提供了全面和深入的策略建议，这在文化产业的研究中，尚属首次。\r\n\r\n&nbsp;\r\n\r\n<strong> </strong><strong>文化产业的商业气质</strong>\r\n\r\n&nbsp;\r\n\r\n早在19世纪，马克思在《1844年经济学——哲学手稿》中就指出：“宗教、家庭、国家、法、道德、科学、艺术等等，都不过是生产的一些特殊的方式，并且受生产的普遍规律的支配。”<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E4%BD%9C%E4%B8%BA%E5%B8%82%E5%9C%BA%E4%B8%BB%E4%BD%93%E7%9A%84%E8%87%AA%E6%88%91%E8%B0%83%E9%80%82.doc#_ftn1">[1]</a>在《德意志意识形态》一书中，马克思和恩格斯又将一般生产区分为“物质生产”和“精神生产”两大领域。文化产业作为生产的一种特殊形态，是一种精神生产。文化产品不仅具有一般产品的基本属性，而且具有自身的特殊属性。\r\n\r\n文化产品是一种特殊的商品形态，它具有双重属性，即商品属性和意识形态性。2003年6月，中央召开文化体制改革试点工作会议，会议明确提出，既要注重文化产品的意识形态属性，又要注重文化产品的产业属性。而实际上，我国的文化产品往往强调其意识形态属性，这种意识形态属性又过多地表现于社会教化功能，即通过文化政策、文化产业发展实现对社会的精神引导功能，对文化产业的经济属性，我们仍旧处于转变观念、推行改革的转型期。\r\n\r\n《文化产业商业模式》中明确提出从文化创意的经济价值角度研究文化产业的经营管理，这一立足点就意味着本书将打破以往对文化产业的商业属性遮遮掩掩、半推半就的研究境况，转而将文化产业推大胆、彻底地推上经济领域和市场范畴。\r\n\r\n这种大胆之举并非作者的主观臆想，而是其对文化与经济、文化产业和产品与市场的互动进行深入、透彻的研究之后所做的理论升华。在很长一段时间内，我们仅仅把文化作为经济发展的附属品，文化往往只承担其精神价值和意识形态引导功能，这种状况导致“文化失去了应有的经济价值和精神价值的双重地位”<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E4%BD%9C%E4%B8%BA%E5%B8%82%E5%9C%BA%E4%B8%BB%E4%BD%93%E7%9A%84%E8%87%AA%E6%88%91%E8%B0%83%E9%80%82.doc#_ftn2">[2]</a>。书中提出，在文化产业快速发展和成熟的时期，其实文化本身就可以“唱好戏”，文化也可以为经济搭建更大的舞台。因为目前的商品竞争已然充斥了更多文化因素的成分，文化内涵和品位的提升能带来更大的附加价值和经济效益，因此，文化和经济之间的互动关系日益紧密且微妙。\r\n\r\n文化产业自出现之始即有商业特质，只是这一特质被人为地包裹和埋没，当商品市场不再是以纯粹的经济价值取胜，转向高附加价值的较量，这种商业特质开始逐步溶解，并融入市场竞争的主体环节。\r\n\r\n当然，正如书中所说，从经济学的角度研究文化产业，并非忽视文化的价值，而是要“利用文化元素来发挥其作为精神产品和提升物质产品价值的作用”。由于文化经济中的价值实现具有特殊性，而这种特殊性比其他产业更多地依赖于文化形态、意识形态的制约，以及产品和服务的创新，因此，文化产业的经营管理，已经不仅是单纯意义上的企业、行业经营管理，而是在一定文化环境、文化政策、文化形态制约下的管理行为。\r\n\r\n&nbsp;\r\n\r\n<strong>作为市场主体的自我认知</strong>\r\n\r\n<strong>    </strong>\r\n\r\n严格来讲，在过去的很长时间，我们的文化产业起主体作用的是“文化事业”，文化政策侧重文化事业的发展，文化事业占有主要的文化资金和资源，这种占有是具有垄断性的，文化事业单位的管理也偏于行政化，并非纯粹的市场行为。\r\n\r\n当市场经济的大潮涌向文化产业，行政化严重的文化事业大多走向改制之路。许多传统的文化行业如出版业、艺术产业、演艺行业等逐渐放开一些窗口睁眼看市场，而这些小窗口并未阻止文化产业喷薄而出的市场热情，这种热情点燃了整个文化市场，不论是新闻出版、广播影视还是互联网、旅游休闲、娱乐产业，抑或是博物馆、公共文化服务机构，都纷纷呈现出挣脱旧有体制的热望和作为市场主体的独立性。\r\n\r\n把文化产业真正推向市场，对文化产业和文化企业来说，是引燃了长久以来的市场探寻之期待，文化产业作为市场主体，必将剥离条块分割的资源切割状态和限制多于鼓励的管理体制，或大或小、或强或弱的文化企业一起涌入海阔天空的文化市场。虽然力量不均，但在这一市场上，不同文化企业所具有的争取市场主体地位的权利是平等的——这可以看作它们对于自己角色的觉醒。\r\n\r\n作为市场主体的自我认知不仅包括自我角色认知，还包括自我使命的认知。\r\n\r\n1995年，台湾文化建设委员会提出了“文化产业化、产业文化化”之构想，并于此后贯彻这一构想，于2002年正式将文化创意产业列入《挑战2008：台湾发展重点计划》中的一项，旨在结合人文与经济产业创造高附加价值的效益，以增加就业人数并提升民众生活水平。\r\n\r\n本书中，作者再次提出了文化产业发展的双重路向，即文化产业化（文化经济）和产业文化化，并进而指出，文化产业化仅仅是包含某些部分的文化产业化，而不是全面的文化产业化，而产业文化话几乎是全方位的。这就意味着，未来我们的经济发展和企业发展，可以借力文化产业，在经济领域实现产业文化化。\r\n\r\n实现产业文化化，首要的是意识到文化产业发展中的文化因素起着至关重要的作用，这不仅包括文化市场、文化产品与技术创新、文化产品销售渠道、文化产品传播平台等一系列环节，还包括文化企业和文化产品的品牌、可持续发展等战略。从起始点到终端，文化产业发展的各个环节都离不开文化所创造的价值。\r\n\r\n作者多次提到，“合理的企业经营理念是促进企业价值得以实现，即企业的整体价值最大化”<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E4%BD%9C%E4%B8%BA%E5%B8%82%E5%9C%BA%E4%B8%BB%E4%BD%93%E7%9A%84%E8%87%AA%E6%88%91%E8%B0%83%E9%80%82.doc#_ftn3">[3]</a>。整理价值最大化意味着做企业不是看当下，看某个项目是否赚钱，而是看企业的长线发展，看企业的整体资源所带来的整体价值，这种整体价值更多来源于企业创造的无形价值。文化企业的价值在很大程度上体现于其无形资产，如人力资源、文化因素等，在追求整体价值的过程中，也应当充分考虑人力资源、产品创新、文化附加价值的提升等策略，用文化的力量实现文化企业的可持续发展。\r\n\r\n因此，正如书中所说，文化产业具有双重价值：一方面，文化产业自身的发展是经济活动的重要组成部分，另一方面，文化产业通过与其他产业之间的关联互动，可以推动其他产业的发展。\r\n\r\n文化产业的自我认知，其实是对文化市场日益规范化的侧面反映，同时也是文化产业自行定位、自谋发展的开始——为了即将到来的文化苦旅，当然，也许一路欢歌。\r\n\r\n&nbsp;\r\n\r\n<strong>商业模式与价值创造</strong>\r\n\r\n&nbsp;\r\n\r\n彼得·德鲁克说过，21世纪企业之间的竞争已经不是产品与价格的竞争，甚至不是服务之间的竞争，而是“商业模式”之间的竞争。今天，中国的企业除了技术进步所带来的成本下降之外，劳动力、土地、环境保护、知识产权、外围技术研发等成本都一路攀升，在经济转型升级的关头，商业模式的重要性凸显。\r\n\r\n在其后的论证中，作者重点阐述了文化产业商业模式的类型，分别阐明文化产业的内容、产品、品牌以及产业链与商业模式的关系，并从大量的案例中抽离出60种通用的商业模式。事实上，本书所有的铺垫，包括对文化产业特性的解读、对文化与经济互动关系的阐释以及对企业经营管理理念的传达，都是为了让读者对文化产业的商业模式做一个基础知识的补充，在此基础上探讨文化产业的商业模式，才不至于一头雾水和感觉突兀。\r\n\r\n按照作者的观点，商业模式简单讲就是盈利模式，商业模式在广义上涵盖了“将企业的核心竞争力即内在性优势和外部性优势转化为盈利方法的要素”。谈到商业模式，不能不谈到实现商业模式的群体。过去，我们常常认为，从事文化产业的都是所谓的“文化人”，当文化与经济、与市场、与商业并未如此水乳交融的时候，我们姑且将文化产业置于真正的企业竞争之外。而如今，文化产业再也不是“文化人”自娱自乐的游戏，而是生灭关乎市场的实体。于是，艺术家、企业家、投资家纷纷涉足其中，在这些群体中，应尽量避免权责不清，还应各取优势，可以共同参与文化企业的经营管理，但说到底，文化企业还是企业，首先要遵从市场规律和企业经营管理规律，明确了这一点，不同群体的责任分工也了然于心。\r\n\r\n无疑，企业的核心竞争力是实现盈利模式的源泉，核心竞争力分为内部优势和外部优势，这些优势经由商业模式来体现。同样的，具有竞争力的商业模式应当可以促进企业整体价值的提升。而这种整体价值的汇总包括了很多环节。\r\n\r\n文化产业俗称“内容产业”，内容在整个产业链中的地位可见一斑。内容的创新实际上就是一种象征体系的创新，“一类是讲故事，一类是活动，一类是形象性的知识产权，一类是附载在明星身上的品牌魅力”<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E4%BD%9C%E4%B8%BA%E5%B8%82%E5%9C%BA%E4%B8%BB%E4%BD%93%E7%9A%84%E8%87%AA%E6%88%91%E8%B0%83%E9%80%82.doc#_ftn4">[4]</a>。不管是哪种内容创新，都是为了抓住一闪而过的创意点子，并将这个点子实施，创意的好坏，只能通过市场去检验。\r\n\r\n创意落实到实体上，就是文化产品。在这个层面，我们必须牢牢记住文化产品的双重属性，既要承担文化产品的文化教化功能，又要保证文化产业的经济效益。书中指出，文化产品需要双重的产品质量标准，即作为商品形态的一般质量标准和作为精神文化属性的最低标准。当然，不论为了满足哪个属性，其受众都是文化产品的消费者，如何围绕消费者的需求、消费观念、生活方式和消费习惯的变动来寻求创新，是文化产品的立足点。\r\n\r\n好的产品和理念不一定能带来真正的企业价值，实现这一转换的重要环节就是品牌的传播。既然作为商品，文化产品就难逃品牌管理的影响力。目前，我们的许多文化产品在核心技术、创意、质量等方面已经达到先进水平，但迟迟难以跻身文化产业高端市场的重要原因就是对品牌管理的缺失和品牌传播不力。品牌本身就是商业模式中最具附加价值的部分，加之文化产业中的无形因素比重较大，这种无形资产的力量是其他产业不可比拟的，更应该为文化产业所用，助力文化产业的可持续发展。\r\n\r\n至此，作者终于引出商业模式的基本类型，书中将其分为六大组，共60种类型。六大组分别是行业化的商业模式、基础型的商业模式、内在能力型的商业模式、提升型的商业模式、资源整合型的商业模和与资本运作结合的商业模式。作者通过大量的案例分析，试图为读者展开一幅商业模式的巨大画卷，在这画卷中，有成熟坚韧的理论枝桠，也有鲜活灵动的案例论证。不仅如此，书中还针对主要的文化产业如文化旅游、演艺产业、体育产业、数字内容产业、动漫产业、全媒体产业等进行了分级阐述，将行业发展的一般规律进行梳理，给出了一个多维立体的商业模式发展模型。\r\n<p style="text-align: left;">由此，文化产业发展的商业模式终于有迹可循。诚然，我们敬佩作者在理论和实践之间的孜孜以求，我们更期待这些商业模式真正为我国的文化产业带来更多的文化价值和商业价值，甚至在这个轨道上，更多更好的商业模式被开发、验证和载入史册。</p>\r\n\r\n<div><br clear="all" />\r\n\r\n<hr align="left" size="1" width="33%" />\r\n\r\n<div>\r\n\r\n<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E4%BD%9C%E4%B8%BA%E5%B8%82%E5%9C%BA%E4%B8%BB%E4%BD%93%E7%9A%84%E8%87%AA%E6%88%91%E8%B0%83%E9%80%82.doc#_ftnref1">[1]</a> 马克思：《1844年经济学——哲学手稿》，第78页。\r\n\r\n</div>\r\n<div>\r\n\r\n<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E4%BD%9C%E4%B8%BA%E5%B8%82%E5%9C%BA%E4%B8%BB%E4%BD%93%E7%9A%84%E8%87%AA%E6%88%91%E8%B0%83%E9%80%82.doc#_ftnref2">[2]</a> 陈少峰、张立波：《文化产业商业模式》，第4页。\r\n\r\n</div>\r\n<div>\r\n\r\n<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E4%BD%9C%E4%B8%BA%E5%B8%82%E5%9C%BA%E4%B8%BB%E4%BD%93%E7%9A%84%E8%87%AA%E6%88%91%E8%B0%83%E9%80%82.doc#_ftnref3">[3]</a> 陈少峰、张立波：《文化产业商业模式》，第53页。\r\n\r\n</div>\r\n<div>\r\n\r\n<a title="" href="file:///D:/%E9%99%88%E8%80%81%E5%B8%88%E7%9F%A5%E7%BD%91%E6%96%87%E7%AB%A0%20(1)/fw/%E4%BD%9C%E4%B8%BA%E5%B8%82%E5%9C%BA%E4%B8%BB%E4%BD%93%E7%9A%84%E8%87%AA%E6%88%91%E8%B0%83%E9%80%82.doc#_ftnref4">[4]</a> 陈少峰、张立波：《文化产业商业模式》，第106页。\r\n\r\n</div>\r\n</div>', '作为市场主体的自我调适', '', 'inherit', 'open', 'open', '', '76-revision-2', '', '', '2011-10-26 07:48:51', '2011-10-26 07:48:51', '', 76, 'http://blog.kuhkuh.com/?p=84', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, '博学慎思', '%e5%8d%9a%e5%ad%a6%e6%85%8e%e6%80%9d', 0),
(2, '链接表', '%e9%93%be%e6%8e%a5%e8%a1%a8', 0),
(19, '六中全会', '%e5%85%ad%e4%b8%ad%e5%85%a8%e4%bc%9a', 0),
(4, '峰言峰语', '%e5%b3%b0%e8%a8%80%e5%b3%b0%e8%af%ad', 0),
(5, '文化产业', '%e6%96%87%e5%8c%96%e4%ba%a7%e4%b8%9a', 0),
(6, '新语书香', '%e6%96%b0%e8%af%ad%e4%b9%a6%e9%a6%99', 0),
(22, '智慧', '%e6%99%ba%e6%85%a7', 0),
(20, 'post-format-aside', 'post-format-aside', 0),
(9, '炽热峰语', '%e7%82%bd%e7%83%ad%e5%b3%b0%e8%af%ad', 0),
(10, '社会正义', '%e7%a4%be%e4%bc%9a%e6%ad%a3%e4%b9%89', 0),
(11, '管理哲学', '%e7%ae%a1%e7%90%86%e5%93%b2%e5%ad%a6', 0),
(12, '荐书', '%e8%8d%90%e4%b9%a6', 0),
(13, '书讯', '%e4%b9%a6%e8%ae%af', 0),
(14, '伦理学', '%e4%bc%a6%e7%90%86%e5%ad%a6', 0),
(15, '峰行海天', '%e5%b3%b0%e8%a1%8c%e6%b5%b7%e5%a4%a9', 0),
(21, '诚信', '%e8%af%9a%e4%bf%a1', 0),
(17, '博客菜单', '%e5%8d%9a%e5%ae%a2%e8%8f%9c%e5%8d%95', 0),
(18, '顶级菜单', '%e9%a1%b6%e7%ba%a7%e8%8f%9c%e5%8d%95', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 2, 0),
(2, 2, 0),
(3, 2, 0),
(4, 2, 0),
(5, 2, 0),
(6, 2, 0),
(7, 2, 0),
(82, 17, 0),
(78, 23, 0),
(78, 11, 0),
(78, 22, 0),
(74, 13, 0),
(70, 13, 0),
(66, 13, 0),
(76, 1, 0),
(63, 9, 0),
(63, 20, 0),
(60, 9, 0),
(60, 5, 0),
(60, 19, 0),
(58, 19, 0),
(57, 18, 0),
(24, 17, 0),
(25, 17, 0),
(58, 9, 0),
(27, 17, 0),
(28, 17, 0),
(29, 17, 0),
(30, 17, 0),
(31, 17, 0),
(32, 17, 0),
(33, 17, 0),
(34, 17, 0),
(56, 18, 0),
(51, 9, 0),
(58, 5, 0),
(55, 17, 0),
(39, 18, 0),
(40, 18, 0),
(51, 19, 0),
(45, 17, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'link_category', '', 0, 7),
(4, 4, 'category', '', 0, 0),
(5, 5, 'category', '', 1, 2),
(6, 6, 'category', '', 0, 0),
(20, 19, 'post_tag', '', 0, 1),
(9, 9, 'category', '', 4, 4),
(10, 10, 'category', '', 1, 0),
(11, 11, 'category', '', 1, 1),
(12, 12, 'category', '', 6, 0),
(13, 13, 'category', '', 6, 3),
(14, 14, 'category', '', 1, 0),
(15, 15, 'category', '', 4, 0),
(19, 5, 'post_tag', '', 0, 3),
(17, 17, 'nav_menu', '', 0, 13),
(18, 18, 'nav_menu', '', 0, 4),
(21, 20, 'post_format', '', 0, 0),
(22, 21, 'post_tag', '', 0, 1),
(23, 22, 'post_tag', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', '陈少峰'),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'chenshaofeng'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'classic'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'false'),
(10, 1, 'show_admin_bar_admin', 'true'),
(11, 1, 'aim', ''),
(12, 1, 'yim', ''),
(13, 1, 'jabber', ''),
(14, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}'),
(15, 1, 'wp_user_level', '10'),
(16, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(17, 1, 'wp_user-settings', 'm8=o&m5=o&m9=o&m4=o&m7=o&m1=c&wplink=1&editor=tinymce&imgsize=medium&m3=c&m2=o&m0=o&m6=o'),
(18, 1, 'wp_user-settings-time', '1319641982'),
(19, 1, 'nav_menu_recently_edited', '17'),
(20, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(21, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";}');

-- --------------------------------------------------------

--
-- 表的结构 `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'chenshaofeng', '$P$Bpp8BRouDmJuiELm/yCv1yKwB5vWW21', 'chenshaofeng', 'm23linzhe@gmail.com', '', '2011-10-26 06:32:47', '', 0, '陈少峰');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
