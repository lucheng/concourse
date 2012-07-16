<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>添加/编辑管理员 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<base href="<%=basePath%>">
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.tools.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="<%=path %>/js/base.js"></script>
<script type="text/javascript" src="<%=path %>//js/admin.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	var $validateForm = $("#validateForm");

	var $memberAttributeTable = $("#memberAttributeTable");
	var $memberAttributeType = $("#memberAttributeType");
	var $addOptionButton = $("#addOptionButton");
	var $deleteOptionIcon = $("#memberAttributeTable .deleteOptionIcon");
	
	// 显示/隐藏“增加选项”按钮
	$memberAttributeType.change(function() {
		if($memberAttributeType.val() == "select" || $memberAttributeType.val() == "checkbox") {
			$memberAttributeTable.find(".optionTr").remove();
			$addOptionButton.show();
			addOption();
		} else {
			$addOptionButton.hide();
			$memberAttributeTable.find(".optionTr").remove();
		}
	})
	
	// 增加选项内容
	$addOptionButton.click( function() {
		addOption();
	});
		
	// 删除选项内容
	$("#memberAttributeTable .deleteOptionIcon").live("click", function() {
		if ($memberAttributeTable.find(".optionTr").length <= 1) {
			$.dialog({type: "warn", content: "请至少保留一个选项内容!", modal: true, autoCloseTime: 3000});
		} else {
			$(this).parent().parent().remove();
		}
	});
	
	// 增加选项内容
	function addOption() {
var optionTrHtml = '<tr class="optionTr"> <th>选项内容: </th> <td> <input type="text" name="optionList" class="formText optionList" />&nbsp; <span class="deleteIcon deleteOptionIcon" title="删 除">&nbsp;</span> </td> </tr>';		
		$memberAttributeTable.append(optionTrHtml);
	}
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"memberAttribute.attributeType": "required",
			"memberAttribute.name": "required",
			"memberAttribute.orderList": "digits"
		},
		messages: {
			"memberAttribute.attributeType": "请选择注册项类型",
			"memberAttribute.name": "请填写注册项名称",
			"memberAttribute.orderList": "排序必须为零或正整数"
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
	$.validator.addMethod("optionListRequired", $.validator.methods.required, "请填写选项内容");
	
	$.validator.addClassRules("optionList", {
		optionListRequired: true
	});

})
</script>
</head>

<body class="input">
	<div class="bar">
		添加会员注册项
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<%=path %>/memberAttribute/save"  method="post">
			<c:if test="${entity != null}">
						<input type="hidden" name="id" value="${entity.id}">
					</c:if>
			<table id="memberAttributeTable" class="inputTable">
				<tbody><tr>
					<th>
						注册项类型: 
					</th>
					<td>
								<select id="memberAttributeType" name="attributeType">
									<option value="">请选择...</option>
										<option value="text">
											文本
										</option>
										<option value="number">
											数字
										</option>
										<option value="alphaint">
											字母
										</option>
										<option value="select">
											单选项
										</option>
										<option value="checkbox">
											多选项
										</option>
								</select>
								<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						注册项名称: 
					</th>
					<td>
						<input type="text" name="name" class="formText" value="">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						排序: 
					</th>
					<td>
						<input type="text" name="orderList" class="formText" value="" title="只允许输入零或正整数">
					</td>
				</tr>
				<tr>
					<th>
						设置: 
					</th>
					<td>
						<label>
							<input type="checkbox" name="attributeOptionList" value="true" id="memberAttribute_isEnabled" checked="checked"><input type="hidden" id="__checkbox_memberAttribute_isEnabled" name="__checkbox_memberAttribute.isEnabled" value="true">启用
						</label>
						<label>
							<input type="checkbox" name="attributeOptionList" value="true" id="memberAttribute_isRequired"><input type="hidden" id="__checkbox_memberAttribute_isRequired" name="__checkbox_memberAttribute.isRequired" value="true">必填
						</label>
					</td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<td>
							<input type="button" id="addOptionButton" class="hidden formButton" value="增加选项" hidefocus="">
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