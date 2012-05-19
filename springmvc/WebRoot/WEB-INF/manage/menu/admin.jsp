<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>管理菜单 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
</head>
<body class="menu">
	<div class="body">
			<dl>
				<dt>
					<span>管理员&nbsp;</span>
				</dt>
					<dd>
						<a href="<%=path %>/admin/list" target="mainFrame">管理员列表</a>
					</dd>
					<dd>
						<a href="<%=path %>/role/list" target="mainFrame">角色管理</a>
					</dd>
			</dl>
			<dl>
				<dt>
					<span>站内消息&nbsp;</span>
				</dt>
				<dd>
					<a href="<%=path %>/message/inbox" target="mainFrame">收件箱</a>
				</dd>
				<dd>
					<a href="<%=path %>/message/outbox" target="mainFrame">发件箱</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<span>操作日志&nbsp;</span>
				</dt>
				<dd>
					<a href="<%=path %>/log/list" target="mainFrame">查看日志</a>
				</dd>
			</dl>
	</div>

</body></html>