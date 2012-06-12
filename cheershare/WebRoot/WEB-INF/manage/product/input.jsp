<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>添加/编辑品牌 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<script type="text/javascript" src="<%=path %>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="<%=path %>/kindeditor/kindeditor-min.js" charset="UTF-8"></script>
<script type="text/javascript">
$().ready(function() {

	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	var $validateForm = $("#validateForm");
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"brand.name": "required",
			"logo": "imageFile",
			"brand.orderList": "digits"
		},
		messages: {
			"brand.name": "请填写品牌名称",
			"logo": "LOGO格式错误",
			"brand.orderList": "排序必须为零或正整数"
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
})
</script>
<script type="text/javascript">
KE.show({
    id : "editor",
       width : "980px",
       height : "400px",
       resizeMode : 1,
       allowFileManager : true,
       /*图片上传的SERVLET路径*/
       imageUploadJson : "<%=path %>/uploadImage.html", 
       /*图片管理的SERVLET路径*/     
       fileManagerJson : "<%=path %>/uploadImgManager.html",
       /*允许上传的附件类型*/
       accessoryTypes : "doc|xls|pdf|txt|ppt|rar|zip",
       /*附件上传的SERVLET路径*/
       accessoryUploadJson : "<%=path %>/uploadAccessory.html"
  });
</script>
</head>
<body class="input">
	<div class="bar">
		添加品牌
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<%=path %>/product/fetch" _enctype="multipart/form-data" method="post">
			
			<table class="inputTable">
				<tbody>
				<tr>
					<th>
						网址: 
					</th>
					<td>
						<input type="text" name="url" class="formText" value="${entry.url}">
					</td>
				</tr>
			</tbody>
			</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus="">&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="">
			</div>
		</form>
	</div>

<div class="ke-reset" style="display: none; "></div><div class="ke-mask" style="opacity: 0.5; "></div></body></html>