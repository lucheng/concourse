<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理中心 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<script type="text/javascript">
$().ready( function() {

	var $loginForm = $("#loginForm");
	var $username = $("#username");
	var $password = $("#password");
	var $captcha = $("#captcha");
	var $captchaImage = $("#captchaImage");
	var $isRememberUsername = $("#isRememberUsername");

	// 判断"记住用户名"功能是否默认选中,并自动填充登录用户名
	if(getCookie("adminUsername") != null) {
		$isRememberUsername.attr("checked", true);
		$username.val(getCookie("adminUsername"));
		$password.focus();
	} else {
		$isRememberUsername.attr("checked", false);
		$username.focus();
	}

	// 提交表单验证,记住登录用户名
	$loginForm.submit( function() {
		if ($username.val() == "") {
			$.dialog({type: "warn", content: "请输入您的用户名!", modal: true, autoCloseTime: 3000});
			return false;
		}
		if ($password.val() == "") {
			$.dialog({type: "warn", content: "请输入您的密码!", modal: true, autoCloseTime: 3000});
			return false;
		}
		if ($captcha.val() == "") {
			$.dialog({type: "warn", content: "请输入您的验证码!", modal: true, autoCloseTime: 3000});
			return false;
		}
		
		if ($isRememberUsername.attr("checked") == true) {
			var expires = new Date();
			expires.setTime(expires.getTime() + 1000 * 60 * 60 * 24 * 7);
			setCookie("adminUsername", $username.val(), expires);
		} else {
			removeCookie("adminUsername");
		}
		
	});

	// 刷新验证码
    $(function(){         
        $('#captchaImage').click(function () {//生成验证码
       	 $(this).hide().attr('src', '/jcaptcha.jpg?' + Math.floor(Math.random()*100) ).fadeIn(); })    
    }); 
	
	<c:if test="${not empty error}">
		$.dialog({type: "error", content: "验证码错误,请重新输入!", modal: true, autoCloseTime: 3000});
	</c:if>
	
});
</script>
</head>
<body class="login">
	<script type="text/javascript">

		// 登录页面若在框架内，则跳出框架
		if (self != top) {
			top.location = self.location;
		};

	</script>
	<div class="blank"></div>
	<div class="blank"></div>
	<div class="blank"></div>
	<div class="body">
		<form id="loginForm" action="<%=path %>/j_spring_security_check" method="post">
            <table class="loginTable">
            	<tbody><tr>
            		<td rowspan="3">
            			<img src="<%=path %>/images/login_logo.gif" alt="SHOP++管理中心">
            		</td>
                    <th>
                    	用户名:
                    </th>
					<td>
                    	<input type="text" id="username" name="j_username" class="formText" value="admin">
                    </td>
                </tr>
                <tr>
					<th>
						密&nbsp;&nbsp;&nbsp;码:
					</th>
                    <td>
                    	<input type="text" id="password" name="j_password" class="formText" value="admin">
                    </td>
                </tr>
                <tr>
                	<th>
                		验证码:
                	</th>
                    <td>
                    	<input type="text" id="captcha" name="j_captcha" class="formText captcha">
                   		<img id="captchaImage" class="captchaImage" src="<c:url value="/jcaptcha.jpg"/>" alt="换一张">
                    </td>
                </tr>
                <tr>
                	<td>
                		&nbsp;
                	</td>
                	<th>
                		&nbsp;
                	</th>
                    <td>
                    	<label>
                    		<input type="checkbox" name="_spring_security_remember_me" id="isRememberUsername" >&nbsp;记住用户名
                    	</label>
                    </td>
                </tr>
                <tr>
                	<td>
                		&nbsp;
                	</td>
                	<th>
                		&nbsp;
                	</th>
                    <td>
                        <input type="button" class="homeButton" value="" onclick="window.open('<%=path %>')" hidefocus="">
                        <input type="submit" class="submitButton" value="登 录" hidefocus="">
                    </td>
                </tr>
            </tbody>
            </table>
            <div class="powered">
            	COPYRIGHT © 2005-2011 SHOPXX.NET ALL RIGHTS RESERVED.
            </div>
            <div class="link">
            	<a href="http://demo.shopxx.net/">前台首页</a> |
				<a href="http://www.shopxx.net/">官方网站</a> |
				<a href="http://bbs.shopxx.net/">交流论坛</a> |
				<a href="http://www.shopxx.net/about.html">关于我们</a> |
				<a href="http://www.shopxx.net/contact.html">联系我们</a> |
				<a href="http://www.shopxx.net/license.html">授权查询</a>
            </div>
        </form>
	</div>
	
	<%--<div id="dialogOverlaydialog0" class="dialogOverlay" style="display: block; "></div>
	<div id="dialog0" class="baseDialog" style="width: 320px; height: auto; margin-left: -160px; z-index: 100; display: block; "><div class="dialogWrap"></div><div class="dialogMain"><div id="dialogClosedialog0" class="dialogClose"></div><div id="dialogContentdialog0" class="dialogContent dialogerrorIcon">验证码错误,请重新输入!</div></div></div>

--%></body>

</html>
</html>