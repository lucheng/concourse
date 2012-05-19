<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理中心 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
</head>
<frameset id="parentFrameset" rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
	<frame id="headerFrame" name="headerFrame" src="<c:url value='/page/header'/>" frameborder="no" scrolling="no" noresize="noresize">
	<frameset id="mainFrameset" name="mainFrameset" cols="130,6,*" frameborder="no" border="0" framespacing="0">
		<frame id="menuFrame" name="menuFrame" src="<c:url value='/menu/setting'/>" frameborder="no" scrolling="no" noresize="noresize">
		<frame id="middleFrame" name="middleFrame" src="<c:url value='/page/middle'/>" frameborder="no" scrolling="no" noresize="noresize">
		<frame id="mainFrame" name="mainFrame" src="<c:url value='/page/index'/>" frameborder="no" noresize="noresize">
	</frameset>
</frameset>
<noframes>
	<body>您的浏览器不支持框架！</body>
</noframes>
</html>