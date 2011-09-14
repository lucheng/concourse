--
-- 导出表中的数据 `t_usergroup`
--

INSERT INTO `t_usergroup` (`id`, `grouptitle`, `allowsystem`, `allowlink`, `allowdatabase`, `allowpages`, `allowarticle`, `allowproduct`, `allowcategory`, `allowjob`, `allowfeedback`, `allowannounce`, `allowmember`, `allowgroup`, `allowscroll`, `allowbat`) VALUES
(1, '超级管理', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, '禁止访问', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '普通管理', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0);

--
-- 导出表中的数据 `t_member`
--
INSERT INTO `t_member` (`id`, `username`, `password`, `question`, `answer`, `groupid`, `regtime`, `lastlogintime`, `logintimes`, `ischecked`, `realname`, `sex`, `telphone`, `fax`, `email`, `address`) VALUES
(1, '~`~ADMINNAME~`~', '~`~ADMINPWD~`~', '', '', 1, 1230768000, 1230768000, 0, 1, '', 1, '', '', '', '');


--
-- 导出表中的数据 `t_settings`
--


INSERT INTO `t_settings` (`title`, `values`) VALUES
('sitename', '~`~SITENAME~`~'),
('siteurl', '~`~SITEURL~`~'),
('stopd', '系统维护中.....'),
('status', '1'),
('db_fields_cache', 'false'),
('email', 'ahcom@163.com'),
('address', '安徽省安庆市'),
('telephone', '0000-0000000'),
('fax', '0000-0000000'),
('default_module', 'Index'),
('debug_mode', 'false'),
('attachdir', 'Attachments'),
('attachsize', '2097192'),
('attachext', 'jpg,gif,png'),
('thumbmaxwidth', '300'),
('thumbmaxheight', '200'),
('thumbsuffix', '_thumb'),
('tmpl_cache_time', '-1'),
('sql_debug_log', 'false'),
('web_log_record', 'false'),
('seotitle', '~`~SEOTITLE~`~'),
('seokeywords', '~`~SEOKEYWORDS~`~'),
('seodescription', '~`~SEODESCRIPTION~`~'),
('sysversion', '1.1'),
('attach', 'true'),
('company', '公司名称'),
('think_html_token', ''),
('linkman', '联系人'),
('router_on', 'true'),
('html_url_suffix', '.html'),
('data_cache_type', 'File'),
('data_cache_subdir', 'false'),
('sdata_time', '60');






--
-- 导出表中的数据 `t_pages`
--

INSERT INTO `t_pages` (`id`, `subject`, `seotitle`, `seokeywords`, `seodescription`, `message`, `content`, `postdate`) VALUES
(1, '公司简介', '', '', '', '　 XXXX工作室成立于XXXX年XXX月，专门从事简单实用企业网站建设、企业应用软件开发、网页设计、UI设计等服务项目。XXXX工作室拥有XXXX专业设计人员，均从事网页、广告设计、平面设计工作多年，具有独到的设计意识和丰富的工作经验，能为您提供完善的服务、一流的设计和全面的解决方案。  \r\n', '<p><span style="font-size: 12px; line-height: 200%; font-name: 宋体"><font face="Verdana"><font face="Verdana" color="#3d2d29">　 XXXX工作室成立于XXXX年XXX月，专门从事简单实用企业网站建设、企业应用软件开发、网页设计、UI设计等服务项目。XXXX工作室拥有XXXX专业设计人员，均从事网页、广告设计、平面设计工作多年，具有独到的设计意识和丰富的工作经验，能为您提供完善的服务、一流的设计和全面的解决方案。&nbsp; </font></font></span></p>', 1231751203),
(2, '企业文化', '', '', '', '', '<p>企业文化</p>', 1231751240),
(3, '组织机构', '', '', '', '', '<p>组织机构</p>', 1231751249),
(4, '成长历程', '', '', '', '', '<p>成长历程</p>', 1231751258),
(5, '荣誉证书', '', '', '', '', '<p>荣誉证书</p>', 1231751268);


--
-- 导出表中的数据 `t_category`
--

INSERT INTO `t_category` (`id`, `module`, `parentid`, `title`, `keywords`, `description`, `status`, `allowadd`, `allowedit`, `allowdel`, `tnum`, `cnum`, `displayorder`) VALUES
(1, 1, 0, '产品', '', '', 1, '', '', '', 0, 0, 0),
(2, 2, 1, '新闻', '', '', 1, '', '', '', 0, 0, 0);


--
-- 导出表中的数据 `t_scroll`
--

INSERT INTO `t_scroll` (`id`, `subject`, `url`, `attachment`, `content`, `postdate`, `orders`) VALUES
(1, '1', 'http://www.osphp.com.cn', '1.jpg', '', 1231923826, 0),
(2, '2', 'http://www.osphp.com.cn', '2.jpg', 'eeeeeee', 1231923863, 0),
(3, '3', 'http://www.osphp.com.cn', '3.jpg', 'sdaf', 1231932490, 0);

--
-- 导出表中的数据 `t_link`
--

INSERT INTO `t_link` (`id`, `types`, `title`, `url`, `logo`, `intro`, `postdate`, `ischecked`, `orders`) VALUES
(1, '1', '百度', 'http://www.baidu.com', '', '', 1231923597, 1, 0);
