<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html>
	<head>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<title>添加/编辑文章分类 - Powered By SHOP++</title>
	<meta name="Author" content="SHOP++ Team">
	<meta name="Copyright" content="SHOP++">
	<script type="text/javascript" src="/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/js/jquery.validate.methods.js"></script>
	<script type="text/javascript" src="/js/jquery.translate.js"></script>
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
				"articleCategory.name": "required",
				"articleCategory.sign": {
					required: true,
					alphanumeric: true,
						remote: "article_category!checkSign.action"
				},
				"articleCategory.orderList": "digits"
			},
			messages: {
				"articleCategory.name": "请填写分类名称",
				"articleCategory.sign": {
					required: "请填写标识",
					alphanumeric: "只允许输入字母或数字",
					remote: "标识已存在"
				},
				"articleCategory.orderList": "排序必须为零或正整数"
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
			添加文章分类
		</div>
		<div id="validateErrorContainer" class="validateErrorContainer">
			<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
			<ul></ul>
		</div>
		<div class="body">
			<form id="validateForm" action="<%=path %>/category/save" method="post">
				
				<c:if test="${entity != null}">
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
									<option value="">顶级分类</option>
										<option value="4028818330556c7c0130558322ad0015">
											关于我们
										</option>
										<option value="402881833054c381013054ef39bf0006">
											网站制度
										</option>
										<option value="402881833054a24b013054aff8e0000f">
											服务保证
										</option>
										<option value="402881833054a24b013054b1eadd0015">
											售后服务
										</option>
										<option value="402881833054a24b013054b1326a0011">
											配送方式
										</option>
										<option value="402881833054a24b013054b18d5b0013">
											支付方式
										</option>
										<option value="402881833054a24b013054ae2818000d">
											购物指南
										</option>
										<option value="402881833054a24b013054b43b26001a">
													&nbsp;&nbsp;
											新手上路
										</option>
										<option value="402881833054a24b013054b33a010017">
													&nbsp;&nbsp;
											交易条款
										</option>
										<option value="402881833054a24b013054b63976001c">
											帮助中心
										</option>
										<option value="402881833054a24b013054bb054e002a">
													&nbsp;&nbsp;
											隐私申明
										</option>
										<option value="402881833054a24b013054b928030025">
													&nbsp;&nbsp;
											常见问题
										</option>
								</select>
						</td>
					</tr>
					<tr>
						<th>
							标识: 
						</th>
						<td>
							<input type="text" id="articleCategorySign" name="articleCategory.sign" class="formText" value="" title="该分类的唯一标识，用于分类路径和模板标识">
							<label class="requireField">*</label>
							<span id="articleCategorySignLoadingIcon" class="loadingIcon hidden">&nbsp;</span>
						</td>
					</tr>
					<tr>
						<th>
							排序: 
						</th>
						<td>
							<input type="text" name="articleCategory.orderList" class="formText" value="" title="只允许输入零或正整数">
						</td>
					</tr>
					<tr>
						<th>
							页面关键词: 
						</th>
						<td>
							<input type="text" class="formText" name="articleCategory.metaKeywords" value="">
						</td>
					</tr>
					<tr>
						<th>
							页面描述: 
						</th>
						<td>
							<textarea name="articleCategory.metaDescription" class="formTextarea"></textarea>
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
					<input type="submit" class="formButton" value="确  定" hidefocus="">&nbsp;&nbsp;
					<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="">
				</div>
			</form>
		</div>
	</body>
</html>