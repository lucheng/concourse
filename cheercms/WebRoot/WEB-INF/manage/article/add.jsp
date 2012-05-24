<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html>
	<head>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<title>添加/编辑文章 - Powered By SHOP++</title>
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
	<script charset="utf-8" src="<%=path %>/js/kindeditor-min.js"></script>
	<script charset="utf-8" src="<%=path %>/js/zh_CN.js"></script>
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
		添加文章
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<%=path %>/article/save" method="post">
			<c:if test="${entity != null}">
					<input type="hidden" name="id" value="${entity.id}">
			</c:if>
			<table class="inputTable">
				<tbody><tr>
					<th>
						文章标题: 
					</th>
					<td>
						<input type="text" name="title" class="formText" value="${entity.title}">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						文章分类: 
					</th>
					<td>
						<select name="categoryName">
							<option value="">请选择...</option>
							<c:forEach items="${parentCategories}" var="parent" >
									<option value="${parent.id}" <c:if test="${entity.parent.id == parent.id}"> selected="selected"</c:if> >${parent.name}</option>
							</c:forEach>
						</select>
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						作者: 
					</th>
					<td>
						<input type="text" class="formText" name="author" value="${entity.author}">
					</td>
				</tr>
				<tr>
					<th>
						设置: 
					</th>
					<td>
						<label>
							<input type="radio" name="status" value="true" id="article_isPublication" checked="checked">发布
						</label>
						<label>
							<input type="radio" name="status" value="true" id="article_isRecommend">推荐
						</label>
						<label>
							<input type="radio" name="status" value="true" id="article_isTop">置顶
						</label>
					</td>
				</tr>
				<tr>
					<th>
						内容: 
					</th>
					<td>
						<textarea name="content" style="width:700px;height:200px;visibility:hidden;">${entity.content}</textarea>
					</td>
					
				</tr>
				
			</tbody></table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus="">&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="">
			</div>
		</form>
	</div>

<div class="ke-reset" style="display: none; "></div><div class="ke-mask" style="opacity: 0.5; "></div></body>
</html>