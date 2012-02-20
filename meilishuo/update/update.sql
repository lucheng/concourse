1.3;

ALTER TABLE `%DB_PREFIX%user_status` ADD `black_users` TEXT NULL;
ALTER TABLE `%DB_PREFIX%user_notice` DROP INDEX `uid`;
ALTER TABLE `%DB_PREFIX%user_notice` ADD PRIMARY KEY ( `uid` , `type` ) ;
ALTER TABLE `%DB_PREFIX%user_notice` CHANGE `type` `type` TINYINT( 1 ) NOT NULL DEFAULT '0' COMMENT '1:关注，2:喜欢，3:评论，4:提到，5:信件';

INSERT INTO `%DB_PREFIX%role_node` (`action`, `action_name`, `status`, `module`, `module_name`, `nav_id`, `sort`, `auth_type`, `is_show`) VALUES
('', '', 1, 'UserMsg', '会员信件管理', 4, 10, 1, 0),
('index', '会员信件列表', 1, 'UserMsg', '会员信件管理', 4, 10, 0, 1),
('groupSend', '发送系统信件', 1, 'UserMsg', '会员信件管理', 4, 10, 0, 1),
('groupList', '系统信件列表', 1, 'UserMsg', '会员信件管理', 4, 10, 0, 1);

DROP TABLE IF EXISTS `%DB_PREFIX%sys_msg`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%sys_msg` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `%DB_PREFIX%sys_msg_member`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%sys_msg_member` (
  `mid` mediumint(8) NOT NULL,
  `uid` int(11) NOT NULL,
  `dateline` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `%DB_PREFIX%sys_msg_user_group`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%sys_msg_user_group` (
  `mid` mediumint(8) NOT NULL,
  `gid` smallint(6) NOT NULL,
  KEY `mid` (`mid`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `%DB_PREFIX%sys_msg_user_no`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%sys_msg_user_no` (
  `mid` mediumint(8) NOT NULL,
  `uid` int(11) NOT NULL,
  KEY `mid` (`mid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `%DB_PREFIX%sys_msg_user_yes`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%sys_msg_user_yes` (
  `mid` mediumint(8) NOT NULL,
  `uid` int(11) NOT NULL,
  KEY `mid` (`mid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_0`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_0` (
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

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_1`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_1` (
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

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_2`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_2` (
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

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_3`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_3` (
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

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_4`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_4` (
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

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_5`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_5` (
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

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_6`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_6` (
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

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_7`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_7` (
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

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_8`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_8` (
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

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_9`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_9` (
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

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_index`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_index` (
  `miid` int(11) NOT NULL AUTO_INCREMENT,
  `mlid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`miid`),
  KEY `mlid` (`mlid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_list`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_list` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `%DB_PREFIX%user_msg_member`;
CREATE TABLE IF NOT EXISTS `%DB_PREFIX%user_msg_member` (
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

UPDATE `%DB_PREFIX%sys_conf` SET val = '1.3' WHERE name = 'SYS_VERSION';