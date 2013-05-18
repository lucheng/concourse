<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <style type="text/css">
	        *
	        {
	            font-family: 微软雅黑,黑体,宋体;
	        }
	        .previewSection
	        {
	            background-color: #FEE37A;
	            border: 1px solid #C6E4F2;
	            border-radius: 5px;
	            -moz-border-radius: 5px;
	            -webkit-border-radius: 5px;
	            border: 0px solid #ffbf00;
	            margin-bottom: 30px;
	            width: 1000px;
	            -moz-box-shadow: 0px 0px 4px rgba(170,170,170,1);
	            -webkit-box-shadow: 0px 0px 4px rgba(170,170,170,1);
	            padding: 10px 0 6px 0;
	        }
	        .previewSave
	        {
	            display: inline-block;
	            width: 132px;
	            height: 38px;
	            background: url("images/preview_save.png") no-repeat scroll 0 0 transparent;
	            cursor: pointer;
	            cursor: hand;
	        }
	        .previewSave:hover
	        {
	            background: url("images/preview_save_hover.png") no-repeat scroll 0 0 transparent;
	        }
	        .previewReturn
	        {
	            display: inline-block;
	            width: 132px;
	            height: 38px;
	            background: url("images/preview_edit.png") no-repeat scroll 0 0 transparent;
	            cursor: pointer;
	            cursor: hand;
	        }
	        .previewReturn:hover
	        {
	            background: url("images/preview_edit_hover.png") no-repeat scroll 0 0 transparent;
	        }
	    </style>
		<link href="css/basic.css" type="text/css" rel="stylesheet">
		<link href="css/default.css" type="text/css" rel="stylesheet">
		<link href="css/search.css" type="text/css" rel="stylesheet">
		<link href="css/searchresult.css" type="text/css" rel="stylesheet">
		<link href="css/view.css" type="text/css" rel="stylesheet">
		<title>实体搜索 - ${entry.title}</title>
	</head>
	<body>
		<div class="container">
			<%@include file="common/header.jsp" %>
			<div class="content-wrapper">
	    <div class="view-content">
	        <div class="nav-panel">
	        </div>
	
	        <div class="view-left-wrapper">
			 <!--名片-->
	             <div class="basicInfo">
	                <div class="basicInfoHeader">
	                </div>
	                <div class="basicInfoContent">
	                    <div class="basicInfoNewTool">
	                    <%--<a href="#" class="twLineEditIcon" title="设置名片"></a>
	                    --%>
	                    </div>
	                    <div class="basicInfoImage">
	                        <img width="65px" height="65px" class="user-profile-link" alt="${entry.title}" title="" src="images/nopic.png">
	                    </div>
	                    <div class="basicInfoBasicContent">
	                        <div class="basicInfoBasicContent_Name">${entry.title}</div>
	                        <%--<div class="basicInfoBasicContent_Label">
	                            <div class="twoLineDescPerLineNotShown" title="">标签:Google,微软全球副...</div>
	                        </div>
	                    --%>
	                    </div>
	                    
	                </div>
	                <div class="basicInfoDescTool">
	                    <div class="basicInfoDescToolContent">
	                        <div class="basicInfoDescToolContent_web">                       
	                                    <span class="profile-person-page"><a href="#" target="_blank" class="iconimage baidubk"></a></span>                       
	                                    <span class="profile-person-page"><a href="#" target="_blank" class="iconimage sinawb"></a></span>
	                                    
	                        </div>
	                        <div class="basicInfoDescToolContent_edit">
	                            <%--<a href="#" style="display: block;">编辑词条</a>
	                        --%></div>
	                    </div>
	                </div>
	                <div class="basicInfoFooter">
	                </div>
	            </div>
	            
				<!--可能的人物关系-->
	            <div class="leftPanelHeader" id="rec-person-header" style="display: block;">
	                <div class="leftPanelHeaderText" id="rec-person-headertext"> 可能的实体关系</div>       
	            </div>
	            <div class="leftPanelContent" style="display: block">
	                <div class="rec-person-view">
	                    <ul class="profile-related-people borderul" id="rec-ul"> 
	                        <c:forEach items="${aliases}" var="alias">
	                         <li class="profile-recommend-people-item" seq="0" hashcode="42494634">
	                            <div style="min-height:30px">
	                            	<c:if test="${alias.pos == 'nr'}">
	                                	<img width="25px" height="25px" src="images/people_small.png" style="float: left">
	                                </c:if>
	                                <c:if test="${alias.pos == 'org'}">
	                                	<img width="25px" height="25px" src="images/address.jpg" style="float: left">
	                                </c:if>
	                                <c:if test="${alias.pos == 'nz'}">
	                                	<img width="25px" height="25px" src="images/nz.jpg" style="float: left">
	                                </c:if>
	                                <div class="recommend-people-info">
	                                    <span class="related-people-info-name">
	                                        <a href="view?id=${alias.id}">${alias.title}</a>
	                                    </span>
										<span class="related-people-info-label"></span>
	                                    <div class="related-people-info-rel">
	                                    </div>
	                                </div>
	                                <div class="recommend-tool">
	                                    <a href="view?id=${alias.id}">
	                                        <span class="addpeopleBtnSpan"></span>
	                                    </a>
	                                </div>
	                            </div>
	                        </li>            
	    					</c:forEach>
	                    </ul>
	                </div>
	                <div class="rec-person-view-btn">
	                </div>
	            </div>
	        </div>
			<!--个人信息-->
	        <div class="view-right-wrapper">
	            <div class="view-title-bar" id="relation_panel_tailer" style="display: block;margin-bottom:12px;">
	                <div class="view-title-bar-tool">
	                    <div class="profile-related-people-item-page view-page-navigator">
							<%@include file="common/fenye.jsp" %>
						</div>
	                </div>
	            </div>
				
	            <div class="view-title-bar" id="selectedpage_header" style="display: block">
	                <div class="view-title-bar-text">相关网页</div>
	                <div class="view-title-bar-tool"></div>
	                <div class="view-title-bar-tip"></div>
	            </div>
	            <div class="view-panel" id="webpage-panel" style="display: block">
	                
	                <c:forEach items="${pageView.records}" var="relation">
		                <div class="selectedpage view-clip" seq="0" style="">
		                    <div class="view-title">
		                        <a href="${relation.article.newsUrl}" target="_blank">${relation.article.newsTitle}</a>
							</div>
		                    <div class="view-desp">
		                    <c:out value="${fn:substring(relation.article.newsContent, 0, 100)}......" />
		                    </div>
		                    <div class="view-url"><a href="${relation.article.newsUrl}" target="_blank">${relation.article.newsUrl}</a></div>
		                </div>
					</c:forEach>
	            </div>
	            <%@include file="common/fenye.jsp" %>
	        	<div class="clear"></div>
	   </div>
	</div>
	        <div class="clear"></div>
	    </div>
	    <%@include file="common/footer.jsp" %>
	    </div>
    </body>
</html>