<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html>
	<head>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<title>添加/编辑链接 - Powered By SHOP++</title>
	<meta name="Author" content="SHOP++ Team">
	<meta name="Copyright" content="SHOP++">
	
	<style>
			form {
				margin: 0;
			}
			textarea {
				display: block;
			}
	</style>
	<script charset="utf-8" src="js/kindeditor-min.js"></script>
	<script charset="utf-8" src="js/zh_CN.js"></script>
	<script>
		var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="content"]', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				items : [
					'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
					'insertunorderedlist', '|', 'emoticons', 'image', 'link']
			});
		});
	</script>
		
	
	</head>
	<body class="input">
	<div class="bar">
		添加友情链接
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<%=path %>/friendLink/save" enctype="multipart/form-data" method="post">
			<c:if test="${entity != null}">
					<input type="hidden" name="id" value="${entity.id}">
			</c:if>
			<table class="inputTable">
				<tbody><tr>
					<th>
						友情链接名称: 
					</th>
					<td>
						<input type="text" name="name" class="formText" value="${entity.name}">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						链接地址: 
					</th>
					<td>
						<input type="text" name="url" class="formText" value="${entity.url}">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						LOGO: 
					</th>
					<td>
						<input type="text" name="url" class="formText" value="${entity.logo}">
					</td>
				</tr>
				<tr>
					<th>
						排序: 
					</th>
					<td>
						<input type="text" name="orderList" class="formText" value="${entity.orderList}" title="只允许输入零或正整数">
					</td>
				</tr>
			</tbody></table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus="">&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="">
			</div>
		</form>
	</div>

</body>
</html>