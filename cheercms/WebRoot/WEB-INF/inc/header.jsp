<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path",path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@include file="taglib.jsp" %>
<link href="<%=path %>/css/base.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/base.js"></script>
<script type="text/javascript" src="<%=path %>/js/admin.js"></script>