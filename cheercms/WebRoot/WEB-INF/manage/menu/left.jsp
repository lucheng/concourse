<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title>管理菜单 - Powered By SHOP++</title>
		<meta name="Author" content="SHOP++ Team">
		<meta name="Copyright" content="SHOP++">
	</head>
	<body class="menu">
		<div class="body">
				<dl>
					<dt>
						<span>订单管理</span>
					</dt>
					<dd>
						<a href="order!list.action" target="mainFrame">订单列表</a>
					</dd>
					<dd>
						<a href="payment!list.action" target="mainFrame">收款单</a>
					</dd>
					<dd>
						<a href="refund!list.action" target="mainFrame">退款单</a>
					</dd>
					<dd>
						<a href="shipping!list.action" target="mainFrame">发货单</a>
					</dd>
					<dd>
						<a href="reship!list.action" target="mainFrame">退货单</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<span>快递单管理</span>
					</dt>
						<dd>
							<a href="delivery_center!list.action" target="mainFrame">发货点管理</a>
						</dd>
						<dd>
							<a href="delivery_template!list.action" target="mainFrame">快递单模板</a>
						</dd>
				</dl>
		</div>
	</body>
</html>