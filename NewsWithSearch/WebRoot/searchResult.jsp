<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${searchParam} 的搜查结果 -- 最快新闻网</title>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>
	<div id="content">
		
		<div id="searchResults" >
			<c:forEach items="${pageControl.data}" var="result">
				<div style="margin-top: 20px;">
					<span>
						<a href="detailAction.action?id=${result.id }">${result.title}</a><br />
						${result.content }
						<font color="green">http://localhost:8080/NewsWithSearch/detailAction.action?id=${result.id } ${result.date }</font>
					</span>
					<br />
				</div>
			</c:forEach>		
		</div>
		
		<%@ include file="searchPage.jsp" %>
		
	</div>
</body>
</html>