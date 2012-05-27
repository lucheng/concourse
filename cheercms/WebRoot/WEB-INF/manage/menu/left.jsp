<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
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
				<c:forEach items="${entry.children}" var="entry">
					<dt>
						<span>${entry.name}</span>
					</dt>
					<c:forEach items="${entry.children}" var="child">
						<dd>
							<a href="${child.url}" target="mainFrame">${child.name }</a>
						</dd>
					</c:forEach>
				</c:forEach>
			</dl>
		</div>
	</body>
</html>