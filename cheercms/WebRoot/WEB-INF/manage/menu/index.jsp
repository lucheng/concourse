<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>  
<%@ page import="java.util.Locale" %>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理中心首页 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
</head>
<body class="index">
	<div class="bar">
		欢迎使用SHOP++网店管理系统！
	</div>
	<div class="body">
		<div class="bodyLeft">
			<table class="listTable">
				<tbody><tr>
					<th colspan="2">
						软件信息
					</th>
				</tr>
				<tr>
					<td width="110">
						系统名称: 
					</td>
					<td>
						${systemConfig.systemName}
					</td>
				</tr>
				<tr>
					<td>
						系统版本: 
					</td>
					<td>
						${systemConfig.systemVersion}
					</td>
				</tr>
				<tr>
					<td>
						官方网站: 
					</td>
					<td>
						<a href="${systemConfig.shopUrl}">${systemConfig.shopUrl}</a>
					</td>
				</tr>
				<tr>
					<td>
						交流论坛: 
					</td>
					<td>
						<a href="${systemConfig.bbs}">${systemConfig.bbs}</a>
					</td>
				</tr>
				<tr>
					<td>
						BUG反馈邮箱: 
					</td>
					<td>
						<a href="mailto:${systemConfig.email}">${systemConfig.email}</a>
					</td>
				</tr>
				<tr>
					<td>
						商业授权: 
					</td>
					<td>
						未取得商业授权之前,您不能将本软件应用于商业用途
					</td>
				</tr>
			</tbody></table>
			<div class="blank"></div>
			<table class="listTable">
				<tbody><tr>
					<th colspan="2">
						待处理事务
					</th>
				</tr>
				<tr>
					<td width="110">
						未处理订单: 
					</td>
					<td>
						378 <a href="http://demo.shopxx.net/admin/order!list.action">[订单列表]</a>
					</td>
				</tr>
				<tr>
					<td width="110">
						等待发货订单数: 
					</td>
					<td>
						13 <a href="http://demo.shopxx.net/admin/order!list.action">[订单列表]</a>
					</td>
				</tr>
				<tr>
					<td>
						未读消息: 
					</td>
					<td>
						1 <a href="http://demo.shopxx.net/admin/message!inbox.action">[收件箱]</a>
					</td>
				</tr>
				<tr>
					<td>
						未处理缺货登记数: 
					</td>
					<td>
						53 <a href="http://demo.shopxx.net/admin/goods_notify!list.action">[到货通知]</a>
					</td>
				</tr>
			</tbody></table>
		</div>
		<div class="bodyRight">
			<table class="listTable">
				<tbody><tr>
					<th colspan="2">
						系统信息
					</th>
				</tr>
				<tr>
					<td width="110">
						Java版本: 
					</td>
					<td>
						<%=System.getProperty("java.version") %>
					</td>
				</tr>
				<tr>
					<td>
						操作系统名称: 
					</td>
					<td>
						<%=System.getProperty("os.name") %>
					</td>
				</tr>
				<tr>
					<td>
						操作系统构架: 
					</td>
					<td>
						<%=System.getProperty("os.arch") %>
					</td>
				</tr>
				<tr>
					<td>
						操作系统版本: 
					</td>
					<td>
						<%=System.getProperty("os.version") %>
					</td>
				</tr>
				<tr>
					<td>
						Server信息: 
					</td>
					<td>
						<%=application.getServerInfo() %>
					</td>
				</tr>
				<tr>
					<td>
						Servlet版本: 
					</td>
					<td>
						<%--<%=System.getProperty("java.version") %>
						<%=System.getProperty("user.dir") %>
						--%>
					</td>
				</tr>
			</tbody></table>
			<div class="blank"></div>
			<table class="listTable">
				<tbody><tr>
					<th colspan="2">
						信息统计
					</th>
				</tr>
				<tr>
					<td width="110">
						已上架商品: 
					</td>
					<td>
						40
					</td>
				</tr>
				<tr>
					<td>
						已下架商品: 
					</td>
					<td>
						0
					</td>
				</tr>
				<tr>
					<td>
						会员总数: 
					</td>
					<td>
						685
					</td>
				</tr>
				<tr>
					<td>
						文章总数: 
					</td>
					<td>
						34
					</td>
				</tr>
			</tbody></table>
		</div>
		<p class="copyright">Copyright © 2005-2011 shopxx.net All Rights Reserved.</p>
	</div>

</body></html>