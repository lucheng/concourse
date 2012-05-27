<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html>
	<head>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<title>添加/编辑文章分类 - Powered By SHOP++</title>
	<%@ include file="../common/import.jsp"%>
	<script type="text/javascript" src="<%=path %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery.validate.methods.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery.translate.js"></script>
	<script type="text/javascript">
	$().ready( function() {
	
		var $validateErrorContainer = $("#validateErrorContainer");
		var $validateErrorLabelContainer = $("#validateErrorContainer ul");
		var $validateForm = $("#validateForm");
	
		var $articleCategoryName = $("#articleCategoryName");
		var $articleCategorySign = $("#articleCategorySign");
		var $articleCategorySignLoadingIcon = $("#articleCategorySignLoadingIcon");
	
		$articleCategoryName.change( function() {
			var $this = $(this);
			$this.translate("zh", "en", {
				data: true,
				replace: false,
				start: function() {
					$articleCategorySignLoadingIcon.show();
				},
				complete: function() {
					var articleCategorySignValue = $.trim($this.data("translation").en.value.toLowerCase()).replace(/\s+/g, "_").replace(/[^\w]+/g, "");
					$articleCategorySign.val(articleCategorySignValue);
					$articleCategorySignLoadingIcon.hide();
				},
				error: function() {
					$articleCategorySignLoadingIcon.hide();
				}
			});
	
		});
	
		// 表单验证
		$validateForm.validate({
			errorContainer: $validateErrorContainer,
			errorLabelContainer: $validateErrorLabelContainer,
			wrapper: "li",
			errorClass: "validateError",
			ignoreTitle: true,
			rules: {
				"name": "required",
				"path": {
					required: true,
					alphanumeric: true,
						remote: "articleCategory/checkSign"
				},
				"orderList": "digits"
			},
			messages: {
				"name": "请填写分类名称",
				"path": {
					required: "请填写标识",
					alphanumeric: "只允许输入字母或数字",
					remote: "标识已存在"
				},
				"orderList": "排序必须为零或正整数"
			},
			submitHandler: function(form) {
				$(form).find(":submit").attr("disabled", true);
				form.submit();
			}
		});
		
	});
	</script>
	</head>
	<body class="input">
		<div class="bar">
			添加/编辑分类
		</div>
		<div id="validateErrorContainer" class="validateErrorContainer">
			<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
			<ul></ul>
		</div>
		<div class="body">
			<form id="validateForm" action="articleCategory/save" method="post">
				
				<c:if test="${entry != null}">
					<input type="hidden" name="id" value="${entry.id}">
				</c:if>
				<table class="inputTable">
					<tbody><tr>
						<th>
							分类名称: 
						</th>
						<td>
							<input type="text" id="articleCategoryName" name="name" class="formText" value="${entry.name}">
							<label class="requireField">*</label>
						</td>
					</tr>
					<tr>
						<th>
							上级分类: 
						</th>
						<td>
							<select name="parentId">
								<option value="0">顶级分类</option>
								<c:forEach items="${parentCategories}" var="parent" >
									<option value="${parent.id}" <c:if test="${entry.parent.id == parent.id}"> selected="selected"</c:if> >${parent.name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>
							标识: 
						</th>
						<td>
							<input type="text" id="articleCategorySign" name="path" class="formText" value="${entry.path}" title="该分类的唯一标识，用于分类路径和模板标识">
							<label class="requireField">*</label>
							<span id="articleCategorySignLoadingIcon" class="loadingIcon hidden">&nbsp;</span>
						</td>
					</tr>
					<tr>
						<th>
							排序: 
						</th>
						<td>
							<input type="text" name="orderList" class="formText" value="${entry.orderList}" title="只允许输入零或正整数">
						</td>
					</tr>
					<tr>
						<th>
							页面关键词: 
						</th>
						<td>
							<input type="text" class="formText" name="metaKeywords" value="${entry.metaKeywords}">
						</td>
					</tr>
					<tr>
						<th>
							页面描述: 
						</th>
						<td>
							<textarea name="metaDescription" class="formTextarea">${entry.metaDescription}</textarea>
						</td>
					</tr>
					<tr>
						<th>
							&nbsp;
						</th>
						<td>
							<span class="warnInfo"><span class="icon">&nbsp;</span>页面关键词、页面描述可以更好的使用户通过搜索引擎搜索到站点</span>
						</td>
					</tr>
				</tbody></table>
				<div class="buttonArea">
					<input type="submit" class="formButton" value="确  定" >&nbsp;&nbsp;
					<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="">
				</div>
			</form>
		</div>
	</body>
</html>