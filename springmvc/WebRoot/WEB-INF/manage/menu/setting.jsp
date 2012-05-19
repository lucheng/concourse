<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理菜单 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<%--<link href="<%=path %>/css/base.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/admin.css" rel="stylesheet" type="text/css">
--%>
</head>
<body class="menu">
	<div class="body">
			<dl>
				<dt>
					<span>网站设置</span>
				</dt>
					<dd>
						<a href="<%=path %>/setting/edit" target="mainFrame">系统设置</a>
					</dd>
					<dd>
						<a href="<%=path %>/admin/instant_messaging!edit.action" target="mainFrame">在线客服</a>
					</dd>
			</dl>
			<dl>
				<dt>
					<span>支付管理</span>
				</dt>
				<dd>
					<a href="<%=path %>/admin/payment_config!list.action" target="mainFrame">支付方式</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<span>配送管理</span>
				</dt>
					<dd>
						<a href="<%=path %>/admin/delivery_type!list.action" target="mainFrame">配送方式</a>
					</dd>
					<dd>
						<a href="<%=path %>/admin/area!list.action" target="mainFrame">地区管理</a>
					</dd>
					<dd>
						<a href="<%=path %>/admin/delivery_corp!list.action" target="mainFrame">物流公司</a>
					</dd>
			</dl>
	</div>
</body>
</html>