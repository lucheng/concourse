-- --------------------------------------------------------

--
-- 表的结构 `t_announce`
--

CREATE TABLE IF NOT EXISTS `t_announce` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `comefrom` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL COMMENT '链接地址',
  `hits` int(11) NOT NULL,
  `postdate` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_article`
--

CREATE TABLE IF NOT EXISTS `t_article` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_category`
--

CREATE TABLE IF NOT EXISTS `t_category` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_comment`
--

CREATE TABLE IF NOT EXISTS `t_comment` (
  `id` int(11) NOT NULL auto_increment,
  `tid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `ip` char(15) NOT NULL,
  `content` text NOT NULL,
  `ischecked` tinyint(1) NOT NULL default '1',
  `postdate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_feedback`
--

CREATE TABLE IF NOT EXISTS `t_feedback` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_job`
--

CREATE TABLE IF NOT EXISTS `t_job` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_link`
--

CREATE TABLE IF NOT EXISTS `t_link` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_member`
--

CREATE TABLE IF NOT EXISTS `t_member` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_order`
--

CREATE TABLE IF NOT EXISTS `t_order` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_pages`
--

CREATE TABLE IF NOT EXISTS `t_pages` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(100) NOT NULL,
  `seotitle` varchar(250) NOT NULL,
  `seokeywords` varchar(250) NOT NULL,
  `seodescription` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `content` text NOT NULL,
  `postdate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_product`
--

CREATE TABLE IF NOT EXISTS `t_product` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_resume`
--

CREATE TABLE IF NOT EXISTS `t_resume` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_scroll`
--

CREATE TABLE IF NOT EXISTS `t_scroll` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(50) NOT NULL COMMENT '网站名称',
  `url` varchar(100) NOT NULL COMMENT '地址',
  `attachment` varchar(50) NOT NULL,
  `content` text NOT NULL COMMENT '简介',
  `postdate` int(11) NOT NULL COMMENT '添加时间',
  `orders` smallint(6) NOT NULL COMMENT '排序数值，越小排得越前',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_settings`
--

CREATE TABLE IF NOT EXISTS `t_settings` (
  `title` varchar(20) NOT NULL default '',
  `values` text NOT NULL,
  PRIMARY KEY  (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_usergroup`
--

CREATE TABLE IF NOT EXISTS `t_usergroup` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
