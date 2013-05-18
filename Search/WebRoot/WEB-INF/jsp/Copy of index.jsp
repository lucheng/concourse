<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<base href="<%=basePath%>">
		<title>实体搜索</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="css/basic.css" type="text/css" rel="stylesheet">
		<link href="css/default.css" type="text/css" rel="stylesheet">
		<link href="css/search.css" type="text/css" rel="stylesheet">
		<link href="css/searchresult.css" type="text/css" rel="stylesheet">
		<link href="css/view.css" type="text/css" rel="stylesheet">
	</head>
	<body>
	    <div class="container">
	        <div class="index-header-wrapper">
	            <div class="header-top">
	                <%--<a href="#" class="right-top">
	                    <img src="images/guanxiquan.png" alt="关系圈">
	                </a>
	            --%>
	            </div>
	            <div class="index-header-middle">
	                <div class="index-logo-up">
	                </div>
	            </div>
	            <div class="index-header-bottom">
	                <div class="top-right">
	                    <a href="#" style="margin-left: 13px;">登录</a>
	                </div>
	            </div>
	        </div>
	        <div class="index-search-down">
	        </div>
	        <div>
	            
		    <div class="index-search-bar">
		        <div id="MainContent_Panel1" onkeypress="">
					<form:form action="view" method="post" modelAttribute="query">
		            <div class="index-search-panel">
		                <div class="index-search-input-wrapper">
		                    <div class="index-search-input-box-wrapper">
		                        <input name="query" type="text" class="index-search-input" title="输入中文关键词，如：张亚勤，比尔-盖茨，兵乓球，微软亚洲研究院"/>
		                    </div>
		                    <input type="submit" value="" id="MainContent_HomepageSearchButton" class="index-search-btn" alt="搜索" title="搜索"/>
		                    <input type="submit" value="" id="MainContent_HomepageCreateButton" class="index-create-btn" alt="创建词条" title="创建词条">
		                </div>
		                <div class="index-search-readme">
		                    <a href="#">使用须知</a></div>
		            </div>
		        	</form:form>
				</div>
		    </div>
			    <div class="index-content-wrapper">
			        <%--<div class="index-wiki-create">
			            <div class="tip-left" style="">
			                &nbsp;</div>
			            <div class="tip-middle" style="">
			                <div class="tip-icon">
			                </div>
			                <div class="tip-content">
			                    人立方可以编辑啦！你可以<a href="#">创建人立方词条</a>，并且把它加入到人立方关系脉络中哦！</div>
			            </div>
			            <div class="tip-right" style="">
			                <div class="tip-close">
			                    <a href="javascript:" onclick="CloseCreateTip();">
			                        <img src="images/create_tip_close.png" alt="下次不再显示"></a>
			                </div>
			            </div>
			            <div class="clear">
			            </div>
			        </div>
			        --%>
			        
			        <div class="feature">
			            <div class="item">
			                <div class="icon">
			                    <a href="#">
			                        <img alt="关系百科" src="images/app_guanxibaike.png"></a>
			                </div>
			                <div class="name">
			                    <a href="#">关系百科</a>
			                </div>
			                <div class="desp">人物关系大百科</div>
			            </div>
			            <div class="item">
			                <div class="icon">
			                    <a href="#">
			                        <img alt="Q20读心机器人" src="images/app_q20.png"></a>
			                </div>
			                <div class="name">
			                    <a href="#"><span class="special-font-for-Q20">Q20</span>读心机器人</a>
			                </div>
			                <div class="desp">
			                    我能猜出你心中的TA
			                </div>
			            </div>
			            <div class="item">
			                <div class="icon">
			                    <a href="#">
			                        <img alt="微博关系图" src="images/app_weibo.png"></a>
			                </div>
			                <div class="name">
			                    <a href="#">微博关系图</a>
			                </div>
			                <div class="desp">
			                    微博关系连连看
			                </div>
			            </div>
			            <div class="item">
			                <div class="icon">
			                    <a href="#">
			                        <img alt="六度搜索" src="images/app_6du.png"></a>
			                </div>
			                <div class="name">
			                    <a href="#">六度搜索</a>
			                </div>
			                <div class="desp">
			                    验证六度空间理论
			                </div>
			            </div>
			            <div class="clear">
			            </div>
			        </div>
			        
			        
			        <div class="index-news-wrapper">
			            <div class="title">
			                <div class="more">
			                    <a href="#" title="更多" class="more-arrow-img"></a>
			                </div>
			                <div class="desp">
			                    人气榜 · <a href="#" class="nameListAnchor">人名大全</a></div>
			            </div>
			            <div class="content">
						<!--体育-->
			                <div class="cat">
								<div class="cat-name">
									<div class="cat-name-a">
										<a href="#">体育</a>
									</div>
								</div>
								<div class="news">
									<div class="item">
										<div class="name">
											<a href="#" title="刘洋">刘洋</a>
										</div>
										<div class="news-line">
											<a href="#" target="_blank" title="同学眼中的刘洋：外号叫“万里挑一” ">同学眼中的刘洋：外号叫“万里挑一” </a>
										</div>
										<div class="date-line">49分钟前</div>
										<div class="clear"></div>
									</div>
									
									<div class="item">
										<div class="name">
											<a href="#" title="刘洋">刘洋</a>
										</div>
										<div class="news-line">
											<a href="#" target="_blank" title="同学眼中的刘洋：外号叫“万里挑一” ">同学眼中的刘洋：外号叫“万里挑一” </a>
										</div>
										<div class="date-line">49分钟前</div>
										<div class="clear"></div>
									</div>		
								</div>
							</div>
							<!--娱乐-->
							<div class="cat" style="float:right;">
								<div class="cat-name">
									<div class="cat-name-a">
										<a href="#">娱乐</a>
									</div>
								</div>
								<div class="news">
									<div class="item">
										<div class="name">
											<a href="#" title="陈佩斯">陈佩斯</a>
										</div>
										<div class="news-line">
											<a href="#" target="_blank" title="陈佩斯忍哀痛忆慈父 陈强走前仍惦记外孙女中考  ">陈佩斯忍哀痛忆慈父 陈强走前仍惦记外孙女...</a>
										</div>
										<div class="date-line">47分钟前</div>
										<div class="clear"></div>
									</div>
									
									<div class="item">
										<div class="name">
											<a href="#" title="陈佩斯">陈佩斯</a>
										</div>
										<div class="news-line">
											<a href="#" target="_blank" title="陈佩斯忍哀痛忆慈父 陈强走前仍惦记外孙女中考  ">陈佩斯忍哀痛忆慈父 陈强走前仍惦记外孙女...</a>
										</div>
										<div class="date-line">47分钟前</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<!--政治-->
							<div class="cat">
								<div class="cat-name">
									<div class="cat-name-a">
										<a href="#">政治</a>
									</div>
								</div>
								<div class="news">
									<div class="item">
										<div class="name">
											<a href="#" title="普京">普京</a>
										</div>
										<div class="news-line">
											<a href="#" target="_blank" title=" ">普京称伊朗有权和平利用核能 须保证不制造...</a>
										</div>
										<div class="date-line">47分钟前</div>
										<div class="clear"></div>
									</div>
									<div class="item">
										<div class="name">
											<a href="#" title="普京">普京</a>
										</div>
										<div class="news-line">
											<a href="#" target="_blank" title=" ">普京称伊朗有权和平利用核能 须保证不制造...</a>
										</div>
										<div class="date-line">47分钟前</div>
										<div class="clear"></div>
									</div>
									
								</div>
							</div>
							<!--商界-->
							<div class="cat" style="float:right;">
								<div class="cat-name">
									<div class="cat-name-a">
										<a href="#">商界</a>
									</div>
								</div>
								<div class="news">
									<div class="item">
										<div class="name">
											<a href="#" title="雷军">雷军</a>
										</div>
										<div class="news-line">
											<a href="#" target="_blank" title="雷军：小米手机未来将兼容WP系统  ">雷军：小米手机未来将兼容WP系统  </a>
										</div>
										<div class="date-line">54分钟前</div>
										<div class="clear"></div>
									</div>
									<div class="item">
										<div class="name">
											<a href="#" title="雷军">雷军</a>
										</div>
										<div class="news-line">
											<a href="#" target="_blank" title="雷军：小米手机未来将兼容WP系统  ">雷军：小米手机未来将兼容WP系统  </a>
										</div>
										<div class="date-line">54分钟前</div>
										<div class="clear"></div>
									</div>
									
								</div>
							</div>
			            </div>
			
			        </div>
			    </div>
	        </div>
	        <div class="clear"></div>
	    </div>
    	<%@include file="common/footer.jsp" %>
    </body>
</html>