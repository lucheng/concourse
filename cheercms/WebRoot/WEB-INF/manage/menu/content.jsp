<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>管理菜单 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<link href="/template/admin/css/base.css" rel="stylesheet" type="text/css">
<link href="/template/admin/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body class="menu">
	<div class="body">
			<dl>
				<dt>
					<span>内容管理</span>
				</dt>
					<dd>
						<a href="navigation!list.action" target="mainFrame">导航管理</a>
					</dd>
					<dd>
						<a href="../article/list" target="mainFrame">文章管理</a>
					</dd>
					<dd>
						<a href="../category/list" target="mainFrame">文章分类</a>
					</dd>
					<dd>
						<a href="friend_link!list.action" target="mainFrame">友情链接</a>
					</dd>
			</dl>
			<dl>
				<dt>
					<span>模板管理</span>
				</dt>
					<dd>
						<a href="page_template!list.action" target="mainFrame">页面模板管理</a>
					</dd>
					<dd>
						<a href="mail_template!list.action" target="mainFrame">邮件模板管理</a>
					</dd>
					<dd>
						<a href="print_template!list.action" target="mainFrame">打印模板管理</a>
					</dd>
			</dl>
			<dl>
				<dt>
					<span>缓存管理</span>
				</dt>
				<dd>
					<a href="cache!flush.action" target="mainFrame">更新缓存</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<span>网站更新管理</span>
				</dt>
				<dd>
					<a href="build_html!allInput.action" target="mainFrame">一键网站更新</a>
				</dd>
				<dd>
					<a href="build_html!articleInput.action" target="mainFrame">文章更新</a>
				</dd>
				<dd>
					<a href="build_html!goodsInput.action" target="mainFrame">商品更新</a>
				</dd>
			</dl>
	</div>

</body></html>