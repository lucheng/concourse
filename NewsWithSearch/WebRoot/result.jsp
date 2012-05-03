<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${typeString} -- 最快新闻网</title>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>
	<div id="content">
		<font color="red" size="5">${typeString}</font>
		<br /><br /><br /><br />
		<div id="newsListTitle" style="float:left;">
			<c:forEach items="${pageControl.data}" var="news">
				<div style="margin-top: 20px;">
					<span>
						<a href="detailAction.action?id=${news.id }">${news.newsTitle }</a>
					</span>
					<br />
				</div>
			</c:forEach>		
		</div>
		
		<div id="newsListTime">
			<c:forEach items="${pageControl.data}" var="news">
				<div style="margin-top: 20px;">
					<span>
						<fmt:formatDate value="${news.publishTime}" pattern="MM-dd HH:mm"/>
					</span>
					<br />
				</div>
			</c:forEach>
		</div>
		<br /><br /><br /><br />
		<%@ include file="page.jsp" %>
	</div>
</body>
</html>