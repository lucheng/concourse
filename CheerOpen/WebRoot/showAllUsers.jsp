<%@ page language="java" contentType="text/html"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>姓名</th>
			<th>nian'ling</th>
		</tr>
		<c:forEach items="${list }" var="userinfo">
			<tr>
				<td>${userinfo.name }</td>
				<td>${userinfo.age }</td>
		</c:forEach>
	</table>
<s:debug></s:debug>
</body>
</html>