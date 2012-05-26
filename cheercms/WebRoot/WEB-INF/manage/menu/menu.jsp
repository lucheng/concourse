<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
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
					<span>菜单管理</span>
				</dt>
				<dd>
					<a href="menu/list" target="mainFrame">菜单列表</a>
				</dd>
				<dd>
					<a href="menu/add" target="mainFrame">菜单添加</a>
				</dd>
			</dl>
			<dl>
				<c:forEach items="${entry}" var="entry">
					<dt>
						<span>${entry.name}</span>
					</dt>
					<c:forEach items="${entry.children}" var="child">
					<dd>
						<a href="${child.url}" target="mainFrame">${child.name}</a>
					</dd>
					</c:forEach>
				</c:forEach>
			</dl>
		
		</div>
	</body>
</html>