<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title>添加/编辑会员等级 - Powered By SHOP++</title>
		<meta name="Author" content="SHOP++ Team">
		<meta name="Copyright" content="SHOP++">
		<script type="text/javascript" src="js/jquery.validate.js"></script>
		<script type="text/javascript" src="js/jquery.validate.methods.js"></script>
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
						"memberRank.name": {
							required: true,
								remote: "memberRank/checkName"
						},
						"memberRank.preferentialScale": {
							required: true,
							min: 0
						},
						"memberRank.score": {
							required: true,
							digits: true
						}
					},
					messages: {
						"memberRank.name": {
							required: "请填写等级名称",
							remote: "等级名称已存在"
						},
						"memberRank.preferentialScale": {
							required: "请填写优惠百分比",
							min: "优惠百分比必须为零或正数"
						},
						"memberRank.score": {
							required: "请填写所需积分",
							digits: "所需积分必须为零或正整数"
						}
					},
					submitHandler: function(form) {
						$(form).find(":submit").attr("disabled", true);
						form.submit();
					}
				});
				
			})
			</script>
		</head>
	<body class="input">
		<div class="bar">
			添加会员等级
		</div>
		<div id="validateErrorContainer" class="validateErrorContainer" style="display: none; ">
			<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
			<ul style="display: none; "></ul>
		</div>
		<div class="body">
			<form id="validateForm" action="memberRank/save" method="post">
				<table class="inputTable">
					
					<c:if test="${entity != null}">
						<input type="hidden" name="id" value="${entity.id}">
					</c:if>
					<tbody><tr>
						<th>
							等级名称: 
						</th>
						<td>
							<input type="text" name="name" class="formText"  value="${entity.name}">
							<label class="requireField">*</label>
						</td>
					</tr>
					<tr>
						<th>
							优惠百分比: 
						</th>
						<td>
							<input type="text" name="preferentialScale" class="formText valid"  value="${entity.preferentialScale}" title="单位: %, 若输入90,表示该会员等级以商品价格的90%进行销售">
							<label class="requireField">*</label>
						</td>
					</tr>
					<tr>
						<th>
							所需积分: 
						</th>
						<td>
							<input type="text" name="score" class="formText" value="${entity.score}" title="只允许输入零或正整数">
							<label class="requireField">*</label>
						</td>
					</tr>
					<tr>
						<th>
							设置: 
						</th>
						<td>
							<label>
								<input type="checkbox" name="isDefault" value="${entity.isDefault}" id="memberRank_isDefault">
								默认
							</label>
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