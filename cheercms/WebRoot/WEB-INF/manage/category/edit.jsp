<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>添加/编辑管理员 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<script type="text/javascript" src="<%=path %>/js/jquery.tools.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.validate.methods.js"></script>
<script type="text/javascript">
$().ready( function() {

	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	var $validateForm = $("#validateForm");
	
	var $tab = $("#tab");

	// Tab效果
	$tab.tabs(".tabContent", {
		tabs: "input"
	});
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
				"admin.username": {
					required: true,
					username: true,
					minlength: 2,
					maxlength: 	 20,
					remote: "admin/checkUsername"
				},
			"admin.password": {
					required: true,
				minlength: 4,
				maxlength: 	 20
			},
			"rePassword": {
					required: true,
				equalTo: "#password"
			},
			"admin.email": {
				required: true,
				email: true
			},
			"roleList.id": "required"
		},
		messages: {
				"admin.username": {
					required: "请填写用户名",
					username: "用户名只允许包含中文、英文、数字和下划线",
					minlength: "用户名必须大于等于2",
					maxlength: 	 "用户名必须小于等于20",
					remote: "用户名已存在"
				},
			"admin.password": {
					required: "请填写密码",
				minlength: "密码必须大于等于4",
				maxlength: 	 "密码必须小于等于20"
			},
			"rePassword": {
					required: "请填写重复密码",
				equalTo: "两次密码输入不一致"
			},
			"admin.email": {
				required: "请填写E-mail",
				email: "E-mail格式不正确"
			},
			"roleList.id": "请选择管理角色"
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});

});
</script>
</head>
<body class="input admin">
	编辑分类

</body></html>