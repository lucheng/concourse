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
				<span>会员管理</span>
			</dt>
				<dd>
					<a href="member!list.action" target="mainFrame">会员管理</a>
				</dd>
				<dd>
					<a href="member_rank!list.action" target="mainFrame">会员等级</a>
				</dd>
				<dd>
					<a href="member_attribute!list.action" target="mainFrame">会员注册项</a>
				</dd>
		</dl>
			<dl>
				<dt>
					<span>商品评论</span>
				</dt>
				<dd>
					<a href="comment!list.action" target="mainFrame">评论列表</a>
				</dd>
				<dd>
					<a href="comment!setting.action" target="mainFrame">评论设置</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<span>在线留言</span>
				</dt>
				<dd>
					<a href="leave_message!list.action" target="mainFrame">留言列表</a>
				</dd>
				<dd>
					<a href="leave_message!setting.action" target="mainFrame">留言设置</a>
				</dd>
			</dl>
	</div>

</body></html>