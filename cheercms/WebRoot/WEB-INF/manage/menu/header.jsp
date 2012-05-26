<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理中心 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<script type="text/javascript">
$().ready(function() {

	var $menuItem = $("#menu .menuItem");
	var $previousMenuItem;
	
	$menuItem.click( function() {
		var $this = $(this);
		if ($previousMenuItem != null) {
			$previousMenuItem.removeClass("current");
		}
		$previousMenuItem = $this;
		$this.addClass("current");
	})

})
</script>
</head>
<body class="header">
	<div class="body">
		<div class="bodyLeft">
			<div class="logo"></div>
		</div>
		<div class="bodyRight">
			<div class="link">
				<span class="welcome">
					<strong>admin</strong>&nbsp;您好!&nbsp;
				</span>
				<a href="/page/index" target="mainFrame">后台首页</a>|
            	<a href="<%=path %>" target="_blank">技术支持</a>|
                <a href="<%=path %>" target="_blank">购买咨询</a>|
                <a href="<%=path %>" target="_blank">关于我们</a>|
                <a href="<%=path %>/contact.html" target="_blank">联系我们</a>
			</div>
			<div id="menu" class="menu">
				<ul>
					<c:forEach items="${entry}" var="entry">
						<li class="menuItem">
							<a href="${entry.url}" target="menuFrame" hidefocus="">${entry.name}</a>
						</li>
					</c:forEach>
					
					<%--
					<li class="menuItem">
						<a href="<%=path %>/menu/goods" target="menuFrame" hidefocus="">商品管理</a>
					</li>
					<li class="menuItem">
						<a href="<%=path %>/menu/order" target="menuFrame" hidefocus="">订单处理</a>
					</li>
					<li class="menuItem">
						<a href="<%=path %>/menu/member" target="menuFrame" hidefocus="">会员管理</a>
					</li>
					
					<li class="menuItem">
						<a href="<%=path %>/menu/content" target="menuFrame" hidefocus="">页面内容</a>
					</li>
					<li class="menuItem">
						<a href="<%=path %>/menu/admin" target="menuFrame" hidefocus="">管理员</a>
					</li>
					<li class="menuItem">
						<a href="<%=path %>/menu/setting" target="menuFrame" hidefocus="">网站设置</a>
					</li>
					--%>
					<li class="menuItem">
						<a href="menu/menu" target="menuFrame" hidefocus="">菜单设置</a>
					</li>
					<li class="home">
						<a href="" target="_blank" hidefocus="">网站首页</a>
					</li>
	            </ul>
	            <div class="info">
					<a class="profile" href="admin/admin_profile/edit" target="mainFrame">个人资料</a>
					<a class="logout" href="admin/logout" target="_top">退出</a>
				</div>
			</div>
		</div>
	</div>
</body></html>