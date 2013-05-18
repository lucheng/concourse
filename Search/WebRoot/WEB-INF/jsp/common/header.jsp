<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="header-wrapper">
	<div class="header-top">
	    <div class="top-right">
	        <a href="#" style="margin-left: 13px;">登录</a>
	    </div>
	</div>
    <div class="header-middle">
        <a href="#" class="header-top-home"></a>
        <div id="Panel1">
            <div class="search-bar-wrapper">
                <div class="search-column-wrapper">
                    <%--
                    <span class="search-column"><a href="#">首页</a></span>
                     <span class="search-column-sel"><a href="#">关系百科</a></span> 
					<span class="search-column"><a href="#">Q20读心机器人</a></span> 
					<span class="search-column"><a href="#">微博关系图</a></span>
                     <span class="search-column"><a href="#">六度搜索</a></span>
                 --%>
                 </div>
                <form:form action="view" method="post" modelAttribute="query">
                 <div class="search-bar">
                 	 <input type="hidden" id="page" name="page" />
                     <input name="id" type="hidden" value="${entry.id}">
                     <input name="query" type="text" id="GeneralSearchBox" class="search-input" title="" value="${entry.title}">
                     <input type="submit" value="" id="GeneralSearchButton" class="search-btn" alt="搜索" title="搜索">
                     <input type="button" name="ctl00$GeneralCreateButton" value=""  id="GeneralCreateButton" class="create-btn" alt="创建词条" title="创建词条">
                 </div>
                </form:form>
            </div>
        
       </div>
        <div class="clear">
        </div>
    </div>
    <div class="search-down">
    </div>
</div>