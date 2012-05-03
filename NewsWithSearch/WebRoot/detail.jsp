<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${news.newsTitle } -- 最快新闻网</title>
<link  rel="stylesheet" href="css/main.css"/>
<style type="text/css">
	div#newsContent {
		border:solid 1px yellow;
	}
</style>
<script type="text/javascript">
	window.onload = function() {
		document.all.back.onclick = function() {
			window.history.back().location.reload();
		};
	};
</script>
</head>
<body>
		
		<div id="content">
			<%@include file="index.jsp" %>
			
			<div style="text-align: left; margin-top: 20px;">
				<a href="index.jsp">最快新闻网</a>→<a href="newsAction.action?category=${category}">${typeString }</a>
			</div>
			
			<div id="newsContent" style="margin-top: 20px;">
				<span><font color="red"><fmt:formatDate  value="${news.publishTime}" pattern="yyyy年MM月dd日 HH:mm"/></font></span>
				<span style="margin-left: 30px;"><font color="blue">来源:${news.resource }</font></span>
				<div>
					${news.newsContent }
				</div>
				<span><font color="purple">编辑：${news.editor }</font></span>
			</div>
			<br />
			<a href="#" id="back">返回</a>
		</div>
		
</body>
</html>