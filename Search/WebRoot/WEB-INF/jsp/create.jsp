<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <style type="text/css">
        .create-panel
        {
            background-color: #FFFFFF;
            float: none;
            height: 40px;
            margin: 0 auto;
            width: 680px;
            padding-left: 320px;
            min-height: 400px;
        }
        
        .create-panel-title
        {
            font-family: 微软雅黑,黑体,宋体;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 18px;
            margin-left: -4px;
            margin-top: 10px;
        }
        
        .create-attr
        {
            margin-bottom: 16px;
            margin-top: 16px;
        }
        
        .create-attr .label
        {
            font-size: 14px;
        }
        
        .create-input
        {
            background-color: white;
            border-color: #B6B6B6;
            border-style: solid;
            border-width: 1px;
            height: 32px;
            padding: 0;
            width: 205px;
            font-family: 微软雅黑;
            font-size: 16px;
        }
        
        .create-type-radio
        {
            font-size: 14px;
            margin-right: 20px;
            padding: 3px;
        }
        
        .create-checkbox
        {
            float: left;
            margin-right: 2px;
            margin-top: 1px;
        }
        
        .create-checkbox-label A
        {
            color: Blue;
            text-decoration: underline;
        }
        
        .create-button
        {
            height: 26px;
            margin-left: -4px;
            margin-top: 30px;
            padding-bottom: 2px;
            width: 90px;
            background: url("images/create_entity.png") no-repeat scroll 0 0 transparent;
            cursor:pointer;
            cursor:hand;
        }
        .yellowborder
        {
            border: 2px solid #FBC98E;
        }
    </style>
	<link href="css/basic.css" type="text/css" rel="stylesheet">
	<link href="css/default.css" type="text/css" rel="stylesheet">
	<link href="css/search.css" type="text/css" rel="stylesheet">
	<link href="css/searchresult.css" type="text/css" rel="stylesheet">
	<link href="css/view.css" type="text/css" rel="stylesheet">
	<title></title>
	</head>
<body>
    <form method="post" action="create" id="ctl01">
		<script type="text/javascript">
		//<![CDATA[
		var theForm = document.forms['ctl01'];
		if (!theForm) {
		    theForm = document.ctl01;
		}
		function __doPostBack(eventTarget, eventArgument) {
		    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
		        theForm.__EVENTTARGET.value = eventTarget;
		        theForm.__EVENTARGUMENT.value = eventArgument;
		        theForm.submit();
		    }
		}
		//]]>
		</script>
    <div class="container" style="min-height: 715px; ">
        
        <%@include file="common/header.jsp" %>
        <div class="content-wrapper">
		    <div class="create-panel">
		        <div class="create-panel-title">创建人立方词条</div>
			    <div id="result-basicInfo" class="basicInfo">
			        <div class="basicInfoHeader">
			        </div>
			        <div class="basicInfoContent">
			            <div class="basicInfoBasicContent">
			                <div class="basicInfoBasicContent_Name">
			                	<input name="entry" type="text" value="张磊" id="MainContent_CreateNameBox" class="create-input">
			                </div>
			                <div class="basicInfoBasicContent_Label" style="margin-top: 10px;">
			                	<input name="entry" type="text" value="张磊" id="MainContent_CreateNameBox" class="create-input">
			                </div>
			            </div>
			        </div>
			        <div class="basicInfoDescTool">
			            <div class="basicInfoDescToolContent">
			                <div class="basicInfoDescToolContent_web">
			                </div>
			                <div class="basicInfoDescToolContent_edit">
			                </div>
			            </div>
			        </div>
			        <div class="basicInfoFooter">
			        </div>
			    </div>
		    	<input type="submit" name="ctl00$MainContent$CreateButton" value="" id="MainContent_CreateButton" class="create-button">
		    	<a href="#" onclick="return cancelMe();" style="margin-left:10px;">取&nbsp;消</a>
		    </div>
        </div>
        <div class="clear"></div>
    </div>
    <%@include file="common/footer.jsp" %>
</form>
</body>
</html>