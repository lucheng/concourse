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
	<div class="bar">
		添加管理员
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm1" action="<%=path %>/admin/update" method="post">
			<input type="hidden" name="id" value="${entity.id}">
			<ul id="tab" class="tab">
				<li>
					<input type="button" value="基本信息" hidefocus="" class="current">
				</li>
				<li>
					<input type="button" value="个人资料" hidefocus="" class="">
				</li>
			</ul>
			<table class="inputTable tabContent" style="display: table; ">
				<tbody><tr>
					<th>
						用户名: 
					</th>
					<td>
						<input type="text" name="username" class="formText" title="用户名只允许包含中文、英文、数字和下划线" value="${entity.username}">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						密 码: 
					</th>
					<td>
						<input type="password" name="password" id="password" class="formText" title="密码长度只允许在4-20之间" value="${entity.password}">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						重复密码: 
					</th>
					<td>
						<input type="password" name="rePassword" class="formText">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						E-mail: 
					</th>
					<td>
						<input type="text" name="email" class="formText" value="${entity.email}">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr class="roleList">
					<th>
						管理角色: 
					</th>
					<td>
							<label>
								<input type="checkbox" name="roleList.id" value="0731dcsoft2010031200000000000016">超级管理员
							</label>
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						设置: 
					</th>
					<td>
						<label>
							<input type="checkbox" name="isAccountEnabled" value="true" id="admin_isAccountEnabled" checked="checked">
							<input type="hidden" id="__checkbox_admin_isAccountEnabled" name="__checkbox_admin.isAccountEnabled" value="true">启用
						</label>
					</td>
				</tr>
			</tbody></table>
			<table class="inputTable tabContent" style="display: none; ">
				<tbody><tr>
					<th>
						部门: 
					</th>
					<td>
						<input type="text" name="department" class="formText" value="${entity.department}">
					</td>
				</tr>
				<tr>
					<th>
						姓名: 
					</th>
					<td>
						<input type="text" name="name" class="formText" value="${entity.name}">
					</td>
				</tr>
			</tbody></table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus="">&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="">
			</div>
		</form>
	</div>

</body></html>